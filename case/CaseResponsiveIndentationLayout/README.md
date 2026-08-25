# 响应式缩进布局评测用例

## 用例标识

- **case_id**： `responsive-indentation-layout`
- **模式**： `derive_base` (基于基础工程派生)
- **适配领域**：鸿蒙一多（多设备）响应式缩进布局

## 用例概述

本用例评测Agent将仅适配手机竖屏的设置页面改造为支持多设备（手机、折叠屏、平板）响应式缩进布局的能力。原始工程的设置页面使用 Scroll 铺满全宽（`width('100%')`），在大屏设备上内容会被严重拉伸；目标工程需引入 GridRow/GridCol 栅格断点体系，在不同断点下通过 span 和 offset 实现内容居中缩进，使页面在大屏设备上保持合理的阅读宽度。

目录结构：

```
CaseResponsiveIndentationLayout/
├── CHANGELOG.md          # 版本记录
├── PROMPT.md              # 提示词文档
├── README.md              # 说明文档
├── golden_patch.patch     # 参考实现补丁
├── metadata.json          # 用例元数据（测试定义等）
├── test_patch.patch       # 测试代码补丁
└── task/                  # 任务工程代码（待适配的基础工程）
```

## 单元测试用例

### fail_to_pass (修复后应通过)

| 测试用例名称 | 验证内容 |
| --- | --- |
| `should_center_single_column_content_on_medium_breakpoint` | md 断点下设置页面内容应水平居中，左右留白均大于屏幕宽度 8% 且差值不超过 8px。 |
| `should_reduce_single_column_width_on_medium_breakpoint` | md 断点下内容宽度占比应显著收窄，不超过屏幕宽度的 82%。 |
| `should_center_single_column_content_on_large_breakpoint` | lg 断点下设置页面内容应水平居中，左右留白均大于屏幕宽度 12% 且差值不超过 8px。 |
| `should_keep_single_column_content_width_bounded_on_large_breakpoint` | lg 断点下内容宽度占比应进一步收窄，不超过屏幕宽度的 72%。 |

### pass_to_pass (原有功能不受影响)

| 测试用例名称 | 验证内容 |
| --- | --- |
| `should_start_setting_page_successfully` | 应用应能正常启动并展示设置页面的滚动容器。 |
| `should_show_reading_content` | 页面应展示设置标题、个人信息、字体大小等阅读内容。 |
| `should_show_setting_form_content` | 页面应展示通知开关、个性化推荐等表单交互内容。 |
| `should_keep_setting_page_scrollable` | 页面应可正常滚动，底部内容（如隐私声明摘要）可访问。 |
| `should_show_reading_content_on_small_breakpoint` | sm 断点下设置页面阅读内容应正常显示。 |
| `should_use_nearly_full_width_content_on_small_breakpoint` | sm 断点下内容宽度占比应接近全宽（>= 92%）。 |
| `should_keep_reading_cards_visible_without_horizontal_overflow_on_small_breakpoint` | sm 断点下阅读卡片不应横向溢出。 |
| `should_keep_form_fields_visible_without_horizontal_overflow_on_small_breakpoint` | sm 断点下表单控件不应横向溢出。 |
| `should_show_reading_content_on_medium_breakpoint` | md 断点下设置页面阅读内容应正常显示不退化。 |
| `should_keep_reading_cards_visible_without_horizontal_overflow_on_medium_breakpoint` | md 断点下阅读卡片不应横向溢出。 |
| `should_show_reading_content_on_large_breakpoint` | lg 断点下设置页面阅读内容应正常显示不退化。 |
| `should_keep_reading_cards_visible_without_horizontal_overflow_on_large_breakpoint` | lg 断点下阅读卡片不应横向溢出。 |
