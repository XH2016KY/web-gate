package com.oks.pojo

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.Date
import lombok.ToString

/**
 *  角色实体
 */
@Accessors @ToString class Role {
	
	Integer roleId
	
	String roleName
	
	Date createTime
	
	Date updateTime
	
}