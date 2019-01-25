package com.oks.filter

import java.io.IOException
import javax.servlet.Filter
import javax.servlet.FilterChain
import javax.servlet.ServletException
import javax.servlet.ServletRequest
import javax.servlet.ServletResponse
import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpServletResponse
import redis.clients.jedis.Jedis
import org.apache.shiro.SecurityUtils

class MyFilter implements Filter{
	
	
	
	override doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		println("-----------------Filter-----------------")
		val b = request as HttpServletRequest
		val a = response as HttpServletResponse 
		chain.doFilter(request,response)
		
	}
	
}