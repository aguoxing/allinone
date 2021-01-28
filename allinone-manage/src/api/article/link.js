import request from '@/utils/request'

// 查询友链列表
export function listLink(data) {
  return request({
    url: '/article/link/page',
    method: 'post',
    data: data
  })
}

// 查询友链详细
export function getLink(linkId) {
  return request({
    url: '/article/link/' + linkId,
    method: 'get'
  })
}

// 新增友链
export function addLink(data) {
  return request({
    url: '/article/link',
    method: 'post',
    data: data
  })
}

// 修改友链
export function updateLink(data) {
  return request({
    url: '/article/link',
    method: 'put',
    data: data
  })
}

// 删除友链
export function delLink(linkId) {
  return request({
    url: '/article/link/' + linkId,
    method: 'delete'
  })
}

// 导出友链
export function exportLink(query) {
  return request({
    url: '/article/link/export',
    method: 'get',
    params: query
  })
}
