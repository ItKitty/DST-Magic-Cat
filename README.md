# 玛德琳（Madeleine）台词改写 · Don't Starve Together

为《饥荒联机版》模组 `[DST]Magic Cat` 中的角色 **玛德琳（Madeleine）** 重写中文台词的项目。

台词风格设定为：一只知性、优雅、强势的母猫——句子短、判断先于情绪、不尖叫不哭喊，偶带一点博物学式的精确。

## 目录结构

```
parts/
  _HEAD.lua          原文件头部（未改动部分）
  H1.lua ~ H3.lua    台词段 1~3（按源文件行区间切分）
  D1.lua ~ D11.lua   物品/描述段 1~11
  _TAIL.lua          原文件尾部
  build.ps1          拼装脚本：按顺序合并 parts 生成 speech_madeleine.lua
  check.ps1          校验脚本：行数、键名、缩进、占位符一致性
  GUIDE.md           改写规范（语气细则 + 硬性技术规则）
_plan.json           各分片对应的源文件行区间与起始键名
```

## 使用方式

1. 确认 `parts/build.ps1` 顶部的路径指向你自己的游戏目录与模组目录。
2. 拼装台词文件：

```powershell
pwsh -File parts\build.ps1
```

3. 校验结果：

```powershell
pwsh -File parts\check.ps1
```

脚本默认输出到模组的 `speech_madeleine.lua`，可用 `-OutFile` 指定其他位置；`-DryRun` 只检查不写入。

## 硬性规则（摘要）

- 逐行一一对应：键名、缩进、行数、顺序与源文件完全一致，只改引号内的文本。
- 不增不减：不新增键、不删除键、不调整数组元素顺序。
- 占位符 `%s`、`%d`、`{weight}`、`{name}`、`\n` 原样保留。
- 文件为 UTF-8、LF 换行、无 BOM。

完整规范见 [parts/GUIDE.md](parts/GUIDE.md)。

## 声明

本项目仅包含模组的台词文本与构建脚本，不含游戏本体或模组作者的原始资源。台词改编内容版权归原作者及模组作者所有，仅供学习交流使用。
