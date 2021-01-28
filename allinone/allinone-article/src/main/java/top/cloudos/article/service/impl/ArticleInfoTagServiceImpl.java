package top.cloudos.article.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import top.cloudos.article.mapper.ArticleInfoTagMapper;
import top.cloudos.article.model.entity.ArticleInfoTag;
import top.cloudos.article.service.IArticleInfoTagService;

/**
 * 文章标签关联Service业务层处理
 *
 * @author ruoyi
 * @date 2021-01-14
 */
@Service
public class ArticleInfoTagServiceImpl extends ServiceImpl<ArticleInfoTagMapper, ArticleInfoTag> implements IArticleInfoTagService {

}
