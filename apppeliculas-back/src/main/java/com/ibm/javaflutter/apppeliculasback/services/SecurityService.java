package com.ibm.javaflutter.apppeliculasback.services;

import com.google.common.base.Strings;
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
}
