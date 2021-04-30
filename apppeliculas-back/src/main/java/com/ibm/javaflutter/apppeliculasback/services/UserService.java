package com.ibm.javaflutter.apppeliculasback.services;

import com.ibm.javaflutter.apppeliculasback.dao.UserRepository;
import com.ibm.javaflutter.apppeliculasback.entities.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {

    @Autowired
    private UserRepository<User> userRepository;

    public User getUserByUid(String uid){
        User user = null;
        List<User> res = userRepository.findByUid(uid);

        if(!res.isEmpty()){
            user = res.get(0);
        }

        return user;
    }
}
