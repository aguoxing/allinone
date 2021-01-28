package top.cloudos.common.config;

import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import org.apache.ibatis.reflection.MetaObject;

/**
 * @author GX
 * @email 334412097@qq.com
 * @date 2021/1/23 13:54
 * @description 字段自动填充
 **/
public class MyMetaObjectHandler implements MetaObjectHandler {
    @Override
    public void insertFill(MetaObject metaObject) {
//        this.strictInsertFill(metaObject, "createBy", String.class, SecurityUtils.getUsername());
//        this.strictInsertFill(metaObject, "createTime", LocalDateTime.class, LocalDateTime.now());
    }

    @Override
    public void updateFill(MetaObject metaObject) {
//        this.strictInsertFill(metaObject, "updateBy", String.class, SecurityUtils.getUsername());
//        this.strictInsertFill(metaObject, "updateTime", LocalDateTime.class, LocalDateTime.now());
    }
}
