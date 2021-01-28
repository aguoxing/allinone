<template>
  <div>
    <Card :dis-hover="true">
      <p slot="title">标签</p>
      <Tag v-for="(item,index) in tagList" :key="index" :color="index | randomTagColor">{{ item.tagName }}
        [{{ item.articleCount }}]
      </Tag>
    </Card>
  </div>
</template>

<script>
import {listTagVo} from '@/api/tag'

export default {
  data() {
    return {
      // 遮罩层
      loading: true,
      // 总条数
      total: 0,
      // 标签列表
      tagList: [],
    }
  },
  created() {
    this.getTagList()
  },
  methods: {
    getTagList() {
      this.loading = true;
      listTagVo().then(response => {
        this.tagList = response.data;
        this.loading = false;
      });
    }
  }
}
</script>
