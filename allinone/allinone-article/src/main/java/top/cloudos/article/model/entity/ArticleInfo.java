package top.cloudos.article.model.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;
import top.cloudos.common.annotation.Excel;
import top.cloudos.common.core.base.BaseEntity;

/**
 * 文章对象 article_info
 *
 * @author GX
 * @date 2021-01-14
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("article_info")
public class ArticleInfo extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    @TableId(value = "article_id")
    private String articleId;

    /**
     * 分类id
     */
    @Excel(name = "分类id")
    private Long categoryId;

    /**
     * 文章标题
     */
    @Excel(name = "文章标题")
    private String title;

    /**
     * 作者
     */
    @Excel(name = "作者")
    private String author;

    /**
     * 摘要
     */
    @Excel(name = "摘要")
    private String summary;

    /**
     * 内容
     */
    @Excel(name = "内容")
    private String content;

    /**
     * 文章状态（0显示 1隐藏）
     */
    private String visible;

    /**
     * 文章状态（0正常 1停用）
     */
    private String status;

    /**
     * 是否置顶（0是 1否）
     */
    private String isTop;

    /**
     * 是否推荐阅读（0是 1否）
     */
    private String isRecommend;

    /**
     * 点赞数
     */
    @Excel(name = "点赞数")
    private Long likeCount;

    /**
     * 评论数
     */
    @Excel(name = "评论数")
    private Long commentCount;

    /**
     * 浏览数
     */
    @Excel(name = "浏览数")
    private Long viewCount;

}
