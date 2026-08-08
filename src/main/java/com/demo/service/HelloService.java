package com.demo.service;

import com.demo.model.ApiResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

@Service
public class HelloService {

    private static final Logger logger =
            LoggerFactory.getLogger(HelloService.class);

    @Value("${app.message}")
    private String message;

    @Value("${app.environment}")
    private String environment;

    public ApiResponse getMessage() {

        logger.info("Processing home endpoint request");
        logger.info("Application environment: {}", environment);

        return new ApiResponse(
                message + " Environment: " + environment,
                "SUCCESS"
        );
    }
}
