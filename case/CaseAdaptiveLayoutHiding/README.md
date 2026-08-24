# 自适应布局（隐藏能力）原子化评测用例

## 用例标识

- **case_id**: `case-adaptive-layout-hiding`
- **模式**: `from_base`（基于基础工程构建）
- **适配领域**: 鸿蒙一多（多设备）自适应布局 · 隐藏能力（displayPriority）

## 用例概述

本用例评测 Agent 为航班信息、会议控制条、出行进度轨三类信息密度高的横向容器赋予“按宽度优先级隐藏”能力。原始工程三个场景页面中的横向内容在设备宽度不足时容易截断或溢出；目标工程需通过 displayPriority 按业务价值与上下文重要性分配显示优先级，使容器在当前设备宽度下自动隐藏低优先级元素，并始终保留关键信息与可理解的布局结构。

目录结构：

```
CaseAdaptiveLayoutHiding/
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
| `should_keep_flight_info_on_current_device` | 在当前设备宽度下进入航班场景，验证航班信息行保留航班号、状态、时间、路线等基础信息，并按 phone/foldable/tablet 期望保留登机口、准点、座位、分享等高价值信息，隐藏空间不足时应让出的附加服务组等低优先级信息 |
| `should_keep_meeting_controls_on_current_device` | 在当前设备宽度下进入会议场景，验证会议控制条按设备形态保留共享屏幕、成员、摄像头、聊天等高价值控件，并隐藏静音、录制、举手、白板、字幕、投票及扩展会议工具等低优先级控件 |
| `should_keep_trip_nodes_on_current_device` | 在当前设备宽度下进入出行场景，验证行程进度轨按设备形态保留安检、登机口、登机中、到达地、客舱、行李提取等高价值节点，隐藏购物、休息室、接机及扩展行程服务等低优先级节点，并避免残留孤立连接符 |

### pass_to_pass（原有功能不受影响）

| 测试用例名称 | 验证内容 |
|---|---|
| `should_keep_flight_info_layout_stable_on_current_device` | 在当前设备宽度下进入航班场景，验证航班信息行在隐藏低优先级元素后布局结构保持稳定，不出现截断、溢出或错位 |
| `should_keep_meeting_controls_layout_stable_on_current_device` | 在当前设备宽度下进入会议场景，验证会议控制条在隐藏低优先级控件后布局结构保持稳定，不出现截断、溢出或错位 |
| `should_keep_trip_nodes_layout_stable_on_current_device` | 在当前设备宽度下进入出行场景，验证行程进度轨在隐藏低优先级节点后布局结构保持稳定，不出现截断、溢出或错位 |
