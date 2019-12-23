package ${voUrl};

import com.base.common.mybatis.MyBatisCriteria;
import com.base.common.mybatis.MyBatisCriteria.Criteria;
import com.base.common.pagination.PaginationBasicVO;
import com.base.common.utils.NumberUtils;
import com.base.common.utils.StringUtils;
import lombok.Builder;
import lombok.Getter;
import java.util.List;
import org.apache.commons.collections.CollectionUtils;

/**
* ${entityComment} vo
*
* @author  ${author}
* @create	${createTime}
*/
@Builder
@Getter
public class ${entityName}VO extends PaginationBasicVO {

    private List<Long> ids;

    public MyBatisCriteria queryBuilder() {
        MyBatisCriteria example = new MyBatisCriteria();
        Criteria criteria = example.createCriteria();
        if (CollectionUtils.isNotEmpty(ids)) {
            criteria.andInLong("id", ids);
        }
        if (StringUtils.isNotEmpty(this.getSort()) && StringUtils.isNotEmpty(this.getOrder())) {
            example.setOrderByClause(this.getSort(), this.getOrder());
        } else {
            example.setOrderByClause("create_time desc");
        }
        return example;
    }
}
