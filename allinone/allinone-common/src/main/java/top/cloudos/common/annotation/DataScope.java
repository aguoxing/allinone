package top.cloudos.common.annotation;

import java.lang.annotation.*;

/**
 * @author GX
 * @email 334412097@qq.com
 * @date 2021/1/12 19:39
 * @description 数据权限过滤注解
 **/
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface DataScope {
    /**
     * 部门表的别名
     */
    String deptAlias() default "";

    /**
     * 用户表的别名
     */
    String userAlias() default "";
}
