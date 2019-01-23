package com.oks.mapperTest

import com.oks.config.RootConfig
import com.oks.mapper.IPermissionMapper
import org.junit.Before
import org.junit.Test
import org.springframework.context.ApplicationContext
import org.springframework.context.annotation.AnnotationConfigApplicationContext

class PermissionMapperTest {
	
	ApplicationContext  applicationContext
	
	IPermissionMapper permissionMapper
	
	@Before
	def void  init(){
		applicationContext = new AnnotationConfigApplicationContext(RootConfig)
		permissionMapper = applicationContext.getBean(IPermissionMapper)
	}
	
	@Test
	def void selectByIdTest(){
		var a = permissionMapper.findById(1)
		println(a)
	}
	
	
}