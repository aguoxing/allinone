package top.cloudos.article.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import top.cloudos.article.model.entity.ArticleTag;

import java.util.List;

/**
 * 标签Mapper接口
 *
 * @author GX
 * @date 2021-01-14
 */
public interface ArticleTagMapper extends BaseMapper<ArticleTag> {

    /**
     * 根据文章id 获取tagList
     *
     * @param articleId
     * @return
     */
    List<ArticleTag> listByArticleId(String articleId);

}
