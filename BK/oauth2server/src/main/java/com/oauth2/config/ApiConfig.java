/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.oauth2.config;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import org.apache.log4j.Logger;
import org.yaml.snakeyaml.Yaml;


public class ApiConfig {
    
    private static final Logger LOGGER = Logger.getLogger(Config.class);
    public static Config config;
    
    public static void loadConfig(String path) {
        try {
            Yaml yaml = new Yaml();            
            try (InputStream in = Files.newInputStream(Paths.get(path))) {
                config = yaml.loadAs(in, Config.class);
            }
        } catch (IOException ex) {
            LOGGER.error(ex.getMessage());
        }
    }
}
