package ${serviceUrl};

import ${entityUrl}.${entityName};
import com.base.common.pagination.Page;
/**
 * ${entityComment}——SERVICE层
 *
 * @author	${author}
 * @create	${createTime}
 */
public interface ${entityName}Service {
	
	/**
	 * 根据id查询${entityComment}对象
	 *
	 * @param   id：${entityComment}的id
	 * @return  ${entityComment}对象
	 */
	${entityName} get${entityName}ById(${idType} id);

	/**
  	 * 新增或者修改${entityComment}对象
	 *
	 * @param   ${objectName}：${entityComment}对象
	 * @return  ${entityComment}对象的id
	 */
	Long saveOrUpdate(${entityName} ${objectName});

	/**
	 * 新增${entityComment}对象
 	 *
	 * @param   ${objectName}：${entityComment}对象
	 * @return  ${entityComment}对象的id
	*/
	Long insert${entityName}(${entityName} ${objectName});

	/**
	 * 修改${entityComment}对象
 	 *
	 * @param   ${objectName}：${entityComment}对象
	 * @return  ${entityComment}对象的id
	*/
	Long update${entityName}(${entityName} ${objectName});
	
	/**
	 * 分页查询${entityComment}对象
 	 *
	 * @param   vo：${entityName}VO
	 * @return  ${entityComment}的分页集合
	 */
	Page<${entityName}> get${entityName}BySearch(${entityName}VO vo);
}