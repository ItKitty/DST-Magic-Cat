

return {
	ACTIONFAIL =
	{
        GENERIC =
        {
            ITEMMIMIC = "好吧，这就不太方便了。",		--动作说明：通用动作失败（目标是伪装的物品拟态怪）
        },

		ACTIVATE =
		{
			LOCKED_GATE = "大门锁上了。",		--远古钥匙
            HOSTBUSY = "他现在好像有点忙。",		--鸦年华 良羽鸦在忙
            CARNIVAL_HOST_HERE = "他就在附近。",		--良羽鸦的 取消了 不会被调用
            NOCARNIVAL = "鸟儿看起来都飞走了。",		--激活良羽鸦树苗 但是没找到良羽鸦
			EMPTY_CATCOONDEN = "糟糕，我还以为里面肯定会有好东西呢！",		--洗劫空心树桩 但是没有藏品了
			KITCOON_HIDEANDSEEK_NOT_ENOUGH_HIDERS = "应该不会这么容易，要是再多几个小家伙就好了……",		--浣猫年 和猫玩耍 猫不够
			KITCOON_HIDEANDSEEK_NOT_ENOUGH_HIDING_SPOTS = "周围没有很多地方可供它们藏身。",		--浣猫年 和猫玩耍 没有足够位置捉迷藏
			KITCOON_HIDEANDSEEK_ONE_GAME_PER_DAY = "我想今天就到此为止吧。",		--浣猫年 和猫玩耍 一天只能玩一次
            MANNEQUIN_EQUIPSWAPFAILED = "他应该穿不上。",		--假人不能装备这个装备
            PILLOWFIGHT_NO_HANDPILLOW = "我需要一个枕头来战斗！",		--枕头大战 没有枕头
            NOTMYBERNIE = "我的毛绒玩具可没那么可怕。",		--博尼小熊  不能被不是威洛的人激活
            NOTMERM = "只有鱼人才能召唤鱼人。",		--动作说明：激活失败，当前角色不是鱼人
            NOKELP = "需要更多零食。",		--空锅不能烹饪
            HASMERMLEADER = "格勒格，得等一会，其他鱼人朋友正在用这个。",		--动作说明：激活失败（世界中已经存在鱼人之王）
            NOTAROBOT = "我又不是机器人，用不了这个。",		--动作说明：激活失败（仅机器人角色可使用）
            NOTMYBACKUP = "拒绝访问。未授权用户。",		--动作说明：激活失败（不是当前机器人的备用躯体）
            TOOMANYBACKUPBODIES = "拒绝访问。备份数量已达上限。",		--动作说明：激活失败（备用躯体数量已经达到上限）
		},
        APPLYELIXIR =
        {
            TOO_SUPER = "这个味道有点大了。",		--动作说明：使用药剂失败（目标已经处于最高强化状态）
            NO_ELIXIRABLE = "我需要阿比盖尔之花才能继续。",		--动作说明：使用药剂失败（附近没有可使用药剂强化的目标）
        },
        APPLYMODULE =
        {
            COOLDOWN = "正在重新校准系统",		--动作说明：WX-78安装电路失败，电路操作仍在冷却
            NOTENOUGHSLOTS = "空间不足",		--动作说明：WX-78安装电路失败，剩余电路槽位不足
        },
        APPRAISE =
        {
            NOTNOW = "人家忙着呢。",		--给牛评价 时间不对
        },
        ATTUNE =
        {
            NOHEALTH = "我感觉不够好。",		--制造肉雕像血量不足
        },
        BATHBOMB =
        {
            GLASSED = "不行，表面都变玻璃了。",		--月岛池子 里面已经有玻璃了
            ALREADY_BOMBED = "别浪费沐浴球。",		--月岛池子 已经有人放进去沐浴球了
        },
        BEDAZZLE =
        {
            BURNING = "啊！蜘蛛朋友们，你们的家！！",		--动作说明：装饰失败（正在燃烧）
            BURNT = "不剩什么好装饰的了……",		--动作说明：装饰失败（已经烧毁）
            FROZEN = "嗯，我们的装饰品很难粘在冰上……",		--动作说明：装饰失败（已经冻结）
            ALREADY_BEDAZZLED = "我们觉得已经装饰得很好啦。",		--动作说明：装饰失败（已经装饰过）
        },
        BEGIN_QUEST =
        {
            ONEGHOST = "我一次只能渡一个灵魂到达目的地……",		--度化灵魂 温蒂
        },
        BUILD =
        {
            MOUNTED = "放不下。",		--建造失败（骑乘状态）
            HASPET = "我已经有一只宠物了。",		--建造失败（已经有一个宠物了）
			TICOON = "我对自己的大虎专一投入，眼里根本没别人。",		--制作浣猫年 大虎失败
            BUSY_STATION = "我得再等等。",		--动作说明：建造失败（建造站正在被占用）
            TOOMANYBACKUPBODIES = "拒绝访问。备份数量已达上限。",		--动作说明：建造失败（备用躯体数量已经达到上限）
            TOOMANYSHADOWDRONE_HARVESTER = "拒绝访问。自动抓取机数量已达上限",		--动作说明：建造失败（暗影采集无人机数量已达上限）
            TOOMANYSHADOWDRONE_DEBUFFER = "拒绝访问。破绽放大机数量已达上限",		--动作说明：建造失败（暗影削弱无人机数量已达上限）
        },
        CARNIVALGAME_FEED =
        {
            TOO_LATE = "我得快一点！",		--鸦年华活动 喂食太慢
        },
		CAST_POCKETWATCH =
		{
			GENERIC = "那样风险太大了。",		--动作说明：使用钟表能力失败（普通状态）
			REVIVE_FAILED = "看来我来晚了……",		--动作说明：使用钟表能力失败（复活目标失败）
			WARP_NO_POINTS_LEFT = "暂时先不走回头路了。",		--动作说明：使用钟表能力失败（传送锚点次数已经耗尽）
			SHARD_UNAVAILABLE = "时间流有太多的摇摆不定。",		--动作说明：使用钟表能力失败（目标世界分片当前不可用）
			NO_TELEPORT_ZONE = "此时间流极其不稳定……我不该冒险。",		--动作说明：使用钟表能力失败（当前位置禁止传送）
		},
		CAST_SPELLBOOK =
		{
			NO_TOPHAT = "我需要顶高礼帽才能完成这个魔术。",		--动作说明：施放魔法书失败（没有装备魔术礼帽）
		},
		CASTAOE =
		{
			NO_MAX_SANITY = "恐怕我的意志受不了那种重压……",		--动作说明：施放范围能力失败（理智值上限不足，不能施放该能力）
            NOT_ENOUGH_EMBERS = "我需要更多余烬！呵。回去接着烧吧。",		--施放范围技能失败：余烬不足
            NO_TARGETS = "附近没有什么可怕的东西可以烧。",		--施放范围技能失败：范围内没有有效目标
            CANT_SPELL_MOUNTED = "我的野兽太易燃了，不适合玩这种游戏。",		--施放范围技能失败：骑乘时不能施法
            SPELL_ON_COOLDOWN = "我需要给它点时间。",		--施放范围技能失败：技能仍在冷却
			NO_BATTERY = "倒霉遥控器没电了。",		--施放范围技能失败：缺少可用电池
			NO_CATAPULTS = "看来我不在范围内了。",		--施放范围技能失败：附近没有可用投石机
		},
        CASTSPELL =
        {
            TERRAFORM_TOO_SOON = "别催我，浮浪特！魔法好难！",		--地形改造施法失败：再次使用得太快
        },
        CHANGEIN =
        {
            GENERIC = "我现在不想换。",		--换装失败 
            BURNING = "现在太危险了！",		--换装失败-着火了
            INUSE = "它一次只能进行一种风格转变。",		--衣橱有人占用
            NOTENOUGHHAIR = "皮毛不够用来装扮。",		--给牛换装 牛毛被刮光了
            NOOCCUPANT = "得在上面栓点东西。",		--给牛换装 没牛？
        },
        CHARGE_FROM =
        {
            NOT_ENOUGH_CHARGE = "难怪我不来电，早就没电了！",		--动作说明：WX-78从发电机充电失败，发电机没有可用电力
            CHARGE_FULL = "满电状态！",		--动作说明：WX-78从发电机充电失败，当前电量已经充满
        },
		COMPARE_WEIGHABLE =
		{
            FISH_TOO_SMALL = "这家伙太小了。",		--鱼秤 手上的没鱼缸里的大
            OVERSIZEDVEGGIES_TOO_SMALL = "还不够沉。",		--蔬菜秤 手上的没秤上的大
		},
        CONSTRUCT =
        {
            INUSE = "有人抢先了。",		--建筑正在使用
            NOTALLOWED = "不匹配。",		--建筑不允许使用
            EMPTY = "我需要一些建造材料。",		--建筑空了
            MISMATCH = "哎呀，计划错误。",		--升级套件错误（目前用不到）
            NOTREADY = "情况稳定下来之后它可能会出现。",		--建造建筑-没有准备好
        },
        COOK =
        {
            GENERIC = "我现在做不了饭。",		--做饭失败
            INUSE = "好像我们有一样的想法。",		--做饭失败-别人在用锅
            TOOFAR = "太远了！",		--做饭失败-太远
        },
        DEPLOY = {
            HERMITCRAB_RELOCATE = "空的。我准贝一会儿再试试。",		--动作说明：放置失败（放置位置需要靠近寄居蟹隐士区域）
        },
        DIRECTCOURIER_MAP =
        {
            NOTARGET = "咱们换个地点吧，沃比。",		--动作说明：在地图上指定快递目标失败（没有选定有效目标）
        },
		DISMANTLE =
		{
			COOKING = "煮着东西呢，不能这样。",		--拆便携的物品-正在做饭
			INUSE = "科学告诉我，我该等轮到我。",		--拆便携的物品-正在使用
			NOTEMPTY = "我得先把里面的东西弄走。",		--拆便携的物品-里面有物品
        },
        DISMANTLE_POCKETWATCH =
        {
            ONCOOLDOWN = "它需要一点时间来松发条。",		--动作说明：拆开失败（能力仍在冷却）
        },
        DRAW =
        {
            NOIMAGE = "如果我面前有这东西，就比较容易了。",		--画图缺乏图像
        },
        ENTER_GYM =
        {
            NOWEIGHT = "沃尔夫冈需要找些东西来举重！",		--动作说明：进入失败（没有携带可用于训练的重物）
            UNBALANCED = "沃尔夫冈不希望一只手比另一只手更强大！",		--动作说明：进入失败（训练器重量不平衡）
            ONFIRE = "稍微发热是好的，可像那样又太过了。",		--动作说明：进入失败（目标正在燃烧）
            SMOULDER = "沃尔夫冈会先把小火踩灭。",		--动作说明：进入失败（目标正在阴燃）
            HUNGRY = "太饿了……肚子咕噜咕噜响，举不起来……",		--动作说明：进入失败（处于饥饿状态）
            FULL = "现在轮到沃尔夫冈练举重了！等等……",		--动作说明：进入失败（内容已满）
        },
        FILL_OCEAN =
        {
            UNSUITABLE_FOR_PLANTS = "出于某些原因，植物不喜欢咸水。",		--水壶在海里灌水
        },
        FISH_OCEAN =
		{
			TOODEEP = "不是海钓竿，不适合深海海钓。",		--拿普通鱼竿去深海钓鱼
		},
        GIVE =
        {
            GENERIC = "那东西没有去那里。",		--给予失败
            DEAD = "也许我该留着这个。",		--给予 -目标死亡
            SLEEPING = "不省人事，无心牵挂。",		--给予--目标睡觉
            BUSY = "我马上再试试。",		--给予--目标正忙
            ABIGAILHEART = "这值得一试。",		--给阿比盖尔 救赎之心
            GHOSTHEART = "或许，这不是好主意。",		--给鬼魂 救赎之心
            NOTGEM = "我不会把那东西粘上去的！",		--给的不是宝石
            WRONGGEM = "这个宝石在这里不起作用。",		--给错了宝石
			NOGENERATORSKILL = "我不会把那东西粘上去的！",		--女工 没点技能不能用纯粹辉煌/纯粹恐惧
            NOTSTAFF = "它的形状有些不对。",		--给月石祭坛的物品不是法杖
            MUSHROOMFARM_NEEDSSHROOM = "一颗蘑菇可能会有更多的用处。",		--蘑菇农场需要蘑菇
            MUSHROOMFARM_NEEDSLOG = "一块活木头可能会有更多的用处。",		--蘑菇农场需要活木
            MUSHROOMFARM_NOMOONALLOWED = "这些蘑菇好像不愿意被种下去！",		--蘑菇农场里放入月蘑菇
            SLOTFULL = "我们已经把一些东西放在那里了。",		--已经放了材料后，再给雕像桌子再给一个材料
            FOODFULL = "这儿已经有一顿饭了。",		--没调用
            NOTDISH = "它肯定不想吃那个。",		--没调用
            DUPLICATE = "我们已经知道那个了。",		--给雕像桌子已经学习过的图纸
            NOTSCULPTABLE = "即使是科学也不能把那玩意变成雕像。",		--给陶艺圆盘的东西不对
            NOTATRIUMKEY = "它的形状有些不对。",		--中庭钥匙不对
            CANTSHADOWREVIVE = "它不会复活。",		--动作说明：给予失败，远古大门仍在重置冷却期
            WRONGSHADOWFORM = "组装不对。",		--没调用
            NOMOON = "我需要看到月亮才行。",		--洞穴里建造月石科技
			PIGKINGGAME_MESSY = "我得先清理一下。",		--猪王旁边有建筑，不能开始抢元宝
			PIGKINGGAME_DANGER = "现在这样太危险了。",		--危险，不能开始抢元宝
			PIGKINGGAME_TOOLATE = "现在已经太晚了。",		--不是白天，不能开始抢元宝
			CARNIVALGAME_INVALID_ITEM = "我需要去买代币。",		--鸦年华活动 给无效的物品
			CARNIVALGAME_ALREADY_PLAYING = "已经有游戏在进行中了。",		--鸦年华活动 已经开始游戏了
            SPIDERNOHAT = "我的口袋不能同时装下它们",		--喂食蜘蛛 没带蜘蛛帽
            TERRARIUM_REFUSE = "也许我应该用不同种类的燃料进行实验……",		--盒中泰拉 拒绝这个物品
            TERRARIUM_COOLDOWN = "树没长回来之前应该给不了东西。",		--动作说明：给予失败，盒中泰拉仍在冷却期
            NOTAMONKEY = "我不会说猴话。",		--不是芜猴 已弃用
            QUEENBUSY = "她好像在忙。",		--猴子女王在忙
            CARNIVALGAME_GOLFGAME_NOTREADY = "需要洞察一下问题。",		--动作说明：给予失败（迷你高尔夫游戏尚未准备好）
            KINGSTAFF_COOLDOWN = "It's stuck.", 		--动作说明：给予失败（王之手杖尚未恢复，暂时不能放入宝石）
        },
        GIVE_TACKLESKETCH =
		{
			DUPLICATE = "不对，不对。",		--给陶盘已经有的图纸
        },
        GIVETOPLAYER =
        {
            FULL = "你的口袋太满了！",		--给玩家一个东西 -但是背包满了
            DEAD = "也许我该留着这个。",		--给死亡的玩家一个东西
            SLEEPING = "不省人事，无心牵挂。",		--给睡觉的玩家一个东西
            BUSY = "我马上再试试。",		--给忙碌的玩家一个东西
        },
        GIVEALLTOPLAYER =
        {
            FULL = "你的口袋太满了！",		--给人一组东西 但是背包满了
            DEAD = "也许我该留着这个。",		--给于死去的玩家一组物品
            SLEEPING = "不省人事了。",		--给于正在睡觉的玩家一组物品
            BUSY = "我马上再试试。",		--给于正在忙碌的玩家一组物品
        },
        HARVEST =
        {
            DOER_ISNT_MODULE_OWNER = "它似乎对科学讨论没有兴趣。",		--收获失败：角色不是模块所有者
            DOER_DOESNT_HAVE_SKILL = "无效凭证",		--动作说明：采收失败（执行角色尚未解锁所需技能）
        },
        HEAL =
        {
            NOT_MERM = "我猜它只对鱼人有效。",		--治疗失败：目标不是鱼人
        },
        HERD_FOLLOWERS =
        {
            WEBBERONLY = "虽然它们不听我的，但是可能会听韦伯的。",		--不是韦伯，无法召集蜘蛛
        },
        HITCHUP =
        {
            NEEDBEEF = "有铃铛就能和皮弗娄牛交友了。",		--将牛拴起来 没有牛
            NEEDBEEF_CLOSER = "我的皮弗娄牛伙计离我太远了。",		--将牛拴起来 牛太远
            BEEF_HITCHED = "我的皮弗娄牛已经拴好了。",		--将牛拴起来 牛已经被拴起来了
            INMOOD = "我的皮弗娄牛看起来太好动了。",		--将牛拴起来 牛在发情
        },
		LOOKAT = 
		{
			ROSEGLASSES_INVALID = "没有查理的痕迹。",		--动作说明：查看失败（玫瑰色眼镜没有有效观察目标）
			ROSEGLASSES_COOLDOWN = "咱先喘口气。",		--动作说明：查看失败（玫瑰色眼镜仍在冷却）
            ROSEGLASSES_DISMISS = "倒霉，我失去了它的踪迹！",		--动作说明：查看失败（玫瑰色眼镜目标已被主动忽略）
            ROSEGLASSES_STUMPED = "额……我看不出查理有没有来过",		--动作说明：查看失败（玫瑰色眼镜无法识别该目标）
		},
        LOWER_SAIL_FAIL =
        {
            "哎呦！",		--降帆失败
            "根本慢不下来！",		--降帆失败
            "失败是成功的进行时！",		--降帆失败
        },
        MARK =
        {
            ALREADY_MARKED = "我已经选好了。",		--选择牛 已经选择了
            NOT_PARTICIPANT = "我没有选手参赛。",		--选择牛 不是参与者（已经开始了）?
        },
        MOUNT =
        {
            TARGETINCOMBAT = "我还没笨到去惹一头愤怒的皮弗娄牛！",		--骑乘，牛正在战斗
            INUSE = "有人抢先骑上去了！",		--骑乘（牛被占据）
			SLEEPING = "该醒醒了！",		--上牛  牛在睡觉
        },
        OCEAN_FISHING_POND =
		{
			WRONGGEAR = "这根钓竿不适合在池塘钓鱼。",		--拿深海鱼竿去普通的池子里钓鱼
		},
		OPEN_CRAFTING =
		{
            PROFESSIONALCHEF = "烹饪水平还不够。",		--别人无法通过 点击便携调料站 点开制作面板
			SHADOWMAGIC = "那可不是科学。",		--别人无法通过 打开老麦的暗影制作面板
		},
        PICK =
        {
            NOTHING_INSIDE = "它是空的。",		--采集失败：目标内部没有可取物品
			STUCK = "卡住了。",		--动作说明：采集失败（目标卡住，不能采集）
        },
        PICKUP =
        {
			RESTRICTION = "技能不够熟练，用不了。",		--熔炉模式下捡起错误的武器
			INUSE = "科学告诉我，我该等轮到我。",		--捡起已经打开的容器
            NOTMINE_SPIDER = "哦！真抱歉，你看起来跟我们的朋友很像。",		--动作说明：拾取失败（不是当前角色招募的蜘蛛）
            NOTMINE_YOTC =
            {
                "你可不是我的胡萝卜鼠。",		--捡起别人的胡萝卜鼠
                "噢，它咬我！",		--捡起别人的胡萝卜鼠
            },
			NO_HEAVY_LIFTING = "我要是稍微再小几岁……应该就行了。",		--动作说明：拾取失败（当前角色不能搬运重物）
            FULL_OF_CURSES = "我才不要碰。",		--捡起诅咒时 诅咒已满
        },
        PLANTREGISTRY_RESEARCH_FAIL =
        {
            GENERIC = "不剩什么需要学的了。",		--研究作物失败
            FERTILIZER = "我不想知道太多细节。",		--研究肥料失败
        },
        POUR_WATER =
        {
            OUT_OF_WATER = "糟糕，没水了。",		--水壶空了
        },
        POUR_WATER_GROUNDTILE =
        {
            OUT_OF_WATER = "我的浇水壶干了。",		--水壶空了
        },
        READ =
        {
            GENERIC = "还有其他事在等着。",		--动作说明：阅读失败，当前有其他动作需先处理
            NOBIRDS = "鸟不喜欢这种天气。",		--动作说明：阅读失败，天气或环境不适合鸟类出现
            NOWATERNEARBY = "鱼类只能在水体附近被召唤出来。",		--动作说明：阅读失败，附近没有水域，不能召唤鱼
            TOOMANYBIRDS = "地上鸟太多了，魔法没那么有效。",		--动作说明：阅读失败，地面鸟类过多
            WAYTOOMANYBIRDS = "现在天上一只鸟都没有了。",		--动作说明：阅读失败，短时间召鸟过多，天空暂无可召唤鸟
            BIRDSBLOCKED = "力场自然对鸟类同样有效。",		--动作说明：阅读失败，力场阻挡鸟类进入
            NOFIRES =       "所幸没有需要扑灭的明火。",		--动作说明：阅读失败，附近没有需要扑灭的明火
            NOSILVICULTURE = "没有可聚焦的树栖主体。",		--动作说明：阅读失败，附近没有有效树木
            NOHORTICULTURE = "没有能种的庄稼。",		--动作说明：阅读失败，附近没有可催生作物
            NOTENTACLEGROUND = "触手无法突破这里的地表。",		--动作说明：阅读失败，当前地面不能生成触手
            NOSLEEPTARGETS = "我没看到谁需要睡前故事。",		--动作说明：阅读失败，附近没有可催眠目标
            TOOMANYBEES = "那样就太多蜜蜂了，亲爱的。",		--动作说明：阅读失败，附近蜜蜂数量过多
            NOMOONINCAVES = "这个地下位置影响不到月亮。",		--动作说明：阅读失败，洞穴中无法影响月亮
            ALREADYFULLMOON = "那样做恐怕太多余了。",		--动作说明：阅读失败，当前已经是满月
            DEADBIRDS = "噢，天啊。恐怕天空现在对鸟类来说已经不安全了。",		--动作说明：阅读失败，当前环境对鸟类不安全，不能召鸟
        },
		REMOTE_TELEPORT =
		{
			NOSKILL = "哈。我对这个型号不熟。",		--远程传送失败：尚未学习所需技能
			NODEST = "没有接收端是不能正常运转的。",		--远程传送失败：没有设置目的地
		},
        REMOVEMODULES =
        {
            NO_MODULES = "错误：模块丢失",		--动作说明：WX-78移除电路失败，当前没有安装电路
        },
        REPAIR =
        {
            WRONGPIECE = "那不太对吧。",		--化石骨架拼接错误
        },
        REPLATE =
        {
            MISMATCH = "它需要另一种碟子。",		--暴食-换盘子换错了 比如用碗换碟子
            SAMEDISH = "我只需要用一个碟子。",		--暴食-换盘子已经换了
        },
        ROW_FAIL =
        {
            BAD_TIMING0 = "太快了！",		--划船失败 第1次
            BAD_TIMING1 = "时机不对！",		--划船失败 第2次
            BAD_TIMING2 = "别再犯了！",		--划船失败 第3次
        },
		RUMMAGE =
		{
			GENERIC = "我不能那么做。",		--打开箱子失败
			INUSE = "他们在垃圾里埋头寻找。",		--打开箱子 正在使用
            NOTMASTERCHEF = "烹饪水平还不够。",		--非厨师尝试打开便携锅
            NOTAMERM = "我不认为鱼人会为此感到高兴。",		--往只有鱼人能用的箱子里放东西 但是你不是鱼人
            NOTSOULJARHANDLER = "此非我杯茶。",		--动作说明：打开容器失败（当前角色不能操作灵魂容器）
            RESTRICTED = "调查终止……我无能为力。",		--动作说明：打开容器失败（当前角色没有访问权限）
            NOTAROBOT = "我又不是机器人，用不了这个。",		--动作说明：打开容器失败（仅机器人角色可使用）
            NOTMYBACKUP = "拒绝访问。未授权用户",		--动作说明：打开容器失败（不是当前机器人的备用躯体）
            TOOMANYBACKUPBODIES = "拒绝访问。备份数量已达上限",		--动作说明：打开容器失败（备用躯体数量已经达到上限）
		},
        SADDLE =
        {
            TARGETINCOMBAT = "它生气时决不允许我那样做。",		--给战斗状态的牛上鞍
        },
		SHAVE =
		{
			AWAKEBEEFALO = "我才不会在他醒着时去弄。",		--给醒着的牛刮毛
			GENERIC = "我不能给那个剃毛！",		--刮牛毛失败
			NOBITS = "光的连毛茬子也不剩！",		--给没毛的牛刮毛
            REFUSE = "我喜欢我的胡子。",		--动作说明：剃毛失败（目标拒绝该操作）
            SOMEONEELSESBEEFALO = "我才不薅别人家皮弗娄牛的毛！",		--给别人的牛刮毛
		},
        SING_FAIL =
        {
            SAMESONG = "再一次，从头开始？不！演出必须继续！",		--动作说明：演唱失败（与当前演奏的是同一首歌）
        },
        SLAUGHTER =
        {
            TOOFAR = "它逃走了。",		--屠杀？？ 因为太远而失败
        },
        START_CARRAT_RACE =
        {
            NO_RACERS = "我肯定是漏掉了什么东西。",		--试图开始胡萝卜鼠比赛 但是没有放胡萝卜鼠
        },
		STORE =
		{
			GENERIC = "装满了。",		--存放东西失败
			NOTALLOWED = "这东西不能装进那里。",		--存放东西--不被允许
			INUSE = "我应该等轮到我的时候。",		--别人正在用箱子
            NOTMASTERCHEF = "烹饪水平还不够。",		--非厨师尝试往便携锅里塞东西
            NOTSOULJARHANDLER = "我玩不了灵魂。",		--动作说明：存入容器失败（当前角色不能操作灵魂容器）
            RESTRICTED = "调查终止……我无能为力。",		--动作说明：存入容器失败（当前角色没有访问权限）
            NOTAROBOT = "我又不是机器人，用不了这个。",		--动作说明：存入容器失败（仅机器人角色可使用）
            NOTMYBACKUP = "拒绝访问。未授权用户",		--动作说明：存入容器失败（不是当前机器人的备用躯体）
            TOOMANYBACKUPBODIES = "拒绝访问。备份数量已达上限",		--动作说明：存入容器失败（备用躯体数量已经达到上限）
		},
		STARTMAPDELIVER =
		{
			EMPTY = "错误。无可投递物品",		--动作说明：运送失败（内容为空）
			INUSE = "正在被其他用户访问",		--动作说明：运送失败（目标正在被其他操作占用）
			NOSKILL_DRONE = "无效凭证", 		--动作说明：运送失败（尚未解锁快递无人机技能）
		},
        SWAPBODIES_MAP =
        {
            NOTARGET = "通信失败。目标已不存在",		--动作说明：传输意识失败（没有选定有效目标）
        },
        TEACH =
        {
            KNOWN = "我已经知道那个了。",		--学习已经知道的蓝图
            CANTLEARN = "我无法学习那个。",		--学习无法学习的蓝图

            WRONGWORLD = "这地图在这用不了。",		--学习另外一个世界的地图

			MESSAGEBOTTLEMANAGER_NOT_FOUND = "光线太暗，我什么都看不到！",		--在地下使用漂流瓶

            STASH_MAP_NOT_FOUND = "没看到“X就是地点的标志”。那帮家伙准是忘记画了。",		--宝藏图纸没有宝藏
        },
		TELLSTORY =
		{
			GENERIC = "这里不适合讲恐怖故事……",		--讲故事 沃比
			NOT_NIGHT = "我要等到天黑之后再讲，这样才有恐怖的气氛。",		--动作说明：讲故事失败（当前不是夜晚）
			NO_FIRE = "我需要一个火堆烘托一下气氛！",		--动作说明：讲故事失败（附近没有可供讲故事的营火）
		},
		UNLOCK =
        {
            WRONGKEY = "我做不到。",		--动作说明：解锁失败（使用了错误钥匙）
        },
        UPGRADE =
        {
            BEDAZZLED = "我们好不容易让它变得这么好看！就让它保持原样吧。",		--动作说明：升级失败（装饰状态不符合要求）
        },
        USEEQUIPPEDITEM =
        {
            BADPOSITION = "错误：位置无效",		--动作说明：使用已装备物品失败（目标位置不合适）
        },
        USEITEMON =
        {

            BEEF_BELL_INVALID_TARGET = "我不可能做到！",		--对无效目标使用牛铃铛
            BEEF_BELL_ALREADY_USED = "这头弗娄牛已经属于别人了。",		--对已有主人的牛使用牛铃铛
            BEEF_BELL_HAS_BEEF_ALREADY = "我不需要整个牛群。",		--已有牛 使用牛铃铛

			NOT_MINE = "这是别人的。",		--动作说明：对目标使用物品失败（不属于当前角色）

			CANNOT_FIX_DRONE = "损坏太严重，无法修复。",		--动作说明：对目标使用物品失败（当前物品不能修复无人机）

            GESTALT_TOO_POWERFUL = "实体能量等级超出最大容纳阈值",		--动作说明：对目标使用物品失败（启蒙实体力量过强）
        },
		USEKLAUSSACKKEY =
        {
            WRONGKEY = "哎呀！那不对。",		--使用克劳斯钥匙
            KLAUS = "我有点忙！！",		--克劳斯
			QUAGMIRE_WRONGKEY = "我得再找一把钥匙。",		--动作说明：解锁失败（使用了暴食活动中的错误钥匙）
        },
        WRAPBUNDLE =
        {
            EMPTY = "我需要有东西来打包。",		--打包纸是空的
        },
        WRITE =
        {
            GENERIC = "我觉得它现在这样挺好。",		--写字失败
            INUSE = "只有能容纳一个涂鸦者的空间。",		--写字 正在使用中
        },
        YOTB_STARTCONTEST =
        {
            DOESNTWORK = "看来这里并不支持艺术。",		--动作说明：开始皮弗娄牛比赛失败，评委未处于工作状态
            ALREADYACTIVE = "他可能忙着比别的比赛呢。",		--动作说明：开始皮弗娄牛比赛失败，比赛已经开始
            NORESPONSE = "他一定是游荡到别处去了。",		--动作说明：开始比赛失败（裁判没有响应比赛请求）
            RIGHTTHERE = "他忙着。",		--动作说明：开始比赛失败（比赛终点位置距离过近）
        },
        YOTB_UNLOCKSKIN =
        {
            ALREADYKNOWN = "一个熟悉的样式……这个我已经掌握了！",		--牛年活动 解锁已知皮肤
        },
		CARVEPUMPKIN =
		{
			INUSE = "好像我们有一样的想法。",		--动作说明：雕刻失败（目标正在被其他操作占用）
			BURNING = "火焰正在灼伤我。",		--动作说明：雕刻失败（正在燃烧）
		},
		DECORATESNOWMAN =
		{
			INUSE = "有人占着雪人呢！",		--动作说明：装饰雪人失败（目标正在被其他操作占用）
			HASHAT = "雪人可不能双戴帽！",		--动作说明：装饰雪人失败（雪人已经戴有帽子）
			STACKEDTOOHIGH = "它太高了！",		--动作说明：装饰雪人失败（雪人装饰堆叠位置过高）
			MELTING = "我做不到！快要融化了！",		--动作说明：装饰雪人失败（正在融化，不能继续装饰）
		},
        MUTATE = 
        {
            NOGHOST = "我需要阿比帮忙。",		--动作说明：转化失败（附近没有可用幽灵）
            NONEWMOON = "月亮还没有亏缺。",		--动作说明：转化失败（当前不是新月）
            NOFULLMOON = "月亮必须在盈满中。",		--动作说明：转化失败（当前不是满月）
            NOTNIGHT = "在太阳底下是不行的。",		--动作说明：转化失败（当前不是夜晚）
            CAVE = "没有月光就无行。",		--动作说明：转化失败（位于洞穴世界）
        },
		MODSLINGSHOT =
		{
			NOSLINGSHOT = "我没弹弓可以改装！",		--动作说明：改装弹弓失败（没有装备弹弓）
		},
		POUNCECAPTURE =
		{
			MISSED = "可恶，我漏掉了。",		--动作说明：捕获失败（未能抓住目标）
		},
        DIVEGRAB =
        {
            MISSED = "可恶，我漏掉了。",		--动作说明：约束失败（未能抓住目标）
        },

		SOAKIN =
		{
			NOSPACE = "无法置换位置。",		--动作说明：泡失败（目标位置没有足够空间）
		},
    },

	ANNOUNCE_CANNOT_BUILD =
	{
		NO_INGREDIENTS = "我似乎缺少一些重要组件。",		--建造失败：缺少材料
		NO_TECH = "这个需要投入更多科研！",		--建造失败：科技等级不足
		NO_STATION = "我现在制作不了。",		--建造失败：附近缺少所需制作站
	},

	ACTIONFAIL_GENERIC = "我做不到。",		--动作失败
	ANNOUNCE_BOAT_LEAK = "水越来越多了。",		--船撞了个洞
	ANNOUNCE_BOAT_SINK = "我不想淹死！",		--船漏水
    ANNOUNCE_PREFALLINVOID = "我感觉到事态的严重性！",		--即将坠入虚空
	ANNOUNCE_DIG_DISEASE_WARNING = "它看起来已经好多了。", 		--挖起生病的植物
	ANNOUNCE_PICK_DISEASE_WARNING = "嗯啊，本来就是那味道吗？", 		--（植物生病）
	ANNOUNCE_ADVENTUREFAIL = "这次不太顺利。我必须再试一次。",		--没调用（废案）
    ANNOUNCE_MOUNT_LOWHEALTH = "这野兽似乎受伤了。",		--牛血量过低

    ANNOUNCE_TOOMANYBIRDS = "地上鸟太多了，魔法没那么有效。",		--附近鸟类过多，不能再召唤鸟
    ANNOUNCE_WAYTOOMANYBIRDS = "现在天上一只鸟都没有了。",		--附近鸟类数量严重超限
    ANNOUNCE_NOWATERNEARBY = "鱼类只能在水体附近被召唤出来。",		--附近没有可用水域

	ANNOUNCE_SHADOWLEVEL_ITEM = "\n我的暗影傀儡应该能从它身上汲取力量……",		--装备具有暗影等级的物品
	ANNOUNCE_EQUIP_SHADOWLEVEL_T1 = "什么情况？我的暗影傀儡感觉变强了……",		--装备一级暗影物品
	ANNOUNCE_EQUIP_SHADOWLEVEL_T2 = "我能感受到暗影傀儡的力量在增加。",		--装备二级暗影物品
	ANNOUNCE_EQUIP_SHADOWLEVEL_T3 = "去吧，我的暗影傀儡！没有人能挡我们的路。",		--装备三级暗影物品
	ANNOUNCE_EQUIP_SHADOWLEVEL_T4 = "我召唤出的暗影傀儡将所向披靡！",		--装备四级暗影物品

    ANNOUNCE_NORMALTOMIGHTY = "我是最强壮的！",		--沃尔夫冈从普通形态变为强壮形态
    ANNOUNCE_NORMALTOWIMPY = "我感觉不太好。",		--沃尔夫冈从普通形态变为虚弱形态
    ANNOUNCE_WIMPYTONORMAL = "沃尔夫冈感觉好些了。",		--沃尔夫冈从虚弱形态恢复普通形态
    ANNOUNCE_MIGHTYTONORMAL = "不！沃尔夫冈必须变得更强壮！",		--沃尔夫冈从强壮形态恢复普通形态
    ANNOUNCE_EXITGYM = {
        MIGHTY = "哈！沃尔夫冈的状态又回来了！",		--沃尔夫冈以强壮形态离开健身房
        NORMAL = "嗯，肌肉感觉好多了，但还可以更强壮些！",		--沃尔夫冈以普通形态离开健身房
        WIMPY = "沃尔夫冈现在需要……一点点的休息……",		--沃尔夫冈以虚弱形态离开健身房
    },

	ANNOUNCE_BEES = "蜜蜂！！！！",		--戴养蜂帽被蜜蜂蛰
	ANNOUNCE_BOOMERANG = "噢！我应该尽量接住它！",		--回旋镖
	ANNOUNCE_CHARLIE = "那情景...好熟悉！你好？",		--查理即将攻击
	ANNOUNCE_CHARLIE_ATTACK = "噢！有东西咬我！",		--被查理攻击
	ANNOUNCE_CHARLIE_MISSED = "哈！我知道你的所有招数！", 		--查理的攻击落空
	ANNOUNCE_COLD = "好冷！",		--过冷
	ANNOUNCE_HOT = "需要...冰...或...阴凉处！",		--过热
	ANNOUNCE_CRAFTING_FAIL = "缺少一些关键成分。",		--没调用
	ANNOUNCE_DEERCLOPS = "听上去是个大家伙！",		--事件说明：独眼巨鹿即将来袭
	ANNOUNCE_CAVEIN = "天花板在晃动！",		--要地震了？？？
	ANNOUNCE_ANTLION_SINKHOLE =
	{
		"地面在晃动！",		--蚁狮地震
		"地震！",		--蚁狮地震
		"可怕的地震波！",		--蚁狮地震
	},
	ANNOUNCE_ANTLION_TRIBUTE =
	{
        "请允许我致敬。",		--向蚁狮致敬
        "给你的贡品，伟大的蚁狮。",		--给蚁狮上供
        "那会暂时让它安静...",		--给蚁狮上供
	},
	ANNOUNCE_SACREDCHEST_YES = "我认为我值得。",		--远古宝箱物品正确给出蓝图
	ANNOUNCE_SACREDCHEST_NO = "它不喜欢那个。",		--远古宝箱
    ANNOUNCE_DUSK = "不早了。天马上就黑了。",		--进入黄昏

    ANNOUNCE_CHARGE = "已完全恢复系统",		--角色获得电荷
	ANNOUNCE_DISCHARGE = "系统正常",		--角色释放或失去电荷

    ANNOUNCE_ROSEGLASSES = 
    {
        "明白了，姐妹！",		--玫瑰色眼镜效果提示
        "查理来过。",		--玫瑰色眼镜效果提示
        "我发现了她魔法的痕迹。",		--玫瑰色眼镜效果提示
    },
    ANNOUNCE_CHARLIESAVE = 
    {
        "噫！我不知道她是想帮我还是想杀我。",		--查理出手保护角色
    },
	ANNOUNCE_ENGINEERING_CAN_UPGRADE = "我的版本轻而易举地领先它。",		--工程装置可以升级
	ANNOUNCE_ENGINEERING_CAN_DOWNGRADE = "哇，这个比我的版本还先进。",		--工程装置可以降级
	ANNOUNCE_ENGINEERING_CAN_SIDEGRADE = "有意思。它和我的版本各有领先的地方。",		--工程装置可以横向改造

	ANNOUNCE_EAT =
	{
		GENERIC = "好吃！",		--吃东西
		PAINFUL = "我感觉不太好。",		--吃怪物肉
		SPOILED = "呸！太难吃了！",		--吃腐烂食物
		STALE = "我觉得它开始变质了。",		--吃黄色食物
		INVALID = "我不吃那玩意！",		--拒吃
        YUCKY = "把那个放进嘴里太恶心了！",		--吃红色食物

		COOKED = "不是很美味。",		--食用符合偏好的熟食
		DRIED = "有点干。",		--食用符合偏好的干制食物
        PREPARED = "很可口！",		--食用符合偏好的料理
        RAW = "呸，哪方面都差点火候。",		--食用符合偏好的生食
		SAME_OLD_1 = "我希望食物的口味丰富点。",		--近期重复食用同一种食物一次
		SAME_OLD_2 = "平淡无味。",		--近期重复食用同一种食物两次
		SAME_OLD_3 = "我想吃点别的东西。",		--近期重复食用同一种食物三次
		SAME_OLD_4 = "我受不了这种食物了。",		--近期重复食用同一种食物四次
        SAME_OLD_5 = "吃腻了！",		--近期重复食用同一种食物达到最高厌倦程度
		TASTY = "太美味了！",		--食用角色特别喜欢的食物
    },

	ANNOUNCE_FOODMEMORY = "\n我不想吃同样的旧东西。",		--食物记忆生效：近期重复食用相同食物

    ANNOUNCE_ENCUMBERED =
    {
        "气喘...吁吁...",		--搬运雕像、可疑的大理石
        "我应该制造...一台起重机...",		--搬运雕像、可疑的大理石
        "抬起来...用你的背...",		--搬运雕像、可疑的大理石
        "这不是...绅士该做的...工作...",		--搬运雕像、可疑的大理石
        "为了...科学！",		--搬运雕像、可疑的大理石
        "这东西...正把我头发弄得一团糟吗？",		--搬运雕像、可疑的大理石
        "哼...！",		--搬运雕像、可疑的大理石
        "气喘...吁吁...",		--搬运雕像、可疑的大理石
        "这是最糟糕的...实验...",		--搬运雕像、可疑的大理石
    },
    ANNOUNCE_ATRIUM_DESTABILIZING =
    {
		"我该走了！",		--事件说明：远古织影者被击败后，远古大门开始失稳并即将重置（台词变体1）
		"那是什么？！",		--中庭震动
		"这里不安全。",		--事件说明：远古织影者被击败后，远古大门开始失稳并即将重置（台词变体3）
	},
    ANNOUNCE_RUINS_RESET = "所有的怪兽都回来了！",		--地下重置
    ANNOUNCE_SNARED = "尖锐！尖锐的骨头！！",		--远古嘤嘤怪的骨笼
    ANNOUNCE_SNARED_IVY = "救命啊！花园正在反击!",		--被针刺旋花攻击
    ANNOUNCE_REPELLED = "它有保护！",		--嘤嘤怪保护状态
	ANNOUNCE_ENTER_DARK = "伸手不见五指！",		--进入黑暗
	ANNOUNCE_ENTER_LIGHT = "我又可以看到东西了！",		--进入光源
	ANNOUNCE_FREEDOM = "我自由了！我终于自由了！",		--没调用（废案）
	ANNOUNCE_HIGHRESEARCH = "感觉我现在太聪明了！",		--没调用（废案）
	ANNOUNCE_HOUNDS = "你听到了吗？",		--猎犬将至
	ANNOUNCE_WORMS = "你感觉到了吗？",		--蠕虫袭击
    ANNOUNCE_WORMS_BOSS = "听起来不太妙？",		--洞穴蠕虫首领来袭
    ANNOUNCE_ACIDBATS = "你听到了吗？",		--酸雨蝙蝠群即将来袭
	ANNOUNCE_HUNGRY = "我好饿！",		--饥饿
	ANNOUNCE_HUNT_BEAST_NEARBY = "新鲜的足迹，那只野兽肯定就在附近。",		--即将找到野兽
	ANNOUNCE_HUNT_LOST_TRAIL = "野兽的足迹到这里就没了。",		--猎物（大象脚印丢失）
	ANNOUNCE_HUNT_LOST_TRAIL_SPRING = "这种湿土留不下脚印。",		--大猎物丢失踪迹
    ANNOUNCE_HUNT_START_FORK = "这个踪迹看起来有危险。",		--追踪足迹时发现岔路
    ANNOUNCE_HUNT_SUCCESSFUL_FORK = "没有野兽能与我的智慧匹敌！",		--在足迹岔路中选对追踪方向
    ANNOUNCE_HUNT_WRONG_FORK = "我感到有东西在看着我。",		--在足迹岔路中选错追踪方向
    ANNOUNCE_HUNT_AVOID_FORK = "这个踪迹看起来安全些了。",		--追踪足迹时避开岔路
	ANNOUNCE_INV_FULL = "我拿不了更多的东西了！",		--身上的物品满了
	ANNOUNCE_KNOCKEDOUT = "嗷，我的头！",		--被催眠
	ANNOUNCE_LOWRESEARCH = "我没从那儿学到什么。",		--没调用（废案）
	ANNOUNCE_MOSQUITOS = "啊！滚开！",		--没调用
    ANNOUNCE_NOWARDROBEONFIRE = "它着火了，我换不了衣服！",		--橱柜着火
    ANNOUNCE_NODANGERGIFT = "怪物在四周，我无法拆礼物！",		--周围有危险的情况下打开礼物
    ANNOUNCE_NOMOUNTEDGIFT = "我得先从皮弗娄牛身上下来。",		--骑牛的时候打开礼物
	ANNOUNCE_NODANGERSLEEP = "我很害怕就这样睡死过去！",		--危险，不能睡觉
	ANNOUNCE_NODAYSLEEP = "光线太亮了。",		--白天睡帐篷
	ANNOUNCE_NODAYSLEEP_CAVE = "我不累。",		--洞穴里白天睡帐篷
	ANNOUNCE_NOHUNGERSLEEP = "我太饿了，睡不着，我肚子的咕咕叫声会让我一直醒着的！",		--饿了无法睡觉
	ANNOUNCE_NOSLEEPONFIRE = "我没有在那里面睡觉的强烈欲望。",		--营帐着火无法睡觉
    ANNOUNCE_NOSLEEPHASPERMANENTLIGHT = "照明电路与睡眠协议发生冲突",		--附近存在永久光源，不能入睡
	ANNOUNCE_NODANGERSIESTA = "现在午休太危险了！",		--危险，不能午睡
	ANNOUNCE_NONIGHTSIESTA = "晚上该睡觉，而不是午休。",		--夜晚睡凉棚
	ANNOUNCE_NONIGHTSIESTA_CAVE = "我不认为我在这里能真正放松下来。",		--在洞穴里夜晚睡凉棚
	ANNOUNCE_NOHUNGERSIESTA = "我太饿了，没法午休！",		--饱度不足无法午睡
	ANNOUNCE_NO_TRAP = "好吧，挺简单的。",		--没有陷阱？？？没调用
	ANNOUNCE_PECKED = "噢！停下！",		--被小高鸟啄
	ANNOUNCE_QUAKE = "听起来不妙。",		--地震
	ANNOUNCE_RESEARCH = "活到老学到老！",		--没调用
	ANNOUNCE_SHELTER = "大树，多谢你保护我免受自然侵害！",		--下雨天躲树下
	ANNOUNCE_THORNS = "噢！",		--玫瑰、仙人掌、荆棘扎手
	ANNOUNCE_BURNT = "呀！好烫！",		--烧完了
	ANNOUNCE_TORCH_OUT = "火灭了！",		--火把用完了
	ANNOUNCE_THURIBLE_OUT = "它消耗殆尽了。",		--香炉燃尽
	ANNOUNCE_FAN_OUT = "我的风扇已随风消逝。",		--小风车停了
    ANNOUNCE_COMPASS_OUT = "这个指南针再也指不了方向了。",		--指南针用完了
	ANNOUNCE_TRAP_WENT_OFF = "哎呀。",		--触发陷阱（例如冬季陷阱）
	ANNOUNCE_UNIMPLEMENTED = "噢！这应该还没准备好。",		--没调用
	ANNOUNCE_WORMHOLE = "头脑正常的人可不会干那事。",		--跳虫洞
    ANNOUNCE_WORMHOLE_SAMESPOT = "啧。走了很远的路，结果哪也没去。",		--虫洞出口与入口位于同一地点
	ANNOUNCE_TOWNPORTALTELEPORT = "我不确定那是不是科学。",		--豪华传送
	ANNOUNCE_CANFIX = "\n我觉得我能修好这个！",		--墙壁可以修理
	ANNOUNCE_ACCOMPLISHMENT = "我觉得好有成就感！",		--没调用
	ANNOUNCE_ACCOMPLISHMENT_DONE = "如果我的朋友现在能看到我就好了...",		--没调用
	ANNOUNCE_INSUFFICIENTFERTILIZER = "你还饿吗，植物？",		--土地肥力不足
	ANNOUNCE_TOOL_SLIP = "哦，那工具太滑手了！",		--工具滑出
	ANNOUNCE_LIGHTNING_DAMAGE_AVOIDED = "躲过了那可怕的闪电！",		--规避闪电
	ANNOUNCE_TOADESCAPING = "癞蛤蟆正在失去兴趣。",		--蟾蜍正在逃跑
	ANNOUNCE_TOADESCAPED = "癞蛤蟆逃走了。",		--蟾蜍逃走了


	ANNOUNCE_DAMP = "哦，水。",		--潮湿（1级）
	ANNOUNCE_WET = "我的衣服好像会渗水。",		--潮湿（2级）
	ANNOUNCE_WETTER = "漫漫水路！",		--潮湿（3级）
	ANNOUNCE_SOAKED = "我快达到饱和点了。",		--潮湿（4级）

	ANNOUNCE_WASHED_ASHORE = "衣服弄湿了，但是还活着。",		--落水被冲上岸

    ANNOUNCE_DESPAWN = "我能看见光!",		--下线
	ANNOUNCE_BECOMEGHOST = "呜呜呜呜呜！！",		--变成鬼魂
	ANNOUNCE_GHOSTDRAIN = "我的人性要开始流失了...",		--事件说明：队友死亡导致理智值下降
	ANNOUNCE_PETRIFED_TREES = "我刚刚听到树在尖叫吗？",		--石化树
	ANNOUNCE_KLAUS_ENRAGE = "现在没有办法打败它了！！",		--克劳斯被激怒（杀死了鹿）
	ANNOUNCE_KLAUS_UNCHAINED = "它的链条松开了！",		--克劳斯-未上锁的  猜测是死亡准备变身？
	ANNOUNCE_KLAUS_CALLFORHELP = "它在求救！",		--克劳斯召唤小偷

	ANNOUNCE_MOONALTAR_MINE =
	{
		GLASS_MED = "里面有东西。",		--月岛科技三个部分被挖开
		GLASS_LOW = "快挖出来了。",		--月岛科技三个部分被挖开
		GLASS_REVEAL = "你自由了！",		--月岛科技三个部分被挖开
		IDOL_MED = "里面有东西。",		--月岛科技三个部分被挖开
		IDOL_LOW = "快挖出来了。",		--月岛科技三个部分被挖开
		IDOL_REVEAL = "你自由了！",		--月岛科技三个部分被挖开
		SEED_MED = "里面有东西。",		--月岛科技三个部分被挖开
		SEED_LOW = "快挖出来了。",		--月岛科技三个部分被挖开
		SEED_REVEAL = "你自由了！",		--月岛科技三个部分被挖开
	},

    ANNOUNCE_SPOOKED = "啊！",		--被吓到
	ANNOUNCE_BRAVERY_POTION = "那些树看上去没那么可怕了。",		--勇气药剂
	ANNOUNCE_MOONPOTION_FAILED = "可能没泡够时间……",		--万圣节月亮药水 对不能变化的物品使用

	ANNOUNCE_EATING_NOT_FEASTING = "我应该跟其他人分享的。",		--冬季盛宴的植物 单人吃（但是没调用）
	ANNOUNCE_WINTERS_FEAST_BUFF = "满满的节日精神！",		--事件说明：获得冬季盛宴食物的持续恢复效果
	ANNOUNCE_IS_FEASTING = "冬季盛宴快乐！",		--冬季盛宴 大家一起吃
	ANNOUNCE_WINTERS_FEAST_BUFF_OVER = "节过的真快……",		--事件说明：冬季盛宴食物的持续恢复效果结束

    ANNOUNCE_REVIVING_CORPSE = "让我帮帮你。",		--没调用（熔炉）
    ANNOUNCE_REVIVED_OTHER_CORPSE = "焕然一新！",		--没调用（熔炉）
    ANNOUNCE_REVIVED_FROM_CORPSE = "好多了，谢谢啦。",		--没调用（熔炉）

    ANNOUNCE_FLARE_SEEN = "是谁发出的信号？",		--看见信号弹
    ANNOUNCE_MEGA_FLARE_SEEN = "那个闪光会带来麻烦。",		--看到远处发射的巨型信号弹
    ANNOUNCE_OCEAN_SILHOUETTE_INCOMING = "不好，海怪！",		--深海 轮廓？ 没调用

	ANNOUNCE_LIGHTFIRE =
	{
		"嘻嘻！",		--角色主动点火时的提示
    },

    ANNOUNCE_HUNGRY_SLOWBUILD =
    {
	    "饥饿冲昏了我的头脑。",		--饥饿导致建造速度降低
    },
    ANNOUNCE_HUNGRY_FASTBUILD =
    {
	    "饥饿催生的成果。",		--进食后恢复快速建造
    },

    ANNOUNCE_KILLEDPLANT =
    {
        "对不起，朋友",		--沃姆伍德导致植物死亡
    },
    ANNOUNCE_GROWPLANT =
    {
        "生长吧！",		--沃姆伍德使植物生长
    },
    ANNOUNCE_BLOOMING =
    {
        "感觉开花了！",		--沃姆伍德进入开花状态
    },

    ANNOUNCE_SOUL_EMPTY =
    {
        "用光了灵魂的恶魔将要遭遇不幸！",		--沃拓克斯没有灵魂
    },
    ANNOUNCE_SOUL_EMPTY_NICE =
    {
        "我马上要进食了。",		--善良倾向下没有灵魂
    },
    ANNOUNCE_SOUL_EMPTY_NAUGHTY =
    {
        "饿死我啦！",		--淘气倾向下没有灵魂
    },
    ANNOUNCE_SOUL_FEW =
    {
        "灵魂不多了。",		--沃拓克斯持有的灵魂很少
    },
    ANNOUNCE_SOUL_FEW_NICE =
    {
        "噢，不好。恐怕灵魂有点不够用了。",		--善良倾向下灵魂数量较少
    },
    ANNOUNCE_SOUL_FEW_NAUGHTY =
    {
        "我的藏品已经不多了。",		--淘气倾向下灵魂数量较少
    },
    ANNOUNCE_SOUL_MANY =
    {
        "灵魂够多了，可以生存下去了。",		--沃拓克斯持有很多灵魂
    },
    ANNOUNCE_SOUL_MANY_NICE =
    {
        "天哪，我拿了这么多！",		--善良倾向下持有很多灵魂
    },
    ANNOUNCE_SOUL_MANY_NAUGHTY =
    {
        "什么时候才算够？永远都不够！哼哼！",		--淘气倾向下持有很多灵魂
    },
    ANNOUNCE_SOUL_OVERLOAD =
    {
        "我驾驭不了那么多的灵魂力量！",		--沃拓克斯灵魂过载
    },
    ANNOUNCE_SOUL_OVERLOAD_NICE =
    {
        "我太贪婪了！",		--善良倾向下灵魂过载
    },
    ANNOUNCE_SOUL_OVERLOAD_NAUGHTY =
    {
        "我宝贵的灵魂啊！",		--淘气倾向下灵魂过载
    },
    ANNOUNCE_SOUL_OVERLOAD_WARNING =
    {
        "灵魂快要撑破我了！",		--灵魂即将过载的警告
    },
    ANNOUNCE_SOUL_OVERLOAD_AVOIDED =
    {
        "还好及时打住。",		--成功避免灵魂过载
    },
    ANNOUNCE_PANFLUTE_BUFF_ACTIVE =
    {
        "突然有了吹奏一曲的雅兴！哼！",		--排箫增益已经生效
    },
    ANNOUNCE_PANFLUTE_BUFF_USED =
    {
        "排箫吹毕，不甚欢喜！",		--触发排箫增益
    },

	ANNOUNCE_AMMO_SLOT_OVERSTACKED = "弹药太多，换不了了。",		--弹药槽装入的弹药超过容量
	ANNOUNCE_SLINGHSOT_OUT_OF_AMMO =
	{
		"哎呀……弹药用完了。",		--弹弓弹药耗尽
		"额……我在开玩笑而已！",		--弹弓弹药耗尽
	},
	ANNOUNCE_SLINGHSOT_NO_AMMO_SKILL = "这种弹药有点难打。",		--未学习对应弹弓弹药技能
	ANNOUNCE_SLINGHSOT_NO_PARTS_SKILL = "哈。这个组件起什么作用？",		--未学习对应弹弓零件技能
	ANNOUNCE_STORYTELLING_ABORT_FIREWENTOUT =
	{
        "糟糕，火焰在最精彩的节骨眼上熄灭了！",		--营火熄灭导致讲故事中止
	},
	ANNOUNCE_STORYTELLING_ABORT_NOT_NIGHT =
	{
        "下次继续讲……",		--天亮导致讲故事中止
	},
	ANNOUNCE_WOBY_RETURN =
	{
		"沃沃沃比！",		--命令沃比返回
	},
	ANNOUNCE_WOBY_SIT =
	{
		"沃比，待着！",		--命令沃比原地等待
	},
	ANNOUNCE_WOBY_FOLLOW =
	{
		"沃比，过来！",		--命令沃比跟随
	},
	ANNOUNCE_WOBY_PRAISE =
	{
		"好狗狗！",		--表扬沃比
	},
	ANNOUNCE_WOBY_FORAGE =
	{
		"去找这个东西，沃比！",		--命令沃比采集
	},
	ANNOUNCE_WOBY_WORK =
	{
		"沃比，来帮我！",		--命令沃比工作
	},
	ANNOUNCE_WOBY_COURIER =
	{
		"去吧，沃比！去吧！",		--命令沃比执行快递任务
	},
	ANNOUNCE_WOBY_REMEMBERCHEST_FAIL =
	{
		"我们找个更好的地方吧，沃比。",		--沃比记录容器位置失败
	},

    ANNOUNCE_WX_SCANNER_NEW_FOUND = "检测到可使用的能力。需要扫描",		--WX-78的扫描仪发现新的生物数据
    ANNOUNCE_WX_SCANNER_FOUND_NO_DATA = "附近暂时没有新数据",		--生物扫描仪没有发现新数据

    QUAGMIRE_ANNOUNCE_NOTRECIPE = "这些配料做不成食物。",		--暴食模式中提交的食物不符合食谱
    QUAGMIRE_ANNOUNCE_MEALBURNT = "烧太长时间了。",		--暴食模式料理烧焦
    QUAGMIRE_ANNOUNCE_LOSE = "我有种不好的预感。",		--暴食模式挑战失败
    QUAGMIRE_ANNOUNCE_WIN = "该走了！",		--暴食模式挑战成功

    ANNOUNCE_ROYALTY =
    {
        "陛下。",		--向带着蜂王帽的队友鞠躬
        "殿下。",		--向带着蜂王帽的队友鞠躬
        "我的君主！",		--向带着蜂王帽的队友鞠躬
    },
    ANNOUNCE_ROYALTY_JOKER =
    {
        "“陛下”。",		--对鱼人王使用玩笑互动
        "“殿下”。",		--对鱼人王使用玩笑互动
        "“大王”！",		--对鱼人王使用玩笑互动
    },

    ANNOUNCE_ATTACH_BUFF_ELECTRICATTACK    = "我带的是正电！",		--事件说明：获得带电攻击增益
    ANNOUNCE_ATTACH_BUFF_ATTACK            = "动手打！",		--事件说明：食用辣椒粉料理后获得攻击力增益
    ANNOUNCE_ATTACH_BUFF_PLAYERABSORPTION  = "我现在感觉安全多了！",		--事件说明：食用大蒜粉料理后获得伤害减免增益
    ANNOUNCE_ATTACH_BUFF_WORKEFFECTIVENESS = "生产力提高！",		--事件说明：食用蜂蜜粉料理后获得工作效率增益
    ANNOUNCE_ATTACH_BUFF_MOISTUREIMMUNITY  = "干的像薇克巴顿的讲义！",		--事件说明：食用蓝带鱼排后获得潮湿免疫效果
    ANNOUNCE_ATTACH_BUFF_SLEEPRESISTANCE   = "顿时觉得神清气爽，再也不累了！",		--事件说明：食用月亮蘑菇料理后获得睡眠抗性效果

    ANNOUNCE_DETACH_BUFF_ELECTRICATTACK    = "电没了，但是还残存静电。",		--事件说明：带电攻击增益结束
    ANNOUNCE_DETACH_BUFF_ATTACK            = "肌肉紧实的感觉很快就消失了。",		--事件说明：辣椒粉料理提供的攻击力增益结束
    ANNOUNCE_DETACH_BUFF_PLAYERABSORPTION  = "虽然时间不长，但是还不错。",		--事件说明：大蒜粉料理提供的伤害减免增益结束
    ANNOUNCE_DETACH_BUFF_WORKEFFECTIVENESS = "拖延症又回来了...",		--事件说明：蜂蜜粉料理提供的工作效率增益结束
    ANNOUNCE_DETACH_BUFF_MOISTUREIMMUNITY  = "我的干旱期结束了。",		--事件说明：蓝带鱼排提供的潮湿免疫效果结束
    ANNOUNCE_DETACH_BUFF_SLEEPRESISTANCE   = "我……（哈欠）再也……不累了……",		--事件说明：月亮蘑菇料理提供的睡眠抗性效果结束

	ANNOUNCE_OCEANFISHING_LINESNAP = "所有辛苦，都被折断。",		--海钓 线崩断了
	ANNOUNCE_OCEANFISHING_LINETOOLOOSE = "收线也许管用。",		--海钓失败 渔具丢失
	ANNOUNCE_OCEANFISHING_GOTAWAY = "它逃走了。",		--海钓 鱼跑远了
	ANNOUNCE_OCEANFISHING_BADCAST = "甩竿技术有待提高……",		--海钓 抛竿扔地面上去了
	ANNOUNCE_OCEANFISHING_IDLE_QUOTE =
	{
		"鱼呢？",		--海钓 没上钩的时候闲聊
		"也许该换个鱼多的地方钓。",		--海钓 没上钩的时候闲聊
		"我还以为海里到处都是鱼呢！",		--海钓 没上钩的时候闲聊
		"我现在明明可以做更科学的事情……",		--海钓 没上钩的时候闲聊
	},

	ANNOUNCE_WEIGHT = "重量：{weight}",		--称重 
	ANNOUNCE_WEIGHT_HEAVY  = "重量: {weight}\n我是重量级的钓手!",		--称重 大鱼

	ANNOUNCE_WINCH_CLAW_MISS = "好像没对准。",		--绞绞吸盘 没命中
	ANNOUNCE_WINCH_CLAW_NO_ITEM = "得！两手空空。",		--绞绞吸盘 没东西

    ANNOUNCE_KINGCREATED = "鱼人有了新国王！",		--沃特拥立新的鱼人王
    ANNOUNCE_KINGDESTROYED = "上一届国王不行，我会找一个更好的！",		--鱼人王被消灭或王位失效
    ANNOUNCE_CANTBUILDHERE_THRONE = "这地方不适合沼泽之王！",		--当前位置不能建造鱼人王宝座
    ANNOUNCE_CANTBUILDHERE_HOUSE = "漂亮的房子要建在漂亮的沼泽上！",		--当前位置不能建造鱼人房屋
    ANNOUNCE_CANTBUILDHERE_WATCHTOWER = "不，不！卫士们只保卫沼泽！",		--当前位置不能建造鱼人瞭望塔
    ANNOUNCE_READ_BOOK =
    {
        BOOK_SLEEP = "洪久？很久！一……前……噢……",		--阅读催眠类书籍
        BOOK_BIRDS = "里面有鸟儿的图片！",		--阅读召唤鸟类的书籍
        BOOK_TENTACLES =  "这是本好书！",		--阅读召唤触手的书籍
        BOOK_BRIMSTONE = "浮勒格，想知道故事的结尾！",		--阅读召唤闪电的书籍
        BOOK_GARDENING = "好多生僻词……",		--阅读园艺类书籍
		BOOK_SILVICULTURE = "是树的故事吗？我知道好多树的事情！",		--阅读林业类书籍
		BOOK_HORTICULTURE = "好多生僻词……",		--阅读应用园艺学

        BOOK_FISH = "是最棒的书！里面有鱼鱼！",		--阅读召唤鱼群的书籍
        BOOK_FIRE = "格勒噗，火好可怕！",		--阅读火焰相关书籍
        BOOK_WEB = "嘿，韦伯小伙子！我在学蜘蛛人的所有秘密！",		--阅读蛛网相关书籍
        BOOK_TEMPERATURE = "衡量……夜……热——能的单位……",		--阅读温度相关书籍
        BOOK_LIGHT = "嘿，这些词不一样！",		--阅读光照相关书籍
        BOOK_RAIN = "能给雨下命令？想试想试！！",		--阅读降雨相关书籍
        BOOK_MOON = "哈。月亮其实很无聊。",		--阅读月亮相关书籍
        BOOK_BEES = "噢……里面没有蜂蜜……",		--阅读蜜蜂相关书籍

        BOOK_HORTICULTURE_UPGRADED = "不——不然换本简单点的书……",		--阅读升级版园艺学书籍
        BOOK_RESEARCH_STATION = "虽然很难读懂，但是拿着它就感觉很聪明，浮浪噗！",		--阅读研究站相关书籍
        BOOK_LIGHT_UPGRADED = "要学的字不止一种？！格勒格……",		--阅读升级版光照书籍
    },

    ANNOUNCE_WEAK_RAT = "这只胡萝卜鼠不在训练的状态。",		--试图训练快饿死的胡萝卜鼠

    ANNOUNCE_CARRAT_START_RACE = "实验——，比赛开始！",		--胡萝卜鼠开始比赛

    ANNOUNCE_CARRAT_ERROR_WRONG_WAY = {
        "不，不！方向错了！",		--胡萝卜鼠比赛 跑错方向
        "掉头，你什么眼神啊！",		--胡萝卜鼠比赛 跑错方向
    },
    ANNOUNCE_CARRAT_ERROR_FELL_ASLEEP = "你敢给我睡！起来，我们要赢比赛！",		--起床了，蠢胡萝卜鼠！
    ANNOUNCE_CARRAT_ERROR_WALKING = "不要用走，跑！",		--胡萝卜鼠比赛 走的慢
    ANNOUNCE_CARRAT_ERROR_STUNNED = "站起来！冲，冲！",		--胡萝卜鼠比赛 惊呆了

    ANNOUNCE_GHOST_QUEST = "你需要我为你找回丢失的东西吗？",		--事件说明：小惊吓开始寻找遗失玩具的任务
    ANNOUNCE_GHOST_HINT = "你在为我指路吗？",		--事件说明：小惊吓提示遗失玩具所在方向
    ANNOUNCE_GHOST_TOY_NEAR = {
        "就在附近……我能感觉到……",		--事件说明：接近小惊吓遗失的玩具（台词变体1）
    },
	ANNOUNCE_SISTURN_FULL = "现在阿比盖尔可以更快回到我身边了。",		--姐妹骨灰罐 装满
    ANNOUNCE_SISTURN_FULL_EVIL = "这让我起鸡皮疙瘩。希望这一切是值得的。",		--邪恶倾向下姐妹骨灰罐充满
    ANNOUNCE_SISTURN_FULL_BLOSSOM = "这也许是我们之间最接近的一刻了，阿比盖尔。",		--姐妹骨灰罐盛开并达到完整状态
    ANNOUNCE_ABIGAIL_DEATH = "不……不要再次丢下我！",		--事件说明：阿比盖尔死亡并返回花朵
    ANNOUNCE_ABIGAIL_RETRIEVE = "我很抱歉……你在外面不安全。",		--事件说明：主动收回阿比盖尔，使其返回花朵
	ANNOUNCE_ABIGAIL_LOW_HEALTH = "小心啊，阿比盖尔！",		--事件说明：阿比盖尔的生命值过低
    ANNOUNCE_ABIGAIL_SUMMON =
	{
		LEVEL1 = "我知道你累了，但是我需要你……",		--事件说明：召唤阿比盖尔，当前幽灵羁绊为第一等级
		LEVEL2 = "我需要你的帮助，阿比盖尔……",		--事件说明：召唤阿比盖尔，当前幽灵羁绊为第二等级
		LEVEL3 = "你已经安息的够久了，亲爱的姐妹。",		--事件说明：召唤阿比盖尔，当前幽灵羁绊为第三等级
	},

    ANNOUNCE_GHOSTLYBOND_LEVELUP =
	{
		LEVEL2 = "你的脸色明亮起来了，阿比盖尔。",		--事件说明：阿比盖尔的幽灵羁绊提升到第二等级
		LEVEL3 = "阿比盖尔一直是我黑暗中的指路明灯……",		--事件说明：阿比盖尔的幽灵羁绊提升到第三等级
	},

    ANNOUNCE_NOINSPIRATION = "让激战为我开嗓吧！",		--薇格弗德没有足够激励值
    ANNOUNCE_NOTSKILLEDENOUGH = "我……恐怕我缺乏演唱这首曲目的能力……",		--尚未学习所需技能
    ANNOUNCE_BATTLESONG_INSTANT_TAUNT_BUFF = "“你这个卑鄙小人！无赖！我会让你痛尝惨败！”",		--战歌立即触发嘲讽效果
    ANNOUNCE_BATTLESONG_INSTANT_PANIC_BUFF = "“拇指怦怦动，必有恶人来！”",		--战歌立即触发恐慌效果
    ANNOUNCE_BATTLESONG_INSTANT_REVIVE_BUFF = "“死亡乃是必然的结局，要到 来总是要到来的，”但不是今天，我的盟友们！",		--战歌立即触发复活效果

    ANNOUNCE_WANDA_YOUNGTONORMAL = "没关系，我还有时间……",		--旺达从年轻状态变为中年状态
    ANNOUNCE_WANDA_NORMALTOOLD = "我已经没有多少时间了！",		--旺达从中年状态变为年老状态
    ANNOUNCE_WANDA_OLDTONORMAL = "死神永远也抓不到我！",		--旺达从年老状态恢复中年状态
    ANNOUNCE_WANDA_NORMALTOYOUNG = "哈！再次充满了青春的活力！",		--旺达从中年状态恢复年轻状态

	ANNOUNCE_POCKETWATCH_PORTAL = "没有人告诉我时间旅行完后屁股会这么痛……",		--旺达使用裂缝表传送门

	ANNOUNCE_POCKETWATCH_MARK = "这里当锚点很不错。",		--使用溯源表记录当前位置
	ANNOUNCE_POCKETWATCH_RECALL = "没有什么能比时空旅行更让这颗老心脏砰砰狂跳了！",		--使用溯源表返回记录位置
	ANNOUNCE_POCKETWATCH_OPEN_PORTAL = "好了，大家动作快点！",		--使用裂缝表开启传送门
	ANNOUNCE_POCKETWATCH_OPEN_PORTAL_DIFFERENTSHARD = "当心了，这一跳非同小可！",		--裂缝表开启跨世界传送门

    ANNOUNCE_ARCHIVE_NEW_KNOWLEDGE = "来自远古的新知识拓宽了我的思维！",		--地下月岛遗迹 解锁新知识
    ANNOUNCE_ARCHIVE_OLD_KNOWLEDGE = "我早就知道了。",		--地下月岛遗迹 解锁旧知识
    ANNOUNCE_ARCHIVE_NO_POWER = "得给它供点能。",		--地下月岛遗迹 没能量

    ANNOUNCE_PLANT_RESEARCHED =
    {
        "我对这种植物的知识在增长！",		--研究植物
    },

    ANNOUNCE_PLANT_RANDOMSEED = "不知道会长成什么。",		--种下随机种子

    ANNOUNCE_FERTILIZER_RESEARCHED = "我从未想过会把我的科学思想用在……这东西上。",		--研究肥料

	ANNOUNCE_FIRENETTLE_TOXIN =
	{
		"我的五脏六腑都在燃烧！",		--事件说明：触碰烈火荨麻后灼烧毒素发作（台词变体1）
		"哎哟，太热了！",		--事件说明：触碰烈火荨麻后灼烧毒素发作（台词变体2）
	},
	ANNOUNCE_FIRENETTLE_TOXIN_DONE = "写给自己的笔记：不要再用火荨麻毒素进行试验。",		--事件说明：烈火荨麻造成的灼烧毒素效果结束

	ANNOUNCE_TALK_TO_PLANTS =
	{
        "生长吧，植物，生长吧！",		--和植物聊天
        "我一直想要一株像你这样的植物。",		--和植物聊天
		"你好，植物，我来给你提供每日的社交剂量了！",		--和植物聊天
        "你真是一株好植物啊。",		--和植物聊天
        "植物，你真是一个好的聆听者。",		--和植物聊天
	},

	ANNOUNCE_KITCOON_HIDEANDSEEK_START = "3,2,1……不管你有没有藏好，我都要开始找！",		--开始小浣猫捉迷藏游戏
	ANNOUNCE_KITCOON_HIDEANDSEEK_JOIN = "嗷，它们在玩捉迷藏呢。",		--加入正在进行的小浣猫捉迷藏游戏
	ANNOUNCE_KITCOON_HIDANDSEEK_FOUND =
	{
		"找到你了！",		--捉迷藏时找到小浣猫
		"你在这。",		--捉迷藏时找到小浣猫
		"我就知道你会藏在那！",		--捉迷藏时找到小浣猫
		"能看见你！",		--捉迷藏时找到小浣猫
	},
	ANNOUNCE_KITCOON_HIDANDSEEK_FOUND_ONE_MORE = "所以最后一个藏在哪里呢？",		--捉迷藏时又找到一只小浣猫
	ANNOUNCE_KITCOON_HIDANDSEEK_FOUND_LAST_ONE = "我找到最后一个了！",		--捉迷藏时找到最后一只小浣猫
	ANNOUNCE_KITCOON_HIDANDSEEK_FOUND_LAST_ONE_TEAM = "{name}找到了最后一个！",		--队伍找到捉迷藏中的最后一只小浣猫
	ANNOUNCE_KITCOON_HIDANDSEEK_TIME_ALMOST_UP = "那些小家伙们估计不耐烦了……",		--小浣猫捉迷藏剩余时间不多
	ANNOUNCE_KITCOON_HIDANDSEEK_LOSEGAME = "看来它们不想玩了……",		--小浣猫捉迷藏游戏失败
	ANNOUNCE_KITCOON_HIDANDSEEK_TOOFAR = "它们大概率不会躲在这么远的地方，对吧？",		--捉迷藏时离游戏区域太远
	ANNOUNCE_KITCOON_HIDANDSEEK_TOOFAR_RETURN = "小浣猫们应该就在附近。",		--离开捉迷藏区域后返回游戏范围
	ANNOUNCE_KITCOON_FOUND_IN_THE_WILD = "我就说刚刚看到了那边有什么东西在藏着！",		--在野外发现小浣猫

	ANNOUNCE_TICOON_START_TRACKING	= "他捕捉到了气味！",		--大虎开始追踪小浣猫
	ANNOUNCE_TICOON_NOTHING_TO_TRACK = "看来他什么都没找到。",		--大虎附近没有可以追踪的小浣猫
	ANNOUNCE_TICOON_WAITING_FOR_LEADER = "我应该跟着他！",		--大虎停下并等待主人
	ANNOUNCE_TICOON_GET_LEADER_ATTENTION = "他很想让我跟着。",		--大虎提醒主人跟上追踪
	ANNOUNCE_TICOON_NEAR_KITCOON = "他一定是发现了什么！",		--大虎追踪到小浣猫附近
	ANNOUNCE_TICOON_LOST_KITCOON = "看来别人找到了他要找的东西。",		--大虎失去小浣猫的踪迹
	ANNOUNCE_TICOON_ABANDONED = "我会自己找到那些小家伙的。",		--主人离开太远，大虎放弃追踪
	ANNOUNCE_TICOON_DEAD = "可怜的家伙……他原本想把我带到哪里呢？",		--负责追踪的大虎死亡

    ANNOUNCE_CALL_BEEF = "你给我过来！",		--把牛拴好
    ANNOUNCE_CANTBUILDHERE_YOTB_POST = "放在这里裁判是看不到我的皮弗娄牛的。",		--建造牛舞台 离裁判太远
    ANNOUNCE_YOTB_LEARN_NEW_PATTERN =  "我满满都是皮弗娄牛造型的灵感！",		--牛年活动 学到了新组件

    ANNOUNCE_EYEOFTERROR_ARRIVE = "那是什么——漂浮巨眼？！",		--恐怖之眼抵达并开始袭击
    ANNOUNCE_EYEOFTERROR_FLYBACK = "终于好了！",		--恐怖之眼重新飞回战斗区域
    ANNOUNCE_EYEOFTERROR_FLYAWAY = "回来，我跟你没完！",		--恐怖之眼暂时飞离战斗区域

    ANNOUNCE_CANT_ESCAPE_CURSE = "当然不会那么轻松。",		--诅咒生效，角色不能通过传送离开
    ANNOUNCE_MONKEY_CURSE_1 = "开始有芜猴的感觉了……",		--获得第一阶段猴子诅咒
    ANNOUNCE_MONKEY_CURSE_CHANGE = "呀！我的头发怎么了？！",		--猴子诅咒累积并使角色变身
    ANNOUNCE_MONKEY_CURSE_CHANGEBACK = "总算从猴身解脱了！",		--猴子诅咒减弱，角色恢复原状

    ANNOUNCE_PIRATES_ARRIVE = "那个号子声只意味着一件事...",		--月亮码头海盗即将登船袭击

    ANNOUNCE_BOOK_MOON_DAYTIME = "我们要到今天晚上才能看到效果。",		--白天无法正常使用月亮类书籍

    ANNOUNCE_OFF_SCRIPT = "我感觉剧本里没写那句。",		--角色没有按当前表演或训练流程行动

    ANNOUNCE_COZY_SLEEP = "我感觉神清气爽！",		--获得舒适睡眠效果

	ANNOUNCE_TOOL_TOOWEAK = "我需要一把更结实的工具！",		--工具强度不足，不能处理目标

    ANNOUNCE_LUNAR_RIFT_MAX = "那道闪光！那是月光吗？",		--月亮裂隙强度达到最高阶段
    ANNOUNCE_SHADOW_RIFT_MAX = "有些阴险的家伙即将到来。",		--暗影裂隙强度达到最高阶段

    ANNOUNCE_SCRAPBOOK_FULL = "这些我都有了。",		--图鉴记录已经全部收集完成

    ANNOUNCE_CHAIR_ON_FIRE = "没事儿。",		--正在使用的椅子着火

    ANNOUNCE_HEALINGSALVE_ACIDBUFF_DONE = "是时候再抹点驱酸剂了。",		--药膏提供的酸雨防护效果结束

    ANNOUNCE_COACH = 
    {
        "别担心，朋友们！沃尔夫冈来与你并肩作战！",		--沃尔夫冈进行健身指导
        "记住沃尔夫冈教你的！",		--沃尔夫冈进行健身指导
        "当你害怕的时候，想想沃尔夫冈吧！",		--沃尔夫冈进行健身指导
        "勇敢一点，朋友们！就像沃尔夫冈一样！",		--沃尔夫冈进行健身指导
        "你很强！像沃尔夫冈一样！",		--沃尔夫冈进行健身指导
        "相信自己，就像沃尔夫冈相信你一样！",		--沃尔夫冈进行健身指导
        "做得好！肌肉有燃烧感就说明你做对了！",		--沃尔夫冈进行健身指导
        "别放弃！",		--沃尔夫冈进行健身指导
        "没错！你能行！",		--沃尔夫冈进行健身指导
    },
    ANNOUNCE_WOLFGANG_WIMPY_COACHING = "他们永远不会像这样听沃尔夫冈的话！需要训练！",		--沃尔夫冈以虚弱形态指导队友训练
    ANNOUNCE_WOLFGANG_MIGHTY_COACHING = "沃尔夫冈的肌肉太令人印象深刻了，不想让其他人感到难堪。",		--沃尔夫冈以强壮形态指导队友训练
    ANNOUNCE_WOLFGANG_BEGIN_COACHING = "来吧，朋友们！沃尔夫冈将向你示范动作！",		--沃尔夫冈开始指导队友训练
    ANNOUNCE_WOLFGANG_END_COACHING = "是时候让疲惫的肌肉休息一下了。",		--沃尔夫冈结束指导队友训练
    ANNOUNCE_WOLFGANG_NOTEAM = 
    {
        "我的队伍在哪里？",		--沃尔夫冈没有可指导的队友
        "沃尔夫冈需要队伍。",		--沃尔夫冈没有可指导的队友
        "开始吧……队友？",		--沃尔夫冈没有可指导的队友
    },

    ANNOUNCE_YOTD_NOBOATS = "我得把船移到离起点塔更近的地方。",		--龙舟竞速不能开始：没有参赛船只
    ANNOUNCE_YOTD_NOCHECKPOINTS = "我该先立几个检查点。",		--龙舟竞速不能开始：没有设置检查点
    ANNOUNCE_YOTD_NOTENOUGHBOATS = "不够空间容纳其余选手了。",		--龙舟竞速不能开始：参赛船只不足

    ANNOUNCE_OTTERBOAT_OUTOFSHALLOWS = "我的心在下沉，当初应该待在浅水区的。",		--水獭船驶离允许活动的浅水区域
    ANNOUNCE_OTTERBOAT_DENBROKEN = "打掉那个窝点可能引发了连锁反应……",		--水獭船关联的水獭巢穴已经损坏

    ANNOUNCE_GATHER_MERM = "可能是鱼人的传统。",		--沃特召集附近鱼人跟随

    ANNOUNCE_EXIT_GELBLOB = "我被那些......东西淹没了！",		--从黏液团内部脱离
	ANNOUNCE_SHADOWTHRALL_STEALTH = "我被咬了！它去哪儿了？！",		--暗影随从进入潜行状态
    ANNOUNCE_RABBITKING_AGGRESSIVE = "有些东西正在慢慢掘出表面。",		--发现好斗兔王
    ANNOUNCE_RABBITKING_PASSIVE = "有东西在地下轻轻地蠕动。",		--发现温和兔王
    ANNOUNCE_RABBITKING_LUCKY = "这个兔子长得好奇怪！",		--发现幸运兔王
    ANNOUNCE_RABBITKING_LUCKYCAUGHT = "抓到你啦！",		--成功抓住幸运兔王
    ANNOUNCE_RABBITKINGHORN_BADSPAWNPOINT = "兔子们也许不喜欢这个地方。",		--兔王号角召唤位置无效

	ANNOUNCE_NOPUMPKINCARVINGONFIRE = "这南瓜都烤熟了。",		--南瓜正在燃烧，不能雕刻

	ANNOUNCE_SNOWBALL_TOO_BIG = "不会再大了。",		--雪球已经达到最大尺寸
	ANNOUNCE_SNOWBALL_NO_SNOW = "地上的雪不够多。",		--地面没有足够积雪制作雪球

    ANNOUNCE_WENDY_BABYSITTER_SET = "我会回来找你的，阿比。", 		--温蒂设置阿比盖尔的照看目标
    ANNOUNCE_WENDY_BABYSITTER_STOP = "阿比，我们出发吧！",		--温蒂停止阿比盖尔的照看任务

	ANNOUNCE_WORTOX_REVIVER_FAILTELEPORT = "呣。哪里出错了？",		--沃拓克斯尝试传送救援失败

    ANNOUNCE_NO_ABIGAIL_FLOWER = "我需要阿比盖尔之花才能继续。",		--温蒂没有阿比盖尔之花

    ANNOUNCE_ELIXIR_BOOSTED = "简直就是阴间版强心针。",		--阿比盖尔获得强化药剂效果
    ANNOUNCE_ELIXIR_GHOSTVISION = "我感觉一阵恐惧袭来。",		--获得幽灵视野药剂效果
    ANNOUNCE_ELIXIR_PLAYER_SPEED = "我举着马跑都不会慢。",		--获得角色移速药剂效果

    ANNOUNCE_ELIXIR_TOO_SUPER = "这个味道有点大了。",		--药剂强度过高，不能继续使用


    ANNOUNCE_LUNARGUARDIAN_INCOMING = "它回来了！",		--月亮守卫即将出现
    ANNOUNCE_FLOATER_HELD = "本来我正忙着溺水呢，结果我脑海中就浮现……我就浮起来了！",		--抓住水面漂浮物
    ANNOUNCE_FLOATER_LETGO = "我讨厌被吊——",		--松开水面漂浮物

    ANNOUNCE_LUNARHAIL_BIRD_SOUNDS = "原来鸦群被杀死是这样的声音。",		--月雹期间听到鸟类异常声响
    ANNOUNCE_LUNARHAIL_BIRD_CORPSES = "像鸟一样掉了下来。",		--月雹后发现鸟类尸体
    ANNOUNCE_FLOAT_SWIM_TIRED = "我太累了。",		--游泳时体力耗尽
    ANOUNCE_MUTATED_BIRD_ATTACK = "有鸟!",		--变异鸟发动攻击

    ANNOUNCE_WEAPON_TOOWEAK = "给我个结实点的东西！",		--武器强度不足，不能伤害目标
    ANNOUNCE_VAULT_TELEPORTER_DOES_NOTHING = "是不是另一边出故障了？",		--宝库传送装置当前没有效果

	ANNOUNCE_LIGHTSOUT_SHADOWHAND = "等一下，那东西在这下面做什么？",		--黑暗中出现暗影之手

    ANNOUNCE_MUTATED_BUZZARD_ARRIVAL = "走开！我们还没死呢！等等，这些家伙发生了变异。", 		--变异秃鹫抵达并在角色附近盘旋

    ANNOUNCE_HERMITCRAB_SHELL_BADTELEPORTPOINT = "我怎么还在这里？",		--寄居蟹贝壳传送目标位置无效
    ANNOUNCE_HERMITCRAB_SHELL_ARRIVE = "我有晕船的感觉！",		--通过寄居蟹贝壳传送抵达

    ANNOUNCE_YOTH_ONCOOLDOWN = "他们多半是在忙着瞎胡闹。",		--马年活动能力仍在冷却
	ANNOUNCE_MAX_CLOCKWORKS = "嗯，只能拿一对，倒也说得过去。",		--可控制的发条生物数量达到上限

    ANNOUNCE_WX_SCANNER_HITDOWN_BY_CAT = "蠢猫",		--WX-78的扫描仪被猫拍落
    ANNOUNCE_WX_TASER_BUILDUP = "你的攻击正在给我充电！", 		--WX-78受击后电荷持续积累，即将释放电磁脉冲
    ANNOUNCE_WX_TASER_ABOUTTOEXPLODE = "达到最大功率！", 		--WX-78电荷已满，即将释放电磁脉冲
    ANNOUNCE_WX_TASER_POSTEXPLOSION = "畅快无比！", 		--WX-78释放电磁脉冲并清空积累电荷
    ANNOUNCE_WX_NIGHTMARECHARGE = "检测到异常物质。电力系统已启用超控", 		--WX-78使用噩梦燃料后暂时充满电荷
	ANNOUNCE_WX_NIGHTMAREDISCHARGE = "超控解除。电力水平已恢复。", 		--WX-78的噩梦燃料临时满电效果结束


    ANNOUNCE_MITEGLAND_DEBUFF =
	{
		"我的五脏六腑都在燃烧！",		--螨腺灼烧减益生效
		"我胃里烧得厉害……",		--螨腺灼烧减益生效
	},
	ANNOUNCE_MITEGLAND_DEBUFF_DONE = "我可不想再重温那个实验。",		--螨腺灼烧减益结束
    ANNOUNCE_GOT_DECON_MISTED = "哈！洋洋洒洒！",		--被解构迷雾命中
	ANNOUNCE_VAULT_SHADOW_ASSIST = "毫无疑问，它们在帮忙！",		--宝库中的暗影力量开始提供协助
    ANNOUNCE_HEALINGSALVE_FUMAROLEBUFF_DONE = "也许该重新抹点避火膏了。",		--热能药膏提供的火焰免疫效果结束
    ANNOUNCE_SECURITY_PULSE_FOLLOWING = "它在跟着我。", 		--携带路标罗盘后安保电火花附着并跟随角色


	ANNOUNCE_GRUE_NOCHARLIE = "That presence... it's unfamiliar! Hello?",		--事件说明：ANNOUNCE_GRUE_NOCHARLIE
	ANNOUNCE_GRUE_NOCHARLIE_ATTACK = "OW! Something bit me!",		--事件说明：ANNOUNCE_GRUE_NOCHARLIE_ATTACK
	ANNOUNCE_GRUE_NOCHARLIE_MISSED = "Ah! I don't know that move!", 		--事件说明：ANNOUNCE_GRUE_NOCHARLIE_MISSED

	ANNOUNCE_STOMP_SHROUDEN = "And now you shall suffer de-feet!",		--事件说明：ANNOUNCE_STOMP_SHROUDEN

    ANNOUNCE_DREADSTONE_SPIKE_EXPLODING = "It's about to blow, my mind!", 		--事件说明：ANNOUNCE_DREADSTONE_SPIKE_EXPLODING

	BATTLECRY =
	{
		GENERIC = "受死吧！",		--战斗
		PIG = "到这儿来，小猪！",		--战斗 猪人
		PREY = "我要灭了你！",		--战斗 猎物？？大象？
		SPIDER = "我要踩死你！",		--战斗 蜘蛛
		SPIDER_WARRIOR = "你死好过我死！",		--战斗 蜘蛛战士
		DEER = "去死吧，鹿！",		--战斗 无眼鹿
	},
	COMBAT_QUIT =
	{
		GENERIC = "他肯定尝到我的厉害了！",		--攻击目标被卡住，无法攻击
		PIG = "这次姑且放过他。",		--退出战斗-猪人
		PREY = "他速度太快了！",		--退出战斗 猎物？？大象？
		SPIDER = "不管怎么说，他真是太恶心了。",		-- 退出战斗 蜘蛛
		SPIDER_WARRIOR = "嘘…你这个讨厌的家伙！",		--退出战斗 蜘蛛战士
	},

	DESCRIBE =
	{
		MULTIPLAYER_PORTAL = "这在科学上说不通。",		--物品名：绚丽之门
        MULTIPLAYER_PORTAL_MOONROCK = "我想这是有科学道理的。",		--物品名：天体传送门
        MOONROCKIDOL = "我只崇拜科学。",		--物品名：月岩雕像
        CONSTRUCTION_PLANS = "科学用品！",		--物品名：建造计划

        ANTLION =
        {
            GENERIC = "我身上有它想要的东西。",		--物品名：蚁狮 检查状态：普通状态
            VERYHAPPY = "看起来跟我关系不错。",		--物品名：蚁狮 检查状态：蚁狮贡品满意度很高
            UNHAPPY = "看起来很生气。",		--物品名：蚁狮 检查状态：蚁狮贡品满意度较低
        },
        ANTLIONTRINKET = "有人可能对此感兴趣。",		--物品名：沙滩玩具
        SANDSPIKE = "我原本会被刺穿的！",		--物品名：沙刺
        SANDBLOCK = "真是坚持不懈！",		--物品名：沙堡
        GLASSSPIKE = "我还没有被刺穿时的记忆。",		--物品名：玻璃尖刺
        GLASSBLOCK = "这份科学送给你。",		--物品名：玻璃城堡
        ABIGAIL_FLOWER =
        {
            GENERIC ="太漂亮了，让人流连忘返。",		--物品名：阿比盖尔之花 检查状态：普通状态
			LEVEL1 = "你想一个人待着吗？",		--物品名：阿比盖尔之花 检查状态：第一阶段
			LEVEL2 = "她准备跟我们吐露心扉了。",		--物品名：阿比盖尔之花 检查状态：第二阶段
			LEVEL3 = "精神头真足啊！",		--物品名：阿比盖尔之花 检查状态：第三阶段

            LONG = "看到那东西时，我的灵魂受伤了。",		--物品名：阿比盖尔之花 检查状态：距离孵化或变化仍有较长时间
            MEDIUM = "这让我毛骨悚然。",		--物品名：阿比盖尔之花 检查状态：中等阶段
            SOON = "那朵花有情况！",		--物品名：阿比盖尔之花 检查状态：即将进入下一阶段
            HAUNTED_POCKET = "我该放下它。",		--物品名：阿比盖尔之花 检查状态：花朵在物品栏中且已被作祟激活
            HAUNTED_GROUND = "我会查明它到底做了些什么。",		--物品名：阿比盖尔之花 检查状态：花朵位于地面且已被作祟激活
        },

        BALLOONS_EMPTY = "看起来像小丑货币。",		--物品名：一堆气球
        BALLOON = "他们怎么漂浮的？",		--物品名：气球
		BALLOONPARTY = "他怎么把小气球放进去的？",		--物品名：派对气球
		BALLOONSPEED =
        {
            DEFLATED = "所有气球都一样。",		--物品名：迅捷气球 检查状态：已经泄气
            GENERIC = "中间的孔让它更符合空气动力学，经典的物理学原理！",		--物品名：迅捷气球 检查状态：普通状态
        },
		BALLOONVEST = "即使鲜艳的颜色不会引来可怕的生物，它吱吱的声音也会。",		--物品名：充气背心
		BALLOONHAT = "静电把我的头发弄得很可怕。",		--物品名：气球帽

        BERNIE_INACTIVE =
        {
            BROKEN = "它最终土崩瓦解。",		--物品名：伯尼 检查状态：已经损坏
            GENERIC = "它全烧焦了。",		--物品名：伯尼 检查状态：普通状态
        },

        BERNIE_ACTIVE = "泰迪熊在四处溜达。好好玩。",		--物品名：伯尼
        BERNIE_BIG = "千万不要惹薇洛。",		--物品名：伯尼！

		BOOKSTATION =
		{
			GENERIC = "能做实验谁要学习？",		--物品名：书架 检查状态：普通状态
			BURNT = "看来图书馆关门了。",		--物品名：书架 检查状态：已经烧毁
		},
        BOOK_BIRDS = "一本鸟书。",		--物品名：世界鸟类大全
        BOOK_TENTACLES = "有人会被拖着去读这本书。",		--物品名：触手的召唤
        BOOK_GARDENING = "读了半天没看到一个农场。",		--物品名：应用园艺学
		BOOK_SILVICULTURE = "我还是坚持自己的实验吧。",		--物品名：应用造林学
		BOOK_HORTICULTURE = "读了半天没看到一个农场。",		--物品名：园艺学简编版
        BOOK_SLEEP = "奇怪，这只是五百页的电报码。",		--物品名：睡前故事
        BOOK_BRIMSTONE = "开头很无聊，但将近结尾就变好了。",		--物品名：末日将至！

        BOOK_FISH = "它并没有让我上钩。",		--物品名：垂钓者生存指南
        BOOK_FIRE = "并没有心急火燎的阅读冲动。",		--物品名：意念控火术详解
        BOOK_WEB = "我不怕蜘蛛的！我不怕！",		--物品名：克服蛛形纲恐惧症
        BOOK_TEMPERATURE = "我对它的想法不温不火。",		--物品名：控温学
        BOOK_LIGHT = "写这本书的人头脑相当灵光。",		--物品名：永恒之光
        BOOK_RAIN = "听上去不是十分科学。",		--物品名：实用求雨仪式
        BOOK_MOON = "所有这些对月亮的兴趣可能只是阶段性的。",		--物品名：月之魔典
        BOOK_BEES = "我不理解这本书为什么会嗡嗡响。",		--物品名：养蜂笔记
        
        BOOK_HORTICULTURE_UPGRADED = "书中内容大约和盯着草长高一样精彩。",		--物品名：园艺学扩展版
        BOOK_RESEARCH_STATION = "薇克巴顿喜欢跟随书籍的指导。",		--物品名：万物百科
        BOOK_LIGHT_UPGRADED = "光芒万丈！",		--物品名：永恒之光之复兴

        FIREPEN = "趁热打笔！",		--物品名：火焰笔

        PLAYER =
        {
            GENERIC = "你好，%s！",		--物品名：其他角色 检查状态：普通状态
            ATTACKER = "%s 看着很善变...",		--物品名：其他角色 检查状态：近期攻击过当前角色
            MURDERER = "谋杀犯！",		--物品名：其他角色 检查状态：近期杀害过当前角色的同伴
            REVIVER = "%s，鬼魂的朋友。",		--物品名：其他角色 检查状态：近期复活过当前角色
            GHOST = "%s 可以使用一颗心。",		--物品名：其他角色 检查状态：幽灵状态
            FIRESTARTER = "烧掉这个并不科学，%s。",		--物品名：其他角色 检查状态：近期引发过火灾
        },
        WILSON =
        {
            GENERIC = "星星和原子！你是我的分身吗？",		--物品名：威尔逊 检查状态：普通状态
            ATTACKER = "是的。我总是看起来很吓人吗？",		--物品名：威尔逊 检查状态：近期攻击过当前角色
            MURDERER = "你的存在触犯了科学规律，%s！",		--物品名：威尔逊 检查状态：近期杀害过当前角色的同伴
            REVIVER = "%s很专业地将我们的理论付诸实现。",		--物品名：威尔逊 检查状态：近期复活过当前角色
            GHOST = "最好弄个复活设备。不能让另一个科学人漂着。",		--物品名：威尔逊 检查状态：幽灵状态
            FIRESTARTER = "烧掉这个并不科学，%s。",		--物品名：威尔逊 检查状态：近期引发过火灾
        },
        WOLFGANG =
        {
            GENERIC = "很高兴见到你，%s！",		--物品名：沃尔夫冈 检查状态：普通状态
            ATTACKER = "不要和强者挑起战斗...",		--物品名：沃尔夫冈 检查状态：近期攻击过当前角色
            MURDERER = "谋杀犯！我能抓到你！",		--物品名：沃尔夫冈 检查状态：近期杀害过当前角色的同伴
            REVIVER = "%s只是一只巨型泰迪熊。",		--物品名：沃尔夫冈 检查状态：近期复活过当前角色
            GHOST = "我跟你说过不要硬拉那个大石头了。数值都不对。",		--物品名：沃尔夫冈 检查状态：幽灵状态
            FIRESTARTER = "你是没法打倒火的，%s！",		--物品名：沃尔夫冈 检查状态：近期引发过火灾
        },
        WAXWELL =
        {
            GENERIC = "日安，%s！",		--物品名：麦斯威尔 检查状态：普通状态
            ATTACKER = "你似乎从“说话干净利落”变成“粘舌”。",		--物品名：麦斯威尔 检查状态：近期攻击过当前角色
            MURDERER = "我要教教你逻辑和推理...这是我的强项！",		--物品名：麦斯威尔 检查状态：近期杀害过当前角色的同伴
            REVIVER = "%s他把能力用在正义的事业。",		--物品名：麦斯威尔 检查状态：近期复活过当前角色
            GHOST = "不要那样看我，%s！我在努力！",		--物品名：麦斯威尔 检查状态：幽灵状态
            FIRESTARTER = "%s只求火烤。",		--物品名：麦斯威尔 检查状态：近期引发过火灾
        },
        WX78 =
        {
            GENERIC = "日安，%s！",		--物品名：WX-78 检查状态：普通状态
            ATTACKER = "%s，我想我们得调整你的首要指令...",		--物品名：WX-78 检查状态：近期攻击过当前角色
            MURDERER = "%s！你已经违反了第一律法！",		--物品名：WX-78 检查状态：近期杀害过当前角色的同伴
            REVIVER = "我猜是%s让感同身受组件启动并运行。",		--物品名：WX-78 检查状态：近期复活过当前角色
            GHOST = "我一直认为%s该长点心。现在，我很确定！",		--物品名：WX-78 检查状态：幽灵状态
            FIRESTARTER = "%s！你看起来快融化了。发生什么事？",		--物品名：WX-78 检查状态：近期引发过火灾
        },
        WILLOW =
        {
            GENERIC = "日安，%s！",		--物品名：薇洛 检查状态：普通状态
            ATTACKER = "%s紧紧抓住那个打火机...",		--物品名：薇洛 检查状态：近期攻击过当前角色
            MURDERER = "谋杀犯！纵火犯！",		--物品名：薇洛 检查状态：近期杀害过当前角色的同伴
            REVIVER = "%s，鬼魂的朋友。",		--物品名：薇洛 检查状态：近期复活过当前角色
            GHOST = "%s，我敢肯定你渴望有一颗心。",		--物品名：薇洛 检查状态：幽灵状态
            FIRESTARTER = "再来？",		--物品名：薇洛 检查状态：近期引发过火灾
        },
        WENDY =
        {
            GENERIC = "你好，%s！",		--物品名：温蒂 检查状态：普通状态
            ATTACKER = "%s没有尖锐的东西，有吗？",		--物品名：温蒂 检查状态：近期攻击过当前角色
            MURDERER = "谋杀犯！",		--物品名：温蒂 检查状态：近期杀害过当前角色的同伴
            REVIVER = "%s视鬼魂为家人。",		--物品名：温蒂 检查状态：近期复活过当前角色
            GHOST = "我看到两个！我最好给%s制造一颗心。",		--物品名：温蒂 检查状态：幽灵状态
            FIRESTARTER = "我知道是你点的那些火焰，%s。",		--物品名：温蒂 检查状态：近期引发过火灾
        },
        WOODIE =
        {
            GENERIC = "你好，%s！",		--物品名：伍迪 检查状态：普通状态
            ATTACKER = "%s最近有点活力...",		--物品名：伍迪 检查状态：近期攻击过当前角色
            MURDERER = "凶手！来把斧子，我们砍起来！",		--物品名：伍迪 检查状态：近期杀害过当前角色的同伴
            REVIVER = "%s救下了大家的培根。",		--物品名：伍迪 检查状态：近期复活过当前角色
            GHOST = "%s，“宇宙”包括虚无吗？",		--物品名：伍迪 检查状态：幽灵状态
            BEAVER = "%s在疯狂的砍树，根本停不下来！",		--物品名：伍迪 检查状态：伍迪的海狸形态
            BEAVERGHOST = "%s，如果我不复活你，你会生气吗？",		--物品名：伍迪 检查状态：伍迪海狸形态的幽灵
            MOOSE = "天老爷啊，这是一头鹿！",		--物品名：伍迪 检查状态：伍迪的鹿鹅形态
            MOOSEGHOST = "那一定很不舒服吧。",		--物品名：伍迪 检查状态：伍迪鹿形态的幽灵
            GOOSE = "瞧瞧这玩意！",		--物品名：伍迪 检查状态：伍迪的鹅形态
            GOOSEGHOST = "以后长点心，你这头蠢鹅！",		--物品名：伍迪 检查状态：伍迪鹅形态的幽灵
            FIRESTARTER = "%s，别把自己烧了。",		--物品名：伍迪 检查状态：近期引发过火灾
        },
        WICKERBOTTOM =
        {
            GENERIC = "日安，%s！",		--物品名：薇克巴顿 检查状态：普通状态
            ATTACKER = "我感觉%s准备拿书丢我。",		--物品名：薇克巴顿 检查状态：近期攻击过当前角色
            MURDERER = "同行评审来了！",		--物品名：薇克巴顿 检查状态：近期杀害过当前角色的同伴
            REVIVER = "我对%s的实践原理深怀敬意。",		--物品名：薇克巴顿 检查状态：近期复活过当前角色
            GHOST = "这似乎不太科学，不是吗，%s？",		--物品名：薇克巴顿 检查状态：幽灵状态
            FIRESTARTER = "我相信你很有理由才点火。",		--物品名：薇克巴顿 检查状态：近期引发过火灾
        },
        WES =
        {
            GENERIC = "你好，%s！",		--物品名：韦斯 检查状态：普通状态
            ATTACKER = "%s死寂般沉默...",		--物品名：韦斯 检查状态：近期攻击过当前角色
            MURDERER = "用哑剧表达这个！",		--物品名：韦斯 检查状态：近期杀害过当前角色的同伴
            REVIVER = "%s突破固有的思维模式。",		--物品名：韦斯 检查状态：近期复活过当前角色
            GHOST = "怎样用哑剧动作表示“我要弄个复活装备”？",		--物品名：韦斯 检查状态：幽灵状态
            FIRESTARTER = "等等，不要跟我说。火是你点的。",		--物品名：韦斯 检查状态：近期引发过火灾
        },
        WEBBER =
        {
            GENERIC = "日安，%s！",		--物品名：韦伯 检查状态：普通状态
            ATTACKER = "我会卷起一张纸莎草报纸，以防万一。",		--物品名：韦伯 检查状态：近期攻击过当前角色
            MURDERER = "杀人凶手！我要灭了你，%s！",		--物品名：韦伯 检查状态：近期杀害过当前角色的同伴
            REVIVER = "%s和其他人打成一片。",		--物品名：韦伯 检查状态：近期复活过当前角色
            GHOST = "%s真的很想让我给它一颗心。",		--物品名：韦伯 检查状态：幽灵状态
            FIRESTARTER = "我们得开个防火安全群组会议。",		--物品名：韦伯 检查状态：近期引发过火灾
        },
        WATHGRITHR =
        {
            GENERIC = "日安，%s！",		--物品名：薇格弗德 检查状态：普通状态
            ATTACKER = "有可能的话，我会躲开%s的拳头。",		--物品名：薇格弗德 检查状态：近期攻击过当前角色
            MURDERER = "%s变得狂暴！",		--物品名：薇格弗德 检查状态：近期杀害过当前角色的同伴
            REVIVER = "%s精神饱满。",		--物品名：薇格弗德 检查状态：近期复活过当前角色
            GHOST = "做的不错。你还没逃离英灵殿呢，%s。",		--物品名：薇格弗德 检查状态：幽灵状态
            FIRESTARTER = "%s是个加热好手。",		--物品名：薇格弗德 检查状态：近期引发过火灾
        },
        WINONA =
        {
            GENERIC = "日安，%s！",		--物品名：薇诺娜 检查状态：普通状态
            ATTACKER = "%s是安全隐患.",		--物品名：薇诺娜 检查状态：近期攻击过当前角色
            MURDERER = "到此为止了，%s！",		--物品名：薇诺娜 检查状态：近期杀害过当前角色的同伴
            REVIVER = "你可真是方便好用啊，%s。",		--物品名：薇诺娜 检查状态：近期复活过当前角色
            GHOST = "好像有人在给你的计划泼冷水呢。",		--物品名：薇诺娜 检查状态：幽灵状态
            FIRESTARTER = "工厂的东西烧起来了。",		--物品名：薇诺娜 检查状态：近期引发过火灾
        },
        WORTOX =
        {
            GENERIC = "你好，%s！",		--物品名：沃拓克斯 检查状态：普通状态
            ATTACKER = "我就知道%s不可信！",		--物品名：沃拓克斯 检查状态：近期攻击过当前角色
            MURDERER = "是时候正面对抗这个长角的恶魔了！",		--物品名：沃拓克斯 检查状态：近期杀害过当前角色的同伴
            REVIVER = "多谢你的援助之爪%s。",		--物品名：沃拓克斯 检查状态：近期复活过当前角色
            GHOST = "我拒绝接受有鬼魂和恶魔的现实。",		--物品名：沃拓克斯 检查状态：幽灵状态
            FIRESTARTER = "%s正在变成一个生存的负担。",		--物品名：沃拓克斯 检查状态：近期引发过火灾
        },
        WORMWOOD =
        {
            GENERIC = "你好，%s！",		--物品名：沃姆伍德 检查状态：普通状态
            ATTACKER = "%s今天似乎比平时更多刺。",		--物品名：沃姆伍德 检查状态：近期攻击过当前角色
            MURDERER = "准备被除草吧，小杂草，%s!",		--物品名：沃姆伍德 检查状态：近期杀害过当前角色的同伴
            REVIVER = "%s从来不会放弃他的朋友。",		--物品名：沃姆伍德 检查状态：近期复活过当前角色
            GHOST = "需要一些帮助吧，小伙伴？",		--物品名：沃姆伍德 检查状态：幽灵状态
            FIRESTARTER = "我以为你讨厌火，%s.",		--物品名：沃姆伍德 检查状态：近期引发过火灾
        },
        WARLY =
        {
            GENERIC = "你好，%s！",		--物品名：沃利 检查状态：普通状态
            ATTACKER = "酝酿着灾难。",		--物品名：沃利 检查状态：近期攻击过当前角色
            MURDERER = "别打杀我的主意！",		--物品名：沃利 检查状态：近期杀害过当前角色的同伴
            REVIVER = "总是可以指望%s来做一个计划。",		--物品名：沃利 检查状态：近期复活过当前角色
            GHOST = "它现在用幽灵辣椒做饭吧。",		--物品名：沃利 检查状态：幽灵状态
            FIRESTARTER = "他会把这个地方都烧了！",		--物品名：沃利 检查状态：近期引发过火灾
        },

        WURT =
        {
            GENERIC = "日安，%s！",		--物品名：沃特 检查状态：普通状态
            ATTACKER = "%s今天一副凶神恶煞的样子……",		--物品名：沃特 检查状态：近期攻击过当前角色
            MURDERER = "你是条杀人鱼！",		--物品名：沃特 检查状态：近期杀害过当前角色的同伴
            REVIVER = "为什么要谢你，%s！",		--物品名：沃特 检查状态：近期复活过当前角色
            GHOST = "%s鱼鳃周围比平时更绿了。",		--物品名：沃特 检查状态：幽灵状态
            FIRESTARTER = "就没人教你别玩火吗？！",		--物品名：沃特 检查状态：近期引发过火灾
        },

        WALTER =
        {
            GENERIC = "日安，%s！",		--物品名：沃尔特 检查状态：普通状态
            ATTACKER = "这是松树先锋队员该做的事吗？",		--物品名：沃尔特 检查状态：近期攻击过当前角色
            MURDERER = "你的故事素材用完了吗，%s？",		--物品名：沃尔特 检查状态：近期杀害过当前角色的同伴
            REVIVER = "%s永远靠谱。",		--物品名：沃尔特 检查状态：近期复活过当前角色
            GHOST = "我知道你玩的很开心，但是我们要去找一颗心。",		--物品名：沃尔特 检查状态：幽灵状态
            FIRESTARTER = "那个看起来可不像是营火，%s。",		--物品名：沃尔特 检查状态：近期引发过火灾
        },

        WANDA =
        {
            GENERIC = "日安，%s！",		--物品名：旺达 检查状态：普通状态
            ATTACKER = "不要这么不分时间，不分场合，%s！",		--物品名：旺达 检查状态：近期攻击过当前角色
            MURDERER = "杀人犯！我绝不会给你第二次机会的！",		--物品名：旺达 检查状态：近期杀害过当前角色的同伴
            REVIVER = "要不是%s，我就成为历史了！",		--物品名：旺达 检查状态：近期复活过当前角色
            GHOST = "赶紧去找颗心脏。",		--物品名：旺达 检查状态：幽灵状态
            FIRESTARTER = "让我猜猜，这与“保存时间线”有关？",		--物品名：旺达 检查状态：近期引发过火灾
        },

        WONKEY =
        {
            GENERIC = "是只猴子。",		--物品名：芜猴 检查状态：普通状态
            ATTACKER = "嘿，别像猴子一样胡闹了！",		--物品名：芜猴 检查状态：近期攻击过当前角色
            MURDERER = "它们发猴疯了！",		--物品名：芜猴 检查状态：近期杀害过当前角色的同伴
            REVIVER = "我的命居然是……猴子救的？",		--物品名：芜猴 检查状态：近期复活过当前角色
            GHOST = "那只猴子真吓人。",		--物品名：芜猴 检查状态：幽灵状态
            FIRESTARTER = "恐龙当时是不是就是这种感觉？",		--物品名：芜猴 检查状态：近期引发过火灾
        },

        MIGRATION_PORTAL =
        {
        },
        GLOMMER =
        {
            GENERIC = "恶趣味，确又不失可爱。",		--物品名：格罗姆 检查状态：普通状态
            SLEEPING = "这虫子过的真不错。",		--物品名：格罗姆 检查状态：正在睡眠
        },
        GLOMMERFLOWER =
        {
            GENERIC = "花瓣微微发亮。",		--物品名：格罗姆花 检查状态：普通状态
            DEAD = "花瓣枯萎，微微发亮。",		--物品名：格罗姆花 检查状态：已经死亡
        },
        GLOMMERWINGS = "这些装在头盔上好看极了！",		--物品名：格罗姆翅膀
        GLOMMERFUEL = "这团糊糊恶臭无比。",		--物品名：格罗姆的黏液
        BELL = "叮呤呤。",		--物品名：远古铃铛
        STATUEGLOMMER =
        {
            GENERIC = "我不确定那是什么东西。",		--物品名：格罗姆雕像 检查状态：普通状态
            EMPTY = "打碎了，那是为了科学。",		--物品名：格罗姆雕像 检查状态：内容为空
        },

        LAVA_POND_ROCK = "这地不赖啊。",		--物品名：岩石

		WEBBERSKULL = "可怜的小家伙。应该为他举办一个体面的葬礼。",		--物品名：韦伯的头骨
		WORMLIGHT = "看起来很好吃。",		--物品名：发光浆果
		WORMLIGHT_LESSER = "有点皱巴巴的。",		--物品名：小发光浆果
		WORM =
		{
		    PLANT = "我觉得挺安全。",		--物品名：洞穴蠕虫 检查状态：伪装成植物
		    DIRT = "看起来就像一堆土。",		--物品名：洞穴蠕虫 检查状态：地面隆起形态
		    WORM = "它是一只蠕虫！",		--物品名：洞穴蠕虫 检查状态：蠕虫本体形态
		},
        WORMLIGHT_PLANT = "我觉得挺安全。",		--物品名：神秘植物
		MOLE =
		{
			HELD = "没什么可挖的了，我的朋友。",		--物品名：鼹鼠 检查状态：正被角色携带
			UNDERGROUND = "下面有个正在寻找矿物的家伙。",		--物品名：鼹鼠 检查状态：位于地下
			ABOVEGROUND = "我想像打地鼠那样敲昏那只鼹鼠...",		--物品名：鼹鼠 检查状态：位于地面上
		},
		MOLEHILL = "多么美好舒适的地洞啊！",		--物品名：鼹鼠丘
		MOLEHAT = "散发着讨厌的恶臭，但视野极佳。",		--物品名：鼹鼠帽

		EEL = "这能做一道好菜。",		--物品名：鳗鱼
		EEL_COOKED = "闻起来真香！",		--物品名：熟鳗鱼
		UNAGI = "希望这不会让任何人变为鳗鱼！",		--物品名：鳗鱼料理
		EYETURRET = "希望它不会看向我。",		--物品名：眼睛炮塔
		EYETURRET_ITEM = "我想它在睡觉。",		--物品名：眼睛炮塔
		MINOTAURHORN = "哇哦！我很高兴那家伙没用角撞我！",		--物品名：守护者之角
		MINOTAURCHEST = "里面可能有更大的好东西！也可能是可怕的东西。",		--物品名：大号华丽箱子
		THULECITE_PIECES = "更小块的铥矿。",		--物品名：铥矿碎片
		POND_ALGAE = "池塘边的水藻。",		--物品名：水藻
		GREENSTAFF = "这东西迟早派得上用场。",		--物品名：拆解魔杖
		GIFT = "那是给我的吗？",		--物品名：礼物
        GIFTWRAP = "我太厉害了！",		--物品名：礼物包装
		POTTEDFERN = "盆里的蕨类植物。",		--物品名：蕨类盆栽
        SUCCULENT_POTTED = "盆里的多肉植物。",		--物品名：多肉盆栽
		SUCCULENT_PLANT = "那里有芦荟。",		--物品名：多肉植物
		SUCCULENT_PICKED = "我能吃那个，但我不想吃。",		--物品名：多肉植物
		SENTRYWARD = "十分科学的测绘工具。",		--物品名：月眼守卫
        TOWNPORTAL =
        {
			GENERIC = "这个金字塔控制着沙子。",		--物品名：懒人传送塔 检查状态：普通状态
			ACTIVE = "准备好分离。",		--物品名：懒人传送塔 检查状态：正在运作
		},
        TOWNPORTALTALISMAN =
        {
			GENERIC = "迷你分离器。",		--物品名：沙之石 检查状态：普通状态
			ACTIVE = "更清醒的人会选择步行。",		--物品名：沙之石 检查状态：正在运作
		},
        WETPAPER = "我希望它快点干。",		--物品名：纸张
        WETPOUCH = "这个包裹只能勉强绑在一起。",		--物品名：起皱的包裹
        MOONROCK_PIECES = "我应该能打碎它。",		--物品名：月亮石碎块
        MOONBASE =
        {
            GENERIC = "中间有个洞，好像可以扔东西进去。",		--物品名：月亮石 检查状态：普通状态
            BROKEN = "都搞砸了。",		--物品名：月亮石 检查状态：已经损坏
            STAFFED = "然后呢？",		--物品名：月亮石 检查状态：已经插入法杖
            WRONGSTAFF = "我有一种明显的感觉，这不对。",		--物品名：月亮石 检查状态：插入了不匹配的法杖
            MOONSTAFF = "石头神奇的点燃了它。",		--物品名：月亮石 检查状态：插入了唤星者魔杖
        },
        MOONDIAL =
        {
			GENERIC = "水放大了科学，让我们能够测量月亮。",		--物品名：月晷 检查状态：普通状态
			NIGHT_NEW = "是新月。",		--物品名：月晷 检查状态：夜间新月状态
			NIGHT_WAX = "月亮慢慢在变圆。",		--物品名：月晷 检查状态：夜间盈月状态
			NIGHT_FULL = "是满月。",		--物品名：月晷 检查状态：夜间满月状态
			NIGHT_WANE = "月亮正在变小。",		--物品名：月晷 检查状态：夜间亏月状态
			CAVE = "这下面没有月亮来测量。",		--物品名：月晷 检查状态：位于洞穴世界
			WEREBEAVER = "大概又到时候了，露西。", 		--物品名：月晷 检查状态：月晷显示伍迪将变成海狸
			GLASSED = "我有种奇怪的感觉，好像有人在盯着我。",		--物品名：月晷 检查状态：月晷表面已经玻璃化
        },
		THULECITE = "我想知道这是哪来的？",		--物品名：铥矿
		ARMORRUINS = "它轻得古怪。",		--物品名：铥矿甲
		ARMORSKELETON = "铮铮白骨",		--物品名：骨头盔甲
		SKELETONHAT = "它给我带来可怕的幻象。",		--物品名：骨头头盔
		RUINS_BAT = "份量相当重。",		--物品名：铥矿棒
		RUINSHAT = "我的头发怎么样？",		--物品名：铥矿皇冠
		NIGHTMARE_TIMEPIECE =
		{
            CALM = "一切都好了。",		--物品名：铥矿徽章 检查状态：噩梦循环处于平静阶段
            WARN = "感测到这里有相当强的魔法能量。",		--物品名：铥矿徽章 检查状态：噩梦循环即将进入危险阶段
            WAXING = "变得越来越密集了！",		--物品名：铥矿徽章 检查状态：噩梦循环正在增强
            STEADY = "好像保持稳定了。",		--物品名：铥矿徽章 检查状态：噩梦循环处于稳定阶段
            WANING = "感觉魔法能量正在逐渐减弱。",		--物品名：铥矿徽章 检查状态：噩梦循环正在减弱
            DAWN = "噩梦就要结束了！",		--物品名：铥矿徽章 检查状态：噩梦循环接近结束
            NOMAGIC = "这里没有魔法能量。",		--物品名：铥矿徽章 检查状态：当前没有噩梦魔力活动
		},
		BISHOP_NIGHTMARE = "它在分崩离析！",		--物品名：损坏的发条主教
		ROOK_NIGHTMARE = "真可怕！",		--物品名：损坏的发条战车
		KNIGHT_NIGHTMARE = "一个残暴的发条骑士！",		--物品名：损坏的发条骑士
		MINOTAUR = "那家伙看起来不太高兴。",		--物品名：远古守护者
		SPIDER_DROPPER = "自我提醒：别向上看。",		--物品名：穴居悬蛛
		NIGHTMARELIGHT = "我想知道这个东西有什么用。",		--物品名：梦魇灯座
		NIGHTSTICK = "它带电！",		--物品名：晨星锤
		GREENGEM = "绿色的，闪耀着光芒。",		--物品名：绿宝石
		MULTITOOL_AXE_PICKAXE = "太高明了！",		--物品名：多用斧镐
		ORANGESTAFF = "这比走路好。",		--物品名：懒人魔杖
		YELLOWAMULET = "手感温暖。",		--物品名：魔光护符
		GREENAMULET = "所有基地都得配一个！",		--物品名：建造护符
		SLURPERPELT = "死了的样子也没什么不同。",		--物品名：啜食者皮

		SLURPER = "好多毛！",		--物品名：啜食者
		SLURPER_PELT = "死了的样子也没什么不同。",		--物品名：啜食者皮
		ARMORSLURPER = "一根湿漉漉的、帮助你抵抗饥饿的腰带。",		--物品名：饥饿腰带
		ORANGEAMULET = "瞬移的用处可大了。",		--物品名：懒人护符
		YELLOWSTAFF = "天才发明...棍子上有宝石。",		--物品名：唤星者魔杖
		YELLOWGEM = "这个宝石是黄色的。",		--物品名：黄宝石
		ORANGEGEM = "一颗橙宝石。",		--物品名：橙宝石
        OPALSTAFF = "科学方面证明，宝石在棍子的顶部看起来更耀眼。",		--物品名：唤月者魔杖
        OPALPRECIOUSGEM = "这个宝石看起来很特别。",		--物品名：彩虹宝石
        TELEBASE =
		{
			VALID = "它准备好了。",		--物品名：传送焦点 检查状态：宝石组合有效，可以激活
			GEMS = "它需要更多紫宝石。",		--物品名：传送焦点 检查状态：已插入宝石但尚未完全激活
		},
		GEMSOCKET =
		{
			VALID = "看起来准备就绪了。",		--物品名：宝石底座 检查状态：宝石组合有效，可以激活
			GEMS = "它需要一颗宝石。",		--物品名：宝石底座 检查状态：已插入宝石但尚未完全激活
		},
		STAFFLIGHT = "那似乎非常危险。",		--物品名：矮星
        STAFFCOLDLIGHT = "呃！令人寒心。",		--物品名：极光

        ANCIENT_ALTAR = "古老而神秘的建筑。",		--物品名：远古伪科学站

        ANCIENT_ALTAR_BROKEN = "这个好像破损了。",		--物品名：损坏的远古伪科学站

        ANCIENT_STATUE = "它好像在与世界格格不入地震动。",		--物品名：远古雕像

        LICHEN = "只有蓝藻能在这种光线条件下生长。",		--物品名：洞穴苔藓
		CUTLICHEN = "有营养，但保存不了多久。",		--物品名：苔藓

		CAVE_BANANA = "软塌塌的。",		--物品名：香蕉
		CAVE_BANANA_COOKED = "好吃！",		--物品名：熟香蕉
		CAVE_BANANA_TREE = "怀疑它能不能光合作用。",		--物品名：洞穴香蕉树
        ROCKY =
        {
            GENERIC = "It has terrifying claws.",		--物品名：石虾 检查状态：普通状态
            BOULDER = "It wouldn't fit in my pocket.", 		--物品名：石虾 检查状态：收缩成岩石状
            ACID = "Did it get smaller?", 		--物品名：石虾 检查状态：受到酸液影响
        },

		COMPASS =
		{
			GENERIC="我面朝哪个方向？",		--物品名：指南针 检查状态：普通状态
			N = "北。",		--物品名：指南针 检查状态：指南针指向北方
			S = "南。",		--物品名：指南针 检查状态：指南针指向南方
			E = "东。",		--物品名：指南针 检查状态：指南针指向东方
			W = "西。",		--物品名：指南针 检查状态：指南针指向西方
			NE = "东北。",		--物品名：指南针 检查状态：指南针指向东北方
			SE = "东南。",		--物品名：指南针 检查状态：指南针指向东南方
			NW = "西北。",		--物品名：指南针 检查状态：指南针指向西北方
			SW = "西南。",		--物品名：指南针 检查状态：指南针指向西南方
		},

        HOUNDSTOOTH = "真锋利！",		--物品名：犬牙
        ARMORSNURTLESHELL = "穿这衣服时，会粘在背上。",		--物品名：蜗壳护甲
        BAT =
        {
            GENERIC = "Ack! That's terrifying!",		--物品名：洞穴蝙蝠 检查状态：普通状态
            ACID = "A creature of the nitre!", 		--物品名：洞穴蝙蝠 检查状态：受到酸液影响
        },
        BATBAT = "我敢打赌，如果我拿着其中俩个我就能飞起来。",		--物品名：蝙蝠棒
        BATWING = "那些东西即使死了都很讨厌。",		--物品名：洞穴蝙蝠翅膀
        BATWING_COOKED = "至少它不会再活过来了。",		--物品名：熟蝙蝠翅膀
        BATCAVE = "我可不想吵醒它们。",		--物品名：蝙蝠洞
        BEDROLL_FURRY = "真是又暖和又舒服。",		--物品名：毛皮铺盖
        BUNNYMAN = "我要马上搞科研，饥渴难耐。",		--物品名：兔人
        FLOWER_CAVE = "是科学的力量让它发光。",		--物品名：荧光花
        GUANO = "另一种味道的粪便。",		--物品名：鸟粪
        LANTERN = "更文明的灯具。",		--物品名：提灯
        LIGHTBULB = "奇怪，看起来就很好吃。",		--物品名：荧光果
        MANRABBIT_TAIL = "手里抓个东西挺好的。",		--物品名：兔绒
        MUSHROOMHAT = "让穿戴者看起来像一个有趣的家伙。",		--物品名：蘑菇帽
        MUSHROOM_LIGHT2 =
        {
            ON = "蓝色明显是最科学的颜色。",		--物品名：菌伞灯 检查状态：处于开启状态
            OFF = "我们可以用一些主要颜色来生成一个主要光源。",		--物品名：菌伞灯 检查状态：处于关闭状态
            BURNT = "我没有让它发霉，我发誓。",		--物品名：菌伞灯 检查状态：已经烧毁
        },
        MUSHROOM_LIGHT =
        {
            ON = "科学把它点亮了。",		--物品名：蘑菇灯 检查状态：处于开启状态
            OFF = "它是一个又大又科学的蘑菇。",		--物品名：蘑菇灯 检查状态：处于关闭状态
            BURNT = "完全烧焦。",		--物品名：蘑菇灯 检查状态：已经烧毁
        },
        SLEEPBOMB = "一扔就让我犯困。",		--物品名：睡袋
        MUSHROOMBOMB = "一朵蘑菇云正在生成！",		--物品名：炸弹蘑菇
        SHROOM_SKIN = "疣，都是疣！",		--物品名：蘑菇皮
        TOADSTOOL_CAP =
        {
            EMPTY = "只是地上的一个洞。",		--物品名：毒菌蟾蜍 检查状态：内容为空
            INGROUND = "有东西伸出来了。",		--物品名：毒菌蟾蜍 检查状态：仍埋在地下
            GENERIC = "那毒菌只是想被砍掉。",		--物品名：毒菌蟾蜍 检查状态：普通状态
        },
        TOADSTOOL =
        {
            GENERIC = "咦嘘！我不要亲吻那东西！",		--物品名：毒菌蟾蜍 检查状态：普通状态
            RAGE = "它狂跳不止！",		--物品名：毒菌蟾蜍 检查状态：毒菌蟾蜍处于愤怒强化状态
        },
        MUSHROOMSPROUT =
        {
            GENERIC = "多么科学！",		--物品名：孢子帽 检查状态：普通状态
            BURNT = "多么不道德！",		--物品名：孢子帽 检查状态：已经烧毁
        },
        MUSHTREE_TALL =
        {
            GENERIC = "那个蘑菇长得太大了。",		--物品名：蓝蘑菇树 检查状态：普通状态
            BLOOM = "从远处看不出来，但它相当臭。",		--物品名：蓝蘑菇树 检查状态：处于开花状态
            ACIDCOVERED = "沾满了酸液。",		--物品名：蓝蘑菇树 检查状态：被酸雨覆盖
        },
        MUSHTREE_MEDIUM =
        {
            GENERIC = "我的浴室里过去生长着这些东西。",		--物品名：红蘑菇树 检查状态：普通状态
            BLOOM = "这个让我有点反感。",		--物品名：红蘑菇树 检查状态：处于开花状态
            ACIDCOVERED = "沾满了酸液。",		--物品名：红蘑菇树 检查状态：被酸雨覆盖
        },
        MUSHTREE_SMALL =
        {
            GENERIC = "魔法蘑菇？",		--物品名：绿蘑菇树 检查状态：普通状态
            BLOOM = "它在努力繁殖。",		--物品名：绿蘑菇树 检查状态：处于开花状态
            ACIDCOVERED = "沾满了酸液。",		--物品名：绿蘑菇树 检查状态：被酸雨覆盖
        },
        MUSHTREE_TALL_WEBBED =
        {
            GENERIC = "蜘蛛们觉得这个很重要。",		--物品名：蛛网蓝蘑菇树 检查状态：普通状态
            ACIDCOVERED = "沾满了酸液。",		--物品名：蛛网蓝蘑菇树 检查状态：被酸雨覆盖
        },
        SPORE_TALL =
        {
            GENERIC = "它四处飘荡。",		--物品名：蓝色孢子 检查状态：普通状态
            HELD = "我要在口袋里装一点光。",		--物品名：蓝色孢子 检查状态：正被角色携带
        },
        SPORE_MEDIUM =
        {
            GENERIC = "在这世上已了无牵挂。",		--物品名：红色孢子 检查状态：普通状态
            HELD = "我要在口袋里装一点光。",		--物品名：红色孢子 检查状态：正被角色携带
        },
        SPORE_SMALL =
        {
            GENERIC = "那是孢子的眼睛看到的景象。",		--物品名：绿色孢子 检查状态：普通状态
            HELD = "我要在口袋里装一点光。",		--物品名：绿色孢子 检查状态：正被角色携带
        },
        RABBITHOUSE =
        {
            GENERIC = "那可不是真的胡萝卜。",		--物品名：兔屋 检查状态：普通状态
            BURNT = "那可不是真的烤胡萝卜。",		--物品名：兔屋 检查状态：已经烧毁
        },
        SLURTLE = "呕...恶心...",		--物品名：蛞蝓龟
        SLURTLE_SHELLPIECES = "拼不好的拼图。",		--物品名：外壳碎片
        SLURTLEHAT = "那会弄乱我的头发。",		--物品名：背壳头盔
        SLURTLEHOLE = "“恶心的”洞穴。",		--物品名：蛞蝓龟窝
        SLURTLESLIME = "要不是有用的话，我才不会去碰呢。",		--物品名：蛞蝓龟黏液
        SNURTLE = "他不算太恶心，但还是恶心。",		--物品名：蜗牛龟
        SPIDER_HIDER = "哇！更多蜘蛛！",		--物品名：洞穴蜘蛛
        SPIDER_SPITTER = "我讨厌蜘蛛！",		--物品名：喷吐蜘蛛
        SPIDERHOLE = "它外面盖满了蛛网。",		--物品名：蛛网岩
        SPIDERHOLE_ROCK = "它外面盖满了蛛网。",		--物品名：蛛穴岩块
        STALAGMITE = "我看它就是块石头。",		--物品名：石笋
        STALAGMITE_TALL = "石头，石头，石头，石头...",		--物品名：石笋

        TURF_CARPETFLOOR = "非常扎人。",		--物品名：地毯地板
        TURF_CHECKERFLOOR = "这些非常华丽。",		--物品名：棋盘地板
        TURF_DIRT = "一块地皮。",		--物品名：泥土地皮
        TURF_FOREST = "一块地皮。",		--物品名：森林地皮
        TURF_GRASS = "一块地皮。",		--物品名：长草地皮
        TURF_MARSH = "一块地皮。",		--物品名：沼泽地皮
        TURF_METEOR = "一块月球地面。",		--物品名：月球环形山地皮
        TURF_PEBBLEBEACH = "一块海滩。",		--物品名：岩石海滩地皮
        TURF_ROAD = "草草铺砌的石头。",		--物品名：卵石路
        TURF_ROCKY = "一块地皮。",		--物品名：岩石地皮
        TURF_SAVANNA = "一块地皮。",		--物品名：热带草原地皮
        TURF_WOODFLOOR = "这些是木地板。",		--物品名：木地板

		TURF_CAVE="又一种地皮类型。",		--物品名：鸟粪地皮
		TURF_FUNGUS="又一种地皮类型。",		--物品名：真菌地皮
		TURF_FUNGUS_MOON = "又一种地皮类型。",		--物品名：变异真菌地皮
		TURF_ARCHIVE = "又一种地皮类型。",		--物品名：远古石刻
        TURF_VAULT = "又一种地皮类型。",		--物品名：远古圣殿石刻
        TURF_VENT = "又一种地皮类型。",		--物品名：洞穴喷气孔地皮
		TURF_SINKHOLE="又一种地皮类型。",		--物品名：黏滑地皮
		TURF_UNDERROCK="又一种地皮类型。",		--物品名：洞穴岩石地皮
		TURF_MUD="又一种地皮类型。",		--物品名：泥泞地皮

		TURF_DECIDUOUS = "又一种地皮类型。",		--物品名：落叶林地皮
		TURF_SANDY = "又一种地皮类型。",		--物品名：沙土地皮
		TURF_BADLANDS = "又一种地皮类型。",		--物品名：荒地地皮
		TURF_DESERTDIRT = "一块地皮。",		--物品名：沙漠地皮
		TURF_FUNGUS_GREEN = "一块地皮。",		--物品名：真菌地皮
		TURF_FUNGUS_RED = "一块地皮。",		--物品名：真菌地皮
		TURF_DRAGONFLY = "你想证明它能防火吗？",		--物品名：龙鳞地板

        TURF_SHELLBEACH = "一块海滩。",		--物品名：贝壳海滩地皮

		TURF_RUINSBRICK = "又一种地皮类型。",		--物品名：远古地面
		TURF_RUINSBRICK_GLOW = "又一种地皮类型。",		--物品名：仿远古地面
		TURF_RUINSTILES = "又一种地皮类型。",		--物品名：远古瓷砖
		TURF_RUINSTILES_GLOW = "又一种地皮类型。",		--物品名：仿远古瓷砖
		TURF_RUINSTRIM = "又一种地皮类型。",		--物品名：远古砖雕
		TURF_RUINSTRIM_GLOW = "又一种地皮类型。",		--物品名：仿远古砖雕

        TURF_MONKEY_GROUND = "一片沙地。",		--物品名：月亮码头海滩地皮

        TURF_CARPETFLOOR2 = "它出奇地柔软。",		--物品名：茂盛地毯
        TURF_MOSAIC_GREY = "又一种地皮类型。",		--物品名：灰色马赛克地板
        TURF_MOSAIC_RED = "又一种地皮类型。",		--物品名：红色马赛克地板
        TURF_MOSAIC_BLUE = "又一种地皮类型。",		--物品名：蓝色马赛克地板

        TURF_BEARD_RUG = "我用我的胡须做的！",		--物品名：胡须地毯

		POWCAKE = "科学啊，帮帮我们吧。",		--物品名：粉末蛋糕
        CAVE_ENTRANCE = "我在想那岩石能不能移开。",		--物品名：被堵住的洞穴
        CAVE_ENTRANCE_RUINS = "它有可能在隐瞒什么事情。",		--物品名：被堵住的陷洞

       	CAVE_ENTRANCE_OPEN =
        {
            GENERIC = "大地本身在排斥我！",		--物品名：洞穴 检查状态：普通状态
            OPEN = "我敢打赌在那下面肯定能发现各种各样的东西。",		--物品名：洞穴 检查状态：处于打开状态
            FULL = "我会等到有人离开进入。",		--物品名：洞穴 检查状态：内容已满
        },
        CAVE_EXIT =
        {
            GENERIC = "我想我该待在这下面。",		--物品名：楼梯 检查状态：普通状态
            OPEN = "我暂时不想再探险了。",		--物品名：楼梯 检查状态：处于打开状态
            FULL = "上面太拥挤！",		--物品名：楼梯 检查状态：内容已满
        },

		MAXWELLPHONOGRAPH = "音乐原来是从那来的。",		--物品名：麦斯威尔的留声机
		BOOMERANG = "空气动力学！",		--物品名：回旋镖
		PIGGUARD = "他看起来不那么友善。",		--物品名：猪人守卫
		ABIGAIL =
		{
            LEVEL1 =
            {
                "噢，她有一个可爱的小蝴蝶结。",		--物品名：阿比盖尔 检查状态：第一阶段 / 第1条台词变体
                "噢，她有一个可爱的小蝴蝶结。",		--物品名：阿比盖尔 检查状态：第一阶段 / 第2条台词变体
            },
            LEVEL2 =
            {
                "噢，她有一个可爱的小蝴蝶结。",		--物品名：阿比盖尔 检查状态：第二阶段 / 第1条台词变体
                "噢，她有一个可爱的小蝴蝶结。",		--物品名：阿比盖尔 检查状态：第二阶段 / 第2条台词变体
            },
            LEVEL3 =
            {
                "噢，她有一个可爱的小蝴蝶结。",		--物品名：阿比盖尔 检查状态：第三阶段 / 第1条台词变体
                "噢，她有一个可爱的小蝴蝶结。",		--物品名：阿比盖尔 检查状态：第三阶段 / 第2条台词变体
            },
        },

		ADVENTURE_PORTAL = "我不想再一次上当了。",		--物品名：麦斯威尔之门
		AMULET = "戴着它我感觉很安全。",		--物品名：重生护符
		ANIMAL_TRACK = "食物留下的踪迹。我指的是...一只动物。",		--物品名：动物足迹
		ARMORGRASS = "希望里面没虫子。",		--物品名：草甲
		ARMORMARBLE = "那看起来真的很沉。",		--物品名：大理石甲
		ARMORWOOD = "那是一件非常合适的衣服。",		--物品名：木甲
		ARMOR_SANITY = "穿着我虽然安全了，心里确不踏实。",		--物品名：暗夜甲
		ASH =
		{
			GENERIC = "火烧完之后剩下的一切。",		--物品名：灰烬 检查状态：普通状态
			REMAINS_GLOMMERFLOWER = "传送时，花被火焰吞噬了！",		--物品名：灰烬 检查状态：格罗姆花烧毁后留下的灰烬
			REMAINS_EYE_BONE = "传送时，眼骨被火焰吞噬了！",		--物品名：灰烬 检查状态：眼骨烧毁后留下的灰烬
			REMAINS_THINGIE = "这肯定有个完美的科学解释。",		--物品名：灰烬 检查状态：传送机零件烧毁后留下的灰烬
		},
		AXE = "可靠的斧头。",		--物品名：斧头
		BABYBEEFALO =
		{
			GENERIC = "啊。太可爱了！",		--物品名：小皮弗娄牛 检查状态：普通状态
		    SLEEPING = "做个好梦，臭家伙。",		--物品名：小皮弗娄牛 检查状态：正在睡眠
        },
        BUNDLE = "我们的物资都在那里面！",		--物品名：捆绑物资
        BUNDLEWRAP = "把东西打包起来应该会容易搬一点。",		--物品名：捆绑包装
		BACKPACK = "你可以在那里面装进许多科学。",		--物品名：背包
		BACONEGGS = "适合科学家的完美早餐。",		--物品名：培根煎蛋
		BANDAGE = "似乎挺卫生的。",		--物品名：蜂蜜药膏
		BASALT = "太硬了，敲不碎！", 		--物品名：玄武岩
		BEARDHAIR = "当它们不是你自己的时候才会恶心。",		--物品名：胡须
		BEARGER = "熊一样大的獾。",		--物品名：熊獾
		BEARGERVEST = "欢迎来到冬眠站！",		--物品名：熊皮背心
		ICEPACK = "毛皮使包内有保温效果。",		--物品名：保鲜背包
		BEARGER_FUR = "一块厚毛皮。",		--物品名：熊皮
		BEDROLL_STRAW = "看起来挺舒适，但闻起来一股霉味。",		--物品名：草席卷
		BEEQUEEN = "让那蜂刺离我远点！",		--物品名：蜂王
		BEEQUEENHIVE =
		{
			GENERIC = "太黏了，没法走下去了。",		--物品名：小块蜂蜜 检查状态：普通状态
			GROWING = "那东西以前在那里吗？",		--物品名：小块蜂蜜 检查状态：正在生长
		},
        BEEQUEENHIVEGROWN = "不科学啊，它是怎么长到这么大的？！",		--物品名：巨大蜂窝
        BEEGUARD = "它正在守卫女王。",		--物品名：嗡嗡蜜蜂
        HIVEHAT = "当我戴上它时，这世界似乎少一点疯狂了。",		--物品名：蜂王冠
        MINISIGN =
        {
            GENERIC = "我可以画得比那好！",		--物品名：小木牌 检查状态：普通状态
            UNDRAWN = "我们应该在那上面画些东西。",		--物品名：小木牌 检查状态：尚未绘制图案
        },
        MINISIGN_ITEM = "像这样没有太多用处。我们应该把它放下。",		--物品名：小木牌
		BEE =
		{
			GENERIC = "嗡嗡嗡，嗡嗡嗡。",		--物品名：蜜蜂 检查状态：普通状态
			HELD = "当心！",		--物品名：蜜蜂 检查状态：正被角色携带
		},
		BEEBOX =
		{
			READY = "它里面装满了蜂蜜。",		--物品名：蜂箱 检查状态：已经准备就绪
			FULLHONEY = "它里面装满了蜂蜜。",		--物品名：蜂箱 检查状态：蜂蜜储量已满
			GENERIC = "蜜蜂！",		--物品名：蜂箱 检查状态：普通状态
			NOHONEY = "它是空的。",		--物品名：蜂箱 检查状态：没有蜂蜜
			SOMEHONEY = "需要等一会。",		--物品名：蜂箱 检查状态：存有少量蜂蜜
			BURNT = "怎么被烧掉的？！！",		--物品名：蜂箱 检查状态：已经烧毁
		},
		MUSHROOM_FARM =
		{
			STUFFED = "那真是许许多多的蘑菇！",		--物品名：蘑菇农场 检查状态：种植槽已塞满材料
			LOTS = "木头上长满了蘑菇。",		--物品名：蘑菇农场 检查状态：内容数量很多
			SOME = "现在它应该继续生长。",		--物品名：蘑菇农场 检查状态：内容数量较少
			EMPTY = "它可以使用一个孢子。或是一个蘑菇移植植物。",		--物品名：蘑菇农场 检查状态：内容为空
			ROTTEN = "木头死亡了。我们应该用一个活的来替换它。",		--物品名：蘑菇农场 检查状态：已经腐烂
			BURNT = "科学的力量催生了它。",		--物品名：蘑菇农场 检查状态：已经烧毁
			SNOWCOVERED = "我认为它在这种寒冷的天气里没办法生长。",		--物品名：蘑菇农场 检查状态：被积雪覆盖
		},
		BEEFALO =
		{
			FOLLOWER = "他在静静地跟着我。",		--物品名：皮弗娄牛 检查状态：已经成为当前角色的跟随者
			GENERIC = "是皮弗娄牛！",		--物品名：皮弗娄牛 检查状态：普通状态
			NAKED = "呃，他很伤心。",		--物品名：皮弗娄牛 检查状态：皮毛已经被剃掉
			SLEEPING = "这些家伙睡得真死。",		--物品名：皮弗娄牛 检查状态：正在睡眠
            DOMESTICATED = "这个没其他的那么臭。",		--物品名：皮弗娄牛 检查状态：已经完全驯化
            ORNERY = "它看起来非常生气。",		--物品名：皮弗娄牛 检查状态：战斗倾向已驯化
            RIDER = "这家伙看起来挺好骑的。",		--物品名：皮弗娄牛 检查状态：骑乘倾向较高
            PUDGY = "嗯，它可能吃太多东西了。",		--物品名：皮弗娄牛 检查状态：肥胖倾向已驯化
            MYPARTNER = "我们永远都是朋友。",		--物品名：皮弗娄牛 检查状态：是当前角色绑定的牛伙伴
            DEAD = "它很坚强。",		--物品名：皮弗娄牛 检查状态：已经死亡
            DEAD_MYPARTNER = "希望我们能重逢。",		--物品名：皮弗娄牛 检查状态：已死亡，且曾是当前角色的伙伴
		},

		BEEFALOHAT = "可以预见，我的发型要被帽子毁了。",		--物品名：牛角帽
		BEEFALOWOOL = "闻起来像皮弗娄牛的眼泪。",		--物品名：牛毛
		BEEHAT = "保护你的皮肤，但会压坏你精心设计的发型。",		--物品名：养蜂帽
        BEESWAX = "科学证明蜂蜡可以防腐！",		--物品名：蜂蜡
		BEEHIVE = "蜜蜂嗡嗡忙不停。",		--物品名：蜂窝
		BEEMINE = "它晃动时就会嗡嗡叫。",		--物品名：蜜蜂地雷
		BEEMINE_MAXWELL = "被装在地雷里的狂暴蚊子！",		--物品名：麦斯威尔的蚊子陷阱
		BERRIES = "红色浆果最好吃。",		--物品名：浆果
		BERRIES_COOKED = "我认为加热并没有让它们变得更好。",		--物品名：烤浆果
        BERRIES_JUICY = "非常美味，虽然美味稍纵即逝。",		--物品名：多汁浆果
        BERRIES_JUICY_COOKED = "最好在变质前吃掉！",		--物品名：烤多汁浆果
		BERRYBUSH =
		{
			BARREN = "我想它需要施肥。",		--物品名：浆果丛 检查状态：资源枯竭，需要施肥
			WITHERED = "这么热的天气什么也生长不了。",		--物品名：浆果丛 检查状态：已经枯萎
			GENERIC = "我觉得这些应该能吃。",		--物品名：浆果丛 检查状态：普通状态
			PICKED = "或许它们会再长出来？",		--物品名：浆果丛 检查状态：已经采集
			DISEASED = "看上去病的很重。",		--物品名：浆果丛 检查状态：已经患病
			DISEASING = "呃...有些地方不对劲。",		--物品名：浆果丛 检查状态：正在进入患病阶段
			BURNING = "它大部分都着火了。",		--物品名：浆果丛 检查状态：正在燃烧
		},
		BERRYBUSH_JUICY =
		{
			BARREN = "在这种状态下，它长不出浆果。",		--物品名：多汁浆果丛 检查状态：资源枯竭，需要施肥
			WITHERED = "高温将多汁的浆果脱水！",		--物品名：多汁浆果丛 检查状态：已经枯萎
			GENERIC = "我应该把他们留到吃饭时间。",		--物品名：多汁浆果丛 检查状态：普通状态
			PICKED = "下一批丛林在努力生长。",		--物品名：多汁浆果丛 检查状态：已经采集
			DISEASED = "它看上去很不舒服。",		--物品名：多汁浆果丛 检查状态：已经患病
			DISEASING = "呃...有些地方不对劲。",		--物品名：多汁浆果丛 检查状态：正在进入患病阶段
			BURNING = "它大部分都着火了。",		--物品名：多汁浆果丛 检查状态：正在燃烧
		},
		BIGFOOT = "那真是一只巨大无比的脚。",		--物品名：大脚怪
		BIRDCAGE =
		{
			GENERIC = "现在只需要一只鸟。",		--物品名：鸟笼 检查状态：普通状态
			OCCUPIED = "谁是好鸟？",		--物品名：鸟笼 检查状态：当前已有使用者或内容物
			SLEEPING = "哇哦，他睡着了。",		--物品名：鸟笼 检查状态：正在睡眠
			HUNGRY = "它看起来有点饿。",		--物品名：鸟笼 检查状态：处于饥饿状态
			STARVING = "好久都没人喂食了吧？",		--物品名：鸟笼 检查状态：极度饥饿
			DEAD = "也许它只是在休息？",		--物品名：鸟笼 检查状态：已经死亡
			SKELETON = "那只鸟肯定死了。",		--物品名：鸟笼 检查状态：鸟笼中只剩骨架
		},
		BIRDTRAP = "蛛网带来的收益！",		--物品名：捕鸟陷阱
		CAVE_BANANA_BURNT = "不是我的错！",		--物品名：烧焦的洞穴香蕉树
		BIRD_EGG = "一颗正常的、小小的鸟蛋。",		--物品名：鸟蛋
		BIRD_EGG_COOKED = "真好吃！",		--物品名：熟鸟蛋
		BISHOP = "退后，传教士！",		--物品名：发条主教
		BLOWDART_FIRE = "这东西似乎根本不安全。",		--物品名：火焰吹箭
		BLOWDART_SLEEP = "不要倒吸进去。",		--物品名：催眠吹箭
		BLOWDART_PIPE = "我可以好好练习怎么吹生日蜡烛！",		--物品名：吹箭
		BLOWDART_YELLOW = "它的准确性令人震惊。",		--物品名：雷电吹箭
		BLUEAMULET = "像冰一样冷！",		--物品名：寒冰护符
		BLUEGEM = "它散发着冰冷能量的光芒。",		--物品名：蓝宝石
		BLUEPRINT =
		{
            COMMON = "科学啊！",		--物品名：蓝图 检查状态：普通品质
            RARE = "太科学了！",		--物品名：蓝图 检查状态：稀有品质
        },
        SKETCH = "一张雕像的图片。要找个地方才能做出来。",		--物品名：{item}草图
		COOKINGRECIPECARD =
		{
			GENERIC = "科学帮帮我吧，我实在破译不了这些笔迹。",		--物品名：{item}食谱卡 检查状态：普通状态
		},
		BLUE_CAP = "它很古怪，还黏黏的。",		--物品名：采摘的蓝蘑菇
		BLUE_CAP_COOKED = "这回不一样了……",		--物品名：熟蓝蘑菇
		BLUE_MUSHROOM =
		{
			GENERIC = "是蘑菇。",		--物品名：蓝蘑菇 检查状态：普通状态
			INGROUND = "它在睡觉。",		--物品名：蓝蘑菇 检查状态：仍埋在地下
			PICKED = "不知道它会不会长回来？",		--物品名：蓝蘑菇 检查状态：已经采集
		},
		BOARDS = "木板。",		--物品名：木板
		BONESHARD = "一小片骨头。",		--物品名：骨头碎片
		BONESTEW = "能让我的骨头上长点肉的炖菜。",		--物品名：炖肉汤
		BUGNET = "抓虫子用的。",		--物品名：捕虫网
		BUSHHAT = "看着有点扎人。",		--物品名：灌木丛帽
		BUTTER = "我无法相信这是黄油！",		--物品名：黄油
		BUTTERFLY =
		{
			GENERIC = "蝴蝶，扑扑翅膀飞走了。",		--物品名：蝴蝶 检查状态：普通状态
			HELD = "总算抓到你了！",		--物品名：蝴蝶 检查状态：正被角色携带
		},
		BUTTERFLYMUFFIN = "我们扔掉了食谱，即兴发挥了一下。",		--物品名：蝴蝶松饼
		BUTTERFLYWINGS = "没了这些，它只是条毛虫。",		--物品名：蝴蝶翅膀
		BUZZARD = "多么丑怪的一只秃鹫！",		--物品名：秃鹫

		SHADOWDIGGER = "哦，挺好的。现在不止他一个了。",		--物品名：暗影挖掘者
        SHADOWDANCER = "有些东西你看到后就想赶紧忘掉……",		--物品名：暗影舞者

		CACTUS =
		{
			GENERIC = "虽然有刺，但很美味。",		--物品名：仙人掌 检查状态：普通状态
			PICKED = "干瘪了，但还是很多刺。",		--物品名：仙人掌 检查状态：已经采集
		},
		CACTUS_MEAT_COOKED = "来自沙漠的烤水果。",		--物品名：熟仙人掌肉
		CACTUS_MEAT = "要想把它变成一顿美味，还需要把上面的刺弄掉。",		--物品名：仙人掌肉
		CACTUS_FLOWER = "多刺植物开出的美丽花朵。",		--物品名：仙人掌花

		COLDFIRE =
		{
			EMBERS = "得给那火加油了，或者就要灭了。",		--物品名：吸热营火 检查状态：只剩余烬
			GENERIC = "肯定能驱走黑暗。",		--物品名：吸热营火 检查状态：普通状态
			HIGH = "火要失控了！",		--物品名：吸热营火 检查状态：高等级或高储量状态
			LOW = "火变得有点小了。",		--物品名：吸热营火 检查状态：低等级或低储量状态
			NORMAL = "真舒服。",		--物品名：吸热营火 检查状态：普通形态
			OUT = "哦，火灭了。",		--物品名：吸热营火 检查状态：火焰已经熄灭
		},
		CAMPFIRE =
		{
			EMBERS = "得加燃料了，不然火就要灭了。",		--物品名：营火 检查状态：只剩余烬
			GENERIC = "肯定能驱走黑暗。",		--物品名：营火 检查状态：普通状态
			HIGH = "火要失控了！",		--物品名：营火 检查状态：高等级或高储量状态
			LOW = "火变得有点小了。",		--物品名：营火 检查状态：低等级或低储量状态
			NORMAL = "真舒服。",		--物品名：营火 检查状态：普通形态
			OUT = "哦，火灭了。",		--物品名：营火 检查状态：火焰已经熄灭
		},
		CANE = "从技术上讲，走路就是有控制的跌倒。",		--物品名：步行手杖
		CATCOON = "顽皮的小东西。",		--物品名：浣猫
		CATCOONDEN =
		{
			GENERIC = "树桩里的窝。",		--物品名：空心树桩 检查状态：普通状态
			EMPTY = "它的主人没命了。",		--物品名：空心树桩 检查状态：内容为空
		},
		CATCOONHAT = "遮住耳朵的帽子！",		--物品名：猫帽
		COONTAIL = "我觉得它还在摆动。",		--物品名：猫尾
		CARROT = "真恶心，这棵蔬菜是从土里出来的。",		--物品名：胡萝卜
		CARROT_COOKED = "软塌塌的。",		--物品名：烤胡萝卜
		CARROT_PLANTED = "土地在创造植物宝宝。",		--物品名：胡萝卜
		CARROT_SEEDS = "这是一颗种子。",		--物品名：椭圆形种子
		CARTOGRAPHYDESK =
		{
			GENERIC = "现在我可以让大家伙看看我找到什么了！",		--物品名：制图桌 检查状态：普通状态
			BURNING = "那件事到此为止。",		--物品名：制图桌 检查状态：正在燃烧
			BURNT = "现在就只有灰烬了。",		--物品名：制图桌 检查状态：已经烧毁
		},
		WATERMELON_SEEDS = "这是一颗种子。",		--物品名：方形种子
		CAVE_FERN = "它是一种蕨类植物。",		--物品名：蕨类植物
		CHARCOAL = "又小又黑，闻起来像烧焦的木头。",		--物品名：木炭
        CHESSPIECE_PAWN = "我有同感。",		--物品名：卒子雕塑
        CHESSPIECE_ROOK =
        {
            GENERIC = "它比看上去的更重。",		--物品名：战车雕塑 检查状态：普通状态
            STRUGGLE = "棋子们自己在动！",		--物品名：战车雕塑 检查状态：雕塑正在挣扎活动
        },
        CHESSPIECE_KNIGHT =
        {
            GENERIC = "它是匹马，当然。",		--物品名：骑士雕塑 检查状态：普通状态
            STRUGGLE = "棋子们自己在动！",		--物品名：骑士雕塑 检查状态：雕塑正在挣扎活动
        },
        CHESSPIECE_BISHOP =
        {
            GENERIC = "是个石头主教。",		--物品名：主教雕塑 检查状态：普通状态
            STRUGGLE = "棋子们自己在动！",		--物品名：主教雕塑 检查状态：雕塑正在挣扎活动
        },
        CHESSPIECE_MUSE = "嗯...看起来很熟悉。",		--物品名：女王雕塑
        CHESSPIECE_FORMAL = "对我来说，看起来没有非常“高贵”。",		--物品名：国王雕塑
        CHESSPIECE_HORNUCOPIA = "仅仅看着它就让我的肚子咕噜叫了。",		--物品名：丰饶角雕塑
        CHESSPIECE_PIPE = "那从来不是我的菜。",		--物品名：泡泡烟斗雕塑
        CHESSPIECE_DEERCLOPS = "感觉它的目光在跟着你。",		--物品名：独眼巨鹿雕塑
        CHESSPIECE_BEARGER = "靠近后它大得多了。",		--物品名：熊獾雕塑
        CHESSPIECE_MOOSEGOOSE =
        {
            "呃。这太逼真了。",		--物品名：麋鹿鹅雕塑 检查状态：第1条台词变体
        },
        CHESSPIECE_DRAGONFLY = "啊，这让我想起一些事情。不好的记忆。",		--物品名：龙蝇雕塑
		CHESSPIECE_MINOTAUR = "现在轮到你被吓得一动不动了！",		--物品名：远古守护者雕塑
        CHESSPIECE_BUTTERFLY = "看着挺美的，对吧？",		--物品名：月蛾雕塑
        CHESSPIECE_ANCHOR = "果然和看上去一样沉。",		--物品名：锚雕塑
        CHESSPIECE_MOON = "最近我感到备受启发。",		--物品名：“月亮” 雕塑
        CHESSPIECE_CARRAT = "有人胜出了！",		--物品名：胡萝卜鼠雕塑
        CHESSPIECE_MALBATROSS = "它不追着杀你的时候还是挺可爱的。",		--物品名：邪天翁雕塑
        CHESSPIECE_CRABKING = "看着不如麦斯威尔脾气大。",		--物品名：帝王蟹雕塑
        CHESSPIECE_TOADSTOOL = "不能拿来当板凳坐，对吧？",		--物品名：毒菌蟾蜍雕塑
        CHESSPIECE_STALKER = "一动不动的骨架。",		--物品名：远古织影者雕塑
        CHESSPIECE_KLAUS = "我能召唤出“非节日装饰版”的克劳斯吗？",		--物品名：克劳斯雕塑
        CHESSPIECE_BEEQUEEN = "很有雕塑感。",		--物品名：蜂王雕塑
        CHESSPIECE_ANTLION = "蚁狮雕塑。",		--物品名：蚁狮雕塑
        CHESSPIECE_BEEFALO = "这座雕塑很牛。",		--物品名：皮弗娄牛雕塑
		CHESSPIECE_KITCOON = "这些就很容易找到。",		--物品名：小浣猫雕塑
		CHESSPIECE_CATCOON = "它做抓柱很合适。",		--物品名：浣猫雕塑
        CHESSPIECE_MANRABBIT = "我想抱抱它，但怕石头擦破皮。",		--物品名：兔人雕塑
        CHESSPIECE_GUARDIANPHASE3 = "我更喜欢它这样。",		--物品名：天体英雄雕塑
        CHESSPIECE_EYEOFTERROR = "它冷冰冰地盯着我。",		--物品名：恐怖之眼雕塑
        CHESSPIECE_TWINSOFTERROR = "恐怖之夜里出现了非常不舒服的眼神接触。",		--物品名：双子魔眼雕塑
        CHESSPIECE_DAYWALKER = "谁知道他现在去哪儿了。",		--物品名：梦魇疯猪雕塑
        CHESSPIECE_DAYWALKER2 = "这东西该扔进垃圾堆！",		--物品名：拾荒疯猪雕塑
        CHESSPIECE_DEERCLOPS_MUTATED = "这座雕塑看起来有点刺眼。",		--物品名：晶体独眼巨鹿雕塑
        CHESSPIECE_WARG_MUTATED = "就差口臭了。",		--物品名：附身座狼雕塑
        CHESSPIECE_BEARGER_MUTATED = "不知为什么，它看起来比正版的更暴躁。",		--物品名：装甲熊獾雕塑
        CHESSPIECE_SHARKBOI = "怎么看它都觉得有些鳍跷。",		--物品名：大霜鲨雕塑
        CHESSPIECE_WORMBOSS = "它还是让我心有余悸。",		--物品名：巨大洞穴蠕虫雕塑
        CHESSPIECE_YOTS = "我一般会远离淘金者。",		--物品名：镀金洞穴蠕虫雕塑
        CHESSPIECE_WAGBOSS_ROBOT = "设计精妙，制作堪忧。",		--物品名：战争瓦器人雕塑
        CHESSPIECE_WAGBOSS_LUNAR = "月看月开心。",		--物品名：天体后裔雕塑
        CHESSPIECE_YOTH = "那个骑士马马虎虎。",		--物品名：镀金骑士雕塑
        CHESSPIECE_VAULT_PILLAR_GUARD = "这个个头有点矮。",		--物品名：远古戍卫塔雕塑
        CHESSPIECE_BATBOSS_SHADOW = "That was a draining experience.",		--物品名：暗影蝙蝠首领雕像（测试版暂译）
        CHESSPIECE_ROCKYBOSS_SHADOW = "That lobster went bad.",		--物品名：暗影石虾首领雕像（测试版暂译）
        CHESSPIECE_WORMBOSS_SHADOW = "I'll never worm up to it.",		--物品名：暗影蠕虫首领雕像（测试版暂译）
        CHESSPIECE_CHARLIE_BOSS = "She was definitely up to nothing good.",		--物品名：查理首领雕像（测试版暂译）
        CHESSPIECE_SHROUDEN = "I never want to see that again.",		--物品名：暗影实体雕像（测试版暂译）

        CHESSJUNK1 = "一堆烂发条装置。",		--物品名：损坏的发条装置
        CHESSJUNK2 = "另一堆烂发条装置。",		--物品名：损坏的发条装置
        CHESSJUNK3 = "更多的烂发条装置。",		--物品名：损坏的发条装置
		CHESTER = "一只小短腿的...箱子，先生。",		--物品名：切斯特
		CHESTER_EYEBONE =
		{
			GENERIC = "它在看着我。",		--物品名：眼骨 检查状态：普通状态
			WAITING = "它睡着了。",		--物品名：眼骨 检查状态：正在等待对应跟随生物出现
		},
		COOKEDMANDRAKE = "可怜的小家伙。",		--物品名：熟曼德拉草
		COOKEDMEAT = "碳烤熟透。",		--物品名：熟肉
		COOKEDMONSTERMEAT = "只比生吃的时候好吃一点点。",		--物品名：熟怪物肉
		COOKEDSMALLMEAT = "现在我不必担心会生虫子了！",		--物品名：熟小肉
		COOKPOT =
		{
			COOKING_LONG = "这还需要一点时间。",		--物品名：烹饪锅 检查状态：正在烹饪，剩余时间较长
			COOKING_SHORT = "就快好了！",		--物品名：烹饪锅 检查状态：正在烹饪，即将完成
			DONE = "嗯！可以吃了！",		--物品名：烹饪锅 检查状态：处理已经完成
			EMPTY = "看着都觉得饿。",		--物品名：烹饪锅 检查状态：内容为空
			BURNT = "锅给烧没了。",		--物品名：烹饪锅 检查状态：已经烧毁
		},
		CORN = "高果糖！",		--物品名：玉米
		CORN_COOKED = "做熟了，高果糖！",		--物品名：爆米花
		CORN_SEEDS = "这是一颗种子。",		--物品名：簇状种子
        CANARY =
		{
			GENERIC = "某种科学制成的黄色生物。",		--物品名：金丝雀 检查状态：普通状态
			HELD = "我并没有在压扁你，不是吗？",		--物品名：金丝雀 检查状态：正被角色携带
		},
        CANARY_POISONED = "它可能是好的。",		--物品名：金丝雀（中毒）

		CRITTERLAB = "那里面有什么东西吗？",		--物品名：岩石巢穴
        CRITTER_GLOMLING = "多么富有空气动力学的生物啊！",		--物品名：小格罗姆
        CRITTER_DRAGONLING = "它爬进了我的心里。",		--物品名：小龙蝇
		CRITTER_LAMB = "比起它妈妈，它的粘液少多了。",		--物品名：小钢羊
        CRITTER_PUPPY = "对一只小怪兽来说真是太可爱了！",		--物品名：小座狼
        CRITTER_KITTEN = "你会成为一位很棒的实验室助手。",		--物品名：浣猫崽
        CRITTER_PERDLING = "我的长羽毛的朋友。",		--物品名：小火鸡
		CRITTER_LUNARMOTHLING = "留着她是因为她对飞蛾学有价值。",		--物品名：小蛾子
        CRITTER_BULBIN = "你肯定不会做什么腐坏的事，对吧？",		--物品名：芽葱
        CRITTER_EETS = "两足无毛必为人。",		--物品名：一吃

		CROW =
		{
			GENERIC = "真可怕！",		--物品名：乌鸦 检查状态：普通状态
			HELD = "它在那里不太快乐。",		--物品名：乌鸦 检查状态：正被角色携带
		},
		CUTGRASS = "割下来的草，可用于制作和合成其他东西。",		--物品名：采下的草
		CUTREEDS = "割下的芦苇，可用于合成和消遣。",		--物品名：采下的芦苇
		CUTSTONE = "光滑诱人。",		--物品名：石砖
		DEADLYFEAST = "功效最强的大餐。", 		--物品名：致命盛宴
		DEER =
		{
			GENERIC = "它是不是盯着我？…不，我猜没有。",		--物品名：无眼鹿 检查状态：普通状态
			ANTLER = "多么引人注目的一个鹿角啊！",		--物品名：无眼鹿 检查状态：长有鹿角
		},
        DEER_ANTLER = "掉下来正常吗？",		--物品名：鹿角
        DEER_GEMMED = "它被那头野兽控制着！",		--物品名：无眼鹿
		DEERCLOPS = "它体型真大！！",		--物品名：独眼巨鹿
		DEERCLOPS_EYEBALL = "这真的很恶心。",		--物品名：独眼巨鹿眼球
		EYEBRELLAHAT =	"它会守护佩戴人。",		--物品名：眼球伞
		DEPLETED_GRASS =
		{
			GENERIC = "可能是一丛草。",		--物品名：草 检查状态：普通状态
		},
        GOGGLESHAT = "这对护目镜可真时髦。",		--物品名：时髦的护目镜
        DESERTHAT = "优质护目用具。",		--物品名：沙漠护目镜
        ANTLIONHAT = "这是一项破土而出的科学成就。",		--物品名：刮地皮头盔
		DEVTOOL = "闻起来像培根！",		--物品名：开发工具
		DEVTOOL_NODEV = "我还不够壮，挥不动它。",		--物品名：开发工具（非开发环境）
		DIRTPILE = "这是一堆土...还是？",		--物品名：可疑的土堆
		DIVININGROD =
		{
			COLD = "信号很弱。", 		--物品名：探测杖 检查状态：温度较低
			GENERIC = "它是某种自动引导装置。", 		--物品名：探测杖 检查状态：普通状态
			HOT = "这东西发疯了！", 		--物品名：探测杖 检查状态：温度很高
			WARM = "我在正确的方向上。", 		--物品名：探测杖 检查状态：温度较暖
			WARMER = "肯定很接近了。", 		--物品名：探测杖 检查状态：接近目标，探测温度升高
		},
		DIVININGRODBASE =
		{
			GENERIC = "我想知道它有什么用。", 		--物品名：探测杖底座 检查状态：普通状态
			READY = "看起来它需要一把大钥匙。", 		--物品名：探测杖底座 检查状态：已经准备就绪
			UNLOCKED = "现在机器可以工作了！", 		--物品名：探测杖底座 检查状态：已经解锁
		},
		DIVININGRODSTART = "那根杖子看起来很有用！", 		--物品名：探测杖底座
		DRAGONFLY = "那是一只龙蝇！",		--物品名：龙蝇
		ARMORDRAGONFLY = "热呼呼的盔甲！",		--物品名：鳞甲
		DRAGON_SCALES = "还是热的。",		--物品名：鳞片
		DRAGONFLYCHEST =
		{
			GENERIC = "仅次于保险箱！",		--物品名：龙鳞宝箱 检查状态：普通状态
            UPGRADED_STACKSIZE = "它提供的储存空间可谓是箱中之龙！",		--物品名：龙鳞宝箱 检查状态：已经升级容器堆叠容量
		},
		DRAGONFLYFURNACE =
		{
			HAMMERED = "看起来不太对啊。",		--物品名：龙鳞火炉 检查状态：遭锤击后进入受损状态
			GENERIC = "产生了大量的热量，但亮光却不多。", 		--物品名：龙鳞火炉 检查状态：普通状态
			NORMAL = "它是在朝我眨眼吗？", 		--物品名：龙鳞火炉 检查状态：普通形态
			HIGH = "滚烫！", 		--物品名：龙鳞火炉 检查状态：高等级或高储量状态
		},

        HUTCH = "哈奇蛋戈鱼，P.I.",		--物品名：哈奇
        HUTCH_FISHBOWL =
        {
            GENERIC = "我一直想要拥有一件这样的装备。",		--物品名：星空 检查状态：普通状态
            WAITING = "或许他需要点科学的力量？",		--物品名：星空 检查状态：正在等待对应跟随生物出现
        },
		LAVASPIT =
		{
			HOT = "好烫的口水！",		--物品名：龙蝇唾液 检查状态：温度很高
			COOL = "我喜欢把它叫作“干唾液”。",		--物品名：龙蝇唾液 检查状态：已经冷却
		},
		LAVA_POND = "壮观！",		--物品名：岩浆池
		LAVAE = "太烫了，没办法处理。",		--物品名：岩浆虫
		LAVAE_COCOON = "冷却下来，平静下来。",		--物品名：冷冻虫卵
		LAVAE_PET =
		{
			STARVING = "可怜的东西一定很饿。",		--物品名：超级可爱岩浆虫 检查状态：极度饥饿
			HUNGRY = "我听到它的小肚子在咕咕叫。",		--物品名：超级可爱岩浆虫 检查状态：处于饥饿状态
			CONTENT = "它似乎很快乐。",		--物品名：超级可爱岩浆虫 检查状态：宠物状态满足
			GENERIC = "啊。谁是好怪物？",		--物品名：超级可爱岩浆虫 检查状态：普通状态
		},
		LAVAE_EGG =
		{
			GENERIC = "里面传来微弱的暖意。",		--物品名：岩浆虫卵 检查状态：普通状态
		},
		LAVAE_EGG_CRACKED =
		{
			COLD = "我觉得蛋不够热。",		--物品名：岩浆虫卵 检查状态：温度较低
			COMFY = "我从未想过我会见到一只高兴的蛋。",		--物品名：岩浆虫卵 检查状态：温度舒适
		},
		LAVAE_TOOTH = "一颗蛋牙！",		--物品名：岩浆虫尖牙

		DRAGONFRUIT = "好奇怪的水果。",		--物品名：火龙果
		DRAGONFRUIT_COOKED = "这水果还是很怪。",		--物品名：熟火龙果
		DRAGONFRUIT_SEEDS = "这是一颗种子。",		--物品名：球茎状种子
		DRAGONPIE = "那个火龙果非常耐饱。",		--物品名：火龙果派
		DRUMSTICK = "准备好狼吞虎咽了。",		--物品名：鸟腿
		DRUMSTICK_COOKED = "狼吞虎咽还更好！",		--物品名：炸鸟腿
		DUG_BERRYBUSH = "现在可以把它带到任何地方了。",		--物品名：浆果丛
		DUG_BERRYBUSH_JUICY = "这树可移植到家附近。",		--物品名：多汁浆果丛
		DUG_GRASS = "如今在哪里都可以种这种植物。",		--物品名：草丛
		DUG_MARSH_BUSH = "这需要种植。",		--物品名：尖刺灌木
		DUG_SAPLING = "这需要种植。",		--物品名：树苗
		DURIAN = "呃，真臭！",		--物品名：榴莲
		DURIAN_COOKED = "现在它闻起来更臭了！",		--物品名：超臭榴莲
		DURIAN_SEEDS = "这是一颗种子。",		--物品名：脆籽荚
		EARMUFFSHAT = "温暖你内外。",		--物品名：兔耳罩
		EGGPLANT = "它看起来不像一颗蛋。",		--物品名：茄子
		EGGPLANT_COOKED = "现在的它更不像蛋了。",		--物品名：烤茄子
		EGGPLANT_SEEDS = "这是一颗种子。",		--物品名：漩涡种子

		ENDTABLE =
		{
			BURNT = "一个放在烧焦的桌子上的烧焦的花瓶。",		--物品名：茶几 检查状态：已经烧毁
			GENERIC = "桌上花瓶里的一朵花。",		--物品名：茶几 检查状态：普通状态
			EMPTY = "我应该把一些东西放进那里。",		--物品名：茶几 检查状态：内容为空
			WILTED = "看起来不太新鲜。",		--物品名：茶几 检查状态：花朵已经枯萎
			FRESHLIGHT = "有一点亮光真是好。",		--物品名：茶几 检查状态：插着新鲜发光花朵
			OLDLIGHT = "我们没忘记拿新灯泡吧？", 		--物品名：茶几 检查状态：插着已经枯萎的发光花朵
		},
		DECIDUOUSTREE =
		{
			BURNING = "真是浪费木材。",		--物品名：桦栗树 检查状态：正在燃烧
			BURNT = "我觉得我本可以阻止这种事情发生的。",		--物品名：桦栗树 检查状态：已经烧毁
			CHOPPED = "接招吧，大自然！",		--物品名：桦栗树 检查状态：已经砍伐
			POISON = "看来偷桦栗果惹火了它！",		--物品名：桦栗树 检查状态：桦栗树进入毒化敌对状态
			GENERIC = "满是阔叶。大部分时候是这样的。",		--物品名：桦栗树 检查状态：普通状态
		},
		ACORN = "里边绝对有东西。",		--物品名：桦栗果
        ACORN_SAPLING = "它很快将长成一棵树！",		--物品名：桦栗树树苗
		ACORN_COOKED = "烤得很完美。",		--物品名：烤桦栗果
		BIRCHNUTDRAKE = "疯狂的小坚果。",		--物品名：桦栗果精
		EVERGREEN =
		{
			BURNING = "真是浪费木材。",		--物品名：常青树 检查状态：正在燃烧
			BURNT = "我觉得我本可以阻止这种事情发生的。",		--物品名：常青树 检查状态：已经烧毁
			CHOPPED = "接招吧，大自然！",		--物品名：常青树 检查状态：已经砍伐
			GENERIC = "满是松针。",		--物品名：常青树 检查状态：普通状态
		},
		EVERGREEN_SPARSE =
		{
			BURNING = "真是浪费木材。",		--物品名：臃肿常青树 检查状态：正在燃烧
			BURNT = "我觉得我本可以阻止这种事情发生的。",		--物品名：臃肿常青树 检查状态：已经烧毁
			CHOPPED = "接招吧，大自然！",		--物品名：臃肿常青树 检查状态：已经砍伐
			GENERIC = "这棵悲催的树没有球果。",		--物品名：臃肿常青树 检查状态：普通状态
		},
		TWIGGYTREE =
		{
			BURNING = "真是浪费木材。",		--物品名：多枝树 检查状态：正在燃烧
			BURNT = "我觉得我本可以阻止这种事情发生的。",		--物品名：多枝树 检查状态：已经烧毁
			CHOPPED = "接招吧，大自然！",		--物品名：多枝树 检查状态：已经砍伐
			GENERIC = "满是树枝。",		--物品名：多枝树 检查状态：普通状态
			DISEASED = "它看起来很糟糕。比平常还严重。", 		--物品名：多枝树 检查状态：已经患病
		},
		TWIGGY_NUT_SAPLING = "它生长不需要任何助力。",		--物品名：多枝树苗
        TWIGGY_OLD = "那棵树看起来很弱。",		--物品名：老枝桠树
		TWIGGY_NUT = "它里面有一棵想要出去的多枝树。",		--物品名：多枝树种
		EYEPLANT = "我觉得有人在看着我。",		--物品名：眼球草
		INSPECTSELF = "我没缺胳膊少腿吧？",		--物品名：角色自身
		FARMPLOT =
		{
			GENERIC = "我应该试着种一些庄稼。",		--物品名：农场田地 检查状态：普通状态
			GROWING = "长啊，植物，长啊！",		--物品名：农场田地 检查状态：正在生长
			NEEDSFERTILIZER = "应该需要施肥。",		--物品名：农场田地 检查状态：土地需要施肥
			BURNT = "灰烬中长不出庄稼。",		--物品名：农场田地 检查状态：已经烧毁
		},
		FEATHERHAT = "变成鸟！",		--物品名：羽毛帽
		FEATHER_CROW = "黑鸟的羽毛。",		--物品名：黑色羽毛
		FEATHER_ROBIN = "红雀的羽毛。",		--物品名：红色羽毛
		FEATHER_ROBIN_WINTER = "雪雀的羽毛。",		--物品名：蓝色羽毛
		FEATHER_CANARY = "金丝雀的羽毛。",		--物品名：黄色羽毛
		FEATHERPENCIL = "有根羽毛写出来的字都科学了。",		--物品名：羽毛笔
        COOKBOOK = "我对知识的饥饿感从未停止过。",		--物品名：烹饪指南
		FEM_PUPPET = "她被困住了！", 		--物品名：女性角色傀儡
		FIREFLIES =
		{
			GENERIC = "要是我能抓住它们就好了！",		--物品名：萤火虫 检查状态：普通状态
			HELD = "它们让我的口袋发光！",		--物品名：萤火虫 检查状态：正被角色携带
		},
		FIREHOUND = "那东西在发红光。",		--物品名：火焰猎犬
		FIREPIT =
		{
			EMBERS = "在火熄灭之前我得加点燃料。",		--物品名：火坑 检查状态：只剩余烬
			GENERIC = "肯定能驱走黑暗。",		--物品名：火坑 检查状态：普通状态
			HIGH = "好在火被围起来了！",		--物品名：火坑 检查状态：高等级或高储量状态
			LOW = "火变得有点小了。",		--物品名：火坑 检查状态：低等级或低储量状态
			NORMAL = "真舒服。",		--物品名：火坑 检查状态：普通形态
			OUT = "至少我能让它再烧起来。",		--物品名：火坑 检查状态：火焰已经熄灭
		},
		COLDFIREPIT =
		{
			EMBERS = "在火熄灭之前我得加点燃料。",		--物品名：吸热火坑 检查状态：只剩余烬
			GENERIC = "肯定能驱走黑暗。",		--物品名：吸热火坑 检查状态：普通状态
			HIGH = "好在火被围起来了！",		--物品名：吸热火坑 检查状态：高等级或高储量状态
			LOW = "火变得有点小了。",		--物品名：吸热火坑 检查状态：低等级或低储量状态
			NORMAL = "真舒服。",		--物品名：吸热火坑 检查状态：普通形态
			OUT = "至少我能让它再烧起来。",		--物品名：吸热火坑 检查状态：火焰已经熄灭
		},
		FIRESTAFF = "我不想点着整个世界。",		--物品名：火魔杖
		FIRESUPPRESSOR =
		{
			ON = "开始灭火！",		--物品名：雪球发射器 检查状态：处于开启状态
			OFF = "一切都平息了。",		--物品名：雪球发射器 检查状态：处于关闭状态
			LOWFUEL = "燃料有点不足了。",		--物品名：雪球发射器 检查状态：燃料即将耗尽
		},

		FISH = "我现在要吃上一整天。",		--物品名：鱼
		FISHINGROD = "钩子、鱼线和棍子！",		--物品名：淡水钓竿
		FISHSTICKS = "这可以填饱肚子。",		--物品名：炸鱼排
		FISHTACOS = "松脆而美味！",		--物品名：鱼肉玉米卷
		FISH_COOKED = "烤得恰到好处。",		--物品名：熟鱼
		FLINT = "非常尖的石头。",		--物品名：燧石
		FLOWER =
		{
            GENERIC = "很漂亮，但闻起来一股汗臭。",		--物品名：花 检查状态：普通状态
            ROSE = "衬托我红润的脸颊。",		--物品名：花 检查状态：玫瑰花变体
        },
        FLOWER_WITHERED = "我觉得它还没晒够太阳呢。",		--物品名：枯萎的花
		FLOWERHAT = "闻起来就很美。",		--物品名：花环
		FLOWER_EVIL = "啊！竟如此邪恶！",		--物品名：邪恶花
		FOLIAGE = "一些多叶植物。",		--物品名：蕨叶
		FOOTBALLHAT = "我不喜欢运动。",		--物品名：橄榄球头盔
        FOSSIL_PIECE = "科学的骨头！我们应该把它们一起放回去。",		--物品名：化石碎片
        FOSSIL_STALKER =
        {
			GENERIC = "还有些碎片没找到。",		--物品名：奇异的骨架 检查状态：普通状态
			FUNNY = "我科学方面的直觉告诉我这有点不对。",		--物品名：奇异的骨架 检查状态：化石拼装方式错误
			COMPLETE = "它活着！哦等等，不，它没有。",		--物品名：奇异的骨架 检查状态：已经完整组装
        },
        STALKER = "骨架和暗影融合在一起！",		--物品名：复活的骨架
        STALKER_ATRIUM = "为什么它必须这么大呢？",		--物品名：远古织影者
        STALKER_MINION = "会咬到脚踝！",		--物品名：编织暗影
        THURIBLE = "闻起来像化学试剂。",		--物品名：暗影香炉
        ATRIUM_OVERGROWTH = "这些符号我一个都不认得。",		--物品名：远古方尖碑
		FROG =
		{
			DEAD = "他挂了。",		--物品名：青蛙 检查状态：已经死亡
			GENERIC = "他真可爱！",		--物品名：青蛙 检查状态：普通状态
			SLEEPING = "啊，看他的睡相！",		--物品名：青蛙 检查状态：正在睡眠
		},
		FROGGLEBUNWICH = "美腿三文治。",		--物品名：蛙腿三明治
		FROGLEGS = "我曾听说它是一道美味。",		--物品名：蛙腿
		FROGLEGS_COOKED = "味道像鸡肉。",		--物品名：熟蛙腿
		FRUITMEDLEY = "果香扑鼻。",		--物品名：水果圣代
		FURTUFT = "黑白毛皮。",		--物品名：毛丛
		GEARS = "一堆机械零件。",		--物品名：齿轮
		GHOST = "我是一名科学家，这种东西冒犯了我。",		--物品名：幽灵
		GOLDENAXE = "挺花哨的一把斧头。",		--物品名：黄金斧头
		GOLDENPICKAXE = "金子不是软的吗？",		--物品名：黄金鹤嘴锄
		GOLDENPITCHFORK = "一把叉子我都能做的这么精美？",		--物品名：黄金干草叉
		GOLDENSHOVEL = "我等不及要挖洞了。",		--物品名：黄金铲子
		GOLDNUGGET = "它不能吃，但确实闪闪发光。",		--物品名：金块
		GRASS =
		{
			BARREN = "它需要粪肥。",		--物品名：草 检查状态：资源枯竭，需要施肥
			WITHERED = "天气这么热，它不会长回来。",		--物品名：草 检查状态：已经枯萎
			BURNING = "烧得好快！",		--物品名：草 检查状态：正在燃烧
			GENERIC = "是一丛草。",		--物品名：草 检查状态：普通状态
			PICKED = "它在长得最好的时候被采走了。",		--物品名：草 检查状态：已经采集
			DISEASED = "它看上去很不舒服。", 		--物品名：草 检查状态：已经患病
			DISEASING = "呃...有些地方不对劲。", 		--物品名：草 检查状态：正在进入患病阶段
		},
		GRASSGEKKO =
		{
			GENERIC = "这是一只多叶状蜥蜴。",		--物品名：草壁虎 检查状态：普通状态
			DISEASED = "它看上去真的很不舒服。", 		--物品名：草壁虎 检查状态：已经患病
		},
		GREEN_CAP = "它看起来很正常。",		--物品名：采摘的绿蘑菇
		GREEN_CAP_COOKED = "不同了...",		--物品名：熟绿蘑菇
		GREEN_MUSHROOM =
		{
			GENERIC = "是蘑菇。",		--物品名：绿蘑菇 检查状态：普通状态
			INGROUND = "在睡觉。",		--物品名：绿蘑菇 检查状态：仍埋在地下
			PICKED = "不知道它会不会长回来？",		--物品名：绿蘑菇 检查状态：已经采集
		},
		GUNPOWDER = "看起来像胡椒粉。",		--物品名：火药
		HAMBAT = "这好像不卫生。",		--物品名：火腿棒
		HAMMER = "停下！是时候了！用锤子敲点东西吧！",		--物品名：锤子
		HEALINGSALVE = "有点儿刺痛感就说明它起作用了。",		--物品名：治疗药膏
		HEATROCK =
		{
			FROZEN = "它比冰还冷。",		--物品名：暖石 检查状态：已经冻结
			COLD = "一块冰凉的石头。",		--物品名：暖石 检查状态：温度较低
			GENERIC = "我可以控制它的温度。",		--物品名：暖石 检查状态：普通状态
			WARM = "虽然是块石头，但却相当温暖，让人想抱在怀里！",		--物品名：暖石 检查状态：温度较暖
			HOT = "很热很舒服！",		--物品名：暖石 检查状态：温度很高
		},
		HOME = "一定有人住在这里。",		--物品名：家园目标
		HOMESIGN =
		{
			GENERIC = "上面写着“你在这里”。",		--物品名：木牌 检查状态：普通状态
            UNWRITTEN = "这块牌子现在是空白的。",		--物品名：木牌 检查状态：尚未写入文字
			BURNT = "“不要玩火柴。”",		--物品名：木牌 检查状态：已经烧毁
		},
		ARROWSIGN_POST =
		{
			GENERIC = "它说“那个方向”。",		--物品名：指路木牌 检查状态：普通状态
            UNWRITTEN = "这块牌子现在是空白的。",		--物品名：指路木牌 检查状态：尚未写入文字
			BURNT = "“不要玩火柴。”",		--物品名：指路木牌 检查状态：已经烧毁
		},
		ARROWSIGN_PANEL =
		{
			GENERIC = "它说“那个方向”。",		--物品名：指路木牌 检查状态：普通状态
            UNWRITTEN = "这块牌子现在是空白的。",		--物品名：指路木牌 检查状态：尚未写入文字
			BURNT = "“不要玩火柴。”",		--物品名：指路木牌 检查状态：已经烧毁
		},
		HONEY = "看起来很好吃！",		--物品名：蜂蜜
		HONEYCOMB = "蜜蜂曾住在这里。",		--物品名：蜜脾
		HONEYHAM = "香甜可口。",		--物品名：蜜汁火腿
		HONEYNUGGETS = "味道像鸡肉，但我觉得不是鸡肉。",		--物品名：蜜汁卤肉
		HORN = "听起来好像那里面有一个皮弗娄牛牧场。",		--物品名：牛角
		HOUND = "你啥都不是，你只是条狗！",		--物品名：猎犬
		HOUNDCORPSE =
		{
			GENERIC = "这味道不是我闻过最好闻的。",		--物品名：猎犬尸体 检查状态：普通状态
			BURNING = "我认为我们现在安全了。",		--物品名：猎犬尸体 检查状态：正在燃烧
			REVIVING = "科学，救救我们！",		--物品名：猎犬尸体 检查状态：尸体正在复活
		},
		HOUNDBONE = "吓人。",		--物品名：犬骨
		HOUNDMOUND = "我不想找主人的茬。真的。",		--物品名：猎犬丘
		ICEBOX = "我掌控了寒冷的力量！",		--物品名：冰箱
		ICEHAT = "保持冷静，孩子。",		--物品名：冰帽
		ICEHOUND = "每个季节都有猎犬吗？",		--物品名：寒冰猎犬
		INSANITYROCK =
		{
			ACTIVE = "神志正常的我还是认了吧！",		--物品名：方尖碑 检查状态：正在运作
			INACTIVE = "它更像一座金字塔，而不是方尖碑。",		--物品名：方尖碑 检查状态：当前未激活
		},
		JAMMYPRESERVES = "或许该做个罐子。",		--物品名：果酱

		KABOBS = "串在棍子上的午餐。",		--物品名：肉串
		KILLERBEE =
		{
			GENERIC = "哦，不！杀人蜂！",		--物品名：杀人蜂 检查状态：普通状态
			HELD = "这东西好像很危险。",		--物品名：杀人蜂 检查状态：正被角色携带
		},
		KNIGHT = "看！",		--物品名：发条骑士
		KOALEFANT_SUMMER = "吃起来一定很美味。",		--物品名：考拉象
		KOALEFANT_WINTER = "它看起来又暖和肉又多。",		--物品名：考拉象
		KOALEFANT_CARCASS = "死了都要可爱。",		--物品名：考拉象尸体
		KRAMPUS = "他要偷我的东西！",		--物品名：坎普斯
		KRAMPUS_SACK = "呕...上面全是坎普斯的黏液。",		--物品名：坎普斯背包
		LEIF = "他真巨大！",		--物品名：树精守卫
		LEIF_SPARSE = "他真巨大！",		--物品名：树精守卫
		LIGHTER  = "她的幸运打火机。",		--物品名：薇洛的打火机
		LIGHTNING_ROD =
		{
			CHARGED = "力量在我手中！",		--物品名：避雷针 检查状态：已经充能
			GENERIC = "主宰天堂！",		--物品名：避雷针 检查状态：普通状态
		},
		LIGHTNINGGOAT =
		{
			GENERIC = "咩！",		--物品名：伏特羊 检查状态：普通状态
			CHARGED = "我不认为它喜欢被雷劈。",		--物品名：伏特羊 检查状态：已经充能
		},
		LIGHTNINGGOATHORN = "它像一根迷你避雷针。",		--物品名：伏特羊角
		GOATMILK = "美味，还滋滋作响！",		--物品名：带电的羊奶
		LITTLE_WALRUS = "等他长大了，就不会这么天真可爱了。",		--物品名：小海象
		LIVINGLOG = "它看着有点着急。",		--物品名：活木头
		LOG =
		{
			BURNING = "好烫的木头！",		--物品名：木头 检查状态：正在燃烧
			GENERIC = "又大又重的木头。",		--物品名：木头 检查状态：普通状态
		},
		LUCY = "这斧子比我之前用过的那把还漂亮。",		--物品名：露西斧
		LUREPLANT = "它如此迷人。",		--物品名：食人花
		LUREPLANTBULB = "现在我可以开办我自己的肉农场了。",		--物品名：食人花种子
		MALE_PUPPET = "他被困住了！", 		--物品名：男性角色傀儡

		MANDRAKE_ACTIVE = "切断它！",		--物品名：曼德拉草
		MANDRAKE_PLANTED = "我听说过关于这些植物的一些奇怪传言。",		--物品名：曼德拉草
		MANDRAKE = "曼德拉草根拥有奇怪的属性。",		--物品名：曼德拉草

        MANDRAKESOUP = "唔，它再也不会醒来了。",		--物品名：曼德拉草汤
        MANDRAKE_COOKED = "它看起来没有那么奇怪了。",		--物品名：熟曼德拉草
        MAPSCROLL = "一张空白的地图。看起来没什么用。",		--物品名：地图卷轴
        MARBLE = "高级！",		--物品名：大理石
        MARBLEBEAN = "我拿家里的老牛换的。",		--物品名：大理石豌豆
        MARBLEBEAN_SAPLING = "看起来刻了点什么。",		--物品名：大理石芽
        MARBLESHRUB = "好像有点道理。",		--物品名：大理石灌木
        MARBLEPILLAR = "我想我能用得上它。",		--物品名：大理石柱
        MARBLETREE = "我想斧子可砍不倒它。",		--物品名：大理石树
        MARSH_BUSH =
        {
			BURNT = "少了一片需要担心的荆棘。",		--物品名：尖刺灌木 检查状态：已经烧毁
            BURNING = "烧得好快！",		--物品名：尖刺灌木 检查状态：正在燃烧
            GENERIC = "它看起来很多刺。",		--物品名：尖刺灌木 检查状态：普通状态
            PICKED = "哎哟！",		--物品名：尖刺灌木 检查状态：已经采集
        },
        BURNT_MARSH_BUSH = "被烧得精光。",		--物品名：尖刺灌木
        MARSH_PLANT = "这是一株植物。",		--物品名：植物
        MARSH_TREE =
        {
            BURNING = "尖刺！火！",		--物品名：针刺树 检查状态：正在燃烧
            BURNT = "现在它是一棵被烧焦了的针刺树。",		--物品名：针刺树 检查状态：已经烧毁
            CHOPPED = "现在没那么多刺了！",		--物品名：针刺树 检查状态：已经砍伐
            GENERIC = "那些尖刺看起来很锋利！",		--物品名：针刺树 检查状态：普通状态
        },
        MAXWELL = "我恨那个家伙。",		--物品名：麦斯威尔
        MAXWELLHEAD = "我可以看到他毛孔里面的东西。",		--物品名：麦斯威尔的头
        MAXWELLLIGHT = "我想知道它们是怎么工作的。",		--物品名：麦斯威尔灯
        MAXWELLLOCK = "看起来就像一个钥匙孔。",		--物品名：梦魇锁
        MAXWELLTHRONE = "那个看起来不太舒适。",		--物品名：梦魇王座
        MEAT = "虽然有点腥味，但还凑合。",		--物品名：肉
        MEATBALLS = "它只是一大块肉而已。",		--物品名：肉丸
        MEATRACK =
        {
            DONE = "肉干可以吃了！",		--物品名：晾肉架 检查状态：处理已经完成
            DRYING = "肉风干需要一些时间。",		--物品名：晾肉架 检查状态：肉类正在晾晒
            DRYINGINRAIN = "雨天晾干肉需要更长时间。",		--物品名：晾肉架 检查状态：雨中仍挂着肉类，晾晒暂停
            GENERIC = "我该晾干一些肉。",		--物品名：晾肉架 检查状态：普通状态
            BURNT = "晾肉架烧掉了。",		--物品名：晾肉架 检查状态：已经烧毁
            DONE_NOTMEAT = "实验术语里，我们管它叫“干燥”。",		--物品名：晾肉架 检查状态：非肉类晾晒已经完成
            DRYING_NOTMEAT = "风干可算不上科学。",		--物品名：晾肉架 检查状态：非肉类正在晾晒
            DRYINGINRAIN_NOTMEAT = "雨啊，快走开。想下，改天来。",		--物品名：晾肉架 检查状态：雨中仍挂着非肉类，晾晒暂停
        },
        MEAT_DRIED = "这肉够干的了。",		--物品名：肉干
        MERM = "鱼腥味十足！",		--物品名：鱼人
        MERMHEAD =
        {
            GENERIC = "整天都会闻到，真是臭死了。",		--物品名：鱼人头 检查状态：普通状态
            BURNT = "烧过的鱼人肉闻起来更糟糕了。",		--物品名：鱼人头 检查状态：已经烧毁
        },
        MERMHOUSE =
        {
            GENERIC = "谁会住在这种地方？",		--物品名：漏雨的小屋 检查状态：普通状态
            BURNT = "现在没地住了。",		--物品名：漏雨的小屋 检查状态：已经烧毁
        },
        MINERHAT = "免持照明装置。",		--物品名：矿工帽
        MONKEY = "好奇的小家伙。",		--物品名：穴居猴
        MONKEYBARREL = "那东西刚刚是不是动了？",		--物品名：穴居猴桶
        MONSTERLASAGNA = "这是对科学的冒犯。",		--物品名：怪物千层饼
        FLOWERSALAD = "一碗绿叶子。",		--物品名：花沙拉
        ICECREAM = "我太想吃冰淇淋了！",		--物品名：冰淇淋
        WATERMELONICLE = "冷冻西瓜。",		--物品名：西瓜冰棍
        TRAILMIX = "健康、天然的小点心。",		--物品名：什锦干果
        HOTCHILI = "辣到喷火！",		--物品名：辣椒炖肉
        GUACAMOLE = "阿伏伽德罗最喜欢的菜。",		--物品名：鳄梨酱
        MONSTERMEAT = "呃，我不该吃那个。",		--物品名：怪物肉
        MONSTERMEAT_DRIED = "气味怪怪的肉干。",		--物品名：怪物肉干
        MOOSE = "我不清楚那东西是什么。",		--物品名：麋鹿鹅
        MOOSE_NESTING_GROUND = "它把它的婴儿放在那里。",		--物品名：麋鹿鹅巢址
        MOOSEEGG = "婴儿们就像试图逃逸的受激电子。",		--物品名：麋鹿鹅蛋
        MOSSLING = "啊哈！你肯定不是一个电子！",		--物品名：麋鹿鹅幼崽
        FEATHERFAN = "降温用的。",		--物品名：羽毛扇
        MINIFAN = "不知道怎么回事，风以两倍的速度从后面吹来。",		--物品名：旋转的风扇
        GOOSE_FEATHER = "毛茸茸的！",		--物品名：麋鹿鹅羽毛
        STAFF_TORNADO = "旋转的毁灭之力。",		--物品名：天气风向标
        MOSQUITO =
        {
            GENERIC = "讨厌的小吸血鬼。",		--物品名：蚊子 检查状态：普通状态
            HELD = "嘿，那是我的血吗？",		--物品名：蚊子 检查状态：正被角色携带
        },
        MOSQUITOSACK = "这也许是别人的血...",		--物品名：蚊子血囊
        MOUND =
        {
            DUG = "或许，这是他应得的。",		--物品名：坟墓 检查状态：已经被挖开
            GENERIC = "我敢打赌那下面有各种各样的好东西！",		--物品名：坟墓 检查状态：普通状态
        },
        NIGHTLIGHT = "它发出阴森可怕的光。",		--物品名：暗夜灯
        NIGHTMAREFUEL = "这东西太古怪了！",		--物品名：噩梦燃料
        NIGHTSWORD = "为什么会有人做这个？太可怕了。",		--物品名：暗夜剑
        NITRE = "我不是地质学家。",		--物品名：硝石
        ONEMANBAND = "我们应该加个皮弗娄牛铃铛。",		--物品名：独奏乐器
        OASISLAKE =
		{
			GENERIC = "这是海市蜃楼吗？",		--物品名：湖泊 检查状态：普通状态
			EMPTY = "干的像一块骨头。",		--物品名：湖泊 检查状态：内容为空
		},
        PANDORASCHEST = "里面可能有很好的东西！也可能是可怕的东西。",		--物品名：华丽箱子
        PANFLUTE = "为动物们唱小夜曲。",		--物品名：排箫
        PAPYRUS = "一些纸。",		--物品名：莎草纸
        WAXPAPER = "一些蜡纸。",		--物品名：蜡纸
        PENGUIN = "肯定到繁殖季节了。",		--物品名：企鸥
        PERD = "蠢鸟！离那些浆果远点！",		--物品名：火鸡
        PEROGIES = "这些东西味道相当不错。",		--物品名：波兰水饺
        PETALS = "这下花儿们知道谁才是老大了！",		--物品名：花瓣
        PETALS_EVIL = "我不确定我想拿这些。",		--物品名：深色花瓣
        PHLEGM = "浓稠而软滑。味道咸咸的。",		--物品名：脓鼻涕
        PICKAXE = "很形象，不是吗？",		--物品名：鹤嘴锄
        PIGGYBACK = "小猪回...“家”了。",		--物品名：猪皮包
        PIGHEAD =
        {
            GENERIC = "看起来像是给野兽的供品。",		--物品名：猪头 检查状态：普通状态
            BURNT = "外酥里嫩。",		--物品名：猪头 检查状态：已经烧毁
        },
        PIGHOUSE =
        {
            FULL = "我可以看见有个鼻子贴着窗户。",		--物品名：猪屋 检查状态：内容已满
            GENERIC = "这些猪的房子真不赖。",		--物品名：猪屋 检查状态：普通状态
            LIGHTSOUT = "出来！我知道你在家！",		--物品名：猪屋 检查状态：屋内已经熄灯
            BURNT = "现在没那么舒适了吧，猪！",		--物品名：猪屋 检查状态：已经烧毁
        },
        PIGKING = "他身上好难闻！",		--物品名：猪王
        PIGMAN =
        {
            DEAD = "应该找人通知它的家人。",		--物品名：猪人 检查状态：已经死亡
            FOLLOWER = "你是我的随从之一。",		--物品名：猪人 检查状态：已经成为当前角色的跟随者
            GENERIC = "他们有点吓人。",		--物品名：猪人 检查状态：普通状态
            GUARD = "看起来很严肃。",		--物品名：猪人 检查状态：正在守卫岗位
            WEREPIG = "不是友好的猪！！",		--物品名：猪人 检查状态：猪人处于疯猪形态
        },
        PIGSKIN = "上面还带着尾巴。",		--物品名：猪皮
        PIGTENT = "闻起来像培根。",		--物品名：猪人帐篷
        PIGTORCH = "看上去挺惬意。",		--物品名：猪火炬
        PINECONE = "我可以听见里面有一棵小树，努力想长出来。",		--物品名：松果
        PINECONE_SAPLING = "它很快将长成一棵大树！",		--物品名：常青树苗
        LUMPY_SAPLING = "这棵树是怎么繁殖的？",		--物品名：臃肿树苗
        PITCHFORK = "现在我只需要一群暴民的加入。",		--物品名：干草叉
        PLANTMEAT = "看着不咋样。",		--物品名：叶肉
        PLANTMEAT_COOKED = "至少它现在是热的。",		--物品名：熟叶肉
        PLANT_NORMAL =
        {
            GENERIC = "枝繁叶茂！",		--物品名：农作物 检查状态：普通状态
            GROWING = "唉，长得可真慢！",		--物品名：农作物 检查状态：正在生长
            READY = "嗯。可以采摘了。",		--物品名：农作物 检查状态：已经准备就绪
            WITHERED = "它是热死的。",		--物品名：农作物 检查状态：已经枯萎
        },
        POMEGRANATE = "它看起来就像外星人的大脑。",		--物品名：石榴
        POMEGRANATE_COOKED = "高级料理！",		--物品名：切片熟石榴
        POMEGRANATE_SEEDS = "这是一颗种子。",		--物品名：风刮来的种子
        POND = "我看不到底！",		--物品名：池塘
        POOP = "我应该装满我的口袋！",		--物品名：粪肥
        FERTILIZER = "一桶粪便。",		--物品名：便便桶
        PUMPKIN = "它跟我的头一样大！",		--物品名：南瓜
        PUMPKINCOOKIE = "漂亮的南瓜饼！",		--物品名：南瓜饼干
        PUMPKIN_COOKED = "它为什么没变成馅饼？",		--物品名：烤南瓜
        PUMPKIN_LANTERN = "真可怕！",		--物品名：南瓜灯
        PUMPKIN_SEEDS = "这是一颗种子。",		--物品名：尖种子
        PURPLEAMULET = "它在向我低语。",		--物品名：梦魇护符
        PURPLEGEM = "它包含宇宙的奥秘。",		--物品名：紫宝石
        RABBIT =
        {
            GENERIC = "他在找胡萝卜。",		--物品名：兔子 检查状态：普通状态
            HELD = "你喜欢科学吗？",		--物品名：兔子 检查状态：正被角色携带
        },
        RABBITHOLE =
        {
            GENERIC = "那一定通向兔子王国。",		--物品名：兔洞 检查状态：普通状态
            SPRING = "兔子王国本季封闭。",		--物品名：兔洞 检查状态：春季状态
        },
        RAINOMETER =
        {
            GENERIC = "它能测出是否有雨。",		--物品名：雨量计 检查状态：普通状态
            BURNT = "测量部分化成一缕青烟了。",		--物品名：雨量计 检查状态：已经烧毁
        },
        RAINCOAT = "让雨水待在它应该在的地方。你的身体之外。",		--物品名：雨衣
        RAINHAT = "头发乱了...干燥带来的可怕后果。",		--物品名：雨帽
        RATATOUILLE = "这是良好的纤维原料。",		--物品名：蔬菜杂烩
        RAZOR = "绑在棍子上的磨利的石头。为了个人卫生！",		--物品名：剃刀
        REDGEM = "它闪着温暖的光。",		--物品名：红宝石
        RED_CAP = "闻起来怪怪的。",		--物品名：采摘的红蘑菇
        RED_CAP_COOKED = "现在跟生蘑菇不同了...",		--物品名：熟红蘑菇
        RED_MUSHROOM =
        {
            GENERIC = "是蘑菇。",		--物品名：红蘑菇 检查状态：普通状态
            INGROUND = "它在睡觉。",		--物品名：红蘑菇 检查状态：仍埋在地下
            PICKED = "不知道它会不会长回来？",		--物品名：红蘑菇 检查状态：已经采集
        },
        REEDS =
        {
            BURNING = "烧的真旺！",		--物品名：芦苇 检查状态：正在燃烧
            GENERIC = "一簇芦苇。",		--物品名：芦苇 检查状态：普通状态
            PICKED = "所有有用的芦苇都已采摘下来。",		--物品名：芦苇 检查状态：已经采集
        },
        RELIC = "远古家居用品。",		--物品名：遗物
        RUINS_RUBBLE = "这个可以修复。",		--物品名：破损遗物
        RUBBLE = "只是些碎石块。",		--物品名：碎石
        RESEARCHLAB =
        {
            GENERIC = "它把物品分解成最基本的科学成分。",		--物品名：科学机器 检查状态：普通状态
            BURNT = "现在做不了科学研究了。",		--物品名：科学机器 检查状态：已经烧毁
        },
        RESEARCHLAB2 =
        {
            GENERIC = "它比上一个更科学！",		--物品名：炼金引擎 检查状态：普通状态
            BURNT = "再多的科学也不能使它幸免于难。",		--物品名：炼金引擎 检查状态：已经烧毁
        },
        RESEARCHLAB3 =
        {
            GENERIC = "我创造了什么？",		--物品名：暗影操控器 检查状态：普通状态
            BURNT = "不管它原来是什么，现在已经烧掉了。",		--物品名：暗影操控器 检查状态：已经烧毁
        },
        RESEARCHLAB4 =
        {
            GENERIC = "谁会起个这样的名字？",		--物品名：灵子分解器 检查状态：普通状态
            BURNT = "火并没有真正解决命名问题...",		--物品名：灵子分解器 检查状态：已经烧毁
        },
        RESURRECTIONSTATUE =
        {
            GENERIC = "多么帅气的恶魔啊！",		--物品名：肉块雕像 检查状态：普通状态
            BURNT = "再也没用了。",		--物品名：肉块雕像 检查状态：已经烧毁
        },
        RESURRECTIONSTONE = "摸摸石台总是个好主意。",		--物品名：试金石
        ROBIN =
        {
            GENERIC = "那是否意味着冬季已经结束了？",		--物品名：红雀 检查状态：普通状态
            HELD = "他喜欢我的口袋。",		--物品名：红雀 检查状态：正被角色携带
        },
        ROBIN_WINTER =
        {
            GENERIC = "寒荒之地的生命。",		--物品名：雪雀 检查状态：普通状态
            HELD = "它如此柔软。",		--物品名：雪雀 检查状态：正被角色携带
        },
        ROBOT_PUPPET = "被困住了！", 		--物品名：机器人角色傀儡
        ROCK_LIGHT =
        {
            GENERIC = "裹了石皮的熔岩坑。",		--物品名：熔岩坑 检查状态：普通状态
            OUT = "看起来很易碎。",		--物品名：熔岩坑 检查状态：火焰已经熄灭
            LOW = "那块熔岩正在裹上石皮。",		--物品名：熔岩坑 检查状态：低等级或低储量状态
            NORMAL = "真舒服。",		--物品名：熔岩坑 检查状态：普通形态
        },
        CAVEIN_BOULDER =
        {
            GENERIC = "我觉得我可以举起这个。",		--物品名：岩石 检查状态：普通状态
            RAISED = "太远了够不着。",		--物品名：岩石 检查状态：洞穴落石仍在升起阶段
        },
        ROCK = "我口袋里可装不下它。",		--物品名：岩石
        PETRIFIED_TREE = "看来它被吓僵住了。",		--物品名：石化树
        ROCK_PETRIFIED_TREE = "看起来好可怕。",		--物品名：石化树
        ROCK_PETRIFIED_TREE_OLD = "看起来好可怕。",		--物品名：旧石化树岩块
        ROCK_ICE =
        {
            GENERIC = "见到你很凉快。",		--物品名：迷你冰川 检查状态：普通状态
            MELTED = "在它再次冰冻之前，没什么用处。",		--物品名：迷你冰川 检查状态：已经融化
        },
        ROCK_ICE_MELTED = "在它再次冰冻之前，没什么用处。",		--物品名：融化的迷你冰川
        ICE = "见到你很凉快。",		--物品名：冰
        ROCKS = "我们可以用这些做点东西出来。",		--物品名：石头
        ROOK = "攻占城堡！",		--物品名：发条战车
        ROPE = "一种短绳。",		--物品名：绳子
        ROTTENEGG =
        {
            GENERIC = "呕！臭死了！",		--物品名：腐烂鸟蛋 检查状态：普通状态
            CAN_PROCESS = "我优越的电路会将这个失败的孩子处理为养分",		--物品名：腐烂鸟蛋 检查状态：可放入堆肥设施处理
        },
        ROYAL_JELLY = "它给捕食者灌输了科学的力量！",		--物品名：蜂王浆
        JELLYBEAN = "一部分是果冻，一部分是豌豆。",		--物品名：彩虹糖豆
        SADDLE_BASIC = "有了它就可以骑臭动物了。",		--物品名：鞍具
        SADDLE_RACE = "这鞍具真的在飞！",		--物品名：闪亮鞍具
        SADDLE_WAR = "唯一的问题是会长鞍疮。",		--物品名：战争鞍具
        SADDLEHORN = "这能够卸下鞍具。",		--物品名：鞍角
        SALTLICK = "要舔多久才能到中性？",		--物品名：舔盐块
        BRUSH = "皮弗娄牛肯定很喜欢这个。",		--物品名：刷子
		SANITYROCK =
		{
			ACTIVE = "那石头看起来真疯狂！",		--物品名：方尖碑 检查状态：正在运作
			INACTIVE = "它的其余部分去哪儿了？",		--物品名：方尖碑 检查状态：当前未激活
		},
		SAPLING =
		{
			BURNING = "烧得好快！",		--物品名：树苗 检查状态：正在燃烧
			WITHERED = "如果能给它降降温，也许它能好起来。",		--物品名：树苗 检查状态：已经枯萎
			GENERIC = "小树苗真可爱！",		--物品名：树苗 检查状态：普通状态
			PICKED = "它尝到教训了。",		--物品名：树苗 检查状态：已经采集
			DISEASED = "它看上去很不舒服。", 		--物品名：树苗 检查状态：已经患病
			DISEASING = "呃...有些地方不对劲。", 		--物品名：树苗 检查状态：正在进入患病阶段
		},
   		SCARECROW =
   		{
			GENERIC = "打扮好稻草人就不会有乌鸦了。",		--物品名：友善的稻草人 检查状态：普通状态
			BURNING = "有人让那个稻草人吃乌鸦。",		--物品名：友善的稻草人 检查状态：正在燃烧
			BURNT = "有人谋杀了那个稻草人！",		--物品名：友善的稻草人 检查状态：已经烧毁
   		},
   		SCULPTINGTABLE=
   		{
			EMPTY = "我们可以用这东西来做个石雕。",		--物品名：陶轮 检查状态：内容为空
			BLOCK = "准备雕刻。",		--物品名：陶轮 检查状态：当前雕刻材料为石块
			SCULPTURE = "一个杰作！",		--物品名：陶轮 检查状态：当前正在雕刻塑像
			BURNT = "完全烧焦。",		--物品名：陶轮 检查状态：已经烧毁
   		},
        SCULPTURE_KNIGHTHEAD = "其余部分在哪里？",		--物品名：可疑的大理石
		SCULPTURE_KNIGHTBODY =
		{
			COVERED = "是一个古怪的大理石雕像。",		--物品名：大理石雕像 检查状态：雕塑主体仍被石层覆盖
			UNCOVERED = "我猜他在压力之下崩溃了。",		--物品名：大理石雕像 检查状态：雕塑主体已经露出
			FINISHED = "终于又弄到一起了。",		--物品名：大理石雕像 检查状态：雕塑已经完成
			READY = "里面有东西在动。",		--物品名：大理石雕像 检查状态：已经准备就绪
		},
        SCULPTURE_BISHOPHEAD = "那是一颗头吗？",		--物品名：可疑的大理石
		SCULPTURE_BISHOPBODY =
		{
			COVERED = "看起来很老，但感觉挺新。",		--物品名：大理石雕像 检查状态：雕塑主体仍被石层覆盖
			UNCOVERED = "有一个大的碎片没找到。",		--物品名：大理石雕像 检查状态：雕塑主体已经露出
			FINISHED = "然后呢？",		--物品名：大理石雕像 检查状态：雕塑已经完成
			READY = "里面有东西在动。",		--物品名：大理石雕像 检查状态：已经准备就绪
		},
        SCULPTURE_ROOKNOSE = "这是哪儿来的？",		--物品名：可疑的大理石
		SCULPTURE_ROOKBODY =
		{
			COVERED = "一种大理石雕像。",		--物品名：大理石雕像 检查状态：雕塑主体仍被石层覆盖
			UNCOVERED = "它不在最佳状态。",		--物品名：大理石雕像 检查状态：雕塑主体已经露出
			FINISHED = "所有都修补好了。",		--物品名：大理石雕像 检查状态：雕塑已经完成
			READY = "里面有东西在动。",		--物品名：大理石雕像 检查状态：已经准备就绪
		},
        GARGOYLE_HOUND = "我不喜欢它看我的眼神。",		--物品名：可疑的月岩
        GARGOYLE_WEREPIG = "它看起来栩栩如生。",		--物品名：可疑的月岩
		SEEDS = "每一颗都是一个小小的谜。",		--物品名：种子
		SEEDS_COOKED = "生命精华都被烤出来了！",		--物品名：烤种子
		SEWING_KIT = "补好！全都补好啦！",		--物品名：针线包
		SEWING_TAPE = "修补得不错。",		--物品名：可靠的胶布
		SHOVEL = "地下隐藏着很多秘密。",		--物品名：铲子
		SILK = "出自蜘蛛的屁股。",		--物品名：蜘蛛丝
		SKELETON = "你死好过我死。",		--物品名：骷髅
		SCORCHED_SKELETON = "真可怕。",		--物品名：易碎骷髅
        SKELETON_NOTPLAYER = "不像是人骨。",		--物品名：骷髅
		SKULLCHEST = "不确定要不要打开。", 		--物品名：骷髅箱
		SMALLBIRD =
		{
			GENERIC = "好小的一只鸟。",		--物品名：小鸟 检查状态：普通状态
			HUNGRY = "它看起来饿了。",		--物品名：小鸟 检查状态：处于饥饿状态
			STARVING = "它一定很饿。",		--物品名：小鸟 检查状态：极度饥饿
			SLEEPING = "它都不偷偷睁眼看一下。",		--物品名：小鸟 检查状态：正在睡眠
		},
		SMALLMEAT = "一小块动物尸体。",		--物品名：小肉
		SMALLMEAT_DRIED = "一小块肉干。",		--物品名：小肉干
		SPAT = "看起来脾气暴躁的动物。",		--物品名：钢羊
		SPEAR = "好尖的一根棍子。",		--物品名：长矛
		SPEAR_WATHGRITHR = "它看起来很能戳。",		--物品名：战斗长矛
		WATHGRITHRHAT = "那顶帽子好奇特。",		--物品名：战斗头盔
		SPIDER =
		{
			DEAD = "恶心！",		--物品名：蜘蛛 检查状态：已经死亡
			GENERIC = "我讨厌蜘蛛。",		--物品名：蜘蛛 检查状态：普通状态
			SLEEPING = "他醒来的时候我最好不要在这里。",		--物品名：蜘蛛 检查状态：正在睡眠
		},
		SPIDERDEN = "真黏！",		--物品名：蜘蛛巢
		SPIDEREGGSACK = "我希望这些不会孵化。仅此而已。",		--物品名：蜘蛛卵
		SPIDERGLAND = "它有一股强烈的防腐剂的味道。",		--物品名：蜘蛛腺
		SPIDERHAT = "我希望把蜘蛛的黏性物质都弄掉了。",		--物品名：蜘蛛帽
		SPIDERQUEEN = "啊啊啊！那只蜘蛛真巨大！",		--物品名：蜘蛛女王
		SPIDER_WARRIOR =
		{
			DEAD = "终于摆脱了！",		--物品名：蜘蛛战士 检查状态：已经死亡
			GENERIC = "看起来比平常的蜘蛛更凶恶。",		--物品名：蜘蛛战士 检查状态：普通状态
			SLEEPING = "我应当保持距离。",		--物品名：蜘蛛战士 检查状态：正在睡眠
		},
        SPOILED_FOOD =
        {
            GENERIC = "那是长满毛毛的腐烂食物。",		--物品名：腐烂物 检查状态：普通状态
            CAN_PROCESS = "现在它可以被处理了",		--物品名：腐烂物 检查状态：可放入堆肥设施处理
        },
        STAGEHAND =
        {
			AWAKE = "总之不要伸出你的手，好吗？",		--物品名：舞台之手 检查状态：已经苏醒
			HIDING = "这里有些古怪，但我说不出所以然。",		--物品名：舞台之手 检查状态：正在伪装隐藏
        },
        STATUE_MARBLE =
        {
            GENERIC = "高级的大理石雕像。",		--物品名：大理石雕像 检查状态：普通状态
            TYPE1 = "不要失去理智！",		--物品名：大理石雕像 检查状态：第一种外观
            TYPE2 = "雕像般的。",		--物品名：大理石雕像 检查状态：第二种外观
            TYPE3 = "我想知道是哪个艺术家的作品。", 		--物品名：大理石雕像 检查状态：第三种外观
        },
		STATUEHARP = "他的头怎么了？",		--物品名：竖琴雕像
		STATUEMAXWELL = "他本人还要矮一点。",		--物品名：麦斯威尔雕像
		STEELWOOL = "粗糙的金属纤维。",		--物品名：钢丝绵
		STINGER = "看起来很尖锐！",		--物品名：针刺
		STRAWHAT = "帽子总是会弄乱我的发型。",		--物品名：草帽
		STUFFEDEGGPLANT = "真的塞满了！",		--物品名：酿茄子
		SWEATERVEST = "这件背心十分体面。",		--物品名：犬牙背心
		REFLECTIVEVEST = "走开，邪恶的太阳！",		--物品名：清凉夏装
		HAWAIIANSHIRT = "穿着它做实验可不安全！",		--物品名：花衬衫
		TAFFY = "如果我去看牙医了，他们知道我这样子吃东西的话会疯掉的。",		--物品名：太妃糖
		TALLBIRD = "好高的一只鸟！",		--物品名：高脚鸟
		TALLBIRDEGG = "它会孵化吗？",		--物品名：高脚鸟蛋
		TALLBIRDEGG_COOKED = "美味又营养。",		--物品名：煎高脚鸟蛋
		TALLBIRDEGG_CRACKED =
		{
			COLD = "是它在哆嗦还是我在哆嗦？",		--物品名：孵化中的高脚鸟蛋 检查状态：温度较低
			GENERIC = "看起来它正在孵化！",		--物品名：孵化中的高脚鸟蛋 检查状态：普通状态
			HOT = "蛋也会出汗吗？",		--物品名：孵化中的高脚鸟蛋 检查状态：温度很高
			LONG = "我感觉这需要一些时间...",		--物品名：孵化中的高脚鸟蛋 检查状态：距离孵化或变化仍有较长时间
			SHORT = "它现在随时要孵出来了。",		--物品名：孵化中的高脚鸟蛋 检查状态：即将孵化或变化
		},
		TALLBIRDNEST =
		{
			GENERIC = "那真是个不一般的蛋！",		--物品名：高脚鸟巢 检查状态：普通状态
			PICKED = "巢是空的。",		--物品名：高脚鸟巢 检查状态：已经采集
		},
		TEENBIRD =
		{
			GENERIC = "不是很高的鸟。",		--物品名：小高脚鸟 检查状态：普通状态
			HUNGRY = "你想吃东西想的不行了？",		--物品名：小高脚鸟 检查状态：处于饥饿状态
			STARVING = "它目露凶光。",		--物品名：小高脚鸟 检查状态：极度饥饿
			SLEEPING = "它在眯眼休息。",		--物品名：小高脚鸟 检查状态：正在睡眠
		},
		TELEPORTATO_BASE =
		{
			ACTIVE = "有了这个，我肯定可以穿越时空！", 		--物品名：木制装置 检查状态：正在运作
			GENERIC = "这似乎通向另一个世界！", 		--物品名：木制装置 检查状态：普通状态
			LOCKED = "还少了些什么东西。", 		--物品名：木制装置 检查状态：处于锁定状态
			PARTIAL = "很快，这个发明就要大功告成！", 		--物品名：木制装置 检查状态：只完成部分组装
		},
		TELEPORTATO_BOX = "这可能控制着整个宇宙的极性。", 		--物品名：盒状装置
		TELEPORTATO_CRANK = "结实到足以应付最危险的实验。", 		--物品名：曲柄装置
		TELEPORTATO_POTATO = "这个金属土豆包含强大而又可怕的力量...", 		--物品名：金属土豆状装置
		TELEPORTATO_RING = "一个可以聚集空间能量的圆环。", 		--物品名：环状装置
		TELESTAFF = "那会揭示这个世界。",		--物品名：传送魔杖
		TENT =
		{
			GENERIC = "我不睡觉会发疯。",		--物品名：帐篷 检查状态：普通状态
			BURNT = "不剩什么睡觉的东西了。",		--物品名：帐篷 检查状态：已经烧毁
		},
		SIESTAHUT =
		{
			GENERIC = "午后安全避暑休息的好地方。",		--物品名：遮阳篷 检查状态：普通状态
			BURNT = "它现在遮不了多少阳了。",		--物品名：遮阳篷 检查状态：已经烧毁
		},
		TENTACLE = "那个看起来很危险。",		--物品名：触手
		TENTACLESPIKE = "它又尖又黏。",		--物品名：触手尖刺
		TENTACLESPOTS = "我想这些是它的生殖器。",		--物品名：触手皮
		TENTACLE_PILLAR = "黏滑的触手。",		--物品名：大触手
        TENTACLE_PILLAR_HOLE = "似乎很臭，但值得一探。",		--物品名：硕大的泥坑
		TENTACLE_PILLAR_ARM = "滑溜溜的小触手。",		--物品名：小触手
		TENTACLE_GARDEN = "又一种黏滑的触手。",		--物品名：大触手
		TOPHAT = "多好的帽子。",		--物品名：高礼帽
		TORCH = "驱赶黑暗的东西。",		--物品名：火炬
		TRANSISTOR = "电力让它呼呼作响。",		--物品名：电子元件
		TRAP = "我把它编得很紧密。",		--物品名：陷阱
		TRAP_TEETH = "真是糟糕的意外。",		--物品名：犬牙陷阱
		TRAP_TEETH_MAXWELL = "我可不想踩在那上面！", 		--物品名：麦斯威尔的犬牙陷阱
		TREASURECHEST =
		{
			GENERIC = "一个工具箱！",		--物品名：箱子 检查状态：普通状态
			BURNT = "那个箱子被烧掉了一截。",		--物品名：箱子 检查状态：已经烧毁
            UPGRADED_STACKSIZE = "得到了一个数量级的改进。",		--物品名：箱子 检查状态：已经升级容器堆叠容量
		},
		TREASURECHEST_TRAP = "真方便！",		--物品名：宝箱
        CHESTUPGRADE_STACKSIZE = "物理定律竟然如此有弹性。", 		--物品名：弹性空间制造器
		COLLAPSEDCHEST = "物理定律遭到了歪曲和破坏。",		--物品名：损坏的箱子
		SACRED_CHEST =
		{
			GENERIC = "我听到低语了。它想要什么东西。",		--物品名：远古宝箱 检查状态：普通状态
			LOCKED = "它正在做出判断。",		--物品名：远古宝箱 检查状态：处于锁定状态
		},
		TREECLUMP = "是不是有人想把我困在这里。", 		--物品名：密集树丛

		TRINKET_1 = "融化了。或许薇洛和他们相处愉快？", 		--物品名：熔化的弹珠
		TRINKET_2 = "你跟卡祖有什么关系？", 		--物品名：假卡祖笛
		TRINKET_3 = "那是个死结。永远打不开的结。", 		--物品名：戈尔迪之结
		TRINKET_4 = "它一定是某种宗教物品。", 		--物品名：地精爷爷
		TRINKET_5 = "不幸的是，它太小了，我没法乘坐它逃离。", 		--物品名：迷你火箭
		TRINKET_6 = "它们输送电力的日子结束了。", 		--物品名：烂电线
		TRINKET_7 = "没有时间享乐和游戏！", 		--物品名：杯子和球
		TRINKET_8 = "太好了。堵浴缸的塞子有了。", 		--物品名：硬化橡胶塞
		TRINKET_9 = "我本人更喜欢拉链。", 		--物品名：不搭的纽扣
		TRINKET_10 = "它们很快成为韦斯喜欢的道具了。", 		--物品名：二手假牙
		TRINKET_11 = "哈尔向我轻诉美丽的谎言。", 		--物品名：机器人玩偶
		TRINKET_12 = "这是求被试验啊。", 		--物品名：干瘪的触手
		TRINKET_13 = "一定是某种宗教物品。", 		--物品名：地精奶奶
		TRINKET_14 = "现在要是能喝点茶，该多好...", 		--物品名：漏水的茶杯
		TRINKET_15 = "...麦斯威尔又落下了他的行头。", 		--物品名：白色主教
		TRINKET_16 = "...麦斯威尔又落下了他的行头。", 		--物品名：黑色主教
		TRINKET_17 = "令人恐惧的器皿融合。也许科学*会*物极必反。", 		--物品名：弯曲的叉子
		TRINKET_18 = "我想知道它在隐藏什么？", 		--物品名：玩具木马
		TRINKET_19 = "结网不是很顺利。", 		--物品名：失衡陀螺
		TRINKET_20 = "薇格弗德不断跳出去，用那东西打我？！", 		--物品名：痒痒挠
		TRINKET_21 = "这个搅蛋器整个都弯曲变形了。", 		--物品名：破搅拌器
		TRINKET_22 = "关于这个绳子，我有几个理论。", 		--物品名：磨损的纱线
		TRINKET_23 = "我可以自己穿鞋，谢谢。", 		--物品名：鞋拔子
		TRINKET_24 = "我想薇克巴顿应该有只猫。", 		--物品名：幸运猫扎尔
		TRINKET_25 = "闻起来有点不新鲜。", 		--物品名：臭气制造器
		TRINKET_26 = "食物和杯子！终极生存容器。", 		--物品名：土豆杯
		TRINKET_27 = "如果你解开它，你可以从远处刺到别人。", 		--物品名：钢丝衣架
		TRINKET_28 = "简直就是阴谋。", 		--物品名：白色战车
        TRINKET_29 = "简直就是阴谋。", 		--物品名：黑色战车
        TRINKET_30 = "他怎么到处乱丢呢。", 		--物品名：白色骑士
        TRINKET_31 = "他怎么到处乱丢呢。", 		--物品名：黑色骑士
        TRINKET_32 = "我认识喜欢这个的人！", 		--物品名：立方氧化锆球
        TRINKET_33 = "希望不会引来蜘蛛。", 		--物品名：蜘蛛指环
        TRINKET_34 = "让我们许个愿望吧。为了科学。", 		--物品名：猴爪
        TRINKET_35 = "很难在这附近找到一个好的烧瓶。", 		--物品名：空的长生不老药
        TRINKET_36 = "在吃完所有的糖果后我可能会需要这些东西。", 		--物品名：人造尖牙
        TRINKET_37 = "我不相信超自然现象。", 		--物品名：断桩
        TRINKET_38 = "我想它来自另外一个世界，一个满是欺诈的世界。", 		--物品名：双筒望远镜
        TRINKET_39 = "我想知道另一只在哪里？", 		--物品名：单只手套
        TRINKET_40 = "拿着它让我觉得在赶集。", 		--物品名：蜗牛秤
        TRINKET_41 = "摸起来有点温热。", 		--物品名：黏液罐
        TRINKET_42 = "它充满了某人的童年记忆。", 		--物品名：玩具眼镜蛇
        TRINKET_43= "它不太擅长跳跃。", 		--物品名：鳄鱼玩具
        TRINKET_44 = "它是某种植物标本。", 		--物品名：破碎的玻璃罐
        TRINKET_45 = "它正在接收另一个世界的频率。", 		--物品名：奇怪的收音机
        TRINKET_46 = "也许是测试空气动力学的工具？", 		--物品名：损坏的吹风机

        LOST_TOY_1  = "一定有一个完美的科学解释。",		--物品名：遗失的玻璃球
        LOST_TOY_2  = "一定有一个完美的科学解释。",		--物品名：多愁善感的卡祖笛
        LOST_TOY_7  = "一定有一个完美的科学解释。",		--物品名：珍视的抽线陀螺
        LOST_TOY_10 = "一定有一个完美的科学解释。",		--物品名：缺少的牙齿
        LOST_TOY_11 = "一定有一个完美的科学解释。",		--物品名：珍贵的玩具机器人
        LOST_TOY_14 = "一定有一个完美的科学解释。",		--物品名：妈妈最爱的茶杯
        LOST_TOY_18 = "一定有一个完美的科学解释。",		--物品名：宝贵的玩具木马
        LOST_TOY_19 = "一定有一个完美的科学解释。",		--物品名：最爱的陀螺
        LOST_TOY_42 = "一定有一个完美的科学解释。",		--物品名：装错的玩具眼镜蛇
        LOST_TOY_43 = "一定有一个完美的科学解释。",		--物品名：宠爱的鳄鱼玩具

        HALLOWEENCANDY_1 = "就算蛀牙也值得了，对吧？",		--物品名：糖果苹果
        HALLOWEENCANDY_2 = "什么样腐败的科学长出了这些东西？",		--物品名：糖果玉米
        HALLOWEENCANDY_3 = "是…玉米。",		--物品名：不太甜的玉米
        HALLOWEENCANDY_4 = "它们一路蠕动下来。",		--物品名：粘液蜘蛛
        HALLOWEENCANDY_5 = "明天我的牙齿可能会对此发表意见。",		--物品名：浣猫糖果
        HALLOWEENCANDY_6 = "我…不认为我会吃那些东西。",		--物品名："葡萄干"
        HALLOWEENCANDY_7 = "每个人遇到这些东西都会激动的。",		--物品名：葡萄干
        HALLOWEENCANDY_8 = "只有傻瓜才不会爱上这东西。",		--物品名：鬼魂棒棒糖
        HALLOWEENCANDY_9 = "粘牙。",		--物品名：果冻虫
        HALLOWEENCANDY_10 = "只有傻瓜才不会爱上这东西。",		--物品名：触手棒棒糖
        HALLOWEENCANDY_11 = "比真的东西尝起来味道好多了。",		--物品名：巧克力猪
        HALLOWEENCANDY_12 = "那块糖果刚动了一下吗？", 		--物品名：糖果虱
        HALLOWEENCANDY_13 = "哎呀，我可怜的下巴。", 		--物品名：无敌硬糖
        HALLOWEENCANDY_14 = "我吃不了辣。", 		--物品名：熔岩椒
        CANDYBAG = "它是某种美味的小小的甜点。",		--物品名：糖果袋

		HALLOWEEN_ORNAMENT_1 = "一个可以挂在树上的装饰物。",		--物品名：幽灵装饰
		HALLOWEEN_ORNAMENT_2 = "古怪的装饰。",		--物品名：蝙蝠装饰
		HALLOWEEN_ORNAMENT_3 = "这块木头看起来很适合挂起来。",		--物品名：蜘蛛装饰
		HALLOWEEN_ORNAMENT_4 = "触触逼真。",		--物品名：触手装饰
		HALLOWEEN_ORNAMENT_5 = "八只手的装饰。",		--物品名：穴居悬蛛装饰
		HALLOWEEN_ORNAMENT_6 = "最近大家都在热烈讨论树的装饰。",		--物品名：乌鸦装饰

		HALLOWEENPOTION_DRINKS_WEAK = "原以为会更大呢。",		--物品名：弱效万圣节药剂
		HALLOWEENPOTION_DRINKS_POTENT = "强力药水。",		--物品名：强效万圣节药剂
        HALLOWEENPOTION_BRAVERY = "满满的勇气。",		--物品名：勇气药剂
		HALLOWEENPOTION_MOON = "注入了变异的力量。",		--物品名：月亮精华液
		HALLOWEENPOTION_FIRE_FX = "烈火结晶。",		--物品名：万圣节火焰药剂效果
		MADSCIENCE_LAB = "为了科学就算疯了又如何！",		--物品名：疯狂科学家实验室
		LIVINGTREE_ROOT = "里面有东西！我要把它彻底根除。",		--物品名：完全正常的树根
		LIVINGTREE_SAPLING = "它会长得大到吓人。",		--物品名：完全正常的树苗

        DRAGONHEADHAT = "所以谁要在前面？",		--物品名：幸运兽脑袋
        DRAGONBODYHAT = "中间的部分让我有点犹豫。",		--物品名：幸运兽躯体
        DRAGONTAILHAT = "神龙摆尾的洋气帽子。",		--物品名：幸运兽尾巴
        PERDSHRINE =
        {
            GENERIC = "感觉它想要什么东西。",		--物品名：火鸡神龛 检查状态：普通状态
            EMPTY = "我要在那里种些东西。",		--物品名：火鸡神龛 检查状态：内容为空
            BURNT = "完全没用了。",		--物品名：火鸡神龛 检查状态：已经烧毁
        },
        REDLANTERN = "这个灯笼感觉比其他灯笼特别。",		--物品名：红灯笼
        LUCKY_GOLDNUGGET = "多么幸运的发现！",		--物品名：幸运金块
        FIRECRACKERS = "充满爆炸科学。",		--物品名：红鞭炮
        PERDFAN = "非常大。",		--物品名：幸运扇
        REDPOUCH = "里面有什么东西吗？",		--物品名：红包
        WARGSHRINE =
        {
            GENERIC = "我得做点好玩的东西。",		--物品名：座狼神龛 检查状态：普通状态
            EMPTY = "我需要在里面放支火把。",		--物品名：座狼神龛 检查状态：内容为空
            BURNING = "我得做点好玩的东西。", 		--物品名：座狼神龛 检查状态：正在燃烧
            BURNT = "它烧毁了。",		--物品名：座狼神龛 检查状态：已经烧毁
        },
        CLAYWARG =
        {
            GENERIC = "黏土怪物！",		--物品名：黏土座狼 检查状态：普通状态
            STATUE = "它刚刚是不是动了？",		--物品名：黏土座狼 检查状态：雕像形态
        },
        CLAYHOUND =
        {
            GENERIC = "它脱离束缚了！",		--物品名：黏土猎犬 检查状态：普通状态
            STATUE = "它看起来好逼真。",		--物品名：黏土猎犬 检查状态：雕像形态
        },
        HOUNDWHISTLE = "这个能阻挡狗的脚步。",		--物品名：幸运哨子
        CHESSPIECE_CLAYHOUND = "反正栓着了，我才不担心呢。",		--物品名：猎犬雕塑
        CHESSPIECE_CLAYWARG = "我竟然没被吃掉！",		--物品名：座狼雕塑

		PIGSHRINE =
		{
            GENERIC = "有更多东西要做。",		--物品名：猪神龛 检查状态：普通状态
            EMPTY = "它想要肉。",		--物品名：猪神龛 检查状态：内容为空
            BURNT = "烧焦了。",		--物品名：猪神龛 检查状态：已经烧毁
		},
		PIG_TOKEN = "这个看起来很重要。",		--物品名：金腰带
		PIG_COIN = "在战斗中花掉它会有好的回报。",		--物品名：猪鼻铸币
		YOTP_FOOD1 = "一场适合我的盛宴。",		--物品名：贡品烤肉
		YOTP_FOOD2 = "只有野兽才会喜欢的食物。",		--物品名：八宝泥馅饼
		YOTP_FOOD3 = "没什么精致的。",		--物品名：鱼头串

		PIGELITE1 = "看什么呢？", 		--物品名：韦德
		PIGELITE2 = "他得了淘金热！", 		--物品名：伊格内修斯
		PIGELITE3 = "你眼里有泥！", 		--物品名：德米特里
		PIGELITE4 = "难道你不想打其他人吗？", 		--物品名：索耶

		PIGELITEFIGHTER1 = "看什么看？", 		--物品名：韦德
		PIGELITEFIGHTER2 = "他得了淘金热！", 		--物品名：伊格内修斯
		PIGELITEFIGHTER3 = "你眼里有泥！", 		--物品名：德米特里
		PIGELITEFIGHTER4 = "难道你不想打其他人吗？", 		--物品名：索耶

		CARRAT_GHOSTRACER = "真令人不安啊。",		--物品名：查理的胡萝卜鼠

        YOTC_CARRAT_RACE_START = "不错的起点。",		--物品名：起点
        YOTC_CARRAT_RACE_CHECKPOINT = "关键的一点。",		--物品名：检查点
        YOTC_CARRAT_RACE_FINISH =
        {
            GENERIC = "与其说是终点线，不如说是终点圈。",		--物品名：终点线 检查状态：普通状态
            BURNT = "一把火烧的干干净净！",		--物品名：终点线 检查状态：已经烧毁
            I_WON = "哈哈！科学胜出了！",		--物品名：终点线 检查状态：当前角色赢得比赛
            SOMEONE_ELSE_WON = "哎……恭喜了，{winner}。",		--物品名：终点线 检查状态：其他角色赢得比赛
        },

		YOTC_CARRAT_RACE_START_ITEM = "好吧，算是个开始。",		--物品名：起点套装
        YOTC_CARRAT_RACE_CHECKPOINT_ITEM = "总会抵达终点。",		--物品名：检查点套装
		YOTC_CARRAT_RACE_FINISH_ITEM = "大限将至。",		--物品名：终点线套装

		YOTC_SEEDPACKET = "如果你问我，我会说看起来很多籽。",		--物品名：种子包
		YOTC_SEEDPACKET_RARE = "哟，还是稀罕货啊！",		--物品名：高级种子包

		MINIBOATLANTERN = "真亮！",		--物品名：漂浮灯笼

        YOTC_CARRATSHRINE =
        {
            GENERIC = "做什么呢……",		--物品名：胡萝卜鼠神龛 检查状态：普通状态
            EMPTY = "嗯……胡萝卜鼠喜欢吃什么呢？",		--物品名：胡萝卜鼠神龛 检查状态：内容为空
            BURNT = "烤胡萝卜的气味。",		--物品名：胡萝卜鼠神龛 检查状态：已经烧毁
        },

        YOTC_CARRAT_GYM_DIRECTION =
        {
            GENERIC = "为训练指明方向。",		--物品名：方向健身房 检查状态：普通状态
            RAT = "你能当一只优秀的小白鼠。",		--物品名：方向健身房 检查状态：训练目标是胡萝卜鼠
            BURNT = "我的训练计划灰飞烟灭。",		--物品名：方向健身房 检查状态：已经烧毁
        },
        YOTC_CARRAT_GYM_SPEED =
        {
            GENERIC = "我需要提高胡萝卜鼠的速度。",		--物品名：速度健身房 检查状态：普通状态
            RAT = "快点……快点！",		--物品名：速度健身房 检查状态：训练目标是胡萝卜鼠
            BURNT = "我可能放太多燃料了。",		--物品名：速度健身房 检查状态：已经烧毁
        },
        YOTC_CARRAT_GYM_REACTION =
        {
            GENERIC = "我们来训练胡萝卜鼠的反应速度！",		--物品名：反应健身房 检查状态：普通状态
            RAT = "对象的反应时间正在稳步提高！",		--物品名：反应健身房 检查状态：训练目标是胡萝卜鼠
            BURNT = "追求科学的过程中付出的微小代价。",		--物品名：反应健身房 检查状态：已经烧毁
        },
        YOTC_CARRAT_GYM_STAMINA =
        {
            GENERIC = "变得更加强壮了！",		--物品名：耐力健身房 检查状态：普通状态
            RAT = "这只胡萝卜鼠……将无人能挡！！",		--物品名：耐力健身房 检查状态：训练目标是胡萝卜鼠
            BURNT = "谁都阻挡不了进步！但这个会推迟它……",		--物品名：耐力健身房 检查状态：已经烧毁
        },

        YOTC_CARRAT_GYM_DIRECTION_ITEM = "我也该练练了！",		--物品名：方向健身房套装
        YOTC_CARRAT_GYM_SPEED_ITEM = "我最好把这个组装起来。",		--物品名：速度健身房套装
        YOTC_CARRAT_GYM_STAMINA_ITEM = "这个会改善胡萝卜鼠的耐力",		--物品名：耐力健身房套装
        YOTC_CARRAT_GYM_REACTION_ITEM = "这个应该能显著提高胡萝卜鼠的反应时间。",		--物品名：反应健身房套装

        YOTC_CARRAT_SCALE_ITEM = "可以秤我的胡萝卜鼠。",		--物品名：胡萝卜鼠秤套装
        YOTC_CARRAT_SCALE =
        {
            GENERIC = "希望天平向我倾斜。",		--物品名：胡萝卜鼠秤 检查状态：普通状态
            CARRAT = "它终究只是一个有知觉的蔬菜。",		--物品名：胡萝卜鼠秤 检查状态：秤上放着胡萝卜鼠
            CARRAT_GOOD = "胡萝卜鼠熟到可以赛跑了！",		--物品名：胡萝卜鼠秤 检查状态：秤上的胡萝卜鼠成绩良好
            BURNT = "真是一团糟",		--物品名：胡萝卜鼠秤 检查状态：已经烧毁
        },

        YOTB_BEEFALOSHRINE =
        {
            GENERIC = "做什么呢……",		--物品名：皮弗娄牛神龛 检查状态：普通状态
            EMPTY = "嗯……皮弗娄牛是什么做的呢？",		--物品名：皮弗娄牛神龛 检查状态：内容为空
            BURNT = "闻起来是烤肉的味道。",		--物品名：皮弗娄牛神龛 检查状态：已经烧毁
        },

        BEEFALO_GROOMER =
        {
            GENERIC = "没有皮弗娄牛让我打扮。",		--物品名：皮弗娄牛美妆台 检查状态：普通状态
            OCCUPIED = "让我们来美化一下这头皮弗娄牛！",		--物品名：皮弗娄牛美妆台 检查状态：当前已有使用者或内容物
            BURNT = "我用最火的风格打扮了我的皮弗娄牛……然而也付出了代价。",		--物品名：皮弗娄牛美妆台 检查状态：已经烧毁
        },
        BEEFALO_GROOMER_ITEM = "我还是换个地方把它装起来吧。",		--物品名：美妆台套装

        YOTR_RABBITSHRINE =
        {
            GENERIC = "做什么呢……",		--物品名：兔人神龛 检查状态：普通状态
            EMPTY = "那只兔子看起来饿了。",		--物品名：兔人神龛 检查状态：内容为空
            BURNT = "闻起来像素食烧烤。",		--物品名：兔人神龛 检查状态：已经烧毁
        },

        NIGHTCAPHAT = "本科学家再也不怕睡觉压坏发型了！",		--物品名：睡帽

        YOTR_FOOD1 = "它是用胡萝卜做的，所以科学说它肯定健康。",		--物品名：兔子卷
        YOTR_FOOD2 = "蓝色是最科学的风味。",		--物品名：月饼
        YOTR_FOOD3 = "摇晃的甜点。",		--物品名：月冻
        YOTR_FOOD4 = "兔兔——快跳到我嘴里来！",		--物品名：泡芙串

        YOTR_TOKEN = "这个东西我可不能给错人。",		--物品名：挑战手套

        COZY_BUNNYMAN = "他们看着很舒服的样子。",		--物品名：舒适的兔人

        HANDPILLOW_BEEFALOWOOL = "要是它闻起来不像皮弗娄牛就好了。",		--物品名：皮弗娄牛毛枕头
        HANDPILLOW_KELP = "我不喜欢这么潮。",		--物品名：海带枕头
        HANDPILLOW_PETALS = "起码比皮弗娄牛枕头好闻。",		--物品名：花朵枕头
        HANDPILLOW_STEELWOOL = "谁会睡在这上面？",		--物品名：钢丝绵枕头

        BODYPILLOW_BEEFALOWOOL = "要是它闻起来不像皮弗娄牛就好了。",		--物品名：皮弗娄牛枕头盔甲
        BODYPILLOW_KELP = "我不喜欢这么潮。",		--物品名：海带枕头盔甲
        BODYPILLOW_PETALS = "起码比皮弗娄牛枕头好闻。",		--物品名：花朵枕头盔甲
        BODYPILLOW_STEELWOOL = "谁会睡在这上面？",		--物品名：钢丝绵枕头盔甲

		BISHOP_CHARGE_HIT = "噢！",		--物品名：发条主教弹命中效果
		TRUNKVEST_SUMMER = "荒野休闲装。",		--物品名：透气背心
		TRUNKVEST_WINTER = "冬季生存装备。",		--物品名：松软背心
		TRUNK_COOKED = "不知怎么回事比以前更像鼻子了。",		--物品名：象鼻排
		TRUNK_SUMMER = "一根轻快通风的象鼻。",		--物品名：象鼻
		TRUNK_WINTER = "一根肥厚多毛的象鼻。",		--物品名：冬象鼻
		TUMBLEWEED = "谁知道那个风滚草里裹着什么。",		--物品名：风滚草
		TURKEYDINNER = "啧~",		--物品名：火鸡正餐
		TWIGS = "一堆小树枝。",		--物品名：树枝
		UMBRELLA = "我讨厌弄湿我的头发。",		--物品名：雨伞
		GRASS_UMBRELLA = "我的头发湿的时候很好看...问题出在干的时候。",		--物品名：花伞
		UNIMPLEMENTED = "看起来还没有完工！可能有危险。",		--物品名：尚未实装的对象
		WAFFLES = "我在犹豫是否需要更多的糖浆。",		--物品名：华夫饼
		WALL_HAY =
		{
			GENERIC = "呃。我想只能将就着用了。",		--物品名：草墙 检查状态：普通状态
			BURNT = "完全没用了。",		--物品名：草墙 检查状态：已经烧毁
		},
		WALL_HAY_ITEM = "这不像是个好主意。",		--物品名：草墙
		WALL_STONE = "不错的墙。",		--物品名：石墙
		WALL_STONE_ITEM = "它们让我有安全感。",		--物品名：石墙
		WALL_RUINS = "一段古老的墙。",		--物品名：铥墙
		WALL_RUINS_ITEM = "一段坚固的历史。",		--物品名：铥墙
		WALL_WOOD =
		{
			GENERIC = "尖的！",		--物品名：木墙 检查状态：普通状态
			BURNT = "烧焦了！",		--物品名：木墙 检查状态：已经烧毁
		},
		WALL_WOOD_ITEM = "木桩！",		--物品名：木墙
		WALL_MOONROCK = "空灵而光滑！",		--物品名：月岩墙
		WALL_MOONROCK_ITEM = "非常轻盈，但出人意料地坚硬。",		--物品名：月岩墙
		WALL_DREADSTONE = "这种感觉真……安全？",		--物品名：绝望石墙
		WALL_DREADSTONE_ITEM = "会出什么问题？",		--物品名：绝望石墙
        WALL_SCRAP = "它是用垃圾做的。",		--物品名：废料墙
        WALL_SCRAP_ITEM = "捆绑包装的垃圾。",		--物品名：废料墙
		FENCE = "不过是个木头栅栏。",		--物品名：木栅栏
        FENCE_ITEM = "有了它就能造出一个美丽牢固的栅栏。",		--物品名：木栅栏
        FENCE_GATE = "有时开，有时关。",		--物品名：木门
        FENCE_GATE_ITEM = "有了它就能造出一个美丽牢固的大门。",		--物品名：木门
		WALRUS = "海象是天生的捕食者。",		--物品名：海象
		WALRUSHAT = "上面盖了一层海象毛。",		--物品名：贝雷帽
		WALRUS_CAMP =
		{
			EMPTY = "看起来有人在这里扎营。",		--物品名：海象营地 检查状态：内容为空
			GENERIC = "看起来里面温暖而舒适。",		--物品名：海象营地 检查状态：普通状态
		},
		WALRUS_TUSK = "它最终肯定能派上用场。",		--物品名：海象牙
		WARDROBE =
		{
			GENERIC = "它承载着黑暗、禁忌的秘密...",		--物品名：衣柜 检查状态：普通状态
            BURNING = "烧得好快！",		--物品名：衣柜 检查状态：正在燃烧
			BURNT = "毫无风格可言。",		--物品名：衣柜 检查状态：已经烧毁
		},
		WARG = "你好像不太好对付啊，大狗。",		--物品名：座狼
        WARGLET = "又要回到那些个日子了……",		--物品名：青年座狼

		WASPHIVE = "我看那些蜜蜂都发疯了。",		--物品名：杀人蜂蜂窝
		WATERBALLOON = "科学奇迹！",		--物品名：水球
		WATERMELON = "又黏又甜。",		--物品名：西瓜
		WATERMELON_COOKED = "多汁而温热。",		--物品名：烤西瓜
		WATERMELONHAT = "让果汁从你的脸上流下。",		--物品名：西瓜帽
		WAXWELLJOURNAL =
		{
			GENERIC = "真可怕。",		--物品名：暗影秘典 检查状态：普通状态
			NEEDSFUEL = "它渴望燃料。",		--物品名：暗影秘典 检查状态：需要补充噩梦燃料
		},
		WETGOOP = "它尝起来没什么味道。",		--物品名：潮湿黏糊
        WHIP = "没什么比大响声更能带来宁静的了。",		--物品名：三尾猫鞭
		WINTERHAT = "冬天来的时候，它能派上大用场。",		--物品名：冬帽
		WINTEROMETER =
		{
			GENERIC = "水银的。",		--物品名：温度测量仪 检查状态：普通状态
			BURNT = "再也不能测量了。",		--物品名：温度测量仪 检查状态：已经烧毁
		},

        WINTER_TREE =
        {
            BURNT = "节日气氛受了影响。",		--物品名：冬季盛宴树 检查状态：已经烧毁
            BURNING = "我认为那是个错误。",		--物品名：冬季盛宴树 检查状态：正在燃烧
            CANDECORATE = "冬季盛宴快乐！",		--物品名：冬季盛宴树 检查状态：可以添加节日装饰
            YOUNG = "马上就到冬季盛宴了！",		--物品名：冬季盛宴树 检查状态：尚未长成
        },
		WINTER_TREESTAND =
		{
			GENERIC = "我需要一颗松果。",		--物品名：盛宴树盆 检查状态：普通状态
            BURNT = "节日气氛受了影响。",		--物品名：盛宴树盆 检查状态：已经烧毁
		},
        WINTER_ORNAMENT = "每个科学家都会欣赏一个好的玩意。",		--物品名：圣诞小玩意
        WINTER_ORNAMENTLIGHT = "一棵树没有电流就不算完整。",		--物品名：圣诞灯
        WINTER_ORNAMENTBOSS = "这一个尤其令人印象深刻。",		--物品名：华丽的装饰
		WINTER_ORNAMENTFORGE = "我应该把它悬火上烤。",		--物品名：熔炉装饰
		WINTER_ORNAMENTGORGE = "不知道为什么，这让我觉得很饿。",		--物品名：暴食装饰
        WINTER_ORNAMENTPEARL = "以她的爪子来说，做工不可谓不精美。",		--物品名：感伤装饰

        WINTER_FOOD1 = "解剖结构是错的，但是我会忽略它。", 		--物品名：小姜饼
        WINTER_FOOD2 = "我要吃四十个。为了科学。", 		--物品名：糖曲奇饼
        WINTER_FOOD3 = "圣诞节期间的牙疼马上就要发生了。", 		--物品名：拐杖糖
        WINTER_FOOD4 = "那个实验可能有点儿不道德。", 		--物品名：永远的水果蛋糕
        WINTER_FOOD5 = "能有一次吃浆果以外的东西真是好。", 		--物品名：巧克力原木蛋糕
        WINTER_FOOD6 = "直接放进嘴里！", 		--物品名：李子布丁
        WINTER_FOOD7 = "充满了美味汁液的空心苹果。", 		--物品名：苹果酒
        WINTER_FOOD8 = "它是怎么保持温暖的？一个热力马克杯？", 		--物品名：热可可
        WINTER_FOOD9 = "科学能够解释它为什么味道这么棒吗？", 		--物品名：美味的蛋酒

		WINTERSFEASTOVEN =
		{
			GENERIC = "喜庆的炉子，用来做火烤的食物！",		--物品名：砖砌烤炉 检查状态：普通状态
			COOKING = "烹饪果然是科学。",		--物品名：砖砌烤炉 检查状态：正在烹饪
			ALMOST_DONE_COOKING = "科学就快完成了！",		--物品名：砖砌烤炉 检查状态：即将烹饪完成
			DISH_READY = "科学说完成了。",		--物品名：砖砌烤炉 检查状态：料理已经完成
		},
		BERRYSAUCE = "浆果果酱。",		--物品名：快乐浆果酱
		BIBINGKA = "像海绵一样软。",		--物品名：比宾卡米糕
		CABBAGEROLLS = "肉躲在白菜里面躲避天敌。",		--物品名：白菜卷
		FESTIVEFISH = "品尝品尝时令海鲜。",		--物品名：节庆鱼料理
		GRAVY = "全是肉汁。",		--物品名：好肉汁
		LATKES = "我能吃好多个。",		--物品名：土豆饼
		LUTEFISK = "那有喇叭鱼吗？",		--物品名：苏打鱼
		MULLEDDRINK = "这杯潘趣酒劲很足。",		--物品名：香料潘趣酒
		PANETTONE = "这个仲冬节的面包真是应景。",		--物品名：托尼甜面包
		PAVLOVA = "我最爱巴甫洛娃了。",		--物品名：巴甫洛娃蛋糕
		PICKLEDHERRING = "无可挑剔的美味。",		--物品名：腌鲱鱼
		POLISHCOOKIE = "我要来一次光碟行动！",		--物品名：波兰饼干
		PUMPKINPIE = "为了科学，我要全部吃掉。",		--物品名：南瓜派
		ROASTTURKEY = "肥美多汁的鸡腿，专门为我做的。",		--物品名：烤火鸡
		STUFFING = "都是好料！",		--物品名：烤火鸡面包馅
		SWEETPOTATO = "科学创造出了晚餐和甜点的完美混合物。",		--物品名：红薯焗饭
		TAMALES = "我要是再多吃一些，也许会变得健壮了。",		--物品名：塔马利
		TOURTIERE = "很高兴肉食你！",		--物品名：饕餮馅饼

		TABLE_WINTERS_FEAST =
		{
			GENERIC = "节庆餐桌。",		--物品名：冬季盛宴餐桌 检查状态：普通状态
			HAS_FOOD = "吃饭时间到了！",		--物品名：冬季盛宴餐桌 检查状态：桌上已经摆有食物
			WRONG_TYPE = "不是吃这个的季节。",		--物品名：冬季盛宴餐桌 检查状态：摆放的食物类型不符合宴席要求
			BURNT = "谁会做这种事？",		--物品名：冬季盛宴餐桌 检查状态：已经烧毁
		},

		GINGERBREADWARG = "舔品一下甜品。",		--物品名：姜饼座狼
		GINGERBREADHOUSE = "管吃管住。",		--物品名：姜饼猪屋
		GINGERBREADPIG = "我最好跟着他。",		--物品名：姜饼猪
		CRUMBS = "走一路掉一路。",		--物品名：饼干屑
		WINTERSFEASTFUEL = "冬季精神!",		--物品名：节日欢愉

        KLAUS = "那究竟是什么东西！",		--物品名：克劳斯
        KLAUS_SACK = "我们绝对应该打开那东西。",		--物品名：赃物袋
		KLAUSSACKKEY = "对一个鹿角来说这真是太花俏了。",		--物品名：麋鹿茸
		WORMHOLE =
		{
			GENERIC = "柔软，呈波浪形。",		--物品名：虫洞 检查状态：普通状态
			OPEN = "科学催促我跳进去。",		--物品名：虫洞 检查状态：处于打开状态
		},
		WORMHOLE_LIMITED = "啊，那玩意看着不太对啊。",		--物品名：生病的虫洞
		ACCOMPLISHMENT_SHRINE = "我想用一下它，我想让全世界都知道我的所作所为。", 		--物品名：奖杯
		LIVINGTREE = "它在观察我吗？",		--物品名：完全正常的树
		ICESTAFF = "摸上去冷冰冰的。",		--物品名：冰魔杖
		REVIVER = "丑陋之心在跳动，将鬼魂复活了！",		--物品名：告密的心
		SHADOWHEART = "科学的力量肯定使它恢复生气了...",		--物品名：暗影心房
        ATRIUM_RUBBLE =
        {
			LINE_1 = "它描绘了一个古老的文明。人们看起来又饿又怕。",		--物品名：远古壁画 检查状态：第一段碑文或记录
			LINE_2 = "这块石板已经无法识别了。",		--物品名：远古壁画 检查状态：第二段碑文或记录
			LINE_3 = "有黑暗的东西悄悄逼近这座城市和城里的人。",		--物品名：远古壁画 检查状态：第三段碑文或记录
			LINE_4 = "人们的皮肤在脱落。他们的表里截然不同。",		--物品名：远古壁画 检查状态：第四段碑文或记录
			LINE_5 = "这里描绘了一座科技发达的宏伟城市。",		--物品名：远古壁画 检查状态：第五段碑文或记录
		},
        ATRIUM_STATUE = "这看起来并不全是真的。",		--物品名：远古雕像
        ATRIUM_LIGHT =
        {
			ON = "非常令人不安的光。",		--物品名：远古灯柱 检查状态：处于开启状态
			OFF = "它必须有动力来源。",		--物品名：远古灯柱 检查状态：处于关闭状态
		},
        ATRIUM_GATE =
        {
			ON = "回到正常运转状态。",		--物品名：远古大门 检查状态：处于开启状态
			OFF = "主要部分依然完好无损。",		--物品名：远古大门 检查状态：处于关闭状态
			CHARGING = "它正在获得能量。",		--物品名：远古大门 检查状态：正在充能
			DESTABILIZING = "大门在晃动。",		--物品名：远古大门 检查状态：正在失稳
			COOLDOWN = "它需要时间恢复。我也是。",		--物品名：远古大门 检查状态：能力处于冷却期
            RITUAL_SUMMONING = "Fascinating... and deeply, deeply concerning.", 		--物品名：远古大门 检查状态：仪式正在召唤
        },
        ATRIUM_KEY = "它在向外发射能量。",		--物品名：远古钥匙
		LIFEINJECTOR = "科学的突破！生命的答案！",		--物品名：强心针
		SKELETON_PLAYER =
		{
			MALE = "%s一定是在和%s进行试验时死的。",		--物品名：骷髅 检查状态：男性角色遗骸
			FEMALE = "%s一定是在和%s进行试验时死的。",		--物品名：骷髅 检查状态：女性角色遗骸
			ROBOT = "%s一定是在和%s进行试验时死的。",		--物品名：骷髅 检查状态：机器人角色遗骸
			DEFAULT = "%s一定是在和%s进行试验时死的。",		--物品名：骷髅 检查状态：默认外观或未知死因
		},
		HUMANMEAT = "肉就是肉。有区别么？",		--物品名：长猪
		HUMANMEAT_COOKED = "煮的粉嫩，但在道德上还是灰色地带。",		--物品名：熟长猪
		HUMANMEAT_DRIED = "风干了就不是人肉了，对吧？",		--物品名：长猪肉干
		ROCK_MOON = "那块石头来自月亮。",		--物品名：岩石
		MOONROCKNUGGET = "那块石头来自月亮。",		--物品名：月岩
		MOONROCKCRATER = "我应该把闪亮的东西粘在它里面。用来研究。",		--物品名：带孔月岩
		MOONROCKSEED = "里面蕴藏着科学！",		--物品名：天体宝球

        REDMOONEYE = "它能看几公里，也能在几公里外被看到。",		--物品名：红色月眼
        PURPLEMOONEYE = "是个很好的标记物，但我希望它不要再那样看我。",		--物品名：紫色月眼
        GREENMOONEYE = "那东西会密切关注这地方。",		--物品名：绿色月眼
        ORANGEMOONEYE = "有那东西帮忙观望，没有人会迷路。",		--物品名：橙色月眼
        YELLOWMOONEYE = "那应该给每个人指路。",		--物品名：黄色月眼
        BLUEMOONEYE = "留个心眼总是比较明智的。",		--物品名：蓝色月眼

        LAVAARENA_BOARLORD = "他是这儿的老大。",		--物品名：战斗大师普格纳
        BOARRIOR = "你可真大！",		--物品名：大熔炉猪战士
        BOARON = "我可以应对他！",		--物品名：战猪
        PEGHOOK = "那家伙喷出来的东西有腐蚀性！",		--物品名：酸蚀蝎
        TRAILS = "他的胳膊真壮啊。",		--物品名：野猪猩
        TURTILLUS = "它的壳有尖刺！",		--物品名：坦克龟
        SNAPPER = "这家伙会咬人。",		--物品名：鳄鱼指挥官
		RHINODRILL = "他的鼻子很适合干这个活。",		--物品名：后扣帽犀牛兄弟
		BEETLETAUR = "我在这里都能闻到他的气味！",		--物品名：地狱独眼巨猪

        LAVAARENA_PORTAL =
        {
            ON = "我要走了。",		--物品名：远古大门 检查状态：处于开启状态
            GENERIC = "能过来，应该也能回去吧？",		--物品名：远古大门 检查状态：普通状态
        },
        LAVAARENA_KEYHOLE = "需要一把钥匙。",		--物品名：远古锚
		LAVAARENA_KEYHOLE_FULL = "那个应该能行。",		--物品名：已插入钥匙的熔炉锁孔
        LAVAARENA_BATTLESTANDARD = "大家一起摧毁战旗！",		--物品名：战旗
        LAVAARENA_SPAWNER = "敌人就是从这儿来的。",		--物品名：熔炉传送门

        HEALINGSTAFF = "释放再生的力量。",		--物品名：生命魔杖
        FIREBALLSTAFF = "召唤流星从天而降。",		--物品名：地狱魔杖
        HAMMER_MJOLNIR = "这把敲东西的锤子可真重。",		--物品名：锻锤
        SPEAR_GUNGNIR = "我可以用它快速充电。",		--物品名：尖齿矛
        BLOWDART_LAVA = "我可以在范围内用这个武器。",		--物品名：吹箭
        BLOWDART_LAVA2 = "它利用一股强气流来推动抛射物。",		--物品名：熔化吹箭
        LAVAARENA_LUCY = "那个武器是用来扔的。",		--物品名：暴怒的露西
        WEBBER_SPIDER_MINION = "可以说他们是在为我们战斗吧。",		--物品名：蜘蛛宝宝
        BOOK_FOSSIL = "这样能把那些怪物拖住一阵子。",		--物品名：石化之书
		LAVAARENA_BERNIE = "我们或许能利用他进行干扰。",		--物品名：伯尼
		SPEAR_LANCE = "它直击要害。",		--物品名：螺旋矛
		BOOK_ELEMENTAL = "我看不清这些字。",		--物品名：召唤之书
		LAVAARENA_ELEMENTAL = "它是个岩石怪兽！",		--物品名：岩浆傀儡

   		LAVAARENA_ARMORLIGHT = "轻巧，但不算很耐用。",		--物品名：芦苇外衣
		LAVAARENA_ARMORLIGHTSPEED = "轻巧，方便走动。",		--物品名：羽饰芦苇外衣
		LAVAARENA_ARMORMEDIUM = "它的保护力还不错。",		--物品名：木质护甲
		LAVAARENA_ARMORMEDIUMDAMAGER = "有了它我能攻击得猛烈一点。",		--物品名：锯齿木甲
		LAVAARENA_ARMORMEDIUMRECHARGER = "穿上它，我就有能量多耍几招。",		--物品名：丝带木甲
		LAVAARENA_ARMORHEAVY = "这真是极好的。",		--物品名：石头板条甲
		LAVAARENA_ARMOREXTRAHEAVY = "这副盔甲已经石化，提供最大程度的保护。",		--物品名：坚固的石质护甲

		LAVAARENA_FEATHERCROWNHAT = "我一看见那些蓬松的羽毛就想跑！",		--物品名：羽毛头环
        LAVAARENA_HEALINGFLOWERHAT = "这花朵和治愈魔法很合拍。",		--物品名：花饰头带
        LAVAARENA_LIGHTDAMAGERHAT = "能加点攻击。",		--物品名：带刺头盔
        LAVAARENA_STRONGDAMAGERHAT = "好像能加很多攻击。",		--物品名：司夜女神头盔
        LAVAARENA_TIARAFLOWERPETALSHAT = "似乎能增强治愈力。",		--物品名：编织花环
        LAVAARENA_EYECIRCLETHAT = "饱含科学的凝视。",		--物品名：洞察皇冠
        LAVAARENA_RECHARGERHAT = "那些水晶的力量加速了我的能力。",		--物品名：水晶头饰
        LAVAARENA_HEALINGGARLANDHAT = "这花环能给我回点血。",		--物品名：绽放花环
        LAVAARENA_CROWNDAMAGERHAT = "那家伙能造成巨大破坏。",		--物品名：华丽的司夜女神头盔

		LAVAARENA_ARMOR_HP = "它应该能保护我的安全。",		--物品名：熔炉生命护甲

		LAVAARENA_FIREBOMB = "闻起来像硫磺。",		--物品名：炉火晶石
		LAVAARENA_HEAVYBLADE = "看起来很锋利的工具。",		--物品名：铁匠的刀刃

        QUAGMIRE_ALTAR =
        {
        	GENERIC = "我们最好开始煮些祭品。",		--物品名：饕餮祭坛 检查状态：普通状态
        	FULL = "它正在消化。",		--物品名：饕餮祭坛 检查状态：内容已满
    	},
		QUAGMIRE_ALTAR_STATUE1 = "旧雕塑。",		--物品名：饥饿之兽
		QUAGMIRE_PARK_FOUNTAIN = "它和水连在一起很长时间了。",		--物品名：喷泉

        QUAGMIRE_HOE = "这是一种农具。",		--物品名：锄头

        QUAGMIRE_TURNIP = "是个生萝卜。",		--物品名：大萝卜
        QUAGMIRE_TURNIP_COOKED = "做饭就是将科学付诸实践。",		--物品名：烤大萝卜
        QUAGMIRE_TURNIP_SEEDS = "一把古怪的种子。",		--物品名：暴食活动芜菁种子

        QUAGMIRE_GARLIC = "第一口气清新剂。",		--物品名：大蒜
        QUAGMIRE_GARLIC_COOKED = "完美的焦黄。",		--物品名：烤大蒜
        QUAGMIRE_GARLIC_SEEDS = "一把古怪的种子。",		--物品名：暴食活动大蒜种子

        QUAGMIRE_ONION = "看起来很脆。",		--物品名：洋葱
        QUAGMIRE_ONION_COOKED = "一次成功的化学反应。",		--物品名：烤洋葱
        QUAGMIRE_ONION_SEEDS = "一把古怪的种子。",		--物品名：暴食活动洋葱种子

        QUAGMIRE_POTATO = "埋在地下的苹果。",		--物品名：土豆
        QUAGMIRE_POTATO_COOKED = "一次成功的温度实验。",		--物品名：烤土豆
        QUAGMIRE_POTATO_SEEDS = "一把古怪的种子。",		--物品名：暴食活动土豆种子

        QUAGMIRE_TOMATO = "红色的，满满都是科学。",		--物品名：番茄
        QUAGMIRE_TOMATO_COOKED = "懂化学的话做饭就非常简单了。",		--物品名：烤番茄
        QUAGMIRE_TOMATO_SEEDS = "一把古怪的种子。",		--物品名：暴食活动番茄种子

        QUAGMIRE_FLOUR = "可以烘焙了。",		--物品名：面粉
        QUAGMIRE_WHEAT = "它看起来是颗粒状的。",		--物品名：小麦
        QUAGMIRE_WHEAT_SEEDS = "一把古怪的种子。",		--物品名：暴食活动小麦种子
        QUAGMIRE_CARROT_SEEDS = "一把古怪的种子。",		--物品名：暴食活动胡萝卜种子

        QUAGMIRE_ROTTEN_CROP = "我认为这个不适合出现在祭坛上。",		--物品名：腐烂的农作物

		QUAGMIRE_SALMON = "嗯，新鲜的鱼。",		--物品名：三文鱼
		QUAGMIRE_SALMON_COOKED = "可以端上餐桌了。",		--物品名：熟三文鱼
		QUAGMIRE_CRABMEAT = "没什么好模仿的。",		--物品名：蟹肉
		QUAGMIRE_CRABMEAT_COOKED = "在紧要关头，我可以做出一顿美餐。",		--物品名：熟蟹肉
		QUAGMIRE_SUGARWOODTREE =
		{
			GENERIC = "它含有大量美味可口的树液。",		--物品名：糖木树 检查状态：普通状态
			STUMP = "那棵树哪去了？真是一桩谜题。",		--物品名：糖木树 检查状态：只剩树桩
			TAPPED_EMPTY = "丰富的汁液。",		--物品名：糖木树 检查状态：糖木树液采集器为空
			TAPPED_READY = "香甜的金黄色汁液。",		--物品名：糖木树 检查状态：糖木树液已经可以收取
			TAPPED_BUGS = "蚂蚁就是这样来的。",		--物品名：糖木树 检查状态：糖木树液采集器中滋生虫子
			WOUNDED = "它看上去生病了。",		--物品名：糖木树 检查状态：树木已经受伤
		},
		QUAGMIRE_SPOTSPICE_SHRUB =
		{
			GENERIC = "它让我想起来那些带触手的怪物。",		--物品名：带斑点的小灌木 检查状态：普通状态
			PICKED = "从那丛灌木中采集不到更多果实了。",		--物品名：带斑点的小灌木 检查状态：已经采集
		},
		QUAGMIRE_SPOTSPICE_SPRIG = "我可以把它磨碎了做香料。",		--物品名：带斑点的小枝
		QUAGMIRE_SPOTSPICE_GROUND = "风味十足。",		--物品名：斑点香料
		QUAGMIRE_SAPBUCKET = "我们可以用它采集树液。",		--物品名：树液采集工具包
		QUAGMIRE_SAP = "尝起来是甜的。",		--物品名：汁液
		QUAGMIRE_SALT_RACK =
		{
			READY = "盐积聚在绳子上了。",		--物品名：盐架 检查状态：已经准备就绪
			GENERIC = "科学是需要时间的。",		--物品名：盐架 检查状态：普通状态
		},

		QUAGMIRE_POND_SALT = "咸的泉水。",		--物品名：盐池
		QUAGMIRE_SALT_RACK_ITEM = "用来提取池塘里的盐。",		--物品名：盐架

		QUAGMIRE_SAFE =
		{
			GENERIC = "这是保险箱，用来保护物品安全的。",		--物品名：保险箱 检查状态：普通状态
			LOCKED = "没有钥匙就打不开。",		--物品名：保险箱 检查状态：处于锁定状态
		},

		QUAGMIRE_KEY = "我敢肯定，它会派上用场的。",		--物品名：钥匙
		QUAGMIRE_KEY_PARK = "在抵达公园之前，就把它“供“在我的口袋里吧。",		--物品名：铁钥匙
        QUAGMIRE_PORTAL_KEY = "看起来很科学。",		--物品名：远古钥匙


		QUAGMIRE_MUSHROOMSTUMP =
		{
			GENERIC = "那些是蘑菇吗？这真是一桩难题。",		--物品名：蘑菇 检查状态：普通状态
			PICKED = "应该不会长回来了。",		--物品名：蘑菇 检查状态：已经采集
		},
		QUAGMIRE_MUSHROOMS = "这些是可以吃的蘑菇。",		--物品名：蘑菇
        QUAGMIRE_MEALINGSTONE = "日常差事。",		--物品名：碾磨石
		QUAGMIRE_PEBBLECRAB = "那块石头是活的！",		--物品名：石蟹


		QUAGMIRE_RUBBLE_CARRIAGE = "无处可往。",		--物品名：破烂的马车
        QUAGMIRE_RUBBLE_CLOCK = "钟，被敲坏了。",		--物品名：砸烂的时钟
        QUAGMIRE_RUBBLE_CATHEDRAL = "祈“倒”。",		--物品名：残破的大教堂
        QUAGMIRE_RUBBLE_PUBDOOR = "没门。",		--物品名：残破的门
        QUAGMIRE_RUBBLE_ROOF = "有人上房揭瓦了。",		--物品名：残破的屋顶
        QUAGMIRE_RUBBLE_CLOCKTOWER = "那口钟寿终正寝了。",		--物品名：残破的钟楼
        QUAGMIRE_RUBBLE_BIKE = "不幸啊。",		--物品名：损毁的自行车
        QUAGMIRE_RUBBLE_HOUSE =
        {
            "空无一人。",		--物品名：残破的房子 检查状态：第1条台词变体
            "这个小镇被摧毁了。",		--物品名：残破的房子 检查状态：第2条台词变体
            "不知道他们惹怒了谁。",		--物品名：残破的房子 检查状态：第3条台词变体
        },
        QUAGMIRE_RUBBLE_CHIMNEY = "那个烟囱灰飞烟灭了。",		--物品名：残破的烟囱
        QUAGMIRE_RUBBLE_CHIMNEY2 = "那个烟囱灰飞烟灭了。",		--物品名：残破的烟囱
        QUAGMIRE_MERMHOUSE = "这个小房子真丑啊。",		--物品名：鱼人屋
        QUAGMIRE_SWAMPIG_HOUSE = "以前没这么糟。",		--物品名：破烂的猪屋
        QUAGMIRE_SWAMPIG_HOUSE_RUBBLE = "某只猪的窝毁了。",		--物品名：房子碎石
        QUAGMIRE_SWAMPIGELDER =
        {
            GENERIC = "我猜你是这里的老大？",		--物品名：沼泽猪长老 检查状态：普通状态
            SLEEPING = "它睡着了，暂时睡着了。",		--物品名：沼泽猪长老 检查状态：正在睡眠
        },
        QUAGMIRE_SWAMPIG = "这是一头超级多毛的猪。",		--物品名：暴食活动沼泽猪人

        QUAGMIRE_PORTAL = "又是一条死胡同。",		--物品名：远古大门
        QUAGMIRE_SALTROCK = "盐。最有滋味的矿物。",		--物品名：盐晶
        QUAGMIRE_SALT = "满满的盐。",		--物品名：盐
        QUAGMIRE_FOOD_BURNT = "那是试验品。",		--物品名：烧焦的食物
        QUAGMIRE_FOOD =
        {
        	GENERIC = "我应该把它献祭在饕餮祭坛上。",		--物品名：暴食活动料理 检查状态：普通状态
            MISMATCH = "不是它想要的。",		--物品名：暴食活动料理 检查状态：料理不符合祭坛要求
            MATCH = "科学说这样会安抚天空之神。",		--物品名：暴食活动料理 检查状态：料理完全符合祭坛要求
            MATCH_BUT_SNACK = "真的，这更像是小吃。",		--物品名：暴食活动料理 检查状态：料理符合类型但份量只是点心
        },

        QUAGMIRE_FERN = "可能富含维生素。",		--物品名：蕨类植物
        QUAGMIRE_FOLIAGE_COOKED = "我们煮了树叶。",		--物品名：熟蕨叶
        QUAGMIRE_COIN1 = "我的想法可值不止这点钱。",		--物品名：旧硬币
        QUAGMIRE_COIN2 = "不少硬币呢。",		--物品名：蓝宝石徽章
        QUAGMIRE_COIN3 = "似乎很有价值。",		--物品名：红色马克硬币
        QUAGMIRE_COIN4 = "可以用它们重新打开大门。",		--物品名：饕餮的青睐
        QUAGMIRE_GOATMILK = "挺好的，只要你别去想它的来源。",		--物品名：羊奶
        QUAGMIRE_SYRUP = "加一点甜味。",		--物品名：糖浆
        QUAGMIRE_SAP_SPOILED = "还不如把它扔进火里。",		--物品名：毁掉的汁液
        QUAGMIRE_SEEDPACKET = "播什么种？",		--物品名：暴食活动种子包

        QUAGMIRE_POT = "这个能装更多配料。",		--物品名：大锅
        QUAGMIRE_POT_SMALL = "我们来做饭吧！",		--物品名：锅
        QUAGMIRE_POT_SYRUP = "我需要给这锅东西增加甜味。",		--物品名：糖浆锅
        QUAGMIRE_POT_HANGER = "它带有挂钩。",		--物品名：挂锅装置
        QUAGMIRE_POT_HANGER_ITEM = "用来悬挂炊具。",		--物品名：挂锅装置
        QUAGMIRE_GRILL = "我现在就差一个摆放它的后院了。",		--物品名：大烤架
        QUAGMIRE_GRILL_ITEM = "“烤”问利器。",		--物品名：大烤架
        QUAGMIRE_GRILL_SMALL = "烤出好味道。",		--物品名：小烤架
        QUAGMIRE_GRILL_SMALL_ITEM = "用来烤小块肉。",		--物品名：小烤架
        QUAGMIRE_OVEN = "需要加些材料才会有化学反应。",		--物品名：烤箱
        QUAGMIRE_OVEN_ITEM = "科学燃烧用品。",		--物品名：烤箱
        QUAGMIRE_CASSEROLEDISH = "一道加了各种调料的菜。",		--物品名：大法国砂锅
        QUAGMIRE_CASSEROLEDISH_SMALL = "可以做各种杂七杂八的小菜。",		--物品名：小法国砂锅
        QUAGMIRE_PLATE_SILVER = "镀银的盘子。",		--物品名：银盘
        QUAGMIRE_BOWL_SILVER = "一只明亮的碗。",		--物品名：银碗
        QUAGMIRE_CRATE = "厨房用具。",		--物品名：暴食活动板条箱

        QUAGMIRE_MERM_CART1 = "里面有什么科学原理吗？", 		--物品名：萨米的货车
        QUAGMIRE_MERM_CART2 = "有些东西我能用得上。", 		--物品名：皮普顿的马车
        QUAGMIRE_PARK_ANGEL = "接招！",		--物品名：饕餮敬拜者
        QUAGMIRE_PARK_ANGEL2 = "真是栩栩如生。",		--物品名：饕餮敬拜者
        QUAGMIRE_PARK_URN = "尘归尘。",		--物品名：骨灰瓮
        QUAGMIRE_PARK_OBELISK = "一座有纪念意义的纪念碑。",		--物品名：石柱
        QUAGMIRE_PARK_GATE =
        {
            GENERIC = "没钥匙不行。",		--物品名：铁门 检查状态：普通状态
            LOCKED = "锁得牢牢的。",		--物品名：铁门 检查状态：处于锁定状态
        },
        QUAGMIRE_PARKSPIKE = "它的学名应该是“锋利、尖锐的东西”。",		--物品名：铁栅栏
        QUAGMIRE_CRABTRAP = "螃蟹陷阱。",		--物品名：螃蟹陷阱
        QUAGMIRE_TRADER_MERM = "也许他们愿意交换。",		--物品名：萨米 头脑清晰的泥沼鱼人
        QUAGMIRE_TRADER_MERM2 = "也许他们愿意交换。",		--物品名：皮普顿 清醒的泥沼鱼人

        QUAGMIRE_GOATMUM = "让我想起了我的老保姆。",		--物品名：玛姆茜
        QUAGMIRE_GOATKID = "这只山羊小得多。",		--物品名：比利
        QUAGMIRE_PIGEON =
        {
            DEAD = "死了。",		--物品名：鸽子 检查状态：已经死亡
            GENERIC = "羽翼丰满。",		--物品名：鸽子 检查状态：普通状态
            SLEEPING = "暂时睡着了。",		--物品名：鸽子 检查状态：正在睡眠
        },
        QUAGMIRE_LAMP_POST = "嗯，让我想起了家。",		--物品名：街灯

        QUAGMIRE_BEEFALO = "科学说它应该死透了。",		--物品名：老皮弗娄牛
        QUAGMIRE_SLAUGHTERTOOL = "用于牲畜的外科工具。",		--物品名：屠宰工具

        QUAGMIRE_SAPLING = "我从中弄不到其他东西。",		--物品名：暴食活动树苗
        QUAGMIRE_BERRYBUSH = "浆果全没了。",		--物品名：暴食活动浆果丛

        QUAGMIRE_ALTAR_STATUE2 = "看什么看？",		--物品名：饥饿之兽
        QUAGMIRE_ALTAR_QUEEN = "一座有纪念意义的纪念碑。",		--物品名：女王野兽
        QUAGMIRE_ALTAR_BOLLARD = "就柱子而言, 这根足够了。",		--物品名：柱子
        QUAGMIRE_ALTAR_IVY = "有点粘人。",		--物品名：常春藤

        QUAGMIRE_LAMP_SHORT = "亮起来。",		--物品名：小街灯

        WINONA_CATAPULT =
        {
        	GENERIC = "她制造了一种自动防卫系统。",		--物品名：薇诺娜的投石机 检查状态：普通状态
        	OFF = "需要通电。",		--物品名：薇诺娜的投石机 检查状态：处于关闭状态
        	BURNING = "熊熊烈火！",		--物品名：薇诺娜的投石机 检查状态：正在燃烧
        	BURNT = "科学也没能拯救它。",		--物品名：薇诺娜的投石机 检查状态：已经烧毁
			SLEEP = "她制造了一种自动防卫系统。",		--物品名：薇诺娜的投石机 检查状态：设备处于休眠状态
        },
        WINONA_SPOTLIGHT =
        {
        	GENERIC = "好棒的主意！",		--物品名：薇诺娜的聚光灯 检查状态：普通状态
        	OFF = "需要通电。",		--物品名：薇诺娜的聚光灯 检查状态：处于关闭状态
        	BURNING = "熊熊烈火！",		--物品名：薇诺娜的聚光灯 检查状态：正在燃烧
        	BURNT = "科学也没能拯救它。",		--物品名：薇诺娜的聚光灯 检查状态：已经烧毁
			SLEEP = "好棒的主意！",		--物品名：薇诺娜的聚光灯 检查状态：设备处于休眠状态
        },
        WINONA_BATTERY_LOW =
        {
        	GENERIC = "看起来很科学。工作原理是什么？",		--物品名：薇诺娜的发电机 检查状态：普通状态
        	LOWPOWER = "电量正在下降。",		--物品名：薇诺娜的发电机 检查状态：电力不足
        	OFF = "要是薇诺娜忙，我也能让它运作起来。",		--物品名：薇诺娜的发电机 检查状态：处于关闭状态
        	BURNING = "熊熊烈火！",		--物品名：薇诺娜的发电机 检查状态：正在燃烧
        	BURNT = "科学也没能拯救它。",		--物品名：薇诺娜的发电机 检查状态：已经烧毁
        },
        WINONA_BATTERY_HIGH =
        {
			GENERIC = "嘿！这不科学！",		--物品名：薇诺娜的宝石发电机 检查状态：普通状态
			LOWPOWER = "马上就没电了。",		--物品名：薇诺娜的宝石发电机 检查状态：电力不足
			OFF = "科学每次都能战胜魔法。",		--物品名：薇诺娜的宝石发电机 检查状态：处于关闭状态
			BURNING = "熊熊烈火！",		--物品名：薇诺娜的宝石发电机 检查状态：正在燃烧
			BURNT = "科学也没能拯救它。",		--物品名：薇诺娜的宝石发电机 检查状态：已经烧毁
			OVERLOADED = "快要爆炸了！……抱歉，让你看到我在实验室时的旧习惯了。",		--物品名：薇诺娜的宝石发电机 检查状态：电力网络过载
        },
		WINONA_REMOTE =
		{
			GENERIC = "她大概忘了把按钮装到她的机器上了。",		--物品名：称手遥控器 检查状态：普通状态
			OFF = "需要通电。",		--物品名：称手遥控器 检查状态：处于关闭状态
			CHARGING = "她大概忘了把按钮装到她的机器上了。",		--物品名：称手遥控器 检查状态：正在充能
			CHARGED = "她大概忘了把按钮装到她的机器上了。",		--物品名：称手遥控器 检查状态：已经充能
		},
		WINONA_TELEBRELLA =
		{
			GENERIC = "薇诺娜正在头脑风暴。",		--物品名：传送伞 检查状态：普通状态
            MISSINGSKILL = "有趣的设计，但是以我的工资负担不起......",		--物品名：传送伞 检查状态：当前角色尚未解锁所需技能
			OFF = "需要通电。",		--物品名：传送伞 检查状态：处于关闭状态
			CHARGING = "薇诺娜正在头脑风暴。",		--物品名：传送伞 检查状态：正在充能
			CHARGED = "薇诺娜正在头脑风暴。",		--物品名：传送伞 检查状态：已经充能
		},
		WINONA_TELEPORT_PAD_ITEM =
		{
			GENERIC = "它遵循位移理论——东西从介个位置移到辣个位置。",		--物品名：传送运输站 检查状态：普通状态
            MISSINGSKILL = "有趣的设计，但是以我的工资负担不起......",		--物品名：传送运输站 检查状态：当前角色尚未解锁所需技能
			OFF = "需要通电。",		--物品名：传送运输站 检查状态：处于关闭状态
			BURNING = "熊熊烈火！",		--物品名：传送运输站 检查状态：正在燃烧
			BURNT = "科学也没能拯救它。",		--物品名：传送运输站 检查状态：已经烧毁
		},
		WINONA_STORAGE_ROBOT =
		{
			GENERIC = "你不就是最可爱的螺栓筒吗？",		--物品名：薇机人 检查状态：普通状态
			OFF = "是在休息吗？薇诺娜倒是让你喘口气了。",		--物品名：薇机人 检查状态：处于关闭状态
			SLEEP = "你不就是最可爱的螺栓筒吗？",		--物品名：薇机人 检查状态：设备处于休眠状态
			CHARGING = "是在休息吗？薇诺娜倒是让你喘口气了。",		--物品名：薇机人 检查状态：正在充能
			CHARGED = "是在休息吗？薇诺娜倒是让你喘口气了。",		--物品名：薇机人 检查状态：已经充能
		},
		INSPECTACLESBOX = "希望老板不会介意我借用点儿东西。",		--物品名：藏物箱
		INSPECTACLESBOX2 = "中大奖了！",		--物品名：高级藏物箱
		INSPECTACLESHAT = 
        {
            GENERIC = "薇诺娜在我眼里一直是一个对未来有远见的人。",		--物品名：检查专用镜 检查状态：普通状态
            MISSINGSKILL = "我很想知道这些眼镜的规格！哈！",		--物品名：检查专用镜 检查状态：当前角色尚未解锁所需技能
        },
		ROSEGLASSESHAT =
        {
            GENERIC = "跟薇诺娜一贯的风格多少有些出入。",		--物品名：玫瑰色眼镜 检查状态：普通状态
            MISSINGSKILL = "他们身上的某些东西让我真的很想念查理。",		--物品名：玫瑰色眼镜 检查状态：当前角色尚未解锁所需技能
        },
		CHARLIERESIDUE = "我一定是错过了她……但她留下了一些东西。",		--物品名：黑暗痕迹
		CHARLIEROSE = "噢，查理。你又要把我卷进什么事？",		--物品名：脆弱玫瑰
        WINONA_MACHINEPARTS_1 = "在外面根本买不到这样的优质零件！",		--物品名：小玩意
        WINONA_MACHINEPARTS_2 = "喔，这个可以派上很大的用场。",		--物品名：小机械
		WINONA_RECIPESCANNER = "只要用这个校准观察机扫描一下，我就知道东西是怎么造出来的了！",		--物品名：校准观察机
		WINONA_HOLOTELEPAD = "看起来像是老板做的旧设计。我应该扫描一下它。",		--物品名：不稳定传输
		WINONA_HOLOTELEBRELLA = "我应该拿那个校准观察机给它扫描一下。",		--物品名：不稳定传输

        COMPOSTWRAP = "沃姆伍德曾想让我尝一口，但我礼貌的拒绝了。",		--物品名：肥料包
        ARMOR_BRAMBLE = "防守是最好的进攻。",		--物品名：荆棘外壳
        TRAP_BRAMBLE = "谁要是踩上去肯定会被戳到。",		--物品名：荆棘陷阱

        BOATFRAGMENT03 = "就剩下了这一点。",		--物品名：船碎片
        BOATFRAGMENT04 = "就剩下了这一点。",		--物品名：船碎片
        BOATFRAGMENT05 = "就剩下了这一点。",		--物品名：船碎片
		BOAT_LEAK = "要补漏，不然会沉。",		--物品名：漏洞
        MAST = "且慢！桅杆！",		--物品名：桅杆
        SEASTACK = "这是一块石头。",		--物品名：海蚀柱
        FISHINGNET = "就是一张网。", 		--物品名：渔网
        ANTCHOVIES = "啊,我能丢回去吗？", 		--物品名：蚁头凤尾鱼
        STEERINGWHEEL = "来世要做一名水手。",		--物品名：方向舵
        ANCHOR = "我可不想让小船飘走。",		--物品名：锚
        BOATPATCH = "以防不测。",		--物品名：船补丁
        DRIFTWOOD_TREE =
        {
            BURNING = "浮木在燃烧！",		--物品名：浮木 检查状态：正在燃烧
            BURNT = "看起来没什么用了。",		--物品名：浮木 检查状态：已经烧毁
            CHOPPED = "可能还有东西值得挖一挖。",		--物品名：浮木 检查状态：已经砍伐
            GENERIC = "被冲到岸上的一颗枯树。",		--物品名：浮木 检查状态：普通状态
        },

        DRIFTWOOD_LOG = "能浮在水上。",		--物品名：浮木桩

        MOON_TREE =
        {
            BURNING = "树在燃烧。",		--物品名：月树 检查状态：正在燃烧
            BURNT = "树烧尽了。",		--物品名：月树 检查状态：已经烧毁
            CHOPPED = "好粗的一颗树。",		--物品名：月树 检查状态：已经砍伐
            GENERIC = "没曾想月亮上还长树。",		--物品名：月树 检查状态：普通状态
        },
		MOON_TREE_BLOSSOM = "从月亮树上掉下来的。",		--物品名：月树花

        MOONBUTTERFLY =
        {
        	GENERIC = "我渊博的科学知识告诉我，这是一只月光蝴蝶。",		--物品名：月蛾 检查状态：普通状态
        	HELD = "这下抓到你了。",		--物品名：月蛾 检查状态：正被角色携带
        },
		MOONBUTTERFLYWINGS = "美丽的蝴蝶翅膀。",		--物品名：月蛾翅膀
        MOONBUTTERFLY_SAPLING = "蛾子变树？疯狂的月光！",		--物品名：月树苗
        ROCK_AVOCADO_FRUIT = "会把我的牙都咬碎。",		--物品名：石果
        ROCK_AVOCADO_FRUIT_RIPE = "没煮熟的核果最糟了。",		--物品名：成熟石果
        ROCK_AVOCADO_FRUIT_RIPE_COOKED = "够软了，可以吃了。",		--物品名：熟石果
        ROCK_AVOCADO_FRUIT_SPROUT = "它正在生长。",		--物品名：发芽的石果
        ROCK_AVOCADO_BUSH =
        {
        	BARREN = "它结果的日子结束了。",		--物品名：石果灌木丛 检查状态：资源枯竭，需要施肥
			WITHERED = "被热坏了。",		--物品名：石果灌木丛 检查状态：已经枯萎
			GENERIC = "是月亮上来的灌木！",		--物品名：石果灌木丛 检查状态：普通状态
			PICKED = "得过些时间才能结出果实。",		--物品名：石果灌木丛 检查状态：已经采集
			DISEASED = "看上去病的很重。", 		--物品名：石果灌木丛 检查状态：已经患病
            DISEASING = "呃...有些地方不对劲。", 		--物品名：石果灌木丛 检查状态：正在进入患病阶段
			BURNING = "它在燃烧。",		--物品名：石果灌木丛 检查状态：正在燃烧
		},
        DEAD_SEA_BONES = "上了岸，结果落得如此下场。",		--物品名：海骨
        HOTSPRING =
        {
        	GENERIC = "能泡下这身疲倦的身骨该多好。",		--物品名：温泉 检查状态：普通状态
        	BOMBED = "简单的化学反应而已。",		--物品名：温泉 检查状态：被沐浴球处理过
        	GLASS = "水在月光下凝结成玻璃，这就是科学。",		--物品名：温泉 检查状态：温泉水面已经结晶
			EMPTY = "那我就等等它再变满吧。",		--物品名：温泉 检查状态：内容为空
        },
        MOONGLASS = "它非常锋利。",		--物品名：月亮碎片
        MOONGLASS_CHARGED = "我应该在能量耗尽前为它找到科学的用途！",		--物品名：注能月亮碎片
        MOONGLASS_ROCK = "我都能看到自己的倒影。",		--物品名：月光玻璃
        BATHBOMB = "教科书式的化学反应。",		--物品名：沐浴球
        TRAP_STARFISH =
        {
            GENERIC = "噢，多可爱的一只小海星！",		--物品名：海星 检查状态：普通状态
            CLOSED = "它差点吞了我！",		--物品名：海星 检查状态：处于关闭状态
        },
        DUG_TRAP_STARFISH = "它再也骗不了人了。",		--物品名：海星陷阱
        SPIDER_MOON =
        {
        	GENERIC = "好的，月亮让它产生了变异。",		--物品名：破碎蜘蛛 检查状态：普通状态
        	SLEEPING = "感谢科学，终于不动了。",		--物品名：破碎蜘蛛 检查状态：正在睡眠
        	DEAD = "真的死了吧？",		--物品名：破碎蜘蛛 检查状态：已经死亡
        },
        MOONSPIDERDEN = "那可不是寻常的蜘蛛巢。",		--物品名：破碎蜘蛛洞
		FRUITDRAGON =
		{
			GENERIC = "挺可爱的，不过还没熟。",		--物品名：沙拉蝾螈 检查状态：普通状态
			RIPE = "现在应该熟了。",		--物品名：沙拉蝾螈 检查状态：已经成熟
			SLEEPING = "在打盹呢。",		--物品名：沙拉蝾螈 检查状态：正在睡眠
		},
        PUFFIN =
        {
            GENERIC = "我以前从来没见过活的海鹦。",		--物品名：海鹦鹉 检查状态：普通状态
            HELD = "抓到一只，吹嘘一下也不为过。",		--物品名：海鹦鹉 检查状态：正被角色携带
            SLEEPING = "呼呼的安睡。",		--物品名：海鹦鹉 检查状态：正在睡眠
        },

		MOONGLASSAXE = "我把它做的非常好用。",		--物品名：月光玻璃斧
		GLASSCUTTER = "我真的不是打架的料。",		--物品名：玻璃刀

        ICEBERG =
        {
            GENERIC = "一定要避开那东西。", 		--物品名：迷你冰山 检查状态：普通状态
            MELTED = "完全融化了。", 		--物品名：迷你冰山 检查状态：已经融化
        },
        ICEBERG_MELTED = "完全融化了。", 		--物品名：融化的迷你冰山

        MINIFLARE = "我可以点一发，让所有人都知道我在这。",		--物品名：信号弹
        MEGAFLARE = "它会让一切存在都知道我在这里。一切存在。",		--物品名：敌对信号弹

		MOON_FISSURE =
		{
			GENERIC = "平静和恐惧同时在我的脑中回响。",		--物品名：天体裂缝 检查状态：普通状态
			NOLIGHT = "这个地方的裂隙越来越明显。",		--物品名：天体裂缝 检查状态：裂隙尚未发光
		},
        MOON_ALTAR =
        {
            MOON_ALTAR_WIP = "它想被完成。",		--物品名：天体祭坛 检查状态：月亮祭坛仍在组装
            GENERIC = "唔？你说什么？",		--物品名：天体祭坛 检查状态：普通状态
        },

        MOON_ALTAR_IDOL = "我有种强烈的感觉想把它搬走。",		--物品名：天体祭坛雕像
        MOON_ALTAR_GLASS = "它不想待在地上。",		--物品名：天体祭坛底座
        MOON_ALTAR_SEED = "它想让我给它一个家。",		--物品名：天体祭坛宝球

        MOON_ALTAR_ROCK_IDOL = "里面有东西。",		--物品名：吸引人的结构
        MOON_ALTAR_ROCK_GLASS = "里面有东西。",		--物品名：吸引人的结构
        MOON_ALTAR_ROCK_SEED = "里面有东西。",		--物品名：吸引人的结构

        MOON_ALTAR_CROWN = "我钓上来的，现在去找个裂隙吧！",		--物品名：未激活天体贡品
        MOON_ALTAR_COSMIC = "感觉它在等什么事情发生。",		--物品名：天体贡品

        MOON_ALTAR_ASTRAL = "它似乎是一个更大机制的一部分。",		--物品名：天体圣殿
        MOON_ALTAR_ICON = "我知道把你放哪了。",		--物品名：天体圣殿象征
        MOON_ALTAR_WARD = "它需要和其他的那些放在一起。",		--物品名：天体圣殿卫戍

        SEAFARING_PROTOTYPER =
        {
            GENERIC = "是不是该谢谢我了。",		--物品名：智囊团 检查状态：普通状态
            BURNT = "科学在大海上丢失了。",		--物品名：智囊团 检查状态：已经烧毁
        },
        BOAT_ITEM = "在水上做些实验挺不错的。",		--物品名：船套装
        BOAT_GRASS_ITEM = "从技术上讲，这是一条船。",		--物品名：草筏套装
        STEERINGWHEEL_ITEM = "它能做成方向舵。",		--物品名：方向舵套装
        ANCHOR_ITEM = "现在我能造出锚了。",		--物品名：锚套装
        MAST_ITEM = "现在我能造出桅杆了。",		--物品名：桅杆套装
        MUTATEDHOUND =
        {
        	DEAD = "现在我可以轻松的呼吸了。",		--物品名：恐怖猎犬 检查状态：已经死亡
        	GENERIC = "科学，救救我们！",		--物品名：恐怖猎犬 检查状态：普通状态
        	SLEEPING = "有股强烈的欲望让我赶快跑。",		--物品名：恐怖猎犬 检查状态：正在睡眠
        },

        MUTATED_PENGUIN =
        {
			DEAD = "它走到了尽头。",		--物品名：永冻企鸥 检查状态：已经死亡
			GENERIC = "那东西真可怕！",		--物品名：永冻企鸥 检查状态：普通状态
			SLEEPING = "谢天谢地，它在睡觉。",		--物品名：永冻企鸥 检查状态：正在睡眠
		},
        CARRAT =
        {
        	DEAD = "它走到了尽头。",		--物品名：胡萝卜鼠 检查状态：已经死亡
        	GENERIC = "胡萝卜怎么还长腿了？",		--物品名：胡萝卜鼠 检查状态：普通状态
        	HELD = "近看真是丑。",		--物品名：胡萝卜鼠 检查状态：正被角色携带
        	SLEEPING = "有点可爱了。",		--物品名：胡萝卜鼠 检查状态：正在睡眠
        },

		BULLKELP_PLANT =
        {
            GENERIC = "不赖，海带。",		--物品名：公牛海带 检查状态：普通状态
            PICKED = "海带让我激动难耐。",		--物品名：公牛海带 检查状态：已经采集
        },
		BULLKELP_ROOT = "可以种在深海里。",		--物品名：公牛海带茎
        KELPHAT = "有时为了好受点，必须先难受一下。",		--物品名：海花环
		KELP = "把我的口袋全弄湿了，好恶心。",		--物品名：海带叶
		KELP_COOKED = "熟了以后有点稀，黏黏的。",		--物品名：熟海带叶
		KELP_DRIED = "钠的成分有点高。",		--物品名：干海带叶

		GESTALT = "好像能给我...知识。",		--物品名：虚影
        GESTALT_GUARD = "它跟我保证……靠得太近就扇我一巴掌。",		--物品名：大虚影

		COOKIECUTTER = "我不喜欢它盯着船看的眼神……",		--物品名：饼干切割机
		COOKIECUTTERSHELL = "曾经尖牙利齿，如今只剩空壳。",		--物品名：饼干切割机壳
		COOKIECUTTERHAT = "至少不会打湿我的头发。",		--物品名：饼干切割机帽子
		SALTSTACK =
		{
			GENERIC = "是天然形成的吗？",		--物品名：盐堆 检查状态：普通状态
			MINED_OUT = "挖过了……全挖过了！",		--物品名：盐堆 检查状态：已经采空
			GROWING = "我猜它自己就是会长成这样。",		--物品名：盐堆 检查状态：正在生长
		},
		SALTROCK = "科学催促我去舔一下。",		--物品名：盐晶
		SALTBOX = "防止食物变质的灵药！",		--物品名：盐盒

		TACKLESTATION = "是时候解决海钓的问题了。",		--物品名：钓具容器
		TACKLESKETCH = "某种钓具的图片。我打赌我自己就能做……",		--物品名：{item}广告

        MALBATROSS = "禽鸟巨兽！",		--物品名：邪天翁
        MALBATROSS_FEATHER = "从大鸟身上拔下的漂亮羽毛。",		--物品名：邪天翁羽毛
        MALBATROSS_BEAK = "闻起来有鱼腥味。",		--物品名：邪天翁喙
        MAST_MALBATROSS_ITEM = "它比看上去还轻。",		--物品名：飞翼风帆套装
        MAST_MALBATROSS = "展翅远航！",		--物品名：飞翼风帆
		MALBATROSS_FEATHERED_WEAVE = "我在织羽毛被！",		--物品名：羽毛帆布

        GNARWAIL =
        {
            GENERIC = "天啊，你的角真大。",		--物品名：一角鲸 检查状态：普通状态
            BROKENHORN = "你的鼻子没了！",		--物品名：一角鲸 检查状态：角已经折断
            FOLLOWER = "鲸鱼，挺好的。",		--物品名：一角鲸 检查状态：已经成为当前角色的跟随者
            BROKENHORN_FOLLOWER = "这就是你到处伸鼻子的下场！",		--物品名：一角鲸 检查状态：已跟随当前角色且角已折断
        },
        GNARWAIL_HORN = "不可思议！",		--物品名：一角鲸的角

        WALKINGPLANK = "我们就不能造一艘救生船吗？",		--物品名：跳板
        WALKINGPLANK_GRASS = "我们就不能造一艘救生船吗？",		--物品名：跳板
        OAR = "手动加速。",		--物品名：桨
		OAR_DRIFTWOOD = "手动加速船只。",		--物品名：浮木桨

		OCEANFISHINGROD = "这才是货真价实的海钓竿！",		--物品名：海钓竿
		OCEANFISHINGBOBBER_NONE = "可以用浮漂提高准度。",		--物品名：鱼钩
        OCEANFISHINGBOBBER_BALL = "鱼群会喜欢这个球的。",		--物品名：木球浮漂
        OCEANFISHINGBOBBER_OVAL = "那些鱼这次休想逃出我的手掌心！",		--物品名：硬物浮漂
		OCEANFISHINGBOBBER_CROW = "我吃鱼，不吃乌鸦。",		--物品名：黑羽浮漂
		OCEANFISHINGBOBBER_ROBIN = "希望别引来红鲱鱼。",		--物品名：红羽浮漂
		OCEANFISHINGBOBBER_ROBIN_WINTER = "雪鸟的羽毛十分高冷。",		--物品名：蔚蓝羽浮漂
		OCEANFISHINGBOBBER_CANARY = "快来跟我的小伙伴问好！",		--物品名：黄羽浮漂
		OCEANFISHINGBOBBER_GOOSE = "你要完了，鱼！",		--物品名：鹅羽浮漂
		OCEANFISHINGBOBBER_MALBATROSS = "这么漂亮的羽毛，见过没。",		--物品名：邪天翁羽浮漂

		OCEANFISHINGLURE_SPINNER_RED = "也许有鱼会上当！",		--物品名：日出旋转亮片
		OCEANFISHINGLURE_SPINNER_GREEN = "也许有鱼会上当！",		--物品名：黄昏旋转亮片
		OCEANFISHINGLURE_SPINNER_BLUE = "也许有鱼会上当！",		--物品名：夜间旋转亮片
		OCEANFISHINGLURE_SPOON_RED = "也许有小鱼会上当！",		--物品名：日出匙型假饵
		OCEANFISHINGLURE_SPOON_GREEN = "也许有小鱼会上当！",		--物品名：黄昏匙型假饵
		OCEANFISHINGLURE_SPOON_BLUE = "也许有小鱼会上当！",		--物品名：夜间匙型假饵
		OCEANFISHINGLURE_HERMIT_RAIN = "把自己弄湿能帮助我像鱼一样思考……",		--物品名：雨天鱼饵
		OCEANFISHINGLURE_HERMIT_SNOW = "鱼儿都不会知道是谁下的手！",		--物品名：雪天鱼饵
		OCEANFISHINGLURE_HERMIT_DROWSY = "我的大脑有一层硬科学在保护！",		--物品名：麻醉鱼饵
		OCEANFISHINGLURE_HERMIT_HEAVY = "感觉有些沉重。",		--物品名：重量级鱼饵

		OCEANFISH_SMALL_1 = "看起来是个小家伙。",		--物品名：小孔雀鱼
		OCEANFISH_SMALL_2 = "这条不会给我带来吹嘘的资本。",		--物品名：针鼻喷墨鱼
		OCEANFISH_SMALL_3 = "还没长开。",		--物品名：小饵鱼
		OCEANFISH_SMALL_4 = "小鱼小虾，成不了大气候。",		--物品名：三文鱼苗
		OCEANFISH_SMALL_5 = "我等不及一口吞了它！",		--物品名：爆米花鱼
		OCEANFISH_SMALL_6 = "“叶”见为食啊。",		--物品名：落叶比目鱼
		OCEANFISH_SMALL_7 = "总算给我抓到开花的鱼了！",		--物品名：花朵金枪鱼
		OCEANFISH_SMALL_8 = "烫得很呢！",		--物品名：炽热太阳鱼
        OCEANFISH_SMALL_9 = "只是随便说说，不过我应该能让你派上用场……",		--物品名：口水鱼

		OCEANFISH_MEDIUM_1 = "看着丑，希望味道好吃点吧。",		--物品名：泥鱼
		OCEANFISH_MEDIUM_2 = "花大力气钓的。",		--物品名：斑鱼
		OCEANFISH_MEDIUM_3 = "我钓鱼的技术可不是盖的！",		--物品名：浮夸狮子鱼
		OCEANFISH_MEDIUM_4 = "不知道这个会不会带来厄运。",		--物品名：黑鲶鱼
		OCEANFISH_MEDIUM_5 = "这条鱼看着有些俗气。",		--物品名：玉米鳕鱼
		OCEANFISH_MEDIUM_6 = "好一条大肥鱼！",		--物品名：花锦鲤
		OCEANFISH_MEDIUM_7 = "好一条大肥鱼！",		--物品名：金锦鲤
		OCEANFISH_MEDIUM_8 = "冰鲷鱼。",		--物品名：冰鲷鱼
        OCEANFISH_MEDIUM_9 = "成功钓鱼之旅的甜蜜味道。",		--物品名：甜味鱼

		PONDFISH = "我现在要吃上一整天。",		--物品名：淡水鱼
		PONDEEL = "这能做一道好菜。",		--物品名：活鳗鱼

        FISHMEAT = "一块鱼肉。",		--物品名：生鱼肉
        FISHMEAT_COOKED = "烤得恰到好处。",		--物品名：鱼排
        FISHMEAT_SMALL = "一点点鱼肉。",		--物品名：小鱼块
        FISHMEAT_SMALL_COOKED = "一点点熟鱼肉。",		--物品名：熟小鱼块
		SPOILED_FISH =
        {
            GENERIC = "我不太想知道那种气味是怎么来的。",		--物品名：变质的鱼 检查状态：普通状态
            CAN_PROCESS = "让开，有机物们。只有我能把这个处理成食物",		--物品名：变质的鱼 检查状态：可放入堆肥设施处理
        },

		FISH_BOX = "它们像沙丁鱼一样塞得满满的！",		--物品名：锡鱼罐
        POCKET_SCALE = "低配称重设备。",		--物品名：弹簧秤

		TACKLECONTAINER = "这件额外的储存工具钩住了我的注意力。",		--物品名：钓具箱
		SUPERTACKLECONTAINER = "我费了九牛二虎之力才弄到手的。",		--物品名：超级钓具箱

		TROPHYSCALE_FISH =
		{
			GENERIC = "来瞻仰我今天的海钓成绩吧！",		--物品名：鱼类计重器 检查状态：普通状态
			HAS_ITEM = "重量: {weight}\n捕获人: {owner}",		--物品名：鱼类计重器 检查状态：已经放置物品
			HAS_ITEM_HEAVY = "重量: {weight}\n捕获人: {owner}\n所获颇丰!",		--物品名：鱼类计重器 检查状态：放置物品重量较大
			BURNING = "如果要给火爆程度打分……全烧起来了。",		--物品名：鱼类计重器 检查状态：正在燃烧
			BURNT = "我所有吹嘘的资本全都给烧没了！",		--物品名：鱼类计重器 检查状态：已经烧毁
			OWNER = "完全没有炫技的意思，大家就随便看看……\n重量: {weight}\n捕获人: {owner}",		--物品名：鱼类计重器 检查状态：当前角色是秤上物品的主人
			OWNER_HEAVY = "重量: {weight}\n捕获人: {owner}\n还真抓了条大肥鱼！",		--物品名：鱼类计重器 检查状态：当前角色拥有秤上的重型物品
		},

		OCEANFISHABLEFLOTSAM = "长了些泥巴的草。",		--物品名：海洋残骸

		CALIFORNIAROLL = "但我没有筷子。",		--物品名：加州卷
		SEAFOODGUMBO = "一大碗海鲜浓汤。",		--物品名：海鲜浓汤
		SURFNTURF = "太完美了！",		--物品名：海鲜牛排

        WOBSTER_SHELLER = "好一只调皮的龙虾。",		--物品名：龙虾
        WOBSTER_DEN = "一块石头，里面有龙虾。",		--物品名：龙虾窝
        WOBSTER_SHELLER_DEAD = "这烹饪出来应该挺不错的。",		--物品名：死龙虾
        WOBSTER_SHELLER_DEAD_COOKED = "我等不及要吃了你。",		--物品名：美味的龙虾

        LOBSTERBISQUE = "可以再加点盐，但是不关我的事。",		--物品名：龙虾汤
        LOBSTERDINNER = "如果我早上吃它，它还算正餐吗？",		--物品名：龙虾正餐

        WOBSTER_MOONGLASS = "好一只调皮的月光龙虾。",		--物品名：月光龙虾
        MOONGLASS_WOBSTER_DEN = "一块月光玻璃，里面有月光龙虾。",		--物品名：月光玻璃窝

		TRIDENT = "等着轰轰轰吧！",		--物品名：刺耳三叉戟

		WINCH =
		{
			GENERIC = "这个在必要时能派上用场。",		--物品名：夹夹绞盘 检查状态：普通状态
			RETRIEVING_ITEM = "重活就交给它干吧。",		--物品名：夹夹绞盘 检查状态：绞盘正在收回物品
			HOLDING_ITEM = "看看这里是什么东西？",		--物品名：夹夹绞盘 检查状态：绞盘正吊着物品
		},

        HERMITHOUSE = {
            GENERIC = "这是一座空壳房子。",		--物品名：隐士之家 检查状态：普通状态
            BUILTUP = "它只需要一点点的爱。",		--物品名：隐士之家 检查状态：房屋已经完成升级
        },

        SHELL_CLUSTER = "我打赌里面有不少漂亮贝壳。",		--物品名：贝壳堆
		SINGINGSHELL_OCTAVE3 =
		{
			GENERIC = "调有点低。",		--物品名：低音贝壳钟 检查状态：普通状态
		},
		SINGINGSHELL_OCTAVE4 =
		{
			GENERIC = "这就是大海的声音吗？",		--物品名：中音贝壳钟 检查状态：普通状态
		},
		SINGINGSHELL_OCTAVE5 =
		{
			GENERIC = "它可以发出高音C。",		--物品名：高音贝壳钟 检查状态：普通状态
        },

        CHUM = "鱼儿的美味佳肴！",		--物品名：鱼食

        SUNKENCHEST =
        {
            GENERIC = "真正的宝物是我们在寻宝过程中的成长。",		--物品名：沉底宝箱 检查状态：普通状态
            LOCKED = "贝壳闭上了！",		--物品名：沉底宝箱 检查状态：处于锁定状态
        },

        HERMIT_BUNDLE = "这些东西她有的是。",		--物品名：一包谢意
        HERMIT_BUNDLE_SHELLS = "她确实是卖海贝壳的！",		--物品名：贝壳钟包

        RESKIN_TOOL = "我喜欢这些粉尘！感觉十分学术！",		--物品名：清洁扫把
        MOON_FISSURE_PLUGGED = "虽然不科学……但是很有效。",		--物品名：堵住的裂缝



        WOBYBIG =
        {
            "你以科学的名义给她喂了什么？",		--物品名：沃比 检查状态：第1条台词变体
            "你以科学的名义给她喂了什么？",		--物品名：沃比 检查状态：第2条台词变体
        },
        WOBYSMALL =
        {
            "科学证明，喂养宠物狗能够显著改善心情。",		--物品名：沃比 检查状态：第1条台词变体
            "科学证明，喂养宠物狗能够显著改善心情。",		--物品名：沃比 检查状态：第2条台词变体
        },
		WALTERHAT = "我年轻的时候也没喜欢过“户外活动”。",		--物品名：松树先锋队帽子
		SLINGSHOT =
		{
			GENERIC = "所有玻璃的噩梦。",		--物品名：可靠的弹弓 检查状态：普通状态
			NOT_MINE = "我真的不应该捡起不属于我的东西。",		--物品名：可靠的弹弓 检查状态：不属于当前角色
		},
		SLINGSHOTAMMO_ROCK = "即将打出的弹药。",		--物品名：鹅卵石
		SLINGSHOTAMMO_MARBLE = "即将打出的弹药。",		--物品名：大理石弹
		SLINGSHOTAMMO_THULECITE = "即将打出的弹药。",		--物品名：诅咒弹药
        SLINGSHOTAMMO_GOLD = "即将打出的弹药。",		--物品名：黄金弹药
		SLINGSHOTAMMO_HONEY = "即将打出的弹药。",		--物品名：黏黏弹
        SLINGSHOTAMMO_SLOW = "即将打出的弹药。",		--物品名：减速弹药
        SLINGSHOTAMMO_FREEZE = "即将打出的弹药。",		--物品名：冰冻弹药
		SLINGSHOTAMMO_POOP = "粪便弹道。",		--物品名：便便弹
		SLINGSHOTAMMO_STINGER = "子弹，能叮咬？",		--物品名：针刺弹
		SLINGSHOTAMMO_MOONGLASS = "子弹，能被打……发出去？",		--物品名：月亮弹
		SLINGSHOTAMMO_GELBLOB = "即将打出的弹药。",		--物品名：恶液弹
		SLINGSHOTAMMO_SCRAPFEATHER = "即将打出的弹药。",		--物品名：电击废料弹
        SLINGSHOTAMMO_DREADSTONE = "即将打出的弹药。",		--物品名：绝望小石
        SLINGSHOTAMMO_GUNPOWDER = "即将打出的弹药。",		--物品名：轰轰弹
        SLINGSHOTAMMO_LUNARPLANTHUSK = "即将打出的弹药。",		--物品名：亮茄外壳弹药
        SLINGSHOTAMMO_PUREBRILLIANCE = "即将打出的弹药。",		--物品名：纯粹辉煌弹药
        SLINGSHOTAMMO_HORRORFUEL = "即将打出的弹药。",		--物品名：纯粹恐惧弹药
        PORTABLETENT = "我感觉已经几辈子没睡过好觉了！",		--物品名：宿营帐篷
        PORTABLETENT_ITEM = "有了帐篷可不要膨胀。",		--物品名：帐篷卷

        BATTLESONG_DURABILITY = "戏剧让我坐立不安。",		--物品名：武器化的颤音
        BATTLESONG_HEALTHGAIN = "戏剧让我坐立不安。",		--物品名：心碎歌谣
        BATTLESONG_SANITYGAIN = "戏剧让我坐立不安。",		--物品名：醍醐灌顶华彩
        BATTLESONG_SANITYAURA = "戏剧让我坐立不安。",		--物品名：英勇美声颂
        BATTLESONG_FIRERESISTANCE = "我有一次看戏前不小心把背心烧出个洞。我称此为戏剧性熨烫。",		--物品名：防火假声
        BATTLESONG_INSTANT_TAUNT = "恐怕我不是一个持照诗人。",		--物品名：粗鲁插曲
        BATTLESONG_INSTANT_PANIC = "恐怕我不是一个持照诗人。",		--物品名：惊心独白

        MUTATOR_WARRIOR = "哦，哇，这看起来嗯……很好吃，韦伯!",		--物品名：战士变身涂鸦
        MUTATOR_DROPPER = "呃，我……刚吃过饭！你拿去给你的蜘蛛朋友好吗？",		--物品名：悬蛛变身涂鸦
        MUTATOR_HIDER = "哦，哇，这看起来嗯……很好吃，韦伯!",		--物品名：洞穴变身涂鸦
        MUTATOR_SPITTER = "呃，我……刚吃过饭！你拿去给你的蜘蛛朋友好吗？",		--物品名：喷吐变身涂鸦
        MUTATOR_MOON = "哦，哇，这看起来嗯……很好吃，韦伯!",		--物品名：破碎变身涂鸦
        MUTATOR_HEALER = "呃，我……刚吃过饭！你拿去给你的蜘蛛朋友好吗？",		--物品名：护士变身涂鸦
        SPIDER_WHISTLE = "我可不想引来任何蜘蛛!",		--物品名：韦伯口哨
        SPIDERDEN_BEDAZZLER = "看起来某人的手艺提高了不少啊。",		--物品名：蛛巢装饰套装
        SPIDER_HEALER = "哦，太好了。现在蜘蛛可以自愈了。",		--物品名：护士蜘蛛
        SPIDER_REPELLENT = "如果科学能让它为我所用就好了。",		--物品名：驱赶盒子
        SPIDER_HEALER_ITEM = "要是看到蜘蛛，我一定会把它送给它们。也许吧。",		--物品名：治疗黏团

		GHOSTLYELIXIR_SLOWREGEN = "嗯，对。非常科学。",		--物品名：亡者补药
		GHOSTLYELIXIR_FASTREGEN = "嗯，对。非常科学。",		--物品名：灵魂万灵药
		GHOSTLYELIXIR_SHIELD = "嗯，对。非常科学。",		--物品名：不屈药剂
		GHOSTLYELIXIR_ATTACK = "嗯，对。非常科学。",		--物品名：夜影万金油
		GHOSTLYELIXIR_SPEED = "嗯，对。非常科学。",		--物品名：强健精油
		GHOSTLYELIXIR_RETALIATION = "嗯，对。非常科学。",		--物品名：蒸馏复仇
        GHOSTLYELIXIR_REVIVE = "嗯，对。非常科学。",		--物品名：恐怖经历
		SISTURN =
		{
			GENERIC = "弄点花会显得更有生机。",		--物品名：姐妹骨灰罐 检查状态：普通状态
			SOME_FLOWERS = "多拿些花来应该就可以了。",		--物品名：姐妹骨灰罐 检查状态：放置了少量花朵
			LOTS_OF_FLOWERS = "好美的花束！",		--物品名：姐妹骨灰罐 检查状态：放置了大量普通花朵
            LOTS_OF_FLOWERS_EVIL = "它让我感觉不妙。",		--物品名：姐妹骨灰罐 检查状态：放置了大量恶魔花
            LOTS_OF_FLOWERS_BLOSSOM = "多么怪异的声音。",   		--物品名：姐妹骨灰罐 检查状态：放置了大量月树花
		},

        WORTOX_SOUL = "哼！看起来很好吃。", 		--物品名：灵魂
        WORTOX_NABBAG = "跟坎普斯是一个模子里印出来的家伙。",		--物品名：强抢袋
        WORTOX_REVIVER = "我能猜到那个有毛用。",		--物品名：双尾心
        WORTOX_SOULJAR = "如果你仔细想想，它还真不是一般的罐子。",		--物品名：灵魂罐

        PORTABLECOOKPOT_ITEM =
        {
            GENERIC = "这才是烹饪！",		--物品名：便携烹饪锅 检查状态：普通状态
            DONE = "行，做完饭了！",		--物品名：便携烹饪锅 检查状态：处理已经完成

			COOKING_LONG = "这顿饭需要一点时间了。",		--物品名：便携烹饪锅 检查状态：正在烹饪，剩余时间较长
			COOKING_SHORT = "马上就能好！",		--物品名：便携烹饪锅 检查状态：正在烹饪，即将完成
			EMPTY = "我打赌里面什么都没有。",		--物品名：便携烹饪锅 检查状态：内容为空
        },

        PORTABLEBLENDER_ITEM = "把所有食物混合起来。",		--物品名：便携研磨器
        PORTABLESPICER_ITEM =
        {
            GENERIC = "它可以给食物增添辛香风味。",		--物品名：便携香料站 检查状态：普通状态
            DONE = "应该能让饭菜更可口。",		--物品名：便携香料站 检查状态：处理已经完成
        },
        SPICEPACK = "烹饪科学的突破！",		--物品名：厨师袋
        SPICE_GARLIC = "威力强大的粉末。",		--物品名：蒜粉
        SPICE_SUGAR = "甜！真甜！",		--物品名：蜂蜜水晶
        SPICE_CHILI = "一壶液体火焰。",		--物品名：辣椒碎
        SPICE_SALT = "适量的钠对心脏有好处。",		--物品名：调味盐
        MONSTERTARTARE = "这儿一定还有别的什么能吃的。",		--物品名：怪物鞑靼
        FRESHFRUITCREPES = "甜水果！营养均衡的早餐的一部分。",		--物品名：鲜果可丽饼
        FROGFISHBOWL = "这是鱼里面塞了只青蛙吗？",		--物品名：蓝带鱼排
        POTATOTORNADO = "土豆，科学的融合了龙卷风的力量！",		--物品名：花式回旋块茎
        DRAGONCHILISALAD = "希望能承受住辛辣的程度。",		--物品名：辣龙椒沙拉
        GLOWBERRYMOUSSE = "沃利烧的一手好菜。",		--物品名：发光浆果慕斯
        VOLTGOATJELLY = "惊人的美味。",		--物品名：伏特羊肉冻
        NIGHTMAREPIE = "有点吓人啊。",		--物品名：恐怖国王饼
        BONESOUP = "沃利骨子里是名好厨师。",		--物品名：骨头汤
        MASHEDPOTATOES = "我听说做饭基本上就是化学。我应该试试。",		--物品名：奶油土豆泥
        POTATOSOUFFLE = "我都忘记了可口的饭菜是什么味道！",		--物品名：蓬松土豆蛋奶酥
        MOQUECA = "他把横溢的才华用在了烹饪，我用在了科学。",		--物品名：海鲜杂烩
        GAZPACHO = "不科学啊，怎么这么好吃？",		--物品名：芦笋冷汤
        ASPARAGUSSOUP = "闻起来很好吃。",		--物品名：芦笋汤
        VEGSTINGER = "你能把芹菜当吸管用吗？",		--物品名：蔬菜鸡尾酒
        BANANAPOP = "不，别冻大脑！我需要它来做科学研究！",		--物品名：香蕉冻
        CEVICHE = "能弄一只大点的碗吗？这只看起来有点小。",		--物品名：酸橘汁腌鱼
        SALSA = "真...辣...！",		--物品名：生鲜萨尔萨酱
        PEPPERPOPPER = "这么一大口！",		--物品名：爆炒填馅辣椒

        TURNIP = "是个生萝卜。",		--物品名：大萝卜
        TURNIP_COOKED = "做饭就是将科学付诸实践。",		--物品名：烤大萝卜
        TURNIP_SEEDS = "一把古怪的种子。",		--物品名：圆形种子

        GARLIC = "第一口气清新剂。",		--物品名：大蒜
        GARLIC_COOKED = "完美的焦黄。",		--物品名：烤大蒜
        GARLIC_SEEDS = "一把古怪的种子。",		--物品名：种子荚

        ONION = "看起来很脆。",		--物品名：洋葱
        ONION_COOKED = "一次成功的化学反应。",		--物品名：烤洋葱
        ONION_SEEDS = "一把古怪的种子。",		--物品名：尖形种子

        POTATO = "埋在地下的苹果。",		--物品名：土豆
        POTATO_COOKED = "一次成功的温度实验。",		--物品名：烤土豆
        POTATO_SEEDS = "一把古怪的种子。",		--物品名：毛茸茸的种子

        TOMATO = "红色的，满满都是科学。",		--物品名：番茄
        TOMATO_COOKED = "懂化学的话做饭就非常简单了。",		--物品名：烤番茄
        TOMATO_SEEDS = "一把古怪的种子。",		--物品名：带刺的种子

        ASPARAGUS = "一种蔬菜。",		--物品名：芦笋
        ASPARAGUS_COOKED = "科学说这对我有好处。",		--物品名：烤芦笋
        ASPARAGUS_SEEDS = "就是些种子。",		--物品名：筒状种子

        PEPPER = "好一个火辣辣的辣椒。",		--物品名：辣椒
        PEPPER_COOKED = "本来就是辣的。",		--物品名：烤辣椒
        PEPPER_SEEDS = "一把种子。",		--物品名：块状种子

        WEREITEM_BEAVER = "我猜科学在北方有不同的奏效方法。",		--物品名：俗气海狸像
        WEREITEM_GOOSE = "它让我浑身起鸡皮疙瘩。",		--物品名：俗气鹅像
        WEREITEM_MOOSE = "一头再正常不过的受诅咒的鹿。",		--物品名：俗气鹿像

        MERMHAT = "我终于能在公开场合以真面目示人了。",        		--物品名：聪明的伪装
        MERMTHRONE =
        {
            GENERIC = "配得上沼泽之王的地位！",		--物品名：皇家地毯 检查状态：普通状态
            BURNT = "本来那王座就一股鱼腥味。",		--物品名：皇家地毯 检查状态：已经烧毁
        },
        MOSQUITOMUSK = "那些吸血鬼休想碰我！",		--物品名：小痒痒
        MOSQUITOBOMB = "我手痒想把它扔出去。",		--物品名：蚊子炸弹
        MOSQUITOFERTILIZER = "植物居然喜欢它。",		--物品名：嗡嗡肥料
        MOSQUITOMERMSALVE = "这是鱼人之间最潮的东西。",		--物品名：蚊血注射液

        MERMTHRONE_CONSTRUCTION =
        {
            GENERIC = "她究竟在盘算什么？",		--物品名：皇家手工套装 检查状态：普通状态
            BURNT = "永远都不会这道它原来是什么了。",		--物品名：皇家手工套装 检查状态：已经烧毁
        },
        MERMHOUSE_CRAFTED =
        {
            GENERIC = "样子还挺可爱的。",		--物品名：鱼人工艺屋 检查状态：普通状态
            BURNT = "啊，刺鼻的味道！",		--物品名：鱼人工艺屋 检查状态：已经烧毁
        },

        MERMWATCHTOWER_REGULAR = "他们找到了国王后高兴了起来。",		--物品名：普通鱼人瞭望塔
        MERMWATCHTOWER_NOKING = "皇帝守卫没有皇帝可以守卫。",		--物品名：无鱼人之王时的鱼人瞭望塔
        MERMKING = "国王陛下！",		--物品名：鱼人之王
        MERMGUARD = "在他们周围感觉受到了护卫……",		--物品名：忠诚鱼人守卫
        MERM_PRINCE = "他们遵循先到先得的规矩。",		--物品名：皇室练习生

        SQUID = "我有预感会派上用场。",		--物品名：鱿鱼

		GHOSTFLOWER = "我科学的大脑拒绝相信这一切。",		--物品名：哀悼荣耀
        SMALLGHOST = "嗷，你是不是个小可爱啊？",		--物品名：小惊吓

        CRABKING =
        {
            GENERIC = "咦！蟹蟹您啊。",		--物品名：帝王蟹 检查状态：普通状态
            INERT = "那座城堡需要装修一下。",		--物品名：帝王蟹 检查状态：缺少激活条件，处于静止状态
        },
		CRABKING_CLAW = "警惕蟹爪！",		--物品名：巨钳

		MESSAGEBOTTLE = "不知道是不是送给我的！",		--物品名：瓶中信
		MESSAGEBOTTLEEMPTY = "空无一物。",		--物品名：空瓶子

        MEATRACK_HERMIT =
        {
            DONE = "肉干可以吃了！",		--物品名：晾肉架 检查状态：处理已经完成
            DRYING = "肉风干需要一些时间。",		--物品名：晾肉架 检查状态：肉类正在晾晒
            DRYINGINRAIN = "雨天晾干肉需要更长时间。",		--物品名：晾肉架 检查状态：雨中仍挂着肉类，晾晒暂停
            GENERIC = "肉晾在这里应该错不了。",		--物品名：晾肉架 检查状态：普通状态
            BURNT = "晾肉架烧掉了。",		--物品名：晾肉架 检查状态：已经烧毁
            DONE_NOTMEAT = "实验术语里，我们管它叫“干燥”。",		--物品名：晾肉架 检查状态：非肉类晾晒已经完成
            DRYING_NOTMEAT = "风干可算不上科学。",		--物品名：晾肉架 检查状态：非肉类正在晾晒
            DRYINGINRAIN_NOTMEAT = "雨啊，快走开。想下，改天来。",		--物品名：晾肉架 检查状态：雨中仍挂着非肉类，晾晒暂停
        },
        BEEBOX_HERMIT =
        {
            READY = "它里面装满了蜂蜜。",		--物品名：蜂箱 检查状态：已经准备就绪
            FULLHONEY = "它里面装满了蜂蜜。",		--物品名：蜂箱 检查状态：蜂蜜储量已满
            GENERIC = "不知道里面有没有些许甜蜜。",		--物品名：蜂箱 检查状态：普通状态
            NOHONEY = "它是空的。",		--物品名：蜂箱 检查状态：没有蜂蜜
            SOMEHONEY = "需要等一会。",		--物品名：蜂箱 检查状态：存有少量蜂蜜
            BURNT = "怎么被烧掉的？！！",		--物品名：蜂箱 检查状态：已经烧毁
        },

        HERMITCRAB = "一个人住多少会寂寞吧。",		--物品名：寄居蟹隐士

        HERMIT_PEARL = "我会照顾好它。",		--物品名：珍珠的珍珠
        HERMIT_CRACKED_PEARL = "我……没有照顾好它。",		--物品名：开裂珍珠

        WATERPLANT = "只要我们不拿它们的藤壶，它们就会跟我们做朋友。",		--物品名：海草
        WATERPLANT_BOMB = "是种子啊！",		--物品名：种壳
        WATERPLANT_BABY = "还在萌芽阶段。",		--物品名：海芽
        WATERPLANT_PLANTER = "它们在大海中的岩石上长的最好。",		--物品名：海芽插穗

        SHARK = "我们可能需要一艘更大的船……",		--物品名：岩石大白鲨

        MASTUPGRADE_LAMP_ITEM = "我有的都是闪闪发光的好主意。",		--物品名：甲板照明灯
        MASTUPGRADE_LIGHTNINGROD_ITEM = "我已经驾驭了陆上和海上的电力！",		--物品名：避雷导线

        WATERPUMP = "可以非常有效的灭火。",		--物品名：消防泵

        BARNACLE = "看着不像是指关节。",		--物品名：藤壶
        BARNACLE_COOKED = "我听说这是一道珍馐美味。",		--物品名：熟藤壶

        BARNACLEPITA = "你看不见它们是藤壶的时候，它们的味道会更好。",		--物品名：藤壶皮塔饼
        BARNACLESUSHI = "我的筷子好像还是放错了地方。",		--物品名：藤壶握寿司
        BARNACLINGUINE = "把面递过来！",		--物品名：藤壶中细面
        BARNACLESTUFFEDFISHHEAD = "我真是饿得够呛，居然连它都会考虑……",		--物品名：酿鱼头

        LEAFLOAF = "神秘叶子肉。",		--物品名：叶肉糕
        LEAFYMEATBURGER = "虽然是素食，但也挺残忍的。",		--物品名：素食堡
        LEAFYMEATSOUFFLE = "这科技是不是有点走偏了？",		--物品名：果冻沙拉
        MEATYSALAD = "屈屈一份沙拉，居然这么顶饱。",		--物品名：牛肉绿叶菜


		MOLEBAT = "一只标准的小吸血鬼。",		--物品名：裸鼹蝠
        MOLEBATHILL = "不知道那个老鼠窝里藏了什么。",		--物品名：裸鼹蝠丘

        BATNOSE = "有人知道这是谁的鼻子吗？",		--物品名：裸露鼻孔
        BATNOSE_COOKED = "出来的时候，闻到的是鼻子的味道。",		--物品名：炭烤鼻孔
        BATNOSEHAT = "有了它喝奶都不用动手了。",		--物品名：牛奶帽

        MUSHGNOME = "它也许会周期性的发起攻击。",		--物品名：蘑菇地精

        SPORE_MOON = "我要尽量离这些孢子远一点。",		--物品名：月亮孢子

        MOON_CAP = "看起来不怎么好吃。",		--物品名：月亮蘑菇
        MOON_CAP_COOKED = "我为了科学也是豁出去了……",		--物品名：熟月亮蘑菇

        MUSHTREE_MOON = "这颗蘑菇树明显跟其他的有异。",		--物品名：月亮蘑菇树

        LIGHTFLIER = "真是奇怪，装在我的口袋里居然还能发光！",		--物品名：球状光虫

        GROTTO_POOL_BIG = "来自月亮的水让玻璃增长了。这就是科学。",		--物品名：玻璃绿洲
        GROTTO_POOL_SMALL = "来自月亮的水让玻璃增长了。这就是科学。",		--物品名：小玻璃绿洲

        DUSTMOTH = "真是些整齐的小家伙，不是吗？",		--物品名：尘蛾

        DUSTMOTHDEN = "它们在里面过得很舒服。",		--物品名：整洁洞穴

        ARCHIVE_LOCKBOX = "我怎么把知识取出来呢？",		--物品名：蒸馏的知识
        ARCHIVE_CENTIPEDE = "你休想阻止我进步！",		--物品名：远古哨兵蜈蚣
        ARCHIVE_CENTIPEDE_HUSK = "一堆旧零件。",		--物品名：哨兵蜈蚣壳

        ARCHIVE_COOKPOT =
        {
            COOKING_LONG = "这还需要一点时间。",		--物品名：远古窑 检查状态：正在烹饪，剩余时间较长
            COOKING_SHORT = "就快好了！",		--物品名：远古窑 检查状态：正在烹饪，即将完成
            DONE = "嗯！可以吃了！",		--物品名：远古窑 检查状态：处理已经完成
            EMPTY = "把上面的灰尘先抖干净，怎么样？",		--物品名：远古窑 检查状态：内容为空
            BURNT = "锅给烧没了。",		--物品名：远古窑 检查状态：已经烧毁
        },

        ARCHIVE_MOON_STATUE = "这些宏伟的月亮雕像让我充满了诗意。",		--物品名：远古月亮雕像
        ARCHIVE_RUNE_STATUE =
        {
            LINE_1 = "如此多的知识，我要是能看懂就好了！",		--物品名：远古月符石 检查状态：第一段碑文或记录
            LINE_2 = "这些标记看起来与其他废墟中的标记不同。",		--物品名：远古月符石 检查状态：第二段碑文或记录
            LINE_3 = "如此多的知识，我要是能看懂就好了！",		--物品名：远古月符石 检查状态：第三段碑文或记录
            LINE_4 = "这些标记看起来与其他废墟中的标记不同。",		--物品名：远古月符石 检查状态：第四段碑文或记录
            LINE_5 = "如此多的知识，我要是能看懂就好了！",		--物品名：远古月符石 检查状态：第五段碑文或记录
        },
		VAULT_RUNE = "我看不懂那个。",		--物品名：圣殿月符石
		VAULT_STATUE =
		{
			LORE1 = "他的尾声是黑暗的……",		--物品名：圣殿雕像 检查状态：第一段背景记载
			LORE2 = "它蠢蠢欲动的样子真让我发毛。",		--物品名：圣殿雕像 检查状态：第二段背景记载
			LORE3 = "好一个尖锐的表达。",		--物品名：圣殿雕像 检查状态：第三段背景记载
            LORE1_STALKER = "I can see how that might be upsetting to you.", 		--物品名：圣殿雕像 检查状态：显示与远古织影者有关的记录
		},

        ARCHIVE_RESONATOR = {
            GENERIC = "能用一个超级负责的机器，谁还要用地图？",		--物品名：星象探测仪 检查状态：普通状态
            IDLE = "它似乎找到了值得被找到的东西。",		--物品名：星象探测仪 检查状态：处于待机状态
        },

        ARCHIVE_RESONATOR_ITEM = "啊哈！我运用秘密知识建造了一个设备！为什么这种感觉似曾相识呢……",		--物品名：星象探测仪

        ARCHIVE_LOCKBOX_DISPENCER = {
          POWEROFF = "要是有办法让它重新运作就好了……",		--物品名：知识饮水机 检查状态：设备没有供电
          GENERIC =  "我有一种强烈的冲动，想站在它的周围侃侃而谈。",		--物品名：知识饮水机 检查状态：普通状态
        },

        ARCHIVE_SECURITY_DESK = {
            POWEROFF = "它已经失去了从前的作用。",		--物品名：远古哨所 检查状态：设备没有供电
            GENERIC = "它想亲近我。",		--物品名：远古哨所 检查状态：普通状态
        },

        ARCHIVE_SECURITY_PULSE = "你这是要上哪去？是个有意思的地方吗？",		--物品名：远古档案馆安全脉冲

        ARCHIVE_SWITCH = {
            VALID = "它看起来是由这些宝石供能……十分科学，我敢肯定。",		--物品名：华丽基座 检查状态：宝石组合有效，可以激活
            GEMS = "这个插槽是空的。",		--物品名：华丽基座 检查状态：已插入宝石但尚未完全激活
        },

        ARCHIVE_PORTAL = {
            POWEROFF = "一点反应都没。",		--物品名：封印的传送门 检查状态：设备没有供电
            GENERIC = "奇怪，电源是开着的，但它却没反应。",		--物品名：封印的传送门 检查状态：普通状态
        },

        WALL_STONE_2 = "不错的墙。",		--物品名：档案馆石墙
        WALL_RUINS_2 = "一段古老的墙。",		--物品名：档案馆铥墙

        REFINED_DUST = "啊——嚏！",		--物品名：尘土块
        DUSTMERINGUE = "这玩意谁会愿意吃？",		--物品名：琥珀美食

        SHROOMCAKE = "果然名副其实。",		--物品名：蘑菇蛋糕
        SHROOMBAIT = "如梦似幻的味道。",		--物品名：酿夜帽

        NIGHTMAREGROWTH = "这些晶体值得引起我们的警惕。",		--物品名：梦魇城墙

        TURFCRAFTINGSTATION = "真正的科学家永远都在开拓新天地！",		--物品名：土地夯实器

        MOON_ALTAR_LINK = "似乎在酝酿什么。",		--物品名：神秘能量

        COMPOSTINGBIN =
        {
            GENERIC = "我真是有点受不了这个味道。",		--物品名：堆肥桶 检查状态：普通状态
            WET = "看起来太湿了。",		--物品名：堆肥桶 检查状态：处于潮湿状态
            DRY = "嗯……太干了。",		--物品名：堆肥桶 检查状态：处于干燥状态
            BALANCED = "恰到好处！",		--物品名：堆肥桶 检查状态：堆肥配比平衡
            BURNT = "我真没想到它还能发出更糟糕的味道……",		--物品名：堆肥桶 检查状态：已经烧毁
        },
        COMPOST = "植物的食物，派不上别的用场。",		--物品名：堆肥
        SOIL_AMENDER =
		{
			GENERIC = "现在我们就等着科学来做它的工作。",		--物品名：催长剂起子 检查状态：普通状态
			STALE = "它在制造我们科学家所说的化学反应!",		--物品名：催长剂起子 检查状态：土壤改良剂仍在发酵
			SPOILED = "那股令人作呕的味道说明它起作用了!",		--物品名：催长剂起子 检查状态：土壤改良剂已经完全发酵
		},

		SOIL_AMENDER_FERMENTED = "这可是很强的科学！",		--物品名：超级催长剂

        WATERINGCAN =
        {
            GENERIC = "我可以用这个给植物浇水。",		--物品名：空浇水壶 检查状态：普通状态
            EMPTY = "也许这附近有个池塘...",		--物品名：空浇水壶 检查状态：内容为空
        },
        PREMIUMWATERINGCAN =
        {
            GENERIC = "它是经过科学……和鸟类部位改良的！",		--物品名：空鸟嘴壶 检查状态：普通状态
            EMPTY = "没有水就没用了。",		--物品名：空鸟嘴壶 检查状态：内容为空
        },

		FARM_PLOW = "方便的地块设备。",		--物品名：耕地机
		FARM_PLOW_ITEM = "我得先找个好的种地的园子才能使用它。",		--物品名：耕地机
		FARM_HOE = "我得把地弄的让种子更舒服一些。",		--物品名：园艺锄
		GOLDEN_FARM_HOE = "我真的需要这么花哨的东西来搬土吗？",		--物品名：黄金园艺锄
		NUTRIENTSGOGGLESHAT = "它将帮助我看到所有藏在泥土里的科学。",		--物品名：高级耕作先驱帽
		PLANTREGISTRYHAT = "要了解植物，就必须戴上植物。",		--物品名：耕作先驱帽

        FARM_SOIL_DEBRIS = "它把我的园子弄得一团糟。",		--物品名：农田杂物

		FIRENETTLES = "如果你受不了热，就不要在花园里呆着。",		--物品名：火荨麻叶
		FORGETMELOTS = "嗯，我不记得我想说什么了。",		--物品名：必忘我
		SWEETTEA = "一杯好茶，让我忘记所有的问题。",		--物品名：舒缓茶
		TILLWEED = "你给我滚出我的园子！",		--物品名：犁地草
		TILLWEEDSALVE = "我的救赎。",		--物品名：犁地草膏
        WEED_IVY = "嘿，你不是蔬菜！",		--物品名：刺针旋花
        IVY_SNARE = "真是没礼貌。",		--物品名：缠绕根须

		TROPHYSCALE_OVERSIZEDVEGGIES =
		{
			GENERIC = "我可以科学地测算出收获的薄厚。",		--物品名：农产品秤 检查状态：普通状态
			HAS_ITEM = "重量: {weight}\n收获日: {day}\n不赖。",		--物品名：农产品秤 检查状态：已经放置物品
			HAS_ITEM_HEAVY = "重量: {weight}\n收获日: {day}\n谁能想到会长这么大？",		--物品名：农产品秤 检查状态：放置物品重量较大
            HAS_ITEM_LIGHT = "它太一般了，秤都懒得告诉我它的重量。",		--物品名：农产品秤 检查状态：放置物品重量较轻
			BURNING = "这是烧什么菜啊？",		--物品名：农产品秤 检查状态：正在燃烧
			BURNT = "我想这不是最好的烹饪方式。",		--物品名：农产品秤 检查状态：已经烧毁
        },

        CARROT_OVERSIZED = "一大堆的胡萝卜!",		--物品名：巨型胡萝卜
        CORN_OVERSIZED = "好大的玉米棒！",		--物品名：巨型玉米
        PUMPKIN_OVERSIZED = "好膨胀的南瓜啊。",		--物品名：巨型南瓜
        EGGPLANT_OVERSIZED = "真想不通它为什么叫茄子。",		--物品名：巨型茄子
        DURIAN_OVERSIZED = "我很确定它臭味更大。",		--物品名：巨型榴莲
        POMEGRANATE_OVERSIZED = "这可能是我见过的最大的石榴。",		--物品名：巨型石榴
        DRAGONFRUIT_OVERSIZED = "我还有点期待它会长出翅膀呢。",		--物品名：巨型火龙果
        WATERMELON_OVERSIZED = "又大又多汁的西瓜。",		--物品名：巨型西瓜
        TOMATO_OVERSIZED = "一颗比例惊人的西红柿。",		--物品名：巨型番茄
        POTATO_OVERSIZED = "这土豆真大。",		--物品名：巨型土豆
        ASPARAGUS_OVERSIZED = "我想我们会吃一段时间的芦笋了……",		--物品名：巨型芦笋
        ONION_OVERSIZED = "它们这么快就长这么大了！不禁让我的眼眶都湿了。",		--物品名：巨型洋葱
        GARLIC_OVERSIZED = "巨大的大蒜！",		--物品名：巨型大蒜
        PEPPER_OVERSIZED = "一种大小相当不寻常的辣椒。",		--物品名：巨型辣椒

        VEGGIE_OVERSIZED_ROTTEN = "腐烂的霉运。",		--物品名：腐烂巨型蔬菜

		FARM_PLANT =
		{
			GENERIC = "那是一株植物！",		--物品名：农作物 检查状态：普通状态
			SEED = "现在等着就好了。",		--物品名：农作物 检查状态：作物处于种子阶段
			GROWING = "生长吧，我美丽的造物，生长吧！",		--物品名：农作物 检查状态：正在生长
			FULL = "是时候收获科学的成果了。",		--物品名：农作物 检查状态：内容已满
			ROTTEN = "可惜啊！要是在成熟的时候收割就好了!",		--物品名：农作物 检查状态：已经腐烂
			FULL_OVERSIZED = "我用科学的力量生产出了巨型农作物!",		--物品名：农作物 检查状态：成熟并长成巨型作物
			ROTTEN_OVERSIZED = "腐烂的霉运。",		--物品名：农作物 检查状态：巨型作物已经腐烂
			FULL_WEED = "我早就想到了有天我会把这个冒牌货斩草除根！",		--物品名：农作物 检查状态：成熟的杂草形态

			BURNING = "这对植物来说不是好事……",		--物品名：农作物 检查状态：正在燃烧
		},

        FRUITFLY = "到别的地方嗡嗡去！",		--物品名：果蝇
        LORDFRUITFLY = "嘿，别再打扰植物了！",		--物品名：果蝇王
        FRIENDLYFRUITFLY = "有它在，花园似乎更开心了。",		--物品名：友好果蝇
        FRUITFLYFRUIT = "现在我是老大了！",		--物品名：友好果蝇果

        SEEDPOUCH = "我早就不想把种子装在口袋里了。",		--物品名：种子袋

		CARNIVAL_HOST = "是个怪人。",		--物品名：良羽鸦
		CARNIVAL_CROWKID = "日安，小鸟人。",		--物品名：小乌鸦
		CARNIVAL_GAMETOKEN = "一枚闪亮的代币。",		--物品名：鸦年华代币
		CARNIVAL_PRIZETICKET =
		{
			GENERIC = "就是那张奖票！",		--物品名：奖票 检查状态：普通状态
			GENERIC_SMALLSTACK = "就是那些奖票！",		--物品名：奖票 检查状态：普通票券小堆叠
			GENERIC_LARGESTACK = "好多的奖票啊！",		--物品名：奖票 检查状态：普通票券大堆叠
		},

		CARNIVALGAME_FEEDCHICKS_NEST = "这是一扇小活门。",		--物品名：饥饿乌鸦
		CARNIVALGAME_FEEDCHICKS_STATION =
		{
			GENERIC = "它要我给它一些闪亮的东西才让我玩。",		--物品名：鸟鸟吃虫虫 检查状态：普通状态
			PLAYING = "这个看起来有趣喔！",		--物品名：鸟鸟吃虫虫 检查状态：游戏正在进行
		},
		CARNIVALGAME_FEEDCHICKS_KIT = "这还真是个快闪嘉年华。",		--物品名：鸟鸟吃虫虫套装
		CARNIVALGAME_FEEDCHICKS_FOOD = "我不需要先把它们嚼碎，对吧？",		--物品名：蛴螬

		CARNIVALGAME_MEMORY_KIT = "这还真是个快闪嘉年华。",		--物品名：篮中蛋套装
		CARNIVALGAME_MEMORY_STATION =
		{
			GENERIC = "它要我给它一些闪亮的东西才让我玩。",		--物品名：篮中蛋 检查状态：普通状态
			PLAYING = "不是我吹牛，我是这方面的行家。",		--物品名：篮中蛋 检查状态：游戏正在进行
		},
		CARNIVALGAME_MEMORY_CARD =
		{
			GENERIC = "这是一扇小活门。",		--物品名：蛋篮 检查状态：普通状态
			PLAYING = "是它吗？",		--物品名：蛋篮 检查状态：游戏正在进行
		},

		CARNIVALGAME_HERDING_KIT = "这还真是个快闪嘉年华。",		--物品名：追蛋套装
		CARNIVALGAME_HERDING_STATION =
		{
			GENERIC = "它要我给它一些闪亮的东西才让我玩。",		--物品名：追蛋 检查状态：普通状态
			PLAYING = "这些鸡蛋看起来想跑。",		--物品名：追蛋 检查状态：游戏正在进行
		},
		CARNIVALGAME_HERDING_CHICK = "回来这！",		--物品名：追蛋

		CARNIVALGAME_SHOOTING_KIT = "这还真是个快闪嘉年华。",		--物品名：保卫鸟巢套装
		CARNIVALGAME_SHOOTING_STATION =
		{
			GENERIC = "它要我给它一些闪亮的东西才让我玩。",		--物品名：保卫鸟巢 检查状态：普通状态
			PLAYING = "我可以算出弹道，但这涉及到很多复杂的数字和演算。",		--物品名：保卫鸟巢 检查状态：游戏正在进行
		},
		CARNIVALGAME_SHOOTING_TARGET =
		{
			GENERIC = "这是一扇小活门。",		--物品名：射击靶 检查状态：普通状态
			PLAYING = "这个靶子让我心痒痒了。",		--物品名：射击靶 检查状态：游戏正在进行
		},

		CARNIVALGAME_SHOOTING_BUTTON =
		{
			GENERIC = "它要我给它一些闪亮的东西才让我玩。",		--物品名：按钮 检查状态：普通状态
			PLAYING = "科学迫使我按下那个闪亮的大按钮！",		--物品名：按钮 检查状态：游戏正在进行
		},

		CARNIVALGAME_WHEELSPIN_KIT = "这还真是个快闪嘉年华。",		--物品名：布谷鸟转盘套装
		CARNIVALGAME_WHEELSPIN_STATION =
		{
			GENERIC = "它要我给它一些闪亮的东西才让我玩。",		--物品名：布谷鸟转盘 检查状态：普通状态
			PLAYING = "事实证明，旋转你的车轮能带来生产力。",		--物品名：布谷鸟转盘 检查状态：游戏正在进行
		},

		CARNIVALGAME_PUCKDROP_KIT = "这还真是个快闪嘉年华。",		--物品名：鸟房落球套装
		CARNIVALGAME_PUCKDROP_STATION =
		{
			GENERIC = "它要我给它一些闪亮的东西才让我玩。",		--物品名：鸟房落球 检查状态：普通状态
			PLAYING = "物理规律并不能时刻复现。",		--物品名：鸟房落球 检查状态：游戏正在进行
		},

		CARNIVAL_PRIZEBOOTH_KIT = "真正的奖品是我制作摊位的过程。",		--物品名：奖品摊位套装
		CARNIVAL_PRIZEBOOTH =
		{
			GENERIC = "我已经看到了我想要的奖品。就是那边那个！",		--物品名：奖品摊位 检查状态：普通状态
		},

		CARNIVALCANNON_KIT = "我在把东西弄炸方面积累了丰富的经验。",		--物品名：盛夏鸦年华大炮套装
		CARNIVALCANNON =
		{
			GENERIC = "这个实验的目的就是爆炸！",		--物品名：盛夏鸦年华大炮 检查状态：普通状态
			COOLDOWN = "太炸了！",		--物品名：盛夏鸦年华大炮 检查状态：能力处于冷却期
		},

		CARNIVAL_PLAZA_KIT = "科学已经证明了鸟儿喜欢树。",		--物品名：鸦年华树苗
		CARNIVAL_PLAZA =
		{
			GENERIC = "现在看没“鸦年华”的样子，对不对？",		--物品名：鸦年华树 检查状态：普通状态
			LEVEL_2 = "一只小鸟告诉我，这里要多放点装饰品。",		--物品名：鸦年华树 检查状态：第二等级
			LEVEL_3 = "这是一棵庆祝之树！",		--物品名：鸦年华树 检查状态：第三等级
		},

		CARNIVALDECOR_EGGRIDE_KIT = "希望奖品就只是这些。",		--物品名：盛夏鸦年华蛋形游乐设施套装
		CARNIVALDECOR_EGGRIDE = "我可以几个小时一直盯着它看。",		--物品名：盛夏鸦年华蛋形游乐设施

		CARNIVALDECOR_LAMP_KIT = "光剩下一点工作了。",		--物品名：盛夏夜灯套装
		CARNIVALDECOR_LAMP = "它的能量来自于奇思妙想。",		--物品名：盛夏夜灯
		CARNIVALDECOR_PLANT_KIT = "也许这是一棵黄杨？",		--物品名：微型树套装
		CARNIVALDECOR_PLANT = "不是它小，就是我大。",		--物品名：微型树
		CARNIVALDECOR_BANNER_KIT = "我必须自己建造它？我早该料到的。",		--物品名：光线捕捉器套装
		CARNIVALDECOR_BANNER = "这些闪亮的装饰品已经说明了一切。",		--物品名：光线捕捉器

		CARNIVALDECOR_FIGURE =
		{
			RARE = "看到没？重复做同样的事情终究会取得成功，这就是证据！",		--物品名：盛夏鸦年华装饰 检查状态：稀有品质
			UNCOMMON = "这种设计不是很常见。",		--物品名：盛夏鸦年华装饰 检查状态：罕见品质
			GENERIC = "我怎么弄到这么多的这些东西……",		--物品名：盛夏鸦年华装饰 检查状态：普通状态
		},
		CARNIVALDECOR_FIGURE_KIT = "探索的刺激！",		--物品名：绿色神秘盒子
		CARNIVALDECOR_FIGURE_KIT_SEASON2 = "探索的刺激！",		--物品名：黄色神秘盒子
		CARNIVALDECOR_FIGURE_KIT_SEASON3 = "探索的刺激！",		--物品名：红色神秘盒子

        CARNIVAL_BALL = "天才般的极简设计。", 		--物品名：发光红球
		CARNIVAL_SEEDPACKET = "我觉得有点饿了。",		--物品名：种子包
		CARNIVALFOOD_CORNTEA = "这种饮料本该这么松脆吗？",		--物品名：玉米泥

        CARNIVAL_VEST_A = "这让我看起来很有冒险精神。",		--物品名：叽叽喳喳围巾
        CARNIVAL_VEST_B = "就像穿上了自己专属的树荫。",		--物品名：叽叽喳喳斗篷
        CARNIVAL_VEST_C = "希望这里头没虫子……",		--物品名：叽叽喳喳小披肩

        YOTB_SEWINGMACHINE = "缝纫能有多难……对吧？",		--物品名：缝纫机
        YOTB_SEWINGMACHINE_ITEM = "看来需要组装一下。",		--物品名：缝纫机套装
        YOTB_STAGE = "奇怪啊，我没见到他登台和离开……",		--物品名：裁判席
        YOTB_POST =  "这场比赛将会顺利进行！",		--物品名：皮弗娄牛舞台
        YOTB_STAGE_ITEM = "看起来要搭建一下才行。",		--物品名：裁判席
        YOTB_POST_ITEM =  "我最好先装好它。",		--物品名：皮弗娄牛舞台


        YOTB_PATTERN_FRAGMENT_1 = "我打赌把这些拼在一起之后，一定能做出一件皮弗娄牛礼服。",		--物品名：恐怖款式碎片
        YOTB_PATTERN_FRAGMENT_2 = "我打赌把这些拼在一起之后，一定能做出一件皮弗娄牛礼服。",		--物品名：正式款式碎片
        YOTB_PATTERN_FRAGMENT_3 = "我打赌把这些拼在一起之后，一定能做出一件皮弗娄牛礼服。",		--物品名：喜庆款式碎片

        YOTB_BEEFALO_DOLL_WAR = {
            GENERIC = "科学的配方使其具有最大的可拥抱性。",		--物品名：战士皮弗娄牛玩偶 检查状态：普通状态
            YOTB = "不知道裁判会怎么说？",		--物品名：战士皮弗娄牛玩偶 检查状态：牛年活动外观
        },
        YOTB_BEEFALO_DOLL_DOLL = {
            GENERIC = "科学的配方使其具有最大的可拥抱性。",		--物品名：娃娃皮弗娄牛玩偶 检查状态：普通状态
            YOTB = "不知道裁判会怎么说？",		--物品名：娃娃皮弗娄牛玩偶 检查状态：牛年活动外观
        },
        YOTB_BEEFALO_DOLL_FESTIVE = {
            GENERIC = "科学的配方使其具有最大的可拥抱性。",		--物品名：喜庆皮弗娄牛玩偶 检查状态：普通状态
            YOTB = "不知道裁判会怎么说？",		--物品名：喜庆皮弗娄牛玩偶 检查状态：牛年活动外观
        },
        YOTB_BEEFALO_DOLL_NATURE = {
            GENERIC = "科学的配方使其具有最大的可拥抱性。",		--物品名：花朵皮弗娄牛玩偶 检查状态：普通状态
            YOTB = "不知道裁判会怎么说？",		--物品名：花朵皮弗娄牛玩偶 检查状态：牛年活动外观
        },
        YOTB_BEEFALO_DOLL_ROBOT = {
            GENERIC = "科学的配方使其具有最大的可拥抱性。",		--物品名：铁甲皮弗娄牛玩偶 检查状态：普通状态
            YOTB = "不知道裁判会怎么说？",		--物品名：铁甲皮弗娄牛玩偶 检查状态：牛年活动外观
        },
        YOTB_BEEFALO_DOLL_ICE = {
            GENERIC = "科学的配方使其具有最大的可拥抱性。",		--物品名：寒霜皮弗娄牛玩偶 检查状态：普通状态
            YOTB = "不知道裁判会怎么说？",		--物品名：寒霜皮弗娄牛玩偶 检查状态：牛年活动外观
        },
        YOTB_BEEFALO_DOLL_FORMAL = {
            GENERIC = "科学的配方使其具有最大的可拥抱性。",		--物品名：正式皮弗娄牛玩偶 检查状态：普通状态
            YOTB = "不知道裁判会怎么说？",		--物品名：正式皮弗娄牛玩偶 检查状态：牛年活动外观
        },
        YOTB_BEEFALO_DOLL_VICTORIAN = {
            GENERIC = "科学的配方使其具有最大的可拥抱性。",		--物品名：维多利亚皮弗娄牛玩偶 检查状态：普通状态
            YOTB = "不知道裁判会怎么说？",		--物品名：维多利亚皮弗娄牛玩偶 检查状态：牛年活动外观
        },
        YOTB_BEEFALO_DOLL_BEAST = {
            GENERIC = "科学的配方使其具有最大的可拥抱性。",		--物品名：幸运兽皮弗娄牛玩偶 检查状态：普通状态
            YOTB = "不知道裁判会怎么说？",		--物品名：幸运兽皮弗娄牛玩偶 检查状态：牛年活动外观
        },

        WAR_BLUEPRINT = "多么威猛！",		--物品名：战士礼服款式
        DOLL_BLUEPRINT = "我的皮弗娄牛一定会可爱动人！",		--物品名：娃娃礼服款式
        FESTIVE_BLUEPRINT = "是时候来点节庆活动了！",		--物品名：节日盛装款式
        ROBOT_BLUEPRINT = "对于一个缝纫项目来说，如此大量的焊接工作实在有些可疑。",		--物品名：铁甲礼服款式
        NATURE_BLUEPRINT = "花朵真是百搭。",		--物品名：花朵礼服款式
        FORMAL_BLUEPRINT = "这是A级皮弗娄牛的专属礼服。",		--物品名：正式礼服款式
        VICTORIAN_BLUEPRINT = "我奶奶好像穿过件类似的衣服。",		--物品名：维多利亚礼服款式
        ICE_BLUEPRINT = "我喜欢新鲜的皮弗娄牛，不是冷冻的。",		--物品名：寒霜礼服款式
        BEAST_BLUEPRINT = "我觉得我要走运了！",		--物品名：幸运兽礼服款式

        BEEF_BELL = "它会让皮弗娄牛变得友好。我相信科学对此一定有解释。",		--物品名：皮弗娄牛铃

		KITCOONDEN =
		{
			GENERIC = "个头够小才能藏在里面。",		--物品名：小浣猫托儿所 检查状态：普通状态
            BURNT = "不！",		--物品名：小浣猫托儿所 检查状态：已经烧毁
			PLAYING_HIDEANDSEEK = "它们去了哪里呢……",		--物品名：小浣猫托儿所 检查状态：小浣猫正在玩捉迷藏
			PLAYING_HIDEANDSEEK_TIME_ALMOST_UP = "剩下的时间不多了！它们在哪？！",		--物品名：小浣猫托儿所 检查状态：小浣猫捉迷藏即将结束
		},

		KITCOONDEN_KIT = "一套都在这了。",		--物品名：小浣猫托儿所套装

		TICOON =
		{
			GENERIC = "他看起来好像知道自己在做什么！",		--物品名：大虎 检查状态：普通状态
			ABANDONED = "我一定能靠自己找到它们。",		--物品名：大虎 检查状态：已被原主人遗弃
			SUCCESS = "嘿，他找到了一个！",		--物品名：大虎 检查状态：追踪已经成功
			LOST_TRACK = "有人先发现了它们。",		--物品名：大虎 检查状态：已经失去追踪目标
			NEARBY = "看起来附近有东西。",		--物品名：大虎 检查状态：追踪目标就在附近
			TRACKING = "我应该紧跟他的步伐。",		--物品名：大虎 检查状态：正在追踪目标
			TRACKING_NOT_MINE = "他在为别人引路。",		--物品名：大虎 检查状态：正在追踪其他角色的目标
			NOTHING_TO_TRACK = "看起来没有什么可找的了。",		--物品名：大虎 检查状态：当前没有可追踪目标
			TARGET_TOO_FAR_AWAY = "它们可能离得太远，他嗅不到味道。",		--物品名：大虎 检查状态：追踪目标距离过远
		},

		YOT_CATCOONSHRINE =
        {
            GENERIC = "做什么呢……",		--物品名：浣猫神龛 检查状态：普通状态
            EMPTY = "也许它想弄根羽毛来玩玩……",		--物品名：浣猫神龛 检查状态：内容为空
            BURNT = "闻起来像烧焦的毛皮。",		--物品名：浣猫神龛 检查状态：已经烧毁
        },

		KITCOON_FOREST = "你就是最可爱的小猫咪！",		--物品名：小浣猫
		KITCOON_SAVANNA = "你就是最可爱的小猫咪！",		--物品名：小浣猫
		KITCOON_MARSH = "我必须多收集点……做研究！",		--物品名：小浣猫
		KITCOON_DECIDUOUS = "你就是最可爱的小猫咪！",		--物品名：小浣猫
		KITCOON_GRASS = "你就是最可爱的小猫咪！",		--物品名：小浣猫
		KITCOON_ROCKY = "我必须多收集点……做研究！",		--物品名：小浣猫
		KITCOON_DESERT = "我必须多收集点……做研究！",		--物品名：小浣猫
		KITCOON_MOON = "我必须多收集点……做研究！",		--物品名：小浣猫
		KITCOON_YOT = "我必须多收集点……做研究！",		--物品名：小浣猫

        ALTERGUARDIAN_PHASE1 = {
            GENERIC = "你会为破坏科学付出代价！",		--物品名：天体英雄 检查状态：普通状态
            DEAD = "有了！",		--物品名：天体英雄 检查状态：已经死亡
        },
        ALTERGUARDIAN_PHASE2 = {
            GENERIC = "我想我激怒它了……",		--物品名：天体英雄 检查状态：普通状态
            DEAD = "这回我很确定我收拾了它。",		--物品名：天体英雄 检查状态：已经死亡
        },
        ALTERGUARDIAN_PHASE2SPIKE = "你已经表明了你的观点！",		--物品名：月光玻璃尖刺
        ALTERGUARDIAN_PHASE3 = "它现在一定生气了！",		--物品名：天体英雄
        ALTERGUARDIAN_PHASE3TRAP = "经过不懈测试，我可以确认它们让我想打盹。",		--物品名：启迪陷阱
        ALTERGUARDIAN_PHASE3DEADORB = "它死了吗？那股神秘的力量好像还在它附近游荡。",		--物品名：天体英雄
        ALTERGUARDIAN_PHASE3DEAD = "应该找个人过去戳一下……这样才能确定。",		--物品名：被击败的天体英雄

        ALTERGUARDIANHAT = "它让我看到了无限可能……",		--物品名：启迪之冠
        ALTERGUARDIANHATSHARD = "连部件都如此光彩夺目！",		--物品名：启迪碎片

        MOONSTORM_GLASS = {
            GENERIC = "呈现玻璃状。",		--物品名：充能玻璃石 检查状态：普通状态
            INFUSED = "它焕发着地外能量。"		--物品名：充能玻璃石 检查状态：已经注入月亮能量
        },

        MOONSTORM_STATIC = "全新的发现，像过电一样刺激！",		--物品名：能量静电
        MOONSTORM_STATIC_ITEM = "它让我的头发产生疯狂的变化。",		--物品名：约束静电
        MOONSTORM_STATIC_ROAMER = "它好像在传输过程中迷路了。",		--物品名：未约束的静电
        MOONSTORM_SPARK = "姑且叫它“希格斯伯里粒子。”",		--物品名：月熠

        BIRD_MUTANT = "我觉得那个以前应该是只乌鸦。",		--物品名：月盲乌鸦
        BIRD_MUTANT_SPITTER = "我不喜欢它盯着我的眼神……",		--物品名：奇形鸟

        WAGSTAFF_NPC = "作为科学界的同行，我有义务帮他！",		--物品名：颗粒状传输

        WAGSTAFF_NPC_MUTATIONS = "科学从不休息！",		--物品名：颗粒状传输
        WAGSTAFF_NPC_WAGPUNK = "他到底上哪去了……",		--物品名：颗粒状传输

        ALTERGUARDIAN_CONTAINED = "它正在耗尽那个怪物的能量！",		--物品名：月亮精华提取器

        WAGSTAFF_TOOL_1 = "那正是我苦苦寻找的工具！",		--物品名：网状缓冲器
        WAGSTAFF_TOOL_2 = "我当然知道是怎么回事！只是，诶……解释起来太复杂。",		--物品名：装置除垢器
        WAGSTAFF_TOOL_3 = "这明显是一个十分科学的工具！",		--物品名：垫圈开槽器
        WAGSTAFF_TOOL_4 = "我的科学本能告诉我，这就是我一直在寻找的工具！",		--物品名：概念刷洗器
        WAGSTAFF_TOOL_5 = "我知道它能做什么！科学！",		--物品名：校准观察机

        MOONSTORM_GOGGLESHAT = "对啊！结合月亮与土豆能量，我为什么没有早点想到呢？",		--物品名：星象护目镜

        MOON_DEVICE = {
            GENERIC = "它捕捉到能量了！当然，我一早就知道会这样。",		--物品名：月亮虹吸器 检查状态：普通状态
            CONSTRUCTION1 = "科学才刚刚开始。",		--物品名：月亮虹吸器 检查状态：第一阶段建造状态
            CONSTRUCTION2 = "看起来科学多了！",		--物品名：月亮虹吸器 检查状态：第二阶段建造状态
        },

        POCKETWATCH_HEAL = {
			GENERIC = "我打赌里面一定有十分有趣的科学结构。",		--物品名：不老表 检查状态：普通状态
			RECHARGING = "我想它需要时间来……重新校准……时间什么的。",		--物品名：不老表 检查状态：正在重新充能
		},

        POCKETWATCH_REVIVE = {
			GENERIC = "我打赌里面一定有十分有趣的科学结构。",		--物品名：第二次机会表 检查状态：普通状态
			RECHARGING = "我想它需要时间来……重新校准，那个……时间什么的。",		--物品名：第二次机会表 检查状态：正在重新充能
		},

        POCKETWATCH_WARP = {
			GENERIC = "我打赌里面一定有十分有趣的科学结构。",		--物品名：倒走表 检查状态：普通状态
			RECHARGING = "它在做“时间之类的东西”，这就是它的术语名。",		--物品名：倒走表 检查状态：正在重新充能
		},

        POCKETWATCH_RECALL = {
			GENERIC = "我打赌里面一定有十分有趣的科学结构。",		--物品名：溯源表 检查状态：普通状态
			RECHARGING = "它在做“时间之类的东西”，这就是它的术语名。",		--物品名：溯源表 检查状态：正在重新充能
			UNMARKED = "啊，让我回去了好远一段。",		--物品名：溯源表 检查状态：尚未记录传送位置
			MARKED_SAMESHARD = "是时候跳进时间流了吗？",		--物品名：溯源表 检查状态：已标记当前世界分片的位置
			MARKED_DIFFERENTSHARD = "这将是一个很大的跳跃，但我可以做到！",		--物品名：溯源表 检查状态：已标记其他世界分片的位置
		},

        POCKETWATCH_PORTAL = {
			GENERIC = "我打赌里面一定有十分有趣的科学结构。",		--物品名：裂缝表 检查状态：普通状态
			RECHARGING = "它在弄“时间之类的东西”，这就是它的术语名。",		--物品名：裂缝表 检查状态：正在重新充能
			UNMARKED = "一起回到过去走一走如何？会很有意思的！",		--物品名：裂缝表 检查状态：尚未记录传送位置
			MARKED_SAMESHARD = "是时候跳进时间流了吗？",		--物品名：裂缝表 检查状态：已标记当前世界分片的位置
			MARKED_DIFFERENTSHARD = "这将是一次飞跃，但我可以做到！应该可以……",		--物品名：裂缝表 检查状态：已标记其他世界分片的位置
		},

        POCKETWATCH_WEAPON = {
			GENERIC = "坏事发生只是时间问题。",		--物品名：警钟 检查状态：普通状态
			DEPLETED = "我需要得到更多的黑暗燃料……",		--物品名：警钟 检查状态：能量已经耗尽
		},

        POCKETWATCH_PARTS = "还没过一分钟，已经从科学变成了魔法！",		--物品名：时间碎片
        POCKETWATCH_DISMANTLER = "可能买的时候就是二手的。",		--物品名：钟表匠工具

        POCKETWATCH_PORTAL_ENTRANCE =
		{
			GENERIC = "向前走，去发现！",		--物品名：时间裂缝 检查状态：普通状态
			DIFFERENTSHARD = "向前走，去发现！",		--物品名：时间裂缝 检查状态：目标位于其他世界分片
		},
        POCKETWATCH_PORTAL_EXIT = "好一个漫长的下降过程。",		--物品名：时间裂缝

        WATERTREE_PILLAR = "好大一棵树！",		--物品名：大树干
        OCEANTREE = "这些树应该是迷路了。",		--物品名：疙瘩树
        OCEANTREENUT = "里面有活着的东西。",		--物品名：疙瘩树果
        WATERTREE_ROOT = "不是平方根。",		--物品名：大树根

        OCEANTREE_PILLAR = "虽然不如原来那个那么好，但还是挺不错的。",		--物品名：高出平均值的树干

        OCEANVINE = "它的科学术语是“树面条”。",		--物品名：苔藓藤条
        FIG = "我管它叫“牛顿的无花果”。",		--物品名：无花果
        FIG_COOKED = "它被科学加热了。",		--物品名：熟无花果

        SPIDER_WATER = "科学怎么解释它们能浮起来这回事？",		--物品名：海黾
        MUTATOR_WATER = "哦，哇，这看起来嗯……很好吃，韦伯!",		--物品名：海黾变身涂鸦
        OCEANVINE_COCOON = "我轻轻戳它一下会怎么样？",		--物品名：海黾巢穴
        OCEANVINE_COCOON_BURNT = "闻到了吐司烧焦的味道。",		--物品名：海黾巢穴

        GRASSGATOR = "我觉得他不太喜欢我。",		--物品名：草鳄鱼

        TREEGROWTHSOLUTION = "嗯，树木的食粮！",		--物品名：树果酱

        FIGATONI = "妈妈咪呀！",		--物品名：无花果意面
        FIGKABAB = "旁边有根棍子的无花果。",		--物品名：无花果烤串
        KOALEFIG_TRUNK = "这下好了，我有个塞得满满的鼻子了。",		--物品名：无花果酿象鼻
        FROGNEWTON = "无花果有效弥合了其他原料的味道。",		--物品名：无花果蛙腿三明治

        TERRARIUM = {
            GENERIC = "看着它让我的头感觉很模糊，好像有很多小方块。",		--物品名：盒中泰拉 检查状态：普通状态
            CRIMSON = "我有种不好的预感……",		--物品名：盒中泰拉 检查状态：已转化为猩红状态
            ENABLED = "我到了彩虹的另一边了吗？！",		--物品名：盒中泰拉 检查状态：特殊事件生成已经启用
			WAITING_FOR_DARK = "会是什么呢？不然睡一觉起来再看。",		--物品名：盒中泰拉 检查状态：正在等待夜晚到来
			COOLDOWN = "这之后需要冷却一下。",		--物品名：盒中泰拉 检查状态：能力处于冷却期
			SPAWN_DISABLED = "我应该不会再被窥视的目光所打扰了。",		--物品名：盒中泰拉 检查状态：特殊事件生成已被禁用
        },

        MIGHTY_GYM =
        {
            GENERIC = "我光是看它一眼就感觉肌肉拉伤了……",		--物品名：强大健身房 检查状态：普通状态
            BURNT = "再也不会让谁肌肉拉伤了。",		--物品名：强大健身房 检查状态：已经烧毁
        },

        DUMBBELL = "我做脑力训练比较多。",		--物品名：哑铃
        DUMBBELL_GOLDEN = "精诚所至，金石为开。",		--物品名：黄金哑铃
		DUMBBELL_MARBLE = "我已经把我的大脑锻炼成了我身上最强壮的肌肉。",		--物品名：大理石哑铃
        DUMBBELL_GEM = "这点重量，我轻松就能征服——啊！我的脊柱！！",		--物品名：宝石哑铃
        POTATOSACK = "不是装满了土豆形状的石头，就是石头形状的土豆。",		--物品名：土豆袋

        DUMBBELL_HEAT = "用来热身还不错。",		--物品名：热铃
        DUMBBELL_REDGEM = "我确实感受到肌肉在燃烧。",		--物品名：火铃
        DUMBBELL_BLUEGEM = "没有比这更酷的了。",		--物品名：冰铃

        TERRARIUMCHEST =
		{
			GENERIC = "没有谁因为偷看盒子里的东西而出事吧？",		--物品名：显眼箱子 检查状态：普通状态
			BURNT = "它不会再打扰任何人了。",		--物品名：显眼箱子 检查状态：已经烧毁
			SHIMMER = "那个看起来有点格格不入……",		--物品名：显眼箱子 检查状态：宝箱正在闪烁提示
		},

		EYEMASKHAT = "不得不说，我独具慧眼。",		--物品名：眼面具

        EYEOFTERROR = "瞄准眼睛！",		--物品名：恐怖之眼
        EYEOFTERROR_MINI = "我开始觉得不自在了。",		--物品名：可疑窥视者
        EYEOFTERROR_MINI_GROUNDED = "我想它就要孵化了……",		--物品名：恐怖之蛋

        FROZENBANANADAIQUIRI = "黄而醇厚。",		--物品名：冰香蕉冻唇蜜
        BUNNYSTEW = "这家伙的运气到头了。",		--物品名：炖兔子
        MILKYWHITES = "……呃。",		--物品名：乳白物

        CRITTER_EYEOFTERROR = "多一双眼睛总是好事！呃……应该是一只眼睛。",		--物品名：友好窥视者

        SHIELDOFTERROR ="最好的防御就是下巴做成的盾牌。",		--物品名：恐怖盾牌
        TWINOFTERROR1 = "是敌是友？……",		--物品名：激光眼
        TWINOFTERROR2 = "是敌是友？……",		--物品名：魔焰眼

		COTL_TRINKET = "这是多么了不起的成就啊。",		--物品名：红眼冠
		TURF_COTL_GOLD = "别踩在那上面，那个很贵的！",		--物品名：黄金地板
		TURF_COTL_BRICK = "砖块是地板的组成部分。",		--物品名：砖地板
		COTL_TABERNACLE_LEVEL1 =
		{
			LIT = "多么舒缓的光啊。",		--物品名：低微咩咩雕像 检查状态：已经点亮
			GENERIC = "需要燃料。",		--物品名：低微咩咩雕像 检查状态：普通状态
		},
		COTL_TABERNACLE_LEVEL2 =
		{
			LIT = "多么鼓舞人心的雕塑啊！",		--物品名：有所改进咩咩雕像 检查状态：已经点亮
			GENERIC = "需要燃料。",		--物品名：有所改进咩咩雕像 检查状态：普通状态
		},
		COTL_TABERNACLE_LEVEL3 =
		{
			LIT = "我可以永远盯着它……永远……",		--物品名：完美无瑕咩咩雕像 检查状态：已经点亮
			GENERIC = "需要燃料。",		--物品名：完美无瑕咩咩雕像 检查状态：普通状态
		},

        CATTOY_MOUSE = "给老鼠都安上轮子了，科学家们接下来还会想出什么呢？",		--物品名：发条鼠玩具
        KITCOON_NAMETAG = "我应该想几个名字！叫什么呢，小威尔逊，小威尔逊2号……",		--物品名：小浣猫项圈

		KITCOONDECOR1 =
        {
            GENERIC = "不是真鸟，但那些小家伙根本分不清。",		--物品名：火鸡不倒翁 检查状态：普通状态
            BURNT = "烧起来了！",		--物品名：火鸡不倒翁 检查状态：已经烧毁
        },
		KITCOONDECOR2 =
        {
            GENERIC = "这些小家伙总是三心二意。我要干什么来着？",		--物品名：逗猫小鱼 检查状态：普通状态
            BURNT = "它给烧了。",		--物品名：逗猫小鱼 检查状态：已经烧毁
        },

		KITCOONDECOR1_KIT = "看起来需要组装一下。",		--物品名：火鸡不倒翁套装
		KITCOONDECOR2_KIT = "看起来不是很难制作。",		--物品名：逗猫小鱼套装

        WX78MODULE_MAXHEALTH = "一个小玩意竟然装得下这么多的科学知识。",		--物品名：强化电路
        WX78MODULE_MAXSANITY1 = "一个小玩意竟然装得下这么多的科学知识。",		--物品名：处理器电路
        WX78MODULE_MAXSANITY = "一个小玩意竟然装得下这么多的科学知识。",		--物品名：超级处理器电路
        WX78MODULE_MOVESPEED = "一个小玩意竟然装得下这么多的科学知识。",		--物品名：加速电路
        WX78MODULE_MOVESPEED2 = "一个小玩意竟然装得下这么多的科学知识。",		--物品名：超级加速电路
        WX78MODULE_HEAT = "一个小玩意竟然装得下这么多的科学知识。",		--物品名：热能电路
        WX78MODULE_NIGHTVISION = "一个小玩意竟然装得下这么多的科学知识。",		--物品名：光电电路
        WX78MODULE_COLD = "一个小玩意竟然装得下这么多的科学知识。",		--物品名：制冷电路
        WX78MODULE_TASER = "一个小玩意竟然装得下这么多的科学知识。",		--物品名：电气化电路
        WX78MODULE_LIGHT = "一个小玩意竟然装得下这么多的科学知识。",		--物品名：照明电路
        WX78MODULE_MAXHUNGER1 = "一个小玩意竟然装得下这么多的科学知识。",		--物品名：胃增益电路
        WX78MODULE_MAXHUNGER = "一个小玩意竟然装得下这么多的科学知识。",		--物品名：超级胃增益电路
        WX78MODULE_MUSIC = "一个小玩意竟然装得下这么多的科学知识。",		--物品名：合唱盒电路
        WX78MODULE_BEE = "一个小玩意竟然装得下这么多的科学知识。",		--物品名：豆增压电路
        WX78MODULE_MAXHEALTH2 = "一个小玩意竟然装得下这么多的科学知识。",		--物品名：超级强化电路

        WX78_SCANNER =
        {
            GENERIC ="WX-78真的把自己的一部分投入到了工作中。",		--物品名：生物扫描分析仪 检查状态：普通状态
            HUNTING = "抓住那份数据！",		--物品名：生物扫描分析仪 检查状态：正在搜寻扫描目标
            SCANNING = "它似乎发现了什么。",		--物品名：生物扫描分析仪 检查状态：正在扫描目标
        },

        WX78_SCANNER_ITEM = "我想知道它是否会梦到扫描羊。",		--物品名：生物扫描分析仪
        WX78_SCANNER_SUCCEEDED = "它有一种迫不及待向世人展示自己作品的急迫。",		--物品名：生物扫描分析仪

        WX78_MODULEREMOVER = "这显然是一个非常精细和复杂的科学仪器。",		--物品名：电路提取器

        SCANDATA = "闻起来像新鲜的研究。",		--物品名：生物数据

		JUSTEGGS = "可以再来点培根。",		--物品名：普通煎蛋
		VEGGIEOMLET = "早餐是一天中最科学的一餐。",		--物品名：早餐锅
		TALLEGGS = "早餐技术的突破！",		--物品名：苏格兰高鸟蛋
		BEEFALOFEED = "我不要，谢谢你。",		--物品名：蒸树枝
		BEEFALOTREAT = "就我的口味而言，颗粒感太强了。",		--物品名：皮弗娄牛零食

        BOAT_ROTATOR = "事情正朝着正确的方向发展。这个方向非左即右。",		--物品名：转向舵
        BOAT_ROTATOR_KIT = "我想我要带它出去转转。",		--物品名：转向舵套装
        BOAT_BUMPER_KELP = "虽然不能解决小船的所有问题，但也起到了海带应有的作用。",		--物品名：海带保险杠
        BOAT_BUMPER_KELP_KIT = "一个即将到来的船用保险杠。",		--物品名：海带保险杠套装
		BOAT_BUMPER_SHELL = "能给小船提供一个小的防御外壳。",		--物品名：贝壳保险杠
        BOAT_BUMPER_SHELL_KIT = "一个即将到来的船用保险杠。",		--物品名：贝壳保险杠套装
        BOAT_BUMPER_CRABKING = "它在我的小船上闪耀着王冠的光芒。",		--物品名：帝王蟹保险杠
        BOAT_BUMPER_CRABKING_KIT = "一个即将到来的船用保险杠。",		--物品名：帝王蟹保险杠套装

        BOAT_CANNON = {
            GENERIC = "我应该找东西装填进去。",		--物品名：大炮 检查状态：普通状态
            AMMOLOADED = "大炮已经准备好开火了！",		--物品名：大炮 检查状态：已经装填弹药
            NOAMMO = "我没忘记炮弹的事，我只是在酝酿群众的期待。",		--物品名：大炮 检查状态：没有装填弹药
        },
        BOAT_CANNON_KIT = "现在还不是大炮，不过将来会是。",		--物品名：大炮套装
        CANNONBALL_ROCK_ITEM = "它能完美地装进炮膛里。",		--物品名：炮弹

        OCEAN_TRAWLER = {
            GENERIC = "高效渔业的必备产品。",		--物品名：海洋拖网捕鱼器 检查状态：普通状态
            LOWERED = "现在我们得等等。",		--物品名：海洋拖网捕鱼器 检查状态：捕捞网已经放下
            CAUGHT = "抓到个东西！",		--物品名：海洋拖网捕鱼器 检查状态：渔网已经捕获目标
            ESCAPED = "好像是抓到了，但又被它跑掉了……",		--物品名：海洋拖网捕鱼器 检查状态：捕获目标已经逃脱
            FIXED = "又可以抓鱼了！",		--物品名：海洋拖网捕鱼器 检查状态：已经修复
        },
        OCEAN_TRAWLER_KIT = "我应该把它放在有很多鱼的地方。",		--物品名：海洋拖网捕鱼器套装

        BOAT_MAGNET =
        {
            GENERIC = "一直以来我都被物理学所吸引，就像……一样，怎么想不起那个词了。",		--物品名：自动航行仪 检查状态：普通状态
            ACTIVATED = "奏效了！！呃，我当然一早就知道它能行。",		--物品名：自动航行仪 检查状态：已经激活
        },
        BOAT_MAGNET_KIT = "可以这么讲，这只是我的天才创意之一。",		--物品名：自动航行仪套装

        BOAT_MAGNET_BEACON =
        {
            GENERIC = "附近只要有强磁铁就会受到它的吸引。",		--物品名：自动航行灯塔 检查状态：普通状态
            ACTIVATED = "磁力！",		--物品名：自动航行灯塔 检查状态：已经激活
        },
        DOCK_KIT = "这里有为小船建造一个码头所需的一切。",		--物品名：码头套装
        DOCK_WOODPOSTS_ITEM = "啊哈！我就猜到码头缺了点东西。",		--物品名：码头桩

        MONKEYHUT =
        {
            GENERIC = "树屋过于易燃，并非最佳实验场所。",		--物品名：猴子小屋 检查状态：普通状态
            BURNT = "我早就说吧！",		--物品名：猴子小屋 检查状态：已经烧毁
        },
        POWDER_MONKEY = "泼猴你敢在我的小船上撒野！",		--物品名：火药猴
        PRIME_MATE = "一顶漂亮的帽子总能清楚地表明谁是老大。",		--物品名：大副
		LIGHTCRAB = "它是发光生物！",		--物品名：发光蟹
        CUTLESS = "虽然它切不了东西，但是它木刺多呀。",		--物品名：木头短剑
        CURSED_MONKEY_TOKEN = "好像是无害的。",		--物品名：诅咒饰品
        OAR_MONKEY = "拿起船桨去战斗。",		--物品名：战桨
        BANANABUSH = "那片灌木丛是香蕉！",		--物品名：香蕉丛
        DUG_BANANABUSH = "那片灌木丛是香蕉！",		--物品名：香蕉丛
        PALMCONETREE = "一颗长得像松树的棕榈树。",		--物品名：棕榈松果树
        PALMCONE_SEED = "树的开始。",		--物品名：棕榈松果树芽
        PALMCONE_SAPLING = "它的伟大梦想就是有一天能长成一棵树。",		--物品名：棕榈松果树苗
        PALMCONE_SCALE = "如果树有脚趾甲，大抵该是这样吧。",		--物品名：棕榈松果树鳞片
        MONKEYTAIL = "不知道能不能吃？看来要安排一个实验了。",		--物品名：猴尾草
        DUG_MONKEYTAIL = "不知道能不能吃？看来要安排一个实验了。",		--物品名：猴尾草

        MONKEY_MEDIUMHAT = "戴上以后我就变得潇洒，有船长范儿了。",		--物品名：船长的三角帽
        MONKEY_SMALLHAT = "起码能让我的头发不被水打湿。",		--物品名：海盗头巾
        POLLY_ROGERSHAT = "一只小鸟告诉我它会派上用场。",		--物品名：波莉·罗杰的帽子
        POLLY_ROGERS = "就是那只小鸟说的。",		--物品名：波莉·罗杰

        MONKEYISLAND_PORTAL = "没有东西可以进入，它会不断地吐出东西。",		--物品名：非自然传送门
        MONKEYISLAND_PORTAL_DEBRIS = "奇怪，这套设备看起来怎么眼熟呢……",		--物品名：损坏的机器
        MONKEYQUEEN = "这片儿看起来是她说了算。",		--物品名：月亮码头女王
        MONKEYPILLAR = "名副其实的社会栋梁。",		--物品名：猴子柱
        PIRATE_FLAG_POLE = "喂！",		--物品名：月亮码头海盗旗

        BLACKFLAG = "绅士海盗-科学家这名号还真有点上口。",		--物品名：黑旗
        PIRATE_STASH = "我喜欢这个装饰。",		--物品名：海盗藏宝点
        STASH_MAP = "在生活中有一些方向是极好的。",		--物品名：海盗地图

        BANANAJUICE = "有点落草为寇的感觉了。",		--物品名：香蕉奶昔

        FENCE_ROTATOR = "注意！重新部署！",		--物品名：栅栏击剑

        CHARLIE_STAGE_POST = "这是个陷阱! 感觉……剧本都写好了。",		--物品名：舞台
        CHARLIE_LECTURN = "有人在演话剧吗？",		--物品名：剧本

        CHARLIE_HECKLER = "它们来是为了提高戏剧性。",		--物品名：嘲鸫

        PLAYBILL_THE_DOLL = "“由 C.W. 撰写”",		--物品名：附魔玩偶 舞台剧
        PLAYBILL_THE_VEIL = "“由暗域先驱为您带来。”",		--物品名：黑罩 舞台剧
        PLAYBILL_THE_VAULT = "作者是“E.”？",		--物品名：任务完成 一份忏悔
        STATUEHARP_HEDGESPAWNER = "花长回来了，但头却没有。",		--物品名：荆棘密布的雕像
        HEDGEHOUND = "有埋伏！",		--物品名：蔷薇狼
        HEDGEHOUND_BUSH = "是个灌木丛。",		--物品名：蔷薇

        MASK_DOLLHAT = "这是一张玩偶面具。",		--物品名：玩偶面具
        MASK_DOLLBROKENHAT = "这是一张开裂的玩偶面具。",		--物品名：开裂玩偶面具
        MASK_DOLLREPAIREDHAT = "这是一张曾经的玩偶面具。",		--物品名：破碎玩偶面具
        MASK_BLACKSMITHHAT = "这是一张铁匠面具。",		--物品名：铁匠面具
        MASK_MIRRORHAT = "这是一张面具，但它看起来像一面镜子。",		--物品名：镜子面具
        MASK_QUEENHAT = "这是一张女王面具。",		--物品名：女王面具
        MASK_KINGHAT = "这是一张国王面具。",		--物品名：国王面具
        MASK_TREEHAT = "这是一张树的面具。",		--物品名：树木面具
        MASK_FOOLHAT = "这是一张小丑面具。",		--物品名：小丑面具

        COSTUME_DOLL_BODY = "这是玩偶的戏服。",		--物品名：玩偶服
        COSTUME_QUEEN_BODY = "这是女王的戏服。",		--物品名：女王服
        COSTUME_KING_BODY = "这是国王的戏服。",		--物品名：国王服
        COSTUME_BLACKSMITH_BODY = "这是铁匠的戏服。",		--物品名：铁匠服
        COSTUME_MIRROR_BODY = "这是一套戏服。",		--物品名：镜子服
        COSTUME_TREE_BODY = "这是树的戏服。",		--物品名：树木服
        COSTUME_FOOL_BODY = "这是小丑的戏服。",		--物品名：小丑服

        STAGEUSHER =
        {
            STANDING = "总之不要伸出你的手，好吗？",		--物品名：多刺舞台之手 检查状态：舞台侍者处于站姿
            SITTING = "这里有些古怪，但我说不出所以然。",		--物品名：多刺舞台之手 检查状态：舞台侍者处于坐姿
        },
        SEWING_MANNEQUIN =
        {
            GENERIC = "即使打扮得漂漂亮亮，还是哪也去不了。",		--物品名：假人 检查状态：普通状态
            BURNT = "即使烧光了，还是哪也去不了。",		--物品名：假人 检查状态：已经烧毁
        },

		MAGICIAN_CHEST = "为什么我开始感到有点不安了……？",		--物品名：魔术师箱子
		TOPHAT_MAGICIAN = "那顶帽子流露着时尚。",		--物品名：魔术师高礼帽

        YOTR_FIGHTRING_KIT = "它一定是为了科学而建造的！",		--物品名：枕头大战坑套装
        YOTR_FIGHTRING_BELL =
        {
            GENERIC = "暂时平静下来了。",		--物品名：枕头大战钟 检查状态：普通状态
            PLAYING = "我想我们今天都在这里学到了很多东西。",		--物品名：枕头大战钟 检查状态：游戏正在进行
        },

        YOTR_DECOR_1 = {
            GENERAL = "那只兔子真的可以点亮一个房间。",		--物品名：矮兔灯 检查状态：普通装饰状态
            OUT = "这兔子什么都照不亮。",		--物品名：矮兔灯 检查状态：火焰已经熄灭
        },
        YOTR_DECOR_2 = {
            GENERAL = "那只兔子真的可以点亮一个房间。",		--物品名：高兔灯 检查状态：普通装饰状态
            OUT = "这兔子什么都照不亮。",		--物品名：高兔灯 检查状态：火焰已经熄灭
        },

        HAREBALL = "到如今……比这更糟的东西我都吃过。",		--物品名：兔毛球
        YOTR_DECOR_1_ITEM = "我知道把它放在哪。",		--物品名：矮兔灯
        YOTR_DECOR_2_ITEM = "我知道把它放在哪。",		--物品名：高兔灯

		DREADSTONE = "它竟然反射暗影而非光线。",		--物品名：绝望石
		HORRORFUEL = "它让我脊椎发出了可怕的颤抖。",		--物品名：纯粹恐惧
		DAYWALKER =
		{
			GENERIC = "释放他可能有些草率了。",		--物品名：梦魇疯猪 检查状态：普通状态
			IMPRISONED = "我有些为他惋惜。",		--物品名：梦魇疯猪 检查状态：仍被束缚囚禁
		},
		DAYWALKER_PILLAR =
		{
			GENERIC = "大理石里有东西在闪烁。",		--物品名：开裂的柱子 检查状态：普通状态
			EXPOSED = "坚不可摧的石柱。",		--物品名：开裂的柱子 检查状态：封印或遮挡已经移除
		},
		DAYWALKER2 =
		{
			GENERIC = "我们别惹他。",		--物品名：拾荒疯猪 检查状态：普通状态
			BURIED = "他被困在那堆垃圾下面了。",		--物品名：拾荒疯猪 检查状态：被埋在地下
			HOSTILE = "他好像被惹到了。",		--物品名：拾荒疯猪 检查状态：处于敌对状态
		},
		ARMORDREADSTONE = "轻便、结实，时髦！",		--物品名：绝望石盔甲
		DREADSTONEHAT = "它能保护我无以伦比的大脑安然无恙。",		--物品名：绝望石头盔

        LUNARRIFT_PORTAL = "那么多科学藏在里面……而我却无法触碰到它！",		--物品名：裂隙
        LUNARRIFT_CRYSTAL = "发光体结晶。",		--物品名：月亮裂隙晶体

        LUNARTHRALL_PLANT = "它似乎不太在乎个人空间。",		--物品名：致命亮茄
        LUNARTHRALL_PLANT_VINE_END = "它有着带刺的外观。",		--物品名：钻地藤蔓

		LUNAR_GRAZER = "它一定是通过那个奇怪的裂隙来的！",		--物品名：牧者

        PUREBRILLIANCE = "它在用科学致盲我！",		--物品名：纯粹辉煌
        LUNARPLANT_HUSK = "出奇的坚硬。我可以用得上！",		--物品名：亮茄外壳

		LUNAR_FORGE = "就在这里做一些非常聪明和科学的东西吧。",		--物品名：辉煌铁匠铺
		LUNAR_FORGE_KIT = "简单的元素组合！",		--物品名：辉煌铁匠铺套装

		LUNARPLANT_KIT = "月余时间我也做裁缝。",		--物品名：亮茄修补套件
		ARMOR_LUNARPLANT = "这盔甲再叶没有改进空间了。",		--物品名：亮茄盔甲
		LUNARPLANTHAT = "它让我看起来比平时还要聪明。",		--物品名：亮茄头盔
		BOMB_LUNARPLANT = "植物学和化学一起奏效。",		--物品名：亮茄炸弹
		STAFF_LUNARPLANT = "植物的力量！",		--物品名：亮茄魔杖
		SWORD_LUNARPLANT = "挥舞它的时候，不自觉就想给它配音。",		--物品名：亮茄剑
		PICKAXE_LUNARPLANT = "打碎！",		--物品名：亮茄粉碎者
		SHOVEL_LUNARPLANT = "转移泥土的潜力无限大！",		--物品名：亮茄锄铲

		BROKEN_FORGEDITEM = "它破损了，但是我可以把它修好。",		--物品名：损坏的熔炉装备

        PUNCHINGBAG = "它配备了一个精心校准的“哎哟”仪表。",		--物品名：拳击袋

        SHADOWRIFT_PORTAL = "那东西看起来像是会一直持续下去。",		--物品名：裂隙

		SHADOW_FORGE = "它会为哪些黑暗设计带来生命呢？",		--物品名：暗影术基座
		SHADOW_FORGE_KIT = "如果连实验都不做就有悖我科学家的素养了。",		--物品名：暗影术基座套装

        FUSED_SHADELING = "我还是更喜欢你小的时候，那时候你烦的是别人。",		--物品名：熔合暗影
        FUSED_SHADELING_BOMB = "轰轰烈烈！",		--物品名：绝望螨

		VOIDCLOTH = "那些暗影都是从同一块布上裁下来的。",		--物品名：暗影碎布
		VOIDCLOTH_KIT = "我对于在暗影中缝纫只有一些零星的了解。",		--物品名：虚空修补套件
		VOIDCLOTHHAT = "黑暗的神秘感扑面而来。",		--物品名：虚空风帽
		ARMOR_VOIDCLOTH = "哦，糟糕，前面撕开了一个口子！",		--物品名：虚空长袍

        VOIDCLOTH_UMBRELLA = "我最烦头发被强酸溶解了。",		--物品名：暗影伞
        VOIDCLOTH_SCYTHE = "大为简化了收割流程，简直可怕！",		--物品名：暗影收割者

		SHADOWTHRALL_HANDS = "把手拿开！",		--物品名：墨荒
		SHADOWTHRALL_HORNS = "它看起来渴望战斗。",		--物品名：墨荒
		SHADOWTHRALL_WINGS = "翅膀貌似仅仅是用来看的。",		--物品名：墨荒
		SHADOWTHRALL_MOUTH = "是个多嘴的。",		--物品名：墨荒

        CHARLIE_NPC =
        {
            GENERIC = "Wait, is that...?", 		--物品名：查理 检查状态：普通状态
            SCENE2 = "What is she up to?", 		--物品名：查理 检查状态：第二段剧情：查理放入钥匙并布置仪式
            SCENE3 = "What is she up to?", 		--物品名：查理 检查状态：第三段剧情：双钥匙与祭品就绪，查理提示启动仪式
        },
        CHARLIE_HAND = "它想要某种可怕的东西。",		--物品名：召唤之手

        NITRE_FORMATION = "这绝对是某种石头。",		--物品名：硝石堆
        DREADSTONE_STACK = "它来自于那些裂隙深处...",		--物品名：绝望石矿苗
        
        SCRAPBOOK_PAGE = "看来有些人喜欢记录图鉴。",		--物品名：丢失的图鉴页面

        LEIF_IDOL = "把木头雕刻成树的样子似乎有点多余。",		--物品名：树精守卫雕像
        WOODCARVEDHAT = "看起来像是经过精心雕刻的。",		--物品名：硬木帽
        WALKING_STICK = "这是一根非常好的棍子。",		--物品名：木手杖

        IPECACSYRUP = "我不太想吃这个。",		--物品名：泻根糖浆
        BOMB_LUNARPLANT_WORMWOOD = "我们的朋友似乎对他的月亮根源有了更多的接触。", 		--物品名：沃姆伍德的亮茄炸弹
        WORMWOOD_MUTANTPROXY_CARRAT =
        {
        	DEAD = "它走到了尽头。",		--物品名：沃姆伍德变异胡萝卜鼠 检查状态：已经死亡
        	GENERIC = "胡萝卜怎么还长腿了？",		--物品名：沃姆伍德变异胡萝卜鼠 检查状态：普通状态
        	HELD = "近看真是丑。",		--物品名：沃姆伍德变异胡萝卜鼠 检查状态：正被角色携带
        	SLEEPING = "有点可爱了。",		--物品名：沃姆伍德变异胡萝卜鼠 检查状态：正在睡眠
        },
        WORMWOOD_MUTANTPROXY_LIGHTFLIER = "真是奇怪，装在我的口袋里居然还能发光！",		--物品名：沃姆伍德变异球状光虫
		WORMWOOD_MUTANTPROXY_FRUITDRAGON =
		{
			GENERIC = "挺可爱的，不过还没熟。",		--物品名：沃姆伍德变异沙拉蝾螈 检查状态：普通状态
			RIPE = "现在应该熟了。",		--物品名：沃姆伍德变异沙拉蝾螈 检查状态：已经成熟
			SLEEPING = "在打盹呢。",		--物品名：沃姆伍德变异沙拉蝾螈 检查状态：正在睡眠
		},

        SUPPORT_PILLAR_SCAFFOLD = "目前一切都处于保密状态。",		--物品名：支柱脚手架
        SUPPORT_PILLAR = "我得尽快抽出时间来解决这个问题。",		--物品名：支柱
        SUPPORT_PILLAR_COMPLETE = "它让我充满安全感。",		--物品名：加固支柱
        SUPPORT_PILLAR_BROKEN = "你曾经又高又壮。",		--物品名：支柱瓦砾

		SUPPORT_PILLAR_DREADSTONE_SCAFFOLD = "目前一切都处于保密状态。",		--物品名：绝望石支柱脚手架
		SUPPORT_PILLAR_DREADSTONE = "我得尽快抽出时间来解决这个问题。",		--物品名：绝望石支柱
		SUPPORT_PILLAR_DREADSTONE_COMPLETE = "看起来强大得可怕。",		--物品名：加固绝望石支柱
		SUPPORT_PILLAR_DREADSTONE_BROKEN = "多么可怕啊。",		--物品名：绝望石支柱瓦砾

        WOLFGANG_WHISTLE = "它让我回忆起了小时候糟糕的体育课……",		--物品名：训练哨


        MUTATEDDEERCLOPS = "它的眼睛里有一点东西。",		--物品名：晶体独眼巨鹿
        MUTATEDWARG = "瞧你那双闪光的大眼睛！",		--物品名：附身座狼
        MUTATEDBEARGER = "事情要变得毛骨悚然了……",		--物品名：装甲熊獾

        LUNARFROG = "别盯着看了。",		--物品名：明眼青蛙

        DEERCLOPSCORPSE =
        {
            GENERIC  = "结束了……吧？",		--物品名：独眼巨鹿尸体 检查状态：普通状态
            BURNING  = "小心没大错。",		--物品名：独眼巨鹿尸体 检查状态：正在燃烧
            REVIVING = "我不愿相信双眼正在看到的这一切！",		--物品名：独眼巨鹿尸体 检查状态：尸体正在复活
        },

        WARGCORPSE =
        {
            GENERIC  = "为什么我仍然感到不安？",		--物品名：座狼尸体 检查状态：普通状态
            BURNING  = "一切都是最好的安排。",		--物品名：座狼尸体 检查状态：正在燃烧
            REVIVING = "以科学的名义，这是什么玩意？！",		--物品名：座狼尸体 检查状态：尸体正在复活
        },

        BEARGERCORPSE =
        {
            GENERIC  = "臭不可闻！",		--物品名：熊獾尸体 检查状态：普通状态
            BURNING  = "好险。",		--物品名：熊獾尸体 检查状态：正在燃烧
            REVIVING = "这一定有科学的解释！",		--物品名：熊獾尸体 检查状态：尸体正在复活
        },

        BEARGERFUR_SACK = "上面还有它的毛。寒毛直竖啊。",		--物品名：极地熊獾桶
        HOUNDSTOOTH_BLOWPIPE = "牙齿？那可不太卫生啊。",		--物品名：嚎弹炮
        DEERCLOPSEYEBALL_SENTRYWARD =
        {
            GENERIC = "这才叫冰冷的目光吧？",    		--物品名：冰眼结晶器 检查状态：普通状态
            NOEYEBALL = "是谁丢了一只眼睛呢？",  		--物品名：冰眼结晶器 检查状态：缺少独眼巨鹿眼球
        },
        DEERCLOPSEYEBALL_SENTRYWARD_KIT = "所有人退后一步，本人是一名训练有素的科学家！",		--物品名：冰眼结晶器套装

        SECURITY_PULSE_CAGE = "有趣。它是空的。",		--物品名：火花柜
        SECURITY_PULSE_CAGE_FULL = "你是最可爱的纯能量小球吗？",		--物品名：火花柜

		CARPENTRY_STATION =
        {
            GENERIC = "它能造家具。",		--物品名：锯马 检查状态：普通状态
            BURNT = "它不能造家具了。",		--物品名：锯马 检查状态：已经烧毁
        },

        WOOD_TABLE = 
        {
            GENERIC = "我周期性地使用桌子。",		--物品名：木桌 检查状态：普通状态
            HAS_ITEM = "我周期性地使用桌子。",		--物品名：木桌 检查状态：已经放置物品
            BURNT = "以后用不了了。",		--物品名：木桌 检查状态：已经烧毁
        },

        WOOD_CHAIR =
        {
            GENERIC = "我想坐上去！",		--物品名：木椅 检查状态：普通状态
            OCCUPIED = "别人在坐着。",		--物品名：木椅 检查状态：当前已有使用者或内容物
            BURNT = "我可不想坐上去。",		--物品名：木椅 检查状态：已经烧毁
        },

        DECOR_CENTERPIECE = "太精密了。",		--物品名：艺术？
        DECOR_LAMP = "一盏迎宾灯。",		--物品名：餐桌灯
        DECOR_FLOWERVASE =
        {
            GENERIC = "插花的漂亮花瓶。",		--物品名：餐桌花瓶 检查状态：普通状态
            EMPTY = "没有花的漂亮花瓶。",		--物品名：餐桌花瓶 检查状态：内容为空
            WILTED = "看起来不太新鲜。",		--物品名：餐桌花瓶 检查状态：花朵已经枯萎
            FRESHLIGHT = "有一点亮光真是好。",		--物品名：餐桌花瓶 检查状态：插着新鲜发光花朵
            OLDLIGHT = "我记得告诉过麦斯威尔换灯泡的。",		--物品名：餐桌花瓶 检查状态：插着已经枯萎的发光花朵
        },
        DECOR_PICTUREFRAME =
        {
            GENERIC = "真美啊。",		--物品名：空画框 检查状态：普通状态
            UNDRAWN = "我应该画点东西在里面。",		--物品名：空画框 检查状态：尚未绘制图案
        },
        DECOR_PORTRAITFRAME = "看上去不错！",		--物品名：愉快画像

        PHONOGRAPH = "哦不，我以前见过那个。",		--物品名：留声机
        RECORD = "该死，我刚把那首歌从脑袋里赶走！",		--物品名：唱片
        RECORD_CREEPYFOREST = "一张唱片能录一整首歌？技术已经走到了这一步。",		--物品名：惊悚森林
        RECORD_DANGER = "不是我最喜欢的。", 		--物品名：危险主题唱片
        RECORD_DAWN = "需要多一点小号。", 		--物品名：黎明主题唱片
        RECORD_DRSTYLE = "一张唱片能录一整首歌？技术已经走到了这一步。",		--物品名：D.R.风格
        RECORD_DUSK = "需要多一点小号。", 		--物品名：黄昏主题唱片
        RECORD_EFS = "更实验性的曲目。",		--物品名：E.F.S.
        RECORD_END = "一张唱片能录一整首歌？技术已经走到了这一步。", 		--物品名：终曲唱片
        RECORD_MAIN = "需要多一点小号。", 		--物品名：主题唱片
        RECORD_WORKTOBEDONE = "更实验性的曲目。", 		--物品名：工作主题唱片
        RECORD_HALLOWEDNIGHTS = "惊艳不惊艳！",		--物品名：万圣夜
        RECORD_BALATRO = "无法抗拒！它仿佛触动了我的心灵！",		--物品名：《小丑牌》联动唱片

        ARCHIVE_ORCHESTRINA_MAIN = "好像专门做成让人摸不着头脑的样子。",		--物品名：远古小合奏机

        WAGPUNKHAT = "它让我身上的齿轮也动起来了。",		--物品名：W.A.R.B.I.S.头戴齿轮
        ARMORWAGPUNK = "令人敬畏的齿轮。",		--物品名：W.A.R.B.I.S.盔甲
        WAGSTAFF_MACHINERY = "在这堆垃圾中也许会有所发现。",		--物品名：被丢弃的垃圾
        WAGPUNK_BITS = "我敢打赌，我能用它做出惊人的科学突破。",		--物品名：废料
        WAGPUNKBITS_KIT = "机器修理别的机器！科学接下来还会想出什么？",		--物品名：自动修理机

        WAGSTAFF_MUTATIONS_NOTE = "引人入胜！引人深思！引人大脑变大！",		--物品名：研究笔记


        BATTLESONG_INSTANT_REVIVE = "这首曲子太有生命力了。",		--物品名：战士重奏

        WATHGRITHR_IMPROVEDHAT = "薇格弗德有领导经验吗？又让她如虎添翼了？",		--物品名：统帅头盔
        SPEAR_WATHGRITHR_LIGHTNING = "它得到了电流的加强。",		--物品名：奔雷矛

        BATTLESONG_CONTAINER = "哇，它能存这么多歌。",		--物品名：战斗号子罐

        SADDLE_WATHGRITHR = "那是薇格弗德做的？这个让她猛虎插翅。",		--物品名：战斗鞍具

        WATHGRITHR_SHIELD = "保护我！！",		--物品名：战斗圆盾

        BATTLESONG_SHADOWALIGNED = "戏剧让我坐立不安。",		--物品名：黑暗悲歌
        BATTLESONG_LUNARALIGNED = "戏剧让我坐立不安。",		--物品名：启迪摇篮曲

		SHARKBOI = "吓得我一哆嗦！",		--物品名：大霜鲨
        BOOTLEG = "远方的远方，有个海盗丢了靴子。",		--物品名：出逃腿靴
        OCEANWHIRLPORTAL = "涡来漩一下。",		--物品名：漩涡传送门

        EMBERLIGHT = "不用燃料的火焰？不要紧。",		--物品名：火球
        WILLOW_EMBER = "是不是很美？",		--物品名：以太余烬

        YOTD_DRAGONSHRINE =
        {
            GENERIC = "供品会是什么？我的好奇心在燃烧。",		--物品名：龙蝇神龛 检查状态：普通状态
            EMPTY = "它也许想要块木炭。",		--物品名：龙蝇神龛 检查状态：内容为空
            BURNT = "稍微有些过火了。",		--物品名：龙蝇神龛 检查状态：已经烧毁
        },

        DRAGONBOAT_KIT = "别拖泥带水了，麻利点做好吧。",		--物品名：龙蝇船套装
        DRAGONBOAT_PACK = "让造船变得简单！",		--物品名：豪华龙蝇船套装

        BOATRACE_CHECKPOINT = "检查点就在那！",		--物品名：比赛检查点
        BOATRACE_CHECKPOINT_THROWABLE_DEPLOYKIT = "我的清单上又多了一件要检查的事。",		--物品名：比赛检查点套装
        BOATRACE_START = "总得有个起点。",		--物品名：起点塔
        BOATRACE_START_THROWABLE_DEPLOYKIT = "起点放在哪呢？",		--物品名：起点塔套装

        BOATRACE_PRIMEMATE = "有人对我如影随形！",		--物品名：查理的选手
        BOATRACE_SPECTATOR_DRAGONLING = "它的支持让我燃了起来！",		--物品名：小龙蝇观赛者

        YOTD_STEERINGWHEEL = "它会让我驶向正确的航向，左右都逢源。",		--物品名：龙蝇船方向舵
        YOTD_STEERINGWHEEL_ITEM = "它能做成方向舵。",		--物品名：龙蝇船方向舵套装
        YOTD_OAR = "好方便的船桨。",		--物品名：利爪船桨
        YOTD_ANCHOR = "我可不能让我的小船飞走了。",		--物品名：巨爪船锚
        YOTD_ANCHOR_ITEM = "现在我能造出锚了。",		--物品名：巨爪船锚套装
        MAST_YOTD = "满是鳞片的帆。",		--物品名：龙翼桅杆
        MAST_YOTD_ITEM = "现在我能造出桅杆了。",		--物品名：龙翼桅杆套装
        BOAT_BUMPER_YOTD = "和龙舟角力？你会尝到龙角的滋味。",		--物品名：獠牙保险杠
        BOAT_BUMPER_YOTD_KIT = "一个即将到来的船用保险杠。",		--物品名：獠牙保险杠套装
        BOATRACE_SEASTACK = "浮标啊浮标！",		--物品名：黄金浮标
        BOATRACE_SEASTACK_THROWABLE_DEPLOYKIT = "浮标啊浮标！",		--物品名：黄金浮标套装
        BOATRACE_SEASTACK_MONKEY = "浮标啊浮标！",		--物品名：荆棘浮标
        BOATRACE_SEASTACK_MONKEY_THROWABLE_DEPLOYKIT = "浮标啊浮标！",		--物品名：荆棘浮标套装
        MASTUPGRADE_LAMP_YOTD = "快看，它一见到我眼睛都亮起来了！",		--物品名：龙蝇灯
        MASTUPGRADE_LAMP_ITEM_YOTD = "我有的都是闪闪发光的好主意。",		--物品名：龙蝇灯套装
        WALKINGPLANK_YOTD = "不管怎么装扮我在用它时都不会感觉良好。",		--物品名：龙鳞跳板
        CHESSPIECE_YOTD = "光是看着它我就已经心跳加速了！",		--物品名：起点塔雕塑


        HEALINGSALVE_ACID = "这个能解决不少问题。",		--物品名：黏糊糊的药膏

        BEESWAX_SPRAY = "我是闻到甲醛了吗？",		--物品名：防腐喷雾
        WAXED_PLANT = "它被冻结在了恐惧中！", 		--物品名：已打蜡作物

        STORAGE_ROBOT = {
            GENERIC = "咱们别太自满了。",		--物品名：瓦器人 检查状态：普通状态
            BROKEN = "它坏掉了。",		--物品名：瓦器人 检查状态：已经损坏
        },

        SCRAP_MONOCLEHAT = "有没有让我看起来更尊贵一点？",		--物品名：视界扩展器
        SCRAPHAT = "帽尖几乎和我的头脑一样的……锐利！",		--物品名：拾荒尖帽

        FENCE_JUNK = "丑虽丑，不过我不介意。",		--物品名：垃圾栅栏
        JUNK_PILE = "要翻垃圾堆？我绝对不会拒绝。",		--物品名：垃圾堆
        JUNK_PILE_BIG = {
            BLUEPRINT = "这上面有些东西。",		--物品名：摇摇欲坠的垃圾堆 检查状态：包含可学习的蓝图
            GENERIC = "随时可能倒塌。",		--物品名：摇摇欲坠的垃圾堆 检查状态：普通状态
        },
        
        ARMOR_LUNARPLANT_HUSK = "它会给你身上扎根刺。",		--物品名：荆棘茄甲


        OTTER = "你去找另外一只水獭看看。",		--物品名：水獭掠夺者
        OTTERDEN = {
            GENERIC = "除了一个水獭窝，再没什么别的了。",		--物品名：水獭掠夺者窝点 检查状态：普通状态
            HAS_LOOT = "这我得仔细看看。",		--物品名：水獭掠夺者窝点 检查状态：巢穴中存有战利品
        },
        OTTERDEN_DEAD = "水越来越多了。",		--物品名：拆毁的水獭掠夺者窝点

        BOAT_ANCIENT_ITEM = "还是得用老法子来。",		--物品名：古董船套装
        BOAT_ANCIENT_CONTAINER = "“货物”是水手们的黑话，意思就是 “东西”。",		--物品名：货舱
        WALKINGPLANK_ANCIENT = "我们就不能造一艘救生船吗？",		--物品名：古董跳板

        ANCIENTTREE_SEED = "世上没有惊喜，只有不全面的统计。",		--物品名：惊喜种子

        ANCIENTTREE_GEM = {
            GENERIC = "蔬菜与矿物质的化合物。奇特啊。",		--物品名：萌芽石 检查状态：普通状态
            STUMP = "这棵树已经被开采过了。",		--物品名：萌芽石 检查状态：只剩树桩
        },

        ANCIENTTREE_SAPLING_ITEM = "我得把它种在对的地方。",		--物品名：远古树苗种子

        ANCIENTTREE_SAPLING = {
            GENERIC = "它在长大！我觉得？",		--物品名：远古树苗 检查状态：普通状态
            WRONG_TILE = "这里给不了它所需的营养。",		--物品名：远古树苗 检查状态：当前地皮不适合种植
            WRONG_SEASON = "它看起来很适合，但还没准备要生长。",		--物品名：远古树苗 检查状态：当前季节不适合种植
        },
 
        ANCIENTTREE_NIGHTVISION = {
            GENERIC = "请谨慎树用。",		--物品名：阴郁之棘 检查状态：普通状态
            STUMP = "一截树桩。",		--物品名：阴郁之棘 检查状态：只剩树桩
        },

        ANCIENTFRUIT_GEM = "树上新鲜掉下来的，还热着呢。",		--物品名：晶洞果
        ANCIENTFRUIT_NIGHTVISION = "要是能少……抽搐一点就好了。",		--物品名：夜莓
        ANCIENTFRUIT_NIGHTVISION_COOKED = "这下起码不抽搐了。",		--物品名：熟夜莓

        BOATPATCH_KELP = "现在只能这样了。",		--物品名：海带补丁

        CRABKING_MOB = "你想蟹愤吗？",		--物品名：蟹卫
        CRABKING_MOB_KNIGHT = "这壳是个大挑战。",		--物品名：蟹骑士
        CRABKING_CANNONTOWER = "我就知道这些螃蟹会炮制点什么。",		--物品名：加农炮塔
        CRABKING_ICEWALL = "我和那螃蟹之间隔了一道墙。",		--物品名：冰障

        SALTLICK_IMPROVED = "光是看着它我就觉得口渴了。",		--物品名：美味舔盐块

        OFFERING_POT =
        {
            GENERIC = "看起来好悲伤，一条海带都没……",		--物品名：食堂海带盘 检查状态：普通状态
            SOME_KELP = "我觉得里面应该还能放一些海带进去。",		--物品名：食堂海带盘 检查状态：供品锅中有少量海带
            LOTS_OF_KELP = "海量的海带！",		--物品名：食堂海带盘 检查状态：供品锅中海带很多
        },

        OFFERING_POT_UPGRADED =
        {
            GENERIC = "看起来好悲伤，一条海带都没……",		--物品名：高级食堂海带盘 检查状态：普通状态
            SOME_KELP = "我觉得里面应该还能放一些海带进去。",		--物品名：高级食堂海带盘 检查状态：供品锅中有少量海带
            LOTS_OF_KELP = "海量的海带！",		--物品名：高级食堂海带盘 检查状态：供品锅中海带很多
        },

        MERM_ARMORY = "上面写着“止给鱼人用。”",		--物品名：鱼人军械库
        MERM_ARMORY_UPGRADED = "上面写着“止给鱼人用。”",		--物品名：高级鱼人军械库
        MERM_TOOLSHED = "这里头估计找不出什么科学的东西。",		--物品名：劣质工具棚
        MERM_TOOLSHED_UPGRADED = "这里头估计找不出什么科学的东西。",		--物品名：不那么劣质的工具棚
        MERMARMORHAT = "这个不适合我，这是一个鱼人头盔。",		--物品名：沼泽斗士头盔
        MERMARMORUPGRADEDHAT = "这个不适合我，这是一个鱼人头盔。",		--物品名：沼泽战士头盔
        MERM_TOOL = "啥都能干，但又干啥啥不行。",		--物品名：劣质工具
        MERM_TOOL_UPGRADED = "这工具看起来有些可鱼。",		--物品名：不那么劣质的工具

        WURT_SWAMPITEM_SHADOW = "简直恐怖……但别告诉她是我说的。",		--物品名：绝望投泥带
        WURT_SWAMPITEM_LUNAR = "看着它让我的头感觉怪怪的。",		--物品名：光芒投泥带

        MERM_SHADOW = "这个影子是它从前的自我。",		--物品名：暗影鱼人
        MERMGUARD_SHADOW = "这个影子是它从前的自我。",		--物品名：暗影鱼人守卫

        MERM_LUNAR = "这是鱼人进化的下一个相位。",		--物品名：变异鱼人
        MERMGUARD_LUNAR = "这是鱼人进化的下一个相位。",		--物品名：变异鱼人守卫


        SHADOW_BEEF_BELL = "这家伙长得就像我旧的那个皮弗娄牛铃。",		--物品名：阴郁皮弗娄牛铃
        SADDLE_SHADOW = "这让我想起了一些东西，呃。",		--物品名：梦魇鞍具
        SHADOW_BATTLEAXE = "哎呀！让我们放下恩怨。",		--物品名：暗影槌
        VOIDCLOTH_BOOMERANG = "我能了解一下这个的退回条款吗？",		--物品名：阴郁回旋镖
		ROPE_BRIDGE_KIT = "吊桥效应！",		--物品名：洞穴探险者的桥梁套件
		GELBLOB =
		{
			GENERIC = "”咦~“就对了！",		--物品名：恶液 检查状态：普通状态
			HAS_ITEM = "哦，我把东西落在这里了。",		--物品名：恶液 检查状态：已经放置物品
			HAS_CHARACTER = "有人陷入了困境。",		--物品名：恶液 检查状态：内部困有角色
		},
        RABBITKING_AGGRESSIVE = "它有兔子脾气！",		--物品名：暴戾兔王
        RABBITKING_PASSIVE = "为善良欢呼！",		--物品名：和善兔王
        RABBITKING_LUCKY = "为了科学得抓住它！",		--物品名：机缘兔子
        RABBITKINGMINION_BUNNYMAN = "他们疯了！",		--物品名：皇家兔子警卫
        ARMOR_CARROTLURE = "我喜欢紧密团结的盔甲。",		--物品名：胡萝卜外套
        RABBITKINGHORN = "兔子们喜欢音乐。",		--物品名：挖洞兔号角
        RABBITKINGHORN_CHEST = "我会时不时地使用它。",		--物品名：便携式巢穴
        RABBITKINGSPEAR = "这会带来很好的冲击力。",		--物品名：兔王棍
        RABBITHAT = "这个帽子会把兔子放在你的头上。",		--物品名：洞穴花环
        WORM_BOSS = "大虫子！",		--物品名：巨大洞穴蠕虫

        STONE_TABLE = 
        {
            GENERIC = "我周期性地使用桌子。",		--物品名：石桌 检查状态：普通状态
            HAS_ITEM = "我周期性地使用桌子。",		--物品名：石桌 检查状态：已经放置物品
        },

        STONE_CHAIR =
        {
            GENERIC = "我想坐在那张...石椅上！",		--物品名：石椅 检查状态：普通状态
            OCCUPIED = "别人在坐着。",		--物品名：石椅 检查状态：当前已有使用者或内容物
        },

        CARPENTRY_BLADE_MOONGLASS = "就像我的头脑一样，剃刀般锋利！",		--物品名：月光玻璃锯片

        CHEST_MIMIC_REVEALED = "可怕！太可怕了！",		--物品名：暴躁箱子

        GELBLOB_STORAGE = {
            GENERIC  = "上面是空的。",		--物品名：恶液储存箱 检查状态：普通状态
            FULL = "用来保持......新鲜？",		--物品名：恶液储存箱 检查状态：内容已满
        },
        GELBLOB_STORAGE_KIT = "我会保存好自己的判断。",		--物品名：恶液储存箱套件
        GELBLOB_BOTTLE = "我喜欢把东西装瓶放好。                            ",		--物品名：恶液罐

        PLAYER_HOSTED =
        {
            GENERIC = "已经被占有了。",		--物品名：被附身的尸体 检查状态：普通状态
            ME = "我已经在疯狂的边上了。",		--物品名：被附身的尸体 检查状态：由当前角色主持
        },

        MASK_SAGEHAT = "看起来很犀利。",		--物品名：贤者面具
        MASK_HALFWITHAT = "看起来有些笨拙。",		--物品名：蠢人面具
        MASK_TOADYHAT = "我是不是该配合一下？",		--物品名：马屁精面具

        SHADOWTHRALL_PARASITE = "它让我的大脑发痒。",		--物品名：虚空面具

        PUMPKINCARVER = "有没有人要参与一个顶瓜瓜的项目？",		--物品名：南瓜雕刻工具
		SNOWMAN =
		{
			GENERIC = "不雪随便嬉笑！",		--物品名：雪人 检查状态：普通状态
			SNOWBALL = "真是个会“滚”的高手！",		--物品名：雪人 检查状态：雪球形态
		},
        SNOWBALL_ITEM = "绝不会抛弃这个机会……",		--物品名：雪球

        YOTS_SNAKESHRINE =
        {
            GENERIC = "它洋溢着美好的前景！",		--物品名：洞穴蠕虫神龛 检查状态：普通状态
            EMPTY = "它有怪兽般的吞噬欲。",		--物品名：洞穴蠕虫神龛 检查状态：内容为空
            BURNT = "薇洛！",		--物品名：洞穴蠕虫神龛 检查状态：已经烧毁
        },
        YOTS_WORM = "它来自浅层的深渊。",		--物品名：镀金洞穴蠕虫
        YOTS_LANTERN_POST = 
        {
            GENERIC = "柱定在那里。",		--物品名：喜庆灯笼柱 检查状态：普通状态
            BURNT = "柱子的未来完成时。",		--物品名：喜庆灯笼柱 检查状态：已经烧毁
        },
        YOTS_LANTERN_POST_ITEM = "柱定在哪里？",		--物品名：喜庆灯笼柱套装
        CHESSPIECE_DEPTHWORM  = "是条蠕虫，没跑了。",		--物品名：深渊蠕虫雕塑

        GHOSTLYELIXIR_LUNAR = "嗯，对。非常科学。",		--物品名：光之怒
        GHOSTLYELIXIR_SHADOW = "嗯，对。非常科学。",		--物品名：诅咒之苦

		SLINGSHOTMODKIT = "沃尔特真是拼尽全力了。",		--物品名：弹弓野外作业包
		SLINGSHOT_BAND_PIGSKIN = "沃尔特真是拼尽全力了。",		--物品名：猪皮弹弓皮筋
		SLINGSHOT_BAND_TENTACLE = "沃尔特真是拼尽全力了。",		--物品名：甩尾弹弓皮筋
		SLINGSHOT_BAND_MIMIC = "沃尔特真是拼尽全力了。",		--物品名：附身弹弓皮筋
		SLINGSHOT_FRAME_BONE = "沃尔特真是拼尽全力了。",		--物品名：骨制弹弓框
		SLINGSHOT_FRAME_GEMS = "沃尔特真是拼尽全力了。",		--物品名：铥矿弹弓框
		SLINGSHOT_FRAME_WAGPUNK_0 = "沃尔特真是拼尽全力了。",		--物品名：废料弹弓框
		SLINGSHOT_FRAME_WAGPUNK = "沃尔特真是拼尽全力了。",		--物品名：加量废料弹弓框
		SLINGSHOT_HANDLE_STICKY = "沃尔特真是拼尽全力了。",		--物品名：粘性弹弓手柄
		SLINGSHOT_HANDLE_JELLY = "沃尔特真是拼尽全力了。",		--物品名：蜂王浆弹弓手柄
		SLINGSHOT_HANDLE_SILK = "沃尔特真是拼尽全力了。",		--物品名：弹弓手柄缠带
		SLINGSHOT_HANDLE_VOIDCLOTH = "沃尔特真是拼尽全力了。",		--物品名：虚空弹弓手柄

		WOBY_TREAT = "这个零食恐怕不是给人吃的吧。",		--物品名：沃比零食
		BANDAGE_BUTTERFLYWINGS = "都上绷带了，可得小心翼翼。",		--物品名：扑腾绷带
		PORTABLEFIREPIT_ITEM = "终于可以随身带火了！专利待批。",		--物品名：便携营火
        SLINGSHOTAMMO_CONTAINER = "它充满了潜在……能量！",		--物品名：弹药袋

        ELIXIR_CONTAINER = "与其说是篮子，不如说是殡仪员的袋子。",		--物品名：野餐盒
        GHOSTFLOWERHAT = "这个让我觉得口渴。",		--物品名：幽魂花冠
        WENDY_RESURRECTIONGRAVE = "古怪却让人安心！",		--物品名：多年生植物祭坛
        GRAVEURN =
        {
            GENERIC = "这个骨灰瓮缺少灵魂。",		--物品名：灵魂容器 检查状态：普通状态
            HAS_SPIRIT = "这个灵魂找到了一个新家！",		--物品名：灵魂容器 检查状态：骨灰罐中已有灵魂能量
        },

        SHALLOW_GRAVE = "你死好过我死。",		--物品名：矮坟
        THULECITEBUGNET = "有人抓到最新的蜂巢了吗？",		--物品名：铥矿捕虫网

        DECK_OF_CARDS = "我们要玩全套吗？",		--物品名：牌堆
        PLAYING_CARD = "还差51张就够凑齐一副牌了。",		--物品名：扑克牌
        BALATRO_MACHINE = "我来玩一局吧。",		--物品名：小丑

		GESTALT_CAGE =
		{
			GENERIC = "可恶，是空的。",		--物品名：幻灵捕获机 检查状态：普通状态
			FILLED = "有人占着呢。",		--物品名：幻灵捕获机 检查状态：容器已经装入目标
		},
		WAGBOSS_ROBOT_SECRET = "真迷人！",		--物品名：未公开构造体
        WAGBOSS_ROBOT = "迷人啊！",		--物品名：战争瓦器人
        WAGBOSS_ROBOT_POSSESSED = "有人试过关机重启吗？",		--物品名：启迪战争瓦器人
		WAGBOSS_ROBOT_LEG = "它还站了一阵子！",		--物品名：战争瓦器人腿 
		ALTERGUARDIAN_PHASE1_LUNARRIFT = "你看起来相同但又不同。",		--物品名：天体仇灵
		ALTERGUARDIAN_PHASE1_LUNARRIFT_GESTALT = "这应该就是他想要的了。",		--物品名：纯粹虚影
        ALTERGUARDIAN_PHASE4_LUNARRIFT = "你破坏的科学还不够多吗？！",		--物品名：天体后裔
		WAGDRONE_ROLLING =
        {
            GENERIC = "它们就这么转啊转个不停。",		--物品名：螨地爬 检查状态：普通状态
            INACTIVE = "我们应该带它去旋一圈。",		--物品名：螨地爬 检查状态：当前未激活
            DAMAGED = "我可以修理它，或者回收零件。",		--物品名：螨地爬 检查状态：已经受损
            FRIENDLY = "旋转赢大奖！",		--物品名：螨地爬 检查状态：处于友好状态
        },
        WAGDRONE_FLYING =
        {
            GENERIC = "活像地狱里爬出来的机器。",		--物品名：黄莺 检查状态：普通状态
            INACTIVE = "我们应该带它去旋一圈。",		--物品名：黄莺 检查状态：当前未激活
            DAMAGED = "它损坏得太厉害修不了了，但我可以回收零件。",		--物品名：黄莺 检查状态：已经受损
        },
		WAGDRONE_PARTS = "这下我就可以让事情往积极的方向运转了。",		--物品名：陀螺传导核心
		WAGDRONE_BEACON = "这将有助于把东西控制住。",		--物品名：螨地爬屏障柱

        WAGPUNK_WORKSTATION = "开始工作吧！",		--物品名：概念制造器
        WAGPUNK_LEVER = "是时候改变一下了。",		--物品名：杠杆选择器
        WAGPUNK_FLOOR_KIT = "这是什么地面？",		--物品名：基底扩展器
        WAGPUNK_CAGEWALL = "不成墙便成仁！",		--物品名：动能场扩展器

		WAGSTAFF_ITEM_1 = "奇怪，这手套不是投影。",		--物品名：手套
		WAGSTAFF_ITEM_2 = "这剪贴板竟是……真的。",		--物品名：剪贴板

        HERMITCRAB_RELOCATION_KIT = "螃蟹的新家将会是完美水瓶。",		--物品名：隐士迁居套装

        WANDERINGTRADER =
        {
            REVEALED = "交易以后，我们就牛转成朋友吗？",		--物品名：怪皮弗娄牛 检查状态：隐藏商人已经现身
            GENERIC = "这皮弗娄牛长得可真奇怪。",		--物品名：怪皮弗娄牛 检查状态：普通状态
        },

        GESTALT_GUARD_EVOLVED = "这些家伙的个性挺炸。",		--物品名：敌意虚影
        FLOTATIONCUSHION = "啊，浮力！",		--物品名：个人漂浮装置
        LUNAR_SEED = "这曾是它王冠的一部分。",		--物品名：天体珠宝

        WAGBOSS_ROBOT_CONSTRUCTIONSITE = "暂时被盖起来了。",		--物品名：战争瓦器人底座
        WAGBOSS_ROBOT_CONSTRUCTIONSITE_KIT = "大机器人真的分装成了小包。",		--物品名：战争瓦器人底座套装
        WAGBOSS_ROBOT_CREATION_PARTS = "碎片到处散落！",		--物品名：战争瓦器人零件
        MOONSTORM_STATIC_CATCHER = "里面什么都没。",		--物品名：静电约束仪
        COOLANT = "它的气泡里充满了可能性！",		--物品名：核化液

        FENCE_ELECTRIC = {
            LINKED = "嗷，它找到连接了。",      		--物品名：麻刺节点 检查状态：已经与电力网络连接
            GENERIC = "单独使用无法发挥功能。",           		--物品名：麻刺节点 检查状态：普通状态
        },
        FENCE_ELECTRIC_ITEM = "它不是树，但是得栽到地里。",		--物品名：麻刺节点

        MUTATEDBIRD = "这应该是稀世奇禽。",		--物品名：亮喙鸟

        BIRDCORPSE =
        {
            GENERIC  = "实乃禽兽。", 		--物品名：鸟类尸体 检查状态：普通状态
            BURNING  = "这才叫真正的火鸟。", 		--物品名：鸟类尸体 检查状态：正在燃烧
            REVIVING = "它正在变成新物种！", 		--物品名：鸟类尸体 检查状态：尸体正在复活
        },

        BUZZARDCORPSE = {
            GENERIC  = "实乃禽兽。", 		--物品名：秃鹫尸体 检查状态：普通状态
            BURNING  = "这才叫真正的火鸟。", 		--物品名：秃鹫尸体 检查状态：正在燃烧
            REVIVING = "它正在变成新物种！", 		--物品名：秃鹫尸体 检查状态：尸体正在复活
        },

        MUTATEDBUZZARD_GESTALT = {
            GENERIC = "我欣赏它对死亡的专注。", 		--物品名：水晶冠秃鹫 检查状态：普通状态
            EATING_CORPSE = "不要介意我……进一口腐肉吧。", 		--物品名：水晶冠秃鹫 检查状态：正在啃食尸体
        },


        SHADOWTHRALL_CENTIPEDE = {
            HEAD = "头还是头？", 		--物品名：巨荒蜈 检查状态：正在检查头部
            BODY = "太可怕了！", 		--物品名：巨荒蜈 检查状态：正在检查躯干部位
            FLIPPED = "底朝天了！", 		--物品名：巨荒蜈 检查状态：身体已经翻转
        },

        TREE_ROCK =
		{
			BURNING = "它的树干好像有点过热了。", 		--物品名：巨石枝 检查状态：正在燃烧
			CHOPPED = "它缺少了支撑。", 		--物品名：巨石枝 检查状态：已经砍伐
			GENERIC = "在我看来像是蔓藤。", 		--物品名：巨石枝 检查状态：普通状态
		},

        CAVE_VENT_ROCK =
        {
            GENERIC = "我也搞不清楚它朝哪排气。", 		--物品名：喷气孔 检查状态：普通状态
            HOT     = "氛围越来越火热。", 		--物品名：喷气孔 检查状态：温度很高
            GAS     = "那个在排气。", 		--物品名：喷气孔 检查状态：正在排放气体
            MIASMA  = "我哮喘怎么办？", 		--物品名：喷气孔 检查状态：正在释放瘴气
        },
        CAVE_FERN_WITHERED = "一株枯萎的蕨类植物。",		--物品名：枯萎的蕨类
        FLOWER_CAVE_WITHERED = "暗淡的球茎。",		--物品名：枯萎的荧光花

		ABYSSPILLAR_MINION =
		{
			GENERIC = "还好只是一座雕像。", 		--物品名：追随者 检查状态：普通状态
			ACTIVATED = "真没创意！", 		--物品名：追随者 检查状态：已经激活
		},
		ABYSSPILLAR_TRIAL = "那有个拉杆。",		--物品名：杠杆

        VAULT_TELEPORTER =
        {
            GENERIC = "心动不如行动。",		--物品名：圣殿路标 检查状态：普通状态
            BROKEN = "它坏掉了。",		--物品名：圣殿路标 检查状态：已经损坏
            UNPOWERED = "得给它充个能。",		--物品名：圣殿路标 检查状态：尚未供能
        },
		VAULT_TELEPORTER_UNDERCONSTRUCTION = "“此路标是未来更新的内容，目前正在开发中。”",		--物品名：建造中的宝库传送器
		VAULT_ORB = "求它能发挥作用吧。",		--物品名：传送宝珠
        VAULT_LOBBY_EXIT = "如果我拴上根绳子，就能爬出去了。",		--物品名：裂口
		VAULT_CHANDELIER_BROKEN = "没光了。",		--物品名：圣殿华灯

		ANCIENT_HUSK = "这里发生过不好的事情。",		--物品名：远古遗骸
		MASK_ANCIENT_HANDMAIDHAT = "我可不想惹她。",		--物品名：鞘翅面具
		MASK_ANCIENT_ARCHITECTHAT = "看不出哪里像。",		--物品名：远见者面具
		MASK_ANCIENT_MASONHAT = "这个看上去比其他的重。",		--物品名：工匠面具

        TREE_ROCK_SEED = "这是一颗种子。",		--物品名：巨石枝种子
        TREE_ROCK_SAPLING = "坚如磐石的小苗。",		--物品名：巨石枝树苗

        OCEANWHIRLBIGPORTALEXIT = "海上碎屑。", 		--物品名：海洋漂浮物

		VAULT_TORCH =
		{
			GENERIC = "这是灯的开关吗？",		--物品名：谜之火焰 检查状态：普通状态
			BROKEN = "开关看似已坏。", 		--物品名：谜之火焰 检查状态：已经损坏
		},

        CAVE_VENT_MITE =
		{
			DEAD = "断气了！",		--物品名：地热螨 检查状态：已经死亡
			GENERIC = "这是什螨玩意？",		--物品名：地热螨 检查状态：普通状态
			SLEEPING = "当心，它螨可能醒的。",		--物品名：地热螨 检查状态：正在睡眠
            VENTING = "它正喷发狂怒！", 		--物品名：地热螨 检查状态：正在从通风口涌出
        },


		PUMPKINHAT =
		{
			GENERIC = "好空洞的表情。",		--物品名：无面南瓜 检查状态：普通状态
			UNCARVED = "它没脸呀，我不戴。",		--物品名：无面南瓜 检查状态：尚未雕刻
		},

        PENGUINCORPSE =
		{
            GENERIC  = "实乃禽兽。", 		--物品名：企鸥尸体 检查状态：普通状态
            BURNING  = "这才叫真正的火鸟。", 		--物品名：企鸥尸体 检查状态：正在燃烧
            REVIVING = "它正在变成新物种！", 		--物品名：企鸥尸体 检查状态：尸体正在复活
		},
        SPIDERCORPSE =
		{
			GENERIC = "恶心！",		--物品名：蜘蛛尸体 检查状态：普通状态
			BURNING = "这下好多了。",		--物品名：蜘蛛尸体 检查状态：正在燃烧
			REVIVING = "简直大错特错。",		--物品名：蜘蛛尸体 检查状态：尸体正在复活
		},
        SPIDERQUEENCORPSE =
		{
			GENERIC = "呃！我觉得恶心。",		--物品名：蜘蛛女王尸体 检查状态：普通状态
			BURNING = "这下好多了。",		--物品名：蜘蛛女王尸体 检查状态：正在燃烧
			REVIVING = "这下糟了。",		--物品名：蜘蛛女王尸体 检查状态：尸体正在复活
		},
        MERMCORPSE =
		{
			GENERIC = "一个鱼人死了。",		--物品名：鱼人尸体 检查状态：普通状态
			BURNING = "这气味太糟糕了。",		--物品名：鱼人尸体 检查状态：正在燃烧
			REVIVING = "死鱼人醒过来了！",		--物品名：鱼人尸体 检查状态：尸体正在复活
		},
        GENERIC_CORPSE = 
        {
            GENERIC = "确定死掉了。",		--物品名：普通生物尸体 检查状态：普通状态
            BURNING = "这下不会再回来了。",		--物品名：普通生物尸体 检查状态：正在燃烧
            REVIVING = "年年有今日。",		--物品名：普通生物尸体 检查状态：尸体正在复活
        },


		W_RADIO = "嗯，科技含量很高。",		--物品名：B.U.D.D.Y.

		HERMITHOTSPRING  =
        {
            BOMBED = "放松的完美公式。",		--物品名：珍珠的温泉 检查状态：被沐浴球处理过
            GENERIC = "能泡下这身疲倦的身骨该多好。",		--物品名：珍珠的温泉 检查状态：普通状态
            EMPTY = "水呢？",		--物品名：珍珠的温泉 检查状态：内容为空
        },
		HERMITHOTSPRING_CONSTR = "还在建设中。",		--物品名：温泉
		MEATRACK_HERMIT_MULTI = 
        {
            DONE = "肉干可以吃了！",		--物品名：晾肉巨架 检查状态：处理已经完成
            DRYING = "风干需要时间。",		--物品名：晾肉巨架 检查状态：肉类正在晾晒
            DRYINGINRAIN = "雨天风干更费时。",		--物品名：晾肉巨架 检查状态：雨中仍挂着肉类，晾晒暂停
            GENERIC =  "风干正当时。",		--物品名：晾肉巨架 检查状态：普通状态
            BURNT = "晾肉架烧掉了。",		--物品名：晾肉巨架 检查状态：已经烧毁
            DONE_NOTMEAT = "实验术语里，我们管它叫“干燥”。",		--物品名：晾肉巨架 检查状态：非肉类晾晒已经完成
            DRYING_NOTMEAT = "风干可算不上科学。",		--物品名：晾肉巨架 检查状态：非肉类正在晾晒
            DRYINGINRAIN_NOTMEAT = "雨啊，快走开。想下，改天来。",		--物品名：晾肉巨架 检查状态：雨中仍挂着非肉类，晾晒暂停
            DONE_SALT = "钠么咸。",		--物品名：晾肉巨架 检查状态：盐渍晾晒已经完成
			ABANDONED = "它努力干过了。",		--物品名：晾肉巨架 检查状态：已被原主人遗弃
        },
		HERMITHOUSE_ORNAMENT = "多么悦耳。",		--物品名：风铃
		HERMITHOUSE_LAUNDRY = "我要不要提醒她，还是装作没看见？",		--物品名：寄居蟹隐士的晾衣处

        PETALS_DRIED = "干得漂亮。",		--物品名：干花瓣
        PETALS_EVIL_DRIED = "干得漂亮。",		--物品名：干深色花瓣
        FOLIAGE_DRIED = "干得漂亮。",		--物品名：干蕨叶
        SUCCULENT_PICKED_DRIED = "干得漂亮。",		--物品名：干多肉
        FIRENETTLES_DRIED = "干得漂亮。",		--物品名：干火荨麻叶
        TILLWEED_DRIED = "干得漂亮。",		--物品名：干犁地草
        MOON_TREE_BLOSSOM_DRIED = "干得漂亮。",		--物品名：干月树花
        FORGETMELOTS_DRIED = "干得漂亮。",		--物品名：干必忘我

        HERMITCRABTEA_PETALS = "嗯……一杯甜甜的安神茶。",		--物品名：花瓣茶
        HERMITCRABTEA_PETALS_EVIL = "登疯燥极的茶！",		--物品名：深色花瓣茶
        HERMITCRABTEA_FOLIAGE = "别担心，我不会狂喝不止。",		--物品名：蕨叶茶
        HERMITCRABTEA_SUCCULENT_PICKED = "我要留着去沙漠喝。",		--物品名：多肉茶
        HERMITCRABTEA_FIRENETTLES = "此处应该有“高温”警告。",		--物品名：火荨麻茶
        HERMITCRABTEA_TILLWEED = "为健康小小干一杯！",		--物品名：犁地草茶
        HERMITCRABTEA_MOON_TREE_BLOSSOM = "不是我要点出残缺，但这味道有点“蜡”。",		--物品名：月树花茶
        HERMITCRABTEA_FORGETMELOTS = "它还真融化了我的疯狂。",		--物品名：必忘我茶
        SHELLWEAVER = "我盐究制作点有用的东西。",		--物品名：盐晶组合机
        ICESTAFF2 = "带有免费的冻结升级！",		--物品名：闪冻魔杖
        ICESTAFF3 = "更加强大的制冰效果。",		--物品名：深冻魔杖
        NONSLIPGRIT = "不抓眼球，专抓脚！",		--物品名：防滑粉
        NONSLIPGRITBOOSTED = "现在我们真的稳了！",		--物品名：防滑颗粒
        DESICCANT = "就是干干干！",		--物品名：小包干燥剂
        DESICCANTBOOSTED = "让我干爽无比！",		--物品名：大包干燥剂
        HERMITCRAB_SHELL = "壳以去珍珠那了吗？",		--物品名：搬运海螺
        SALTY_DOGHAT = "附赠友谊的小船。",		--物品名：咸狗帽
        SALTY_DOG = "谁是最骄傲的小海豹？",		--物品名：咸狗

        HERMITCRAB_TEASHOP =
        {
            GENERIC = "店空茶也空。", 		--物品名：珍珠的茶店 检查状态：普通状态
            ACTIVE = "茶点时间！", 		--物品名：珍珠的茶店 检查状态：正在运作
            BREWING = "我花了大价钱让她沏茶。", 		--物品名：珍珠的茶店 检查状态：完成交易后正在沏茶
            BURNT = "她的店被烤成吐司了。", 		--物品名：珍珠的茶店 检查状态：已经烧毁
        },

        FISHMEAT_DRIED = "那条鱼太有干货了。",		--物品名：鱼肉干
        FISHMEAT_SMALL_DRIED = "那条鱼太有干货了。",		--物品名：小鱼干

        HERMITCRAB_LIGHTPOST = 
        {
            GENERIC = "它们确实能点亮气氛。",		--物品名：珍珠的灯柱 检查状态：普通状态
            ABANDONED = "太悲伤了，我受不了。",		--物品名：珍珠的灯柱 检查状态：已被原主人遗弃
        },
        HERMITCRAB_LIGHTPOST_ITEM = "我们来串起一些氛围灯吧。",		--物品名：珍珠的灯柱套装


        YOTH_KNIGHTSHRINE =
        {
            GENERIC = "我已经开足马力了。", 		--物品名：发条骑士神龛 检查状态：普通状态
            EMPTY = "我要是不给供品它就冷落我。", 		--物品名：发条骑士神龛 检查状态：内容为空
            BURNT = "马就算烧成灰也不是驴。", 		--物品名：发条骑士神龛 检查状态：已经烧毁
        },

        MASK_PRINCESSHAT = "你好，公主！",		--物品名：公主面具
        COSTUME_PRINCESS_BODY = "别理会任何马后炮。",		--物品名：公主服

        PLAYBILL_THE_PRINCESS_YOTH = "你蹄验过这个了吗？",		--物品名：《我的四骑士与我》 舞台剧

        KNIGHT_YOTH =
        {
            GENERIC = "少打马虎眼瞎闹！", 		--物品名：镀金骑士 检查状态：普通状态
            FOLLOWING = "好骑士！", 		--物品名：镀金骑士 检查状态：正在跟随当前检查角色
            FOLLOWING_OTHER = "现在谁领头？你听说了吗？", 		--物品名：镀金骑士 检查状态：正在跟随其他角色
        },

        YOTH_KNIGHTHAT = "我戴会不会像匹小马驹？",		--物品名：镀金骑士头盔
        ARMOR_YOTH_KNIGHT = "一堆疑问像马鞍一样重压着我。",		--物品名：镀金骑士胸甲
        HORSESHOE = "留着它没准有马蹄铁的好运。",		--物品名：幸运马蹄铁
        YOTH_LANCE = "可别误以为我是骑枪不离手的兰斯洛特。",		--物品名：冲锋骑枪

        FLOATINGLANTERN =
        {
            DEFLATED = "确认泄气了！", 		--物品名：天灯 检查状态：已经泄气
            HELD = "诀窍就是要放手。", 		--物品名：天灯 检查状态：正被角色携带
            GENERIC = "这不就亮了！", 		--物品名：天灯 检查状态：普通状态
        },

        YOTH_KNIGHTSTICK = "任我驰骋吧！",		--物品名：滑稽马
        YOTH_CHAIR_ROCKING_ITEM = "坐上去颠得很！", 		--物品名：摇摇马套装


		WX78_DRONE_SCOUT = "飞得这么远，太好了。",		--物品名：旋翼测绘机
		WX78_DRONE_DELIVERY = "就怕会弄丢！",		--物品名：便携储存单元
		WX78_DRONE_ZAP = "它运用了电能技术。",		--物品名：电刑机
		WX78_DRONE_ZAP_REMOTE =
		{
			GENERIC = "远程操控？这就是……远程操控装置！",		--物品名：电刑机控制器 检查状态：普通状态
			CANUSE = "想电的太多，时间却太少",		--物品名：电刑机控制器 检查状态：当前可以使用
		},

        WX78MODULE_RADAR = "一个小玩意竟然装得下这么多的科学知识。",		--物品名：增程电路
        WX78MODULE_STACKSIZE = "一个小玩意竟然装得下这么多的科学知识。",		--物品名：空间扩展电路
        WX78MODULE_DIGESTION = "一个小玩意竟然装得下这么多的科学知识。",		--物品名：再消化电路
        WX78MODULE_SCREECH = "一个小玩意竟然装得下这么多的科学知识。",		--物品名：声波激发电路
        WX78MODULE_LIGHT2 = "一个小玩意竟然装得下这么多的科学知识。",		--物品名：超级照明电路
        WX78MODULE_SHIELDING = "一个小玩意竟然装得下这么多的科学知识。",		--物品名：格挡电路
        WX78MODULE_SPIN = "一个小玩意竟然装得下这么多的科学知识。",		--物品名：旋转周期电路
		WX78MODULE_CHESS = "一个小玩意竟然装得下这么多的科学知识。",		--物品名：棋圣电路

        WX78_INVENTORYCONTAINER =
        {
            HELD = "无限空间", 		--物品名：坍缩储存单元 检查状态：正被角色携带
			NOPOWER = "拒绝访问。电量不足。", 		--物品名：坍缩储存单元 检查状态：没有电力
            GENERIC = "空间有限。", 		--物品名：坍缩储存单元 检查状态：普通状态
        },

        WX78_FOODBRICK =
        {
            WET = "试着吃，湿着吃！",		--物品名：营养砖 检查状态：处于潮湿状态
            GENERIC = "硬得没法吃。",		--物品名：营养砖 检查状态：普通状态
        },

        WX78_BACKUPBODY =
        {
            GENERIC = "通过工程学实现了现实意义的永生！", 		--物品名：备份底盘 检查状态：普通状态
            UNCLAIMED = "不错的硬件。", 		--物品名：备份底盘 检查状态：备用躯体尚未绑定主人
            VIEWERS_BODY = "可悲的肉体生物，被束缚在有机形态里", 		--物品名：备份底盘 检查状态：这是当前机器人的备用躯体
        },

        WX78_POSSESSEDBODY = "你最近不太像你自己！",		--物品名：附身底盘

        WX78_GESTALTTRAPPER = "WX是被什么东西附身才做出这个的？",		--物品名：灵体传输模块

        SHADOW_HEART_VEIN = "想要变得有用的脉管。",		--物品名：暗影心房卷须

        WX78_SHADOWDRONE_DEBUFFER = "好一位敏锐的观察者。",		--物品名：破绽放大机
        WX78_SHADOWDRONE_HARVESTER = "WX收藏品中的一位收集者。",		--物品名：自动抓取机

        STALKER_NPC = "我们说好了，过去的就让它过去。",		--物品名：远古织影者

        MITEGLAND =
        {
            GENERIC = "那些螨虫肚子里多少有点东西。",		--物品名：火腺 检查状态：普通状态
            COLD = "变冷了。",		--物品名：火腺 检查状态：温度较低
        },
        MITEGLAND_COOKED = "我把它做熟了……但我真的想吃吗？",		--物品名：熟火腺

        BROKEN_FUMAROLETOOLITEM = "温度够高的话，我没准能把碎片融化然后接回去。", 		--物品名：损坏的火山工具
        FUMAROLEAXE =
		{
			GENERIC = "它又冷又脆。", 		--物品名：炽热斧 检查状态：普通状态
			LUKEWARM = "我感觉它要凉了。", 		--物品名：炽热斧 检查状态：温度微温
			WARM = "它热起来了！", 		--物品名：炽热斧 检查状态：温度较暖
			HOT = "热卖商品。", 		--物品名：炽热斧 检查状态：温度很高
		},

        FUMAROLEPICKAXE =
		{
			GENERIC = "它又冷又脆。", 		--物品名：烈焰鹤嘴锄 检查状态：普通状态
			LUKEWARM = "我感觉它要凉了。", 		--物品名：烈焰鹤嘴锄 检查状态：温度微温
			WARM = "它热起来了！", 		--物品名：烈焰鹤嘴锄 检查状态：温度较暖
			HOT = "热卖商品。", 		--物品名：烈焰鹤嘴锄 检查状态：温度很高
		},

        FUMAROLEHAMMER =
		{
			GENERIC = "它又冷又脆。", 		--物品名：炎头锤 检查状态：普通状态
			LUKEWARM = "我感觉它要凉了。", 		--物品名：炎头锤 检查状态：温度微温
			WARM = "它热起来了！", 		--物品名：炎头锤 检查状态：温度较暖
			HOT = "热卖商品。", 		--物品名：炎头锤 检查状态：温度很高
		},

        FUMAROLESHOVEL =
		{
			GENERIC = "它又冷又脆。", 		--物品名：呲啦铲 检查状态：普通状态
			LUKEWARM = "我感觉它要凉了。", 		--物品名：呲啦铲 检查状态：温度微温
			WARM = "它热起来了！", 		--物品名：呲啦铲 检查状态：温度较暖
			HOT = "热卖商品。", 		--物品名：呲啦铲 检查状态：温度很高
		},

        FUMAROLE_FARM_HOE =
		{
			GENERIC = "它又冷又脆。", 		--物品名：烧灼园艺锄 检查状态：普通状态
			LUKEWARM = "我感觉它要凉了。", 		--物品名：烧灼园艺锄 检查状态：温度微温
			WARM = "它热起来了！", 		--物品名：烧灼园艺锄 检查状态：温度较暖
			HOT = "热卖商品。", 		--物品名：烧灼园艺锄 检查状态：温度很高
		},

        TRAP_FUMAROLE =
        {
            HELD = "我的口袋都要被烧出个洞了！", 		--物品名：煤炭 检查状态：正被角色携带
            GENERIC = "它们冷的时候不太有效。", 		--物品名：煤炭 检查状态：普通状态
            WARM = "它冷却了些，但还是能造成点伤害。", 		--物品名：煤炭 检查状态：温度较暖
            HOT = "我可不会一脚踩上去。", 		--物品名：煤炭 检查状态：温度很高
        },

        HEALINGSALVE_FUMAROLE = "它以热制热。",		--物品名：避火膏

		VAULT_PILLAR_GUARD = "才刚开始就遇上了绊脚石……",		--物品名：远古戍卫塔
		VAULT_PILLAR_GUARD_CRAFTED = "谁都别想从这家伙眼皮底下溜过去！",		--物品名：戍卫塔
		VAULT_PILLAR_GUARD_DORMANT = "它是一座塔。",		--物品名：远古之塔
		VAULT_PILLAR_GUARD_DORMANT_CRAFTED = "它只需要一点灵感的火花！",		--物品名：人工建造的休眠宝库守卫柱
		VAULT_PILLAR_GUARD_CONSTR = "它还需要什么？",		--物品名：戍卫塔基址
		VAULT_PILLAR_GUARD_CONSTR_PLANS = "我得找个好地方放它。",		--物品名：戍卫塔套装
		VAULT_CRAWLER =
		{
			GENERIC = "偏偏在我所向披靡的时候，它就这么从天而降了！",		--物品名：辉光象鼻虫 检查状态：普通状态
			SOCKETED = "像安灯泡一样刚好装上！",		--物品名：辉光象鼻虫 检查状态：已经嵌入插槽
		},

        VAULT_DECON_DOOR = "这是为了把什么东西堵在里面，还是挡在外面？",		--物品名：内殿屏障
        VAULT_DECON_MISTER = "真神秘……",		--物品名：圣殿净化器
		VAULT_KEY_ACTIVATOR = "一个念头在我脑海里一闪而过……",		--物品名：脉冲基座
		VAULT_CRAWLER_LEVER = "不过是根神秘拉杆，最坏又能怎样呢？",		--物品名：杠杆
        VAULT_KEY = "总算让我找到回家的钥匙了吗？",		--物品名：钥石
        VAULT_KEY_PEDESTAL =
        {
            GENERIC = "解锁一切的钥匙就在那里。", 		--物品名：圣匣 检查状态：普通状态
            PICKED = "它是空的。", 		--物品名：圣匣 检查状态：已经采集
        },
        VAULT_ORB_REFINED = "我也会为之所动。",		--物品名：传送宝珠碎片
        VAULT_PILLAR_GUARD_PIECE = "这一定是那座行走高塔的重要零件。",		--物品名：宝库守卫柱部件
        VAULT_REFINER_PEDESTAL = "这是什么古老的科技！",		--物品名：圣殿锻台

        VAULT_COMPASS =
        {
            GENERIC = "这仪器无可比拟。", 		--物品名：路标导航仪 检查状态：普通状态
            NOTVAULT = "它在这里好像不起作用。", 		--物品名：路标导航仪 检查状态：指南针未指向宝库目标
            KEYROOM = "它之前是在把我引到这个房间。", 		--物品名：路标导航仪 检查状态：指南针正指向宝库钥匙房
        },

        CEILING_ROPE = "这是条攀爬绳。",		--物品名：绳子
        VAULT_KEY_EXIT = "我没法在这里系绳子。",		--物品名：裂口


        CARNIVALGAME_GOLFGAME_KIT_EASY = "这里的物理限制应该比较宽松。",		--物品名：初学者迷你高尔夫套装
        CARNIVALGAME_GOLFGAME_KIT_MEDIUM = "我来试试看。",		--物品名：标准迷你高尔夫套装
        CARNIVALGAME_GOLFGAME_KIT_HARD = "这可能需要更多计算。",		--物品名：专家迷你高尔夫套装
        CARNIVALGAME_GOLFGAME_KIT_DIY = "嗯，一定有个公式指导建造完美的迷你高尔夫球场。",		--物品名：自定义迷你高尔夫套装

        CARNIVALGAME_GOLF_TEE =
        {
            GENERIC = "它需要一枚代币，才能让这场标杆派对开始！",  		--物品名：迷你高尔夫落球器 检查状态：普通状态
            PLAYING = "游戏正在进行中。", 		--物品名：迷你高尔夫落球器 检查状态：游戏正在进行
            INACTIVE = "需要洞察一下问题。", 		--物品名：迷你高尔夫落球器 检查状态：当前未激活
        },
        CARNIVALGAME_GOLF_HOLE = "我会把球推进那里面。",		--物品名：迷你高尔夫旗洞

        CARNIVALGAME_GOLF_TEE_KIT = "从哪开始呢？",		--物品名：迷你高尔夫落球器套装
        CARNIVALGAME_GOLF_HOLE_KIT = "终点放在哪里呢？",		--物品名：迷你高尔夫旗洞套装

        CARNIVALGAME_GOLFCLUB = "推杆准备！",		--物品名：推杆
        CARNIVALGAME_GOLFBALL = "我“圆”来见过你！",		--物品名：高尔夫球

        CARNIVALGAME_GOLFPROP_FENCE = "这个可绕不过去。",		--物品名：迷你高尔夫边界栅栏

        CARNIVALGAME_GOLFPROP_SPINNER = "它果真扭转了局面。", 		--物品名：鸦年华迷你高尔夫旋转障碍
        CARNIVALGAME_GOLFPROP_CUTOUT = "纯粹就是挡路。", 		--物品名：鸦年华迷你高尔夫挡板
        CARNIVALGAME_GOLFPROP_MOVINGWALL = "这个障碍物历经了起起落落。", 		--物品名：鸦年华迷你高尔夫移动墙

        CARNIVALGAME_GOLFPROP_WORMHOLE = "我真想研究一下这两端是怎么连接的，不过可能会有点恶心。", 		--物品名：迷你虫洞

        CARNIVALGAME_GOLFPROP_SPRING = "谁说天下没有免费的发射！", 		--物品名：循环定向弹板

        CARNIVALGAME_GOLFPROP_FAN = "它可吹不走我。", 		--物品名：扇风


        ROCKY_BOSS =
        {
            GENERIC = "It really cuts to the chase!",		--物品名：石虾首领（测试版暂译） 检查状态：普通状态
            BOULDER = "It's bolder than a boulder.", 		--物品名：石虾首领（测试版暂译） 检查状态：收缩成岩石状
            ACID = "Something's happening to its shell.",		--物品名：石虾首领（测试版暂译） 检查状态：受到酸液影响
        },
		ROCKY_BOSS_SHADOW = "Is that even a shell anymore?",		--物品名：暗影石虾首领（测试版暂译）
        BAT_BOSS =
        {
            GENERIC = "It has a rather draining personality!",		--物品名：蝙蝠首领（测试版暂译） 检查状态：普通状态
            ACID = "Glow and behold! The acid has driven it mad!",		--物品名：蝙蝠首领（测试版暂译） 检查状态：受到酸液影响
        },
		BAT_BOSS_SHADOW = "Maybe it's a differnt breed.",		--物品名：暗影蝙蝠首领（测试版暂译）

        BATBOSSCAVE =
        {
            GENERIC = "I think I see something inside.", 		--物品名：蝙蝠首领巢穴（测试版暂译） 检查状态：普通状态
            VACANT = "Nobody's home?", 		--物品名：蝙蝠首领巢穴（测试版暂译） 检查状态：巢穴空置
        },

        WORM_BOSS_SHADOW = "It's too big to hide in shadow.",		--物品名：暗影蠕虫首领（测试版暂译）

        ARMOR_ROCKY = "I'll be the lob in these parts!",		--物品名：石虾护甲（测试版暂译）
        BAT_BOSSCORPSEHAT = "It makes me uncomfortable.",		--物品名：蝙蝠首领尸骸帽（测试版暂译）

        ATRIUM_RITUAL_ORGAN_ROCKY =
        {
            GENERIC = "This claw is special.",		--物品名：中庭仪式石虾祭品（测试版暂译） 检查状态：普通状态
            IN_RITUAL = "The offering has been made.", 		--物品名：中庭仪式石虾祭品（测试版暂译） 检查状态：已经放入仪式
        },
        ATRIUM_RITUAL_ORGAN_BAT =
        {
            GENERIC = "This screams disgusting.",		--物品名：中庭仪式蝙蝠祭品（测试版暂译） 检查状态：普通状态
            IN_RITUAL = "The offering has been made.", 		--物品名：中庭仪式蝙蝠祭品（测试版暂译） 检查状态：已经放入仪式
        },
        ATRIUM_RITUAL_ORGAN_WORM =
        {
            GENERIC = "That's offal important.",		--物品名：中庭仪式蠕虫祭品（测试版暂译） 检查状态：普通状态
            IN_RITUAL = "The offering has been made.", 		--物品名：中庭仪式蠕虫祭品（测试版暂译） 检查状态：已经放入仪式
        },

		CHARLIE_BOSS = "This is bad.",		--物品名：查理（首领战）
		SHROUDEN =
		{
			GENERIC = "There is no scientific explanation for that.",		--物品名：暗影实体（SHROUDEN，测试版暂译） 检查状态：普通状态
			PUDDLE = "I suppose I should... go for the eye!",		--物品名：暗影实体（SHROUDEN，测试版暂译） 检查状态：化作地面的暗影形态
		},

        CHARLIEARENA_SPIKE = "What a fascinating if not terrifying rock formation.",		--物品名：查理竞技场尖刺（测试版暂译）

        KING_CANE =
        {
            GENERIC = "It's fully staffed.", 		--物品名：王之手杖（测试版暂译） 检查状态：普通状态
            EMPTY = "It needs a gem.", 		--物品名：王之手杖（测试版暂译） 检查状态：内容为空
        },
        QUEEN_TORCH = "What a peculiar flame.",		--物品名：女王火炬（测试版暂译）
        
        CHARLIEARENA_TELEPORTER = "I'd better take everything with me.",		--物品名：查理竞技场传送装置（测试版暂译）

        MASK_CHARLIE_BOSSHAT = "I wonder how old it is.",		--物品名：查理面具（测试版暂译）
    },

    DESCRIBE_GENERIC = "这是某种...东西。",		--检查物品描述的缺省值
    DESCRIBE_TOODARK = "太黑了，什么也看不见！",		--天太黑
    DESCRIBE_SMOLDERING = "那东西快要着火了。",		--冒烟

    DESCRIBE_PLANTHAPPY = "多么快乐的植物啊!",		--检查植物 植物满足
    DESCRIBE_PLANTVERYSTRESSED = "这株植物似乎承受了很大的压力。",		--检查植物 植物压力山大(没戴眼镜时检查)
    DESCRIBE_PLANTSTRESSED = "它有点暴躁。",		--检查植物 植物有压力(没戴眼镜时检查)
    DESCRIBE_PLANTSTRESSORKILLJOYS = "我可能要除一下草……",		--检查植物 有讨厌的(腐烂的大蔬菜、杂草、土壤杂物碎片)
    DESCRIBE_PLANTSTRESSORFAMILY = "我的科学结论是这株植物很孤独。",		--检查植物 同类作物不足
    DESCRIBE_PLANTSTRESSOROVERCROWDING = "植物太多，地方太小。",		--检查植物 过度拥挤
    DESCRIBE_PLANTSTRESSORSEASON = "这个季节对这株植物并不友好。",		--检查植物 季节错误
    DESCRIBE_PLANTSTRESSORMOISTURE = "看起来有点脱水。",		--检查植物 缺少水分
    DESCRIBE_PLANTSTRESSORNUTRIENTS = "这颗可怜的植物需要营养!",		--检查植物 缺少养分
    DESCRIBE_PLANTSTRESSORHAPPINESS = "它想找人好好聊聊。",		--检查植物 没聊天

    EAT_FOOD =
    {
        TALLBIRDEGG_CRACKED = "嗯，鸟嘴。",		--吃孵化的高脚鸟蛋
		WINTERSFEASTFUEL = "它尝起来是节日的味道。",		--吃冬季盛宴食物
    },

    WENDY_SKILLTREE_EASTEREGG = "是你吗，阿比？",		--温蒂技能树彩蛋台词
}
