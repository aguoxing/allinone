import request from '@/utils/request'

// 查询分类列表
export function listCategoryVo() {
  return request({
    url: '/article/category/vo',
    method: 'get'
  })
}
