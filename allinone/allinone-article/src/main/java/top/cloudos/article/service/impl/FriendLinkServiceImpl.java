package top.cloudos.article.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import top.cloudos.article.mapper.FriendLinkMapper;
import top.cloudos.article.model.entity.FriendLink;
import top.cloudos.article.service.IFriendLinkService;
import top.cloudos.common.core.page.PageData;
import top.cloudos.common.core.page.Query;
import top.cloudos.common.util.StringUtils;

/**
 * 友链Service业务层处理
 *
 * @author GX
 * @date 2021-01-25
 */
@Service
public class FriendLinkServiceImpl extends ServiceImpl<FriendLinkMapper, FriendLink> implements IFriendLinkService {
    /**
     * 查询友链列表
     *
     * @param friendLink
     * @return
     */
    @Override
    public PageData queryPage(FriendLink friendLink) {
        QueryWrapper<FriendLink> qw = new QueryWrapper<>();
        if (top.cloudos.common.util.StringUtils.isNotNull(friendLink.getName())) {
            qw.like("name", friendLink.getName());
        }
        if (StringUtils.isNotNull(friendLink.getUrl())) {
            qw.like("url", friendLink.getUrl());
        }
        //查询参数
        IPage<FriendLink> page = new Query<FriendLink>().getPage(friendLink.getParams());
        IPage<FriendLink> iPage = baseMapper.selectPage(page, qw);
        return new PageData(iPage);
    }
}
