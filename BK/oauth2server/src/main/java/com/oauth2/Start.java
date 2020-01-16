package com.oauth2;

import com.oauth2.config.ApiConfig;
import com.oauth2.config.YamlPropertySourceFactory;
import java.security.Principal;
import javax.servlet.http.HttpServletRequest;
import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.PropertySource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableResourceServer;
import org.springframework.security.oauth2.provider.token.DefaultTokenServices;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@SpringBootApplication
@EnableResourceServer
@PropertySource(value = "file:../etc/application.yml", factory = YamlPropertySourceFactory.class)
public class Start {

    private static final Logger LOGGER = Logger.getLogger(Start.class);

    public static void main(String[] args) {
        PropertyConfigurator.configure("../etc/log4j.properties");
        ApiConfig.loadConfig("../etc/authen.conf");

        LOGGER.info("Start Oauth2Server");
        SpringApplication.run(Start.class, args);
    }

    @RequestMapping(value = "/validateUser", method = RequestMethod.GET)
    public Principal user(Principal user) {
        System.out.println("validateUser user: " + user.toString());
        LOGGER.info("validateUser user: " + user.toString());
        return user;
    }

    @Autowired
    private DefaultTokenServices tokenServices;

    @RequestMapping(value = "/revoke", method = RequestMethod.GET)
    public ResponseEntity logout(HttpServletRequest request) {
        String authHeader = request.getHeader("Authorization");
        if (authHeader != null) {
            String tokenValue = authHeader.replace("Bearer", "").trim();
            tokenServices.revokeToken(tokenValue);
            tokenServices.setAccessTokenValiditySeconds(1);
            tokenServices.setRefreshTokenValiditySeconds(1);
        }
        return ResponseEntity.status(HttpStatus.OK).body("logout success!");
    }
}
