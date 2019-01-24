package com.oks.cache;

import java.io.Serializable;
import java.util.Collection;
import java.util.Set;

import org.apache.commons.lang3.SerializationUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import redis.clients.jedis.JedisCluster;

@Component
public class RedisCache<K,V> implements Cache<K,V>{

	private static Logger log = LogManager.getLogger(RedisCache.class);
	
	@Autowired
	private JedisCluster jedisCluster;
	
	private static String OKS_CACHE = "oks-cache:";
	
	
	private byte[] getKey(K k) {
		if(k instanceof String){
			return (OKS_CACHE+k).getBytes();
		}
		return SerializationUtils.serialize((Serializable) k);
	}

	@Override
	public void clear() throws CacheException {
		
	}

	@Override
	public V get(K k) throws CacheException {
		log.info("从redis中获取权限数据");
		byte[] value = jedisCluster.get(getKey(k));
		if(value != null) {
			return SerializationUtils.deserialize(value);
		}
		return null;
	}

	@Override
	public Set<K> keys() {
		return null;
	}

	@Override
	public V put(K k, V v) throws CacheException {
		byte[] key = getKey(k);
		byte[] value = SerializationUtils.serialize((Serializable) v);
		jedisCluster.set(key, value);
		jedisCluster.expire(key, 600);
		return v;
	}

	@SuppressWarnings("unchecked")
	@Override
	public V remove(K k) throws CacheException {
		byte [] key = getKey(k); 
		byte [] value = jedisCluster.get(key);
		jedisCluster.del(key);
		if(value!=null) {
			return (V)SerializationUtils.deserialize(value);
		}
		return null;
	}

	@Override
	public int size() {
		return 0;
	}

	@Override
	public Collection<V> values() {
		return null;
	}
}
