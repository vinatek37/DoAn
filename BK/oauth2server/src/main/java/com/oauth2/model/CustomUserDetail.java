/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.oauth2.model;

import com.oauth2.config.AccountTypeConstant;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

/**
 *
 * @author Khiem Ha
 */
public class CustomUserDetail extends User implements UserDetails {

    public Boolean isEmailLogin = false;

    public CustomUserDetail(User user) {
        super(user);
    }

    public CustomUserDetail(User user, Boolean isEmailLogin) {
        super(user);
        this.isEmailLogin = isEmailLogin;
    }

    public CustomUserDetail() {

    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        List<GrantedAuthority> gas = new ArrayList<>();
        switch (getRole()) {
            case AccountTypeConstant.ROLE.ADMIN:
                gas.add(new SimpleGrantedAuthority(AccountTypeConstant.ROLE.ADMIN_STR));
                break;

            case AccountTypeConstant.ROLE.USER:
                gas.add(new SimpleGrantedAuthority(AccountTypeConstant.ROLE.USER_STR));
                break;
        }
        return gas;
    }

    @Override
    public String getPassword() {
        return super.getPassword();
    }

    @Override
    public String getUsername() {
        if (super.getMail() != null && super.getPhone() != null) {
            return isEmailLogin ? super.getMail() : super.getPhone();
        } else {
            return super.getMail() == null ? super.getPhone() : super.getMail();
        }
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return super.getActive() == 1;
    }

    @Override
    public boolean isAccountNonLocked() {
        return super.getActive() == 1;
    }
}
