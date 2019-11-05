<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${daoUrl}.${entityName}Mapper">
	<resultMap id="BaseResultMap" type="${entityUrl}.${entityName}">
	<#list cis as ci>
	<#if ci.column=="id">
	  <id column="id" property="id" jdbcType="BIGINT" />
	</#if>
	<#if ci.column!="id">
	  <result column="${ci.column}" property="${ci.property}" jdbcType="${ci.jdbcType?upper_case}" />
	</#if>
	</#list>
	</resultMap>
	<sql id="Base_Column_List">
	${agile}
	</sql>

	<sql id="Example_Where_Clause">
		<where>
			<foreach collection="oredCriteria" item="criteria"
					 separator="or">
				<if test="criteria.valid">
					<trim prefix="(" suffix=")" prefixOverrides="and">
						<foreach collection="criteria.criteria" item="criterion">
							<choose>
								<when test="criterion.noValue">
									and ${r'${criterion.condition}'}
								</when>
								<when test="criterion.singleValue">
									and ${r'${criterion.condition}'} ${r'#{criterion.value}'}
								</when>
								<when test="criterion.betweenValue">
									and ${r'${criterion.condition}'} ${r'#{criterion.value}'}
									and
									${r'#{criterion.secondValue}'}
								</when>
								<when test="criterion.listValue">
									and ${r'${criterion.condition}'}
									<foreach collection="criterion.value" item="listItem"
											 open="(" close=")" separator=",">
										${r'#{listItem}'}
									</foreach>
								</when>
							</choose>
						</foreach>
					</trim>
				</if>
			</foreach>
		</where>
	</sql>

	<select id="countByExample"
			parameterType="com.base.common.mybatis.MyBatisCriteria"
			resultType="java.lang.Long">
		select count(*) from ${table}
		<if test="_parameter != null">
			<include refid="Example_Where_Clause" />
		</if>
	</select>

	<select id="selectByExample" resultMap="BaseResultMap"
			parameterType="java.lang.${idType}">
		select
		<if test="distinct">
			distinct
		</if>
		'true' as QUERYID,
		<include refid="Base_Column_List" />
		from ${table}
		<if test="_parameter != null">
			<include refid="Example_Where_Clause" />
		</if>
		<if test="orderByClause != null">
			order by ${r'${orderByClause}'}
		</if>
		<if test="skip!=null and rows!=null">
			limit ${r'#{skip}'},${r'#{rows}'}
		</if>
	</select>

	<select id="selectByPrimaryKey" parameterType="java.lang.${idType}"
		resultMap="BaseResultMap">
		select
		<include refid="Base_Column_List" />
		from ${table}
		where id = ${r'#{'}id,jdbcType=${idJdbcType?upper_case}}
	</select>

	<delete id="deleteByPrimaryKey" parameterType="java.lang.${idType}">
		delete from ${table}
		where id = ${r'#{'}id,jdbcType=${idJdbcType?upper_case}}
	</delete>

	<insert id="insertSelective" parameterType="${entityUrl}.${entityName}">
		insert into ${table}
		<trim prefix="(" suffix=")" suffixOverrides=",">
			<#list cis as ci>
			<if test="${ci.property} != null">
				${ci.column},
			</if>
			</#list>
		</trim>
		<trim prefix="values (" suffix=")" suffixOverrides=",">
			<#list cis as ci>
			<if test="${ci.property} != null">
				${r'#{'}${ci.property},jdbcType=${ci.jdbcType?upper_case}},
			</if>
			</#list>
		</trim>
	</insert>

	<update id="updateByPrimaryKeySelective" parameterType="${entityUrl}.${entityName}">
		update ${table}
		<set>
			<#list cis as ci>
			<#if ci.property!="id">
			<if test="${ci.property} != null">
				${ci.column} = ${r'#{'}${ci.property},jdbcType=${ci.jdbcType?upper_case}},
			</if>
			</#if>
			</#list>
		</set>
		where id = ${r'#{'}id,jdbcType=${idJdbcType?upper_case}}
	</update>

</mapper>