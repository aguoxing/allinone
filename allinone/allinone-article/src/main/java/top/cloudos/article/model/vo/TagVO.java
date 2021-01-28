package top.cloudos.article.model.vo;

import lombok.Data;

/**
 * @author GX
 * @email 334412097@qq.com
 * @date 2021/1/16 0:24
 * @description 标签云
 **/
@Data
public class TagVO {

    /**
     * 标签id
     */
    private Long tagId;

    /**
     * 标签名称
     */
    private String tagName;

    /**
     * 文章数量
     */
    private Integer articleCount;
}
