<template>
  <div class="user-container">
    <div>
      <Row :gutter="10">
        <Col :xs="24" :sm="6" :md="6" :lg="6" :xl="6">
          <div class="left-card">
            <Card>
              <p>userinfo</p>
              <p>asdasd</p>
              <p>asdasd</p>
            </Card>
          </div>
        </Col>
        <Col :xs="24" :sm="18" :md="18" :lg="18" :xl="18">
          <div class="right-card">
            <Card>
              <p>userinfo</p>
              <p>asdasd</p>
              <p>asdasd</p>
            </Card>
          </div>
        </Col>
      </Row>
    </div>
  </div>
</template>

<script>
export default {
  name: "index"
}
</script>

<style scoped>
.user-container {
  width: 100%;
  height: 100%;
  display: flex;
  flex-direction: row;
  justify-content: center;
  align-items: center;
}
.left-card{
  width: 300px;
  height: auto;
}
.right-card{
  width: 800px;
  height: auto;
}
</style>
