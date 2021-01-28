package top.cloudos.portal.controller.system;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import top.cloudos.common.constant.Constants;
import top.cloudos.common.core.base.BaseController;
import top.cloudos.common.core.model.AjaxResult;
import top.cloudos.common.core.model.LoginBody;
import top.cloudos.common.core.model.LoginUser;
import top.cloudos.common.core.model.entity.SysMenu;
import top.cloudos.common.core.model.entity.SysUser;
import top.cloudos.common.util.ServletUtils;
import top.cloudos.framework.web.service.SysLoginService;
import top.cloudos.framework.web.service.SysPermissionService;
import top.cloudos.framework.web.service.TokenService;
import top.cloudos.system.service.SysMenuService;

import java.util.List;
import java.util.Set;

/**
 * <p>
 * 登录验证 前端控制器
 * </p>
 *
 * @author GX
 * @since 2021-01-12
 */
@RestController
public class SysLoginController extends BaseController {
    @Autowired
    private SysLoginService loginService;
    @Autowired
    private SysMenuService menuService;
    @Autowired
    private SysPermissionService permissionService;
    @Autowired
    private TokenService tokenService;

    /**
     * 登录方法
     *
     * @param loginBody 登录信息
     * @return 结果
     */
    @PostMapping("/login")
    public AjaxResult login(@RequestBody LoginBody loginBody) {
        AjaxResult ajax = AjaxResult.success();
        // 生成令牌
        String token = loginService.login(loginBody.getUsername(), loginBody.getPassword(), loginBody.getCode(),
                loginBody.getUuid());
        ajax.put(Constants.TOKEN, token);
        return ajax;
    }

    /**
     * 获取用户信息
     *
     * @return 用户信息
     */
    @GetMapping("getInfo")
    public AjaxResult getInfo() {
        LoginUser loginUser = tokenService.getLoginUser(ServletUtils.getRequest());
        SysUser user = loginUser.getUser();
        // 角色集合
        Set<String> roles = permissionService.getRolePermission(user);
        // 权限集合
        Set<String> permissions = permissionService.getMenuPermission(user);
        AjaxResult ajax = AjaxResult.success();
        ajax.put("user", user);
        ajax.put("roles", roles);
        ajax.put("permissions", permissions);
        return ajax;
    }

    /**
     * 获取路由信息
     *
     * @return 路由信息
     */
    @GetMapping("getRouters")
    public AjaxResult getRouters() {
        LoginUser loginUser = tokenService.getLoginUser(ServletUtils.getRequest());
        // 用户信息
        SysUser user = loginUser.getUser();
        List<SysMenu> menus = menuService.selectMenuTreeByUserId(user.getUserId());
        return AjaxResult.success(menuService.buildMenus(menus));
    }
}
