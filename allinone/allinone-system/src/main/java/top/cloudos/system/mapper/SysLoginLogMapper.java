package top.cloudos.system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import top.cloudos.system.model.entity.SysLoginLog;

import java.util.List;

/**
 * <p>
 * 系统访问记录 Mapper 接口
 * </p>
 *
 * @author GX
 * @since 2021-01-12
 */
public interface SysLoginLogMapper extends BaseMapper<SysLoginLog> {
    /**
     * 新增系统登录日志
     *
     * @param logininfor 访问日志对象
     */
    void insertLogininfor(SysLoginLog logininfor);

    /**
     * 查询系统登录日志集合
     *
     * @param logininfor 访问日志对象
     * @return 登录记录集合
     */
    List<SysLoginLog> selectLogininforList(SysLoginLog logininfor);

    /**
     * 批量删除系统登录日志
     *
     * @param infoIds 需要删除的登录日志ID
     * @return 结果
     */
    int deleteLogininforByIds(Long[] infoIds);

    /**
     * 清空系统登录日志
     *
     * @return 结果
     */
    int cleanLogininfor();
}
