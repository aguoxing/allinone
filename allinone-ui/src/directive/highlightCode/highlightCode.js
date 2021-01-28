import Vue from 'vue'
import highlight from 'highlight.js'
import 'highlight.js/styles/googlecode.css' // 样式文件

Vue.directive('highlight', function (el) {
  let blocks = el.querySelectorAll('pre code')
  blocks.forEach((block) => {
    highlight.highlightBlock(block)
  })
})
