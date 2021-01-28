package top.cloudos.article.service;

import com.baomidou.mybatisplus.extension.service.IService;
import top.cloudos.article.model.entity.ArticleTag;
import top.cloudos.article.model.vo.TagVO;
import top.cloudos.common.core.page.PageData;

import java.util.List;

/**
 * 标签Service接口
 *
 * @author GX
 * @date 2021-01-14
 */
public interface IArticleTagService extends IService<ArticleTag> {

    /**
     * 查询列表
     *
     * @param articleTag
     * @return
     */
    List<ArticleTag> queryTagList(ArticleTag articleTag);

    /**
     * 分页查询
     * @param articleTag
     * @return
     */
    PageData queryPage(ArticleTag articleTag);

    /**
     * tagVo
     * @return
     */
    List<TagVO> queryTagVO();

    /**
     * 删除标签
     *
     * @param tagIds
     * @return
     */
    int deleteTag(List<Long> tagIds);
}
