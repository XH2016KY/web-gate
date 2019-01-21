package com.oks.dao.split

import org.apache.logging.log4j.Logger
import org.apache.logging.log4j.LogManager

class DynamicDataSourceHolder {
	
	val static Logger log = LogManager.getLogger(DynamicDataSourceHolder)
	
	static ThreadLocal<String> contextHolder = new ThreadLocal<String>
	
	public val static DB_MASTER = "master"
	
	public val static DB_SLAVE = "slave"
	
	/**
	 *  获取线程的dbType
	 */
	def static getDbType() {
		var db = contextHolder.get();
		if(db===null){
			db =DB_MASTER
		}
		db
	}
	
	/**
	 *  设置线程的dbType
	 */
	def static setDbType(String str){
		log.info("所用数据源:{}",str)
		contextHolder.set(str)
	}
	
	/**
	 *  清理连接类型
	 */
	def static cleanDbtype(){
		contextHolder.remove
	}
}