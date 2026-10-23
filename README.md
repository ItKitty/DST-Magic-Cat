# [DST]Magic Cat · 玛德琳（Madeleine）

《饥荒联机版》角色模组 **`[DST]Magic Cat`**（角色：玛德琳 / Madeleine）的代码与素材仓库。

这个仓库的第一目的是**给代码留历史**：改坏了能查、能回退、能对比。所有内容以游戏目录里的模组为真实来源，`mod/` 是它的镜像。

> 原模组作者：**NONTAN**；本仓库记录 **WYF** 的修改版（`modinfo.lua` 中的 `Edited BY WYF`，当前版本 2.193）。

## 目录结构

```
mod/                  游戏模组的完整镜像（scripts/、images/、anim/、sound/、modmain.lua ……）
parts/                台词工程的分片与构建脚本
  _HEAD.lua           原文件头部（未改动部分）
  H1.lua ~ H3.lua     台词段 1~3
  D1.lua ~ D11.lua    物品/描述段 1~11
  _TAIL.lua           原文件尾部
  build.ps1           拼装脚本：按顺序合并 parts 生成 speech_madeleine.lua
  check.ps1           校验脚本：行数、键名、缩进、占位符一致性
  GUIDE.md            台词改写规范（语气细则 + 硬性技术规则）
_plan.json            各分片对应的源文件行区间与起始键名
sync-mod.ps1          游戏目录 <-> mod/ 双向同步，可顺手提交
```

## 日常：改完代码怎么记录

在仓库根目录：

```powershell
# 1. 先看游戏目录和仓库差在哪（只读，不复制）
pwsh -File .\sync-mod.ps1 -ModDir "你的模组路径" -Check

# 2. 把改动同步进 mod\ 并提交
pwsh -File .\sync-mod.ps1 -ModDir "你的模组路径" -Commit -Message "这次改了什么"

# 3. 推到 GitHub
git push
```

`-Check` 用 SHA256 比较两边文件，输出「新增 / 修改 / 多余」清单，不会动任何文件。

## 改坏了怎么回滚

**只想撤销某个文件的改动**（最常见）：

```powershell
git log --oneline -- mod/scripts/modmain.lua     # 找到改动之前的提交
git checkout <提交号> -- mod/scripts/modmain.lua  # 取回旧版本
```

**想整体退回某一次提交的版本**：

```powershell
git checkout <提交号> -- mod/          # 仓库里的 mod\ 变成旧版本
pwsh -File .\sync-mod.ps1 -ModDir "你的模组路径" -ToGame   # 再灌回游戏目录
```

`-ToGame` 会先把游戏目录里的当前文件备份成 `<模组目录>-backup-<时间戳>`，所以这一步本身也可回退。

## 台词工程

台词部分独立于模组主体：改 `parts/` 里的分片，再用脚本拼成 `scripts/speech_madeleine.lua`。

```powershell
# 干跑：不写游戏目录，预览写到系统临时目录
pwsh -File parts\build.ps1 -ModDir "你的模组路径" -DryRun

# 正式拼装（原文件先备份为 .bak）并校验
pwsh -File parts\build.ps1 -ModDir "你的模组路径"
pwsh -File parts\check.ps1 -ModDir "你的模组路径"
```

| 参数 | 默认值 | 说明 |
|---|---|---|
| `-ModDir` | 无（必填，或改用下面三个路径） | 模组根目录，其下应有 `scripts\` |
| `-Source` | `<ModDir>\scripts\speech_wilson.lua` | 对照用的源台词文件 |
| `-Doc1` | `<ModDir>\scripts\speech_madeleine.lua` | 现有台词文件，用于检查是否丢键 |
| `-OutFile` | `<ModDir>\scripts\speech_madeleine.lua` | 输出位置 |
| `-PartsDir` | 脚本自身所在目录 | 分片目录 |
| `-DryRun` | 关 | 只分析，不写入游戏目录 |

台词硬性规则：逐行一一对应（键名、缩进、行数、顺序不变）、不增不减、占位符 `%s` `%d` `{weight}` `{name}` `\n` 原样保留、输出 UTF-8 无 BOM 且 LF 换行。完整规范见 [parts/GUIDE.md](parts/GUIDE.md)。

> 两个 `.ps1` 脚本以 UTF-8 **带 BOM** 保存，Windows PowerShell 5.1 才能正确解析中文；编辑时不要去掉 BOM（`.editorconfig` 已固定）。

## 声明

仓库中的模组代码与素材（音效、贴图、动画）版权归模组作者 **NONTAN** 及原作者所有，此处仅作为个人修改版的版本记录与备份，不含游戏本体。若要公开分发或二次修改，请先获得原作者许可。
