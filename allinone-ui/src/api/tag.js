import request from '@/utils/request'

// 查询标签列表
export function listTagVo() {
  return request({
    url: '/article/tag/vo',
    method: 'get'
  })
}
