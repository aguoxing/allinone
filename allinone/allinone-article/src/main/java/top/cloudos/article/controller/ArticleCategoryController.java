package top.cloudos.article.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import top.cloudos.article.model.entity.ArticleCategory;
import top.cloudos.article.service.IArticleCategoryService;
import top.cloudos.common.annotation.Log;
import top.cloudos.common.core.base.BaseController;
import top.cloudos.common.core.model.AjaxResult;
import top.cloudos.common.core.page.PageData;
import top.cloudos.common.enums.BusinessType;
import top.cloudos.common.util.poi.ExcelUtil;

import java.util.Arrays;
import java.util.List;

/**
 * 分类Controller
 *
 * @author GX
 * @date 2021-01-14
 */
@RestController
@RequestMapping("/article/category" )
public class ArticleCategoryController extends BaseController {
    @Autowired
    private IArticleCategoryService articleCategoryService;

    /**
     * 查询分类列表
     */
    @PreAuthorize("@ss.hasPermi('article:category:list')")
    @PostMapping("/list")
    public AjaxResult getByPage(@RequestBody ArticleCategory articleCategory) {
        PageData pageData = articleCategoryService.queryPage(articleCategory);
        return AjaxResult.success(pageData);
    }

    /**
     * 查询分类vo categoryName-articleCount
     * @return
     */
    @GetMapping("/vo")
    public AjaxResult getCategoryVO() {
        return AjaxResult.success(articleCategoryService.queryCategoryVO());
    }

    /**
     * 导出分类列表
     */
    @PreAuthorize("@ss.hasPermi('article:category:export')" )
    @Log(title = "分类" , businessType = BusinessType.EXPORT)
    @GetMapping("/export" )
    public AjaxResult export(ArticleCategory articleCategory) {
        List<ArticleCategory> list = articleCategoryService.queryList(articleCategory);
        ExcelUtil<ArticleCategory> util = new ExcelUtil<ArticleCategory>(ArticleCategory.class);
        return util.exportExcel(list, "category" );
    }

    /**
     * 获取分类详细信息
     */
    @PreAuthorize("@ss.hasPermi('article:category:query')" )
    @GetMapping(value = "/{categoryId}" )
    public AjaxResult getInfo(@PathVariable("categoryId" ) Long categoryId) {
        return AjaxResult.success(articleCategoryService.getById(categoryId));
    }

    /**
     * 新增分类
     */
    @PreAuthorize("@ss.hasPermi('article:category:add')" )
    @Log(title = "分类" , businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ArticleCategory articleCategory) {
        return toAjax(articleCategoryService.save(articleCategory));
    }

    /**
     * 修改分类
     */
    @PreAuthorize("@ss.hasPermi('article:category:edit')" )
    @Log(title = "分类" , businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ArticleCategory articleCategory) {
        return toAjax(articleCategoryService.updateById(articleCategory));
    }

    /**
     * 删除分类
     */
    @PreAuthorize("@ss.hasPermi('article:category:remove')" )
    @Log(title = "分类" , businessType = BusinessType.DELETE)
    @DeleteMapping("/{categoryIds}" )
    public AjaxResult remove(@PathVariable Long[] categoryIds) {
        return toAjax(articleCategoryService.deleteCategory(Arrays.asList(categoryIds)));
    }
}
