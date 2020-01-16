package com.api.config;

import javax.annotation.PostConstruct;
import org.apache.commons.configuration.ConfigurationException;
import org.apache.commons.configuration.PropertiesConfiguration;
import org.apache.commons.configuration.reloading.FileChangedReloadingStrategy;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;

@Component
public class ApplicationProperties {

    public static final Logger LOG = Logger.getLogger(ApplicationProperties.class);
    public static final String PROPERTIES_FILE_PATH = "../etc/application.properties";
    public static final int REFRESH_DELAY = 10000;
    public static PropertiesConfiguration configuration;

    @PostConstruct
    private void init() {
        try {
            String filePath = PROPERTIES_FILE_PATH;
            LOG.info("Loading the properties file: " + filePath);
            System.out.println("Loading the properties file: " + filePath);
            configuration = new PropertiesConfiguration(filePath);
            //Create new FileChangedReloadingStrategy to reload the properties file based on the given time interval 
            FileChangedReloadingStrategy fileChangedReloadingStrategy = new FileChangedReloadingStrategy();
            fileChangedReloadingStrategy.setRefreshDelay(REFRESH_DELAY);
            configuration.setReloadingStrategy(fileChangedReloadingStrategy);
        } catch (ConfigurationException e) {
            LOG.error(e.getMessage());
        }
    }

    public String getProperty(String key) {
        return (String) configuration.getProperty(key);
    }

    public void setProperty(String key, Object value) {
        configuration.setProperty(key, value);
    }

    public void save() {
        try {
            configuration.save();
        } catch (ConfigurationException e) {
            LOG.error(e.getMessage());
        }
    }
}
