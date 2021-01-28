package top.cloudos.framework.config;

import org.springframework.context.annotation.Configuration;

@Configuration
public class ValidatorConf {

    /**
     * 配置校验框架 快速返回模式
     */
    /*@Bean
    public Validator validator() {
        ValidatorFactory validatorFactory = Validation.byProvider(HibernateValidator.class)
                .configure()
                .failFast(true)
                .buildValidatorFactory();
        return validatorFactory.getValidator();
    }*/

}
