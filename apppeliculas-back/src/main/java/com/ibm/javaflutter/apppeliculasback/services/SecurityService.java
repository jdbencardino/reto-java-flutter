package com.ibm.javaflutter.apppeliculasback.services;

import com.google.common.base.Strings;
import com.ibm.javaflutter.apppeliculasback.entities.User;
import com.ibm.javaflutter.apppeliculasback.models.Credentials;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;

@Service
public class SecurityService {

    private static final String TOKEN_HEADER = "Authorization";
    private static final String START_HEADER = "Bearer ";

    public String getBearerToken(HttpServletRequest request) {
        String bearerToken = null;
        String authorization = request.getHeader(TOKEN_HEADER);
        if(!Strings.isNullOrEmpty(authorization) && authorization.startsWith(START_HEADER)){
            bearerToken = authorization.substring(7);
        }

        return bearerToken;
    }

    public User getUser() {
        User userPrincipal = null;
        SecurityContext securityContext = SecurityContextHolder.getContext();
        Object principal = securityContext.getAuthentication().getPrincipal();
        if (principal instanceof User) {
            userPrincipal = ((User) principal);
        }
        return userPrincipal;
    }

    public Credentials getCredentials() {
        SecurityContext securityContext = SecurityContextHolder.getContext();
        return (Credentials) securityContext.getAuthentication().getCredentials();
    }
}
