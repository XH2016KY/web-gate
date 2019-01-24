package com.oks.session

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Component
import redis.clients.jedis.Jedis

@Component
class JedisUtil {

	@Autowired
	Jedis jedis
    
    /**
     *  将指定的key-value存入redis
     */
	def set(byte[] key, byte[] value) {
		try {
			jedis.set(key, value)
			return value
		} finally {
			jedis.close
		}
	}
	
	/**
	 *  将指定的key设置过期时间
	 */
	def expire(byte[] key, int i) {
		try {
			jedis.expire(key,i)
		} finally {
			jedis.close
		}
	}
	
	/**
	 *  获取指定key的值
	 */
	def get(byte[] key) {
		try {
			var result = jedis.get(key)
			return result
		} finally {
			jedis.close
		}
	}
	
	/**
	 *  通过指定key删除
	 */
	def del(byte[] key) {
		try {
			jedis.del(key)
		} finally {
			jedis.close
		}
	}
	
	/**
	 *  查询指定的所有key
	 */
	def keys(String S) {
		try {
			return jedis.keys((S+"*").bytes)
		} finally {
			jedis.close
		}
	}

}
