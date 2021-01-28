package top.cloudos.article.model.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;
import top.cloudos.article.model.entity.ArticleInfo;
import top.cloudos.article.model.entity.ArticleTag;

import java.util.List;

/**
 * @author GX
 * @email 334412097@qq.com
 * @date 2021/1/14 22:31
 * @description vo
 **/
@Data
@EqualsAndHashCode(callSuper = true)
public class ArticleInfoVO extends ArticleInfo {

    /**
     * 分类
     */
    private String categoryName;

    /**
     * 标签ids
     */
    private List<Long> tagIds;

    /**
     * 标签名称
     */
    private List<ArticleTag> tags;
}
