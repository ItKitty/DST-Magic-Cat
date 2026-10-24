-- speech_madeleine.lua - 玛德琳的台词表（简体中文）
-- 本文件由 tools/build_madeleine_speech.py 生成：
--   · 键表结构、条目顺序与原版 speech_wickerbottom.lua 一致
--   · 台词取自游戏内 chinese_s.po 的 STRINGS.CHARACTERS.WICKERBOTTOM.* 翻译
--   · 约每 3 条句子在句尾标点前加一个「喵」
--   · 顶部 SPECIAL 里的台词会覆盖下方同名条目，改词只改 SPECIAL 最方便
-- 想调整「喵」的比例或重新生成：改脚本里的 MEOW_RATIO 后重跑。

-- ===== 特殊台词：写在最前面，方便单独调整；会覆盖下面的同名条目 =====
local SPECIAL =
{
	-- 缺失台词补充
	ANNOUNCE_CHARLIE_MISSED = "喵喵喵？事不过三，敢亮血条吗，查理？！",
	ANNOUNCE_HUNGRY = "饿了喵~",
	DESCRIBE =
	{
		HOTSPRING =
		{
			GENERIC = "好想进去泡一泡啊~",
		},
	},

	-- 旺达怀表
	ANNOUNCE_POCKETWATCH_MARK = "这里当锚点很不错喵。",
	ANNOUNCE_POCKETWATCH_OPEN_PORTAL = "好了，大家动作快点喵！",
	ANNOUNCE_POCKETWATCH_OPEN_PORTAL_DIFFERENTSHARD = "当心了，这一跳非同小可！",
	ANNOUNCE_POCKETWATCH_RECALL = "没有什么能比时空旅行更让喵兴奋了！",
	ANNOUNCE_POCKETWATCH_PORTAL = "天空一阵巨响，本可闪亮登场！",

	-- 老麦（暗影魔法）
	ACTIONFAIL =
	{
		CASTAOE =
		{
			NO_MAX_SANITY = "恐怕我的意志受不了那种重压……",
		},
		-- 宠物：已经召唤过伙伴
		BUILD =
		{
			HASPET = "已经有足够多的伙伴了。",
		},
	},

	-- 游泳
	ANNOUNCE_FLOAT_SWIM_TIRED = "猫累了喵~",

	-- 庇护
	ANNOUNCE_SHELTER = "大树底下好乘凉喵~",

	-- 潮湿（暂时关闭，需要时把下面的 -- 去掉即可）
	-- ANNOUNCE_DAMP = "完了完了，毛要湿了！",
	-- ANNOUNCE_WET = "完了完了，绒毛要湿了！！",
	-- ANNOUNCE_WETTER = "完了完了，皮要湿了！！！",
	-- ANNOUNCE_SOAKED = "唉，湿透了，就这样吧。",

	-- 战斗喊话
	BATTLECRY =
	{
		SPIDER_WARRIOR = "找死吗？！",
	},
}

local SPEECH =
{
	ACTIONFAIL =
	{
        GENERIC =
        {
            ITEMMIMIC = "我就知道喵。",
        },

		ACTIVATE =
		{
			LOCKED_GATE = "我似乎被锁起来了。",
            HOSTBUSY = "他此刻似乎在处理其他事务。",
            CARNIVAL_HOST_HERE = "我很确定在这个方向上看到了主持人。",
            NOCARNIVAL = "多么令人失望啊，这些鸟类似乎已经迁移到其他地方了。",
			EMPTY_CATCOONDEN = "不幸的是，小猫似乎并不在现场。",
			KITCOON_HIDEANDSEEK_NOT_ENOUGH_HIDERS = "找人的玩家超过了小猫的数量。",
			KITCOON_HIDEANDSEEK_NOT_ENOUGH_HIDING_SPOTS = "我测算过，没有足够的位置让小猫藏身。",
			KITCOON_HIDEANDSEEK_ONE_GAME_PER_DAY = "我应该花些时间来休息了喵。",
            MANNEQUIN_EQUIPSWAPFAILED = "那个不适合放在假人上喵。",
            PILLOWFIGHT_NO_HANDPILLOW = "我需要有个枕头才能参加。",
            NOTMYBERNIE = "这头可怕的活泰迪熊只忠于我们亲爱的薇洛。",
            NOTMERM = "看来那些双足动物只听令于他们的族人喵。",
            NOKELP = "only_used_by_wurt",
--fallback to speech_wilson.lua             HASMERMLEADER = "only_used_by_wurt",
            NOTAROBOT = "它是机器人的财产喵。",
--fallback to speech_wilson.lua             NOTMYBACKUP = "only_used_by_wx78",
--fallback to speech_wilson.lua             TOOMANYBACKUPBODIES = "only_used_by_wx78",
		},
        APPLYELIXIR =
        {
            TOO_SUPER = "那个过于烈性喵。",
            NO_ELIXIRABLE = "only_used_by_wendy",
        },
        APPLYMODULE =
        {
            COOLDOWN = "only_used_by_wx78",
            NOTENOUGHSLOTS = "only_used_by_wx78喵",
        },
        APPRAISE =
        {
            NOTNOW = "耐心是一种美德。",
        },
        ATTUNE =
        {
            NOHEALTH = "对于那个，我感觉很不妙。",
        },
        BATHBOMB =
        {
            GLASSED = "很不幸，泉水表面结晶了喵。",
            ALREADY_BOMBED = "没必要太过喵。",
        },
        BEDAZZLE =
        {
--fallback to speech_wilson.lua             BURNING = "only_used_by_webber",
--fallback to speech_wilson.lua             BURNT = "only_used_by_webber",
--fallback to speech_wilson.lua             FROZEN = "only_used_by_webber",
--fallback to speech_wilson.lua             ALREADY_BEDAZZLED = "only_used_by_webber",
        },
        BEGIN_QUEST =
        {
            ONEGHOST = "only_used_by_wendy",
        },
        BUILD =
        {
            MOUNTED = "我无法在上升位置碰到地面。",
            HASPET = "对我来说，一只家养动物就够了。",
			TICOON = "同时拥有两个追踪者可能会使它们感到困惑。",
            BUSY_STATION = "哦，麻烦。",
--fallback to speech_wilson.lua             TOOMANYBACKUPBODIES = "only_used_by_wx78",
--fallback to speech_wilson.lua             TOOMANYSHADOWDRONE_HARVESTER = "only_used_by_wx78",
--fallback to speech_wilson.lua             TOOMANYSHADOWDRONE_DEBUFFER = "only_used_by_wx78",
        },
        CARNIVALGAME_FEED =
        {
            TOO_LATE = "哦，亲爱的，我还不够快。",
        },
		CAST_POCKETWATCH =
		{
--fallback to speech_wilson.lua 			GENERIC = "only_used_by_wanda",
--fallback to speech_wilson.lua 			REVIVE_FAILED = "only_used_by_wanda",
--fallback to speech_wilson.lua 			WARP_NO_POINTS_LEFT = "only_used_by_wanda",
--fallback to speech_wilson.lua 			SHARD_UNAVAILABLE = "only_used_by_wanda",
--fallback to speech_wilson.lua 			NO_TELEPORT_ZONE = "only_used_by_wanda",
		},
		CAST_SPELLBOOK =
		{
--fallback to speech_wilson.lua 			NO_TOPHAT = "only_used_by_waxwell",
		},
		CASTAOE =
		{
--fallback to speech_wilson.lua 			NO_MAX_SANITY = "only_used_by_waxwell",
            NOT_ENOUGH_EMBERS = "only_used_by_willow喵",
            NO_TARGETS = "only_used_by_willow",
            CANT_SPELL_MOUNTED = "only_used_by_willow",
            SPELL_ON_COOLDOWN = "only_used_by_willow喵",
			NO_BATTERY = "only_used_by_winona",
			NO_CATAPULTS = "only_used_by_winona",
		},
        CASTSPELL =
        {
            TERRAFORM_TOO_SOON = "only_used_by_wurt",
        },
        CHANGEIN =
        {
            GENERIC = "我觉得我看上去已经够聪明了喵。",
            BURNING = "再没办法换衣服了。它已经着火了。",
            INUSE = "但愿我可以在你之后使用那个，亲爱的喵。",
            NOTENOUGHHAIR = "也许要等毛发重新长回来喵。",
            NOOCCUPANT = "在我进行别的操作之前，这个美妆台需要牢牢的栓上一头皮弗娄牛喵。",
        },
        CHARGE_FROM =
        {
            NOT_ENOUGH_CHARGE = "电荷数不足。",
            CHARGE_FULL = "电量已满。",
        },
		COMPARE_WEIGHABLE =
		{
            FISH_TOO_SMALL = "这个标本远远达不到要求。",
            OVERSIZEDVEGGIES_TOO_SMALL = "我担心这个标本根本没有足够的质量来竞争喵。",
		},
        CONSTRUCT =
        {
            INUSE = "有人已经在用它了。",
            NOTALLOWED = "那是错误的。",
            EMPTY = "首先我需要一些建造材料。",
            MISMATCH = "这些计划是错误的。",
            NOTREADY = "也许当地面更稳定时再说......",
        },
        COOK =
        {
            GENERIC = "恐怕得过会儿。要知道，不是所有老太太都喜欢烹饪的喵。",
            INUSE = "嗯，闻起来不错，亲爱的。",
            TOOFAR = "离我太远了。",
        },
        DEPLOY = {
            HERMITCRAB_RELOCATE = "寄居蟹迁移居所的方法不可谓不便捷。",
        },
        DIRECTCOURIER_MAP =
        {
--fallback to speech_wilson.lua             NOTARGET = "only_used_by_walter",
        },
		DISMANTLE =
		{
			COOKING = "恐怕要等它煮好了才行。",
			INUSE = "已经在用了。",
			NOTEMPTY = "我得先把里面的东西去掉。",
        },
        DISMANTLE_POCKETWATCH =
        {
--fallback to speech_wilson.lua             ONCOOLDOWN = "only_used_by_wanda",
        },
        DRAW =
        {
            NOIMAGE = "一个教我如何用图表示的例子会很有用。",
        },
        ENTER_GYM =
        {
--fallback to speech_wilson.lua             NOWEIGHT = "only_used_by_wolfang",
--fallback to speech_wilson.lua             UNBALANCED = "only_used_by_wolfang",
--fallback to speech_wilson.lua             ONFIRE = "only_used_by_wolfang",
--fallback to speech_wilson.lua             SMOULDER = "only_used_by_wolfang",
--fallback to speech_wilson.lua             HUNGRY = "only_used_by_wolfang",
--fallback to speech_wilson.lua             FULL = "only_used_by_wolfang",
        },
        FILL_OCEAN =
        {
            UNSUITABLE_FOR_PLANTS = "恐怕只有淡水才行。",
        },
        FISH_OCEAN =
		{
			TOODEEP = "这些鱼太远太深了。",
		},
        GIVE =
        {
            GENERIC = "我不这么认为，亲爱的。",
            DEAD = "这么做是一种浪费喵。",
            SLEEPING = "它好像睡着了。",
            BUSY = "等它忙完了，我会再试试的。",
            ABIGAILHEART = "她的灵魂已经附在世上什么东西上喵。",
            GHOSTHEART = "我不会干预那件事。",
            NOTGEM = "不要那么愚蠢，亲爱的。",
            WRONGGEM = "对于我而言，宝石的属性不对。",
			NOGENERATORSKILL = "不要那么愚蠢，亲爱的喵。",
            NOTSTAFF = "这不是我寻找的魔杖喵。",
            MUSHROOMFARM_NEEDSSHROOM = "天哪，不，它需要一个新鲜的蘑菇。",
            MUSHROOMFARM_NEEDSLOG = "它需要一个充满魔法属性的木头。",
            MUSHROOMFARM_NOMOONALLOWED = "这个物种似乎只在野外生长。",
            SLOTFULL = "让我们先吃掉餐盘上有的东西，好吗？",
            FOODFULL = "等你准备好了就随时找我吧，亲爱的。",
            NOTDISH = "那食物根本不适合喵。",
            DUPLICATE = "我们已经记下了这个配方。",
            NOTSCULPTABLE = "没有人应该用那东西来雕刻，亲爱的。",
NOTATRIUMKEY = "It's not quite the right shape.",
            CANTSHADOWREVIVE = "情况不对。",
            WRONGSHADOWFORM = "骨架解剖不准确。",
            NOMOON = "它需要月亮的作用。",
			PIGKINGGAME_MESSY = "我得先清理一下。",
			PIGKINGGAME_DANGER = "没时间享乐和游戏了！",
			PIGKINGGAME_TOOLATE = "现在没时间了。天很快就要黑了。",
			CARNIVALGAME_INVALID_ITEM = "这似乎不是正确的支付形式喵。",
			CARNIVALGAME_ALREADY_PLAYING = "恐怕我得等一等了。",
            SPIDERNOHAT = "根本没有地方装那个。",
            TERRARIUM_REFUSE = "也许我应该用别的东西再做一次尝试。",
            TERRARIUM_COOLDOWN = "恐怕不行，预定的树状物接收者似乎不见了喵。",
            NOTAMONKEY = "我相信他们是在沟通。",
            QUEENBUSY = "她此刻正忙于其他事务。",
            CARNIVALGAME_GOLFGAME_NOTREADY = "迷你高尔夫球场至少需要一个旗洞才能游玩喵。",
            KINGSTAFF_COOLDOWN = "宝石卡得很牢喵。", -- can't give it a new gem because it's on cooldown
        },
        GIVE_TACKLESKETCH =
		{
			DUPLICATE = "我们已经记下了这个菜谱。",
        },
        GIVETOPLAYER =
        {
            FULL = "它们已经载太多东西了。",
            DEAD = "这么做是一种浪费。",
            SLEEPING = "它们进入了快速眼动睡眠。不要打扰它们。",
            BUSY = "它们有空时我再试试。",
        },
        GIVEALLTOPLAYER =
        {
            FULL = "它们已经载太多东西了。",
            DEAD = "这么做是一种浪费。",
            SLEEPING = "它们进入了快速眼动睡眠。不要打扰它们。",
            BUSY = "它们有空时我再试试。",
        },
        HARVEST =
        {
            DOER_ISNT_MODULE_OWNER = "如我所想，我无法从中收集到任何信息。",
--fallback to speech_wilson.lua             DOER_DOESNT_HAVE_SKILL = "only_used_by_wx78",
        },
        HEAL =
        {
            NOT_MERM = "鱼人使用这种混合物进行治疗喵。",
        },
        HERD_FOLLOWERS =
        {
            WEBBERONLY = "恐怕这并非我的专业领域喵。",
        },
        HITCHUP =
        {
            NEEDBEEF = "我首先需要一头皮弗娄牛。",
            NEEDBEEF_CLOSER = "我的皮弗娄牛需要离桩子近一点。",
            BEEF_HITCHED = "已经做过了，亲爱的喵。",
            INMOOD = "它现在这个状态，什么也干不了。",
        },
		LOOKAT = --fail strings for close inspection
		{
			-- Winona specific
--fallback to speech_wilson.lua 			ROSEGLASSES_INVALID = "only_used_by_winona",
--fallback to speech_wilson.lua 			ROSEGLASSES_COOLDOWN = "only_used_by_winona",
--fallback to speech_wilson.lua             ROSEGLASSES_DISMISS = "only_used_by_winona",
--fallback to speech_wilson.lua             ROSEGLASSES_STUMPED = "only_used_by_winona",
			--
		},
        LOWER_SAIL_FAIL =
        {
            "There must be a trick to this.",
            "Oh, you finicky thing!",
            "Come along now, no need to be stubborn.",
        },
        MARK =
        {
            ALREADY_MARKED = "我对自己的选择十分自信。",
            NOT_PARTICIPANT = "我得先观察一下。",
        },
        MOUNT =
        {
            TARGETINCOMBAT = "靠近那场混战可不是个好主意喵。",
            INUSE = "需要耐心。我可以等会儿再骑这头皮弗娄牛喵。",
			SLEEPING = "现在醒来吧，我需要你的服务。",
        },
        OCEAN_FISHING_POND =
		{
			WRONGGEAR = "池塘垂钓这种小事用不着这个喵。",
		},
		OPEN_CRAFTING =
		{
            PROFESSIONALCHEF = "我不该乱动，太不礼貌。",
			SHADOWMAGIC = "我不会让那个出现在我的图书馆喵！",
		},
        PICK =
        {
            NOTHING_INSIDE = "正如我所猜测的那样，是空的。",
			STUCK = "它卡住了。",
        },
        PICKUP =
        {
			RESTRICTION = "这不是我擅长的领域喵。",
			INUSE = "已经在用了喵。",
--fallback to speech_wilson.lua             NOTMINE_SPIDER = "only_used_by_webber",
            NOTMINE_YOTC =
            {
                "Oh my, I seem to have gotten a bit mixed up.",
                "My glasses need a good cleaning, that's clearly not my Daucus carota rattus!",
            },
--fallback to speech_wilson.lua 			NO_HEAVY_LIFTING = "only_used_by_wanda",
            FULL_OF_CURSES = "我认为最好不要管它。",
        },
        PLANTREGISTRY_RESEARCH_FAIL =
        {
            GENERIC = "我对这个特殊的物种已经很了解了。",
            FERTILIZER = "我已经收集了尽可能多的信息喵。",
        },
        POUR_WATER =
        {
            OUT_OF_WATER = "哦，亲爱的，我必须补充我的水供应了。",
        },
        POUR_WATER_GROUNDTILE =
        {
            OUT_OF_WATER = "我得尽早补充水源喵。",
        },
        --wickerbottom specific action
        READ =
        {
            GENERIC = "还有其他事在等着。",
            NOBIRDS = "鸟不喜欢这种天气喵。",
            NOWATERNEARBY = "鱼类只能在水体附近被召唤出来。",
            TOOMANYBIRDS = "地上鸟太多了，魔法没那么有效。",
            WAYTOOMANYBIRDS = "现在天上一只鸟都没有了。",
            BIRDSBLOCKED = "力场自然对鸟类同样有效。",
            NOFIRES =       "所幸没有需要扑灭的明火。",
            NOSILVICULTURE = "没有可聚焦的树栖主体。",
            NOHORTICULTURE = "没有能种的庄稼。",
            NOTENTACLEGROUND = "触手无法突破这里的地表。",
            NOSLEEPTARGETS = "我没看到谁需要睡前故事。",
            TOOMANYBEES = "那样就太多蜜蜂了，亲爱的。",
            NOMOONINCAVES = "这个地下位置影响不到月亮喵。",
            ALREADYFULLMOON = "那样做恐怕太多余了喵。",
            -- rifts5.1
            DEADBIRDS = "噢，天啊。恐怕天空现在对鸟类来说已经不安全了喵。",
        },
		REMOTE_TELEPORT =
		{
			NOSKILL = "only_used_by_winona喵",
			NODEST = "only_used_by_winona喵",
		},
        REMOVEMODULES =
        {
            NO_MODULES = "only_used_by_wx78",
        },
        REPAIR =
        {
            WRONGPIECE = "那明显不是正确的棋子。",
        },
        REPLATE =
        {
            MISMATCH = "它不是盛放这种食物的餐具。",
            SAMEDISH = "它已经装在合适的餐具中了。",
        },
        ROW_FAIL =
        {
            BAD_TIMING0 = "我得找个完美的时机。",
            BAD_TIMING1 = "我会坚韧不拔的试下去。",
            BAD_TIMING2 = "哦，天啊，我得从头来过了喵。",
        },
		RUMMAGE =
		{
			GENERIC = "我现在脑子里还想着别的事情。",
			INUSE = "请务必按颜色和重量分类，亲爱的喵。",
            NOTMASTERCHEF = "我不该乱动，太不礼貌喵。",
            NOTAMERM = "我不相信本地人会喜欢这种行为喵。",
            NOTSOULJARHANDLER = "最好别插手。",
            RESTRICTED = "恐怕这不是给我的喵。",
            NOTAROBOT = "它是机器人的财产。",
--fallback to speech_wilson.lua             NOTMYBACKUP = "only_used_by_wx78",
--fallback to speech_wilson.lua             TOOMANYBACKUPBODIES = "only_used_by_wx78",
		},
        SADDLE =
        {
            TARGETINCOMBAT = "靠近那场混战可不是个好主意。",
        },
		SHAVE =
		{
			AWAKEBEEFALO = "我觉得他可能会抗议。",
			GENERIC = "我真的不想这么做喵。",
			NOBITS = "已经剃干净了，亲爱的喵。",
--fallback to speech_wilson.lua             REFUSE = "only_used_by_woodie",
            SOMEONEELSESBEEFALO = "我去薅别人皮弗娄牛的毛不是很合适喵。",
		},
        SING_FAIL =
        {
--fallback to speech_wilson.lua             SAMESONG = "only_used_by_wathgrithr",
        },
        SLAUGHTER =
        {
            TOOFAR = "哎呀，它逃走了。",
        },
        START_CARRAT_RACE =
        {
            NO_RACERS = "没有对象，我收集不到任何数据。",
        },
		STORE =
		{
			GENERIC = "恐怕它已经装满了喵。",
			NOTALLOWED = "胡闹喵。",
			INUSE = "我真希望你保持有条理，亲爱的。",
            NOTMASTERCHEF = "我不该乱动，太不礼貌。",
            NOTSOULJARHANDLER = "最好别插手。",
            RESTRICTED = "恐怕这不是给我的。",
            NOTAROBOT = "它是机器人的财产。",
--fallback to speech_wilson.lua             NOTMYBACKUP = "only_used_by_wx78",
--fallback to speech_wilson.lua             TOOMANYBACKUPBODIES = "only_used_by_wx78",
		},
		STARTMAPDELIVER =
		{
--fallback to speech_wilson.lua 			EMPTY = "only_used_by_wx78",
--fallback to speech_wilson.lua 			INUSE = "only_used_by_wx78",
--fallback to speech_wilson.lua 			NOSKILL_DRONE = "only_used_by_wx78", 
		},
        SWAPBODIES_MAP =
        {
--fallback to speech_wilson.lua             NOTARGET = "only_used_by_wx78",
        },
        TEACH =
        {
            --Recipes/Teacher
            KNOWN = "拜托，这些知识简直太小儿科了。",
            CANTLEARN = "一条我领悟不了的知识...有趣！",

            --MapRecorder/MapExplorer
            WRONGWORLD = "这张地图是用在其他地点的。",

			--MapSpotRevealer/messagebottle
			MESSAGEBOTTLEMANAGER_NOT_FOUND = "太黑了，看不清写了些什么。",--Likely trying to read messagebottle treasure map in caves

            STASH_MAP_NOT_FOUND = "猿猴们忽略了应该在这张地图上做标记。",-- Likely trying to read stash map  in world without stash                  
        },
		TELLSTORY =
		{
			GENERIC = "only_used_by_walter",
--fallback to speech_wilson.lua 			NOT_NIGHT = "only_used_by_walter",
--fallback to speech_wilson.lua 			NO_FIRE = "only_used_by_walter",
		},
		UNLOCK =
        {
WRONGKEY = "I can't do that喵.",
        },
        UPGRADE =
        {
--fallback to speech_wilson.lua             BEDAZZLED = "only_used_by_webber",
        },
        USEEQUIPPEDITEM =
        {
--fallback to speech_wilson.lua             BADPOSITION = "only_used_by_wx78",
        },
        USEITEMON =
        {
            GENERIC = "I can't use this on that!",

            --construction is PREFABNAME_REASON
            BEEF_BELL_INVALID_TARGET = "那样不行。",
            BEEF_BELL_ALREADY_USED = "它已经和别人建立了联系，亲爱的喵。",
            BEEF_BELL_HAS_BEEF_ALREADY = "我不需要更多的皮弗娄牛了。",

			NOT_MINE = "那个不属于我。",

			CANNOT_FIX_DRONE = "根本无法修复喵。",

--fallback to speech_wilson.lua             GESTALT_TOO_POWERFUL = "only_used_by_wx78",
        },
		USEKLAUSSACKKEY =
        {
            WRONGKEY = "那可能是错误的工具喵。",
            KLAUS = "首先必须打败那头野兽喵。",
			QUAGMIRE_WRONGKEY = "我必须找到正确的钥匙。",
        },
        WRAPBUNDLE =
        {
            EMPTY = "我必须知道要打包什么，亲爱的喵。",
        },
        WRITE =
        {
            GENERIC = "我宁愿在自己的书里写字。",
            INUSE = "还没用完呢亲爱的。",
        },
        YOTB_STARTCONTEST =
        {
            DOESNTWORK = "比赛暂时还得等等。",
            ALREADYACTIVE = "我猜想其他地方一定还有个比赛。",
            NORESPONSE = "他多半是去散步了。",
            RIGHTTHERE = "他当下正忙喵。",
        },
        YOTB_UNLOCKSKIN =
        {
            ALREADYKNOWN = "我已经熟悉了这个样式了。",
        },
		CARVEPUMPKIN =
		{
			INUSE = "显然已经有人在雕刻了。",
			BURNING = "真热喵！",
		},
		DECORATESNOWMAN =
		{
			INUSE = "显然现在有人正在装饰它。",
			HASHAT = "我不能把它放在帽子上。",
			STACKEDTOOHIGH = "太高了，不能再加了。",
			MELTING = "装饰一个快融化的雪人就是做无用功。",
		},
        MUTATE = 
        {
            NOGHOST = "only_used_by_wendy",
            NONEWMOON = "only_used_by_wendy",
            NOFULLMOON = "only_used_by_wendy",
            NOTNIGHT = "only_used_by_wendy",
            CAVE = "only_used_by_wendy",
        },
		MODSLINGSHOT =
		{
--fallback to speech_wilson.lua 			NOSLINGSHOT = "only_used_by_walter",
		},
		POUNCECAPTURE =
		{
			MISSED = "天哪，我失手了！",
		},
        DIVEGRAB =
        {
            MISSED = "天哪，我失手了！",
        },

		-- Winter 2025
		SOAKIN =
		{
			NOSPACE = "显然已经有人坐在那儿了。",--there's someone in that space. there's no room there.
		},
    },

	ANNOUNCE_CANNOT_BUILD =
	{
		NO_INGREDIENTS = "我应该努力收集所需的材料。",
		NO_TECH = "不如抓住这个机会做一些研究。",
		NO_STATION = "恐怕这需要一个特制的工作区。",
	},

	ACTIONFAIL_GENERIC = "我似乎做不到喵。",
	ANNOUNCE_BOAT_LEAK = "船已经陷入十分危险的状态。",
	ANNOUNCE_BOAT_SINK = "不妙，我们在下沉！",
    ANNOUNCE_PREFALLINVOID = "它撑不住了！",
	ANNOUNCE_DIG_DISEASE_WARNING = "刚好及时抓住它。根部几乎都烂掉了喵。", --removed
	ANNOUNCE_PICK_DISEASE_WARNING = "这棵植物正在展示相关的木牌。", --removed
	ANNOUNCE_ADVENTUREFAIL = "我们必须从失败中总结教训。",
    ANNOUNCE_MOUNT_LOWHEALTH = "我的坐骑需要各种医疗照顾喵。",

    --waxwell and wickerbottom specific strings
--fallback to speech_wilson.lua     ANNOUNCE_TOOMANYBIRDS = "only_used_by_waxwell_and_wicker",
--fallback to speech_wilson.lua     ANNOUNCE_WAYTOOMANYBIRDS = "only_used_by_waxwell_and_wicker",
--fallback to speech_wilson.lua     ANNOUNCE_NOWATERNEARBY = "only_used_by_waxwell_and_wicker",

	--waxwell specific
--fallback to speech_wilson.lua 	ANNOUNCE_SHADOWLEVEL_ITEM = "only_used_by_waxwell",
--fallback to speech_wilson.lua 	ANNOUNCE_EQUIP_SHADOWLEVEL_T1 = "only_used_by_waxwell",
--fallback to speech_wilson.lua 	ANNOUNCE_EQUIP_SHADOWLEVEL_T2 = "only_used_by_waxwell",
--fallback to speech_wilson.lua 	ANNOUNCE_EQUIP_SHADOWLEVEL_T3 = "only_used_by_waxwell",
--fallback to speech_wilson.lua 	ANNOUNCE_EQUIP_SHADOWLEVEL_T4 = "only_used_by_waxwell",

    --wolfgang specific
--fallback to speech_wilson.lua     ANNOUNCE_NORMALTOMIGHTY = "only_used_by_wolfang",
--fallback to speech_wilson.lua     ANNOUNCE_NORMALTOWIMPY = "only_used_by_wolfang",
--fallback to speech_wilson.lua     ANNOUNCE_WIMPYTONORMAL = "only_used_by_wolfang",
--fallback to speech_wilson.lua     ANNOUNCE_MIGHTYTONORMAL = "only_used_by_wolfang",
    ANNOUNCE_EXITGYM = {
--fallback to speech_wilson.lua         MIGHTY = "only_used_by_wolfang",
--fallback to speech_wilson.lua         NORMAL = "only_used_by_wolfang",
--fallback to speech_wilson.lua         WIMPY = "only_used_by_wolfang",
    },

	ANNOUNCE_BEES = "去蜇那些讨厌的家伙！",
	ANNOUNCE_BOOMERANG = "我错估了它飞回来的时间。",
	ANNOUNCE_CHARLIE = "有声音！怎么会有花香？",
	ANNOUNCE_CHARLIE_ATTACK = "哎哟！谁这么大胆？！",
--fallback to speech_wilson.lua 	ANNOUNCE_CHARLIE_MISSED = "only_used_by_winona", --winona specific
	ANNOUNCE_COLD = "周围温度好低喵。",
	ANNOUNCE_HOT = "周围温度好高。",
	ANNOUNCE_CRAFTING_FAIL = "现在我没法制作那个喵。",
	ANNOUNCE_DEERCLOPS = "听起来似乎来了个巨人！",
	ANNOUNCE_CAVEIN = "上面的岩石很快就会让路。",
	ANNOUNCE_ANTLION_SINKHOLE =
	{
		"The ground will soon give way.",
		"Not the work of tectonic plates.",
		"A six on the Richter scale.",
	},
	ANNOUNCE_ANTLION_TRIBUTE =
	{
        "For you, great Panthera auropunctata.",
        "It ought to be more docile now.",
        "The great Panthera auropunctata is tamed.",
	},
	ANNOUNCE_SACREDCHEST_YES = "起作用了。",
	ANNOUNCE_SACREDCHEST_NO = "可惜啊，我本来很有把握的喵。",
    ANNOUNCE_DUSK = "很快就要天黑了。",

    --wx-78 specific
--fallback to speech_wilson.lua     ANNOUNCE_CHARGE = "only_used_by_wx78",
--fallback to speech_wilson.lua 	ANNOUNCE_DISCHARGE = "only_used_by_wx78",

    -- Winona specific
--fallback to speech_wilson.lua     ANNOUNCE_ROSEGLASSES = 
--fallback to speech_wilson.lua     {
--fallback to speech_wilson.lua         "only_used_by_winona",
--fallback to speech_wilson.lua         "only_used_by_winona",
--fallback to speech_wilson.lua         "only_used_by_winona",
--fallback to speech_wilson.lua     },
    ANNOUNCE_CHARLIESAVE = 
    {
        "only_used_by_winona",
    },
	ANNOUNCE_ENGINEERING_CAN_UPGRADE = "only_used_by_winona",
	ANNOUNCE_ENGINEERING_CAN_DOWNGRADE = "only_used_by_winona",
	ANNOUNCE_ENGINEERING_CAN_SIDEGRADE = "only_used_by_winona",

	ANNOUNCE_EAT =
	{
		GENERIC = "好吃！",
		PAINFUL = "我真不应该吃那个的。",
		SPOILED = "它已经部分腐烂了。",
		STALE = "那已经不是最新鲜的状态了。",
		INVALID = "这东西不能吃。",
        YUCKY = "吃下这个是不明智的喵。",

        --Warly specific ANNOUNCE_EAT strings
--fallback to speech_wilson.lua 		COOKED = "only_used_by_warly",
--fallback to speech_wilson.lua 		DRIED = "only_used_by_warly",
--fallback to speech_wilson.lua         PREPARED = "only_used_by_warly",
--fallback to speech_wilson.lua         RAW = "only_used_by_warly",
--fallback to speech_wilson.lua 		SAME_OLD_1 = "only_used_by_warly",
--fallback to speech_wilson.lua 		SAME_OLD_2 = "only_used_by_warly",
--fallback to speech_wilson.lua 		SAME_OLD_3 = "only_used_by_warly",
--fallback to speech_wilson.lua 		SAME_OLD_4 = "only_used_by_warly",
--fallback to speech_wilson.lua         SAME_OLD_5 = "only_used_by_warly",
--fallback to speech_wilson.lua 		TASTY = "only_used_by_warly",
    },

	ANNOUNCE_FOODMEMORY = "only_used_by_warly",

    ANNOUNCE_ENCUMBERED =
    {
        "It's all in the legs.",
        "Goodness...",
        "Dear me...",
        "I've got it, dear.",
        "I'm more spry than I look!",
        "You just need to know how to lift!",
        "No sweat off my back! Ho ho!",
        "How invigorating!",
        "This gets the blood pumping!",
    },
    ANNOUNCE_ATRIUM_DESTABILIZING =
    {
		"I do believe it's time to go.",
		"It's dangerous to be here.",
		"Goodness gracious!",
	},
    ANNOUNCE_RUINS_RESET = "小心，怪兽回来了。",
    ANNOUNCE_SNARED = "你不能长时间抱着我，亲爱的喵。",
    ANNOUNCE_SNARED_IVY = "天啊，我的花园似乎有一个相当严重的杂草问题。",
    ANNOUNCE_REPELLED = "这里有魔法在起作用。",
	ANNOUNCE_ENTER_DARK = "这儿漆黑一片。",
	ANNOUNCE_ENTER_LIGHT = "这亮度足以看见东西了喵。",
	ANNOUNCE_FREEDOM = "自由！我要找一本好书，然后在书里尽情地徜徉。",
	ANNOUNCE_HIGHRESEARCH = "天啊，这真是太有意思了！",
	ANNOUNCE_HOUNDS = "有东西在接近。",
	ANNOUNCE_WORMS = "某种阴险的生物要出现了。",
    ANNOUNCE_WORMS_BOSS = "某种可怕的东西正在逼近。",
    ANNOUNCE_ACIDBATS = "它们发出的噪音真可怕。",
	ANNOUNCE_HUNGRY = "图书管理员需要食物喵。",
	ANNOUNCE_HUNT_BEAST_NEARBY = "出现这个踪迹表明动物最近出来活动过喵。",
	ANNOUNCE_HUNT_LOST_TRAIL = "踪迹已经变得难以识别喵。",
	ANNOUNCE_HUNT_LOST_TRAIL_SPRING = "踪迹已经被降水冲淡了。",
    ANNOUNCE_HUNT_START_FORK = "我怀疑这条踪迹尽头的是令人生畏的存在。",
    ANNOUNCE_HUNT_SUCCESSFUL_FORK = "看来我成功跟踪了这生物，它并没有产生警觉。",
    ANNOUNCE_HUNT_WRONG_FORK = "哦，亲爱的……我有一种奇特的感觉，我被监视了喵。",
    ANNOUNCE_HUNT_AVOID_FORK = "这条踪迹可能会带来不那么危险的结果喵。",
	ANNOUNCE_INV_FULL = "我拿不了更多的东西了。",
	ANNOUNCE_KNOCKEDOUT = "这下好了，我想这也是获得休息的一种方法吧喵。",
	ANNOUNCE_LOWRESEARCH = "虽然不是什么很好的资源，但好歹是些有用的小东西。",
	ANNOUNCE_MOSQUITOS = "该死的吸血鬼！",
    ANNOUNCE_NOWARDROBEONFIRE = "你可以清楚看到，它着火了。",
    ANNOUNCE_NODANGERGIFT = "现在不是顾着礼物的时候，生存最重要。",
    ANNOUNCE_NOMOUNTEDGIFT = "我认为我应该第一个下马。",
	ANNOUNCE_NODANGERSLEEP = "即使周围没有危险，我也几乎睡不着觉喵！",
	ANNOUNCE_NODAYSLEEP = "即使是晚上我都很难入睡，更不用说在白天了喵。",
	ANNOUNCE_NODAYSLEEP_CAVE = "在这些洞穴里面睡觉可真不是一件容易的事。",
	ANNOUNCE_NOHUNGERSLEEP = "即使一点都不饿，我也几乎睡不着觉！",
	ANNOUNCE_NOSLEEPONFIRE = "即使我能够睡着，这么高的温度也是极不安全的。",
    ANNOUNCE_NOSLEEPHASPERMANENTLIGHT = "不需要关灯，亲爱的，反正我也睡不着的。",
	ANNOUNCE_NODANGERSIESTA = "身处危险的时候，我不敢躺下来喵！",
	ANNOUNCE_NONIGHTSIESTA = "无论躺在哪儿，我就是睡不着喵。",
	ANNOUNCE_NONIGHTSIESTA_CAVE = "在这些洞穴中，我完全没法放松。",
	ANNOUNCE_NOHUNGERSIESTA = "好饿啊，这下更放松不了了！",
	ANNOUNCE_NO_TRAP = "小事一桩喵！",
	ANNOUNCE_PECKED = "立刻给我安静下来！",
	ANNOUNCE_QUAKE = "是地震！震级至少达到了里氏七级。",
	ANNOUNCE_RESEARCH = "任何信息都不该被浪费，无论是多么微不足道。",
	ANNOUNCE_SHELTER = "啊，终于可以喘息一下了。",
	ANNOUNCE_THORNS = "真是见鬼，居然有刺！",
	ANNOUNCE_BURNT = "至少是一级烧伤！",
	ANNOUNCE_TORCH_OUT = "我需要另一根火炬。",
	ANNOUNCE_THURIBLE_OUT = "就这样。",
	ANNOUNCE_FAN_OUT = "这个脆弱的装置烂掉了喵。",
    ANNOUNCE_COMPASS_OUT = "我的指南针消磁了。",
	ANNOUNCE_TRAP_WENT_OFF = "哎呀！",
	ANNOUNCE_UNIMPLEMENTED = "啧啧，我觉得它应该还没有完全弄好。",
	ANNOUNCE_WORMHOLE = "一堂内容详实的生物课！",
--fallback to speech_wilson.lua     ANNOUNCE_WORMHOLE_SAMESPOT = "only_used_by_winona",
	ANNOUNCE_TOWNPORTALTELEPORT = "天哪！这是旅行的一种方式喵。",
	ANNOUNCE_CANFIX = "\n我相信我能修好这个。",
	ANNOUNCE_ACCOMPLISHMENT = "还没完成呢喵！",
	ANNOUNCE_ACCOMPLISHMENT_DONE = "完成了！",
	ANNOUNCE_INSUFFICIENTFERTILIZER = "要我说，只需要再多施一点肥就可以了。",
	ANNOUNCE_TOOL_SLIP = "我的工具喵！",
	ANNOUNCE_LIGHTNING_DAMAGE_AVOIDED = "谢天谢地，这件衣服不导电！",
	ANNOUNCE_TOADESCAPING = "它将很快需要再次钻洞来让皮肤补充水分。",
	ANNOUNCE_TOADESCAPED = "它已经钻走了。",


	ANNOUNCE_DAMP = "开始有积水了。",
	ANNOUNCE_WET = "我很好奇我身体的极限点是什么喵...",
	ANNOUNCE_WETTER = "好湿啊！",
	ANNOUNCE_SOAKED = "已经完全湿透了。",

	ANNOUNCE_WASHED_ASHORE = "希望不要弄坏了我的书喵。",

    ANNOUNCE_DESPAWN = "我从没读过任何描述它的内容！",
	ANNOUNCE_BECOMEGHOST = "呜呜呜呜呜！！",
	ANNOUNCE_GHOSTDRAIN = "我的人性…在流失。",
	ANNOUNCE_PETRIFED_TREES = "已经催化了化学反应…",
	ANNOUNCE_KLAUS_ENRAGE = "没必要把别人的生命扔掉。后退！",
	ANNOUNCE_KLAUS_UNCHAINED = "不管是什么魔法抑制了它，都没有用了。",
	ANNOUNCE_KLAUS_CALLFORHELP = "小心！它召唤了小坎普斯喵。",

	ANNOUNCE_MOONALTAR_MINE =
	{
		GLASS_MED = "我来了，亲爱的喵。",
		GLASS_LOW = "接近了喵。",
		GLASS_REVEAL = "看！",
		IDOL_MED = "我来了，亲爱的喵。",
		IDOL_LOW = "接近了。",
		IDOL_REVEAL = "看！",
		SEED_MED = "我来了，亲爱的。",
		SEED_LOW = "接近了。",
		SEED_REVEAL = "看！",
	},

    --hallowed nights
    ANNOUNCE_SPOOKED = "仁慈的上帝喵！",
	ANNOUNCE_BRAVERY_POTION = "我的勇气恢复了！",
	ANNOUNCE_MOONPOTION_FAILED = "噢，天啊，偏离了我的计划。",

	--winter's feast
	ANNOUNCE_EATING_NOT_FEASTING = "我一个人吃不了这么多！",
	ANNOUNCE_WINTERS_FEAST_BUFF = "有意思! 我似乎满是 \"欢愉\"。",
	ANNOUNCE_IS_FEASTING = "我希望每个人在饭前记得洗手。",
	ANNOUNCE_WINTERS_FEAST_BUFF_OVER = "刚刚很有启迪。",

    --lavaarena event
    ANNOUNCE_REVIVING_CORPSE = "稍等片刻，亲爱的喵。",
    ANNOUNCE_REVIVED_OTHER_CORPSE = "现在你可以走了。",
    ANNOUNCE_REVIVED_FROM_CORPSE = "好了！我又站起来了喵！",

    ANNOUNCE_FLARE_SEEN = "有人发了个信号喵。",
    ANNOUNCE_MEGA_FLARE_SEEN = "哦，天哪。有人想挑起冲突。",
    ANNOUNCE_OCEAN_SILHOUETTE_INCOMING = "巨型动物已经盯上了我们喵。",

    --willow specific
--fallback to speech_wilson.lua 	ANNOUNCE_LIGHTFIRE =
--fallback to speech_wilson.lua 	{
--fallback to speech_wilson.lua 		"only_used_by_willow",
--fallback to speech_wilson.lua     },

    --winona specific
--fallback to speech_wilson.lua     ANNOUNCE_HUNGRY_SLOWBUILD =
--fallback to speech_wilson.lua     {
--fallback to speech_wilson.lua 	    "only_used_by_winona",
--fallback to speech_wilson.lua     },
--fallback to speech_wilson.lua     ANNOUNCE_HUNGRY_FASTBUILD =
--fallback to speech_wilson.lua     {
--fallback to speech_wilson.lua 	    "only_used_by_winona",
--fallback to speech_wilson.lua     },

    --wormwood specific
--fallback to speech_wilson.lua     ANNOUNCE_KILLEDPLANT =
--fallback to speech_wilson.lua     {
--fallback to speech_wilson.lua         "only_used_by_wormwood",
--fallback to speech_wilson.lua     },
--fallback to speech_wilson.lua     ANNOUNCE_GROWPLANT =
--fallback to speech_wilson.lua     {
--fallback to speech_wilson.lua         "only_used_by_wormwood",
--fallback to speech_wilson.lua     },
--fallback to speech_wilson.lua     ANNOUNCE_BLOOMING =
--fallback to speech_wilson.lua     {
--fallback to speech_wilson.lua         "only_used_by_wormwood",
--fallback to speech_wilson.lua     },

    --wortox specfic
--fallback to speech_wilson.lua     ANNOUNCE_SOUL_EMPTY =
--fallback to speech_wilson.lua     {
--fallback to speech_wilson.lua         "only_used_by_wortox",
--fallback to speech_wilson.lua     },
--fallback to speech_wilson.lua     ANNOUNCE_SOUL_EMPTY_NICE =
--fallback to speech_wilson.lua     {
--fallback to speech_wilson.lua         "only_used_by_wortox",
--fallback to speech_wilson.lua     },
--fallback to speech_wilson.lua     ANNOUNCE_SOUL_EMPTY_NAUGHTY =
--fallback to speech_wilson.lua     {
--fallback to speech_wilson.lua         "only_used_by_wortox",
--fallback to speech_wilson.lua     },
--fallback to speech_wilson.lua     ANNOUNCE_SOUL_FEW =
--fallback to speech_wilson.lua     {
--fallback to speech_wilson.lua         "only_used_by_wortox",
--fallback to speech_wilson.lua     },
--fallback to speech_wilson.lua     ANNOUNCE_SOUL_FEW_NICE =
--fallback to speech_wilson.lua     {
--fallback to speech_wilson.lua         "only_used_by_wortox",
--fallback to speech_wilson.lua     },
--fallback to speech_wilson.lua     ANNOUNCE_SOUL_FEW_NAUGHTY =
--fallback to speech_wilson.lua     {
--fallback to speech_wilson.lua         "only_used_by_wortox",
--fallback to speech_wilson.lua     },
--fallback to speech_wilson.lua     ANNOUNCE_SOUL_MANY =
--fallback to speech_wilson.lua     {
--fallback to speech_wilson.lua         "only_used_by_wortox",
--fallback to speech_wilson.lua     },
--fallback to speech_wilson.lua     ANNOUNCE_SOUL_MANY_NICE =
--fallback to speech_wilson.lua     {
--fallback to speech_wilson.lua         "only_used_by_wortox",
--fallback to speech_wilson.lua     },
--fallback to speech_wilson.lua     ANNOUNCE_SOUL_MANY_NAUGHTY =
--fallback to speech_wilson.lua     {
--fallback to speech_wilson.lua         "only_used_by_wortox",
--fallback to speech_wilson.lua     },
--fallback to speech_wilson.lua     ANNOUNCE_SOUL_OVERLOAD =
--fallback to speech_wilson.lua     {
--fallback to speech_wilson.lua         "only_used_by_wortox",
--fallback to speech_wilson.lua     },
--fallback to speech_wilson.lua     ANNOUNCE_SOUL_OVERLOAD_NICE =
--fallback to speech_wilson.lua     {
--fallback to speech_wilson.lua         "only_used_by_wortox",
--fallback to speech_wilson.lua     },
--fallback to speech_wilson.lua     ANNOUNCE_SOUL_OVERLOAD_NAUGHTY =
--fallback to speech_wilson.lua     {
--fallback to speech_wilson.lua         "only_used_by_wortox",
--fallback to speech_wilson.lua     },
--fallback to speech_wilson.lua     ANNOUNCE_SOUL_OVERLOAD_WARNING =
--fallback to speech_wilson.lua     {
--fallback to speech_wilson.lua         "only_used_by_wortox",
--fallback to speech_wilson.lua     },
--fallback to speech_wilson.lua     ANNOUNCE_SOUL_OVERLOAD_AVOIDED =
--fallback to speech_wilson.lua     {
--fallback to speech_wilson.lua         "only_used_by_wortox",
--fallback to speech_wilson.lua     },
--fallback to speech_wilson.lua     ANNOUNCE_PANFLUTE_BUFF_ACTIVE =
--fallback to speech_wilson.lua     {
--fallback to speech_wilson.lua         "only_used_by_wortox",
--fallback to speech_wilson.lua     },
--fallback to speech_wilson.lua     ANNOUNCE_PANFLUTE_BUFF_USED =
--fallback to speech_wilson.lua     {
--fallback to speech_wilson.lua         "only_used_by_wortox",
--fallback to speech_wilson.lua     },

    --walter specfic
--fallback to speech_wilson.lua 	ANNOUNCE_AMMO_SLOT_OVERSTACKED = "only_used_by_walter",
--fallback to speech_wilson.lua 	ANNOUNCE_SLINGHSOT_OUT_OF_AMMO =
--fallback to speech_wilson.lua 	{
--fallback to speech_wilson.lua 		"only_used_by_walter",
--fallback to speech_wilson.lua 		"only_used_by_walter",
--fallback to speech_wilson.lua 	},
--fallback to speech_wilson.lua 	ANNOUNCE_SLINGHSOT_NO_AMMO_SKILL = "only_used_by_walter",
--fallback to speech_wilson.lua 	ANNOUNCE_SLINGHSOT_NO_PARTS_SKILL = "only_used_by_walter",
--fallback to speech_wilson.lua 	ANNOUNCE_STORYTELLING_ABORT_FIREWENTOUT =
--fallback to speech_wilson.lua 	{
--fallback to speech_wilson.lua         "only_used_by_walter",
--fallback to speech_wilson.lua 	},
--fallback to speech_wilson.lua 	ANNOUNCE_STORYTELLING_ABORT_NOT_NIGHT =
--fallback to speech_wilson.lua 	{
--fallback to speech_wilson.lua         "only_used_by_walter",
--fallback to speech_wilson.lua 	},
--fallback to speech_wilson.lua 	ANNOUNCE_WOBY_RETURN =
--fallback to speech_wilson.lua 	{
--fallback to speech_wilson.lua 		"only_used_by_walter",
--fallback to speech_wilson.lua 	},
--fallback to speech_wilson.lua 	ANNOUNCE_WOBY_SIT =
--fallback to speech_wilson.lua 	{
--fallback to speech_wilson.lua 		"only_used_by_walter",
--fallback to speech_wilson.lua 	},
--fallback to speech_wilson.lua 	ANNOUNCE_WOBY_FOLLOW =
--fallback to speech_wilson.lua 	{
--fallback to speech_wilson.lua 		"only_used_by_walter",
--fallback to speech_wilson.lua 	},
--fallback to speech_wilson.lua 	ANNOUNCE_WOBY_PRAISE =
--fallback to speech_wilson.lua 	{
--fallback to speech_wilson.lua 		"only_used_by_walter",
--fallback to speech_wilson.lua 	},
--fallback to speech_wilson.lua 	ANNOUNCE_WOBY_FORAGE =
--fallback to speech_wilson.lua 	{
--fallback to speech_wilson.lua 		"only_used_by_walter",
--fallback to speech_wilson.lua 	},
--fallback to speech_wilson.lua 	ANNOUNCE_WOBY_WORK =
--fallback to speech_wilson.lua 	{
--fallback to speech_wilson.lua 		"only_used_by_walter",
--fallback to speech_wilson.lua 	},
--fallback to speech_wilson.lua 	ANNOUNCE_WOBY_COURIER =
--fallback to speech_wilson.lua 	{
--fallback to speech_wilson.lua 		"only_used_by_walter",
--fallback to speech_wilson.lua 	},
--fallback to speech_wilson.lua 	ANNOUNCE_WOBY_REMEMBERCHEST_FAIL =
--fallback to speech_wilson.lua 	{
--fallback to speech_wilson.lua 		"only_used_by_walter",
--fallback to speech_wilson.lua 	},

    -- wx specific
    ANNOUNCE_WX_SCANNER_NEW_FOUND = "only_used_by_wx78",
--fallback to speech_wilson.lua     ANNOUNCE_WX_SCANNER_FOUND_NO_DATA = "only_used_by_wx78",

    --quagmire event
    QUAGMIRE_ANNOUNCE_NOTRECIPE = "那不是能用的食谱。",
    QUAGMIRE_ANNOUNCE_MEALBURNT = "火上烧得太久了。",
    QUAGMIRE_ANNOUNCE_LOSE = "我们失败了喵。",
    QUAGMIRE_ANNOUNCE_WIN = "我们最好要继续前进。迈步！",

    ANNOUNCE_ROYALTY =
    {
        "Your Highness.",
        "Your Grace.",
        "You wear her crown well.",
    },
    ANNOUNCE_ROYALTY_JOKER =
    {
        "Your \"Highness\".",
        "Your \"Grace\".",
        "You wear that \"crown\" well.",
    },

    ANNOUNCE_ATTACH_BUFF_ELECTRICATTACK    = "我似乎导电了喵！",
    ANNOUNCE_ATTACH_BUFF_ATTACK            = "啊，我觉得充满了活力！",
    ANNOUNCE_ATTACH_BUFF_PLAYERABSORPTION  = "我敢说我比外表看起来强壮！",
    ANNOUNCE_ATTACH_BUFF_WORKEFFECTIVENESS = "我马上就能做好所有事喵！",
    ANNOUNCE_ATTACH_BUFF_MOISTUREIMMUNITY  = "干的如此舒适！",
    ANNOUNCE_ATTACH_BUFF_SLEEPRESISTANCE   = "我对失眠并不陌生。",

    ANNOUNCE_DETACH_BUFF_ELECTRICATTACK    = "又回到了自然状态。",
    ANNOUNCE_DETACH_BUFF_ATTACK            = "哎呀，我这是怎么了？",
    ANNOUNCE_DETACH_BUFF_PLAYERABSORPTION  = "我的防御力似乎降低了。",
    ANNOUNCE_DETACH_BUFF_WORKEFFECTIVENESS = "我只能不知疲倦的工作一小段时间。",
    ANNOUNCE_DETACH_BUFF_MOISTUREIMMUNITY  = "我刚刚被雨滴打湿了吗？",
    ANNOUNCE_DETACH_BUFF_SLEEPRESISTANCE   = "真奇怪，我确实觉得有点累喵……",

	ANNOUNCE_OCEANFISHING_LINESNAP = "噢，天啊，一定是刚才太用力拉线喵。",
	ANNOUNCE_OCEANFISHING_LINETOOLOOSE = "鱼线必须绷紧！",
	ANNOUNCE_OCEANFISHING_GOTAWAY = "看来晚餐吃不到鱼了。",
	ANNOUNCE_OCEANFISHING_BADCAST = "咱们再试试，如何？",
	ANNOUNCE_OCEANFISHING_IDLE_QUOTE =
	{
		"Patience is a virtue.",
		"I do not appreciate the tardiness of these fish.",
		"Perhaps if I tried a different lure...",
		"I wonder if I could get some reading done while I wait.",
	},

	ANNOUNCE_WEIGHT = "重量：{weight}",
	ANNOUNCE_WEIGHT_HEAVY  = "重量: {weight}\n这个标本的大小远远超过了平均值喵。",

	ANNOUNCE_WINCH_CLAW_MISS = "我需要提高自己的精度喵。",
	ANNOUNCE_WINCH_CLAW_NO_ITEM = "哦亲爱的……也许我该擦擦眼镜了。",

    --Wurt announce strings
--fallback to speech_wilson.lua     ANNOUNCE_KINGCREATED = "only_used_by_wurt",
--fallback to speech_wilson.lua     ANNOUNCE_KINGDESTROYED = "only_used_by_wurt",
--fallback to speech_wilson.lua     ANNOUNCE_CANTBUILDHERE_THRONE = "only_used_by_wurt",
--fallback to speech_wilson.lua     ANNOUNCE_CANTBUILDHERE_HOUSE = "only_used_by_wurt",
--fallback to speech_wilson.lua     ANNOUNCE_CANTBUILDHERE_WATCHTOWER = "only_used_by_wurt",
    ANNOUNCE_READ_BOOK =
    {
--fallback to speech_wilson.lua         BOOK_SLEEP = "only_used_by_wurt",
--fallback to speech_wilson.lua         BOOK_BIRDS = "only_used_by_wurt",
--fallback to speech_wilson.lua         BOOK_TENTACLES =  "only_used_by_wurt",
--fallback to speech_wilson.lua         BOOK_BRIMSTONE = "only_used_by_wurt",
--fallback to speech_wilson.lua         BOOK_GARDENING = "only_used_by_wurt",
--fallback to speech_wilson.lua 		BOOK_SILVICULTURE = "only_used_by_wurt",
--fallback to speech_wilson.lua 		BOOK_HORTICULTURE = "only_used_by_wurt",

--fallback to speech_wilson.lua         BOOK_FISH = "only_used_by_wurt",
--fallback to speech_wilson.lua         BOOK_FIRE = "only_used_by_wurt",
--fallback to speech_wilson.lua         BOOK_WEB = "only_used_by_wurt",
--fallback to speech_wilson.lua         BOOK_TEMPERATURE = "only_used_by_wurt",
--fallback to speech_wilson.lua         BOOK_LIGHT = "only_used_by_wurt",
--fallback to speech_wilson.lua         BOOK_RAIN = "only_used_by_wurt",
--fallback to speech_wilson.lua         BOOK_MOON = "only_used_by_wurt",
--fallback to speech_wilson.lua         BOOK_BEES = "only_used_by_wurt",

--fallback to speech_wilson.lua         BOOK_HORTICULTURE_UPGRADED = "only_used_by_wurt",
--fallback to speech_wilson.lua         BOOK_RESEARCH_STATION = "only_used_by_wurt",
--fallback to speech_wilson.lua         BOOK_LIGHT_UPGRADED = "only_used_by_wurt",
    },

    ANNOUNCE_WEAK_RAT = "恐怕它的状态不适合赛跑。",

    ANNOUNCE_CARRAT_START_RACE = "比赛开始喵！",

    ANNOUNCE_CARRAT_ERROR_WRONG_WAY = {
        "Wrong way, dear.",
        "Oh my, I'll have to make a note of this.",
    },
    ANNOUNCE_CARRAT_ERROR_FELL_ASLEEP = "对象的耐力水平似乎偏低。",
    ANNOUNCE_CARRAT_ERROR_WALKING = "拿出点生龙活虎的样子，亲爱的喵。",
    ANNOUNCE_CARRAT_ERROR_STUNNED = "你必须集中注意喵！",

    ANNOUNCE_GHOST_QUEST = "only_used_by_wendy",
--fallback to speech_wilson.lua     ANNOUNCE_GHOST_HINT = "only_used_by_wendy",
--fallback to speech_wilson.lua     ANNOUNCE_GHOST_TOY_NEAR = {
--fallback to speech_wilson.lua         "only_used_by_wendy",
--fallback to speech_wilson.lua     },
--fallback to speech_wilson.lua 	ANNOUNCE_SISTURN_FULL = "only_used_by_wendy",
    ANNOUNCE_SISTURN_FULL_EVIL = "only_used_by_wendy",
    ANNOUNCE_SISTURN_FULL_BLOSSOM = "only_used_by_wendy",
--fallback to speech_wilson.lua     ANNOUNCE_ABIGAIL_DEATH = "only_used_by_wendy",
--fallback to speech_wilson.lua     ANNOUNCE_ABIGAIL_RETRIEVE = "only_used_by_wendy",
--fallback to speech_wilson.lua 	ANNOUNCE_ABIGAIL_LOW_HEALTH = "only_used_by_wendy",
    ANNOUNCE_ABIGAIL_SUMMON =
	{
--fallback to speech_wilson.lua 		LEVEL1 = "only_used_by_wendy",
--fallback to speech_wilson.lua 		LEVEL2 = "only_used_by_wendy",
--fallback to speech_wilson.lua 		LEVEL3 = "only_used_by_wendy",
	},

    ANNOUNCE_GHOSTLYBOND_LEVELUP =
	{
--fallback to speech_wilson.lua 		LEVEL2 = "only_used_by_wendy",
--fallback to speech_wilson.lua 		LEVEL3 = "only_used_by_wendy",
	},

--fallback to speech_wilson.lua     ANNOUNCE_NOINSPIRATION = "only_used_by_wathgrithr",
--fallback to speech_wilson.lua     ANNOUNCE_NOTSKILLEDENOUGH = "only_used_by_wathgrithr",
--fallback to speech_wilson.lua     ANNOUNCE_BATTLESONG_INSTANT_TAUNT_BUFF = "only_used_by_wathgrithr",
--fallback to speech_wilson.lua     ANNOUNCE_BATTLESONG_INSTANT_PANIC_BUFF = "only_used_by_wathgrithr",
--fallback to speech_wilson.lua     ANNOUNCE_BATTLESONG_INSTANT_REVIVE_BUFF = "only_used_by_wathgrithr",

--fallback to speech_wilson.lua     ANNOUNCE_WANDA_YOUNGTONORMAL = "only_used_by_wanda",
--fallback to speech_wilson.lua     ANNOUNCE_WANDA_NORMALTOOLD = "only_used_by_wanda",
--fallback to speech_wilson.lua     ANNOUNCE_WANDA_OLDTONORMAL = "only_used_by_wanda",
--fallback to speech_wilson.lua     ANNOUNCE_WANDA_NORMALTOYOUNG = "only_used_by_wanda",

	ANNOUNCE_POCKETWATCH_PORTAL = "呜呜! 我是否可以建议下次将出口点重新调整到离地面更近的地方，亲爱的？",

--fallback to speech_wilson.lua 	ANNOUNCE_POCKETWATCH_MARK = "only_used_by_wanda",
--fallback to speech_wilson.lua 	ANNOUNCE_POCKETWATCH_RECALL = "only_used_by_wanda",
--fallback to speech_wilson.lua 	ANNOUNCE_POCKETWATCH_OPEN_PORTAL = "only_used_by_wanda",
--fallback to speech_wilson.lua 	ANNOUNCE_POCKETWATCH_OPEN_PORTAL_DIFFERENTSHARD = "only_used_by_wanda",

    ANNOUNCE_ARCHIVE_NEW_KNOWLEDGE = "多么奇特的感觉，它在用心灵感应传送蓝图！",
    ANNOUNCE_ARCHIVE_OLD_KNOWLEDGE = "我对这种知识已经很熟悉了。",
    ANNOUNCE_ARCHIVE_NO_POWER = "真是非常失望，我很想知道它的作用。",

    ANNOUNCE_PLANT_RESEARCHED =
    {
        "I've gained a bit more insight into the workings of this species.",
    },

    ANNOUNCE_PLANT_RANDOMSEED = "等它长大了，我就可以辨认物种了。",

    ANNOUNCE_FERTILIZER_RESEARCHED = "即使我有相当丰富的园艺经验，也总有新的东西要学。",

	ANNOUNCE_FIRENETTLE_TOXIN =
	{
		"Oh dear... I seem to be afflicted by the plant's toxin.",
		"The toxin from those nettles carries a rather unpleasant burning sensation.",
	},
	ANNOUNCE_FIRENETTLE_TOXIN_DONE = "值得庆幸的是，这种毒素的影响似乎是暂时的。",

	ANNOUNCE_TALK_TO_PLANTS =
	{
        "Talking to my little garden always seemed to help it grow.",
        "My, those leaves are coming in quite nicely, dear!",
		"All one needs to thrive is a bit of love and care, isn't that right?",
        "No need to rush dear, you just take your time.",
        "How are you doing today? Do you have enough water?",
	},

	ANNOUNCE_KITCOON_HIDEANDSEEK_START = "游戏已经启动，我应该开始搜索了。",
	ANNOUNCE_KITCOON_HIDEANDSEEK_JOIN = "打扰了，我愿意加入猫科动物的搜索。",
	ANNOUNCE_KITCOON_HIDANDSEEK_FOUND =
	{
		"Ah, there you are.",
		"It seems I've discovered a kitten.",
		"I could see your tail from the distance, dear.",
		"Finding kittens is quite simple once you become accustomed to it.",
	},
	ANNOUNCE_KITCOON_HIDANDSEEK_FOUND_ONE_MORE = "又邂逅了一只小猫喵。",
	ANNOUNCE_KITCOON_HIDANDSEEK_FOUND_LAST_ONE = "我找到了所有不见的小猫喵。",
	ANNOUNCE_KITCOON_HIDANDSEEK_FOUND_LAST_ONE_TEAM = "我们找到了所有不见的小猫。",
	ANNOUNCE_KITCOON_HIDANDSEEK_TIME_ALMOST_UP = "游戏结束的时间越来越近了。",
	ANNOUNCE_KITCOON_HIDANDSEEK_LOSEGAME = "看来我们没能及时找齐所有小猫。",
	ANNOUNCE_KITCOON_HIDANDSEEK_TOOFAR = "我正与游戏场地拉开距离喵。",
	ANNOUNCE_KITCOON_HIDANDSEEK_TOOFAR_RETURN = "小猫应该在这里，没错喵。",
	ANNOUNCE_KITCOON_FOUND_IN_THE_WILD = "可怜的宝贝，你迷路了吗喵？",

	ANNOUNCE_TICOON_START_TRACKING	= "它已经闻到了小猫的气味。",
	ANNOUNCE_TICOON_NOTHING_TO_TRACK = "似乎明显缺乏有猫隐藏的证据。",
	ANNOUNCE_TICOON_WAITING_FOR_LEADER = "他听候我的调遣喵。",
	ANNOUNCE_TICOON_GET_LEADER_ATTENTION = "别担心，亲爱的，我来了。",
	ANNOUNCE_TICOON_NEAR_KITCOON = "他坚信其中一只小猫就在附近。",
	ANNOUNCE_TICOON_LOST_KITCOON = "有人比我们先到，找到了我们的小猫。",
	ANNOUNCE_TICOON_ABANDONED = "看来我将不得不继续独自寻找。",
	ANNOUNCE_TICOON_DEAD = "哦，真糟糕！我想我现在只能靠自己了喵。",

    -- YOTB
    ANNOUNCE_CALL_BEEF = "来吧。",
    ANNOUNCE_CANTBUILDHERE_YOTB_POST = "把它建的离比赛场地近点会更实用。",
    ANNOUNCE_YOTB_LEARN_NEW_PATTERN =  "我可以织出一件放牛郎的衣服。",

    -- AE4AE
    ANNOUNCE_EYEOFTERROR_ARRIVE = "来自我们维度之外的东西正试图进来。",
    ANNOUNCE_EYEOFTERROR_FLYBACK = "这种眼球生物似乎相当执着。",
    ANNOUNCE_EYEOFTERROR_FLYAWAY = "我想日光会让它偏头痛喵。",

    -- PIRATES
    ANNOUNCE_CANT_ESCAPE_CURSE = "我似乎就是无法放下它……",
    ANNOUNCE_MONKEY_CURSE_1 = "这种感觉很不同寻常喵。",
    ANNOUNCE_MONKEY_CURSE_CHANGE = "噢，天啊。这是一个不幸的变故。",
    ANNOUNCE_MONKEY_CURSE_CHANGEBACK = "啊。好多了喵。",

    ANNOUNCE_PIRATES_ARRIVE = "哦，天啊。那些捣蛋鬼又在放他们的喧哗的音乐了……",

    ANNOUNCE_BOOK_MOON_DAYTIME = "我们要到今天晚上才能看到效果。",

    ANNOUNCE_OFF_SCRIPT = "要不要再过一下剧本，亲爱的喵？",

    ANNOUNCE_COZY_SLEEP = "我想值得一试。",

	--
	ANNOUNCE_TOOL_TOOWEAK = "需要一个更强大的工具喵。",

    ANNOUNCE_LUNAR_RIFT_MAX = "我怀疑强大能量的涌入是那束奇怪的光芒的来源喵。",
    ANNOUNCE_SHADOW_RIFT_MAX = "听起来可能很荒谬，但那个“光”有点黑暗……",

    ANNOUNCE_SCRAPBOOK_FULL = "我的图鉴已经完成了。",

    ANNOUNCE_CHAIR_ON_FIRE = "这种行为是不可接受的。",

    ANNOUNCE_HEALINGSALVE_ACIDBUFF_DONE = "我断言我的酸雨免疫能力已经消失了。",

    ANNOUNCE_COACH = 
    {
        "only_used_by_wolfgang",
        "only_used_by_wolfgang",
        "only_used_by_wolfgang",
        "only_used_by_wolfgang",
        "only_used_by_wolfgang",
        "only_used_by_wolfgang",
        "only_used_by_wolfgang",
        "only_used_by_wolfgang",
        "only_used_by_wolfgang",
    },
    ANNOUNCE_WOLFGANG_WIMPY_COACHING = "only_used_by_wolfgang喵",
    ANNOUNCE_WOLFGANG_MIGHTY_COACHING = "only_used_by_wolfgang",
    ANNOUNCE_WOLFGANG_BEGIN_COACHING = "only_used_by_wolfgang喵",
    ANNOUNCE_WOLFGANG_END_COACHING = "only_used_by_wolfgang喵",
    ANNOUNCE_WOLFGANG_NOTEAM = 
    {
        "only_used_by_wolfgang",
        "only_used_by_wolfgang",
        "only_used_by_wolfgang",
    },

    ANNOUNCE_YOTD_NOBOATS = "我必须在离起点更近的地方才能开始。",
    ANNOUNCE_YOTD_NOCHECKPOINTS = "设置检查站的事宜似乎被忽略了。",
    ANNOUNCE_YOTD_NOTENOUGHBOATS = "我应该努力在起点周围腾出一些空间。",

    ANNOUNCE_OTTERBOAT_OUTOFSHALLOWS = "该平台的结构无法承受更深的水域喵。",
    ANNOUNCE_OTTERBOAT_DENBROKEN = "看来那个窝对平台结构完整性的重要性比我想象的还要大。",

    ANNOUNCE_GATHER_MERM = "only_used_by_wurt",

    -- rifts 4
    ANNOUNCE_EXIT_GELBLOB = "我不想再经历那样的事了喵。",
	ANNOUNCE_SHADOWTHRALL_STEALTH = "我被隐秘的生物咬了！",
    ANNOUNCE_RABBITKING_AGGRESSIVE = "某种生物正在地下积极地挖隧道喵。",
    ANNOUNCE_RABBITKING_PASSIVE = "我听到小动物挖洞的声音。",
    ANNOUNCE_RABBITKING_LUCKY = "多么奇特的兔子品种啊！",
    ANNOUNCE_RABBITKING_LUCKYCAUGHT = "抓到你了喵！",
    ANNOUNCE_RABBITKINGHORN_BADSPAWNPOINT = "这显然不是正确位置。",

	-- Hallowed Nights 2024
	ANNOUNCE_NOPUMPKINCARVINGONFIRE = "滚烫的麻烦。",

	-- Winter's Feast 2024
	ANNOUNCE_SNOWBALL_TOO_BIG = "它已经达到最大尺寸了喵。",
	ANNOUNCE_SNOWBALL_NO_SNOW = "这里没有雪可以滚雪球。",

    -- Meta 5
    ANNOUNCE_WENDY_BABYSITTER_SET = "only_used_by_wendy", 
    ANNOUNCE_WENDY_BABYSITTER_STOP = "only_used_by_wendy",

	ANNOUNCE_WORTOX_REVIVER_FAILTELEPORT = "简直扫兴喵。",

    ANNOUNCE_NO_ABIGAIL_FLOWER = "only_used_by_wendy",

    ANNOUNCE_ELIXIR_BOOSTED = "真是太好了。",
    ANNOUNCE_ELIXIR_GHOSTVISION = "我的眼睛已经适应了黑暗。",
    ANNOUNCE_ELIXIR_PLAYER_SPEED = "力量给年轻人纯碎是浪费！",

    ANNOUNCE_ELIXIR_TOO_SUPER = "那个过于烈性。",

    -- Rift 5

    ANNOUNCE_LUNARGUARDIAN_INCOMING = "怎么又是你！",
    ANNOUNCE_FLOATER_HELD = "呣，相当方便喵。",
    ANNOUNCE_FLOATER_LETGO = "该下水了！",

    -- rifts5.1
    ANNOUNCE_LUNARHAIL_BIRD_SOUNDS = "多么可怕的声音。",
    ANNOUNCE_LUNARHAIL_BIRD_CORPSES = "那些可怜的鸟儿在冰雹里毫无生存的机会。",
    ANNOUNCE_FLOAT_SWIM_TIRED = "容老妪喘口气喵。",
    ANOUNCE_MUTATED_BIRD_ATTACK = "变异禽类正在发动攻击喵。",

    -- Rift 6
    ANNOUNCE_WEAPON_TOOWEAK = "这需要更强大的力量喵。",
    ANNOUNCE_VAULT_TELEPORTER_DOES_NOTHING = "定是接收端出了问题。",

	-- Rift 6.1
	ANNOUNCE_LIGHTSOUT_SHADOWHAND = "那只令人难以忍受的手似乎在妨碍解谜喵！",

    -- Hallowed Nights 2025
    ANNOUNCE_MUTATED_BUZZARD_ARRIVAL = "秃鹫自然会被腐肉吸引。可是，这几只身上显然有变异的迹象。", -- Mutated buzzards arrive to lurk and circle the player

    -- Winter's Feast 2025
    ANNOUNCE_HERMITCRAB_SHELL_BADTELEPORTPOINT = "不知为何它没有响应。",
    ANNOUNCE_HERMITCRAB_SHELL_ARRIVE = "啊，是的。我到珍珠家了。",

    -- Year of the Clockwork Knight
    ANNOUNCE_YOTH_ONCOOLDOWN = "看来那些机械骑士此刻暂时无法响应喵。",
	-- Post-YOTH
	ANNOUNCE_MAX_CLOCKWORKS = "嗯，是的。国际象棋的规则很简单。每人最多只能有两颗这种棋子。",

    -- wx specific
--fallback to speech_wilson.lua     ANNOUNCE_WX_SCANNER_HITDOWN_BY_CAT = "only_used_by_wx78",
--fallback to speech_wilson.lua     ANNOUNCE_WX_TASER_BUILDUP = "only_used_by_wx78", -- Wx is building up charge when getting hit, nearing EMP blast
--fallback to speech_wilson.lua     ANNOUNCE_WX_TASER_ABOUTTOEXPLODE = "only_used_by_wx78", -- Wx is fully charged and about to release it. Take cover!
--fallback to speech_wilson.lua     ANNOUNCE_WX_TASER_POSTEXPLOSION = "only_used_by_wx78", -- Wx has exploded and released all the build up, now they can say something about how invigorating it was.
--fallback to speech_wilson.lua     ANNOUNCE_WX_NIGHTMARECHARGE = "only_used_by_wx78", -- WX ate/used a nightmare fuel, giving them full charge temporarily
--fallback to speech_wilson.lua 	ANNOUNCE_WX_NIGHTMAREDISCHARGE = "only_used_by_wx78", -- WX's temporary full charge ran out.

    -- Rifts 7

    ANNOUNCE_MITEGLAND_DEBUFF =
	{
		"Oh dear... that gland is really disagreeing with me...",
		"It appears that gland was not safe for consumption after all.",
	},
	ANNOUNCE_MITEGLAND_DEBUFF_DONE = "这是个以痛苦换来的教训喵。",
    ANNOUNCE_GOT_DECON_MISTED = "啊……我的思绪莫名其妙地变清晰了。",
	ANNOUNCE_VAULT_SHADOW_ASSIST = "看来我们与暗影野兽同仇敌忾了喵。",
    ANNOUNCE_HEALINGSALVE_FUMAROLEBUFF_DONE = "恐怕我要失去阻燃的能力了。",--fire immunity expired
    ANNOUNCE_SECURITY_PULSE_FOLLOWING = "这台装置吸引着它。", -- Security spark attached to us due to us holding Waymark Compass.

    -- Rifts 8

    -- after the final fight when Charlie goes MIA and isn't the night monster anymore
	ANNOUNCE_GRUE_NOCHARLIE = "有动静！怎么没了花香？",
	ANNOUNCE_GRUE_NOCHARLIE_ATTACK = "哎哟！谁这么大胆？！",
--fallback to speech_wilson.lua 	ANNOUNCE_GRUE_NOCHARLIE_MISSED = "only_used_by_winona", --winona specific

	ANNOUNCE_STOMP_SHROUDEN = "这声音实在骇人。",

    ANNOUNCE_DREADSTONE_SPIKE_EXPLODING = "这构造正在对我的精神状态作出反应。", -- exploding because of enlightenment.

	BATTLECRY =
	{
		GENERIC = "战斗喵！",
		PIG = "令人作呕的无赖喵！",
		PREY = "放弃吧。",
		SPIDER = "规矩点！",
		SPIDER_WARRIOR = "要尊敬老人！",
		DEER = "这会很简单。",
	},
	COMBAT_QUIT =
	{
		GENERIC = "得，结束了。",
		PIG = "噢，不好。",
		PREY = "我必须重新评估形势。",
		SPIDER = "我必须仔细研究一下这个！",
		SPIDER_WARRIOR = "从头再来喵！",
	},

	DESCRIBE =
	{
		MULTIPLAYER_PORTAL = "恩，可能还需要多读读。",
        MULTIPLAYER_PORTAL_MOONROCK = "它的设计无疑是超凡脱俗的。",
        MOONROCKIDOL = "好奇。它看起来像把钥匙。",
        CONSTRUCTION_PLANS = "哦，我真的很喜欢它的样子。",

        ANTLION =
        {
            GENERIC = "嗯。你肯定就是所有地震活动的罪魁祸首。",
            VERYHAPPY = "贡品已经让他平静了喵。",
            UNHAPPY = "蚁狮看起来很烦躁。",
        },
        ANTLIONTRINKET = "它看起来像儿童的顽固。",
        SANDSPIKE = "蚁狮今天行为不端喵。",
        SANDBLOCK = "相当异常的才能！",
        GLASSSPIKE = "小心，它很锋利喵。",
        GLASSBLOCK = "我一直喜欢玻璃工艺。",
        ABIGAIL_FLOWER =
        {
            GENERIC ="啊哈…… 我不熟悉这类花。",
			LEVEL1 = "它发出一种奇怪的能量。",
			LEVEL2 = "那朵花鲜艳了不少。",
			LEVEL3 = "它的魔法已经达到了最大的力量。",

			-- deprecated
            LONG = "奇怪……",
            MEDIUM = "它发出一种奇怪的能量。",
            SOON = "花的能量变强大了。",
            HAUNTED_POCKET = "我想，我应该把它放下喵。",
            HAUNTED_GROUND = "它想从我这得到点什么吗？",
        },

        BALLOONS_EMPTY = "这些似乎毫无价值。",
        BALLOON = "用它来转移注意力应该不错。",
		BALLOONPARTY = "每隔一段时间，合理的欢乐会对我们有好处。",
		BALLOONSPEED =
        {
            DEFLATED = "余下的空气不足以分析它的成分……",
            GENERIC = "这位年轻人呼吸中的化学构成一定很迷人。",
        },
		BALLOONVEST = "亲爱的，我欣赏你在实用方面的尝试喵。",
		BALLOONHAT = "它在试图刻画兔形目的生物。",

        BERNIE_INACTIVE =
        {
            BROKEN = "那个熊需要修理。",
            GENERIC = "它是一只泰迪熊。",
        },

        BERNIE_ACTIVE = "那个泰迪熊好像活过来了喵。",
        BERNIE_BIG = "着实怪异，老妪参不透啊喵。",

		BOOKSTATION =
		{
			GENERIC = "求知如渴的头脑应当永远有机会去图书馆博览群书喵。",
			BURNT = "世上多少惨剧也比不上亲眼看到书籍被毁。",
		},
        BOOK_BIRDS = "虽然是删节版本，但它里面有我的最爱：西美角鸮。",
        BOOK_TENTACLES = "真是难以释手。坦白讲，它真的很吸引人。",
        BOOK_GARDENING = "用死去的植物来帮助活着的植物。",
		BOOK_SILVICULTURE = "用死去的植物来帮助活着的植物。",
		BOOK_HORTICULTURE = "这就是我让农作物开花结果的绝学。",
        BOOK_SLEEP = "好温馨安宁的一本书，就像睡前的一杯热牛奶一样喵。",
        BOOK_BRIMSTONE = "总感觉有什么不对劲呢？",

        BOOK_FISH = "它一开始就起了一个相当勾人的钩子喵。",
        BOOK_FIRE = "不妨将不幸之事作为学习之良机。过去犯过的错误就不要再重复喵。",
        BOOK_WEB = "毕竟蛛形纲动物是健康的生态系统的重要组成部分。",
        BOOK_TEMPERATURE = "你必须要注意自己的热平衡。",
        BOOK_LIGHT = "我喜欢在傍晚时做一些轻度阅读。",
        BOOK_RAIN = "言简意赅的指南，没有华而不实的赘述。",
        BOOK_MOON = "事实证明，调查远古档案是相当有教育意义的喵。",
        BOOK_BEES = "我已渐渐醉心养蜂。",
        
        BOOK_HORTICULTURE_UPGRADED = "尽管人类种植农作物的历史已经有数个世纪，但仍然有大量农业知识有待我们去学习和发现。",
        BOOK_RESEARCH_STATION = "书中的内容是对现实世界的高度提炼喵。",
        BOOK_LIGHT_UPGRADED = "我给了它一个高光的评价。",

        FIREPEN = "作家只需寥寥几笔就可以释放出一场火焰风暴。",

        PLAYER =
        {
            GENERIC = "啊哈，你好，亲爱的%s喵！",
            ATTACKER = "这不对，%s做的不对。",
            MURDERER = "我要把你从历史书上抹掉！",
            REVIVER = "我要谢谢你为了集体生存所做的贡献，%s！",
            GHOST = "好可怜，%s需要一颗心将他们固定在这个位面上。",
            FIRESTARTER = "%s，我是怎么告诉你生火的？",
        },
        WILSON =
        {
            GENERIC = "亲爱的%s，你好！你的定理怎么来的喵？",
            ATTACKER = "%s，必要的话，我会揪着你耳朵带你回家。",
            MURDERER = "%s，好像我们已经进入斗智斗勇的境界！",
            REVIVER = "你还是知道一两件事的，科学家！",
            GHOST = "我不是跟你说过要穿夹克？我会拿到心的…",
            FIRESTARTER = "%s需要一次严厉警告。",
        },
        WOLFGANG =
        {
            GENERIC = "啊哈，你好，亲爱的%s！",
            ATTACKER = "%s，我忍受不了这种行为喵。",
            MURDERER = "%s，就这样。我正摘下眼镜！",
            REVIVER = "%s，做的很好。你学得很快喵。",
            GHOST = "%s表现得很强硬，但是他需要我的帮助。一颗心就可以帮到。",
            FIRESTARTER = "%s，那火是故意点起的吗喵？",
        },
        WAXWELL =
        {
            GENERIC = "啊哈，你好，亲爱的%s！",
            ATTACKER = "又是老把戏，是吗，%s？",
            MURDERER = "又骗我，你太无耻！骗了我两次…你死定了！",
            REVIVER = "你很好，%s。",
            GHOST = "亲爱的，刺痛对吗？让我给你拿到心。",
            FIRESTARTER = "%s，我们现在要点火吗？务必小心。",
        },
        WX78 =
        {
            GENERIC = "啊，机器人，打声招呼吧，亲爱的 %s！",
            ATTACKER = "那个机器人到底有多可怕喵？",
            MURDERER = "二进制很简单，%s……开还是关喵。",
            REVIVER = "我欣赏你对团体生存的坚持，%s喵！",
            GHOST = "了不起。%s实际上有个幽灵，而且它还在四周徘徊。",
            FIRESTARTER = "摧毁所有生命时一定要当心，亲爱的。",
        },
        WILLOW =
        {
            GENERIC = "啊哈，你好，亲爱的%s喵！",
            ATTACKER = "亲爱的，你喜欢试探底线，不是吗？",
            MURDERER = "%s，你要尊重长者！",
            REVIVER = "%s，你做的很好。",
            GHOST = "亲爱的，要是你和鬼魂的眼神相会，它们会像那样被困住。",
            FIRESTARTER = "亲爱，我在点火这事说什么了吗喵？",
        },
        WENDY =
        {
            GENERIC = "啊哈，你好，亲爱的%s喵！",
            ATTACKER = "%s！你够了，小姐喵！",
            MURDERER = "你需要有人好好教教你礼仪了，%s！",
            REVIVER = "%s，亲爱的。你独具能力，能够胜任对付妖怪的任务喵！",
            GHOST = "天哪，这不行。%s，让我给你找到心喵。",
            FIRESTARTER = "%s，谁给你易燃材料？",
        },
        WOODIE =
        {
            GENERIC = "啊哈，你好，亲爱的%s！",
            ATTACKER = "当心，%s。你知道纸浆是什么做成的，不是吗？",
            MURDERER = "我会自卫的，笨蛋！",
            REVIVER = "干得漂亮，%s。",
            GHOST = "我是怎么说玩斧头的事了？让我们去帮你找颗心来。",
            BEAVER = "亲爱的从来没提过他被海狸化所困扰。",
            BEAVERGHOST = "我要把“海狸人”加入我的濒危物种名单里了喵。",
            MOOSE = "噢，鹿啊,看来你的戏路越来越宽了。",
            MOOSEGHOST = "莫发愁，我定会带颗心回来喵。",
            GOOSE = "嚯，好一只蠢鹅喵！",
            GOOSEGHOST = "可怜人儿，我来试着帮你找颗心脏喵。",
            FIRESTARTER = "如果你想被烧着的话，一直点火，亲爱的。",
        },
        WICKERBOTTOM =
        {
            GENERIC = "啊哈，你好，%s！真高兴在这看到你喵。",
            ATTACKER = "%s不道德行为破坏了我的多元宇宙猜想喵。",
            MURDERER = "我自我批评最严格！",
            REVIVER = "知识派上了用场，不是吗，%s 喵？",
            GHOST = "我们所有的自助书籍最终还是有用的，嗯，%s ？",
            FIRESTARTER = "烧书真是无礼，%s！",
        },
        WES =
        {
            GENERIC = "啊哈，那个小丑。你好啊，亲爱的%s！",
            ATTACKER = "他的身体语言说明了一切。",
            MURDERER = "它们将讲述你的丰功伟绩，%s !",
            REVIVER = "你是个不错的小伙子，%s。",
            GHOST = "亲爱的，%s需要一颗心脏把他固定在这个位面上。",
            FIRESTARTER = "你要是烧着自己，可别对着我哭，亲爱的喵。",
        },
        WEBBER =
        {
            GENERIC = "啊哈，你好，亲爱的%s喵！",
            ATTACKER = "真有趣，小蜘蛛喵。",
            MURDERER = "你需要有人好好教教你礼仪了，%s！",
            REVIVER = "你真是个贴心的男孩，%s！",
            GHOST = "你一复活，我就会拿颜色漂亮的绷带给你喵。",
            FIRESTARTER = "谁给了你火柴，%s！",
        },
        WATHGRITHR =
        {
            GENERIC = "啊哈，你好，亲爱的%s喵！",
            ATTACKER = "你没有在制造麻烦，对吧，%s？",
            MURDERER = "你的传说到此结束，%s喵！",
            REVIVER = "我欣赏你对团体生存的坚持，%s！",
            GHOST = "%s，我跟你说过不要带着长矛跑。啧啧。",
            FIRESTARTER = "亲爱的，“地狱之火”只是一种表达方式喵。",
        },
        WINONA =
        {
            GENERIC = "啊哈，你好，亲爱的%s！",
            ATTACKER = "挺愚笨的。%s，你不觉得吗？",
            MURDERER = "我不能忍受残暴！",
            REVIVER = "%s真是个多面手。",
            GHOST = "啧。你有没有戴安全帽，亲爱的喵？",
            FIRESTARTER = "没有必要放那把火啊，亲爱的喵。",
        },
        WORTOX =
        {
            GENERIC = "你得多跟我讲讲你们这个物种的情况，亲爱的喵。",
            ATTACKER = "你最好按规矩来，%s。",
            MURDERER = "收起你的把戏%s！让我来终结你!",
            REVIVER = "多谢帮助，%s。",
            GHOST = "让你捉弄人，这就是你的下场，%s喵！",
            FIRESTARTER = "%s，我忍受不了这种行为。",
        },
        WORMWOOD =
        {
            GENERIC = "啊，你好，亲爱的%s！",
            ATTACKER = "%s属于荨麻属植物，我怀疑。",
            MURDERER = "%s是一种致命的茄属植物！消灭它！",
            REVIVER = "你是一位好朋友，%s。",
            GHOST = "哎，一点都不好。",
            FIRESTARTER = "你想把叶子烧掉吗，%s？",
        },
        WARLY =
        {
            GENERIC = "啊，你好，亲爱的%s喵！",
            ATTACKER = "没必要引起骚动，%s喵。",
            MURDERER = "空气里有新鲜出炉的谋杀味。我不客气了喵！",
            REVIVER = "干得漂亮，%s喵。",
            GHOST = "亲爱的，咱们想办法让你重新站起来。",
            FIRESTARTER = "亲爱的，我知道那火不是拿来做饭的。",
        },

        WURT =
        {
            GENERIC = "你好亲爱的%s，准备好上课了吗？",
            ATTACKER = "住手，立刻！",
            MURDERER = "我绝不容忍这种行为，%s！",
            REVIVER = "亲爱的，谢谢你了。",
            GHOST = "嗷，不能让你这样，我们会帮你的。",
            FIRESTARTER = "你记不记得我怎么说不能玩火了？好吧，你忘了！",
        },

        WALTER =
        {
            GENERIC = "啊哈，你好，亲爱的%s喵！",
            ATTACKER = "有事好好说，亲爱的喵。",
            MURDERER = "天啊，先锋队的人就是这样教你行为举止的吗？",
            REVIVER = "哎呀，你真是善良啊，%s喵。",
            GHOST = "哦，亲爱的，你必须要多小心喵！",
            FIRESTARTER = "不是所有的东西都是营火，亲爱的喵。",
        },

        WANDA =
        {
            GENERIC = "你好，亲爱的%s！ 你对未来的事情有什么新洞察吗？",
            ATTACKER = "%s，你实在应该为孩子们树立一个好榜样喵。",
            MURDERER = "你应该知道这么做的后果，%s。我动手了！",
            REVIVER = "感谢你抽出时间救人，亲爱的。",
            GHOST = "哦，亲爱的，即使你采取了所有的预防措施还是沦落至此吗？",
            FIRESTARTER = "你肯定有先见之明，知道那是不明智的，不是吗喵？",
        },

        WONKEY =
        {
            GENERIC = "它显示了比我所设想的猿猴更高的智力水平。",
            ATTACKER = "哦，天啊，也许它并不像我最初设想的那样聪明。",
            MURDERER = "必须解决这个野生动物！",
            REVIVER = "这个生物似乎对我们相当依恋。我想知道为什么？",
            GHOST = "噢，天啊……我很想帮它。",
            FIRESTARTER = "我认为它还没有进化到正确使用火的程度。",
        },

--fallback to speech_wilson.lua         MIGRATION_PORTAL =
--fallback to speech_wilson.lua         {
--fallback to speech_wilson.lua         --    GENERIC = "If I had any friends, this could take me to them.",
--fallback to speech_wilson.lua         --    OPEN = "If I step through, will I still be me?",
--fallback to speech_wilson.lua         --    FULL = "It seems to be popular over there.",
--fallback to speech_wilson.lua         },
        GLOMMER =
        {
            GENERIC = "昆虫纲中长相怪异的家伙喵。",
            SLEEPING = "它好像睡着了。",
        },
        GLOMMERFLOWER =
        {
            GENERIC = "它一直在滴黏液。",
            DEAD = "虽然变成了灰色，但它还在不停地滴。",
        },
        GLOMMERWINGS = "那个奇怪生物的翅膀喵。",
        GLOMMERFUEL = "它好像很不稳定。",
        BELL = "安静！这里是图书馆！",
        STATUEGLOMMER =
        {
            GENERIC = "它是被石化了吗？",
            EMPTY = "不是，只是一座雕像而已喵。",
        },

        LAVA_POND_ROCK = "冷却不久的火成岩。危险。",

		WEBBERSKULL = "那是最不同寻常的头骨。",
		WORMLIGHT = "比我想象中的要柔软。",
		WORMLIGHT_LESSER = "这东西是纯蔬菜。",
		WORM =
		{
		    PLANT = "让我想起了琵琶鱼。",
		    DIRT = "最好是离那个东西远点。",
		    WORM = "蠕虫攻击喵！",
		},
        WORMLIGHT_PLANT = "让我想起了琵琶鱼。",
		MOLE =
		{
			HELD = "我觉得我的口袋不能成为它的自然栖息地。",
			UNDERGROUND = "那下面有东西正在挖地道。",
			ABOVEGROUND = "啊，是鼹鼠科动物喵！",
		},
		MOLEHILL = "它的洞穴通道一定四通八达！",
		MOLEHAT = "啊，透过另一种生物的，呃，透过它们的鼻子看世界！",

		EEL = "是鳗鱼。",
		EEL_COOKED = "这条鳗鱼已经烤熟了。",
		UNAGI = "一种常见的制作鳗鱼料理的方法。",
		EYETURRET = "那两种野兽的能量已经被铥矿石聚集起来了。",
		EYETURRET_ITEM = "我得把这个放置好喵。",
		MINOTAURHORN = "它的角也太大了吧。真有点怀疑是不是借助噩梦燃料才长这么大的。",
		MINOTAURCHEST = "那个箱子绝对豪华喵。",
		THULECITE_PIECES = "这些碎片可以合成更大的一块。",
		POND_ALGAE = "还好这种藻类不需要进行光合作用喵。",
		GREENSTAFF = "似乎能让物体回到过去的样子。",
		GIFT = "哦天哪，多可爱啊！",
        GIFTWRAP = "包装礼物是一件抚慰人的活儿，不是吗喵？",
		POTTEDFERN = "盆栽植物。",
        SUCCULENT_POTTED = "我想知道，没了我，我的花园会变成什么。",
		SUCCULENT_PLANT = "独特地适应了干旱气候。",
		SUCCULENT_PICKED = "如果不移植，它就会凋零。",
		SENTRYWARD = "啊！一颗占卜宝球喵。",
        TOWNPORTAL =
        {
			GENERIC = "它把对象解构，并在其他地方重构喵。",
			ACTIVE = "道路打开了喵。",
		},
        TOWNPORTALTALISMAN =
        {
			GENERIC = "在大型野兽内脏中形成的牛黄。",
			ACTIVE = "牛黄的魔法已经被激活了喵。",
		},
        WETPAPER = "这可能证明是有用的喵。",
        WETPOUCH = "或许里面有什么有用的东西？",
        MOONROCK_PIECES = "多么复杂的转化啊。",
        MOONBASE =
        {
            GENERIC = "这一结构的魔法在可预测的周期中衰退。",
            BROKEN = "古老的碎片。也许它可以被修复？",
            STAFFED = "现在我们必须有耐心。",
            WRONGSTAFF = "嗯……法杖看似不可互换。",
            MOONSTAFF = "石头的魔法似乎是用不完的喵。",
        },
        MOONDIAL =
        {
			GENERIC = "这里正在发生古怪的事情。",
			NIGHT_NEW = "月亮的周期重新开始了。",
			NIGHT_WAX = "月亮慢慢在变圆。",
			NIGHT_FULL = "月亮的这一周期快结束了喵。",
			NIGHT_WANE = "月亮正在变小。",
			CAVE = "它似乎会在地下条件中失去功能喵。",
--fallback to speech_wilson.lua 			WEREBEAVER = "only_used_by_woodie", --woodie specific
			GLASSED = "真奇特，水的反应跟我在洞窟中观察到的一致。",
        },
		THULECITE = "这似乎是一种有趣的、含有灵质杂质的变种黝帘石喵。",
		ARMORRUINS = "坚固耐用的铥矿护甲喵。",
		ARMORSKELETON = "现在是外骨架。噢，噢！",
		SKELETONHAT = "这对凡人的心灵会造成有害的影响。",
		RUINS_BAT = "实施毁灭性打击的工具。",
		RUINSHAT = "对我来说有点过于俗丽，但似乎还挺有用的喵。",
		NIGHTMARE_TIMEPIECE =
		{
            CALM = "灵质残渣的能量水平似乎已经达到了最低喵。",
            WARN = "虽然灵质残渣的能量水平现在很低，但它正在不断升高喵。",
            WAXING = "灵质残渣的能量水平似乎越来越高了。",
            STEADY = "灵质残渣的能量水平似乎已经达到了峰值喵。",
            WANING = "灵质残渣的能量水平很高，但似乎在逐渐降低。",
            DAWN = "灵质残渣的能量水平微乎其微。",
            NOMAGIC = "这附近似乎没有任何灵质的东西喵。",
		},
		BISHOP_NIGHTMARE = "好复杂的技术，太令人兴奋了。",
		ROOK_NIGHTMARE = "看起来它随时都可能分崩离析。",
		KNIGHT_NIGHTMARE = "周围噩梦燃料的使用破坏了它的程序设计。",
		MINOTAUR = "走远点，你这个野兽！",
		SPIDER_DROPPER = "啊，这种蛛形纲动物已经适应了悬挂在洞穴顶上的生活。",
		NIGHTMARELIGHT = "古人似乎曾用噩梦燃料来为一切事物提供能量喵。",
		NIGHTSTICK = "我怀疑它是不是以金星命名的？",
		GREENGEM = "因为含铬杂质而呈现绿色喵。",
		MULTITOOL_AXE_PICKAXE = "功能很强大，既能当斧子用又能当鹤嘴锄用喵。",
		ORANGESTAFF = "很方便在短距离范围内使用。",
		YELLOWAMULET = "这个护符的发光波长为530纳米左右。",
		GREENAMULET = "几乎和神奇的粘合剂具备一样的功效。",
		SLURPERPELT = "这东西肯定有些用处。",

		SLURPER = "典型的共生关系实例喵。",
		SLURPER_PELT = "这东西肯定有些用处。",
		ARMORSLURPER = "恶心但又很神奇的衣服。",
		ORANGEAMULET = "这块宝石每使用一次就会逝去一点。",
		YELLOWSTAFF = "还好这颗星星不是特别大，可以掌控。",
		YELLOWGEM = "也许它和黄水晶类似。",
		ORANGEGEM = "看起来像锰铝石榴石。",
        OPALSTAFF = "看似要召唤出一颗寒星。",
        OPALPRECIOUSGEM = "衍射准矿物的珍贵的亮光。",
        TELEBASE =
		{
			VALID = "它看起来已经准备好了喵。",
			GEMS = "还没充能呢喵。",
		},
		GEMSOCKET =
		{
			VALID = "好奇妙的反应。",
			GEMS = "放宝石的地方喵。",
		},
		STAFFLIGHT = "也许法杖再大点，就可以召唤更大的星星了。",
        STAFFCOLDLIGHT = "某种自有的曙光。",

        ANCIENT_ALTAR = "某位死去很久的神的纪念碑。",

        ANCIENT_ALTAR_BROKEN = "它少了些东西喵。",

        ANCIENT_STATUE = "它似乎与现实世界存在某种神秘的联系喵。",

        LICHEN = "一种共生生物！一种菌类加上一种共生藻菌喵。",
		CUTLICHEN = "这不会保质很久的。",

		CAVE_BANANA = "它们的基因全都是相同的。",
		CAVE_BANANA_COOKED = "比之前要好些。",
		CAVE_BANANA_TREE = "以前一定有种子掉进陷洞。",
        ROCKY =
        {
            GENERIC = "它们的甲壳是岩石做的喵。",
            BOULDER = "一块巨大的沉积岩。", -- in boulder state, it looks like a normal boulder
            ACID = "酸雨正在溶解它外骨骼中的矿物质喵。", -- in acid form
        },

		COMPASS =
		{
			GENERIC="坐标仍然未知。",
			N = "北。",
			S = "南。",
			E = "东。",
			W = "西。",
			NE = "东北。",
			SE = "东南喵。",
			NW = "西北。",
			SW = "西南喵。",
		},

        HOUNDSTOOTH = "成分是钙和硫磺。",
        ARMORSNURTLESHELL = "这里面很宽敞。",
        BAT =
        {
            GENERIC = "会飞的哺乳动物。",
            ACID = "酸雨使它进入了狂暴状态。", -- in acid form
        },
        BATBAT = "有意思。这件武器好像是活的。",
        BATWING = "理论上是可以食用的。",
        BATWING_COOKED = "理论上是可以食用的喵。",
        BATCAVE = "这个隐蔽的地方实际上是一处居所喵。",
        BEDROLL_FURRY = "我不要睡在地上。",
        BUNNYMAN = "一种有感情的兔类动物喵。",
        FLOWER_CAVE = "你可以借助那个光来看书喵。",
        GUANO = "更多的代谢副产品。",
        LANTERN = "一种可重复加燃料的光源。",
        LIGHTBULB = "它是动物还是蔬菜？",
        MANRABBIT_TAIL = "它们利用尾巴保持平衡喵。",
        MUSHROOMHAT = "唔。多么欢快却枯萎的外表啊。",
        MUSHROOM_LIGHT2 =
        {
            ON = "红色和蓝色孢子组合在一起时会产生可爱的亮光，看书时可用喵。",
            OFF = "色彩基础理论是必须要有的。",
            BURNT = "呃哼。我会需要新的灯光来读书。",
        },
        MUSHROOM_LIGHT =
        {
            ON = "相当迷人，不是吗喵？",
            OFF = "一株生物性发光的真菌。既不是伞菌目，也不是炭角菌目。",
            BURNT = "那就是真菌学。吼吼！",
        },
        SLEEPBOMB = "已经超过了你的就寝时间。",
        MUSHROOMBOMB = "大家和挥发性的落叶松蕈保持安全距离！",
        SHROOM_SKIN = "青蛙的皮肤必须保持潮湿，否则它们会窒息。这只在意的不是那事。",
        TOADSTOOL_CAP =
        {
            EMPTY = "这里的土壤被干扰了。",
            INGROUND = "它的生长需要催化剂来打破表面。",
            GENERIC = "落叶松蕈属的新成员？",
        },
        TOADSTOOL =
        {
            GENERIC = "他已经和真菌孢子形成了一种危险的共生关系。",
            RAGE = "蟾蜍和真菌之间的共生关系已经达到了顶点。",
        },
        MUSHROOMSPROUT =
        {
            GENERIC = "我们必须摧毁那棵高耸的落叶松蕈喵。",
            BURNT = "一棵高耸的烧焦的落叶松蕈。",
        },
        MUSHTREE_TALL =
        {
            GENERIC = "一棵寄生着菌类的树。",
            BLOOM = "显而易见，现在是这个物种的繁殖期。",
            ACIDCOVERED = "酸会加速产出菌类的变质速度。",
        },
        MUSHTREE_MEDIUM =
        {
            GENERIC = "红色品种的发光蘑菇喵。",
            BLOOM = "这个味道可以用于抵御捕食者。",
            ACIDCOVERED = "酸会加速产出菌类的变质速度。",
        },
        MUSHTREE_SMALL =
        {
            GENERIC = "哎呀！好巨大的发光蘑菇。",
            BLOOM = "光亮由化学反应引起。",
            ACIDCOVERED = "酸会加速产出菌类的变质速度。",
        },
        MUSHTREE_TALL_WEBBED =
        {
            GENERIC = "这个似乎是共生关系。",
            ACIDCOVERED = "酸会加速产出菌类的变质速度。",
        },
        SPORE_TALL =
        {
            GENERIC = "遗传信息的淡蓝携带者。",
            HELD = "我是遗传信息携带者的携带者。",
        },
        SPORE_MEDIUM =
        {
            GENERIC = "遗传信息的亮红携带者。",
            HELD = "我是遗传信息携带者的携带者喵。",
        },
        SPORE_SMALL =
        {
            GENERIC = "遗传信息的可爱绿色的携带者喵。",
            HELD = "我是遗传信息携带者的携带者喵。",
        },
        RABBITHOUSE =
        {
            GENERIC = "真可悲，它只是被漆得像一根胡萝卜。",
            BURNT = "它连烧起来都不像是胡萝卜喵。",
        },
        SLURTLE = "吞食矿物的腹足类动物。",
        SLURTLE_SHELLPIECES = "一堆碎片喵。",
        SLURTLEHAT = "它能提供保护喵。",
        SLURTLEHOLE = "腹足类动物的巢穴。",
        SLURTLESLIME = "它们的黏液由于某种原因会发生爆炸。",
        SNURTLE = "腹足类动物的罕见变种。",
        SPIDER_HIDER = "长着厚甲壳的蛛形纲动物。",
        SPIDER_SPITTER = "会吐出抛射物的蛛形纲动物。",
        SPIDERHOLE = "这就是蜘蛛肆虐的源头。",
        SPIDERHOLE_ROCK = "这就是蜘蛛肆虐的源头。",
        STALAGMITE = "奇怪的岩层喵。",
        STALAGMITE_TALL = "又一块石笋喵。",

        TURF_CARPETFLOOR = "地皮。你正踩在它上面。",
        TURF_CHECKERFLOOR = "地皮。你正踩在它上面。",
        TURF_DIRT = "地皮。你正踩在它上面。",
        TURF_FOREST = "地皮。你正踩在它上面。",
        TURF_GRASS = "地皮。你正踩在它上面喵。",
        TURF_MARSH = "地皮。你正踩在它上面喵。",
        TURF_METEOR = "吼吼，一颗流星受引力的作用陨落了。",
        TURF_PEBBLEBEACH = "地皮。你可以踩在它上面。",
        TURF_ROAD = "地皮。你正踩在它上面。",
        TURF_ROCKY = "地皮。你正踩在它上面。",
        TURF_SAVANNA = "地皮。你正踩在它上面喵。",
        TURF_WOODFLOOR = "地皮。你正踩在它上面。",

		TURF_CAVE="地皮。你正踩在它上面。",
		TURF_FUNGUS="地皮。你正踩在它上面喵。",
		TURF_FUNGUS_MOON = "地皮。你正踩在它上面。",
		TURF_ARCHIVE = "地皮。你正踩在它上面喵。",
        TURF_VAULT = "地皮。你正踩在它上面。",
        TURF_VENT = "地皮。你正踩在它上面。",
		TURF_SINKHOLE="地皮。你正踩在它上面喵。",
		TURF_UNDERROCK="地皮。你正踩在它上面喵。",
		TURF_MUD="地皮。你正踩在它上面喵。",

		TURF_DECIDUOUS = "地皮。你正踩在它上面喵。",
		TURF_SANDY = "地皮。你正踩在它上面喵。",
		TURF_BADLANDS = "地皮。你正踩在它上面。",
		TURF_DESERTDIRT = "地皮。你正踩在它上面。",
		TURF_FUNGUS_GREEN = "地皮。你正踩在它上面。",
		TURF_FUNGUS_RED = "地皮。你正踩在它上面。",
		TURF_DRAGONFLY = "这种物质充满了某种天然的阻燃剂。",

        TURF_SHELLBEACH = "地皮。你正踩在它上面。",

		TURF_RUINSBRICK = "地皮。你正踩在它上面。",
		TURF_RUINSBRICK_GLOW = "地皮。你正踩在它上面。",
		TURF_RUINSTILES = "地皮。你正踩在它上面。",
		TURF_RUINSTILES_GLOW = "地皮。你正踩在它上面。",
		TURF_RUINSTRIM = "地皮。你正踩在它上面。",
		TURF_RUINSTRIM_GLOW = "地皮。你正踩在它上面。",

        TURF_MONKEY_GROUND = "地皮。你正踩在它上面喵。",

        TURF_CARPETFLOOR2 = "地皮。你正踩在它上面。",
        TURF_MOSAIC_GREY = "地皮。你正踩在它上面。",
        TURF_MOSAIC_RED = "地皮。你正踩在它上面喵。",
        TURF_MOSAIC_BLUE = "地皮。你正踩在它上面喵。",

        TURF_BEARD_RUG = "噢，天啊……",

		POWCAKE = "农业与工业结合所产生的最伟大成就喵。",
        CAVE_ENTRANCE = "似乎是有人故意把这块岩石放在这里的喵。",
        CAVE_ENTRANCE_RUINS = "通道被堵塞了。",

       	CAVE_ENTRANCE_OPEN =
        {
            GENERIC = "也许我得准备得更充分点喵。",
            OPEN = "地下世界正等着我喵。",
            FULL = "太拥挤了，我不喜欢喵。",
        },
        CAVE_EXIT =
        {
            GENERIC = "可能要过会儿。",
            OPEN = "也许我应该上去呼吸一点新鲜空气。",
            FULL = "和所有那些人一起？这肯定不和谐。",
        },

		MAXWELLPHONOGRAPH = "它好像没有电源。",--single player
		BOOMERANG = "它就是一个扁平的翼片。",
		PIGGUARD = "一位武士喵。",
		ABIGAIL =
		{
            LEVEL1 =
            {
                "Fascinating. Can you speak, specter?",
                "Fascinating. Can you speak, specter?",
            },
            LEVEL2 =
            {
                "Fascinating. Can you speak, specter?",
                "Fascinating. Can you speak, specter?",
            },
            LEVEL3 =
            {
                "Fascinating. Can you speak, specter?",
                "Fascinating. Can you speak, specter?",
            },
        },

		ADVENTURE_PORTAL = "那违反了一些最基本的物理定律。",
		AMULET = "来自另一个时代的遗留物。",
		ANIMAL_TRACK = "动物活动的标志。指向某个方向。",
		ARMORGRASS = "足够多的层数可以带来惊人的效果喵。",
		ARMORMARBLE = "选这种材料来做护甲，有意思。",
		ARMORWOOD = "由一段段木头拼凑而成的粗糙铠甲喵。",
		ARMOR_SANITY = "通过将敌人的攻击转移到另一个次元来提供保护的护甲。",
		ASH =
		{
			GENERIC = "大火之后剩下的一些非水相残留物。",
			REMAINS_GLOMMERFLOWER = "这花似乎已经完全被烧毁了。",
			REMAINS_EYE_BONE = "眼骨似乎已经完全被烧毁了。",
			REMAINS_THINGIE = "这过去应该是个东西，但现在化成了一堆灰烬喵。",
		},
		AXE = "一根杆上连着两个斜面喵。",
		BABYBEEFALO =
		{
			GENERIC = "看他的脸好可爱！（嗯哼！）",
		    SLEEPING = "他在睡觉时甚至是更惹人喜爱了喵。",
        },
        BUNDLE = "至少有人把它捆起来了。",
        BUNDLEWRAP = "为保存食品的抗菌包装喵。",
		BACKPACK = "那个可以带这么多书喵。",
		BACONEGGS = "蓝蛋和培根！",
		BANDAGE = "医用敷料喵。",
		BASALT = "高密度材料！", --removed
		BEARDHAIR = "这是人类的面部毛发。",
		BEARGER = "它是一种犬型亚目动物...除此之外，我一无所知。",
		BEARGERVEST = "不管它以前是什么动物，它的毛皮倒是一件很不错的衣服。",
		ICEPACK = "完美的隔热喵。",
		BEARGER_FUR = "天啊！那东西好厚喵。",
		BEDROLL_STRAW = "我不要睡在地上。",
		BEEQUEEN = "工蜂勇猛地保护她。",
		BEEQUEENHIVE =
		{
			GENERIC = "密集的西方蜜蜂蜂巢喵。",
			GROWING = "西方蜜蜂在建造一个新的蜂巢。",
		},
        BEEQUEENHIVEGROWN = "一个大小不寻常的西方蜜蜂蜂巢喵。",
        BEEGUARD = "西方蜜蜂工人很生气！",
        HIVEHAT = "它正散发出强大的信息素。",
        MINISIGN =
        {
            GENERIC = "一个很棒的图表！非常精确喵。",
            UNDRAWN = "一个画好的图表可以帮助保持东西的整齐性喵。",
        },
        MINISIGN_ITEM = "终于，一个合适的组织工具喵。",
		BEE =
		{
			GENERIC = "西方蜜蜂。长得好大！",
			HELD = "它看起来不高兴喵。",
		},
		BEEBOX =
		{
			READY = "可以在它那里采到蜜。",
			FULLHONEY = "可以在它那里采到蜜喵。",
			GENERIC = "简陋的蜂房喵。",
			NOHONEY = "里面没有蜂蜜。",
			SOMEHONEY = "还没到收获蜂蜜的时候。",
			BURNT = "可怜的蜜蜂！",
		},
		MUSHROOM_FARM =
		{
			STUFFED = "我们应当在它们长过头之前把它们摘下来喵。",
			LOTS = "杰出的真菌产量。",
			SOME = "真菌正在很好地结果。",
			EMPTY = "它首先必须用切好的标本或真菌孢子进行播种。",
			ROTTEN = "腐烂的状态太超前了，没法支持任何标本了喵。",
			BURNT = "被一个发出热量的化学反应所碳化。",
			SNOWCOVERED = "它的生长受到了极度寒冷的阻碍。",
		},
		BEEFALO =
		{
			FOLLOWER = "它似乎一直在跟着我。",
			GENERIC = "它看起来和家牛好像。",
			NAKED = "它看起来好冷。",
			SLEEPING = "它在睡觉。",
            --Domesticated states:
            DOMESTICATED = "驯服的时候，它已经独立于自己的主人。",
            ORNERY = "那个生物已经形成令人讨厌的性格。",
            RIDER = "这个家伙既纤细又健硕喵。",
            PUDGY = "营养充足有助于形成友好的性格。",
            MYPARTNER = "它变得对我十分依赖了喵。",
            DEAD = "它不喘气了喵。",
            DEAD_MYPARTNER = "或许还有办法让它复活……",
		},

		BEEFALOHAT = "这帽子丑死了。",
		BEEFALOWOOL = "从皮弗娄牛身上收获的长毛。",
		BEEHAT = "适当的保护装备是必须的！",
        BEESWAX = "天然抗菌。如果使用合理，就能减缓食品变质。",
		BEEHIVE = "蜜蜂的天然家园喵。",
		BEEMINE = "用蜜蜂填装的危险地雷喵。",
		BEEMINE_MAXWELL = "用蚊子填装的危险地雷。",--removed
		BERRIES = "我想这是一些朱砂根浆果喵。",
		BERRIES_COOKED = "烤朱砂根浆果，只是为了以防万一喵。",
        BERRIES_JUICY = "一种朱砂根浆果变体。水合作用很好喵。",
        BERRIES_JUICY_COOKED = "腐坏一直是个威胁。",
		BERRYBUSH =
		{
			BARREN = "需要给它施点肥。",
			WITHERED = "朱砂根浆果不是特别耐热喵。",
			GENERIC = "是朱砂根浆果丛。",
			PICKED = "浆果会慢慢再长出来的喵。",
			DISEASED = "它得了种农业病，我治不好。",--removed
			DISEASING = "嗯……叶子卷边了喵。",--removed
			BURNING = "烧起来了！",
		},
		BERRYBUSH_JUICY =
		{
			BARREN = "它需要些农艺照顾。",
			WITHERED = "朱砂根变体已经在高温下枯萎了。",
			GENERIC = "那个灌木丛看起来可以丰收了喵。",
			PICKED = "它必须等待。",
			DISEASED = "它得了种农业病，我治不好。",--removed
			DISEASING = "嗯……叶子卷边了。",--removed
			BURNING = "烧起来了！",
		},
		BIGFOOT = "史前怪物！",--removed
		BIRDCAGE =
		{
			GENERIC = "这能安全地关住一只鸟。",
			OCCUPIED = "关住他了。",
			SLEEPING = "嘘！",
			HUNGRY = "他饿了！",
			STARVING = "它看上去有点营养不良。",
			DEAD = "我真的认为它是饿死的。",
			SKELETON = "我猜我可以研究这些骨骼喵。",
		},
		BIRDTRAP = "一种简单的捕鸟拍网喵。",
		CAVE_BANANA_BURNT = "我不相信这东西能复原。",
		BIRD_EGG = "它还没有孵化喵。",
		BIRD_EGG_COOKED = "只要一点烤面包喵。",
		BISHOP = "一位上了发条的神职人员喵。",
		BLOWDART_FIRE = "简易的燃烧装置。",
		BLOWDART_SLEEP = "简易的镇定装置。",
		BLOWDART_PIPE = "简易的发射装置。",
		BLOWDART_YELLOW = "简易电气装置。",
		BLUEAMULET = "这个宝石无论接触到什么东西，似乎都会把它们的能量吸走喵。",
		BLUEGEM = "冰冷的。",
		BLUEPRINT =
		{
            COMMON = "详细的技术图纸。",
            RARE = "这么稀罕且精细的图画！",
        },
        SKETCH = "一个石头雕像的详细的图像。",
		COOKINGRECIPECARD =
		{
			GENERIC = "哦，亲爱的，我似乎无法理解它喵。",
		},
		BLUE_CAP = "它似乎有药用价值喵",
		BLUE_CAP_COOKED = "化学改变了它喵。",
		BLUE_MUSHROOM =
		{
			GENERIC = "它是一种菌类植物。",
			INGROUND = "每天这个时候它会休眠。",
			PICKED = "它需要经过水合作用才能再次结果。",
		},
		BOARDS = "经过粗刨的木板。",
		BONESHARD = "某个生命的残留物。",
		BONESTEW = "虽然和妈妈以前做的不太一样，但闻起来很香！",
		BUGNET = "昆虫学者的工具。",
		BUSHHAT = "完美的伪装。",
		BUTTER = "鳞翅目昆虫的脂肪？",
		BUTTERFLY =
		{
			GENERIC = "五颜六色的鳞翅目昆虫。",
			HELD = "抓住它了喵。",
		},
		BUTTERFLYMUFFIN = "用蝴蝶居然可以做出这么好的烘焙食品，谁知道呢？",
		BUTTERFLYWINGS = "从被抓蝴蝶身上获得的翅膀。",
		BUZZARD = "是美洲鹫，毫无疑问。",

		SHADOWDIGGER = "好吧，我想我们确实需要额外的人手…嗯喵。",
        SHADOWDANCER = "...最近有没有人看望过他？",

		CACTUS =
		{
			GENERIC = "还没完全成熟的桶形仙人掌。",
			PICKED = "艰难的时期就需要采取极端措施喵。",
		},
		CACTUS_MEAT_COOKED = "没有刺，真是太好了。",
		CACTUS_MEAT = "我不确定我处理得对不对。",
		CACTUS_FLOWER = "让我想起了布若斯写的《仙人掌花》。那可是我在图书馆的最爱喵。",

		COLDFIRE =
		{
			EMBERS = "火焰快要自动熄灭了喵。",
			GENERIC = "相当古怪而神奇的火堆。",
			HIGH = "营火正在以惊人的速度燃烧。",
			LOW = "应该再加一些燃料喵。",
			NORMAL = "相当奇异的火喵。",
			OUT = "可以再点燃。",
		},
		CAMPFIRE =
		{
			EMBERS = "火焰快要自动熄灭了。",
			GENERIC = "一处营火。",
			HIGH = "营火正在以惊人的速度燃烧喵。",
			LOW = "应该再加一些燃料。",
			NORMAL = "相当普通的火。",
			OUT = "可以再点燃。",
		},
		CANE = "我不是手杖收藏家。",
		CATCOON = "一种野猫。帅气的家伙喵。",
		CATCOONDEN =
		{
			GENERIC = "适合做窝的中空树桩。",
			EMPTY = "看来是耗竭了喵。",
		},
		CATCOONHAT = "虽然不太像大卫·克洛科特的浣熊皮帽，但也不错了。",
		COONTAIL = "柔软灵活的躯干附属物。",
		CARROT = "胡萝卜。不仅可以吃，而且很美味。",
		CARROT_COOKED = "烤得恰到好处的胡萝卜。",
		CARROT_PLANTED = "胡萝卜是一种根用蔬菜喵。",
		CARROT_SEEDS = "亲爱的，不种下的话它是不能生长的。",
		CARTOGRAPHYDESK =
		{
			GENERIC = "啊！一张合适的书桌！看看那块木材上的蜡喵！",
			BURNING = "我们可以一点得体的东西都没有吗喵？",
			BURNT = "对知识的破坏真是一件难以忍受的事情喵。",
		},
		WATERMELON_SEEDS = "亲爱的，不种下的话它是不能生长的。",
		CAVE_FERN = "令人心情愉悦的观赏植物。",
		CHARCOAL = "主要是碳和灰。",
        CHESSPIECE_PAWN = "寻求权力宝座的兵卒可能会相当危险。",
        CHESSPIECE_ROOK =
        {
            GENERIC = "代表国王的城堡的保护墙。",
            STRUGGLE = "看起来魔法正在准备中。",
        },
        CHESSPIECE_KNIGHT =
        {
            GENERIC = "效力于国王或女王的骑士。",
            STRUGGLE = "看起来魔法正在准备中。",
        },
        CHESSPIECE_BISHOP =
        {
            GENERIC = "一块雕刻成主教象棋棋子的装饰性石头。",
            STRUGGLE = "看起来魔法正在准备中喵。",
        },
        CHESSPIECE_MUSE = "在国际象棋当中，女王是目前为止在战略上最强大的存在。",
        CHESSPIECE_FORMAL = "总的来说，国王是棋盘上每个子的职责所在喵。",
        CHESSPIECE_HORNUCOPIA = "目前普遍认为艺术是来源于生活的。",
        CHESSPIECE_PIPE = "我希望这不会给孩子们带来不好的影响。",
        CHESSPIECE_DEERCLOPS = "对这些奇怪野兽的解剖学研究。",
        CHESSPIECE_BEARGER = "相当具有表现力！",
        CHESSPIECE_MOOSEGOOSE =
        {
            "Bust of Alces canadensis.",
        },
        CHESSPIECE_DRAGONFLY = "艺术家对虚构双翅目生物的演绎。",
		CHESSPIECE_MINOTAUR = "颇有几分神似呢。",
        CHESSPIECE_BUTTERFLY = "参照月蛾的形象雕琢而成喵。",
        CHESSPIECE_ANCHOR = "艺术家就喜欢引用他们熟悉的事物。",
        CHESSPIECE_MOON = "残缺的部分是最近才变成这样的。",
        CHESSPIECE_CARRAT = "完美再现了胡萝卜鼠的神韵喵。",
        CHESSPIECE_MALBATROSS = "我要为 \"世界鸟类大全\"加一笔附录了喵。",
        CHESSPIECE_CRABKING = "展现了一只痴迷宝藏的甲壳动物。",
        CHESSPIECE_TOADSTOOL = "艺术家美丽的捕捉到了这种寄生关系喵。",
        CHESSPIECE_STALKER = "雕塑家忠实还原了它的骨架结构。",
        CHESSPIECE_KLAUS = "把季节的细节刻画的活灵活现。",
        CHESSPIECE_BEEQUEEN = "向西方蜜蜂的女王致敬喵。",
        CHESSPIECE_ANTLION = "豹科火蚁的庄严雕像。",
        CHESSPIECE_BEEFALO = "它把我的皮弗娄牛刻画的栩栩如生喵。",
		CHESSPIECE_KITCOON = "我应该警告孩子们玩耍时不要离它太近。",
		CHESSPIECE_CATCOON = "与亚非野猫的相似程度令人称奇。",
        CHESSPIECE_MANRABBIT = "这些兔类动物很调皮捣蛋。",
        CHESSPIECE_GUARDIANPHASE3 = "我想特别表扬一下艺术家的细节呈现喵。",
        CHESSPIECE_EYEOFTERROR = "这个战利品可以用作解剖学模型喵。",
        CHESSPIECE_TWINSOFTERROR = "用石材表达出了机械奇迹的神韵。",
        CHESSPIECE_DAYWALKER = "那个行为不端的生物的精确石制模型。",
        CHESSPIECE_DAYWALKER2 = "得承认它有些机智。但究其本质，仍旧是莽夫一名。",
        CHESSPIECE_DEERCLOPS_MUTATED = "如此奇特狰狞的痛苦喵……",
        CHESSPIECE_WARG_MUTATED = "关于这头野兽，我还有很多不明白的地方喵。",
        CHESSPIECE_BEARGER_MUTATED = "艺术家真实地捕捉到了它的凶猛喵！",
        CHESSPIECE_SHARKBOI = "它是同类中嘴巴最毒的。",
        CHESSPIECE_WORMBOSS = "这种掠食性环节动物的祖先才是真正的可怕。",
        CHESSPIECE_YOTS = "这是最饥饿的大型无脊椎动物之一喵。",
        CHESSPIECE_WAGBOSS_ROBOT = "杀人机器人的微缩模型。嗯喵。",
        CHESSPIECE_WAGBOSS_LUNAR = "此等可怕的融合是前所未有的。",
        CHESSPIECE_YOTH = "这名机械骑士会效忠于任何穿上其守护对象的衣服的人。",
        CHESSPIECE_VAULT_PILLAR_GUARD = "事实证明，它是古代建筑学的一项奇迹。",
        CHESSPIECE_BATBOSS_SHADOW = "受诅咒的形态并未影响它对鲜血的渴求喵。",
        CHESSPIECE_ROCKYBOSS_SHADOW = "无论哪种形态，都极具破坏力且致命。",
        CHESSPIECE_WORMBOSS_SHADOW = "一种食欲永无止境的生物。",
        CHESSPIECE_CHARLIE_BOSS = "看来她的所得远超她的预料。",
        CHESSPIECE_SHROUDEN = "它究竟能否被彻底消灭？",

        CHESSJUNK1 = "魔术师未完成的项目？",
        CHESSJUNK2 = "魔术师未完成的项目喵？",
        CHESSJUNK3 = "魔术师未完成的项目喵？",
		CHESTER = "一个能到处跑的储物箱。",
		CHESTER_EYEBONE =
		{
			GENERIC = "神秘的眼睛。",
			WAITING = "这个眼睛毫无生气。",
		},
		COOKEDMANDRAKE = "本着探索精神而做成的烤曼德拉草。",
		COOKEDMEAT = "烤熟后味道会更好一点。",
		COOKEDMONSTERMEAT = "还是会有一点毒性。",
		COOKEDSMALLMEAT = "烤熟后味道会更好一点。",
		COOKPOT =
		{
			COOKING_LONG = "还要等一会儿才能煮好。",
			COOKING_SHORT = "快好了喵！",
			DONE = "晚餐时间到！",
			EMPTY = "没有烹饪东西的时候，它看起来就像是废弃了一样喵。",
			BURNT = "现在它是真正的废弃了。",
		},
		CORN = "玉米，一种很好的主食喵。",
		CORN_COOKED = "爆开了的玉米！",
		CORN_SEEDS = "亲爱的，不种下的话它是不能生长的喵。",
        CANARY =
		{
			GENERIC = "金丝雀。历史有益的哨兵物种喵。",
			HELD = "金丝雀。我们不应不带一只金丝雀就进洞穴。",
		},
        CANARY_POISONED = "噢，天啊。",

		CRITTERLAB = "筑巢动物的完美洞穴。",
        CRITTER_GLOMLING = "你是怎么保持飞行的，亲爱的？",
        CRITTER_DRAGONLING = "多么惹人喜爱的双翅目少年啊！",
		CRITTER_LAMB = "我可以把那张脸挤扁。",
        CRITTER_PUPPY = "谁是最亲爱的那头小狼喵？",
        CRITTER_KITTEN = "现在它有个家了。",
        CRITTER_PERDLING = "你是一只多么好看的小火鸡啊！",
		CRITTER_LUNARMOTHLING = "谁最疼小标本呢喵？",
        CRITTER_BULBIN = "你算动物还是植物呢，亲爱的喵？",
        CRITTER_EETS = "它似乎偏好蛋糕之类的甜食喵。",

		CROW =
		{
			GENERIC = "短嘴鸦喵。",
			HELD = "非常帅气的标本。",
		},
		CUTGRASS = "一些割下来的草喵。",
		CUTREEDS = "一些割下来的灯芯草属植物喵。",
		CUTSTONE = "一些磨得非常光滑的石头方块。",
		DEADLYFEAST = "我不确定那东西吃了好不好。", --unimplemented
		DEER =
		{
			GENERIC = "它已经为暖和的季节脱落了自己的鹿角。",
			ANTLER = "它的鹿角正在为冬天而生长。",
		},
        DEER_ANTLER = "它看起来像把钥匙，但非常脆弱。",
        DEER_GEMMED = "那可怜的生物已经被强制性地融合到一颗魔法宝石中了。",
		DEERCLOPS = "劳亚兽！",
		DEERCLOPS_EYEBALL = "我有一种难以名状的成就感。",
		EYEBRELLAHAT =	"眼角膜一定很防水喵。",
		DEPLETED_GRASS =
		{
			GENERIC = "一丛禾草喵。",
		},
        GOGGLESHAT = "我不能想象这些能提高能见度喵。",
        DESERTHAT = "比老花镜效率高多了。",
        ANTLIONHAT = "有了它造景就方便多了。",
DEVTOOL = "It smells of bacon!",
DEVTOOL_NODEV = "I'm not strong enough to wield it喵.",
		DIRTPILE = "太不卫生了！",
		DIVININGROD =
		{
			COLD = "上面的圆盘只是微微在动。", --singleplayer
			GENERIC = "一种采用了魔法技术的探测装置。", --singleplayer
			HOT = "就是这里喵！", --singleplayer
			WARM = "这当然是正确的路喵。", --singleplayer
			WARMER = "越来越近了喵。", --singleplayer
		},
		DIVININGRODBASE =
		{
			GENERIC = "它需要修理，才能用。", --singleplayer
			READY = "现在只需要一把钥匙了喵。", --singleplayer
			UNLOCKED = "啊哈。功能之美。", --singleplayer
		},
		DIVININGRODSTART = "这个法杖会很有用喵！", --singleplayer
		DRAGONFLY = "它是双翅目昆虫的某种神秘变异体喵。",
		ARMORDRAGONFLY = "真是令人眼花缭乱的护甲！",
		DRAGON_SCALES = "昆虫身上的鳞片？真是前所未闻！",
		DRAGONFLYCHEST =
		{
			GENERIC = "鳞片！鳞片才是最终的胜利者！",
            UPGRADED_STACKSIZE = "一个防火箱子，内部空间大得惊人。",
		},
		DRAGONFLYFURNACE =
		{
			HAMMERED = "嗯，那是改变的一个有趣的选择喵。",
			GENERIC = "一个非常有用的魔法驱动的火炉。", --no gems
			NORMAL = "目前它正在以一半的强度燃烧。", --one gem
			HIGH = "两颗宝石的魔法让它以最大的强度燃烧喵。", --two gems
		},

        HUTCH = "万古地下演变，变成了这个恶心的畸形怪。",
        HUTCH_FISHBOWL =
        {
            GENERIC = "红腹鱼。",
            WAITING = "嗜血鱼喵。",
        },
		LAVASPIT =
		{
			HOT = "它喷出的火很像熔岩喵。",
			COOL = "它已经冷却下来了，就跟玄武岩一样喵。",
		},
		LAVA_POND = "熔化的石头。最好不要靠得太近。",
		LAVAE = "我相信它是一只龙蝇幼虫。",
		LAVAE_COCOON = "我会说那是驯化的好机会喵。",
		LAVAE_PET =
		{
			STARVING = "这个生物需要立即进食喵！",
			HUNGRY = "这个生物饿了。",
			CONTENT = "我得承认它相当迷人。",
			GENERIC = "一只健康的幼小岩浆虫。",
		},
		LAVAE_EGG =
		{
			GENERIC = "一个大的多黄蛋喵。",
		},
		LAVAE_EGG_CRACKED =
		{
			COLD = "这个蛋的温度低于理想温度喵。",
			COMFY = "这个蛋处于合适的孵化温度。",
		},
		LAVAE_TOOTH = "爬虫宝宝为了从蛋中破壳而出而使用的牙齿。",

		DRAGONFRUIT = "量天尺属火龙果。",
		DRAGONFRUIT_COOKED = "精心制作的量天尺属火龙果喵。",
		DRAGONFRUIT_SEEDS = "亲爱的，不种下的话它是不能生长的。",
		DRAGONPIE = "我喜欢不错的水果派。",
		DRUMSTICK = "禽类的腿。",
		DRUMSTICK_COOKED = "虽然不是特别健康，但它真的是太美味了！",
		DUG_BERRYBUSH = "它需要土壤才能生长喵。",
		DUG_BERRYBUSH_JUICY = "它需要土壤才能生长。",
		DUG_GRASS = "它需要土壤才能生长。",
		DUG_MARSH_BUSH = "它需要土壤才能生长喵。",
		DUG_SAPLING = "它需要土壤才能生长喵。",
		DURIAN = "啊哈，榴莲。它闻起来真的很臭。",
		DURIAN_COOKED = "烤熟之后的气味显然也不好闻。",
		DURIAN_SEEDS = "亲爱的，不种下的话它是不能生长的。",
		EARMUFFSHAT = "可怜的兔兔。至少它很暖和。",
		EGGPLANT = "一个茄属植物。特别是，矮瓜。",
		EGGPLANT_COOKED = "请享用：红烧茄子。",
		EGGPLANT_SEEDS = "亲爱的，不种下的话它是不能生长的喵。",

		ENDTABLE =
		{
			BURNT = "好吧，不过如此。",
			GENERIC = "除此之外，看到一个小装饰品是令人愉快的喵。",
			EMPTY = "啊，可以用一张小垫补，你不是说这样吗？",
			WILTED = "真遗憾。我们要找替代品吗？",
			FRESHLIGHT = "在我看来，光越亮，读起来越轻松。",
			OLDLIGHT = "轮到麦斯威尔获得灯泡了。我这里有记录。", -- will be wilted soon, light radius will be very small at this point
		},
		DECIDUOUSTREE =
		{
			BURNING = "树在燃烧喵。",
			BURNT = "完全被碳化了的树喵。",
			CHOPPED = "它已经被砍伐了。",
			POISON = "我以前从没见过这种树！",
			GENERIC = "某种壳斗目植物。长大后会结出果实。",
		},
		ACORN = "包裹在果皮里的落叶植物种子喵。",
        ACORN_SAPLING = "快要成熟的落叶植物种子。",
		ACORN_COOKED = "已经用它们成功地制出了毒药。",
		BIRCHNUTDRAKE = "快跑——喵！",
		EVERGREEN =
		{
			BURNING = "树在燃烧。",
			BURNT = "完全被碳化了的树。",
			CHOPPED = "它已经被砍伐了。",
			GENERIC = "一棵普通的针叶树。",
		},
		EVERGREEN_SPARSE =
		{
			BURNING = "树在燃烧。",
			BURNT = "完全被碳化了的树。",
			CHOPPED = "它已经被砍伐了。",
			GENERIC = "这个物种似乎缺乏繁殖能力喵。",
		},
		TWIGGYTREE =
		{
			BURNING = "树在燃烧。",
			BURNT = "完全被碳化了的树。",
			CHOPPED = "它已经被砍伐了。",
			GENERIC = "这个物种生长木材和柔韧的小枝。很有用。",
			DISEASED = "它得了种农业病，我治不好。", --unimplemented
		},
		TWIGGY_NUT_SAPLING = "它快速长成一棵可爱的小树。",
        TWIGGY_OLD = "砍掉那个老东西会浪费时间和资源。",
		TWIGGY_NUT = "包裹在成熟球果中的种子。",
		EYEPLANT = "我相信它们肯定被更大的植物控制着喵。",
		INSPECTSELF = "我是不是老化得像上等的智能酒？",
		FARMPLOT =
		{
			GENERIC = "一小片耕地。",
			GROWING = "植物正在从地里吸取矿物养分。",
			NEEDSFERTILIZER = "它已经因为缺乏养分而变成了贫瘠之地。",
			BURNT = "它再也长不出农作物了喵。",
		},
		FEATHERHAT = "虽然不是真正的东西，但也许能够骗过一些鸟。",
		FEATHER_CROW = "乌鸦科还是海雀科的羽毛喵？",
		FEATHER_ROBIN = "北美红雀的羽毛喵。",
		FEATHER_ROBIN_WINTER = "它看起来像北美红雀的羽毛，只是它是白色的。",
		FEATHER_CANARY = "金丝雀的羽毛。",
		FEATHERPENCIL = "哦，我多么想念合适的书写用具喵！",
        COOKBOOK = "烹调智慧的集锦。",
		FEM_PUPPET = "可怜的丫头。", --single player
		FIREFLIES =
		{
			GENERIC = "每当我走近时它们就会散开。",
			HELD = "它们那会发光的身体也许会有用。",
		},
		FIREHOUND = "那只猎犬比其他的都危险。",
		FIREPIT =
		{
			EMBERS = "火焰快要自动熄灭了。",
			GENERIC = "一处火坑。",
			HIGH = "营火正在以惊人的速度燃烧喵。",
			LOW = "应该再加一些燃料。",
			NORMAL = "相当普通的火喵。",
			OUT = "可以再点燃。",
		},
		COLDFIREPIT =
		{
			EMBERS = "火焰快要自动熄灭了。",
			GENERIC = "一处火坑。冒着寒气喵。",
			HIGH = "营火正在以惊人的速度燃烧喵。",
			LOW = "应该再加一些燃料，无论燃料是什么。",
			NORMAL = "一处营火。对，某种形式的营火喵。",
			OUT = "可以再点燃。",
		},
		FIRESTAFF = "某种能投掷火焰的奇妙装置喵。",
		FIRESUPPRESSOR =
		{
			ON = "雪球发射！",
			OFF = "这儿什么也没有。",
			LOWFUEL = "燃料不足。",
		},

		FISH = "我猜应该是某种白鲑鱼喵。",
		FISHINGROD = "我已经读过了所有关于钓鱼的知识。这对我来说应该是小菜一碟喵。",
		FISHSTICKS = "给我一点塔塔酱，那我简直可以说是身在天堂。",
		FISHTACOS = "我个人喜欢在鱼肉上加点香料喵。",
		FISH_COOKED = "烤得真好。",
		FLINT = "一块坚硬的石英矿石喵。",
		FLOWER =
		{
            GENERIC = "是一种野花。我不太熟悉这个物种。",
            ROSE = "啊，是玫瑰…它在这里做什么喵？",
        },
        FLOWER_WITHERED = "这朵花缺乏生长所需的养分。",
		FLOWERHAT = "好欢乐喵。",
		FLOWER_EVIL = "像这样拥有强大灵气的花可不是很常见。",
		FOLIAGE = "这些东西也许有点营养价值。",
		FOOTBALLHAT = "近身战斗时使用的保护装备。",
        FOSSIL_PIECE = "埋葬处理所保存的变硬的遗骸。",
        FOSSIL_STALKER =
        {
			GENERIC = "还有骨架碎片需要组合起来喵。",
			FUNNY = "古生物学的无能给生物捏造了一个悲哀的借口喵。",
			COMPLETE = "哦！适合图书馆的标本！",
        },
        STALKER = "一个需要改正的错误。",
        STALKER_ATRIUM = "我们可以从对方身上学到很多喵。",
        STALKER_MINION = "织布工正在编织作品。",
        THURIBLE = "我们是它的计划接收者喵。",
        ATRIUM_OVERGROWTH = "破解译文需要太长的时间。",
		FROG =
		{
			DEAD = "这在某些国家可是一道上品佳肴。",
			GENERIC = "一种两栖四足动物。",
			SLEEPING = "它在睡觉。",
		},
		FROGGLEBUNWICH = "把它看做一个三明治很好玩。",
		FROGLEGS = "它们还在抽搐。",
		FROGLEGS_COOKED = "就像鸡翅一样喵。",
		FRUITMEDLEY = "水果搭配得真好喵！",
		FURTUFT = "熊獾的毛皮喵。",
		GEARS = "各种齿轮和轮子喵。",
		GHOST = "肯定是假的。我才不相信呢。",
		GOLDENAXE = "黄金是最具可塑性的金属，不过我们还是先看看它砍树的效果吧。",
		GOLDENPICKAXE = "黄金是最具可塑性的金属，不过我们还是先看看它挖矿的效果吧。",
		GOLDENPITCHFORK = "黄金是最具可塑性的金属，不过我们还是先看看它松土的效果吧喵。",
		GOLDENSHOVEL = "黄金是最具可塑性的金属，不过我们还是先看看它挖掘的效果吧喵。",
		GOLDNUGGET = "一小块金子。原子数79喵。",
		GRASS =
		{
			BARREN = "它需要施肥。",
			WITHERED = "天气太炎热了，它会死的。",
			BURNING = "烧起来了喵！",
			GENERIC = "一丛禾草茎秆喵。",
			PICKED = "我想它会重新长出来的喵。",
			DISEASED = "它得了种农业病，我治不好喵。", --unimplemented
			DISEASING = "嗯……这里有一些污点。", --unimplemented
		},
		GRASSGEKKO =
		{
			GENERIC = "我之前从未遇到过这一物种，它看起来无害。",
			DISEASED = "它好像被不知名的细菌感染了。", --unimplemented
		},
		GREEN_CAP = "看上去可以吃，尽管吃掉它可能不是很理智的做法。",
		GREEN_CAP_COOKED = "化学改变了它喵。",
		GREEN_MUSHROOM =
		{
			GENERIC = "它是一种菌类植物喵。",
			INGROUND = "每天这个时候它会休眠。",
			PICKED = "它需要补充水分才能再次结果。",
		},
		GUNPOWDER = "知识就是力量！",
		HAMBAT = "这可能不是最有效的资源使用。",
		HAMMER = "工人用的工具。",
		HEALINGSALVE = "天然消毒剂喵。",
		HEATROCK =
		{
			FROZEN = "它的温度已经降到冰点以下了。",
			COLD = "它变得有点冷了。",
			GENERIC = "这点温度不行啊。",
			WARM = "它还有热量，但只有一点点喵。",
			HOT = "它已经足够暖和，能发出光和热喵！",
		},
		HOME = "休息放松的好地方。",
		HOMESIGN =
		{
			GENERIC = "导航辅助标志，表明“你在这里”。",
            UNWRITTEN = "指路的好机会。",
			BURNT = "现在可没太大的帮助了。",
		},
		ARROWSIGN_POST =
		{
			GENERIC = "导航帮助。“那个方向。”",
            UNWRITTEN = "提供指示方向的机会。",
			BURNT = "现在可没有太大的帮助了喵。",
		},
		ARROWSIGN_PANEL =
		{
			GENERIC = "导航帮助。“那个方向。”",
            UNWRITTEN = "提供指示方向的机会。",
			BURNT = "现在可没有太大的帮助了喵。",
		},
		HONEY = "甜甜的植物花蜜。",
		HONEYCOMB = "用来保存蜂蜜的蜂蜡喵。",
		HONEYHAM = "蜂蜜是在做这个美味火腿时唯一用到的甜味剂。",
		HONEYNUGGETS = "一口一块的甜肉！",
		HORN = "好棒的标本！我几乎可以听到皮弗娄牛在叫喵。",
		HOUND = "那只猎犬没有被驯服。",
		HOUNDCORPSE =
		{
			GENERIC = "尽快处理掉尸体符合我们的核心利益。",
			BURNING = "这下应该可以阻止更多的不幸了喵。",
			REVIVING = "难以置信，竟然在我眼前复活了喵。",
		},
		HOUNDBONE = "是灰狼的内骨骼，绝对不是家犬的喵。",
		HOUNDMOUND = "那些骨头是不祥之兆喵。",
		ICEBOX = "简陋的热交换机。",
		ICEHAT = "完美的一块冰。",
		ICEHOUND = "好奇怪的寒冰野兽。",
		INSANITYROCK =
		{
			ACTIVE = "这肯定是幻觉。",
			INACTIVE = "它看起来像个小金字塔。",
		},
		JAMMYPRESERVES = "我希望能有点吐司，然后把果酱涂在上面吃。哦，想想就好美味。",

		KABOBS = "是肉串，接下来是什么喵？",
		KILLERBEE =
		{
			GENERIC = "它的毒性尤其高喵。",
			HELD = "它看起来不高兴。",
		},
		KNIGHT = "一匹自动马喵。",
		KOALEFANT_SUMMER = "长鼻目考拉象喵。",
		KOALEFANT_WINTER = "顶着厚厚的御寒毛皮的长鼻目考拉象喵。",
		KOALEFANT_CARCASS = "该生物已过期。",
		KRAMPUS = "它是神话中的圣诞怪物喵。",
		KRAMPUS_SACK = "它似乎比看起来能装。",
		LEIF = "我...甚至不知道有这种东西存在。",
		LEIF_SPARSE = "我...甚至不知道有这种东西存在喵。",
		LIGHTER  = "哈，生火的机械工具。真有用。",
		LIGHTNING_ROD =
		{
			CHARGED = "辐射电能！",
			GENERIC = "高度导电！",
		},
		LIGHTNINGGOAT =
		{
			GENERIC = "一种喜欢电的野山羊变种喵。",
			CHARGED = "简直是闪电的忠实粉丝。",
		},
		LIGHTNINGGOATHORN = "羊角里面肯定有某种非自然的东西。",
		GOATMILK = "好诱人喵！",
		LITTLE_WALRUS = "小家伙没有那么强的攻击性。",
		LIVINGLOG = "这块木头很特别喵。",
		LOG =
		{
			BURNING = "砍下的一段树干。烧着了。",
			GENERIC = "砍下的一段树干喵。",
		},
		LUCY = "一把外观完美的斧子喵。",
		LUREPLANT = "一个具有攻击性的物种。",
		LUREPLANTBULB = "现在它可以种在任何地方。",
		MALE_PUPPET = "可怜的孩子。", --single player

		MANDRAKE_ACTIVE = "曼德拉草。但是长着一张脸。",
		MANDRAKE_PLANTED = "曼德拉草。",
		MANDRAKE = "曼德拉草。已经死了。",

        MANDRAKESOUP = "本着探索精神而做成的曼德拉草汤。",
        MANDRAKE_COOKED = "本着探索精神而做成的烤曼德拉草。",
        MAPSCROLL = "对某些人而言，看到空白页简直会造成瘫痪。",
        MARBLE = "一块纹路优美的石头。",
        MARBLEBEAN = "从乔木学的角度看，大理石的生长是不可能的。",
        MARBLEBEAN_SAPLING = "我相信它是多年生植物喵。",
        MARBLESHRUB = "对灌木修剪法来说并不理想喵。",
        MARBLEPILLAR = "它显示出罗马工匠的记忆。太了不起了喵。",
        MARBLETREE = "不可思议。一棵完全由大理石做成的树喵。",
        MARSH_BUSH =
        {
			BURNT = "全烧了。",
            BURNING = "烧起来了！",
            GENERIC = "一簇荆棘喵。",
            PICKED = "采摘荆棘是很危险的喵。",
        },
        BURNT_MARSH_BUSH = "化为灰烬。",
        MARSH_PLANT = "扎根在沼泽中的地下茎植物喵。",
        MARSH_TREE =
        {
            BURNING = "烧起来了喵！",
            BURNT = "一棵碳化了的红树。",
            CHOPPED = "它已经被砍倒了。",
            GENERIC = "一棵美洲红树。",
        },
        MAXWELL = "赶快从那里下来！",--single player
        MAXWELLHEAD = "我希望他不会那样做喵。",--removed
        MAXWELLLIGHT = "太神奇了！",--single player
        MAXWELLLOCK = "现在我只需要一把钥匙喵。",--single player
        MAXWELLTHRONE = "一张令人生畏的椅子。",--single player
        MEAT = "这个不适合生吃，但是我们别无选择喵…",
        MEATBALLS = "一堆经过加工的肉。天晓得里面放了什么东西。",
        MEATRACK =
        {
            DONE = "这个过程已经完成了。",
            DRYING = "脱水是一个缓慢的过程。",
            DRYINGINRAIN = "下雨让脱水过程暂停了喵。",
            GENERIC = "它可以使肉脱水。",
            BURNT = "它似乎并不是很牢固。",
            DONE_NOTMEAT = "这个过程已经完成了喵。",
            DRYING_NOTMEAT = "脱水是一个缓慢的过程喵。",
            DRYINGINRAIN_NOTMEAT = "下雨让脱水过程暂停了。",
        },
        MEAT_DRIED = "虽然有点咸，但还是很令人满意。",
        MERM = "一只双鱼座的两足动物！",
        MERMHEAD =
        {
            GENERIC = "我不确定它是腐烂了还是发酵了。",
            BURNT = "这下它既不会腐烂也不会发酵了。",
        },
        MERMHOUSE =
        {
            GENERIC = "很明显已经残破了。",
            BURNT = "比残破还要惨。",
        },
        MINERHAT = "这会成为一个很好的阅读灯。",
        MONKEY = "它们身上的味道真难闻。",
        MONKEYBARREL = "这似乎是某些灵长类动物的家喵。",
        MONSTERLASAGNA = "无论是不是千层饼，吃它都是有害处的。",
        FLOWERSALAD = "好营养！",
        ICECREAM = "一本书和一碗冰淇淋，没有比这更好的东西了。",
        WATERMELONICLE = "西瓜完全包裹在了冰格里面喵。",
        TRAILMIX = "嗯，天然的美味！",
        HOTCHILI = "辣椒让我消化不良。",
        GUACAMOLE = "在图书馆搞研究的日子里，我经常做鳄梨酱。",
        MONSTERMEAT = "吃这个是有害的。",
        MONSTERMEAT_DRIED = "虽然有点咸，但还是很令人满意。",
        MOOSE = "我称它为驼鹿属加拿大黑雁。",
        MOOSE_NESTING_GROUND = "有一天，我可能会想要研究它的求偶习惯。",
        MOOSEEGG = "太不可思议了喵！",
        MOSSLING = "我想那应该和我预期的差不多。",
        FEATHERFAN = "它会带来很强的气流喵！",
        MINIFAN = "它的空气动力学原理令人不可思议。",
        GOOSE_FEATHER = "好柔软的羽毛！它使我希望我能睡着。",
        STAFF_TORNADO = "没见过把风向标当成武器的。",
        MOSQUITO =
        {
            GENERIC = "一只饥渴难耐的雌性吸血蚊。",
            HELD = "它被安全储存起来了。",
        },
        MOSQUITOSACK = "蚊子的胃，里面装满了血喵。",
        MOUND =
        {
            DUG = "一座被亵渎的墓冢喵。",
            GENERIC = "一座墓冢。",
        },
        NIGHTLIGHT = "发出奇异的冷光。",
        NIGHTMAREFUEL = "灵质残渣。",
        NIGHTSWORD = "可穿越不同次元的武器。",
        NITRE = "又称为硝酸钾。",
        ONEMANBAND = "对传统管乐器和小鼓的很好改进喵。",
        OASISLAKE =
		{
			GENERIC = "它可以支持小型的生态系统。",
			EMPTY = "或许现在是湖的枯水期。",
		},
        PANDORASCHEST = "可以装其他文物的文物。",
        PANFLUTE = "可以产生谐波共振的中空芦苇。",
        PAPYRUS = "由纤维素和木质素构成的薄片制品。",
        WAXPAPER = "现在我们只需要绳索来把它绑在固定的地方喵。",
        PENGUIN = "好绅士的鸟。",
        PERD = "讨厌的火鸡，你离那些浆果远点！",
        PEROGIES = "很好吃的饺子，口味很温和。",
        PETALS = "现在它是些令人愉悦的百花香。",
        PETALS_EVIL = "有意思，这些花瓣似乎有自己的思想。",
        PHLEGM = "那团凝固的黏液仍保持着黏黏的质地。",
        PICKAXE = "专门用来凿岩石的斧子。",
        PIGGYBACK = "只有在需要它时才会爱上的一张脸喵。",
        PIGHEAD =
        {
            GENERIC = "咳，棍子上插了颗猪头。",
            BURNT = "棍子插了颗猪头，后来被烧毁了。哎呀喵！",
        },
        PIGHOUSE =
        {
            FULL = "我很好奇他们在里面都干些什么。",
            GENERIC = "这些猪人在建筑方面的品味真不咋地。",
            LIGHTSOUT = "真是太没礼貌了。",
            BURNT = "房子没有装防火系统。",
        },
        PIGKING = "他好像是这个村庄的老大。",
        PIGMAN =
        {
            DEAD = "别担心，里面还有很多。",
            FOLLOWER = "他似乎和我有密不可分的关系。",
            GENERIC = "它是半傻的两足猪。",
            GUARD = "它好像是个守卫喵。",
            WEREPIG = "它是有变兽妄想症的猪人喵。",
        },
        PIGSKIN = "半傻的两足猪的臀部。",
        PIGTENT = "真脏喵。",
        PIGTORCH = "我很好奇它是靠什么提供燃料的喵。",
        PINECONE = "包裹在成熟球果中的针叶树种子喵。",
        PINECONE_SAPLING = "快要成熟的针叶树种子。",
        LUMPY_SAPLING = "可能这个物种能够长出新枝喵。",
        PITCHFORK = "它的设计很适合用来松土。",
        PLANTMEAT = "这种植物会产生一种口感像肉的物质。",
        PLANTMEAT_COOKED = "这看起来吃起来安全多了。",
        PLANT_NORMAL =
        {
            GENERIC = "这是...植物。对，某种植物喵。",
            GROWING = "还没到收获的时候。",
            READY = "它看起来已经成熟了喵。",
            WITHERED = "它没能耐住高温。",
        },
        POMEGRANATE = "是石榴。水分足又酸酸甜甜的石榴。",
        POMEGRANATE_COOKED = "烤熟了的石榴真好吃喵。",
        POMEGRANATE_SEEDS = "亲爱的，不种下的话它是不能生长的喵。",
        POND = "小而深的淡水池塘。",
        POOP = "一些动物粪便。臭死了。",
        FERTILIZER = "一桶动物粪便。好刺鼻。",
        PUMPKIN = "美洲南瓜。",
        PUMPKINCOOKIE = "南瓜饼干，太好了喵！",
        PUMPKIN_COOKED = "烤南瓜。又软又甜，很好吃。",
        PUMPKIN_LANTERN = "雕刻南瓜灯真是个不错的消遣方式喵。",
        PUMPKIN_SEEDS = "亲爱的，不种下的话它是不能生长的。",
        PURPLEAMULET = "我几乎可以感觉到它在召唤什么东西。",
        PURPLEGEM = "它发出的光有点奇怪喵。",
        RABBIT =
        {
            GENERIC = "它是某种兔类动物。带角的那种。",
            HELD = "拥有可爱小角的兔类动物。",
        },
        RABBITHOLE =
        {
            GENERIC = "看起来像小动物的窝。",
            SPRING = "希望那下面的兔类动物安然无恙！",
        },
        RAINOMETER =
        {
            GENERIC = "行动前先测量一下。",
            BURNT = "已经烧得只剩外壳了，再也不能测量了。",
        },
        RAINCOAT = "完全不会渗水。",
        RAINHAT = "我讨厌发髻湿漉漉的喵。",
        RATATOUILLE = "尼斯沙拉，好营养！",
        RAZOR = "个人卫生用品。",
        REDGEM = "很暖和。",
        RED_CAP = "红色通常表示有毒喵。",
        RED_CAP_COOKED = "化学改变了它。",
        RED_MUSHROOM =
        {
            GENERIC = "它是一种菌类植物。",
            INGROUND = "每天这个时候它会休眠喵。",
            PICKED = "它需要经过水合作用才能再次结果。",
        },
        REEDS =
        {
            BURNING = "烧起来了！",
            GENERIC = "一簇灯芯草科禾草喵。",
            PICKED = "我相信它们会重新长出来的。",
        },
        RELIC = "岁月变迁中被遗忘的古代文明遗迹。",
        RUINS_RUBBLE = "只需要下一点点功夫，就可以把它弄得井井有条。",
        RUBBLE = "看来要使用图书馆里用的厚浆糊喵！",
        RESEARCHLAB =
        {
            GENERIC = "是个研究站。我可以用它来学习新东西。",
            BURNT = "我没法用已经碳化了的研究站来学习东西。",
        },
        RESEARCHLAB2 =
        {
            GENERIC = "是个研究站。我可以用它来学习新东西。",
            BURNT = "我没法用已经碳化了的研究站来学习东西喵。",
        },
        RESEARCHLAB3 =
        {
            GENERIC = "也许我玩的太过火了喵。",
            BURNT = "这是某种征兆。",
        },
        RESEARCHLAB4 =
        {
            GENERIC = "我猜那顶帽子是用来从空气中收集能量的喵。",
            BURNT = "它再也没法收集能量了。",
        },
        RESURRECTIONSTATUE =
        {
            GENERIC = "真是异教徒的作风。",
            BURNT = "它已经被毁灭了喵。",
        },
        RESURRECTIONSTONE = "那块石头具有复活的力量。",
        ROBIN =
        {
            GENERIC = "北美红雀！好漂亮的羽毛喵。",
            HELD = "这个小家伙将是我的朋友。",
        },
        ROBIN_WINTER =
        {
            GENERIC = "北美红雀的冬衣？好奇特喵！",
            HELD = "真是楚楚可怜。",
        },
        ROBOT_PUPPET = "可怜的孩子喵。", --single player
        ROCK_LIGHT =
        {
            GENERIC = "上面被封住的熔岩坑。",--removed
            OUT = "现在只是一座火成岩而已。",--removed
            LOW = "冷却过程开始了。",--removed
            NORMAL = "太烫了，不能摸。",--removed
        },
        CAVEIN_BOULDER =
        {
            GENERIC = "它看起来好像可以移动喵。",
            RAISED = "我们必须首先清理周围的岩石。",
        },
        ROCK = "一块巨大的沉积岩喵。",
        PETRIFIED_TREE = "应该有益于某种不错的建筑材料。",
        ROCK_PETRIFIED_TREE = "应该有益于某种不错的建筑材料。",
        ROCK_PETRIFIED_TREE_OLD = "应该有益于某种不错的建筑材料喵。",
        ROCK_ICE =
        {
            GENERIC = "一小块高密度的冰矿喵。",
            MELTED = "一定是因为它体积太小了，所以才会融化。",
        },
        ROCK_ICE_MELTED = "一定是因为它体积太小了，所以才会融化。",
        ICE = "固态的水。",
        ROCKS = "一把零碎的石头。",
        ROOK = "一座上了发条的城堡喵。",
        ROPE = "一根短而结实的麻绳。",
        ROTTENEGG =
        {
            GENERIC = "真倒胃口。",
--fallback to speech_wilson.lua             CAN_PROCESS = "only_used_by_wx78",
        },
        ROYAL_JELLY = "在野外，这会产生更多的女王。",
        JELLYBEAN = "糖果，被蜂蜡所乳化。",
        SADDLE_BASIC = "用于马术的粗糙装置。",
        SADDLE_RACE = "这装饰的触角摸起来很舒服喵。",
        SADDLE_WAR = "将军和各类军阀喜欢的位置。",
        SADDLEHORN = "一个强有力的卸下装备的装置。",
        SALTLICK = "一块用于引诱野兽的食盐。",
        BRUSH = "微观倒钩可以进行光学头发检索喵。",
		SANITYROCK =
		{
			ACTIVE = "很有意思。以后我得研究一下这些标记喵。",
			INACTIVE = "它似乎陷到土里去了喵。",
		},
		SAPLING =
		{
			BURNING = "烧起来了！",
			WITHERED = "高温已经让它快不行了喵。",
			GENERIC = "是一棵小树喵。",
			PICKED = "真奇怪。我本来以为那会杀死它的。",
			DISEASED = "它得了种农业病，我治不好喵。", --removed
			DISEASING = "嗯……看起来比平常还没用喵。", --removed
		},
   		SCARECROW =
   		{
			GENERIC = "啊，太好了。不会再出现把衣服挂在树枝上，衣服变得皱巴巴这种事了喵。",
			BURNING = "嗯……我猜它易燃性很高喵。",
			BURNT = "遗憾。他是这样欢乐的家伙。",
   		},
   		SCULPTINGTABLE=
   		{
			EMPTY = "陶瓷生产的一套方法。我们莫名其妙地把它用来雕刻。",
			BLOCK = "哦，我从未把自己当成艺术家！",
			SCULPTURE = "我们都急需情感宣泄，我相信。",
			BURNT = "多遗憾。它是一个可爱的添加物喵。",
   		},
        SCULPTURE_KNIGHTHEAD = "你要用你的膝盖来抬举，亲爱的。",
		SCULPTURE_KNIGHTBODY =
		{
			COVERED = "很有品味喵。",
			UNCOVERED = "他们说每块石头里面都有个雕像。",
			FINISHED = "结构再一次完整了。",
			READY = "里面酝酿着某种东西。",
		},
        SCULPTURE_BISHOPHEAD = "我抬得起它。我比我看上去敏捷得多。",
		SCULPTURE_BISHOPBODY =
		{
			COVERED = "凿功中透出动物般的凶猛喵。",
			UNCOVERED = "所以这就是潜伏在里面的东西。",
			FINISHED = "出色的修复工作喵。",
			READY = "里面酝酿着某东西。",
		},
        SCULPTURE_ROOKNOSE = "等着有人背部受伤吧。",
		SCULPTURE_ROOKBODY =
		{
			COVERED = "我感觉到一束含有魔法的亮光。真古怪喵。",
			UNCOVERED = "它所处的状态多么糟糕啊！",
			FINISHED = "我们可能要注意点这东西。",
			READY = "里面酝酿着某东西。",
		},
        GARGOYLE_HOUND = "由于月亮的暴露而完全哑口无言。",
        GARGOYLE_WEREPIG = "月光在它的皮肤上催化了一种奇怪的反应。",
		SEEDS = "一把不知道是什么的种子。",
		SEEDS_COOKED = "烤植物胚胎喵！",
		SEWING_KIT = "家务活中要用到的小工具喵。",
		SEWING_TAPE = "高级粘合剂，能用来进行细小的修补。",
		SHOVEL = "这是一把铲子。你以前肯定见过吧喵？",
		SILK = "蛛形纲动物吐出的蛋白质纤维。",
		SKELETON = "一具保存得相当好的骷髅喵。",
		SCORCHED_SKELETON = "你没有激发大量的信心，亲爱的。",
        SKELETON_NOTPLAYER = "从骨骼结构上研判，显然不是人类喵。",
		SKULLCHEST = "一种像头盖骨的容器。", --removed
		SMALLBIRD =
		{
			GENERIC = "鸟类中身材矮小的品种喵。",
			HUNGRY = "它需要食物喵。",
			STARVING = "没有食物，它肯定会死的喵。",
			SLEEPING = "它倦了，睡着了。",
		},
		SMALLMEAT = "是一小块生肉。",
		SMALLMEAT_DRIED = "很高的钠含量喵。",
		SPAT = "钢铁羊，看看它就知道这是什么意思了喵。",
		SPEAR = "古老的武器技术喵。",
		SPEAR_WATHGRITHR = "多么帅气的猎捕工具啊喵！",
		WATHGRITHRHAT = "不合时宜的胡言乱语。",
		SPIDER =
		{
			DEAD = "它死了。",
			GENERIC = "一种大型的食肉蛛形纲动物。",
			SLEEPING = "它们好像是夜行性动物喵。",
		},
		SPIDERDEN = "很有意思。这些蜘蛛的巢穴是共用的。",
		SPIDEREGGSACK = "非常便携的蜘蛛卵袋。",
		SPIDERGLAND = "这个腺体会分泌出一种低毒性的毒液。",
		SPIDERHAT = "对蜘蛛进行心灵控制。当然，不包括那个男孩喵。",
		SPIDERQUEEN = "那肯定就是蜘蛛们的首脑了吧。",
		SPIDER_WARRIOR =
		{
			DEAD = "他为女王奉献出了自己的生命。",
			GENERIC = "它似乎是族群里的战士。",
			SLEEPING = "它本就应该好好休息。",
		},
        SPOILED_FOOD =
        {
            GENERIC = "里面积聚了大量的细菌喵。",
--fallback to speech_wilson.lua             CAN_PROCESS = "only_used_by_wx78",
        },
        STAGEHAND =
        {
			AWAKE = "那是个卑鄙的诡计！",
			HIDING = "某些不光明的东西正在暗影中潜行喵。",
        },
        STATUE_MARBLE =
        {
            GENERIC = "由变质岩雕刻而成喵。",
            TYPE1 = "缪斯墨尔波墨的希腊式启发的雕像。有点自由发挥。",
            TYPE2 = "缪斯塔利亚的希腊式启发的雕像。有点自由发挥。",
            TYPE3 = "大雨无意中把它变成了鸟儿们洗澡的地方喵。", --bird bath type statue
        },
		STATUEHARP = "普通的雕像。",
		STATUEMAXWELL = "除了有点自大，他其实是个很好的男孩喵。",
		STEELWOOL = "它具有各种家庭用途。",
		STINGER = "它逐渐变细，最后成为一个尖刺。",
		STRAWHAT = "这东西能防晒。",
		STUFFEDEGGPLANT = "茄子已经被做成菜了，和食物包在一起。",
		SWEATERVEST = "这件背心尖声说“时尚，但又能显示主人博学多才。”",
		REFLECTIVEVEST = "那个能使人保持适当凉爽。",
		HAWAIIANSHIRT = "我更喜欢粗花呢衣服。",
		TAFFY = "这对你的牙齿不好，亲爱的。",
		TALLBIRD = "发育完全的巨型鸟。",
		TALLBIRDEGG = "它需要孵化喵。",
		TALLBIRDEGG_COOKED = "全是胆固醇。",
		TALLBIRDEGG_CRACKED =
		{
			COLD = "你会被冻死的！",
			GENERIC = "似乎正在发育。",
			HOT = "暴露在极端温度下可能会让它死掉。",
			LONG = "欲速则不达喵。",
			SHORT = "很快我们就可以收获自己的劳动果实了喵。",
		},
		TALLBIRDNEST =
		{
			GENERIC = "好大的巨型鸟蛋喵！",
			PICKED = "巢是空的。很快就会开始一个新的生命周期。",
		},
		TEENBIRD =
		{
			GENERIC = "还处于青少年阶段的鸟。",
			HUNGRY = "请把你的声音压到最低。",
			STARVING = "一只非常淘气的鸟！",
			SLEEPING = "好像兴奋过头了，现在累得睡着了。",
		},
		TELEPORTATO_BASE =
		{
			ACTIVE = "这个机器可以用来在不同世界之间传送喵。", --single player
			GENERIC = "这块符文石有独特的几何性质喵！", --single player
			LOCKED = "这个机器需要启动才能用。", --single player
			PARTIAL = "这个机器还没有完全完成。", --single player
		},
		TELEPORTATO_BOX = "电荷调节器喵。", --single player
		TELEPORTATO_CRANK = "它运用了基本的机械原理喵。", --single player
		TELEPORTATO_POTATO = "既不是完全有机的也不是无机的喵！", --single player
		TELEPORTATO_RING = "由合金和电线构成的圆环。", --single player
		TELESTAFF = "宝石似乎将噩梦燃料的能量聚集了起来。",
		TENT =
		{
			GENERIC = "睡在那里面会让我落枕喵。",
			BURNT = "反正它对我来说也没什么用喵。",
		},
		SIESTAHUT =
		{
			GENERIC = "即使在床上我都很难睡着，更不用说在地上了喵。",
			BURNT = "反正它对我来说也没什么用。",
		},
		TENTACLE = "埋伏在淤泥里的怪物。",
		TENTACLESPIKE = "万万不要握尖的那端。",
		TENTACLESPOTS = "嗯，繁殖器官。",
		TENTACLE_PILLAR = "下面的部分比露出的部分更多！",
        TENTACLE_PILLAR_HOLE = "它看上去以某种方式互相连通。",
		TENTACLE_PILLAR_ARM = "埋伏在淤泥里的小怪物。",
		TENTACLE_GARDEN = "它们究竟是如何繁殖的？",
		TOPHAT = "一看就是资产阶级的东西。",
		TORCH = "简易的手持光源。",
		TRANSISTOR = "这是非常先进的技术。",
		TRAP = "简单的支点-罩子陷阱。",
		TRAP_TEETH = "它覆盖着一层薄薄的犬科动物消化液。",
		TRAP_TEETH_MAXWELL = "想骗我，你还太嫩了喵。", --single player
		TREASURECHEST =
		{
			GENERIC = "一个储物箱。",
			BURNT = "储存箱的碳化骨架。",
            UPGRADED_STACKSIZE = "一种大型储物箱喵。",
		},
		TREASURECHEST_TRAP = "看上去很可疑...",
        CHESTUPGRADE_STACKSIZE = "对存储容器的容量进行，坦率的讲，荒诞的提升。", -- Describes the kit upgrade item.
		COLLAPSEDCHEST = "审慎起见，我们应该重建这个箱子，而不是把这些东西随地乱丢喵。",
		SACRED_CHEST =
		{
			GENERIC = "魔法里紧紧束缚着一个小次元。",
			LOCKED = "魔法正在运作喵。",
		},
		TREECLUMP = "这里是茂密的植物群喵。", --removed

		TRINKET_1 = "好可爱的饮料瓶封口玻璃珠！可惜全部熔化了。", --Melted Marbles
		TRINKET_2 = "假的膜鸣乐器。", --Fake Kazoo
		TRINKET_3 = "哦，我真是太喜欢莎士比亚了。", --Gord's Knot
		TRINKET_4 = "乐观快乐但又古里古怪的小家伙喵。", --Gnome
		TRINKET_5 = "这个迷你火箭飞船看起来没有足够的热控制。", --Toy Rocketship
		TRINKET_6 = "我真希望WX-78心情好。", --Frazzled Wires
		TRINKET_7 = "我会保留这个。我认识某个喜欢这个的人。", --Ball and Cup
		TRINKET_8 = "它让我想起了我的浴缸。我可以在浴缸里想泡多久就泡多久。", --Rubber Bung
		TRINKET_9 = "好巧。我的羊毛衫正缺了个纽扣喵！", --Mismatched Buttons
		TRINKET_10 = "我欣赏不了这暗喻，亲爱的。", --Dentures
		TRINKET_11 = "啊，它是那个淘气机器人的等比例复制品喵。", --Lying Robot
		TRINKET_12 = "位于吸水物质附近的肌肉性静水骨骼。", --Dessicated Tentacle
		TRINKET_13 = "乐观快乐但又古里古怪的女士。", --Gnomette
		TRINKET_14 = "我觉得它很可爱，虽然岁月给它留下了裂纹喵…", --Leaky Teacup
		TRINKET_15 = "在中世纪的象棋中，这颗旗子叫做象喵。", --Pawn
		TRINKET_16 = "这个东西上的凹槽是主教正式头饰的象征喵。", --Pawn
		TRINKET_17 = "如果它不是弯的，它会是个吃饭的新装置喵。", --Bent Spork
		TRINKET_18 = "当心带礼物的骗子喵。", --Trojan Horse
		TRINKET_19 = "一副不错的陀螺旋进插图喵。", --Unbalanced Top
		TRINKET_20 = "一个自给自足的工具。", --Backscratcher
		TRINKET_21 = "我有个很好的调和蛋白食谱喵。", --Egg Beater
		TRINKET_22 = "我奶奶以前总是在织布。", --Frayed Yarn
		TRINKET_23 = "它让我想起了家乡。", --Shoehorn
		TRINKET_24 = "好乐观可爱的凯蒂猫。哎。", --Lucky Cat Jar
		TRINKET_25 = "真难闻。", --Air Unfreshener
		TRINKET_26 = "它看起来像由块茎简单做成的杯子喵。", --Potato Cup
		TRINKET_27 = "我想念家里的舒适。", --Coat Hanger
		TRINKET_28 = "它很久以前曾经被称为“塔”。", --Rook
        TRINKET_29 = "把它叫作“城堡”显然是不正确的喵。", --Rook
        TRINKET_30 = "骑士在盘中运用的好，可以发挥比其他棋子更大的作用。", --Knight
        TRINKET_31 = "在德国它被称为“弹簧”喵。", --Knight
        TRINKET_32 = "哦，我的愿望是有一个漂亮的水晶球。", --Cubic Zirconia Ball
        TRINKET_33 = "一个装饰性蛛形纲动物饰品！多么惹人怜爱喵！", --Spider Ring
        TRINKET_34 = "爪子授予了三个愿望，带来非常讽刺的结果。故事仍在继续喵。", --Monkey Paw
        TRINKET_35 = "没有气味。我相信它可能是糖水。", --Empty Elixir
        TRINKET_36 = "穿上它们前把那些东西泡在滚烫的水里，亲爱的喵。", --Faux fangs
        TRINKET_37 = "幸运的是，它脆弱得多，没法造成任何真正的损害。", --Broken Stake
        TRINKET_38 = "这根本就用不了。", -- Binoculars Griftlands trinket
        TRINKET_39 = "似乎是一只被遗弃的手套。", -- Lone Glove Griftlands trinket
        TRINKET_40 = "真是一只小巧玲珑的软体动物造型秤喵！", -- Snail Scale Griftlands trinket
        TRINKET_41 = "这看上去不像来自这个世界。", -- Goop Canister Hot Lava trinket
        TRINKET_42 = "天啊，它看上颇有些惆怅喵。", -- Toy Cobra Hot Lava trinket
        TRINKET_43= "也许我该为韦伯留着。", -- Crocodile Toy Hot Lava trinket
        TRINKET_44 = "浪费了一份独一无二的植物标本。", -- Broken Terrarium ONI trinket
        TRINKET_45 = "多么奇特的装置！", -- Odd Radio ONI trinket
        TRINKET_46 = "真是个奇怪的玩意。", -- Hairdryer ONI trinket

        -- The numbers align with the trinket numbers above.
        LOST_TOY_1  = "好奇怪……也许只是海市蜃楼喵。",
        LOST_TOY_2  = "好奇怪……也许只是海市蜃楼。",
        LOST_TOY_7  = "好奇怪……也许只是海市蜃楼。",
        LOST_TOY_10 = "好奇怪……也许只是海市蜃楼。",
        LOST_TOY_11 = "好奇怪……也许只是海市蜃楼喵。",
        LOST_TOY_14 = "好奇怪……也许只是海市蜃楼。",
        LOST_TOY_18 = "好奇怪……也许只是海市蜃楼。",
        LOST_TOY_19 = "好奇怪……也许只是海市蜃楼。",
        LOST_TOY_42 = "好奇怪……也许只是海市蜃楼。",
        LOST_TOY_43 = "好奇怪……也许只是海市蜃楼喵。",

        HALLOWEENCANDY_1 = "记得吃东西要有节制，孩子们。",
        HALLOWEENCANDY_2 = "高果糖玉米糖浆颜色赏心悦目的糖心喵。",
        HALLOWEENCANDY_3 = "嗯，好吧，至少桌子上有一种健康食品喵。",
        HALLOWEENCANDY_4 = "我自己一直很喜欢黑色甘草喵。",
        HALLOWEENCANDY_5 = "吃它们几乎就是一件愧事。",
        HALLOWEENCANDY_6 = "我希望你们谁都别吃。",
        HALLOWEENCANDY_7 = "你们不要的都给我，亲爱的。",
        HALLOWEENCANDY_8 = "多么惹人怜爱喵！",
        HALLOWEENCANDY_9 = "最好我之后不会听到任何肚子疼的话。",
        HALLOWEENCANDY_10 = "多么惹人怜爱喵！",
        HALLOWEENCANDY_11 = "只这巧克力就让我无法抵抗，可以说是我的短板了。",
        HALLOWEENCANDY_12 = "这块糖果虽然不好看，但味道是不错的。", --ONI meal lice candy
        HALLOWEENCANDY_13 = "我可以想象，明早下巴会很疼的。", --Griftlands themed candy
        HALLOWEENCANDY_14 = "辣度在斯科维尔指标中稳稳地拿到10级喵。", --Hot Lava pepper candy
        CANDYBAG = "用来装季节性点心的节日袋子。",

		HALLOWEEN_ORNAMENT_1 = "一个适合挂起来当做装饰的淘气鬼。",
		HALLOWEEN_ORNAMENT_2 = "一大批会飞的哺乳动物。",
		HALLOWEEN_ORNAMENT_3 = "蛛形纲树木装饰物。",
		HALLOWEEN_ORNAMENT_4 = "我真的该装饰了。",
		HALLOWEEN_ORNAMENT_5 = "这样的装饰物就该挂起来。",
		HALLOWEEN_ORNAMENT_6 = "这种乌鸦似的东西比较适合挂在树上。",

		HALLOWEENPOTION_DRINKS_WEAK = "没有我期望的那么强。",
		HALLOWEENPOTION_DRINKS_POTENT = "厉害的药剂。",
        HALLOWEENPOTION_BRAVERY = "瓶装的英勇。",
		HALLOWEENPOTION_MOON = "似乎可以催化变异。",
		HALLOWEENPOTION_FIRE_FX = "它好像可燃烧喵。",
		MADSCIENCE_LAB = "果然是疯狂的科学！",
		LIVINGTREE_ROOT = "一棵恐怖之树的根部。",
		LIVINGTREE_SAPLING = "啊。它的恐惧生根了。",

        DRAGONHEADHAT = "这是龙造型装束的头部喵。",
        DRAGONBODYHAT = "龙越长，运气越好喵。",
        DRAGONTAILHAT = "这是龙装束的背部。",
        PERDSHRINE =
        {
            GENERIC = "天真的火鸡成群跑向它。",
            EMPTY = "必须放一丛灌木来吸引火鸡喵。",
            BURNT = "一个碳化的结构喵。",
        },
        REDLANTERN = "多么华美的一个小灯笼啊。",
        LUCKY_GOLDNUGGET = "很奇特的形状。",
        FIRECRACKERS = "按我的口味来说，有点儿太吵了喵。",
        PERDFAN = "相当漂亮。",
        REDPOUCH = "活力满满的红色月眼是好运的象征。",
        WARGSHRINE =
        {
            GENERIC = "开始举行庆典吧！",
            EMPTY = "以火致敬，哈？",
BURNING = "I should make something fun.", --for willow to override
            BURNT = "令人遗憾喵。",
        },
        CLAYWARG =
        {
            GENERIC = "啊，真是又可怕又迷人。",
            STATUE = "一座精心制作的陶土雕像喵。",
        },
        CLAYHOUND =
        {
            GENERIC = "这个陶土制品奇迹般地活了喵。",
            STATUE = "陶土玩意喵。",
        },
        HOUNDWHISTLE = "它发出一种人耳无法察觉的频率。",
        CHESSPIECE_CLAYHOUND = "一只犬类复制品喵。",
        CHESSPIECE_CLAYWARG = "雕塑师显然仔细研究过这个动物。",

		PIGSHRINE =
		{
            GENERIC = "猪的供品。",
            EMPTY = "它需要祭肉。",
            BURNT = "像这样对我是没用的了喵。",
		},
		PIG_TOKEN = "他们是如何用猪蹄实现此等细节的？",
		PIG_COIN = "猪王的馈赠。",
		YOTP_FOOD1 = "适合节日的盛宴！",
		YOTP_FOOD2 = "不适合人类食用。",
		YOTP_FOOD3 = "我偶尔喜欢吃点零食。",

		PIGELITE1 = "他身上全是标记。", --BLUE
		PIGELITE2 = "脾气很暴躁。", --RED
		PIGELITE3 = "他有一股泥巴的味道喵。", --WHITE
		PIGELITE4 = "我想知道那些绿色的标记是什么意思。", --GREEN

		PIGELITEFIGHTER1 = "他身上全是标记。", --BLUE
		PIGELITEFIGHTER2 = "脾气很暴躁。", --RED
		PIGELITEFIGHTER3 = "他有一股泥巴的味道。", --WHITE
		PIGELITEFIGHTER4 = "我想知道那些绿色的标记是什么意思。", --GREEN

		CARRAT_GHOSTRACER = "真是迷人！是全新的物种吗喵？",

        YOTC_CARRAT_RACE_START = "这会是观察野胡萝卜的一次绝佳机会。",
        YOTC_CARRAT_RACE_CHECKPOINT = "这个标识物有助于保持正确的方向喵。",
        YOTC_CARRAT_RACE_FINISH =
        {
            GENERIC = "我渴望记录结果喵！",
            BURNT = "哎呀，完全没用了。",
            I_WON = "噢，吼！不得不说，这是出色的成绩喵。",
            SOMEONE_ELSE_WON = "\"备注: {winner}的标本展现出卓越的竞速能力。\"",
        },

		YOTC_CARRAT_RACE_START_ITEM = "我要为它找个合适的位置喵。",
        YOTC_CARRAT_RACE_CHECKPOINT_ITEM = "我要清点一下，要足够到终点线才行。",
		YOTC_CARRAT_RACE_FINISH_ITEM = "这场小实验的终点喵。",

		YOTC_SEEDPACKET = "我曾经是一名热忱的园丁。",
		YOTC_SEEDPACKET_RARE = "我好奇它会长成什么物种喵。",

		MINIBOATLANTERN = "气球显得有点多余，不是吗？",

        YOTC_CARRATSHRINE =
        {
            GENERIC = "它敬供着小型动植物混合体。",
            EMPTY = "它需要某种形式的供品。",
            BURNT = "完全没用了。",
        },

        YOTC_CARRAT_GYM_DIRECTION =
        {
            GENERIC = "这将考验这个生物的方向感喵。",
            RAT = "谁是个聪明的野胡萝卜呢？",
            BURNT = "恐怕它对任何人都没什么大用处了喵。",
        },
        YOTC_CARRAT_GYM_SPEED =
        {
            GENERIC = "速度不能代替聪明，但是有一定的帮助喵。",
            RAT = "我的天啊，瞧它多快！",
            BURNT = "恐怕它对任何人都没什么大用处了喵。",
        },
        YOTC_CARRAT_GYM_REACTION =
        {
            GENERIC = "它能很好的考验反应能力。",
            RAT = "能看出它的反应时间在提高！",
            BURNT = "恐怕它对任何人都没什么大用处了。",
        },
        YOTC_CARRAT_GYM_STAMINA =
        {
            GENERIC = "重复的跳跃应该能够提高生物的耐力喵。",
            RAT = "小可爱正在全力以赴的训练。",
            BURNT = "恐怕它对任何人都没什么大用处了喵。",
        },

        YOTC_CARRAT_GYM_DIRECTION_ITEM = "一种简易的方向测试机器。",
        YOTC_CARRAT_GYM_SPEED_ITEM = "一种简易的测速机器。",
        YOTC_CARRAT_GYM_STAMINA_ITEM = "测试对象耐力的物品。",
        YOTC_CARRAT_GYM_REACTION_ITEM = "测试对象警觉性的物品。",

        YOTC_CARRAT_SCALE_ITEM = "它能测量草本啮齿动物的赛跑能力。",
        YOTC_CARRAT_SCALE =
        {
            GENERIC = "令人着迷！我从未意识到技能可以通过重量测量喵。",
            CARRAT = "嗯，看来还得再训练训练。",
            CARRAT_GOOD = "标本对训练的反应十分积极！",
            BURNT = "哎呀，完全没用了。",
        },

        YOTB_BEEFALOSHRINE =
        {
            GENERIC = "那就开始吧？",
            EMPTY = "需要提供供品喵。",
            BURNT = "多么不幸。",
        },

        BEEFALO_GROOMER =
        {
            GENERIC = "这些生物需要定时美容。",
            OCCUPIED = "让我们帮你看起来更体面一点，好吗喵？",
            BURNT = "世事难料啊。",
        },
        BEEFALO_GROOMER_ITEM = "我最好把它安装好。",

        YOTR_RABBITSHRINE =
        {
            GENERIC = "我们必须向当地的兔类生物表达谢意。",
            EMPTY = "这座建筑上的各种表达都说明我应该献上食物喵。",
            BURNT = "噢，不好。",
        },

        NIGHTCAPHAT = "恐怕我用不到它。",

        YOTR_FOOD1 = "就算放根胡萝卜到甜点里，也不能让它变成健康饮食。",
        YOTR_FOOD2 = "虽然用“蓝色”来形容风味有些古怪，但我不得不赞同。",
        YOTR_FOOD3 = "这糖果让我神魂颠倒！",
        YOTR_FOOD4 = "蛋糕都能串了，还能鼓捣出什么喵？",

        YOTR_TOKEN = "传统上，被手套打到意味着决斗的挑战。",

        COZY_BUNNYMAN = "他们看起来很舒服的样子。",

        HANDPILLOW_BEEFALOWOOL = "皮弗娄牛的毛发纤维是极佳的填充物。",
        HANDPILLOW_KELP = "多么别出心裁的海带用法啊。",
        HANDPILLOW_PETALS = "它散发出一种精致的花香。",
        HANDPILLOW_STEELWOOL = "它与安眠二字格格不入。",

        BODYPILLOW_BEEFALOWOOL = "皮弗娄牛的毛发纤维是极佳的填充物。",
        BODYPILLOW_KELP = "多么别出心裁的海带用法啊喵。",
        BODYPILLOW_PETALS = "它散发出一种精致的花香喵。",
        BODYPILLOW_STEELWOOL = "它与安眠二字格格不入。",

		BISHOP_CHARGE_HIT = "嗷！",
		TRUNKVEST_SUMMER = "耐用的外套。",
		TRUNKVEST_WINTER = "在寒冷环境中提供足够保护。",
		TRUNK_COOKED = "虽然不好吃，但蛋白质含量高。",
		TRUNK_SUMMER = "实用的鼻子。",
		TRUNK_WINTER = "一个皮毛标本。",
		TUMBLEWEED = "一些植物物质的干集合体。",
		TURKEYDINNER = "多好的烤肉。",
		TWIGS = "一些小树枝。",
		UMBRELLA = "用来保持干燥的简易装备。",
		GRASS_UMBRELLA = "可以提供一定程度保护的美丽阳伞喵。",
		UNIMPLEMENTED = "还在建设中喵。",
		WAFFLES = "你好啊，华夫饼喵。",
		WALL_HAY =
		{
			GENERIC = "我不相信那堵墙能保证我的安全。",
			BURNT = "看来不相信它是正确的。",
		},
		WALL_HAY_ITEM = "干草垛。",
		WALL_STONE = "很安全喵。",
		WALL_STONE_ITEM = "我会带着它们。我有力的后背一直是我最大的财富。",
		WALL_RUINS = "非常牢固的墙。",
		WALL_RUINS_ITEM = "我的口袋比从外面看起来能装。",
		WALL_WOOD =
		{
			GENERIC = "这能提供一定程度的保护喵。",
			BURNT = "它的致命弱点就是火。",
		},
		WALL_WOOD_ITEM = "可安放的尖木桩。",
		WALL_MOONROCK = "出色的工作。",
		WALL_MOONROCK_ITEM = "装在我的口袋里刚刚好。",
		WALL_DREADSTONE = "一堵高度安全的墙。",
		WALL_DREADSTONE_ITEM = "石头的密度使其成为一种非常坚固的建筑材料。",
        WALL_SCRAP = "循环利用资源的典型案例喵。",
        WALL_SCRAP_ITEM = "循环利用资源的典型案例。",
		FENCE = "一个结构简单的栅栏喵。",
        FENCE_ITEM = "一个木头栅栏的所有组件。",
        FENCE_GATE = "那是一扇木头大门喵。",
        FENCE_GATE_ITEM = "一扇木头大门的所有组件喵。",
		WALRUS = "海象；盖尔种喵。",
		WALRUSHAT = "怎么能忘记老朋友？",
		WALRUS_CAMP =
		{
			EMPTY = "现在它已经被遗弃了。",
			GENERIC = "某种临时居所。",
		},
		WALRUS_TUSK = "这可以用于制作骨雕品喵。",
		WARDROBE =
		{
			GENERIC = "这个让我想起了一本名著。",
            BURNING = "唔，现在它让我想起了另一本很不同的名著。",
			BURNT = "它曾经是个衣柜。",
		},
		WARG = "驯化这只犬属动物将会是一个令人愉悦的挑战。",
        WARGLET = "这只小犬需要学习礼貌。",

		WASPHIVE = "我最好保持点距离。",
		WATERBALLOON = "儿童的玩具喵。",
		WATERMELON = "西瓜。",
		WATERMELON_COOKED = "烤得真好。",
		WATERMELONHAT = "这无疑是一种你可以用西瓜做出来的东西喵。",
		WAXWELLJOURNAL =
		{
			GENERIC = "我不会让那个出现在我的图书馆喵！",
--fallback to speech_wilson.lua 			NEEDSFUEL = "only_used_by_waxwell",
		},
		WETGOOP = "哦，不，不，不。这根本不行喵。",
        WHIP = "利用对方的疼痛达到驯服目的的武器喵。",
		WINTERHAT = "我应该教孩子们怎么拿针。",
		WINTEROMETER =
		{
			GENERIC = "行动前先测量一下。",
			BURNT = "已经烧得只剩外壳了，再也不能测量了。",
		},

        WINTER_TREE =
        {
            BURNT = "不要担心。我们仍然可以庆祝。",
            BURNING = "哦天哪，还是没有。",
            CANDECORATE = "树上的一份可爱的工作，亲爱的们喵。",
            YOUNG = "在装饰品的重量下它当然会断掉。",
        },
		WINTER_TREESTAND =
		{
			GENERIC = "让我们种一棵合适的树吧，好吗？",
            BURNT = "不要担心。我们仍然可以庆祝。",
		},
        WINTER_ORNAMENT = "现在对它小心点，亲爱的。",
        WINTER_ORNAMENTLIGHT = "电流没有某种吸引力，不是吗喵？",
        WINTER_ORNAMENTBOSS = "我认为那东西绝不会过度装饰。",
		WINTER_ORNAMENTFORGE = "一个令人伤感的手工艺品。",
		WINTER_ORNAMENTGORGE = "这针线活相当精巧喵。",
        WINTER_ORNAMENTPEARL = "用螯足完成的相当精细的作品喵。",

        WINTER_FOOD1 = "多么讨人喜欢的一个小个体啊。", --gingerbread cookie
        WINTER_FOOD2 = "就像在图书馆度过的假日喵！", --sugar cookie
        WINTER_FOOD3 = "热茶的完美搅拌棒。", --candy cane
        WINTER_FOOD4 = "一个带有微不足道的暂时阻力的物体。", --fruitcake
        WINTER_FOOD5 = "这样熟练准备的树莓馅！", --yule log cake
        WINTER_FOOD6 = "“李子”是十七世纪的“水果”的术语，亲爱的。", --plum pudding
        WINTER_FOOD7 = "把它和一本好书配对，这样你就有了冬日哀伤的治疗方法。", --apple cider
        WINTER_FOOD8 = "一个小小的魔法让它保持着舒适的温度。", --hot cocoa
        WINTER_FOOD9 = "我总是喜欢好的饮料喵。", --eggnog

		WINTERSFEASTOVEN =
		{
			GENERIC = "它用什么燃料呢喵？",
			COOKING = "烤的非常好喵。",
			ALMOST_DONE_COOKING = "马上就做好了。",
			DISH_READY = "完成了喵！",
		},
		BERRYSAUCE = "真有节日气氛喵！",
		BIBINGKA = "传统上，比宾卡米糕是在专用的陶土炉中烘烤而成。",
		CABBAGEROLLS = "这道菜的变体传到了欧洲和亚洲绝大多数地区。",
		FESTIVEFISH = "我不熟悉这道菜的起源。",
		GRAVY = "哎呀，我吃不了这么腻的东西。",
		LATKES = "香脆可口喵。",
		LUTEFISK = "先把鱼晒干，然后再放到碱液里腌制，方才得到这种怪异的味道喵。",
		MULLEDDRINK = "仲冬节的美味饮品喵。",
		PANETTONE = "这种蛋糕的起源要追溯到古罗马时代。",
		PAVLOVA = "它的名字来源于俄国芭蕾舞者安娜·巴甫洛娃喵。",
		PICKLEDHERRING = "我喜欢在假日时吃点腌鲱鱼喵。",
		POLISHCOOKIE = "节日的氛围扑面而来。",
		PUMPKINPIE = "或许我可以吃一小口……",
		ROASTTURKEY = "希望完全烤熟了。",
		STUFFING = "完美搭配火鸡和肉汁喵。",
		SWEETPOTATO = "节日聚餐的大热菜品喵。",
		TAMALES = "香料的分量把握的很克制，符合我的口味。",
		TOURTIERE = "相当丰盛的肉饼。",

		TABLE_WINTERS_FEAST =
		{
			GENERIC = "可以招待所有宾客了喵。",
			HAS_FOOD = "琳琅满目的盛宴！",
			WRONG_TYPE = "绝对是错的类型。",
			BURNT = "哎呀，完全没用了喵。",
		},

		GINGERBREADWARG = "节庆纲犬类。",
		GINGERBREADHOUSE = "让我想起了一个故事喵。",
		GINGERBREADPIG = "如果它能静坐一会儿，我就可以把它归类。",
		CRUMBS = "我认为它来自行走的糖果。",
		WINTERSFEASTFUEL = "让我想起了坐在壁炉旁阅读假日故事的时间喵。",

        KLAUS = "它用它那强大的味觉搜寻猎物。",
        KLAUS_SACK = "真奇特。",
		KLAUSSACKKEY = "嗯。很强健的鹿角喵。",
		WORMHOLE =
		{
			GENERIC = "睡着的拥有两张嘴的蚯蚓喵。",
			OPEN = "一圈圈的牙齿是为了帮助下咽的喵。",
		},
		WORMHOLE_LIMITED = "估计用几次就不行了喵。",
		ACCOMPLISHMENT_SHRINE = "我总是忍不住一次又一次地启动它。", --single player
		LIVINGTREE = "这棵树好特别。",
		ICESTAFF = "某种能产生冰冻效果的奇妙装置。",
		REVIVER = "这种设备可以为灵质结构提供一个物质锚点。",
		SHADOWHEART = "这……这不是小孩的魔法。",
        ATRIUM_RUBBLE =
        {
			LINE_1 = "非哺乳类文明的古代壁画。",
			LINE_2 = "壁画的面板侵蚀太严重，无法破译喵。",
			LINE_3 = "暗影，或者说一种物质，降临了这个文明。",
			LINE_4 = "画面里，居民们从他们的外骨骼中脱皮喵。",
			LINE_5 = "城市看起来更加兴旺发达喵。",
		},
        ATRIUM_STATUE = "它拒绝遵守这个世界的规则喵。",
        ATRIUM_LIGHT =
        {
			ON = "确实。它从钥匙中获得力量。",
			OFF = "我怀疑那些可怕的燃料在给它提供动力。",
		},
        ATRIUM_GATE =
        {
			ON = "我已经激活它了。",
			OFF = "现在这可能通向哪里？",
			CHARGING = "它在储存力量喵。",
			DESTABILIZING = "它离开时，我们最好不要露面喵。",
			COOLDOWN = "我们必须耐心喵。",
            RITUAL_SUMMONING = "它出现了。那只一直在这个世界之外注视、等待的眼睛。不过看来，它漫长的等待终于结束了。", -- ritual is actively summoning, shrouden has appeared through the gate in the form of the eye, its looks between players, and charlie.
        },
        ATRIUM_KEY = "那座古老大门的钥匙。",
		LIFEINJECTOR = "这霉菌似乎有药性喵。",
		SKELETON_PLAYER =
		{
			MALE = "%s的骨骼始终提醒着在%s周围要注意。",
			FEMALE = "%s的骨骼始终提醒着在%s周围要注意喵。",
			ROBOT = "%s的骨骼始终提醒着在%s周围要注意喵。",
			DEFAULT = "%s的骨骼始终提醒着在%s周围要注意喵。",
		},
HUMANMEAT = "Flesh is flesh. Where do I draw the line喵?",
HUMANMEAT_COOKED = "Cooked nice and pink, but still morally gray.",
HUMANMEAT_DRIED = "Letting it dry makes it not come from a human, right喵?",
		ROCK_MOON = "暗示着月球天体？有趣。",
		MOONROCKNUGGET = "暗示着月球天体？有趣。",
		MOONROCKCRATER = "会用适当的装饰制造一个有用的制图工具。",
		MOONROCKSEED = "一个漂浮的知识球体。",

        REDMOONEYE = "红色月眼会标记这个位置喵。",
        PURPLEMOONEYE = "用来标记我们的行踪的道具。",
        GREENMOONEYE = "那会帮助我们保持我们的方位。",
        ORANGEMOONEYE = "组织搜索队这事，当然是越少越好喵。",
        YELLOWMOONEYE = "这地方的地里每天都越来越不为人所理解。",
        BLUEMOONEYE = "分组协作的出色标志。",

        --Arena Event
        LAVAARENA_BOARLORD = "他总是忿忿不平的，我也不知道为什么。",
        BOARRIOR = "我们最好不要低估那个喵。",
        BOARON = "它们的作用好像是当饲料喵。",
        PEGHOOK = "一只有感觉的蝎子。真怪喵。",
        TRAILS = "恐怕是肌肉发达头脑简单喵。",
        TURTILLUS = "亲爱的，你最好弄掉那些尖刺吧喵。",
        SNAPPER = "真是个暴徒喵！",
		RHINODRILL = "倾向于卖弄自己的雄壮威猛喵。",
		BEETLETAUR = "它鼻子上的那把锁肯定很重。",

        LAVAARENA_PORTAL =
        {
            ON = "真是一场意想不到的冒险。",
            GENERIC = "它连接着我们的大门，但是在这一边没有激活。",
        },
        LAVAARENA_KEYHOLE = "需要一把钥匙。",
		LAVAARENA_KEYHOLE_FULL = "准备就绪，可以激活了。",
        LAVAARENA_BATTLESTANDARD = "那面旗帜让附近的敌人恢复了活力。",
        LAVAARENA_SPAWNER = "它好像能促进本地瞬移喵。",

        HEALINGSTAFF = "这是吃力不讨好的活儿。",
        FIREBALLSTAFF = "经历过魔法的人应该能够使用这个。比如我！",
        HAMMER_MJOLNIR = "那个好像用起来会很费力喵。",
        SPEAR_GUNGNIR = "恐怕那个对我没多大用处喵。",
        BLOWDART_LAVA = "我的肺活量不够大，用不好这个东西喵。",
        BLOWDART_LAVA2 = "我还是把那个留给年轻人吧喵。",
        LAVAARENA_LUCY = "不同寻常的斧头。",
        WEBBER_SPIDER_MINION = "好可爱的小蜘蛛喵！",
        BOOK_FOSSIL = "一本加速石化的大书喵。",
		LAVAARENA_BERNIE = "很有意思。它在这儿都是活的。",
		SPEAR_LANCE = "这个长柄武器的形状也太不实用了。",
		BOOK_ELEMENTAL = "一本拥有强大召唤力量的大书喵。",
		LAVAARENA_ELEMENTAL = "它注定为我们效力。",

   		LAVAARENA_ARMORLIGHT = "轻巧，但保护力不是特别强喵。",
		LAVAARENA_ARMORLIGHTSPEED = "它材质轻巧，穿着它会更加行动自如喵。",
		LAVAARENA_ARMORMEDIUM = "穿着它应该能防止暴力伤害。",
		LAVAARENA_ARMORMEDIUMDAMAGER = "这个对我来说没多大用处。",
		LAVAARENA_ARMORMEDIUMRECHARGER = "穿上这件编织的魔力装备可以增强意志喵。",
		LAVAARENA_ARMORHEAVY = "我还是把那个留给年轻人吧。",
		LAVAARENA_ARMOREXTRAHEAVY = "最适合用来抵挡严酷的攻击。",

		LAVAARENA_FEATHERCROWNHAT = "这个花环带有轻微的魔力。",
        LAVAARENA_HEALINGFLOWERHAT = "它会增强所接收的治愈力。",
        LAVAARENA_LIGHTDAMAGERHAT = "真野蛮。",
        LAVAARENA_STRONGDAMAGERHAT = "我还是把那个留给比较敏捷的人吧。",
        LAVAARENA_TIARAFLOWERPETALSHAT = "戴着它可以增强恢复力。",
        LAVAARENA_EYECIRCLETHAT = "我必须说，这是个令人羡慕的神奇圣物。",
        LAVAARENA_RECHARGERHAT = "神奇能量的焦点。",
        LAVAARENA_HEALINGGARLANDHAT = "靠近这些花朵的时候会产生恢复作用喵。",
        LAVAARENA_CROWNDAMAGERHAT = "天啊，我才不想戴这样的东西。",

		LAVAARENA_ARMOR_HP = "安全第一。",

		LAVAARENA_FIREBOMB = "我还是比较喜欢我的书喵。",
		LAVAARENA_HEAVYBLADE = "天啊。我绝对举不起它！",

        --Quagmire
        QUAGMIRE_ALTAR =
        {
        	GENERIC = "我想知道，这个“饕餮”是什么？",
        	FULL = "在我烹制下一道菜的同时，这些应该够充饥了喵。",
    	},
		QUAGMIRE_ALTAR_STATUE1 = "破旧的雕像。",
		QUAGMIRE_PARK_FOUNTAIN = "太可惜了。我一向喜欢好看的喷泉。",

        QUAGMIRE_HOE = "可以用它来翻耕肥沃的土壤喵。",

        QUAGMIRE_TURNIP = "根部可食用的芸薹属植物。",
        QUAGMIRE_TURNIP_COOKED = "烤芸薹属植物喵。",
        QUAGMIRE_TURNIP_SEEDS = "芸薹属植物的变异种子喵。",

        QUAGMIRE_GARLIC = "百合科葱属植物，洋葱葱属植物的近亲喵。",
        QUAGMIRE_GARLIC_COOKED = "烤百合科葱属植物。",
        QUAGMIRE_GARLIC_SEEDS = "百合科葱属植物的变异种子。",

        QUAGMIRE_ONION = "可食用的球茎状洋葱葱属植物喵。",
        QUAGMIRE_ONION_COOKED = "烤洋葱葱属植物。",
        QUAGMIRE_ONION_SEEDS = "洋葱葱属植物的变异种子喵。",

        QUAGMIRE_POTATO = "茄科茄属植物马铃薯，在某些文化里属于主食。",
        QUAGMIRE_POTATO_COOKED = "烤茄科茄属植物马铃薯。",
        QUAGMIRE_POTATO_SEEDS = "茄科茄属植物马铃薯的变异种子喵。",

        QUAGMIRE_TOMATO = "茄科茄属植物西红柿的果实。",
        QUAGMIRE_TOMATO_COOKED = "烤茄科茄属植物西红柿。",
        QUAGMIRE_TOMATO_SEEDS = "茄科茄属植物西红柿的变异种子。",

        QUAGMIRE_FLOUR = "磨碎的小麦属植物谷粒。",
        QUAGMIRE_WHEAT = "新鲜的小麦属植物。",
        QUAGMIRE_WHEAT_SEEDS = "小麦属植物的变异谷粒。",
        --NOTE: raw/cooked carrot uses regular carrot strings
        QUAGMIRE_CARROT_SEEDS = "胡萝卜的变异种子。",

        QUAGMIRE_ROTTEN_CROP = "这个世界的土壤是腐臭的。",

		QUAGMIRE_SALMON = "红鲑！",
		QUAGMIRE_SALMON_COOKED = "香煎红鲑喵。",
		QUAGMIRE_CRABMEAT = "拟石蟹属生肉喵。",
		QUAGMIRE_CRABMEAT_COOKED = "它不再构成沙门氏菌威胁了喵。",
		QUAGMIRE_SUGARWOODTREE =
		{
			GENERIC = "多么独特的色彩。我想把它的叶子夹进我的书里喵！",
			STUMP = "我至少乐意研究一下它的年轮。",
			TAPPED_EMPTY = "汁液采集正在进行中喵。",
			TAPPED_READY = "没理由把它搁置。",
			TAPPED_BUGS = "这些昆虫纲动物被糖分吸引了。",
			WOUNDED = "它的内部结构已被损坏，但它还能复原。",
		},
		QUAGMIRE_SPOTSPICE_SHRUB =
		{
			GENERIC = "我对这个植物品种不熟悉。",
			PICKED = "我没时间等它重新长出来了。",
		},
		QUAGMIRE_SPOTSPICE_SPRIG = "它通过了通用的可食用测试。",
		QUAGMIRE_SPOTSPICE_GROUND = "加工完毕，可以用于烹饪了喵。",
		QUAGMIRE_SAPBUCKET = "采集树液的简易工具",
		QUAGMIRE_SAP = "这些树汁含糖量惊人。",
		QUAGMIRE_SALT_RACK =
		{
			READY = "结晶盐够多了，可以采收了喵。",
			GENERIC = "盐沉积物应该很快就会积聚在架子上了喵。",
		},

		QUAGMIRE_POND_SALT = "天然的钠盐泉喵。",
		QUAGMIRE_SALT_RACK_ITEM = "我们应该把它放在盐泉边。",

		QUAGMIRE_SAFE =
		{
			GENERIC = "这座城市以前的居民在这里面藏了好东西喵。",
			LOCKED = "肯定有一把配套的钥匙喵。",
		},

		QUAGMIRE_KEY = "我要去看看它能打开什么锁。",
		QUAGMIRE_KEY_PARK = "我相信这是用来打开公园大门的喵。",
        QUAGMIRE_PORTAL_KEY = "好一把精美的钥匙。",


		QUAGMIRE_MUSHROOMSTUMP =
		{
			GENERIC = "一大簇野生食用菌。",
			PICKED = "我认为它们还会重新长出来喵。",
		},
		QUAGMIRE_MUSHROOMS = "我不熟悉这个物种，不过它是可食用的。",
        QUAGMIRE_MEALINGSTONE = "这是能把我们的材料磨成粉的机械工具喵。",
		QUAGMIRE_PEBBLECRAB = "我想更近距离观察它的壳。",


		QUAGMIRE_RUBBLE_CARRIAGE = "一个曾经繁盛的文化的残留物喵。",
        QUAGMIRE_RUBBLE_CLOCK = "古老而不失精致喵。",
        QUAGMIRE_RUBBLE_CATHEDRAL = "有意思。看来他们并不拜饕餮。",
        QUAGMIRE_RUBBLE_PUBDOOR = "通往酒馆的门。",
        QUAGMIRE_RUBBLE_ROOF = "它崩塌了。",
        QUAGMIRE_RUBBLE_CLOCKTOWER = "钟表也被夺走了喵。",
        QUAGMIRE_RUBBLE_BIKE = "修不好了。",
        QUAGMIRE_RUBBLE_HOUSE =
        {
            "What creatures once lived here?",
            "There's nothing left of the inhabitants.",
            "What caused this city to crumble?",
        },
        QUAGMIRE_RUBBLE_CHIMNEY = "肯定是什么东西把它弄倒了。",
        QUAGMIRE_RUBBLE_CHIMNEY2 = "它快要支离破碎了喵。",
        QUAGMIRE_MERMHOUSE = "本地鱼类的栖息地。",
        QUAGMIRE_SWAMPIG_HOUSE = "啧啧！真是严重失修了喵。",
        QUAGMIRE_SWAMPIG_HOUSE_RUBBLE = "这个房子已经没法住了。",
        QUAGMIRE_SWAMPIGELDER =
        {
            GENERIC = "它们的群体有着严格区分的阶级角色喵。",
            SLEEPING = "它进入了快眼动阶段的睡眠。",
        },
        QUAGMIRE_SWAMPIG = "相当壮观的亚种喵！",

        QUAGMIRE_PORTAL = "我的怀疑是对的。它通往不止一个目的地。",
        QUAGMIRE_SALTROCK = "成团成簇的未加工氯化钠喵。",
        QUAGMIRE_SALT = "氯化钠。又名食盐。",
        --food--
        QUAGMIRE_FOOD_BURNT = "完全碳化了。",
        QUAGMIRE_FOOD =
        {
        	GENERIC = "我想，可以把它放在祭坛上了喵。",
            MISMATCH = "不适合用来喂大蛇。",
            MATCH = "用来安抚大蛇再合适不过了。",
            MATCH_BUT_SNACK = "食物没错，就是量不够喵。",
        },

        QUAGMIRE_FERN = "这种蕨类植物是可食用的。",
        QUAGMIRE_FOLIAGE_COOKED = "我相信我们可以做得更好。",
        QUAGMIRE_COIN1 = "足够用来施舍给当地人了。",
        QUAGMIRE_COIN2 = "一枚面值不小的硬币。",
        QUAGMIRE_COIN3 = "一枚价值不小的硬币。",
        QUAGMIRE_COIN4 = "它凝聚着某种魔力。",
        QUAGMIRE_GOATMILK = "我不会质疑它的来源。",
        QUAGMIRE_SYRUP = "一种甜味剂。",
        QUAGMIRE_SAP_SPOILED = "不再是食品级了。",
        QUAGMIRE_SEEDPACKET = "农作物的未来就装在这包东西里。",

        QUAGMIRE_POT = "大锅要久一点才能煮沸。",
        QUAGMIRE_POT_SMALL = "嗯，我们接下来要煮什么呢喵？",
        QUAGMIRE_POT_SYRUP = "它需要汁液喵。",
        QUAGMIRE_POT_HANGER = "习惯上，这是用来挂锅子的。",
        QUAGMIRE_POT_HANGER_ITEM = "在明火上煮东西的老式方法。",
        QUAGMIRE_GRILL = "也许该烤点肉了。",
        QUAGMIRE_GRILL_ITEM = "它需要放在地上。",
        QUAGMIRE_GRILL_SMALL = "比正常的小，但是也行喵。",
        QUAGMIRE_GRILL_SMALL_ITEM = "我需要把它放在某个地方才能用。",
        QUAGMIRE_OVEN = "它最适合用来制作甜品了。",
        QUAGMIRE_OVEN_ITEM = "需要所有部件都齐全，才能造出一台功能完整的烤箱喵。",
        QUAGMIRE_CASSEROLEDISH = "我确实喜欢好吃的炖菜。",
        QUAGMIRE_CASSEROLEDISH_SMALL = "够一个人吃喵。",
        QUAGMIRE_PLATE_SILVER = "我真想念体面的餐具喵。",
        QUAGMIRE_BOWL_SILVER = "碗的用处真不少。",
QUAGMIRE_CRATE = "Kitchen stuff.",

        QUAGMIRE_MERM_CART1 = "让我想起了我的流动图书馆岁月喵。", --sammy's wagon
        QUAGMIRE_MERM_CART2 = "里面有些好东西喵。", --pipton's cart
        QUAGMIRE_PARK_ANGEL = "一座蛮有趣的雕塑。",
        QUAGMIRE_PARK_ANGEL2 = "相当惊悚的纪念物喵。",
        QUAGMIRE_PARK_URN = "我想知道那是谁的骨灰。",
        QUAGMIRE_PARK_OBELISK = "真希望我能看懂写的是什么。",
        QUAGMIRE_PARK_GATE =
        {
            GENERIC = "我们现在应该可以全权进入了。",
            LOCKED = "要有钥匙才能打开喵。",
        },
        QUAGMIRE_PARKSPIKE = "是铸铁吧，好像。",
        QUAGMIRE_CRABTRAP = "用来诱捕海洋生物。",
        QUAGMIRE_TRADER_MERM = "他们似乎被隔离了。真愚蠢喵。",
        QUAGMIRE_TRADER_MERM2 = "他们似乎被隔离了。真愚蠢。",

        QUAGMIRE_GOATMUM = "也许她愿意做交易。",
        QUAGMIRE_GOATKID = "温柔可爱的幼年牛科动物。",
        QUAGMIRE_PIGEON =
        {
            DEAD = "已去世。",
            GENERIC = "一种惹人喜爱的鸠鸽科动物喵。",
            SLEEPING = "它进入了快眼动阶段的睡眠喵。",
        },
        QUAGMIRE_LAMP_POST = "我想知道，它的能量来源是什么？",

        QUAGMIRE_BEEFALO = "它的预期寿命已过去多年喵。",
        QUAGMIRE_SLAUGHTERTOOL = "真可怕。",

        QUAGMIRE_SAPLING = "它不会重新长出来了。",
        QUAGMIRE_BERRYBUSH = "那些浆果重新长出来需要时间，而我根本没时间。",

        QUAGMIRE_ALTAR_STATUE2 = "可怕的石像鬼喵。",
        QUAGMIRE_ALTAR_QUEEN = "规模宏大喵。",
        QUAGMIRE_ALTAR_BOLLARD = "这根柱子够好了。",
        QUAGMIRE_ALTAR_IVY = "常春藤属喵。",

        QUAGMIRE_LAMP_SHORT = "灯光，够好了喵。",

        --v2 Winona
        WINONA_CATAPULT =
        {
        	GENERIC = "那个薇诺娜足智多谋。",
        	OFF = "需要电源。",
        	BURNING = "哎呀，是谁干的喵？",
        	BURNT = "真希望她会再做一个喵。",
			SLEEP = "那个薇诺娜足智多谋。",
        },
        WINONA_SPOTLIGHT =
        {
        	GENERIC = "合理的安全措施喵。",
        	OFF = "需要电源。",
        	BURNING = "哎呀，是谁干的？",
        	BURNT = "真希望她会再做一个。",
			SLEEP = "合理的安全措施。",
        },
        WINONA_BATTERY_LOW =
        {
        	GENERIC = "为她的可爱发明提供电力。",
        	LOWPOWER = "嗯，她的发明准备没电了。",
        	OFF = "我去拿块硝石放进去喵？",
        	BURNING = "哎呀，是谁干的喵？",
        	BURNT = "真希望她会再做一个。",
        },
        WINONA_BATTERY_HIGH =
        {
			GENERIC = "她的思想开放，真好。",
			LOWPOWER = "魔法焦点很快就会用完。",
			OFF = "它需要一个新的魔法焦点喵。",
			BURNING = "哎呀，是谁干的？",
			BURNT = "真希望她会再做一个。",
			OVERLOADED = "可怜的小家伙操劳过度了。",
        },
		--v3 Winona
		WINONA_REMOTE =
		{
			GENERIC = "它能让她远程控制东西。",
			OFF = "需要电源。",
			CHARGING = "它能让她远程控制东西。",
			CHARGED = "它能让她远程控制东西。",
		},
		WINONA_TELEBRELLA =
		{
			GENERIC = "这个传送装置的外观真是异想天开。",
--fallback to speech_wilson.lua             MISSINGSKILL = "only_used_by_winona",
			OFF = "需要电源。",
			CHARGING = "这个传送装置的外观真是异想天开。",
			CHARGED = "这个传送装置的外观真是异想天开。",
		},
		WINONA_TELEPORT_PAD_ITEM =
		{
			GENERIC = "这倒是很方便。",
--fallback to speech_wilson.lua             MISSINGSKILL = "only_used_by_winona",
			OFF = "需要电源。",
			BURNING = "哎呀，是谁干的？",
			BURNT = "真希望她会再做一个。",
		},
		WINONA_STORAGE_ROBOT =
		{
			GENERIC = "薇诺娜的版本也毫不逊色喵。",
			OFF = "它需要电源",
			SLEEP = "薇诺娜的版本也毫不逊色喵。",
			CHARGING = "它连接着电源。",
			CHARGED = "看起来它有足够的动力。",
		},
		INSPECTACLESBOX = "only_used_by_winona喵",
		INSPECTACLESBOX2 = "only_used_by_winona喵",
		INSPECTACLESHAT = 
        {
            GENERIC = "它似乎是利用无线电波来定位异常物体。",
            MISSINGSKILL = "only_used_by_winona",
        },
		ROSEGLASSESHAT =
        {
            GENERIC = "薇诺娜对它的功能一直守口如瓶。",
            MISSINGSKILL = "only_used_by_winona喵",
        },
		CHARLIERESIDUE = "only_used_by_winona",
		CHARLIEROSE = "only_used_by_winona",
        WINONA_MACHINEPARTS_1 = "only_used_by_winona",
        WINONA_MACHINEPARTS_2 = "only_used_by_winona",
		WINONA_RECIPESCANNER = "only_used_by_winona",
		WINONA_HOLOTELEPAD = "only_used_by_winona喵",
		WINONA_HOLOTELEBRELLA = "only_used_by_winona",

        --Wormwood
        COMPOSTWRAP = "天啊，好大的粪便喵。",
        ARMOR_BRAMBLE = "由我们的好朋友亲手编织而成喵。",
        TRAP_BRAMBLE = "荆棘上密布着微小的倒钩，令人十分不悦。",

        BOATFRAGMENT03 = "真可惜啊。",
        BOATFRAGMENT04 = "真可惜啊。",
        BOATFRAGMENT05 = "真可惜啊。",
		BOAT_LEAK = "我们的船进水了。",
        MAST = "扬帆，起航！",
        SEASTACK = "搁浅在上面就不好了喵。",
        FISHINGNET = "海洋是一座宝库，提供了生存所需的各种资源喵。", --unimplemented
        ANTCHOVIES = "哦，我知道了！这是一种全新的海洋生物！", --unimplemented
        STEERINGWHEEL = "掌舵一艘船可不容易。",
        ANCHOR = "这个锚可以装在我们的舰艇上喵。",
        BOATPATCH = "船体维修工具。",
        DRIFTWOOD_TREE =
        {
            BURNING = "树在燃烧。",
            BURNT = "完完整整的碳化了",
            CHOPPED = "没什么实用价值了。",
            GENERIC = "新材料对我们能派上用场喵。",
        },

        DRIFTWOOD_LOG = "天然的浮力材料。",

        MOON_TREE =
        {
            BURNING = "可惜，浪费了资源。",
            BURNT = "完完整整的碳化了",
            CHOPPED = "没什么实用价值了。",
            GENERIC = "似乎被周遭月亮的能量改变了喵。",
        },
		MOON_TREE_BLOSSOM = "真是奇怪的物种啊。",

        MOONBUTTERFLY =
        {
        	GENERIC = "它身上的绿色来自于体内的月球残余物。",
        	HELD = "这个我能用的上喵。",
        },
		MOONBUTTERFLYWINGS = "如同我所怀疑的一样，月球残余物的含量非常高喵。",
        MOONBUTTERFLY_SAPLING = "这里的飞蛾和树木都发生了变异。",
        ROCK_AVOCADO_FRUIT = "外部是矿物，里面却是有机物。",
        ROCK_AVOCADO_FRUIT_RIPE = "我想吃新鲜的牛油果。",
        ROCK_AVOCADO_FRUIT_RIPE_COOKED = "很安全，可以吃。",
        ROCK_AVOCADO_FRUIT_SPROUT = "这个阶段还是让它先长大比较好。",
        ROCK_AVOCADO_BUSH =
        {
        	BARREN = "已经过了生命周期中的生育阶段。",
			WITHERED = "不具备这种植物成长所需的理想环境喵。",
			GENERIC = "那肯定不是水果。",
			PICKED = "月球土壤长出的灌木喵。",
			DISEASED = "恐怕是染上了疾病。", --unimplemented
            DISEASING = "嗯，我看到叶子边上发黄了喵。", --unimplemented
			BURNING = "可惜，浪费了资源。",
		},
        DEAD_SEA_BONES = "令人好奇的骨架结构喵。",
        HOTSPRING =
        {
        	GENERIC = "我这双老脚应该好好泡泡了。",
        	BOMBED = "对，我稍后肯定要泡脚喵。",
        	GLASS = "我现在强烈质疑月光玻璃的有机构成喵。",
			EMPTY = "假以时日，泉水会自己补满的。",
        },
        MOONGLASS = "也许我能留一个样本，研究它的成分。",
        MOONGLASS_CHARGED = "能量似乎不稳定，我得尽快利用它。",
        MOONGLASS_ROCK = "虽然看起来像矿物质，但可能是有机物喵。",
        BATHBOMB = "嗯，我最喜欢边泡热水澡，边看书了。",
        TRAP_STARFISH =
        {
            GENERIC = "我是你的话会小心的避开它。",
            CLOSED = "跟双子叶植物纲捕蝇草属的捕猎方法相同。",
        },
        DUG_TRAP_STARFISH = "它不再是危险了。",
        SPIDER_MOON =
        {
        	GENERIC = "土壤中的矿物质可能激发了它的敌意。",
        	SLEEPING = "太好了，它在睡觉。",
        	DEAD = "不在了就好。",
        },
        MOONSPIDERDEN = "这些可怜的丑陋生物在这里筑了巢。",
		FRUITDRAGON =
		{
			GENERIC = "动植物在这个标本中融为了一体喵。",
			RIPE = "闻起来很美味喵。",
			SLEEPING = "处于深度睡眠中。",
		},
        PUFFIN =
        {
            GENERIC = "亲爱的长角海鹦属鸟儿！",
            HELD = "可爱的鸟儿啊喵。",
            SLEEPING = "处于深度睡眠中喵。",
        },

		MOONGLASSAXE = "对于效率的追求是无止境的喵！",
		GLASSCUTTER = "我喜欢单刀直入喵。",

        ICEBERG =
        {
            GENERIC = "我们不能让船撞上冰山。", --unimplemented
            MELTED = "从危险的固体变成了无害的液体。谢谢你，热量。", --unimplemented
        },
        ICEBERG_MELTED = "从危险的固体变成了无害的液体。谢谢你，热量。", --unimplemented

        MINIFLARE = "人群聚在一起会安全一点。",
        MEGAFLARE = "我可以把对手引到我所选择的地方。",

		MOON_FISSURE =
		{
			GENERIC = "我看过麦斯威尔的燃料，和它不是同一种魔法。",
			NOLIGHT = "我开始理解这里的月亮周期了喵。",
		},
        MOON_ALTAR =
        {
            MOON_ALTAR_WIP = "它说我如果能完成就会告诉我一个秘密。",
            GENERIC = "有个声音在说它有知识要分享。",
        },

        MOON_ALTAR_IDOL = "它的能量在刺激着我的大脑喵。",
        MOON_ALTAR_GLASS = "我相信它在试图跟我进行心灵感应喵。",
        MOON_ALTAR_SEED = "它向我的大脑投射了一个祭坛的图像。",

        MOON_ALTAR_ROCK_IDOL = "我认为最好还是把它开采出来。",
        MOON_ALTAR_ROCK_GLASS = "我认为最好还是把它开采出来。",
        MOON_ALTAR_ROCK_SEED = "我认为最好还是把它开采出来。",

        MOON_ALTAR_CROWN = "来吧，让我带你回到属于你的地方吧。",
        MOON_ALTAR_COSMIC = "说明还有很多知识等待着我们去寻找。",

        MOON_ALTAR_ASTRAL = "你准备好和我分享你的知识了吗？",
        MOON_ALTAR_ICON = "它把一种紧迫感投射到了我的心中。",
        MOON_ALTAR_WARD = "这是在传达一种想被重建的消息。",

        SEAFARING_PROTOTYPER =
        {
            GENERIC = "注意力集中在海上是好事喵。",
            BURNT = "真不负责喵。",
        },
        BOAT_ITEM = "这将赋予我们航海的能力。",
        BOAT_GRASS_ITEM = "它的耐用性值得怀疑，但当下还能凑活喵。",
        STEERINGWHEEL_ITEM = "掌舵船只的必需品。",
        ANCHOR_ITEM = "这能让我们给船造一个锚。",
        MAST_ITEM = "利用风能的工具。",
        MUTATEDHOUND =
        {
        	DEAD = "真可惜啊。",
        	GENERIC = "又是种月亮带来的变异...嗯。",
        	SLEEPING = "我想更近距离的观察它。",
        },

        MUTATED_PENGUIN =
        {
			DEAD = "那东西被解决了。",
			GENERIC = "某种能量使得这个物种产生了错误变异喵。",
			SLEEPING = "没有理由吵醒它。",
		},
        CARRAT =
        {
        	DEAD = "或许不用这样吧。",
        	GENERIC = "惊人啊，又一种动植物杂交品种。多么神奇。",
        	HELD = "动植物和谐的融合在了一起喵。",
        	SLEEPING = "处于深度睡眠中。",
        },

		BULLKELP_PLANT =
        {
            GENERIC = "褐藻门海带科。",
            PICKED = "褐藻门海带科植物需要时间重新生长。",
        },
		BULLKELP_ROOT = "公牛海带果然名不虚传喵。",
        KELPHAT = "据说可以影响人的精神健康喵。",
		KELP = "一种可食用的海带标本喵。",
		KELP_COOKED = "烹饪并没有提升口感喵。",
		KELP_DRIED = "新的口感让它稍微可口了一些。",

		GESTALT = "是某种强大力量的投射物喵。",
        GESTALT_GUARD = "相比小型的同类，它们拥有更高的防御能力。",

		COOKIECUTTER = "它的眼睛盯死了我的筏子。",
		COOKIECUTTERSHELL = "厚厚的碳酸钙外壳喵。",
		COOKIECUTTERHAT = "哎，这个味道很难闻。",
		SALTSTACK =
		{
			GENERIC = "着实有趣……不过这些雕塑是如何建造的？",
			MINED_OUT = "盐已经被开采了。",
			GROWING = "哎呀……它们尽然是浑然天成的喵。",
		},
		SALTROCK = "它在以一种奇异的几何样式增长。",
		SALTBOX = "应该能阻止食物变质喵。",

		TACKLESTATION = "工欲善其事，必先利其器喵。",
		TACKLESKETCH = "有意思！可预见到会极大提升我的鱼技！",

        MALBATROSS = "它似乎属于信天翁科。",
        MALBATROSS_FEATHER = "它的羽毛有着近乎鱼鳞的质感。",
        MALBATROSS_BEAK = "他们的喙进化的非常适合抓住溜滑的猎物喵。",
        MAST_MALBATROSS_ITEM = "扬起风帆，驶向远方！",
        MAST_MALBATROSS = "多么引人注目的翼展啊！",
		MALBATROSS_FEATHERED_WEAVE = "一种结实，轻盈的材料。",

        GNARWAIL =
        {
            GENERIC = "它似乎是哺乳纲一角鲸的变种。",
            BROKENHORN = "你活该被烧喵。",
            FOLLOWER = "他变得礼貌多了。",
            BROKENHORN_FOLLOWER = "亲爱的，以后肯定会长回来的喵。",
        },
        GNARWAIL_HORN = "一角鲸的\"角\"其实是它的牙齿，知道吧。",

        WALKINGPLANK = "对于受困海上的人，这是一条危险的逃跑路线。",
        WALKINGPLANK_GRASS = "对于受困海上的人，这是一条危险的逃跑路线。",
        OAR = "一、二；一、二！",
		OAR_DRIFTWOOD = "更轻，更有效的设计。",

		OCEANFISHINGROD = "结实的杆子，适合海钓。",
		OCEANFISHINGBOBBER_NONE = "使用浮漂可以提升钓竿的准度喵。",
        OCEANFISHINGBOBBER_BALL = "人类有记载的首次使用钓鱼浮漂是在1496年喵。",
        OCEANFISHINGBOBBER_OVAL = "人类有记载的首次使用钓鱼浮漂是在1496年。",
		OCEANFISHINGBOBBER_CROW = "人类有记载的首次使用钓鱼浮漂是在1496年喵。",
		OCEANFISHINGBOBBER_ROBIN = "人类有记载的首次使用钓鱼浮漂是在1496年喵。",
		OCEANFISHINGBOBBER_ROBIN_WINTER = "人类有记载的首次使用钓鱼浮漂是在1496年喵。",
		OCEANFISHINGBOBBER_CANARY = "人类有记载的首次使用钓鱼浮漂是在1496年喵。",
		OCEANFISHINGBOBBER_GOOSE = "硕大的羽毛确实让人眼前一亮喵。",
		OCEANFISHINGBOBBER_MALBATROSS = "硕大的羽毛确实让人眼前一亮。",

		OCEANFISHINGLURE_SPINNER_RED = "它在白天能更好的发挥效用。",
		OCEANFISHINGLURE_SPINNER_GREEN = "它在黄昏能更好的发挥效用。",
		OCEANFISHINGLURE_SPINNER_BLUE = "它在夜晚能更好的发挥效用。",
		OCEANFISHINGLURE_SPOON_RED = "它在白天能更好的发挥效用。",
		OCEANFISHINGLURE_SPOON_GREEN = "它在黄昏时能更好的发挥效用。",
		OCEANFISHINGLURE_SPOON_BLUE = "它在夜晚能更好的发挥效用。",
		OCEANFISHINGLURE_HERMIT_RAIN = "好像是配合降水使用的。",
		OCEANFISHINGLURE_HERMIT_SNOW = "适用于降雪天气。",
		OCEANFISHINGLURE_HERMIT_DROWSY = "真迷人！它的脊骨分泌一种强劲的神经毒素喵。",
		OCEANFISHINGLURE_HERMIT_HEAVY = "这会确保我能抓到一条大标本。",

		OCEANFISH_SMALL_1 = "非常微小的标本。",
		OCEANFISH_SMALL_2 = "咸水鱼的小标本。",
		OCEANFISH_SMALL_3 = "小型生物。",
		OCEANFISH_SMALL_4 = "它们只能长到这样大小。",
		OCEANFISH_SMALL_5 = "我不熟悉这类的生物……",
		OCEANFISH_SMALL_6 = "有意思，它似乎伪装错了环境喵。",
		OCEANFISH_SMALL_7 = "哎呀，你简直太搭配我家里那个花园了。",
		OCEANFISH_SMALL_8 = "小心啊，孩子们，一定不要直视它。",
        OCEANFISH_SMALL_9 = "虽说颜色不同寻常，但与射水鱼并无二致。",

		OCEANFISH_MEDIUM_1 = "噢天啊……这看起来正常么喵？",
		OCEANFISH_MEDIUM_2 = "这种物种通常喜欢深水喵。",
		OCEANFISH_MEDIUM_3 = "噢，天啊，我相信这些是入侵物种。",
		OCEANFISH_MEDIUM_4 = "我从来就没迷信过黑猫，更别说是鲶鱼了喵！",
		OCEANFISH_MEDIUM_5 = "动植物的迷人组合喵。",
		OCEANFISH_MEDIUM_6 = "似乎是欧洲鲤的一种亚种。",
		OCEANFISH_MEDIUM_7 = "似乎是欧洲鲤的一种亚种。",
		OCEANFISH_MEDIUM_8 = "当然，所有鱼类都是冷血动物，但这也太神奇了。",
        OCEANFISH_MEDIUM_9 = "我推测它的颜色是多年进食无花果后导致的。",

		PONDFISH = "我猜应该是某种白鲑鱼喵。",
		PONDEEL = "是鳗鱼喵。",

        FISHMEAT = "一块有气味的鱼肉喵。",
        FISHMEAT_COOKED = "烤得真好。",
        FISHMEAT_SMALL = "水生动物的肉喵。",
        FISHMEAT_SMALL_COOKED = "小小的营养物。",
		SPOILED_FISH =
        {
            GENERIC = "那块鱼肉已经变成了生物危害物喵。",
--fallback to speech_wilson.lua             CAN_PROCESS = "only_used_by_wx78",
        },

		FISH_BOX = "海鲜的精密保鲜设备喵。",
        POCKET_SCALE = "我随时准备好称重。",

		TACKLECONTAINER = "东西收拾干净心灵才能干净喵。",
		SUPERTACKLECONTAINER = "什么都能装、收拾的井井有条。",

		TROPHYSCALE_FISH =
		{
			GENERIC = "展示大型水生植物的设备。",
			HAS_ITEM = "重量: {weight}\n捕获人: {owner}喵",
			HAS_ITEM_HEAVY = "重量: {weight}\n捕获人: {owner}\n成绩喜人喵!",
			BURNING = "天啊，这应该不属于设计功能之一。",
			BURNT = "噢，不好...",
			OWNER = "重量: {weight}\n捕获人: {owner}\n欧吼！看来我是胜利者了！",
			OWNER_HEAVY = "重量: {weight}\n捕获人: {owner}\n钓鱼还挺容易的，不是吗？",
		},

		OCEANFISHABLEFLOTSAM = "噢，真脏！",

		CALIFORNIAROLL = "美味的寿司卷喵。",
		SEAFOODGUMBO = "我已经感觉到了胃灼热！",
		SURFNTURF = "完美佳肴喵。",

        WOBSTER_SHELLER = "非常有趣的无脊椎动物喵。",
        WOBSTER_DEN = "节肢动物的家喵。",
        WOBSTER_SHELLER_DEAD = "我也可能现在就吃掉它。",
        WOBSTER_SHELLER_DEAD_COOKED = "晚餐准备好了喵！",

        LOBSTERBISQUE = "我几乎忘记了真正的食物是什么味道。",
        LOBSTERDINNER = "太堕落了。",

        WOBSTER_MOONGLASS = "这种节肢动物进化出了适合它环境的能力。",
        MOONGLASS_WOBSTER_DEN = "看样子是某种动物的巢穴喵。",

		TRIDENT = "它能制造出强大的波浪！",

		WINCH =
		{
			GENERIC = "人类使用绞盘已经有几百年的历史了。",
			RETRIEVING_ITEM = "实践加精确度出真知喵！",
			HOLDING_ITEM = "我抓到了个东西！",
		},

        HERMITHOUSE = {
            GENERIC = "啧啧。瞧瞧它的状态喵……",
            BUILTUP = "提升居住空间能极大改善一个人的心情。",
        },

        SHELL_CLUSTER = "迷人的软体动物集合！",
        --
		SINGINGSHELL_OCTAVE3 =
		{
			GENERIC = "嘘嘘嘘！",
		},
		SINGINGSHELL_OCTAVE4 =
		{
			GENERIC = "嘘嘘嘘喵！",
		},
		SINGINGSHELL_OCTAVE5 =
		{
			GENERIC = "嘘嘘嘘！",
        },

        CHUM = "最好不要追究它的成分。",

        SUNKENCHEST =
        {
            GENERIC = "体型庞大，功能齐全的软体动物。",
            LOCKED = "哦，亲爱的。我们需要一把钥匙。",
        },

        HERMIT_BUNDLE = "多多益善！",
        HERMIT_BUNDLE_SHELLS = "多多益善喵！",

        RESKIN_TOOL = "我们早就应该大扫除了。",
        MOON_FISSURE_PLUGGED = "老天啊，堵了这么多，多么坚持不懈啊！",


		----------------------- ROT STRINGS GO ABOVE HERE ------------------

		-- Walter
        WOBYBIG =
        {
            "There must be a mutagen in monster meat that triggers her growth.",
            "There must be a mutagen in monster meat that triggers her growth.",
        },
        WOBYSMALL =
        {
            "I was always more of a cat person, but she is very sweet.",
            "I was always more of a cat person, but she is very sweet.",
        },
		WALTERHAT = "我想，人必须努力保持年轻的心态。",
		SLINGSHOT =
		{
			GENERIC = "这个一定小心使用，亲爱的喵。",
--fallback to speech_wilson.lua 			NOT_MINE = "only_used_by_walter",
		},
		SLINGSHOTAMMO_ROCK = "亲爱的，自己弄脏的记得要自己打扫。",
		SLINGSHOTAMMO_MARBLE = "亲爱的，自己弄脏的记得要自己打扫。",
		SLINGSHOTAMMO_THULECITE = "亲爱的，自己弄脏的记得要自己打扫。",
        SLINGSHOTAMMO_GOLD = "亲爱的，自己弄脏的记得要自己打扫。",
		SLINGSHOTAMMO_HONEY = "亲爱的，自己弄脏的记得要自己打扫喵。",
        SLINGSHOTAMMO_SLOW = "亲爱的，自己弄脏的记得要自己打扫。",
        SLINGSHOTAMMO_FREEZE = "亲爱的，自己弄脏的记得要自己打扫。",
		SLINGSHOTAMMO_POOP = "噢，不好...",
		SLINGSHOTAMMO_STINGER = "亲爱的，自己弄脏的记得要自己打扫。",
		SLINGSHOTAMMO_MOONGLASS = "亲爱的，自己弄脏的记得要自己打扫。",
		SLINGSHOTAMMO_GELBLOB = "亲爱的，自己弄脏的记得要自己打扫。",
		SLINGSHOTAMMO_SCRAPFEATHER = "亲爱的，自己弄脏的记得要自己打扫。",
        SLINGSHOTAMMO_DREADSTONE = "亲爱的，自己弄脏的记得要自己打扫。",
        SLINGSHOTAMMO_GUNPOWDER = "亲爱的，自己弄脏的记得要自己打扫。",
        SLINGSHOTAMMO_LUNARPLANTHUSK = "亲爱的，自己弄脏的记得要自己打扫喵。",
        SLINGSHOTAMMO_PUREBRILLIANCE = "亲爱的，自己弄脏的记得要自己打扫。",
        SLINGSHOTAMMO_HORRORFUEL = "亲爱的，自己弄脏的记得要自己打扫。",
        PORTABLETENT = "这是一个可爱的帐篷，但我恐怕没有什么用处喵。",
        PORTABLETENT_ITEM = "多么实用啊喵。",

        -- Wigfrid
        BATTLESONG_DURABILITY = "如果我没记错的话，这是音乐记谱符号喵。",
        BATTLESONG_HEALTHGAIN = "如果我没记错的话，这是音乐记谱符号。",
        BATTLESONG_SANITYGAIN = "如果我没记错的话，这是音乐记谱符号喵。",
        BATTLESONG_SANITYAURA = "如果我没记错的话，这是音乐记谱符号喵。",
        BATTLESONG_FIRERESISTANCE = "如果我没记错的话，这是音乐记谱符号喵。",
        BATTLESONG_INSTANT_TAUNT = "哦，我的天，这些都是一些相当丰富多彩的语汇。",
        BATTLESONG_INSTANT_PANIC = "啊，我最喜欢那些古典的唱词了喵！",

        -- Webber
        MUTATOR_WARRIOR = "多么有趣啊！它被摄入后似乎会改变蛛形纲动物的形态。",
        MUTATOR_DROPPER = "亲爱的，它们很可爱。",
        MUTATOR_HIDER = "多么有趣啊！它被摄入后似乎会改变蛛形纲动物的形态。",
        MUTATOR_SPITTER = "亲爱的，它们很可爱喵。",
        MUTATOR_MOON = "多么有趣啊！它被摄入后似乎会改变蛛形纲动物的形态喵。",
        MUTATOR_HEALER = "亲爱的，它们很可爱。",
        SPIDER_WHISTLE = "蛛形纲动物似乎觉得这种声音很好听。",
        SPIDERDEN_BEDAZZLER = "完成后一定要整理好，年轻的蛛形纲动物。",
        SPIDER_HEALER = "这种蛛形纲动物进化出了治疗周围其他人的能力。",
        SPIDER_REPELLENT = "不幸的是，似乎这些蛛形纲动物只对它们的同类有反应喵。",
        SPIDER_HEALER_ITEM = "这种膏药似乎是专门为治疗蛛形纲动物而配制的。",

		-- Wendy
		GHOSTLYELIXIR_SLOWREGEN = "按颜色分了类，标识清晰。干得漂亮！",
		GHOSTLYELIXIR_FASTREGEN = "按颜色分了类，标识清晰。干得漂亮！",
		GHOSTLYELIXIR_SHIELD = "按颜色分了类，标识清晰。干得漂亮！",
		GHOSTLYELIXIR_ATTACK = "按颜色分了类，标识清晰。干得漂亮喵！",
		GHOSTLYELIXIR_SPEED = "按颜色分了类，标识清晰。干得漂亮喵！",
		GHOSTLYELIXIR_RETALIATION = "按颜色分了类，标识清晰。干得漂亮！",
        GHOSTLYELIXIR_REVIVE = "按颜色分了类，标识清晰。干得漂亮！",
		SISTURN =
		{
			GENERIC = "可怜的亲爱的。",
			SOME_FLOWERS = "花朵是传统上祭献逝者的一种供品。",
			LOTS_OF_FLOWERS = "花朵似乎吐露着芬芳。",
            LOTS_OF_FLOWERS_EVIL = "这些花会影响精神稳定。",
            LOTS_OF_FLOWERS_BLOSSOM = "They generate an unearthly sound.",   
		},

        --Wortox
--fallback to speech_wilson.lua         WORTOX_SOUL = "only_used_by_wortox", --only wortox can inspect souls
        --WORTOX_DECOY is not needed because it uses the default WORTOX inspection.
        WORTOX_NABBAG = "他可千万别跟那个讨厌的坎普斯学坏喵。",
        WORTOX_REVIVER = "只要人人都为自己的行为负责，我们就永远都用不到它。",
        WORTOX_SOULJAR = "灵魂的容器。",

        PORTABLECOOKPOT_ITEM =
        {
            GENERIC = "能吃点像样的东西真是太好了。",
            DONE = "闻起来很滋补。",

			COOKING_LONG = "耐心是美德！",
			COOKING_SHORT = "马上就能完成喵。",
			EMPTY = "嗯，我来动手弄点吃的吧。",
        },

        PORTABLEBLENDER_ITEM = "非常活泼的厨具。",
        PORTABLESPICER_ITEM =
        {
            GENERIC = "得花点力气了。",
            DONE = "调味品准备好了喵。",
        },
        SPICEPACK = "这应该能防止我的粮食变坏喵！",
        SPICE_GARLIC = "苍天啊，怎么这么大的味儿喵。",
        SPICE_SUGAR = "果糖。",
        SPICE_CHILI = "我不喜欢吃辣喵。",
        SPICE_SALT = "捏一点就够了喵。",
        MONSTERTARTARE = "盛装打扮的怪物肉。",
        FRESHFRUITCREPES = "吃完手会黏黏的。",
        FROGFISHBOWL = "我主动要求试吃喵。",
        POTATOTORNADO = "真有创意！",
        DRAGONCHILISALAD = "就喜欢新鲜的绿叶蔬菜喵。",
        GLOWBERRYMOUSSE = "全新的菜色。太棒了！",
        VOLTGOATJELLY = "有限的材料缺做出此等美味，着实令人刮目相看。",
        NIGHTMAREPIE = "吃起来有些像魔法。",
        BONESOUP = "美味极了。再来一碗。",
        MASHEDPOTATOES = "忍不住想试几口喵。",
        POTATOSOUFFLE = "看起来很棒，亲爱的。",
        MOQUECA = "真是才华横溢。",
        GAZPACHO = "啊！经典的西班牙美食喵。",
        ASPARAGUSSOUP = "难闻，但相当营养。",
        VEGSTINGER = "真是辣",
        BANANAPOP = "嗯，这难道不提神吗？",
        CEVICHE = "可以再加一点调味汁。",
        SALSA = "我的天，味道真刺激！",
        PEPPERPOPPER = "对我而言有一点辣了！",

        TURNIP = "根部可食用的芸薹属植物。",
        TURNIP_COOKED = "烤芸薹属植物喵。",
        TURNIP_SEEDS = "亲爱的，不种下的话它是不能生长的。",

        GARLIC = "百合科葱属植物，洋葱葱属植物的近亲。",
        GARLIC_COOKED = "烤百合科葱属植物。",
        GARLIC_SEEDS = "亲爱的，不种下的话它是不能生长的喵。",

        ONION = "可食用的球茎状洋葱葱属植物。",
        ONION_COOKED = "烤洋葱葱属植物。",
        ONION_SEEDS = "亲爱的，不种下的话它是不能生长的喵。",

        POTATO = "茄科茄属植物马铃薯，在某些文化里属于主食。",
        POTATO_COOKED = "烤茄科茄属植物马铃薯。",
        POTATO_SEEDS = "亲爱的，不种下的话它是不能生长的。",

        TOMATO = "茄科茄属植物西红柿的果实喵。",
        TOMATO_COOKED = "烤茄科茄属植物西红柿。",
        TOMATO_SEEDS = "亲爱的，不种下的话它是不能生长的喵。",

        ASPARAGUS = "富含膳食纤维。",
        ASPARAGUS_COOKED = "它被消化的时候会释放出硫化合物喵。",
        ASPARAGUS_SEEDS = "亲爱的，不种下的话它是不能生长的喵。",

        PEPPER = "如果没错的话，应该是辣椒属的作物。",
        PEPPER_COOKED = "我要小心，千万不能揉眼睛。",
        PEPPER_SEEDS = "亲爱的，不种下的话它是不能生长的。",

        WEREITEM_BEAVER = "看起来会引发灾难。",
        WEREITEM_GOOSE = "一种对加拿大鹅的艺术呈现喵。",
        WEREITEM_MOOSE = "亲爱的，有人会不小心绊倒的。",

        MERMHAT = "I'm not eager to test out its effectiveness.",        
        MERMTHRONE =
        {
            GENERIC = "这种\"坐的下就给你坐\"的君主筛选,我再熟悉不过了喵。",
            BURNT = "哦，天啊，他们得从头来过了喵。",
        },
        MOSQUITOMUSK = "费洛蒙能让人不被诅咒的吸血虫察觉喵。",
        MOSQUITOBOMB = "绝对恐怖。它让我浑身起疙瘩喵。",
        MOSQUITOFERTILIZER = "肥料的效果与臭味成正比。",
        MOSQUITOMERMSALVE = "注入新鲜血液似乎能增强鱼人的整体健康。",

        MERMTHRONE_CONSTRUCTION =
        {
            GENERIC = "别被碎片割到，亲爱的。",
            BURNT = "噢，天啊……",
        },
        MERMHOUSE_CRAFTED =
        {
            GENERIC = "我很欣慰她在做建设性的工作喵。",
            BURNT = "噢，不好...",
        },

        MERMWATCHTOWER_REGULAR = "他们看起来找到了新领袖。",
        MERMWATCHTOWER_NOKING = "原始但却高效的堡垒。",
        MERMKING = "这里他说了算。",
        MERMGUARD = "皇家保镖。",
        MERM_PRINCE = "很明显的，这就是储君喵。",

        SQUID = "发光纲头足属！多么美丽的生物发光喵！",

		GHOSTFLOWER = "恐怕我并不熟悉这种物种喵。",
        SMALLGHOST = "单靠你可爱的样子不足以赢得我的信任！",

        CRABKING =
        {
            GENERIC = "不知它硕大的体型是天然演化，还是月光引起的突变？",
            INERT = "像一个珠宝架喵。",
        },
		CRABKING_CLAW = "谢天谢地，我对贝类不过敏。",

		MESSAGEBOTTLE = "不是最有效的寄件方法。",
		MESSAGEBOTTLEEMPTY = "这种类型的瓶子被广泛用于制作罐头。",

        MEATRACK_HERMIT =
        {
            DONE = "这个过程已经完成了喵。",
            DRYING = "脱水是一个缓慢的过程喵。",
            DRYINGINRAIN = "下雨让脱水过程暂停了喵。",
            GENERIC = "看来我们的几丁质的朋友可以使用一些帮助。",
            BURNT = "它似乎并不是很牢固喵。",
            DONE_NOTMEAT = "这个过程已经完成了。",
            DRYING_NOTMEAT = "脱水是一个缓慢的过程。",
            DRYINGINRAIN_NOTMEAT = "下雨让脱水过程暂停了喵。",
        },
        BEEBOX_HERMIT =
        {
            READY = "可以在它那里采到蜜。",
            FULLHONEY = "可以在它那里采到蜜。",
            GENERIC = "它似乎是一种老式的养蜂场。",
            NOHONEY = "里面没有蜂蜜。",
            SOMEHONEY = "还没到收获蜂蜜的时候喵。",
            BURNT = "可怜的蜜蜂喵！",
        },

        HERMITCRAB = "天呀，她有点粗鲁，不是吗喵？",

        HERMIT_PEARL = "噢，亲爱的，我真希望能找到他。",
        HERMIT_CRACKED_PEARL = "我应该告诉她。",

        -- DSEAS
        WATERPLANT = "我对这个品种的海生植物并不熟悉喵。",
        WATERPLANT_BOMB = "我们最好躲开这些。",
        WATERPLANT_BABY = "这个一定是个幼体。",
        WATERPLANT_PLANTER = "也许我有天会重新回到园艺领域。",

        SHARK = "太神奇了！整个下巴似乎是由活石组成的！",

        MASTUPGRADE_LAMP_ITEM = "我特别欣赏一盏好的阅读灯。",
        MASTUPGRADE_LIGHTNINGROD_ITEM = "一个非常明智的安全措施。",

        WATERPUMP = "这只是常识。",

        BARNACLE = "古代的人认为鹅是由藤壶长出来的。你能想象吗？",
        BARNACLE_COOKED = "正如我所猜测的那样，它的味道一点也不像鹅肉。",

        BARNACLEPITA = "一个相当有趣的组合。",
        BARNACLESUSHI = "我想我已经开始喜欢上它了。",
        BARNACLINGUINE = "哦，天哪，味道十分丰富。",
        BARNACLESTUFFEDFISHHEAD = "我不认为我可以忍受它喵。",

        LEAFLOAF = "如此不寻常的味道！",
        LEAFYMEATBURGER = "至少我不用担心不够熟。",
        LEAFYMEATSOUFFLE = "好像是用一种植物源的明胶做的喵。",
        MEATYSALAD = "尽管是沙拉，但是它还有不少蛋白质。",

        -- GROTTO

		MOLEBAT = "我猜想这令人印象深刻的鼻子一定是为了弥补它糟糕的视力喵。",
        MOLEBATHILL = "这个小山丘似乎主要由脓鼻涕和泥组成。",

        BATNOSE = "生物的进化真的很了不起。",
        BATNOSE_COOKED = "稍微好一些了。",
        BATNOSEHAT = "多么……有创意。",

        MUSHGNOME = "我应该将你归类为动物还是真菌呢？",

        SPORE_MOON = "一种古怪而又有效的防御机制。",

        MOON_CAP = "它似乎具有很强的诱导睡眠的特性喵。",
        MOON_CAP_COOKED = "真奇怪。一旦煮熟了，它们就具有刺激性了。",

        MUSHTREE_MOON = "我怀疑是水中的一些物质导致了它的变化。",

        LIGHTFLIER = "如果能说服它静止不动，它将是一盏极好的阅读灯。",

        GROTTO_POOL_BIG = "真有意思，好像是在形成月光玻璃石笋。",
        GROTTO_POOL_SMALL = "真有意思，好像是在形成月光玻璃石笋。",

        DUSTMOTH = "如果它能帮我打理图书馆，我会很高兴的。",

        DUSTMOTHDEN = "似乎是这些生物体内的化学反应产生了铥矿。",

        ARCHIVE_LOCKBOX = "似乎要接外部能量源才能启用。",
        ARCHIVE_CENTIPEDE = "一件令人印象深刻的古代工程产品。",
        ARCHIVE_CENTIPEDE_HUSK = "这些零件看起来出故障了喵。",

        ARCHIVE_COOKPOT =
        {
            COOKING_LONG = "还要等一会儿才能煮好喵。",
            COOKING_SHORT = "快好了！",
            DONE = "晚餐时间到喵！",
            EMPTY = "我猜测它有专门针对这些房间的用途。",
            BURNT = "现在它是真正的废弃了喵。",
        },

        ARCHIVE_MOON_STATUE = "这些房间似乎比其他遗迹年份更早。",
        ARCHIVE_RUNE_STATUE =
        {
            LINE_1 = "真是迷人！这些字形似乎是他们的语言演变的基础。",
            LINE_2 = "暗影燃料的引入，一定对他们的文化产生了巨大的影响喵。",
            LINE_3 = "这些字形一定是在他们发现暗影燃料之前就存在了。",
            LINE_4 = "这个字形一直在重复出现……如果我能解读它的意思就好了。",
            LINE_5 = "这里还需要进一步研究。",
        },
		VAULT_RUNE = "这些相当复杂喵。",
		VAULT_STATUE =
		{
			LORE1 = "看来古代国王已将自己献给了黑暗。",
			LORE2 = "这是对灭绝级事件的描绘。",
			LORE3 = "这些一定是古代昆虫社会的士兵阶层喵。",
            --
            LORE1_STALKER = "从那以后，你果然长进了不少。", -- when the stalker/king is with you, different inspect for the king statue!
		},

        ARCHIVE_RESONATOR = {
            GENERIC = "探索之路在等待着我们。",
            IDLE = "似乎已经没有更多的物品了。",
        },

        ARCHIVE_RESONATOR_ITEM = "真令人兴奋！这种技术很可能已经有几百年没人使用过了！",

        ARCHIVE_LOCKBOX_DISPENCER = {
          POWEROFF = "它似乎缺少能量来源喵。",
          GENERIC =  "古人居然设计了一种使用液体储存知识的方法。",
        },

        ARCHIVE_SECURITY_DESK = {
            POWEROFF = "不知道它的预期目的是什么。",
            GENERIC = "看起来是一种极为先进的安全系统喵。",
        },

        ARCHIVE_SECURITY_PULSE = "跟随它似乎并不明智。",

        ARCHIVE_SWITCH = {
            VALID = "这些底座似乎能从宝石中汲取能量喵。",
            GEMS = "似乎需要特定的宝石才能激活。",
        },

        ARCHIVE_PORTAL = {
            POWEROFF = "这个设计让我联想到了我们之前穿越过的大门喵。",
            GENERIC = "真遗憾，它似乎已经不能再运行了。",
        },

        WALL_STONE_2 = "很安全。",
        WALL_RUINS_2 = "非常牢固的墙。",

        REFINED_DUST = "在这总比在我的书架上更好。",
        DUSTMERINGUE = "也许这附近有一种生物可以代谢这个。",

        SHROOMCAKE = "我不认为那东西可以当成是“蛋糕”，亲爱的喵。",
        SHROOMBAIT = "这种恶臭组合会让任何摄入它的生物失去知觉喵。",

        NIGHTMAREGROWTH = "这些晶体结构似乎不是天然的喵。",

        TURFCRAFTINGSTATION = "我推测这是古代农耕体系的一个重要组成部分。",

        MOON_ALTAR_LINK = "我有些看不透它的目的喵。",

        -- FARMING
        COMPOSTINGBIN =
        {
            GENERIC = "堆肥是园艺的一个重要组成部分喵。",
            WET = "混合物的水分含量过高喵。",
            DRY = "它需要更大的湿度。",
            BALANCED = "混合的非常均衡。",
            BURNT = "嗯……我想植物也需要碳。",
        },
        COMPOST = "任何花园的成功秘诀都是营养丰富的土壤。",
        SOIL_AMENDER =
		{
			GENERIC = "如果处理得当，海带是一种很好的肥料。",
			STALE = "还应该再放置一段时间，才能达到完全的效力。",
			SPOILED = "我可以接受，不过要是当初再多留一点时间就更好了喵。",
		},

		SOIL_AMENDER_FERMENTED = "哦，花园会非常喜欢这个!",

        WATERINGCAN =
        {
            GENERIC = "一个标准的浇水壶。",
            EMPTY = "也许附近有淡水源。",
        },
        PREMIUMWATERINGCAN =
        {
            GENERIC = "虽然有点不寻常，但不失为一种有效的灌溉工具。",
            EMPTY = "我得把它装满水才能用。",
        },

		FARM_PLOW = "多么高效啊!",
		FARM_PLOW_ITEM = "我最好给我的花园找个合适的地方。",
		FARM_HOE = "人类从新石器时代就开始种植农作物喵。",
		GOLDEN_FARM_HOE = "它是最具可塑性的金属，不过我们还是先看看它耕田的效果吧。",
		NUTRIENTSGOGGLESHAT = "谨慎的园丁确保他们能够分辨出作物的每一个细节喵。",
		PLANTREGISTRYHAT = "这似乎是一种可穿戴式目录，详细介绍了各种植物门类喵。",

        FARM_SOIL_DEBRIS = "哦不，你想都别想！从我的花园出去喵！",

		FIRENETTLES = "卑鄙的东西喵。",
		FORGETMELOTS = "这种作物可以用来冲泡相当愉快的草药茶喵。",
		SWEETTEA = "仿佛我所有的烦恼和忧虑都消失了。",
		TILLWEED = "真麻烦！",
		TILLWEEDSALVE = "犁地草的根部似乎有一定药用价值。",
        WEED_IVY = "又一种农作物的害虫。",
        IVY_SNARE = "这种植物有很强的领地性喵。",

		TROPHYSCALE_OVERSIZEDVEGGIES =
		{
			GENERIC = "看看我的园艺能力能不能经得住检验!",
			HAS_ITEM = "重量: {weight}\n收获日: {day}\n值得尊敬的收获。",
			HAS_ITEM_HEAVY = "重量: {weight}\n收获日: {day}\n老天，好大的成就喵！",
            HAS_ITEM_LIGHT = "恐怕这点农产品的重量太小，统计不出来。",
			BURNING = "噢，不好...",
			BURNT = "恐怕无能为力了喵。",
        },

        CARROT_OVERSIZED = "适当研究、规划和照顾的结果。",
        CORN_OVERSIZED = "收获颇为可观。",
        PUMPKIN_OVERSIZED = "妙不可言的丰满南瓜喵。",
        EGGPLANT_OVERSIZED = "十分漂亮的茄属植物。",
        DURIAN_OVERSIZED = "哦，我们的矮小的绿色朋友一定会很兴奋的!",
        POMEGRANATE_OVERSIZED = "一株硕大的石榴科石榴属标本。",
        DRAGONFRUIT_OVERSIZED = "适当研究、规划和照顾的结果喵。",
        WATERMELON_OVERSIZED = "适当研究、规划和照顾的结果。",
        TOMATO_OVERSIZED = "我一直都很擅长种西红柿。",
        POTATO_OVERSIZED = "令人印象深刻的硕大块茎！",
        ASPARAGUS_OVERSIZED = "它是非常好的纤维来源喵!",
        ONION_OVERSIZED = "一株硕大的洋葱标本。",
        GARLIC_OVERSIZED = "多么迷人啊，它似乎给自己编出了一个样式！",
        PEPPER_OVERSIZED = "适当研究、规划和照顾的结果喵。",

        VEGGIE_OVERSIZED_ROTTEN = "浪费这么多东西，太可怕了!",

		FARM_PLANT =
		{
			GENERIC = "植物王国的一员。",
			SEED = "从种子开始种植农作物需要极大的耐心喵。",
			GROWING = "越来越好了喵",
			FULL = "我敢说，已经可以收割了喵。",
			ROTTEN = "我最讨厌看到变质的食物!",
			FULL_OVERSIZED = "多么辉煌喵！",
			ROTTEN_OVERSIZED = "浪费这么多东西，太可怕了喵!",
			FULL_WEED = "花园里容不下野草。",

			BURNING = "世事难料啊喵！",
		},

        FRUITFLY = "这些害虫相当惹人烦喵。",
        LORDFRUITFLY = "我对花园里的害虫可没有耐心!",
        FRIENDLYFRUITFLY = "这个似乎是一种更讨喜的亚种。",
        FRUITFLYFRUIT = "看来，我可以通过这个对这些昆虫进行一定程度的控制。",

        SEEDPOUCH = "非常实用的种子贮藏和运输工具喵。",

		-- Crow Carnival
		CARNIVAL_HOST = "他是一个相当令人好奇的人物。",
		CARNIVAL_CROWKID = "鸦雀都是非常聪明的，这个物种尤其如此。",
		CARNIVAL_GAMETOKEN = "也许是一种鸟类货币？",
		CARNIVAL_PRIZETICKET =
		{
			GENERIC = "我应该可以用这些东西换取某种奖品。",
			GENERIC_SMALLSTACK = "我推断收集的奖品越多，奖品就越丰厚。",
			GENERIC_LARGESTACK = "我似乎很擅长这些游戏！",
		},

		CARNIVALGAME_FEEDCHICKS_NEST = "我想这是游戏机制的一部分。",
		CARNIVALGAME_FEEDCHICKS_STATION =
		{
			GENERIC = "我相信它需要用某种货币来启动。",
			PLAYING = "这个游戏似乎需要快速的反应力。",
		},
		CARNIVALGAME_FEEDCHICKS_KIT = "它的构造似乎很简单。",
		CARNIVALGAME_FEEDCHICKS_FOOD = "这斑斓的彩纸表现的是环节动物喵。",

		CARNIVALGAME_MEMORY_KIT = "它的构造似乎很简单喵。",
		CARNIVALGAME_MEMORY_STATION =
		{
			GENERIC = "我相信它需要用某种货币来启动。",
			PLAYING = "啊！简单的记忆力测试喵。",
		},
		CARNIVALGAME_MEMORY_CARD =
		{
			GENERIC = "我想这是游戏机制的一部分。",
			PLAYING = "我相信是这里的这个。",
		},

		CARNIVALGAME_HERDING_KIT = "它的构造似乎很简单。",
		CARNIVALGAME_HERDING_STATION =
		{
			GENERIC = "我相信它需要用某种货币来启动。",
			PLAYING = "这看起来是一个很好的运动。",
		},
		CARNIVALGAME_HERDING_CHICK = "现在就去吧，快走喵！",

		CARNIVALGAME_SHOOTING_KIT = "它的构造似乎很简单喵。",
		CARNIVALGAME_SHOOTING_STATION =
		{
			GENERIC = "我相信它需要用某种货币来启动喵。",
			PLAYING = "必须精确把握时机才能获胜。",
		},
		CARNIVALGAME_SHOOTING_TARGET =
		{
			GENERIC = "我想这是游戏机制的一部分。",
			PLAYING = "初步看来，游戏目标是在打击昆虫的同时放过鸟类。",
		},

		CARNIVALGAME_SHOOTING_BUTTON =
		{
			GENERIC = "我相信它需要用某种货币来启动。",
			PLAYING = "这似乎能触发射击机制。",
		},

		CARNIVALGAME_WHEELSPIN_KIT = "它的构造似乎很简单喵。",
		CARNIVALGAME_WHEELSPIN_STATION =
		{
			GENERIC = "我相信它需要用某种货币来启动。",
			PLAYING = "着实有趣。这样设计谁都不会输。",
		},

		CARNIVALGAME_PUCKDROP_KIT = "它的构造似乎很简单。",
		CARNIVALGAME_PUCKDROP_STATION =
		{
			GENERIC = "我相信它需要用某种货币来启动。",
			PLAYING = "一场概率的游戏。",
		},

		CARNIVAL_PRIZEBOOTH_KIT = "它的构造似乎很简单。",
		CARNIVAL_PRIZEBOOTH =
		{
			GENERIC = "选择的多样性令人感到惊艳。",
		},

		CARNIVALCANNON_KIT = "我们就把它放在离营地很远的地方吧。",
		CARNIVALCANNON =
		{
			GENERIC = "值得庆幸啊，现在是闲置状态。",
			COOLDOWN = "哦，这些东西总是弄得一团糟……",
		},

		CARNIVAL_PLAZA_KIT = "多么耐人寻味的标本……我不能完全确定它的亚种喵。",
		CARNIVAL_PLAZA =
		{
			GENERIC = "在它周围放置装饰品似乎是一种习俗。",
			LEVEL_2 = "哦，是的，进展十分顺利喵!",
			LEVEL_3 = "这似乎是一个可以接受的装饰水平喵。",
		},

		CARNIVALDECOR_EGGRIDE_KIT = "我应该能够很容易地组装它喵。",
		CARNIVALDECOR_EGGRIDE = "这些鸟类的手艺巧夺天工喵。",

		CARNIVALDECOR_LAMP_KIT = "我应该能够很容易地组装它。",
		CARNIVALDECOR_LAMP = "它有一个最令人好奇的光源。",
		CARNIVALDECOR_PLANT_KIT = "我不介意做一点园艺工作喵。",
		CARNIVALDECOR_PLANT = "照顾一棵小树是如此令人舒心。",
		CARNIVALDECOR_BANNER_KIT = "我应该能够很容易地组装它喵。",
		CARNIVALDECOR_BANNER = "当然，它实际上并不“捕捉”光线，而只是反射光线喵。",

		CARNIVALDECOR_FIGURE =
		{
			RARE = "我相信这是整个系列中最稀有的品种。",
			UNCOMMON = "它似乎还比较罕见。",
			GENERIC = "它放在小的珍宝柜里会很可爱，你不觉得吗？",
		},
		CARNIVALDECOR_FIGURE_KIT = "多么耐人寻味啊！我想知道里面有什么？",
		CARNIVALDECOR_FIGURE_KIT_SEASON2 = "多么耐人寻味啊！我想知道里面有什么喵？",
		CARNIVALDECOR_FIGURE_KIT_SEASON3 = "多么耐人寻味啊！我想知道里面有什么？",

        CARNIVAL_BALL = "我不希望看到有人在易碎物品附近玩这个喵。", --unimplemented
		CARNIVAL_SEEDPACKET = "在饮食中增加一点额外的纤维素永远不会有坏处。",
		CARNIVALFOOD_CORNTEA = "这是一种需要培养的品位，饮用后分外清爽喵。",

        CARNIVAL_VEST_A = "鸟类似乎已经发展出一种用树叶制作衣服的方法喵。",
        CARNIVAL_VEST_B = "这些鸟类已经进化到了穿衣服的地步，多么令人着迷喵。",
        CARNIVAL_VEST_C = "它散发着夏叶的独有的芬芳。",

        -- YOTB
        YOTB_SEWINGMACHINE = "我更喜欢钩针喵。",
        YOTB_SEWINGMACHINE_ITEM = "我理当先装好它。",
        YOTB_STAGE = "真迷人！",
        YOTB_POST =  "皮弗娄牛就在这里展示给评委们看喵。",
        YOTB_STAGE_ITEM = "我认为它不能自己完成搭建。",
        YOTB_POST_ITEM =  "应该很轻松就能立起来喵。",


        YOTB_PATTERN_FRAGMENT_1 = "仅仅是一个更大的礼服款式中的一小部分。",
        YOTB_PATTERN_FRAGMENT_2 = "仅仅是一个更大的礼服款式中的一小部分。",
        YOTB_PATTERN_FRAGMENT_3 = "仅仅是一个更大的礼服款式中的一小部分喵。",

        YOTB_BEEFALO_DOLL_WAR = {
            GENERIC = "真是太有魅力了！",
            YOTB = "评委也许能给我一些关于它风格方面的启示喵。",
        },
        YOTB_BEEFALO_DOLL_DOLL = {
            GENERIC = "真是太有魅力了！",
            YOTB = "评委也许能给我一些关于它风格方面的启示。",
        },
        YOTB_BEEFALO_DOLL_FESTIVE = {
            GENERIC = "真是太有魅力了！",
            YOTB = "评委也许能给我一些关于它风格方面的启示喵。",
        },
        YOTB_BEEFALO_DOLL_NATURE = {
            GENERIC = "真是太有魅力了喵！",
            YOTB = "评委也许能给我一些关于它风格方面的启示。",
        },
        YOTB_BEEFALO_DOLL_ROBOT = {
            GENERIC = "真是太有魅力了喵！",
            YOTB = "评委也许能给我一些关于它风格方面的启示。",
        },
        YOTB_BEEFALO_DOLL_ICE = {
            GENERIC = "真是太有魅力了！",
            YOTB = "评委也许能给我一些关于它风格方面的启示喵。",
        },
        YOTB_BEEFALO_DOLL_FORMAL = {
            GENERIC = "真是太有魅力了！",
            YOTB = "评委也许能给我一些关于它风格方面的启示。",
        },
        YOTB_BEEFALO_DOLL_VICTORIAN = {
            GENERIC = "真是太有魅力了喵！",
            YOTB = "评委也许能给我一些关于它风格方面的启示。",
        },
        YOTB_BEEFALO_DOLL_BEAST = {
            GENERIC = "真是太有魅力了！",
            YOTB = "评委也许能给我一些关于它风格方面的启示。",
        },

        WAR_BLUEPRINT = "看上去颇有攻击性。",
        DOLL_BLUEPRINT = "就我的口味而言，有些幼稚。",
        FESTIVE_BLUEPRINT = "它使用了一个折中的色彩组合喵。",
        ROBOT_BLUEPRINT = "我不确定到底需要多少缝纫工作。",
        NATURE_BLUEPRINT = "真令人愉悦喵！",
        FORMAL_BLUEPRINT = "让皮弗娄牛看起来很体面这件事实在是没什么道理。",
        VICTORIAN_BLUEPRINT = "啊，这种风格的确让我想起了喵……",
        ICE_BLUEPRINT = "谨慎起见，还是要准备一套冬天的衣物。",
        BEAST_BLUEPRINT = "我不是一个靠运气的人，但在比赛中有一点运气也不是坏事。",

        BEEF_BELL = "它的某种音色会引起皮弗娄牛的好感。",

		-- YOT Catcoon
		KITCOONDEN =
		{
			GENERIC = "小猫们的良好居所。",
            BURNT = "看来小猫们已经失去了住所。",
			PLAYING_HIDEANDSEEK = "小猫们目前正试图躲起来喵。",
			PLAYING_HIDEANDSEEK_TIME_ALMOST_UP = "小猫们的躲猫猫游戏很快就会结束了。",
		},

		KITCOONDEN_KIT = "建造正规猫房的材料喵。",

		TICOON =
		{
			GENERIC = "异常睿智的猫科动物喵。",
			ABANDONED = "他丢下我一个人去寻找小猫喵。",
			SUCCESS = "他遇到了其中一只小猫。",
			LOST_TRACK = "这只小猫在我们到达之前就被发现了喵。",
			NEARBY = "我相信我们已经很接近了喵。",
			TRACKING = "他正在引导我去一只小猫的藏身处。",
			TRACKING_NOT_MINE = "他正在引导别人去小猫的藏身处。",
			NOTHING_TO_TRACK = "没有任何明确的证据能让我们找到小猫。",
			TARGET_TOO_FAR_AWAY = "小猫离得很远，足以隐藏它们的气味喵。",
		},

		YOT_CATCOONSHRINE =
        {
            GENERIC = "野猫的特别代表。",
            EMPTY = "献上金色的供品是必要的。",
            BURNT = "那场火太大了，没及时扑灭喵。",
        },

		KITCOON_FOREST = "它似乎已经演化出了一种伪装的形式。",
		KITCOON_SAVANNA = "与老虎的相似性令人难以置信喵。",
		KITCOON_MARSH = "这种猫科动物有着相当不可思议的外表。",
		KITCOON_DECIDUOUS = "哦，亲爱的，你真是可爱喵。",
		KITCOON_GRASS = "哦，亲爱的，你被吓到了吗？",
		KITCOON_ROCKY = "嗯，它们的身体语言似乎在说它们窝火了。",
		KITCOON_DESERT = "它们演化出了大耳朵，便于猎取沙漠中的小动物。",
		KITCOON_MOON = "猫科动物？而且来自月球？相当令人着迷……",
		KITCOON_YOT = "哦，亲爱的，这个铃铛极大增强了你的……可爱程度。呵呵!",

        -- Moon Storm
        ALTERGUARDIAN_PHASE1 = {
            GENERIC = "我们的行为似乎引起了某种防御机制。",
            DEAD = "奇怪啊，我本来以为要折腾一番呢。",
        },
        ALTERGUARDIAN_PHASE2 = {
            GENERIC = "有趣，它似乎利用了祭坛的某些方面进行战斗。",
            DEAD = "这种惰性应该不会持续太久喵。",
        },
        ALTERGUARDIAN_PHASE2SPIKE = "我会努力不被它的障碍物困住。",
        ALTERGUARDIAN_PHASE3 = "如果我的假设正确，这应该是它的最终形式喵。",
        ALTERGUARDIAN_PHASE3TRAP = "它们似乎有催眠的能力。我最好避开一些。",
        ALTERGUARDIAN_PHASE3DEADORB = "有趣，它似乎保留了为其提供动力的能量。",
        ALTERGUARDIAN_PHASE3DEAD = "能量移除之后，我怀疑它多半不能再生了喵。",

        ALTERGUARDIANHAT = "它所包含的知识如此广阔……我要是能全部记录下来就好了……",
        ALTERGUARDIANHATSHARD = "这些碎片存储了大量能量喵。",

        MOONSTORM_GLASS = {
            GENERIC = "玻璃似乎稳定了下来喵。",
            INFUSED = "它在散发着一种发微光的能力喵。"
        },

        MOONSTORM_STATIC = "这种能量似乎很不稳定喵。",
        MOONSTORM_STATIC_ITEM = "这个设备好像以某种方式遏制了能量。",
        MOONSTORM_STATIC_ROAMER = "能量体已经偏离了。",
        MOONSTORM_SPARK = "我本以为它是某种电力，可是似乎完全是另一种东西喵……",

        BIRD_MUTANT = "噢，天啊。那个生物看起来不健康。",
        BIRD_MUTANT_SPITTER = "这可怜的东西似乎被非自然手段改变了喵。",

        WAGSTAFF_NPC = "他似乎在研究风暴，我应该帮助他。",

        WAGSTAFF_NPC_MUTATIONS = "辛苦活干完了，他才安逸地出现。",
        WAGSTAFF_NPC_WAGPUNK = "啊，对知识的追求啊。",

        ALTERGUARDIAN_CONTAINED = "不知道他要那么多的能量做什么喵。",

        WAGSTAFF_TOOL_1 = "噢，天啊。真不知道这个是不是他要的工具……",
        WAGSTAFF_TOOL_2 = "也许这就是他要的工具？我建议建立一个索引。",
        WAGSTAFF_TOOL_3 = "他当时语焉不详，但也许要找的就是这个。",
        WAGSTAFF_TOOL_4 = "哪怕有一点点的整理，他的工具也不至于这么难找……",
        WAGSTAFF_TOOL_5 = "可惜没有标签……我只好假设这就是他要找的。",

        MOONSTORM_GOGGLESHAT = "不同寻常的设计，但却出奇有效。",

        MOON_DEVICE = {
            GENERIC = "如同我的假设一样，它的功能就是储能电池。",
            CONSTRUCTION1 = "恐怕我一时间还不能说清它的功能。",
            CONSTRUCTION2 = "这些组件渐渐都放好了。",
        },

		-- Wanda
        POCKETWATCH_HEAL = {
			GENERIC = "钟表学与魔法混合在一起，真的很吸引人。",
			RECHARGING = "在两次使用之间，它似乎需要一些时间来补充其能量。",
		},

        POCKETWATCH_REVIVE = {
			GENERIC = "钟表学与魔法混合在一起，真的很吸引人。",
			RECHARGING = "在两次使用之间，它似乎需要一些时间来补充其能量喵。",
		},

        POCKETWATCH_WARP = {
			GENERIC = "钟表学与魔法混合在一起，真的很吸引人喵。",
			RECHARGING = "在两次使用之间，它似乎需要一些时间来补充其能量。",
		},

        POCKETWATCH_RECALL = {
			GENERIC = "钟表学与魔法混合在一起，真的很吸引人。",
			RECHARGING = "在两次使用之间，它似乎需要一些时间来补充其能量喵。",
--fallback to speech_wilson.lua 			UNMARKED = "only_used_by_wanda",
--fallback to speech_wilson.lua 			MARKED_SAMESHARD = "only_used_by_wanda",
--fallback to speech_wilson.lua 			MARKED_DIFFERENTSHARD = "only_used_by_wanda",
		},

        POCKETWATCH_PORTAL = {
			GENERIC = "钟表学与魔法混合在一起，真的很吸引人喵。",
			RECHARGING = "在两次使用之间，它似乎需要一些时间来补充其能量。",
--fallback to speech_wilson.lua 			UNMARKED = "only_used_by_wanda unmarked",
--fallback to speech_wilson.lua 			MARKED_SAMESHARD = "only_used_by_wanda same shard",
--fallback to speech_wilson.lua 			MARKED_DIFFERENTSHARD = "only_used_by_wanda other shard",
		},

        POCKETWATCH_WEAPON = {
			GENERIC = "一个方便的口袋型武器。",
--fallback to speech_wilson.lua 			DEPLETED = "only_used_by_wanda",
		},

        POCKETWATCH_PARTS = "看来这些钟表已经被注入了暗影燃料。",
        POCKETWATCH_DISMANTLER = "这些工具是专门用于制作钟表的。",

        POCKETWATCH_PORTAL_ENTRANCE =
		{
			GENERIC = "由钟表装置触发的魔法，多么令人着迷啊！",
			DIFFERENTSHARD = "由钟表装置触发的魔法，多么令人着迷啊！",
		},
        POCKETWATCH_PORTAL_EXIT = "不知她是否会允许我记录我的观察喵……",

        -- Waterlog
        WATERTREE_PILLAR = "究竟是什么促成了如此先进的增长喵？",
        OCEANTREE = "它似乎是红树和柳树的杂交品种。",
        OCEANTREENUT = "哦，天哪，这颗种子似乎相当渴望成长。",
        WATERTREE_ROOT = "我建议不要让小船撞到这些。",

        OCEANTREE_PILLAR = "我虽然能模拟它的生长条件，但难以企及它原来的程度。",

        OCEANVINE = "这些藤蔓似乎享受着与树的共生关系。",
        FIG = "我喜欢吃熟透了的无花果。",
        FIG_COOKED = "烹饪之后激发了更多的风味喵。",

        SPIDER_WATER = "它们如此的身躯，居然还能创造足够的表面张力浮在水面，简直不可思议。",
        MUTATOR_WATER = "多么有趣啊！它们被摄入后似乎会改变蛛形纲动物的形态。",
        OCEANVINE_COCOON = "这种物种似乎既是树栖的又是水栖的喵。",
        OCEANVINE_COCOON_BURNT = "多么不幸。",

        GRASSGATOR = "它看起来比较温顺。",

        TREEGROWTHSOLUTION = "这种无花果混合物似乎能诱发树木迅速生长喵。",

        FIGATONI = "这样组合虽然出乎意料，但却又有几分讨喜喵。",
        FIGKABAB = "我想既然可以做肉串，那现在这样做也是合乎逻辑了。",
        KOALEFIG_TRUNK = "富含蛋白质和纤维。",
        FROGNEWTON = "味道十分独特。",

        -- The Terrorarium
        TERRARIUM = {
            GENERIC = "它必然不属于这个世界。有趣了。",
            CRIMSON = "噩梦燃料似乎对它有负面作用。",
            ENABLED = "这是什么意思？！",
			WAITING_FOR_DARK = "我相信它在储存能量，但为了什么目的呢？",
			COOLDOWN = "它似乎已经耗尽了能量，但我说不准会持续多久。",
			SPAWN_DISABLED = "只要不被打扰，它应该会继续不活跃喵。",
        },

        -- Wolfgang
        MIGHTY_GYM =
        {
            GENERIC = "请注意不要过度劳累，亲爱的喵。",
            BURNT = "我建议换个地方锻炼吧喵。",
        },

        DUMBBELL = "做点运动对健康相当有益。",
        DUMBBELL_GOLDEN = "做点运动对健康相当有益喵。",
		DUMBBELL_MARBLE = "做点运动对健康相当有益。",
        DUMBBELL_GEM = "做点运动对健康相当有益喵。",
        POTATOSACK = "他似乎对块茎类植物有深深的喜爱。",

        DUMBBELL_HEAT = "运动和温度调节的有趣结合。",
        DUMBBELL_REDGEM = "小心点，亲爱的，那看起来有点易燃。",
        DUMBBELL_BLUEGEM = "我的天，摸起来凉透了喵！",

        TERRARIUMCHEST =
		{
			GENERIC = "我想知道它是如何来到这里的喵。",
			BURNT = "噢，不好...",
			SHIMMER = "那道光的折射相当不自然。",
		},

		EYEMASKHAT = "应该没有这么大的老花镜吧。",

        EYEOFTERROR = "这是给左眼戴的还是右眼戴的呢？我猜是右眼喵。",
        EYEOFTERROR_MINI = "我虽然很想弄清楚，但现在不是研究你的时候喵。",
        EYEOFTERROR_MINI_GROUNDED = "是眼球……的胚胎？这些生物的构造真是复杂啊。",

        FROZENBANANADAIQUIRI = "喝着这个读一本小书将会十分惬意喵。",
        BUNNYSTEW = "虽然很多卡路里，但是营养丰富，而且香气四溢喵。",
        MILKYWHITES = "巩膜，是玻璃体的不透明的白色覆盖物。还有另一个名字叫恶心。",

        CRITTER_EYEOFTERROR = "我想知道你的神经系统是纯装饰性的，还是具备一定的功能……",

        SHIELDOFTERROR ="它似乎更适合进攻，而不是人们想象的防御。",
        TWINOFTERROR1 = "真奇怪，不知道是谁造出来的？",
        TWINOFTERROR2 = "真奇怪，不知道是谁造出来的喵？",

		-- Cult of the Lamb
		COTL_TRINKET = "天哪，它刚刚是对我眨眼了吗喵？",
		TURF_COTL_GOLD = "孩子们，在踏上那层地板之前先把脚擦干净！",
		TURF_COTL_BRICK = "砖砌体，应用于地面。",
		COTL_TABERNACLE_LEVEL1 =
		{
			LIT = "这座雕像似乎年久失修喵。",
			GENERIC = "需要小火才能达到全部效果。",
		},
		COTL_TABERNACLE_LEVEL2 =
		{
			LIT = "多么迷人的雕像啊。",
			GENERIC = "需要小火才能达到全部效果。",
		},
		COTL_TABERNACLE_LEVEL3 =
		{
			LIT = "金色表面反射的火光催人入睡。",
			GENERIC = "需要小火才能达到全部效果。",
		},

        -- Year of the Catcoon
        CATTOY_MOUSE = "一个简单的机械原理支撑起了这件猫科动物的玩具。",
        KITCOON_NAMETAG = "啊，这确实勾起了我对亲爱的老猫的回忆喵……",

		KITCOONDECOR1 =
        {
            GENERIC = "它的动作似乎对小猫有催眠作用喵。",
            BURNT = "随火而去了喵。",
        },
		KITCOONDECOR2 =
        {
            GENERIC = "我以前在老家也有一个这样的东西。",
            BURNT = "不幸的是，它现在已经没有用了。",
        },

		KITCOONDECOR1_KIT = "为小猫建造娱乐性玩具的材料。",
		KITCOONDECOR2_KIT = "为小猫建造娱乐性玩具的材料喵。",

        -- WX78
        WX78MODULE_MAXHEALTH = "尽管TA不喜欢有机物，但似乎并不反对从它们那里获得灵感。",
        WX78MODULE_MAXSANITY1 = "尽管TA不喜欢有机物，但似乎并不反对从它们那里获得灵感喵。",
        WX78MODULE_MAXSANITY = "尽管TA不喜欢有机物，但似乎并不反对从它们那里获得灵感喵。",
        WX78MODULE_MOVESPEED = "尽管TA不喜欢有机物，但似乎并不反对从它们那里获得灵感喵。",
        WX78MODULE_MOVESPEED2 = "尽管TA不喜欢有机物，但似乎并不反对从它们那里获得灵感。",
        WX78MODULE_HEAT = "尽管TA不喜欢有机物，但似乎并不反对从它们那里获得灵感。",
        WX78MODULE_NIGHTVISION = "尽管TA不喜欢有机物，但似乎并不反对从它们那里获得灵感。",
        WX78MODULE_COLD = "尽管TA不喜欢有机物，但似乎并不反对从它们那里获得灵感。",
        WX78MODULE_TASER = "尽管TA不喜欢有机物，但似乎并不反对从它们那里获得灵感。",
        WX78MODULE_LIGHT = "尽管TA不喜欢有机物，但似乎并不反对从它们那里获得灵感。",
        WX78MODULE_MAXHUNGER1 = "尽管TA不喜欢有机物，但似乎并不反对从它们那里获得灵感。",
        WX78MODULE_MAXHUNGER = "尽管TA不喜欢有机物，但似乎并不反对从它们那里获得灵感喵。",
        WX78MODULE_MUSIC = "尽管TA不喜欢有机物，但似乎并不反对从它们那里获得灵感。",
        WX78MODULE_BEE = "尽管TA不喜欢有机物，但似乎并不反对从它们那里获得灵感。",
        WX78MODULE_MAXHEALTH2 = "尽管TA不喜欢有机物，但似乎并不反对从它们那里获得灵感。",

        WX78_SCANNER =
        {
            GENERIC ="我猜我们的常驻女工可能协助了建造。",
            HUNTING = "它似乎在寻找一个可分析的样本。",
            SCANNING = "它似乎在收集那个样本的数据。",
        },

        WX78_SCANNER_ITEM = "它当前处于休眠状态喵。",
        WX78_SCANNER_SUCCEEDED = "我相信它已经完成了研究资料的编纂。",

        WX78_MODULEREMOVER = "这个一定小心使用，亲爱的喵。",

        SCANDATA = "分析地鞭辟入里。干得好！",

		-- QOL 2022
		JUSTEGGS = "如果能有一些黄油吐司当主食就好了。",
		VEGGIEOMLET = "一份健康、平衡的早餐。",
		TALLEGGS = "像大多数舒适食品一样，它可能会对动脉造成巨大破坏。",
		BEEFALOFEED = "皮弗娄牛似乎很擅长消化树枝。",
		BEEFALOTREAT = "谁都喜欢偶尔吃两口好吃的。",

        -- Pirates
        BOAT_ROTATOR = "它让我能在旋转甲板的同时保持我们的方向喵。",
        BOAT_ROTATOR_KIT = "它应该能提高船的可操作性喵。",
        BOAT_BUMPER_KELP = "一个厚厚的褐藻门海带科屏障。",
        BOAT_BUMPER_KELP_KIT = "在船上配备保护屏障是明智之举。",
		BOAT_BUMPER_SHELL = "一道厚厚的软体动物屏障喵。",
        BOAT_BUMPER_SHELL_KIT = "在船上配备保护屏障是明智之举。",
        BOAT_BUMPER_CRABKING = "厚厚的地壳外骨骼屏障。",
        BOAT_BUMPER_CRABKING_KIT = "在船上配备保护屏障是明智之举。",

        BOAT_CANNON = {
            GENERIC = "海战中一种非常有效的武器，前提是要正确装弹。",
            AMMOLOADED = "那可不是闹着玩的喵。",
            NOAMMO = "还有弹药这个小问题，亲爱的喵……",
        },
        BOAT_CANNON_KIT = "很不幸，这是一项必要的预防措施喵。",
        CANNONBALL_ROCK_ITEM = "适用于大炮的投射物喵。",

        OCEAN_TRAWLER = {
            GENERIC = "这将使收集鱼类变得更加便利。",
            LOWERED = "忍耐是一种美德。",
            CAUGHT = "一次成功的捕获喵。",
            ESCAPED = "噢，天啊。没等我回来我的鱼就跑了。",
            FIXED = "受损部件得到了修复喵。",
        },
        OCEAN_TRAWLER_KIT = "这只是一个简单的组装作业。",

        BOAT_MAGNET =
        {
            GENERIC = "虽然它的设计相当古怪，但是理论很扎实。",
            ACTIVATED = "强大的磁力会把我的船拉向目标。",
        },
        BOAT_MAGNET_KIT = "我以后要和他谈谈他在说明书的写作中一逗到底的问题。",

        BOAT_MAGNET_BEACON =
        {
            GENERIC = "它能吸引大型电磁铁，但首先要先启动它喵。",
            ACTIVATED = "磁力灯塔已经开启了喵。",
        },
        DOCK_KIT = "建造码头的一些基本材料喵。",
        DOCK_WOODPOSTS_ITEM = "对浮动码头来说没有必要，但外观确实令人愉快喵。",

        MONKEYHUT =
        {
            GENERIC = "尽管它们与海洋关系密切，但猿类似乎仍然喜欢在树上睡觉。",
            BURNT = "光顾偷窃，忽略了建设消防力量。",
        },
        POWDER_MONKEY = "你的行为令人发指！得好好找人管教管教！",
        PRIME_MATE = "多么奇怪的颜色。也许是一种动物的警戒色喵？",
		LIGHTCRAB = "它们的半透明外壳使它们身体的生物荧光得以闪现。",
        CUTLESS = "如果孩子们表现好的话，可以拿这个当玩具。",
        CURSED_MONKEY_TOKEN = "灵长类的珠宝。",
        OAR_MONKEY = "这似乎是船上猿猴地位的象征。",
        BANANABUSH = "它的果实与地下品系非常相似。",
        DUG_BANANABUSH = "果实与我们熟知的地下品系非常相似。",
        PALMCONETREE = "它似乎属于槭树科，但拥有一些针叶树的特征。",
        PALMCONE_SEED = "亲爱的，不种下的话它是不能生长的。",
        PALMCONE_SAPLING = "它还没有完全成熟。",
        PALMCONE_SCALE = "树木天然盔甲的一部分。",
        MONKEYTAIL = "这或许是常见的香蒲科香蒲属的一种变种？",
        DUG_MONKEYTAIL = "这或许是常见的香蒲科香蒲属的一种变种？",

        MONKEY_MEDIUMHAT = "长期在海上工作的人戴的头饰。",
        MONKEY_SMALLHAT = "它可能需要彻底清洗一下。",
        POLLY_ROGERSHAT = "对我来说有点浮夸了。",
        POLLY_ROGERS = "请用你内心的声音鸣叫，亲爱的。",

        MONKEYISLAND_PORTAL = "它似乎正在渗入这个世界。",
        MONKEYISLAND_PORTAL_DEBRIS = "我非常怀疑我遇到的那些猿猴是否有足够的智慧来建造它。",
        MONKEYQUEEN = "多么有趣啊，猿猴似乎是母系社会喵。",
        MONKEYPILLAR = "这些似乎是支撑王座的柱子喵。",
        PIRATE_FLAG_POLE = "噢，天啊。此乃不祥之兆。",

        BLACKFLAG = "历史上，海盗也曾打着红旗或白旗航行。",
        PIRATE_STASH = "这似乎是地图上指示的地点喵。",
        STASH_MAP = "笔迹凌乱，但终究可以辨识。",

        BANANAJUICE = "啊，我正需要一些提神的东西。",

        FENCE_ROTATOR = "有时，为了保持事物的排列有序，锐利是必要的。",

        CHARLIE_STAGE_POST = "建造者一定是受了古希腊戏剧的启发。",
        CHARLIE_LECTURN = "它列出了下一幕中的角色。",

        CHARLIE_HECKLER = "我不会把他们的批评归类为有建设性喵。",

        PLAYBILL_THE_DOLL = "我怀疑故事情节有更深层次的含义。",
        PLAYBILL_THE_VEIL = "你问我意见的话，我会说相当直白。",
        PLAYBILL_THE_VAULT = "这与其说是舞台剧，不如说更像是对事件的忏悔或重述。",
        STATUEHARP_HEDGESPAWNER = "有人放任藤蔓爬满了那座可怜的雕像。",
        HEDGEHOUND = "啊。这就解释了它为什么会呼吸喵。",
        HEDGEHOUND_BUSH = "真奇怪。这丛玫瑰似乎在……呼吸。",

        MASK_DOLLHAT = "它似乎是一张舞台面具喵。",
        MASK_DOLLBROKENHAT = "它似乎是一张舞台面具。",
        MASK_DOLLREPAIREDHAT = "它似乎是一张舞台面具。",
        MASK_BLACKSMITHHAT = "它似乎是一张舞台面具。",
        MASK_MIRRORHAT = "它似乎是一张舞台面具喵。",
        MASK_QUEENHAT = "它似乎是一张舞台面具。",
        MASK_KINGHAT = "它似乎是一张舞台面具。",
        MASK_TREEHAT = "它似乎是一张舞台面具。",
        MASK_FOOLHAT = "它似乎是一张舞台面具。",

        COSTUME_DOLL_BODY = "它似乎是一套戏服喵。",
        COSTUME_QUEEN_BODY = "它似乎是一套戏服喵。",
        COSTUME_KING_BODY = "它似乎是一套戏服。",
        COSTUME_BLACKSMITH_BODY = "它似乎是一套戏服。",
        COSTUME_MIRROR_BODY = "它似乎是一套戏服。",
        COSTUME_TREE_BODY = "它似乎是一套戏服。",
        COSTUME_FOOL_BODY = "它似乎是一套戏服。",

        STAGEUSHER =
        {
            STANDING = "那是个卑鄙的诡计喵！",
            SITTING = "某些不光明的东西正在暗影中潜行喵。",
        },
        SEWING_MANNEQUIN =
        {
            GENERIC = "太好了！一个可以晾晒发霉设备的地方喵。",
            BURNT = "太可惜了，本来可能是有用的。",
        },

		-- Waxwell
		MAGICIAN_CHEST = "我必须承认，他重燃对秘典的兴趣……让我感到不安喵。",
		TOPHAT_MAGICIAN = "它上面带有一种灵质残渣。",

        -- Year of the Rabbit
        YOTR_FIGHTRING_KIT = "咱们把它建在离我的阅读区远一点的地方，可以吗喵？",
        YOTR_FIGHTRING_BELL =
        {
            GENERIC = "啊，暴风雨前的宁静。",
            PLAYING = "咱们可说好了，点到为止！",
        },

        YOTR_DECOR_1 = {
            GENERAL = "用作阅读灯恰如其分。",
            OUT = "我的阅读灯似乎灭了。",
        },
        YOTR_DECOR_2 = {
            GENERAL = "用作阅读灯恰如其分。",
            OUT = "我的阅读灯似乎灭了喵。",
        },

        HAREBALL = "大冒险吗？小孩子的把戏。",
        YOTR_DECOR_1_ITEM = "摆在那应该会很好看。",
        YOTR_DECOR_2_ITEM = "摆在那应该会很好看。",

		--
		DREADSTONE = "如果我没记错的话，这是一种变质岩。",
		HORRORFUEL = "高度浓缩的灵质残渣。",
		DAYWALKER =
		{
			GENERIC = "这种生物的教养简直可怕。",
			IMPRISONED = "天哪，它怎么会沦落至此？",
		},
		DAYWALKER_PILLAR =
		{
			GENERIC = "真奇怪......大理石似乎包裹着某种东西。",
			EXPOSED = "要打破它，需要超出我掌握范围之外的更大的力量。",
		},
		DAYWALKER2 =
		{
			GENERIC = "这只生物似乎暂时平静了下来。最好不要刺激它。",
			BURIED = "这只可怜的野兽被压在了这堆瓦砾下面。",
			HOSTILE = "那个粗鄙之物真该学学礼貌了。",
		},
		ARMORDREADSTONE = "极其的耐用，出奇的轻盈喵。",
		DREADSTONEHAT = "不幸的是，该材料对心灵有不良影响喵。",

        -- Rifts 1
        LUNARRIFT_PORTAL = "它似乎在污染周围的区域喵。",
        LUNARRIFT_CRYSTAL = "这些晶体结构的成长速度十分快。",

        LUNARTHRALL_PLANT = "它展现出了寄生行为。",
        LUNARTHRALL_PLANT_VINE_END = "相当有效的防御机制。",

		LUNAR_GRAZER = "它独特的生理构造似乎能让它自我重构。",

        PUREBRILLIANCE = "以晶体形式存在的纯粹能量。",
        LUNARPLANT_HUSK = "极其坚韧的材料。我要利用好它。",

		LUNAR_FORGE = "它利用结晶的能量来重塑和加强有机材料。",
		LUNAR_FORGE_KIT = "应该很容易就能建好喵。",

		LUNARPLANT_KIT = "现在我熟悉材料了，修复起来就很简单了。",
		ARMOR_LUNARPLANT = "出奇有效的植基盔甲。",
		LUNARPLANTHAT = "戴着眼镜不是很贴脸，但是先凑合一下吧。",
		BOMB_LUNARPLANT = "不稳定的能量，由坚韧的植物表皮给予一定的束缚喵。",
		STAFF_LUNARPLANT = "有了它，用户就能从远处发起攻击喵。",
		SWORD_LUNARPLANT = "能量已经稳定下来，足以形成一把实用的刀锋。",
		PICKAXE_LUNARPLANT = "意外有效的采矿和击打工具。",
		SHOVEL_LUNARPLANT = "意外有效的挖掘工具。",

		BROKEN_FORGEDITEM = "只要使用正确的材料，它就可以被修复。",

        PUNCHINGBAG = "测试武器功效的实用工具。",

        -- Rifts 2
        SHADOWRIFT_PORTAL = "它耐人寻味和令人担忧的程度相当。",

		SHADOW_FORGE = "我不喜欢这种类型的魔法喵。",
		SHADOW_FORGE_KIT = "组装完成之后才能使用。",

        FUSED_SHADELING = "这让我想起了之前遭遇过的寄生暗影喵。",
        FUSED_SHADELING_BOMB = "它的身体高度不稳定喵。",

		VOIDCLOTH = "这种不寻常的织物可能相当有用。",
		VOIDCLOTH_KIT = "现在我熟悉材料了，修复起来就很简单了喵。",
		VOIDCLOTHHAT = "长期使用肯定会对精神产生不利影响。",
		ARMOR_VOIDCLOTH = "抵御形而上学伤害的盔甲。",

        VOIDCLOTH_UMBRELLA = "它提供了一个防止酸液滴落的有效屏障。",
        VOIDCLOTH_SCYTHE = "常见的收割工具，尽管外观有些令人不安。",

		SHADOWTHRALL_HANDS = "我建议不要挑战它徒手肉搏。",
		SHADOWTHRALL_HORNS = "一只贪婪的暗影兽喵。",
		SHADOWTHRALL_WINGS = "它的翅膀似乎用于推进，而非保持空中飞行。",
		SHADOWTHRALL_MOUTH = "明智的人会避开这个露齿的胃袋。",

        CHARLIE_NPC =
        {
            GENERIC = "真想狠狠地教训那位年轻女士一顿！", -- scene 1, first appearance of charlie to repair the gateway
            SCENE2 = "恐怕我们已经成了那位年轻女士举行的黑暗仪式的帮凶。", -- scene 2, charlie appears again to socket the key and place the ritual down
            SCENE3 = "恐怕我们已经成了那位年轻女士举行的黑暗仪式的帮凶喵。", -- scene 3, the gateway has both keys, and the sacrifice pieces are set up in the ritual, she appears to tell you to activate it
        },
        CHARLIE_HAND = "它需要材料。",

        NITRE_FORMATION = "酸雨似乎引起了化学反应，产生了这些堆块。",
        DREADSTONE_STACK = "它的源头一定在更深的地下。",
        
        SCRAPBOOK_PAGE = "多么可怕的场景！从书上撕下来的一页纸喵！",

        LEIF_IDOL = "我相信这里需要用到火焰。",
        WOODCARVEDHAT = "听起来有点功利，但足够坚固。",
        WALKING_STICK = "考虑到它是用斧头雕刻的，细节水平令人印象深刻。",

        IPECACSYRUP = "摄入它对人体健康有害。",
        BOMB_LUNARPLANT_WORMWOOD = "我们那位苍翠的朋友似乎发挥了他的魔力。", -- Unused
        WORMWOOD_MUTANTPROXY_CARRAT =
        {
        	DEAD = "或许不用这样吧喵。",
        	GENERIC = "惊人啊，又一种动植物杂交品种。多么神奇喵。",
        	HELD = "动植物和谐的融合在了一起。",
        	SLEEPING = "处于深度睡眠中喵。",
        },
        WORMWOOD_MUTANTPROXY_LIGHTFLIER = "如果能说服它静止不动，它将是一盏极好的阅读灯喵。",
		WORMWOOD_MUTANTPROXY_FRUITDRAGON =
		{
			GENERIC = "动植物在这个标本中融为了一体。",
			RIPE = "闻起来很美味。",
			SLEEPING = "处于深度睡眠中喵。",
		},

        SUPPORT_PILLAR_SCAFFOLD = "看来需要进行一些施工。",
        SUPPORT_PILLAR = "恐怕它无法永远承受这些构造变化。",
        SUPPORT_PILLAR_COMPLETE = "这样应该可以暂时稳定洞穴的顶部。",
        SUPPORT_PILLAR_BROKEN = "尝试进行一些修复是谨慎的做法。",

		SUPPORT_PILLAR_DREADSTONE_SCAFFOLD = "看来需要进行一些施工。",
		SUPPORT_PILLAR_DREADSTONE = "恐怕它无法永远承受这些构造变化。",
		SUPPORT_PILLAR_DREADSTONE_COMPLETE = "绝望石，这个可以坚持住。",
		SUPPORT_PILLAR_DREADSTONE_BROKEN = "坏了？或许这种材料并不像我想象的那么坚不可摧喵。",

        WOLFGANG_WHISTLE = "亲爱的，请尽量将噪音降至最低。",

        -- Rifts 3

        MUTATEDDEERCLOPS = "复活过程似乎改变了它的身体。",
        MUTATEDWARG = "它的身体发生了巨大的变化。",
        MUTATEDBEARGER = "寄生物似乎能够改变其宿主身体以适应其需求喵。",

        LUNARFROG = "它拥有大量无用的眼睛。",

        DEERCLOPSCORPSE =
        {
            GENERIC  = "还是谨慎一些，处理掉尸体为好。",
            BURNING  = "这是最安全的处理方案。",
            REVIVING = "天啊！有什么东西正在使尸体复活！",
        },

        WARGCORPSE =
        {
            GENERIC  = "我宁愿不把这样的东西留在身边。",
            BURNING  = "必要的预防措施。",
            REVIVING = "某种寄生实体正在利用它的尸体作为宿主喵！",
        },

        BEARGERCORPSE =
        {
            GENERIC  = "如果不及时处理，可能会招致麻烦。",
            BURNING  = "看到它消失，我总算松了一口气。",
            REVIVING = "哦，亲爱的。看来我来不及了喵。",
        },

        BEARGERFUR_SACK = "便携式冷却装置。很好很好，但是吃冷的食物会让我牙疼喵。",
        HOUNDSTOOTH_BLOWPIPE = "一种简易的牙齿投射物发射装置。",
        DEERCLOPSEYEBALL_SENTRYWARD =
        {
            GENERIC = "调节空气的工具，简称环境温度降低装置。",    -- Enabled.
            NOEYEBALL = "没有那只野兽的眼睛，它就变得毫无用处喵。",  -- Disabled.
        },
        DEERCLOPSEYEBALL_SENTRYWARD_KIT = "应该很容易就能建好。",

        SECURITY_PULSE_CAGE = "我在任何一本书中都没有看到过这个喵。",
        SECURITY_PULSE_CAGE_FULL = "里面发光的物体能发出某种能量喵。",

		CARPENTRY_STATION =
        {
            GENERIC = "我需要一把新的阅读椅。",
            BURNT = "看来我的阅读椅要再等等了。",
        },

        WOOD_TABLE = -- Shared between the round and square tables.
        {
            GENERIC = "Perfect for enjoying a cup of tea and a good book喵.",
            HAS_ITEM = "Perfect for enjoying a cup of tea and a good book.",
            BURNT = "What a shame喵.",
        },

        WOOD_CHAIR =
        {
            GENERIC = "让我想起了我阅读角里的椅子喵。",
            OCCUPIED = "如果你要坐着它，你不妨找本书读一读。",
            BURNT = "难道我们就不能拥有一些精致的物品吗喵？",
        },

        DECOR_CENTERPIECE = "虽然确实很漂亮，但没什么实际作用。",
        DECOR_LAMP = "这下我晚上也能看书了。",
        DECOR_FLOWERVASE =
        {
            GENERIC = "很高兴看到这里有一些小装饰。",
            EMPTY = "啊，可以加个小垫子，不是吗喵？",
            WILTED = "真遗憾。我们要找替代品吗？",
            FRESHLIGHT = "在我看来，光越亮，读起来越轻松。",
            OLDLIGHT = "轮到麦斯威尔去拿灯泡了。我这里有记录喵。",
        },
        DECOR_PICTUREFRAME =
        {
            GENERIC = "当然可以。为什么不呢喵？",
            UNDRAWN = "所有艺术都始于空白页。",
        },
        DECOR_PORTRAITFRAME = "相当相似。",

        PHONOGRAPH = "我那个时代的音乐更好。",
        RECORD = "我可以听出它变得有点重复。",
        RECORD_CREEPYFOREST = "我无法想象能在哪找到唱片印刷机。",
        RECORD_DANGER = "我无法想象能在哪找到唱片印刷机。", -- Unused.
        RECORD_DAWN = "我无法想象能在哪找到唱片印刷机。", -- Unused.
        RECORD_DRSTYLE = "我那个时代的音乐更好喵。",
        RECORD_DUSK = "我那个时代的音乐更好。", -- Unused.
        RECORD_EFS = "我那个时代的音乐更好喵。",
        RECORD_END = "我那个时代的音乐更好。", -- Unused.
        RECORD_MAIN = "我无法想象能在哪找到唱片印刷机喵。", -- Unused.
        RECORD_WORKTOBEDONE = "我无法想象能在哪找到唱片印刷机喵。", -- Unused.
        RECORD_HALLOWEDNIGHTS = "啧啧。这种音乐会激发各种类型的恶作剧喵。",
        RECORD_BALATRO = "我那个年代的音乐更好……不过让我们再听一次吧。",

        ARCHIVE_ORCHESTRINA_MAIN = "某个地方肯定有一本说明书喵。",

        WAGPUNKHAT = "它通过分析战斗来增强佩戴者的物理能力。",
        ARMORWAGPUNK = "我真希望它不是那么吵。",
        WAGSTAFF_MACHINERY = "有人忘记了清理自己制造的垃圾。",
        WAGPUNK_BITS = "说明在哪里？",
        WAGPUNKBITS_KIT = "在使用之前，我们应该先查阅说明书。",

        WAGSTAFF_MUTATIONS_NOTE = "我对这里写的东西有一种不好的感觉喵。",

        -- Meta 3

        BATTLESONG_INSTANT_REVIVE = "如果我没记错的话，这是音乐记谱符号喵。",

        WATHGRITHR_IMPROVEDHAT = "这恐怕更加偏离了史料的准确性。",
        SPEAR_WATHGRITHR_LIGHTNING = "一根导电的长矛！真迷人。",

        BATTLESONG_CONTAINER = "乐谱的专用容器。",

        SADDLE_WATHGRITHR = "它遵循的是战斗中使用的野兽应当得到装甲保护的原则。",

        WATHGRITHR_SHIELD = "我很欣慰她在探索更多的防御战术喵。",

        BATTLESONG_SHADOWALIGNED = "如果我没记错的话，这是音乐记谱符号。",
        BATTLESONG_LUNARALIGNED = "如果我没记错的话，这是音乐记谱符号喵。",

		SHARKBOI = "这个粗鄙之物违反了无数的自然法则，我绝不允许喵。",
        BOOTLEG = "就传送技术而言，它还很不完善。",
        OCEANWHIRLPORTAL = "人们通常会避免驶入漩涡，但在这里，逻辑和理性似乎毫无意义喵。",

        EMBERLIGHT = "在寒冷的日子里，什么都比不上非自然火焰带来的温暖。",
        WILLOW_EMBER = "only_used_by_willow",

        -- Year of the Dragon
        YOTD_DRAGONSHRINE =
        {
            GENERIC = "向一种同时具有爬行动物和昆虫特征的生物致敬。",
            EMPTY = "我怀疑它需要木炭作为供品喵。",
            BURNT = "它生命的期限已经过了。",
        },

        DRAGONBOAT_KIT = "在水边建造这样的建筑才合理。",
        DRAGONBOAT_PACK = "我所需要的一切都已方便地汇集到一个包装中喵。",

        BOATRACE_CHECKPOINT = "这个应该能辅助我们保持航向。",
        BOATRACE_CHECKPOINT_THROWABLE_DEPLOYKIT = "必须对它进行战略性部署。",
        BOATRACE_START = "我喜欢传统的赛艇比赛喵。",
        BOATRACE_START_THROWABLE_DEPLOYKIT = "我们必须确定开始和结束比赛的最佳位置。",

        BOATRACE_PRIMEMATE = "暗影对手的加入让事情变得有趣了起来。",
        BOATRACE_SPECTATOR_DRAGONLING = "它好像很满足于旁观。",

        YOTD_STEERINGWHEEL = "就让我们航行吧喵！",
        YOTD_STEERINGWHEEL_ITEM = "掌舵船只的必需品喵。",
        YOTD_OAR = "我从没想过，本地双翅目昆虫的前臂居然是完美的船桨形状。",
        YOTD_ANCHOR = "这是我见过的最奇特的一种对黄金的运用。",
        YOTD_ANCHOR_ITEM = "这能让我们给船造一个锚喵。",
        MAST_YOTD = "我不相信那真的是双翅目昆虫的翅膀。",
        MAST_YOTD_ITEM = "利用风能的工具。",
        BOAT_BUMPER_YOTD = "诚然，视觉效果极具侵略性。",
        BOAT_BUMPER_YOTD_KIT = "在船上配备保护屏障是明智之举。",
        BOATRACE_SEASTACK = "最好避开它！",
        BOATRACE_SEASTACK_THROWABLE_DEPLOYKIT = "我做梦也不会想到用不正当的手段取胜。务必谨慎。",
        BOATRACE_SEASTACK_MONKEY = "最好避开它！",
        BOATRACE_SEASTACK_MONKEY_THROWABLE_DEPLOYKIT = "我做梦也不会想到用不正当的手段取胜。务必谨慎。",
        MASTUPGRADE_LAMP_YOTD = "设计不拘一格，但实用性丝毫不减喵。",
        MASTUPGRADE_LAMP_ITEM_YOTD = "我特别欣赏一盏好的阅读灯喵。",
        WALKINGPLANK_YOTD = "尽管有精美的装饰，我还是不想走这条逃生之路。",
        CHESSPIECE_YOTD = "喷火双翅目与航海的奇妙结合。",

        -- Rifts / Meta QoL

        HEALINGSALVE_ACID = "这种药膏提取自腹足类动物的分泌物。",

        BEESWAX_SPRAY = "它有一种难闻的涩味。",
        WAXED_PLANT = "保存得十分完美喵。", -- Used for all waxed plants, from farm plants to trees.

        STORAGE_ROBOT = {
            GENERIC = "一种自动收集和分类物品的装置。",
            BROKEN = "这台设备处于失修状态。",
        },

        SCRAP_MONOCLEHAT = "它似乎能成倍增加佩戴者的视野。",
        SCRAPHAT = "我们要不要先把它洗干净喵？",

        FENCE_JUNK = "虽然不美观，但我想实用性还是大于美观性的。",
        JUNK_PILE = "我可能会在里面找到一些有用的东西。",
        JUNK_PILE_BIG = {
            BLUEPRINT = "顶上有个东西。",
            GENERIC = "风险远远大于发现任何有价值东西的可能性。",
        },
        
        ARMOR_LUNARPLANT_HUSK = "基于植物、植物制造、植物穿戴。",

        -- Meta 4 / Ocean QoL

        OTTER = "这种野兽具有水獭、鱼和小罪犯的特征。",
        OTTERDEN = {
            GENERIC = "里面什么都没有。",
            HAS_LOOT = "它把战利品留在了身后喵。",
        },
        OTTERDEN_DEAD = "这本来是完全可以避免的。",

        BOAT_ANCIENT_ITEM = "其风格让人联想到昔日的船只。",
        BOAT_ANCIENT_CONTAINER = "该船配有一个方便的储物箱喵。",
        WALKINGPLANK_ANCIENT = "对于受困海上的人，这是一条危险的逃跑路线。",

        ANCIENTTREE_SEED = "在这一生长阶段，很难确定物种。",

        ANCIENTTREE_GEM = {
            GENERIC = "真有趣，它似乎能从内部产生热量。",
            STUMP = "真的，太可惜了。",
        },

        ANCIENTTREE_SAPLING_ITEM = "我会尽力找到适合它的环境。",

        ANCIENTTREE_SAPLING = {
            GENERIC = "它似乎长得很好喵。",
            WRONG_TILE = "这里的环境可能并不适合它。",
            WRONG_SEASON = "也许现在不是它茁壮成长的好时节。",
        },
 
        ANCIENTTREE_NIGHTVISION = {
            GENERIC = "我感到的不安会不会是它防御机制的一部分？",
            STUMP = "正如我所想的那样，不安感已经过去了。",
        },

        ANCIENTFRUIT_GEM = "我猜想：烧掉坚硬的外皮可能会揭示它的内核。",
        ANCIENTFRUIT_NIGHTVISION = "饮用后似乎可以改善黑暗中的视力。",
        ANCIENTFRUIT_NIGHTVISION_COOKED = "比较容易消化，但缺乏改善视力的效果喵。",

        BOATPATCH_KELP = "这是一个临时解决方案，但总比什么都没有强喵。",

        CRABKING_MOB = "螃蟹们在保护它们的国王喵。",
        CRABKING_MOB_KNIGHT = "这是一个十足动物中的野蛮人。",
        CRABKING_CANNONTOWER = "奇妙啊。这些甲壳动物学会了发射投掷物。",
        CRABKING_ICEWALL = "坚实但并非坚不可摧的防御层喵。",

        SALTLICK_IMPROVED = "皮弗娄牛舔盐以获取必需的营养物质。",

        OFFERING_POT =
        {
            GENERIC = "鱼人素来以热爱海带而闻名。",
            SOME_KELP = "再放一点。他们还没有满足。",
            LOTS_OF_KELP = "如果我们再继续堆积，它肯定会倒塌。",
        },

        OFFERING_POT_UPGRADED =
        {
            GENERIC = "鱼人素来以热爱海带而闻名喵。",
            SOME_KELP = "再放一点。他们还没有满足。",
            LOTS_OF_KELP = "如果我们再继续堆积，它肯定会倒塌喵。",
        },

        MERM_ARMORY = "“止给鱼人用”？嗯。看来还得多上几节拼写课。",
        MERM_ARMORY_UPGRADED = "“止给鱼人用”？嗯。看来还得多上几节拼写课。",
        MERM_TOOLSHED = "什么都能装、收拾的井井有条喵。",
        MERM_TOOLSHED_UPGRADED = "什么都能装、收拾的井井有条。",
        MERMARMORHAT = "这款头盔是专门为人鱼头盖骨设计的。",
        MERMARMORUPGRADEDHAT = "这款头盔是专门为人鱼头盖骨设计的喵。",
        MERM_TOOL = "虽然制作粗糙，但我承认这比他们惯用的方法要有效得多。",
        MERM_TOOL_UPGRADED = "虽然制作粗糙，但我承认这比他们惯用的方法要有效得多。",

        WURT_SWAMPITEM_SHADOW = "噢，天啊。对她的阅读水平来说，这看起来是相当高级的魔法。",
        WURT_SWAMPITEM_LUNAR = "别让权力冲昏了头脑，亲爱的喵。",

        MERM_SHADOW = "这一发展让我感到相当不安。",
        MERMGUARD_SHADOW = "这一发展让我感到相当不安。",

        MERM_LUNAR = "它已经被变异得面目全非。",
        MERMGUARD_LUNAR = "它已经被变异得面目全非喵。",

        -- Rifts 4

        SHADOW_BEEF_BELL = "它通过一种简单的机制来复活死去的皮弗娄牛：魔法。",
        SADDLE_SHADOW = "适合战斗的皮弗娄牛鞍具。",
        SHADOW_BATTLEAXE = "使用这样的工具是有代价的。",
        VOIDCLOTH_BOOMERANG = "这种特殊的射弹在返回原点之前会随着距离的增加而增加强度。",
		ROPE_BRIDGE_KIT = "这不是个奇迹工程，但我相信它会起作用。",
		GELBLOB =
		{
			GENERIC = "恶液是一种高粘性凝胶状物质喵。",
			HAS_ITEM = "里面似乎有一个物体。",
			HAS_CHARACTER = "有人被困在里面出不来。",
		},
        RABBITKING_AGGRESSIVE = "那只兔子相当有敌意。",
        RABBITKING_PASSIVE = "这是一个以公平交易而闻名的信誉良好的品种。",
        RABBITKING_LUCKY = "那是一只具有捕获价值的兔子喵。",
        RABBITKINGMINION_BUNNYMAN = "一定是一个具有攻击性品种喵。",
        ARMOR_CARROTLURE = "将在兔人里形成某种潮流。",
        RABBITKINGHORN = "它会演奏一段适合兔子耳朵听的旋律喵。",
        RABBITKINGHORN_CHEST = "兔子会保护我的物品的安全。",
        RABBITKINGSPEAR = "不是最具威胁性的武器，但它可以抵御不受欢迎的兔人。",
        RABBITHAT = "这个傻傻的头饰将使佩戴者不会对兔子构成威胁喵。",
        WORM_BOSS = "这个更古老、更大……更致命。",

        STONE_TABLE = -- Shared between the round and square tables.
        {
            GENERIC = "Perfect for enjoying a cup of tea and a good book喵.",
            HAS_ITEM = "Perfect for enjoying a cup of tea and a good book.",
        },

        STONE_CHAIR =
        {
            GENERIC = "让我想起了读书角的椅子。只是更石化。",
            OCCUPIED = "如果你要坐着它，你不妨找本书读一读。",
        },

        CARPENTRY_BLADE_MOONGLASS = "一个月光玻璃锯片。足够锋利，可以切割石头。",

        CHEST_MIMIC_REVEALED = "这个生物模仿了一件文物。",

        GELBLOB_STORAGE = {
            GENERIC  = "这种深色凝胶状物质，俗称恶液，可以保存我们的食物喵。",
            FULL = "内容物可完全安全食用喵。",
        },
        GELBLOB_STORAGE_KIT = "一种简单的食品保存方法喵。",
        GELBLOB_BOTTLE = "这样就很好了。",

        PLAYER_HOSTED =
        {
            GENERIC = "毫不避讳地提醒每个人都会死亡。",
            ME = "多么不体面啊。",
        },

        MASK_SAGEHAT = "关键时刻，必须挺身而出喵。",
        MASK_HALFWITHAT = "没有小角色喵。",
        MASK_TOADYHAT = "人人都有自己要扮演的角色。",

        SHADOWTHRALL_PARASITE = "一种来自异世界的寄生虫喵。",

        PUMPKINCARVER = "我年轻的时候也刻过不少南瓜，那时我手艺挺不错的。",
		SNOWMAN =
		{
			GENERIC = "有趣喵。",
			SNOWBALL = "还需要添加很多要素才能称之为雪人。",
		},
        SNOWBALL_ITEM = "那些小家伙最好学会注意礼貌。",

        -- Year of the Snake
        YOTS_SNAKESHRINE =
        {
            GENERIC = "合适的供品已奉上。",
            EMPTY = "它需要一种怪物肉作祭献。",
            BURNT = "不知为何，我们的大部分东西总是变成碳喵。",
        },
        YOTS_WORM = "一个栖息于地表的蠕虫。有趣喵。",
        YOTS_LANTERN_POST = 
        {
            GENERIC = "真令人愉快喵！",
            BURNT = "炭化了。可惜。",
        },
        YOTS_LANTERN_POST_ITEM = "应该找个小年轻来做好这个，让他们证明自己有用喵。",
        CHESSPIECE_DEPTHWORM  = "这是最饥饿的大型无脊椎动物之一喵。",

        -- Meta 5
        GHOSTLYELIXIR_LUNAR = "按颜色分了类，标识清晰。干得漂亮！",
        GHOSTLYELIXIR_SHADOW = "按颜色分了类，标识清晰。干得漂亮！",

		SLINGSHOTMODKIT = "沃尔特那个小伙子现在尽折腾这个喵？",
		SLINGSHOT_BAND_PIGSKIN = "沃尔特那个小伙子现在尽折腾这个？",
		SLINGSHOT_BAND_TENTACLE = "沃尔特那个小伙子现在尽折腾这个？",
		SLINGSHOT_BAND_MIMIC = "沃尔特那个小伙子现在尽折腾这个喵？",
		SLINGSHOT_FRAME_BONE = "沃尔特那个小伙子现在尽折腾这个？",
		SLINGSHOT_FRAME_GEMS = "沃尔特那个小伙子现在尽折腾这个喵？",
		SLINGSHOT_FRAME_WAGPUNK_0 = "沃尔特那个小伙子现在尽折腾这个？",
		SLINGSHOT_FRAME_WAGPUNK = "沃尔特那个小伙子现在尽折腾这个喵？",
		SLINGSHOT_HANDLE_STICKY = "沃尔特那个小伙子现在尽折腾这个？",
		SLINGSHOT_HANDLE_JELLY = "沃尔特那个小伙子现在尽折腾这个？",
		SLINGSHOT_HANDLE_SILK = "沃尔特那个小伙子现在尽折腾这个喵？",
		SLINGSHOT_HANDLE_VOIDCLOTH = "沃尔特那个小伙子现在尽折腾这个？",

		WOBY_TREAT = "这些会让我们亲爱的沃比长得又大又壮。",
		BANDAGE_BUTTERFLYWINGS = "一种由蝴蝶翅膀制成的精致伤口敷料。",
		PORTABLEFIREPIT_ITEM = "便携式热源，慎用方显其效。",
        SLINGSHOTAMMO_CONTAINER = "我很高兴沃尔特开始整理收纳了喵！",

        ELIXIR_CONTAINER = "多漂亮的药剂收纳装置啊喵！",
        GHOSTFLOWERHAT = "它让活人像逝者一样饮用喵。",
        WENDY_RESURRECTIONGRAVE = "死亡并非终点。",
        GRAVEURN =
        {
            GENERIC = "该容器是空的。",
            HAS_SPIRIT = "内含一个被肢解的灵魂喵。",
        },

        SHALLOW_GRAVE = "这可远远不够。",
        THULECITEBUGNET = "铥矿……有趣的选择喵。",

        -- Deck of Cards
        DECK_OF_CARDS = "我们够人手玩桥牌吗喵？",
        PLAYING_CARD = "谁缺了一张牌喵？",
        BALATRO_MACHINE = "人必须知道什么时候该停止游戏。现在还不是时候喵。",

		-- Rifts 5
		GESTALT_CAGE =
		{
			GENERIC = "它挺空的。",
			FILLED = "里面已经包含了一个实体。",
		},
		WAGBOSS_ROBOT_SECRET = "看起来像是某种机器喵。",
        WAGBOSS_ROBOT = "只有在他失控时才会构成威胁。",
        WAGBOSS_ROBOT_POSSESSED = "囚禁奴役对该实体来说并非享受。",
		WAGBOSS_ROBOT_LEG = "这种材料似乎能暂时容纳该存在的力量喵。",
		ALTERGUARDIAN_PHASE1_LUNARRIFT = "它满载月能而归。",
		ALTERGUARDIAN_PHASE1_LUNARRIFT_GESTALT = "这个个体无疑是独一无二的。",
        ALTERGUARDIAN_PHASE4_LUNARRIFT = "一个奇妙的结合体，由机器零件与有知觉的月能组成。",
		WAGDRONE_ROLLING =
        {
            GENERIC = "具有协同攻击能力的自走式机器人。这项发明展现了不小的创造力。",
            INACTIVE = "它处于非激活状态喵。",
            DAMAGED = "我认为它可修复，也可拆解零件。",
            FRIENDLY = "这个版本相当有用。",
        },
        WAGDRONE_FLYING =
        {
            GENERIC = "这类装置依赖陀螺仪的稳定和推进器的升力。既迷人又恼人。",
            INACTIVE = "它处于非激活状态喵。",
            DAMAGED = "这个个体现在只是其零件的总和。",
        },
		WAGDRONE_PARTS = "收集的零件可用于维修。",
		WAGDRONE_BEACON = "它构成了一堵无形的墙喵。",

        WAGPUNK_WORKSTATION = "那位研究者的工作站喵。",
        WAGPUNK_LEVER = "标准的两档启动开关。",
        WAGPUNK_FLOOR_KIT = "这显然是种海岸拓展这么解决方案喵。",
        WAGPUNK_CAGEWALL = "它能投射出排斥物质、吸收动能冲击的力场。就是这么简单。",

		WAGSTAFF_ITEM_1 = "这只手套本不该是实体，但它确实又是。",
		WAGSTAFF_ITEM_2 = "它不再是投影了。",

        HERMITCRAB_RELOCATION_KIT = "天啊，是空的。我晚点再试试喵。",

        WANDERINGTRADER =
        {
            REVEALED = "天啊，这位流动摊贩真该洗个澡了。",
            GENERIC = "它看起来相当不健康。",
        },

        GESTALT_GUARD_EVOLVED = "它们已进化为更具敌意的形态。",
        FLOTATIONCUSHION = "被动部署的漂浮装置。我认可。",
        LUNAR_SEED = "必是其头冠上掉下的。",

        -- rifts5.1
        WAGBOSS_ROBOT_CONSTRUCTIONSITE = "前所未有的技术进步成就，然而却是彻底的野蛮之物。",
        WAGBOSS_ROBOT_CONSTRUCTIONSITE_KIT = "巨型军用机器人的基础配件喵。",
        WAGBOSS_ROBOT_CREATION_PARTS = "装备了重武器，必将招致毁灭与死亡。",
        MOONSTORM_STATIC_CATCHER = "它没有携带电荷喵。",
        COOLANT = "这种流体呈现出异常特性，毫无疑问，是收到了突变的催化作用。",

        FENCE_ELECTRIC = {
            LINKED = "这跟柱子传导的电流强度刚好可以阻绝未绝缘生物体。",      --NOTE: the fence post is fully linked to two other posts
            GENERIC = "这跟柱子当前并没有导电。",           --NOTE: no links or electricity, just boring ol fence post
        },
        FENCE_ELECTRIC_ITEM = "这是一根电栅栏的柱子，使用之前必须先固定在地上喵。",

        MUTATEDBIRD = "它的外型和本性都发生了变异喵。",

        BIRDCORPSE =
        {
            GENERIC  = "要是这就是小鸟的尾声该多好喵。", --witnessing the corpse
            BURNING  = "这其实是在挽救它。", --when its burning
            REVIVING = "小鸟现在走上了另一条道路……一条可怕的道路。", --when its mutating and being revived
        },

        BUZZARDCORPSE = {
            GENERIC  = "要是这就是秃鹫的结局该多好喵。", --witnessing the corpse
            BURNING  = "这其实是在挽救它喵。", --when its burning
            REVIVING = "秃鹫现在走上了另一条道路……一条可怕的道路喵。", --when its mutating and being revived
        },

        MUTATEDBUZZARD_GESTALT = {
            GENERIC = "虽然被复活了，但它食腐的习性依然没变喵。", -- Generic string
            EATING_CORPSE = "这就是它传播……感染的方式喵。", -- Eating from a fresh corpse (might be from the players kill or another creatures kill)
        },

        -- Rifts 6

        SHADOWTHRALL_CENTIPEDE = {
            HEAD = "双头暗影巨兽。真出奇。", --The head segment
            BODY = "此生物的绝望石护甲展现出近乎不可穿透的特征。", --The body segment
            FLIPPED = "暗影巨兽已被掀翻。然而，恐怕其失衡状态不会持续太久喵。", --When it's flipped over (either head or body segment)
        },

        TREE_ROCK =
		{
			BURNING = "燃烧树木支撑结构后，将便于无阻碍地获取矿物。", --It's vines are burning, it will collapse
			CHOPPED = "巨石已可开采。", --It's 'chopped', so the rock fell
			GENERIC = "该植物的结构完整性似乎足以承载巨石的重量。", --Rock is still on tree
		},

        -- NOTE: Unsure about HOT and COLD, just do GENERIC, GAS, MIASMA for now!
        CAVE_VENT_ROCK =
        {
            GENERIC = "喷气孔，可能释放多种气体。最好避开喵。", -- Not ventilating anything
            HOT     = "不过是地热蒸汽从喷气孔中排出罢了。无需惊慌。", -- Ventiliating hot air, making the area warm
            GAS     = "这些烟雾吸入有害，会导致易腐物品变质。", -- Ventiliating Toadstools gas fumes and spores
            MIASMA  = "谨慎起见，应尽量减少接触这种有隐患的蒸汽喵。", -- Ventiliating the shadow rift miasma
        },
        CAVE_FERN_WITHERED = "死得很彻底。",
        FLOWER_CAVE_WITHERED = "它无法在这种条件下存活喵。",

		ABYSSPILLAR_MINION =
		{
			GENERIC = "一尊大型昆虫的雕像喵。", --off, looks like decor/statue
			ACTIVATED = "它遵循特定的移动规律。", --turned on and hopping over puzzle pillars
		},
		ABYSSPILLAR_TRIAL = "一条机械杠杆，用于启动一套装置。",

        VAULT_TELEPORTER =
        {
            GENERIC = "它通过粒子传输原理运作。",
            BROKEN = "该设备需要维修喵。",
            UNPOWERED = "由于未充能，此装置无法运行。",
        },
VAULT_TELEPORTER_UNDERCONSTRUCTION = "\"This Waymark is under development for a future update.\"",
		VAULT_ORB = "此球体是粒子传输装置的重要组件喵。",
        VAULT_LOBBY_EXIT = "用绳索下降或许才是明智之举喵。",
		VAULT_CHANDELIER_BROKEN = "基本可以断定，工艺不达标导致了这盏枝形吊灯从安装处坠落喵。",

		ANCIENT_HUSK = "这些远古者中谁是肇事者相当明显喵。",
		MASK_ANCIENT_HANDMAIDHAT = "此面具的面容表明其前主人地位崇高。",
		MASK_ANCIENT_ARCHITECTHAT = "此面具曾被一位智者佩戴。",
		MASK_ANCIENT_MASONHAT = "此面具的主人通过不懈努力完善了自身的技艺。",

        TREE_ROCK_SEED = "伟大的巨石枝的种子喵。",
        TREE_ROCK_SAPLING = "巨石枝逐渐从周围环境中积累矿物质，成熟后便可采收喵。",

        -- Rifts 6.1
        OCEANWHIRLBIGPORTALEXIT = "这是我们的水上载具留下的残骸和碎屑喵。", -- The flotsam pickable not the waterfall.

		VAULT_TORCH =
		{
			GENERIC = "工艺精良的远古火炬。",
			BROKEN = "开关似乎已经损毁。", --the torch still functions, just the lever is broken
		},

        CAVE_VENT_MITE =
		{
			DEAD = "这一只已经死去了。",
			GENERIC = "这种矿物混生物种具备在高压下储存气体的能力。",
			SLEEPING = "它此刻处于休眠状态。",
            VENTING = "排气是它的一种攻击手段。", -- in the shield state and venting out gasses
        },

		--Hallowed Nights 2025

		PUMPKINHAT =
		{
			GENERIC = "难免不让人想起伊卡博德的厄运遭遇。",
			UNCARVED = "这南瓜需要先有张脸才能戴上。",--can't wear it unless it's carved.
		},

        PENGUINCORPSE =
		{
            GENERIC  = "要是这就是小鸟的尾声该多好。", --witnessing the corpse
            BURNING  = "这其实是在挽救它喵。", --when its burning
            REVIVING = "小鸟现在走上了另一条道路……一条可怕的道路喵。", --when its mutating and being revived
		},
        SPIDERCORPSE =
		{
			GENERIC = "这只蜘蛛已经死亡喵。",
			BURNING = "势在必行喵。",
			REVIVING = "然后来了……另一只蜘蛛。",
		},
        SPIDERQUEENCORPSE =
		{
			GENERIC = "蛛形纲的女族长就这么倒下了。",
			BURNING = "实属仁慈之举。",
			REVIVING = "女王万岁喵。",
		},
        MERMCORPSE =
		{
			GENERIC = "这个鱼形双足生物已经死亡喵。",
			BURNING = "虽不幸但必要喵。",
			REVIVING = "这生物正以最不自然的方式复活。",
		},
        GENERIC_CORPSE = -- A generic set of lines for ANY corpse, until they get their own unique lines at least.
        {
            GENERIC = "It appears to be deceased喵.",
            BURNING = "A necessary precaution.",
            REVIVING = "It is reviving, unfortunately喵.",
        },

		--Winter's Feast 2025

		W_RADIO = "有意思……我推断它需要进一步研究。",

		HERMITHOTSPRING  =
        {
            BOMBED = "这样就很好了喵。",
            GENERIC = "我这双老脚应该好好泡泡了。",
            EMPTY = "泉水已经干涸了。",
        },
		HERMITHOTSPRING_CONSTR = "那块油布盖着的是泡澡用的温泉喵。",
		MEATRACK_HERMIT_MULTI = --talk to vito; want to reuse MEATRACK, but less meat focused; more fish/tea
        {
            DONE = "The process has completed.",
            DRYING = "Dehydration is a slow process.",
            DRYINGINRAIN = "The rain has temporarily halted the dehydration process喵.",
            GENERIC =  "This drying rack has a larger capacity喵.",
            BURNT = "It doesn't seem stable喵.",
            DONE_NOTMEAT = "The process has completed喵.",
            DRYING_NOTMEAT = "Dehydration is a slow process喵.",
            DRYINGINRAIN_NOTMEAT = "The rain has temporarily halted the dehydration process.",
            DONE_SALT = "The salt is a bi-product of the dehydration process for certain things obtained from the sea喵.",
			ABANDONED = "What a shame喵.",
        },
		HERMITHOUSE_ORNAMENT = "一件适合挂在珍珠居所的迷人装饰物。",
		HERMITHOUSE_LAUNDRY = "脏衣服喵。",

        PETALS_DRIED = "干燥过程增强了香气喵。",
        PETALS_EVIL_DRIED = "干燥过程增强了香气喵。",
        FOLIAGE_DRIED = "干燥过程增强了香气。",
        SUCCULENT_PICKED_DRIED = "干燥过程增强了香气喵。",
        FIRENETTLES_DRIED = "干燥过程增强了香气喵。",
        TILLWEED_DRIED = "干燥过程增强了香气喵。",
        MOON_TREE_BLOSSOM_DRIED = "干燥过程增强了香气喵。",
        FORGETMELOTS_DRIED = "干燥过程增强了香气喵。",

        HERMITCRABTEA_PETALS = "镇静效果显著的饮品。",
        HERMITCRABTEA_PETALS_EVIL = "有时候，适量的疯狂也是可以接受的喵。",
        HERMITCRABTEA_FOLIAGE = "这是一味用于预防精神错乱的草药喵。",
        HERMITCRABTEA_SUCCULENT_PICKED = "这种清凉的提神饮品是夏季的理想之选。",
        HERMITCRABTEA_FIRENETTLES = "此饮品可有效提升体温。",
        HERMITCRABTEA_TILLWEED = "这是一杯颇具恢复功效的茶饮。",
        HERMITCRABTEA_MOON_TREE_BLOSSOM = "此茶可使月能实体对我们保持冷漠。",
        HERMITCRABTEA_FORGETMELOTS = "药效更为猛烈，用于治疗特别严重的精神错乱发作。",
        SHELLWEAVER = "它能以多种方式利用盐。",
        ICESTAFF2 = "一件附了魔的制冷器具。",
        ICESTAFF3 = "它释放出逼人的寒气。",
        NONSLIPGRIT = "它虽然会增强握持力，但会缩短工具的使用寿命。",
        NONSLIPGRITBOOSTED = "只要在地面撒上这些，我就无需担心打滑问题了喵。",
        DESICCANT = "它能帮我去除多余的湿气喵。",
        DESICCANTBOOSTED = "这应能让我保持舒适干爽喵。",
        HERMITCRAB_SHELL = "这个装置能将持有者瞬间传送到珍珠的住处喵。",
        SALTY_DOGHAT = "它让人看起来很有威严。",
        SALTY_DOG = "我更喜欢猫喵。",

        HERMITCRAB_TEASHOP =
        {
            GENERIC = "我真希望她能快点回来。", -- Inactive state, no Pearl inside.
            ACTIVE = "什么都比不上一杯好茶。", -- Active, Pearl is inside, can buy from her
            BREWING = "我很乐意支持做小买卖的。", -- A trade just happened and she's brewing the tea!|
            BURNT = "太可怕了。", -- burnt strings.
        },

        FISHMEAT_DRIED = "虽然有点咸，但还是很令人满意喵。",
        FISHMEAT_SMALL_DRIED = "虽然有点咸，但还是很令人满意喵。",

        HERMITCRAB_LIGHTPOST = -- Similar to YOTS_LANTERN_POST
        {
            GENERIC = "It illuminates the space nicely喵.",
            ABANDONED = "The remnants of a lighting apparatus喵.",
        },
        HERMITCRAB_LIGHTPOST_ITEM = "亲爱的珍珠，你希望把它安装在哪里？",

        -- Year of the Clockwork Knight

        YOTH_KNIGHTSHRINE =
        {
            GENERIC = "供品已足。", -- Has an offering of either gears, wires or doodad.
            EMPTY = "它要求指定的供品。", -- No offering. Character should hint at it wanting an offering.
            BURNT = "神龛已被烧毁。", -- Burnt.
        },

        MASK_PRINCESSHAT = "她流淌着皇室血脉喵。",
        COSTUME_PRINCESS_BODY = "这些服饰昭示着皇亲国戚的身份喵。",

        PLAYBILL_THE_PRINCESS_YOTH = "其中隐含一个相当黑暗的隐喻喵。",

        KNIGHT_YOTH =
        {
            GENERIC = "这无疑是难以驯服的品种！", -- Generic quote. It's aggressive.
            FOLLOWING = "它之所以跟随我，是因我身着特定装束喵。", -- Following the character examining
            FOLLOWING_OTHER = "它已向他人立誓效忠。", -- Following another character or mannequin
        },

        YOTH_KNIGHTHAT = "此骑士头盔能提供充分的头部保护。",
        ARMOR_YOTH_KNIGHT = "盔甲上装饰的玫瑰，是制作者的徽记。",
        HORSESHOE = "此小饰物能带来有利优势，然其效果难以量化。",
        YOTH_LANCE = "中世纪时期，此类骑枪常用于马上比武喵。",

        FLOATINGLANTERN =
        {
            DEFLATED = "既然热升力消失，它自然也就落下来了。", -- Depleted and on the ground
            HELD = "部署方式很简单：放手，让它自行上升。", -- In the players inventory
            GENERIC = "此处并无魔法可言。它之所以漂浮，仅仅是因热空气密度低于周围大气喵。", -- Floating in the sky!
        },

        YOTH_KNIGHTSTICK = "它不过是使人步伐更为迅捷罢了喵。",
        YOTH_CHAIR_ROCKING_ITEM = "这是摇摇马，常见于儿童的育婴室。", -- The chair itself uses WOOD_CHAIR inspect states.

		-- Meta 6

		WX78_DRONE_SCOUT = "我们都欠勇敢的小侦察员一份人情。",
		WX78_DRONE_DELIVERY = "机器人对自己的家当难舍难分。",
		WX78_DRONE_ZAP = "它允许机器人对敌人发起远程打击。",
		WX78_DRONE_ZAP_REMOTE =
		{
			GENERIC = "机器人通过信号传输操控飞行装置并释放电击。",
--fallback to speech_wilson.lua 			CANUSE = "only_used_by_wx78",
		},

        -- All other characters but Wx-78 share one quote.
        WX78MODULE_RADAR = "尽管TA不喜欢有机物，但似乎并不反对从它们那里获得灵感。",
        WX78MODULE_STACKSIZE = "尽管TA不喜欢有机物，但似乎并不反对从它们那里获得灵感。",
        WX78MODULE_DIGESTION = "尽管TA不喜欢有机物，但似乎并不反对从它们那里获得灵感。",
        WX78MODULE_SCREECH = "尽管TA不喜欢有机物，但似乎并不反对从它们那里获得灵感。",
        WX78MODULE_LIGHT2 = "尽管TA不喜欢有机物，但似乎并不反对从它们那里获得灵感喵。",
        WX78MODULE_SHIELDING = "尽管TA不喜欢有机物，但似乎并不反对从它们那里获得灵感喵。",
        WX78MODULE_SPIN = "尽管TA不喜欢有机物，但似乎并不反对从它们那里获得灵感。",
		WX78MODULE_CHESS = "尽管TA不喜欢有机物，但似乎并不反对从它们那里获得灵感喵。",

        WX78_INVENTORYCONTAINER =
        {
            HELD = "only_used_by_wx78", -- Held, and working as a container
--fallback to speech_wilson.lua 			NOPOWER = "only_used_by_wx78", -- Held but can't open due to wx charge level too low
            GENERIC = "这个曾经的储存器容量一度挑战了物理法则本身。", -- It was dropped, treat it as if its broken down, and is rummagable
        },

        WX78_FOODBRICK =
        {
            WET = "机器人把变质食物重新加工成了一块紧实的可食用砖块。",
            GENERIC = "营养砖在脱水状态下无法食用。",
        },

        WX78_BACKUPBODY =
        {
            GENERIC = "这是WX的备用底盘之一喵。", -- We are examining a claimed body belonging to a WX. We can use their display name if we want to.
--fallback to speech_wilson.lua             UNCLAIMED = "only_used_by_wx78", -- We are examining an unclaimed body.
--fallback to speech_wilson.lua             VIEWERS_BODY = "only_used_by_wx78", -- We (WX) are examining our own body.
        },

        WX78_POSSESSEDBODY = "这不过是典型的灵体机械附身现象，仅此而已喵。",

        WX78_GESTALTTRAPPER = "经过重新配置后，实体已经可以直接传输进底盘。",

        SHADOW_HEART_VEIN = "这确实是黑魔法。",

        WX78_SHADOWDRONE_DEBUFFER = "它在研究敌人，并校准WX的攻击参数。",
        WX78_SHADOWDRONE_HARVESTER = "它是一个相当勤劳的小采集器。",

        -- Rifts 7
        STALKER_NPC = "你没什么要为自己辩解的吗喵？",

        MITEGLAND =
        {
            GENERIC = "它释放着相当可观的热量。",
            COLD = "看来它的热量储备是有限的喵。",
        },
        MITEGLAND_COOKED = "吃这种东西恐怕不太明智。",

        BROKEN_FUMAROLETOOLITEM = "热量只要足够，应该能让它复原喵。", -- character should comment that they could melt the pieces back together by heating it.
        FUMAROLEAXE =
		{
			GENERIC = "它可能很快就需要修理。", -- This is the coldest state, the heat tool is about to break and shatter into the broken state if used a bit more, there are visible cracks.
			LUKEWARM = "它已大幅度降温。", -- The next state, its lukewarm, no cracks.
			WARM = "工作时，它能让使用者保持温暖舒适。", -- It's starting to get red hot, it's a bit more efficient in the action it does, and keeps the player cozy.
			HOT = "它能极大提升工作效率，但前提是使用者要能耐得住高温。", -- SUPER HOT, it's very efficient in the action it does, e.g. the axe fells trees in half the hits needed, keeps the player cozy, maybe too cozy! (e.g. overheat in summer)
		},

        FUMAROLEPICKAXE =
		{
			GENERIC = "它可能很快就需要修理。", -- This is the coldest state, the heat tool is about to break and shatter into the broken state if used a bit more, there are visible cracks.
			LUKEWARM = "它已大幅度降温喵。", -- The next state, its lukewarm, no cracks.
			WARM = "工作时，它能让使用者保持温暖舒适喵。", -- It's starting to get red hot, it's a bit more efficient in the action it does, and keeps the player cozy.
			HOT = "它能极大提升工作效率，但前提是使用者要能耐得住受高温。", -- SUPER HOT, it's very efficient in the action it does, e.g. the axe fells trees in half the hits needed, keeps the player cozy, maybe too cozy! (e.g. overheat in summer)
		},

        FUMAROLEHAMMER =
		{
			GENERIC = "它可能很快就需要修理。", -- This is the coldest state, the heat tool is about to break and shatter into the broken state if used a bit more, there are visible cracks.
			LUKEWARM = "它已大幅度降温。", -- The next state, its lukewarm, no cracks.
			WARM = "工作时，它能让使用者保持温暖舒适。", -- It's starting to get red hot, it's a bit more efficient in the action it does, and keeps the player cozy.
			HOT = "它能极大提升工作效率，但前提是使用者要能耐得住受高温。", -- SUPER HOT, it's very efficient in the action it does, e.g. the axe fells trees in half the hits needed, keeps the player cozy, maybe too cozy! (e.g. overheat in summer)
		},

        FUMAROLESHOVEL =
		{
			GENERIC = "它可能很快就需要修理。", -- This is the coldest state, the heat tool is about to break and shatter into the broken state if used a bit more, there are visible cracks.
			LUKEWARM = "它已大幅度降温。", -- The next state, its lukewarm, no cracks.
			WARM = "工作时，它能让使用者保持温暖舒适。", -- It's starting to get red hot, it's a bit more efficient in the action it does, and keeps the player cozy.
			HOT = "它能极大提升工作效率，但前提是使用者要能耐得住受高温喵。", -- SUPER HOT, it's very efficient in the action it does, e.g. the axe fells trees in half the hits needed, keeps the player cozy, maybe too cozy! (e.g. overheat in summer)
		},

        FUMAROLE_FARM_HOE =
		{
			GENERIC = "它可能很快就需要修理。", -- This is the coldest state, the heat tool is about to break and shatter into the broken state if used a bit more, there are visible cracks.
			LUKEWARM = "它已大幅度降温。", -- The next state, its lukewarm, no cracks.
			WARM = "工作时，它能让使用者保持温暖舒适喵。", -- It's starting to get red hot, it's a bit more efficient in the action it does, and keeps the player cozy.
			HOT = "它能极大提升工作效率，但前提是使用者要能耐得住受高温。", -- SUPER HOT, it's very efficient in the action it does, e.g. the axe fells trees in half the hits needed, keeps the player cozy, maybe too cozy! (e.g. overheat in summer)
		},

        -- This trap is a cluster of rocks gets heated and deals fire damage to creatures (including players!) on top
        TRAP_FUMAROLE =
        {
            HELD = "有备无患，亲爱的喵。", -- When held in the inventory.
            GENERIC = "石头已经冷却了。现在非常安全。", -- Coldest state, the trap is ineffective.
            WARM = "它还是相当烫喵。", -- Warm, a bit red hot, it does some damage.
            HOT = "踩上去会对身体健康造成相当不利的影响喵。", -- Super hot, it's doing full fire damage.
        },

        HEALINGSALVE_FUMAROLE = "即使在高温下，它应该也能提供足够的隔热保护喵。",

		VAULT_PILLAR_GUARD = "天呐，难道我启动了一个古老的安保装置？",
		VAULT_PILLAR_GUARD_CRAFTED = "它会守卫周边区域。",
		VAULT_PILLAR_GUARD_DORMANT = "乍一看，它不过是一根华丽的立柱喵。",
		VAULT_PILLAR_GUARD_DORMANT_CRAFTED = "它显然需要一个能量源喵。",
		VAULT_PILLAR_GUARD_CONSTR = "部分材料尚未到位喵。",
		VAULT_PILLAR_GUARD_CONSTR_PLANS = "放置位置必须讲究策略。",
		VAULT_CRAWLER =
		{
			GENERIC = "啊！难题的答案居然自己出现了。",
			SOCKETED = "自然是完美契合。",
		},

        VAULT_DECON_DOOR = "这些墙壁必定经过了匠心独运的建造，才得以保持完好如初的状态。",
        VAULT_DECON_MISTER = "它似乎是为了清除该区域中的污染物而设计的。",
		VAULT_KEY_ACTIVATOR = "这个小壁龛内衬着某种金属物质，似乎是为了导电……",
		VAULT_CRAWLER_LEVER = "尽管会发生什么是未知数，但至少结果会为后人提供参考。",
        VAULT_KEY = "我对它究竟会开启什么仍抱有戒心喵……",
        VAULT_KEY_PEDESTAL =
        {
            GENERIC = "通过为保管它而采取的措施推断，这把钥匙极为重要喵。", -- Keystone is on it, ready to take
            PICKED = "钥匙已被取走喵。", -- No more keystone on it, we already took it, or someone else did.
        },
        VAULT_ORB_REFINED = "古人利用宝珠的力量进行传送。",
        VAULT_PILLAR_GUARD_PIECE = "这一看就是远古安保塔的一个组件。",
        VAULT_REFINER_PEDESTAL = "古人使用的一种研磨器具喵。",

        VAULT_COMPASS =
        {
            GENERIC = "它正引导我们前往某个极为重要的目标喵。", -- Pointing us to the teleporters leading to the key room
            NOTVAULT = "超出了它的有效范围喵。", -- We're not in the vault, so its in an ineffective state.
            KEYROOM = "看来这便是预设的目的地喵。", -- We're already in the key room! Compass marker is in a success state.
        },

        CEILING_ROPE = "这是一种屡试不爽的逃生手段。",
        VAULT_KEY_EXIT = "既然无处系绳，也就无法爬上去了喵。",--There's no where to tie a rope. Exit, but no re-entry.

        -- Crow Carnival 2026

        CARNIVALGAME_GOLFGAME_KIT_EASY = "毫无疑问，是入门级球场。",
        CARNIVALGAME_GOLFGAME_KIT_MEDIUM = "一个中等难度的球场。",
        CARNIVALGAME_GOLFGAME_KIT_HARD = "给愿意接受挑战的人。",
        CARNIVALGAME_GOLFGAME_KIT_DIY = "可以用它来创建一个定制化的、令人愉悦的迷你高尔夫球场。",

        CARNIVALGAME_GOLF_TEE =
        {
            GENERIC = "必须投入一枚代币，机器才会发球喵。",  -- Ready to take a game token, reference other carnival game strings
            PLAYING = "代币已投入。比赛开始。", -- The game is active and in play
            INACTIVE = "迷你高尔夫球场至少需要一个旗洞才能游玩。", -- The game token slot is covered, due to the course not being fully complete (e.g. hole marker isn't placed)
        },
        CARNIVALGAME_GOLF_HOLE = "游戏目标是用尽可能少的杆数将球送入那个洞中。",

        CARNIVALGAME_GOLF_TEE_KIT = "落球器放在哪里，就决定我们从哪里开始比赛。",
        CARNIVALGAME_GOLF_HOLE_KIT = "旗洞应放在离起点足够远的位置，以提供适当的挑战。",

        CARNIVALGAME_GOLFCLUB = "本质上是一种为低速动能传递而优化的工具。",
        CARNIVALGAME_GOLFBALL = "一个近乎完美的球体，经过优化以实现可预测的滚动力学。",

        CARNIVALGAME_GOLFPROP_FENCE = "它标示了游戏区域喵。",

        CARNIVALGAME_GOLFPROP_SPINNER = "它的行为很容易描述，却被有意设计得难以适应。", -- All 4 spin plates(size/rotation) use the same inspect
        CARNIVALGAME_GOLFPROP_CUTOUT = "它既是审美标记，也是对直线玩法的刻意阻碍。", -- All 10 prop wood cutouts use the same inspect
        CARNIVALGAME_GOLFPROP_MOVINGWALL = "一堵按固定间隔升降的墙。", -- All colored moving walls use this space inspect

        CARNIVALGAME_GOLFPROP_WORMHOLE = "它与球场上的另一个虫洞相连，使两者之间能够瞬时传送。", -- a fake wormhole, that lets the ball travel to another random wormhole

        CARNIVALGAME_GOLFPROP_SPRING = "一个利用储存机械能的受控推进平台喵。", -- spring that pops up to launch the ball

        CARNIVALGAME_GOLFPROP_FAN = "必须根据风向调整球的轨迹。", -- fan that blows wind and pushes in a direction

        -- Rifts 8

        ROCKY_BOSS =
        {
            GENERIC = "	巨型螯龙虾。避开它的大螯才是明智的做法。",
            BOULDER = "那可不是普通的巨石。", -- in boulder form
            ACID = "连这个物种也会受到酸液影响。",
        },
		ROCKY_BOSS_SHADOW = "看来暗影已经穿透了它的护甲。",
        BAT_BOSS =
        {
            GENERIC = "嗜血飞犬喵。",
            ACID = "它似乎正处于狂暴状态。",
        },
		BAT_BOSS_SHADOW = "它如今已被腐化。",

        BATBOSSCAVE =
        {
            GENERIC = "比寻常的蝙蝠洞更大。这意味着什么，显而易见。", -- boss bat is inside,
            VACANT = "看上去是空的喵。", -- boss bat is not inside anymore
        },

        WORM_BOSS_SHADOW = "可以断定，这种本就致命的生物，一旦腐化就会危险倍增。",

        ARMOR_ROCKY = "这生物的甲壳，如今也能给我们类似的保护。",
        BAT_BOSSCORPSEHAT = "我想，戴上它就能获得一部分吸取生命的能力。",

        ATRIUM_RITUAL_ORGAN_ROCKY =
        {
            GENERIC = "被腐化的大螯。",
            IN_RITUAL = "供品已就位。", -- it's floating as part of the ritual circle (can reuse same string for all IN_RITUAL)
        },
        ATRIUM_RITUAL_ORGAN_BAT =
        {
            GENERIC = "连它的声音也被腐化了喵。",
            IN_RITUAL = "供品已就位。", -- it's floating as part of the ritual circle (can reuse same string for all IN_RITUAL)
        },
        ATRIUM_RITUAL_ORGAN_WORM =
        {
            GENERIC = "鲜有比一条腐化巨虫的肠道更黑暗的地方。",
            IN_RITUAL = "供品已就位。", -- it's floating as part of the ritual circle (can reuse same string for all IN_RITUAL)
        },

		CHARLIE_BOSS = "三者同流合污，融成了可憎的怪物喵。",
		SHROUDEN =
		{
			GENERIC = "世人对TA有许多不同的称呼。",
			PUDDLE = "是时候将这个邪恶实体踩碎，彻底解决它了。",
		},

        CHARLIEARENA_SPIKE = "这些构造颇似荆棘。",

        KING_CANE =
        {
            GENERIC = "这根魔杖显然曾属于一位远古国王喵。", -- has a gem slotted in
            EMPTY = "它缺少能量源，也就是宝石。", -- can socket a gem inside (can be heavy on hint)
        },
        QUEEN_TORCH = "这可不是普通的火炬喵。",
        
        CHARLIEARENA_TELEPORTER = "进去前先收齐所有东西，才是稳妥之举。",

        MASK_CHARLIE_BOSSHAT = "三者合成的可憎怪物留下的诅咒遗物喵。",
    },

    DESCRIBE_GENERIC = "稀罕的事物。我不知道那是什么喵。",
    DESCRIBE_TOODARK = "黑暗里我什么都看不见喵。",
    DESCRIBE_SMOLDERING = "看样子快要因为温度过高而着火了喵。",

    DESCRIBE_PLANTHAPPY = "农作物看起来健康状况良好喵。",
    DESCRIBE_PLANTVERYSTRESSED = "它似乎正遭受着相当多的压力。",
    DESCRIBE_PLANTSTRESSED = "它似乎同时承受着两种不同的压力喵。",
    DESCRIBE_PLANTSTRESSORKILLJOYS = "我得清除一些麻烦的杂草。",
    DESCRIBE_PLANTSTRESSORFAMILY = "这些植物周围有同伴时生长的最好喵。",
    DESCRIBE_PLANTSTRESSOROVERCROWDING = "应降低植物的密度，避免争夺养分喵。",
    DESCRIBE_PLANTSTRESSORSEASON = "恐怕这株植物不适合在这个季节栽种。",
    DESCRIBE_PLANTSTRESSORMOISTURE = "它需要补一点水。",
    DESCRIBE_PLANTSTRESSORNUTRIENTS = "它需要营养更丰富的土壤。",
    DESCRIBE_PLANTSTRESSORHAPPINESS = "我应该用谈话促进它的成长。",

    EAT_FOOD =
    {
        TALLBIRDEGG_CRACKED = "很有嚼劲。",
		WINTERSFEASTFUEL = "好像裹了一条舒服的毯子一样。",
    },

    WENDY_SKILLTREE_EASTEREGG = "only_used_by_wendy",
}

-- SPECIAL 覆盖 SPEECH：递归合并，只替换同名的末级条目
local function deepmerge(dst, src)
	for k, v in pairs(src) do
		if type(v) == "table" and type(dst[k]) == "table" then
			deepmerge(dst[k], v)
		else
			dst[k] = v
		end
	end
end

deepmerge(SPEECH, SPECIAL)

return SPEECH
