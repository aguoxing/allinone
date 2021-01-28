package top.cloudos.article.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import top.cloudos.article.model.entity.FriendLink;
import top.cloudos.article.service.IFriendLinkService;
import top.cloudos.common.annotation.Log;
import top.cloudos.common.core.base.BaseController;
import top.cloudos.common.core.model.AjaxResult;
import top.cloudos.common.core.page.PageData;
import top.cloudos.common.enums.BusinessType;
import top.cloudos.common.util.poi.ExcelUtil;

import java.util.Arrays;
import java.util.List;

/**
 * 友链Controller
 *
 * @author GX
 * @date 2021-01-25
 */
@RestController
@RequestMapping("/article/link" )
public class FriendLinkController extends BaseController {
    @Autowired
    private IFriendLinkService friendLinkService;

    /**
     * 查询友链列表
     *
     * @param friendLink
     * @return
     */
    @PostMapping("/page")
    public AjaxResult getByPage(@RequestBody FriendLink friendLink) {
        PageData pageData = friendLinkService.queryPage(friendLink);
        return AjaxResult.success(pageData);
    }

    /**
     * 导出友链列表
     */
    @PreAuthorize("@ss.hasPermi('article:link:export')" )
    @Log(title = "友链" , businessType = BusinessType.EXPORT)
    @GetMapping("/export" )
    public AjaxResult export() {
        List<FriendLink> list = friendLinkService.list();
        ExcelUtil<FriendLink> util = new ExcelUtil<>(FriendLink.class);
        return util.exportExcel(list, "link" );
    }

    /**
     * 获取友链详细信息
     */
    @PreAuthorize("@ss.hasPermi('article:link:query')" )
    @GetMapping(value = "/{linkId}" )
    public AjaxResult getInfo(@PathVariable("linkId" ) Long linkId) {
        return AjaxResult.success(friendLinkService.getById(linkId));
    }

    /**
     * 新增友链
     */
    @PreAuthorize("@ss.hasPermi('article:link:add')" )
    @Log(title = "友链" , businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody FriendLink friendLink) {
        return toAjax(friendLinkService.save(friendLink));
    }

    /**
     * 修改友链
     */
    @PreAuthorize("@ss.hasPermi('article:link:edit')" )
    @Log(title = "友链" , businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody FriendLink friendLink) {
        return toAjax(friendLinkService.updateById(friendLink));
    }

    /**
     * 删除友链
     */
    @PreAuthorize("@ss.hasPermi('article:link:remove')" )
    @Log(title = "友链" , businessType = BusinessType.DELETE)
    @DeleteMapping("/{linkIds}" )
    public AjaxResult remove(@PathVariable Long[] linkIds) {
        return toAjax(friendLinkService.removeByIds(Arrays.asList(linkIds)));
    }
}
