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

