package ${voUrl};

import com.base.common.mybatis.MyBatisCriteria;
import com.base.common.mybatis.MyBatisCriteria.Criteria;
import com.base.common.pagination.PaginationBasicVO;
import com.base.common.utils.NumberUtils;
import com.base.common.utils.StringUtils;
import lombok.Builder;
import lombok.Getter;

/**
* ${entityComment} vo
*
* @author  ${author}
* @create	${createTime}
*/
@Builder
@Getter
public class ${entityName}VO extends PaginationBasicVO {

    private Long id;

    public MyBatisCriteria queryBuilder() {
        MyBatisCriteria example = new MyBatisCriteria();
        Criteria criteria = example.createCriteria();
        if (NumberUtils.isNotEmpty(id)) {
            criteria.andNotEqualTo("id", id);
        }
        if (StringUtils.isNotEmpty(this.getSort()) && StringUtils.isNotEmpty(this.getOrder())) {
            example.setOrderByClause(this.getSort(), this.getOrder());
        } else {
            example.setOrderByClause("create_time desc");
        }
        example.gotoPaging(this.getPagination(), this.getRows());
        return example;
    }
}
