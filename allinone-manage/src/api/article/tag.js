import request from '@/utils/request'

// 查询标签列表
export function listTag(data) {
  return request({
    url: '/article/tag/list',
    method: 'post',
    data: data
  })
}

// 查询标签列表
export function listTagVo() {
  return request({
    url: '/article/tag/vo',
    method: 'get'
  })
}

// 新增标签
export function addTag(data) {
  return request({
    url: '/article/tag',
    method: 'post',
    data: data
  })
}

// 修改标签
export function updateTag(data) {
  return request({
    url: '/article/tag',
    method: 'put',
    data: data
  })
}

// 删除标签
export function delTag(tagId) {
  return request({
    url: '/article/tag/' + tagId,
    method: 'delete'
  })
}

// 导出标签
export function exportTag(query) {
  return request({
    url: '/article/tag/export',
    method: 'get',
    params: query
  })
}
