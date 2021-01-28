import request from '@/utils/request'

// 查询用户信息
export function getUserInfo(userId) {
  return request({
    url: '/system/user/' +userId,
    method: 'get',
  })
}

export function login(query) {
  return request({
    url: '/system/user/',
    method: 'get',
    params: query
  })
}

export function logout() {
  return request({
    url: '/user/logout',
    method: 'post'
  })
}
