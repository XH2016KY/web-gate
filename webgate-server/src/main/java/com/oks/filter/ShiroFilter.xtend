package com.oks.filter

import org.springframework.web.filter.DelegatingFilterProxy
import javax.servlet.annotation.WebFilter

@WebFilter(filterName="shiroFilter",urlPatterns=#["/*"])
class ShiroFilter extends DelegatingFilterProxy{
	
}