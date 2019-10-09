package com.github.mybatis.fl.convert;

/**
 * Copyright: Copyright (c) 2019
 *
 * <p>说明：MYSQL 数据库字段类型转换</p>
 *
 * @author zxf
 * <p>
 * Modification History:
 * Date         		Author        Version          Description
 * ---------------------------------------------------------------*
 * 2019年9月25日      		zxf    v2.0.1           initialize
 * @version v1.0.0
 */
public class MySqlTypeConvert implements ITypeConvert {

    @Override
    public IColumnType processTypeConvert(DateType dateType, String fieldType) {
        String t = fieldType.toLowerCase();
        if (t.contains("char")) {
            return DbColumnType.STRING;
        } else if (t.contains("bigint")) {
            return DbColumnType.LONG;
        } else if (t.contains("tinyint(1)")) {
            return DbColumnType.BOOLEAN;
        } else if (t.contains("int")) {
            return DbColumnType.INTEGER;
        } else if (t.contains("text")) {
            return DbColumnType.STRING;
        } else if (t.contains("bit")) {
            return DbColumnType.BOOLEAN;
        } else if (t.contains("decimal")) {
            return DbColumnType.BIG_DECIMAL;
        } else if (t.contains("clob")) {
            return DbColumnType.CLOB;
        } else if (t.contains("blob")) {
            return DbColumnType.BLOB;
        } else if (t.contains("binary")) {
            return DbColumnType.BYTE_ARRAY;
        } else if (t.contains("float")) {
            return DbColumnType.FLOAT;
        } else if (t.contains("double")) {
            return DbColumnType.DOUBLE;
        } else if (t.contains("json") || t.contains("enum")) {
            return DbColumnType.STRING;
        } else if (t.contains("date") || t.contains("time") || t.contains("year")) {
            switch (dateType) {
                case ONLY_DATE:
                    return DbColumnType.DATE;
                case SQL_PACK:
                    if ("date".equals(t)) {
                        return DbColumnType.DATE_SQL;
                    } else if ("time".equals(t)) {
                        return DbColumnType.TIME;
                    } else if ("year".equals(t)) {
                        return DbColumnType.DATE_SQL;
                    }
                    return DbColumnType.TIMESTAMP;
                case TIME_PACK:
                    if ("date".equals(t)) {
                        return DbColumnType.LOCAL_DATE;
                    } else if ("time".equals(t)) {
                        return DbColumnType.LOCAL_TIME;
                    } else if ("year".equals(t)) {
                        return DbColumnType.YEAR;
                    }
                    return DbColumnType.LOCAL_DATE_TIME;
            }
        }
        return DbColumnType.STRING;
    }
}
