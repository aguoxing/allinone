package top.cloudos.article.model.vo;

import lombok.Data;
import top.cloudos.article.model.entity.ArticleInfo;

import java.util.List;

/**
 * @author GX
 * @email 334412097@qq.com
 * @date 2021/1/16 11:31
 * @description 时间轴
 **/
@Data
public class TimeLineVO {
    /**
     * 年份
     */
    private String year;

    /**
     * 文章
     */
    private List<ArticleInfo> articles;
}
