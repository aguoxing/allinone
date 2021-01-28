import Vue from "vue";
import App from "./App.vue";
import router from "./router";
import store from "./store";
//全局css
import "@/assets/css/global.css";

import viewUI from "view-design";
import 'view-design/dist/styles/iview.css';

import '@/permission'

import * as filters from './filters' // 全局过滤器
Object.keys(filters).forEach(key => {
  Vue.filter(key, filters[key])
})

// 富文本编辑
import mavonEditor from 'mavon-editor';
import 'mavon-editor/dist/css/index.css';
// use
Vue.use(mavonEditor)
import highlight from "@/directive/highlightCode/highlightCode";

Vue.config.productionTip = false;

Vue.use(viewUI);
Vue.config.productionTip = false;

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount("#app");
