package top.cloudos.system.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import top.cloudos.common.constant.UserConstants;
import top.cloudos.common.core.model.entity.SysDictData;
import top.cloudos.common.core.model.entity.SysDictType;
import top.cloudos.common.exception.CustomException;
import top.cloudos.common.util.DictUtils;
import top.cloudos.common.util.StringUtils;
import top.cloudos.system.mapper.SysDictDataMapper;
import top.cloudos.system.mapper.SysDictTypeMapper;
import top.cloudos.system.service.SysDictTypeService;

import javax.annotation.PostConstruct;
import java.util.List;

/**
 * <p>
 * 字典类型表 服务实现类
 * </p>
 *
 * @author GX
 * @since 2021-01-12
 */
@Service
public class SysDictTypeServiceImpl extends ServiceImpl<SysDictTypeMapper, SysDictType> implements SysDictTypeService {
    @Autowired
    private SysDictDataMapper dictDataMapper;

    /**
     * 项目启动时，初始化字典到缓存
     */
    @PostConstruct
    public void init() {
        List<SysDictType> dictTypeList = baseMapper.selectDictTypeAll();
        for (SysDictType dictType : dictTypeList) {
            List<SysDictData> dictDatas = dictDataMapper.selectDictDataByType(dictType.getDictType());
            DictUtils.setDictCache(dictType.getDictType(), dictDatas);
        }
    }

    /**
     * 根据条件分页查询字典类型
     *
     * @param dictType 字典类型信息
     * @return 字典类型集合信息
     */
    @Override
    public List<SysDictType> selectDictTypeList(SysDictType dictType) {
        return baseMapper.selectDictTypeList(dictType);
    }

    /**
     * 根据所有字典类型
     *
     * @return 字典类型集合信息
     */
    @Override
    public List<SysDictType> selectDictTypeAll() {
        return baseMapper.selectDictTypeAll();
    }

    /**
     * 根据字典类型查询字典数据
     *
     * @param dictType 字典类型
     * @return 字典数据集合信息
     */
    @Override
    public List<SysDictData> selectDictDataByType(String dictType) {
        List<SysDictData> dictDatas = DictUtils.getDictCache(dictType);
        if (StringUtils.isNotEmpty(dictDatas)) {
            return dictDatas;
        }
        dictDatas = dictDataMapper.selectDictDataByType(dictType);
        if (StringUtils.isNotEmpty(dictDatas)) {
            DictUtils.setDictCache(dictType, dictDatas);
            return dictDatas;
        }
        return null;
    }

    /**
     * 根据字典类型ID查询信息
     *
     * @param dictId 字典类型ID
     * @return 字典类型
     */
    @Override
    public SysDictType selectDictTypeById(Long dictId) {
        return baseMapper.selectDictTypeById(dictId);
    }

    /**
     * 根据字典类型查询信息
     *
     * @param dictType 字典类型
     * @return 字典类型
     */
    @Override
    public SysDictType selectDictTypeByType(String dictType) {
        return baseMapper.selectDictTypeByType(dictType);
    }

    /**
     * 批量删除字典类型信息
     *
     * @param dictIds 需要删除的字典ID
     * @return 结果
     */
    @Override
    public int deleteDictTypeByIds(Long[] dictIds) {
        for (Long dictId : dictIds) {
            SysDictType dictType = selectDictTypeById(dictId);
            if (dictDataMapper.countDictDataByType(dictType.getDictType()) > 0) {
                throw new CustomException(String.format("%1$s已分配,不能删除", dictType.getDictName()));
            }
        }
        int count = baseMapper.deleteDictTypeByIds(dictIds);
        if (count > 0) {
            DictUtils.clearDictCache();
        }
        return count;
    }

    /**
     * 清空缓存数据
     */
    @Override
    public void clearCache() {
        DictUtils.clearDictCache();
    }

    /**
     * 新增保存字典类型信息
     *
     * @param dictType 字典类型信息
     * @return 结果
     */
    @Override
    public int insertDictType(SysDictType dictType) {
        int row = baseMapper.insertDictType(dictType);
        if (row > 0) {
            DictUtils.clearDictCache();
        }
        return row;
    }

    /**
     * 修改保存字典类型信息
     *
     * @param dictType 字典类型信息
     * @return 结果
     */
    @Override
    @Transactional
    public int updateDictType(SysDictType dictType) {
        SysDictType oldDict = baseMapper.selectDictTypeById(dictType.getDictId());
        dictDataMapper.updateDictDataType(oldDict.getDictType(), dictType.getDictType());
        int row = baseMapper.updateDictType(dictType);
        if (row > 0) {
            DictUtils.clearDictCache();
        }
        return row;
    }

    /**
     * 校验字典类型称是否唯一
     *
     * @param dict 字典类型
     * @return 结果
     */
    @Override
    public String checkDictTypeUnique(SysDictType dict) {
        Long dictId = StringUtils.isNull(dict.getDictId()) ? -1L : dict.getDictId();
        SysDictType dictType = baseMapper.checkDictTypeUnique(dict.getDictType());
        if (StringUtils.isNotNull(dictType) && dictType.getDictId().longValue() != dictId.longValue()) {
            return UserConstants.NOT_UNIQUE;
        }
        return UserConstants.UNIQUE;
    }
}