package com.oks.session

import org.apache.shiro.session.mgt.eis.AbstractSessionDAO
import org.apache.shiro.session.Session
import java.io.Serializable
import org.apache.shiro.session.UnknownSessionException
import org.springframework.beans.factory.annotation.Autowired
import org.apache.commons.lang3.SerializationUtils
import java.util.HashSet
import org.apache.commons.collections.CollectionUtils
import org.apache.logging.log4j.LogManager
import org.apache.logging.log4j.Logger

class RedisSessionDao extends AbstractSessionDAO {
	
	
    val static Logger log = LogManager.getLogger(RedisSessionDao)

	@Autowired
	JedisUtil jedisUtil

	val String SHIRO_SESSION_PREFIX = "osk-session"

	def getKey(String key) {
		(SHIRO_SESSION_PREFIX + key).bytes
	}

	/**
	 *  保存session
	 */
	def saveSession(Session session) {
		if (session !== null && session.id !== null) {
			var key = getKey(session.id.toString)
			var value = SerializationUtils.serialize(session as Serializable)
			jedisUtil.set(key, value)
			jedisUtil.expire(key, 600 * 3)
		}
	}

	override protected doCreate(Session session) {
		var sessionId = generateSessionId(session)
        assignSessionId(session,sessionId)
		saveSession(session)
		sessionId
	}

	override protected doReadSession(Serializable sessionId) {
		log.info("访问Reids---Session")
		if (sessionId === null) {
			return null
		}
		var key = getKey(sessionId.toString)
		var value = jedisUtil.get(key)
		// SerializationUtils.deserialize(value) as Session
		// TODO 处理绘会话过期
		if(value !== null){
			return SerializationUtils.deserialize(value) as Session
		}
		
	}

	override delete(Session session) {
		if (session === null || session.id === null) {
			return;
		}
		var key = getKey(session.id.toString)
		jedisUtil.del(key)
	}

	override getActiveSessions() {
		var keys = jedisUtil.keys(SHIRO_SESSION_PREFIX)
		var sessions = new HashSet
		if(CollectionUtils.isEmpty(keys)){
			return sessions
		}
		for (byte[] key : keys) {
			var session = SerializationUtils.deserialize(jedisUtil.get(key))as Session
			sessions.add(session)
		}
		sessions
	}

	override update(Session session) throws UnknownSessionException {
		saveSession(session)
	}

}
