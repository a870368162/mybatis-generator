package com.github.mybatis.fl.util;

import com.github.mybatis.fl.entity.BasisInfo;
import com.github.mybatis.fl.entity.JsonResult;
import com.github.mybatis.fl.entity.PropertyInfo;

import java.util.List;

/**
 * Copyright: Copyright (c) 2019
 *
 * <p>说明：  获取文件路径调用创建文件</P>
 *
 * @author zxf
 * <p>
 * Modification History:
 * Date         	Author          Version          Description
 * ---------------------------------------------------------------*
 * 2019年9月25日      		zxf   v2.1.0           initialize
 * @version v2.1.0
 */
public class Generator {
    //路径信息
    public static final String MODEL = "model";
    public static final String MAPPER = "mapper";
    public static final String MAPPER_IMPL = "mapperImpl";
    public static final String SERVICE = "service";
    public static final String SERVICE_IMPL = "serviceImpl";
    public static final String CONTROLLER = "controller";
    public static final String SWAGGER_CONFIG = "swaggerConfig";
    public static final String VO = "vo";


    //①创建实体类
    public static JsonResult createEntity(String url, BasisInfo bi) {
        String fileUrl = getGeneratorFileUrl(url, bi.getEntityUrl(), bi.getEntityName(), MODEL);
        return FreemarkerUtil.createFile(bi, "entity.ftl", fileUrl);
    }

    //②创建DAO
    public static JsonResult createDao(String url, BasisInfo bi) {
        String fileUrl = getGeneratorFileUrl(url, bi.getDaoUrl(), bi.getEntityName(), MAPPER);
        return FreemarkerUtil.createFile(bi, "dao.ftl", fileUrl);
    }

    //③创建mapper配置文件
    public static JsonResult createDaoImpl(String url, BasisInfo bi) {
        String fileUrl = getGeneratorFileUrl(url, bi.getMapperUrl(), bi.getEntityName(), MAPPER_IMPL);
        List<PropertyInfo> list = bi.getCis();
        String agile = "";
        for (PropertyInfo propertyInfo : list) {
            agile = agile + propertyInfo.getColumn() + ", ";
        }
        agile = agile.substring(0, agile.length() - 2);
        bi.setAgile(agile);
        return FreemarkerUtil.createFile(bi, "mapper.ftl", fileUrl);
    }

    //④创建SERVICE
    public static JsonResult createService(String url, BasisInfo bi) {
        String fileUrl = getGeneratorFileUrl(url, bi.getServiceUrl(), bi.getEntityName(), SERVICE);
        return FreemarkerUtil.createFile(bi, "service.ftl", fileUrl);
    }

    //⑤创建SERVICE_IMPL
    public static JsonResult createServiceImpl(String url, BasisInfo bi) {
        String fileUrl = getGeneratorFileUrl(url, bi.getServiceImplUrl(), bi.getEntityName(), SERVICE_IMPL);
        return FreemarkerUtil.createFile(bi, "serviceImpl.ftl", fileUrl);
    }

    //⑥创建CONTROLLER
    public static JsonResult createController(String url, BasisInfo bi) {
        String fileUrl = getGeneratorFileUrl(url, bi.getControllerUrl(), bi.getEntityName(), CONTROLLER);
        return FreemarkerUtil.createFile(bi, "controller.ftl", fileUrl);
    }

    //⑥创建vo
    public static JsonResult createVo(String url, BasisInfo bi) {
        String fileUrl = getGeneratorFileUrl(url, bi.getVoUrl(), bi.getEntityName(), VO);
        return FreemarkerUtil.createFile(bi, "vo.ftl", fileUrl);
    }

    //⑧创建CONTROLLER
    public static JsonResult createSwaggerConfig(String url, BasisInfo bi) {
        String fileUrl = getGeneratorFileUrl(url, bi.getSwaggerConfigUrl(), "Swagger", SWAGGER_CONFIG);
        return FreemarkerUtil.createFile(bi, "SwaggerConfig.ftl", fileUrl);
    }

    //生成文件
    public static String getGeneratorFileUrl(String url, String packageUrl, String entityName, String type) {
        if (type.equals("model")) {
            return url + pageToUrl(packageUrl) + entityName + ".java";
        } else if (type.equals("mapper")) {
            return url + pageToUrl(packageUrl) + entityName + "Mapper.java";
        } else if (type.equals("mapperImpl")) {
            return url + pageToUrl(packageUrl) + entityName + "Mapper.xml";
        } else if (type.equals("service")) {
            return url + pageToUrl(packageUrl) + entityName + "Service.java";
        } else if (type.equals("serviceImpl")) {
            return url + pageToUrl(packageUrl) + entityName + "ServiceImpl.java";
        } else if (type.equals("controller")) {
            return url + pageToUrl(packageUrl) + entityName + "Controller.java";
        }else if(type.equals("vo")){
            return url + pageToUrl(packageUrl) + entityName + "VO.java";
        }
        return null;
    }

    public static String pageToUrl(String url) {
        return url.replace(".", "/") + "/";
    }
}
