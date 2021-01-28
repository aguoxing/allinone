package top.cloudos.article.model.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.experimental.Accessors;
import top.cloudos.common.annotation.Excel;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

/**
 * 友链 对象 friend_link
 *
 * @author GX
 * @date 2021-01-25
 */
@Data
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@Accessors(chain = true)
@TableName("friend_link")
public class FriendLink implements Serializable {
    private static final long serialVersionUID=1L;


    /** 主键 */
    @TableId(value = "link_id")
    private Long linkId;

    /** 网站名称 */
    @Excel(name = "网站名称")
    private String name;

    /** 链接 */
    @Excel(name = "链接")
    private String url;

    /** 说明 */
    @Excel(name = "说明")
    private String remark;

    @TableField(exist = false)
    private Map<String, Object> params = new HashMap<>();
}
