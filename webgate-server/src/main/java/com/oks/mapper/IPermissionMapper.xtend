package com.oks.mapper

import com.oks.annotation.Slave
import com.oks.pojo.Permission
import org.apache.ibatis.annotations.Mapper
import org.apache.ibatis.annotations.Param
import org.apache.ibatis.annotations.Results
import org.apache.ibatis.annotations.Result
import com.oks.constant.IORMConstant
import org.apache.ibatis.annotations.Select

@Mapper
interface IPermissionMapper {
	
	@Slave
	@Results(
		id="base",
	    value = #[
	    	@Result(column=IORMConstant.IPermissionConstant.COLUMN_PERMISSION_ID,
	    		property=IORMConstant.IPermissionConstant.PROPERTY_PERMISSION_ID
	    	),
	    	@Result(column=IORMConstant.IPermissionConstant.COLUMN_PERMISSION_NAME,
	    		property=IORMConstant.IPermissionConstant.PROPERTY_PERMISSION_NAME
	    	),
	    	@Result(column=IORMConstant.IPermissionConstant.COLUMN_PERMISSION_CREATE_TIME,
	    		property=IORMConstant.IPermissionConstant.PROPERTY_PERMISSION_CREATE_TIME
	    	),
	    	@Result(column=IORMConstant.IPermissionConstant.COLUMN_PERMISSION_UPDATE_TIME,
	    		property=IORMConstant.IPermissionConstant.PROPERTY_PERMISSION_UPDATE_TIME
	    	)
	    	
	    ]
	)
	@Select("select * from tb_permission where permission_id = #{id}")
	def Permission findById(@Param("id")Integer id)
	
}