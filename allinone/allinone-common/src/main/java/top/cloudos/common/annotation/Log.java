package top.cloudos.common.annotation;

import top.cloudos.common.enums.BusinessType;
import top.cloudos.common.enums.OperatorType;

import java.lang.annotation.*;

/**
 * @author GX
 * @email 334412097@qq.com
 * @date 2021/1/12 19:39
 * @description 自定义操作日志记录注解
 **/
@Target({ElementType.PARAMETER, ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface Log {
    /**
     * 模块
     */
    String title() default "";

    /**
     * 功能
     */
    BusinessType businessType() default BusinessType.OTHER;

    /**
     * 操作人类别
     */
    OperatorType operatorType() default OperatorType.MANAGE;

    /**
     * 是否保存请求的参数
     */
    boolean isSaveRequestData() default true;
}
