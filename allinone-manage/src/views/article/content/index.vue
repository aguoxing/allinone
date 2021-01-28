<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="文章标题" prop="title">
        <el-input
          v-model="queryParams.title"
          placeholder="请输入文章标题"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="文章分类" prop="categoryId">
        <el-select v-model="queryParams.categoryId" placeholder="请选择">
          <el-option
            v-for="category in categoryOptions"
            :key="category.categoryId"
            :label="category.categoryName"
            :value="category.categoryId"
          ></el-option>
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['article:content:add']"
        >新增
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['article:content:edit']"
        >修改
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['article:content:remove']"
        >删除
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['article:content:export']"
        >导出
        </el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="infoList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center"/>
      <el-table-column label="主键" align="center" prop="articleId" v-if="false"/>
      <el-table-column label="分类id" align="center" prop="categoryId" v-if="false"/>
      <el-table-column label="文章标题" align="center" prop="title"/>
      <el-table-column label="作者" align="center" prop="author"/>
      <el-table-column label="摘要" align="center" prop="summary" v-if="false"/>
      <el-table-column label="点赞数" align="center" prop="likeCount"/>
      <el-table-column label="评论数" align="center" prop="commentCount"/>
      <el-table-column label="浏览数" align="center" prop="viewCount"/>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            type="text"
            size="small"
            icon="el-icon-view"
            @click="handlePreview(scope.row)"
            v-hasPermi="['article:content:preview']"
          >预览
          </el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['article:content:edit']"
          >修改
          </el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['article:content::remove']"
          >删除
          </el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.params.currentPage"
      :limit.sync="queryParams.params.pageSize"
      @pagination="getList"
    />

    <!-- 预览界面 -->
    <el-dialog :title="preview.data.title" :visible.sync="preview.open" width="80%" top="5vh" append-to-body>
      <no-ssr>
        <mavon-editor
          v-model="preview.data.content"
          :subfield="false"
          :box-shadow="false"
          default-open="preview"
          :toolbars-flag="false"
          :ishljs="true"
        />
      </no-ssr>
    </el-dialog>

    <!-- 添加或修改文章对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="780px" :fullscreen="dialogFull" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-row>
          <el-col :span="12">
            <el-form-item label="文章标题" prop="title">
              <el-input v-model="form.title" placeholder="请输入文章标题"/>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="文章摘要" prop="title">
              <el-input v-model="form.summary" type="textarea" placeholder="请输入文章摘要" :maxlength="200"
                        show-word-limit :autosize="{minRows: 2, maxRows: 2}" :style="{width: '100%'}"></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="文章分类" prop="categoryId">
              <el-select v-model="form.categoryId" placeholder="请选择">
                <el-option
                  v-for="category in categoryOptions"
                  :key="category.categoryId"
                  :label="category.categoryName"
                  :value="category.categoryId"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="文章标签" prop="tagIds">
              <el-select v-model="form.tagIds" placeholder="请选择" multiple clearable>
                <el-option
                  v-for="tag in tagOptions"
                  :key="tag.tagId"
                  :label="tag.tagName"
                  :value="tag.tagId"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="状态" prop="status">
              <el-radio-group v-model="form.status">
                <el-radio
                  v-for="dict in statusOptions"
                  :key="dict.dictValue"
                  :label="dict.dictValue"
                >{{ dict.dictLabel }}
                </el-radio>
              </el-radio-group>
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="内容" prop="content">
              <mavon-editor v-model="form.content" :min-height="192"/>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { addInfo, delInfo, exportInfo, getInfo, listInfo, updateInfo, previewArticle } from '@/api/article/content'
import { listCategoryVo } from '@/api/article/category'
import { listTagVo } from '@/api/article/tag'

export default {
  name: 'Content',
  components: {},
  data() {
    return {
      // 弹框全屏
      dialogFull: true,
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 文章表格数据
      infoList: [],
      // 弹出层标题
      title: '',
      // 是否显示弹出层
      open: false,
      // 类型数据字典
      statusOptions: [],
      // 分类选项列表
      categoryOptions: [],
      // 标签选项列表
      tagOptions: [],
      // 查询参数
      queryParams: {
        title: undefined,
        categoryId: undefined,
        params: {
          currentPage: 1,
          pageSize: 10
        }
      },
      // 表单参数
      form: {},
      // 预览参数
      preview: {
        open: false,
        title: '文章预览',
        data: {}
      },
      // 表单校验
      rules: {
        categoryId: [
          { required: true, message: '分类不能为空', trigger: 'blur' }
        ],
        tagIds: [
          { required: true, message: '标签不能为空', trigger: 'blur' }
        ],
        title: [
          { required: true, message: '文章标题不能为空', trigger: 'blur' }
        ],
        summary: [
          { required: true, message: '摘要不能为空', trigger: 'blur' }
        ],
        content: [
          { required: true, message: '内容不能为空', trigger: 'blur' }
        ]
      }
    }
  },
  created() {
    this.getList()
    this.getDicts('article_status').then(response => {
      this.statusOptions = response.data
    })
    listCategoryVo().then(response => {
      this.categoryOptions = response.data
    })
    listTagVo().then(response => {
      this.tagOptions = response.data
    })
  },
  methods: {
    /** 查询文章列表 */
    getList() {
      this.loading = true
      listInfo(this.queryParams).then(response => {
        this.infoList = response.data.list
        this.total = response.data.totalCount
        this.loading = false
      })
    },
    // 取消按钮
    cancel() {
      this.open = false
      this.reset()
    },
    // 表单重置
    reset() {
      this.form = {
        articleId: undefined,
        categoryId: undefined,
        title: undefined,
        author: undefined,
        summary: undefined,
        content: undefined,
        likeCount: undefined,
        commentCount: undefined,
        viewCount: undefined,
        status: '0',
        createBy: undefined,
        createTime: undefined,
        updateBy: undefined,
        updateTime: undefined,
        remark: undefined,
        tagIds: undefined
      }
      this.resetForm('form')
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1
      this.getList()
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm('queryForm')
      this.handleQuery()
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.articleId)
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },
    /** 预览按钮 */
    handlePreview(row) {
      this.reset()
      const articleId = row.articleId || this.ids
      previewArticle(articleId).then(response => {
        this.preview.data = response.data
        this.preview.open = true
      })
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset()
      this.open = true
      this.title = '添加文章'
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset()
      const articleId = row.articleId || this.ids
      getInfo(articleId).then(response => {
        console.log(response.data)
        this.form = response.data
        this.open = true
        this.title = '修改文章'
      })
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs['form'].validate(valid => {
        if (valid) {
          if (this.form.articleId != null) {
            updateInfo(this.form).then(response => {
              this.msgSuccess('修改成功')
              this.open = false
              this.getList()
            })
          } else {
            addInfo(this.form).then(response => {
              this.msgSuccess('新增成功')
              this.open = false
              this.getList()
            })
          }
        }
      })
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const articleIds = row.articleId || this.ids
      this.$confirm('是否确认删除文章编号为"' + articleIds + '"的数据项?', '警告', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(function() {
        return delInfo(articleIds)
      }).then(() => {
        this.getList()
        this.msgSuccess('删除成功')
      })
    },
    /** 导出按钮操作 */
    handleExport() {
      const queryParams = this.queryParams
      this.$confirm('是否确认导出所有文章数据项?', '警告', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(function() {
        return exportInfo(queryParams)
      }).then(response => {
        this.download(response.msg)
      })
    }
  }
}
</script>
