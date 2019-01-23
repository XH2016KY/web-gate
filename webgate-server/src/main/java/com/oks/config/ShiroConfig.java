package com.oks.config;

import java.util.LinkedHashMap;
import org.apache.shiro.spring.security.interceptor.AuthorizationAttributeSourceAdvisor;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.springframework.aop.framework.autoproxy.DefaultAdvisorAutoProxyCreator;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.mgt.SecurityManager;

import com.oks.realm.UserRealm;

@Deprecated
public class ShiroConfig {
	
	
	
	/*@Bean("shiroFilter")
	public ShiroFilterFactoryBean shiroFilter(@Qualifier("securityManager")SecurityManager manager) {
		
		ShiroFilterFactoryBean bean = new ShiroFilterFactoryBean();
		bean.setSecurityManager(manager);
		
		bean.setLoginUrl("login.html");
		bean.setUnauthorizedUrl("403.html");
		
		LinkedHashMap<String,String> filterChainDefinitionMap = new LinkedHashMap<>();
		filterChainDefinitionMap.put("/login.html", "anon");
		filterChainDefinitionMap.put("/Login","anon");
		filterChainDefinitionMap.put("/*","authc");
		bean.setFilterChainDefinitionMap(filterChainDefinitionMap);
		return bean;
	}
	
	@Bean("securityManager")
	public SecurityManager securityManger(@Qualifier("userRealm") UserRealm authRealm) {
		DefaultWebSecurityManager manager = new DefaultWebSecurityManager();
		manager.setRealm(authRealm);
		return manager;
		
	}
	
	@Bean("userRealm")
	public UserRealm authRealm(@Qualifier("credentialMatcher")HashedCredentialsMatcher hashedCredentialsMatcher) {
		
		UserRealm userRealm =  new UserRealm();
		userRealm.setCredentialsMatcher(hashedCredentialsMatcher);
        return userRealm;		
				
	}
    
	@Bean("credentialMatcher")
	public HashedCredentialsMatcher credentialMatcher() {
		HashedCredentialsMatcher hashedCredentialsMatcher = new HashedCredentialsMatcher();
		hashedCredentialsMatcher.setHashAlgorithmName("md5");
		hashedCredentialsMatcher.setHashIterations(1);
		return hashedCredentialsMatcher;
	}
	
	
	@Bean
	public AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor(@Qualifier("securityManager")SecurityManager securityManager) {
		AuthorizationAttributeSourceAdvisor adviser = new AuthorizationAttributeSourceAdvisor();
		adviser.setSecurityManager(securityManager);
		return adviser;
		
	}
	
	@Bean
	public DefaultAdvisorAutoProxyCreator defaultAdvisorAutoProxyCreator() {
		DefaultAdvisorAutoProxyCreator creator = new DefaultAdvisorAutoProxyCreator();
		creator.setProxyTargetClass(true);
        return creator;
	}*/

}
