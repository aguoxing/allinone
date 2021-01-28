<template>
  <div class="comment-container">
    <Card dis-hover class="comment-list">
      <div class="comment-input">
        <Input v-model="comment" type="textarea"
               style="width: 90%"
               :autosize="{minRows: 2,maxRows: 5}"
               maxlength="300" show-word-limit
               placeholder="Enter something..."/>
        <Button type="info" @click="handleComment">发送</Button>
      </div>
      <List item-layout="vertical">
        <ListItem>
          <ListItemMeta avatar="https://dev-file.iviewui.com/userinfoPDvn9gKWYihR24SpgC319vXY8qniCqj4/avatar">
            <template slot="title">
              <p>B</p>
            </template>
            <template slot="description">
              <p>asdasdasdasd</p>
              <p>回复</p>
              <ListItemMeta style="margin-top: 10px" avatar="https://dev-file.iviewui.com/userinfoPDvn9gKWYihR24SpgC319vXY8qniCqj4/avatar">
                <template slot="title">
                  <p>A@B</p>
                </template>
                <template slot="description">
                  <p>asdasdasdasd</p>
                  <p>回复</p>
                </template>
              </ListItemMeta>
              <ListItemMeta style="margin-top: 10px" avatar="https://dev-file.iviewui.com/userinfoPDvn9gKWYihR24SpgC319vXY8qniCqj4/avatar">
                <template slot="title">
                  <p>C@B</p>
                </template>
                <template slot="description">
                  <p>哈哈哈哈哈哈</p>
                  <p>回复</p>
                </template>
              </ListItemMeta>
            </template>
          </ListItemMeta>
        </ListItem>
      </List>
    </Card>
  </div>
</template>

<script>
export default {
  name: "CommentPanel",
  data() {
    return {
      comment: ''
    }
  },
  methods: {
    handleComment() {
      this.$Message.info("评论功能待实现...")
    }
  }
}
</script>

<style scoped>
.comment-input {
  display: flex;
  flex-direction: row;
  justify-content: space-around;
}

.comment-container {

}

.comment-list {
  width: 100%;
}
</style>
