package top.cloudos.test.article;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import top.cloudos.article.service.IArticleInfoService;
import top.cloudos.test.base.BaseTest;

/**
 * @author GX
 * @email 334412097@qq.com
 * @date 2021/1/24 18:32
 * @description
 **/
public class ArticleServiceImplTest extends BaseTest {
    @Autowired
    private IArticleInfoService articleInfoService;

    @Test
    public void test() {
    }

}
