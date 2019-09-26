package ${controllerUrl};

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.*;

import ${entityUrl}.${entityName};
import ${serviceUrl}.${entityName}Service;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import com.base.common.utils.json.SingleResult;
import com.alibaba.fastjson.JSONObject;
import com.base.common.pagination.Page;

/**
 * ${entityComment}接口层
 *
 * @author	${author}
 * @create	${createTime}
 */
@Api(description = "${entityComment}",value="${entityComment}" )
@RestController
@Slf4j
public class ${entityName}Controller {
	
	@Autowired
	private ${entityName}Service ${objectName}Service;


	@GetMapping("/${entityName}/{id}")
	@ApiOperation(value = "获取${entityComment}信息", notes = "获取${entityComment}信息[${objectName}]")
	@ApiImplicitParam(name = "id", value = "${entityComment}id", required = true, dataType = "${idType}")
	public String get${entityName}ById(@PathVariable("id")${idType} id){
		try {
			${entityName} result=this.${objectName}Service.get${entityName}ById(id);
			return JSONObject.toJSONString(SingleResult.builder().data(result).build());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return JSONObject.toJSONString(SingleResult.createFailedResult(e.getMessage()));
		}
	}


	@PostMapping("/${entityName}")
	@ApiOperation(value = "添加或者修改${entityComment}", notes = "添加不需要传id，修改需要传id")
	public String saveOrUpdate(@RequestBody ${entityName} ${objectName}){
		try {
			this.${objectName}Service.saveOrUpdate(${objectName});
			return JSONObject.toJSONString(SingleResult.createSuccessResult());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return JSONObject.toJSONString(SingleResult.createFailedResult(e.getMessage()));
		}
	}


	@GetMapping("/${entityName}")
	@ApiOperation(value = "分页查询", notes = "分页查询返回对象[PageInfo<${entityName}>]")
	@ApiImplicitParams({
        @ApiImplicitParam(name = "page", value = "当前页", dataType = "int"),
        @ApiImplicitParam(name = "rows", value = "页行数", dataType = "int"),
		@ApiImplicitParam(name = "sort", value = "排序规则", dataType = "String"),
		@ApiImplicitParam(name = "order", value = "排序名称", dataType = "String")
    })
	public String get${entityName}BySearch(
			@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "rows", required = false) Integer rows,
			@RequestParam(value = "sort", required = false) String sort,
			@RequestParam(value = "order", required = false) String order){
		try {
			${entityName}VO vo = OrderVO.builder().build();
			vo.setOrderBy(sort, order);
			vo.gotoPagination(page, rows);
			Page<${entityName}> result = this.${objectName}Service.get${entityName}BySearch(vo);
			return JSONObject.toJSONString(SingleResult.builder().data(result).build());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return JSONObject.toJSONString(SingleResult.createFailedResult(e.getMessage()));
		}
	}


}