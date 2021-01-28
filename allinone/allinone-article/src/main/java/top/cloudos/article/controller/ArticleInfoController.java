package top.cloudos.article.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import top.cloudos.article.model.dto.ArticleInfoDTO;
import top.cloudos.article.model.entity.ArticleInfo;
import top.cloudos.article.service.IArticleInfoService;
import top.cloudos.common.annotation.Log;
import top.cloudos.common.core.base.BaseController;
import top.cloudos.common.core.model.AjaxResult;
import top.cloudos.common.core.page.PageData;
import top.cloudos.common.enums.BusinessType;
import top.cloudos.common.util.poi.ExcelUtil;

import java.util.Arrays;
import java.util.List;

/**
 * 文章Controller
 *
 * @author GX
 * @date 2021-01-14
 */
@RestController
@RequestMapping("/article/info")
public class ArticleInfoController extends BaseController {
    @Autowired
    private IArticleInfoService articleInfoService;

    /**
     * 分页查询文章列表
     *
     * @param articleInfo
     * @return
     */
    @PostMapping("/page")
    public AjaxResult getByPage(@RequestBody ArticleInfo articleInfo) {
        PageData pageData = articleInfoService.queryPage(articleInfo);
        return AjaxResult.success(pageData);
    }

    /**
     * 导出文章列表
     */
    @PreAuthorize("@ss.hasPermi('article:content:export')")
    @Log(title = "文章", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export() {
        List<ArticleInfo> list = articleInfoService.list();
        ExcelUtil<ArticleInfo> util = new ExcelUtil<>(ArticleInfo.class);
        return util.exportExcel(list, "info");
    }

    /**
     * 获取文章详细信息
     */
    @GetMapping(value = "/{articleId}")
    public AjaxResult getInfo(@PathVariable("articleId") String articleId) {
        return AjaxResult.success(articleInfoService.getArticleInfo(articleId));
    }

    /**
     * 新增文章
     */
    @PreAuthorize("@ss.hasPermi('article:content:add')")
    @Log(title = "文章", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ArticleInfoDTO articleInfoDTO) {
        return toAjax(articleInfoService.addArticleInfo(articleInfoDTO));
    }

    /**
     * 修改文章
     */
    @PreAuthorize("@ss.hasPermi('article:content:edit')")
    @Log(title = "文章", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ArticleInfoDTO articleInfoDTO) {
        return toAjax(articleInfoService.updateArticleInfo(articleInfoDTO));
    }

    /**
     * 删除文章
     */
    @PreAuthorize("@ss.hasPermi('article:content:remove')")
    @Log(title = "文章", businessType = BusinessType.DELETE)
    @DeleteMapping("/{articleIds}")
    public AjaxResult remove(@PathVariable String[] articleIds) {
        return toAjax(articleInfoService.deleteArticleInfo(Arrays.asList(articleIds)));
    }

    /**
     * 时间轴
     */
    @GetMapping("/timeline")
    public AjaxResult timeLine() {
        return AjaxResult.success(articleInfoService.archiveByYear());
    }

    /**
     * 推荐阅读
     */
    @GetMapping("/recommend")
    public AjaxResult recommendList() {
        return AjaxResult.success(articleInfoService.recommendList());
    }

}
