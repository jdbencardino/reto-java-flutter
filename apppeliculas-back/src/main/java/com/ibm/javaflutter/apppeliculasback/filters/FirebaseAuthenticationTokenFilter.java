package com.ibm.javaflutter.apppeliculasback.filters;

import com.google.api.core.ApiFuture;
import com.google.common.base.Strings;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseToken;
import com.ibm.javaflutter.apppeliculasback.services.SecurityService;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Component
@Slf4j
public class FirebaseAuthenticationTokenFilter extends OncePerRequestFilter {

    @Autowired
    private SecurityService securityService;

    private static final Logger logger = LoggerFactory.getLogger(FirebaseAuthenticationTokenFilter.class);

    @Override
    protected void doFilterInternal(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, FilterChain filterChain) throws ServletException, IOException {

        logger.debug("doFilter:: authenticating...");
        logger.info("doFilter:: authenticating... x2");

        HttpServletRequest httprequest = httpServletRequest;
        String authToken = securityService.getBearerToken(httprequest);

        if(Strings.isNullOrEmpty(authToken)) {
            filterChain.doFilter(httpServletRequest, httpServletResponse);
            return;
        }

        try{
            Authentication authentication = getAndValidateAuthentication(authToken);
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

    private Authentication getAndValidateAuthentication(String authToken) throws Exception {
        Authentication authentication;

        FirebaseToken firebaseToken = authenticateFirebaseToken(authToken);
        authentication = new UsernamePasswordAuthenticationToken(firebaseToken, authToken);

        return authentication;
    }

    private FirebaseToken authenticateFirebaseToken(String authToken) throws Exception {
        ApiFuture<FirebaseToken> app = FirebaseAuth.getInstance().verifyIdTokenAsync(authToken);
        return app.get();
    }

    @Override
    public void destroy() {
        logger.debug("destroy():: invoke");
        super.destroy();
    }
}
