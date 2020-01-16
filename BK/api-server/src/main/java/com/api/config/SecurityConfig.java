/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.api.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

/**
 *
 * @author Thuong
 */
@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Override
    public void configure(WebSecurity http) throws Exception {
        http.ignoring().antMatchers(
//                "/**",
                "/api/movie/details",
                "/api/movie/schedule-by-movie-id",
                "/api/account/account-regiter",
                "/api/event/list",
                "/api/movie/schedule-by-movie-id",
                "/api/booking/seat",
                "/api/movie/list-showing",
                "/api/news/get-list",
                "/swagger-ui.html**",
                "/v2/api-docs",
                "/configuration/**",
                "/swagger*/**",
                "/webjars/**"
        );
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.csrf().ignoringAntMatchers("/api/**");
    }
}
