package top.cloudos;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

/**
 * @author GX
 * @email 334412097@qq.com
 * @date 2021/1/12 19:02
 * @description 主启动类
 **/
@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class})
public class AllinoneApplication {
    public static void main(String[] args) {
        SpringApplication.run(AllinoneApplication.class, args);
    }
}
