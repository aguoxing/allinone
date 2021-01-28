package top.cloudos.article.model.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;
import top.cloudos.common.annotation.Excel;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

/**
 * 分类对象 article_category
 *
 * @author GX
 * @date 2021-01-14
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("article_category")
public class ArticleCategory implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    @TableId(value = "category_id", type = IdType.AUTO)
    private Long categoryId;

    /**
     * 分类名称
     */
    @Excel(name = "分类名称")
    private String name;

    @TableField(exist = false)
    private Map<String, Object> params = new HashMap<>();

    public Map<String, Object> getParams() {
        if (params == null) {
            params = new HashMap<>(16);
        }
        return params;
    }

    public void setParams(Map<String, Object> params) {
        this.params = params;
    }
}
