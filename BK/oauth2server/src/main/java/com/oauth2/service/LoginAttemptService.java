/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.oauth2.service;

import com.oauth2.config.ApiConfig;
import com.google.common.cache.CacheBuilder;
import com.google.common.cache.CacheLoader;
import com.google.common.cache.LoadingCache;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.TimeUnit;
import org.springframework.stereotype.Service;

/**
 *
 * @author Khiem Ha
 */
@Service
public class LoginAttemptService {

    private final int MAX_ATTEMPT = ApiConfig.config.maxLoginAttempt;
    private LoadingCache<String, Integer> attemptsCache;
    private LoadingCache<String, Integer> listIpBlockCache;

    public LoginAttemptService() {
        super();
        attemptsCache = CacheBuilder.newBuilder().
                expireAfterWrite(ApiConfig.config.loginAttempPeriod, TimeUnit.MINUTES).build(new CacheLoader<String, Integer>() {
            @Override
            public Integer load(String key) {
                return 0;
            }
        });
        listIpBlockCache = CacheBuilder.newBuilder().
                expireAfterWrite(ApiConfig.config.lockTimeAfterLoginFail, TimeUnit.MINUTES).build(new CacheLoader<String, Integer>() {
            @Override
            public Integer load(String key)  {
                return 0;
            }
        });
    }

    public void loginSucceeded(String key) {
        attemptsCache.invalidate(key);
        listIpBlockCache.invalidate(key);
    }

    public void loginFailed(String key) {
        int attempts = 0;
        try {
            attempts = attemptsCache.get(key);
        } catch (Exception e) {
            attempts = 0;
        }
        attempts++;
        attemptsCache.put(key, attempts);
        if(attempts == MAX_ATTEMPT)
            listIpBlockCache.put(key, attempts);
    }

    public boolean isBlocked(String key) {
        try {
            return listIpBlockCache.get(key) >= MAX_ATTEMPT;
        } catch (ExecutionException e) {
            return false;
        }
    }
}
