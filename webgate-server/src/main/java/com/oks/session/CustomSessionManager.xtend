package com.oks.session

import org.apache.shiro.session.UnknownSessionException
import org.apache.shiro.session.mgt.SessionKey
import org.apache.shiro.web.session.mgt.DefaultWebSessionManager
import javax.servlet.ServletRequest
import org.apache.shiro.web.session.mgt.WebSessionKey
import org.apache.shiro.session.Session

class CustomSessionManager extends DefaultWebSessionManager{
	
	override protected retrieveSession(SessionKey sessionKey) throws UnknownSessionException {
		 var sessionId = getSessionId(sessionKey)
	     var ServletRequest request = null
	     if(sessionKey instanceof WebSessionKey){
	     	request = (sessionKey as WebSessionKey).servletRequest
	     }
	     if(request !==null && sessionId !==null){
	     	var session = (request.getAttribute(sessionId.toString)) as Session
	     	if(session !== null){
	     		return session
	     	}
	     }
		var session = super.retrieveSession(sessionKey)
		if(request !== null && sessionId !== null){
			request.setAttribute(sessionId.toString,session)
		}
		session
	}
	
}