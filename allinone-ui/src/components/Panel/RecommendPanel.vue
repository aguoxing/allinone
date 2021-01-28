<template>
  <div>
    <Card :dis-hover="true">
      <p slot="title">推荐</p>
      <router-link v-for="item in article" :key="item.id" :to="'/article/details/'+item.articleId"
                   class="recommend-card">
        <div class="blog-title">
          {{ item.title }}
        </div>
      </router-link>
    </Card>
  </div>
</template>

<script>
import {listRecommend} from '@/api/article'

export default {
  data() {
    return {
      article: {}
    }
  },
  created() {
    this.getRecommendList()
  },
  methods: {
    getRecommendList() {
      listRecommend().then(res => {
        this.article = res.data
      })
    }
  }
}
</script>

<style scoped>
.recommend-card {
  display: flex;
  flex-direction: column;
}

.blog-title {
  font-size: 14px;
  color: #888888;
  line-height: 25px;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}

.blog-tag {
  line-height: 30px;
}

.blog-bottom {
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  font-size: 12px;
  color: #b8b8b8;
}
</style>
