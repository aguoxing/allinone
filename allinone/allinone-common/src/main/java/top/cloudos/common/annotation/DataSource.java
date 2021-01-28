package top.cloudos.common.annotation;

import top.cloudos.common.enums.DataSourceType;

import java.lang.annotation.*;

/**
 * @author GX
 * @email 334412097@qq.com
 * @date 2021/1/12 19:39
 * @description 自定义多数据源切换注解
 * 优先级：先方法，后类，如果方法覆盖了类上的数据源类型，以方法的为准，否则以类上的为准
 **/
@Target({ElementType.METHOD, ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
@Documented
@Inherited
public @interface DataSource {
    /**
     * 切换数据源名称
     */
    DataSourceType value() default DataSourceType.MASTER;
}
