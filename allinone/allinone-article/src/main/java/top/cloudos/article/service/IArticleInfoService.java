package top.cloudos.article.service;

import com.baomidou.mybatisplus.extension.service.IService;
import top.cloudos.article.model.dto.ArticleInfoDTO;
import top.cloudos.article.model.entity.ArticleInfo;
import top.cloudos.article.model.vo.ArticleInfoVO;
import top.cloudos.article.model.vo.TimeLineVO;
import top.cloudos.common.core.page.PageData;

import java.util.List;

/**
 * 文章Service接口
 *
 * @author GX
 * @date 2021-01-14
 */
public interface IArticleInfoService extends IService<ArticleInfo> {

    /**
     * 分页查询
     *
     * @param articleInfo
     * @return
     */
    PageData queryPage(ArticleInfo articleInfo);


    /**
     * 查询文章详情
     *
     * @param articleId
     * @return
     */
    ArticleInfoVO getArticleInfo(String articleId);

    /**
     * 增加文章
     *
     * @param articleInfoDTO
     * @return
     */
    int addArticleInfo(ArticleInfoDTO articleInfoDTO);

    /**
     * 增加文章
     *
     * @param articleIds
     * @return
     */
    int deleteArticleInfo(List<String> articleIds);

    /**
     * 修改文章
     *
     * @param articleInfoDTO
     * @return
     */
    int updateArticleInfo(ArticleInfoDTO articleInfoDTO);

    /**
     * 按年份归档-时间轴
     *
     * @return
     */
    List<TimeLineVO> archiveByYear();

    /**
     * 推荐
     *
     * @return
     */
    List<ArticleInfo> recommendList();

}
