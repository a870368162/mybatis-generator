package ${entityUrl};

import java.io.Serializable;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;
import com.fasterxml.jackson.annotation.JsonFormat;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.Builder;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;
import com.base.common.utils.DateUtils;
import java.math.BigDecimal;
import com.alibaba.fastjson.annotation.JSONField;
import com.base.common.utils.AssertUtils;

/**
 * ${entityComment}实体类
 *
 * @author  ${author}
 * @create	${createTime}
 */
@ApiModel
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ${entityName} implements Serializable {

	private static final long serialVersionUID = ${agile}L;
	
<#list cis as ci>
	<#if ci.javaType=="Date">
	<#if ci.jdbcType=="date">
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = DateUtils.DATE_TIME_FORMAT, timezone = "GMT+8")
    @JSONField(format = DateUtils.DATE_TIME_FORMAT)
    <#elseif ci.jdbcType=="time">
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = DateUtils.DATE_TIME_FORMAT, timezone = "GMT+8")
    @JSONField(format = DateUtils.DATE_TIME_FORMAT)
	<#else>
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = DateUtils.DATE_TIME_FORMAT, timezone = "GMT+8")
    @JSONField(format = DateUtils.DATE_TIME_FORMAT)
	</#if>
	</#if>
	@ApiModelProperty("${ci.comment}")
	private ${ci.javaType} ${ci.property};

</#list>

    public void insertIsEmpty(){
<#list cis as ci>
    <#if ci.javaType=="Long">
        AssertUtils.isEmpty(${ci.property}, "${ci.comment}不能为空");
    </#if>
</#list>
    }

    public void create() {
        this.setCreateTime(DateUtils.getCurrentDateTime());
        this.setUpdateTime(DateUtils.getCurrentDateTime());
    }
}
	