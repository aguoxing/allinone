<template>
  <div>
    <div class="category-info">
      <div>分类：</div>
      <div>
        <Tag checkable name="全部"
             :checked="checked" color="primary"
             @on-change='categoryOnChange(true,"全部")'
             @click.native="tagClick(undefined)"
        >全部
        </Tag>
        <Tag
          checkable
          :checked="!checked"
          color="primary"
          :name="item.categoryName"
          v-for="(item,index) in categoryList"
          :key="index"
          @on-change='categoryOnChange'
          @click.native="tagClick(item.categoryId,$event)"
        >
          {{ item.categoryName }} - {{ item.articleCount }}
        </Tag>
      </div>
    </div>
    <Divider/>
    <ArticleList :categoryId="categoryId" :name="categoryName" ref="al"/>
  </div>
</template>

<script>
import ArticleList from '@/components/article/ArticleList'
import {listCategoryVo} from '@/api/category'

export default {
  data() {
    return {
      ccc: {categoryName: false},
      checked: true,
      categoryId: undefined,
      categoryName: '全部',
      // 遮罩层
      loading: true,
      // 分类列表
      categoryList: [],
    }
  },
  components: {
    ArticleList
  },
  created() {
    this.getCategoryVoList()
  },
  methods: {
    getCategoryVoList() {
      this.loading = true;
      listCategoryVo().then(response => {
        this.categoryList = response.data;
        this.loading = false;
      });
    },
    // 点击效果改变
    categoryOnChange(checked, name) {
      console.log(name + '-' + checked)
      // 子组件参数赋值
      this.categoryName = name
    },
    // 根据分类查询列表
    tagClick(categoryId) {
      this.categoryId = categoryId
      // 子组件参数赋值
      this.$refs.al.queryParams.categoryId = categoryId
      // 调用子组件的方法
      this.$refs.al.getArticleList()
    }
  }
}
</script>

<style scoped>
.category-info {
  font-size: 16px;
  display: flex;
  flex-direction: row;
  align-items: center;
}
</style>
