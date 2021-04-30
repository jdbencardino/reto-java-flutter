package com.ibm.javaflutter.apppeliculasback.config;

import com.ibm.javaflutter.apppeliculasback.filters.FirebaseAuthenticationTokenFilter;
import com.ibm.javaflutter.apppeliculasback.helpers.RoleNames;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(securedEnabled = true, jsr250Enabled = true, prePostEnabled = true)
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {

    private static final Logger logger = LoggerFactory.getLogger(SecurityConfiguration.class);

    @Autowired
    private FirebaseAuthenticationTokenFilter authenticationTokenFilter;


    @Override
    protected void configure(HttpSecurity http) throws Exception {

        // add CORS filters
        http.cors();

        // disable CSRF
        http.csrf().disable();

        // protect endpoint /offers
        http.authorizeRequests()
                .antMatchers("/**")
                .permitAll()
                .antMatchers("/users/**")
                .hasAuthority(RoleNames.ROLE_CINEMA)
                .antMatchers(HttpMethod.OPTIONS,"/actors/**")
                .authenticated()
                .and()
                .sessionManagement()
                .sessionCreationPolicy(SessionCreationPolicy.STATELESS);


//                .antMatchers("/users/**", "/films/**")
//                .permitAll()
//                .and()
//                .authorizeRequests()

        http.addFilterBefore(authenticationTokenFilter, UsernamePasswordAuthenticationFilter.class);

    }
}
