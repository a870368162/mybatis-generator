package ${serviceUrl};

import ${entityUrl}.${entityName};
import ${voUrl}.${entityName}VO;
import com.base.common.pagination.Page;
import java.util.List;
/**
 * ${entityComment}——SERVICE层
 *
 * @author	${author}
 * @create	${createTime}
 */
public interface ${entityName}Service {

	/**
  	 * 新增或者修改${entityComment}
	 *
	 * @param   ${objectName}：${entityComment}
	 * @return  ${entityComment}的id
	 */
	Long saveOrUpdate(${entityName} ${objectName});

	/**
	 * 新增${entityComment}
 	 *
	 * @param   ${objectName}：${entityComment}
	 * @return  ${entityComment}的id
	 */
	Long insert${entityName}(${entityName} ${objectName});

	/**
	 * 修改${entityComment}
 	 *
	 * @param   ${objectName}：${entityComment}
	 * @return  ${entityComment}的id
	 */
	Long update${entityName}(${entityName} ${objectName});

	/**
	 * 根据id更新${entityComment}状态
	 *
	 * @create by: zxf
	 * @create time: 2019/11/12 20:18
	 *
	 * @param ${objectName}：${entityComment}
	 * @return ${entityComment}的id
	 */
	Long update${entityName}Status(${entityName} ${objectName});

	/**
	 * 根据id删除${entityComment}
	 *
	 * @param   id：${entityComment}的id
	 * @return  ${entityComment}的id
	 */
	Long delete${entityName}ById(${idType} id);

	/**
	 * 根据id查询${entityComment}
	 *
	 * @param   id：${entityComment}的id
	 * @return  ${entityComment}
	 */
	${entityName} get${entityName}ById(${idType} id);

	/**
	 * 查询${entityComment}列表
	 *
	 * @param   vo：${entityName}VO
	 * @return  ${entityComment}的列表
	 */
	List<${entityName}> find${entityName}BySearch(${entityName}VO vo);
	
	/**
	 * 分页查询${entityComment}对象
 	 *
	 * @param   vo：${entityName}VO
	 * @return  ${entityComment}的分页集合
	 */
	Page<${entityName}> find${entityName}PageBySearch(${entityName}VO vo);

}