# 窗口沉浸式-导航栏避让评测用例

## 用例标识

- **case_id**: `cover-immersiver-from-base-nav-bar`
- **模式**: `from_base`（基于基础工程派生）
- **适配领域**: 窗口沉浸式-导航栏避让

## 用例概述

本用例评测 Agent 将测试工程的页面改造为窗口沉浸式体验，主要测试导航栏是否避让。


目录结构：

```
CaseImmersiveNavBar/
├── README.md              # 说明文档
├── CHANGELOG.md           # 版本记录
├── PROMPT.md              # 提示词
├── metadata.json          # 用例元数据（commit、测试定义等）
├── golden_patch.patch     # 参考实现补丁
├── test_patch.patch       # 测试代码补丁
└── task/                  # 任务工程代码（待适配的基础工程）
```



## 单元测试用例

### fail_to_pass（修复后应通过）

| 测试用例名称                                              | 验证内容 |
|-----------------------------------------------------|---------|
| `should_content_area_not_overlap_nav_bar`       | 1、导航栏的背景色和内容区域的颜色一样，2、内容区域的高度小于导航栏的高度 |

### pass_to_pass（原有功能不受影响）

| 测试用例名称                                               | 验证内容 |
|------------------------------------------------------|---------|
| `should_content_main_home_is_exist`     | 1、测试工程可以正常启动， 2、【首页】tab存在|
