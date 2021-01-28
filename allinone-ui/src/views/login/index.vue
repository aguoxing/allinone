<template>
  <div class="login-container">
    <Card style="width:350px">
      <h3 class="title">GX的博客</h3>
      <Tabs value="account">
        <TabPane label="账号密码登录" name="account">
          <Form ref="loginForm" :model="loginForm" :rules="loginRules" class="login-form">
            <FormItem prop="username">
              <Input prefix="md-contact" placeholder="账号" type="text" v-model="loginForm.username"/>
            </FormItem>
            <FormItem prop="password">
              <Input prefix="md-lock" placeholder="密码" type="password" v-model="loginForm.password"/>
            </FormItem>
            <FormItem prop="code">
              <div class="code-info">
                <Input prefix="md-key" placeholder="验证码" type="text" v-model="loginForm.code" style="width: 63%"
                       @keyup.enter.native="handleLogin"/>
                <div class="login-code">
                  <img :src="codeUrl" @click="getCode" class="login-code-img"/>
                </div>
              </div>
            </FormItem>
            <div class="account-info">
              <Checkbox style="font-size: 12px" v-model="loginForm.rememberMe">记住密码</Checkbox>
              <div>
                <router-link to="/resetPassword">忘记密码</router-link>
              </div>
            </div>
            <FormItem>
              <Button type="primary" :loading="loading" @click="handleLogin" long>
                <span v-if="!loading">登录</span>
                <span v-else>登录中...</span>
              </Button>
            </FormItem>
          </Form>
        </TabPane>
        <TabPane label="手机号码登录" name="phoneNumber">
          <Form ref="loginForm" :model="loginForm" :rules="loginRules" class="login-form">
            <FormItem prop="phoneNumber">
              <Input prefix="md-phone-portrait" placeholder="手机号码" type="tel" v-model="loginForm.phoneNumber"
                     auto-complete="off"/>
            </FormItem>
            <FormItem prop="code">
              <div class="code-info">
                <Input prefix="md-key" placeholder="验证码" type="text" v-model="loginForm.phoneCode" style="width: 80%"
                       number/>
                <span slot="append" style="font-size: 12px">获取验证码</span>
              </div>
            </FormItem>
            <FormItem>
              <Button type="primary" :loading="loading" @click="handleLogin" long>
                <span v-if="!loading">登录</span>
                <span v-else>登录中...</span>
              </Button>
            </FormItem>
          </Form>
        </TabPane>
      </Tabs>
      <div class="account-info">
        <div>
          其他方式登录
          <router-link to="/login/github">
            <Icon type="logo-github" size="18" color="gray"/>
          </router-link>
        </div>
        <div>
          <router-link to="/register">注册账户</router-link>
        </div>
      </div>
    </Card>
  </div>
</template>

<script>
import {getCodeImg} from "@/api/login";
import Cookies from "js-cookie";
import {encrypt, decrypt} from '@/utils/jsencrypt'

export default {
  data() {
    return {
      loading: false,
      codeUrl: "",
      loginForm: {
        username: "guest",
        password: "guest123",
        rememberMe: false,
        code: "",
        uuid: "",
        phoneCode: ''
      },
      loginRules: {
        username: [
          {required: true, trigger: "blur", message: "用户名不能为空"}
        ],
        password: [
          {required: true, trigger: "blur", message: "密码不能为空"}
        ],
        code: [{required: true, trigger: "change", message: "验证码不能为空"}]
      },
    }
  },
  created() {
    this.getCode()
  },
  watch: {
    $route: {
      handler: function(route) {
        this.redirect = route.query && route.query.redirect
      },
      immediate: true
    }
  },
  methods: {
    getCode() {
      getCodeImg().then(res => {
        this.codeUrl = "data:image/gif;base64," + res.img;
        this.loginForm.uuid = res.uuid;
      });
    },
    getCookie() {
      const username = Cookies.get("username");
      const password = Cookies.get("password");
      const rememberMe = Cookies.get('rememberMe')
      this.loginForm = {
        username: username === undefined ? this.loginForm.username : username,
        password: password === undefined ? this.loginForm.password : decrypt(password),
        rememberMe: rememberMe === undefined ? false : Boolean(rememberMe)
      };
    },
    handleLogin() {
      this.$refs.loginForm.validate(valid => {
        if (valid) {
          this.loading = true;
          if (this.loginForm.rememberMe) {
            Cookies.set("username", this.loginForm.username, {expires: 30});
            Cookies.set("password", encrypt(this.loginForm.password), {expires: 30});
            Cookies.set('rememberMe', this.loginForm.rememberMe, {expires: 30});
          } else {
            Cookies.remove("username");
            Cookies.remove("password");
            Cookies.remove('rememberMe');
          }
          this.$store
            .dispatch("Login", this.loginForm)
            .then(() => {
              this.$router.push({path: this.redirect || "/"});
              this.$Message.info('登录成功');
            })
            .catch(() => {
              this.loading = false;
              this.getCode();
            });
        }
      });
    }
  }
}
</script>

<style scoped>
.title {
  text-align: center;
  margin-bottom: 10px;
}

.login-container {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100%;
  background-size: cover;
}

.code-info {
  display: flex;
  justify-content: space-around;
}

.login-code {
  width: 33%;
  height: 38px;
  float: right;
}

.login-code-img {
  width: auto;
  height: 32px;
  float: right;
  cursor: pointer;
  vertical-align: middle;
}

.account-info {
  display: flex;
  justify-content: space-between;
  font-size: 12px;
  margin-bottom: 10px;
}

/*tags 文字居中*/
.outer-class .ivu-tabs-nav-wrap{
  text-align: center;
}
.outer-class .ivu-tabs-nav-scroll{
  display: inline-block;
}
</style>
