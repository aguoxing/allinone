<template>
  <div>
    <div id="app" class="main">
      <!-- 导航栏-头部 -->
      <transition name="menu">
        <LayoutHeader v-show="show" class="nav-container"/>
      </transition>
      <!-- 内容部分 -->
      <div class="main-container">
        <div class="auto-padding">
          <Row :gutter="6">
            <Col :xs="24" :sm="18" :md="18" :lg="18" :xl="18">
              <div class="left-container">
                <router-view/>
              </div>
            </Col>
            <Col :xs="24" :sm="6" :md="6" :lg="6" :xl="6">
              <div class="right-container">
                <RightPanel/>
              </div>
            </Col>
          </Row>
        </div>
      </div>
      <Footer/>
      <!-- 底部信息 -->
      <LayoutFooter/>
      <BackTop/>
    </div>
  </div>
</template>

<script>
import LayoutHeader from './LayoutHeader';
import RightPanel from '@/components/article/index'
import LayoutFooter from './LayoutFooter';

export default {
  beforeRouteUpdate (to, from, next) {
    // 在当前路有改变，但是该组件被复用时调用
    // 举例来说，对于一个带有动态参数的路径 /foo/:id，在 /foo/1 和 /foo/2 之间跳转的时候，
    // 由于会渲染同样的 Foo 组件，因此组件实例会被复用。而这个钩子就会在这个情况下被调用。
    // 可以访问组件实例 `this`
    if (to.path) {
      console.log(to.path)
    }
    next();
  },
  components: {
    LayoutHeader,
    RightPanel,
    LayoutFooter
  },
  data() {
    return {
      show: true
    }
  },
  created() {
    this.mouseScroll()
  },
  methods: {
    mouseScroll() {
      // 给页面绑定滑轮滚动事件
      if (document.addEventListener) { // firefox
        document.addEventListener('DOMMouseScroll', this.watchScroll, false)
      }
      // 滚动滑轮触发scrollFunc方法  //ie 谷歌
      window.onmousewheel = document.onmousewheel = this.watchScroll
    },
    initLive2d() {
      setTimeout(() => {
        window.L2Dwidget.init({
          pluginRootPath: 'live2dw/',
          pluginJsPath: 'lib/',
          pluginModelPath: 'live2d-widget-model-shizuku/assets/',
          tagMode: false,
          debug: false,
          model: {
            jsonPath: '../live2dw/live2d-widget-model-shizuku/assets/shizuku.model.json'
          },
          display: {
            position: 'left',
            width: 240,
            height: 480
          },
          mobile: {
            show: true
          },
          log: false
        })
      }, 1000)
    },
    watchScroll(e) {
      e = e || window.event
      if (e.wheelDelta) {
        if (e.wheelDelta > 0 && this.show === false) {
          // 当滑轮向上滚动
          this.show = true
        }
        if (e.wheelDelta < 0 && this.show === true) {
          // 当滑轮向下滚动
          this.show = false
        }
      } else if (e.detail) {
        if (e.detail < 0 && this.show === false) {
          // 当滑轮向上滚动
          this.show = true
        }
        if (e.detail > 0 && this.show === true) {
          // 当滑轮向下滚动
          this.show = false
        }
      }
    }
  }
}
</script>

<style>
/* >=768的设备 */
@media (min-width: 768px) {
  .main-container {
    min-width: 768px;
    margin: auto;
    display: flex;
    flex-direction: row;
  }

  .auto-padding {
    width: 90%;
    margin: 0 auto;
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

  .auto-padding {
    width: 85%;
    margin: 0 auto;
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

  .auto-padding {
    width: 80%;
    margin: 0 auto;
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

  .auto-padding {
    width: 95%;
    margin: 0 auto;
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

  .auto-padding {
    width: 95%;
    margin: 0 auto;
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

  .auto-padding {
    width: 95%;
    margin: 0 auto;
  }
}

.main {
  background-color: #f5f5f5;
}

.left-container {
  width: 100%;
}

.right-container {
  width: 100%;
}

.nav-container {
  position: sticky;
  top: 0;
  z-index: 10;
  width: 100%;
}

/* 可以设置不同的进入和离开动画 */
/* 设置持续时间和动画函数 */
.menu-enter-active,
.menu-leave-active {
  transition: all .8s ease;
}

.menu-enter,
.menu-leave-to

  /* .menu-leave-active for below version 2.1.8 */
{
  transform: translateY(-70px);
  opacity: 0;
}

.ivu-card-head {
  border-left: 2px solid skyblue;
}

.ivu-card {
  border-radius: 0 !important;
  margin-bottom: 2px;
}
</style>
