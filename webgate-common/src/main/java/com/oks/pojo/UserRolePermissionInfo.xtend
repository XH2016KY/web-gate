package com.oks.pojo

import org.apache.commons.lang3.builder.ReflectionToStringBuilder
import org.apache.commons.lang3.builder.ToStringStyle
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors class UserRolePermissionInfo {
	
	String userId
	
	String roleInfo
	
	String permissionInfo
	
	override toString() {
		ReflectionToStringBuilder.toString(this, ToStringStyle.JSON_STYLE)
	}
	
}