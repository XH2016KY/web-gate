package com.oks.mapper

import com.oks.annotation.Slave
import com.oks.pojo.Role
import org.apache.ibatis.annotations.Mapper
import org.apache.ibatis.annotations.Param
import org.apache.ibatis.annotations.Result
import org.apache.ibatis.annotations.Results
import org.apache.ibatis.annotations.Select
import com.oks.constant.IORMConstant

@Mapper
interface IRoleMapper {
	
	
	@Slave
	@Select(value=" select * from tb_role where role_name = #{name}")
	@Results(id="base",
		value = #[@Result(column=IORMConstant.IRoleConstant.COLUMN_ROLE_ID,
			property=IORMConstant.IRoleConstant.PROPERTY_ROLE_ID
			),
			@Result(column=IORMConstant.IRoleConstant.COLUMN_ROLE_NAME,
				property=IORMConstant.IRoleConstant.PROPERTY_ROLE_NAME
			),
			@Result(column=IORMConstant.IRoleConstant.COLUMN_ROLE_CREATE_TIME,
				property=IORMConstant.IRoleConstant.PROPERTY_ROLE_CREATE_TIME
			),
			@Result(column=IORMConstant.IRoleConstant.COLUMN_ROLE_UPDATE_TIME,
				property=IORMConstant.IRoleConstant.PROPERTY_ROLE_UPDATE_TIME
			)
		]
	)
	def Role findByName(@Param("name")String name)
	
}