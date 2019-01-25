package com.oks.web.test

import com.oks.pojo.User
import org.apache.logging.log4j.LogManager
import org.apache.logging.log4j.Logger
import org.apache.shiro.SecurityUtils
import org.apache.shiro.authc.UsernamePasswordToken
import org.apache.shiro.authz.annotation.RequiresRoles
import org.apache.shiro.session.Session
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Controller
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.ResponseBody
import redis.clients.jedis.JedisCluster
import javax.servlet.http.HttpServlet

@Controller
class TestController {
	
	
	@Autowired
	JedisCluster jedisCluster
	
	
	val static Logger log = LogManager.getLogger(TestController)
	
	@GetMapping(value = "test")
	@RequiresRoles("vip")
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
	
	
	
	@GetMapping(value="ggg")
	@ResponseBody
	def lol(){
		
		var a = SecurityUtils.subject
		a.principal as String
        throw new IllegalArgumentException("hhhhhhh")
		
	}
	
	@GetMapping(value="out",produces="application/json;charset=utf-8")
	@ResponseBody
	def lol12(){
		var a = SecurityUtils.subject
		a.logout
		"已退出"
	}
		
	
	
}