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
	
	/**
	 *  用户常量
	 */
	interface IUserConstant{
		
        val static COLUMN_USER_ID = "user_ID"
		val static COLUMN_USERNAME = "user_name"
		val static COLUMN_PASSWORD = "user_password"
		val static COLUMN_USER_STATUS = "user_status"
		val static COLUMN_USER_CREATE_TIME = "user_create_time"
		val static COLUMN_USER_UPDATE_TIME = "user_update_ime"
		val static COLUMN__USER_MAIL = "user_mail"
		val static COLUMN_USER_PHONE = "user_phone"
		val static COLUMN_USER_LOG_STATUS = "user_login_status"
		val static COLUMN_USER_SEX = "user_sex"
		val static COLUMN_USER_AGE = "user_age"
		val static COLUMN_USER_LOG = "user_log"
		val static COLUMN_USER_ADDRESS = "user_address"
		
		
		
		val static PROPERTY_USER_ID = "userId"
		val static PROPERTY_USERNAME = "username"
		val static PROPERTY_PASSWORD = "password"
		val static PROPERTY_USER_STATUS = "userStatus"
		val static PROPERTY_USER_CREATE_TIME = "createTime"
		val static PROPERTY_USER_UPDATE_TIME = "updateTime"
		val static PROPERTY__USER_MAIL = "userMail"
		val static PROPERTY_USER_PHONE = "userPhone"
		val static PROPERTY_USER_LOG_STATUS = "userLoginStatus"
		val static PROPERTY_USER_SEX = "userSex"
		val static PROPERTY_USER_AGE = "userAge"
		val static PROPERTY_USER_LOG = "log"
		val static PROPERTY_USER_ADDRESS = "address"
		
		
		
		
		
		
		
	}
	
}