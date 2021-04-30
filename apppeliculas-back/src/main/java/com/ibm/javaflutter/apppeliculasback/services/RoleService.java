package com.ibm.javaflutter.apppeliculasback.services;

public interface RoleService {

    void addRole(String uid, String role) throws Exception;

    void removeRole(String uid, String role);

}
