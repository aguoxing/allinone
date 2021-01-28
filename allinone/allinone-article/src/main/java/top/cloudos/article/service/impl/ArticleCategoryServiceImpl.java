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
import top.cloudos.article.mapper.ArticleCategoryMapper;
import top.cloudos.article.mapper.ArticleInfoMapper;
import top.cloudos.article.model.entity.ArticleCategory;
import top.cloudos.article.model.entity.ArticleInfo;
import top.cloudos.article.model.vo.CategoryVO;
import top.cloudos.article.service.IArticleCategoryService;
import top.cloudos.common.core.page.PageData;
import top.cloudos.common.core.page.Query;
import top.cloudos.common.exception.CustomException;

import java.util.List;

/**
 * 分类Service业务层处理
 *
 * @author GX
 * @date 2021-01-14
 */
@Service
public class ArticleCategoryServiceImpl extends ServiceImpl<ArticleCategoryMapper, ArticleCategory> implements IArticleCategoryService {
    @Autowired
    private ArticleInfoMapper articleInfoMapper;

    /**
     * 查询分类列表
     * @param articleCategory
     * @return
     */
    @Override
    public List<ArticleCategory> queryList(ArticleCategory articleCategory) {
        LambdaQueryWrapper<ArticleCategory> lqw = Wrappers.lambdaQuery();
        if (StringUtils.isNotBlank(articleCategory.getName())) {
            lqw.like(ArticleCategory::getName, articleCategory.getName());
        }
        return this.list(lqw);
    }

    /**
     * 分页查询
     * @param articleCategory
     * @return
     */
    @Override
    public PageData queryPage(ArticleCategory articleCategory) {
        QueryWrapper<ArticleCategory> qw = new QueryWrapper<>();
        qw.select("name","category_id");
        if (top.cloudos.common.util.StringUtils.isNotBlank(articleCategory.getName())) {
            qw.like("name", articleCategory.getName());
        }
        // 查询参数
        IPage<ArticleCategory> page = new Query<ArticleCategory>().getPage(articleCategory.getParams());

        IPage<ArticleCategory> iPage = baseMapper.selectPage(page, qw);
        return new PageData(iPage);
    }

    /**
     * 查询分类vo categoryName-articleCount
     * @return
     */
    @Override
    public List<CategoryVO> queryCategoryVO() {
        return baseMapper.getCategoryArticleCount();
    }

    /**
     * 删除分类
     *
     * @param categoryIds
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public int deleteCategory(List<Long> categoryIds) {
        // 检查当前分类下是否有文章
        checkDeleteAllowed(categoryIds);
        return baseMapper.deleteBatchIds(categoryIds);
    }

    /**
     * 检查当前分类下是否有文章
     *
     * @param categoryIds
     */
    private void checkDeleteAllowed(List<Long> categoryIds) {
        categoryIds.forEach(categoryId -> {
            int count = articleInfoMapper.selectCount(new QueryWrapper<ArticleInfo>().eq("category_id", categoryId));
            if (count > 0) {
                throw new CustomException("当前分类下有文章，不能删除！");
            }
        });
    }
}
