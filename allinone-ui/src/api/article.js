import request from '@/utils/request'

// 查询文章列表
export function listArticle(data) {
  return request({
    url: '/article/info/page',
    method: 'post',
    data: data
  })
}

// 查询文章列表
export function listRecommend() {
  return request({
    url: '/article/info/recommend',
    method: 'get',
  })
}

// 查询文章详细
export function articleDetail(articleId) {
  return request({
    url: '/article/info/' + articleId,
    method: 'get'
  })
}

// 时间轴
export function timeLine() {
  return request({
    url: '/article/info/timeline',
    method: 'get'
  })
}
