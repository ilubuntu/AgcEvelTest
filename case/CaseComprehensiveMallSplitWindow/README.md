# 综合商城分屏购物评测用例

## 用例标识

- **case_id**: `comprehensive-mall-split-shopping`
- **模式**: `derive_base`
- **适配领域**: HarmonyOS 应用内分屏购物

## 用例概述

本用例评测 Agent 在固定手机布局的综合商城中增加分屏购物能力。用户可从商品详情创建分屏窗口，在两个窗口中独立浏览和购物，并从任一窗口结束分屏。

目录结构：

```
CaseComprehensiveMallSplitWindow/
├── README.md              # 说明文档
├── PROMPT.md              # 提示词文档
├── CHANGE_LOG.md          # 版本记录
├── metadata.json          # 用例元数据（commit、测试定义等）
├── golden_patch.patch     # 参考实现补丁
├── test_patch.patch       # 测试代码补丁
└── task/                  # 任务工程代码
```

## 单元测试用例

### fail_to_pass（修复后应通过）

| 测试用例名称 | 验证内容 |
|---|---|
| `should_show_split_action_on_supported_window` | 支持窗口显示分屏入口 |
| `should_start_secondary_window_in_split_mode` | 从窗以分屏模式启动 |
| `should_show_same_product_in_secondary_window` | 双窗展示同一商品 |
| `should_show_merge_action_in_both_windows` | 双窗均显示合并操作 |
| `should_restore_main_window_when_secondary_is_closed` | 关闭从窗恢复主窗 |
| `should_merge_when_action_is_clicked_in_secondary` | 从窗点击合并 |
| `should_migrate_secondary_navigation_when_merged_from_primary` | 主窗合并时迁移从窗导航 |

### pass_to_pass（原有功能不受影响）

| 测试用例名称 | 验证内容 |
|---|---|
| `should_start_mall_successfully` | 应用正常启动 |
| `should_open_product_detail_from_applink` | 商品链接直达 |
| `should_keep_purchase_actions_available` | 购买入口可用 |
| `should_have_one_fullscreen_window_before_split` | 分屏前为单全屏窗口 |
| `should_keep_product_detail_single_column_on_wide_window` | 宽屏商品详情保持单列 |
| `should_hide_split_action_on_sm` | SM 不显示分屏入口 |

