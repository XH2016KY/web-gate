package com.oks.filter

import javax.servlet.Filter
import javax.servlet.ServletRequest
import javax.servlet.ServletResponse
import javax.servlet.FilterChain
import java.io.IOException
import javax.servlet.ServletException

class SecondFilter implements Filter{
	
	override doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		println("-------------Second-------------")
		chain.doFilter(request,response)
	}
	
}