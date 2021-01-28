<template>
  <div class="info">
    <Card :dis-hover="true">
      <img src="@/assets/bg.jpg" class="bg-img">
      <router-link to="/login">
        <img src="@/assets/image/avatar.jpg" class="avatar">
      </router-link>
      <div class="info-container">
        <div class="nickname">HelloWorld</div>
        <div class="signature">0 error(s), 0 warning(s)</div>
        <Divider/>
        <div class="social-container">
          <div class="social-item">
            <a href="https://github.com/aguoxing">
              <img src="@/assets/social_github.png" class="social-icon">
            </a>
          </div>
        </div>
      </div>
    </Card>
  </div>
</template>

<style>
.bg-img {
  width: 100%;
  position: absolute;
  z-index: 0;
  top: 0;
}

.info .ivu-card-body {
  padding: 0 !important;
}

.avatar {
  width: 100px;
  height: 100px;
  border: 5px solid #e5e5e5;
  border-radius: 50%;
  position: relative;
  display: block;
  z-index: 1;
  margin: 75px auto 25px;
}

.info-container {
  display: flex;
  flex-direction: column;
  align-items: center;
  width: 100%;
  margin: auto;
  margin-bottom: 30px;
}

.nickname {
  font-size: 22px;
  font-weight: bold;
  line-height: 60px;
}

.signature {
  font-size: 16px;
}

.social-container {
  width: 100%;
  display: flex;
  flex-direction: row;
  align-items: center;
}

.social-item {
  width: 200px;
  margin: auto;
  display: flex;
  flex-direction: row;
  justify-content: center;
}

.social-icon {
  width: 40px;
  height: 40px;
}
</style>
