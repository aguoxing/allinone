package top.cloudos.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import top.cloudos.system.model.entity.SysLoginLog;

import java.util.List;

/**
 * <p>
 * 系统访问记录 服务类
 * </p>
 *
 * @author GX
 * @since 2021-01-12
 */
public interface SysLoginLogService extends IService<SysLoginLog> {
    /**
     * 新增系统登录日志
     *
     * @param loginLog 访问日志对象
     */
   void insertLogininfor(SysLoginLog loginLog);

    /**
     * 查询系统登录日志集合
     *
     * @param loginLog 访问日志对象
     * @return 登录记录集合
     */
   List<SysLoginLog> selectLogininforList(SysLoginLog loginLog);

    /**
     * 批量删除系统登录日志
     *
     * @param infoIds 需要删除的登录日志ID
     * @return
     */
   int deleteLogininforByIds(Long[] infoIds);

    /**
     * 清空系统登录日志
     */
   void cleanLogininfor();
}
