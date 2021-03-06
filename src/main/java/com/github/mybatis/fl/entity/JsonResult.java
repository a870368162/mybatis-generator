package com.github.mybatis.fl.entity;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Copyright: Copyright (c) 2019
 *
 * <p>说明： 返回结果json对象</P>
 *
 * @author zxf
 * <p>
 * Modification History:
 * Date         	Author          Version          Description
 * ---------------------------------------------------------------*
 * 2019年9月25日      		zxf   v2.1.0           initialize
 * @version v2.1.0
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
public class JsonResult implements Serializable {

    private static final long serialVersionUID = 123126L;

    private Integer code;

    private String message;

    private Object data;
}
