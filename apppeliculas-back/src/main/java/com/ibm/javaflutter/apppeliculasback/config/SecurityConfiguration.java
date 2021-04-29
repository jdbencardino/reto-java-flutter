package com.ibm.javaflutter.apppeliculasback.config;

import com.ibm.javaflutter.apppeliculasback.filters.FirebaseAuthenticationTokenFilter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

@Configuration
@EnableWebSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {

    private static final Logger logger = LoggerFactory.getLogger(SecurityConfiguration.class);

    public FirebaseAuthenticationTokenFilter firebaseAuthenticationTokenFilterBean() throws Exception {
        logger.debug("firebaseAuthenticationFilter():: creating instance of FirebaseAuthenticationTokenFilter.");

        FirebaseAuthenticationTokenFilter authenticationTokenFilter = new FirebaseAuthenticationTokenFilter();

        return authenticationTokenFilter;
    }


    @Override
    protected void configure(HttpSecurity http) throws Exception {
        // protect endpoint /offers
        http.authorizeRequests()
                .antMatchers("/actors/**")
                .authenticated()
                .and()
                .sessionManagement()
                .sessionCreationPolicy(SessionCreationPolicy.STATELESS);

        http.addFilterBefore(firebaseAuthenticationTokenFilterBean(), UsernamePasswordAuthenticationFilter.class);

        // add CORS filters
        http.cors();

        // disable CSRF
        http.csrf().disable();
    }
}
