<template>
  <div class="main-container" style="background-color: #ffffff;margin-bottom: 10px;">
    <!-- pc端menu start -->
    <div style="width: 85%;margin: 0 auto;" class="pc-menu">
      <Row>
        <Col :xs="24" :sm="6" :md="6" :lg="6" :xl="6">
          <div class="left-container">
            <div class="nav-logo">
              <img src="@/assets/logo-icon.png" class="logo-img">
            </div>
          </div>
        </Col>
        <Col :xs="24" :sm="18" :md="18" :lg="18" :xl="18">
          <div class="right-container">
            <Menu mode="horizontal" active-name="index">
              <MenuItem name="index">
                <router-link to="/">
                  首页
                </router-link>
              </MenuItem>
              <MenuItem name="category">
                <router-link to="/category">
                  分类
                </router-link>
              </MenuItem>
              <MenuItem name="archive">
                <router-link to="/archive">
                  归档
                </router-link>
              </MenuItem>
              <MenuItem name="about">
                <router-link to="/about">
                  关于
                </router-link>
              </MenuItem>
              <MenuItem name="login">
                <Dropdown v-if="name">
                  <Avatar icon="ios-person" :src="avatar"/>
                  <DropdownMenu slot="list">
                    <DropdownItem>
                      <router-link to="/user">
                        个人中心
                      </router-link>
                    </DropdownItem>
                    <DropdownItem divided @click.native="logout">
                      退出登录
                    </DropdownItem>
                  </DropdownMenu>
                </Dropdown>
                <router-link v-else to="/login">
                  登录
                </router-link>
              </MenuItem>
            </Menu>
          </div>
        </Col>
      </Row>
    </div>
    <!-- pc端menu end -->

    <!-- 移动端menu start -->
    <!-- 抽屉 -->
    <div class="mobile-menu">
      <Drawer placement="left" :closable="false" v-model="openMenu">
        <div slot="header" class="mobile-menu-header">
          <Avatar size="large" :src="avatar==='' ? 'http://cdn.cloudos.top/avatar.jpg': avatar"/>
          <div style="margin-top: 10px">
            <p v-if="name">{{ name }}</p>
            <p v-else>GX的博客</p>
          </div>
        </div>
        <Menu :theme="theme" active-name="index">
          <MenuGroup title="账号">
            <div v-if="name">
              <MenuItem name="my">
                <router-link to="/user">
                  个人中心
                </router-link>
              </MenuItem>
              <MenuItem name="logout" divided @click.native="logout">
                  退出登录
              </MenuItem>
            </div>
            <MenuItem v-else name="login">
              <router-link to="/login">
                登录
              </router-link>
            </MenuItem>
          </MenuGroup>
          <MenuGroup title="文章">
            <MenuItem name="index">
              <router-link to="/">
                首页
              </router-link>
            </MenuItem>
            <MenuItem name="category">
              <router-link to="/category">
                分类
              </router-link>
            </MenuItem>
            <MenuItem name="archive">
              <router-link to="/archive">
                归档
              </router-link>
            </MenuItem>
          </MenuGroup>
          <MenuGroup title="其他">
            <MenuItem name="github">
              Github
            </MenuItem>
            <MenuItem name="qq">
              QQ
            </MenuItem>
            <MenuItem name="about">
              <router-link to="/about">
                关于
              </router-link>
            </MenuItem>
          </MenuGroup>
        </Menu>
      </Drawer>
    </div>

    <div style="width: 100%;margin: 0 auto;" class="mobile-menu">
      <div>
        <Menu mode="horizontal">
          <div style="margin-left: 10px;">
            <Icon type="md-menu" size="24" @click="openMenu = true"/>
          </div>
        </Menu>
      </div>
    </div>
    <!-- 移动端menu end -->

  </div>
</template>

<script>
import {
  mapGetters
} from 'vuex'
import {Modal} from "view-design";
import store from "@/store";

export default {
  data() {
    return {
      value: '',
      openMenu: false,
      theme: 'light'
    }
  },
  components: {},
  computed: {
    ...mapGetters(['name', 'avatar']),
  },
  watch: {
    $route: {
      handler: function (route) {
        this.redirect = route.query && route.query.redirect
      },
      immediate: true
    }
  },
  methods: {
    async logout() {
      this.$Modal.confirm({
        title: '提示',
        content: '确定注销并退出系统吗？',
        okText: '确定',
        cancelText: '取消',
        onOk: () => {
          this.$store.dispatch('LogOut').then(() => {
            location.href = '/';
          })
        }
      })
    }
  }
}
</script>

<style scoped>
.mobile-menu-header {
  width: 100%;
  height: 100px;
  text-align: center;
}

/* >=768的设备 */
@media (min-width: 768px) {
  .main-container {
    min-width: 768px;
    margin: auto;
    display: flex;
    flex-direction: row;
  }

  .mobile-menu {
    display: none;
  }
}

/* >=992的设备 */
@media (min-width: 992px) {
  .main-container {
    min-width: 992px;
    margin: auto;
    display: flex;
    flex-direction: row;
  }

  .mobile-menu {
    display: none;
  }
}

/* >=1200的设备 */
@media (min-width: 1200) {
  .main-container {
    min-width: 1200px;
    margin: auto;
    display: flex;
    flex-direction: row;
  }

  .pc-menu {
    display: none;
  }
}

/* <=1199的设备 */
@media (max-width: 1199) {
  .main-container {
    max-width: 1200px;
    margin: auto;
    display: flex;
    flex-direction: row;
  }

  .pc-menu {
    display: none;
  }
}

/* <=991的设备 */
@media (max-width: 991px) {
  .main-container {
    max-width: 991px;
    margin: auto;
    display: flex;
    flex-direction: row;
  }

  .pc-menu {
    display: none;
  }
}

/* <=768的设备 */
@media (max-width: 767px) {
  .main-container {
    max-width: 767px;
    margin: auto;
    display: flex;
    flex-direction: row;
  }

  .pc-menu {
    display: none;
  }
}

.left-container {
  width: 100%;
}

.right-container {
  width: 100%;
  display: flex;
  flex-direction: row;
  justify-content: flex-end;
  align-items: center;
}

.menu-container {
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  align-items: center;
  padding: 0 60px;
  background-color: #ffffff;
  margin-bottom: 10px;
}

.nav-logo {
  display: flex;
  flex-direction: row;
  align-items: center;
}

.logo-img {
  widows: 180px;
  height: 60px;
}

.nav {
  display: flex;
  flex-direction: row;
  align-items: center;
  margin-right: 40px;
}

.ivu-menu-horizontal {
  border-bottom: none !important;
}

.ivu-menu-horizontal.ivu-menu-light:after {
  background: none;
}

.ivu-menu-horizontal a {
  color: black;
}
</style>
