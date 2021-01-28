package top.cloudos.common.annotation;

import java.lang.annotation.*;

/**
 * @author GX
 * @email 334412097@qq.com
 * @date 2021/1/12 19:39
 * @description 自定义注解防止表单重复提交
 **/
@Inherited
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface RepeatSubmit {

}
