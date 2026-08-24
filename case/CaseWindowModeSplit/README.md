# 分屏窗口模式综合评测用例

## 用例标识

- **case_id**: `case-window-split-screen-example`
- **模式**: `from_base`（基于基础工程改造）
- **适配领域**: 鸿蒙一多（多设备）分屏窗口适配

## 用例概述

本用例评测 Agent 将仅适配手机全屏的天气元服务模板改造为支持分屏窗口模式的能力。原始工程所有页面按全屏固定布局，未做分屏适配；目标工程需在关键页面上实现分屏布局适配、组件隐藏能力及视频画面宽高比保持。

目录结构：

```
CaseWindowSplitScreenExample/
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

| 测试用例名称                                                  | 验证内容 |
|---------------------------------------------------------|---------|
| `should_loginPage_content_scrollable_after_split`        | 分屏后登录页内容可滚动查看完整内容 |
| `should_dialogContent_notOverlap_with_bottomButtons_after_split` | 分屏后启动隐私页弹窗文案与按钮不重叠 |
| `should_safePage_icon_hidden_after_split`                | 分屏后启动隐私页图标被隐藏或完整展示 |
| `should_videoKeepAspectRatio_after_split`                | 分屏后XComponent视频画面宽高比偏差<10% |

### pass_to_pass（原有功能不受影响）

| 测试用例名称                                                  | 验证内容 |
|---------------------------------------------------------|---------|
| `should_homeTabBar_fullyVisible_without_scroll_after_split` | 分屏后首页Tab栏完整可见无需滚动 |
