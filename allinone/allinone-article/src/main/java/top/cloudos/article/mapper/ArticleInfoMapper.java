package top.cloudos.article.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import top.cloudos.article.model.entity.ArticleInfo;
import top.cloudos.article.model.vo.ArticleInfoVO;

import java.util.List;

/**
 * 文章Mapper接口
 *
 * @author GX
 * @date 2021-01-14
 */
public interface ArticleInfoMapper extends BaseMapper<ArticleInfo> {

    /**
     * 文章list vo
     *
     * @return
     */
    List<ArticleInfoVO> listArticleVo();

    /**
     * 文章详情vo
     *
     * @return
     */
    ArticleInfoVO selectArticleVoById(String articleId);

    /**
     * 查询年份列表
     *
     * @return
     */
    List<String> findGroupYear();

    /**
     * 按年份查询文章
     *
     * @param year
     * @return
     */
    List<ArticleInfo> findByYear(String year);
}
