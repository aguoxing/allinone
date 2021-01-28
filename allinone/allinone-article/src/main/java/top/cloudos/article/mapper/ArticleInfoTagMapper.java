package top.cloudos.article.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import top.cloudos.article.model.entity.ArticleInfoTag;
import top.cloudos.article.model.vo.TagVO;

import java.util.List;

/**
 * 文章标签关联Mapper接口
 *
 * @author GX
 * @date 2021-01-14
 */
public interface ArticleInfoTagMapper extends BaseMapper<ArticleInfoTag> {

    /**
     * 获取标签下的文章数量
     *
     * @return
     */
    List<TagVO> getTagArticleCount();

}
