package com.oks.dao.split

import org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource

class DynamicDataSource extends AbstractRoutingDataSource{
	
	override protected determineCurrentLookupKey() {
		DynamicDataSourceHolder.dbType
	}
	
}