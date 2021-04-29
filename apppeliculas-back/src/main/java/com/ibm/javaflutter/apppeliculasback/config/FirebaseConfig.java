package com.ibm.javaflutter.apppeliculasback.config;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.google.firebase.auth.FirebaseAuth;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;

import java.io.FileInputStream;
import java.io.IOException;

@Configuration
public class FirebaseConfig {

    @Primary
    @Bean
    public FirebaseApp getFirebaseApp() throws IOException {
        FileInputStream serviceAccount =
                new FileInputStream("/Users/jdbencardino/Documents/RetoMovile/AuthFiles/reto-flutter-java-firebase-adminsdk-30sq7-2997658c41.json");
        // TODO change to GoogleCredentials.getApplicationDefault()
        FirebaseOptions options = FirebaseOptions.builder()
                .setCredentials(GoogleCredentials.fromStream(serviceAccount))
                .build();

        if (FirebaseApp.getApps().isEmpty()) {
            FirebaseApp.initializeApp(options);
        }
        return FirebaseApp.getInstance();
    }


    @Bean
    public FirebaseAuth getAuth() throws IOException {
        return FirebaseAuth.getInstance(getFirebaseApp());
    }

}
