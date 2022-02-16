

local laba_config = {}

-- 滚轴的数量
laba_config.reel_count = 5


-- 滚轴数据配置
laba_config.reel_config = {
	width 				= 145,
	height 				= 157,
	view_count 			= 3,
	speed               = 2000,
	size_type           = {1,1,1,1,1,1,1,1,1},
	jump_up_time        = 0.2,										-- 起跳动作执行的时间
	jump_up_dis         = 30,										-- 起跳动作滑动的距离
	acc_speed           = 500,										-- 加速度
	jump_down_time_up   = 0.15,										-- 回弹向上的时间参数
	jump_down_time_down = 0.1,										-- 回弹向下的时间参数
}

laba_config.reel_config.speed = 50


laba_config.element_path = {
	[1]		= "yuanbao.png",
	[2]		= "gu.png",
	[3]		= "fudai.png",
	[4]		= "denglong.png",
	[5]		= "jinyu.png",
	[6]		= "ruyi.png",
	[7]		= "tudi.png",
	[8]		= "fo.png",
	[9]		= "caishen.png",
}


laba_config.rate_config = {
	[1] = {
		[3] = 1,
		[4] = 2,
		[5] = 3
	},
	[2] = {
		[3] = 1,
		[4] = 2,
		[5] = 3
	},
	[3] = {
		[3] = 1,
		[4] = 2,
		[5] = 4
	},
	[4] = {
		[3] = 1,
		[4] = 2,
		[5] = 4
	},
	[5] = {
		[3] = 2,
		[4] = 3,
		[5] = 4
	},
	[6] = {
		[3] = 2,
		[4] = 3,
		[5] = 8
	},
	[7] = {
		[3] = 3,
		[4] = 4,
		[5] = 10
	},
	[8] = {
		[3] = 3,
		[4] = 5,
		[5] = 10
	},
	[9] = {
		[3] = 3,
		[4] = 6,
		[5] = 12
	},
}

rawset(_G,"laba_config",laba_config)




