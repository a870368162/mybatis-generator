package ${daoUrl};

import java.util.List;
import ${entityUrl}.${entityName};
import com.base.common.mybatis.MyBatisCriteria;
import org.springframework.stereotype.Component;

/**   
 * ${entityComment}——Mapper层
 *
 * @author  ${author}
 * @create	${createTime}
 */
@Component
public interface ${entityName}Mapper {

    /**
     * 根据id查询${entityComment}对象
     *
     * @param   id：${entityComment}对象的id
     * @return  ${entityComment}对象
     */
	${entityName} selectByPrimaryKey(${idType} id);

    /**
     * 根据id删除${entityComment}对象
     *
     * @param   id：${entityComment}对象id
     * @return  删除条数
     */
	int deleteByPrimaryKey(${idType} id);

    /**
     * 新增${entityComment}对象
     *
     * @param   ${objectName}：${entityComment}对象
     * @return  新增的条数
     */
	int insertSelective(${entityName} ${objectName});

    /**
     * 根据id修改${entityComment}对象
     *
     * @param   ${objectName}：${entityComment}对象
     * @return  修改的条数
     */
	int updateByPrimaryKeySelective(${entityName} ${objectName});

    /**
     * 条件查询${entityComment}记录数
     *
     * @param   example：MyBatisCriteria查询条件
     * @return  条数
     */
    long countByExample(MyBatisCriteria example);

    /**
     * 分页条件查询${entityComment}记录数
     *
     * @param   example：MyBatisCriteria查询条件
     * @return  ${entityComment}对象的分页集合
     */
    List<${entityName}> selectByExample(MyBatisCriteria example);
}
	