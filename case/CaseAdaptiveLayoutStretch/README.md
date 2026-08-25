# 拉伸能力场景题库

## 用例标识

- **case_id**: `case-adaptive-layout-stretch`
- **模式**:  `from_base`（基于基础工程构建）
- **适配领域**: 鸿蒙拉伸能力展示

## 用例概述

本用例展示鸿蒙应用商城首页页面拉伸能力场景，包含商城首页页面。原始工程搜索框、签到、秒杀卡片使用固定宽度，在设备变化时无法自适应拉伸；目标工程需搜索框、签到、秒杀卡片通过Flex布局中的flexGrow和flexShrink属性实现自动分配空间。

目录结构：

```
CaseAdaptiveLayoutStretch/
├── README.md              # 说明文档
├── CHANGELOG.md           # 版本记录
├── PROMPT.md              # 提示词
├── metadata.json          # 用例元数据（commit、测试定义等）
├── golden_patch.patch     # 参考实现补丁
├── test_patch.patch       # 测试代码补丁
└── base/                  # 任务工程代码
```


## 单元测试用例

### fail_to_pass（修复后应通过）

| 测试用例名称                                        | 验证内容 |
|---------------------------------------------------|---------|
| `should_search_input_adaptive_on_md_breakpoint`   | 断言首页搜索框在md断点下自适应父容器尺寸变化，宽度占比在80%-100%之间 |
| `should_card_checkin_adaptive_on_md_breakpoint`   | 断言首页签到卡片在md断点下自适应父容器尺寸变化，宽度占比在30%-50%之间 |
| `should_card_seckill_adaptive_on_md_breakpoint`   | 断言首页秒杀卡片在md断点下自适应父容器尺寸变化，宽度占比在30%-50%之间 |
| `should_search_input_adaptive_on_lg_breakpoint`   | 断言首页搜索框在lg断点下自适应父容器尺寸变化，宽度占比在80%-100%之间 |
| `should_card_checkin_adaptive_on_lg_breakpoint`   | 断言首页签到卡片在lg断点下自适应父容器尺寸变化，宽度占比在30%-50%之间 |
| `should_card_seckill_adaptive_on_lg_breakpoint`   | 断言首页秒杀卡片在lg断点下自适应父容器尺寸变化，宽度占比在30%-50%之间 |
| `should_search_input_adaptive_on_sm_breakpoint`   | 断言首页搜索框在sm断点下自适应父容器尺寸变化，宽度占比在80%-100%之间 |
| `should_card_checkin_adaptive_on_sm_breakpoint`   | 断言首页签到卡片在sm断点下自适应父容器尺寸变化，宽度占比在30%-50%之间 |
| `should_card_seckill_adaptive_on_sm_breakpoint`   | 断言首页秒杀卡片在sm断点下自适应父容器尺寸变化，宽度占比在30%-50%之间 |

### pass_to_pass（原有功能不受影响）

| 测试用例名称                     | 验证内容 |
|----------------------------|---------|
| `should_show_home_page`    | 断言商品首页存在 |
| `should_show_search_input` | 断言商品首页搜索框存在 |
| `should_show_card_area`    | 断言商品首页横幅区域存在 |
