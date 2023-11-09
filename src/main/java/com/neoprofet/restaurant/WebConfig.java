package com.neoprofet.restaurant;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * Configuration class for handling static resource mapping.
 */
@Configuration
public class WebConfig implements WebMvcConfigurer {

    /**
     * Adds a resource handler for static resources.
     *
     * @param registry The resource handler registry.
     */
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/static/**")  // URL path for static resources
                .addResourceLocations("classpath:/static/");
    }
}