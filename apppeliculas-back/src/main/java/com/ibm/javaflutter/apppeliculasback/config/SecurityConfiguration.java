package com.ibm.javaflutter.apppeliculasback.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
@EnableWebSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {

//    @Bean
//    public AuthenticationEntryPoint restAuthenticationEntryPoint() {
//        return new AuthenticationEntryPoint() {
//            @Override
//            public void commence(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse,
//                                 AuthenticationException e) throws IOException, ServletException {
//                Map<String, Object> errorObject = new HashMap<String, Object>();
//                int errorCode = 401;
//                errorObject.put("message", "Unauthorized access of protected resource, invalid credentials");
//                errorObject.put("error", HttpStatus.UNAUTHORIZED);
//                errorObject.put("code", errorCode);
//                errorObject.put("timestamp", new Timestamp(new Date().getTime()));
//                httpServletResponse.setContentType("application/json;charset=UTF-8");
//                httpServletResponse.setStatus(errorCode);
//                httpServletResponse.getWriter().write(objectMapper.writeValueAsString(errorObject));
//            }
//        };
//    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        // protect endpoint /offers
        http.authorizeRequests()
                .antMatchers("/actors/**")
                .authenticated();

//        http.authorizeRequests().

        // add CORS filters
        http.cors();

        // disable CSRF
        http.csrf().disable();
    }
}
