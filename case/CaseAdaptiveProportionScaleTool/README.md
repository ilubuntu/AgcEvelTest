# 自适应布局占比能力评测用例

## 用例标识

- **case_id**: `case-adaptive-proportion-scale-tool`
- **模式**: `from_base`
- **适配领域**: 【自适应布局】占比能力原子化用例

## 用例概述

本用例评测 Agent 将测试工程的页面改造为比例缩放适配体验，主要测试在不同窗口尺寸下保持原有比例的布局能力。

目录结构：

```
CaseAdaptiveProportionScaleTool/
├── README.md              # 说明文档
├── PROMPT.md              # 提示词文档
├── CHANGELOG.md           # 版本记录
├── metadata.json          # 用例元数据（commit、测试定义等）
├── golden_patch.patch     # 参考实现补丁
├── test_patch.patch       # 测试代码补丁
└── task/                  # 任务工程代码
```

## 单元测试用例

### fail_to_pass（修复后应通过）

| 测试用例名称                                              | 验证内容 |
|-----------------------------------------------------|---------|
| `should_keep_main_menu_equal_ratio_on_other`       | 主菜单页面在其他窗口尺寸下保持比例 |
| `should_keep_order_equal_ratio_on_other`       | 订单页面在其他窗口尺寸下保持比例 |

### pass_to_pass（原有功能不受影响）

| 测试用例名称                                               | 验证内容 |
|------------------------------------------------------|---------|
| `should_start_ability_successfully`     | 测试工程可以正常启动 |
| `should_show_main_menu_equal_items_visible`     | 主菜单页面各项可见 |
| `should_keep_main_menu_no_horizontal_overflow`     | 主菜单无水平溢出 |
| `should_show_order_equal_items_visible`     | 订单页面各项可见 |
| `should_keep_order_no_horizontal_overflow`     | 订单无水平溢出 |
| `should_keep_main_menu_equal_ratio_on_sm`     | 主菜单在小窗口尺寸下保持比例 |
| `should_keep_order_equal_ratio_on_sm`     | 订单在小窗口尺寸下保持比例 |
