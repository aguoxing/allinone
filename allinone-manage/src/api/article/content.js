import request from '@/utils/request'

// 查询文章列表
export function listInfo(data) {
  return request({
    url: '/article/info/page',
    method: 'post',
    data: data
  })
}

// 预览
export function getInfo(articleId) {
  return request({
    url: '/article/info/' + articleId,
    method: 'get'
  })
}

// 预览
export function previewArticle(articleId) {
  return request({
    url: '/article/info/' + articleId,
    method: 'get'
  })
}

// 新增文章
export function addInfo(data) {
  return request({
    url: '/article/info',
    method: 'post',
    data: data
  })
}

// 修改文章
export function updateInfo(data) {
  return request({
    url: '/article/info',
    method: 'put',
    data: data
  })
}

// 删除文章
export function delInfo(articleId) {
  return request({
    url: '/article/info/' + articleId,
    method: 'delete'
  })
}

// 导出文章
export function exportInfo(query) {
  return request({
    url: '/article/info/export',
    method: 'get',
    params: query
  })
}
