package top.cloudos.common.core.page;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.metadata.OrderItem;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import top.cloudos.common.constant.PageConstants;
import top.cloudos.common.util.StringUtils;
import top.cloudos.common.util.sql.SqlUtil;

import java.util.Map;

/**
 * @author GX
 * @email 334412097@qq.com
 * @date 2021/1/23 17:37
 * @description 查询参数
 **/
public class Query<T> {

    public IPage<T> getPage(Map<String, Object> params) {
        return this.getPage(params, null, false);
    }

    public IPage<T> getPage(Map<String, Object> params, String defaultOrderField, boolean isAsc) {
        //分页参数
        long currentPage = 1;
        long pageSize = 10;

        if (params.get(PageConstants.CURRENT_PAGE) != null) {
            currentPage = Long.parseLong(String.valueOf(params.get(PageConstants.CURRENT_PAGE)));
        }
        if (params.get(PageConstants.PAGE_SIZE) != null) {
            pageSize = Long.parseLong(String.valueOf(params.get(PageConstants.PAGE_SIZE)));
        }

        //分页对象
        Page<T> page = new Page<>(currentPage, pageSize);

        //分页参数
        params.put(PageConstants.CURRENT_PAGE, page);

        //排序字段
        //防止SQL注入（因为sidx、order是通过拼接SQL实现排序的，会有SQL注入风险）
        String orderField = SqlUtil.escapeOrderBySql((String) params.get(PageConstants.ORDER_FIELD));
        String order = (String) params.get(PageConstants.ORDER);


        //前端字段排序
        if (StringUtils.isNotEmpty(orderField) && StringUtils.isNotEmpty(order)) {
            if (PageConstants.ASC.equalsIgnoreCase(order)) {
                return page.addOrder(OrderItem.asc(orderField));
            } else {
                return page.addOrder(OrderItem.desc(orderField));
            }
        }

        //没有排序字段，则不排序
        if (StringUtils.isBlank(defaultOrderField)) {
            return page;
        }

        //默认排序
        if (isAsc) {
            page.addOrder(OrderItem.asc(defaultOrderField));
        } else {
            page.addOrder(OrderItem.desc(defaultOrderField));
        }

        return page;
    }
}

