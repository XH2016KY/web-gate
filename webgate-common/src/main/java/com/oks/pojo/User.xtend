package com.oks.pojo

import java.util.Date
import org.apache.commons.lang3.builder.ReflectionToStringBuilder
import org.apache.commons.lang3.builder.ToStringStyle
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors class User {
	
	String userId
	
	String username

	String password
	
	String userStatus
	
	Date createTime
	
	Date updateTime
	
	String userMail
	
	String userPhone
	
	String userLoginStatus
	
	String userSex
	
	String userAge
	
	String log
	
	String address
	
	override toString() {
		ReflectionToStringBuilder.toString(this,ToStringStyle.JSON_STYLE)
	}
	
	 
}