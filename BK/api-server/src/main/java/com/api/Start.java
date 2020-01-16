package com.api;

import com.api.config.YamlPropertySourceFactory;
import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.PropertySource;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableResourceServer;

@EnableResourceServer
@SpringBootApplication
@PropertySource(value = "file:../etc/api-application.yml", factory = YamlPropertySourceFactory.class)
public class Start {

    public static final Logger LOG = Logger.getLogger(Start.class);

    public static void main(String[] args) {
        PropertyConfigurator.configure("../etc/log4j.properties");
        LOG.info("Start API Services");
        SpringApplication.run(Start.class, args);
    }

}
