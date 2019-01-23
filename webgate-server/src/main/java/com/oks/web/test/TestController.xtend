package com.oks.web.test

import org.springframework.stereotype.Controller
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.ResponseBody
import com.oks.pojo.User
import org.apache.shiro.SecurityUtils
import org.apache.shiro.authc.UsernamePasswordToken
import org.springframework.web.bind.annotation.RequestMethod
import org.apache.logging.log4j.LogManager
import org.apache.logging.log4j.Logger

@Controller
class TestController {
	
	
	val static Logger log = LogManager.getLogger(TestController)
	
	@GetMapping(value = "test")
	def test(){
		"ok"
	}
	
	
	@RequestMapping(value = "Login" ,method = RequestMethod.POST,
			produces="application/json;charset=utf-8")
	@ResponseBody
	def String Login(User user) throws Exception{
		log.info("User --->{}",user)
		// 获取主体
		var subject = SecurityUtils.getSubject();
		// 创建一个token
		var token = new UsernamePasswordToken(user.username,
				user.password)
		subject.login(token);
		return "登陆GGG";
	}
}