package top.cloudos.quartz.task;

import top.cloudos.common.util.StringUtils;

/**
 * @author GX
 * @email 334412097@qq.com
 * @date 2021/1/12 23:10
 * @description test
 **/
public class AllinoneTask {
    public void ryMultipleParams(String s, Boolean b, Long l, Double d, Integer i) {
        System.out.println(StringUtils.format("执行多参方法： 字符串类型{}，布尔类型{}，长整型{}，浮点型{}，整形{}", s, b, l, d, i));
    }

    public void ryParams(String params) {
        System.out.println("执行有参方法：" + params);
    }

    public void ryNoParams() {
        System.out.println("执行无参方法");
    }
}