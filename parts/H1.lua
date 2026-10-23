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
