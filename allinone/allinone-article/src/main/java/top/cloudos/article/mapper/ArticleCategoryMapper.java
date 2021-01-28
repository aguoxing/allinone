package top.cloudos.article.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import top.cloudos.article.model.entity.ArticleCategory;
import top.cloudos.article.model.vo.CategoryVO;

import java.util.List;

/**
 * 分类Mapper接口
 *
 * @author GX
 * @date 2021-01-14
 */
public interface ArticleCategoryMapper extends BaseMapper<ArticleCategory> {
    /**
     * 获取分类分类下的文章数量
     * @return
     */
    List<CategoryVO> getCategoryArticleCount();

    /**
     * 根据文章ID获取分类名称
     * @param articleId
     * @return
     */
    ArticleCategory selectByArticleId(String articleId);
}
