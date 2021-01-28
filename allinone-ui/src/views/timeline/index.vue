<template>
  <div>
    <div class="time-line">
      <Timeline v-for="(item,index) in articleList" :key="index">
        <h1>{{ item.year }}</h1>
        <TimelineItem v-for="data in item.articles" :key="data.id">
          <p class="time">{{ data.createTime | formatTime }}</p>
          <p>
            <router-link :to="'/article/details/'+data.articleId" class="content">
              {{ data.title }}
            </router-link>
          </p>
        </TimelineItem>
      </Timeline>
      <Spin size="large" fix v-if="loading"></Spin>
    </div>
  </div>
</template>

<script>
import {timeLine} from '@/api/article'

export default {
  data() {
    return {
      loading: true,
      articleList: {}
    }
  },
  created() {
    this.getTimeLine()
  },
  methods: {
    getTimeLine() {
      timeLine().then(res => {
        this.loading = true;
        this.articleList = res.data
        this.loading = false;
      })
    }
  }
}
</script>

<style scoped>
.time-line {
  background: #ffffff;
  padding: 30px 20px;
}

.time {
  font-size: 14px;
  font-weight: bold;
}

.content {
  color: #888888;
  padding-left: 5px;
}
</style>
