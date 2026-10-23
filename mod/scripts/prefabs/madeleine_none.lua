--官方的皮肤:skinprefabs.lua
--https://dontstarve.fandom.com/wiki/Belongings
--[[
    品质分类(仅财务皮肤,稀有度从上往下):
    Event:活动:活动期间才可以使用的皮肤:金色
    ProofOfPurchase:购买凭证:购买周边赠送的皮肤:深绿色
    Timeless:永恒:过去活动登录赠送的皮肤:较深绿色
    Loyal:忠诚:科雷点数商店换取的皮肤:浅绿色
    HeirloomElegant:祖传优雅:曾经不可编织的红皮如今有可以编织的,但是为了和可编织的区分开单独另算一种皮肤,拆掉获取1350线轴:深红色
    HeirloomDistinguished:祖传杰出:曾经不可编织的粉皮如今有可以编织的,但是为了和可编织的区分开单独另算一种皮肤,拆掉获取450线轴:深红色
    Elegant:优雅:就是我们常说的红色皮肤,包括编织的和不可编织的,拆掉获取450线轴:红色
    Distinguished:杰出:粉色皮肤,包括编织的和不可编织的,拆掉获取150线轴:粉色
    Spiffy:炫酷:紫色皮肤,包括编织的和不可编织的,拆掉获取50线轴:紫色
    Classy:上等:蓝色皮肤,包括编织的和不可编织的,拆掉获取15线轴:蓝色
    Complimentary:免费:普通皮肤,不变色,所有账号自动获取,原版仅唱片CD

	----XX系列示例
	skin_tags = { "ABIGAIL", "PIRATE", "CRAFTABLE", },

	PIRATE（江洋大盗系列）
	ROSE（玫瑰系列）
	VICTORIAN（维多利亚系列）
	HALLOWED（万圣系列）
	SHADOW（暗影系列）
	LUNAR（月亮系列）
	FORMAL（正装系列）
	SURVIVOR（幸存者系列）
	ANCIENT（远古系列）
	ICE（冰雪系列）
	YULE（冬季节日系列）
	LAVA（熔岩系列）
	VARG（狼王系列）
	CRAFTABLE（可制作系列）
	MASQUERADE（假面舞会系列）
	WESTERN（西部系列）
	RELIC（遗迹系列）
	MYSTICAL（神秘系列）
	GOTHIC（哥特系列）
	FANTASY（奇幻系列）
	CAWNIVAL（狂欢节系列）
	COTTAGE（田园系列）
	NAUTICAL（航海系列）
	PEARL（珍珠系列）
	ARTNOUVEAU（新艺术系列）
	YOTP（猪王年系列）
	YOTC（鸡年系列）
	HANDMEDOWN（传家宝系列）
	COSTUME（装扮系列）
	WINTER（冬季系列）
	HEART（爱心系列）
	CRYSTAL（水晶系列）
	INSECT（昆虫系列）
	SWAMP（沼泽系列）
	BUILDERS（建造者系列）
	BARBER（理发师系列）
	SEASIDE（海滨系列）
	FOOLS（愚人系列）
	WIZARD（巫师系列）
	T_UPDATE（泰拉瑞亚联动系列）
	C_UPDATE（咩咩启示录联动系列）
	NEXTKIN（近亲系列）
	MIGHTY（强壮系列）
	HOCKEY（冰球系列）
	VALKYRIE（女武神系列）
	CLOWN（小丑系列）
	MUSHROOM（蘑菇系列）
	CACTUS（仙人掌系列）
	MINOTAUR（牛头人系列）
	ORIGINAL（原始系列）
	CAVE（洞穴系列）
	RETRO（复古系列）
	ORNATE（华丽系列）
	WAGSTAFF（瓦格斯塔夫系列）
	GREEN（绿色系）
	RED（红色系）
	BLUE（蓝色系）
	GREY（灰色系）
	ORANGE（橙色系）
	WHITE（白色系）
	NAVY（藏青色系）
	PLANETS（行星系列）
	ALCHEMY（炼金系列）
	MANIPULATOR（操纵者系列）
	SCIENCEMACHINE（科学机器系列）
	ANIMAL（动物系列）
	BEDROLL（睡袋系列）
	FISHINGROD（鱼竿系列）
	FIREPIT（火坑系列）
	LANTERN（灯笼系列）
	TORCH（火把系列）
	MAST（桅杆系列）
	BOAT（船系列）
	DOCK（码头系列）
	FENCE（围栏系列）
	CHEST（箱子系列）
	BACKPACK（背包系列）
	PIGGYBACK（猪背系列）
	KRAMPUS_SACK（坎普斯包系列）
	BUNDLE（包裹系列）
	SALTBOX（盐盒系列）
	ICEBOX（冰箱系列）
	COOKPOT（锅系列）
	BEEBOX（蜂箱系列）
	BIRDCAGE（鸟笼系列）
	MEATRACK（肉架系列）
	MUSHROOM_LIGHT（蘑菇灯系列）
	RESURRECTIONSTATUE（复活雕像系列）
	WARDROBE（衣柜系列）
	SCULPTINGTABLE（雕刻台系列）
	TOWNPORTAL（城镇传送门系列）
	GLOMMER（咕噜咪系列）
	HUTCH（哈奇系列）
	CHESTER（切斯特系列）
	LUREPLANT（食人花系列）
]]

local assets = {
	Asset("ANIM", "anim/madeleine.zip"),
	Asset("ANIM", "anim/ghost_madeleine_build.zip"),
}

local skins = {
	normal_skin = "madeleine",
	ghost_skin = "ghost_madeleine_build",
}

return CreatePrefabSkin("madeleine_none", {
	base_prefab = "madeleine",
	skins = skins,
	assets = assets,
	skin_tags = {
		"BASE",
		"MADELEINE",
		"CHARACTER",
	},

	build_name_override = "madeleine",
	rarity = "Character",
})
