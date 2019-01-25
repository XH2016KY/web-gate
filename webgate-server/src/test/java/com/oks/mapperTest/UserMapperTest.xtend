package com.oks.mapperTest

import com.oks.config.RootConfig
import com.oks.mapper.IUserMapper
import org.junit.Before
import org.junit.Test
import org.springframework.context.ApplicationContext
import org.springframework.context.annotation.AnnotationConfigApplicationContext
import java.util.HashSet
import com.oks.pojo.Permission
import java.util.ArrayList
import java.util.concurrent.CopyOnWriteArrayList

class UserMapperTest {
	
	ApplicationContext  applicationContext
	
	IUserMapper userMapper
	
	
	@Before
	def void  init(){
		applicationContext = new AnnotationConfigApplicationContext(RootConfig)
		userMapper = applicationContext.getBean(IUserMapper)
	}
	
	@Test
    def void testfindByName() {
	    var user = userMapper.findByName("oks")
	    println(user)
	    
    }
    
    @Test
    def void test1findById() {
	    var user = userMapper.selectPermissionsByUserName("op")
	    println(user)
    }
    
    
    @Test
    def void test2findById() {
	    var user = userMapper.selectRolesByUserName("oks")
	    println(user)
	    
    }
    
    @Test
    def void test3getResultByPrincipal() {
	    var pwd = userMapper.getResultByPrincipal("oks")
	    println(pwd)
	    
    }
    
    @Test
    def void test3getRolePermissionInfoByPrincipal() {
	    var pwd = userMapper.getRolePermissionInfoByPrincipal("oks")
	    println('''角色信息«pwd.roleInfo»+权限信息«pwd.permissionInfo»''')
	    var result = userMapper.getPermissionsByInfo(RolePermissionToList(pwd.permissionInfo))
        println('''权限为:«result»''')
	    
    }
    
    def RolePermissionToList(String info){
    	var infoArray = info.split(",")
	    val infoList = new CopyOnWriteArrayList<Integer>
	     infoArray.forEach[one|
	    	infoList.add(Integer.parseInt(one))
	    ]
	    infoList
    }
}