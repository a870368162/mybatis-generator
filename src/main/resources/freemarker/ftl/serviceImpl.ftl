package ${serviceImplUrl};

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import ${entityUrl}.${entityName};
import ${voUrl}.${entityName}VO;
import ${daoUrl}.${entityName}Mapper;
import ${serviceUrl}.${entityName}Service;
import com.base.common.utils.NumberUtils;
import com.base.common.utils.StringUtils;
import org.springframework.util.Assert;
import com.base.common.utils.AssertUtils;
import com.base.common.utils.DateUtils;
import com.usf.common.feign.SerialClient;
import com.base.common.mybatis.MyBatisCriteria;
import com.base.common.mybatis.MyBatisCriteria.Criteria;
import com.base.common.pagination.Page;
import com.base.common.exceptions.ApplicationException;
import org.springframework.util.Assert;
import java.util.List;

/**
 * ${entityComment}——SERVICEIMPL层
 *
 * @author	${author}
 * @create	${createTime}
 */
@Service
public class ${entityName}ServiceImpl implements ${entityName}Service {

	@Resource
	private ${entityName}Mapper ${objectName}Mapper;

	@Resource
	private SerialClient serialClient;

	@Override
	public Long saveOrUpdate(${entityName} ${objectName}) {
		Assert.notNull(${objectName}, "${entityComment}对象不能为空");
		try {
			if(NumberUtils.isEmpty(${objectName}.getId())){
				${objectName}.setId(serialClient.getGlobalSerial());
				this.insert${entityName}(${objectName});
			}else{
				this.update${entityName}(${objectName});
			}
			return ${objectName}.getId();
		} catch (Exception e) {
			throw new ApplicationException(e);
		}
	}

	@Override
	public Long insert${entityName}(${entityName} ${objectName}) {
		try {
			${objectName}.insertIsEmpty();
			${objectName}.create();
			this.${objectName}Mapper.insertSelective(${objectName});
			return ${objectName}.getId();
		} catch (Exception e) {
			throw new ApplicationException(e);
		}
	}

	@Override
	public Long update${entityName}(${entityName} ${objectName}) {
		AssertUtils.isEmpty(${objectName}.getId(), "${entityComment}id不能为空");
		try {
			${entityName} record = this.${objectName}Mapper.selectByPrimaryKey(${objectName}.getId());
			Assert.notNull(record,"售后的类型信息对象不存在，无法修改");
			${objectName}.setUpdateTime(DateUtils.getCurrentDateTime());
			this.${objectName}Mapper.updateByPrimaryKeySelective(${objectName});
			return ${objectName}.getId();
		} catch (Exception e) {
			throw new ApplicationException(e);
		}
	}

	@Override
	public Long update${entityName}Status(${entityName} ${objectName}) {
		AssertUtils.isEmpty(${objectName}.getId(), "id不能为空");
		AssertUtils.isEmpty(${objectName}.getStatus(), "状态不能为空");
		try {
			${entityName} record = this.${objectName}Mapper.selectByPrimaryKey(${objectName}.getId());
			Assert.notNull(record, "对象不存在无法修改");
			this.${objectName}Mapper.updateByPrimaryKeySelective(${objectName});
			return record.getId();
		} catch (Exception e) {
			throw new ApplicationException(e);
		}
	}

	@Override
	public Long delete${entityName}ById(${idType} id) {
		AssertUtils.isEmpty(id, "${entityComment}id不能为空");
		try {
			this.${objectName}Mapper.deleteByPrimaryKey(id);
			return id;
		} catch (Exception e) {
			throw new ApplicationException(e);
		}
	}

	@Override
	public ${entityName} get${entityName}ById(${idType} id) {
		AssertUtils.isEmpty(id, "${entityComment}id不能为空");
		try {
			return ${objectName}Mapper.selectByPrimaryKey(id);
		} catch (Exception e) {
			throw new ApplicationException(e);
		}
	}

	@Override
	public List<${entityName}> find${entityName}BySearch(${entityName}VO vo) {
		MyBatisCriteria example = vo.queryBuilder();
		try {
			return this.${objectName}Mapper.selectByExample(example);
		} catch (Exception e) {
			throw new ApplicationException(e);
		}
	}

	@Override
	public Page<${entityName}> find${entityName}PageBySearch(${entityName}VO vo) {
		Page<${entityName}> result = new Page<>();
		MyBatisCriteria example = vo.queryBuilder();
		example.gotoPaging(vo.getPagination(), vo.getRows());
		try {
			long total = this.${objectName}Mapper.countByExample(example);
			if(total > 0){
				result.setRows(this.${objectName}Mapper.selectByExample(example));
			}
			result.setTotal(total);
			return result;
		} catch (Exception e) {
			throw new ApplicationException(e);
		}
	}

}