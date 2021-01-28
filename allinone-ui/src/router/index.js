import Vue from "vue";
import VueRouter from "vue-router";

Vue.use(VueRouter);

const constantRoutes = [
  {
    path: "/",
    redirect: "/",
    component: () => import("@/layout/AppMain"),
    children: [
      {
        path: "/",
        name: "Index",
        component: () => import("@/views/index/index"),
        meta: {title: "首页"}
      }
    ]
  },

  {
    path: '/article',
    name: 'Article',
    redirect: "/",
    component: () => import('@/layout/ArticleMain'),
    children: [
      {
        path: '/article/details/:id',
        name: 'Details',
        component: () => import('@/views/article/index'),
        meta: {title: '文章详情'}
      },
      {
        path: "/category",
        name: "Category",
        component: () => import("@/views/category/index"),
        meta: {title: "分类"}
      },
      {
        path: "/archive",
        name: "Archive",
        component: () => import("@/views/timeline/index"),
        meta: {title: "归档"}
      },
      {
        path: "/about",
        name: "About",
        component: () => import("@/views/about/index"),
        meta: {title: "关于"}
      },
    ]
  },
  {
    path: "/user",
    name: "User",
    component: () => import("@/views/user/index"),
    meta: {title: "个人中心"}
  },
  {
    path: "/login",
    name: "Login",
    component: () => import("@/views/login/index"),
    meta: {title: "用户登录"}
  }
];

const createRouter = () =>
  new VueRouter({
    mode: 'history', // require service support
    scrollBehavior: () => ({y: 0}),
    routes: constantRoutes
  });

const router = createRouter();

export function resetRouter() {
  const newRouter = createRouter();
  router.matcher = newRouter.matcher; // reset router
}

export default router;
