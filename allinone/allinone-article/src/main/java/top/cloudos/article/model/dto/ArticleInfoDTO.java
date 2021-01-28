package top.cloudos.article.model.dto;

import lombok.Data;
import top.cloudos.article.model.entity.ArticleInfo;

/**
 * @author GX
 * @email 334412097@qq.com
 * @date 2021/1/14 22:37
 * @description dto
 **/
@Data
public class ArticleInfoDTO extends ArticleInfo {
    /**
     * 标签id
     */
    private Long[] tagIds;
}
