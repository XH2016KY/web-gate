package com.oks.realm

import com.oks.mapper.IPermissionMapper
import com.oks.mapper.IRoleMapper
import com.oks.mapper.IUserMapper
import java.util.HashSet
import org.apache.logging.log4j.LogManager
import org.apache.logging.log4j.Logger
import org.apache.shiro.authc.AuthenticationException
import org.apache.shiro.authc.AuthenticationToken
import org.apache.shiro.authc.SimpleAuthenticationInfo
import org.apache.shiro.authz.SimpleAuthorizationInfo
import org.apache.shiro.realm.AuthorizingRealm
import org.apache.shiro.subject.PrincipalCollection
import org.apache.shiro.util.ByteSource
import org.springframework.beans.factory.annotation.Autowired

/** 
 *   认证 授权
 */
class JdbcRealm extends AuthorizingRealm{
	
	val static Logger log = LogManager.getLogger(JdbcRealm)
	
	@Autowired
	IRoleMapper roleMapper
	
	@Autowired
	IPermissionMapper permissionMapper
	
	@Autowired
	IUserMapper userMapper
	
	
	/**
	 *  授权
	 */
	override protected doGetAuthorizationInfo(PrincipalCollection principals) {
		
		// 1 .从主体中获取用户名
		var username = principals.primaryPrincipal as String
		
		// 2.从数据库中或缓存中获取权限数据
		var permissions = getPermissions(username)
		
		// 3 .从数据库中或缓存中获取角色数据
		var roles = getRoles(username)
		
		// 4 .对角色和权限授权
		val simpleAuthorizationInfo = new SimpleAuthorizationInfo()
		simpleAuthorizationInfo.stringPermissions = permissions
		simpleAuthorizationInfo.roles = roles
		simpleAuthorizationInfo
		
	}
	
	/**
	 *  认证
	 */
	override protected doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		// 1 .从主体传过来认证的信息中,获取用户名
		var username = (token.principal) as String
		
		// 2 .通过用户名到数据库中获取凭证
		var password = getPasswordByUserName(name)
		
		// 3 .判断凭证
		if(password === null){
			return null
		}
		// 4 .认证不为空,加密返回认证信息
		var authenticationInfo = new SimpleAuthenticationInfo(username,password,"userRealm")
		authenticationInfo.credentialsSalt = ByteSource.Util.bytes("jdk")
		authenticationInfo
	}
	
	/**
	 *  通过用户获取凭证
	 */
	def getPasswordByUserName(String string) {
		userMapper.getResultByPrincipal(string)
	}
	
	/**
	 *  通过用户名查询到权限集合
	 */
	 def getPermissions(String name){
	 	
        val permissions = new HashSet
        userMapper.selectPermissionsByUserName(name).forEach[one|
        	permissions.add(one)
        ]
        log.info("用户拥有权限->{}",permissions)
        permissions
	 }
	 
	 /**
	  * 通过用户名查询到角色集合
	  */
	def getRoles(String name){
		val roles = new HashSet
		userMapper.selectRolesByUserName(name).forEach[one|
			roles.add(one)
		]
		log.info("用户拥有角色->{}",roles)
		roles
	}
	
}