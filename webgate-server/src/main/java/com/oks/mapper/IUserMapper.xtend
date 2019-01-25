package com.oks.mapper

import com.oks.annotation.Master
import com.oks.annotation.Slave
import com.oks.constant.IORMConstant
import com.oks.pojo.User
import com.oks.pojo.UserRolePermissionInfo
import java.util.List
import org.apache.ibatis.annotations.Mapper
import org.apache.ibatis.annotations.Param
import org.apache.ibatis.annotations.Result
import org.apache.ibatis.annotations.Results
import org.apache.ibatis.annotations.Select
import org.apache.ibatis.annotations.Update

@Mapper
interface IUserMapper {

	@Slave
	@Results(id="base", value=#[
		@Result(column=IORMConstant.IUserConstant.COLUMN_USER_ID, property=IORMConstant.IUserConstant.PROPERTY_USER_ID),
		@Result(column=IORMConstant.IUserConstant.COLUMN_USERNAME, property=IORMConstant.IUserConstant.
			PROPERTY_USERNAME),
		@Result(column=IORMConstant.IUserConstant.COLUMN__USER_MAIL, property=IORMConstant.IUserConstant.
			PROPERTY__USER_MAIL),
		@Result(column=IORMConstant.IUserConstant.COLUMN_PASSWORD, property=IORMConstant.IUserConstant.
			PROPERTY_PASSWORD),
		@Result(column=IORMConstant.IUserConstant.COLUMN_USER_AGE, property=IORMConstant.IUserConstant.
			PROPERTY_USER_AGE),
		@Result(column=IORMConstant.IUserConstant.COLUMN_USER_CREATE_TIME, property=IORMConstant.IUserConstant.
			PROPERTY_USER_CREATE_TIME),
		@Result(column=IORMConstant.IUserConstant.COLUMN_USER_UPDATE_TIME, property=IORMConstant.IUserConstant.
			PROPERTY_USER_UPDATE_TIME),
		@Result(column=IORMConstant.IUserConstant.COLUMN_USER_LOG_STATUS, property=IORMConstant.IUserConstant.
			PROPERTY_USER_LOG_STATUS),
		@Result(column=IORMConstant.IUserConstant.COLUMN_USER_STATUS, property=IORMConstant.IUserConstant.
			PROPERTY_USER_STATUS),
		@Result(column=IORMConstant.IUserConstant.COLUMN_USER_SEX, property=IORMConstant.IUserConstant.
			PROPERTY_USER_SEX),
		@Result(column=IORMConstant.IUserConstant.COLUMN_USER_PHONE, property=IORMConstant.IUserConstant.
			PROPERTY_USER_PHONE),
		@Result(column=IORMConstant.IUserConstant.COLUMN_USER_ADDRESS, property=IORMConstant.IUserConstant.
			PROPERTY_USER_ADDRESS),
		@Result(column=IORMConstant.IUserConstant.COLUMN_USER_LOG, property=IORMConstant.IUserConstant.
			PROPERTY_USER_LOG)
	])
	@Select(value="select * from tb_user where user_name = #{name}")
	def User findByName(@Param("name") String name)
    
	/** 
	 *  根据用户名 查询其拥有的权限
	 */
	@Slave
	@Select(value="
         select permission_name from tb_permission p
       LEFT JOIN tb_role_permission rp
          on p.permission_id = rp.permission_id            
             LEFT JOIN tb_user_role ur
                on rp.role_id = ur.role_id
                  LEFT JOIN tb_user u
                      on ur.user_id = u.user_id
              where u.user_name = #{userName};")
	@Deprecated
	def List<String> selectPermissionsByUserName(@Param("userName") String userName);

	/**
	 *  根据用户名 查询其拥有的角色
	 */
	@Slave
	@Select(value="
          select role_name from tb_role r
       LEFT JOIN tb_user_role ur
          on r.role_id = ur.role_id
              LEFT JOIN tb_user u
                 on ur.user_id = u.user_id
         where u.user_name = #{userName};

          ")
        @Deprecated
	def List<String> selectRolesByUserName(@Param("userName") String userName)
	
	/**
	 *  通过主体拿到凭证
	 */
	@Slave
	@Select(
		value = "select user_password from tb_user where user_name = #{principal}"
	)
	def String getResultByPrincipal(@Param("principal")String principal)
	
	
	/**
	 *  通过用户名拿到角色权限信息
	 */
	
	@Slave
	@Results(
		id="base_info",
	    value = #[
	    	@Result(column = "user_id",property="userId"),
	    	@Result(column = "role_info",property="roleInfo"),
	    	@Result(column = "permission_info",property="permissionInfo")
	    ]
	)
	@Select(value="
         select role_info,permission_info from tb_user_role_permission_info t1
                   LEFT JOIN tb_user t2
                          on t1.user_id = t2.user_id
                   where user_name = #{principal}
        ")
	def UserRolePermissionInfo getRolePermissionInfoByPrincipal(@Param("principal")String principal)
	
	@Slave
	@Select(
	"<script>"+
	"select permission_name from tb_permission where permission_id in"+
	"<foreach item=\"info\" index=\"index\" collection=\"list\"
		open=\"(\" separator=\",\" close=\")\">#{info}</foreach>"+
	"</script>"
         )
	def List<String> getPermissionsByInfo(@Param("list")List<Integer> info)
	
	
	@Master
	@Update(value="update tb_user set user_password = #{credentials} where user_name = #{principal}")
	def boolean updateCredentialsByPrincipal(@Param("credentials")String credentials,
		@Param("principal")String principal)
}
