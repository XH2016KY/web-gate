package com.oks.filter

import org.springframework.web.filter.DelegatingFilterProxy
import javax.servlet.annotation.WebFilter

@Deprecated
@WebFilter(filterName="shiroFilter",urlPatterns=#["/*"])
class ShiroFilter extends DelegatingFilterProxy{
	
}