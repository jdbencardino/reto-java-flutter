package com.ibm.javaflutter.apppeliculasback.helpers;

import org.springframework.security.access.annotation.Secured;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target(ElementType.TYPE)
@Retention(RetentionPolicy.RUNTIME)
@Secured(RoleNames.ROLE_ADMIN)
public @interface IsAdmin {
}
