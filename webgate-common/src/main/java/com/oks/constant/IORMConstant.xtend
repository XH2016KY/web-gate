package com.oks.constant

/**
 *  ORM常量
 */
interface IORMConstant {
	
	/**
	 *  角色表常量
	 */
	interface IRoleConstant{
		
		val static COLUMN_ROLE_ID = "role_id"
		val static COLUMN_ROLE_NAME = "role_name"
		val static COLUMN_ROLE_CREATE_TIME = "role_create_time"
		val static COLUMN_ROLE_UPDATE_TIME = "role_update_time"
		
		val static PROPERTY_ROLE_ID = "roleId"
		val static PROPERTY_ROLE_NAME = "roleName"
		val static PROPERTY_ROLE_CREATE_TIME = "createTime"
		val static PROPERTY_ROLE_UPDATE_TIME = "updateTime"
		
	}
	
	
	
}