(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-c65afd92"],{"1d34":function(t,e,i){},"230c":function(t,e,i){"use strict";i.r(e);var a=function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("div",[i("div",{staticClass:"blog-bg"},[i("div",{staticClass:"blog-title"},[t._v(t._s(t.article.title))]),i("div",{staticClass:"blog-item"},[i("div",{staticClass:"blog-time"},[t._v(t._s(t.article.createTime)+" | create by "+t._s(t.article.author))]),i("div",{staticClass:"blog-type"},[t._v(" 分类："+t._s(t.article.categoryName)+" ")])]),i("div",{staticClass:"blog-content"},[i("no-ssr",[i("mavon-editor",{attrs:{subfield:!1,"box-shadow":!1,"default-open":"preview","toolbars-flag":!1,ishljs:!0},model:{value:t.article.content,callback:function(e){t.$set(t.article,"content",e)},expression:"article.content"}})],1)],1),i("div",{staticClass:"blog-action"},[i("List",[i("ListItem",[i("li",[i("Icon",{attrs:{type:"ios-eye-outline",size:"18"}}),t._v(" "+t._s(t.article.viewCount)+" ")],1),i("Divider",{attrs:{type:"vertical"}}),i("li",[i("Icon",{attrs:{type:"ios-thumbs-up-outline",size:"18"}}),t._v(" "+t._s(t.article.likeCount)+" ")],1),i("Divider",{attrs:{type:"vertical"}}),i("li",[i("Icon",{attrs:{type:"ios-chatbubbles-outline",size:"18"}}),t._v(" "+t._s(t.article.commentCount)+" ")],1)],1)],1),i("div",{staticClass:"last-update"},[t._v(" 最后更新于："+t._s(null==t.article.updateTime?t.article.createTime:t.article.updateTime)+" ")])],1)]),t.loading?i("Spin",{attrs:{size:"large",fix:""}}):t._e(),i("div",{staticClass:"blog-comment"},[i("CommentPanel")],1)],1)},n=[],s=i("5530"),c=i("2f62"),o=function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("div",{staticClass:"comment-container"},[i("Card",{staticClass:"comment-list",attrs:{"dis-hover":""}},[i("div",{staticClass:"comment-input"},[i("Input",{staticStyle:{width:"90%"},attrs:{type:"textarea",autosize:{minRows:2,maxRows:5},maxlength:"300","show-word-limit":"",placeholder:"Enter something..."},model:{value:t.comment,callback:function(e){t.comment=e},expression:"comment"}}),i("Button",{attrs:{type:"info"},on:{click:t.handleComment}},[t._v("发送")])],1),i("List",{attrs:{"item-layout":"vertical"}},[i("ListItem",[i("ListItemMeta",{attrs:{avatar:"https://dev-file.iviewui.com/userinfoPDvn9gKWYihR24SpgC319vXY8qniCqj4/avatar",title:"This is title"}},[i("template",{slot:"description"},[i("p",[t._v("asdasdasdasd")]),i("p",[t._v("回复")])])],2),i("ListItemMeta",{attrs:{avatar:"https://dev-file.iviewui.com/userinfoPDvn9gKWYihR24SpgC319vXY8qniCqj4/avatar",title:"This is title"}},[i("template",{slot:"description"},[i("p",[t._v("asdasdasdasd")]),i("p",[t._v("回复")])])],2)],1)],1)],1)],1)},r=[],l={name:"CommentPanel",data:function(){return{comment:""}},methods:{handleComment:function(){this.$Message.info("评论功能待实现...")}}},u=l,d=(i("676d"),i("2877")),m=Object(d["a"])(u,o,r,!1,null,"c7d14d0e",null),v=m.exports,f=i("2423"),p=(i("0e54"),{data:function(){return{loading:!0,article:{},comment:{},message:{}}},components:{CommentPanel:v},computed:Object(s["a"])(Object(s["a"])({},Object(c["b"])(["name"])),Object(c["b"])(["avatar"])),watch:{$route:{handler:function(t){this.redirect=t.query&&t.query.redirect},immediate:!0}},created:function(){var t=this.$route.params.id;this.getArticleDetail(t)},methods:{getArticleDetail:function(t){var e=this;this.loading=!0,Object(f["a"])(t).then((function(t){e.article=t.data,document.title=e.article.title+" - GX的博客",e.loading=!1}))}}}),h=p,b=(i("71ce"),Object(d["a"])(h,a,n,!1,null,"822623ce",null));e["default"]=b.exports},2423:function(t,e,i){"use strict";i.d(e,"b",(function(){return n})),i.d(e,"c",(function(){return s})),i.d(e,"a",(function(){return c})),i.d(e,"d",(function(){return o}));var a=i("b775");function n(t){return Object(a["a"])({url:"/article/info/list",method:"post",params:t})}function s(){return Object(a["a"])({url:"/article/info/recommend",method:"get"})}function c(t){return Object(a["a"])({url:"/article/info/"+t,method:"get"})}function o(){return Object(a["a"])({url:"/article/info/timeline",method:"get"})}},"676d":function(t,e,i){"use strict";i("1d34")},"71ce":function(t,e,i){"use strict";i("7ff5")},"7ff5":function(t,e,i){}}]);