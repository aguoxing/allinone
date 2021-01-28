import request from '@/utils/request'

// 查询分类列表
export function listCategory(data) {
  return request({
    url: '/article/category/list',
    method: 'post',
    data: data
  })
}

// 查询分类列表
export function listCategoryVo() {
  return request({
    url: '/article/category/vo',
    method: 'get'
  })
}

// 新增分类
export function addCategory(data) {
  return request({
    url: '/article/category',
    method: 'post',
    data: data
  })
}

// 修改分类
export function updateCategory(data) {
  return request({
    url: '/article/category',
    method: 'put',
    data: data
  })
}

// 删除分类
export function delCategory(categoryId) {
  return request({
    url: '/article/category/' + categoryId,
    method: 'delete'
  })
}

// 导出分类
export function exportCategory(query) {
  return request({
    url: '/article/category/export',
    method: 'get',
    params: query
  })
}
