package com.oks.constant

/**
 *  权限常量接口
 */
interface IAuthConstant {
	
	/**
	 *  角色常量
	 */
	interface IRoleConstant{
		
		/**
		 *  普通用户
		 */
		val static ROLE_USER = "user"
		
		/**
		 *  普通商家
		 */
		val static ROLE_SELLER = "seller"
		
		/**
		 *  VIP
		 */
		val static ROLE_VIP = "vip"
		
		/**
		 *  管理员
		 */
		val static ROLE_MANAGER = "manager"
	}
	
	/**
	 *  权限常量
	 */
	interface IPermissionConstant {
		
		val static SELECT = "select"
		
		val static DELETE = "delete"
		
		val static UPDATE = "update"
		
		val static INSERT = "insert"
		
		val static OTHERS = "others"
		
	}
	
	
}