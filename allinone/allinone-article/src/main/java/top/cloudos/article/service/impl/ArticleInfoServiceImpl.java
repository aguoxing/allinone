package top.cloudos.article.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import top.cloudos.article.mapper.ArticleCategoryMapper;
import top.cloudos.article.mapper.ArticleInfoMapper;
import top.cloudos.article.mapper.ArticleInfoTagMapper;
import top.cloudos.article.mapper.ArticleTagMapper;
import top.cloudos.article.model.dto.ArticleInfoDTO;
import top.cloudos.article.model.entity.ArticleInfo;
import top.cloudos.article.model.entity.ArticleInfoTag;
import top.cloudos.article.model.vo.ArticleInfoVO;
import top.cloudos.article.model.vo.TimeLineVO;
import top.cloudos.article.service.IArticleInfoService;
import top.cloudos.common.core.page.PageData;
import top.cloudos.common.core.page.Query;
import top.cloudos.common.util.SecurityUtils;
import top.cloudos.common.util.StringUtils;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * 文章Service业务层处理
 *
 * @author GX
 * @date 2021-01-14
 */
@Service
public class ArticleInfoServiceImpl extends ServiceImpl<ArticleInfoMapper, ArticleInfo> implements IArticleInfoService {
    @Autowired
    private ArticleInfoTagMapper articleInfoTagMapper;
    @Autowired
    private ArticleTagMapper articleTagMapper;
    @Autowired
    private ArticleCategoryMapper articleCategoryMapper;

    /**
     * 分页查询
     *
     * @param articleInfo
     * @return
     */
    @Override
    public PageData queryPage(ArticleInfo articleInfo) {
        QueryWrapper<ArticleInfo> qw = new QueryWrapper<>();
        qw.select("article_id", "author", "summary", "title", "like_count", "comment_count", "view_count", "is_top", "create_time");
        if (StringUtils.isNotNull(articleInfo.getTitle())) {
            qw.like("title", articleInfo.getTitle());
        }
        if (StringUtils.isNotNull(articleInfo.getCategoryId())) {
            qw.eq("category_id", articleInfo.getCategoryId());
        }
        //查询参数
        IPage<ArticleInfo> page = new Query<ArticleInfo>().getPage(articleInfo.getParams(), "create_time", false);
        qw.orderByDesc("is_top");
        IPage<ArticleInfo> iPage = baseMapper.selectPage(page, qw);
        return new PageData(iPage);
    }

    /**
     * 查询文章详情
     *
     * @param articleId
     * @return
     */
    @Override
    public ArticleInfoVO getArticleInfo(String articleId) {
        ArticleInfoVO articleInfoVO = baseMapper.selectArticleVoById(articleId);
        // 访问量+1
        ArticleInfo articleInfo = new ArticleInfo();
        articleInfo.setArticleId(articleId);
        articleInfo.setViewCount(articleInfoVO.getViewCount() + 1);

        // 分类名称
        articleInfoVO.setCategoryName(articleCategoryMapper.selectByArticleId(articleId).getName());

        baseMapper.updateById(articleInfo);
        // 关联标签 修改用
        List<Long> tagIds = new ArrayList<>();
        articleInfoVO.getTags().forEach(t -> {
            tagIds.add(t.getTagId());
        });
        articleInfoVO.setTagIds(tagIds);
        return articleInfoVO;
    }

    /**
     * 增加文章
     *
     * @param articleInfoDTO
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public int addArticleInfo(ArticleInfoDTO articleInfoDTO) {
        // 保存文章
        String username = SecurityUtils.getUsername();
        articleInfoDTO.setAuthor(username);
        articleInfoDTO.setCreateBy(username);
        int count = baseMapper.insert(articleInfoDTO);

        // 关联标签
        relatedTag(articleInfoDTO);
        return count;
    }

    /**
     * 删除文章
     *
     * @param articleIds
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public int deleteArticleInfo(List<String> articleIds) {
        // 先删除文章与标签关联的中间表
        articleInfoTagMapper.deleteBatchIds(articleIds);
        return baseMapper.deleteBatchIds(articleIds);
    }

    /**
     * 修改文章
     *
     * @param articleInfoDTO
     * @return
     */
    @Override
    public int updateArticleInfo(ArticleInfoDTO articleInfoDTO) {
        // 修改文章
        String username = SecurityUtils.getUsername();
        articleInfoDTO.setUpdateBy(username);
        int count = baseMapper.updateById(articleInfoDTO);

        // 修改关联标签
        articleInfoTagMapper.deleteBatchIds(Collections.singletonList(articleInfoDTO.getArticleId()));
        relatedTag(articleInfoDTO);
        return count;
    }

    /**
     * 关联标签
     *
     * @param articleInfoDTO
     */
    private void relatedTag(ArticleInfoDTO articleInfoDTO) {
        ArticleInfoTag articleInfoTag = new ArticleInfoTag();
        String articleId = articleInfoDTO.getArticleId();
        Long[] tagIds = articleInfoDTO.getTagIds();
        for (Long tagId : tagIds) {
            articleInfoTag.setArticleId(articleId);
            articleInfoTag.setTagId(tagId);
            articleInfoTagMapper.insert(articleInfoTag);
        }
    }

    /**
     * 按年份归档-时间轴
     *
     * @return
     */
    @Override
    public List<TimeLineVO> archiveByYear() {
        List<TimeLineVO> timeLine = new ArrayList<>();
        // SELECT DATE_FORMAT(create_time,'%Y') AS YEAR FROM article_info GROUP BY YEAR ORDER BY YEAR DESC
        List<String> years = baseMapper.findGroupYear();
        TimeLineVO timeLineVO = new TimeLineVO();
        for (String year : years) {
            timeLineVO.setYear(year);
            // SELECT id,title,create_time FROM article WHERE DATE_FORMAT(create_time,'%Y') = #{year} and enable=1 order by create_time desc
            timeLineVO.setArticles(baseMapper.findByYear(year));
            timeLine.add(timeLineVO);
            timeLineVO = new TimeLineVO();
        }
        return timeLine;
    }

    /**
     * 推荐
     *
     * @return
     */
    @Override
    public List<ArticleInfo> recommendList() {
        return baseMapper.selectList(new QueryWrapper<ArticleInfo>().select("article_id,title").eq("is_recommend", "0").orderByDesc().last("limit 5"));
    }


    /**
     * 通过文章id获取标签名称
     *
     * @param articleId
     * @return
     */
    private List<String> getTagNameByArticleId(String articleId) {
        // 中间表
        List<ArticleInfoTag> articleInfoTags = articleInfoTagMapper.selectList(new QueryWrapper<ArticleInfoTag>().eq("article_id", articleId));
        // 获取标签列表
        List<String> tagNames = new ArrayList<>();
        articleInfoTags.forEach(i -> {
            // 通过tagId获取tagName
            String name = articleTagMapper.selectById(i.getTagId()).getName();
            tagNames.add(name);
        });
        return tagNames;
    }

}
