# 悬浮窗模式综合评测用例

## 用例标识

- **case_id**: `float-from-base-example`
- **模式**: `from_base`（基于基础工程派生）
- **适配领域**: 鸿蒙一多（多设备）悬浮窗模式

## 用例概述

本用例评测 Agent 将应用改造为支持悬浮窗模式的能力。原始工程视频播放仅支持全屏模式，未对悬浮窗场景做适配；目标工程需在视频悬浮窗打开时，根据视频宽高比自动切换横竖屏模式——横屏视频（宽>高）悬浮窗应横屏显示，竖屏视频悬浮窗应保持竖屏显示，并确保首页搜索栏在悬浮窗状态下可正常操作。

目录结构：

```
CaseWindowModeFloating/
├── README.md              # 说明文档
├── PROMPT.md              # 提示词文档
├── CHANGELOG.md           # 版本记录
├── metadata.json          # 用例元数据（commit、测试定义等）
├── golden_patch.patch     # 参考实现补丁
├── test_patch.patch       # 测试代码补丁
└── task/                  # 任务工程代码（待适配的基础工程）
```

## 单元测试用例

### fail_to_pass（修复后应通过）

| 测试用例名称                                                              | 验证内容 |
|---------------------------------------------------------------------|---------|
| `should_landscape_video_float_in_landscape_window` | 横屏视频悬浮窗后窗口为横屏 |

### pass_to_pass（原有功能不受影响）

| 测试用例名称                                                           | 验证内容 |
|----------------------------------------------------------------------|---------|
| `should_home_search_operable_in_float_window`                       | 悬浮窗下首页搜索栏可操作且在窗口内 |
| `should_portrait_video_float_in_portrait_window`                    | 竖屏视频悬浮窗后窗口为竖屏 |
