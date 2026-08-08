package com.demo.service;

import com.demo.model.ApiResponse;
import org.springframework.stereotype.Service;

@Service
public class HelloService {

    public ApiResponse getMessage() {

        return new ApiResponse(
                "Spring Boot deployed successfully on External Tomcat!",
                "SUCCESS"
        );
    }
}
