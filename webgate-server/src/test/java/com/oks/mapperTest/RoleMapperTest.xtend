package com.oks.mapperTest

import com.oks.config.RootConfig
import com.oks.mapper.IRoleMapper
import java.text.SimpleDateFormat
import org.junit.Before
import org.junit.Test
import org.springframework.context.ApplicationContext
import org.springframework.context.annotation.AnnotationConfigApplicationContext

class RoleMapperTest {
	
	
	ApplicationContext  applicationContext
	
	IRoleMapper roleMapper
	
	
	@Before
	def void  init(){
		applicationContext = new AnnotationConfigApplicationContext(RootConfig)
		roleMapper = applicationContext.getBean(IRoleMapper)
	}
	
	@Test
    def void testfindByName() {
	    val findByName = roleMapper.findByName("vip")
	    var sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
	    println(sd.format(findByName.createTime))
	    println(sd.format(findByName.updateTime))
	    println(findByName)
	    
    }
}