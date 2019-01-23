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
	
	/**
	 *  权限表常量
	 */
	 interface IPermissionConstant{
	 	
	 	val static COLUMN_PERMISSION_ID = "permission_id"
	    val static COLUMN_PERMISSION_NAME = "permission_name"
	    val static COLUMN_PERMISSION_CREATE_TIME = "permission_create_time"
	    val static COLUMN_PERMISSION_UPDATE_TIME ="permission_update_time"
	    
	    val static PROPERTY_PERMISSION_ID = "permissionId"
	    val static PROPERTY_PERMISSION_NAME = "permissionName"
	    val static PROPERTY_PERMISSION_CREATE_TIME = "createTime"
	    val static PROPERTY_PERMISSION_UPDATE_TIME = "updateTime"
	 }
	
	
	
}