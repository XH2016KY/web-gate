package com.oks.web.test

import org.springframework.web.bind.annotation.ControllerAdvice
import org.springframework.web.bind.annotation.ExceptionHandler
import org.springframework.web.bind.annotation.ResponseBody
import org.apache.logging.log4j.LogManager
import org.apache.logging.log4j.Logger
import org.apache.shiro.authc.IncorrectCredentialsException
import org.apache.shiro.authc.UnknownAccountException

@ControllerAdvice
class TestAdvice {
	
	val static Logger log = LogManager.getLogger(TestAdvice)
	
	@ExceptionHandler(IllegalArgumentException)
	@ResponseBody
	def String handleBindException(IllegalArgumentException e) {
        var message = e.getMessage()
		log.info("GGG->{}",message);
	    "OUT_TIME"
	}
	
	
    @ExceptionHandler(IncorrectCredentialsException)
	@ResponseBody
	def String handleIncorrectCredentialsException(IncorrectCredentialsException e) {
        var message = e.getMessage()
		log.info("GGG->{}",message);
		//did not match the expected credentials
	    "PASSWORD_ERROR"
	}
	
		
    @ExceptionHandler(UnknownAccountException)
	@ResponseBody
	def String handleUnknownAccountException(UnknownAccountException e) {
        var message = e.getMessage()
		log.info("GGG->{}",message);
		//was unable to find account
	    "ACCOUT_NOT_EXITST"
	}
	
}