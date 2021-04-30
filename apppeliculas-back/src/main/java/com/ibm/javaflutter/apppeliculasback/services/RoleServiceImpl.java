package com.ibm.javaflutter.apppeliculasback.services;

import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseAuthException;
import com.google.firebase.auth.UserRecord;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
@Slf4j
public class RoleServiceImpl implements RoleService {

    @Override
    public void addRole(String uid, String role) throws Exception {
        try {
            FirebaseAuth firebaseAuth = FirebaseAuth.getInstance();
            UserRecord user = firebaseAuth.getUser(uid);
            Map<String, Object> claims = new HashMap<>();
            user.getCustomClaims().forEach(claims::put);
            if (!claims.containsKey(role)) {
                claims.put(role, true);
            }
            firebaseAuth.setCustomUserClaims(uid, claims);
        } catch (FirebaseAuthException e) {
            log.error("Firebase Auth Error ", e);
        }
    }

    @Override
    public void removeRole(String uid, String role) {
        try {
            FirebaseAuth firebaseAuth = FirebaseAuth.getInstance();
            UserRecord user = firebaseAuth.getUser(uid);
            Map<String, Object> claims = new HashMap<>();
            user.getCustomClaims().forEach(claims::put);
            claims.remove(role);
            firebaseAuth.setCustomUserClaims(uid, claims);
        } catch (FirebaseAuthException e) {
            log.error("Firebase Auth Error ", e);
        }
    }
}
