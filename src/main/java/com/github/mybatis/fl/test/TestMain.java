package com.usf.order.util;

import com.github.mybatis.fl.entity.BasisInfo;
import com.github.mybatis.fl.util.EntityInfoUtil;
import com.github.mybatis.fl.util.Generator;
import com.github.mybatis.fl.util.MySqlToJavaUtil;

import java.sql.SQLException;
import java.util.Date;


/**
 * 自动生成工具
 *
 * @author zxf
 * @create 2019-09-25 14:12
 */
class MyGenerator {
    // 基础信息：项目名、作者、版本
    public static final String PROJECT = "order-service";
    public static final String AUTHOR = "zxf";
    public static final String VERSION = "V1.0";
    // 数据库连接信息：连接URL、用户名、秘密、数据库名
    public static final String URL = "jdbc:mysql://localhost:3306/platform?useUnicode=true&characterEncoding=utf-8&autoReconnect=true&failOverReadOnly=false&useSSL=true&serverTimezone=UTC";
    public static final String NAME = "root";
    public static final String PASS = "123456";
    public static final String DATABASE = "platform";
    // 类信息：类名、对象名（一般是【类】的首字母小些）、类说明、时间
    public static final String CLASSNAME = "Sales";
    public static final String TABLE = "usf_sales";
    public static final String CLASSCOMMENT = "订单";
    public static final String TIME = "2019年9月25日";
    public static final String AGILE = new Date().getTime()+ "";
    // 路径信息，分开路径方便聚合工程项目，微服务项目
    public static final String ENTITY_URL = "com.buybit.wm.entity";
    public static final String DAO_URL = "com.buybit.wm.dao";
    public static final String XML_URL = "com.buybit.wm.dao.impl";
    public static final String SERVICE_URL = "com.buybit.wm.service";
    public static final String SERVICE_IMPL_URL = "com.buybit.wm.service.impl";
    public static final String CONTROLLER_URL = "com.buybit.wm.web";

    public static void main(String[] args) {
        BasisInfo bi = new BasisInfo(PROJECT, AUTHOR, VERSION, URL, NAME, PASS, DATABASE, TIME, AGILE, ENTITY_URL,
                DAO_URL, XML_URL, SERVICE_URL, SERVICE_IMPL_URL, CONTROLLER_URL);
        bi.setTable(TABLE);
        bi.setEntityName(MySqlToJavaUtil.getClassName(TABLE));
        bi.setObjectName(MySqlToJavaUtil.changeToJavaFiled(TABLE));
        bi.setEntityComment(CLASSCOMMENT);
        try {
            bi = EntityInfoUtil.getInfo(bi);
            String fileUrl = "M:\\IDEA-workspace\\usf-shop\\e-order\\order-service\\src\\main\\java\\";// 生成文件存放位置
            String aa1 = Generator.createEntity(fileUrl, bi).toString();

            String aa2 = Generator.createDao(fileUrl, bi).toString();
            String aa3 = Generator.createDaoImpl(fileUrl, bi).toString();
            String aa4 = Generator.createService(fileUrl, bi).toString();
            String aa5 = Generator.createServiceImpl(fileUrl, bi).toString();
            String aa6 = Generator.createController(fileUrl, bi).toString();

            // 是否创建swagger配置文件
            // String aa7 = Generator.createSwaggerConfig(fileUrl, bi).toString();

            System.out.println(aa1);
            System.out.println(aa2);
            System.out.println(aa3);
            System.out.println(aa4);
            System.out.println(aa5);
            System.out.println(aa6);

            //System.out.println(aa7);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
