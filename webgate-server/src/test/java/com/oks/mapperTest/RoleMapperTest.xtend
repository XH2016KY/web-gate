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
	
	
	@Before
	def void  init(){
		applicationContext = new AnnotationConfigApplicationContext(RootConfig)
	}
	
	@Test
    def void testfindByName() {
    	val bean = applicationContext.getBean(IRoleMapper)
	    val findByName = bean.findByName("vip")
	    var sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
	    println(sd.format(findByName.createTime))
	    println(sd.format(findByName.updateTime))
	    println(findByName)
	    
    }
}