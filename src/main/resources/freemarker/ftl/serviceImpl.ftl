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
		try {
			Assert.notNull(${objectName}, "${entityComment}对象不能为空");
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
			Assert.notNull(${objectName}, "${entityComment}对象不能为空");
			AssertUtils.isEmpty(${objectName}.getId(), "${entityComment}id不能为空");
			${objectName}.create();
			this.${objectName}Mapper.insertSelective(${objectName});
			return ${objectName}.getId();
		} catch (Exception e) {
			throw new ApplicationException(e);
		}
	}

	@Override
	public Long update${entityName}(${entityName} ${objectName}) {
		try {
			AssertUtils.isEmpty(${objectName}.getId(), "${entityComment}id不能为空");
			${entityName} record = this.${objectName}Mapper.selectByPrimaryKey(${objectName}.getId());
			if (record == null) {
				throw new ApplicationException("${entityComment}对象不存在，无法修改");
			}
			${objectName}.setUpdateTime(DateUtils.getCurrentDateTime());
			this.${objectName}Mapper.updateByPrimaryKeySelective(${objectName});
			return ${objectName}.getId();
		} catch (Exception e) {
			throw new ApplicationException(e);
		}
	}

	@Override
	public ${entityName} get${entityName}ById(${idType} id) {
		try {
			AssertUtils.isEmpty(id, "${entityComment}id不能为空");
			return ${objectName}Mapper.selectByPrimaryKey(id);
		} catch (Exception e) {
			throw new ApplicationException(e);
		}
	}

	@Override
	public Page<${entityName}> find${entityName}BySearch(${entityName}VO vo) {
		// TODO 需要补全条件
		try {
			Page<${entityName}> result = new Page<>();
			MyBatisCriteria example = new MyBatisCriteria();
			Criteria criteria = example.createCriteria();
			if (StringUtils.isNotEmpty(vo.getSort()) && StringUtils.isNotEmpty(vo.getOrder())) {
				example.setOrderByClause(vo.getSort(), vo.getOrder());
			} else {
				example.setOrderByClause("create_time desc");
			}
			example.gotoPaging(vo.getPagination(), vo.getRows());
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