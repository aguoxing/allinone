package top.cloudos.article.service;

import com.baomidou.mybatisplus.extension.service.IService;
import top.cloudos.article.model.entity.ArticleCategory;
import top.cloudos.article.model.vo.CategoryVO;
import top.cloudos.common.core.page.PageData;

import java.util.List;

/**
 * 分类Service接口
 *
 * @author GX
 * @date 2021-01-14
 */
public interface IArticleCategoryService extends IService<ArticleCategory> {

    /**
     * 查询列表
     */
    List<ArticleCategory> queryList(ArticleCategory articleCategory);

    /**
     * 分页查询
     *
     * @param articleCategory
     * @return
     */
    PageData queryPage(ArticleCategory articleCategory);

    /**
     * 查询分类vo categoryName-articleCount
     *
     * @return
     */
    List<CategoryVO> queryCategoryVO();

    /**
     * 删除分类
     *
     * @param categoryIds
     * @return
     */
    int deleteCategory(List<Long> categoryIds);
}
