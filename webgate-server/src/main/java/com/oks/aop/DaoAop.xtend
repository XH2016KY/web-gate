package com.oks.aop

import com.oks.annotation.Slave
import com.oks.dao.split.DynamicDataSourceHolder
import org.apache.logging.log4j.LogManager
import org.apache.logging.log4j.Logger
import org.aspectj.lang.JoinPoint
import org.aspectj.lang.annotation.After
import org.aspectj.lang.annotation.Aspect
import org.aspectj.lang.annotation.Before
import org.aspectj.lang.annotation.Pointcut

import static com.oks.dao.split.DynamicDataSourceHolder.*

@Aspect
class DaoAop {
	
	val static Logger log = LogManager.getLogger(DaoAop)
	
	@Pointcut(value="execution( public * com.oks.mapper..*(..))")
	def daoCut(){}
	
	
	@Before(value="daoCut()")
	def before(JoinPoint joinPoint) {
		// 获取方法名
		val name = joinPoint.signature.name
        println(name)
        // 增强方法的类
		val type = joinPoint.signature.declaringType
		// 获取类的所有方法
	    val dingenskirchen = type.methods
	    // 得到指定方法上的注解
	    dingenskirchen.forEach[one|
	    	if(one.name.equals(name)){
	    		var ty = one.annotations.get(0)
	    		if(ty instanceof Slave){
	    			DynamicDataSourceHolder.dbType = DynamicDataSourceHolder.DB_SLAVE
	    		}else {
	    			DynamicDataSourceHolder.dbType = DynamicDataSourceHolder.DB_MASTER
	    		}	
	    	}
	    ]		
	}
	
	@After(value="daoCut()")
	def after() {
		log.info("方法执行完毕")
		DynamicDataSourceHolder.cleanDbtype
	}
	
	
}