# 窗口与方向-横竖屏切换评测用例

## 用例标识

- **case_id**: `window_and_direction-landscape-portrait-switch-derive-base`
- **模式**: `derive_base`（基于已有工程剥离）
- **适配领域**: 鸿蒙一多（多设备）窗口与方向横竖屏切换适配

## 用例概述

本用例评测 Agent 将不具备横竖屏切换能力的视频模板改造为支持多设备（手机、折叠屏、平板）横竖屏切换能力的模板。task工程中视频模板首页能根据不同断点区分选择策略，并支持视频跟随系统旋转播放。

目录结构：

```
CaseWindowAndDirectionLandscapePortraitSwitch/
├── README.md              # 说明文档
├── PROMPT.md              # 提示词
├── CHANGELOG.md           # 版本记录
├── metadata.json          # 用例元数据（commit、测试定义等）
├── golden_patch.patch     # 参考实现补丁
├── test_patch.patch       # 测试代码补丁
└── task/                  # 任务工程代码（待适配的基础工程）
```

## 单元测试用例

### fail_to_pass（修复后应通过）

| 测试用例名称                                              | 验证内容 |
|-----------------------------------------------------|---------|
| `should_MD_LG_device_follow_desktop_enables_rotation`       | MD和LG断点上是否跟随桌面旋转模式，自动旋转 |
| `should_SM_device_follow_desktop_stays_portrait`     | SM断点上是否跟随桌面旋转模式，自动旋转 |
| `should_auto_rotate_when_window_landscape_on_SM_MD_devices`     | SM和MD断点下视频是否跟随系统自动旋转 |
| `should_landscape_on_LG_devices`     | LG设备下视频是否跟随系统自动旋转 |
