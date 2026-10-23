--[[
	玛德琳（Madeleine）的台词表 · 简体中文
	——《饥荒：联机版》[DST]Magic Cat 模组

	角色：女性猫娘，知性、优雅、强大。
	笔法：句子短，语气从容；先观察、再判断、最后下结论。
	      面对怪物与灾变，她是评估者与裁决者，不是受害者。
	      偶尔以"喵"收句，但克制——约十几条才见一次。

	约定：
	· 每条台词后的 -- 备注 说明触发场合（物品名 / 检查状态 / 事件说明），改词时请一并核对。
	· 需要在台词里用引号时，写成 \" ，例如 "他说：\"请让一让。\""
	· 含 %s / %d / {weight} / {name} 的台词会在运行时填入信息，请保留占位符。
	· 表结构与原版 data\scripts\speech_wilson.lua 一致；缺失的键会回落到默认台词。

	本文件由 speech_wilson.lua 的完整键表补全，逐条改写为玛德琳的口吻。
]]
return {

	ACTIONFAIL =
	{
        GENERIC =
        {
            ITEMMIMIC = "这层皮，骗不过我。",		--动作说明：通用动作失败（目标是伪装的物品拟态怪）
        },

		ACTIVATE =
		{
			LOCKED_GATE = "门锁着。钥匙在别处。",		--远古钥匙
            HOSTBUSY = "它正忙。我不打扰。",		--鸦年华 良羽鸦在忙
            CARNIVAL_HOST_HERE = "它就在附近。不必找了。",		--良羽鸦的 取消了 不会被调用
            NOCARNIVAL = "鸟都散了。时机不对。",		--激活良羽鸦树苗 但是没找到良羽鸦
			EMPTY_CATCOONDEN = "空的。连一根毛都没留下。",		--洗劫空心树桩 但是没有藏品了
			KITCOON_HIDEANDSEEK_NOT_ENOUGH_HIDERS = "小家伙不够。捉迷藏总得有人躲，喵。",		--浣猫年 和猫玩耍 猫不够
			KITCOON_HIDEANDSEEK_NOT_ENOUGH_HIDING_SPOTS = "能藏的地方太少。它们无处可去，喵。",		--浣猫年 和猫玩耍 没有足够位置捉迷藏
			KITCOON_HIDEANDSEEK_ONE_GAME_PER_DAY = "今天到此为止，喵。规矩就是规矩。",		--浣猫年 和猫玩耍 一天只能玩一次
            MANNEQUIN_EQUIPSWAPFAILED = "尺寸不合。它穿不上。",		--假人不能装备这个装备
            PILLOWFIGHT_NO_HANDPILLOW = "枕头大战，手上总得有只枕头，喵。",		--枕头大战 没有枕头
            NOTMYBERNIE = "这只熊不认我。",		--博尼小熊  不能被不是威洛的人激活
            NOTMERM = "只有鱼人能唤醒鱼人。",		--动作说明：激活失败，当前角色不是鱼人
            NOKELP = "锅里还差些材料。",		--空锅不能烹饪
            HASMERMLEADER = "格勒格，稍等片刻。有人正用着。",		--动作说明：激活失败（世界中已经存在鱼人之王）
            NOTAROBOT = "我不是机器。这不合我的手。",		--动作说明：激活失败（仅机器人角色可使用）
            NOTMYBACKUP = "拒绝访问。你不是我。",		--动作说明：激活失败（不是当前机器人的备用躯体）
            TOOMANYBACKUPBODIES = "拒绝访问。备份已满。",		--动作说明：激活失败（备用躯体数量已经达到上限）
		},
        APPLYELIXIR =
        {
            TOO_SUPER = "气味过头了。已经到极限。",		--动作说明：使用药剂失败（目标已经处于最高强化状态）
            NO_ELIXIRABLE = "缺一朵阿比盖尔之花。",		--动作说明：使用药剂失败（附近没有可使用药剂强化的目标）
        },
        APPLYMODULE =
        {
            COOLDOWN = "系统校准中。请稍候。",		--动作说明：WX-78安装电路失败，电路操作仍在冷却
            NOTENOUGHSLOTS = "槽位不足。",		--动作说明：WX-78安装电路失败，剩余电路槽位不足
        },
        APPRAISE =
        {
            NOTNOW = "它正忙。别去搅扰。",		--给牛评价 时间不对
        },
        ATTUNE =
        {
            NOHEALTH = "我的状态还不够。",		--制造肉雕像血量不足
        },
        BATHBOMB =
        {
            GLASSED = "不行。水面已经玻璃化了。",		--月岛池子 里面已经有玻璃了
            ALREADY_BOMBED = "别浪费。已经放过了。",		--月岛池子 已经有人放进去沐浴球了
        },
        BEDAZZLE =
        {
            BURNING = "在烧。装饰无从谈起。",		--动作说明：装饰失败（正在燃烧）
            BURNT = "烧尽了。没什么可装点的。",		--动作说明：装饰失败（已经烧毁）
            FROZEN = "冰上粘不住东西。",		--动作说明：装饰失败（已经冻结）
            ALREADY_BEDAZZLED = "已经够好看了。不必再添，喵。",		--动作说明：装饰失败（已经装饰过）
        },
        BEGIN_QUEST =
        {
            ONEGHOST = "一次只能渡一个。请排队。",		--度化灵魂 温蒂
        },
        BUILD =
        {
            MOUNTED = "骑在牛背上，腾不出手。",		--建造失败（骑乘状态）
            HASPET = "我已经有一只了。够了。",		--建造失败（已经有一个宠物了）
			TICOON = "我有大虎就够了，别的不看，喵。",		--制作浣猫年 大虎失败
            BUSY_STATION = "制作台有人。我等。",		--动作说明：建造失败（建造站正在被占用）
            TOOMANYBACKUPBODIES = "拒绝访问。备份已满。",		--动作说明：建造失败（备用躯体数量已经达到上限）
            TOOMANYSHADOWDRONE_HARVESTER = "拒绝访问。采集机已满额。",		--动作说明：建造失败（暗影采集无人机数量已达上限）
            TOOMANYSHADOWDRONE_DEBUFFER = "拒绝访问。削弱机已满额。",		--动作说明：建造失败（暗影削弱无人机数量已达上限）
        },
        CARNIVALGAME_FEED =
        {
            TOO_LATE = "慢了半拍。",		--鸦年华活动 喂食太慢
        },
		CAST_POCKETWATCH =
		{
			GENERIC = "风险太大。不做。",		--动作说明：使用钟表能力失败（普通状态）
			REVIVE_FAILED = "迟了一步。……可惜。",		--动作说明：使用钟表能力失败（复活目标失败）
			WARP_NO_POINTS_LEFT = "锚点用尽了。回头路没了。",		--动作说明：使用钟表能力失败（传送锚点次数已经耗尽）
			SHARD_UNAVAILABLE = "这条时间流不稳。",		--动作说明：使用钟表能力失败（目标世界分片当前不可用）
			NO_TELEPORT_ZONE = "此处时间流极不稳定。我不冒险。",		--动作说明：使用钟表能力失败（当前位置禁止传送）
		},
		CAST_SPELLBOOK =
		{
			NO_TOPHAT = "缺一顶礼帽。魔术不成立。",		--动作说明：施放魔法书失败（没有装备魔术礼帽）
		},
		CASTAOE =
		{
			NO_MAX_SANITY = "我的意志撑不住。恕不施为。",		--动作说明：施放范围能力失败（理智值上限不足，不能施放该能力）
            NOT_ENOUGH_EMBERS = "余烬不够。回去再烧。",		--施放范围技能失败：余烬不足
            NO_TARGETS = "附近没有值得烧的东西。",		--施放范围技能失败：范围内没有有效目标
            CANT_SPELL_MOUNTED = "它太易燃。骑乘时不宜施法。",		--施放范围技能失败：骑乘时不能施法
            SPELL_ON_COOLDOWN = "再等等。它还没缓过来。",		--施放范围技能失败：技能仍在冷却
			NO_BATTERY = "遥控器没电了。真扫兴。",		--施放范围技能失败：缺少可用电池
			NO_CATAPULTS = "射程之外。投石机够不着。",		--施放范围技能失败：附近没有可用投石机
		},
        CASTSPELL =
        {
            TERRAFORM_TOO_SOON = "浮浪特，别催。魔法需要时间。",		--地形改造施法失败：再次使用得太快
        },
        CHANGEIN =
        {
            GENERIC = "现在不换。",		--换装失败 
            BURNING = "在烧。换个时候。",		--换装失败-着火了
            INUSE = "衣橱一次只容一位。",		--衣橱有人占用
            NOTENOUGHHAIR = "毛不够。装饰无从下手。",		--给牛换装 牛毛被刮光了
            NOOCCUPANT = "得先拴点什么上去。",		--给牛换装 没牛？
        },
        CHARGE_FROM =
        {
            NOT_ENOUGH_CHARGE = "发电机空了。难怪没反应。",		--动作说明：WX-78从发电机充电失败，发电机没有可用电力
            CHARGE_FULL = "电已满。无需再充。",		--动作说明：WX-78从发电机充电失败，当前电量已经充满
        },
		COMPARE_WEIGHABLE =
		{
            FISH_TOO_SMALL = "这条太小。不值一称。",		--鱼秤 手上的没鱼缸里的大
            OVERSIZEDVEGGIES_TOO_SMALL = "份量还差些。",		--蔬菜秤 手上的没秤上的大
		},
        CONSTRUCT =
        {
            INUSE = "有人先占了。",		--建筑正在使用
            NOTALLOWED = "规格不合。",		--建筑不允许使用
            EMPTY = "缺材料。",		--建筑空了
            MISMATCH = "图纸有误。",		--升级套件错误（目前用不到）
            NOTREADY = "时机未到。等一等。",		--建造建筑-没有准备好
        },
        COOK =
        {
            GENERIC = "现在做不了菜。",		--做饭失败
            INUSE = "锅有人用了。",		--做饭失败-别人在用锅
            TOOFAR = "太远。够不着。",		--做饭失败-太远
        },
        DEPLOY = {
            HERMITCRAB_RELOCATE = "空的。稍后再试。",		--动作说明：放置失败（放置位置需要靠近寄居蟹隐士区域）
        },
        DIRECTCOURIER_MAP =
        {
            NOTARGET = "沃比，换个地点。",		--动作说明：在地图上指定快递目标失败（没有选定有效目标）
        },
		DISMANTLE =
		{
			COOKING = "锅里还煮着东西。不行。",		--拆便携的物品-正在做饭
			INUSE = "有人在用。我等。",		--拆便携的物品-正在使用
			NOTEMPTY = "得先把里面的东西取出来。",		--拆便携的物品-里面有物品
        },
        DISMANTLE_POCKETWATCH =
        {
            ONCOOLDOWN = "发条未松。再等片刻。",		--动作说明：拆开失败（能力仍在冷却）
        },
        DRAW =
        {
            NOIMAGE = "眼前没有实物，画不出来。",		--画图缺乏图像
        },
        ENTER_GYM =
        {
            NOWEIGHT = "没有重物，谈不上训练。",		--动作说明：进入失败（没有携带可用于训练的重物）
            UNBALANCED = "重量不均。这样练是歪的。",		--动作说明：进入失败（训练器重量不平衡）
            ONFIRE = "温热尚可。这样已经过头。",		--动作说明：进入失败（目标正在燃烧）
            SMOULDER = "先把余火踩灭。",		--动作说明：进入失败（目标正在阴燃）
            HUNGRY = "空腹举不起东西。",		--动作说明：进入失败（处于饥饿状态）
            FULL = "满了。装不下了。",		--动作说明：进入失败（内容已满）
        },
        FILL_OCEAN =
        {
            UNSUITABLE_FOR_PLANTS = "植物不喝咸水。",		--水壶在海里灌水
        },
        FISH_OCEAN =
		{
			TOODEEP = "这不是海竿。深海不适用。",		--拿普通鱼竿去深海钓鱼
		},
        GIVE =
        {
            GENERIC = "它拒绝了。",		--给予失败
            DEAD = "或许我该留着。",		--给予 -目标死亡
            SLEEPING = "它睡着了。叫不醒。",		--给予--目标睡觉
            BUSY = "稍后我再试。",		--给予--目标正忙
            ABIGAILHEART = "可以一试。",		--给阿比盖尔 救赎之心
            GHOSTHEART = "这主意恐怕不妥。",		--给鬼魂 救赎之心
            NOTGEM = "我不粘这种东西。",		--给的不是宝石
            WRONGGEM = "这颗宝石不对。",		--给错了宝石
			NOGENERATORSKILL = "我不粘这种东西。",		--女工 没点技能不能用纯粹辉煌/纯粹恐惧
            NOTSTAFF = "形状不对。不是它要的。",		--给月石祭坛的物品不是法杖
            MUSHROOMFARM_NEEDSSHROOM = "蘑菇农场要的是蘑菇。",		--蘑菇农场需要蘑菇
            MUSHROOMFARM_NEEDSLOG = "这里该放一块活木。",		--蘑菇农场需要活木
            MUSHROOMFARM_NOMOONALLOWED = "这些蘑菇不肯入土。",		--蘑菇农场里放入月蘑菇
            SLOTFULL = "槽位已经放满。",		--已经放了材料后，再给雕像桌子再给一个材料
            FOODFULL = "这里已经有一份了。",		--没调用
            NOTDISH = "它不会吃那个。",		--没调用
            DUPLICATE = "这个我已经知道了。",		--给雕像桌子已经学习过的图纸
            NOTSCULPTABLE = "再精巧的手艺也变不成雕像。",		--给陶艺圆盘的东西不对
            NOTATRIUMKEY = "形状不对。不是钥匙。",		--中庭钥匙不对
            CANTSHADOWREVIVE = "它不会醒。门还锁着。",		--动作说明：给予失败，远古大门仍在重置冷却期
            WRONGSHADOWFORM = "拼错了。",		--没调用
            NOMOON = "得看见月亮才行。",		--洞穴里建造月石科技
			PIGKINGGAME_MESSY = "先清理干净。",		--猪王旁边有建筑，不能开始抢元宝
			PIGKINGGAME_DANGER = "此刻太危险。",		--危险，不能开始抢元宝
			PIGKINGGAME_TOOLATE = "现在已经太晚。",		--不是白天，不能开始抢元宝
			CARNIVALGAME_INVALID_ITEM = "得先去换代币。",		--鸦年华活动 给无效的物品
			CARNIVALGAME_ALREADY_PLAYING = "已经有一场在进行。",		--鸦年华活动 已经开始游戏了
            SPIDERNOHAT = "少一顶蜘蛛帽。",		--喂食蜘蛛 没带蜘蛛帽
            TERRARIUM_REFUSE = "换一种燃料，它或许肯接受。",		--盒中泰拉 拒绝这个物品
            TERRARIUM_COOLDOWN = "树还没长回来。给不了。",		--动作说明：给予失败，盒中泰拉仍在冷却期
            NOTAMONKEY = "我不会说猴语。",		--不是芜猴 已弃用
            QUEENBUSY = "她正忙。",		--猴子女王在忙
            CARNIVALGAME_GOLFGAME_NOTREADY = "球局还没摆好。",		--动作说明：给予失败（迷你高尔夫游戏尚未准备好）
            KINGSTAFF_COOLDOWN = "卡住了。", 		--动作说明：给予失败（王之手杖尚未恢复，暂时不能放入宝石）
        },
        GIVE_TACKLESKETCH =
		{
			DUPLICATE = "不对。这张我已经有了。",		--给陶盘已经有的图纸
        },
        GIVETOPLAYER =
        {
            FULL = "你的口袋装不下了。",		--给玩家一个东西 -但是背包满了
            DEAD = "或许我该留着。",		--给死亡的玩家一个东西
            SLEEPING = "睡得太沉。叫不醒。",		--给睡觉的玩家一个东西
            BUSY = "稍后我再试。",		--给忙碌的玩家一个东西
        },
        GIVEALLTOPLAYER =
        {
            FULL = "你的口袋装不下了。",		--给人一组东西 但是背包满了
            DEAD = "或许我该留着。",		--给于死去的玩家一组物品
            SLEEPING = "睡沉了。",		--给于正在睡觉的玩家一组物品
            BUSY = "稍后我再试。",		--给于正在忙碌的玩家一组物品
        },
        HARVEST =
        {
            DOER_ISNT_MODULE_OWNER = "它对科学讨论没有兴趣。",		--收获失败：角色不是模块所有者
            DOER_DOESNT_HAVE_SKILL = "无效凭证。",		--动作说明：采收失败（执行角色尚未解锁所需技能）
        },
        HEAL =
        {
            NOT_MERM = "只对鱼人有效。",		--治疗失败：目标不是鱼人
        },
        HERD_FOLLOWERS =
        {
            WEBBERONLY = "它们不听我的。或许会听韦伯的。",		--不是韦伯，无法召集蜘蛛
        },
        HITCHUP =
        {
            NEEDBEEF = "得有一只皮弗娄牛。",		--将牛拴起来 没有牛
            NEEDBEEF_CLOSER = "它离得太远。走近些。",		--将牛拴起来 牛太远
            BEEF_HITCHED = "它已经拴好了。",		--将牛拴起来 牛已经被拴起来了
            INMOOD = "它现在心浮气躁。",		--将牛拴起来 牛在发情
        },
		LOOKAT = 
		{
			ROSEGLASSES_INVALID = "没有查理的痕迹。",		--动作说明：查看失败（玫瑰色眼镜没有有效观察目标）
			ROSEGLASSES_COOLDOWN = "再等等。镜片也要歇口气。",		--动作说明：查看失败（玫瑰色眼镜仍在冷却）
            ROSEGLASSES_DISMISS = "踪迹断了。……可惜。",		--动作说明：查看失败（玫瑰色眼镜目标已被主动忽略）
            ROSEGLASSES_STUMPED = "看不出她来过的痕迹。",		--动作说明：查看失败（玫瑰色眼镜无法识别该目标）
		},
        LOWER_SAIL_FAIL =
        {
            "唔。",		--降帆失败
            "帆降不下来。",		--降帆失败
            "再来一次就是。",		--降帆失败
        },
        MARK =
        {
            ALREADY_MARKED = "我已经选好了。",		--选择牛 已经选择了
            NOT_PARTICIPANT = "我没有参赛。",		--选择牛 不是参与者（已经开始了）?
        },
        MOUNT =
        {
            TARGETINCOMBAT = "它正在气头上。不骑。",		--骑乘，牛正在战斗
            INUSE = "有人先骑了。",		--骑乘（牛被占据）
			SLEEPING = "醒一醒。",		--上牛  牛在睡觉
        },
        OCEAN_FISHING_POND =
		{
			WRONGGEAR = "这根竿不适合池塘。",		--拿深海鱼竿去普通的池子里钓鱼
		},
		OPEN_CRAFTING =
		{
            PROFESSIONALCHEF = "厨艺还不到火候。",		--别人无法通过 点击便携调料站 点开制作面板
			SHADOWMAGIC = "那不叫科学。",		--别人无法通过 打开老麦的暗影制作面板
		},
        PICK =
        {
            NOTHING_INSIDE = "里面是空的。",		--采集失败：目标内部没有可取物品
			STUCK = "卡住了。拔不出来。",		--动作说明：采集失败（目标卡住，不能采集）
        },
        PICKUP =
        {
			RESTRICTION = "手法不够。用不了。",		--熔炉模式下捡起错误的武器
			INUSE = "有人在用。我等。",		--捡起已经打开的容器
            NOTMINE_SPIDER = "哦。抱歉，你认错人了。",		--动作说明：拾取失败（不是当前角色招募的蜘蛛）
            NOTMINE_YOTC =
            {
                "你不是我的胡萝卜鼠，喵。",		--捡起别人的胡萝卜鼠
                "它咬我。放肆。",		--捡起别人的胡萝卜鼠
            },
			NO_HEAVY_LIFTING = "再年轻几岁……也许搬得动。",		--动作说明：拾取失败（当前角色不能搬运重物）
            FULL_OF_CURSES = "我不碰那个。",		--捡起诅咒时 诅咒已满
        },
        PLANTREGISTRY_RESEARCH_FAIL =
        {
            GENERIC = "没有更多可学的了。",		--研究作物失败
            FERTILIZER = "细节不必深究。",		--研究肥料失败
        },
        POUR_WATER =
        {
            OUT_OF_WATER = "壶空了。",		--水壶空了
        },
        POUR_WATER_GROUNDTILE =
        {
            OUT_OF_WATER = "壶已经干了。",		--水壶空了
        },
        READ =
        {
            GENERIC = "还有别的事要先处理。",		--动作说明：阅读失败，当前有其他动作需先处理
            NOBIRDS = "鸟不喜欢这种天气。",		--动作说明：阅读失败，天气或环境不适合鸟类出现
            NOWATERNEARBY = "鱼只在水边现身。",		--动作说明：阅读失败，附近没有水域，不能召唤鱼
            TOOMANYBIRDS = "地上的鸟太多。魔法不灵。",		--动作说明：阅读失败，地面鸟类过多
            WAYTOOMANYBIRDS = "天上已经一只不剩了。",		--动作说明：阅读失败，短时间召鸟过多，天空暂无可召唤鸟
            BIRDSBLOCKED = "力场挡得住鸟。",		--动作说明：阅读失败，力场阻挡鸟类进入
            NOFIRES =       "幸好没有明火要扑。",		--动作说明：阅读失败，附近没有需要扑灭的明火
            NOSILVICULTURE = "附近没有可作文章的树。",		--动作说明：阅读失败，附近没有有效树木
            NOHORTICULTURE = "没有可以催生的庄稼。",		--动作说明：阅读失败，附近没有可催生作物
            NOTENTACLEGROUND = "这里的地面生不出触手。",		--动作说明：阅读失败，当前地面不能生成触手
            NOSLEEPTARGETS = "没看见谁需要睡前故事。",		--动作说明：阅读失败，附近没有可催眠目标
            TOOMANYBEES = "蜂太多了。这会失控。",		--动作说明：阅读失败，附近蜜蜂数量过多
            NOMOONINCAVES = "地下够不到月亮。",		--动作说明：阅读失败，洞穴中无法影响月亮
            ALREADYFULLMOON = "已经是满月。多余之举。",		--动作说明：阅读失败，当前已经是满月
            DEADBIRDS = "……天空此刻不宜有鸟。",		--动作说明：阅读失败，当前环境对鸟类不安全，不能召鸟
        },
		REMOTE_TELEPORT =
		{
			NOSKILL = "这个型号我不熟。",		--远程传送失败：尚未学习所需技能
			NODEST = "没有接收端。传送不成立。",		--远程传送失败：没有设置目的地
		},
        REMOVEMODULES =
        {
            NO_MODULES = "错误：没有模块可拆。",		--动作说明：WX-78移除电路失败，当前没有安装电路
        },
        REPAIR =
        {
            WRONGPIECE = "这一块不对。",		--化石骨架拼接错误
        },
        REPLATE =
        {
            MISMATCH = "它要另一种碟子。",		--暴食-换盘子换错了 比如用碗换碟子
            SAMEDISH = "一个碟子就够了。",		--暴食-换盘子已经换了
        },
        ROW_FAIL =
        {
            BAD_TIMING0 = "太快了。",		--划船失败 第1次
            BAD_TIMING1 = "时机不对。",		--划船失败 第2次
            BAD_TIMING2 = "别犯第三次。",		--划船失败 第3次
        },
		RUMMAGE =
		{
			GENERIC = "做不到。",		--打开箱子失败
			INUSE = "有人在里面翻找。",		--打开箱子 正在使用
            NOTMASTERCHEF = "厨艺还不到火候。",		--非厨师尝试打开便携锅
            NOTAMERM = "鱼人不会为此高兴。",		--往只有鱼人能用的箱子里放东西 但是你不是鱼人
            NOTSOULJARHANDLER = "此非我份内之事。",		--动作说明：打开容器失败（当前角色不能操作灵魂容器）
            RESTRICTED = "调查终止。我没有权限。",		--动作说明：打开容器失败（当前角色没有访问权限）
            NOTAROBOT = "我不是机器。用不了。",		--动作说明：打开容器失败（仅机器人角色可使用）
            NOTMYBACKUP = "拒绝访问。你不是我。",		--动作说明：打开容器失败（不是当前机器人的备用躯体）
            TOOMANYBACKUPBODIES = "拒绝访问。备份已满。",		--动作说明：打开容器失败（备用躯体数量已经达到上限）
		},
        SADDLE =
        {
            TARGETINCOMBAT = "它气着的时候，不许我靠近。",		--给战斗状态的牛上鞍
        },
		SHAVE =
		{
			AWAKEBEEFALO = "它醒着，我不动手。",		--给醒着的牛刮毛
			GENERIC = "这个不能剃。",		--刮牛毛失败
			NOBITS = "一根毛茬都不剩，喵。",		--给没毛的牛刮毛
            REFUSE = "我的胡须，我自己留着，喵。",		--动作说明：剃毛失败（目标拒绝该操作）
            SOMEONEELSESBEEFALO = "别人家的牛，我不薅。",		--给别人的牛刮毛
		},
        SING_FAIL =
        {
            SAMESONG = "同一首不唱第二遍。",		--动作说明：演唱失败（与当前演奏的是同一首歌）
        },
        SLAUGHTER =
        {
            TOOFAR = "它跑了。",		--屠杀？？ 因为太远而失败
        },
        START_CARRAT_RACE =
        {
            NO_RACERS = "我漏掉了什么。",		--试图开始胡萝卜鼠比赛 但是没有放胡萝卜鼠
        },
		STORE =
		{
			GENERIC = "装满了。",		--存放东西失败
			NOTALLOWED = "这东西不能放进去。",		--存放东西--不被允许
			INUSE = "等它空出来。",		--别人正在用箱子
            NOTMASTERCHEF = "厨艺还不到火候。",		--非厨师尝试往便携锅里塞东西
            NOTSOULJARHANDLER = "灵魂的事，我不经手。",		--动作说明：存入容器失败（当前角色不能操作灵魂容器）
            RESTRICTED = "调查终止。我没有权限。",		--动作说明：存入容器失败（当前角色没有访问权限）
            NOTAROBOT = "我不是机器。用不了。",		--动作说明：存入容器失败（仅机器人角色可使用）
            NOTMYBACKUP = "拒绝访问。你不是我。",		--动作说明：存入容器失败（不是当前机器人的备用躯体）
            TOOMANYBACKUPBODIES = "拒绝访问。备份已满。",		--动作说明：存入容器失败（备用躯体数量已经达到上限）
		},
		STARTMAPDELIVER =
		{
			EMPTY = "错误：无可投递之物。",		--动作说明：运送失败（内容为空）
			INUSE = "正被其他操作占用。",		--动作说明：运送失败（目标正在被其他操作占用）
			NOSKILL_DRONE = "无效凭证。", 		--动作说明：运送失败（尚未解锁快递无人机技能）
		},
        SWAPBODIES_MAP =
        {
            NOTARGET = "通信失败。目标不在了。",		--动作说明：传输意识失败（没有选定有效目标）
        },
        TEACH =
        {
            KNOWN = "这个我已经知道。",		--学习已经知道的蓝图
            CANTLEARN = "这个我学不会。",		--学习无法学习的蓝图

            WRONGWORLD = "这张地图，此处用不了。",		--学习另外一个世界的地图

			MESSAGEBOTTLEMANAGER_NOT_FOUND = "太暗了。什么都看不见。",		--在地下使用漂流瓶

            STASH_MAP_NOT_FOUND = "没有那个叉。他们忘了标。",		--宝藏图纸没有宝藏
        },
		TELLSTORY =
		{
			GENERIC = "这里不适合讲鬼故事。",		--讲故事 沃比
			NOT_NIGHT = "等天黑再讲。气氛要紧。",		--动作说明：讲故事失败（当前不是夜晚）
			NO_FIRE = "缺一堆火。故事需要火光。",		--动作说明：讲故事失败（附近没有可供讲故事的营火）
		},
		UNLOCK =
        {
            WRONGKEY = "不行。钥匙不对。",		--动作说明：解锁失败（使用了错误钥匙）
        },
        UPGRADE =
        {
            BEDAZZLED = "好不容易装点好。就这样吧。",		--动作说明：升级失败（装饰状态不符合要求）
        },
        USEEQUIPPEDITEM =
        {
            BADPOSITION = "错误：位置无效。",		--动作说明：使用已装备物品失败（目标位置不合适）
        },
        USEITEMON =
        {

            BEEF_BELL_INVALID_TARGET = "办不到。",		--对无效目标使用牛铃铛
            BEEF_BELL_ALREADY_USED = "这头牛已经有主了。",		--对已有主人的牛使用牛铃铛
            BEEF_BELL_HAS_BEEF_ALREADY = "我不需要一整群牛。",		--已有牛 使用牛铃铛

			NOT_MINE = "这是别人的。",		--动作说明：对目标使用物品失败（不属于当前角色）

			CANNOT_FIX_DRONE = "损坏过重。修不了。",		--动作说明：对目标使用物品失败（当前物品不能修复无人机）

            GESTALT_TOO_POWERFUL = "能量超出可承受的上限。",		--动作说明：对目标使用物品失败（启蒙实体力量过强）
        },
		USEKLAUSSACKKEY =
        {
            WRONGKEY = "不对。不是这把。",		--使用克劳斯钥匙
            KLAUS = "我正忙着。",		--克劳斯
			QUAGMIRE_WRONGKEY = "得再找一把钥匙。",		--动作说明：解锁失败（使用了暴食活动中的错误钥匙）
        },
        WRAPBUNDLE =
        {
            EMPTY = "总得有东西可打包。",		--打包纸是空的
        },
        WRITE =
        {
            GENERIC = "它现在这样挺好，喵。",		--写字失败
            INUSE = "只容得下一个涂鸦者。",		--写字 正在使用中
        },
        YOTB_STARTCONTEST =
        {
            DOESNTWORK = "这里不讲艺术。",		--动作说明：开始皮弗娄牛比赛失败，评委未处于工作状态
            ALREADYACTIVE = "他大概在别处比着。",		--动作说明：开始皮弗娄牛比赛失败，比赛已经开始
            NORESPONSE = "裁判没有回应。",		--动作说明：开始比赛失败（裁判没有响应比赛请求）
            RIGHTTHERE = "他正忙。",		--动作说明：开始比赛失败（比赛终点位置距离过近）
        },
        YOTB_UNLOCKSKIN =
        {
            ALREADYKNOWN = "熟悉的样式。这个我早就会了，喵。",		--牛年活动 解锁已知皮肤
        },
		CARVEPUMPKIN =
		{
			INUSE = "有人先动手了。",		--动作说明：雕刻失败（目标正在被其他操作占用）
			BURNING = "火在灼我的手。",		--动作说明：雕刻失败（正在燃烧）
		},
		DECORATESNOWMAN =
		{
			INUSE = "有人占着雪人。",		--动作说明：装饰雪人失败（目标正在被其他操作占用）
			HASHAT = "雪人不必戴两顶帽子。",		--动作说明：装饰雪人失败（雪人已经戴有帽子）
			STACKEDTOOHIGH = "堆得太高了。",		--动作说明：装饰雪人失败（雪人装饰堆叠位置过高）
			MELTING = "不行。它要化了。",		--动作说明：装饰雪人失败（正在融化，不能继续装饰）
		},
        MUTATE = 
        {
            NOGHOST = "得请阿比来。",		--动作说明：转化失败（附近没有可用幽灵）
            NONEWMOON = "月亮还没亏到新月。",		--动作说明：转化失败（当前不是新月）
            NOFULLMOON = "得是满月。",		--动作说明：转化失败（当前不是满月）
            NOTNIGHT = "太阳底下不成。",		--动作说明：转化失败（当前不是夜晚）
            CAVE = "没有月光，行不通。",		--动作说明：转化失败（位于洞穴世界）
        },
		MODSLINGSHOT =
		{
			NOSLINGSHOT = "没有弹弓可改。",		--动作说明：改装弹弓失败（没有装备弹弓）
		},
		POUNCECAPTURE =
		{
			MISSED = "可惜。让它溜了。",		--动作说明：捕获失败（未能抓住目标）
		},
        DIVEGRAB =
        {
            MISSED = "可惜。没抓住。",		--动作说明：约束失败（未能抓住目标）
        },

		SOAKIN =
		{
			NOSPACE = "换不了位置。",		--动作说明：泡失败（目标位置没有足够空间）
		},
    },

	ANNOUNCE_CANNOT_BUILD =
	{
		NO_INGREDIENTS = "材料不全。我缺几样东西。",		--建造失败：缺少材料
		NO_TECH = "学识尚浅。还须深造。",		--建造失败：科技等级不足
		NO_STATION = "此处没有可用的台案。",		--建造失败：附近缺少所需制作站
	},

	ACTIONFAIL_GENERIC = "不成。换个做法。",		--动作失败
	ANNOUNCE_BOAT_LEAK = "水在涨。船板裂了。",		--船撞了个洞
	ANNOUNCE_BOAT_SINK = "我不打算淹死在这里。",		--船漏水
    ANNOUNCE_PREFALLINVOID = "脚下空了。这很不妙。",		--即将坠入虚空
	ANNOUNCE_DIG_DISEASE_WARNING = "它看着好多了。", 		--挖起生病的植物
	ANNOUNCE_PICK_DISEASE_WARNING = "原来一直是这个味道。", 		--（植物生病）
	ANNOUNCE_ADVENTUREFAIL = "不顺利。再来一次。",		--没调用（废案）
    ANNOUNCE_MOUNT_LOWHEALTH = "这头坐骑撑不住了。",		--牛血量过低

    ANNOUNCE_TOOMANYBIRDS = "鸟太多了。魔法被它们分薄了。",		--附近鸟类过多，不能再召唤鸟
    ANNOUNCE_WAYTOOMANYBIRDS = "天上空了。一只也不剩。",		--附近鸟类数量严重超限
    ANNOUNCE_NOWATERNEARBY = "鱼只肯在水边现身。",		--附近没有可用水域

	ANNOUNCE_SHADOWLEVEL_ITEM = "\n我的暗影傀儡，应当能从它身上取力……",		--装备具有暗影等级的物品
	ANNOUNCE_EQUIP_SHADOWLEVEL_T1 = "有变化。暗影傀儡变强了……",		--装备一级暗影物品
	ANNOUNCE_EQUIP_SHADOWLEVEL_T2 = "暗影傀儡的力量在增长。",		--装备二级暗影物品
	ANNOUNCE_EQUIP_SHADOWLEVEL_T3 = "去吧。没有人能挡在我们前面。",		--装备三级暗影物品
	ANNOUNCE_EQUIP_SHADOWLEVEL_T4 = "我召出的暗影，无人可挡。",		--装备四级暗影物品

    ANNOUNCE_NORMALTOMIGHTY = "力气回来了。",		--沃尔夫冈从普通形态变为强壮形态
    ANNOUNCE_NORMALTOWIMPY = "身子发虚。",		--沃尔夫冈从普通形态变为虚弱形态
    ANNOUNCE_WIMPYTONORMAL = "身子轻了些。",		--沃尔夫冈从虚弱形态恢复普通形态
    ANNOUNCE_MIGHTYTONORMAL = "不。我还得更强。",		--沃尔夫冈从强壮形态恢复普通形态
    ANNOUNCE_EXITGYM = {
        MIGHTY = "状态回来了。",		--沃尔夫冈以强壮形态离开健身房
        NORMAL = "好些了。还能更好。",		--沃尔夫冈以普通形态离开健身房
        WIMPY = "我需要……歇一会儿……",		--沃尔夫冈以虚弱形态离开健身房
    },

	ANNOUNCE_BEES = "蜜蜂。别靠近。",		--戴养蜂帽被蜜蜂蛰
	ANNOUNCE_BOOMERANG = "接住。别让它落地。",		--回旋镖
	ANNOUNCE_CHARLIE = "这感觉……很熟悉。有人吗？",		--查理即将攻击
	ANNOUNCE_CHARLIE_ATTACK = "被咬了。它在暗处。",		--被查理攻击
	ANNOUNCE_CHARLIE_MISSED = "你的路数，我早看清了。", 		--查理的攻击落空
	ANNOUNCE_COLD = "冷进骨头里了。",		--过冷
	ANNOUNCE_HOT = "需要……冰，或者阴凉……",		--过热
	ANNOUNCE_CRAFTING_FAIL = "少了几样关键的东西。",		--没调用
	ANNOUNCE_DEERCLOPS = "那声音，分量不轻。",		--事件说明：独眼巨鹿即将来袭
	ANNOUNCE_CAVEIN = "头顶在晃。",		--要地震了？？？
	ANNOUNCE_ANTLION_SINKHOLE =
	{
		"地面在动。",		--蚁狮地震
		"地震。",		--蚁狮地震
		"震波来了。站稳。",		--蚁狮地震
	},
	ANNOUNCE_ANTLION_TRIBUTE =
	{
        "请容我致意。",		--向蚁狮致敬
        "贡品在此，伟大的蚁狮。",		--给蚁狮上供
        "这能让它安静一阵……",		--给蚁狮上供
	},
	ANNOUNCE_SACREDCHEST_YES = "我想，我配得上。",		--远古宝箱物品正确给出蓝图
	ANNOUNCE_SACREDCHEST_NO = "它不满意这件。",		--远古宝箱
    ANNOUNCE_DUSK = "天要黑了。该收手了。",		--进入黄昏

    ANNOUNCE_CHARGE = "系统已恢复。",		--角色获得电荷
	ANNOUNCE_DISCHARGE = "系统正常。",		--角色释放或失去电荷

    ANNOUNCE_ROSEGLASSES = 
    {
        "明白了，姐妹。",		--玫瑰色眼镜效果提示
        "查理来过。",		--玫瑰色眼镜效果提示
        "我找到了她魔法的痕迹。",		--玫瑰色眼镜效果提示
    },
    ANNOUNCE_CHARLIESAVE = 
    {
        "她救我，还是杀我？说不准。",		--查理出手保护角色
    },
	ANNOUNCE_ENGINEERING_CAN_UPGRADE = "我的版本，比它高明不少。",		--工程装置可以升级
	ANNOUNCE_ENGINEERING_CAN_DOWNGRADE = "这一台，比我的更先进。",		--工程装置可以降级
	ANNOUNCE_ENGINEERING_CAN_SIDEGRADE = "有意思。各有所长。",		--工程装置可以横向改造

	ANNOUNCE_EAT =
	{
		GENERIC = "味道不错，喵。",		--吃东西
		PAINFUL = "这东西在伤我。",		--吃怪物肉
		SPOILED = "腐坏的味道。没有第二口。",		--吃腐烂食物
		STALE = "它开始变质了。",		--吃黄色食物
		INVALID = "那东西不进我的嘴。",		--拒吃
        YUCKY = "放进嘴里？恕我拒绝。",		--吃红色食物

		COOKED = "尚算熟透。",		--食用符合偏好的熟食
		DRIED = "干了些，还能吃。",		--食用符合偏好的干制食物
        PREPARED = "这一道，可口。",		--食用符合偏好的料理
        RAW = "生的。火候全无。",		--食用符合偏好的生食
		SAME_OLD_1 = "菜单该换换了。",		--近期重复食用同一种食物一次
		SAME_OLD_2 = "重复。无味。",		--近期重复食用同一种食物两次
		SAME_OLD_3 = "我想吃点别的。",		--近期重复食用同一种食物三次
		SAME_OLD_4 = "再吃这个，我要失礼了。",		--近期重复食用同一种食物四次
        SAME_OLD_5 = "够了。彻底够了。",		--近期重复食用同一种食物达到最高厌倦程度
		TASTY = "这一口，值得记下来。",		--食用角色特别喜欢的食物
    },

	ANNOUNCE_FOODMEMORY = "\n同样的东西，我不想再吃。",		--食物记忆生效：近期重复食用相同食物

    ANNOUNCE_ENCUMBERED =
    {
        "这重量……有些失礼……",		--搬运雕像、可疑的大理石
        "我该造一台……起重机……",		--搬运雕像、可疑的大理石
        "用背……顶起来……",		--搬运雕像、可疑的大理石
        "这活计……不体面……",		--搬运雕像、可疑的大理石
        "为了……知识……",		--搬运雕像、可疑的大理石
        "它在……弄乱我的头发。",		--搬运雕像、可疑的大理石
        "哼。",		--搬运雕像、可疑的大理石
        "腰快……断了……",		--搬运雕像、可疑的大理石
        "这是我……最糟的试验……",		--搬运雕像、可疑的大理石
    },
    ANNOUNCE_ATRIUM_DESTABILIZING =
    {
		"该走了。",		--事件说明：远古织影者被击败后，远古大门开始失稳并即将重置（台词变体1）
		"那是什么。",		--中庭震动
		"此地不宜久留。",		--事件说明：远古织影者被击败后，远古大门开始失稳并即将重置（台词变体3）
	},
    ANNOUNCE_RUINS_RESET = "它们全回来了。",		--地下重置
    ANNOUNCE_SNARED = "骨头。全是尖的。",		--远古嘤嘤怪的骨笼
    ANNOUNCE_SNARED_IVY = "藤蔓缠住了。割开它。",		--被针刺旋花攻击
    ANNOUNCE_REPELLED = "它有护罩。",		--嘤嘤怪保护状态
	ANNOUNCE_ENTER_DARK = "一点光也没有。……不妙。",		--进入黑暗
	ANNOUNCE_ENTER_LIGHT = "又能看清了。",		--进入光源
	ANNOUNCE_FREEDOM = "自由了。终于。",		--没调用（废案）
	ANNOUNCE_HIGHRESEARCH = "思路通了。很好。",		--没调用（废案）
	ANNOUNCE_HOUNDS = "林子里有脚步。",		--猎犬将至
	ANNOUNCE_WORMS = "地下有动静。",		--蠕虫袭击
    ANNOUNCE_WORMS_BOSS = "这声音，不太妙。",		--洞穴蠕虫首领来袭
    ANNOUNCE_ACIDBATS = "翅膀声。不止一只。",		--酸雨蝙蝠群即将来袭
	ANNOUNCE_HUNGRY = "饿了。",		--饥饿
	ANNOUNCE_HUNT_BEAST_NEARBY = "足迹还新。它就在附近。",		--即将找到野兽
	ANNOUNCE_HUNT_LOST_TRAIL = "足迹到此为止。",		--猎物（大象脚印丢失）
	ANNOUNCE_HUNT_LOST_TRAIL_SPRING = "湿土留不住脚印。",		--大猎物丢失踪迹
    ANNOUNCE_HUNT_START_FORK = "这条路，气味不对。",		--追踪足迹时发现岔路
    ANNOUNCE_HUNT_SUCCESSFUL_FORK = "它跑不过我。",		--在足迹岔路中选对追踪方向
    ANNOUNCE_HUNT_WRONG_FORK = "有什么在看我。",		--在足迹岔路中选错追踪方向
    ANNOUNCE_HUNT_AVOID_FORK = "这边安静。走这边。",		--追踪足迹时避开岔路
	ANNOUNCE_INV_FULL = "拿不下了。",		--身上的物品满了
	ANNOUNCE_KNOCKEDOUT = "头……很沉。",		--被催眠
	ANNOUNCE_LOWRESEARCH = "一无所获。",		--没调用（废案）
	ANNOUNCE_MOSQUITOS = "走开。",		--没调用
    ANNOUNCE_NOWARDROBEONFIRE = "衣柜在烧。换不了衣裳。",		--橱柜着火
    ANNOUNCE_NODANGERGIFT = "四周不干净。礼物稍后再拆。",		--周围有危险的情况下打开礼物
    ANNOUNCE_NOMOUNTEDGIFT = "先得从牛背上下来。",		--骑牛的时候打开礼物
	ANNOUNCE_NODANGERSLEEP = "这时候睡下，未必能醒。",		--危险，不能睡觉
	ANNOUNCE_NODAYSLEEP = "光太亮了。",		--白天睡帐篷
	ANNOUNCE_NODAYSLEEP_CAVE = "我不困。",		--洞穴里白天睡帐篷
	ANNOUNCE_NOHUNGERSLEEP = "饿着睡不着。肚子太吵。",		--饿了无法睡觉
	ANNOUNCE_NOSLEEPONFIRE = "睡在火里？恕不奉陪。",		--营帐着火无法睡觉
    ANNOUNCE_NOSLEEPHASPERMANENTLIGHT = "光照与睡眠相冲。",		--附近存在永久光源，不能入睡
	ANNOUNCE_NODANGERSIESTA = "现在小憩，太冒险。",		--危险，不能午睡
	ANNOUNCE_NONIGHTSIESTA = "夜里该正经睡，不是小憩。",		--夜晚睡凉棚
	ANNOUNCE_NONIGHTSIESTA_CAVE = "在这种地方，我放松不下来。",		--在洞穴里夜晚睡凉棚
	ANNOUNCE_NOHUNGERSIESTA = "饿着，歇不安稳。",		--饱度不足无法午睡
	ANNOUNCE_NO_TRAP = "就这样。不难。",		--没有陷阱？？？没调用
	ANNOUNCE_PECKED = "呀。别啄我。",		--被小高鸟啄
	ANNOUNCE_QUAKE = "地在响。",		--地震
	ANNOUNCE_RESEARCH = "又懂了一点。",		--没调用
	ANNOUNCE_SHELTER = "多谢庇荫，大树。",		--下雨天躲树下
	ANNOUNCE_THORNS = "扎手。",		--玫瑰、仙人掌、荆棘扎手
	ANNOUNCE_BURNT = "烫！",		--烧完了
	ANNOUNCE_TORCH_OUT = "火尽了。",		--火把用完了
	ANNOUNCE_THURIBLE_OUT = "香炉空了。",		--香炉燃尽
	ANNOUNCE_FAN_OUT = "扇子停了。风也散了。",		--小风车停了
    ANNOUNCE_COMPASS_OUT = "指南针死了。它不再指路。",		--指南针用完了
	ANNOUNCE_TRAP_WENT_OFF = "触到了。",		--触发陷阱（例如冬季陷阱）
	ANNOUNCE_UNIMPLEMENTED = "这还没做完。",		--没调用
	ANNOUNCE_WORMHOLE = "清醒的人不会钻这个。",		--跳虫洞
    ANNOUNCE_WORMHOLE_SAMESPOT = "绕了一圈，回到原地。",		--虫洞出口与入口位于同一地点
	ANNOUNCE_TOWNPORTALTELEPORT = "这算不算学问，我存疑。",		--豪华传送
	ANNOUNCE_CANFIX = "\n这个，我能修好。",		--墙壁可以修理
	ANNOUNCE_ACCOMPLISHMENT = "做成了。",		--没调用
	ANNOUNCE_ACCOMPLISHMENT_DONE = "若他们此刻在场，会看见的……",		--没调用
	ANNOUNCE_INSUFFICIENTFERTILIZER = "还饿吗，小东西。",		--土地肥力不足
	ANNOUNCE_TOOL_SLIP = "手滑了。工具太滑。",		--工具滑出
	ANNOUNCE_LIGHTNING_DAMAGE_AVOIDED = "闪电落空。",		--规避闪电
	ANNOUNCE_TOADESCAPING = "蟾蜍失去了兴致。",		--蟾蜍正在逃跑
	ANNOUNCE_TOADESCAPED = "蟾蜍走了。",		--蟾蜍逃走了


	ANNOUNCE_DAMP = "有水汽。",		--潮湿（1级）
	ANNOUNCE_WET = "衣裳开始渗水了。",		--潮湿（2级）
	ANNOUNCE_WETTER = "湿透了。真糟糕。",		--潮湿（3级）
	ANNOUNCE_SOAKED = "饱和了。一滴也吸不进。",		--潮湿（4级）

	ANNOUNCE_WASHED_ASHORE = "湿透了，但还活着。",		--落水被冲上岸

    ANNOUNCE_DESPAWN = "有光。",		--下线
	ANNOUNCE_BECOMEGHOST = "……我的形体散了。",		--变成鬼魂
	ANNOUNCE_GHOSTDRAIN = "有什么在从我身上流走……",		--事件说明：队友死亡导致理智值下降
	ANNOUNCE_PETRIFED_TREES = "树刚才在叫。我听见了。",		--石化树
	ANNOUNCE_KLAUS_ENRAGE = "它怒了。现在杀不掉。",		--克劳斯被激怒（杀死了鹿）
	ANNOUNCE_KLAUS_UNCHAINED = "锁链断了。",		--克劳斯-未上锁的  猜测是死亡准备变身？
	ANNOUNCE_KLAUS_CALLFORHELP = "它在唤援。",		--克劳斯召唤小偷

	ANNOUNCE_MOONALTAR_MINE =
	{
		GLASS_MED = "里头有东西。",		--月岛科技三个部分被挖开
		GLASS_LOW = "快出来了。",		--月岛科技三个部分被挖开
		GLASS_REVEAL = "出来吧。",		--月岛科技三个部分被挖开
		IDOL_MED = "里面封着东西。",		--月岛科技三个部分被挖开
		IDOL_LOW = "再挖两下。",		--月岛科技三个部分被挖开
		IDOL_REVEAL = "重见天日了。",		--月岛科技三个部分被挖开
		SEED_MED = "壳里有东西。",		--月岛科技三个部分被挖开
		SEED_LOW = "快了，再一层。",		--月岛科技三个部分被挖开
		SEED_REVEAL = "你可以出来了。",		--月岛科技三个部分被挖开
	},

    ANNOUNCE_SPOOKED = "……",		--被吓到
	ANNOUNCE_BRAVERY_POTION = "那些树，看着顺眼了些。",		--勇气药剂
	ANNOUNCE_MOONPOTION_FAILED = "大概泡得不够久……",		--万圣节月亮药水 对不能变化的物品使用

	ANNOUNCE_EATING_NOT_FEASTING = "这份该分给旁人。",		--冬季盛宴的植物 单人吃（但是没调用）
	ANNOUNCE_WINTERS_FEAST_BUFF = "节日的暖意，上来了。",		--事件说明：获得冬季盛宴食物的持续恢复效果
	ANNOUNCE_IS_FEASTING = "冬季盛宴，诸位同乐。",		--冬季盛宴 大家一起吃
	ANNOUNCE_WINTERS_FEAST_BUFF_OVER = "节日散得太快……",		--事件说明：冬季盛宴食物的持续恢复效果结束

    ANNOUNCE_REVIVING_CORPSE = "让我看看你。",		--没调用（熔炉）
    ANNOUNCE_REVIVED_OTHER_CORPSE = "站起来了。",		--没调用（熔炉）
    ANNOUNCE_REVIVED_FROM_CORPSE = "好多了。多谢。",		--没调用（熔炉）

    ANNOUNCE_FLARE_SEEN = "谁放的光？",		--看见信号弹
    ANNOUNCE_MEGA_FLARE_SEEN = "那道光，会招来麻烦。",		--看到远处发射的巨型信号弹
    ANNOUNCE_OCEAN_SILHOUETTE_INCOMING = "海面下有东西。不小。",		--深海 轮廓？ 没调用

	ANNOUNCE_LIGHTFIRE =
	{
		"点起来了。",		--角色主动点火时的提示
    },

    ANNOUNCE_HUNGRY_SLOWBUILD =
    {
	    "饿得脑子慢了。",		--饥饿导致建造速度降低
    },
    ANNOUNCE_HUNGRY_FASTBUILD =
    {
	    "吃饱了，手就快。",		--进食后恢复快速建造
    },

    ANNOUNCE_KILLEDPLANT =
    {
        "抱歉了，小家伙。",		--沃姆伍德导致植物死亡
    },
    ANNOUNCE_GROWPLANT =
    {
        "长吧。",		--沃姆伍德使植物生长
    },
    ANNOUNCE_BLOOMING =
    {
        "开花了。",		--沃姆伍德进入开花状态
    },

    ANNOUNCE_SOUL_EMPTY =
    {
        "灵魂见底。麻烦要来了。",		--沃拓克斯没有灵魂
    },
    ANNOUNCE_SOUL_EMPTY_NICE =
    {
        "该进食了。",		--善良倾向下没有灵魂
    },
    ANNOUNCE_SOUL_EMPTY_NAUGHTY =
    {
        "饿。撑不住了。",		--淘气倾向下没有灵魂
    },
    ANNOUNCE_SOUL_FEW =
    {
        "灵魂所剩不多。",		--沃拓克斯持有的灵魂很少
    },
    ANNOUNCE_SOUL_FEW_NICE =
    {
        "不太妙。灵魂不太够用。",		--善良倾向下灵魂数量较少
    },
    ANNOUNCE_SOUL_FEW_NAUGHTY =
    {
        "我的藏品见底了。",		--淘气倾向下灵魂数量较少
    },
    ANNOUNCE_SOUL_MANY =
    {
        "够用了。能撑下去。",		--沃拓克斯持有很多灵魂
    },
    ANNOUNCE_SOUL_MANY_NICE =
    {
        "我竟集了这么多。",		--善良倾向下持有很多灵魂
    },
    ANNOUNCE_SOUL_MANY_NAUGHTY =
    {
        "够？从来没有够。",		--淘气倾向下持有很多灵魂
    },
    ANNOUNCE_SOUL_OVERLOAD =
    {
        "太多了。我压不住。",		--沃拓克斯灵魂过载
    },
    ANNOUNCE_SOUL_OVERLOAD_NICE =
    {
        "是我贪多了。",		--善良倾向下灵魂过载
    },
    ANNOUNCE_SOUL_OVERLOAD_NAUGHTY =
    {
        "我的灵魂，别散。",		--淘气倾向下灵魂过载
    },
    ANNOUNCE_SOUL_OVERLOAD_WARNING =
    {
        "要满了。快到极限。",		--灵魂即将过载的警告
    },
    ANNOUNCE_SOUL_OVERLOAD_AVOIDED =
    {
        "收手及时。",		--成功避免灵魂过载
    },
    ANNOUNCE_PANFLUTE_BUFF_ACTIVE =
    {
        "忽然想吹一曲，喵。",		--排箫增益已经生效
    },
    ANNOUNCE_PANFLUTE_BUFF_USED =
    {
        "一曲既毕，喵。尚可。",		--触发排箫增益
    },

	ANNOUNCE_AMMO_SLOT_OVERSTACKED = "弹药装太满，换不动。",		--弹药槽装入的弹药超过容量
	ANNOUNCE_SLINGHSOT_OUT_OF_AMMO =
	{
		"弹药用尽了……",		--弹弓弹药耗尽
		"……只是玩笑。",		--弹弓弹药耗尽
	},
	ANNOUNCE_SLINGHSOT_NO_AMMO_SKILL = "这种弹药，我打不顺。",		--未学习对应弹弓弹药技能
	ANNOUNCE_SLINGHSOT_NO_PARTS_SKILL = "这个零件，是做什么的？",		--未学习对应弹弓零件技能
	ANNOUNCE_STORYTELLING_ABORT_FIREWENTOUT =
	{
        "火偏偏在这时熄了。",		--营火熄灭导致讲故事中止
	},
	ANNOUNCE_STORYTELLING_ABORT_NOT_NIGHT =
	{
        "下回再讲……",		--天亮导致讲故事中止
	},
	ANNOUNCE_WOBY_RETURN =
	{
		"沃比，回来。",		--命令沃比返回
	},
	ANNOUNCE_WOBY_SIT =
	{
		"沃比，待着。",		--命令沃比原地等待
	},
	ANNOUNCE_WOBY_FOLLOW =
	{
		"沃比，过来。",		--命令沃比跟随
	},
	ANNOUNCE_WOBY_PRAISE =
	{
		"好孩子，喵。",		--表扬沃比
	},
	ANNOUNCE_WOBY_FORAGE =
	{
		"去把它找出来，沃比。",		--命令沃比采集
	},
	ANNOUNCE_WOBY_WORK =
	{
		"沃比，来搭把手。",		--命令沃比工作
	},
	ANNOUNCE_WOBY_COURIER =
	{
		"去吧，沃比。快去。",		--命令沃比执行快递任务
	},
	ANNOUNCE_WOBY_REMEMBERCHEST_FAIL =
	{
		"换一处地方吧，沃比。",		--沃比记录容器位置失败
	},

    ANNOUNCE_WX_SCANNER_NEW_FOUND = "新样本。值得记录。",		--WX-78的扫描仪发现新的生物数据
    ANNOUNCE_WX_SCANNER_FOUND_NO_DATA = "这一带没有新东西。无趣。",		--生物扫描仪没有发现新数据

    QUAGMIRE_ANNOUNCE_NOTRECIPE = "这些配料不成菜。换一份。",		--暴食模式中提交的食物不符合食谱
    QUAGMIRE_ANNOUNCE_MEALBURNT = "火候过了。可惜。",		--暴食模式料理烧焦
    QUAGMIRE_ANNOUNCE_LOSE = "预感不妙。……果然。",		--暴食模式挑战失败
    QUAGMIRE_ANNOUNCE_WIN = "该收场了。",		--暴食模式挑战成功

    ANNOUNCE_ROYALTY =
    {
        "陛下。",		--向带着蜂王帽的队友鞠躬
        "殿下。",		--向带着蜂王帽的队友鞠躬
        "我的君主。",		--向带着蜂王帽的队友鞠躬
    },
    ANNOUNCE_ROYALTY_JOKER =
    {
        "“陛下”。",		--对鱼人王使用玩笑互动
        "“殿下”。",		--对鱼人王使用玩笑互动
        "“大王”。",		--对鱼人王使用玩笑互动
    },

    ANNOUNCE_ATTACH_BUFF_ELECTRICATTACK    = "正电在我这边。",		--事件说明：获得带电攻击增益
    ANNOUNCE_ATTACH_BUFF_ATTACK            = "手上有劲了。动手。",		--事件说明：食用辣椒粉料理后获得攻击力增益
    ANNOUNCE_ATTACH_BUFF_PLAYERABSORPTION  = "皮厚了些。挨几下也无妨。",		--事件说明：食用大蒜粉料理后获得伤害减免增益
    ANNOUNCE_ATTACH_BUFF_WORKEFFECTIVENESS = "手脚利落了不少。",		--事件说明：食用蜂蜜粉料理后获得工作效率增益
    ANNOUNCE_ATTACH_BUFF_MOISTUREIMMUNITY  = "干爽得像旧书页。正合我意。",		--事件说明：食用蓝带鱼排后获得潮湿免疫效果
    ANNOUNCE_ATTACH_BUFF_SLEEPRESISTANCE   = "精神清明。倦意退了。",		--事件说明：食用月亮蘑菇料理后获得睡眠抗性效果

    ANNOUNCE_DETACH_BUFF_ELECTRICATTACK    = "电退了。毛还竖着。",		--事件说明：带电攻击增益结束
    ANNOUNCE_DETACH_BUFF_ATTACK            = "力气散了。有些可惜。",		--事件说明：辣椒粉料理提供的攻击力增益结束
    ANNOUNCE_DETACH_BUFF_PLAYERABSORPTION  = "护身的感觉淡了。刚才尚可。",		--事件说明：大蒜粉料理提供的伤害减免增益结束
    ANNOUNCE_DETACH_BUFF_WORKEFFECTIVENESS = "惰性又回来了。",		--事件说明：蜂蜜粉料理提供的工作效率增益结束
    ANNOUNCE_DETACH_BUFF_MOISTUREIMMUNITY  = "干燥期结束。我不喜欢。",		--事件说明：蓝带鱼排提供的潮湿免疫效果结束
    ANNOUNCE_DETACH_BUFF_SLEEPRESISTANCE   = "我……（哈欠）倦意……回来了……",		--事件说明：月亮蘑菇料理提供的睡眠抗性效果结束

	ANNOUNCE_OCEANFISHING_LINESNAP = "线断了。辛苦也断了。",		--海钓 线崩断了
	ANNOUNCE_OCEANFISHING_LINETOOLOOSE = "收线试试。总比空等好。",		--海钓失败 渔具丢失
	ANNOUNCE_OCEANFISHING_GOTAWAY = "它走了。记下这一笔。",		--海钓 鱼跑远了
	ANNOUNCE_OCEANFISHING_BADCAST = "这一竿，落得不太体面。",		--海钓 抛竿扔地面上去了
	ANNOUNCE_OCEANFISHING_IDLE_QUOTE =
	{
		"鱼呢。",		--海钓 没上钩的时候闲聊
		"该换个鱼多的地方。喵。",		--海钓 没上钩的时候闲聊
		"海里竟也这样空。",		--海钓 没上钩的时候闲聊
		"我本可以去做更正经的事……",		--海钓 没上钩的时候闲聊
	},

	ANNOUNCE_WEIGHT = "重量：{weight}",		--称重 
	ANNOUNCE_WEIGHT_HEAVY  = "重量：{weight}\n这条鱼，分量不轻。",		--称重 大鱼

	ANNOUNCE_WINCH_CLAW_MISS = "偏了一点。",		--绞绞吸盘 没命中
	ANNOUNCE_WINCH_CLAW_NO_ITEM = "空的。白忙一场。",		--绞绞吸盘 没东西

    ANNOUNCE_KINGCREATED = "鱼人立了新王。",		--沃特拥立新的鱼人王
    ANNOUNCE_KINGDESTROYED = "旧王不堪。我会挑个更好的。",		--鱼人王被消灭或王位失效
    ANNOUNCE_CANTBUILDHERE_THRONE = "这里不配做王座。",		--当前位置不能建造鱼人王宝座
    ANNOUNCE_CANTBUILDHERE_HOUSE = "房子要漂亮，沼泽也得体面。",		--当前位置不能建造鱼人房屋
    ANNOUNCE_CANTBUILDHERE_WATCHTOWER = "不行。卫士只守沼泽。",		--当前位置不能建造鱼人瞭望塔
    ANNOUNCE_READ_BOOK =
    {
        BOOK_SLEEP = "久远……很久……以……前……噢……",		--阅读催眠类书籍
        BOOK_BIRDS = "书里有鸟。画得不错，喵。",		--阅读召唤鸟类的书籍
        BOOK_TENTACLES =  "这本写得不错。",		--阅读召唤触手的书籍
        BOOK_BRIMSTONE = "我想知道结局。就现在。",		--阅读召唤闪电的书籍
        BOOK_GARDENING = "生僻字不少……",		--阅读园艺类书籍
		BOOK_SILVICULTURE = "讲树的？我懂不少树的事。",		--阅读林业类书籍
		BOOK_HORTICULTURE = "这字……一个比一个冷僻……",		--阅读应用园艺学

        BOOK_FISH = "最好的书。里面有鱼，喵。",		--阅读召唤鱼群的书籍
        BOOK_FIRE = "火……这一页我不想翻。",		--阅读火焰相关书籍
        BOOK_WEB = "韦伯，我在读蜘蛛的秘密。",		--阅读蛛网相关书籍
        BOOK_TEMPERATURE = "衡量……热——能的单位……",		--阅读温度相关书籍
        BOOK_LIGHT = "这些词，和我想的不同。",		--阅读光照相关书籍
        BOOK_RAIN = "能命令雨？值得一试。",		--阅读降雨相关书籍
        BOOK_MOON = "月亮。其实乏味得很。",		--阅读月亮相关书籍
        BOOK_BEES = "里面没有蜂蜜……可惜。",		--阅读蜜蜂相关书籍

        BOOK_HORTICULTURE_UPGRADED = "不——换本浅些的书吧……",		--阅读升级版园艺学书籍
        BOOK_RESEARCH_STATION = "难读。但拿着它显得聪明。",		--阅读研究站相关书籍
        BOOK_LIGHT_UPGRADED = "要认的字不止一种？……",		--阅读升级版光照书籍
    },

    ANNOUNCE_WEAK_RAT = "这只胡萝卜鼠不在状态。",		--试图训练快饿死的胡萝卜鼠

    ANNOUNCE_CARRAT_START_RACE = "实验开始。跑。",		--胡萝卜鼠开始比赛

    ANNOUNCE_CARRAT_ERROR_WRONG_WAY = {
        "方向错了。回头。",		--胡萝卜鼠比赛 跑错方向
        "掉头。你的眼睛在做什么。",		--胡萝卜鼠比赛 跑错方向
    },
    ANNOUNCE_CARRAT_ERROR_FELL_ASLEEP = "不许睡。起来，我们要赢。",		--起床了，蠢胡萝卜鼠！
    ANNOUNCE_CARRAT_ERROR_WALKING = "别走。跑。",		--胡萝卜鼠比赛 走的慢
    ANNOUNCE_CARRAT_ERROR_STUNNED = "起来。冲。",		--胡萝卜鼠比赛 惊呆了

    ANNOUNCE_GHOST_QUEST = "你丢了东西？我可以找。",		--事件说明：小惊吓开始寻找遗失玩具的任务
    ANNOUNCE_GHOST_HINT = "你在引路。我看到了。",		--事件说明：小惊吓提示遗失玩具所在方向
    ANNOUNCE_GHOST_TOY_NEAR = {
        "就在附近……我感觉到了……",		--事件说明：接近小惊吓遗失的玩具（台词变体1）
    },
	ANNOUNCE_SISTURN_FULL = "阿比盖尔能更快回到我身边。",		--姐妹骨灰罐 装满
    ANNOUNCE_SISTURN_FULL_EVIL = "这让我毛都竖了。但愿值得。",		--邪恶倾向下姐妹骨灰罐充满
    ANNOUNCE_SISTURN_FULL_BLOSSOM = "阿比盖尔，这也许是我们最近的一刻。",		--姐妹骨灰罐盛开并达到完整状态
    ANNOUNCE_ABIGAIL_DEATH = "不……别再丢下我。",		--事件说明：阿比盖尔死亡并返回花朵
    ANNOUNCE_ABIGAIL_RETRIEVE = "抱歉……外面不安全。",		--事件说明：主动收回阿比盖尔，使其返回花朵
	ANNOUNCE_ABIGAIL_LOW_HEALTH = "阿比盖尔，小心。",		--事件说明：阿比盖尔的生命值过低
    ANNOUNCE_ABIGAIL_SUMMON =
	{
		LEVEL1 = "我知道你累了。但我需要你……",		--事件说明：召唤阿比盖尔，当前幽灵羁绊为第一等级
		LEVEL2 = "阿比盖尔，我需要你……",		--事件说明：召唤阿比盖尔，当前幽灵羁绊为第二等级
		LEVEL3 = "你休息得够久了，姐妹。",		--事件说明：召唤阿比盖尔，当前幽灵羁绊为第三等级
	},

    ANNOUNCE_GHOSTLYBOND_LEVELUP =
	{
		LEVEL2 = "阿比盖尔，你的气色亮了。",		--事件说明：阿比盖尔的幽灵羁绊提升到第二等级
		LEVEL3 = "黑暗里，阿比盖尔一直是那盏灯……",		--事件说明：阿比盖尔的幽灵羁绊提升到第三等级
	},

    ANNOUNCE_NOINSPIRATION = "让战场替我开嗓。",		--薇格弗德没有足够激励值
    ANNOUNCE_NOTSKILLEDENOUGH = "这首曲子……我恐怕还唱不了。",		--尚未学习所需技能
    ANNOUNCE_BATTLESONG_INSTANT_TAUNT_BUFF = "“卑鄙之徒。我会让你尝尽败意。”",		--战歌立即触发嘲讽效果
    ANNOUNCE_BATTLESONG_INSTANT_PANIC_BUFF = "“指尖发麻，必有不祥。”",		--战歌立即触发恐慌效果
    ANNOUNCE_BATTLESONG_INSTANT_REVIVE_BUFF = "“死亡终会到来，”但不是今天，我的盟友。",		--战歌立即触发复活效果

    ANNOUNCE_WANDA_YOUNGTONORMAL = "无妨。我还有时间……",		--旺达从年轻状态变为中年状态
    ANNOUNCE_WANDA_NORMALTOOLD = "时间不多了。",		--旺达从中年状态变为年老状态
    ANNOUNCE_WANDA_OLDTONORMAL = "死神抓不到我。",		--旺达从年老状态恢复中年状态
    ANNOUNCE_WANDA_NORMALTOYOUNG = "青春又回来了。不错。",		--旺达从中年状态恢复年轻状态

	ANNOUNCE_POCKETWATCH_PORTAL = "没人说过，穿越之后会这样酸疼……",		--旺达使用裂缝表传送门

	ANNOUNCE_POCKETWATCH_MARK = "此处作锚点，很好。",		--使用溯源表记录当前位置
	ANNOUNCE_POCKETWATCH_RECALL = "这颗心，还没为时间旅行跳够。",		--使用溯源表返回记录位置
	ANNOUNCE_POCKETWATCH_OPEN_PORTAL = "好了。诸位，快些。",		--使用裂缝表开启传送门
	ANNOUNCE_POCKETWATCH_OPEN_PORTAL_DIFFERENTSHARD = "留神。这一跳不小。",		--裂缝表开启跨世界传送门

    ANNOUNCE_ARCHIVE_NEW_KNOWLEDGE = "远古的知识，把思路拓宽了。",		--地下月岛遗迹 解锁新知识
    ANNOUNCE_ARCHIVE_OLD_KNOWLEDGE = "这条我早知道。",		--地下月岛遗迹 解锁旧知识
    ANNOUNCE_ARCHIVE_NO_POWER = "得给它供电。",		--地下月岛遗迹 没能量

    ANNOUNCE_PLANT_RESEARCHED =
    {
        "对这株植物，我懂得更多了。",		--研究植物
    },

    ANNOUNCE_PLANT_RANDOMSEED = "会长出什么，尚不可知。",		--种下随机种子

    ANNOUNCE_FERTILIZER_RESEARCHED = "没想过我的学问会用在这东西上。",		--研究肥料

	ANNOUNCE_FIRENETTLE_TOXIN =
	{
		"里面像有火在烧。",		--事件说明：触碰烈火荨麻后灼烧毒素发作（台词变体1）
		"太烫了！",		--事件说明：触碰烈火荨麻后灼烧毒素发作（台词变体2）
	},
	ANNOUNCE_FIRENETTLE_TOXIN_DONE = "记下：火荨麻的试验，到此为止。",		--事件说明：烈火荨麻造成的灼烧毒素效果结束

	ANNOUNCE_TALK_TO_PLANTS =
	{
        "长吧。再长高些。",		--和植物聊天
        "我一直想要一株你这样的。",		--和植物聊天
		"你好。我来给你今日的言语。",		--和植物聊天
        "你是株好植物。喵。",		--和植物聊天
        "你听得很好。比多数人好。",		--和植物聊天
	},

	ANNOUNCE_KITCOON_HIDEANDSEEK_START = "三、二、一……藏好没有，我都要找了。",		--开始小浣猫捉迷藏游戏
	ANNOUNCE_KITCOON_HIDEANDSEEK_JOIN = "它们在玩捉迷藏。",		--加入正在进行的小浣猫捉迷藏游戏
	ANNOUNCE_KITCOON_HIDANDSEEK_FOUND =
	{
		"找到你了。",		--捉迷藏时找到小浣猫
		"在这里。",		--捉迷藏时找到小浣猫
		"早知道你躲那儿。",		--捉迷藏时找到小浣猫
		"看见你了，喵。",		--捉迷藏时找到小浣猫
	},
	ANNOUNCE_KITCOON_HIDANDSEEK_FOUND_ONE_MORE = "还剩最后一个。躲哪了？",		--捉迷藏时又找到一只小浣猫
	ANNOUNCE_KITCOON_HIDANDSEEK_FOUND_LAST_ONE = "最后一个，也找到了。",		--捉迷藏时找到最后一只小浣猫
	ANNOUNCE_KITCOON_HIDANDSEEK_FOUND_LAST_ONE_TEAM = "{name}找到了最后一个。",		--队伍找到捉迷藏中的最后一只小浣猫
	ANNOUNCE_KITCOON_HIDANDSEEK_TIME_ALMOST_UP = "那些小家伙，快没耐心了……",		--小浣猫捉迷藏剩余时间不多
	ANNOUNCE_KITCOON_HIDANDSEEK_LOSEGAME = "看来它们不想玩了。",		--小浣猫捉迷藏游戏失败
	ANNOUNCE_KITCOON_HIDANDSEEK_TOOFAR = "它们不会躲这么远。应当不会。",		--捉迷藏时离游戏区域太远
	ANNOUNCE_KITCOON_HIDANDSEEK_TOOFAR_RETURN = "小浣猫该在附近。",		--离开捉迷藏区域后返回游戏范围
	ANNOUNCE_KITCOON_FOUND_IN_THE_WILD = "那边有东西躲着。我看得没错。",		--在野外发现小浣猫

	ANNOUNCE_TICOON_START_TRACKING	= "气味接上了。",		--大虎开始追踪小浣猫
	ANNOUNCE_TICOON_NOTHING_TO_TRACK = "他什么都没找到。",		--大虎附近没有可以追踪的小浣猫
	ANNOUNCE_TICOON_WAITING_FOR_LEADER = "我该跟上他。",		--大虎停下并等待主人
	ANNOUNCE_TICOON_GET_LEADER_ATTENTION = "他在催我跟上。",		--大虎提醒主人跟上追踪
	ANNOUNCE_TICOON_NEAR_KITCOON = "他一定闻到了什么。",		--大虎追踪到小浣猫附近
	ANNOUNCE_TICOON_LOST_KITCOON = "有人先一步找到了。",		--大虎失去小浣猫的踪迹
	ANNOUNCE_TICOON_ABANDONED = "我自己去找那些小家伙。",		--主人离开太远，大虎放弃追踪
	ANNOUNCE_TICOON_DEAD = "可怜。他本想带我去哪儿呢？",		--负责追踪的大虎死亡

    ANNOUNCE_CALL_BEEF = "过来。",		--把牛拴好
    ANNOUNCE_CANTBUILDHERE_YOTB_POST = "放这里，裁判看不见我的牛。",		--建造牛舞台 离裁判太远
    ANNOUNCE_YOTB_LEARN_NEW_PATTERN =  "牛形的灵感，装了一脑子。",		--牛年活动 学到了新组件

    ANNOUNCE_EYEOFTERROR_ARRIVE = "那是什么——浮着的巨眼？",		--恐怖之眼抵达并开始袭击
    ANNOUNCE_EYEOFTERROR_FLYBACK = "总算回来了。",		--恐怖之眼重新飞回战斗区域
    ANNOUNCE_EYEOFTERROR_FLYAWAY = "回来。我们还没完。",		--恐怖之眼暂时飞离战斗区域

    ANNOUNCE_CANT_ESCAPE_CURSE = "自然不会这么便宜。",		--诅咒生效，角色不能通过传送离开
    ANNOUNCE_MONKEY_CURSE_1 = "开始像只猴子了……",		--获得第一阶段猴子诅咒
    ANNOUNCE_MONKEY_CURSE_CHANGE = "我的头发……！不许碰我的毛。",		--猴子诅咒累积并使角色变身
    ANNOUNCE_MONKEY_CURSE_CHANGEBACK = "总算脱了这副猴相。",		--猴子诅咒减弱，角色恢复原状

    ANNOUNCE_PIRATES_ARRIVE = "这号子只说明一件事……",		--月亮码头海盗即将登船袭击

    ANNOUNCE_BOOK_MOON_DAYTIME = "效果要到夜里才见。",		--白天无法正常使用月亮类书籍

    ANNOUNCE_OFF_SCRIPT = "这句不在剧本里。",		--角色没有按当前表演或训练流程行动

    ANNOUNCE_COZY_SLEEP = "睡得很好。精神清明，喵。",		--获得舒适睡眠效果

	ANNOUNCE_TOOL_TOOWEAK = "这工具不够硬。",		--工具强度不足，不能处理目标

    ANNOUNCE_LUNAR_RIFT_MAX = "那道光——是月光吗？",		--月亮裂隙强度达到最高阶段
    ANNOUNCE_SHADOW_RIFT_MAX = "有些阴险的东西要来了。",		--暗影裂隙强度达到最高阶段

    ANNOUNCE_SCRAPBOOK_FULL = "这些我都有了。",		--图鉴记录已经全部收集完成

    ANNOUNCE_CHAIR_ON_FIRE = "无妨。",		--正在使用的椅子着火

    ANNOUNCE_HEALINGSALVE_ACIDBUFF_DONE = "该再抹一层驱酸膏了。",		--药膏提供的酸雨防护效果结束

    ANNOUNCE_COACH = 
    {
        "别慌。我在你们身边。",		--沃尔夫冈进行健身指导
        "记住我教你的。",		--沃尔夫冈进行健身指导
        "害怕的时候，就想我。",		--沃尔夫冈进行健身指导
        "勇敢些。像这样。",		--沃尔夫冈进行健身指导
        "你很强。比你以为的强。",		--沃尔夫冈进行健身指导
        "相信自己。像我信你一样。",		--沃尔夫冈进行健身指导
        "做得好。肌肉发热，就对了。",		--沃尔夫冈进行健身指导
        "别停。",		--沃尔夫冈进行健身指导
        "对。你能行。",		--沃尔夫冈进行健身指导
    },
    ANNOUNCE_WOLFGANG_WIMPY_COACHING = "没人会这样听劝。得练。",		--沃尔夫冈以虚弱形态指导队友训练
    ANNOUNCE_WOLFGANG_MIGHTY_COACHING = "我的样子太招眼。不必让人难堪。",		--沃尔夫冈以强壮形态指导队友训练
    ANNOUNCE_WOLFGANG_BEGIN_COACHING = "来吧。看我的动作。",		--沃尔夫冈开始指导队友训练
    ANNOUNCE_WOLFGANG_END_COACHING = "到此为止。让肌肉歇一歇。",		--沃尔夫冈结束指导队友训练
    ANNOUNCE_WOLFGANG_NOTEAM = 
    {
        "我的人呢？",		--沃尔夫冈没有可指导的队友
        "我需要有人跟着练。",		--沃尔夫冈没有可指导的队友
        "开始吧……有人吗？",		--沃尔夫冈没有可指导的队友
    },

    ANNOUNCE_YOTD_NOBOATS = "船得挪近起点塔。",		--龙舟竞速不能开始：没有参赛船只
    ANNOUNCE_YOTD_NOCHECKPOINTS = "先立几个检查点。",		--龙舟竞速不能开始：没有设置检查点
    ANNOUNCE_YOTD_NOTENOUGHBOATS = "位置不够，容不下其余选手。",		--龙舟竞速不能开始：参赛船只不足

    ANNOUNCE_OTTERBOAT_OUTOFSHALLOWS = "不该离浅滩这么远。",		--水獭船驶离允许活动的浅水区域
    ANNOUNCE_OTTERBOAT_DENBROKEN = "拆了那窝，怕是引来连锁反应……",		--水獭船关联的水獭巢穴已经损坏

    ANNOUNCE_GATHER_MERM = "大概是鱼人的规矩。",		--沃特召集附近鱼人跟随

    ANNOUNCE_EXIT_GELBLOB = "被那些……东西淹了。",		--从黏液团内部脱离
	ANNOUNCE_SHADOWTHRALL_STEALTH = "被咬了。它去哪了？",		--暗影随从进入潜行状态
    ANNOUNCE_RABBITKING_AGGRESSIVE = "有东西正从土里掘出来。",		--发现好斗兔王
    ANNOUNCE_RABBITKING_PASSIVE = "地下有东西在轻轻蠕动。",		--发现温和兔王
    ANNOUNCE_RABBITKING_LUCKY = "这兔子长得奇怪。",		--发现幸运兔王
    ANNOUNCE_RABBITKING_LUCKYCAUGHT = "抓到了。",		--成功抓住幸运兔王
    ANNOUNCE_RABBITKINGHORN_BADSPAWNPOINT = "兔子们大概不喜欢这里。",		--兔王号角召唤位置无效

	ANNOUNCE_NOPUMPKINCARVINGONFIRE = "南瓜已经烤熟了。",		--南瓜正在燃烧，不能雕刻

	ANNOUNCE_SNOWBALL_TOO_BIG = "不能再大了。",		--雪球已经达到最大尺寸
	ANNOUNCE_SNOWBALL_NO_SNOW = "雪不够。",		--地面没有足够积雪制作雪球

    ANNOUNCE_WENDY_BABYSITTER_SET = "阿比，我会回来。", 		--温蒂设置阿比盖尔的照看目标
    ANNOUNCE_WENDY_BABYSITTER_STOP = "阿比，走了。",		--温蒂停止阿比盖尔的照看任务

	ANNOUNCE_WORTOX_REVIVER_FAILTELEPORT = "嗯。哪里出了差错。",		--沃拓克斯尝试传送救援失败

    ANNOUNCE_NO_ABIGAIL_FLOWER = "没有阿比盖尔之花，走不下去。",		--温蒂没有阿比盖尔之花

    ANNOUNCE_ELIXIR_BOOSTED = "阴间的手笔。倒也管用。",		--阿比盖尔获得强化药剂效果
    ANNOUNCE_ELIXIR_GHOSTVISION = "一阵惧意上来。",		--获得幽灵视野药剂效果
    ANNOUNCE_ELIXIR_PLAYER_SPEED = "这速度，抱着马也不慢。",		--获得角色移速药剂效果

    ANNOUNCE_ELIXIR_TOO_SUPER = "这味道，过了。",		--药剂强度过高，不能继续使用


    ANNOUNCE_LUNARGUARDIAN_INCOMING = "它回来了。",		--月亮守卫即将出现
    ANNOUNCE_FLOATER_HELD = "本在溺水，忽然想到……就浮起来了。",		--抓住水面漂浮物
    ANNOUNCE_FLOATER_LETGO = "我讨厌被吊着——",		--松开水面漂浮物

    ANNOUNCE_LUNARHAIL_BIRD_SOUNDS = "鸦群死去，是这个声音。",		--月雹期间听到鸟类异常声响
    ANNOUNCE_LUNARHAIL_BIRD_CORPSES = "像鸟一样落下来。",		--月雹后发现鸟类尸体
    ANNOUNCE_FLOAT_SWIM_TIRED = "力尽了。",		--游泳时体力耗尽
    ANOUNCE_MUTATED_BIRD_ATTACK = "有鸟。",		--变异鸟发动攻击

    ANNOUNCE_WEAPON_TOOWEAK = "这武器太轻。换一件。",		--武器强度不足，不能伤害目标
    ANNOUNCE_VAULT_TELEPORTER_DOES_NOTHING = "另一头是不是坏了？",		--宝库传送装置当前没有效果

	ANNOUNCE_LIGHTSOUT_SHADOWHAND = "等等。那东西在下面做什么？",		--黑暗中出现暗影之手

    ANNOUNCE_MUTATED_BUZZARD_ARRIVAL = "退开。我们还没死。等等——它们变了。", 		--变异秃鹫抵达并在角色附近盘旋

    ANNOUNCE_HERMITCRAB_SHELL_BADTELEPORTPOINT = "我怎么还在这儿。",		--寄居蟹贝壳传送目标位置无效
    ANNOUNCE_HERMITCRAB_SHELL_ARRIVE = "有些晕。像晕船。",		--通过寄居蟹贝壳传送抵达

    ANNOUNCE_YOTH_ONCOOLDOWN = "他们多半在胡闹。",		--马年活动能力仍在冷却
	ANNOUNCE_MAX_CLOCKWORKS = "只带一对。也算合理。",		--可控制的发条生物数量达到上限

    ANNOUNCE_WX_SCANNER_HITDOWN_BY_CAT = "爪子比你的机器快。",		--WX-78的扫描仪被猫拍落
    ANNOUNCE_WX_TASER_BUILDUP = "你的每一下，都在给我充电。", 		--WX-78受击后电荷持续积累，即将释放电磁脉冲
    ANNOUNCE_WX_TASER_ABOUTTOEXPLODE = "满了。", 		--WX-78电荷已满，即将释放电磁脉冲
    ANNOUNCE_WX_TASER_POSTEXPLOSION = "痛快。", 		--WX-78释放电磁脉冲并清空积累电荷
    ANNOUNCE_WX_NIGHTMARECHARGE = "异常物质。电力超控已启用。", 		--WX-78使用噩梦燃料后暂时充满电荷
	ANNOUNCE_WX_NIGHTMAREDISCHARGE = "超控解除。电力已复原。", 		--WX-78的噩梦燃料临时满电效果结束


    ANNOUNCE_MITEGLAND_DEBUFF =
	{
		"五脏六腑都在烧。",		--螨腺灼烧减益生效
		"胃里烧得厉害……",		--螨腺灼烧减益生效
	},
	ANNOUNCE_MITEGLAND_DEBUFF_DONE = "那个实验，不必再来一次。",		--螨腺灼烧减益结束
    ANNOUNCE_GOT_DECON_MISTED = "哈。洒得满身都是。",		--被解构迷雾命中
	ANNOUNCE_VAULT_SHADOW_ASSIST = "毫无疑问，它们在帮忙。",		--宝库中的暗影力量开始提供协助
    ANNOUNCE_HEALINGSALVE_FUMAROLEBUFF_DONE = "该补一层避火膏了。",		--热能药膏提供的火焰免疫效果结束
    ANNOUNCE_SECURITY_PULSE_FOLLOWING = "它跟着我。", 		--携带路标罗盘后安保电火花附着并跟随角色


	ANNOUNCE_GRUE_NOCHARLIE = "这气息……很陌生。有人在？",		--事件说明：ANNOUNCE_GRUE_NOCHARLIE
	ANNOUNCE_GRUE_NOCHARLIE_ATTACK = "嘶。有东西咬我。",		--事件说明：ANNOUNCE_GRUE_NOCHARLIE_ATTACK
	ANNOUNCE_GRUE_NOCHARLIE_MISSED = "这一招，我没见过。", 		--事件说明：ANNOUNCE_GRUE_NOCHARLIE_MISSED

	ANNOUNCE_STOMP_SHROUDEN = "这一脚，判你出局。",		--事件说明：ANNOUNCE_STOMP_SHROUDEN

    ANNOUNCE_DREADSTONE_SPIKE_EXPLODING = "要炸了。我的脑子也是。", 		--事件说明：ANNOUNCE_DREADSTONE_SPIKE_EXPLODING

	BATTLECRY =
	{
		GENERIC = "够了。到此为止。",		--战斗
		PIG = "过来，猪。",		--战斗 猪人
		PREY = "你跑不掉的。",		--战斗 猎物？？大象？
		SPIDER = "又是这种东西。",		--战斗 蜘蛛
		SPIDER_WARRIOR = "你死，好过我死。",		--战斗 蜘蛛战士
		DEER = "鹿。到此为止。",		--战斗 无眼鹿
	},
	COMBAT_QUIT =
	{
		GENERIC = "他该记住这一课了。",		--攻击目标被卡住，无法攻击
		PIG = "这次，放过他。",		--退出战斗-猪人
		PREY = "他跑得快。暂且记账。",		--退出战斗 猎物？？大象？
		SPIDER = "不管怎么说，真够恶心。",		-- 退出战斗 蜘蛛
		SPIDER_WARRIOR = "嘘……讨人厌的东西。",		--退出战斗 蜘蛛战士
	},

	DESCRIBE =
	{

		MULTIPLAYER_PORTAL = "门里映着星图。可惜坐标没一个是对的。",		--物品名：绚丽之门
        MULTIPLAYER_PORTAL_MOONROCK = "月岩与门框咬合得很准。设计者懂行。",		--物品名：天体传送门
        MOONROCKIDOL = "石头刻得虔敬。我只对规律低头。",		--物品名：月岩雕像
        CONSTRUCTION_PLANS = "图纸。画得比多数人做事认真。",		--物品名：建造计划

        ANTLION =
        {
            GENERIC = "它在打量我的行囊。胃口不小。",		--物品名：蚁狮 检查状态：普通状态
            VERYHAPPY = "它满意了。暂时不必再喂。",		--物品名：蚁狮 检查状态：蚁狮贡品满意度很高
            UNHAPPY = "沙在震。它在讨贡品。",		--物品名：蚁狮 检查状态：蚁狮贡品满意度较低
        },
        ANTLIONTRINKET = "沙滩玩具。总有人肯收。",		--物品名：沙滩玩具
        SANDSPIKE = "差一点就被刺穿。下次站远些。",		--物品名：沙刺
        SANDBLOCK = "沙砌的城堡。固执得令人佩服。",		--物品名：沙堡
        GLASSSPIKE = "玻璃凝成的尖刺。碰一下就要见血。",		--物品名：玻璃尖刺
        GLASSBLOCK = "透明的城堡。结构倒是讲究。",		--物品名：玻璃城堡
        ABIGAIL_FLOWER =
        {
            GENERIC ="花开得过于艳了。像是有所图。",		--物品名：阿比盖尔之花 检查状态：普通状态
			LEVEL1 = "花苞合着。她似乎不想说话。",		--物品名：阿比盖尔之花 检查状态：第一阶段
			LEVEL2 = "花瓣在颤。她正要开口。",		--物品名：阿比盖尔之花 检查状态：第二阶段
			LEVEL3 = "光从花心溢出来了。她醒了。",		--物品名：阿比盖尔之花 检查状态：第三阶段

            LONG = "看久了，灵魂会发凉。",		--物品名：阿比盖尔之花 检查状态：距离孵化或变化仍有较长时间
            MEDIUM = "毛都竖起来了。这花不对劲。",		--物品名：阿比盖尔之花 检查状态：中等阶段
            SOON = "快了。花里有什么要出来。",		--物品名：阿比盖尔之花 检查状态：即将进入下一阶段
            HAUNTED_POCKET = "该松手了。它在口袋里发热。",		--物品名：阿比盖尔之花 检查状态：花朵在物品栏中且已被作祟激活
            HAUNTED_GROUND = "它在地上作祟。我会记下它的把戏。",		--物品名：阿比盖尔之花 检查状态：花朵位于地面且已被作祟激活
        },

        BALLOONS_EMPTY = "一堆瘪气球。像小丑的零钱，喵。",		--物品名：一堆气球
        BALLOON = "轻得不像话。原理我稍后再算。",		--物品名：气球
		BALLOONPARTY = "把小气球塞进去的手艺不错。",		--物品名：派对气球
		BALLOONSPEED =
        {
            DEFLATED = "泄了气。所有气球最后都一样。",		--物品名：迅捷气球 检查状态：已经泄气
            GENERIC = "中空的孔让它更顺从气流。经典。",		--物品名：迅捷气球 检查状态：普通状态
        },
		BALLOONVEST = "颜色已经够招摇，还偏会吱吱响。",		--物品名：充气背心
		BALLOONHAT = "静电。我的头发全竖起来了。",		--物品名：气球帽

        BERNIE_INACTIVE =
        {
            BROKEN = "它到底还是散了架。",		--物品名：伯尼 检查状态：已经损坏
            GENERIC = "烧得只剩焦壳。",		--物品名：伯尼 检查状态：普通状态
        },

        BERNIE_ACTIVE = "那只熊在走来走去。有点意思。",		--物品名：伯尼
        BERNIE_BIG = "别去招惹薇洛。",		--物品名：伯尼！

		BOOKSTATION =
		{
			GENERIC = "做实验比读书有用。",		--物品名：书架 检查状态：普通状态
			BURNT = "图书馆关门了。",		--物品名：书架 检查状态：已经烧毁
		},
        BOOK_BIRDS = "一本关于鸟的书。插图不错。",		--物品名：世界鸟类大全
        BOOK_TENTACLES = "读完这本，多半会被拖走。",		--物品名：触手的召唤
        BOOK_GARDENING = "翻到最后一页也没见着农场。",		--物品名：应用园艺学
		BOOK_SILVICULTURE = "造林的事，我还是自己试。",		--物品名：应用造林学
		BOOK_HORTICULTURE = "园艺学。纸上长的东西不算数。",		--物品名：园艺学简编版
        BOOK_SLEEP = "五百页电报码。难怪催眠。",		--物品名：睡前故事
        BOOK_BRIMSTONE = "开头乏味，末几页才见真章。",		--物品名：末日将至！

        BOOK_FISH = "它没能钓上我，喵。",		--物品名：垂钓者生存指南
        BOOK_FIRE = "读它并不让人心急火燎。",		--物品名：意念控火术详解
        BOOK_WEB = "我不怕蜘蛛。……真的不怕。",		--物品名：克服蛛形纲恐惧症
        BOOK_TEMPERATURE = "不冷不热的一本书。",		--物品名：控温学
        BOOK_LIGHT = "写书的人，头脑很清楚。",		--物品名：永恒之光
        BOOK_RAIN = "求雨。听上去不太严谨。",		--物品名：实用求雨仪式
        BOOK_MOON = "对月亮的兴趣，大概也分季节。",		--物品名：月之魔典
        BOOK_BEES = "书为什么会嗡嗡响，我需要个解释。",		--物品名：养蜂笔记
        
        BOOK_HORTICULTURE_UPGRADED = "和盯着草长高差不多精彩。",		--物品名：园艺学扩展版
        BOOK_RESEARCH_STATION = "薇克巴顿乐意照书上的做。",		--物品名：万物百科
        BOOK_LIGHT_UPGRADED = "光耀夺目。这句我认。",		--物品名：永恒之光之复兴

        FIREPEN = "趁热写下去。",		--物品名：火焰笔

        PLAYER =
        {
            GENERIC = "你好，%s。",		--物品名：其他角色 检查状态：普通状态
            ATTACKER = "%s 的眼神不太稳。",		--物品名：其他角色 检查状态：近期攻击过当前角色
            MURDERER = "凶手。我记住了。",		--物品名：其他角色 检查状态：近期杀害过当前角色的同伴
            REVIVER = "%s 与鬼魂交好。",		--物品名：其他角色 检查状态：近期复活过当前角色
            GHOST = "%s 需要一颗心。",		--物品名：其他角色 检查状态：幽灵状态
            FIRESTARTER = "烧东西不科学，%s。",		--物品名：其他角色 检查状态：近期引发过火灾
        },
        WILSON =
        {
            GENERIC = "星星与原子。你是我的影子吗？",		--物品名：威尔逊 检查状态：普通状态
            ATTACKER = "我平时也这么吓人吗？",		--物品名：威尔逊 检查状态：近期攻击过当前角色
            MURDERER = "你的存在不合规律，%s。",		--物品名：威尔逊 检查状态：近期杀害过当前角色的同伴
            REVIVER = "%s 把理论落到了实处。",		--物品名：威尔逊 检查状态：近期复活过当前角色
            GHOST = "得做个复活设备。不能让他一直飘着。",		--物品名：威尔逊 检查状态：幽灵状态
            FIRESTARTER = "纵火不合科学，%s。",		--物品名：威尔逊 检查状态：近期引发过火灾
        },
        WOLFGANG =
        {
            GENERIC = "见到你很好，%s。",		--物品名：沃尔夫冈 检查状态：普通状态
            ATTACKER = "别去挑衅比你强的人。",		--物品名：沃尔夫冈 检查状态：近期攻击过当前角色
            MURDERER = "凶手。我抓得住你。",		--物品名：沃尔夫冈 检查状态：近期杀害过当前角色的同伴
            REVIVER = "%s 不过是一只大泰迪熊。",		--物品名：沃尔夫冈 检查状态：近期复活过当前角色
            GHOST = "早说过那块石头别硬拉。数值全错。",		--物品名：沃尔夫冈 检查状态：幽灵状态
            FIRESTARTER = "你打不倒火，%s。",		--物品名：沃尔夫冈 检查状态：近期引发过火灾
        },
        WAXWELL =
        {
            GENERIC = "日安，%s。",		--物品名：麦斯威尔 检查状态：普通状态
            ATTACKER = "你从“言辞干脆”变成了“舌头打结”。",		--物品名：麦斯威尔 检查状态：近期攻击过当前角色
            MURDERER = "逻辑与推理是我的长项。要我教你？",		--物品名：麦斯威尔 检查状态：近期杀害过当前角色的同伴
            REVIVER = "%s 把本事用在了正事上。",		--物品名：麦斯威尔 检查状态：近期复活过当前角色
            GHOST = "别那样看我，%s。我在想办法。",		--物品名：麦斯威尔 检查状态：幽灵状态
            FIRESTARTER = "%s 这是自找火烤。",		--物品名：麦斯威尔 检查状态：近期引发过火灾
        },
        WX78 =
        {
            GENERIC = "日安，%s。",		--物品名：WX-78 检查状态：普通状态
            ATTACKER = "%s，你的首要指令该重写了。",		--物品名：WX-78 检查状态：近期攻击过当前角色
            MURDERER = "%s。你违反了第一律法。",		--物品名：WX-78 检查状态：近期杀害过当前角色的同伴
            REVIVER = "大概是 %s 让共情组件转了起来。",		--物品名：WX-78 检查状态：近期复活过当前角色
            GHOST = "我早知道 %s 该长点心。现在确定了。",		--物品名：WX-78 检查状态：幽灵状态
            FIRESTARTER = "%s，你像是要化了。",		--物品名：WX-78 检查状态：近期引发过火灾
        },
        WILLOW =
        {
            GENERIC = "日安，%s。",		--物品名：薇洛 检查状态：普通状态
            ATTACKER = "%s 攥着那只打火机……",		--物品名：薇洛 检查状态：近期攻击过当前角色
            MURDERER = "凶手。还有纵火犯。",		--物品名：薇洛 检查状态：近期杀害过当前角色的同伴
            REVIVER = "%s 与鬼魂交好。",		--物品名：薇洛 检查状态：近期复活过当前角色
            GHOST = "%s，你大概很想要一颗心。",		--物品名：薇洛 检查状态：幽灵状态
            FIRESTARTER = "又一次？",		--物品名：薇洛 检查状态：近期引发过火灾
        },
        WENDY =
        {
            GENERIC = "你好，%s。",		--物品名：温蒂 检查状态：普通状态
            ATTACKER = "%s 身上没带尖东西吧？",		--物品名：温蒂 检查状态：近期攻击过当前角色
            MURDERER = "你手上沾了血。",		--物品名：温蒂 检查状态：近期杀害过当前角色的同伴
            REVIVER = "%s 把鬼魂当家人。",		--物品名：温蒂 检查状态：近期复活过当前角色
            GHOST = "我看见两个影子。得给 %s 做颗心。",		--物品名：温蒂 检查状态：幽灵状态
            FIRESTARTER = "那几把火是你点的，我知道。",		--物品名：温蒂 检查状态：近期引发过火灾
        },
        WOODIE =
        {
            GENERIC = "你好，%s。",		--物品名：伍迪 检查状态：普通状态
            ATTACKER = "%s 最近精神过头了。",		--物品名：伍迪 检查状态：近期攻击过当前角色
            MURDERER = "凶手。拿斧子来，我们砍。",		--物品名：伍迪 检查状态：近期杀害过当前角色的同伴
            REVIVER = "%s 把大家的命捞了回来。",		--物品名：伍迪 检查状态：近期复活过当前角色
            GHOST = "%s，“宇宙”里也包括虚无吗？",		--物品名：伍迪 检查状态：幽灵状态
            BEAVER = "%s 在砍树，停不下来。",		--物品名：伍迪 检查状态：伍迪的海狸形态
            BEAVERGHOST = "%s，若我不复活你，你会恼吗？",		--物品名：伍迪 检查状态：伍迪海狸形态的幽灵
            MOOSE = "天。那是一头鹿。",		--物品名：伍迪 检查状态：伍迪的鹿鹅形态
            MOOSEGHOST = "那副样子，想必不好受。",		--物品名：伍迪 检查状态：伍迪鹿形态的幽灵
            GOOSE = "看看这位。",		--物品名：伍迪 检查状态：伍迪的鹅形态
            GOOSEGHOST = "长点心吧，你这只笨鹅。",		--物品名：伍迪 检查状态：伍迪鹅形态的幽灵
            FIRESTARTER = "%s，别把自己点着。",		--物品名：伍迪 检查状态：近期引发过火灾
        },
        WICKERBOTTOM =
        {
            GENERIC = "日安，%s。",		--物品名：薇克巴顿 检查状态：普通状态
            ATTACKER = "%s 像是要拿书砸我。",		--物品名：薇克巴顿 检查状态：近期攻击过当前角色
            MURDERER = "同行评议来了。",		--物品名：薇克巴顿 检查状态：近期杀害过当前角色的同伴
            REVIVER = "我对 %s 的实践心怀敬意。",		--物品名：薇克巴顿 检查状态：近期复活过当前角色
            GHOST = "这不太科学，不是吗，%s？",		--物品名：薇克巴顿 检查状态：幽灵状态
            FIRESTARTER = "你点火总有你的道理。",		--物品名：薇克巴顿 检查状态：近期引发过火灾
        },
        WES =
        {
            GENERIC = "你好，%s。",		--物品名：韦斯 检查状态：普通状态
            ATTACKER = "%s 沉默得像口枯井。",		--物品名：韦斯 检查状态：近期攻击过当前角色
            MURDERER = "这个，用哑剧演给我看。",		--物品名：韦斯 检查状态：近期杀害过当前角色的同伴
            REVIVER = "%s 跳出了惯常的路子。",		--物品名：韦斯 检查状态：近期复活过当前角色
            GHOST = "“我要个复活装备”——这句怎么用哑剧演？",		--物品名：韦斯 检查状态：幽灵状态
            FIRESTARTER = "等等，别说。火是你点的。",		--物品名：韦斯 检查状态：近期引发过火灾
        },
        WEBBER =
        {
            GENERIC = "日安，%s。",		--物品名：韦伯 检查状态：普通状态
            ATTACKER = "我先把纸卷起来，以防万一。",		--物品名：韦伯 检查状态：近期攻击过当前角色
            MURDERER = "杀了人还敢站着，%s。我来了结。",		--物品名：韦伯 检查状态：近期杀害过当前角色的同伴
            REVIVER = "%s 跟谁都处得来。",		--物品名：韦伯 检查状态：近期复活过当前角色
            GHOST = "%s 很想要我给他一颗心。",		--物品名：韦伯 检查状态：幽灵状态
            FIRESTARTER = "我们得开个防火会议。",		--物品名：韦伯 检查状态：近期引发过火灾
        },
        WATHGRITHR =
        {
            GENERIC = "日安，%s。",		--物品名：薇格弗德 检查状态：普通状态
            ATTACKER = "%s 的拳头，我会避开。",		--物品名：薇格弗德 检查状态：近期攻击过当前角色
            MURDERER = "%s 杀红了眼。",		--物品名：薇格弗德 检查状态：近期杀害过当前角色的同伴
            REVIVER = "%s 精神很好。",		--物品名：薇格弗德 检查状态：近期复活过当前角色
            GHOST = "做得不错。英灵殿还没收你呢，%s。",		--物品名：薇格弗德 检查状态：幽灵状态
            FIRESTARTER = "%s 很会加温。",		--物品名：薇格弗德 检查状态：近期引发过火灾
        },
        WINONA =
        {
            GENERIC = "日安，%s。",		--物品名：薇诺娜 检查状态：普通状态
            ATTACKER = "%s 是个隐患。",		--物品名：薇诺娜 检查状态：近期攻击过当前角色
            MURDERER = "到此为止，%s。",		--物品名：薇诺娜 检查状态：近期杀害过当前角色的同伴
            REVIVER = "你真是好用，%s。",		--物品名：薇诺娜 检查状态：近期复活过当前角色
            GHOST = "有人在给你的计划泼冷水。",		--物品名：薇诺娜 检查状态：幽灵状态
            FIRESTARTER = "厂里的东西烧起来了。",		--物品名：薇诺娜 检查状态：近期引发过火灾
        },
        WORTOX =
        {
            GENERIC = "你好，%s。",		--物品名：沃拓克斯 检查状态：普通状态
            ATTACKER = "我早知道 %s 不可信。",		--物品名：沃拓克斯 检查状态：近期攻击过当前角色
            MURDERER = "该正面会会这只长角的恶魔了。",		--物品名：沃拓克斯 检查状态：近期杀害过当前角色的同伴
            REVIVER = "多谢你的爪子，%s。",		--物品名：沃拓克斯 检查状态：近期复活过当前角色
            GHOST = "鬼魂和恶魔并存。我拒绝接受。",		--物品名：沃拓克斯 检查状态：幽灵状态
            FIRESTARTER = "%s 正在成为累赘。",		--物品名：沃拓克斯 检查状态：近期引发过火灾
        },
        WORMWOOD =
        {
            GENERIC = "你好，%s。",		--物品名：沃姆伍德 检查状态：普通状态
            ATTACKER = "%s 今天刺比平时多。",		--物品名：沃姆伍德 检查状态：近期攻击过当前角色
            MURDERER = "等着被除草吧，小杂草 %s。",		--物品名：沃姆伍德 检查状态：近期杀害过当前角色的同伴
            REVIVER = "%s 从不丢下朋友。",		--物品名：沃姆伍德 检查状态：近期复活过当前角色
            GHOST = "需要搭把手吗，小家伙？",		--物品名：沃姆伍德 检查状态：幽灵状态
            FIRESTARTER = "我以为你讨厌火，%s。",		--物品名：沃姆伍德 检查状态：近期引发过火灾
        },
        WARLY =
        {
            GENERIC = "你好，%s。",		--物品名：沃利 检查状态：普通状态
            ATTACKER = "锅里在酝酿灾祸。",		--物品名：沃利 检查状态：近期攻击过当前角色
            MURDERER = "别打杀我的主意。",		--物品名：沃利 检查状态：近期杀害过当前角色的同伴
            REVIVER = "%s 总有办法。",		--物品名：沃利 检查状态：近期复活过当前角色
            GHOST = "如今他只能用幽灵辣椒下厨了。",		--物品名：沃利 检查状态：幽灵状态
            FIRESTARTER = "他会把这里烧光。",		--物品名：沃利 检查状态：近期引发过火灾
        },

        WURT =
        {
            GENERIC = "日安，%s。",		--物品名：沃特 检查状态：普通状态
            ATTACKER = "%s 今天一脸凶相。",		--物品名：沃特 检查状态：近期攻击过当前角色
            MURDERER = "你是条杀人的鱼。",		--物品名：沃特 检查状态：近期杀害过当前角色的同伴
            REVIVER = "我该谢你吗，%s？",		--物品名：沃特 检查状态：近期复活过当前角色
            GHOST = "%s 的鱼鳃比平时更绿。",		--物品名：沃特 检查状态：幽灵状态
            FIRESTARTER = "没人教过你别玩火吗？",		--物品名：沃特 检查状态：近期引发过火灾
        },

        WALTER =
        {
            GENERIC = "日安，%s。",		--物品名：沃尔特 检查状态：普通状态
            ATTACKER = "松树先锋队员该做这种事吗？",		--物品名：沃尔特 检查状态：近期攻击过当前角色
            MURDERER = "%s，你的故事素材用尽了？",		--物品名：沃尔特 检查状态：近期杀害过当前角色的同伴
            REVIVER = "%s 一向可靠。",		--物品名：沃尔特 检查状态：近期复活过当前角色
            GHOST = "我知道你玩得开心，但得去找颗心。",		--物品名：沃尔特 检查状态：幽灵状态
            FIRESTARTER = "那堆火可不像营火，%s。",		--物品名：沃尔特 检查状态：近期引发过火灾
        },

        WANDA =
        {
            GENERIC = "日安，%s。",		--物品名：旺达 检查状态：普通状态
            ATTACKER = "挑时间，也挑场合，%s。",		--物品名：旺达 检查状态：近期攻击过当前角色
            MURDERER = "杀人犯。第二次机会不会有。",		--物品名：旺达 检查状态：近期杀害过当前角色的同伴
            REVIVER = "若不是 %s，我已成了历史。",		--物品名：旺达 检查状态：近期复活过当前角色
            GHOST = "快去找颗心。",		--物品名：旺达 检查状态：幽灵状态
            FIRESTARTER = "让我猜，这跟“保住时间线”有关？",		--物品名：旺达 检查状态：近期引发过火灾
        },

        WONKEY =
        {
            GENERIC = "一只猴子。",		--物品名：芜猴 检查状态：普通状态
            ATTACKER = "别像猴子一样胡闹。",		--物品名：芜猴 检查状态：近期攻击过当前角色
            MURDERER = "它们疯了。",		--物品名：芜猴 检查状态：近期杀害过当前角色的同伴
            REVIVER = "救我命的……是只猴子？",		--物品名：芜猴 检查状态：近期复活过当前角色
            GHOST = "那只猴子让人不安。",		--物品名：芜猴 检查状态：幽灵状态
            FIRESTARTER = "当年的恐龙，大概就是这种心情。",		--物品名：芜猴 检查状态：近期引发过火灾
        },

        MIGRATION_PORTAL =
        {
        },
        GLOMMER =
        {
            GENERIC = "趣味不佳，倒也不算难看。",		--物品名：格罗姆 检查状态：普通状态
            SLEEPING = "这虫子睡得真好。",		--物品名：格罗姆 检查状态：正在睡眠
        },
        GLOMMERFLOWER =
        {
            GENERIC = "花瓣泛着微光。",		--物品名：格罗姆花 检查状态：普通状态
            DEAD = "花瓣枯了，还在发亮。",		--物品名：格罗姆花 检查状态：已经死亡
        },
        GLOMMERWINGS = "缝在帽子上会很合适。",		--物品名：格罗姆翅膀
        GLOMMERFUEL = "这团黏液臭得过分。",		--物品名：格罗姆的黏液
        BELL = "叮铃。好听，喵。",		--物品名：远古铃铛
        STATUEGLOMMER =
        {
            GENERIC = "我看不出那是什么。",		--物品名：格罗姆雕像 检查状态：普通状态
            EMPTY = "砸开了。为了考据。",		--物品名：格罗姆雕像 检查状态：内容为空
        },

        LAVA_POND_ROCK = "这块地不错。",		--物品名：岩石

		WEBBERSKULL = "可怜的小东西。该给他一个体面的葬礼。",		--物品名：韦伯的头骨
		WORMLIGHT = "看上去能吃。",		--物品名：发光浆果
		WORMLIGHT_LESSER = "有点皱了。",		--物品名：小发光浆果
		WORM =
		{
		    PLANT = "我看是安全的。",		--物品名：洞穴蠕虫 检查状态：伪装成植物
		    DIRT = "只是一堆土。",		--物品名：洞穴蠕虫 检查状态：地面隆起形态
		    WORM = "它是条虫子。",		--物品名：洞穴蠕虫 检查状态：蠕虫本体形态
		},
        WORMLIGHT_PLANT = "看不出异常。",		--物品名：神秘植物
		MOLE =
		{
			HELD = "没得挖了，朋友。",		--物品名：鼹鼠 检查状态：正被角色携带
			UNDERGROUND = "下面有位在找矿的。",		--物品名：鼹鼠 检查状态：位于地下
			ABOVEGROUND = "我想像敲地鼠那样敲它。",		--物品名：鼹鼠 检查状态：位于地面上
		},
		MOLEHILL = "一个舒适的好洞。",		--物品名：鼹鼠丘
		MOLEHAT = "气味难闻，视野极好。",		--物品名：鼹鼠帽

		EEL = "能做一道好菜，喵。",		--物品名：鳗鱼
		EEL_COOKED = "闻着真香。",		--物品名：熟鳗鱼
		UNAGI = "但愿没人会变成鳗鱼。",		--物品名：鳗鱼料理
		EYETURRET = "但愿它别望向我。",		--物品名：眼睛炮塔
		EYETURRET_ITEM = "它在睡。",		--物品名：眼睛炮塔
		MINOTAURHORN = "那家伙的角没撞上我，万幸。",		--物品名：守护者之角
		MINOTAURCHEST = "里头也许有更好的东西。也许更糟。",		--物品名：大号华丽箱子
		THULECITE_PIECES = "铥矿的碎屑。",		--物品名：铥矿碎片
		POND_ALGAE = "岸边浮着的水藻。",		--物品名：水藻
		GREENSTAFF = "迟早用得上。",		--物品名：拆解魔杖
		GIFT = "给我的？",		--物品名：礼物
        GIFTWRAP = "包得很体面。",		--物品名：礼物包装
		POTTEDFERN = "盆里的蕨。",		--物品名：蕨类盆栽
        SUCCULENT_POTTED = "盆里的多肉。",		--物品名：多肉盆栽
		SUCCULENT_PLANT = "那一株是芦荟。",		--物品名：多肉植物
		SUCCULENT_PICKED = "能吃，但我不打算吃。",		--物品名：多肉植物
		SENTRYWARD = "测绘用的，颇为严谨。",		--物品名：月眼守卫
        TOWNPORTAL =
        {
			GENERIC = "这座金字塔管着沙子。",		--物品名：懒人传送塔 检查状态：普通状态
			ACTIVE = "传送就绪。站稳。",		--物品名：懒人传送塔 检查状态：正在运作
		},
        TOWNPORTALTALISMAN =
        {
			GENERIC = "一只小分离器。",		--物品名：沙之石 检查状态：普通状态
			ACTIVE = "识相的人宁愿走路。",		--物品名：沙之石 检查状态：正在运作
		},
        WETPAPER = "但愿它快点干。",		--物品名：纸张
        WETPOUCH = "这包裹勉强绑住了。",		--物品名：起皱的包裹
        MOONROCK_PIECES = "我大概能敲碎它。",		--物品名：月亮石碎块
        MOONBASE =
        {
            GENERIC = "中间有个洞，像是能投东西。",		--物品名：月亮石 检查状态：普通状态
            BROKEN = "全毁了。",		--物品名：月亮石 检查状态：已经损坏
            STAFFED = "接着呢？",		--物品名：月亮石 检查状态：已经插入法杖
            WRONGSTAFF = "我明显感到不对。",		--物品名：月亮石 检查状态：插入了不匹配的法杖
            MOONSTAFF = "石头把它点亮了。称奇。",		--物品名：月亮石 检查状态：插入了唤星者魔杖
        },
        MOONDIAL =
        {
			GENERIC = "水放大了刻度，于是月亮可量。",		--物品名：月晷 检查状态：普通状态
			NIGHT_NEW = "新月。",		--物品名：月晷 检查状态：夜间新月状态
			NIGHT_WAX = "月亮在慢慢变圆。",		--物品名：月晷 检查状态：夜间盈月状态
			NIGHT_FULL = "满月。",		--物品名：月晷 检查状态：夜间满月状态
			NIGHT_WANE = "月亮在瘦下去。",		--物品名：月晷 检查状态：夜间亏月状态
			CAVE = "洞穴深处没有月亮。无从测量。",		--物品名：月晷 检查状态：位于洞穴世界
			WEREBEAVER = "露西，时候又到了。", 		--物品名：月晷 检查状态：月晷显示伍迪将变成海狸
			GLASSED = "有种被注视的错觉。不，不是错觉。",		--物品名：月晷 检查状态：月晷表面已经玻璃化
        },
		THULECITE = "这矿从哪来，我想知道。",		--物品名：铥矿
		ARMORRUINS = "轻得古怪。不像石头。",		--物品名：铥矿甲
		ARMORSKELETON = "白骨森然。",		--物品名：骨头盔甲
		SKELETONHAT = "它给我看见可怕的东西。",		--物品名：骨头头盔
		RUINS_BAT = "提着压手。",		--物品名：铥矿棒
		RUINSHAT = "我的发型如何？",		--物品名：铥矿皇冠
		NIGHTMARE_TIMEPIECE =
		{
            CALM = "都平静了。",		--物品名：铥矿徽章 检查状态：噩梦循环处于平静阶段
            WARN = "这里的魔力相当浓。",		--物品名：铥矿徽章 检查状态：噩梦循环即将进入危险阶段
            WAXING = "越来越密了。",		--物品名：铥矿徽章 检查状态：噩梦循环正在增强
            STEADY = "像是稳住了。",		--物品名：铥矿徽章 检查状态：噩梦循环处于稳定阶段
            WANING = "魔力在退。",		--物品名：铥矿徽章 检查状态：噩梦循环正在减弱
            DAWN = "噩梦快结束了。",		--物品名：铥矿徽章 检查状态：噩梦循环接近结束
            NOMAGIC = "此处没有魔力。",		--物品名：铥矿徽章 检查状态：当前没有噩梦魔力活动
		},
		BISHOP_NIGHTMARE = "它在崩解。",		--物品名：损坏的发条主教
		ROOK_NIGHTMARE = "真难看。",		--物品名：损坏的发条战车
		KNIGHT_NIGHTMARE = "一具残暴的发条骑士。",		--物品名：损坏的发条骑士
		MINOTAUR = "那家伙不太高兴。",		--物品名：远古守护者
		SPIDER_DROPPER = "记着：别抬头。",		--物品名：穴居悬蛛
		NIGHTMARELIGHT = "这灯的用途，我还没想明白。",		--物品名：梦魇灯座
		NIGHTSTICK = "它身上有电。",		--物品名：晨星锤
		GREENGEM = "绿的，有光。",		--物品名：绿宝石
		MULTITOOL_AXE_PICKAXE = "高明。",		--物品名：多用斧镐
		ORANGESTAFF = "比走路省事。",		--物品名：懒人魔杖
		YELLOWAMULET = "握着是温的。",		--物品名：魔光护符
		GREENAMULET = "每个基地都该有一个。",		--物品名：建造护符
		SLURPERPELT = "死了也还是这副模样。",		--物品名：啜食者皮

		SLURPER = "毛真多。",		--物品名：啜食者
		SLURPER_PELT = "皮剥下来，区别不大。",		--物品名：啜食者皮
		ARMORSLURPER = "一条湿漉漉的腰带，能替你挨饿。",		--物品名：饥饿腰带
		ORANGEAMULET = "瞬移很管用。",		--物品名：懒人护符
		YELLOWSTAFF = "棍上嵌了宝石。天才的发明。",		--物品名：唤星者魔杖
		YELLOWGEM = "黄宝石。",		--物品名：黄宝石
		ORANGEGEM = "一颗橙宝石。",		--物品名：橙宝石
        OPALSTAFF = "宝石嵌在棍顶更亮。这有据可依。",		--物品名：唤月者魔杖
        OPALPRECIOUSGEM = "这颗宝石很特别。",		--物品名：彩虹宝石
        TELEBASE =
		{
			VALID = "它已经就绪。",		--物品名：传送焦点 检查状态：宝石组合有效，可以激活
			GEMS = "还差紫宝石。",		--物品名：传送焦点 检查状态：已插入宝石但尚未完全激活
		},
		GEMSOCKET =
		{
			VALID = "看来可以用了。",		--物品名：宝石底座 检查状态：宝石组合有效，可以激活
			GEMS = "它要一颗宝石。",		--物品名：宝石底座 检查状态：已插入宝石但尚未完全激活
		},
		STAFFLIGHT = "那东西很危险。",		--物品名：矮星
        STAFFCOLDLIGHT = "冷得叫人打颤。",		--物品名：极光

        ANCIENT_ALTAR = "古老的祭坛。神秘得有理。",		--物品名：远古伪科学站

        ANCIENT_ALTAR_BROKEN = "这座似乎坏了。",		--物品名：损坏的远古伪科学站

        ANCIENT_STATUE = "它在震，与这世界格格不入。",		--物品名：远古雕像

        LICHEN = "这种光线下，只有蓝藻长得起来。",		--物品名：洞穴苔藓
		CUTLICHEN = "有营养，放不久。",		--物品名：苔藓

		CAVE_BANANA = "捏着发软。",		--物品名：香蕉
		CAVE_BANANA_COOKED = "好吃。",		--物品名：熟香蕉
		CAVE_BANANA_TREE = "它能否光合作用，我存疑。",		--物品名：洞穴香蕉树
        ROCKY =
        {
            GENERIC = "它的爪子叫人发怵。",		--物品名：石虾 检查状态：普通状态
            BOULDER = "装不进我的口袋。", 		--物品名：石虾 检查状态：收缩成岩石状
            ACID = "它变小了？", 		--物品名：石虾 检查状态：受到酸液影响
        },

		COMPASS =
		{
			GENERIC="我朝哪边？",		--物品名：指南针 检查状态：普通状态
			N = "指北。",		--物品名：指南针 检查状态：指南针指向北方
			S = "指南。",		--物品名：指南针 检查状态：指南针指向南方
			E = "指东。",		--物品名：指南针 检查状态：指南针指向东方
			W = "指西。",		--物品名：指南针 检查状态：指南针指向西方
			NE = "偏东北。",		--物品名：指南针 检查状态：指南针指向东北方
			SE = "偏东南。",		--物品名：指南针 检查状态：指南针指向东南方
			NW = "偏西北。",		--物品名：指南针 检查状态：指南针指向西北方
			SW = "偏西南。",		--物品名：指南针 检查状态：指南针指向西南方
		},

        HOUNDSTOOTH = "很利。",		--物品名：犬牙
        ARMORSNURTLESHELL = "穿上它，会黏在背上。",		--物品名：蜗壳护甲
        BAT =
        {
            GENERIC = "呀。这东西真吓人。",		--物品名：洞穴蝙蝠 检查状态：普通状态
            ACID = "硝石养出来的东西。", 		--物品名：洞穴蝙蝠 检查状态：受到酸液影响
        },
        BATBAT = "拿两根，我说不定能飞。",		--物品名：蝙蝠棒
        BATWING = "这些东西死了也讨厌。",		--物品名：洞穴蝙蝠翅膀
        BATWING_COOKED = "至少它不会再活了。",		--物品名：熟蝙蝠翅膀
        BATCAVE = "我不想吵醒它们。",		--物品名：蝙蝠洞
        BEDROLL_FURRY = "又暖又软，喵。",		--物品名：毛皮铺盖
        BUNNYMAN = "先做点研究。我等不及了。",		--物品名：兔人
        FLOWER_CAVE = "发光是科学的作用。",		--物品名：荧光花
        GUANO = "另一种气味的粪。",		--物品名：鸟粪
        LANTERN = "文明些的灯。",		--物品名：提灯
        LIGHTBULB = "奇怪。它看着竟像能吃。",		--物品名：荧光果
        MANRABBIT_TAIL = "手里有个东西抓着，安心。",		--物品名：兔绒
        MUSHROOMHAT = "戴上它，人会显得有趣。",		--物品名：蘑菇帽
        MUSHROOM_LIGHT2 =
        {
            ON = "蓝色显然最讲道理。",		--物品名：菌伞灯 检查状态：处于开启状态
            OFF = "用三原色，也能配出主光源。",		--物品名：菌伞灯 检查状态：处于关闭状态
            BURNT = "不是我让它发霉的，我保证。",		--物品名：菌伞灯 检查状态：已经烧毁
        },

        MUSHROOM_LIGHT =
        {
            ON = "灯亮着。光，恰到好处。",		--物品名：蘑菇灯 检查状态：处于开启状态
            OFF = "熄了。留着也好。",		--物品名：蘑菇灯 检查状态：处于关闭状态
            BURNT = "烧透了。没什么可救的。",		--物品名：蘑菇灯 检查状态：已经烧毁
        },
        SLEEPBOMB = "睡进去，就由不得自己了。",		--物品名：睡袋
        MUSHROOMBOMB = "蘑菇云。请退后。",		--物品名：炸弹蘑菇
        SHROOM_SKIN = "疣。一层又一层。",		--物品名：蘑菇皮
        TOADSTOOL_CAP =
        {
            EMPTY = "地上只剩下一个洞。",		--物品名：毒菌蟾蜍 检查状态：内容为空
            INGROUND = "有东西正在往外探。",		--物品名：毒菌蟾蜍 检查状态：仍埋在地下
            GENERIC = "它只是想被砍下来。",		--物品名：毒菌蟾蜍 检查状态：普通状态
        },
        TOADSTOOL =
        {
            GENERIC = "失礼。我不吻这种东西。",		--物品名：毒菌蟾蜍 检查状态：普通状态
            RAGE = "它跳得厉害。别站在它面前。",		--物品名：毒菌蟾蜍 检查状态：毒菌蟾蜍处于愤怒强化状态
        },
        MUSHROOMSPROUT =
        {
            GENERIC = "多么讲究的结构。",		--物品名：孢子帽 检查状态：普通状态
            BURNT = "多么不体面的下场。",		--物品名：孢子帽 检查状态：已经烧毁
        },
        MUSHTREE_TALL =
        {
            GENERIC = "这株蘑菇，大得没有分寸。",		--物品名：蓝蘑菇树 检查状态：普通状态
            BLOOM = "远看无碍，近闻失礼。",		--物品名：蓝蘑菇树 检查状态：处于开花状态
            ACIDCOVERED = "酸液覆身。别碰。",		--物品名：蓝蘑菇树 检查状态：被酸雨覆盖
        },
        MUSHTREE_MEDIUM =
        {
            GENERIC = "我旧日的浴室里长过这个。",		--物品名：红蘑菇树 检查状态：普通状态
            BLOOM = "这让我颇为不适。",		--物品名：红蘑菇树 检查状态：处于开花状态
            ACIDCOVERED = "酸液覆身。离远些。",		--物品名：红蘑菇树 检查状态：被酸雨覆盖
        },
        MUSHTREE_SMALL =
        {
            GENERIC = "会魔法的蘑菇？",		--物品名：绿蘑菇树 检查状态：普通状态
            BLOOM = "它在努力繁衍。由它去。",		--物品名：绿蘑菇树 检查状态：处于开花状态
            ACIDCOVERED = "酸液覆身。离远些。",		--物品名：绿蘑菇树 检查状态：被酸雨覆盖
        },
        MUSHTREE_TALL_WEBBED =
        {
            GENERIC = "蜘蛛们很看重它。",		--物品名：蛛网蓝蘑菇树 检查状态：普通状态
            ACIDCOVERED = "覆满酸液。别碰。",		--物品名：蛛网蓝蘑菇树 检查状态：被酸雨覆盖
        },
        SPORE_TALL =
        {
            GENERIC = "它四处漂着。",		--物品名：蓝色孢子 检查状态：普通状态
            HELD = "口袋里，装一点光。",		--物品名：蓝色孢子 检查状态：正被角色携带
        },
        SPORE_MEDIUM =
        {
            GENERIC = "这世上已没有它牵挂的东西。",		--物品名：红色孢子 检查状态：普通状态
            HELD = "口袋里，装一点光。",		--物品名：红色孢子 检查状态：正被角色携带
        },
        SPORE_SMALL =
        {
            GENERIC = "那是孢子眼中的世界。",		--物品名：绿色孢子 检查状态：普通状态
            HELD = "口袋里，装一点光。",		--物品名：绿色孢子 检查状态：正被角色携带
        },
        RABBITHOUSE =
        {
            GENERIC = "那不是真的胡萝卜。",		--物品名：兔屋 检查状态：普通状态
            BURNT = "那也不是真的烤胡萝卜。",		--物品名：兔屋 检查状态：已经烧毁
        },
        SLURTLE = "……失礼。这东西让人反胃。",		--物品名：蛞蝓龟
        SLURTLE_SHELLPIECES = "拼不回去的拼图。",		--物品名：外壳碎片
        SLURTLEHAT = "它会弄乱我的头发。",		--物品名：背壳头盔
        SLURTLEHOLE = "一座“恶心”的洞穴。",		--物品名：蛞蝓龟窝
        SLURTLESLIME = "若非有用，我绝不碰它。",		--物品名：蛞蝓龟黏液
        SNURTLE = "它不算太恶心。只是仍旧恶心。",		--物品名：蜗牛龟
        SPIDER_HIDER = "呀。又是蜘蛛。",		--物品名：洞穴蜘蛛
        SPIDER_SPITTER = "我讨厌蜘蛛。",		--物品名：喷吐蜘蛛
        SPIDERHOLE = "外面盖满了蛛网。",		--物品名：蛛网岩
        SPIDERHOLE_ROCK = "外面盖满了蛛网。",		--物品名：蛛穴岩块
        STALAGMITE = "依我看，就是块石头。",		--物品名：石笋
        STALAGMITE_TALL = "石头，石头，石头……",		--物品名：石笋

        TURF_CARPETFLOOR = "颇为扎人。",		--物品名：地毯地板
        TURF_CHECKERFLOOR = "这些相当华丽。",		--物品名：棋盘地板
        TURF_DIRT = "一块地皮。",		--物品名：泥土地皮
        TURF_FOREST = "一块地皮。",		--物品名：森林地皮
        TURF_GRASS = "一块地皮。",		--物品名：长草地皮
        TURF_MARSH = "一块地皮。",		--物品名：沼泽地皮
        TURF_METEOR = "一块月面。",		--物品名：月球环形山地皮
        TURF_PEBBLEBEACH = "一片海滩。",		--物品名：岩石海滩地皮
        TURF_ROAD = "草草铺就的石路。",		--物品名：卵石路
        TURF_ROCKY = "一块地皮。",		--物品名：岩石地皮
        TURF_SAVANNA = "一块地皮。",		--物品名：热带草原地皮
        TURF_WOODFLOOR = "木地板。铺得尚可。",		--物品名：木地板

		TURF_CAVE="又一种地皮。",		--物品名：鸟粪地皮
		TURF_FUNGUS="地皮罢了。",		--物品名：真菌地皮
		TURF_FUNGUS_MOON = "还是地皮。",		--物品名：变异真菌地皮
		TURF_ARCHIVE = "又一种地皮。",		--物品名：远古石刻
        TURF_VAULT = "又一种地皮。",		--物品名：远古圣殿石刻
        TURF_VENT = "又一种地皮。",		--物品名：洞穴喷气孔地皮
		TURF_SINKHOLE="地皮，又一种。",		--物品名：黏滑地皮
		TURF_UNDERROCK="地皮，又一种。",		--物品名：洞穴岩石地皮
		TURF_MUD="地皮，又一种。",		--物品名：泥泞地皮

		TURF_DECIDUOUS = "又一种地皮。",		--物品名：落叶林地皮
		TURF_SANDY = "又一种地皮。",		--物品名：沙土地皮
		TURF_BADLANDS = "又一种地皮。",		--物品名：荒地地皮
		TURF_DESERTDIRT = "一块地皮。",		--物品名：沙漠地皮
		TURF_FUNGUS_GREEN = "一块地皮。",		--物品名：真菌地皮
		TURF_FUNGUS_RED = "又一块地皮。",		--物品名：真菌地皮
		TURF_DRAGONFLY = "你想证明它防火？",		--物品名：龙鳞地板

        TURF_SHELLBEACH = "一片海滩。",		--物品名：贝壳海滩地皮

		TURF_RUINSBRICK = "又一种地皮。",		--物品名：远古地面
		TURF_RUINSBRICK_GLOW = "仿的。也算一种地皮。",		--物品名：仿远古地面
		TURF_RUINSTILES = "又一种地皮。",		--物品名：远古瓷砖
		TURF_RUINSTILES_GLOW = "仿的。铺得还算齐整。",		--物品名：仿远古瓷砖
		TURF_RUINSTRIM = "又一种地皮。",		--物品名：远古砖雕
		TURF_RUINSTRIM_GLOW = "仿的。聊胜于无。",		--物品名：仿远古砖雕

        TURF_MONKEY_GROUND = "一片沙地。",		--物品名：月亮码头海滩地皮

        TURF_CARPETFLOOR2 = "它软得出人意料。",		--物品名：茂盛地毯
        TURF_MOSAIC_GREY = "又一种地皮。",		--物品名：灰色马赛克地板
        TURF_MOSAIC_RED = "又一种地皮。",		--物品名：红色马赛克地板
        TURF_MOSAIC_BLUE = "又一种地皮。",		--物品名：蓝色马赛克地板

        TURF_BEARD_RUG = "用我自己的胡须做的。",		--物品名：胡须地毯

		POWCAKE = "这需要一点奇迹。或一点科学。",		--物品名：粉末蛋糕
        CAVE_ENTRANCE = "我在想，那块岩石能否挪开。",		--物品名：被堵住的洞穴
        CAVE_ENTRANCE_RUINS = "它或许在隐瞒什么。",		--物品名：被堵住的陷洞

       	CAVE_ENTRANCE_OPEN =
        {
            GENERIC = "大地本身在拒绝我。",		--物品名：洞穴 检查状态：普通状态
            OPEN = "那下面值得一探。",		--物品名：洞穴 检查状态：处于打开状态
            FULL = "等有人出来，我再进去。",		--物品名：洞穴 检查状态：内容已满
        },
        CAVE_EXIT =
        {
            GENERIC = "我想，我该留在下面。",		--物品名：楼梯 检查状态：普通状态
            OPEN = "我暂时不想再探了。",		--物品名：楼梯 检查状态：处于打开状态
            FULL = "上面太挤。",		--物品名：楼梯 检查状态：内容已满
        },

		MAXWELLPHONOGRAPH = "音乐原来出自这里。",		--物品名：麦斯威尔的留声机
		BOOMERANG = "空气动力学。",		--物品名：回旋镖
		PIGGUARD = "他看上去不太友善。",		--物品名：猪人守卫
		ABIGAIL =
		{
            LEVEL1 =
            {
                "噢，她有个可爱的小蝴蝶结。",		--物品名：阿比盖尔 检查状态：第一阶段 / 第1条台词变体
                "那蝴蝶结，倒真衬她。",		--物品名：阿比盖尔 检查状态：第一阶段 / 第2条台词变体
            },
            LEVEL2 =
            {
                "噢，她有个可爱的小蝴蝶结。",		--物品名：阿比盖尔 检查状态：第二阶段 / 第1条台词变体
                "蝴蝶结还在。很好。",		--物品名：阿比盖尔 检查状态：第二阶段 / 第2条台词变体
            },
            LEVEL3 =
            {
                "噢，她有个可爱的小蝴蝶结。",		--物品名：阿比盖尔 检查状态：第三阶段 / 第1条台词变体
                "她长大了。蝴蝶结也是。",		--物品名：阿比盖尔 检查状态：第三阶段 / 第2条台词变体
            },
        },

		ADVENTURE_PORTAL = "我不会再上一次当。",		--物品名：麦斯威尔之门
		AMULET = "戴着它，我安心。",		--物品名：重生护符
		ANIMAL_TRACK = "食物留下的痕迹。我是说，一只动物。",		--物品名：动物足迹
		ARMORGRASS = "但愿里面没有虫子。",		--物品名：草甲
		ARMORMARBLE = "那看起来真沉。",		--物品名：大理石甲
		ARMORWOOD = "这身衣服很合身。",		--物品名：木甲
		ARMOR_SANITY = "穿上它虽安全，心里却不踏实。",		--物品名：暗夜甲
		ASH =
		{
			GENERIC = "火烧尽之后，剩下的一切。",		--物品名：灰烬 检查状态：普通状态
			REMAINS_GLOMMERFLOWER = "传送时，花被火吞了。",		--物品名：灰烬 检查状态：格罗姆花烧毁后留下的灰烬
			REMAINS_EYE_BONE = "传送时，眼骨被火吞了。",		--物品名：灰烬 检查状态：眼骨烧毁后留下的灰烬
			REMAINS_THINGIE = "这必定有个完美的科学解释。",		--物品名：灰烬 检查状态：传送机零件烧毁后留下的灰烬
		},
		AXE = "可靠的斧头。",		--物品名：斧头
		BABYBEEFALO =
		{
			GENERIC = "啊。真是可爱。",		--物品名：小皮弗娄牛 检查状态：普通状态
		    SLEEPING = "好梦，小家伙。喵。",		--物品名：小皮弗娄牛 检查状态：正在睡眠
        },
        BUNDLE = "我们的物资都在里面。",		--物品名：捆绑物资
        BUNDLEWRAP = "打包之后，搬起来该省力些。",		--物品名：捆绑包装
		BACKPACK = "那里能装下许多科学。",		--物品名：背包
		BACONEGGS = "科学家的完美早餐。",		--物品名：培根煎蛋
		BANDAGE = "看起来还算卫生。",		--物品名：蜂蜜药膏
		BASALT = "太硬了，敲不碎。", 		--物品名：玄武岩
		BEARDHAIR = "只要不是自己的，就都恶心。",		--物品名：胡须
		BEARGER = "熊一般大的獾。",		--物品名：熊獾
		BEARGERVEST = "欢迎来到冬眠站。",		--物品名：熊皮背心
		ICEPACK = "毛皮替包内保温。",		--物品名：保鲜背包
		BEARGER_FUR = "一块厚毛皮。",		--物品名：熊皮
		BEDROLL_STRAW = "看着舒适，闻着一股霉味。",		--物品名：草席卷
		BEEQUEEN = "让那根蜂刺离我远些。",		--物品名：蜂王
		BEEQUEENHIVE =
		{
			GENERIC = "太黏了，走不过去。",		--物品名：小块蜂蜜 检查状态：普通状态
			GROWING = "那东西以前在那儿吗？",		--物品名：小块蜂蜜 检查状态：正在生长
		},
        BEEQUEENHIVEGROWN = "不合常理。它怎么能长到这么大？",		--物品名：巨大蜂窝
        BEEGUARD = "它在守卫女王。",		--物品名：嗡嗡蜜蜂
        HIVEHAT = "戴上它，这世界似乎少些疯狂。",		--物品名：蜂王冠
        MINISIGN =
        {
            GENERIC = "我能画得比这好。",		--物品名：小木牌 检查状态：普通状态
            UNDRAWN = "该在上面画点什么。",		--物品名：小木牌 检查状态：尚未绘制图案
        },
        MINISIGN_ITEM = "这样放着没什么用。放下吧。",		--物品名：小木牌
		BEE =
		{
			GENERIC = "嗡嗡，嗡嗡。",		--物品名：蜜蜂 检查状态：普通状态
			HELD = "当心。",		--物品名：蜜蜂 检查状态：正被角色携带
		},
		BEEBOX =
		{
			READY = "里面装满了蜂蜜。",		--物品名：蜂箱 检查状态：已经准备就绪
			FULLHONEY = "蜂蜜已满。",		--物品名：蜂箱 检查状态：蜂蜜储量已满
			GENERIC = "蜜蜂。",		--物品名：蜂箱 检查状态：普通状态
			NOHONEY = "空的。",		--物品名：蜂箱 检查状态：没有蜂蜜
			SOMEHONEY = "还得等一会儿。",		--物品名：蜂箱 检查状态：存有少量蜂蜜
			BURNT = "怎么烧成这样的。",		--物品名：蜂箱 检查状态：已经烧毁
		},
		MUSHROOM_FARM =
		{
			STUFFED = "蘑菇多得过分。",		--物品名：蘑菇农场 检查状态：种植槽已塞满材料
			LOTS = "木头上长满了蘑菇。",		--物品名：蘑菇农场 检查状态：内容数量很多
			SOME = "现在该继续长了。",		--物品名：蘑菇农场 检查状态：内容数量较少
			EMPTY = "放一个孢子进去。或者一株蘑菇。",		--物品名：蘑菇农场 检查状态：内容为空
			ROTTEN = "木头死了。得换一块活的。",		--物品名：蘑菇农场 检查状态：已经腐烂
			BURNT = "科学点燃了它。真是好极了。",		--物品名：蘑菇农场 检查状态：已经烧毁
			SNOWCOVERED = "这种天寒地冻，它长不了。",		--物品名：蘑菇农场 检查状态：被积雪覆盖
		},
		BEEFALO =
		{
			FOLLOWER = "他安静地跟着我。",		--物品名：皮弗娄牛 检查状态：已经成为当前角色的跟随者
			GENERIC = "是皮弗娄牛。",		--物品名：皮弗娄牛 检查状态：普通状态
			NAKED = "唉，他很难过。",		--物品名：皮弗娄牛 检查状态：皮毛已经被剃掉
			SLEEPING = "这些家伙睡得很沉。",		--物品名：皮弗娄牛 检查状态：正在睡眠
            DOMESTICATED = "这头没那么臭。",		--物品名：皮弗娄牛 检查状态：已经完全驯化
            ORNERY = "它看上去火气不小。",		--物品名：皮弗娄牛 检查状态：战斗倾向已驯化
            RIDER = "这家伙看着好骑。",		--物品名：皮弗娄牛 检查状态：骑乘倾向较高
            PUDGY = "嗯，它大概吃太多了。",		--物品名：皮弗娄牛 检查状态：肥胖倾向已驯化
            MYPARTNER = "我们永远是朋友。",		--物品名：皮弗娄牛 检查状态：是当前角色绑定的牛伙伴
            DEAD = "它很坚强。",		--物品名：皮弗娄牛 检查状态：已经死亡
            DEAD_MYPARTNER = "但愿还能重逢。",		--物品名：皮弗娄牛 检查状态：已死亡，且曾是当前角色的伙伴
		},

		BEEFALOHAT = "我的发型要毁在帽子上了。",		--物品名：牛角帽
		BEEFALOWOOL = "闻起来像皮弗娄牛的眼泪。",		--物品名：牛毛
		BEEHAT = "护得住皮肤，压得坏发型。",		--物品名：养蜂帽
        BEESWAX = "蜂蜡能防腐。科学说的。",		--物品名：蜂蜡
		BEEHIVE = "蜜蜂嗡嗡，忙个不停。",		--物品名：蜂窝
		BEEMINE = "一晃就嗡嗡响。",		--物品名：蜜蜂地雷
		BEEMINE_MAXWELL = "地雷里塞满了狂暴的蚊子。",		--物品名：麦斯威尔的蚊子陷阱
		BERRIES = "红浆果最好吃。",		--物品名：浆果
		BERRIES_COOKED = "我以为加热并不会让它们更好。",		--物品名：烤浆果
        BERRIES_JUICY = "美味。可惜美味总是短暂。",		--物品名：多汁浆果
        BERRIES_JUICY_COOKED = "最好在变质前吃掉。",		--物品名：烤多汁浆果
		BERRYBUSH =
		{
			BARREN = "它该施肥了。",		--物品名：浆果丛 检查状态：资源枯竭，需要施肥
			WITHERED = "这么热，什么都长不成。",		--物品名：浆果丛 检查状态：已经枯萎
			GENERIC = "这些应该能吃。",		--物品名：浆果丛 检查状态：普通状态
			PICKED = "或许还会再长。",		--物品名：浆果丛 检查状态：已经采集
			DISEASED = "病得不轻。",		--物品名：浆果丛 检查状态：已经患病
			DISEASING = "唔……有些不对。",		--物品名：浆果丛 检查状态：正在进入患病阶段
			BURNING = "大半都烧起来了。",		--物品名：浆果丛 检查状态：正在燃烧
		},
		BERRYBUSH_JUICY =
		{
			BARREN = "这状态下，它结不出浆果。",		--物品名：多汁浆果丛 检查状态：资源枯竭，需要施肥
			WITHERED = "高温把浆果的水分抽干了。",		--物品名：多汁浆果丛 检查状态：已经枯萎
			GENERIC = "留到饭点再采。",		--物品名：多汁浆果丛 检查状态：普通状态
			PICKED = "下一批正在努力长。",		--物品名：多汁浆果丛 检查状态：已经采集
			DISEASED = "它看上去很不舒服。",		--物品名：多汁浆果丛 检查状态：已经患病
			DISEASING = "唔……有些不对。",		--物品名：多汁浆果丛 检查状态：正在进入患病阶段
			BURNING = "大半都烧起来了。",		--物品名：多汁浆果丛 检查状态：正在燃烧
		},
		BIGFOOT = "那可真是只大得离谱的脚。",		--物品名：大脚怪
		BIRDCAGE =
		{
			GENERIC = "现在只差一只鸟。",		--物品名：鸟笼 检查状态：普通状态
			OCCUPIED = "哪只是好鸟？",		--物品名：鸟笼 检查状态：当前已有使用者或内容物
			SLEEPING = "呀，他睡着了。",		--物品名：鸟笼 检查状态：正在睡眠
			HUNGRY = "它有点饿了。",		--物品名：鸟笼 检查状态：处于饥饿状态
			STARVING = "很久没人喂了吧。",		--物品名：鸟笼 检查状态：极度饥饿
			DEAD = "也许它只是在休息？",		--物品名：鸟笼 检查状态：已经死亡
			SKELETON = "那只鸟确实死了。",		--物品名：鸟笼 检查状态：鸟笼中只剩骨架
		},
		BIRDTRAP = "蛛网换来的收成。",		--物品名：捕鸟陷阱
		CAVE_BANANA_BURNT = "不是我做的。",		--物品名：烧焦的洞穴香蕉树
		BIRD_EGG = "一颗正常的、小小的鸟蛋。",		--物品名：鸟蛋
		BIRD_EGG_COOKED = "很不错。喵。",		--物品名：熟鸟蛋
		BISHOP = "退后，传教士。",		--物品名：发条主教
		BLOWDART_FIRE = "这东西谈不上安全。",		--物品名：火焰吹箭
		BLOWDART_SLEEP = "别倒吸。",		--物品名：催眠吹箭
		BLOWDART_PIPE = "正好练练吹蜡烛。",		--物品名：吹箭
		BLOWDART_YELLOW = "准得令人吃惊。",		--物品名：雷电吹箭
		BLUEAMULET = "冷得像冰。",		--物品名：寒冰护符
		BLUEGEM = "它泛着冰冷的能量。",		--物品名：蓝宝石
		BLUEPRINT =
		{
            COMMON = "科学啊。",		--物品名：蓝图 检查状态：普通品质
            RARE = "这太科学了。",		--物品名：蓝图 检查状态：稀有品质
        },
        SKETCH = "一张雕像的图样。得找个地方做出来。",		--物品名：{item}草图
		COOKINGRECIPECARD =
		{
			GENERIC = "科学帮帮我。这笔迹我实在读不懂。",		--物品名：{item}食谱卡 检查状态：普通状态
		},
		BLUE_CAP = "古怪，而且黏。",		--物品名：采摘的蓝蘑菇
		BLUE_CAP_COOKED = "这回不一样了……",		--物品名：熟蓝蘑菇
		BLUE_MUSHROOM =
		{
			GENERIC = "是蘑菇。",		--物品名：蓝蘑菇 检查状态：普通状态
			INGROUND = "它在睡觉。",		--物品名：蓝蘑菇 检查状态：仍埋在地下
			PICKED = "不知它会不会长回来。",		--物品名：蓝蘑菇 检查状态：已经采集
		},
		BOARDS = "木板。",		--物品名：木板
		BONESHARD = "一小片骨头。",		--物品名：骨头碎片
		BONESTEW = "能让骨头上长出些肉的炖菜。",		--物品名：炖肉汤
		BUGNET = "抓虫子用的。",		--物品名：捕虫网
		BUSHHAT = "看着扎人。",		--物品名：灌木丛帽
		BUTTER = "真难相信这是黄油。",		--物品名：黄油
		BUTTERFLY =
		{
			GENERIC = "蝴蝶。扑扑翅膀就飞走了。喵。",		--物品名：蝴蝶 检查状态：普通状态
			HELD = "总算抓到你了。",		--物品名：蝴蝶 检查状态：正被角色携带
		},
		BUTTERFLYMUFFIN = "我们丢开食谱，即兴了一回。",		--物品名：蝴蝶松饼
		BUTTERFLYWINGS = "没了这些，它只是条毛虫。",		--物品名：蝴蝶翅膀
		BUZZARD = "好一只丑怪的秃鹫。",		--物品名：秃鹫

		SHADOWDIGGER = "哦，好极了。现在不止他一个。",		--物品名：暗影挖掘者
        SHADOWDANCER = "有些东西，看过就想赶紧忘掉……",		--物品名：暗影舞者

		CACTUS =
		{
			GENERIC = "有刺，但很美味。",		--物品名：仙人掌 检查状态：普通状态
			PICKED = "干瘪了，刺倒还在。",		--物品名：仙人掌 检查状态：已经采集
		},
		CACTUS_MEAT_COOKED = "来自沙漠的烤果子。",		--物品名：熟仙人掌肉
		CACTUS_MEAT = "想吃，得先把刺去掉。",		--物品名：仙人掌肉
		CACTUS_FLOWER = "多刺的植物，也开好看的花。",		--物品名：仙人掌花

		COLDFIRE =
		{
			EMBERS = "该添柴了。不然就灭了。",		--物品名：吸热营火 检查状态：只剩余烬
			GENERIC = "能驱走黑暗。",		--物品名：吸热营火 检查状态：普通状态
			HIGH = "火要失控了。",		--物品名：吸热营火 检查状态：高等级或高储量状态
			LOW = "火小了些。",		--物品名：吸热营火 检查状态：低等级或低储量状态
			NORMAL = "很舒服。",		--物品名：吸热营火 检查状态：普通形态
			OUT = "哦，火灭了。",		--物品名：吸热营火 检查状态：火焰已经熄灭
		},
		CAMPFIRE =
		{
			EMBERS = "得加燃料，不然要灭。",		--物品名：营火 检查状态：只剩余烬
			GENERIC = "能驱走黑暗。",		--物品名：营火 检查状态：普通状态
			HIGH = "火要失控了。",		--物品名：营火 检查状态：高等级或高储量状态
			LOW = "火小了些。",		--物品名：营火 检查状态：低等级或低储量状态
			NORMAL = "很舒服。喵。",		--物品名：营火 检查状态：普通形态
			OUT = "哦，火灭了。",		--物品名：营火 检查状态：火焰已经熄灭
		},
		CANE = "严格说，走路就是有控制的跌倒。",		--物品名：步行手杖
		CATCOON = "顽皮的小东西。喵。",		--物品名：浣猫
		CATCOONDEN =
		{
			GENERIC = "树桩里的窝。",		--物品名：空心树桩 检查状态：普通状态
			EMPTY = "它的主人已经没了。",		--物品名：空心树桩 检查状态：内容为空
		},
		CATCOONHAT = "遮住耳朵的帽子。",		--物品名：猫帽
		COONTAIL = "我觉得它还在摆。喵。",		--物品名：猫尾
		CARROT = "真恶心。这蔬菜是从土里出来的。",		--物品名：胡萝卜
		CARROT_COOKED = "软塌塌的。",		--物品名：烤胡萝卜
		CARROT_PLANTED = "土地在孕育植物宝宝。",		--物品名：胡萝卜
		CARROT_SEEDS = "一颗种子。",		--物品名：椭圆形种子
		CARTOGRAPHYDESK =
		{
			GENERIC = "现在能让大家看看我找到了什么。",		--物品名：制图桌 检查状态：普通状态
			BURNING = "到此为止。",		--物品名：制图桌 检查状态：正在燃烧
			BURNT = "现在只剩灰烬。",		--物品名：制图桌 检查状态：已经烧毁
		},
		WATERMELON_SEEDS = "一颗种子。",		--物品名：方形种子
		CAVE_FERN = "一株蕨。",		--物品名：蕨类植物
		CHARCOAL = "又小又黑，闻着像烧焦的木头。",		--物品名：木炭
        CHESSPIECE_PAWN = "我深有同感。",		--物品名：卒子雕塑
        CHESSPIECE_ROOK =
        {
            GENERIC = "它比看上去更重。",		--物品名：战车雕塑 检查状态：普通状态
            STRUGGLE = "棋子自己在动。",		--物品名：战车雕塑 检查状态：雕塑正在挣扎活动
        },
        CHESSPIECE_KNIGHT =
        {
            GENERIC = "当然，它是匹马。",		--物品名：骑士雕塑 检查状态：普通状态
            STRUGGLE = "棋子自己在动。",		--物品名：骑士雕塑 检查状态：雕塑正在挣扎活动
        },
        CHESSPIECE_BISHOP =
        {
            GENERIC = "一尊石头主教。",		--物品名：主教雕塑 检查状态：普通状态
            STRUGGLE = "棋子自己在动。",		--物品名：主教雕塑 检查状态：雕塑正在挣扎活动
        },
        CHESSPIECE_MUSE = "嗯……看着眼熟。",		--物品名：女王雕塑
        CHESSPIECE_FORMAL = "在我看来，算不上“高贵”。",		--物品名：国王雕塑
        CHESSPIECE_HORNUCOPIA = "光看着，肚子就叫了。",		--物品名：丰饶角雕塑
        CHESSPIECE_PIPE = "那从来不合我的口味。",		--物品名：泡泡烟斗雕塑
        CHESSPIECE_DEERCLOPS = "总觉得它的目光跟着人。",		--物品名：独眼巨鹿雕塑
        CHESSPIECE_BEARGER = "走近了，才发现它这么大。",		--物品名：熊獾雕塑
        CHESSPIECE_MOOSEGOOSE =
        {
            "呃。太逼真了。",		--物品名：麋鹿鹅雕塑 检查状态：第1条台词变体
        },
        CHESSPIECE_DRAGONFLY = "啊，让我想起些事。不太好的事。",		--物品名：龙蝇雕塑
		CHESSPIECE_MINOTAUR = "现在轮到你被吓得动不了了。",		--物品名：远古守护者雕塑
        CHESSPIECE_BUTTERFLY = "看着挺美，不是吗？",		--物品名：月蛾雕塑
        CHESSPIECE_ANCHOR = "果然和看上去一样沉。",		--物品名：锚雕塑
        CHESSPIECE_MOON = "近来我颇受启发。",		--物品名：“月亮” 雕塑
        CHESSPIECE_CARRAT = "有人赢了。",		--物品名：胡萝卜鼠雕塑
        CHESSPIECE_MALBATROSS = "它不追着人杀的时候，还挺可爱。",		--物品名：邪天翁雕塑
        CHESSPIECE_CRABKING = "看样子，脾气不如麦斯威尔大。",		--物品名：帝王蟹雕塑
        CHESSPIECE_TOADSTOOL = "不能拿来当凳子坐，对吧？",		--物品名：毒菌蟾蜍雕塑
        CHESSPIECE_STALKER = "一副不会动的骨架。",		--物品名：远古织影者雕塑
        CHESSPIECE_KLAUS = "能给我来个“非节日版”的克劳斯吗？",		--物品名：克劳斯雕塑
        CHESSPIECE_BEEQUEEN = "很有雕塑感。",		--物品名：蜂王雕塑
        CHESSPIECE_ANTLION = "蚁狮雕塑。",		--物品名：蚁狮雕塑
        CHESSPIECE_BEEFALO = "这头牛，雕得不错。",		--物品名：皮弗娄牛雕塑
		CHESSPIECE_KITCOON = "这些倒很容易找。",		--物品名：小浣猫雕塑
		CHESSPIECE_CATCOON = "拿它当抓柱正合适。",		--物品名：浣猫雕塑
        CHESSPIECE_MANRABBIT = "想抱抱它，又怕蹭破皮。",		--物品名：兔人雕塑
        CHESSPIECE_GUARDIANPHASE3 = "我更喜欢它这个样子。",		--物品名：天体英雄雕塑
        CHESSPIECE_EYEOFTERROR = "它冷冷地盯着我。",		--物品名：恐怖之眼雕塑
        CHESSPIECE_TWINSOFTERROR = "恐怖之夜里，很不舒服的一场对视。",		--物品名：双子魔眼雕塑
        CHESSPIECE_DAYWALKER = "谁知道他现在在哪。",		--物品名：梦魇疯猪雕塑
        CHESSPIECE_DAYWALKER2 = "这东西该进垃圾堆。",		--物品名：拾荒疯猪雕塑
        CHESSPIECE_DEERCLOPS_MUTATED = "这座雕塑看着有点刺眼。",		--物品名：晶体独眼巨鹿雕塑
        CHESSPIECE_WARG_MUTATED = "就差一口口臭。",		--物品名：附身座狼雕塑
        CHESSPIECE_BEARGER_MUTATED = "不知为何，它比正版更暴躁。",		--物品名：装甲熊獾雕塑
        CHESSPIECE_SHARKBOI = "怎么看，都觉得有几分蹊跷。",		--物品名：大霜鲨雕塑
        CHESSPIECE_WORMBOSS = "它仍让我心有余悸。",		--物品名：巨大洞穴蠕虫雕塑
        CHESSPIECE_YOTS = "淘金者，我一向敬而远之。",		--物品名：镀金洞穴蠕虫雕塑
        CHESSPIECE_WAGBOSS_ROBOT = "设计精妙，做工堪忧。",		--物品名：战争瓦器人雕塑
        CHESSPIECE_WAGBOSS_LUNAR = "月亮看得越久，心情越好。",		--物品名：天体后裔雕塑
        CHESSPIECE_YOTH = "那位骑士，马马虎虎。",		--物品名：镀金骑士雕塑
        CHESSPIECE_VAULT_PILLAR_GUARD = "这个个头偏矮。",		--物品名：远古戍卫塔雕塑
        CHESSPIECE_BATBOSS_SHADOW = "那一次，元气被抽干了。",		--物品名：暗影蝙蝠首领雕像（测试版暂译）
        CHESSPIECE_ROCKYBOSS_SHADOW = "那只龙虾坏了。",		--物品名：暗影石虾首领雕像（测试版暂译）
        CHESSPIECE_WORMBOSS_SHADOW = "我绝不会对它有好感。",		--物品名：暗影蠕虫首领雕像（测试版暂译）
        CHESSPIECE_CHARLIE_BOSS = "她当时绝没安好心。",		--物品名：查理首领雕像（测试版暂译）
        CHESSPIECE_SHROUDEN = "我再也不想见到那东西。",		--物品名：暗影实体雕像（测试版暂译）

        CHESSJUNK1 = "一堆废发条。",		--物品名：损坏的发条装置
        CHESSJUNK2 = "又一堆废发条。",		--物品名：损坏的发条装置
        CHESSJUNK3 = "更多废发条。",		--物品名：损坏的发条装置
		CHESTER = "一只短腿的……箱子，先生。",		--物品名：切斯特
		CHESTER_EYEBONE =
		{
			GENERIC = "它在看我。",		--物品名：眼骨 检查状态：普通状态
			WAITING = "它睡着了。",		--物品名：眼骨 检查状态：正在等待对应跟随生物出现
		},
		COOKEDMANDRAKE = "可怜的小家伙。",		--物品名：熟曼德拉草
		COOKEDMEAT = "烤得透熟。",		--物品名：熟肉
		COOKEDMONSTERMEAT = "只比生吃好上一点。",		--物品名：熟怪物肉
		COOKEDSMALLMEAT = "做熟了。总算不必担心寄生虫。",		--物品名：熟小肉

		COOKPOT =
		{
			COOKING_LONG = "火候未足，再等等。",		--物品名：烹饪锅 检查状态：正在烹饪，剩余时间较长
			COOKING_SHORT = "快了。再等片刻。",		--物品名：烹饪锅 检查状态：正在烹饪，即将完成
			DONE = "成了。可以开动了。",		--物品名：烹饪锅 检查状态：处理已经完成
			EMPTY = "空的。连香气都没有。",		--物品名：烹饪锅 检查状态：内容为空
			BURNT = "锅已经废了。可惜。",		--物品名：烹饪锅 检查状态：已经烧毁
		},
		CORN = "颗粒饱满，糖分不低。",		--物品名：玉米
		CORN_COOKED = "烤过之后，更甜了。",		--物品名：爆米花
		CORN_SEEDS = "一粒子。可作来年的打算。",		--物品名：簇状种子
        CANARY =
		{
			GENERIC = "人工培育的黄色小鸟。",		--物品名：金丝雀 检查状态：普通状态
			HELD = "我没有用力。安静些。",		--物品名：金丝雀 检查状态：正被角色携带
		},
        CANARY_POISONED = "它还有气。也许能救。",		--物品名：金丝雀（中毒）

		CRITTERLAB = "里面藏着什么？",		--物品名：岩石巢穴
        CRITTER_GLOMLING = "这身形很合空气动力学，喵。",		--物品名：小格罗姆
        CRITTER_DRAGONLING = "它钻进我心里了。",		--物品名：小龙蝇
		CRITTER_LAMB = "比它母亲干净些。黏液少。",		--物品名：小钢羊
        CRITTER_PUPPY = "小怪物，生得倒可爱。",		--物品名：小座狼
        CRITTER_KITTEN = "你会是个好助手。我看得出来。",		--物品名：浣猫崽
        CRITTER_PERDLING = "长羽毛的小朋友。",		--物品名：小火鸡
		CRITTER_LUNARMOTHLING = "留着你，为蛾类学研究。",		--物品名：小蛾子
        CRITTER_BULBIN = "你可别背着我腐坏。",		--物品名：芽葱
        CRITTER_EETS = "两足、无毛，必是人。",		--物品名：一吃

		CROW =
		{
			GENERIC = "羽毛蓬乱，叫声难听。",		--物品名：乌鸦 检查状态：普通状态
			HELD = "它不喜欢被握着。",		--物品名：乌鸦 检查状态：正被角色携带
		},
		CUTGRASS = "割下的草。编绳织布都用得上。",		--物品名：采下的草
		CUTREEDS = "芦苇。能编东西，也能消磨时间。",		--物品名：采下的芦苇
		CUTSTONE = "切面平整，手感不错。",		--物品名：石砖
		DEADLYFEAST = "这一餐，代价不小。", 		--物品名：致命盛宴
		DEER =
		{
			GENERIC = "它在看我？……大概没有。",		--物品名：无眼鹿 检查状态：普通状态
			ANTLER = "这副角真漂亮。……失礼了。",		--物品名：无眼鹿 检查状态：长有鹿角
		},
        DEER_ANTLER = "掉得这么干脆，正常么？",		--物品名：鹿角
        DEER_GEMMED = "它被那头野兽操纵着。",		--物品名：无眼鹿
		DEERCLOPS = "大得离谱。不必慌。",		--物品名：独眼巨鹿
		DEERCLOPS_EYEBALL = "这颗眼球，恕我不想碰。",		--物品名：独眼巨鹿眼球
		EYEBRELLAHAT = "它会替佩戴者挡一挡。",		--物品名：眼球伞
		DEPLETED_GRASS =
		{
			GENERIC = "大约是一丛草。",		--物品名：草 检查状态：普通状态
		},
        GOGGLESHAT = "这副护目镜，很衬我。",		--物品名：时髦的护目镜
        DESERTHAT = "挡沙的好东西。",		--物品名：沙漠护目镜
        ANTLIONHAT = "从土里刨出来的成就。",		--物品名：刮地皮头盔
		DEVTOOL = "有培根的味道。奇怪。",		--物品名：开发工具
		DEVTOOL_NODEV = "我挥不动它。力气不够。",		--物品名：开发工具（非开发环境）
		DIRTPILE = "一堆土。……还是别的什么？",		--物品名：可疑的土堆
		DIVININGROD =
		{
			COLD = "信号微弱。方向不明。", 		--物品名：探测杖 检查状态：温度较低
			GENERIC = "某种自动引导装置。", 		--物品名：探测杖 检查状态：普通状态
			HOT = "它疯了一样在响。", 		--物品名：探测杖 检查状态：温度很高
			WARM = "方向对了。", 		--物品名：探测杖 检查状态：温度较暖
			WARMER = "很近了。就在附近。", 		--物品名：探测杖 检查状态：接近目标，探测温度升高
		},
		DIVININGRODBASE =
		{
			GENERIC = "用途待考。", 		--物品名：探测杖底座 检查状态：普通状态
			READY = "缺一把大钥匙。", 		--物品名：探测杖底座 检查状态：已经准备就绪
			UNLOCKED = "机关通了。可以用了。", 		--物品名：探测杖底座 检查状态：已经解锁
		},
		DIVININGRODSTART = "那根杖，值得一看。", 		--物品名：探测杖底座
		DRAGONFLY = "龙蝇。别靠太近。",		--物品名：龙蝇
		ARMORDRAGONFLY = "鳞甲尚温。倒是暖和。",		--物品名：鳞甲
		DRAGON_SCALES = "余温未散。",		--物品名：鳞片
		DRAGONFLYCHEST =
		{
			GENERIC = "仅次于保险箱。很好。",		--物品名：龙鳞宝箱 检查状态：普通状态
            UPGRADED_STACKSIZE = "容量之大，堪称箱中之龙。",		--物品名：龙鳞宝箱 检查状态：已经升级容器堆叠容量
		},
		DRAGONFLYFURNACE =
		{
			HAMMERED = "被砸过。不太对劲。",		--物品名：龙鳞火炉 检查状态：遭锤击后进入受损状态
			GENERIC = "热得多，亮得少。", 		--物品名：龙鳞火炉 检查状态：普通状态
			NORMAL = "它好像在朝我眨眼。", 		--物品名：龙鳞火炉 检查状态：普通形态
			HIGH = "滚烫。退开些。", 		--物品名：龙鳞火炉 检查状态：高等级或高储量状态
		},

        HUTCH = "哈奇·蛋戈鱼，私家侦探。",		--物品名：哈奇
        HUTCH_FISHBOWL =
        {
            GENERIC = "这样的装备，我早想要一件。",		--物品名：星空 检查状态：普通状态
            WAITING = "也许它缺一点科学的助力。",		--物品名：星空 检查状态：正在等待对应跟随生物出现
        },
		LAVASPIT =
		{
			HOT = "唾液还是烫的。",		--物品名：龙蝇唾液 检查状态：温度很高
			COOL = "我称它为“干唾液”。",		--物品名：龙蝇唾液 检查状态：已经冷却
		},
		LAVA_POND = "壮观。……离远些看。",		--物品名：岩浆池
		LAVAE = "太烫，无从下手。",		--物品名：岩浆虫
		LAVAE_COCOON = "冷下来。安静下来。",		--物品名：冷冻虫卵
		LAVAE_PET =
		{
			STARVING = "饿成这样，可怜。",		--物品名：超级可爱岩浆虫 检查状态：极度饥饿
			HUNGRY = "它肚子里在响。",		--物品名：超级可爱岩浆虫 检查状态：处于饥饿状态
			CONTENT = "它很满足。看得出来。",		--物品名：超级可爱岩浆虫 检查状态：宠物状态满足
			GENERIC = "谁是好怪物？……是你，喵。",		--物品名：超级可爱岩浆虫 检查状态：普通状态
		},
		LAVAE_EGG =
		{
			GENERIC = "里面透出一点暖意。",		--物品名：岩浆虫卵 检查状态：普通状态
		},
		LAVAE_EGG_CRACKED =
		{
			COLD = "蛋凉了。得加温。",		--物品名：岩浆虫卵 检查状态：温度较低
			COMFY = "一只蛋能这么惬意，稀奇。",		--物品名：岩浆虫卵 检查状态：温度舒适
		},
		LAVAE_TOOTH = "一枚蛋牙。收着。",		--物品名：岩浆虫尖牙

		DRAGONFRUIT = "这果子，模样奇特。",		--物品名：火龙果
		DRAGONFRUIT_COOKED = "熟了，还是古怪。",		--物品名：熟火龙果
		DRAGONFRUIT_SEEDS = "种子。外壳坚硬。",		--物品名：球茎状种子
		DRAGONPIE = "这一块，很顶饿。",		--物品名：火龙果派
		DRUMSTICK = "可以吃了。不必讲究。",		--物品名：鸟腿
		DRUMSTICK_COOKED = "烤过之后，更香。",		--物品名：炸鸟腿
		DUG_BERRYBUSH = "搬走也无妨。它认土。",		--物品名：浆果丛
		DUG_BERRYBUSH_JUICY = "种在门口，随手可摘。",		--物品名：多汁浆果丛
		DUG_GRASS = "随处可种。",		--物品名：草丛
		DUG_MARSH_BUSH = "得找个地方栽下。",		--物品名：尖刺灌木
		DUG_SAPLING = "先栽进土里再说。",		--物品名：树苗
		DURIAN = "气味失礼。",		--物品名：榴莲
		DURIAN_COOKED = "烤过之后，更臭了。",		--物品名：超臭榴莲
		DURIAN_SEEDS = "一粒子。气味尚可。",		--物品名：脆籽荚
		EARMUFFSHAT = "耳朵暖和了，人就安稳。",		--物品名：兔耳罩
		EGGPLANT = "名不副实。它不是蛋。",		--物品名：茄子
		EGGPLANT_COOKED = "烤过，更不像蛋了。",		--物品名：烤茄子
		EGGPLANT_SEEDS = "种子。留着有用。",		--物品名：漩涡种子

		ENDTABLE =
		{
			BURNT = "烧焦的桌子，烧焦的瓶。",		--物品名：茶几 检查状态：已经烧毁
			GENERIC = "瓶里一枝花。仅此而已。",		--物品名：茶几 检查状态：普通状态
			EMPTY = "空着可惜。该插点什么。",		--物品名：茶几 检查状态：内容为空
			WILTED = "蔫了。水该换了。",		--物品名：茶几 检查状态：花朵已经枯萎
			FRESHLIGHT = "有一点光，夜就不同了。",		--物品名：茶几 检查状态：插着新鲜发光花朵
			OLDLIGHT = "新灯泡，带了吗？", 		--物品名：茶几 检查状态：插着已经枯萎的发光花朵
		},
		DECIDUOUSTREE =
		{
			BURNING = "可惜了这一树好木头。",		--物品名：桦栗树 检查状态：正在燃烧
			BURNT = "我本可以拦下这场火。",		--物品名：桦栗树 检查状态：已经烧毁
			CHOPPED = "就这样。自然也得让步。",		--物品名：桦栗树 检查状态：已经砍伐
			POISON = "动了它的果子，它记仇。",		--物品名：桦栗树 检查状态：桦栗树进入毒化敌对状态
			GENERIC = "阔叶繁密。多半如此。",		--物品名：桦栗树 检查状态：普通状态
		},
		ACORN = "里面有东西。会动的。",		--物品名：桦栗果
        ACORN_SAPLING = "再过些年，就是一棵树。",		--物品名：桦栗树树苗
		ACORN_COOKED = "火候正好。",		--物品名：烤桦栗果
		BIRCHNUTDRAKE = "一颗疯了的坚果。",		--物品名：桦栗果精
		EVERGREEN =
		{
			BURNING = "烧得可惜。",		--物品名：常青树 检查状态：正在燃烧
			BURNT = "这场火，我本可拦下。",		--物品名：常青树 检查状态：已经烧毁
			CHOPPED = "让开吧，自然。",		--物品名：常青树 检查状态：已经砍伐
			GENERIC = "松针厚密，气味清冽。",		--物品名：常青树 检查状态：普通状态
		},
		EVERGREEN_SPARSE =
		{
			BURNING = "烧了，可惜。",		--物品名：臃肿常青树 检查状态：正在燃烧
			BURNT = "我本可拦下。",		--物品名：臃肿常青树 检查状态：已经烧毁
			CHOPPED = "树倒了。收工。",		--物品名：臃肿常青树 检查状态：已经砍伐
			GENERIC = "这棵树，连球果都没有。",		--物品名：臃肿常青树 检查状态：普通状态
		},
		TWIGGYTREE =
		{
			BURNING = "枝条烧得噼啪响。",		--物品名：多枝树 检查状态：正在燃烧
			BURNT = "只剩焦炭了。",		--物品名：多枝树 检查状态：已经烧毁
			CHOPPED = "枝条归我了。",		--物品名：多枝树 检查状态：已经砍伐
			GENERIC = "满树细枝，编筐正好。",		--物品名：多枝树 检查状态：普通状态
			DISEASED = "病得比寻常更重。", 		--物品名：多枝树 检查状态：已经患病
		},
		TWIGGY_NUT_SAPLING = "它自己能长。不必扶。",		--物品名：多枝树苗
        TWIGGY_OLD = "这棵老树，气力不济。",		--物品名：老枝桠树
		TWIGGY_NUT = "里面困着一棵想出来的树。",		--物品名：多枝树种
		EYEPLANT = "有东西在盯着我。",		--物品名：眼球草
		INSPECTSELF = "四肢俱全。毛也还在。",		--物品名：角色自身
		FARMPLOT =
		{
			GENERIC = "该种点什么了。",		--物品名：农场田地 检查状态：普通状态
			GROWING = "长吧。我不催你。",		--物品名：农场田地 检查状态：正在生长
			NEEDSFERTILIZER = "地力不足。该施肥。",		--物品名：农场田地 检查状态：土地需要施肥
			BURNT = "只剩灰，长不出庄稼。",		--物品名：农场田地 检查状态：已经烧毁
		},
		FEATHERHAT = "扮成鸟。毛很软，喵。",		--物品名：羽毛帽
		FEATHER_CROW = "乌鸦的黑羽。",		--物品名：黑色羽毛
		FEATHER_ROBIN = "红雀的羽毛。颜色不错。",		--物品名：红色羽毛
		FEATHER_ROBIN_WINTER = "雪雀的蓝羽。",		--物品名：蓝色羽毛
		FEATHER_CANARY = "金丝雀的羽毛。",		--物品名：黄色羽毛
		FEATHERPENCIL = "羽毛笔写的字，自然工整。",		--物品名：羽毛笔
        COOKBOOK = "我对知识，从不嫌饱。",		--物品名：烹饪指南
		FEM_PUPPET = "她被囚住了。", 		--物品名：女性角色傀儡
		FIREFLIES =
		{
			GENERIC = "抓到一只，就是一盏灯。",		--物品名：萤火虫 检查状态：普通状态
			HELD = "口袋里装着光。",		--物品名：萤火虫 检查状态：正被角色携带
		},
		FIREHOUND = "它身上有火光。",		--物品名：火焰猎犬
		FIREPIT =
		{
			EMBERS = "趁余烬未灭，添些柴。",		--物品名：火坑 检查状态：只剩余烬
			GENERIC = "能挡一挡黑。",		--物品名：火坑 检查状态：普通状态
			HIGH = "火被圈住了。很好。",		--物品名：火坑 检查状态：高等级或高储量状态
			LOW = "火头弱了。",		--物品名：火坑 检查状态：低等级或低储量状态
			NORMAL = "暖得刚好，喵。",		--物品名：火坑 检查状态：普通形态
			OUT = "熄了。还能再点起来。",		--物品名：火坑 检查状态：火焰已经熄灭
		},
		COLDFIREPIT =
		{
			EMBERS = "余烬还红。添柴。",		--物品名：吸热火坑 检查状态：只剩余烬
			GENERIC = "能驱黑，也能消暑。",		--物品名：吸热火坑 检查状态：普通状态
			HIGH = "火被圈住了。放心。",		--物品名：吸热火坑 检查状态：高等级或高储量状态
			LOW = "火头弱下去一些。",		--物品名：吸热火坑 检查状态：低等级或低储量状态
			NORMAL = "凉意正好。",		--物品名：吸热火坑 检查状态：普通形态
			OUT = "熄了。我再点一次。",		--物品名：吸热火坑 检查状态：火焰已经熄灭
		},
		FIRESTAFF = "点着世界？我无意如此。",		--物品名：火魔杖
		FIRESUPPRESSOR =
		{
			ON = "它开始喷雪了。",		--物品名：雪球发射器 检查状态：处于开启状态
			OFF = "静下来了。",		--物品名：雪球发射器 检查状态：处于关闭状态
			LOWFUEL = "燃料见底了。",		--物品名：雪球发射器 检查状态：燃料即将耗尽
		},

		FISH = "新鲜。今晚有口福了，喵。",		--物品名：鱼
		FISHINGROD = "钩、线、杆。齐了。",		--物品名：淡水钓竿
		FISHSTICKS = "裹粉炸过。能饱。",		--物品名：炸鱼排
		FISHTACOS = "外皮松脆。不错。",		--物品名：鱼肉玉米卷
		FISH_COOKED = "烤得恰到好处。",		--物品名：熟鱼
		FLINT = "燧石。边口很利。",		--物品名：燧石
		FLOWER =
		{
            GENERIC = "好看。可惜有股汗味。",		--物品名：花 检查状态：普通状态
            ROSE = "插在耳边，衬我的毛色。",		--物品名：花 检查状态：玫瑰花变体
        },
        FLOWER_WITHERED = "太阳晒得不够。",		--物品名：枯萎的花
		FLOWERHAT = "戴在头上，香气随身，喵。",		--物品名：花环
		FLOWER_EVIL = "这花，透着邪气。",		--物品名：邪恶花
		FOLIAGE = "一把蕨叶。",		--物品名：蕨叶
		FOOTBALLHAT = "运动之物，我不感兴趣。",		--物品名：橄榄球头盔
        FOSSIL_PIECE = "骨头。该把它们拼回去。",		--物品名：化石碎片
        FOSSIL_STALKER =
        {
			GENERIC = "碎片还没凑齐。",		--物品名：奇异的骨架 检查状态：普通状态
			FUNNY = "直觉说，拼错了一块。",		--物品名：奇异的骨架 检查状态：化石拼装方式错误
			COMPLETE = "它活了。……不，并没有。",		--物品名：奇异的骨架 检查状态：已经完整组装
        },
        STALKER = "骨与影，长成了一体。",		--物品名：复活的骨架
        STALKER_ATRIUM = "何必长到这么大。",		--物品名：远古织影者
        STALKER_MINION = "小心脚踝。",		--物品名：编织暗影
        THURIBLE = "金石之气。不太好闻。",		--物品名：暗影香炉
        ATRIUM_OVERGROWTH = "这些符号，我一个也不识。",		--物品名：远古方尖碑
		FROG =
		{
			DEAD = "死了。不必再补一刀。",		--物品名：青蛙 检查状态：已经死亡
			GENERIC = "模样倒有几分可爱。",		--物品名：青蛙 检查状态：普通状态
			SLEEPING = "睡相不错。别吵它。",		--物品名：青蛙 检查状态：正在睡眠
		},
		FROGGLEBUNWICH = "蛙腿三明治。粗食。",		--物品名：蛙腿三明治
		FROGLEGS = "听说这是道好菜。",		--物品名：蛙腿
		FROGLEGS_COOKED = "像鸡肉。仅此而已。",		--物品名：熟蛙腿
		FRUITMEDLEY = "果香扑鼻。甜得直接。",		--物品名：水果圣代
		FURTUFT = "黑白毛。摸着应当软，喵。",		--物品名：毛丛
		GEARS = "齿轮。机械的关节。",		--物品名：齿轮
		GHOST = "我不信鬼神。你冒犯我了。",		--物品名：幽灵
		GOLDENAXE = "斧头而已，镀了金。",		--物品名：黄金斧头
		GOLDENPICKAXE = "金子软。这不合常理。",		--物品名：黄金鹤嘴锄
		GOLDENPITCHFORK = "一把叉子，也做得这般讲究。",		--物品名：黄金干草叉
		GOLDENSHOVEL = "挖个坑。我有分寸。",		--物品名：黄金铲子
		GOLDNUGGET = "不能吃。倒是好看。",		--物品名：金块
		GRASS =
		{
			BARREN = "地力耗尽。需肥。",		--物品名：草 检查状态：资源枯竭，需要施肥
			WITHERED = "热成这样，长不回来了。",		--物品名：草 检查状态：已经枯萎
			BURNING = "烧得这么快。",		--物品名：草 检查状态：正在燃烧
			GENERIC = "一丛草。用处不少。",		--物品名：草 检查状态：普通状态
			PICKED = "正当时被采走了。可惜。",		--物品名：草 检查状态：已经采集
			DISEASED = "它病着。看得出来。", 		--物品名：草 检查状态：已经患病
			DISEASING = "有点不对。气息变了。", 		--物品名：草 检查状态：正在进入患病阶段
		},
		GRASSGEKKO =
		{
			GENERIC = "长着叶子的蜥蜴。稀奇。",		--物品名：草壁虎 检查状态：普通状态
			DISEASED = "它病得不轻。", 		--物品名：草壁虎 检查状态：已经患病
		},
		GREEN_CAP = "看着寻常。未必无害。",		--物品名：采摘的绿蘑菇
		GREEN_CAP_COOKED = "变了。气味不同了。",		--物品名：熟绿蘑菇
		GREEN_MUSHROOM =
		{
			GENERIC = "蘑菇。伞盖很正。",		--物品名：绿蘑菇 检查状态：普通状态
			INGROUND = "还埋在土里。",		--物品名：绿蘑菇 检查状态：仍埋在地下
			PICKED = "还会长回来么？",		--物品名：绿蘑菇 检查状态：已经采集
		},
		GUNPOWDER = "像胡椒粉。可别弄错。",		--物品名：火药
		HAMBAT = "这不利于卫生。",		--物品名：火腿棒
		HAMMER = "让开。该敲点东西了。",		--物品名：锤子
		HEALINGSALVE = "刺痛便是起效。忍着。",		--物品名：治疗药膏
		HEATROCK =
		{
			FROZEN = "比冰还冷。别握太久。",		--物品名：暖石 检查状态：已经冻结
			COLD = "石头是凉的。寻常。",		--物品名：暖石 检查状态：温度较低
			GENERIC = "温度由我调。",		--物品名：暖石 检查状态：普通状态
			WARM = "温温的。抱在怀里正好。",		--物品名：暖石 检查状态：温度较暖
			HOT = "烫得舒服，喵。",		--物品名：暖石 检查状态：温度很高
		},
		HOME = "这里有人住。",		--物品名：家园目标
		HOMESIGN =
		{
			GENERIC = "写着“你在这里”。",		--物品名：木牌 检查状态：普通状态
            UNWRITTEN = "牌面空着。",		--物品名：木牌 检查状态：尚未写入文字
			BURNT = "“不要玩火柴。”……教训。",		--物品名：木牌 检查状态：已经烧毁
		},
		ARROWSIGN_POST =
		{
			GENERIC = "指向“那个方向”。",		--物品名：指路木牌 检查状态：普通状态
            UNWRITTEN = "字迹全无。",		--物品名：指路木牌 检查状态：尚未写入文字
			BURNT = "“不要玩火柴。”可惜。",		--物品名：指路木牌 检查状态：已经烧毁
		},
		ARROWSIGN_PANEL =
		{
			GENERIC = "箭头指着那头。",		--物品名：指路木牌 检查状态：普通状态
            UNWRITTEN = "空牌。等谁写字。",		--物品名：指路木牌 检查状态：尚未写入文字
			BURNT = "只剩下焦木。",		--物品名：指路木牌 检查状态：已经烧毁
		},
		HONEY = "蜜色清亮。好东西。",		--物品名：蜂蜜
		HONEYCOMB = "蜂曾住过。巢还在。",		--物品名：蜜脾
		HONEYHAM = "甜咸相济。不错。",		--物品名：蜜汁火腿
		HONEYNUGGETS = "像鸡肉。但我怀疑不是。",		--物品名：蜜汁卤肉
		HORN = "一吹，像有牛群在里头。",		--物品名：牛角
		HOUND = "不过是条狗。退下。",		--物品名：猎犬
		HOUNDCORPSE =
		{
			GENERIC = "这味道，不算体面。",		--物品名：猎犬尸体 检查状态：普通状态
			BURNING = "烧着。暂时安全。",		--物品名：猎犬尸体 检查状态：正在燃烧
			REVIVING = "它要起来了。后退。",		--物品名：猎犬尸体 检查状态：尸体正在复活
		},
		HOUNDBONE = "一根骨头。别多想。",		--物品名：犬骨
		HOUNDMOUND = "不去惹它的主人。",		--物品名：猎犬丘
		ICEBOX = "冷，如今归我管。",		--物品名：冰箱
		ICEHAT = "戴上它，冷静些。",		--物品名：冰帽
		ICEHOUND = "每个季节都有猎犬？",		--物品名：寒冰猎犬
		INSANITYROCK =
		{
			ACTIVE = "清醒的我，也得认它。",		--物品名：方尖碑 检查状态：正在运作
			INACTIVE = "更像金字塔，不像方尖碑。",		--物品名：方尖碑 检查状态：当前未激活
		},
		JAMMYPRESERVES = "该找个罐子装起来。",		--物品名：果酱

		KABOBS = "棍上串着的午饭。",		--物品名：肉串
		KILLERBEE =
		{
			GENERIC = "杀人蜂。别招惹。",		--物品名：杀人蜂 检查状态：普通状态
			HELD = "它不温和。别乱动。",		--物品名：杀人蜂 检查状态：正被角色携带
		},
		KNIGHT = "那边。有东西在动。",		--物品名：发条骑士
		KOALEFANT_SUMMER = "肉应当不差。",		--物品名：考拉象
		KOALEFANT_WINTER = "又暖，肉又厚。",		--物品名：考拉象
		KOALEFANT_CARCASS = "死了倒也显得憨。",		--物品名：考拉象尸体
		KRAMPUS = "它想动我的东西。",		--物品名：坎普斯
		KRAMPUS_SACK = "满是黏液。恕我不碰。",		--物品名：坎普斯背包
		LEIF = "很大。仅此而已。",		--物品名：树精守卫
		LEIF_SPARSE = "高大，但不难对付。",		--物品名：树精守卫
		LIGHTER  = "她的打火机。她信这个。",		--物品名：薇洛的打火机
		LIGHTNING_ROD =
		{
			CHARGED = "雷已蓄满。等我用。",		--物品名：避雷针 检查状态：已经充能
			GENERIC = "把天雷引下来。",		--物品名：避雷针 检查状态：普通状态
		},
		LIGHTNINGGOAT =
		{
			GENERIC = "咩。……它在看我。",		--物品名：伏特羊 检查状态：普通状态
			CHARGED = "它不喜欢挨雷劈。",		--物品名：伏特羊 检查状态：已经充能
		},
		LIGHTNINGGOATHORN = "像一根小避雷针。",		--物品名：伏特羊角
		GOATMILK = "好喝。还带着电。",		--物品名：带电的羊奶
		LITTLE_WALRUS = "长大之后，就没这么天真了。",		--物品名：小海象
		LIVINGLOG = "它在着急。看得出来。",		--物品名：活木头
		LOG =
		{
			BURNING = "木头烫手。别急着拿。",		--物品名：木头 检查状态：正在燃烧
			GENERIC = "又大又沉。好料。",		--物品名：木头 检查状态：普通状态
		},
		LUCY = "露西。比我想的更漂亮。",		--物品名：露西斧
		LUREPLANT = "它美得有杀气。",		--物品名：食人花
		LUREPLANTBULB = "可以自己种一园子肉了。",		--物品名：食人花种子
		MALE_PUPPET = "他被困在里面。", 		--物品名：男性角色傀儡

		MANDRAKE_ACTIVE = "拔了它。立刻。",		--物品名：曼德拉草
		MANDRAKE_PLANTED = "这草，传闻不少。",		--物品名：曼德拉草
		MANDRAKE = "它的根，药性古怪。",		--物品名：曼德拉草

        MANDRAKESOUP = "它不会再醒了。",		--物品名：曼德拉草汤
        MANDRAKE_COOKED = "煮熟了，就不那么怪了。",		--物品名：熟曼德拉草
        MAPSCROLL = "空地图。用处有限。",		--物品名：地图卷轴
        MARBLE = "大理石。很体面。",		--物品名：大理石
        MARBLEBEAN = "拿家里老牛换来的。",		--物品名：大理石豌豆
        MARBLEBEAN_SAPLING = "上面刻着些东西。",		--物品名：大理石芽
        MARBLESHRUB = "倒也有几分道理。",		--物品名：大理石灌木
        MARBLEPILLAR = "这个，我用得上。",		--物品名：大理石柱
        MARBLETREE = "斧子砍不倒它。",		--物品名：大理石树
        MARSH_BUSH =
        {
			BURNT = "少了一片要担心的荆棘。",		--物品名：尖刺灌木 检查状态：已经烧毁
            BURNING = "刺烧得很快。",		--物品名：尖刺灌木 检查状态：正在燃烧
            GENERIC = "满是刺。别用爪子碰。",		--物品名：尖刺灌木 检查状态：普通状态
            PICKED = "有刺。我记住了。",		--物品名：尖刺灌木 检查状态：已经采集
        },
        BURNT_MARSH_BUSH = "烧得干净。",		--物品名：尖刺灌木
        MARSH_PLANT = "一株湿地植物。",		--物品名：植物
        MARSH_TREE =
        {
            BURNING = "刺和火。别过去。",		--物品名：针刺树 检查状态：正在燃烧
            BURNT = "只剩焦木和刺。",		--物品名：针刺树 检查状态：已经烧毁
            CHOPPED = "刺少了许多。",		--物品名：针刺树 检查状态：已经砍伐
            GENERIC = "那些刺，很利。",		--物品名：针刺树 检查状态：普通状态
        },
        MAXWELL = "那个人，我不喜欢。",		--物品名：麦斯威尔
        MAXWELLHEAD = "连毛孔都看得一清二楚。",		--物品名：麦斯威尔的头
        MAXWELLLIGHT = "它怎么亮起来的？",		--物品名：麦斯威尔灯
        MAXWELLLOCK = "一个钥匙孔。仅此而已。",		--物品名：梦魇锁
        MAXWELLTHRONE = "那座位，坐着不会舒服。",		--物品名：梦魇王座
        MEAT = "尚可入口。",		--物品名：肉
        MEATBALLS = "不过是一团肉。能填肚子。",		--物品名：肉丸
        MEATRACK =
        {
            DONE = "干了。可以收了。",		--物品名：晾肉架 检查状态：处理已经完成
            DRYING = "风干要些时候。",		--物品名：晾肉架 检查状态：肉类正在晾晒
            DRYINGINRAIN = "下雨了。干得更慢。",		--物品名：晾肉架 检查状态：雨中仍挂着肉类，晾晒暂停
            GENERIC = "该挂些肉上去了。",		--物品名：晾肉架 检查状态：普通状态
            BURNT = "架子烧没了。",		--物品名：晾肉架 检查状态：已经烧毁
            DONE_NOTMEAT = "严格说，这叫“干燥”。",		--物品名：晾肉架 检查状态：非肉类晾晒已经完成
            DRYING_NOTMEAT = "风干算不上科学。",		--物品名：晾肉架 检查状态：非肉类正在晾晒
            DRYINGINRAIN_NOTMEAT = "雨，改天再来。",		--物品名：晾肉架 检查状态：雨中仍挂着非肉类，晾晒暂停
        },
        MEAT_DRIED = "干透了。收好。",		--物品名：肉干
        MERM = "腥气十足。站远些。",		--物品名：鱼人
        MERMHEAD =
        {
            GENERIC = "整天都得闻这个。",		--物品名：鱼人头 检查状态：普通状态
            BURNT = "烧过之后，更糟。",		--物品名：鱼人头 检查状态：已经烧毁
        },
        MERMHOUSE =
        {
            GENERIC = "谁会住这里？",		--物品名：漏雨的小屋 检查状态：普通状态
            BURNT = "如今无处可住。",		--物品名：漏雨的小屋 检查状态：已经烧毁
        },
        MINERHAT = "光戴在头上，手就空出来了。",		--物品名：矿工帽
        MONKEY = "好奇心太重的小东西。",		--物品名：穴居猴
        MONKEYBARREL = "它刚才动了么？",		--物品名：穴居猴桶
        MONSTERLASAGNA = "这东西冒犯了常理。",		--物品名：怪物千层饼
        FLOWERSALAD = "一碗绿叶。清淡。",		--物品名：花沙拉
        ICECREAM = "冰淇淋。我要一勺，喵。",		--物品名：冰淇淋
        WATERMELONICLE = "冻西瓜。解暑。",		--物品名：西瓜冰棍
        TRAILMIX = "干果。还算健康。",		--物品名：什锦干果
        HOTCHILI = "辣得能喷火。",		--物品名：辣椒炖肉
        GUACAMOLE = "据说这是阿伏伽德罗的最爱。",		--物品名：鳄梨酱
        MONSTERMEAT = "这东西不该进我的嘴。",		--物品名：怪物肉
        MONSTERMEAT_DRIED = "肉干，气味可疑。",		--物品名：怪物肉干
        MOOSE = "鹿身鹅喙。造物真是不讲章法。",		--物品名：麋鹿鹅

        MOOSE_NESTING_GROUND = "巢址。雏鸟就安置在这里。",		--物品名：麋鹿鹅巢址
        MOOSEEGG = "像受激的电子，急着逃逸。",		--物品名：麋鹿鹅蛋
        MOSSLING = "看来你确实不是电子。",		--物品名：麋鹿鹅幼崽
        FEATHERFAN = "扇风，降温。",		--物品名：羽毛扇
        MINIFAN = "风从背后加倍吹来。",		--物品名：旋转的风扇
        GOOSE_FEATHER = "绒毛。手感不错，喵。",		--物品名：麋鹿鹅羽毛
        STAFF_TORNADO = "旋转的毁灭。握稳些。",		--物品名：天气风向标
        MOSQUITO =
        {
            GENERIC = "吸血的虫子。讨厌。",		--物品名：蚊子 检查状态：普通状态
            HELD = "这血……是我的吧。",		--物品名：蚊子 检查状态：正被角色携带
        },
        MOSQUITOSACK = "也许是别人的血。……别问。",		--物品名：蚊子血囊
        MOUND =
        {
            DUG = "或许，他罪有应得。",		--物品名：坟墓 检查状态：已经被挖开
            GENERIC = "下面多半藏着不少好东西。",		--物品名：坟墓 检查状态：普通状态
        },
        NIGHTLIGHT = "这光，阴森得不像话。",		--物品名：暗夜灯
        NIGHTMAREFUEL = "这东西，实在古怪。",		--物品名：噩梦燃料
        NIGHTSWORD = "谁造的？……不必深究。",		--物品名：暗夜剑
        NITRE = "硝石。我不是地质学家。",		--物品名：硝石
        ONEMANBAND = "该给它配一只牛铃。",		--物品名：独奏乐器
        OASISLAKE =
        {
            GENERIC = "是海市蜃楼吗？",		--物品名：湖泊 检查状态：普通状态
            EMPTY = "干得像块骨头。",		--物品名：湖泊 检查状态：内容为空
        },
        PANDORASCHEST = "里面或许是珍宝，或许是灾祸。",		--物品名：华丽箱子
        PANFLUTE = "给动物们吹一支小夜曲。",		--物品名：排箫
        PAPYRUS = "几张纸。",		--物品名：莎草纸
        WAXPAPER = "蜡纸。防水，实用。",		--物品名：蜡纸
        PENGUIN = "繁殖的季节到了。",		--物品名：企鸥
        PERD = "蠢鸟。离浆果远些。",		--物品名：火鸡
        PEROGIES = "味道相当不错。",		--物品名：波兰水饺
        PETALS = "花归我了，喵。",		--物品名：花瓣
        PETALS_EVIL = "这些，我不太想碰。",		--物品名：深色花瓣
        PHLEGM = "浓稠，滑腻，带咸味。",		--物品名：脓鼻涕
        PICKAXE = "形状很贴切，不是吗。",		--物品名：鹤嘴锄
        PIGGYBACK = "小猪回它的“家”了。",		--物品名：猪皮包
        PIGHEAD =
        {
            GENERIC = "像是献给野兽的供品。",		--物品名：猪头 检查状态：普通状态
            BURNT = "外焦里生。",		--物品名：猪头 检查状态：已经烧毁
        },
        PIGHOUSE =
        {
            FULL = "窗上贴着一只鼻子。",		--物品名：猪屋 检查状态：内容已满
            GENERIC = "这些猪的屋子，倒不赖。",		--物品名：猪屋 检查状态：普通状态
            LIGHTSOUT = "出来。我知道你在里面。",		--物品名：猪屋 检查状态：屋内已经熄灯
            BURNT = "现在不那么舒服了吧。",		--物品名：猪屋 检查状态：已经烧毁
        },
        PIGKING = "气味不佳。离远些。",		--物品名：猪王
        PIGMAN =
        {
            DEAD = "该通知它的家人。",		--物品名：猪人 检查状态：已经死亡
            FOLLOWER = "你是我的随从之一。",		--物品名：猪人 检查状态：已经成为当前角色的跟随者
            GENERIC = "他们有些吓人。",		--物品名：猪人 检查状态：普通状态
            GUARD = "站得很严肃。",		--物品名：猪人 检查状态：正在守卫岗位
            WEREPIG = "这可不是友善的猪。",		--物品名：猪人 检查状态：猪人处于疯猪形态
        },
        PIGSKIN = "上面还带着尾巴。",		--物品名：猪皮
        PIGTENT = "闻着像培根。",		--物品名：猪人帐篷
        PIGTORCH = "看着倒惬意。",		--物品名：猪火炬
        PINECONE = "里面有一棵小树，正努力要长出来。",		--物品名：松果
        PINECONE_SAPLING = "它很快会成材。",		--物品名：常青树苗
        LUMPY_SAPLING = "这树是怎么繁殖的？",		--物品名：臃肿树苗
        PITCHFORK = "只差一群暴民了。",		--物品名：干草叉
        PLANTMEAT = "卖相不佳。",		--物品名：叶肉
        PLANTMEAT_COOKED = "至少还是热的。",		--物品名：熟叶肉
        PLANT_NORMAL =
        {
            GENERIC = "枝叶茂盛。",		--物品名：农作物 检查状态：普通状态
            GROWING = "长得真慢。",		--物品名：农作物 检查状态：正在生长
            READY = "嗯。可以摘了。",		--物品名：农作物 检查状态：已经准备就绪
            WITHERED = "是热死的。",		--物品名：农作物 检查状态：已经枯萎
        },
        POMEGRANATE = "像一颗异星的大脑。",		--物品名：石榴
        POMEGRANATE_COOKED = "算得上一道好菜。",		--物品名：切片熟石榴
        POMEGRANATE_SEEDS = "一颗种子。",		--物品名：风刮来的种子
        POND = "深不见底。",		--物品名：池塘
        POOP = "肥料。多多益善。",		--物品名：粪肥
        FERTILIZER = "一桶粪便。别洒了。",		--物品名：便便桶
        PUMPKIN = "和我的头一样大。",		--物品名：南瓜
        PUMPKINCOOKIE = "漂亮的南瓜饼。",		--物品名：南瓜饼干
        PUMPKIN_COOKED = "怎么没变成馅饼？",		--物品名：烤南瓜
        PUMPKIN_LANTERN = "……真可怕。",		--物品名：南瓜灯
        PUMPKIN_SEEDS = "一颗种子。",		--物品名：尖种子
        PURPLEAMULET = "它在低声对我说。",		--物品名：梦魇护符
        PURPLEGEM = "宇宙的奥秘，封在里面。",		--物品名：紫宝石
        RABBIT =
        {
            GENERIC = "它在找胡萝卜。",		--物品名：兔子 检查状态：普通状态
            HELD = "安静些。你归我管。",		--物品名：兔子 检查状态：正被角色携带
        },
        RABBITHOLE =
        {
            GENERIC = "通往兔子的国度。",		--物品名：兔洞 检查状态：普通状态
            SPRING = "本季，兔子国不开放。",		--物品名：兔洞 检查状态：春季状态
        },
        RAINOMETER =
        {
            GENERIC = "测雨的仪器。",		--物品名：雨量计 检查状态：普通状态
            BURNT = "测量部分化成一缕青烟。",		--物品名：雨量计 检查状态：已经烧毁
        },
        RAINCOAT = "让雨待在它该待的地方。身体之外。",		--物品名：雨衣
        RAINHAT = "会压乱我的头发。……仅此一点。",		--物品名：雨帽
        RATATOUILLE = "纤维倒是充足。",		--物品名：蔬菜杂烩
        RAZOR = "石片绑在棍上。为了体面。",		--物品名：剃刀
        REDGEM = "暖色的光。",		--物品名：红宝石
        RED_CAP = "气味有些怪。",		--物品名：采摘的红蘑菇
        RED_CAP_COOKED = "熟了。与生的截然不同……",		--物品名：熟红蘑菇
        RED_MUSHROOM =
        {
            GENERIC = "是蘑菇。",		--物品名：红蘑菇 检查状态：普通状态
            INGROUND = "它还在睡。",		--物品名：红蘑菇 检查状态：仍埋在地下
            PICKED = "不知道还会不会再长。",		--物品名：红蘑菇 检查状态：已经采集
        },
        REEDS =
        {
            BURNING = "烧得很旺。",		--物品名：芦苇 检查状态：正在燃烧
            GENERIC = "一簇芦苇。",		--物品名：芦苇 检查状态：普通状态
            PICKED = "有用的都摘下来了。",		--物品名：芦苇 检查状态：已经采集
        },
        RELIC = "远古的家什。",		--物品名：遗物
        RUINS_RUBBLE = "这个还能修。",		--物品名：破损遗物
        RUBBLE = "只是碎石。",		--物品名：碎石
        RESEARCHLAB =
        {
            GENERIC = "它把东西拆成最基本的成分。",		--物品名：科学机器 检查状态：普通状态
            BURNT = "现在做不了研究了。",		--物品名：科学机器 检查状态：已经烧毁
        },
        RESEARCHLAB2 =
        {
            GENERIC = "比上一台更像样。",		--物品名：炼金引擎 检查状态：普通状态
            BURNT = "再多的学问也救不了它。",		--物品名：炼金引擎 检查状态：已经烧毁
        },
        RESEARCHLAB3 =
        {
            GENERIC = "我造出了什么？",		--物品名：暗影操控器 检查状态：普通状态
            BURNT = "不管原是什么，都烧尽了。",		--物品名：暗影操控器 检查状态：已经烧毁
        },
        RESEARCHLAB4 =
        {
            GENERIC = "谁会起这样的名字。",		--物品名：灵子分解器 检查状态：普通状态
            BURNT = "火并没有解决命名的问题……",		--物品名：灵子分解器 检查状态：已经烧毁
        },
        RESURRECTIONSTATUE =
        {
            GENERIC = "好一位体面的恶魔。",		--物品名：肉块雕像 检查状态：普通状态
            BURNT = "没用了。",		--物品名：肉块雕像 检查状态：已经烧毁
        },
        RESURRECTIONSTONE = "碰一碰石台，总归不亏。",		--物品名：试金石
        ROBIN =
        {
            GENERIC = "这算不算冬天结束了？",		--物品名：红雀 检查状态：普通状态
            HELD = "它喜欢我的口袋。",		--物品名：红雀 检查状态：正被角色携带
        },
        ROBIN_WINTER =
        {
            GENERIC = "寒荒之地，也有活物。",		--物品名：雪雀 检查状态：普通状态
            HELD = "这么柔软，喵。",		--物品名：雪雀 检查状态：正被角色携带
        },
        ROBOT_PUPPET = "被困住了。", 		--物品名：机器人角色傀儡
        ROCK_LIGHT =
        {
            GENERIC = "石皮裹着的熔岩坑。",		--物品名：熔岩坑 检查状态：普通状态
            OUT = "看起来很脆。",		--物品名：熔岩坑 检查状态：火焰已经熄灭
            LOW = "熔岩正在结成石皮。",		--物品名：熔岩坑 检查状态：低等级或低储量状态
            NORMAL = "暖得正好，喵。",		--物品名：熔岩坑 检查状态：普通形态
        },
        CAVEIN_BOULDER =
        {
            GENERIC = "这个，我举得起来。",		--物品名：岩石 检查状态：普通状态
            RAISED = "太远了，够不着。",		--物品名：岩石 检查状态：洞穴落石仍在升起阶段
        },
        ROCK = "口袋装不下它。",		--物品名：岩石
        PETRIFIED_TREE = "看来它是被吓僵的。",		--物品名：石化树
        ROCK_PETRIFIED_TREE = "看着让人不安。",		--物品名：石化树
        ROCK_PETRIFIED_TREE_OLD = "看着让人不安。",		--物品名：旧石化树岩块
        ROCK_ICE =
        {
            GENERIC = "见着你，凉快。",		--物品名：迷你冰川 检查状态：普通状态
            MELTED = "再冻上之前，没什么用处。",		--物品名：迷你冰川 检查状态：已经融化
        },
        ROCK_ICE_MELTED = "再冻上之前，没什么用处。",		--物品名：融化的迷你冰川
        ICE = "见着你，凉快。",		--物品名：冰
        ROCKS = "这些能做出点东西。",		--物品名：石头
        ROOK = "攻城的车。",		--物品名：发条战车
        ROPE = "一截短绳。",		--物品名：绳子
        ROTTENEGG =
        {
            GENERIC = "……臭得过分。",		--物品名：腐烂鸟蛋 检查状态：普通状态
            CAN_PROCESS = "处理成养分，也算归宿。",		--物品名：腐烂鸟蛋 检查状态：可放入堆肥设施处理
        },
        ROYAL_JELLY = "给捕食者灌了些力量。",		--物品名：蜂王浆
        JELLYBEAN = "一半是果冻，一半是豌豆。",		--物品名：彩虹糖豆
        SADDLE_BASIC = "有了它，就能骑那些有味的家伙。",		--物品名：鞍具
        SADDLE_RACE = "这鞍具，真会飞。",		--物品名：闪亮鞍具
        SADDLE_WAR = "唯一的问题是鞍疮。",		--物品名：战争鞍具
        SADDLEHORN = "用来卸鞍。",		--物品名：鞍角
        SALTLICK = "要舔多久才中和？",		--物品名：舔盐块
        BRUSH = "牛会喜欢这个。",		--物品名：刷子
        SANITYROCK =
        {
            ACTIVE = "这石头，疯得厉害。",		--物品名：方尖碑 检查状态：正在运作
            INACTIVE = "其余的部分去了哪里？",		--物品名：方尖碑 检查状态：当前未激活
        },
        SAPLING =
        {
            BURNING = "烧得很快。",		--物品名：树苗 检查状态：正在燃烧
            WITHERED = "给它降降温，或许还有救。",		--物品名：树苗 检查状态：已经枯萎
            GENERIC = "小树苗，挺可爱。",		--物品名：树苗 检查状态：普通状态
            PICKED = "它已经受过教训。",		--物品名：树苗 检查状态：已经采集
            DISEASED = "看着不太舒服。", 		--物品名：树苗 检查状态：已经患病
            DISEASING = "有些地方，不太对劲。", 		--物品名：树苗 检查状态：正在进入患病阶段
        },
        SCARECROW =
        {
            GENERIC = "把稻草人打扮好，乌鸦就不来了。",		--物品名：友善的稻草人 检查状态：普通状态
            BURNING = "有人让那稻草人吃上了火。",		--物品名：友善的稻草人 检查状态：正在燃烧
            BURNT = "有人谋杀了那个稻草人。",		--物品名：友善的稻草人 检查状态：已经烧毁
        },
        SCULPTINGTABLE=
        {
            EMPTY = "可以用它雕一尊石像。",		--物品名：陶轮 检查状态：内容为空
            BLOCK = "坯料就绪。",		--物品名：陶轮 检查状态：当前雕刻材料为石块
            SCULPTURE = "称得上杰作。",		--物品名：陶轮 检查状态：当前正在雕刻塑像
            BURNT = "烧透了。",		--物品名：陶轮 检查状态：已经烧毁
        },
        SCULPTURE_KNIGHTHEAD = "其余部分在哪？",		--物品名：可疑的大理石
        SCULPTURE_KNIGHTBODY =
        {
            COVERED = "一尊古怪的大理石像。",		--物品名：大理石雕像 检查状态：雕塑主体仍被石层覆盖
            UNCOVERED = "看来他承受不住。",		--物品名：大理石雕像 检查状态：雕塑主体已经露出
            FINISHED = "终于拼回原样。",		--物品名：大理石雕像 检查状态：雕塑已经完成
            READY = "里面有东西在动。",		--物品名：大理石雕像 检查状态：已经准备就绪
        },
        SCULPTURE_BISHOPHEAD = "那是一颗头吗？",		--物品名：可疑的大理石
        SCULPTURE_BISHOPBODY =
        {
            COVERED = "看着很旧，摸着却新。",		--物品名：大理石雕像 检查状态：雕塑主体仍被石层覆盖
            UNCOVERED = "还缺一大块碎片。",		--物品名：大理石雕像 检查状态：雕塑主体已经露出
            FINISHED = "然后呢。",		--物品名：大理石雕像 检查状态：雕塑已经完成
            READY = "里面有东西在动。",		--物品名：大理石雕像 检查状态：已经准备就绪
        },
        SCULPTURE_ROOKNOSE = "这是从哪儿来的？",		--物品名：可疑的大理石
        SCULPTURE_ROOKBODY =
        {
            COVERED = "一尊大理石像。",		--物品名：大理石雕像 检查状态：雕塑主体仍被石层覆盖
            UNCOVERED = "它状态不佳。",		--物品名：大理石雕像 检查状态：雕塑主体已经露出
            FINISHED = "都修补好了。",		--物品名：大理石雕像 检查状态：雕塑已经完成
            READY = "里面有东西在动。",		--物品名：大理石雕像 检查状态：已经准备就绪
        },
        GARGOYLE_HOUND = "它看我的眼神，我不喜欢。",		--物品名：可疑的月岩
        GARGOYLE_WEREPIG = "栩栩如生，几乎要动。",		--物品名：可疑的月岩
        SEEDS = "每一颗都是小小的谜。",		--物品名：种子
        SEEDS_COOKED = "精华都烤出来了。",		--物品名：烤种子
        SEWING_KIT = "补好。全都补好了。",		--物品名：针线包
        SEWING_TAPE = "补得不错。",		--物品名：可靠的胶布
        SHOVEL = "地下藏着不少秘密。",		--物品名：铲子
        SILK = "出自蜘蛛的后部。",		--物品名：蜘蛛丝
        SKELETON = "你死，好过我死。",		--物品名：骷髅
        SCORCHED_SKELETON = "……可怕。",		--物品名：易碎骷髅
        SKELETON_NOTPLAYER = "不像是人骨。",		--物品名：骷髅
        SKULLCHEST = "开不开，我还没定。", 		--物品名：骷髅箱
        SMALLBIRD =
        {
            GENERIC = "好小的一只鸟。",		--物品名：小鸟 检查状态：普通状态
            HUNGRY = "它饿了。",		--物品名：小鸟 检查状态：处于饥饿状态
            STARVING = "饿得很了。",		--物品名：小鸟 检查状态：极度饥饿
            SLEEPING = "连眼都不肯偷偷睁一下。",		--物品名：小鸟 检查状态：正在睡眠
        },
        SMALLMEAT = "一小块尸体。",		--物品名：小肉
        SMALLMEAT_DRIED = "一小块肉干。",		--物品名：小肉干
        SPAT = "脾气不佳的家伙。",		--物品名：钢羊
        SPEAR = "一根很尖的棍子。",		--物品名：长矛
        SPEAR_WATHGRITHR = "看着很能戳。",		--物品名：战斗长矛
        WATHGRITHRHAT = "那顶帽子，样式奇特。",		--物品名：战斗头盔
        SPIDER =
        {
            DEAD = "……恶心。",		--物品名：蜘蛛 检查状态：已经死亡
            GENERIC = "我讨厌蜘蛛。",		--物品名：蜘蛛 检查状态：普通状态
            SLEEPING = "它醒来时，我最好不在。",		--物品名：蜘蛛 检查状态：正在睡眠
        },
        SPIDERDEN = "黏得过分。",		--物品名：蜘蛛巢
        SPIDEREGGSACK = "但愿这些不会孵化。仅此而已。",		--物品名：蜘蛛卵
        SPIDERGLAND = "一股浓重的防腐味。",		--物品名：蜘蛛腺
        SPIDERHAT = "但愿蜘蛛的黏液都弄干净了。",		--物品名：蜘蛛帽
        SPIDERQUEEN = "……那只蜘蛛，大得离谱。",		--物品名：蜘蛛女王
        SPIDER_WARRIOR =
        {
            DEAD = "总算清静。",		--物品名：蜘蛛战士 检查状态：已经死亡
            GENERIC = "比寻常蜘蛛更凶。",		--物品名：蜘蛛战士 检查状态：普通状态
            SLEEPING = "该保持距离。",		--物品名：蜘蛛战士 检查状态：正在睡眠
        },
        SPOILED_FOOD =
        {
            GENERIC = "长满毛的腐物。",		--物品名：腐烂物 检查状态：普通状态
            CAN_PROCESS = "现在可以处理掉了。",		--物品名：腐烂物 检查状态：可放入堆肥设施处理
        },
        STAGEHAND =
        {
            AWAKE = "总之，别把手伸过来。",		--物品名：舞台之手 检查状态：已经苏醒
            HIDING = "这里有些古怪，我说不清缘由。",		--物品名：舞台之手 检查状态：正在伪装隐藏
        },
        STATUE_MARBLE =
        {
            GENERIC = "上等的大理石像。",		--物品名：大理石雕像 检查状态：普通状态
            TYPE1 = "别失了理智。",		--物品名：大理石雕像 检查状态：第一种外观
            TYPE2 = "很有雕像的样子。",		--物品名：大理石雕像 检查状态：第二种外观
            TYPE3 = "不知出自哪位匠人之手。", 		--物品名：大理石雕像 检查状态：第三种外观
        },
        STATUEHARP = "它的头怎么了？",		--物品名：竖琴雕像
        STATUEMAXWELL = "他本人还要矮些。",		--物品名：麦斯威尔雕像
        STEELWOOL = "粗糙的金属纤维。",		--物品名：钢丝绵
        STINGER = "很尖锐。",		--物品名：针刺
        STRAWHAT = "帽子总会弄乱我的头发。",		--物品名：草帽
        STUFFEDEGGPLANT = "确实塞得满。",		--物品名：酿茄子
        SWEATERVEST = "这件背心相当体面。",		--物品名：犬牙背心
        REFLECTIVEVEST = "退开，恶毒的太阳。",		--物品名：清凉夏装
        HAWAIIANSHIRT = "穿这个做实验，不安全。",		--物品名：花衬衫
        TAFFY = "牙医若知道我怎么吃糖，会当场失态。",		--物品名：太妃糖
        TALLBIRD = "好高的鸟。",		--物品名：高脚鸟
        TALLBIRDEGG = "它会孵出来吗？",		--物品名：高脚鸟蛋
        TALLBIRDEGG_COOKED = "好吃，也有营养。",		--物品名：煎高脚鸟蛋
        TALLBIRDEGG_CRACKED =
        {
            COLD = "是它在抖，还是我在抖？",		--物品名：孵化中的高脚鸟蛋 检查状态：温度较低
            GENERIC = "它正在孵化。",		--物品名：孵化中的高脚鸟蛋 检查状态：普通状态
            HOT = "蛋也会出汗吗？",		--物品名：孵化中的高脚鸟蛋 检查状态：温度很高
            LONG = "看来还要些时候……",		--物品名：孵化中的高脚鸟蛋 检查状态：距离孵化或变化仍有较长时间
            SHORT = "随时会破壳。",		--物品名：孵化中的高脚鸟蛋 检查状态：即将孵化或变化
        },
        TALLBIRDNEST =
        {
            GENERIC = "这蛋，不一般。",		--物品名：高脚鸟巢 检查状态：普通状态
            PICKED = "巢空着。",		--物品名：高脚鸟巢 检查状态：已经采集
        },
        TEENBIRD =
        {
            GENERIC = "不算高的鸟。",		--物品名：小高脚鸟 检查状态：普通状态
            HUNGRY = "你已经饿到不行了？",		--物品名：小高脚鸟 检查状态：处于饥饿状态
            STARVING = "它的眼神凶起来了。",		--物品名：小高脚鸟 检查状态：极度饥饿
            SLEEPING = "它眯着眼休息。",		--物品名：小高脚鸟 检查状态：正在睡眠
        },
        TELEPORTATO_BASE =
        {
            ACTIVE = "有了它，穿越时空并非妄想。", 		--物品名：木制装置 检查状态：正在运作
            GENERIC = "似乎通向另一个世界。", 		--物品名：木制装置 检查状态：普通状态
            LOCKED = "还缺些东西。", 		--物品名：木制装置 检查状态：处于锁定状态
            PARTIAL = "快了，这发明就要完成。", 		--物品名：木制装置 检查状态：只完成部分组装
        },
        TELEPORTATO_BOX = "或许掌控着宇宙的极性。", 		--物品名：盒状装置
        TELEPORTATO_CRANK = "结实得经得起最危险的实验。", 		--物品名：曲柄装置
        TELEPORTATO_POTATO = "这颗金属土豆里，藏着强大而可怕的力量……", 		--物品名：金属土豆状装置
        TELEPORTATO_RING = "聚拢空间能量的圆环。", 		--物品名：环状装置
        TELESTAFF = "它会揭示这个世界。",		--物品名：传送魔杖
        TENT =
        {
            GENERIC = "不睡，我会疯。",		--物品名：帐篷 检查状态：普通状态
            BURNT = "没剩下能睡的东西。",		--物品名：帐篷 检查状态：已经烧毁
        },
        SIESTAHUT =
        {
            GENERIC = "午后避暑的好去处。",		--物品名：遮阳篷 检查状态：普通状态
            BURNT = "现在遮不了多少阳。",		--物品名：遮阳篷 检查状态：已经烧毁
        },
        TENTACLE = "那个很危险。",		--物品名：触手
        TENTACLESPIKE = "又尖又黏。",		--物品名：触手尖刺
        TENTACLESPOTS = "这些大概是它的生殖器。",		--物品名：触手皮
        TENTACLE_PILLAR = "黏滑的触手。",		--物品名：大触手
        TENTACLE_PILLAR_HOLE = "气味不佳，但值得一探。",		--物品名：硕大的泥坑
        TENTACLE_PILLAR_ARM = "滑溜溜的小触手。",		--物品名：小触手
        TENTACLE_GARDEN = "又一种黏滑的触手。",		--物品名：大触手
        TOPHAT = "好一顶帽子。",		--物品名：高礼帽
        TORCH = "驱赶黑暗用的。",		--物品名：火炬
        TRANSISTOR = "通电便嗡嗡作响。",		--物品名：电子元件
        TRAP = "我编得很紧。",		--物品名：陷阱
        TRAP_TEETH = "糟糕的意外。",		--物品名：犬牙陷阱
        TRAP_TEETH_MAXWELL = "我可不想踩上去。", 		--物品名：麦斯威尔的犬牙陷阱
        TREASURECHEST =
        {
            GENERIC = "一只箱子。……我喜欢箱子，喵。",		--物品名：箱子 检查状态：普通状态
            BURNT = "箱子烧掉了一截。",		--物品名：箱子 检查状态：已经烧毁
            UPGRADED_STACKSIZE = "容量提升了一个量级。",		--物品名：箱子 检查状态：已经升级容器堆叠容量
        },
        TREASURECHEST_TRAP = "倒是方便。",		--物品名：宝箱
        CHESTUPGRADE_STACKSIZE = "物理定律竟如此有弹性。", 		--物品名：弹性空间制造器
        COLLAPSEDCHEST = "物理定律遭到了扭曲。",		--物品名：损坏的箱子
        SACRED_CHEST =
        {
            GENERIC = "我听见低语。它想要点什么。",		--物品名：远古宝箱 检查状态：普通状态
            LOCKED = "它正在判断。",		--物品名：远古宝箱 检查状态：处于锁定状态
        },
        TREECLUMP = "有人想把我困在这里。", 		--物品名：密集树丛

        TRINKET_1 = "熔化了。或许薇洛与它们处得不错。", 		--物品名：熔化的弹珠
        TRINKET_2 = "你和卡祖笛有什么关系？", 		--物品名：假卡祖笛
        TRINKET_3 = "死结。永远打不开。", 		--物品名：戈尔迪之结
        TRINKET_4 = "多半是某种宗教物件。", 		--物品名：地精爷爷
        TRINKET_5 = "可惜太小，坐不上去逃。", 		--物品名：迷你火箭
        TRINKET_6 = "它输电的日子结束了。", 		--物品名：烂电线
        TRINKET_7 = "没有时间玩耍。", 		--物品名：杯子和球
        TRINKET_8 = "很好。浴缸的塞子有了。", 		--物品名：硬化橡胶塞
        TRINKET_9 = "我更喜欢拉链。", 		--物品名：不搭的纽扣
        TRINKET_10 = "韦斯大概会喜欢这个。", 		--物品名：二手假牙
        TRINKET_11 = "哈尔对我低语，说着漂亮的谎。", 		--物品名：机器人玩偶
        TRINKET_12 = "这是在求人研究它。", 		--物品名：干瘪的触手
        TRINKET_13 = "多半是某种宗教物件。", 		--物品名：地精奶奶
        TRINKET_14 = "此刻若有茶，该多好……", 		--物品名：漏水的茶杯
        TRINKET_15 = "……麦斯威尔又落下了他的行头。", 		--物品名：白色主教
        TRINKET_16 = "……麦斯威尔又落下了他的行头。", 		--物品名：黑色主教
        TRINKET_17 = "可怖的器具融合。物极必反。", 		--物品名：弯曲的叉子
        TRINKET_18 = "它在隐藏什么？", 		--物品名：玩具木马
        TRINKET_19 = "结网不太顺利。", 		--物品名：失衡陀螺
        TRINKET_20 = "薇格弗德拿它打我，还跳来跳去。", 		--物品名：痒痒挠
        TRINKET_21 = "搅蛋器整个扭弯了。", 		--物品名：破搅拌器
        TRINKET_22 = "关于这绳子，我有几种推测。", 		--物品名：磨损的纱线
        TRINKET_23 = "鞋我自己能穿。谢谢。", 		--物品名：鞋拔子
        TRINKET_24 = "薇克巴顿该养只猫。我这样的，喵。", 		--物品名：幸运猫扎尔
        TRINKET_25 = "气味不太新鲜。", 		--物品名：臭气制造器
        TRINKET_26 = "食物，杯子，终极容器。", 		--物品名：土豆杯
        TRINKET_27 = "拉开它，就能从远处刺人。", 		--物品名：钢丝衣架
        TRINKET_28 = "简直是阴谋。", 		--物品名：白色战车
        TRINKET_29 = "简直是阴谋。", 		--物品名：黑色战车
        TRINKET_30 = "他怎会到处乱丢。", 		--物品名：白色骑士
        TRINKET_31 = "他怎会到处乱丢。", 		--物品名：黑色骑士
        TRINKET_32 = "我认识喜欢这个的人。", 		--物品名：立方氧化锆球
        TRINKET_33 = "但愿不引来蜘蛛。", 		--物品名：蜘蛛指环
        TRINKET_34 = "许个愿吧。为了学问。", 		--物品名：猴爪
        TRINKET_35 = "这附近难找一只好烧瓶。", 		--物品名：空的长生不老药
        TRINKET_36 = "吃完全部的糖之后，我大概用得上。", 		--物品名：人造尖牙
        TRINKET_37 = "我不信超自然之事。", 		--物品名：断桩
        TRINKET_38 = "来自另一个世界。一个满是骗术的世界。", 		--物品名：双筒望远镜
        TRINKET_39 = "另一只在哪？", 		--物品名：单只手套
        TRINKET_40 = "拿着它，像在赶集。", 		--物品名：蜗牛秤
        TRINKET_41 = "摸上去微温。", 		--物品名：黏液罐
        TRINKET_42 = "装满某人的童年。", 		--物品名：玩具眼镜蛇
        TRINKET_43= "它不太会跳。", 		--物品名：鳄鱼玩具
        TRINKET_44 = "某种植物标本。", 		--物品名：破碎的玻璃罐
        TRINKET_45 = "它在接收另一个世界的频率。", 		--物品名：奇怪的收音机
        TRINKET_46 = "或许是测空气动力的工具？", 		--物品名：损坏的吹风机

        LOST_TOY_1  = "一定有个完美的解释。",		--物品名：遗失的玻璃球
        LOST_TOY_2  = "一定有个完美的解释。",		--物品名：多愁善感的卡祖笛
        LOST_TOY_7  = "一定有个完美的解释。",		--物品名：珍视的抽线陀螺
        LOST_TOY_10 = "一定有个完美的解释。",		--物品名：缺少的牙齿
        LOST_TOY_11 = "一定有个完美的解释。",		--物品名：珍贵的玩具机器人
        LOST_TOY_14 = "一定有个完美的解释。",		--物品名：妈妈最爱的茶杯
        LOST_TOY_18 = "一定有个完美的解释。",		--物品名：宝贵的玩具木马
        LOST_TOY_19 = "一定有个完美的解释。",		--物品名：最爱的陀螺
        LOST_TOY_42 = "一定有个完美的解释。",		--物品名：装错的玩具眼镜蛇
        LOST_TOY_43 = "一定有个完美的解释。",		--物品名：宠爱的鳄鱼玩具

        HALLOWEENCANDY_1 = "蛀牙也值得，对吧？",		--物品名：糖果苹果
        HALLOWEENCANDY_2 = "什么样的腐败学问，长出这种东西？",		--物品名：糖果玉米
        HALLOWEENCANDY_3 = "是……玉米。",		--物品名：不太甜的玉米
        HALLOWEENCANDY_4 = "它们一路蠕动下来。",		--物品名：粘液蜘蛛
        HALLOWEENCANDY_5 = "明天我的牙会对此发表意见。",		--物品名：浣猫糖果
        HALLOWEENCANDY_6 = "我……不打算吃那个。",		--物品名："葡萄干"
        HALLOWEENCANDY_7 = "谁见了都会激动。",		--物品名：葡萄干
        HALLOWEENCANDY_8 = "只有傻瓜才不爱它。",		--物品名：鬼魂棒棒糖
        HALLOWEENCANDY_9 = "粘牙。",		--物品名：果冻虫
        HALLOWEENCANDY_10 = "只有傻瓜才不爱它。",		--物品名：触手棒棒糖
        HALLOWEENCANDY_11 = "比真的好吃多了。",		--物品名：巧克力猪
        HALLOWEENCANDY_12 = "那块糖刚才动了一下？", 		--物品名：糖果虱
        HALLOWEENCANDY_13 = "……我的下巴。", 		--物品名：无敌硬糖
        HALLOWEENCANDY_14 = "我吃不得辣。", 		--物品名：熔岩椒
        CANDYBAG = "里面是些小小甜点。",		--物品名：糖果袋

		HALLOWEEN_ORNAMENT_1 = "挂上树去，倒还看得过去。",		--物品名：幽灵装饰
		HALLOWEEN_ORNAMENT_2 = "样式古怪，做工尚可。",		--物品名：蝙蝠装饰
		HALLOWEEN_ORNAMENT_3 = "一块木头，挂起来正合适。",		--物品名：蜘蛛装饰
		HALLOWEEN_ORNAMENT_4 = "触手做得颇为逼真。",		--物品名：触手装饰
		HALLOWEEN_ORNAMENT_5 = "八条腕足。挂饰也这般张扬。",		--物品名：穴居悬蛛装饰
		HALLOWEEN_ORNAMENT_6 = "近来人人都在谈论树的装饰，喵。",		--物品名：乌鸦装饰

		HALLOWEENPOTION_DRINKS_WEAK = "比预想的要小。",		--物品名：弱效万圣节药剂
		HALLOWEENPOTION_DRINKS_POTENT = "效力应当不差。",		--物品名：强效万圣节药剂
        HALLOWEENPOTION_BRAVERY = "勇气，装得满满一瓶。",		--物品名：勇气药剂
		HALLOWEENPOTION_MOON = "注入了变异之力。",		--物品名：月亮精华液
		HALLOWEENPOTION_FIRE_FX = "火焰凝成的结晶。",		--物品名：万圣节火焰药剂效果
		MADSCIENCE_LAB = "为科学疯一次，也无妨。",		--物品名：疯狂科学家实验室
		LIVINGTREE_ROOT = "里面有东西。连根拔掉。",		--物品名：完全正常的树根
		LIVINGTREE_SAPLING = "它会长到令人不安的尺寸。",		--物品名：完全正常的树苗

        DRAGONHEADHAT = "那么，谁走前面？",		--物品名：幸运兽脑袋
        DRAGONBODYHAT = "中间这段，恕我犹豫。",		--物品名：幸运兽躯体
        DRAGONTAILHAT = "尾巴一摆，颇为神气。",		--物品名：幸运兽尾巴
        PERDSHRINE =
        {
            GENERIC = "它似乎在等一份供品。",		--物品名：火鸡神龛 检查状态：普通状态
            EMPTY = "空着。该往里放点什么。",		--物品名：火鸡神龛 检查状态：内容为空
            BURNT = "烧尽了，毫无用处。",		--物品名：火鸡神龛 检查状态：已经烧毁
        },
        REDLANTERN = "这盏灯，比别的多几分意思，喵。",		--物品名：红灯笼
        LUCKY_GOLDNUGGET = "运气不错。",		--物品名：幸运金块
        FIRECRACKERS = "装满了爆炸的学问。",		--物品名：红鞭炮
        PERDFAN = "大得有些夸张。",		--物品名：幸运扇
        REDPOUCH = "里面装了东西？",		--物品名：红包
        WARGSHRINE =
        {
            GENERIC = "该做点有趣的东西了。",		--物品名：座狼神龛 检查状态：普通状态
            EMPTY = "里面得插一支火把。",		--物品名：座狼神龛 检查状态：内容为空
            BURNING = "火势正旺。随它去。", 		--物品名：座狼神龛 检查状态：正在燃烧
            BURNT = "烧成了灰。",		--物品名：座狼神龛 检查状态：已经烧毁
        },
        CLAYWARG =
        {
            GENERIC = "黏土做的野兽。",		--物品名：黏土座狼 检查状态：普通状态
            STATUE = "它方才……动了一下？",		--物品名：黏土座狼 检查状态：雕像形态
        },
        CLAYHOUND =
        {
            GENERIC = "它挣脱了束缚。",		--物品名：黏土猎犬 检查状态：普通状态
            STATUE = "雕得过于逼真了。",		--物品名：黏土猎犬 检查状态：雕像形态
        },
        HOUNDWHISTLE = "这哨子能拦住狗的脚。",		--物品名：幸运哨子
        CHESSPIECE_CLAYHOUND = "拴着的，不必费心。",		--物品名：猎犬雕塑
        CHESSPIECE_CLAYWARG = "我竟没被吃掉。",		--物品名：座狼雕塑

		PIGSHRINE =
		{
            GENERIC = "还有更多事要做。",		--物品名：猪神龛 检查状态：普通状态
            EMPTY = "它想要肉。",		--物品名：猪神龛 检查状态：内容为空
            BURNT = "焦了。",		--物品名：猪神龛 检查状态：已经烧毁
		},
		PIG_TOKEN = "这东西分量不轻。",		--物品名：金腰带
		PIG_COIN = "战事里花掉它，回报不差。",		--物品名：猪鼻铸币
		YOTP_FOOD1 = "这才算得上一场盛宴。",		--物品名：贡品烤肉
		YOTP_FOOD2 = "只有野兽才咽得下去。",		--物品名：八宝泥馅饼
		YOTP_FOOD3 = "谈不上精致。",		--物品名：鱼头串

		PIGELITE1 = "看什么？", 		--物品名：韦德
		PIGELITE2 = "他满脑子都是金子。", 		--物品名：伊格内修斯
		PIGELITE3 = "你眼里全是泥。", 		--物品名：德米特里
		PIGELITE4 = "你不想去打别人吗？", 		--物品名：索耶

		PIGELITEFIGHTER1 = "看什么看？", 		--物品名：韦德
		PIGELITEFIGHTER2 = "他还在追着金子跑。", 		--物品名：伊格内修斯
		PIGELITEFIGHTER3 = "你眼里有泥。", 		--物品名：德米特里
		PIGELITEFIGHTER4 = "去打别人，如何？", 		--物品名：索耶

		CARRAT_GHOSTRACER = "真叫人不安。",		--物品名：查理的胡萝卜鼠

        YOTC_CARRAT_RACE_START = "起点尚可，喵。",		--物品名：起点
        YOTC_CARRAT_RACE_CHECKPOINT = "关键的一处。",		--物品名：检查点
        YOTC_CARRAT_RACE_FINISH =
        {
            GENERIC = "与其说终点线，不如说终点圈。",		--物品名：终点线 检查状态：普通状态
            BURNT = "一把火烧得干净。",		--物品名：终点线 检查状态：已经烧毁
            I_WON = "如我所料。我赢了。",		--物品名：终点线 检查状态：当前角色赢得比赛
            SOMEONE_ELSE_WON = "……恭喜，{winner}。",		--物品名：终点线 检查状态：其他角色赢得比赛
        },

		YOTC_CARRAT_RACE_START_ITEM = "权当是个开始。",		--物品名：起点套装
        YOTC_CARRAT_RACE_CHECKPOINT_ITEM = "终点总会到的。",		--物品名：检查点套装
		YOTC_CARRAT_RACE_FINISH_ITEM = "终点在望。",		--物品名：终点线套装

		YOTC_SEEDPACKET = "依我看，籽不少。",		--物品名：种子包
		YOTC_SEEDPACKET_RARE = "还是稀罕货色。",		--物品名：高级种子包

		MINIBOATLANTERN = "亮得刺眼。",		--物品名：漂浮灯笼

        YOTC_CARRATSHRINE =
        {
            GENERIC = "该怎么摆弄……",		--物品名：胡萝卜鼠神龛 检查状态：普通状态
            EMPTY = "嗯……它爱吃什么？",		--物品名：胡萝卜鼠神龛 检查状态：内容为空
            BURNT = "烤胡萝卜的气味。",		--物品名：胡萝卜鼠神龛 检查状态：已经烧毁
        },

        YOTC_CARRAT_GYM_DIRECTION =
        {
            GENERIC = "为训练指个方向。",		--物品名：方向健身房 检查状态：普通状态
            RAT = "你会是只出色的试验鼠。",		--物品名：方向健身房 检查状态：训练目标是胡萝卜鼠
            BURNT = "训练计划，烧成了灰。",		--物品名：方向健身房 检查状态：已经烧毁
        },
        YOTC_CARRAT_GYM_SPEED =
        {
            GENERIC = "该让它跑得更快。",		--物品名：速度健身房 检查状态：普通状态
            RAT = "再快些……再快些，喵。",		--物品名：速度健身房 检查状态：训练目标是胡萝卜鼠
            BURNT = "燃料放多了。",		--物品名：速度健身房 检查状态：已经烧毁
        },
        YOTC_CARRAT_GYM_REACTION =
        {
            GENERIC = "练练它的反应。",		--物品名：反应健身房 检查状态：普通状态
            RAT = "反应时间稳步缩短。",		--物品名：反应健身房 检查状态：训练目标是胡萝卜鼠
            BURNT = "追求学问的微小代价。",		--物品名：反应健身房 检查状态：已经烧毁
        },
        YOTC_CARRAT_GYM_STAMINA =
        {
            GENERIC = "它变强壮了。",		--物品名：耐力健身房 检查状态：普通状态
            RAT = "这只胡萝卜鼠……无人可挡。",		--物品名：耐力健身房 检查状态：训练目标是胡萝卜鼠
            BURNT = "进步无人可挡。只是要推迟了。",		--物品名：耐力健身房 检查状态：已经烧毁
        },

        YOTC_CARRAT_GYM_DIRECTION_ITEM = "我也该练练。",		--物品名：方向健身房套装
        YOTC_CARRAT_GYM_SPEED_ITEM = "最好把它装起来。",		--物品名：速度健身房套装
        YOTC_CARRAT_GYM_STAMINA_ITEM = "这会改善它的耐力。",		--物品名：耐力健身房套装
        YOTC_CARRAT_GYM_REACTION_ITEM = "这应能显著缩短它的反应时间。",		--物品名：反应健身房套装

        YOTC_CARRAT_SCALE_ITEM = "用来称我的胡萝卜鼠。",		--物品名：胡萝卜鼠秤套装
        YOTC_CARRAT_SCALE =
        {
            GENERIC = "愿天平偏向我这边。",		--物品名：胡萝卜鼠秤 检查状态：普通状态
            CARRAT = "终究只是一棵有知觉的蔬菜。",		--物品名：胡萝卜鼠秤 检查状态：秤上放着胡萝卜鼠
            CARRAT_GOOD = "养得够格去赛跑了。",		--物品名：胡萝卜鼠秤 检查状态：秤上的胡萝卜鼠成绩良好
            BURNT = "真是一团糟。",		--物品名：胡萝卜鼠秤 检查状态：已经烧毁
        },

        YOTB_BEEFALOSHRINE =
        {
            GENERIC = "该怎么摆弄……",		--物品名：皮弗娄牛神龛 检查状态：普通状态
            EMPTY = "嗯……皮弗娄牛是什么做的？",		--物品名：皮弗娄牛神龛 检查状态：内容为空
            BURNT = "闻着像烤肉。",		--物品名：皮弗娄牛神龛 检查状态：已经烧毁
        },

        BEEFALO_GROOMER =
        {
            GENERIC = "没有皮弗娄牛可打理。",		--物品名：皮弗娄牛美妆台 检查状态：普通状态
            OCCUPIED = "来给它梳洗一番。",		--物品名：皮弗娄牛美妆台 检查状态：当前已有使用者或内容物
            BURNT = "用最火热的样式打理它……代价不小。",		--物品名：皮弗娄牛美妆台 检查状态：已经烧毁
        },
        BEEFALO_GROOMER_ITEM = "还是换个地方装它。",		--物品名：美妆台套装

        YOTR_RABBITSHRINE =
        {
            GENERIC = "该怎么摆弄……",		--物品名：兔人神龛 检查状态：普通状态
            EMPTY = "那只兔子饿了。",		--物品名：兔人神龛 检查状态：内容为空
            BURNT = "闻着像素食烧烤。",		--物品名：兔人神龛 检查状态：已经烧毁
        },

        NIGHTCAPHAT = "睡帽一戴，发型无碍，喵。",		--物品名：睡帽

        YOTR_FOOD1 = "胡萝卜做的，总归健康。",		--物品名：兔子卷
        YOTR_FOOD2 = "蓝色，是最讲道理的风味。",		--物品名：月饼
        YOTR_FOOD3 = "会晃的甜点。",		--物品名：月冻
        YOTR_FOOD4 = "兔子样的点心，正合我意，喵。",		--物品名：泡芙串

        YOTR_TOKEN = "这东西不能给错了人。",		--物品名：挑战手套

        COZY_BUNNYMAN = "他们看上去很惬意。",		--物品名：舒适的兔人

        HANDPILLOW_BEEFALOWOOL = "若没有皮弗娄牛的味儿就好了。",		--物品名：皮弗娄牛毛枕头
        HANDPILLOW_KELP = "太潮了，我不喜欢。",		--物品名：海带枕头
        HANDPILLOW_PETALS = "至少比牛毛枕头好闻。",		--物品名：花朵枕头
        HANDPILLOW_STEELWOOL = "谁会睡在这上面，喵？",		--物品名：钢丝绵枕头

        BODYPILLOW_BEEFALOWOOL = "这味道，最好别沾上牛毛。",		--物品名：皮弗娄牛枕头盔甲
        BODYPILLOW_KELP = "潮得让人不快。",		--物品名：海带枕头盔甲
        BODYPILLOW_PETALS = "气味倒还算过得去。",		--物品名：花朵枕头盔甲
        BODYPILLOW_STEELWOOL = "这也算枕头？",		--物品名：钢丝绵枕头盔甲

		BISHOP_CHARGE_HIT = "唔。",		--物品名：发条主教弹命中效果
		TRUNKVEST_SUMMER = "荒野里的便装。",		--物品名：透气背心
		TRUNKVEST_WINTER = "过冬的行头。",		--物品名：松软背心
		TRUNK_COOKED = "烤过之后，倒更像鼻子了。",		--物品名：象鼻排
		TRUNK_SUMMER = "一根透气的象鼻。",		--物品名：象鼻
		TRUNK_WINTER = "一根厚实多毛的象鼻。",		--物品名：冬象鼻
		TUMBLEWEED = "风滚草里裹着什么，谁知道。",		--物品名：风滚草
		TURKEYDINNER = "啧。",		--物品名：火鸡正餐
		TWIGS = "一小捆树枝。",		--物品名：树枝
		UMBRELLA = "我不想弄湿头发。",		--物品名：雨伞
		GRASS_UMBRELLA = "头发湿时好看……干了就难说。",		--物品名：花伞
		UNIMPLEMENTED = "尚未完工。多半有危险。",		--物品名：尚未实装的对象
		WAFFLES = "糖浆够不够，我还在斟酌，喵。",		--物品名：华夫饼
		WALL_HAY =
		{
			GENERIC = "也罢。凑合能用。",		--物品名：草墙 检查状态：普通状态
			BURNT = "彻底没用了。",		--物品名：草墙 检查状态：已经烧毁
		},
		WALL_HAY_ITEM = "这主意并不高明。",		--物品名：草墙
		WALL_STONE = "墙还算像样。",		--物品名：石墙
		WALL_STONE_ITEM = "让我觉得安稳。",		--物品名：石墙
		WALL_RUINS = "一段古墙。",		--物品名：铥墙
		WALL_RUINS_ITEM = "一段坚固的历史。",		--物品名：铥墙
		WALL_WOOD =
		{
			GENERIC = "尖端朝外。",		--物品名：木墙 检查状态：普通状态
			BURNT = "烧焦了。",		--物品名：木墙 检查状态：已经烧毁
		},
		WALL_WOOD_ITEM = "一排木桩。",		--物品名：木墙
		WALL_MOONROCK = "空灵，且光滑。",		--物品名：月岩墙
		WALL_MOONROCK_ITEM = "极轻，却出奇地硬。",		--物品名：月岩墙
		WALL_DREADSTONE = "这种质感……让人安心？",		--物品名：绝望石墙
		WALL_DREADSTONE_ITEM = "能出什么问题？",		--物品名：绝望石墙
        WALL_SCRAP = "垃圾堆出来的。",		--物品名：废料墙
        WALL_SCRAP_ITEM = "捆好的垃圾。",		--物品名：废料墙
		FENCE = "不过是道木栅栏。",		--物品名：木栅栏
        FENCE_ITEM = "足够围出一圈牢固的栅栏。",		--物品名：木栅栏
        FENCE_GATE = "开开合合。",		--物品名：木门
        FENCE_GATE_ITEM = "足够造一道像样的大门。",		--物品名：木门
		WALRUS = "海象，天生的猎手。",		--物品名：海象
		WALRUSHAT = "覆着一层海象毛。",		--物品名：贝雷帽
		WALRUS_CAMP =
		{
			EMPTY = "有人在此扎过营。",		--物品名：海象营地 检查状态：内容为空
			GENERIC = "里头温暖舒适。",		--物品名：海象营地 检查状态：普通状态
		},
		WALRUS_TUSK = "迟早派得上用场。",		--物品名：海象牙
		WARDROBE =
		{
			GENERIC = "里头藏着黑暗而禁忌的秘密……",		--物品名：衣柜 检查状态：普通状态
            BURNING = "烧得真快。",		--物品名：衣柜 检查状态：正在燃烧
			BURNT = "毫无格调。",		--物品名：衣柜 检查状态：已经烧毁
		},
		WARG = "大狗，你不太好对付。",		--物品名：座狼
        WARGLET = "又要回到那些日子了……",		--物品名：青年座狼

		WASPHIVE = "那些蜜蜂都疯了。",		--物品名：杀人蜂蜂窝
		WATERBALLOON = "称得上奇迹。",		--物品名：水球
		WATERMELON = "又黏又甜。",		--物品名：西瓜
		WATERMELON_COOKED = "温热多汁。",		--物品名：烤西瓜
		WATERMELONHAT = "汁水会顺着脸往下淌。",		--物品名：西瓜帽
		WAXWELLJOURNAL =
		{
			GENERIC = "令人不适。",		--物品名：暗影秘典 检查状态：普通状态
			NEEDSFUEL = "它渴求燃料。",		--物品名：暗影秘典 检查状态：需要补充噩梦燃料
		},
		WETGOOP = "淡而无味。",		--物品名：潮湿黏糊
        WHIP = "巨响之后，才有安宁。",		--物品名：三尾猫鞭
		WINTERHAT = "入冬以后，它很有用。",		--物品名：冬帽
		WINTEROMETER =
		{
			GENERIC = "水银做的。",		--物品名：温度测量仪 检查状态：普通状态
			BURNT = "再也量不了了。",		--物品名：温度测量仪 检查状态：已经烧毁
		},

        WINTER_TREE =
        {
            BURNT = "节日的气氛打了折扣。",		--物品名：冬季盛宴树 检查状态：已经烧毁
            BURNING = "这是个错误。",		--物品名：冬季盛宴树 检查状态：正在燃烧
            CANDECORATE = "冬季盛宴，愿你尽兴。",		--物品名：冬季盛宴树 检查状态：可以添加节日装饰
            YOUNG = "冬季盛宴快到了。",		--物品名：冬季盛宴树 检查状态：尚未长成
        },
		WINTER_TREESTAND =
		{
			GENERIC = "还差一颗松果。",		--物品名：盛宴树盆 检查状态：普通状态
            BURNT = "节日气氛受损了。",		--物品名：盛宴树盆 检查状态：已经烧毁
		},
        WINTER_ORNAMENT = "再严谨的人也会喜欢小玩意。",		--物品名：圣诞小玩意
        WINTER_ORNAMENTLIGHT = "树没有电，就不算完整。",		--物品名：圣诞灯
        WINTER_ORNAMENTBOSS = "这一件尤其醒目，喵。",		--物品名：华丽的装饰
		WINTER_ORNAMENTFORGE = "该把它架到火上烤。",		--物品名：熔炉装饰
		WINTER_ORNAMENTGORGE = "不知为何，看着就饿。",		--物品名：暴食装饰
        WINTER_ORNAMENTPEARL = "以那副爪子而言，做工已算精美。",		--物品名：感伤装饰

        WINTER_FOOD1 = "结构不对。我可以不计较。", 		--物品名：小姜饼
        WINTER_FOOD2 = "四十个，不在话下。", 		--物品名：糖曲奇饼
        WINTER_FOOD3 = "牙疼是迟早的事。", 		--物品名：拐杖糖
        WINTER_FOOD4 = "那实验，道德上站不住脚。", 		--物品名：永远的水果蛋糕
        WINTER_FOOD5 = "总算不必再吃浆果了。", 		--物品名：巧克力原木蛋糕
        WINTER_FOOD6 = "直接入口。", 		--物品名：李子布丁
        WINTER_FOOD7 = "空心苹果，盛满了汁。", 		--物品名：苹果酒
        WINTER_FOOD8 = "它凭什么还热着？隔热杯？", 		--物品名：热可可
        WINTER_FOOD9 = "这么香，总该有个解释。", 		--物品名：美味的蛋酒

		WINTERSFEASTOVEN =
		{
			GENERIC = "喜庆的炉子，专管烤制。",		--物品名：砖砌烤炉 检查状态：普通状态
			COOKING = "烹饪也是一门学问。",		--物品名：砖砌烤炉 检查状态：正在烹饪
			ALMOST_DONE_COOKING = "就快好了。",		--物品名：砖砌烤炉 检查状态：即将烹饪完成
			DISH_READY = "可以上桌了。",		--物品名：砖砌烤炉 检查状态：料理已经完成
		},
		BERRYSAUCE = "浆果熬的酱。",		--物品名：快乐浆果酱
		BIBINGKA = "软得像海绵。",		--物品名：比宾卡米糕
		CABBAGEROLLS = "肉裹在白菜里，倒会藏。",		--物品名：白菜卷
		FESTIVEFISH = "时令的海味。",		--物品名：节庆鱼料理
		GRAVY = "满满都是肉汁。",		--物品名：好肉汁
		LATKES = "这个我能吃许多。",		--物品名：土豆饼
		LUTEFISK = "有喇叭鱼吗？",		--物品名：苏打鱼
		MULLEDDRINK = "这杯潘趣，后劲不小。",		--物品名：香料潘趣酒
		PANETTONE = "仲冬节的面包，正应景。",		--物品名：托尼甜面包
		PAVLOVA = "巴甫洛娃，正合我意。",		--物品名：巴甫洛娃蛋糕
		PICKLEDHERRING = "无可挑剔，喵。",		--物品名：腌鲱鱼
		POLISHCOOKIE = "该把盘子清空了。",		--物品名：波兰饼干
		PUMPKINPIE = "整块吃掉，毫不浪费。",		--物品名：南瓜派
		ROASTTURKEY = "肥美的腿肉，像是专为我烤的，喵。",		--物品名：烤火鸡
		STUFFING = "用料不差。",		--物品名：烤火鸡面包馅
		SWEETPOTATO = "晚餐与甜点，合而为一。",		--物品名：红薯焗饭
		TAMALES = "再吃下去，怕要长力气了。",		--物品名：塔马利
		TOURTIERE = "很高兴见到你，肉馅饼。",		--物品名：饕餮馅饼

		TABLE_WINTERS_FEAST =
		{
			GENERIC = "节庆的餐桌。",		--物品名：冬季盛宴餐桌 检查状态：普通状态
			HAS_FOOD = "该开席了。",		--物品名：冬季盛宴餐桌 检查状态：桌上已经摆有食物
			WRONG_TYPE = "这道菜，不应季。",		--物品名：冬季盛宴餐桌 检查状态：摆放的食物类型不符合宴席要求
			BURNT = "谁会做这种事？",		--物品名：冬季盛宴餐桌 检查状态：已经烧毁
		},

		GINGERBREADWARG = "先尝一口甜点。",		--物品名：姜饼座狼
		GINGERBREADHOUSE = "吃住都管。",		--物品名：姜饼猪屋
		GINGERBREADPIG = "最好跟着他。",		--物品名：姜饼猪
		CRUMBS = "一路走，一路掉。",		--物品名：饼干屑
		WINTERSFEASTFUEL = "冬季的精神。",		--物品名：节日欢愉

        KLAUS = "那究竟是什么东西。",		--物品名：克劳斯
        KLAUS_SACK = "那袋子，非打开不可。",		--物品名：赃物袋
		KLAUSSACKKEY = "一副鹿角，何须如此花哨。",		--物品名：麋鹿茸
		WORMHOLE =
		{
			GENERIC = "柔软，且呈波浪状。",		--物品名：虫洞 检查状态：普通状态
			OPEN = "它在催我跳进去。",		--物品名：虫洞 检查状态：处于打开状态
		},
		WORMHOLE_LIMITED = "那东西看着不太对。",		--物品名：生病的虫洞
		ACCOMPLISHMENT_SHRINE = "该用一用。让所有人知道我都做了什么。", 		--物品名：奖杯
		LIVINGTREE = "它在看我？",		--物品名：完全正常的树
		ICESTAFF = "触手冰凉。",		--物品名：冰魔杖
		REVIVER = "丑陋的心在跳，把鬼魂唤了回来。",		--物品名：告密的心
		SHADOWHEART = "某种力量让它重新有了生气……",		--物品名：暗影心房
        ATRIUM_RUBBLE =
        {
			LINE_1 = "画着一个古老文明。人们又饿又怕。",		--物品名：远古壁画 检查状态：第一段碑文或记录
			LINE_2 = "石板上的字已认不出了。",		--物品名：远古壁画 检查状态：第二段碑文或记录
			LINE_3 = "有黑暗的东西逼近这座城。",		--物品名：远古壁画 检查状态：第三段碑文或记录
			LINE_4 = "人们的皮在脱落。里外不是一回事。",		--物品名：远古壁画 检查状态：第四段碑文或记录
			LINE_5 = "画的是一座技术昌明的巨城。",		--物品名：远古壁画 检查状态：第五段碑文或记录
		},
        ATRIUM_STATUE = "并非全然真实。",		--物品名：远古雕像
        ATRIUM_LIGHT =
        {
			ON = "这光令人很不安。",		--物品名：远古灯柱 检查状态：处于开启状态
			OFF = "它总得有个动力源。",		--物品名：远古灯柱 检查状态：处于关闭状态
		},
        ATRIUM_GATE =
        {
			ON = "恢复了运转。",		--物品名：远古大门 检查状态：处于开启状态
			OFF = "主体仍然完好。",		--物品名：远古大门 检查状态：处于关闭状态
			CHARGING = "它正在积蓄能量。",		--物品名：远古大门 检查状态：正在充能
			DESTABILIZING = "门在晃。",		--物品名：远古大门 检查状态：正在失稳
			COOLDOWN = "它需要时间恢复。我也是。",		--物品名：远古大门 检查状态：能力处于冷却期
            RITUAL_SUMMONING = "引人入胜……也令人深感不安。", 		--物品名：远古大门 检查状态：仪式正在召唤
        },
        ATRIUM_KEY = "它在向外散逸能量。",		--物品名：远古钥匙
		LIFEINJECTOR = "一次突破。生命的答案。",		--物品名：强心针
		SKELETON_PLAYER =
		{
			MALE = "%s想必是在与%s做试验时死的。",		--物品名：骷髅 检查状态：男性角色遗骸
			FEMALE = "%s大概是在同%s做试验时丧命的。",		--物品名：骷髅 检查状态：女性角色遗骸
			ROBOT = "%s应当是在和%s试验时出了故障。",		--物品名：骷髅 检查状态：机器人角色遗骸
			DEFAULT = "%s多半是在与%s做试验时死的。",		--物品名：骷髅 检查状态：默认外观或未知死因
		},
		HUMANMEAT = "肉就是肉。有分别吗？",		--物品名：长猪
		HUMANMEAT_COOKED = "火候正好。道德上仍旧含糊。",		--物品名：熟长猪
		HUMANMEAT_DRIED = "风干之后，便不算了吧？",		--物品名：长猪肉干
		ROCK_MOON = "那块石头，来自月亮。",		--物品名：岩石
		MOONROCKNUGGET = "月亮的碎片。",		--物品名：月岩
		MOONROCKCRATER = "该往孔里嵌些亮东西。作研究用。",		--物品名：带孔月岩
		MOONROCKSEED = "里头藏着学问。",		--物品名：天体宝球

        REDMOONEYE = "它看得极远，也极远可见。",		--物品名：红色月眼
        PURPLEMOONEYE = "是个好标记。只盼它别那样看我。",		--物品名：紫色月眼
        GREENMOONEYE = "那东西会盯着这里。",		--物品名：绿色月眼
        ORANGEMOONEYE = "有它望着，没人会迷路。",		--物品名：橙色月眼
        YELLOWMOONEYE = "该给每个人指路。",		--物品名：黄色月眼
        BLUEMOONEYE = "多留个心眼，总是明智。",		--物品名：蓝色月眼

        LAVAARENA_BOARLORD = "他是这里的主子。",		--物品名：战斗大师普格纳
        BOARRIOR = "个头不小。",		--物品名：大熔炉猪战士
        BOARON = "他，我应付得了。",		--物品名：战猪
        PEGHOOK = "它喷出的东西有腐蚀性。",		--物品名：酸蚀蝎
        TRAILS = "那副胳膊，很有力。",		--物品名：野猪猩
        TURTILLUS = "壳上带刺。",		--物品名：坦克龟
        SNAPPER = "这东西会咬人。",		--物品名：鳄鱼指挥官
		RHINODRILL = "他的鼻子正适合这活。",		--物品名：后扣帽犀牛兄弟
		BEETLETAUR = "隔着这么远，都闻得到他。",		--物品名：地狱独眼巨猪

        LAVAARENA_PORTAL =
        {
            ON = "我该走了。",		--物品名：远古大门 检查状态：处于开启状态
            GENERIC = "能过来，应当也能回去。",		--物品名：远古大门 检查状态：普通状态
        },
        LAVAARENA_KEYHOLE = "还缺一把钥匙。",		--物品名：远古锚
		LAVAARENA_KEYHOLE_FULL = "这样应该可行。",		--物品名：已插入钥匙的熔炉锁孔
        LAVAARENA_BATTLESTANDARD = "先把战旗拆了。",		--物品名：战旗
        LAVAARENA_SPAWNER = "敌人从这儿来。",		--物品名：熔炉传送门

        HEALINGSTAFF = "释放再生之力。",		--物品名：生命魔杖
        FIREBALLSTAFF = "唤流星自天而降。",		--物品名：地狱魔杖
        HAMMER_MJOLNIR = "这锤子，重得实在。",		--物品名：锻锤
        SPEAR_GUNGNIR = "用它蓄力，很快。",		--物品名：尖齿矛
        BLOWDART_LAVA = "这武器，近处也能用。",		--物品名：吹箭
        BLOWDART_LAVA2 = "借一股强风送出弹丸。",		--物品名：熔化吹箭
        LAVAARENA_LUCY = "那武器，是用来掷的。",		--物品名：暴怒的露西
        WEBBER_SPIDER_MINION = "姑且算他们在为我们而战。",		--物品名：蜘蛛宝宝
        BOOK_FOSSIL = "足以拖住它们一阵。",		--物品名：石化之书
		LAVAARENA_BERNIE = "或许能让他去搅局。",		--物品名：伯尼
		SPEAR_LANCE = "直取要害。",		--物品名：螺旋矛
		BOOK_ELEMENTAL = "这些字，我看不清。",		--物品名：召唤之书
		LAVAARENA_ELEMENTAL = "石头做的怪物。",		--物品名：岩浆傀儡

   		LAVAARENA_ARMORLIGHT = "轻便。不算耐用。",		--物品名：芦苇外衣
		LAVAARENA_ARMORLIGHTSPEED = "轻便，便于行动。",		--物品名：羽饰芦苇外衣
		LAVAARENA_ARMORMEDIUM = "防护尚可。",		--物品名：木质护甲
		LAVAARENA_ARMORMEDIUMDAMAGER = "穿上它，出手能重些。",		--物品名：锯齿木甲
		LAVAARENA_ARMORMEDIUMRECHARGER = "穿上它，能多施几招。",		--物品名：丝带木甲
		LAVAARENA_ARMORHEAVY = "这副，极好。",		--物品名：石头板条甲
		LAVAARENA_ARMOREXTRAHEAVY = "石化的甲，护得最周全。",		--物品名：坚固的石质护甲

		LAVAARENA_FEATHERCROWNHAT = "一看见那堆蓬松羽毛，就想退开。",		--物品名：羽毛头环
        LAVAARENA_HEALINGFLOWERHAT = "这花，与治愈之力相合。",		--物品名：花饰头带
        LAVAARENA_LIGHTDAMAGERHAT = "能添些攻势。",		--物品名：带刺头盔
        LAVAARENA_STRONGDAMAGERHAT = "攻势应当强得多。",		--物品名：司夜女神头盔
        LAVAARENA_TIARAFLOWERPETALSHAT = "似乎能增益治愈。",		--物品名：编织花环
        LAVAARENA_EYECIRCLETHAT = "目光之中，尽是洞察。",		--物品名：洞察皇冠
        LAVAARENA_RECHARGERHAT = "水晶之力，让我的手段更快。",		--物品名：水晶头饰
        LAVAARENA_HEALINGGARLANDHAT = "这花环能补回些气力，喵。",		--物品名：绽放花环
        LAVAARENA_CROWNDAMAGERHAT = "那一顶，破坏惊人。",		--物品名：华丽的司夜女神头盔

		LAVAARENA_ARMOR_HP = "它应当护得住我。",		--物品名：熔炉生命护甲

		LAVAARENA_FIREBOMB = "硫磺的气味。",		--物品名：炉火晶石
		LAVAARENA_HEAVYBLADE = "看着够锋利。",		--物品名：铁匠的刀刃

        QUAGMIRE_ALTAR =
        {
        	GENERIC = "该开始煮祭品了。",		--物品名：饕餮祭坛 检查状态：普通状态
        	FULL = "它正在消化。",		--物品名：饕餮祭坛 检查状态：内容已满
    	},
		QUAGMIRE_ALTAR_STATUE1 = "一座旧雕塑。",		--物品名：饥饿之兽
		QUAGMIRE_PARK_FOUNTAIN = "它和水相处很久了。",		--物品名：喷泉

        QUAGMIRE_HOE = "一件农具。",		--物品名：锄头

        QUAGMIRE_TURNIP = "一根生萝卜。",		--物品名：大萝卜
        QUAGMIRE_TURNIP_COOKED = "下厨，也是一门实践。",		--物品名：烤大萝卜
        QUAGMIRE_TURNIP_SEEDS = "一把古怪的种子。",		--物品名：暴食活动芜菁种子

        QUAGMIRE_GARLIC = "口气清新，从它开始。",		--物品名：大蒜
        QUAGMIRE_GARLIC_COOKED = "焦黄得恰到好处。",		--物品名：烤大蒜
        QUAGMIRE_GARLIC_SEEDS = "一把古怪的种子。",		--物品名：暴食活动大蒜种子

        QUAGMIRE_ONION = "看着很脆。",		--物品名：洋葱
        QUAGMIRE_ONION_COOKED = "一次成功的反应。",		--物品名：烤洋葱
        QUAGMIRE_ONION_SEEDS = "一把古怪的种子。",		--物品名：暴食活动洋葱种子

        QUAGMIRE_POTATO = "埋在土里的苹果，喵。",		--物品名：土豆
        QUAGMIRE_POTATO_COOKED = "一次成功的温度试验。",		--物品名：烤土豆
        QUAGMIRE_POTATO_SEEDS = "一把古怪的种子。",		--物品名：暴食活动土豆种子

        QUAGMIRE_TOMATO = "红色饱满。品相无可挑剔。",		--物品名：番茄
        QUAGMIRE_TOMATO_COOKED = "加热之后，酸味会收敛。",		--物品名：烤番茄
        QUAGMIRE_TOMATO_SEEDS = "种子细小。种下去便知品种。",		--物品名：暴食活动番茄种子

        QUAGMIRE_FLOUR = "研磨得够细了。",		--物品名：面粉
        QUAGMIRE_WHEAT = "颗粒匀净。是上等麦子。",		--物品名：小麦
        QUAGMIRE_WHEAT_SEEDS = "一小把种子。留着有用。",		--物品名：暴食活动小麦种子
        QUAGMIRE_CARROT_SEEDS = "种子。指尖一捻便知好坏。",		--物品名：暴食活动胡萝卜种子

        QUAGMIRE_ROTTEN_CROP = "腐坏了。祭坛不收这种东西。",		--物品名：腐烂的农作物

		QUAGMIRE_SALMON = "鱼。水气还在，喵。",		--物品名：三文鱼
		QUAGMIRE_SALMON_COOKED = "火候正好。可以上桌。",		--物品名：熟三文鱼
		QUAGMIRE_CRABMEAT = "蟹肉。纹理分明。",		--物品名：蟹肉
		QUAGMIRE_CRABMEAT_COOKED = "即便如此，也能做成一餐。",		--物品名：熟蟹肉
		QUAGMIRE_SUGARWOODTREE =
		{
			GENERIC = "树液丰盈。甜味都在里面。",		--物品名：糖木树 检查状态：普通状态
			STUMP = "只剩下树桩。树身去了哪里？",		--物品名：糖木树 检查状态：只剩树桩
			TAPPED_EMPTY = "采集器还空着。再等等。",		--物品名：糖木树 检查状态：糖木树液采集器为空
			TAPPED_READY = "金黄澄澈，可以取了，喵。",		--物品名：糖木树 检查状态：糖木树液已经可以收取
			TAPPED_BUGS = "蚂蚁先到了。真失礼。",		--物品名：糖木树 检查状态：糖木树液采集器中滋生虫子
			WOUNDED = "受伤了。树也有痛觉。",		--物品名：糖木树 检查状态：树木已经受伤
		},
		QUAGMIRE_SPOTSPICE_SHRUB =
		{
			GENERIC = "斑点整齐。像某种触手的花纹。",		--物品名：带斑点的小灌木 检查状态：普通状态
			PICKED = "摘净了。等下一轮。",		--物品名：带斑点的小灌木 检查状态：已经采集
		},
		QUAGMIRE_SPOTSPICE_SPRIG = "磨碎之后，香气才出得来。",		--物品名：带斑点的小枝
		QUAGMIRE_SPOTSPICE_GROUND = "辛香浓烈。够了。",		--物品名：斑点香料
		QUAGMIRE_SAPBUCKET = "采集树液用的。挂上去便是。",		--物品名：树液采集工具包
		QUAGMIRE_SAP = "甜的。不必多尝。",		--物品名：汁液
		QUAGMIRE_SALT_RACK =
		{
			READY = "盐结晶了。挂在绳上。",		--物品名：盐架 检查状态：已经准备就绪
			GENERIC = "析出需要时间。急不得。",		--物品名：盐架 检查状态：普通状态
		},

		QUAGMIRE_POND_SALT = "咸水。尝一口就知道。",		--物品名：盐池
		QUAGMIRE_SALT_RACK_ITEM = "从池水里取盐的器具。",		--物品名：盐架

		QUAGMIRE_SAFE =
		{
			GENERIC = "保险箱。锁得住东西，锁不住人心。",		--物品名：保险箱 检查状态：普通状态
			LOCKED = "锁着。钥匙不在我手上。",		--物品名：保险箱 检查状态：处于锁定状态
		},

		QUAGMIRE_KEY = "钥匙。总有一扇门需要它。",		--物品名：钥匙
		QUAGMIRE_KEY_PARK = "抵达公园之前，先由我收着。",		--物品名：铁钥匙
        QUAGMIRE_PORTAL_KEY = "古老的做工。尚能一用。",		--物品名：远古钥匙


		QUAGMIRE_MUSHROOMSTUMP =
		{
			GENERIC = "是蘑菇。可我不急着下结论。",		--物品名：蘑菇 检查状态：普通状态
			PICKED = "采过了。它不会再有第二次。",		--物品名：蘑菇 检查状态：已经采集
		},
		QUAGMIRE_MUSHROOMS = "可以入口的菌类。仅此而已。",		--物品名：蘑菇
        QUAGMIRE_MEALINGSTONE = "碾磨而已。日常功课。",		--物品名：碾磨石
		QUAGMIRE_PEBBLECRAB = "石头在动。……是螃蟹。",		--物品名：石蟹


		QUAGMIRE_RUBBLE_CARRIAGE = "无处可去。",		--物品名：破烂的马车
        QUAGMIRE_RUBBLE_CLOCK = "钟坏了。理由不必问。",		--物品名：砸烂的时钟
        QUAGMIRE_RUBBLE_CATHEDRAL = "连祈祷也塌了。",		--物品名：残破的大教堂
        QUAGMIRE_RUBBLE_PUBDOOR = "门都没有。",		--物品名：残破的门
        QUAGMIRE_RUBBLE_ROOF = "屋顶被人掀了。",		--物品名：残破的屋顶
        QUAGMIRE_RUBBLE_CLOCKTOWER = "钟楼到此为止。",		--物品名：残破的钟楼
        QUAGMIRE_RUBBLE_BIKE = "运气不佳。",		--物品名：损毁的自行车
        QUAGMIRE_RUBBLE_HOUSE =
        {
            "空无一人。",		--物品名：残破的房子 检查状态：第1条台词变体
            "整座镇子都毁了。",		--物品名：残破的房子 检查状态：第2条台词变体
            "不知他们得罪了谁。",		--物品名：残破的房子 检查状态：第3条台词变体
        },
        QUAGMIRE_RUBBLE_CHIMNEY = "烟囱连灰都没剩下。",		--物品名：残破的烟囱
        QUAGMIRE_RUBBLE_CHIMNEY2 = "烟囱也塌了。",		--物品名：残破的烟囱
        QUAGMIRE_MERMHOUSE = "鱼人的屋子。审美堪忧。",		--物品名：鱼人屋
        QUAGMIRE_SWAMPIG_HOUSE = "从前不是这副样子。",		--物品名：破烂的猪屋
        QUAGMIRE_SWAMPIG_HOUSE_RUBBLE = "某头猪的家没了。",		--物品名：房子碎石
        QUAGMIRE_SWAMPIGELDER =
        {
            GENERIC = "你是这里说话算数的？",		--物品名：沼泽猪长老 检查状态：普通状态
            SLEEPING = "睡着了。只是暂时。",		--物品名：沼泽猪长老 检查状态：正在睡眠
        },
        QUAGMIRE_SWAMPIG = "多毛的猪。毛质倒还蓬松。",		--物品名：暴食活动沼泽猪人

        QUAGMIRE_PORTAL = "又是一条死路。",		--物品名：远古大门
        QUAGMIRE_SALTROCK = "盐晶。矿物里最懂滋味的一种。",		--物品名：盐晶
        QUAGMIRE_SALT = "盐，满满一捧。",		--物品名：盐
        QUAGMIRE_FOOD_BURNT = "烧焦了。算作一次试验。",		--物品名：烧焦的食物
        QUAGMIRE_FOOD =
        {
        	GENERIC = "该把它送上饕餮的祭坛。",		--物品名：暴食活动料理 检查状态：普通状态
            MISMATCH = "不合它的口味。",		--物品名：暴食活动料理 检查状态：料理不符合祭坛要求
            MATCH = "这样便足以安抚天上的那位。",		--物品名：暴食活动料理 检查状态：料理完全符合祭坛要求
            MATCH_BUT_SNACK = "只是点心。份量不够。",		--物品名：暴食活动料理 检查状态：料理符合类型但份量只是点心
        },

        QUAGMIRE_FERN = "蕨类。纤维粗了些。",		--物品名：蕨类植物
        QUAGMIRE_FOLIAGE_COOKED = "我们把叶子煮了。",		--物品名：熟蕨叶
        QUAGMIRE_COIN1 = "我的判断，不止这个价。",		--物品名：旧硬币
        QUAGMIRE_COIN2 = "几枚徽章。收着吧，喵。",		--物品名：蓝宝石徽章
        QUAGMIRE_COIN3 = "有点价值。不多。",		--物品名：红色马克硬币
        QUAGMIRE_COIN4 = "攒够了，门就会开。",		--物品名：饕餮的青睐
        QUAGMIRE_GOATMILK = "尚可。别去想它的来处。",		--物品名：羊奶
        QUAGMIRE_SYRUP = "加一点甜。刚好。",		--物品名：糖浆
        QUAGMIRE_SAP_SPOILED = "坏了。丢进火里最省事。",		--物品名：毁掉的汁液
        QUAGMIRE_SEEDPACKET = "种子包。播下去才知道。",		--物品名：暴食活动种子包

        QUAGMIRE_POT = "锅够大。配料放得下。",		--物品名：大锅
        QUAGMIRE_POT_SMALL = "生火吧。今晚由我掌勺，喵。",		--物品名：锅
        QUAGMIRE_POT_SYRUP = "还差一点甜味。",		--物品名：糖浆锅
        QUAGMIRE_POT_HANGER = "带挂钩。挂起来正合适。",		--物品名：挂锅装置
        QUAGMIRE_POT_HANGER_ITEM = "用来把锅挂高。",		--物品名：挂锅装置
        QUAGMIRE_GRILL = "只差一座后院来安置它。",		--物品名：大烤架
        QUAGMIRE_GRILL_ITEM = "烤架。审问食物用的。",		--物品名：大烤架
        QUAGMIRE_GRILL_SMALL = "小块的东西，烤了更香，喵。",		--物品名：小烤架
        QUAGMIRE_GRILL_SMALL_ITEM = "烤小块肉用的。",		--物品名：小烤架
        QUAGMIRE_OVEN = "要加料，反应才会发生。",		--物品名：烤箱
        QUAGMIRE_OVEN_ITEM = "燃烧的器具。造得不错。",		--物品名：烤箱
        QUAGMIRE_CASSEROLEDISH = "砂锅。能容下许多味道。",		--物品名：大法国砂锅
        QUAGMIRE_CASSEROLEDISH_SMALL = "小锅。适合做些零碎小菜。",		--物品名：小法国砂锅
        QUAGMIRE_PLATE_SILVER = "银盘。擦得很亮。",		--物品名：银盘
        QUAGMIRE_BOWL_SILVER = "银碗。映得出胡须，喵。",		--物品名：银碗
        QUAGMIRE_CRATE = "厨房的杂物，都在这儿。",		--物品名：暴食活动板条箱

        QUAGMIRE_MERM_CART1 = "里面装了什么稀罕物？", 		--物品名：萨米的货车
        QUAGMIRE_MERM_CART2 = "有几样我用得上。", 		--物品名：皮普顿的马车
        QUAGMIRE_PARK_ANGEL = "请接招。",		--物品名：饕餮敬拜者
        QUAGMIRE_PARK_ANGEL2 = "雕得栩栩如生。",		--物品名：饕餮敬拜者
        QUAGMIRE_PARK_URN = "尘归尘。仅此而已。",		--物品名：骨灰瓮
        QUAGMIRE_PARK_OBELISK = "碑。有人想被记住。",		--物品名：石柱
        QUAGMIRE_PARK_GATE =
        {
            GENERIC = "没有钥匙，进不去。",		--物品名：铁门 检查状态：普通状态
            LOCKED = "锁得很死。",		--物品名：铁门 检查状态：处于锁定状态
        },
        QUAGMIRE_PARKSPIKE = "学名大概叫“尖锐之物”。",		--物品名：铁栅栏
        QUAGMIRE_CRABTRAP = "螃蟹笼。放对地方就有的吃。",		--物品名：螃蟹陷阱
        QUAGMIRE_TRADER_MERM = "也许它肯谈条件。",		--物品名：萨米 头脑清晰的泥沼鱼人
        QUAGMIRE_TRADER_MERM2 = "可以试着跟它换。",		--物品名：皮普顿 清醒的泥沼鱼人

        QUAGMIRE_GOATMUM = "让我想起从前的乳母。",		--物品名：玛姆茜
        QUAGMIRE_GOATKID = "这只是幼崽。小得多。",		--物品名：比利
        QUAGMIRE_PIGEON =
        {
            DEAD = "死了。",		--物品名：鸽子 检查状态：已经死亡
            GENERIC = "羽毛规整。体态尚可。",		--物品名：鸽子 检查状态：普通状态
            SLEEPING = "正睡着。别吵。",		--物品名：鸽子 检查状态：正在睡眠
        },
        QUAGMIRE_LAMP_POST = "灯光温黄。像家里的窗，喵。",		--物品名：街灯

        QUAGMIRE_BEEFALO = "它死透了。不必再确认。",		--物品名：老皮弗娄牛
        QUAGMIRE_SLAUGHTERTOOL = "器械。用来处理牲畜。",		--物品名：屠宰工具

        QUAGMIRE_SAPLING = "只剩枝干。取不到别的。",		--物品名：暴食活动树苗
        QUAGMIRE_BERRYBUSH = "浆果被摘光了。",		--物品名：暴食活动浆果丛

        QUAGMIRE_ALTAR_STATUE2 = "看着我做什么？",		--物品名：饥饿之兽
        QUAGMIRE_ALTAR_QUEEN = "兽形的碑。气派不小。",		--物品名：女王野兽
        QUAGMIRE_ALTAR_BOLLARD = "作为一根柱子，它合格了。",		--物品名：柱子
        QUAGMIRE_ALTAR_IVY = "藤蔓。攀附得过分亲昵。",		--物品名：常春藤

        QUAGMIRE_LAMP_SHORT = "点亮吧。",		--物品名：小街灯

        WINONA_CATAPULT =
        {
        	GENERIC = "薇诺娜的自动防御，造得不错。",		--物品名：薇诺娜的投石机 检查状态：普通状态
        	OFF = "没通电。等着。",		--物品名：薇诺娜的投石机 检查状态：处于关闭状态
        	BURNING = "起火了。退开。",		--物品名：薇诺娜的投石机 检查状态：正在燃烧
        	BURNT = "烧尽了。科学也救不回。",		--物品名：薇诺娜的投石机 检查状态：已经烧毁
			SLEEP = "休眠中。它还在等命令。",		--物品名：薇诺娜的投石机 检查状态：设备处于休眠状态
        },
        WINONA_SPOTLIGHT =
        {
        	GENERIC = "这主意不坏。",		--物品名：薇诺娜的聚光灯 检查状态：普通状态
        	OFF = "缺电。接上就是。",		--物品名：薇诺娜的聚光灯 检查状态：处于关闭状态
        	BURNING = "着火了。让开。",		--物品名：薇诺娜的聚光灯 检查状态：正在燃烧
        	BURNT = "烧成了空架子。",		--物品名：薇诺娜的聚光灯 检查状态：已经烧毁
			SLEEP = "设计得聪明。可惜在睡。",		--物品名：薇诺娜的聚光灯 检查状态：设备处于休眠状态
        },
        WINONA_BATTERY_LOW =
        {
        	GENERIC = "看着精巧。原理是什么？",		--物品名：薇诺娜的发电机 检查状态：普通状态
        	LOWPOWER = "电力在降。",		--物品名：薇诺娜的发电机 检查状态：电力不足
        	OFF = "薇诺娜若忙，我也能替她启动。",		--物品名：薇诺娜的发电机 检查状态：处于关闭状态
        	BURNING = "烧起来了。",		--物品名：薇诺娜的发电机 检查状态：正在燃烧
        	BURNT = "连科学也没能留住它。",		--物品名：薇诺娜的发电机 检查状态：已经烧毁
        },
        WINONA_BATTERY_HIGH =
        {
			GENERIC = "这不合常理。",		--物品名：薇诺娜的宝石发电机 检查状态：普通状态
			LOWPOWER = "所剩无几了。",		--物品名：薇诺娜的宝石发电机 检查状态：电力不足
			OFF = "科学总能赢过魔法。",		--物品名：薇诺娜的宝石发电机 检查状态：处于关闭状态
			BURNING = "火势上来了。",		--物品名：薇诺娜的宝石发电机 检查状态：正在燃烧
			BURNT = "它没能撑过去。",		--物品名：薇诺娜的宝石发电机 检查状态：已经烧毁
			OVERLOADED = "要炸了。……抱歉，旧习惯罢了。",		--物品名：薇诺娜的宝石发电机 检查状态：电力网络过载
        },
		WINONA_REMOTE =
		{
			GENERIC = "她大概忘了给机器装按钮。",		--物品名：称手遥控器 检查状态：普通状态
			OFF = "还不通电。",		--物品名：称手遥控器 检查状态：处于关闭状态
			CHARGING = "正在充能。手别抖。",		--物品名：称手遥控器 检查状态：正在充能
			CHARGED = "充好了。可以按了。",		--物品名：称手遥控器 检查状态：已经充能
		},
		WINONA_TELEBRELLA =
		{
			GENERIC = "薇诺娜还在琢磨。",		--物品名：传送伞 检查状态：普通状态
            MISSINGSKILL = "设计有趣。可惜我还差些手艺。",		--物品名：传送伞 检查状态：当前角色尚未解锁所需技能
			OFF = "没电。",		--物品名：传送伞 检查状态：处于关闭状态
			CHARGING = "还在充能。耐心些。",		--物品名：传送伞 检查状态：正在充能
			CHARGED = "能量满了。",		--物品名：传送伞 检查状态：已经充能
		},
		WINONA_TELEPORT_PAD_ITEM =
		{
			GENERIC = "位移理论的产物。从这里，到那里。",		--物品名：传送运输站 检查状态：普通状态
            MISSINGSKILL = "构思巧妙。我暂时造不出来。",		--物品名：传送运输站 检查状态：当前角色尚未解锁所需技能
			OFF = "得先通电。",		--物品名：传送运输站 检查状态：处于关闭状态
			BURNING = "烧着了。",		--物品名：传送运输站 检查状态：正在燃烧
			BURNT = "烧毁。无从修补。",		--物品名：传送运输站 检查状态：已经烧毁
		},
		WINONA_STORAGE_ROBOT =
		{
			GENERIC = "一筒螺栓。倒也乖巧。",		--物品名：薇机人 检查状态：普通状态
			OFF = "在歇着？她倒是体贴。",		--物品名：薇机人 检查状态：处于关闭状态
			SLEEP = "休眠。螺栓不会做梦。",		--物品名：薇机人 检查状态：设备处于休眠状态
			CHARGING = "充能中。别去打扰。",		--物品名：薇机人 检查状态：正在充能
			CHARGED = "满了。它能干活了。",		--物品名：薇机人 检查状态：已经充能
		},
		INSPECTACLESBOX = "借几样东西。她不会介意。",		--物品名：藏物箱
		INSPECTACLESBOX2 = "收获颇丰。",		--物品名：高级藏物箱
		INSPECTACLESHAT = 
        {
            GENERIC = "薇诺娜一向看得比旁人远。",		--物品名：检查专用镜 检查状态：普通状态
            MISSINGSKILL = "这镜片的规格，我很想知道。",		--物品名：检查专用镜 检查状态：当前角色尚未解锁所需技能
        },
		ROSEGLASSESHAT =
        {
            GENERIC = "和薇诺娜的手笔略有出入。",		--物品名：玫瑰色眼镜 检查状态：普通状态
            MISSINGSKILL = "他们身上有某种东西，让我想起查理。",		--物品名：玫瑰色眼镜 检查状态：当前角色尚未解锁所需技能
        },
		CHARLIERESIDUE = "又错过了她。……不过她留了东西。",		--物品名：黑暗痕迹
		CHARLIEROSE = "查理。你这次要拉我进什么事？",		--物品名：脆弱玫瑰
        WINONA_MACHINEPARTS_1 = "这种零件，外面买不到。",		--物品名：小玩意
        WINONA_MACHINEPARTS_2 = "这个，用处不小。",		--物品名：小机械
		WINONA_RECIPESCANNER = "扫一遍，我便知道它是怎么造的。",		--物品名：校准观察机
		WINONA_HOLOTELEPAD = "旧图纸。值得扫一遍。",		--物品名：不稳定传输
		WINONA_HOLOTELEBRELLA = "该用校准观察机扫它一遍。",		--物品名：不稳定传输

        COMPOSTWRAP = "沃姆伍德让我尝，我婉拒了。",		--物品名：肥料包
        ARMOR_BRAMBLE = "守得住，才算赢。",		--物品名：荆棘外壳
        TRAP_BRAMBLE = "踩上去的，都会记住这一下。",		--物品名：荆棘陷阱

        BOATFRAGMENT03 = "只剩这一块了。",		--物品名：船碎片
        BOATFRAGMENT04 = "船板。残得只剩这些。",		--物品名：船碎片
        BOATFRAGMENT05 = "碎得不成样子。",		--物品名：船碎片
		BOAT_LEAK = "有漏。不补就沉。",		--物品名：漏洞
        MAST = "桅杆。船有骨头了。",		--物品名：桅杆
        SEASTACK = "一块石头。孤零零的。",		--物品名：海蚀柱
        FISHINGNET = "一张网。编得还算密，喵。", 		--物品名：渔网
        ANTCHOVIES = "这个……能扔回去吗？", 		--物品名：蚁头凤尾鱼
        STEERINGWHEEL = "掌舵的手感，不错。",		--物品名：方向舵
        ANCHOR = "船不该自己漂走。",		--物品名：锚
        BOATPATCH = "以备万一。",		--物品名：船补丁
        DRIFTWOOD_TREE =
        {
            BURNING = "浮木在烧。",		--物品名：浮木 检查状态：正在燃烧
            BURNT = "烧过了。没什么可取的。",		--物品名：浮木 检查状态：已经烧毁
            CHOPPED = "还值得再挖一挖。",		--物品名：浮木 检查状态：已经砍伐
            GENERIC = "枯木。被浪推上岸。",		--物品名：浮木 检查状态：普通状态
        },

        DRIFTWOOD_LOG = "轻。浮得起来。",		--物品名：浮木桩

        MOON_TREE =
        {
            BURNING = "月树在烧。",		--物品名：月树 检查状态：正在燃烧
            BURNT = "烧尽了。月木也怕火。",		--物品名：月树 检查状态：已经烧毁
            CHOPPED = "树干很粗。可惜了。",		--物品名：月树 检查状态：已经砍伐
            GENERIC = "月亮上竟也长树。",		--物品名：月树 检查状态：普通状态
        },
		MOON_TREE_BLOSSOM = "月树的花。落在我脚边，喵。",		--物品名：月树花

        MOONBUTTERFLY =
        {
        	GENERIC = "月蛾。翅膀上有月光，喵。",		--物品名：月蛾 检查状态：普通状态
        	HELD = "抓到你了。",		--物品名：月蛾 检查状态：正被角色携带
        },
		MOONBUTTERFLYWINGS = "翅膀很美。可惜离了身。",		--物品名：月蛾翅膀
        MOONBUTTERFLY_SAPLING = "蛾子化作树。月光真是任性。",		--物品名：月树苗
        ROCK_AVOCADO_FRUIT = "硬得很。会崩牙。",		--物品名：石果
        ROCK_AVOCADO_FRUIT_RIPE = "没煮透的核果，最难入口。",		--物品名：成熟石果
        ROCK_AVOCADO_FRUIT_RIPE_COOKED = "软了。可以吃了。",		--物品名：熟石果
        ROCK_AVOCADO_FRUIT_SPROUT = "在发芽。",		--物品名：发芽的石果
        ROCK_AVOCADO_BUSH =
        {
        	BARREN = "结果的日子过去了。",		--物品名：石果灌木丛 检查状态：资源枯竭，需要施肥
			WITHERED = "热坏了。叶子都卷了。",		--物品名：石果灌木丛 检查状态：已经枯萎
			GENERIC = "来自月亮的灌木。",		--物品名：石果灌木丛 检查状态：普通状态
			PICKED = "摘空了。要等下一轮。",		--物品名：石果灌木丛 检查状态：已经采集
			DISEASED = "病得重了。", 		--物品名：石果灌木丛 检查状态：已经患病
            DISEASING = "有些不对。……我闻得出来。", 		--物品名：石果灌木丛 检查状态：正在进入患病阶段
			BURNING = "在烧。",		--物品名：石果灌木丛 检查状态：正在燃烧
		},
        DEAD_SEA_BONES = "上了岸，便落得这副模样。",		--物品名：海骨
        HOTSPRING =
        {
        	GENERIC = "若能泡一泡，疲倦便散了。",		--物品名：温泉 检查状态：普通状态
        	BOMBED = "不过是一场反应。",		--物品名：温泉 检查状态：被沐浴球处理过
        	GLASS = "月光把水凝成了玻璃。",		--物品名：温泉 检查状态：温泉水面已经结晶
			EMPTY = "那我等它再满起来。",		--物品名：温泉 检查状态：内容为空
        },
        MOONGLASS = "边缘极利。小心拿。",		--物品名：月亮碎片
        MOONGLASS_CHARGED = "趁能量未尽，找个体面的用途。",		--物品名：注能月亮碎片
        MOONGLASS_ROCK = "能照见我的倒影。还算清楚。",		--物品名：月光玻璃
        BATHBOMB = "教科书般的反应。",		--物品名：沐浴球
        TRAP_STARFISH =
        {
            GENERIC = "一只小海星。模样讨喜。",		--物品名：海星 检查状态：普通状态
            CLOSED = "它差点咬到我。",		--物品名：海星 检查状态：处于关闭状态
        },
        DUG_TRAP_STARFISH = "它骗不了第二次。",		--物品名：海星陷阱
        SPIDER_MOON =
        {
        	GENERIC = "月亮让它变了样子。",		--物品名：破碎蜘蛛 检查状态：普通状态
        	SLEEPING = "不动了。很好。",		--物品名：破碎蜘蛛 检查状态：正在睡眠
        	DEAD = "死透了。",		--物品名：破碎蜘蛛 检查状态：已经死亡
        },
        MOONSPIDERDEN = "这不是寻常的蛛巢。",		--物品名：破碎蜘蛛洞
		FRUITDRAGON =
		{
			GENERIC = "长得讨喜。可惜还没熟。",		--物品名：沙拉蝾螈 检查状态：普通状态
			RIPE = "熟了。气味变了。",		--物品名：沙拉蝾螈 检查状态：已经成熟
			SLEEPING = "在打盹。声音轻些。",		--物品名：沙拉蝾螈 检查状态：正在睡眠
		},
        PUFFIN =
        {
            GENERIC = "活的海鹦，我是第一次见。",		--物品名：海鹦鹉 检查状态：普通状态
            HELD = "捉到一只。值得一记。",		--物品名：海鹦鹉 检查状态：正被角色携带
            SLEEPING = "睡得沉。",		--物品名：海鹦鹉 检查状态：正在睡眠
        },

		MOONGLASSAXE = "刃口很好。我用得顺手。",		--物品名：月光玻璃斧
		GLASSCUTTER = "刀不错。可惜我用不惯。",		--物品名：玻璃刀

        ICEBERG =
        {
            GENERIC = "那东西，绕开为好。", 		--物品名：迷你冰山 检查状态：普通状态
            MELTED = "化尽了。", 		--物品名：迷你冰山 检查状态：已经融化
        },
        ICEBERG_MELTED = "一点没剩。", 		--物品名：融化的迷你冰山

        MINIFLARE = "点一发，让他们知道我在。",		--物品名：信号弹
        MEGAFLARE = "它会让所有存在都知道我在此。",		--物品名：敌对信号弹

		MOON_FISSURE =
		{
			GENERIC = "平静与恐惧，在我脑中同时作响。",		--物品名：天体裂缝 检查状态：普通状态
			NOLIGHT = "裂隙在扩大。看得见了。",		--物品名：天体裂缝 检查状态：裂隙尚未发光
		},
        MOON_ALTAR =
        {
            MOON_ALTAR_WIP = "它想被完成。",		--物品名：天体祭坛 检查状态：月亮祭坛仍在组装
            GENERIC = "唔？你刚才说什么？",		--物品名：天体祭坛 检查状态：普通状态
        },

        MOON_ALTAR_IDOL = "我有种强烈的念头，想把它搬走。",		--物品名：天体祭坛雕像
        MOON_ALTAR_GLASS = "它不愿待在地上。",		--物品名：天体祭坛底座
        MOON_ALTAR_SEED = "它想让我给它一个位置。",		--物品名：天体祭坛宝球

        MOON_ALTAR_ROCK_IDOL = "里面封着东西。",		--物品名：吸引人的结构
        MOON_ALTAR_ROCK_GLASS = "内里有物。",		--物品名：吸引人的结构
        MOON_ALTAR_ROCK_SEED = "里面不空。",		--物品名：吸引人的结构

        MOON_ALTAR_CROWN = "钓上来了。现在去找裂隙。",		--物品名：未激活天体贡品
        MOON_ALTAR_COSMIC = "它在等一件事发生。",		--物品名：天体贡品

        MOON_ALTAR_ASTRAL = "它只是更大机关的一角。",		--物品名：天体圣殿
        MOON_ALTAR_ICON = "该放哪里，我知道。",		--物品名：天体圣殿象征
        MOON_ALTAR_WARD = "它该和其余几件放在一处。",		--物品名：天体圣殿卫戍

        SEAFARING_PROTOTYPER =
        {
            GENERIC = "是不是该谢我一句。",		--物品名：智囊团 检查状态：普通状态
            BURNT = "到了海上，学问也会丢。",		--物品名：智囊团 检查状态：已经烧毁
        },
        BOAT_ITEM = "在水上做试验，不坏。",		--物品名：船套装
        BOAT_GRASS_ITEM = "严格来说，这也算船。",		--物品名：草筏套装
        STEERINGWHEEL_ITEM = "能拼出一只舵。",		--物品名：方向舵套装
        ANCHOR_ITEM = "有锚了。",		--物品名：锚套装
        MAST_ITEM = "桅杆也能造了。",		--物品名：桅杆套装
        MUTATEDHOUND =
        {
        	DEAD = "可以喘口气了。",		--物品名：恐怖猎犬 检查状态：已经死亡
        	GENERIC = "这东西不该存在。",		--物品名：恐怖猎犬 检查状态：普通状态
        	SLEEPING = "本能叫我快走。",		--物品名：恐怖猎犬 检查状态：正在睡眠
        },

        MUTATED_PENGUIN =
        {
			DEAD = "到尽头了。",		--物品名：永冻企鸥 检查状态：已经死亡
			GENERIC = "它不该是这副样子。",		--物品名：永冻企鸥 检查状态：普通状态
			SLEEPING = "好在它在睡。",		--物品名：永冻企鸥 检查状态：正在睡眠
		},
        CARRAT =
        {
        	DEAD = "结束了。",		--物品名：胡萝卜鼠 检查状态：已经死亡
        	GENERIC = "胡萝卜居然长了腿。",		--物品名：胡萝卜鼠 检查状态：普通状态
        	HELD = "近看，实在不体面。",		--物品名：胡萝卜鼠 检查状态：正被角色携带
        	SLEEPING = "睡着了，倒有点可爱，喵。",		--物品名：胡萝卜鼠 检查状态：正在睡眠
        },

		BULLKELP_PLANT =
        {
            GENERIC = "海带。成色不坏。",		--物品名：公牛海带 检查状态：普通状态
            PICKED = "采过了。等它再长。",		--物品名：公牛海带 检查状态：已经采集
        },
		BULLKELP_ROOT = "能种在深水里。",		--物品名：公牛海带茎
        KELPHAT = "想舒服，先忍一忍。",		--物品名：海花环
		KELP = "湿透了。真讨厌，喵。",		--物品名：海带叶
		KELP_COOKED = "煮软了，黏。",		--物品名：熟海带叶
		KELP_DRIED = "咸得过分了。",		--物品名：干海带叶

		GESTALT = "它似乎能给我……一些知识。",		--物品名：虚影
        GESTALT_GUARD = "它说，靠太近就要我好看。",		--物品名：大虚影

		COOKIECUTTER = "它看船的眼神……我不喜欢。",		--物品名：饼干切割机
		COOKIECUTTERSHELL = "牙还在，壳已空。",		--物品名：饼干切割机壳
		COOKIECUTTERHAT = "至少不会弄湿我的头发。",		--物品名：饼干切割机帽子
		SALTSTACK =
		{
			GENERIC = "是天然长成的？",		--物品名：盐堆 检查状态：普通状态
			MINED_OUT = "采空了。一点没留。",		--物品名：盐堆 检查状态：已经采空
			GROWING = "它自己就会长成这副模样。",		--物品名：盐堆 检查状态：正在生长
		},
		SALTROCK = "有个念头催我去舔一下。",		--物品名：盐晶
		SALTBOX = "食物能多存几日了，喵。",		--物品名：盐盒

		TACKLESTATION = "海钓的事，该整理了。",		--物品名：钓具容器
		TACKLESKETCH = "某件钓具的图。我自己也能做。",		--物品名：{item}广告

        MALBATROSS = "好大一只鸟。",		--物品名：邪天翁
        MALBATROSS_FEATHER = "羽毛漂亮。从大鸟身上落的。",		--物品名：邪天翁羽毛
        MALBATROSS_BEAK = "有鱼腥味。",		--物品名：邪天翁喙
        MAST_MALBATROSS_ITEM = "比看上去轻。",		--物品名：飞翼风帆套装
        MAST_MALBATROSS = "展翼，出海，喵。",		--物品名：飞翼风帆
		MALBATROSS_FEATHERED_WEAVE = "我纺的羽被。会很软，喵。",		--物品名：羽毛帆布

        GNARWAIL =
        {
            GENERIC = "你的角，长得很气派。",		--物品名：一角鲸 检查状态：普通状态
            BROKENHORN = "你的角断了。",		--物品名：一角鲸 检查状态：角已经折断
            FOLLOWER = "鲸鱼。跟着我也好。",		--物品名：一角鲸 检查状态：已经成为当前角色的跟随者
            BROKENHORN_FOLLOWER = "到处乱伸角，就是这个下场。",		--物品名：一角鲸 检查状态：已跟随当前角色且角已折断
        },
        GNARWAIL_HORN = "不可思议。收进柜子里吧。",		--物品名：一角鲸的角

        WALKINGPLANK = "不能造一艘救生船么。",		--物品名：跳板
        WALKINGPLANK_GRASS = "我更愿要一条救生船。",		--物品名：跳板
        OAR = "靠臂力。",		--物品名：桨
		OAR_DRIFTWOOD = "浮木为桨，也算趁手。",		--物品名：浮木桨

		OCEANFISHINGROD = "这才是像样的海钓竿。",		--物品名：海钓竿
		OCEANFISHINGBOBBER_NONE = "加个浮漂，准头会好。",		--物品名：鱼钩
        OCEANFISHINGBOBBER_BALL = "鱼会喜欢这个球。",		--物品名：木球浮漂
        OCEANFISHINGBOBBER_OVAL = "这次，它们逃不出我的爪子。",		--物品名：硬物浮漂
		OCEANFISHINGBOBBER_CROW = "我吃鱼。乌鸦免了。",		--物品名：黑羽浮漂
		OCEANFISHINGBOBBER_ROBIN = "红色浮漂。但愿它只引来鱼。",		--物品名：红羽浮漂

		OCEANFISHINGBOBBER_ROBIN_WINTER = "冬天的羽毛。颜色很克制。",		--物品名：蔚蓝羽浮漂
		OCEANFISHINGBOBBER_CANARY = "这抹黄，鱼儿会多看两眼。",		--物品名：黄羽浮漂
		OCEANFISHINGBOBBER_GOOSE = "鹅羽浮起时，鱼就无处可逃。",		--物品名：鹅羽浮漂
		OCEANFISHINGBOBBER_MALBATROSS = "邪天翁的羽毛。难得一见。",		--物品名：邪天翁羽浮漂

		OCEANFISHINGLURE_SPINNER_RED = "日出色的亮片。鱼会信以为真。",		--物品名：日出旋转亮片
		OCEANFISHINGLURE_SPINNER_GREEN = "黄昏的光泽。正适合骗鱼。",		--物品名：黄昏旋转亮片
		OCEANFISHINGLURE_SPINNER_BLUE = "夜色的亮片。鱼看不清，正好。",		--物品名：夜间旋转亮片
		OCEANFISHINGLURE_SPOON_RED = "匙形的饵。小鱼最容易咬。",		--物品名：日出匙型假饵
		OCEANFISHINGLURE_SPOON_GREEN = "黄昏色的勺饵。愿者上钩。",		--物品名：黄昏匙型假饵
		OCEANFISHINGLURE_SPOON_BLUE = "暗色的小勺。骗小鱼足够了。",		--物品名：夜间匙型假饵
		OCEANFISHINGLURE_HERMIT_RAIN = "要懂鱼的心思，得先沾点水。",		--物品名：雨天鱼饵
		OCEANFISHINGLURE_HERMIT_SNOW = "雪天里动手，鱼看不清是谁。",		--物品名：雪天鱼饵
		OCEANFISHINGLURE_HERMIT_DROWSY = "麻醉的饵。有学问兜底。",		--物品名：麻醉鱼饵
		OCEANFISHINGLURE_HERMIT_HEAVY = "沉甸甸的。分量不轻。",		--物品名：重量级鱼饵

		OCEANFISH_SMALL_1 = "小家伙。还不够塞牙，喵。",		--物品名：小孔雀鱼
		OCEANFISH_SMALL_2 = "这般尺寸，不值一提。",		--物品名：针鼻喷墨鱼
		OCEANFISH_SMALL_3 = "尚且年幼。放它一马？不。",		--物品名：小饵鱼
		OCEANFISH_SMALL_4 = "幼鱼而已。成不了气候。",		--物品名：三文鱼苗
		OCEANFISH_SMALL_5 = "一口的量。我不客气了。",		--物品名：爆米花鱼
		OCEANFISH_SMALL_6 = "叶形的鱼。倒是应景。",		--物品名：落叶比目鱼
		OCEANFISH_SMALL_7 = "开花的鱼。总算到手。",		--物品名：花朵金枪鱼
		OCEANFISH_SMALL_8 = "烫。别碰我的爪子。",		--物品名：炽热太阳鱼
		OCEANFISH_SMALL_9 = "随口一说。你总归有用。",		--物品名：口水鱼

		OCEANFISH_MEDIUM_1 = "相貌不佳。但愿味道能补救。",		--物品名：泥鱼
		OCEANFISH_MEDIUM_2 = "费了不少力气。值不值另说。",		--物品名：斑鱼
		OCEANFISH_MEDIUM_3 = "钓鱼这事，我不曾失手。",		--物品名：浮夸狮子鱼
		OCEANFISH_MEDIUM_4 = "通体漆黑。但愿不带晦气。",		--物品名：黑鲶鱼
		OCEANFISH_MEDIUM_5 = "颜色俗了些。仅此而已。",		--物品名：玉米鳕鱼
		OCEANFISH_MEDIUM_6 = "肥美。今晚有口福了，喵。",		--物品名：花锦鲤
		OCEANFISH_MEDIUM_7 = "金色的一条。分量十足。",		--物品名：金锦鲤
		OCEANFISH_MEDIUM_8 = "冰鲷。摸上去还凉着。",		--物品名：冰鲷鱼
		OCEANFISH_MEDIUM_9 = "甜味。是收获的滋味。",		--物品名：甜味鱼

		PONDFISH = "这一条，够我吃一整天。",		--物品名：淡水鱼
		PONDEEL = "能成一道好菜。只要火候对。",		--物品名：活鳗鱼

		FISHMEAT = "一块鱼肉。仅此而已。",		--物品名：生鱼肉
		FISHMEAT_COOKED = "火候正好。上桌吧，喵。",		--物品名：鱼排
		FISHMEAT_SMALL = "一小块。聊胜于无。",		--物品名：小鱼块
		FISHMEAT_SMALL_COOKED = "熟的一小块。勉强够数。",		--物品名：熟小鱼块
		SPOILED_FISH =
		{
			GENERIC = "这气味。我不打算追究来源。",		--物品名：变质的鱼 检查状态：普通状态
			CAN_PROCESS = "让开。这东西只配进堆肥。",		--物品名：变质的鱼 检查状态：可放入堆肥设施处理
		},

		FISH_BOX = "塞得满满当当。像沙丁鱼那样，喵。",		--物品名：锡鱼罐
		POCKET_SCALE = "简陋的秤。勉强能用。",		--物品名：弹簧秤

		TACKLECONTAINER = "多出来的收纳。我不讨厌。",		--物品名：钓具箱
		SUPERTACKLECONTAINER = "费了些周折才到手。",		--物品名：超级钓具箱

		TROPHYSCALE_FISH =
		{
			GENERIC = "来。看看我今日的收获。",		--物品名：鱼类计重器 检查状态：普通状态
			HAS_ITEM = "重量: {weight}\n钓手: {owner}",		--物品名：鱼类计重器 检查状态：已经放置物品
			HAS_ITEM_HEAVY = "重量: {weight}\n钓手: {owner}\n收获不俗。",		--物品名：鱼类计重器 检查状态：放置物品重量较大
			BURNING = "若论火势，我给它满分。",		--物品名：鱼类计重器 检查状态：正在燃烧
			BURNT = "我的战果，全成灰了。",		--物品名：鱼类计重器 检查状态：已经烧毁
			OWNER = "并非炫耀。随意看看便好。\n重量: {weight}\n钓手: {owner}",		--物品名：鱼类计重器 检查状态：当前角色是秤上物品的主人
			OWNER_HEAVY = "重量: {weight}\n钓手: {owner}\n确实钓到一条大的。",		--物品名：鱼类计重器 检查状态：当前角色拥有秤上的重型物品
		},

		OCEANFISHABLEFLOTSAM = "沾了泥的草。仅此而已。",		--物品名：海洋残骸

		CALIFORNIAROLL = "可惜我手边没有筷子，喵。",		--物品名：加州卷
		SEAFOODGUMBO = "一大碗。海里的东西都在里头。",		--物品名：海鲜浓汤
		SURFNTURF = "恰到好处。无可挑剔。",		--物品名：海鲜牛排

		WOBSTER_SHELLER = "一只调皮的龙虾。钳子不小。",		--物品名：龙虾
		WOBSTER_DEN = "石头里藏着龙虾。别伸手。",		--物品名：龙虾窝
		WOBSTER_SHELLER_DEAD = "下锅之后会好得多。",		--物品名：死龙虾
		WOBSTER_SHELLER_DEAD_COOKED = "不必再等了。就是现在，喵。",		--物品名：美味的龙虾

		LOBSTERBISQUE = "盐可以再添一点。与我无关。",		--物品名：龙虾汤
		LOBSTERDINNER = "清晨吃它，还算正餐么。",		--物品名：龙虾正餐

		WOBSTER_MOONGLASS = "月光下的一只。同样调皮。",		--物品名：月光龙虾
		MOONGLASS_WOBSTER_DEN = "月光玻璃里，藏着月光龙虾。",		--物品名：月光玻璃窝

		TRIDENT = "三叉落下，动静不小。",		--物品名：刺耳三叉戟

		WINCH =
		{
			GENERIC = "需要的时候，它能出力。",		--物品名：夹夹绞盘 检查状态：普通状态
			RETRIEVING_ITEM = "粗重活计，交给它便是。",		--物品名：夹夹绞盘 检查状态：绞盘正在收回物品
			HOLDING_ITEM = "吊上来的。会是什么东西。",		--物品名：夹夹绞盘 检查状态：绞盘正吊着物品
		},

		HERMITHOUSE = {
			GENERIC = "一座空房子。还没有人味。",		--物品名：隐士之家 检查状态：普通状态
			BUILTUP = "只差一点点照料。",		--物品名：隐士之家 检查状态：房屋已经完成升级
		},

		SHELL_CLUSTER = "里面该有不少好贝壳，喵。",		--物品名：贝壳堆
		SINGINGSHELL_OCTAVE3 =
		{
			GENERIC = "音偏低了些。",		--物品名：低音贝壳钟 检查状态：普通状态
		},
		SINGINGSHELL_OCTAVE4 =
		{
			GENERIC = "这就是海的声音么。",		--物品名：中音贝壳钟 检查状态：普通状态
		},
		SINGINGSHELL_OCTAVE5 =
		{
			GENERIC = "它能唱到高音C。",		--物品名：高音贝壳钟 检查状态：普通状态
		},

		CHUM = "鱼的口粮。闻着不太好。",		--物品名：鱼食

		SUNKENCHEST =
		{
			GENERIC = "真正的所得，是寻宝本身。",		--物品名：沉底宝箱 检查状态：普通状态
			LOCKED = "贝壳合上了。",		--物品名：沉底宝箱 检查状态：处于锁定状态
		},

		HERMIT_BUNDLE = "这些，她多得是，喵。",		--物品名：一包谢意
		HERMIT_BUNDLE_SHELLS = "她确实做贝壳的买卖。",		--物品名：贝壳钟包

		RESKIN_TOOL = "这粉尘。颇对我的胃口。",		--物品名：清洁扫把
		MOON_FISSURE_PLUGGED = "不合学理。却确实有用。",		--物品名：堵住的裂缝



		WOBYBIG =
		{
			"你给她喂了什么。以学问之名。",		--物品名：沃比 检查状态：第1条台词变体
			"以学问之名，你喂了她什么。",		--物品名：沃比 检查状态：第2条台词变体
		},
		WOBYSMALL =
		{
			"有据可查：养狗能宽心。",		--物品名：沃比 检查状态：第1条台词变体
			"养狗有益心情。这话有依据。",		--物品名：沃比 检查状态：第2条台词变体
		},
		WALTERHAT = "年轻时的我，也不喜“户外”。",		--物品名：松树先锋队帽子
		SLINGSHOT =
		{
			GENERIC = "凡是玻璃，都怕它。",		--物品名：可靠的弹弓 检查状态：普通状态
			NOT_MINE = "不属于我的，不该碰。",		--物品名：可靠的弹弓 检查状态：不属于当前角色
		},
		SLINGSHOTAMMO_ROCK = "下一发就是它。",		--物品名：鹅卵石
		SLINGSHOTAMMO_MARBLE = "大理石弹。出手很稳。",		--物品名：大理石弹
		SLINGSHOTAMMO_THULECITE = "铥石弹。带着诅咒。",		--物品名：诅咒弹药
		SLINGSHOTAMMO_GOLD = "金弹。贵，但好用。",		--物品名：黄金弹药
		SLINGSHOTAMMO_HONEY = "黏的。沾上就麻烦。",		--物品名：黏黏弹
		SLINGSHOTAMMO_SLOW = "它会让对方慢下来。",		--物品名：减速弹药
		SLINGSHOTAMMO_FREEZE = "冻住。省些力气。",		--物品名：冰冻弹药
		SLINGSHOTAMMO_POOP = "不太体面。但确实有效。",		--物品名：便便弹
		SLINGSHOTAMMO_STINGER = "带刺的。会叮人。",		--物品名：针刺弹
		SLINGSHOTAMMO_MOONGLASS = "月石弹。光倒好看。",		--物品名：月亮弹
		SLINGSHOTAMMO_GELBLOB = "黏稠的东西。别沾手。",		--物品名：恶液弹
		SLINGSHOTAMMO_SCRAPFEATHER = "废料做的。带着电。",		--物品名：电击废料弹
		SLINGSHOTAMMO_DREADSTONE = "绝望凝成的小石子。",		--物品名：绝望小石
		SLINGSHOTAMMO_GUNPOWDER = "会响。请捂耳。",		--物品名：轰轰弹
		SLINGSHOTAMMO_LUNARPLANTHUSK = "亮茄的壳。硬得可以。",		--物品名：亮茄外壳弹药
		SLINGSHOTAMMO_PUREBRILLIANCE = "纯粹的辉煌。刺眼。",		--物品名：纯粹辉煌弹药
		SLINGSHOTAMMO_HORRORFUEL = "恐惧装进弹药。合适。",		--物品名：纯粹恐惧弹药
		PORTABLETENT = "许久没睡过安稳觉了。",		--物品名：宿营帐篷
		PORTABLETENT_ITEM = "有了帐篷，也别得意。",		--物品名：帐篷卷

		BATTLESONG_DURABILITY = "戏文于我，坐立难安。",		--物品名：武器化的颤音
		BATTLESONG_HEALTHGAIN = "歌谣。听着有些心酸。",		--物品名：心碎歌谣
		BATTLESONG_SANITYGAIN = "华彩。倒还提神。",		--物品名：醍醐灌顶华彩
		BATTLESONG_SANITYAURA = "美声颂。勇气也能唱出来。",		--物品名：英勇美声颂
		BATTLESONG_FIRERESISTANCE = "看戏前烧了背心一个洞。我称之戏剧性熨烫。",		--物品名：防火假声
		BATTLESONG_INSTANT_TAUNT = "我可不是持照的诗人。",		--物品名：粗鲁插曲
		BATTLESONG_INSTANT_PANIC = "诗人这行，我不持照。",		--物品名：惊心独白

		MUTATOR_WARRIOR = "韦伯，这份涂鸦……我不打算尝。",		--物品名：战士变身涂鸦
		MUTATOR_DROPPER = "我刚用过饭。给你的蜘蛛朋友吧。",		--物品名：悬蛛变身涂鸦
		MUTATOR_HIDER = "这份涂鸦，我看你自己留着更好。",		--物品名：洞穴变身涂鸦
		MUTATOR_SPITTER = "我方才用过饭。真的。你留着。",		--物品名：喷吐变身涂鸦
		MUTATOR_MOON = "这份涂鸦，我敬谢不敏。",		--物品名：破碎变身涂鸦
		MUTATOR_HEALER = "好意心领。涂鸦就不必了。",		--物品名：护士变身涂鸦
		SPIDER_WHISTLE = "别吹。我不想招来蜘蛛。",		--物品名：韦伯口哨
		SPIDERDEN_BEDAZZLER = "某人的手艺，见长了。",		--物品名：蛛巢装饰套装
		SPIDER_HEALER = "蜘蛛会自愈了。真是好消息。",		--物品名：护士蜘蛛
		SPIDER_REPELLENT = "若能为我所用，倒值得研究。",		--物品名：驱赶盒子
		SPIDER_HEALER_ITEM = "见着蜘蛛，我会转交。也许。",		--物品名：治疗黏团

		GHOSTLYELIXIR_SLOWREGEN = "嗯。很有章法。",		--物品名：亡者补药
		GHOSTLYELIXIR_FASTREGEN = "灵魂的药。颇有讲究。",		--物品名：灵魂万灵药
		GHOSTLYELIXIR_SHIELD = "不屈。名字起得不错。",		--物品名：不屈药剂
		GHOSTLYELIXIR_ATTACK = "夜影调的。气味刺鼻。",		--物品名：夜影万金油
		GHOSTLYELIXIR_SPEED = "精油。步子会轻些。",		--物品名：强健精油
		GHOSTLYELIXIR_RETALIATION = "复仇也能蒸馏。有趣。",		--物品名：蒸馏复仇
		GHOSTLYELIXIR_REVIVE = "这东西，最好别用上。",		--物品名：恐怖经历
		SISTURN =
		{
			GENERIC = "添些花，会好看得多。",		--物品名：姐妹骨灰罐 检查状态：普通状态
			SOME_FLOWERS = "再多些花，也就够了。",		--物品名：姐妹骨灰罐 检查状态：放置了少量花朵
			LOTS_OF_FLOWERS = "这束花。开得正好。",		--物品名：姐妹骨灰罐 检查状态：放置了大量普通花朵
			LOTS_OF_FLOWERS_EVIL = "这些花。让我不安。",		--物品名：姐妹骨灰罐 检查状态：放置了大量恶魔花
			LOTS_OF_FLOWERS_BLOSSOM = "声音很怪。别久留。",		--物品名：姐妹骨灰罐 检查状态：放置了大量月树花
		},

		WORTOX_SOUL = "灵魂。看着竟不错。", 		--物品名：灵魂
		WORTOX_NABBAG = "和坎普斯一个模子刻的。",		--物品名：强抢袋
		WORTOX_REVIVER = "它的用处，我猜得到。",		--物品名：双尾心
		WORTOX_SOULJAR = "细想之下，这罐子不寻常。",		--物品名：灵魂罐

		PORTABLECOOKPOT_ITEM =
		{
			GENERIC = "这才叫烹饪。",		--物品名：便携烹饪锅 检查状态：普通状态
			DONE = "好了。可以开饭，喵。",		--物品名：便携烹饪锅 检查状态：处理已经完成

			COOKING_LONG = "还需要些时候。急不得。",		--物品名：便携烹饪锅 检查状态：正在烹饪，剩余时间较长
			COOKING_SHORT = "就快好了。",		--物品名：便携烹饪锅 检查状态：正在烹饪，即将完成
			EMPTY = "空的。不必掀盖。",		--物品名：便携烹饪锅 检查状态：内容为空
		},

		PORTABLEBLENDER_ITEM = "把食材都搅在一起。",		--物品名：便携研磨器
		PORTABLESPICER_ITEM =
		{
			GENERIC = "香料。能给菜添些层次。",		--物品名：便携香料站 检查状态：普通状态
			DONE = "该会更可口些。",		--物品名：便携香料站 检查状态：处理已经完成
		},
		SPICEPACK = "厨艺的一小步。",		--物品名：厨师袋
		SPICE_GARLIC = "粉末。气味很有威力。",		--物品名：蒜粉
		SPICE_SUGAR = "甜。甜得毫不掩饰，喵。",		--物品名：蜂蜜水晶
		SPICE_CHILI = "一壶液态的火。",		--物品名：辣椒碎
		SPICE_SALT = "钠。适量便好。",		--物品名：调味盐
		MONSTERTARTARE = "这附近总该有别的可吃。",		--物品名：怪物鞑靼
		FRESHFRUITCREPES = "甜果。早餐该有的样子。",		--物品名：鲜果可丽饼
		FROGFISHBOWL = "鱼腹里，竟塞着一只蛙。",		--物品名：蓝带鱼排
		POTATOTORNADO = "土豆。卷着龙卷风的力气。",		--物品名：花式回旋块茎
		DRAGONCHILISALAD = "辣度。但愿我承受得住。",		--物品名：辣龙椒沙拉
		GLOWBERRYMOUSSE = "沃利的手艺，确实好。",		--物品名：发光浆果慕斯
		VOLTGOATJELLY = "出人意料的好，喵。",		--物品名：伏特羊肉冻
		NIGHTMAREPIE = "这一口，有点吓人。",		--物品名：恐怖国王饼
		BONESOUP = "沃利骨子里就是个厨子。",		--物品名：骨头汤
		MASHEDPOTATOES = "听说烹饪近乎化学。我该试试。",		--物品名：奶油土豆泥
		POTATOSOUFFLE = "可口的饭菜，我快忘了滋味。",		--物品名：蓬松土豆蛋奶酥
		MOQUECA = "他的才华在锅里。我的在纸上。",		--物品名：海鲜杂烩
		GAZPACHO = "不讲道理。怎么这样好吃。",		--物品名：芦笋冷汤
		ASPARAGUSSOUP = "气味很好。值得一试。",		--物品名：芦笋汤
		VEGSTINGER = "芹菜能做吸管么。",		--物品名：蔬菜鸡尾酒
		BANANAPOP = "别冻我的脑子。它还有用。",		--物品名：香蕉冻
		CEVICHE = "换个大些的碗。这个太小。",		--物品名：酸橘汁腌鱼
		SALSA = "辣。……真的很辣。",		--物品名：生鲜萨尔萨酱
		PEPPERPOPPER = "这一口，分量十足。",		--物品名：爆炒填馅辣椒

		TURNIP = "生萝卜。泥土气很重。",		--物品名：大萝卜
		TURNIP_COOKED = "烹饪，是学问的实践。",		--物品名：烤大萝卜
		TURNIP_SEEDS = "圆种子。形态古怪。",		--物品名：圆形种子

		GARLIC = "最古老的口气清新剂。",		--物品名：大蒜
		GARLIC_COOKED = "焦黄得恰到好处。",		--物品名：烤大蒜
		GARLIC_SEEDS = "一荚种子。形状古怪。",		--物品名：种子荚

		ONION = "看着很脆。切开才知道。",		--物品名：洋葱
		ONION_COOKED = "一次成功的反应。",		--物品名：烤洋葱
		ONION_SEEDS = "尖头种子。一小撮。",		--物品名：尖形种子

		POTATO = "地下的苹果。姑且这么说。",		--物品名：土豆
		POTATO_COOKED = "温度的功劳。",		--物品名：烤土豆
		POTATO_SEEDS = "毛茸茸的种子。有点可爱，喵。",		--物品名：毛茸茸的种子

		TOMATO = "红的。里头全是学问。",		--物品名：番茄
		TOMATO_COOKED = "懂了原理，做饭不难。",		--物品名：烤番茄
		TOMATO_SEEDS = "带刺的种子。小心拿。",		--物品名：带刺的种子

		ASPARAGUS = "一种蔬菜。仅此而已。",		--物品名：芦笋
		ASPARAGUS_COOKED = "据说对我有益。",		--物品名：烤芦笋
		ASPARAGUS_SEEDS = "不过是些种子。",		--物品名：筒状种子

		PEPPER = "一只烈性的辣椒。",		--物品名：辣椒
		PEPPER_COOKED = "它本就该辣。",		--物品名：烤辣椒
		PEPPER_SEEDS = "几粒种子。收好。",		--物品名：块状种子

		WEREITEM_BEAVER = "北方的道理，与这里不同。",		--物品名：俗气海狸像
		WEREITEM_GOOSE = "看得我毛都要竖起来。",		--物品名：俗气鹅像
		WEREITEM_MOOSE = "一头受咒的鹿。没什么稀奇。",		--物品名：俗气鹿像

		MERMHAT = "终于可以真面目示人，喵。",        		--物品名：聪明的伪装
		MERMTHRONE =
		{
			GENERIC = "配得上沼泽之王的位子。",		--物品名：皇家地毯 检查状态：普通状态
			BURNT = "那王座本就有股鱼腥。",		--物品名：皇家地毯 检查状态：已经烧毁
		},
		MOSQUITOMUSK = "那些吸血鬼，别想近身。",		--物品名：小痒痒
		MOSQUITOBOMB = "手有些痒。想扔出去。",		--物品名：蚊子炸弹
		MOSQUITOFERTILIZER = "植物竟不嫌弃它。",		--物品名：嗡嗡肥料
		MOSQUITOMERMSALVE = "鱼人之间最时兴的玩意。",		--物品名：蚊血注射液

		MERMTHRONE_CONSTRUCTION =
		{
			GENERIC = "她究竟在打什么主意。",		--物品名：皇家手工套装 检查状态：普通状态
			BURNT = "再也看不出原貌了。",		--物品名：皇家手工套装 检查状态：已经烧毁
		},
		MERMHOUSE_CRAFTED =
		{
			GENERIC = "模样倒还算可爱。",		--物品名：鱼人工艺屋 检查状态：普通状态
			BURNT = "气味刺鼻。",		--物品名：鱼人工艺屋 检查状态：已经烧毁
		},

		MERMWATCHTOWER_REGULAR = "找到国王，他们就有了精神。",		--物品名：普通鱼人瞭望塔
		MERMWATCHTOWER_NOKING = "守卫还在。王却不在了。",		--物品名：无鱼人之王时的鱼人瞭望塔
		MERMKING = "陛下。",		--物品名：鱼人之王
		MERMGUARD = "站在他们中间，竟觉得安稳。",		--物品名：忠诚鱼人守卫
		MERM_PRINCE = "他们讲先来后到。也算规矩。",		--物品名：皇室练习生

		SQUID = "预感告诉我，它有用。",		--物品名：鱿鱼

		GHOSTFLOWER = "我的理性拒绝相信这个。",		--物品名：哀悼荣耀
		SMALLGHOST = "你这个小东西。不算可怕。",		--物品名：小惊吓

		CRABKING =
		{
			GENERIC = "哦。是只大蟹。",		--物品名：帝王蟹 检查状态：普通状态
			INERT = "这座城堡，得翻修一番。",		--物品名：帝王蟹 检查状态：缺少激活条件，处于静止状态
		},
		CRABKING_CLAW = "当心那只钳子。",		--物品名：巨钳

		MESSAGEBOTTLE = "也许是给我的。谁知道呢。",		--物品名：瓶中信
		MESSAGEBOTTLEEMPTY = "空的。什么都没有。",		--物品名：空瓶子

		MEATRACK_HERMIT =
		{
			DONE = "肉干成了。可以吃。",		--物品名：晾肉架 检查状态：处理已经完成
			DRYING = "风干需要时间。等着。",		--物品名：晾肉架 检查状态：肉类正在晾晒
			DRYINGINRAIN = "雨天晾肉，得多等些时候。",		--物品名：晾肉架 检查状态：雨中仍挂着肉类，晾晒暂停
			GENERIC = "挂在这里，应当妥当。",		--物品名：晾肉架 检查状态：普通状态
			BURNT = "架子烧没了。",		--物品名：晾肉架 检查状态：已经烧毁
			DONE_NOTMEAT = "按行话说，这叫作“干燥”。",		--物品名：晾肉架 检查状态：非肉类晾晒已经完成
			DRYING_NOTMEAT = "风干这件事，谈不上学问。",		--物品名：晾肉架 检查状态：非肉类正在晾晒
			DRYINGINRAIN_NOTMEAT = "雨，请让一让。改日再来。",		--物品名：晾肉架 检查状态：雨中仍挂着非肉类，晾晒暂停
		},
		BEEBOX_HERMIT =
		{
			READY = "里头满着蜜，喵。",		--物品名：蜂箱 检查状态：已经准备就绪
			FULLHONEY = "蜜已经装到顶了。",		--物品名：蜂箱 检查状态：蜂蜜储量已满
			GENERIC = "不知里头有没有一点甜。",		--物品名：蜂箱 检查状态：普通状态
			NOHONEY = "空的。一滴也无。",		--物品名：蜂箱 检查状态：没有蜂蜜
			SOMEHONEY = "还得再等等。",		--物品名：蜂箱 检查状态：存有少量蜂蜜
			BURNT = "怎么会烧起来。",		--物品名：蜂箱 检查状态：已经烧毁
		},

		HERMITCRAB = "独居久了，难免寂寞。",		--物品名：寄居蟹隐士

		HERMIT_PEARL = "我会好好保管。",		--物品名：珍珠的珍珠
		HERMIT_CRACKED_PEARL = "我……没能护住它。",		--物品名：开裂珍珠

		WATERPLANT = "不动它的藤壶，它便不为难我们，喵。",		--物品名：海草
		WATERPLANT_BOMB = "原来是种子。",		--物品名：种壳
		WATERPLANT_BABY = "尚在萌芽。",		--物品名：海芽
		WATERPLANT_PLANTER = "海中岩上，它长得最好。",		--物品名：海芽插穗

		SHARK = "或许我们需要一艘更大的船。",		--物品名：岩石大白鲨

		MASTUPGRADE_LAMP_ITEM = "我的主意，向来是亮的。",		--物品名：甲板照明灯
		MASTUPGRADE_LIGHTNINGROD_ITEM = "陆上与海上的电，都归我管。",		--物品名：避雷导线

		WATERPUMP = "灭火很有效。",		--物品名：消防泵

		BARNACLE = "不像指关节。倒像石头。",		--物品名：藤壶
		BARNACLE_COOKED = "听说这是道珍馐。",		--物品名：熟藤壶

		BARNACLEPITA = "不看清它是藤壶时，味道更好。",		--物品名：藤壶皮塔饼
		BARNACLESUSHI = "筷子似乎又放错了地方。",		--物品名：藤壶握寿司
		BARNACLINGUINE = "把面递过来。",		--物品名：藤壶中细面
		BARNACLESTUFFEDFISHHEAD = "饿到这般地步，竟连它也考虑。",		--物品名：酿鱼头

		LEAFLOAF = "叶与肉。来历不明。",		--物品名：叶肉糕
		LEAFYMEATBURGER = "虽是素的。仍显得残忍。",		--物品名：素食堡
		LEAFYMEATSOUFFLE = "这门手艺，怕是走偏了。",		--物品名：果冻沙拉
		MEATYSALAD = "一份沙拉，竟这般顶饱。",		--物品名：牛肉绿叶菜


		MOLEBAT = "一只规规矩矩的小吸血鬼。",		--物品名：裸鼹蝠
		MOLEBATHILL = "那窝里藏着什么，不好说。",		--物品名：裸鼹蝠丘

		BATNOSE = "这是谁的鼻子。有人知道么。",		--物品名：裸露鼻孔
		BATNOSE_COOKED = "烤过之后，闻着还是鼻子。",		--物品名：炭烤鼻孔
		BATNOSEHAT = "戴上它，喝奶不必动手，喵。",		--物品名：牛奶帽

		MUSHGNOME = "它大概会定期发作。",		--物品名：蘑菇地精

		SPORE_MOON = "离这些孢子远些。",		--物品名：月亮孢子

		MOON_CAP = "看着就不太能吃。",		--物品名：月亮蘑菇
		MOON_CAP_COOKED = "为了学问，我也算豁出去了。",		--物品名：熟月亮蘑菇

		MUSHTREE_MOON = "这棵树，与旁的明显不同。",		--物品名：月亮蘑菇树

		LIGHTFLIER = "装进口袋还发着光。奇怪。",		--物品名：球状光虫

		GROTTO_POOL_BIG = "月光的水，让玻璃生长。这便是道理。",		--物品名：玻璃绿洲
		GROTTO_POOL_SMALL = "小池子，也长玻璃。",		--物品名：小玻璃绿洲

		DUSTMOTH = "整齐的小东西。倒不难看，喵。",		--物品名：尘蛾

		DUSTMOTHDEN = "它们在里头过得很舒坦。",		--物品名：整洁洞穴

		ARCHIVE_LOCKBOX = "这知识，该如何取出。",		--物品名：蒸馏的知识
		ARCHIVE_CENTIPEDE = "你拦不住我。",		--物品名：远古哨兵蜈蚣
		ARCHIVE_CENTIPEDE_HUSK = "一堆旧零件。锈得不轻。",		--物品名：哨兵蜈蚣壳

		ARCHIVE_COOKPOT =
		{
			COOKING_LONG = "还需要些时间。",		--物品名：远古窑 检查状态：正在烹饪，剩余时间较长
			COOKING_SHORT = "快了。",		--物品名：远古窑 检查状态：正在烹饪，即将完成
			DONE = "嗯。可以了。",		--物品名：远古窑 检查状态：处理已经完成
			EMPTY = "先把灰抖干净，如何。",		--物品名：远古窑 检查状态：内容为空
			BURNT = "锅毁了。",		--物品名：远古窑 检查状态：已经烧毁
		},

		ARCHIVE_MOON_STATUE = "这样的雕像，让人想写点什么。",		--物品名：远古月亮雕像
		ARCHIVE_RUNE_STATUE =
		{
			LINE_1 = "这许多知识。若我能读懂。",		--物品名：远古月符石 检查状态：第一段碑文或记录
			LINE_2 = "这些记号，与别处废墟不同。",		--物品名：远古月符石 检查状态：第二段碑文或记录
			LINE_3 = "字里行间，全是我不识的学问。",		--物品名：远古月符石 检查状态：第三段碑文或记录
			LINE_4 = "这些标记，笔法又变。",		--物品名：远古月符石 检查状态：第四段碑文或记录
			LINE_5 = "读懂它，或许要花一生。",		--物品名：远古月符石 检查状态：第五段碑文或记录
		},
		VAULT_RUNE = "这个，我看不懂。",		--物品名：圣殿月符石
		VAULT_STATUE =
		{
			LORE1 = "他的结局，落进黑暗里。",		--物品名：圣殿雕像 检查状态：第一段背景记载
			LORE2 = "它在动。看着叫人不适。",		--物品名：圣殿雕像 检查状态：第二段背景记载
			LORE3 = "这表达，锋利得很。",		--物品名：圣殿雕像 检查状态：第三段背景记载
			LORE1_STALKER = "我能明白，这为何令你不安。", 		--物品名：圣殿雕像 检查状态：显示与远古织影者有关的记录
		},

		ARCHIVE_RESONATOR = {
			GENERIC = "有此等机器，谁还用地图。",		--物品名：星象探测仪 检查状态：普通状态
			IDLE = "它似乎找到了该找的东西。",		--物品名：星象探测仪 检查状态：处于待机状态
		},

		ARCHIVE_RESONATOR_ITEM = "用秘传的知识造了件器物。这感觉似曾相识。",		--物品名：星象探测仪

		ARCHIVE_LOCKBOX_DISPENCER = {
			POWEROFF = "若能叫它重新运转。",		--物品名：知识饮水机 检查状态：设备没有供电
			GENERIC =  "站在它旁边，就想高谈阔论。",		--物品名：知识饮水机 检查状态：普通状态
		},

		ARCHIVE_SECURITY_DESK = {
			POWEROFF = "它已不复从前的用处。",		--物品名：远古哨所 检查状态：设备没有供电
			GENERIC = "它有意亲近我。",		--物品名：远古哨所 检查状态：普通状态
		},

		ARCHIVE_SECURITY_PULSE = "你要往哪里去。那里有趣么。",		--物品名：远古档案馆安全脉冲

		ARCHIVE_SWITCH = {
			VALID = "这些宝石供能。合乎章法，我确定。",		--物品名：华丽基座 检查状态：宝石组合有效，可以激活
			GEMS = "槽是空的。",		--物品名：华丽基座 检查状态：已插入宝石但尚未完全激活
		},

		ARCHIVE_PORTAL = {
			POWEROFF = "毫无反应。",		--物品名：封印的传送门 检查状态：设备没有供电
			GENERIC = "通了电，却没有回应。奇怪。",		--物品名：封印的传送门 检查状态：普通状态
		},

		WALL_STONE_2 = "墙不错。砌得齐整。",		--物品名：档案馆石墙
		WALL_RUINS_2 = "一段旧墙。年岁不小。",		--物品名：档案馆铥墙

		REFINED_DUST = "……啊嚏。失礼了。",		--物品名：尘土块
		DUSTMERINGUE = "这种东西，谁会动口。",		--物品名：琥珀美食

		SHROOMCAKE = "名副其实。果然。",		--物品名：蘑菇蛋糕
		SHROOMBAIT = "味道如梦。",		--物品名：酿夜帽

		NIGHTMAREGROWTH = "这些晶体，值得警惕。",		--物品名：梦魇城墙

		TURFCRAFTINGSTATION = "真正的学者，总要开新的天地。",		--物品名：土地夯实器

        MOON_ALTAR_LINK = "有东西正在底下酝酿。别去碰它。",		--物品名：神秘能量

        COMPOSTINGBIN =
        {
            GENERIC = "这气味，恕我难以欣赏。",		--物品名：堆肥桶 检查状态：普通状态
            WET = "过湿了。它会烂给我看。",		--物品名：堆肥桶 检查状态：处于潮湿状态
            DRY = "太干了。还差一点火候。",		--物品名：堆肥桶 检查状态：处于干燥状态
            BALANCED = "配比正好。可以了。",		--物品名：堆肥桶 检查状态：堆肥配比平衡
            BURNT = "烧过了。连气味都成了灰。",		--物品名：堆肥桶 检查状态：已经烧毁
        },
        COMPOST = "给植物的口粮。我不吃。",		--物品名：堆肥
		SOIL_AMENDER =
		{
			GENERIC = "剩下的，交给时间和微生物。",		--物品名：催长剂起子 检查状态：普通状态
			STALE = "还在发酵。耐心些。",		--物品名：催长剂起子 检查状态：土壤改良剂仍在发酵
			SPOILED = "那股味道说明它成了。",		--物品名：催长剂起子 检查状态：土壤改良剂已经完全发酵
		},

		SOIL_AMENDER_FERMENTED = "浓得有些失礼，但确实有效。",		--物品名：超级催长剂

        WATERINGCAN =
        {
            GENERIC = "浇水用的。别指望我拎着它跑。",		--物品名：空浇水壶 检查状态：普通状态
            EMPTY = "空了。附近总有水塘。",		--物品名：空浇水壶 检查状态：内容为空
        },
        PREMIUMWATERINGCAN =
        {
            GENERIC = "鸟嘴造型。品位可疑，功能尚可。",		--物品名：空鸟嘴壶 检查状态：普通状态
            EMPTY = "没有水，它就只是件摆设。",		--物品名：空鸟嘴壶 检查状态：内容为空
        },

		FARM_PLOW = "翻土用的。省力，也省心。",		--物品名：耕地机
		FARM_PLOW_ITEM = "先找一块配得上它的地。",		--物品名：耕地机
		FARM_HOE = "把土理松，种子才肯住下。",		--物品名：园艺锄
		GOLDEN_FARM_HOE = "镀金也改不了它翻土的本分。",		--物品名：黄金园艺锄
		NUTRIENTSGOGGLESHAT = "戴上它，泥土里的账目一目了然。",		--物品名：高级耕作先驱帽
		PLANTREGISTRYHAT = "要懂植物，先把它顶在头上。",		--物品名：耕作先驱帽

        FARM_SOIL_DEBRIS = "杂物。我的园子不欢迎。",		--物品名：农田杂物

		FIRENETTLES = "怕烫就别靠近花园。",		--物品名：火荨麻叶
		FORGETMELOTS = "嗯……我方才要说什么来着。",		--物品名：必忘我
		SWEETTEA = "一杯茶，把烦心事都冲淡。",		--物品名：舒缓茶
		TILLWEED = "从我的园子里出去。",		--物品名：犁地草
		TILLWEEDSALVE = "我的救星。",		--物品名：犁地草膏
        WEED_IVY = "你不是蔬菜。别装了。",		--物品名：刺针旋花
        IVY_SNARE = "一点礼貌也没有。",		--物品名：缠绕根须

		TROPHYSCALE_OVERSIZEDVEGGIES =
		{
			GENERIC = "收成的分量，我一称便知。",		--物品名：农产品秤 检查状态：普通状态
			HAS_ITEM = "重量: {weight}\n收获日: {day}\n不坏。",		--物品名：农产品秤 检查状态：已经放置物品
			HAS_ITEM_HEAVY = "重量: {weight}\n收获日: {day}\n长到这般地步，倒是意外。",		--物品名：农产品秤 检查状态：放置物品重量较大
            HAS_ITEM_LIGHT = "太寻常了。秤都懒得报数。",		--物品名：农产品秤 检查状态：放置物品重量较轻
			BURNING = "这是在烧哪道菜？",		--物品名：农产品秤 检查状态：正在燃烧
			BURNT = "这大概不算最好的做法。",		--物品名：农产品秤 检查状态：已经烧毁
        },

        CARROT_OVERSIZED = "胡萝卜。多得有些失态。",		--物品名：巨型胡萝卜
        CORN_OVERSIZED = "好大一根玉米。",		--物品名：巨型玉米
        PUMPKIN_OVERSIZED = "南瓜胀成了这副模样。",		--物品名：巨型南瓜
        EGGPLANT_OVERSIZED = "至今不明白它为何叫茄子。",		--物品名：巨型茄子
        DURIAN_OVERSIZED = "可以肯定，它更臭了。",		--物品名：巨型榴莲
        POMEGRANATE_OVERSIZED = "我见过最大的石榴。",		--物品名：巨型石榴
        DRAGONFRUIT_OVERSIZED = "我还以为它会生出翅膀。",		--物品名：巨型火龙果
        WATERMELON_OVERSIZED = "又大又多汁。今晚有口福了，喵。",		--物品名：巨型西瓜
        TOMATO_OVERSIZED = "比例惊人的一颗番茄。",		--物品名：巨型番茄
        POTATO_OVERSIZED = "这土豆，分量十足。",		--物品名：巨型土豆
        ASPARAGUS_OVERSIZED = "看来芦笋要吃上一阵了。",		--物品名：巨型芦笋
        ONION_OVERSIZED = "长得这样快，熏得我眼眶发酸。",		--物品名：巨型洋葱
        GARLIC_OVERSIZED = "大蒜。大得放肆。",		--物品名：巨型大蒜
        PEPPER_OVERSIZED = "尺寸相当不合常理的辣椒。",		--物品名：巨型辣椒

        VEGGIE_OVERSIZED_ROTTEN = "腐烂的运气。",		--物品名：腐烂巨型蔬菜

		FARM_PLANT =
		{
			GENERIC = "一株植物。仅此而已。",		--物品名：农作物 检查状态：普通状态
			SEED = "等就是了。",		--物品名：农作物 检查状态：作物处于种子阶段
			GROWING = "长吧。我看着。",		--物品名：农作物 检查状态：正在生长
			FULL = "该收取我的成果了。",		--物品名：农作物 检查状态：内容已满
			ROTTEN = "可惜。早两日收下就好。",		--物品名：农作物 检查状态：已经腐烂
			FULL_OVERSIZED = "我把作物养到了这个尺寸。",		--物品名：农作物 检查状态：成熟并长成巨型作物
			ROTTEN_OVERSIZED = "烂得彻底。可惜。",		--物品名：农作物 检查状态：巨型作物已经腐烂
			FULL_WEED = "冒牌货。我早该把你连根拔了。",		--物品名：农作物 检查状态：成熟的杂草形态

			BURNING = "对植物来说，这不是好事。",		--物品名：农作物 检查状态：正在燃烧
		},

        FRUITFLY = "换个地方嗡去。",		--物品名：果蝇
        LORDFRUITFLY = "别再打搅我的植物。",		--物品名：果蝇王
        FRIENDLYFRUITFLY = "有它在，园子安静许多。",		--物品名：友好果蝇
        FRUITFLYFRUIT = "如今这里我说了算。",		--物品名：友好果蝇果

        SEEDPOUCH = "种子不该塞在口袋里。",		--物品名：种子袋

		CARNIVAL_HOST = "一个怪人。",		--物品名：良羽鸦
		CARNIVAL_CROWKID = "日安，小小鸟。",		--物品名：小乌鸦
		CARNIVAL_GAMETOKEN = "一枚亮闪闪的代币。",		--物品名：鸦年华代币
		CARNIVAL_PRIZETICKET =
		{
			GENERIC = "就是那张奖票。",		--物品名：奖票 检查状态：普通状态
			GENERIC_SMALLSTACK = "就是那几张奖票。",		--物品名：奖票 检查状态：普通票券小堆叠
			GENERIC_LARGESTACK = "奖票，厚厚一沓。",		--物品名：奖票 检查状态：普通票券大堆叠
		},

		CARNIVALGAME_FEEDCHICKS_NEST = "一扇小小的活门。",		--物品名：饥饿乌鸦
		CARNIVALGAME_FEEDCHICKS_STATION =
		{
			GENERIC = "它要我先付点亮东西，才肯让我玩。",		--物品名：鸟鸟吃虫虫 检查状态：普通状态
			PLAYING = "这倒有几分意思。",		--物品名：鸟鸟吃虫虫 检查状态：游戏正在进行
		},
		CARNIVALGAME_FEEDCHICKS_KIT = "一天里就搭起来的嘉年华。",		--物品名：鸟鸟吃虫虫套装
		CARNIVALGAME_FEEDCHICKS_FOOD = "不必我先替它嚼碎吧？",		--物品名：蛴螬

		CARNIVALGAME_MEMORY_KIT = "把嘉年华装进箱子，随取随用。",		--物品名：篮中蛋套装
		CARNIVALGAME_MEMORY_STATION =
		{
			GENERIC = "想玩，先得给它些亮闪闪的。",		--物品名：篮中蛋 检查状态：普通状态
			PLAYING = "不是我自夸，这我拿手。",		--物品名：篮中蛋 检查状态：游戏正在进行
		},
		CARNIVALGAME_MEMORY_CARD =
		{
			GENERIC = "门很小，里头另有乾坤。",		--物品名：蛋篮 检查状态：普通状态
			PLAYING = "是这张吗？",		--物品名：蛋篮 检查状态：游戏正在进行
		},

		CARNIVALGAME_HERDING_KIT = "临时搭起的嘉年华，也别有滋味。",		--物品名：追蛋套装
		CARNIVALGAME_HERDING_STATION =
		{
			GENERIC = "它立在那儿，等我拿亮东西来换。",		--物品名：追蛋 检查状态：普通状态
			PLAYING = "这些蛋想跑，喵。",		--物品名：追蛋 检查状态：游戏正在进行
		},
		CARNIVALGAME_HERDING_CHICK = "回来。",		--物品名：追蛋

		CARNIVALGAME_SHOOTING_KIT = "嘉年华也能随身带着走。",		--物品名：保卫鸟巢套装
		CARNIVALGAME_SHOOTING_STATION =
		{
			GENERIC = "这机器只认亮闪闪的报酬。",		--物品名：保卫鸟巢 检查状态：普通状态
			PLAYING = "弹道我能算，只是数字繁杂。",		--物品名：保卫鸟巢 检查状态：游戏正在进行
		},
		CARNIVALGAME_SHOOTING_TARGET =
		{
			GENERIC = "一扇小小的翻门。",		--物品名：射击靶 检查状态：普通状态
			PLAYING = "这靶子让我手痒。",		--物品名：射击靶 检查状态：游戏正在进行
		},

		CARNIVALGAME_SHOOTING_BUTTON =
		{
			GENERIC = "先投币，后开玩。规矩如此。",		--物品名：按钮 检查状态：普通状态
			PLAYING = "它亮着，我就得按。这是本能。",		--物品名：按钮 检查状态：游戏正在进行
		},

		CARNIVALGAME_WHEELSPIN_KIT = "拆开就能开张的嘉年华。",		--物品名：布谷鸟转盘套装
		CARNIVALGAME_WHEELSPIN_STATION =
		{
			GENERIC = "它要亮闪闪的东西，才肯转起来。",		--物品名：布谷鸟转盘 检查状态：普通状态
			PLAYING = "轮子转起来，倒也有产出。",		--物品名：布谷鸟转盘 检查状态：游戏正在进行
		},

		CARNIVALGAME_PUCKDROP_KIT = "一场说来就来的嘉年华。",		--物品名：鸟房落球套装
		CARNIVALGAME_PUCKDROP_STATION =
		{
			GENERIC = "拿亮东西来，它才肯动。",		--物品名：鸟房落球 检查状态：普通状态
			PLAYING = "物理规律，并不总肯复现。",		--物品名：鸟房落球 检查状态：游戏正在进行
		},

		CARNIVAL_PRIZEBOOTH_KIT = "制作摊位的过程，本身便是奖品。",		--物品名：奖品摊位套装
		CARNIVAL_PRIZEBOOTH =
		{
			GENERIC = "我看中的是那边那件。",		--物品名：奖品摊位 检查状态：普通状态
		},

		CARNIVALCANNON_KIT = "我对爆炸颇有经验。",		--物品名：盛夏鸦年华大炮套装
		CARNIVALCANNON =
		{
			GENERIC = "这场实验的目的就是炸。",		--物品名：盛夏鸦年华大炮 检查状态：普通状态
			COOLDOWN = "炸过一轮了。",		--物品名：盛夏鸦年华大炮 检查状态：能力处于冷却期
		},

		CARNIVAL_PLAZA_KIT = "鸟喜欢树，这是验证过的。",		--物品名：鸦年华树苗
		CARNIVAL_PLAZA =
		{
			GENERIC = "如今可不像“鸦年华”的样子。",		--物品名：鸦年华树 检查状态：普通状态
			LEVEL_2 = "有只小鸟说，这里该多些装饰。",		--物品名：鸦年华树 检查状态：第二等级
			LEVEL_3 = "一棵为庆典而生的树。",		--物品名：鸦年华树 检查状态：第三等级
		},

		CARNIVALDECOR_EGGRIDE_KIT = "但愿奖品就是这些。",		--物品名：盛夏鸦年华蛋形游乐设施套装
		CARNIVALDECOR_EGGRIDE = "我可以盯着它看几个钟头，喵。",		--物品名：盛夏鸦年华蛋形游乐设施

		CARNIVALDECOR_LAMP_KIT = "只差一点收尾。",		--物品名：盛夏夜灯套装
		CARNIVALDECOR_LAMP = "它的能量，来自异想天开。",		--物品名：盛夏夜灯
		CARNIVALDECOR_PLANT_KIT = "也许这是一棵黄杨？",		--物品名：微型树套装
		CARNIVALDECOR_PLANT = "不是它小，就是我大。",		--物品名：微型树
		CARNIVALDECOR_BANNER_KIT = "还得我亲手搭？我该料到。",		--物品名：光线捕捉器套装
		CARNIVALDECOR_BANNER = "这些亮片已经把话说尽了。",		--物品名：光线捕捉器

		CARNIVALDECOR_FIGURE =
		{
			RARE = "瞧见没有？反复做同一件事终有回报，这就是凭证。",		--物品名：盛夏鸦年华装饰 检查状态：稀有品质
			UNCOMMON = "这种式样，不算常见。",		--物品名：盛夏鸦年华装饰 检查状态：罕见品质
			GENERIC = "我究竟从哪儿弄来这么多。",		--物品名：盛夏鸦年华装饰 检查状态：普通状态
		},
		CARNIVALDECOR_FIGURE_KIT = "探索的趣味。",		--物品名：绿色神秘盒子
		CARNIVALDECOR_FIGURE_KIT_SEASON2 = "未知总叫人心里发痒。",		--物品名：黄色神秘盒子
		CARNIVALDECOR_FIGURE_KIT_SEASON3 = "拆开之前，最是有趣。",		--物品名：红色神秘盒子

        CARNIVAL_BALL = "极简，且天才。", 		--物品名：发光红球
		CARNIVAL_SEEDPACKET = "我有点饿了。",		--物品名：种子包
		CARNIVALFOOD_CORNTEA = "这种饮料本该如此脆吗？",		--物品名：玉米泥

        CARNIVAL_VEST_A = "穿上它，像要去冒险。",		--物品名：叽叽喳喳围巾
        CARNIVAL_VEST_B = "像把一片树荫披在身上。",		--物品名：叽叽喳喳斗篷
        CARNIVAL_VEST_C = "但愿里头没有虫。",		--物品名：叽叽喳喳小披肩

        YOTB_SEWINGMACHINE = "缝纫能有多难。",		--物品名：缝纫机
        YOTB_SEWINGMACHINE_ITEM = "看来得先装起来。",		--物品名：缝纫机套装
        YOTB_STAGE = "奇怪。我没见他上台，也没见他离场。",		--物品名：裁判席
        YOTB_POST =  "这场比赛会很顺利。",		--物品名：皮弗娄牛舞台
        YOTB_STAGE_ITEM = "看来要先搭起来。",		--物品名：裁判席
        YOTB_POST_ITEM =  "先装好它为好。",		--物品名：皮弗娄牛舞台


        YOTB_PATTERN_FRAGMENT_1 = "把这些拼起来，应能得出一件皮弗娄牛礼服。",		--物品名：恐怖款式碎片
        YOTB_PATTERN_FRAGMENT_2 = "拼合之后，该是一件正式的皮弗娄牛礼服。",		--物品名：正式款式碎片
        YOTB_PATTERN_FRAGMENT_3 = "这些碎片凑起来，是件喜庆的皮弗娄牛礼服。",		--物品名：喜庆款式碎片

        YOTB_BEEFALO_DOLL_WAR = {
            GENERIC = "这配方把可抱性做到了极致。",		--物品名：战士皮弗娄牛玩偶 检查状态：普通状态
            YOTB = "不知评委会怎么说。",		--物品名：战士皮弗娄牛玩偶 检查状态：牛年活动外观
        },
        YOTB_BEEFALO_DOLL_DOLL = {
            GENERIC = "柔软得很有分寸。",		--物品名：娃娃皮弗娄牛玩偶 检查状态：普通状态
            YOTB = "评委的口味，我一向猜不准。",		--物品名：娃娃皮弗娄牛玩偶 检查状态：牛年活动外观
        },
        YOTB_BEEFALO_DOLL_FESTIVE = {
            GENERIC = "抱起来像一团节日的暖意。",		--物品名：喜庆皮弗娄牛玩偶 检查状态：普通状态
            YOTB = "这一身，评委会不会嫌吵？",		--物品名：喜庆皮弗娄牛玩偶 检查状态：牛年活动外观
        },
        YOTB_BEEFALO_DOLL_NATURE = {
            GENERIC = "做工讲究，连绒毛都理得顺。",		--物品名：花朵皮弗娄牛玩偶 检查状态：普通状态
            YOTB = "就等评委点头了。",		--物品名：花朵皮弗娄牛玩偶 检查状态：牛年活动外观
        },
        YOTB_BEEFALO_DOLL_ROBOT = {
            GENERIC = "铁甲裹着棉花，思路有趣。",		--物品名：铁甲皮弗娄牛玩偶 检查状态：普通状态
            YOTB = "评委大约会喜欢这种硬派。",		--物品名：铁甲皮弗娄牛玩偶 检查状态：牛年活动外观
        },
        YOTB_BEEFALO_DOLL_ICE = {
            GENERIC = "摸上去凉，倒还抱得住。",		--物品名：寒霜皮弗娄牛玩偶 检查状态：普通状态
            YOTB = "评审席上，应当也会觉得清爽。",		--物品名：寒霜皮弗娄牛玩偶 检查状态：牛年活动外观
        },
        YOTB_BEEFALO_DOLL_FORMAL = {
            GENERIC = "正装也掩不住它的圆润。",		--物品名：正式皮弗娄牛玩偶 检查状态：普通状态
            YOTB = "得体。评委会认的。",		--物品名：正式皮弗娄牛玩偶 检查状态：牛年活动外观
        },
        YOTB_BEEFALO_DOLL_VICTORIAN = {
            GENERIC = "旧式剪裁，颇有家教。",		--物品名：维多利亚皮弗娄牛玩偶 检查状态：普通状态
            YOTB = "这种讲究，评委看得出。",		--物品名：维多利亚皮弗娄牛玩偶 检查状态：牛年活动外观
        },
        YOTB_BEEFALO_DOLL_BEAST = {
            GENERIC = "毛色极好，值得多看两眼，喵。",		--物品名：幸运兽皮弗娄牛玩偶 检查状态：普通状态
            YOTB = "它若得奖，我不意外。",		--物品名：幸运兽皮弗娄牛玩偶 检查状态：牛年活动外观
        },

        WAR_BLUEPRINT = "何等英武。",		--物品名：战士礼服款式
        DOLL_BLUEPRINT = "我的皮弗娄牛一定招人喜欢。",		--物品名：娃娃礼服款式
        FESTIVE_BLUEPRINT = "该添些节庆气了。",		--物品名：节日盛装款式
        ROBOT_BLUEPRINT = "一件缝纫活要这么多焊接，未免可疑。",		--物品名：铁甲礼服款式
        NATURE_BLUEPRINT = "花，配什么都好。",		--物品名：花朵礼服款式
        FORMAL_BLUEPRINT = "这是甲等皮弗娄牛的礼服。",		--物品名：正式礼服款式
        VICTORIAN_BLUEPRINT = "我祖母好像穿过类似的。",		--物品名：维多利亚礼服款式
        ICE_BLUEPRINT = "我喜欢新鲜的皮弗娄牛，不是冻的。",		--物品名：寒霜礼服款式
        BEAST_BLUEPRINT = "看来我要走运了。",		--物品名：幸运兽礼服款式

        BEEF_BELL = "它让皮弗娄牛变得温顺。科学自会解释。",		--物品名：皮弗娄牛铃

		KITCOONDEN =
		{
			GENERIC = "要缩到这么小，才藏得进去。",		--物品名：小浣猫托儿所 检查状态：普通状态
            BURNT = "不。",		--物品名：小浣猫托儿所 检查状态：已经烧毁
			PLAYING_HIDEANDSEEK = "它们躲到哪儿去了。",		--物品名：小浣猫托儿所 检查状态：小浣猫正在玩捉迷藏
			PLAYING_HIDEANDSEEK_TIME_ALMOST_UP = "时候不多了。它们在哪儿？",		--物品名：小浣猫托儿所 检查状态：小浣猫捉迷藏即将结束
		},

		KITCOONDEN_KIT = "一套都在这里。",		--物品名：小浣猫托儿所套装

		TICOON =
		{
			GENERIC = "他看上去很清楚自己在做什么。",		--物品名：大虎 检查状态：普通状态
			ABANDONED = "我自己也能找到它们。",		--物品名：大虎 检查状态：已被原主人遗弃
			SUCCESS = "他找到一个了。",		--物品名：大虎 检查状态：追踪已经成功
			LOST_TRACK = "有人先一步发现了它们。",		--物品名：大虎 检查状态：已经失去追踪目标
			NEARBY = "附近有动静。",		--物品名：大虎 检查状态：追踪目标就在附近
			TRACKING = "跟紧他的步子。",		--物品名：大虎 检查状态：正在追踪目标
			TRACKING_NOT_MINE = "他在替别人引路。",		--物品名：大虎 检查状态：正在追踪其他角色的目标
			NOTHING_TO_TRACK = "没什么可追的了。",		--物品名：大虎 检查状态：当前没有可追踪目标
			TARGET_TOO_FAR_AWAY = "太远了。他闻不到。",		--物品名：大虎 检查状态：追踪目标距离过远
		},

		YOT_CATCOONSHRINE =
        {
            GENERIC = "在做什么呢。",		--物品名：浣猫神龛 检查状态：普通状态
            EMPTY = "也许它想要一根羽毛。",		--物品名：浣猫神龛 检查状态：内容为空
            BURNT = "烧焦的毛皮味。",		--物品名：浣猫神龛 检查状态：已经烧毁
        },

		KITCOON_FOREST = "这一只，我承认它好看，喵。",		--物品名：小浣猫
		KITCOON_SAVANNA = "小小的，倒有几分威风。",		--物品名：小浣猫
		KITCOON_MARSH = "我得多收几只……做研究。",		--物品名：小浣猫
		KITCOON_DECIDUOUS = "毛色干净。养得不错。",		--物品名：小浣猫
		KITCOON_GRASS = "它看我的样子，很有分寸。",		--物品名：小浣猫
		KITCOON_ROCKY = "这一只，我记下了。",		--物品名：小浣猫
		KITCOON_DESERT = "样本还差几只。",		--物品名：小浣猫
		KITCOON_MOON = "月光把它照得很好看。",		--物品名：小浣猫
		KITCOON_YOT = "节庆打扮，倒也体面。",		--物品名：小浣猫

        ALTERGUARDIAN_PHASE1 = {
            GENERIC = "破坏科学，你要付代价。",		--物品名：天体英雄 检查状态：普通状态
            DEAD = "中了。",		--物品名：天体英雄 检查状态：已经死亡
        },
        ALTERGUARDIAN_PHASE2 = {
            GENERIC = "我想我把它惹恼了。",		--物品名：天体英雄 检查状态：普通状态
            DEAD = "这回我确信收拾干净了。",		--物品名：天体英雄 检查状态：已经死亡
        },
        ALTERGUARDIAN_PHASE2SPIKE = "你的意思，我明白了。",		--物品名：月光玻璃尖刺
        ALTERGUARDIAN_PHASE3 = "它现在必定动了怒。",		--物品名：天体英雄
        ALTERGUARDIAN_PHASE3TRAP = "反复试过，我可以确认：这东西让人想睡。",		--物品名：启迪陷阱
        ALTERGUARDIAN_PHASE3DEADORB = "它死了吗。那股力量还在附近游荡。",		--物品名：天体英雄
        ALTERGUARDIAN_PHASE3DEAD = "该派个人过去戳一下，才算数。",		--物品名：被击败的天体英雄

        ALTERGUARDIANHAT = "它让我看见了无限的可能。",		--物品名：启迪之冠
        ALTERGUARDIANHATSHARD = "连碎片都这样夺目。",		--物品名：启迪碎片

        MOONSTORM_GLASS = {
            GENERIC = "呈玻璃状。",		--物品名：充能玻璃石 检查状态：普通状态
            INFUSED = "它泛着地外的光。"		--物品名：充能玻璃石 检查状态：已经注入月亮能量
        },

        MOONSTORM_STATIC = "新的发现。像过电一样。",		--物品名：能量静电
        MOONSTORM_STATIC_ITEM = "它把我的头发弄得一团糟。",		--物品名：约束静电
        MOONSTORM_STATIC_ROAMER = "它似乎在传输中走失了。",		--物品名：未约束的静电
        MOONSTORM_SPARK = "姑且叫它“希格斯伯里粒子”。",		--物品名：月熠

        BIRD_MUTANT = "那原本该是只乌鸦。",		--物品名：月盲乌鸦
        BIRD_MUTANT_SPITTER = "我不喜欢它看我的眼神。",		--物品名：奇形鸟

        WAGSTAFF_NPC = "同行一场，我该帮他。",		--物品名：颗粒状传输

        WAGSTAFF_NPC_MUTATIONS = "科学从不歇息。",		--物品名：颗粒状传输
        WAGSTAFF_NPC_WAGPUNK = "他到底去了哪儿。",		--物品名：颗粒状传输

        ALTERGUARDIAN_CONTAINED = "它正在抽干那怪物的气力。",		--物品名：月亮精华提取器

        WAGSTAFF_TOOL_1 = "正是我找的那件工具。",		--物品名：网状缓冲器
        WAGSTAFF_TOOL_2 = "我当然知道缘由。只是……说来话长。",		--物品名：装置除垢器
        WAGSTAFF_TOOL_3 = "这显然是件十分科学的工具。",		--物品名：垫圈开槽器
        WAGSTAFF_TOOL_4 = "我的直觉说，就是它。",		--物品名：概念刷洗器
        WAGSTAFF_TOOL_5 = "我知道它做什么用。科学。",		--物品名：校准观察机

        MOONSTORM_GOGGLESHAT = "月亮加土豆。我怎么没早想到。",		--物品名：星象护目镜

        MOON_DEVICE = {
            GENERIC = "它捕到能量了。我早知道会这样。",		--物品名：月亮虹吸器 检查状态：普通状态
            CONSTRUCTION1 = "科学才刚开始。",		--物品名：月亮虹吸器 检查状态：第一阶段建造状态
            CONSTRUCTION2 = "像样多了。",		--物品名：月亮虹吸器 检查状态：第二阶段建造状态
        },

        POCKETWATCH_HEAL = {
			GENERIC = "里头多半有很有趣的结构。",		--物品名：不老表 检查状态：普通状态
			RECHARGING = "它需要时间……重新校准。诸如此类。",		--物品名：不老表 检查状态：正在重新充能
		},

        POCKETWATCH_REVIVE = {
			GENERIC = "里头多半藏着精巧的机关。",		--物品名：第二次机会表 检查状态：普通状态
			RECHARGING = "它要缓一缓……重新对准，那个……时间。",		--物品名：第二次机会表 检查状态：正在重新充能
		},

        POCKETWATCH_WARP = {
			GENERIC = "里面必定有值得一看的结构。",		--物品名：倒走表 检查状态：普通状态
			RECHARGING = "它在弄“时间之类的东西”。术语如此。",		--物品名：倒走表 检查状态：正在重新充能
		},

        POCKETWATCH_RECALL = {
			GENERIC = "我想里面有一套精巧的结构。",		--物品名：溯源表 检查状态：普通状态
			RECHARGING = "它在做“时间那类的事”。术语就是这么写的。",		--物品名：溯源表 检查状态：正在重新充能
			UNMARKED = "唔，这一下退得太远了。",		--物品名：溯源表 检查状态：尚未记录传送位置
			MARKED_SAMESHARD = "该跳进时间流了吗？",		--物品名：溯源表 检查状态：已标记当前世界分片的位置
			MARKED_DIFFERENTSHARD = "这一跳不小，但我做得到。",		--物品名：溯源表 检查状态：已标记其他世界分片的位置
		},

        POCKETWATCH_PORTAL = {
			GENERIC = "里面多半有些有趣的结构。",		--物品名：裂缝表 检查状态：普通状态
			RECHARGING = "它在忙“时间之类的事”。术语如此。",		--物品名：裂缝表 检查状态：正在重新充能
			UNMARKED = "回去走一趟如何？会很有趣。",		--物品名：裂缝表 检查状态：尚未记录传送位置
			MARKED_SAMESHARD = "该跳进时间流了吗？",		--物品名：裂缝表 检查状态：已标记当前世界分片的位置
			MARKED_DIFFERENTSHARD = "这一跃不小，我应当可以。",		--物品名：裂缝表 检查状态：已标记其他世界分片的位置
		},

        POCKETWATCH_WEAPON = {
			GENERIC = "出事只是时间问题。",		--物品名：警钟 检查状态：普通状态
			DEPLETED = "还得再找些暗影燃料。",		--物品名：警钟 检查状态：能量已经耗尽
		},

        POCKETWATCH_PARTS = "不到一分钟，科学就成了魔法。",		--物品名：时间碎片
        POCKETWATCH_DISMANTLER = "买来许是二手的。",		--物品名：钟表匠工具

        POCKETWATCH_PORTAL_ENTRANCE =
		{
			GENERIC = "往前走，去看。",		--物品名：时间裂缝 检查状态：普通状态
			DIFFERENTSHARD = "往前走，去发现。",		--物品名：时间裂缝 检查状态：目标位于其他世界分片
		},
        POCKETWATCH_PORTAL_EXIT = "好一段漫长的下坠。",		--物品名：时间裂缝

        WATERTREE_PILLAR = "好大一棵树。",		--物品名：大树干
        OCEANTREE = "这些树该是迷路了。",		--物品名：疙瘩树
        OCEANTREENUT = "里面有活物。",		--物品名：疙瘩树果
        WATERTREE_ROOT = "不是平方根。",		--物品名：大树根

        OCEANTREE_PILLAR = "不如原先那棵，但也不坏。",		--物品名：高出平均值的树干

        OCEANVINE = "学名唤作“树面条”。",		--物品名：苔藓藤条
        FIG = "我叫它“牛顿的无花果”。",		--物品名：无花果
        FIG_COOKED = "被科学加热过了。",		--物品名：熟无花果

        SPIDER_WATER = "它们凭什么浮得起来？",		--物品名：海黾
        MUTATOR_WATER = "哦。这看起来……很合口，韦伯。",		--物品名：海黾变身涂鸦
        OCEANVINE_COCOON = "轻轻戳一下，会怎样？",		--物品名：海黾巢穴
        OCEANVINE_COCOON_BURNT = "像烤焦的吐司。",		--物品名：海黾巢穴

        GRASSGATOR = "他好像不太喜欢我。",		--物品名：草鳄鱼

        TREEGROWTHSOLUTION = "唔，树木的食粮。",		--物品名：树果酱

        FIGATONI = "我的天。",		--物品名：无花果意面
        FIGKABAB = "无花果，旁边一根棍子。",		--物品名：无花果烤串
        KOALEFIG_TRUNK = "好极了。我的鼻子塞得满满当当。",		--物品名：无花果酿象鼻
        FROGNEWTON = "无花果把别的味道都调和了。",		--物品名：无花果蛙腿三明治

        TERRARIUM = {
            GENERIC = "看它久了，眼前会浮起许多小方块。",		--物品名：盒中泰拉 检查状态：普通状态
            CRIMSON = "我有种不祥的预感。",		--物品名：盒中泰拉 检查状态：已转化为猩红状态
            ENABLED = "我到彩虹那一边了吗？",		--物品名：盒中泰拉 检查状态：特殊事件生成已经启用
			WAITING_FOR_DARK = "会是什么呢。不如睡一觉再看。",		--物品名：盒中泰拉 检查状态：正在等待夜晚到来
			COOLDOWN = "之后需要缓一缓。",		--物品名：盒中泰拉 检查状态：能力处于冷却期
			SPAWN_DISABLED = "应当不会再被窥视打扰了。",		--物品名：盒中泰拉 检查状态：特殊事件生成已被禁用
        },

        MIGHTY_GYM =
        {
            GENERIC = "看一眼就觉得肌肉拉伤。",		--物品名：强大健身房 检查状态：普通状态
            BURNT = "再不会让谁拉伤了。",		--物品名：强大健身房 检查状态：已经烧毁
        },

        DUMBBELL = "我更常做脑力训练。",		--物品名：哑铃
        DUMBBELL_GOLDEN = "精诚所至，金石为开。",		--物品名：黄金哑铃
		DUMBBELL_MARBLE = "我早把脑子练成了最结实的一块肌肉。",		--物品名：大理石哑铃
        DUMBBELL_GEM = "这点分量，我随手就能举——啊，我的腰！",		--物品名：宝石哑铃
        POTATOSACK = "不是土豆样的石头，就是石头样的土豆。",		--物品名：土豆袋

        DUMBBELL_HEAT = "热身尚可。",		--物品名：热铃
        DUMBBELL_REDGEM = "确实感到肌肉在烧。",		--物品名：火铃
        DUMBBELL_BLUEGEM = "没有比这更凉快的了。",		--物品名：冰铃

        TERRARIUMCHEST =
		{
			GENERIC = "没人因为偷看箱子而出事吧？",		--物品名：显眼箱子 检查状态：普通状态
			BURNT = "它不会再打扰谁了。",		--物品名：显眼箱子 检查状态：已经烧毁
			SHIMMER = "那东西看着有些格格不入。",		--物品名：显眼箱子 检查状态：宝箱正在闪烁提示
		},

		EYEMASKHAT = "蒙上眼，反而看得更清楚。",		--物品名：眼面具

        EYEOFTERROR = "眼睛是弱点。瞄准它。",		--物品名：恐怖之眼
        EYEOFTERROR_MINI = "它在看我。",		--物品名：可疑窥视者
        EYEOFTERROR_MINI_GROUNDED = "快了。它要破壳了。",		--物品名：恐怖之蛋

        FROZENBANANADAIQUIRI = "冰凉、甜腻。尚可。",		--物品名：冰香蕉冻唇蜜
        BUNNYSTEW = "它的运气，到此为止。",		--物品名：炖兔子
        MILKYWHITES = "……不必了。",		--物品名：乳白物

        CRITTER_EYEOFTERROR = "多一只眼睛照看，也不算坏事。",		--物品名：友好窥视者

        SHIELDOFTERROR ="用它的下颌作盾。颇有创意。",		--物品名：恐怖盾牌
        TWINOFTERROR1 = "敌友未明。先别动。",		--物品名：激光眼
        TWINOFTERROR2 = "看不清立场。都别动。",		--物品名：魔焰眼

		COTL_TRINKET = "一件小玩意儿，也算成就。",		--物品名：红眼冠
		TURF_COTL_GOLD = "别踩。那地面比你的鞋贵。",		--物品名：黄金地板
		TURF_COTL_BRICK = "砖。铺得还算齐整。",		--物品名：砖地板
		COTL_TABERNACLE_LEVEL1 =
		{
			LIT = "光很柔。让人想留下，喵。",		--物品名：低微咩咩雕像 检查状态：已经点亮
			GENERIC = "还缺燃料。",		--物品名：低微咩咩雕像 检查状态：普通状态
		},
		COTL_TABERNACLE_LEVEL2 =
		{
			LIT = "这座像，有点鼓舞人心。",		--物品名：有所改进咩咩雕像 检查状态：已经点亮
			GENERIC = "燃料不足。",		--物品名：有所改进咩咩雕像 检查状态：普通状态
		},
		COTL_TABERNACLE_LEVEL3 =
		{
			LIT = "我可以一直看下去……一直。",		--物品名：完美无瑕咩咩雕像 检查状态：已经点亮
			GENERIC = "等着添燃料。",		--物品名：完美无瑕咩咩雕像 检查状态：普通状态
		},

        CATTOY_MOUSE = "给老鼠装上轮子。人类真是闲不住，喵。",		--物品名：发条鼠玩具
        KITCOON_NAMETAG = "名字要好好取。就叫……小灰，小银。",		--物品名：小浣猫项圈

		KITCOONDECOR1 =
        {
            GENERIC = "不是真鸟。小家伙们分不清。",		--物品名：火鸡不倒翁 检查状态：普通状态
            BURNT = "起火了。",		--物品名：火鸡不倒翁 检查状态：已经烧毁
        },
		KITCOONDECOR2 =
        {
            GENERIC = "它们总是三心二意。我也是，喵。",		--物品名：逗猫小鱼 检查状态：普通状态
            BURNT = "烧没了。",		--物品名：逗猫小鱼 检查状态：已经烧毁
        },

		KITCOONDECOR1_KIT = "需要组装。我来。",		--物品名：火鸡不倒翁套装
		KITCOONDECOR2_KIT = "工序不复杂。",		--物品名：逗猫小鱼套装

        WX78MODULE_MAXHEALTH = "小小一枚，倒装了不少学问。",		--物品名：强化电路
        WX78MODULE_MAXSANITY1 = "精巧。里面全是门道。",		--物品名：处理器电路
        WX78MODULE_MAXSANITY = "结构紧凑。设计者有些心思。",		--物品名：超级处理器电路
        WX78MODULE_MOVESPEED = "这么小的东西，藏着这么多道理。",		--物品名：加速电路
        WX78MODULE_MOVESPEED2 = "精密得近乎优雅。",		--物品名：超级加速电路
        WX78MODULE_HEAT = "一枚电路，胜过一炉火。",		--物品名：热能电路
        WX78MODULE_NIGHTVISION = "夜里也能看清。正合我意。",		--物品名：光电电路
        WX78MODULE_COLD = "制冷之物。夏天会想念它。",		--物品名：制冷电路
        WX78MODULE_TASER = "电。用来对付不听话的。",		--物品名：电气化电路
        WX78MODULE_LIGHT = "光被收进了这么小的壳里。",		--物品名：照明电路
        WX78MODULE_MAXHUNGER1 = "胃口也能改造。真是执着，喵。",		--物品名：胃增益电路
        WX78MODULE_MAXHUNGER = "吃得多，未必是好事。",		--物品名：超级胃增益电路
        WX78MODULE_MUSIC = "会唱歌的零件。有点意思，喵。",		--物品名：合唱盒电路
        WX78MODULE_BEE = "模仿蜂。造物者的玩笑。",		--物品名：豆增压电路
        WX78MODULE_MAXHEALTH2 = "加固过的。摸上去很稳。",		--物品名：超级强化电路

        WX78_SCANNER =
        {
            GENERIC ="他把一部分自己，放进了这里。",		--物品名：生物扫描分析仪 检查状态：普通状态
            HUNTING = "别让那份数据跑了。",		--物品名：生物扫描分析仪 检查状态：正在搜寻扫描目标
            SCANNING = "它有发现了。",		--物品名：生物扫描分析仪 检查状态：正在扫描目标
        },

        WX78_SCANNER_ITEM = "它会梦见被扫描的羊吗。",		--物品名：生物扫描分析仪
        WX78_SCANNER_SUCCEEDED = "它急着展示成果。可以理解。",		--物品名：生物扫描分析仪

        WX78_MODULEREMOVER = "精细，复杂。别乱碰。",		--物品名：电路提取器

        SCANDATA = "有新鲜研究的气味。",		--物品名：生物数据

		JUSTEGGS = "蛋。还缺一点培根。",		--物品名：普通煎蛋
		VEGGIEOMLET = "早餐要吃得像样。",		--物品名：早餐锅
		TALLEGGS = "早餐上的突破。",		--物品名：苏格兰高鸟蛋
		BEEFALOFEED = "不必了，谢谢。",		--物品名：蒸树枝
		BEEFALOTREAT = "颗粒太粗。不合我的口味。",		--物品名：皮弗娄牛零食

        BOAT_ROTATOR = "方向由我定。左或右，都一样。",		--物品名：转向舵
        BOAT_ROTATOR_KIT = "该带它出去转一圈。",		--物品名：转向舵套装
        BOAT_BUMPER_KELP = "解决不了全部问题。聊胜于无。",		--物品名：海带保险杠
        BOAT_BUMPER_KELP_KIT = "一件待装的护舷。",		--物品名：海带保险杠套装
		BOAT_BUMPER_SHELL = "一层薄壳。总比没有好。",		--物品名：贝壳保险杠
        BOAT_BUMPER_SHELL_KIT = "护舷，尚未装上。",		--物品名：贝壳保险杠套装
        BOAT_BUMPER_CRABKING = "王冠的光，照在我的船上。",		--物品名：帝王蟹保险杠
        BOAT_BUMPER_CRABKING_KIT = "装上去就好了。",		--物品名：帝王蟹保险杠套装

        BOAT_CANNON = {
            GENERIC = "空的。得找东西填进去。",		--物品名：大炮 检查状态：普通状态
            AMMOLOADED = "装填完毕。随时可以开火。",		--物品名：大炮 检查状态：已经装填弹药
            NOAMMO = "没有炮弹。耐心些。",		--物品名：大炮 检查状态：没有装填弹药
        },
        BOAT_CANNON_KIT = "还不是炮。装配好就是了。",		--物品名：大炮套装
        CANNONBALL_ROCK_ITEM = "尺寸正好。",		--物品名：炮弹

        OCEAN_TRAWLER = {
            GENERIC = "捕鱼的工具。效率不错。",		--物品名：海洋拖网捕鱼器 检查状态：普通状态
            LOWERED = "放下去了。等。",		--物品名：海洋拖网捕鱼器 检查状态：捕捞网已经放下
            CAUGHT = "有东西进去了。",		--物品名：海洋拖网捕鱼器 检查状态：渔网已经捕获目标
            ESCAPED = "到手的东西，跑了。",		--物品名：海洋拖网捕鱼器 检查状态：捕获目标已经逃脱
            FIXED = "修好了。可以继续。",		--物品名：海洋拖网捕鱼器 检查状态：已经修复
        },
        OCEAN_TRAWLER_KIT = "该放在鱼多的地方。",		--物品名：海洋拖网捕鱼器套装

        BOAT_MAGNET =
        {
            GENERIC = "我向来被磁力吸引。像……那词我一时想不起。",		--物品名：自动航行仪 检查状态：普通状态
            ACTIVATED = "成了。……我早知道会成。",		--物品名：自动航行仪 检查状态：已经激活
        },
        BOAT_MAGNET_KIT = "诸多妙想之一。不值一提。",		--物品名：自动航行仪套装

        BOAT_MAGNET_BEACON =
        {
            GENERIC = "附近有磁铁，它就会靠过去。",		--物品名：自动航行灯塔 检查状态：普通状态
            ACTIVATED = "磁力。",		--物品名：自动航行灯塔 检查状态：已经激活
        },
        DOCK_KIT = "造一座码头所需的，都在这里。",		--物品名：码头套装
        DOCK_WOODPOSTS_ITEM = "果然。码头缺的就是它。",		--物品名：码头桩

        MONKEYHUT =
        {
            GENERIC = "树屋太易燃。不是久留之地。",		--物品名：猴子小屋 检查状态：普通状态
            BURNT = "我早说过了。",		--物品名：猴子小屋 检查状态：已经烧毁
        },
        POWDER_MONKEY = "在我的船上撒野，胆子不小。",		--物品名：火药猴
        PRIME_MATE = "帽子戴对了，话就不用多说。",		--物品名：大副
		LIGHTCRAB = "会发光的东西。有意思。",		--物品名：发光蟹
        CUTLESS = "切不了东西，扎人倒是很在行。",		--物品名：木头短剑
        CURSED_MONKEY_TOKEN = "看上去无害。仅是看上去。",		--物品名：诅咒饰品
        OAR_MONKEY = "桨也能当武器。",		--物品名：战桨
        BANANABUSH = "那丛灌木结的是香蕉。",		--物品名：香蕉丛
        DUG_BANANABUSH = "连根挖起，也还是香蕉。",		--物品名：香蕉丛
        PALMCONETREE = "长成松树模样的棕榈。有意思，喵。",		--物品名：棕榈松果树
        PALMCONE_SEED = "一棵树的开始。",		--物品名：棕榈松果树芽
        PALMCONE_SAPLING = "它的志向，是长成一棵树。",		--物品名：棕榈松果树苗
        PALMCONE_SCALE = "若树有指甲，大约长这样。",		--物品名：棕榈松果树鳞片
        MONKEYTAIL = "能不能吃，值得一验。",		--物品名：猴尾草
        DUG_MONKEYTAIL = "拔出来了。还是那句话：能吃吗。",		--物品名：猴尾草

        MONKEY_MEDIUMHAT = "戴上去，像个船长了。",		--物品名：船长的三角帽
        MONKEY_SMALLHAT = "至少能护住头发。",		--物品名：海盗头巾
        POLLY_ROGERSHAT = "一只小鸟说过它有用。",		--物品名：波莉·罗杰的帽子
        POLLY_ROGERS = "说话的就是它。",		--物品名：波莉·罗杰

        MONKEYISLAND_PORTAL = "只出不进。这不合常理。",		--物品名：非自然传送门
        MONKEYISLAND_PORTAL_DEBRIS = "这机器看着眼熟。奇怪。",		--物品名：损坏的机器
        MONKEYQUEEN = "这一带，听她的。",		--物品名：月亮码头女王
        MONKEYPILLAR = "名副其实的栋梁。",		--物品名：猴子柱
        PIRATE_FLAG_POLE = "喂。",		--物品名：月亮码头海盗旗

        BLACKFLAG = "绅士海盗，还是个科学家。名号顺口。",		--物品名：黑旗
        PIRATE_STASH = "这装饰，我喜欢。",		--物品名：海盗藏宝点
        STASH_MAP = "人生有些方向，值得一看。",		--物品名：海盗地图

        BANANAJUICE = "喝下去，有点落草为寇的意思，喵。",		--物品名：香蕉奶昔

        FENCE_ROTATOR = "注意。重新布防。",		--物品名：栅栏击剑

        CHARLIE_STAGE_POST = "是陷阱。剧本早就写好了。",		--物品名：舞台
        CHARLIE_LECTURN = "有人要演戏？",		--物品名：剧本

        CHARLIE_HECKLER = "它们是来添戏的。",		--物品名：嘲鸫

        PLAYBILL_THE_DOLL = "C.W. 亲笔。",		--物品名：附魔玩偶 舞台剧
        PLAYBILL_THE_VEIL = "暗域先驱献上。",		--物品名：黑罩 舞台剧
        PLAYBILL_THE_VAULT = "署名只有一个字母：E。",		--物品名：任务完成 一份忏悔
        STATUEHARP_HEDGESPAWNER = "花回来了。头没有。",		--物品名：荆棘密布的雕像
        HEDGEHOUND = "埋伏。",		--物品名：蔷薇狼
        HEDGEHOUND_BUSH = "一丛荆棘。",		--物品名：蔷薇

        MASK_DOLLHAT = "玩偶的面具。",		--物品名：玩偶面具
        MASK_DOLLBROKENHAT = "裂了的玩偶面具。",		--物品名：开裂玩偶面具
        MASK_DOLLREPAIREDHAT = "曾经是玩偶面具。",		--物品名：破碎玩偶面具
        MASK_BLACKSMITHHAT = "铁匠的面具。",		--物品名：铁匠面具
        MASK_MIRRORHAT = "说是面具，倒更像镜子。",		--物品名：镜子面具
        MASK_QUEENHAT = "女王的面具。",		--物品名：女王面具
        MASK_KINGHAT = "国王的面具。",		--物品名：国王面具
        MASK_TREEHAT = "树的面具。",		--物品名：树木面具
        MASK_FOOLHAT = "小丑的面具。",		--物品名：小丑面具

        COSTUME_DOLL_BODY = "玩偶的戏服。",		--物品名：玩偶服
        COSTUME_QUEEN_BODY = "女王的戏服。",		--物品名：女王服
        COSTUME_KING_BODY = "国王的戏服。",		--物品名：国王服
        COSTUME_BLACKSMITH_BODY = "铁匠的戏服。",		--物品名：铁匠服
        COSTUME_MIRROR_BODY = "一套戏服。",		--物品名：镜子服
        COSTUME_TREE_BODY = "树的戏服。",		--物品名：树木服
        COSTUME_FOOL_BODY = "小丑的戏服。",		--物品名：小丑服

        STAGEUSHER =
        {
            STANDING = "请把手收回去。",		--物品名：多刺舞台之手 检查状态：舞台侍者处于站姿
            SITTING = "古怪。我说不清缘由。",		--物品名：多刺舞台之手 检查状态：舞台侍者处于坐姿
        },
        SEWING_MANNEQUIN =
        {
            GENERIC = "打扮得再好，也走不了一步。",		--物品名：假人 检查状态：普通状态
            BURNT = "烧成灰了，更走不了。",		--物品名：假人 检查状态：已经烧毁
        },

		MAGICIAN_CHEST = "我为什么开始不安。",		--物品名：魔术师箱子
		TOPHAT_MAGICIAN = "这帽子颇有风度。",		--物品名：魔术师高礼帽

        YOTR_FIGHTRING_KIT = "为科学而建。我确信。",		--物品名：枕头大战坑套装
        YOTR_FIGHTRING_BELL =
        {
            GENERIC = "暂且安静了。",		--物品名：枕头大战钟 检查状态：普通状态
            PLAYING = "今天在这里，都学到了些东西。",		--物品名：枕头大战钟 检查状态：游戏正在进行
        },

        YOTR_DECOR_1 = {
            GENERAL = "那只兔子能照亮一间屋子，喵。",		--物品名：矮兔灯 检查状态：普通装饰状态
            OUT = "它现在照不亮任何东西。",		--物品名：矮兔灯 检查状态：火焰已经熄灭
        },
        YOTR_DECOR_2 = {
            GENERAL = "高处的兔子，也照样亮堂。",		--物品名：高兔灯 检查状态：普通装饰状态
            OUT = "熄了。什么都照不见。",		--物品名：高兔灯 检查状态：火焰已经熄灭
        },

        HAREBALL = "如今……更糟的我也吃过，喵。",		--物品名：兔毛球
        YOTR_DECOR_1_ITEM = "放哪儿，我已经想好了。",		--物品名：矮兔灯
        YOTR_DECOR_2_ITEM = "位置我来定。",		--物品名：高兔灯

		DREADSTONE = "它反射暗影，不反射光。",		--物品名：绝望石
		HORRORFUEL = "看一眼，脊背就发凉。",		--物品名：纯粹恐惧
		DAYWALKER =
		{
			GENERIC = "放他出来，或许草率了。",		--物品名：梦魇疯猪 检查状态：普通状态
			IMPRISONED = "我为他感到一点惋惜。",		--物品名：梦魇疯猪 检查状态：仍被束缚囚禁
		},
		DAYWALKER_PILLAR =
		{
			GENERIC = "大理石里有东西在闪。",		--物品名：开裂的柱子 检查状态：普通状态
			EXPOSED = "石柱。牢不可破。",		--物品名：开裂的柱子 检查状态：封印或遮挡已经移除
		},
		DAYWALKER2 =
		{
			GENERIC = "别去惹他。",		--物品名：拾荒疯猪 检查状态：普通状态
			BURIED = "他被压在垃圾下面。",		--物品名：拾荒疯猪 检查状态：被埋在地下
			HOSTILE = "他被惹恼了。退后。",		--物品名：拾荒疯猪 检查状态：处于敌对状态
		},
		ARMORDREADSTONE = "轻便，结实，还算体面。",		--物品名：绝望石盔甲
		DREADSTONEHAT = "护住我的头脑。这就够了。",		--物品名：绝望石头盔

        LUNARRIFT_PORTAL = "那么多学问藏在里面。我却够不着。",		--物品名：裂隙
        LUNARRIFT_CRYSTAL = "发光的结晶。",		--物品名：月亮裂隙晶体

        LUNARTHRALL_PLANT = "它不太懂什么叫距离。",		--物品名：致命亮茄
        LUNARTHRALL_PLANT_VINE_END = "浑身是刺。",		--物品名：钻地藤蔓

		LUNAR_GRAZER = "它是从那道裂隙里来的。",		--物品名：牧者

        PUREBRILLIANCE = "光太盛。眼睛受不了。",		--物品名：纯粹辉煌
        LUNARPLANT_HUSK = "硬得出奇。我用得上。",		--物品名：亮茄外壳

		LUNAR_FORGE = "就在这里，做点聪明东西。",		--物品名：辉煌铁匠铺
		LUNAR_FORGE_KIT = "元素简单，组合不难。",		--物品名：辉煌铁匠铺套装

		LUNARPLANT_KIT = "我也能做几针缝补。",		--物品名：亮茄修补套件
		ARMOR_LUNARPLANT = "这副甲，已无可改进。",		--物品名：亮茄盔甲
		LUNARPLANTHAT = "戴上它，显得更聪明了。",		--物品名：亮茄头盔
		BOMB_LUNARPLANT = "植物学与化学，一并奏效。",		--物品名：亮茄炸弹
		STAFF_LUNARPLANT = "植物的力量。",		--物品名：亮茄魔杖
		SWORD_LUNARPLANT = "挥起来，忍不住想配一句声。",		--物品名：亮茄剑
		PICKAXE_LUNARPLANT = "碎。",		--物品名：亮茄粉碎者
		SHOVEL_LUNARPLANT = "挪动泥土的潜力，无穷。",		--物品名：亮茄锄铲

		BROKEN_FORGEDITEM = "破了。我能修。",		--物品名：损坏的熔炉装备

        PUNCHINGBAG = "上面装了个会喊疼的仪表，喵。",		--物品名：拳击袋

        SHADOWRIFT_PORTAL = "那东西，像是不会停。",		--物品名：裂隙

		SHADOW_FORGE = "它会给什么样的黑暗设计以生命。",		--物品名：暗影术基座
		SHADOW_FORGE_KIT = "不做实验，就失了本分。",		--物品名：暗影术基座套装

        FUSED_SHADELING = "我更喜欢你小的时候。那时你烦的是别人。",		--物品名：熔合暗影
        FUSED_SHADELING_BOMB = "热闹得很。",		--物品名：绝望螨

		VOIDCLOTH = "这些暗影，裁自同一块布。",		--物品名：暗影碎布
		VOIDCLOTH_KIT = "在暗影里缝纫，我略知一二。",		--物品名：虚空修补套件
		VOIDCLOTHHAT = "一顶帽子，满身神秘。",		--物品名：虚空风帽
		ARMOR_VOIDCLOTH = "前面开了口子。糟糕。",		--物品名：虚空长袍

        VOIDCLOTH_UMBRELLA = "我最恨头发被酸蚀掉。",		--物品名：暗影伞
        VOIDCLOTH_SCYTHE = "收割变得太简单了。可怕。",		--物品名：暗影收割者

		SHADOWTHRALL_HANDS = "手拿开。",		--物品名：墨荒
		SHADOWTHRALL_HORNS = "它想打。",		--物品名：墨荒
		SHADOWTHRALL_WINGS = "那翅膀，大约只是摆设。",		--物品名：墨荒
		SHADOWTHRALL_MOUTH = "嘴真多。",		--物品名：墨荒

        CHARLIE_NPC =
        {
            GENERIC = "等等，那是……", 		--物品名：查理 检查状态：普通状态
            SCENE2 = "她想做什么。", 		--物品名：查理 检查状态：第二段剧情：查理放入钥匙并布置仪式
            SCENE3 = "她到底想做什么。", 		--物品名：查理 检查状态：第三段剧情：双钥匙与祭品就绪，查理提示启动仪式
        },
        CHARLIE_HAND = "它想要某种可怕的东西。",		--物品名：召唤之手

        NITRE_FORMATION = "某种石头。确定无疑。",		--物品名：硝石堆
        DREADSTONE_STACK = "来自裂隙深处。",		--物品名：绝望石矿苗

        SCRAPBOOK_PAGE = "有人喜欢做图鉴。",		--物品名：丢失的图鉴页面

        LEIF_IDOL = "把木头刻成树，有些多余。",		--物品名：树精守卫雕像
        WOODCARVEDHAT = "雕工很细。",		--物品名：硬木帽
        WALKING_STICK = "一根好棍子。",		--物品名：木手杖

        IPECACSYRUP = "这个，我不太想喝。",		--物品名：泻根糖浆
        BOMB_LUNARPLANT_WORMWOOD = "我们的朋友，离他月亮的根源更近了。", 		--物品名：沃姆伍德的亮茄炸弹
        WORMWOOD_MUTANTPROXY_CARRAT =
        {
        	DEAD = "走到头了。",		--物品名：沃姆伍德变异胡萝卜鼠 检查状态：已经死亡
        	GENERIC = "胡萝卜怎么长了腿。",		--物品名：沃姆伍德变异胡萝卜鼠 检查状态：普通状态
        	HELD = "近了看，真丑。",		--物品名：沃姆伍德变异胡萝卜鼠 检查状态：正被角色携带
        	SLEEPING = "睡着时还算可爱。",		--物品名：沃姆伍德变异胡萝卜鼠 检查状态：正在睡眠
        },
        WORMWOOD_MUTANTPROXY_LIGHTFLIER = "装在我口袋里，居然还亮着。",		--物品名：沃姆伍德变异球状光虫
		WORMWOOD_MUTANTPROXY_FRUITDRAGON =
		{
			GENERIC = "可爱。可惜还没熟。",		--物品名：沃姆伍德变异沙拉蝾螈 检查状态：普通状态
			RIPE = "现在该熟了。",		--物品名：沃姆伍德变异沙拉蝾螈 检查状态：已经成熟
			SLEEPING = "打盹中。",		--物品名：沃姆伍德变异沙拉蝾螈 检查状态：正在睡眠
		},

        SUPPORT_PILLAR_SCAFFOLD = "现在什么都看不见。",		--物品名：支柱脚手架
        SUPPORT_PILLAR = "得尽快腾出时间处理它。",		--物品名：支柱
        SUPPORT_PILLAR_COMPLETE = "看着它，心里踏实。",		--物品名：加固支柱
        SUPPORT_PILLAR_BROKEN = "你曾经又高又壮。",		--物品名：支柱瓦砾

		SUPPORT_PILLAR_DREADSTONE_SCAFFOLD = "还盖着。看不到里面。",		--物品名：绝望石支柱脚手架
		SUPPORT_PILLAR_DREADSTONE = "拖延不是我的习惯。",		--物品名：绝望石支柱
		SUPPORT_PILLAR_DREADSTONE_COMPLETE = "强得有些吓人。",		--物品名：加固绝望石支柱
		SUPPORT_PILLAR_DREADSTONE_BROKEN = "唉。真可怕。",		--物品名：绝望石支柱瓦砾

        WOLFGANG_WHISTLE = "让我想起从前那些糟糕的课。",		--物品名：训练哨


        MUTATEDDEERCLOPS = "它眼里有点东西。",		--物品名：晶体独眼巨鹿
        MUTATEDWARG = "那双眼睛，亮得刺眼。",		--物品名：附身座狼
        MUTATEDBEARGER = "接下来会很难看。",		--物品名：装甲熊獾

        LUNARFROG = "别盯着我。",		--物品名：明眼青蛙

        DEERCLOPSCORPSE =
        {
            GENERIC  = "结束了……吧。",		--物品名：独眼巨鹿尸体 检查状态：普通状态
            BURNING  = "谨慎些总没错。",		--物品名：独眼巨鹿尸体 检查状态：正在燃烧
            REVIVING = "我不信我的眼睛。",		--物品名：独眼巨鹿尸体 检查状态：尸体正在复活
        },

        WARGCORPSE =
        {
            GENERIC  = "我为什么还是不安。",		--物品名：座狼尸体 检查状态：普通状态
            BURNING  = "这样也好。",		--物品名：座狼尸体 检查状态：正在燃烧
            REVIVING = "以学问之名，这算什么。",		--物品名：座狼尸体 检查状态：尸体正在复活
        },

        BEARGERCORPSE =
        {
            GENERIC  = "臭得没法闻。",		--物品名：熊獾尸体 检查状态：普通状态
            BURNING  = "险。",		--物品名：熊獾尸体 检查状态：正在燃烧
            REVIVING = "必有解释。只是我还不知道。",		--物品名：熊獾尸体 检查状态：尸体正在复活
        },

        BEARGERFUR_SACK = "上面还有它的毛。看得我发冷。",		--物品名：极地熊獾桶
        HOUNDSTOOTH_BLOWPIPE = "用牙？不太卫生。",		--物品名：嚎弹炮
        DEERCLOPSEYEBALL_SENTRYWARD =
        {
            GENERIC = "这才叫冷眼。",    		--物品名：冰眼结晶器 检查状态：普通状态
            NOEYEBALL = "谁丢了一只眼睛。",  		--物品名：冰眼结晶器 检查状态：缺少独眼巨鹿眼球
        },
        DEERCLOPSEYEBALL_SENTRYWARD_KIT = "都退后。这里由我来。",		--物品名：冰眼结晶器套装

        SECURITY_PULSE_CAGE = "有趣。是空的。",		--物品名：火花柜
        SECURITY_PULSE_CAGE_FULL = "一小团纯能量。倒挺乖。",		--物品名：火花柜

		CARPENTRY_STATION =
        {
            GENERIC = "能打家具。",		--物品名：锯马 检查状态：普通状态
            BURNT = "如今打不了家具了。",		--物品名：锯马 检查状态：已经烧毁
        },

        WOOD_TABLE =
        {
            GENERIC = "我偶尔用它。",		--物品名：木桌 检查状态：普通状态
            HAS_ITEM = "桌上放了东西。也好。",		--物品名：木桌 检查状态：已经放置物品
            BURNT = "用不了了。",		--物品名：木桌 检查状态：已经烧毁
        },

        WOOD_CHAIR =
        {
            GENERIC = "想坐。",		--物品名：木椅 检查状态：普通状态
            OCCUPIED = "有人了。",		--物品名：木椅 检查状态：当前已有使用者或内容物
            BURNT = "这个，我不想坐。",		--物品名：木椅 检查状态：已经烧毁
        },

        DECOR_CENTERPIECE = "太过精巧，喵。",		--物品名：艺术？
        DECOR_LAMP = "一盏待客的灯。",		--物品名：餐桌灯
        DECOR_FLOWERVASE =
        {
            GENERIC = "插花的好瓶。",		--物品名：餐桌花瓶 检查状态：普通状态
            EMPTY = "空瓶。也好看。",		--物品名：餐桌花瓶 检查状态：内容为空
            WILTED = "花不新鲜了。",		--物品名：餐桌花瓶 检查状态：花朵已经枯萎
            FRESHLIGHT = "有一点光，真好。",		--物品名：餐桌花瓶 检查状态：插着新鲜发光花朵
            OLDLIGHT = "我记得提醒过麦斯威尔换灯。",		--物品名：餐桌花瓶 检查状态：插着已经枯萎的发光花朵
        },
        DECOR_PICTUREFRAME =
        {
            GENERIC = "真美。",		--物品名：空画框 检查状态：普通状态
            UNDRAWN = "该往里面画点什么。",		--物品名：空画框 检查状态：尚未绘制图案
        },
        DECOR_PORTRAITFRAME = "画得不错。",		--物品名：愉快画像

        PHONOGRAPH = "不。这个我见过。",		--物品名：留声机
        RECORD = "那首歌刚被我忘掉，又回来了。",		--物品名：唱片
        RECORD_CREEPYFOREST = "一张唱片，装一整首。技术走得够远。",		--物品名：惊悚森林
        RECORD_DANGER = "不是我最爱的那首。", 		--物品名：危险主题唱片
        RECORD_DAWN = "小号再响一点就好了。", 		--物品名：黎明主题唱片
        RECORD_DRSTYLE = "一整首都在里面。真是奢侈。",		--物品名：D.R.风格
        RECORD_DUSK = "缺一点小号。", 		--物品名：黄昏主题唱片
        RECORD_EFS = "更实验一些。",		--物品名：E.F.S.
        RECORD_END = "到最后了。唱片还转着。", 		--物品名：终曲唱片
        RECORD_MAIN = "再添一支小号。", 		--物品名：主题唱片
        RECORD_WORKTOBEDONE = "曲子在试新路子。", 		--物品名：工作主题唱片
        RECORD_HALLOWEDNIGHTS = "够惊艳，喵。",		--物品名：万圣夜
        RECORD_BALATRO = "抗拒不了。它碰到了我心里。",		--物品名：《小丑牌》联动唱片

        ARCHIVE_ORCHESTRINA_MAIN = "像是特意做成看不懂的样子。",		--物品名：远古小合奏机

        WAGPUNKHAT = "我身上的齿轮也跟着转了。",		--物品名：W.A.R.B.I.S.头戴齿轮
        ARMORWAGPUNK = "令人敬服的齿轮。",		--物品名：W.A.R.B.I.S.盔甲
        WAGSTAFF_MACHINERY = "垃圾堆里也许有发现。",		--物品名：被丢弃的垃圾
        WAGPUNK_BITS = "这些废料，能做出点惊人的东西。",		--物品名：废料
        WAGPUNKBITS_KIT = "机器修机器。接下来还想要什么。",		--物品名：自动修理机

        WAGSTAFF_MUTATIONS_NOTE = "引人入胜。也引人深思。",		--物品名：研究笔记


        BATTLESONG_INSTANT_REVIVE = "这曲子有生命力，喵。",		--物品名：战士重奏

        WATHGRITHR_IMPROVEDHAT = "薇格弗德本就善战。还要加翼。",		--物品名：统帅头盔
        SPEAR_WATHGRITHR_LIGHTNING = "通了电。更锋利了。",		--物品名：奔雷矛

        BATTLESONG_CONTAINER = "能装这么多曲子。",		--物品名：战斗号子罐

        SADDLE_WATHGRITHR = "薇格弗德的手艺？她真是如虎添翼。",		--物品名：战斗鞍具

        WATHGRITHR_SHIELD = "护住我。",		--物品名：战斗圆盾

        BATTLESONG_SHADOWALIGNED = "这出戏，让我坐不住。",		--物品名：黑暗悲歌
        BATTLESONG_LUNARALIGNED = "这调子，也让我坐不住。",		--物品名：启迪摇篮曲

		SHARKBOI = "我竟抖了一下。",		--物品名：大霜鲨
        BOOTLEG = "很远的地方，有个海盗丢了靴。",		--物品名：出逃腿靴
        OCEANWHIRLPORTAL = "转得挺快。",		--物品名：漩涡传送门

        EMBERLIGHT = "不用燃料的火。倒省事。",		--物品名：火球
        WILLOW_EMBER = "美吗？我觉得是，喵。",		--物品名：以太余烬

        YOTD_DRAGONSHRINE =
        {
            GENERIC = "供品？我倒要看看它挑不挑嘴。",		--物品名：龙蝇神龛 检查状态：普通状态
            EMPTY = "空着。它多半只收木炭一类。",		--物品名：龙蝇神龛 检查状态：内容为空
            BURNT = "烧过头了。手艺欠佳。",		--物品名：龙蝇神龛 检查状态：已经烧毁
        },

        DRAGONBOAT_KIT = "别磨蹭，拼起来便是。",		--物品名：龙蝇船套装
        DRAGONBOAT_PACK = "造船也能如此省事。倒不坏。",		--物品名：豪华龙蝇船套装

        BOATRACE_CHECKPOINT = "检查点在那儿。看清楚。",		--物品名：比赛检查点
        BOATRACE_CHECKPOINT_THROWABLE_DEPLOYKIT = "待办又多了一项。",		--物品名：比赛检查点套装
        BOATRACE_START = "总得有个起点。",		--物品名：起点塔
        BOATRACE_START_THROWABLE_DEPLOYKIT = "起点该立在何处？",		--物品名：起点塔套装

        BOATRACE_PRIMEMATE = "有人与我同行。也好。",		--物品名：查理的选手
        BOATRACE_SPECTATOR_DRAGONLING = "它在为我鼓劲。我记下了。",		--物品名：小龙蝇观赛者

        YOTD_STEERINGWHEEL = "舵在我手里，航向便由我。",		--物品名：龙蝇船方向舵
        YOTD_STEERINGWHEEL_ITEM = "能做成舵。",		--物品名：龙蝇船方向舵套装
        YOTD_OAR = "桨。趁手。",		--物品名：利爪船桨
        YOTD_ANCHOR = "船得停稳，不能任它漂走。",		--物品名：巨爪船锚
        YOTD_ANCHOR_ITEM = "锚，我会造了。",		--物品名：巨爪船锚套装
        MAST_YOTD = "鳞片的帆。风也要让它三分。",		--物品名：龙翼桅杆
        MAST_YOTD_ITEM = "桅杆，我会造了。",		--物品名：龙翼桅杆套装
        BOAT_BUMPER_YOTD = "想撞我？先尝尝这只角。",		--物品名：獠牙保险杠
        BOAT_BUMPER_YOTD_KIT = "一件尚未成形的护舷。",		--物品名：獠牙保险杠套装
        BOATRACE_SEASTACK = "浮标。浪里的一点秩序。",		--物品名：黄金浮标
        BOATRACE_SEASTACK_THROWABLE_DEPLOYKIT = "浮标，还未下水。",		--物品名：黄金浮标套装
        BOATRACE_SEASTACK_MONKEY = "荆棘浮标。碰它要付代价。",		--物品名：荆棘浮标
        BOATRACE_SEASTACK_MONKEY_THROWABLE_DEPLOYKIT = "荆棘浮标，正等着扎人。",		--物品名：荆棘浮标套装
        MASTUPGRADE_LAMP_YOTD = "灯亮了。夜里总算有只眼睛。",		--物品名：龙蝇灯
        MASTUPGRADE_LAMP_ITEM_YOTD = "我脑子里尽是好主意，还发光。",		--物品名：龙蝇灯套装
        WALKINGPLANK_YOTD = "这条板子，怎么用都不体面。",		--物品名：龙鳞跳板
        CHESSPIECE_YOTD = "只是座雕像，我却看得心口发紧。",		--物品名：起点塔雕塑


        HEALINGSALVE_ACID = "这药膏能了结不少麻烦。",		--物品名：黏糊糊的药膏

        BEESWAX_SPRAY = "甲醛的味道。刺鼻。",		--物品名：防腐喷雾
        WAXED_PLANT = "它被封在蜡里，像被吓住了。",		--物品名：已打蜡作物

        STORAGE_ROBOT = {
            GENERIC = "别太得意。",		--物品名：瓦器人 检查状态：普通状态
            BROKEN = "坏了。",		--物品名：瓦器人 检查状态：已经损坏
        },

        SCRAP_MONOCLEHAT = "能让我显得更尊贵些吗？",		--物品名：视界扩展器
        SCRAPHAT = "帽尖很利。与我一般。",		--物品名：拾荒尖帽

        FENCE_JUNK = "丑。不过我不介意。",		--物品名：垃圾栅栏
        JUNK_PILE = "翻垃圾？我不推辞。",		--物品名：垃圾堆
        JUNK_PILE_BIG = {
            BLUEPRINT = "上面有可学的东西。",		--物品名：摇摇欲坠的垃圾堆 检查状态：包含可学习的蓝图
            GENERIC = "随时会塌。",		--物品名：摇摇欲坠的垃圾堆 检查状态：普通状态
        },

        ARMOR_LUNARPLANT_HUSK = "穿上它，身上要多几根刺。",		--物品名：荆棘茄甲


        OTTER = "去找别的水獭吧。",		--物品名：水獭掠夺者
        OTTERDEN = {
            GENERIC = "一个水獭窝，别无他物。",		--物品名：水獭掠夺者窝点 检查状态：普通状态
            HAS_LOOT = "里面有东西。值得细看。",		--物品名：水獭掠夺者窝点 检查状态：巢穴中存有战利品
        },
        OTTERDEN_DEAD = "水漫上来了。",		--物品名：拆毁的水獭掠夺者窝点

        BOAT_ANCIENT_ITEM = "还是老法子靠得住。",		--物品名：古董船套装
        BOAT_ANCIENT_CONTAINER = "“货物”是水手的行话，意思是“东西”。",		--物品名：货舱
        WALKINGPLANK_ANCIENT = "就不能造一艘救生船吗？",		--物品名：古董跳板

        ANCIENTTREE_SEED = "所谓惊喜，不过是我尚未统计完。",		--物品名：惊喜种子

        ANCIENTTREE_GEM = {
            GENERIC = "蔬菜与矿物的结合体。有意思。",		--物品名：萌芽石 检查状态：普通状态
            STUMP = "树桩。已被采过。",		--物品名：萌芽石 检查状态：只剩树桩
        },

        ANCIENTTREE_SAPLING_ITEM = "得把它种在对的地方。",		--物品名：远古树苗种子

        ANCIENTTREE_SAPLING = {
            GENERIC = "它在长。我看是。",		--物品名：远古树苗 检查状态：普通状态
            WRONG_TILE = "这片土给不了它养分。",		--物品名：远古树苗 检查状态：当前地皮不适合种植
            WRONG_SEASON = "看着合适，可它还没打算长。",		--物品名：远古树苗 检查状态：当前季节不适合种植
        },

        ANCIENTTREE_NIGHTVISION = {
            GENERIC = "请对它客气些，喵。",		--物品名：阴郁之棘 检查状态：普通状态
            STUMP = "一截树桩。",		--物品名：阴郁之棘 检查状态：只剩树桩
        },

        ANCIENTFRUIT_GEM = "刚从树上落下，还带着温。",		--物品名：晶洞果
        ANCIENTFRUIT_NIGHTVISION = "若能少抽搐一点就好了。",		--物品名：夜莓
        ANCIENTFRUIT_NIGHTVISION_COOKED = "煮熟了，总算不抽了。",		--物品名：熟夜莓

        BOATPATCH_KELP = "眼下只能这样补。",		--物品名：海带补丁

        CRABKING_MOB = "你想尝尝蟹怒？",		--物品名：蟹卫
        CRABKING_MOB_KNIGHT = "这身壳，是道难题。",		--物品名：蟹骑士
        CRABKING_CANNONTOWER = "这些螃蟹果然备了炮。",		--物品名：加农炮塔
        CRABKING_ICEWALL = "一道冰墙，隔在我与那螃蟹之间。",		--物品名：冰障

        SALTLICK_IMPROVED = "看着它，我便渴了。",		--物品名：美味舔盐块

        OFFERING_POT =
        {
            GENERIC = "空得可怜。一片海带也没有。",		--物品名：食堂海带盘 检查状态：普通状态
            SOME_KELP = "还能再添些海带。",		--物品名：食堂海带盘 检查状态：供品锅中有少量海带
            LOTS_OF_KELP = "海带满得溢出来。",		--物品名：食堂海带盘 检查状态：供品锅中海带很多
        },

        OFFERING_POT_UPGRADED =
        {
            GENERIC = "仍旧空着。可惜。",		--物品名：高级食堂海带盘 检查状态：普通状态
            SOME_KELP = "这点海带，不够看。",		--物品名：高级食堂海带盘 检查状态：供品锅中有少量海带
            LOTS_OF_KELP = "满满一锅海带。",		--物品名：高级食堂海带盘 检查状态：供品锅中海带很多
        },

        MERM_ARMORY = "牌上写着“鱼人专用”。",		--物品名：鱼人军械库
        MERM_ARMORY_UPGRADED = "同样的字：鱼人专用。",		--物品名：高级鱼人军械库
        MERM_TOOLSHED = "这里头找不出像样的学问。",		--物品名：劣质工具棚
        MERM_TOOLSHED_UPGRADED = "好一些，也仍不成体统。",		--物品名：不那么劣质的工具棚
        MERMARMORHAT = "鱼人的头盔。不合我。",		--物品名：沼泽斗士头盔
        MERMARMORUPGRADEDHAT = "依旧是鱼人的头盔。不合我。",		--物品名：沼泽战士头盔
        MERM_TOOL = "什么都能干，什么都干不好。",		--物品名：劣质工具
        MERM_TOOL_UPGRADED = "这工具，勉强可用。",		--物品名：不那么劣质的工具

        WURT_SWAMPITEM_SHADOW = "骇人。……别告诉她我说过。",		--物品名：绝望投泥带
        WURT_SWAMPITEM_LUNAR = "盯着它，头皮有些发麻。",		--物品名：光芒投泥带

        MERM_SHADOW = "这道影子，是它从前的自己。",		--物品名：暗影鱼人
        MERMGUARD_SHADOW = "影子而已。从前的它。",		--物品名：暗影鱼人守卫

        MERM_LUNAR = "鱼人的下一个形态。",		--物品名：变异鱼人
        MERMGUARD_LUNAR = "它也在往那个形态去。",		--物品名：变异鱼人守卫


        SHADOW_BEEF_BELL = "与我那只旧牛铃一模一样。",		--物品名：阴郁皮弗娄牛铃
        SADDLE_SHADOW = "它让我想起些事。嗯。",		--物品名：梦魇鞍具
        SHADOW_BATTLEAXE = "好了。旧账就此揭过。",		--物品名：暗影槌
        VOIDCLOTH_BOOMERANG = "能先看看退货条款吗？",		--物品名：阴郁回旋镖
		ROPE_BRIDGE_KIT = "桥。跨过去便是。",		--物品名：洞穴探险者的桥梁套件
		GELBLOB =
		{
			GENERIC = "“咦——”就对了。",		--物品名：恶液 检查状态：普通状态
			HAS_ITEM = "哦，我把东西落这儿了。",		--物品名：恶液 检查状态：已经放置物品
			HAS_CHARACTER = "有人陷进去了。",		--物品名：恶液 检查状态：内部困有角色
		},
        RABBITKING_AGGRESSIVE = "兔子也有脾气。",		--物品名：暴戾兔王
        RABBITKING_PASSIVE = "为善意致意。",		--物品名：和善兔王
        RABBITKING_LUCKY = "为了学问，得逮住它。",		--物品名：机缘兔子
        RABBITKINGMINION_BUNNYMAN = "它们疯了。",		--物品名：皇家兔子警卫
        ARMOR_CARROTLURE = "胡萝卜甲。裹得紧实，我喜欢。",		--物品名：胡萝卜外套
        RABBITKINGHORN = "兔子爱听乐声。",		--物品名：挖洞兔号角
        RABBITKINGHORN_CHEST = "我会时不时用一用。",		--物品名：便携式巢穴
        RABBITKINGSPEAR = "这一棍，力道不错。",		--物品名：兔王棍
        RABBITHAT = "戴上它，头顶便住着兔子。",		--物品名：洞穴花环
        WORM_BOSS = "大虫子。",		--物品名：巨大洞穴蠕虫

        STONE_TABLE =
        {
            GENERIC = "桌子。我偶尔也用。",		--物品名：石桌 检查状态：普通状态
            HAS_ITEM = "桌上摆着东西。",		--物品名：石桌 检查状态：已经放置物品
        },

        STONE_CHAIR =
        {
            GENERIC = "那张石椅……我想坐坐看。",		--物品名：石椅 检查状态：普通状态
            OCCUPIED = "有人坐着。",		--物品名：石椅 检查状态：当前已有使用者或内容物
        },

        CARPENTRY_BLADE_MOONGLASS = "像我的心思一样，锋利。",		--物品名：月光玻璃锯片

        CHEST_MIMIC_REVEALED = "可怕。真是可怕。",		--物品名：暴躁箱子

        GELBLOB_STORAGE = {
            GENERIC  = "空的。喵。",		--物品名：恶液储存箱 检查状态：普通状态
            FULL = "用来保持……新鲜？",		--物品名：恶液储存箱 检查状态：内容已满
        },
        GELBLOB_STORAGE_KIT = "我的判断，自己收着。",		--物品名：恶液储存箱套件
        GELBLOB_BOTTLE = "东西装瓶，摆好。我中意。",		--物品名：恶液罐

        PLAYER_HOSTED =
        {
            GENERIC = "已被占住了。",		--物品名：被附身的尸体 检查状态：普通状态
            ME = "我已站在疯狂的边上。",		--物品名：被附身的尸体 检查状态：由当前角色主持
        },

        MASK_SAGEHAT = "看着很利落。",		--物品名：贤者面具
        MASK_HALFWITHAT = "有点笨拙。",		--物品名：蠢人面具
        MASK_TOADYHAT = "我该配合一下吗？",		--物品名：马屁精面具

        SHADOWTHRALL_PARASITE = "它让我的脑子发痒。",		--物品名：虚空面具

        PUMPKINCARVER = "谁想参与一个顶好的项目？",		--物品名：南瓜雕刻工具
		SNOWMAN =
		{
			GENERIC = "别拿雪开玩笑。",		--物品名：雪人 检查状态：普通状态
			SNOWBALL = "滚得倒是利索，喵。",		--物品名：雪人 检查状态：雪球形态
		},
        SNOWBALL_ITEM = "这个机会，我绝不放过。",		--物品名：雪球

        YOTS_SNAKESHRINE =
        {
            GENERIC = "前景一片大好。",		--物品名：洞穴蠕虫神龛 检查状态：普通状态
            EMPTY = "它饿得很凶。",		--物品名：洞穴蠕虫神龛 检查状态：内容为空
            BURNT = "薇洛。",		--物品名：洞穴蠕虫神龛 检查状态：已经烧毁
        },
        YOTS_WORM = "它来自浅处的深渊。",		--物品名：镀金洞穴蠕虫
        YOTS_LANTERN_POST =
        {
            GENERIC = "柱子立定在那里。",		--物品名：喜庆灯笼柱 检查状态：普通状态
            BURNT = "柱子今后只能是这个样子了。",		--物品名：喜庆灯笼柱 检查状态：已经烧毁
        },
        YOTS_LANTERN_POST_ITEM = "柱子该立在何处？",		--物品名：喜庆灯笼柱套装
        CHESSPIECE_DEPTHWORM  = "是条蠕虫。没跑。",		--物品名：深渊蠕虫雕塑

        GHOSTLYELIXIR_LUNAR = "嗯。非常科学。",		--物品名：光之怒
        GHOSTLYELIXIR_SHADOW = "嗯。同样科学。",		--物品名：诅咒之苦

		SLINGSHOTMODKIT = "沃尔特的手艺，确实尽力了。",		--物品名：弹弓野外作业包
		SLINGSHOT_BAND_PIGSKIN = "沃尔特做得很用心。",		--物品名：猪皮弹弓皮筋
		SLINGSHOT_BAND_TENTACLE = "沃尔特真肯下功夫。",		--物品名：甩尾弹弓皮筋
		SLINGSHOT_BAND_MIMIC = "他把心思都耗在这上面了。",		--物品名：附身弹弓皮筋
		SLINGSHOT_FRAME_BONE = "骨框。他确实尽力。",		--物品名：骨制弹弓框
		SLINGSHOT_FRAME_GEMS = "铥矿的框。讲究。",		--物品名：铥矿弹弓框
		SLINGSHOT_FRAME_WAGPUNK_0 = "废料做的框。也算一件。",		--物品名：废料弹弓框
		SLINGSHOT_FRAME_WAGPUNK = "加量的废料框。用得着。",		--物品名：加量废料弹弓框
		SLINGSHOT_HANDLE_STICKY = "黏手的手柄。不太体面。",		--物品名：粘性弹弓手柄
		SLINGSHOT_HANDLE_JELLY = "蜂王浆的手柄。腻。",		--物品名：蜂王浆弹弓手柄
		SLINGSHOT_HANDLE_SILK = "缠了丝。手感尚可。",		--物品名：弹弓手柄缠带
		SLINGSHOT_HANDLE_VOIDCLOTH = "虚空布手柄。有点凉。",		--物品名：虚空弹弓手柄

		WOBY_TREAT = "这零食，恐怕不是给人吃的。",		--物品名：沃比零食
		BANDAGE_BUTTERFLYWINGS = "上了绷带，便得小心些。",		--物品名：扑腾绷带
		PORTABLEFIREPIT_ITEM = "火可以随身带了。专利申请中。",		--物品名：便携营火
        SLINGSHOTAMMO_CONTAINER = "满是可能性。",		--物品名：弹药袋

        ELIXIR_CONTAINER = "与其说是篮子，不如说是殓房的口袋。",		--物品名：野餐盒
        GHOSTFLOWERHAT = "戴上它，我便口渴。",		--物品名：幽魂花冠
        WENDY_RESURRECTIONGRAVE = "古怪。却让人安心。",		--物品名：多年生植物祭坛
        GRAVEURN =
        {
            GENERIC = "这只瓮里没有灵魂。",		--物品名：灵魂容器 检查状态：普通状态
            HAS_SPIRIT = "灵魂找到了新住处。",		--物品名：灵魂容器 检查状态：骨灰罐中已有灵魂能量
        },

        SHALLOW_GRAVE = "你死，好过我死。",		--物品名：矮坟
        THULECITEBUGNET = "有人抓到最新的蜂后了吗？",		--物品名：铥矿捕虫网

        DECK_OF_CARDS = "要玩一整套吗？",		--物品名：牌堆
        PLAYING_CARD = "再五十一张，才凑得齐一副。",		--物品名：扑克牌
        BALATRO_MACHINE = "让我来一局。喵。",		--物品名：小丑

		GESTALT_CAGE =
		{
			GENERIC = "可惜，是空的。",		--物品名：幻灵捕获机 检查状态：普通状态
			FILLED = "里面有主了。",		--物品名：幻灵捕获机 检查状态：容器已经装入目标
		},
		WAGBOSS_ROBOT_SECRET = "真有意思。",		--物品名：未公开构造体
        WAGBOSS_ROBOT = "有意思。",		--物品名：战争瓦器人
        WAGBOSS_ROBOT_POSSESSED = "有人试过关机再启吗？",		--物品名：启迪战争瓦器人
		WAGBOSS_ROBOT_LEG = "它居然还站了一会儿。",		--物品名：战争瓦器人腿
		ALTERGUARDIAN_PHASE1_LUNARRIFT = "一样，又不一样。",		--物品名：天体仇灵
		ALTERGUARDIAN_PHASE1_LUNARRIFT_GESTALT = "这大概就是它要的。",		--物品名：纯粹虚影
        ALTERGUARDIAN_PHASE4_LUNARRIFT = "你毁掉的学问还不够多吗？",		--物品名：天体后裔
		WAGDRONE_ROLLING =
        {
            GENERIC = "就这么一直转下去。",		--物品名：螨地爬 检查状态：普通状态
            INACTIVE = "该带它转一圈。",		--物品名：螨地爬 检查状态：当前未激活
            DAMAGED = "能修。修不好便拆件。",		--物品名：螨地爬 检查状态：已经受损
            FRIENDLY = "转起来，赢大奖。喵。",		--物品名：螨地爬 检查状态：处于友好状态
        },
        WAGDRONE_FLYING =
        {
            GENERIC = "活像从地底爬出来的机器。",		--物品名：黄莺 检查状态：普通状态
            INACTIVE = "带它转一圈就好。",		--物品名：黄莺 检查状态：当前未激活
            DAMAGED = "坏得太透，只能拆件。",		--物品名：黄莺 检查状态：已经受损
        },
		WAGDRONE_PARTS = "这下能让事情顺起来。",		--物品名：陀螺传导核心
		WAGDRONE_BEACON = "方便把东西圈住。",		--物品名：螨地爬屏障柱

        WAGPUNK_WORKSTATION = "开工。",		--物品名：概念制造器
        WAGPUNK_LEVER = "该换个方向了。",		--物品名：杠杆选择器
        WAGPUNK_FLOOR_KIT = "这是什么地面？",		--物品名：基底扩展器
        WAGPUNK_CAGEWALL = "成墙，或者什么都不成。",		--物品名：动能场扩展器

		WAGSTAFF_ITEM_1 = "奇怪。这手套不是投影。",		--物品名：手套
		WAGSTAFF_ITEM_2 = "这块剪贴板……是真的。",		--物品名：剪贴板

        HERMITCRAB_RELOCATION_KIT = "她的新居，会是一只完好的瓶。",		--物品名：隐士迁居套装

        WANDERINGTRADER =
        {
            REVEALED = "交易过后，我们算不算朋友？",		--物品名：怪皮弗娄牛 检查状态：隐藏商人已经现身
            GENERIC = "这头牛，长得不太对。",		--物品名：怪皮弗娄牛 检查状态：普通状态
        },

        GESTALT_GUARD_EVOLVED = "这些家伙脾气很冲。",		--物品名：敌意虚影
        FLOTATIONCUSHION = "啊，浮力。喵。",		--物品名：个人漂浮装置
        LUNAR_SEED = "它曾是某顶冠冕的一部分。",		--物品名：天体珠宝

        WAGBOSS_ROBOT_CONSTRUCTIONSITE = "暂时被盖住了。",		--物品名：战争瓦器人底座
        WAGBOSS_ROBOT_CONSTRUCTIONSITE_KIT = "大机器被拆成了小包。",		--物品名：战争瓦器人底座套装
        WAGBOSS_ROBOT_CREATION_PARTS = "碎片散得到处都是。",		--物品名：战争瓦器人零件
        MOONSTORM_STATIC_CATCHER = "里面什么也没有。",		--物品名：静电约束仪
        COOLANT = "气泡里满是可能。",		--物品名：核化液

        FENCE_ELECTRIC = {
            LINKED = "它接上了。电流通了。",		--物品名：麻刺节点 检查状态：已经与电力网络连接
            GENERIC = "单用没有用。",		--物品名：麻刺节点 检查状态：普通状态
        },
        FENCE_ELECTRIC_ITEM = "不是树，但同样得栽进土里。",		--物品名：麻刺节点

        MUTATEDBIRD = "该是稀有的鸟。",		--物品名：亮喙鸟

        BIRDCORPSE =
        {
            GENERIC  = "只剩一具空壳。",		--物品名：鸟类尸体 检查状态：普通状态
            BURNING  = "这才是真正的火鸟。",		--物品名：鸟类尸体 检查状态：正在燃烧
            REVIVING = "它在变成别的物种。",		--物品名：鸟类尸体 检查状态：尸体正在复活
        },

        BUZZARDCORPSE = {
            GENERIC  = "不过是具空壳。",		--物品名：秃鹫尸体 检查状态：普通状态
            BURNING  = "这才叫火鸟。",		--物品名：秃鹫尸体 检查状态：正在燃烧
            REVIVING = "它正在变成别的物种。",		--物品名：秃鹫尸体 检查状态：尸体正在复活
        },

        MUTATEDBUZZARD_GESTALT = {
            GENERIC = "它对死亡的专注，我欣赏。",		--物品名：水晶冠秃鹫 检查状态：普通状态
            EATING_CORPSE = "别介意我……尝一口腐肉。",		--物品名：水晶冠秃鹫 检查状态：正在啃食尸体
        },


        SHADOWTHRALL_CENTIPEDE = {
            HEAD = "头，还是头？",		--物品名：巨荒蜈 检查状态：正在检查头部
            BODY = "太骇人了。",		--物品名：巨荒蜈 检查状态：正在检查躯干部位
            FLIPPED = "翻过来了。",		--物品名：巨荒蜈 检查状态：身体已经翻转
        },

        TREE_ROCK =
		{
			BURNING = "树干像是过热了。",		--物品名：巨石枝 检查状态：正在燃烧
			CHOPPED = "没了支撑。",		--物品名：巨石枝 检查状态：已经砍伐
			GENERIC = "我看像藤蔓。",		--物品名：巨石枝 检查状态：普通状态
		},

        CAVE_VENT_ROCK =
        {
            GENERIC = "我看不出它朝哪喷。",		--物品名：喷气孔 检查状态：普通状态
            HOT     = "气氛越来越热。",		--物品名：喷气孔 检查状态：温度很高
            GAS     = "它在排气。",		--物品名：喷气孔 检查状态：正在排放气体
            MIASMA  = "我要是哮喘怎么办？",		--物品名：喷气孔 检查状态：正在释放瘴气
        },
        CAVE_FERN_WITHERED = "一株枯掉的蕨。",		--物品名：枯萎的蕨类
        FLOWER_CAVE_WITHERED = "黯淡的球茎。喵。",		--物品名：枯萎的荧光花

		ABYSSPILLAR_MINION =
		{
			GENERIC = "还好只是尊雕像。",		--物品名：追随者 检查状态：普通状态
			ACTIVATED = "毫无新意。",		--物品名：追随者 检查状态：已经激活
		},
		ABYSSPILLAR_TRIAL = "那里有个拉杆。",		--物品名：杠杆

        VAULT_TELEPORTER =
        {
            GENERIC = "想着不如动着。",		--物品名：圣殿路标 检查状态：普通状态
            BROKEN = "坏了。",		--物品名：圣殿路标 检查状态：已经损坏
            UNPOWERED = "得给它通电。",		--物品名：圣殿路标 检查状态：尚未供能
        },
		VAULT_TELEPORTER_UNDERCONSTRUCTION = "“此处为未来内容，正在施工。”",		--物品名：建造中的宝库传送器
		VAULT_ORB = "但愿它管用。",		--物品名：传送宝珠
        VAULT_LOBBY_EXIT = "系根绳子，我就能爬出去。",		--物品名：裂口
		VAULT_CHANDELIER_BROKEN = "光灭了。",		--物品名：圣殿华灯

		ANCIENT_HUSK = "这里出过不好的事。",		--物品名：远古遗骸
		MASK_ANCIENT_HANDMAIDHAT = "我不想惹她。",		--物品名：鞘翅面具
		MASK_ANCIENT_ARCHITECTHAT = "看不出哪里像。",		--物品名：远见者面具
		MASK_ANCIENT_MASONHAT = "比其他的重些。",		--物品名：工匠面具

        TREE_ROCK_SEED = "一颗种子。喵。",		--物品名：巨石枝种子
        TREE_ROCK_SAPLING = "坚如石的小苗。",		--物品名：巨石枝树苗

        OCEANWHIRLBIGPORTALEXIT = "海上的碎屑。",		--物品名：海洋漂浮物

		VAULT_TORCH =
		{
			GENERIC = "这是灯的开关？",		--物品名：谜之火焰 检查状态：普通状态
			BROKEN = "开关像是坏了。",		--物品名：谜之火焰 检查状态：已经损坏
		},

        CAVE_VENT_MITE =
		{
			DEAD = "没气了。",		--物品名：地热螨 检查状态：已经死亡
			GENERIC = "这又是什么螨？",		--物品名：地热螨 检查状态：普通状态
			SLEEPING = "当心，它随时会醒。",		--物品名：地热螨 检查状态：正在睡眠
            VENTING = "它正喷着怒气。",		--物品名：地热螨 检查状态：正在从通风口涌出
        },


		PUMPKINHAT =
		{
			GENERIC = "好空的一张脸。喵。",		--物品名：无面南瓜 检查状态：普通状态
			UNCARVED = "没有脸，我不戴。",		--物品名：无面南瓜 检查状态：尚未雕刻
		},

        PENGUINCORPSE =
		{
            GENERIC  = "只剩一副空壳。",		--物品名：企鸥尸体 检查状态：普通状态
            BURNING  = "这才算火鸟。",		--物品名：企鸥尸体 检查状态：正在燃烧
            REVIVING = "它在换一副模样。",		--物品名：企鸥尸体 检查状态：尸体正在复活
		},
        SPIDERCORPSE =
		{
			GENERIC = "恶心。",		--物品名：蜘蛛尸体 检查状态：普通状态
			BURNING = "这下好多了。喵。",		--物品名：蜘蛛尸体 检查状态：正在燃烧
			REVIVING = "简直大错。",		--物品名：蜘蛛尸体 检查状态：尸体正在复活
		},
        SPIDERQUEENCORPSE =
		{
			GENERIC = "呃。我觉得恶心。",		--物品名：蜘蛛女王尸体 检查状态：普通状态
			BURNING = "这下干净了。",		--物品名：蜘蛛女王尸体 检查状态：正在燃烧
			REVIVING = "这下糟了。",		--物品名：蜘蛛女王尸体 检查状态：尸体正在复活
		},
        MERMCORPSE =
		{
			GENERIC = "一条鱼人死了。",		--物品名：鱼人尸体 检查状态：普通状态
			BURNING = "这气味很糟。",		--物品名：鱼人尸体 检查状态：正在燃烧
			REVIVING = "死鱼人醒了。",		--物品名：鱼人尸体 检查状态：尸体正在复活
		},
        GENERIC_CORPSE =
        {
            GENERIC = "确定死了。",		--物品名：普通生物尸体 检查状态：普通状态
            BURNING = "不会再回来了。",		--物品名：普通生物尸体 检查状态：正在燃烧
            REVIVING = "年年有今日。",		--物品名：普通生物尸体 检查状态：尸体正在复活
        },


		W_RADIO = "嗯。科技含量很高。",		--物品名：B.U.D.D.Y.

		HERMITHOTSPRING  =
        {
            BOMBED = "放松的完美配方。喵。",		--物品名：珍珠的温泉 检查状态：被沐浴球处理过
            GENERIC = "能泡一泡这身倦骨就好了。",		--物品名：珍珠的温泉 检查状态：普通状态
            EMPTY = "水呢？",		--物品名：珍珠的温泉 检查状态：内容为空
        },
		HERMITHOTSPRING_CONSTR = "还在建。",		--物品名：温泉
		MEATRACK_HERMIT_MULTI =
        {
            DONE = "肉干可以吃了。",		--物品名：晾肉巨架 检查状态：处理已经完成
            DRYING = "风干要时间。",		--物品名：晾肉巨架 检查状态：肉类正在晾晒
            DRYINGINRAIN = "雨天更慢。",		--物品名：晾肉巨架 检查状态：雨中仍挂着肉类，晾晒暂停
            GENERIC =  "正是风干的好时候。",		--物品名：晾肉巨架 检查状态：普通状态
            BURNT = "架子烧了。",		--物品名：晾肉巨架 检查状态：已经烧毁
            DONE_NOTMEAT = "用实验的说法，这叫“干燥”。",		--物品名：晾肉巨架 检查状态：非肉类晾晒已经完成
            DRYING_NOTMEAT = "风干算不上学问。",		--物品名：晾肉巨架 检查状态：非肉类正在晾晒
            DRYINGINRAIN_NOTMEAT = "雨，走开。想下，改日再来。",		--物品名：晾肉巨架 检查状态：雨中仍挂着非肉类，晾晒暂停
            DONE_SALT = "咸得恰好。",		--物品名：晾肉巨架 检查状态：盐渍晾晒已经完成
			ABANDONED = "它尽力干过了。",		--物品名：晾肉巨架 检查状态：已被原主人遗弃
        },
		HERMITHOUSE_ORNAMENT = "多么悦耳。喵。",		--物品名：风铃
		HERMITHOUSE_LAUNDRY = "该提醒她，还是装作没看见？",		--物品名：寄居蟹隐士的晾衣处

        PETALS_DRIED = "花瓣干了。收起来。",		--物品名：干花瓣
        PETALS_EVIL_DRIED = "深色的花瓣，干了也好看。",		--物品名：干深色花瓣
        FOLIAGE_DRIED = "干蕨叶，可以做书签。",		--物品名：干蕨叶
        SUCCULENT_PICKED_DRIED = "干多肉，像一枚小标本。",		--物品名：干多肉
        FIRENETTLES_DRIED = "干火荨麻，碰它要当心。",		--物品名：干火荨麻叶
        TILLWEED_DRIED = "干透了。收进袋里。",		--物品名：干犁地草

        MOON_TREE_BLOSSOM_DRIED = "晒得恰到好处。",		--物品名：干月树花
        FORGETMELOTS_DRIED = "干透了。忘性倒是还在。",		--物品名：干必忘我

        HERMITCRABTEA_PETALS = "花瓣茶。适合安静的午后。",		--物品名：花瓣茶
        HERMITCRABTEA_PETALS_EVIL = "深色的那种。入口前请三思。",		--物品名：深色花瓣茶
        HERMITCRABTEA_FOLIAGE = "蕨叶清苦。不至于让我失态。",		--物品名：蕨叶茶
        HERMITCRABTEA_SUCCULENT_PICKED = "多肉泡的茶。留着路上喝。",		--物品名：多肉茶
        HERMITCRABTEA_FIRENETTLES = "该贴一张“小心烫口”的标签。",		--物品名：火荨麻茶
        HERMITCRABTEA_TILLWEED = "为健康，浅酌一口。",		--物品名：犁地草茶
        HERMITCRABTEA_MOON_TREE_BLOSSOM = "味道里有一丝蜡。我不点破。",		--物品名：月树花茶
        HERMITCRABTEA_FORGETMELOTS = "连我的执念，都被它泡软了，喵。",		--物品名：必忘我茶
        SHELLWEAVER = "盐晶组合机。总算做了点有用的。",		--物品名：盐晶组合机
        ICESTAFF2 = "附赠一场免费的冻结。",		--物品名：闪冻魔杖
        ICESTAFF3 = "冻得更彻底，也更体面。",		--物品名：深冻魔杖
        NONSLIPGRIT = "不吸引眼球，只抓住鞋底。",		--物品名：防滑粉
        NONSLIPGRITBOOSTED = "这下站稳了。",		--物品名：防滑颗粒
        DESICCANT = "干燥。彻底的干燥。",		--物品名：小包干燥剂
        DESICCANTBOOSTED = "干爽得令人满意。",		--物品名：大包干燥剂
        HERMITCRAB_SHELL = "载我去珍珠那儿一趟。",		--物品名：搬运海螺
        SALTY_DOGHAT = "附带一条友谊的小船。",		--物品名：咸狗帽
        SALTY_DOG = "最骄傲的小家伙，是你吗？",		--物品名：咸狗

        HERMITCRAB_TEASHOP =
        {
            GENERIC = "店是空的，茶也是。", 		--物品名：珍珠的茶店 检查状态：普通状态
            ACTIVE = "茶点时间。请坐。", 		--物品名：珍珠的茶店 检查状态：正在运作
            BREWING = "价钱不低，只为她这一壶。", 		--物品名：珍珠的茶店 检查状态：完成交易后正在沏茶
            BURNT = "烧得只剩焦壳。", 		--物品名：珍珠的茶店 检查状态：已经烧毁
        },

        FISHMEAT_DRIED = "这条鱼干得有内容。",		--物品名：鱼肉干
        FISHMEAT_SMALL_DRIED = "小鱼干。嚼劲尚可。",		--物品名：小鱼干

        HERMITCRAB_LIGHTPOST = 
        {
            GENERIC = "灯亮着，气氛就有了。",		--物品名：珍珠的灯柱 检查状态：普通状态
            ABANDONED = "被遗弃的灯。我不太想看。",		--物品名：珍珠的灯柱 检查状态：已被原主人遗弃
        },
        HERMITCRAB_LIGHTPOST_ITEM = "把这些灯串起来吧。",		--物品名：珍珠的灯柱套装


        YOTH_KNIGHTSHRINE =
        {
            GENERIC = "它已经蓄满了力。", 		--物品名：发条骑士神龛 检查状态：普通状态
            EMPTY = "没有供品，它便不理人。", 		--物品名：发条骑士神龛 检查状态：内容为空
            BURNT = "烧成灰，也还是匹马。", 		--物品名：发条骑士神龛 检查状态：已经烧毁
        },

        MASK_PRINCESSHAT = "公主殿下，失礼了。",		--物品名：公主面具
        COSTUME_PRINCESS_BODY = "事后的议论，不必理会。",		--物品名：公主服

        PLAYBILL_THE_PRINCESS_YOTH = "这出戏，你验过了吗？",		--物品名：《我的四骑士与我》 舞台剧

        KNIGHT_YOTH =
        {
            GENERIC = "别在我面前装糊涂。", 		--物品名：镀金骑士 检查状态：普通状态
            FOLLOWING = "好骑士。跟紧我。", 		--物品名：镀金骑士 检查状态：正在跟随当前检查角色
            FOLLOWING_OTHER = "现在谁领头？我很好奇。", 		--物品名：镀金骑士 检查状态：正在跟随其他角色
        },

        YOTH_KNIGHTHAT = "戴上它，我像小马驹吗？",		--物品名：镀金骑士头盔
        ARMOR_YOTH_KNIGHT = "这些疑问，比马鞍还沉。",		--物品名：镀金骑士胸甲
        HORSESHOE = "留着吧。好运总不嫌多。",		--物品名：幸运马蹄铁
        YOTH_LANCE = "别把我认作那位枪不离手的骑士。",		--物品名：冲锋骑枪

        FLOATINGLANTERN =
        {
            DEFLATED = "泄了气。可惜。", 		--物品名：天灯 检查状态：已经泄气
            HELD = "诀窍在于松手。", 		--物品名：天灯 检查状态：正被角色携带
            GENERIC = "这不就亮了，喵。", 		--物品名：天灯 检查状态：普通状态
        },

        YOTH_KNIGHTSTICK = "随我驰骋。",		--物品名：滑稽马
        YOTH_CHAIR_ROCKING_ITEM = "坐上去，颠得厉害。", 		--物品名：摇摇马套装


		WX78_DRONE_SCOUT = "飞得够远。很好。",		--物品名：旋翼测绘机
		WX78_DRONE_DELIVERY = "只担心它会弄丢东西。",		--物品名：便携储存单元
		WX78_DRONE_ZAP = "电的技术，用得很直接。",		--物品名：电刑机
		WX78_DRONE_ZAP_REMOTE =
		{
			GENERIC = "远程操控。名副其实。",		--物品名：电刑机控制器 检查状态：普通状态
			CANUSE = "想电的太多，时间太少。",		--物品名：电刑机控制器 检查状态：当前可以使用
		},

        WX78MODULE_RADAR = "这么小的东西，装下这么多学问。",		--物品名：增程电路
        WX78MODULE_STACKSIZE = "空间被折叠得妥帖。",		--物品名：空间扩展电路
        WX78MODULE_DIGESTION = "连消化都替人想好了。",		--物品名：再消化电路
        WX78MODULE_SCREECH = "声波。吵，但有用。",		--物品名：声波激发电路
        WX78MODULE_LIGHT2 = "光很足。我不介意。",		--物品名：超级照明电路
        WX78MODULE_SHIELDING = "格挡，是很体面的防守。",		--物品名：格挡电路
        WX78MODULE_SPIN = "旋转的周期，算得很准。",		--物品名：旋转周期电路
		WX78MODULE_CHESS = "棋局已在它心里走完了。",		--物品名：棋圣电路

        WX78_INVENTORYCONTAINER =
        {
            HELD = "空间无限。", 		--物品名：坍缩储存单元 检查状态：正被角色携带
			NOPOWER = "拒绝访问。电量不足。", 		--物品名：坍缩储存单元 检查状态：没有电力
            GENERIC = "空间有限。", 		--物品名：坍缩储存单元 检查状态：普通状态
        },

        WX78_FOODBRICK =
        {
            WET = "湿着，也得吃。",		--物品名：营养砖 检查状态：处于潮湿状态
            GENERIC = "硬得难以下口。",		--物品名：营养砖 检查状态：普通状态
        },

        WX78_BACKUPBODY =
        {
            GENERIC = "工程学给了它另一种永生。", 		--物品名：备份底盘 检查状态：普通状态
            UNCLAIMED = "硬件不错。", 		--物品名：备份底盘 检查状态：备用躯体尚未绑定主人
            VIEWERS_BODY = "可悲的肉体，被困在有机形态里。", 		--物品名：备份底盘 检查状态：这是当前机器人的备用躯体
        },

        WX78_POSSESSEDBODY = "你近来不太像你自己。",		--物品名：附身底盘

        WX78_GESTALTTRAPPER = "WX是被什么附了身，才做出这个？",		--物品名：灵体传输模块

        SHADOW_HEART_VEIN = "一条渴望有用的脉管。",		--物品名：暗影心房卷须

        WX78_SHADOWDRONE_DEBUFFER = "观察得很准。",		--物品名：破绽放大机
        WX78_SHADOWDRONE_HARVESTER = "WX藏品里的一件收集器。",		--物品名：自动抓取机

        STALKER_NPC = "说好了，往事不必再提。",		--物品名：远古织影者

        MITEGLAND =
        {
            GENERIC = "这些螨虫肚子里，确实有点东西。",		--物品名：火腺 检查状态：普通状态
            COLD = "凉了。",		--物品名：火腺 检查状态：温度较低
        },
        MITEGLAND_COOKED = "熟了。至于吃，我再想想。",		--物品名：熟火腺

        BROKEN_FUMAROLETOOLITEM = "温度够高，我或许能把碎片熔回去。", 		--物品名：损坏的火山工具
        FUMAROLEAXE =
		{
			GENERIC = "又冷又脆。", 		--物品名：炽热斧 检查状态：普通状态
			LUKEWARM = "它在转凉。", 		--物品名：炽热斧 检查状态：温度微温
			WARM = "热起来了。", 		--物品名：炽热斧 检查状态：温度较暖
			HOT = "烫手。请拿稳。", 		--物品名：炽热斧 检查状态：温度很高
		},

        FUMAROLEPICKAXE =
		{
			GENERIC = "冷得发脆。", 		--物品名：烈焰鹤嘴锄 检查状态：普通状态
			LUKEWARM = "渐渐有了温度。", 		--物品名：烈焰鹤嘴锄 检查状态：温度微温
			WARM = "热意上来了。", 		--物品名：烈焰鹤嘴锄 检查状态：温度较暖
			HOT = "烫。别徒手碰。", 		--物品名：烈焰鹤嘴锄 检查状态：温度很高
		},

        FUMAROLEHAMMER =
		{
			GENERIC = "又冷又硬。", 		--物品名：炎头锤 检查状态：普通状态
			LUKEWARM = "微温而已。", 		--物品名：炎头锤 检查状态：温度微温
			WARM = "热起来了。", 		--物品名：炎头锤 检查状态：温度较暖
			HOT = "烫得很。", 		--物品名：炎头锤 检查状态：温度很高
		},

        FUMAROLESHOVEL =
		{
			GENERIC = "冷硬。", 		--物品名：呲啦铲 检查状态：普通状态
			LUKEWARM = "有些温了。", 		--物品名：呲啦铲 检查状态：温度微温
			WARM = "热了。", 		--物品名：呲啦铲 检查状态：温度较暖
			HOT = "烫手。", 		--物品名：呲啦铲 检查状态：温度很高
		},

        FUMAROLE_FARM_HOE =
		{
			GENERIC = "冷得干脆。", 		--物品名：烧灼园艺锄 检查状态：普通状态
			LUKEWARM = "温度在升。", 		--物品名：烧灼园艺锄 检查状态：温度微温
			WARM = "够热了。", 		--物品名：烧灼园艺锄 检查状态：温度较暖
			HOT = "烫得厉害。", 		--物品名：烧灼园艺锄 检查状态：温度很高
		},

        TRAP_FUMAROLE =
        {
            HELD = "口袋要烧穿了。", 		--物品名：煤炭 检查状态：正被角色携带
            GENERIC = "冷的时候，它们不怎么管用。", 		--物品名：煤炭 检查状态：普通状态
            WARM = "凉了些，仍能伤人。", 		--物品名：煤炭 检查状态：温度较暖
            HOT = "我不会踩上去。", 		--物品名：煤炭 检查状态：温度很高
        },

        HEALINGSALVE_FUMAROLE = "以热制热。这方子我认得。",		--物品名：避火膏

		VAULT_PILLAR_GUARD = "刚开始，就遇上绊脚石。",		--物品名：远古戍卫塔
		VAULT_PILLAR_GUARD_CRAFTED = "谁也别想从它眼皮底下溜过去。",		--物品名：戍卫塔
		VAULT_PILLAR_GUARD_DORMANT = "一座塔而已。",		--物品名：远古之塔
		VAULT_PILLAR_GUARD_DORMANT_CRAFTED = "它只差一点灵感的火花。",		--物品名：人工建造的休眠宝库守卫柱
		VAULT_PILLAR_GUARD_CONSTR = "还缺什么？",		--物品名：戍卫塔基址
		VAULT_PILLAR_GUARD_CONSTR_PLANS = "得给它找个好位置。",		--物品名：戍卫塔套装
		VAULT_CRAWLER =
		{
			GENERIC = "偏在我势不可挡时，它从天而降。",		--物品名：辉光象鼻虫 检查状态：普通状态
			SOCKETED = "嵌得刚好，像换一只灯泡。",		--物品名：辉光象鼻虫 检查状态：已经嵌入插槽
		},

        VAULT_DECON_DOOR = "拦住里面的东西，还是外面的？",		--物品名：内殿屏障
        VAULT_DECON_MISTER = "……真神秘。",		--物品名：圣殿净化器
		VAULT_KEY_ACTIVATOR = "有个念头一闪而过。",		--物品名：脉冲基座
		VAULT_CRAWLER_LEVER = "一根神秘的拉杆。最坏能怎样？",		--物品名：杠杆
        VAULT_KEY = "总算找到回去的钥匙了。",		--物品名：钥石
        VAULT_KEY_PEDESTAL =
        {
            GENERIC = "能解开一切的钥匙，就在那里。", 		--物品名：圣匣 检查状态：普通状态
            PICKED = "空了。", 		--物品名：圣匣 检查状态：已经采集
        },
        VAULT_ORB_REFINED = "连我也会动心。",		--物品名：传送宝珠碎片
        VAULT_PILLAR_GUARD_PIECE = "这该是那座行走高塔的要件。",		--物品名：宝库守卫柱部件
        VAULT_REFINER_PEDESTAL = "何等古老的工艺。",		--物品名：圣殿锻台

        VAULT_COMPASS =
        {
            GENERIC = "这仪器，无可比拟。", 		--物品名：路标导航仪 检查状态：普通状态
            NOTVAULT = "在这里，它似乎不管用。", 		--物品名：路标导航仪 检查状态：指南针未指向宝库目标
            KEYROOM = "它先前一直把我引向这间屋子。", 		--物品名：路标导航仪 检查状态：指南针正指向宝库钥匙房
        },

        CEILING_ROPE = "一条攀爬绳。",		--物品名：绳子
        VAULT_KEY_EXIT = "这里系不了绳。",		--物品名：裂口


        CARNIVALGAME_GOLFGAME_KIT_EASY = "这里的物理规则，应该宽松些。",		--物品名：初学者迷你高尔夫套装
        CARNIVALGAME_GOLFGAME_KIT_MEDIUM = "我来试一杆。",		--物品名：标准迷你高尔夫套装
        CARNIVALGAME_GOLFGAME_KIT_HARD = "这需要多算几步。",		--物品名：专家迷你高尔夫套装
        CARNIVALGAME_GOLFGAME_KIT_DIY = "总该有个公式，能算出完美的球场。",		--物品名：自定义迷你高尔夫套装

        CARNIVALGAME_GOLF_TEE =
        {
            GENERIC = "投一枚代币，这场派对才开始。",  		--物品名：迷你高尔夫落球器 检查状态：普通状态
            PLAYING = "局已开始。", 		--物品名：迷你高尔夫落球器 检查状态：游戏正在进行
            INACTIVE = "先看清问题在哪。", 		--物品名：迷你高尔夫落球器 检查状态：当前未激活
        },
        CARNIVALGAME_GOLF_HOLE = "球会进那里的。",		--物品名：迷你高尔夫旗洞

        CARNIVALGAME_GOLF_TEE_KIT = "从哪里开始？",		--物品名：迷你高尔夫落球器套装
        CARNIVALGAME_GOLF_HOLE_KIT = "终点设在哪里？",		--物品名：迷你高尔夫旗洞套装

        CARNIVALGAME_GOLFCLUB = "推杆，准备。",		--物品名：推杆
        CARNIVALGAME_GOLFBALL = "这颗“圆”该归我。",		--物品名：高尔夫球

        CARNIVALGAME_GOLFPROP_FENCE = "这道栅栏绕不过去。",		--物品名：迷你高尔夫边界栅栏

        CARNIVALGAME_GOLFPROP_SPINNER = "它确实扭转了局面。", 		--物品名：鸦年华迷你高尔夫旋转障碍
        CARNIVALGAME_GOLFPROP_CUTOUT = "纯粹是挡路。", 		--物品名：鸦年华迷你高尔夫挡板
        CARNIVALGAME_GOLFPROP_MOVINGWALL = "这堵墙，起落了好几回。", 		--物品名：鸦年华迷你高尔夫移动墙

        CARNIVALGAME_GOLFPROP_WORMHOLE = "我想弄清两端如何相连。虽然有点恶心。", 		--物品名：迷你虫洞

        CARNIVALGAME_GOLFPROP_SPRING = "免费的弹射，也是有的。", 		--物品名：循环定向弹板

        CARNIVALGAME_GOLFPROP_FAN = "这点风，吹不动我。", 		--物品名：扇风


        ROCKY_BOSS =
        {
            GENERIC = "它倒是直截了当。",		--物品名：石虾首领（测试版暂译） 检查状态：普通状态
            BOULDER = "比石头还硬气。", 		--物品名：石虾首领（测试版暂译） 检查状态：收缩成岩石状
            ACID = "它的壳在起变化。",		--物品名：石虾首领（测试版暂译） 检查状态：受到酸液影响
        },
		ROCKY_BOSS_SHADOW = "那还能算壳吗？",		--物品名：暗影石虾首领（测试版暂译）
        BAT_BOSS =
        {
            GENERIC = "它的性格，真是耗人。",		--物品名：蝙蝠首领（测试版暂译） 检查状态：普通状态
            ACID = "看它发光。酸把它逼疯了。",		--物品名：蝙蝠首领（测试版暂译） 检查状态：受到酸液影响
        },
		BAT_BOSS_SHADOW = "也许这是另一个品种。",		--物品名：暗影蝙蝠首领（测试版暂译）

        BATBOSSCAVE =
        {
            GENERIC = "里面似乎有东西。", 		--物品名：蝙蝠首领巢穴（测试版暂译） 检查状态：普通状态
            VACANT = "没有人在家？", 		--物品名：蝙蝠首领巢穴（测试版暂译） 检查状态：巢穴空置
        },

        WORM_BOSS_SHADOW = "它太大，藏不进阴影里。",		--物品名：暗影蠕虫首领（测试版暂译）

        ARMOR_ROCKY = "这一带，由我坐镇。",		--物品名：石虾护甲（测试版暂译）
        BAT_BOSSCORPSEHAT = "戴着它，我很不安。",		--物品名：蝙蝠首领尸骸帽（测试版暂译）

        ATRIUM_RITUAL_ORGAN_ROCKY =
        {
            GENERIC = "这只爪子，不寻常。",		--物品名：中庭仪式石虾祭品（测试版暂译） 检查状态：普通状态
            IN_RITUAL = "祭品已献上。", 		--物品名：中庭仪式石虾祭品（测试版暂译） 检查状态：已经放入仪式
        },
        ATRIUM_RITUAL_ORGAN_BAT =
        {
            GENERIC = "这东西，明目张胆地恶心。",		--物品名：中庭仪式蝙蝠祭品（测试版暂译） 检查状态：普通状态
            IN_RITUAL = "献祭已经完成。", 		--物品名：中庭仪式蝙蝠祭品（测试版暂译） 检查状态：已经放入仪式
        },
        ATRIUM_RITUAL_ORGAN_WORM =
        {
            GENERIC = "这堆内脏，很重要。",		--物品名：中庭仪式蠕虫祭品（测试版暂译） 检查状态：普通状态
            IN_RITUAL = "供物已经放好了。", 		--物品名：中庭仪式蠕虫祭品（测试版暂译） 检查状态：已经放入仪式
        },

		CHARLIE_BOSS = "情况不妙。",		--物品名：查理（首领战）
		SHROUDEN =
		{
			GENERIC = "这无法用科学解释。",		--物品名：暗影实体（SHROUDEN，测试版暂译） 检查状态：普通状态
			PUDDLE = "看来，我该去取那只眼睛。",		--物品名：暗影实体（SHROUDEN，测试版暂译） 检查状态：化作地面的暗影形态
		},

        CHARLIEARENA_SPIKE = "这岩层，迷人得骇人。",		--物品名：查理竞技场尖刺（测试版暂译）

        KING_CANE =
        {
            GENERIC = "杖上配齐了人手。", 		--物品名：王之手杖（测试版暂译） 检查状态：普通状态
            EMPTY = "它需要一颗宝石。", 		--物品名：王之手杖（测试版暂译） 检查状态：内容为空
        },
        QUEEN_TORCH = "这火焰，颇为奇特。",		--物品名：女王火炬（测试版暂译）

        CHARLIEARENA_TELEPORTER = "最好把一切都带上。",		--物品名：查理竞技场传送装置（测试版暂译）

        MASK_CHARLIE_BOSSHAT = "它有多旧了呢。",		--物品名：查理面具（测试版暂译）

	},

	DESCRIBE_GENERIC = "嗯……这算什么东西。",		--检查物品描述的缺省值
	DESCRIBE_TOODARK = "太黑了。我的眼睛还没适应。",		--天太黑
	DESCRIBE_SMOLDERING = "它在冒烟。再等一下就要起火。",		--冒烟
	DESCRIBE_SAMECHARACTER = "……是我在看镜子吗？",		--检查与自己相同的角色

	DESCRIBE_PLANTHAPPY = "多么快活的一株。",		--检查植物 植物满足
	DESCRIBE_PLANTVERYSTRESSED = "它快撑不住了。",		--检查植物 植物压力山大(没戴眼镜时检查)
	DESCRIBE_PLANTSTRESSED = "它有点烦躁。",		--检查植物 植物有压力(没戴眼镜时检查)
	DESCRIBE_PLANTSTRESSORKILLJOYS = "该清一清杂草了……",		--检查植物 有讨厌的(腐烂的大蔬菜、杂草、土壤杂物碎片)
	DESCRIBE_PLANTSTRESSORFAMILY = "它很孤单。植物也怕独处。",		--检查植物 同类作物不足
	DESCRIBE_PLANTSTRESSOROVERCROWDING = "太挤了。每株都该有自己的间距。",		--检查植物 过度拥挤
	DESCRIBE_PLANTSTRESSORSEASON = "这个季节不合它的性子。",		--检查植物 季节错误
	DESCRIBE_PLANTSTRESSORMOISTURE = "缺水了。",		--检查植物 缺少水分
	DESCRIBE_PLANTSTRESSORNUTRIENTS = "它饿着，土壤也饿着。",		--检查植物 缺少养分
	DESCRIBE_PLANTSTRESSORHAPPINESS = "它想有人陪它说说话。",		--检查植物 没聊天

	EAT_FOOD =
	{
		TALLBIRDEGG_CRACKED = "带着鸟喙的味道，倒也不坏。",		--吃孵化的高脚鸟蛋
		WINTERSFEASTFUEL = "尝起来是节日的味道。",		--吃冬季盛宴食物
	},

	WENDY_SKILLTREE_EASTEREGG = "是你吗，阿比？",		--温蒂技能树彩蛋台词
}
