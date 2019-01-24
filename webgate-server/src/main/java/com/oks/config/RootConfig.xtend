package com.oks.config

import com.oks.dao.DaoConfig
import org.springframework.context.annotation.ComponentScan
import org.springframework.context.annotation.ComponentScan.Filter
import org.springframework.context.annotation.EnableAspectJAutoProxy
import org.springframework.context.annotation.FilterType
import org.springframework.context.annotation.Import
import org.springframework.stereotype.Component
import org.springframework.stereotype.Service
import org.aspectj.lang.annotation.Aspect

@ComponentScan(value = "com.oks.*",includeFilters = #[
		@Filter(type=FilterType.ANNOTATION,classes= #[
				Service,Component,Aspect])
])
@EnableAspectJAutoProxy
@Import(#[DaoConfig,RedisClusterConfig])
class RootConfig {
	
	
}