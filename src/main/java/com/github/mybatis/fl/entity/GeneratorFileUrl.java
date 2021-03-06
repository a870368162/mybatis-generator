package com.github.mybatis.fl.entity;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Copyright: Copyright (c) 2019
 *
 * <p>说明： 自动生成文件路径</P>
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
public class GeneratorFileUrl implements Serializable {
    private static final long serialVersionUID = 123125L;

    private String entityUrl;

    private String daoUrl;

    private String mapperUrl;

    private String serviceUrl;

    private String serviceImplUrl;

    private String controllerUrl;
}
