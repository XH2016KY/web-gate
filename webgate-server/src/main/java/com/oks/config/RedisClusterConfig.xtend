package com.oks.config

import com.oks.utils.DESUutil
import redis.clients.jedis.JedisCluster
import org.springframework.beans.factory.annotation.Value
import java.util.HashSet
import redis.clients.jedis.HostAndPort
import org.springframework.context.annotation.Bean
import redis.clients.jedis.JedisPoolConfig
import org.springframework.context.annotation.Configuration
import redis.clients.jedis.Jedis

@Configuration
class RedisClusterConfig {
	
	@Value("${redis-node1}")
	String redisNode1;
	
	@Value("${redis-node2}")
	String redisNode2;
	
	@Value("${redis-port1}")
    String port1;
	
	@Value("${redis-port2}")
	String port2;
	
	@Value("${redis-port3}")
	String port3;
	
	@Bean
    def jedisPoolConfig() {
		var jedisPoolConfig = new JedisPoolConfig();
		jedisPoolConfig.maxIdle=1000
		jedisPoolConfig;
		
	}
	
	@Bean
	def JedisCluster jedisCluster() {
		
		var set= new HashSet
		var r1 = new HostAndPort(DESUutil.getDecryptString(redisNode1), Integer.parseInt(DESUutil.getDecryptString(port1)))
		var r2 = new HostAndPort(DESUutil.getDecryptString(redisNode1), Integer.parseInt(DESUutil.getDecryptString(port2)))
		var r3 = new HostAndPort(DESUutil.getDecryptString(redisNode1), Integer.parseInt(DESUutil.getDecryptString(port3)))
		var r4 = new HostAndPort(DESUutil.getDecryptString(redisNode2), Integer.parseInt(DESUutil.getDecryptString(port1)))
		var r5 = new HostAndPort(DESUutil.getDecryptString(redisNode2), Integer.parseInt(DESUutil.getDecryptString(port2)))
		var r6 = new HostAndPort(DESUutil.getDecryptString(redisNode2), Integer.parseInt(DESUutil.getDecryptString(port3)))
		set.add(r1)
		set.add(r2)
		set.add(r3)
		set.add(r4)
		set.add(r5)
		set.add(r6)
		var j = jedisPoolConfig();
		new JedisCluster(set, j);
		
	}
	
	@Bean
	def Jedis jedis() {
		var jedis = new Jedis("192.168.200.134",6300)
		jedis
	}
	
}