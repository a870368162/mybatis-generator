package ${entityUrl};

import java.io.Serializable;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;
import com.fasterxml.jackson.annotation.JsonFormat;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.Builder;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;
import com.base.common.utils.DateUtils;
import java.math.BigDecimal;

/**
 * ${entityComment} 实体类
 *
 * @author  ${author}
 * @create	${createTime}
 */
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
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
	</#if>
	</#if>
	@ApiModelProperty(name = "${ci.property}" , value = "${ci.comment}")
	private ${ci.javaType} ${ci.property};

</#list>
    public void create() {
        this.setCreateTime(DateUtils.getCurrentDateTime());
        this.setUpdateTime(DateUtils.getCurrentDateTime());
    }
}
	