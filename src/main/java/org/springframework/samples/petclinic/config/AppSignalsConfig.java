package org.springframework.samples.petclinic.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import software.amazon.cloudwatchapplicationsignals.spring.AppSignalsAspect;
import software.amazon.cloudwatchapplicationsignals.spring.AppSignalsInterceptor;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class AppSignalsConfig implements WebMvcConfigurer {

    @Bean
    public AppSignalsAspect appSignalsAspect() {
        return new AppSignalsAspect();
    }

    @Bean
    public AppSignalsInterceptor appSignalsInterceptor() {
        return new AppSignalsInterceptor();
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(appSignalsInterceptor());
    }
}