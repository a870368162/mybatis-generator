package com.github.mybatis.fl.entity;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Copyright: Copyright (c) 2019 
 *
 * <p>说明： 获取到数据库的信息</P>
 * @version v2.1.0
 * @author zxf
 *
 * Modification History:
 * Date         	Author          Version          Description
 *---------------------------------------------------------------*
 * 2019年9月25日      		zxf   v2.1.0           initialize
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class PropertyInfo implements Serializable {

    private static final long serialVersionUID = 123124L;

    private String column;

    private String jdbcType;

    private String comment;

    private String property;

    private String javaType;
}
