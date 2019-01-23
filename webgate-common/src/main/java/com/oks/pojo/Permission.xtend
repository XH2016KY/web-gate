package com.oks.pojo

import java.util.Date
import org.eclipse.xtend.lib.annotations.Accessors
import org.apache.commons.lang3.builder.ReflectionToStringBuilder
import org.apache.commons.lang3.builder.ToStringStyle

/**
 *  权限实体
 */
@Accessors class Permission {
	
	Integer permissionId

	String permissionName
	
	Date createTime
	
	Date updateTime
	
	override toString() {
		ReflectionToStringBuilder.toString(this, ToStringStyle.JSON_STYLE);
	}
	
}