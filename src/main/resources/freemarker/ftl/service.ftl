package ${serviceUrl};

import ${entityUrl}.${entityName};
import com.base.common.pagination.Page;
/**
 * ${entityComment}——SERVICE
 *
 * @author	${author}
 *    
 */
public interface ${entityName}Service {
	
	/**
	 * 根据id查询${entityComment}对象
	 * @param   id：id
	 * @return  ${entityName}
	 * @author  ${author}
	 */
	${entityName} get${entityName}ById(${idType} id);

	/**
  	 * 新增或者修改${entityComment}对象
	 * @param   ${objectName}：${objectName}
	 * @return  ${entityName}
	 * @author  ${author}
	 */
	Long saveOrUpdate(${entityName} ${objectName});

	/**
	 * 新增${entityComment}对象
	 * @param   ${objectName}：${objectName}
	 * @return  ${entityName}
	 * @author  ${author}
	*/
	Long insert${entityName}(${entityName} ${objectName});

	/**
	 * 修改${entityComment}对象
	 * @param   ${objectName}：${objectName}
	 * @return  ${entityName}
	 * @author  ${author}
	*/
	Long update${entityName}(${entityName} ${objectName});
	
	/**
	 * 分页查询${entityComment}
	 * @param   vo：${entityName}VO
	 * @return  Page<${entityName}>
	 * @author  ${author}
	 */
	Page<${entityName}> get${entityName}BySearch(${entityName}VO vo);
}