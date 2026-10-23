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

所有路径都由参数给出，脚本里没有写死的本机目录。

1. 先干跑一次（不写入游戏目录，只在系统临时目录生成预览）：

```powershell
pwsh -File parts\build.ps1 -ModDir "D:\Game\Steam\steamapps\common\Don't Starve Together\mods\[DST]Magic Cat" -DryRun
```

2. 确认输出没问题后，去掉 `-DryRun` 正式拼装（原文件会先备份为 `.bak`，再写入 `scripts\speech_madeleine.lua`）：

```powershell
pwsh -File parts\build.ps1 -ModDir "同上"
```

3. 校验结果：

```powershell
pwsh -File parts\check.ps1 -ModDir "同上"
```

参数说明：

| 参数 | 默认值 | 说明 |
|---|---|---|
| `-ModDir` | 无（必填，或改用下面三个路径） | 模组根目录，其下应有 `scripts\` |
| `-Source` | `<ModDir>\scripts\speech_wilson.lua` | 对照用的源台词文件 |
| `-Doc1` | `<ModDir>\scripts\speech_madeleine.lua` | 现有台词文件，用于检查是否丢键 |
| `-OutFile` | `<ModDir>\scripts\speech_madeleine.lua` | 输出位置 |
| `-PartsDir` | 脚本自身所在目录 | 分片目录 |
| `-DryRun` | 关 | 只分析，不写入游戏目录 |

> 脚本以 UTF-8 带 BOM 保存，Windows PowerShell 5.1 与 PowerShell 7 都能正确解析中文。用编辑器另存时不要去掉 BOM，否则 5.1 会把中文读成乱码并报语法错误。

## 硬性规则（摘要）

- 逐行一一对应：键名、缩进、行数、顺序与源文件完全一致，只改引号内的文本。
- 不增不减：不新增键、不删除键、不调整数组元素顺序。
- 占位符 `%s`、`%d`、`{weight}`、`{name}`、`\n` 原样保留。
- 文件为 UTF-8、LF 换行、无 BOM。

完整规范见 [parts/GUIDE.md](parts/GUIDE.md)。

## 声明

本项目仅包含模组的台词文本与构建脚本，不含游戏本体或模组作者的原始资源。台词改编内容版权归原作者及模组作者所有，仅供学习交流使用。
