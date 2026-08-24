# 自适应布局（均分能力）原子化评测用例

## 用例标识

- **case_id**: `case-adaptive-layout-equal-space`
- **模式**: `from_base`（基于基础工程构建）
- **适配领域**: 鸿蒙一多（多设备）自适应布局 · 均分能力（FlexAlign.SpaceEvenly）

## 用例概述

本用例评测 Agent 为金刚区高频入口、侧边栏菜单、遥控器控制面板三类容器赋予"按可用空间均分间距"能力。原始工程三个场景页面使用固定间距（`space` / `LengthMetrics`）排列子元素，在设备宽度变化时无法自适应均分；目标工程需在三个页面移除固定间距，改用 `FlexAlign.SpaceEvenly`，使容器内子元素与首尾间距随可用空间自动均分。

目录结构：

```
CaseAdaptiveLayoutEqualSpace/
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

| 测试用例名称 | 验证内容 |
|---|---|
| `should_keep_diamond_area_gaps_equal` | 金刚区横向入口行首尾间距与元素间间距均等 |
| `should_keep_sidebar_menu_gaps_equal` | 侧边栏纵向菜单首尾间距与元素间间距均等 |
| `should_keep_remote_control_gaps_equal` | 遥控器横向控制键首尾间距与元素间间距均等 |

### pass_to_pass（原有功能不受影响）

| 测试用例名称 | 验证内容 |
|---|---|
| `should_keep_diamond_area_base_integrity` | 金刚区所有入口在容器内、无重叠、尺寸一致 |
| `should_keep_sidebar_menu_base_integrity` | 侧边栏所有菜单项在容器内、无重叠、尺寸一致 |
| `should_keep_remote_control_base_integrity` | 遥控器所有控制键在容器内、无重叠、尺寸一致 |
