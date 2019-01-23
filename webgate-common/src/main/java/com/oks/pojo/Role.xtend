package com.oks.pojo

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.Date
import lombok.ToString
import org.apache.commons.lang3.builder.ReflectionToStringBuilder
import org.apache.commons.lang3.builder.ToStringStyle

/**
 *  角色实体
 */
@Accessors @ToString class Role {
	
	Integer roleId
	
	String roleName
	
	Date createTime
	
	Date updateTime
	
	override toString() {
		ReflectionToStringBuilder.toString(this, ToStringStyle.JSON_STYLE);
	}
	
}