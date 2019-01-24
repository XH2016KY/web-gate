package com.oks.mapperTest

import com.oks.config.RootConfig
import com.oks.mapper.IUserMapper
import org.junit.Before
import org.junit.Test
import org.springframework.context.ApplicationContext
import org.springframework.context.annotation.AnnotationConfigApplicationContext
import java.util.HashSet
import com.oks.pojo.Permission

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
}