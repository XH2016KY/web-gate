package com.oks.cache

import org.apache.shiro.cache.CacheManager
import org.apache.shiro.cache.CacheException
import org.springframework.beans.factory.annotation.Autowired

class RedisCacheManager implements CacheManager{
	
	@Autowired
	RedisCache redisCache
	
	override <K,V> getCache(String s) throws CacheException {
		redisCache
	}
	
}