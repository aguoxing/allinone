package top.cloudos.article.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import top.cloudos.article.model.entity.ArticleTag;
import top.cloudos.article.service.IArticleTagService;
import top.cloudos.common.annotation.Log;
import top.cloudos.common.core.base.BaseController;
import top.cloudos.common.core.model.AjaxResult;
import top.cloudos.common.core.page.PageData;
import top.cloudos.common.enums.BusinessType;
import top.cloudos.common.util.poi.ExcelUtil;

import java.util.Arrays;
import java.util.List;

/**
 * 标签Controller
 *
 * @author GX
 * @date 2021-01-14
 */
@RestController
@RequestMapping("/article/tag")
public class ArticleTagController extends BaseController {
    @Autowired
    private IArticleTagService articleTagService;

    /**
     * 查询标签列表
     */
    @PreAuthorize("@ss.hasPermi('article:tag:list')")
    @PostMapping("/list")
    public AjaxResult getByPage(@RequestBody ArticleTag articleTag) {
        PageData pageData = articleTagService.queryPage(articleTag);
        return AjaxResult.success(pageData);
    }

    /**
     * 查询标签vo tagName-articleCount
     * @return
     */
    @GetMapping("/vo")
    public AjaxResult getTagVO() {
        return AjaxResult.success(articleTagService.queryTagVO());
    }

    /**
     * 导出标签列表
     */
    @PreAuthorize("@ss.hasPermi('article:tag:export')")
    @Log(title = "标签", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(ArticleTag articleTag) {
        List<ArticleTag> list = articleTagService.queryTagList(articleTag);
        ExcelUtil<ArticleTag> util = new ExcelUtil<ArticleTag>(ArticleTag.class);
        return util.exportExcel(list, "tag");
    }

    /**
     * 获取标签详细信息
     */
    @PreAuthorize("@ss.hasPermi('article:tag:query')")
    @GetMapping(value = "/{tagId}")
    public AjaxResult getInfo(@PathVariable("tagId") Long tagId) {
        return AjaxResult.success(articleTagService.getById(tagId));
    }

    /**
     * 新增标签
     */
    @PreAuthorize("@ss.hasPermi('article:tag:add')")
    @Log(title = "标签", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ArticleTag articleTag) {
        return toAjax(articleTagService.save(articleTag));
    }

    /**
     * 修改标签
     */
    @PreAuthorize("@ss.hasPermi('article:tag:edit')")
    @Log(title = "标签", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ArticleTag articleTag) {
        return toAjax(articleTagService.updateById(articleTag));
    }

    /**
     * 删除标签
     */
    @PreAuthorize("@ss.hasPermi('article:tag:remove')")
    @Log(title = "标签", businessType = BusinessType.DELETE)
    @DeleteMapping("/{tagIds}")
    public AjaxResult remove(@PathVariable Long[] tagIds) {
        return toAjax(articleTagService.deleteTag(Arrays.asList(tagIds)));
    }
}
