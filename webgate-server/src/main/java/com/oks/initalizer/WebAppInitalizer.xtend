package com.oks.initalizer

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer
import com.oks.config.RootConfig
import com.oks.config.WebConfig
import org.springframework.web.filter.CharacterEncodingFilter
import javax.servlet.Filter

class WebAppInitalizer extends AbstractAnnotationConfigDispatcherServletInitializer{
	
	/**
	 * spring-root容器
	 */
	override protected getRootConfigClasses() {
		var Class<?>[] root = #[RootConfig]
		root
	}
	
	/**
	 * spring-mvc容器
	 */
	override protected getServletConfigClasses() {
		var Class<?>[] web = #[WebConfig]
		web
	}
	
	/**
	 * servlet-path
	 */
	override protected getServletMappings() {
		var String[] path= #["/"]
		path
	}
	
	/**
	 * 注册过滤器
	 */
	override protected getServletFilters(){
		
		var characterEncodingFilter = new CharacterEncodingFilter
		characterEncodingFilter.encoding="UTF-8"
		characterEncodingFilter.forceEncoding = true
		val Filter[] filter = #[characterEncodingFilter]
		filter
		
	}
	
}