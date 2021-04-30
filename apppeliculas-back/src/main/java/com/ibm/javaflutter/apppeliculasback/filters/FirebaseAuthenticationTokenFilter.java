package com.ibm.javaflutter.apppeliculasback.filters;

import com.google.api.core.ApiFuture;
import com.google.common.base.Strings;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseToken;
import com.ibm.javaflutter.apppeliculasback.entities.Admin;
import com.ibm.javaflutter.apppeliculasback.entities.Cinema;
import com.ibm.javaflutter.apppeliculasback.entities.Subscriber;
import com.ibm.javaflutter.apppeliculasback.entities.User;
import com.ibm.javaflutter.apppeliculasback.helpers.RoleNames;
import com.ibm.javaflutter.apppeliculasback.models.Credentials;
import com.ibm.javaflutter.apppeliculasback.services.SecurityService;
import com.ibm.javaflutter.apppeliculasback.services.UserService;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Component
@Slf4j
public class FirebaseAuthenticationTokenFilter extends OncePerRequestFilter {

    @Autowired
    private SecurityService securityService;

    @Autowired
    private UserService userService;

//    @Autowired
//    FirebaseAuth firebaseAuth;

    private static final Logger logger = LoggerFactory.getLogger(FirebaseAuthenticationTokenFilter.class);

    @Override
    protected void doFilterInternal(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, FilterChain filterChain) throws ServletException, IOException {

        logger.debug("doFilter:: authenticating...");
        logger.info("doFilter:: authenticating...");

        HttpServletRequest httprequest = httpServletRequest;
        String authToken = securityService.getBearerToken(httprequest);

        if(Strings.isNullOrEmpty(authToken) || authToken.equals("null") || authToken.equalsIgnoreCase("undefined")) {
            filterChain.doFilter(httpServletRequest, httpServletResponse);
            return;
        }

        try{
            UsernamePasswordAuthenticationToken authentication = getAndValidateAuthentication(authToken);
            authentication.setDetails(new WebAuthenticationDetailsSource().buildDetails(httprequest));
            SecurityContextHolder.getContext().setAuthentication(authentication);
            filterChain.doFilter(httpServletRequest, httpServletResponse);
            logger.debug("doFilter():: Succesfully Authenticated!");
        } catch (Exception ex) {
            HttpServletResponse httpResponse = httpServletResponse;
            httpResponse.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            httpResponse.getWriter().write("NOT AUTHORIZED");
            logger.debug("Fail to authenticate.", ex);
        }
    }

    private UsernamePasswordAuthenticationToken getAndValidateAuthentication(String authToken) throws Exception {
        UsernamePasswordAuthenticationToken authentication;

        FirebaseToken firebaseToken = authenticateFirebaseToken(authToken);

        // Find user in database
        User curUser = userService.getUserByUid(firebaseToken.getUid());

        if(curUser != null){
            List<GrantedAuthority> authorities = findUserRoles(curUser, firebaseToken);
            authentication = new UsernamePasswordAuthenticationToken(curUser,
                    new Credentials(firebaseToken, authToken),authorities);

            return authentication;
        }

        authentication = new UsernamePasswordAuthenticationToken(firebaseToken, authToken);

        return authentication;
    }

    private FirebaseToken authenticateFirebaseToken(String authToken) throws Exception {
        ApiFuture<FirebaseToken> app = FirebaseAuth.getInstance().verifyIdTokenAsync(authToken);
        return app.get();
    }

    private List<GrantedAuthority> findUserRoles(User curUser, FirebaseToken firebaseToken){
        List<GrantedAuthority> authorities = new ArrayList<>();

        if(curUser instanceof Admin){
            authorities.add(new SimpleGrantedAuthority(RoleNames.ROLE_ADMIN));
            if(!firebaseToken.getClaims().containsKey(RoleNames.ROLE_ADMIN)){
                // TODO añadir logica para poner el Custom claim en el token
                logger.info("Admin Role granted");
            }
        }
        if(curUser instanceof Cinema){
            authorities.add(new SimpleGrantedAuthority(RoleNames.ROLE_CINEMA));
            if(!firebaseToken.getClaims().containsKey(RoleNames.ROLE_CINEMA)){
                // TODO añadir logica para poner el Custom claim en el token
                logger.info("Cinema Role granted");
            }
        }
        if(curUser instanceof Subscriber){
            authorities.add(new SimpleGrantedAuthority(RoleNames.ROLE_ADMIN));
            if(!firebaseToken.getClaims().containsKey(RoleNames.ROLE_ADMIN)){
                // TODO añadir logica para poner el Custom claim en el token
                logger.info("Subscriber Role granted");
            }
        }


        return authorities;
    }

    @Override
    public void destroy() {
        logger.debug("destroy():: invoke");
        super.destroy();
    }
}
