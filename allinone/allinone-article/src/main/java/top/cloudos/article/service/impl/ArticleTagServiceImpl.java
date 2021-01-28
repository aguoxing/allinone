package top.cloudos.article.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import top.cloudos.article.mapper.ArticleInfoTagMapper;
import top.cloudos.article.mapper.ArticleTagMapper;
import top.cloudos.article.model.entity.ArticleInfoTag;
import top.cloudos.article.model.entity.ArticleTag;
import top.cloudos.article.model.vo.TagVO;
import top.cloudos.article.service.IArticleTagService;
import top.cloudos.common.core.page.PageData;
import top.cloudos.common.core.page.Query;
import top.cloudos.common.exception.CustomException;

import java.util.List;

/**
 * 标签Service业务层处理
 *
 * @author GX
 * @date 2021-01-14
 */
@Service
public class ArticleTagServiceImpl extends ServiceImpl<ArticleTagMapper, ArticleTag> implements IArticleTagService {
    @Autowired
    private ArticleInfoTagMapper articleInfoTagMapper;

    /**
     * 查询标签列表
     * @param articleTag
     * @return
     */
    @Override
    public List<ArticleTag> queryTagList(ArticleTag articleTag) {
        LambdaQueryWrapper<ArticleTag> lqw = Wrappers.lambdaQuery();
        if (StringUtils.isNotBlank(articleTag.getName())) {
            lqw.like(ArticleTag::getName, articleTag.getName());
        }
        return baseMapper.selectList(lqw);
    }

    /**
     * 分页查询
     * @param articleTag
     * @return
     */
    @Override
    public PageData queryPage(ArticleTag articleTag) {
        QueryWrapper<ArticleTag> qw = new QueryWrapper<>();
        qw.select("name","tag_id");
        if (StringUtils.isNotBlank(articleTag.getName())) {
            qw.like("name", articleTag.getName());
        }
        // 查询参数
        IPage<ArticleTag> page = new Query<ArticleTag>().getPage(articleTag.getParams());

        IPage<ArticleTag> iPage = baseMapper.selectPage(page, qw);
        return new PageData(iPage);
    }

    /**
     * 查询标签vo tagName-articleCount
     * @return
     */
    @Override
    public List<TagVO> queryTagVO() {
        return articleInfoTagMapper.getTagArticleCount();
    }

    /**
     * 删除标签
     *
     * @param tagIds
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public int deleteTag(List<Long> tagIds) {
        // 检查当前标签下是否有文章
        checkDeleteAllowed(tagIds);
        return baseMapper.deleteBatchIds(tagIds);
    }

    /**
     * 检查当前标签下是否有文章
     *
     * @param tagIds
     */
    private void checkDeleteAllowed(List<Long> tagIds) {
        tagIds.forEach(tagId -> {
            int count = articleInfoTagMapper.selectCount(new QueryWrapper<ArticleInfoTag>().eq("tag_id", tagId));
            if (count > 0) {
                throw new CustomException("当前标签下有文章，不能删除！");
            }
        });
    }
}
