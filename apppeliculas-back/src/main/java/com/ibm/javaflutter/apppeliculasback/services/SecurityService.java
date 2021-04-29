package com.ibm.javaflutter.apppeliculasback.services;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import javax.servlet.http.HttpServletRequest;

@Service
public class SecurityService {

    public String getBearerToken(HttpServletRequest request) {
        String bearerToken = null;
        String authorization = request.getHeader("Authorization");
        if(StringUtils.hasText(authorization) && authorization.startsWith("Bearer ")){
            bearerToken = authorization.substring(7);
        }

        return bearerToken;
    }
}
