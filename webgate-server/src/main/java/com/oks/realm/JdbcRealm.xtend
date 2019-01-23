package com.oks.realm

import org.apache.shiro.realm.AuthorizingRealm
import org.apache.shiro.subject.PrincipalCollection
import org.apache.shiro.authc.AuthenticationToken
import org.apache.shiro.authc.AuthenticationException
import org.apache.logging.log4j.LogManager
import org.apache.logging.log4j.Logger
import org.springframework.beans.factory.annotation.Autowired
import com.oks.mapper.IRoleMapper
import com.oks.mapper.IPermissionMapper

/** 
 *   认证 授权
 */
class JdbcRealm extends AuthorizingRealm{
	
	val static Logger log = LogManager.getLogger(JdbcRealm)
	
	@Autowired
	IRoleMapper roleMapper
	
	@Autowired
	IPermissionMapper permissionMapper
	
	
	/**
	 *  授权
	 */
	override protected doGetAuthorizationInfo(PrincipalCollection principals) {
		
	}
	
	/**
	 *  认证
	 */
	override protected doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		
	}
	
	
	
}