<template>
  <div class="about-info">
    <Card dis-hover>
      <no-ssr>
        <mavon-editor
          v-model="article.content"
          :subfield="false"
          :box-shadow="false"
          default-open="preview"
          :toolbars-flag="false"
          :ishljs="true"/>
      </no-ssr>
      <Spin size="large" fix v-if="loading"></Spin>
    </Card>
  </div>
</template>

<script>
import {articleDetail} from "@/api/article";

export default {
  data() {
    return {
      loading: true,
      article: {}
    }
  },
  computed: {},
  created() {
    this.getArticleDetail("1")
  },
  methods: {
    // 获取文章详情
    getArticleDetail(articleId) {
      this.loading = true;
      articleDetail(articleId).then(response => {
        this.article = response.data;
        // 修改网页title
        document.title = this.article.title + ' - GX的博客'
        this.loading = false;
      });
    },
  }
}
</script>

<style scoped>
.about-info {
}
</style>
