package com.oks.web.user

import org.springframework.stereotype.Controller
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PutMapping

/** 
 *  注释: 用户服务Restful
 */
@Controller
@RequestMapping(value="user",produces=#["application/json;charset=utf-8","text/html;charset=utf-8"])
class UserController {
	
	
	@PostMapping(value = "login")
	def login() {
		
	}
	
	
	@GetMapping(value = "logout")
	def logout(){
		
	}
	
	
	@PutMapping(value = "update")
	def updateInfo(){
		
	}
	
	
}