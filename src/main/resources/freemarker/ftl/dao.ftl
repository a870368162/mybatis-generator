package ${daoUrl};

import java.util.List;
import ${entityUrl}.${entityName};
import com.base.common.mybatis.MyBatisCriteria;
import org.springframework.stereotype.Component;

/**   
 * ${entityComment}——DAO
 *
 * @author  ${author}
 *    
 */
@Component
public interface ${entityName}Mapper {

    /**
     * 根据id查询${entityComment}对象
     * @param   id：id
     * @return  ${entityName}
     * @author  ${author}
     */
	${entityName} selectByPrimaryKey(${idType} id);

    /**
     * 根据id删除${entityComment}对象
     * @param   id：id
     * @return  删除条数
     * @author  ${author}
     */
	int deleteByPrimaryKey(${idType} id);

    /**
     * 新增${entityComment}对象
     * @param   ${objectName}：${entityName}
     * @return  新增的条数
     * @author  ${author}
     */
	int insertSelective(${entityName} ${objectName});

    /**
     * 根据id修改${entityComment}对象
     * @param   ${objectName}：${entityName}
     * @return  修改的条数
     * @author  ${author}
     */
	int updateByPrimaryKeySelective(${entityName} ${objectName});

    /**
     * 条件查询${entityComment}对象
     * @param   ${objectName}：${entityName}
     * @return  List<${entityName}>
     * @author  ${author}
     */
	List<${entityName}> query${entityName}List(${entityName} ${objectName});

    /**
     * 条件查询${entityComment}记录数
     * @param   example：MyBatisCriteria
     * @return  条数
     * @author  ${author}
     */
    long countByExample(MyBatisCriteria example);

    /**
     * 分页条件查询${entityComment}记录数
     * @param   example：MyBatisCriteria
     * @return  List<${entityName}>
     * @author  ${author}
     */
    List<${entityName}> selectByExample(MyBatisCriteria example);
}
	