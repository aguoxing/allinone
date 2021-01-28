<template>
  <div>
    <div class="article-info">
      <Card dis-hover>
        <h1 style="text-align: center">{{ article.title }}</h1>
        <div class="tag-info">
          <Tag v-for="(tag,index) in article.tags" :key="index" :color="index | randomTagColor">{{ tag.name }}</Tag>
        </div>
        <Row type="flex" justify="space-between">
          <Col>
            <p>{{ article.author }} 发布于 {{ article.createTime }}</p>
          </Col>
          <Col>
            <p>分类：{{ article.categoryName }}</p>
          </Col>
        </Row>
        <div class="article-content">
          <no-ssr>
            <mavon-editor
              v-model="article.content"
              :subfield="false"
              :box-shadow="false"
              default-open="preview"
              :toolbars-flag="false"
              :ishljs="true"/>
          </no-ssr>
        </div>
        <Row type="flex" justify="space-between">
          <Col>
            <p>
              <List>
                <ListItem>
                  <li>
                    <Icon type="ios-eye-outline" size="18"/>
                    {{ article.viewCount }}
                  </li>
                  <Divider type="vertical"/>
                  <li>
                    <Icon type="ios-thumbs-up-outline" size="18"/>
                    {{ article.likeCount }}
                  </li>
                  <Divider type="vertical"/>
                  <li>
                    <Icon type="ios-chatbubbles-outline" size="18"/>
                    {{ article.commentCount }}
                  </li>
                </ListItem>
              </List>
            </p>
          </Col>
          <Col>
            <p v-if="article.updateTime">{{ article.author }} 更新于 {{ article.updateTime }}</p>
          </Col>
        </Row>
      </Card>
    </div>
    <Spin size="large" fix v-if="loading"></Spin>
    <div class="article-comment">
      <CommentPanel/>
    </div>
  </div>

</template>
<script>
import {mapGetters} from 'vuex'
import CommentPanel from '@/components/Panel/CommentPanel'
import {articleDetail} from '@/api/article.js'
import marked from 'marked'

export default {
  data() {
    return {
      loading: true,
      article: {},
      comment: {},
      message: {}
    }
  },
  components: {
    CommentPanel
  },
  computed: {
    ...mapGetters(['name']),
    ...mapGetters(['avatar'])
  },
  watch: {
    $route: {
      handler: function (route) {
        this.redirect = route.query && route.query.redirect
      },
      immediate: true
    }
  },
  created() {
    const articleId = this.$route.params.id
    this.getArticleDetail(articleId)
  },
  methods: {
    // 获取文章详情
    getArticleDetail(articleId) {
      this.loading = true;
      articleDetail(articleId).then(response => {
        console.log(response)
        this.article = response.data;
        // 将内容转成html
        // this.article.content =  marked(this.article.content)
        // 修改网页title
        document.title = this.article.title + ' - GX的博客'
        this.loading = false;
      });
    },
  }
}
</script>

<style scoped>
.article-info {

}

.tag-info {
  display: flex;
  flex-direction: row;
  justify-content: center;
  align-items: center;
  align-content: center;
}

.article-content {
  margin: 10px 0 10px 0;
}

</style>
