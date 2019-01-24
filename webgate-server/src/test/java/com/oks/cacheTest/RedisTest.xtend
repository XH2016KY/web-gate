package com.oks.cacheTest

import com.oks.config.RootConfig
import org.junit.Before
import org.junit.Test
import org.springframework.context.ApplicationContext
import org.springframework.context.annotation.AnnotationConfigApplicationContext
import redis.clients.jedis.Jedis
import redis.clients.jedis.JedisCluster

class RedisTest {
	
	ApplicationContext  applicationContext
	
	JedisCluster jedisCluster 
	
	Jedis jedis
	
	
	@Before
	def void  init(){
		applicationContext = new AnnotationConfigApplicationContext(RootConfig)
		jedisCluster = applicationContext.getBean(JedisCluster)
		jedis = applicationContext.getBean(Jedis)
		
	}

    @Test
    def void test1(){
    	var v = jedisCluster.set("shiro","shiroFilter")
    	println(v)
    }
    
     @Test
    def void test2(){
    	var v = jedis.set("shiro","shiroFilter")
    	println(v)
    }
	
}