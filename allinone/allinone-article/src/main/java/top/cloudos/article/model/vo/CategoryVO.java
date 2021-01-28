package top.cloudos.article.model.vo;

import lombok.Data;

/**
 * @author GX
 * @email 334412097@qq.com
 * @date 2021/1/16 11:23
 * @description 分类vo
 **/
@Data
public class CategoryVO {
    /**
     * 分类id
     */
    private Long categoryId;

    /**
     * 分类名称
     */
    private String categoryName;

    /**
     * 分类下的文章数量
     */
    private Integer articleCount;
}
