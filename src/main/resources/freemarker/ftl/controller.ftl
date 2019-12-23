package ${controllerUrl};

import javax.annotation.Resource;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.*;

import ${entityUrl}.${entityName};
import ${voUrl}.${entityName}VO;
import ${serviceUrl}.${entityName}Service;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import com.base.common.utils.json.SingleResult;
import com.alibaba.fastjson.JSONObject;
import com.base.common.pagination.Page;
import com.base.common.utils.DateUtils;

/**
 * ${entityComment}接口层
 *
 * @author	${author}
 * @create	${createTime}
 */
@Api(tags = {"${entityName}Controller"})
@RestController
@Slf4j
public class ${entityName}Controller {

	@Resource
	private ${entityName}Service ${objectName}Service;


	@PostMapping("/${objectName}")
	@ApiOperation(value = "新增或者修改${entityComment}", notes = "添加不需要传id，修改需要传id")
	public String saveOrUpdate(@RequestBody ${entityName} ${objectName}){
		try {
			this.${objectName}Service.saveOrUpdate(${objectName});
			return JSONObject.toJSONString(SingleResult.createSuccessResult());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return JSONObject.toJSONString(SingleResult.createFailedResult(e.getMessage()));
		}
	}


	@PutMapping("/${objectName}/status")
	@ApiOperation(value = "修改状态", notes = "状态: 0停用, 1启用, 2回收, 8冻结, 9违规停用")
	@ApiImplicitParams({
			@ApiImplicitParam(name = "id", value = "id", dataType = "Long"),
			@ApiImplicitParam(name = "status", value = "状态", dataType = "Byte")})
	public String update${entityName}Status(
			@RequestParam(value = "id", required = false) Long id,
			@RequestParam(value = "status", required = false) Byte status) {
		try {
			${entityName} ${objectName} = ${entityName}.builder().id(id).status(status).updateTime(DateUtils.getCurrentDateTime()).build();
			this.${objectName}Service.update${entityName}Status(${objectName});
			return JSONObject.toJSONString(SingleResult.createSuccessResult());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return JSONObject.toJSONString(SingleResult.createFailedResult(e.getMessage()));
		}
	}


	@GetMapping("/${objectName}/{id}")
	@ApiOperation(value = "根据id获取${entityComment}", notes = "返回[${objectName}]")
	@ApiImplicitParam(name = "id", value = "${entityComment}id", required = true, dataType = "${idType}")
	public String get${entityName}ById(@PathVariable("id") ${idType} id){
		try {
			${entityName} result=this.${objectName}Service.get${entityName}ById(id);
			return JSONObject.toJSONString(SingleResult.builder().data(result).build());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return JSONObject.toJSONString(SingleResult.createFailedResult(e.getMessage()));
		}
	}


	@GetMapping("/${objectName}")
	@ApiOperation(value = "分页查询${entityComment}列表", notes = "返回对象[PageInfo<${entityName}>]")
	@ApiImplicitParams({
        	@ApiImplicitParam(name = "page", value = "当前页", dataType = "int"),
        	@ApiImplicitParam(name = "rows", value = "页行数", dataType = "int"),
			@ApiImplicitParam(name = "sort", value = "排序规则", dataType = "String"),
			@ApiImplicitParam(name = "order", value = "排序名称", dataType = "String")
    })
	public String find${entityName}BySearch(
			@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "rows", required = false) Integer rows,
			@RequestParam(value = "sort", required = false) String sort,
			@RequestParam(value = "order", required = false) String order){
		try {
			${entityName}VO vo = ${entityName}VO.builder().build();
			vo.setOrderBy(sort, order);
			vo.gotoPagination(page, rows);
			Page<${entityName}> result = this.${objectName}Service.find${entityName}BySearch(vo);
			return JSONObject.toJSONString(SingleResult.builder().data(result).build());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return JSONObject.toJSONString(SingleResult.createFailedResult(e.getMessage()));
		}
	}


}