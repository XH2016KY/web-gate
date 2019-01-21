package com.oks.mapper

import com.oks.annotation.Slave
import com.oks.pojo.Role
import org.apache.ibatis.annotations.Mapper
import org.apache.ibatis.annotations.Param
import org.apache.ibatis.annotations.Result
import org.apache.ibatis.annotations.Results
import org.apache.ibatis.annotations.Select

@Mapper
interface IRoleMapper {
	
	
	@Slave
	@Select(value=" select * from tb_role where role_name = #{name}")
	@Results(id="base",
		value = #[@Result(column="role_id",property="roleId"),
			@Result(column="role_name",property="roleName"),
			@Result(column="role_create_time",property="createTime"),
			@Result(column="role_update_time",property="updateTime")
		]
	)
	def Role findByName(@Param("name")String name)
	
}