package com.ibm.javaflutter.apppeliculasback.config;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;

import java.io.FileInputStream;
import java.io.IOException;

@Configuration
public class FirebaseConfig {

    @Value("${firebase.configpath}")
    private String configPath;

    @Primary
    @Bean
    public FirebaseApp getFirebaseApp() throws IOException {
        FileInputStream serviceAccount =
                new FileInputStream(configPath);
        // TODO change to GoogleCredentials.getApplicationDefault()
        FirebaseOptions options = FirebaseOptions.builder()
                .setCredentials(GoogleCredentials.fromStream(serviceAccount))
                .build();

        if (FirebaseApp.getApps().isEmpty()) {
            FirebaseApp.initializeApp(options);
        }
        return FirebaseApp.getInstance();
    }


//    @Bean
//    public FirebaseAuth getAuth() throws IOException {
//        return FirebaseAuth.getInstance(getFirebaseApp());
//    }

}
