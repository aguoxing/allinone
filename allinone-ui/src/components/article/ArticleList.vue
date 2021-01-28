<template>
  <div>
    <div class="button-container">
      <div class="nav-logo">
        <div class="logo-text">{{ name }}</div>
      </div>
      <div class="nav">
        <Menu mode="horizontal" active-name="create_time" @on-select="changeSort">
          <MenuItem name="create_time">
            最新
          </MenuItem>
          <MenuItem name="like_count">
            点赞最多
          </MenuItem>
          <MenuItem name="is_recommend">
            推荐
          </MenuItem>
        </Menu>
      </div>
    </div>
    <!-- 内容列表 -->
    <div class="list-container">
      <Card dis-hover style="margin-bottom: 10px">
        <List item-layout="vertical" style="margin-bottom: 10px">
          <ListItem v-for="item in articleList" :key="item.title">
            <ListItemMeta :avatar="item.avatar">
              <template class="article-title" slot="title">
                <h3>
                  <router-link :to="'/article/details/'+item.articleId">
                    {{ item.title }}
                  </router-link>
                </h3>
                <Tag v-if="item.isTop === '1'" color="red">置顶</Tag>
                <Tag v-for="(tag,index) in item.tags" :key="index" :color="index | randomTagColor">{{ tag.name }}</Tag>
              </template>
              <template class="article-content" slot="description">
                <p>{{ item.summary }}</p>
              </template>
            </ListItemMeta>
            <template slot="action">
              <li>
                <Icon type="ios-calendar-outline"/>
                {{ item.createTime | formatTime }}
              </li>
              <li>
                <Icon type="ios-eye-outline"/>
                {{ item.viewCount }}
              </li>
              <li>
                <Icon type="ios-thumbs-up-outline"/>
                {{ item.likeCount }}
              </li>
              <li>
                <Icon type="ios-chatbubbles-outline"/>
                {{ item.commentCount }}
              </li>
            </template>
            <template slot="extra">
              <img v-if="item.isTop === '1'" src="https://dev-file.iviewui.com/5wxHCQMUyrauMCGSVEYVxHR5JmvS7DpH/large"
                   style="width: 180px;height: 120px">
            </template>
          </ListItem>
        </List>
      </Card>
    </div>

    <!-- 分页按钮 -->
    <div style="margin-bottom: 10px;" v-show="total>0">
      <Page v-show="total>0"
            :current.sync="queryParams.params.currentPage"
            :page-size="queryParams.params.pageSize"
            @on-change="pageChange"
            :total="total" simple/>
    </div>

    <Spin size="large" fix v-if="loading"></Spin>

  </div>
</template>

<script>
import {listArticle} from "@/api/article";

export default {
  props: {
    name: {
      type: String,
      default: '文章'
    },
    categoryId: {
      default: undefined
    }
  },
  data() {
    return {
      // 遮罩层
      loading: true,
      // 总条数
      total: 0,
      // 文章列表
      articleList: [],
      // 标签列表
      tagList: [],
      // 查询参数
      queryParams: {
        title: undefined,
        categoryId: undefined,
        params: {
          currentPage: 1,
          pageSize: 10,
          sortColumn: undefined,
          sortMethod: "desc"
        }
      }
    }
  },
  created() {
    this.getArticleList()
  },
  methods: {
    // 查询文章列表
    getArticleList() {
      this.loading = true;
      listArticle(this.queryParams).then(response => {
        this.articleList = response.data.list;
        this.total = response.data.totalCount;
        this.loading = false;
      });
    },
    changeSort(e) {
      this.queryParams.params.sortColumn = e
      this.getArticleList();
    },
    pageChange() {
      this.getArticleList();
    }
  }
}
</script>
<style scoped>
.button-container {
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 10px;
}

.nav-logo {
  display: flex;
  flex-direction: row;
  align-items: center;
  font-size: 16px;
}

.nav {
  display: flex;
  flex-direction: row;
  align-items: center;
}

a {
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  color: #3e4149;
}

.ivu-menu-horizontal {
  background: none !important;
}

.ivu-menu {
  background: none !important;
}
</style>
