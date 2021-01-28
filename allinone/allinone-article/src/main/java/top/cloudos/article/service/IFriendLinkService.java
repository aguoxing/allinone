package top.cloudos.article.service;

import com.baomidou.mybatisplus.extension.service.IService;
import top.cloudos.article.model.entity.FriendLink;
import top.cloudos.common.core.page.PageData;

/**
 * 友链Service接口
 *
 * @author GX
 * @date 2021-01-25
 */
public interface IFriendLinkService extends IService<FriendLink> {

    /**
     * 查询友链列表
     * @param friendLink
     * @return
     */
    PageData queryPage(FriendLink friendLink);
}
