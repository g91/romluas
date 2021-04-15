function Init_RoleValue_ENUM3()

--SetModeEx( int GItemID , int Type , bool Flag ) 設定物件的屬性
Value = 0;
EM_SetModeType_Show		= Value; Value = Value + 1;	--秀出(不論秀出或隱藏, 標記/致能)
EM_SetModeType_Mark		= Value; Value = Value + 1;	--可標記/點選(可以讓玩家點選)
EM_SetModeType_Obstruct		= Value; Value = Value + 1;	--會阻擋(阻擋其他的物件)
EM_SetModeType_Gravity		= Value; Value = Value + 1;	--有重力
EM_SetModeType_Save		= Value; Value = Value + 1;	--此物件是否要儲存
EM_SetModeType_Drag		= Value; Value = Value + 1;	--是否會保持水平傾角
EM_SetModeType_GMHide		= Value; Value = Value + 1;	--完全隱行
EM_SetModeType_IsAllZoneVisible	= Value; Value = Value + 1;	--全域可視物件
EM_SetModeType_DisableRotate	= Value; Value = Value + 1;	--禁止自動旋轉
EM_SetModeType_Strikback		= Value; Value = Value + 1;	--反擊
EM_SetModeType_Move		= Value; Value = Value + 1;	--移動
EM_SetModeType_Searchenemy	= Value; Value = Value + 1;	--搜尋敵人
EM_SetModeType_Revive		= Value; Value = Value + 1;	--可重生
EM_SetModeType_Fight		= Value; Value = Value + 1;	--可砍殺攻擊
EM_SetModeType_Escape		= Value; Value = Value + 1;	--逃跑
EM_SetModeType_SearchenemyIgnore	= Value; Value = Value + 1;	--此物件不會被搜尋到
EM_SetModeType_AlignToSurface	= Value; Value = Value + 1;	--貼齊表面
EM_SetModeType_HideName		= Value; Value = Value + 1;	--NPC 或物件頭上的名稱是否顯示
EM_SetModeType_HideMinimap	= Value; Value = Value + 1;	--NPC 或物件在小地圖上面是否顯示
EM_SetModeType_ShowRoleHead	= Value; Value = Value + 1;	--點擊物件後,是否要顯示頭像框
EM_SetModeType_CollisionPlot	= Value; Value = Value + 1;	--是否擁有碰撞劇情
EM_SetModeType_Treasure		= Value; Value = Value + 1;	--寶箱
EM_SetModeType_IgnoreNpcKill	= Value; Value = Value + 1;	--忽略npc殺死
EM_SetModeType_NotShowHPMP	= Value; Value = Value + 1;	--不顯示血條
EM_SetModeType_DisableAction	= Value; Value = Value + 1	--暫時改變動作

--int HateListInfo( int GItemID , int Pos , int Type ) 取得仇恨表內的 資訊
Value = 0;
EM_HateListInfoType_DBID		= Value; Value = Value + 1;	--資料庫DBID
EM_HateListInfoType_GItemID	= Value; Value = Value + 1;	--遊戲物件號碼
EM_HateListInfoType_HitPoint	= Value; Value = Value + 1;	--傷害怪物點數(分寶用)
EM_HateListInfoType_HatePoint	= Value; Value = Value + 1;	--仇恨值	
EM_HateListInfoType_TempHatePoint	= Value; Value = Value + 1;	--暫時的仇恨值

-- int BuffInfo( int ItemGUID , int Pos , int Type )取得Buff資料
Value = 0;
EM_BuffInfoType_OwnerID		= Value; Value = Value + 1;	--Buff 施展者
EM_BuffInfoType_BuffID		= Value; Value = Value + 1;	--魔法ID
EM_BuffInfoType_Time		= Value; Value = Value + 1;	--剩下時間(秒)
EM_BuffInfoType_Power		= Value; Value = Value + 1;	--威力( 魔法累積等級)
EM_BuffInfoType_Point		= Value; Value = Value + 1;	--點數( 魔法盾可擋點數or 次數)

--	bool	CheckRelation	( int OwnerID , int TargetID , int Type  )
Value = 0;
EM_CheckRelationType_Attackable	= Value; Value = Value + 1;	--可否攻擊
EM_CheckRelationType_Enemy	= Value; Value = Value + 1;	--是否是敵人
EM_CheckRelationType_CheckLine	= Value; Value = Value + 1;	--中間是否沒有阻擋
EM_CheckRelationType_InHateList	= Value; Value = Value + 1;	--是否在仇恨表內

--void	ClientSkyType( int Type )	 設定Client 端天空的顯示方式
Value = 0;
EM_ClientSkyProcType_Normal	= Value; Value = Value + 1;	--一般
EM_ClientSkyProcType_Day		= Value; Value = Value + 1;	--白天
EM_ClientSkyProcType_NightFall	= Value; Value = Value + 1;	--黃昏
EM_ClientSkyProcType_Night	= Value; Value = Value + 1;	--晚上
EM_ClientSkyProcType_Dawn	= Value; Value = Value + 1;	--黎明

--lua時鐘
--bool	ClockOpen( int GItemID , int CheckValue , int BeginTime , int NowTime , int EndTime  , const char* ChangeZonePlot , const char* TimeUpPlot );時間以秒算
--bool      ClockStop( int GItemID );暫停時間
--bool      ClockClose( int GItemID );關閉時間
--int	ClockRead( int GItemID , int Type ); 讀取時鐘資料
Value = 0;
EM_ClockValueType_CheckValue = Value; Value = Value + 1;
EM_ClockValueType_BeginTime  = Value; Value = Value + 1;
EM_ClockValueType_NowTime  = Value; Value = Value + 1;
EM_ClockValueType_EndTime  = Value; Value = Value + 1;
EM_ClockValueType_Type  = Value; Value = Value + 1;   -- 0 close 1 open 2 stop
--lua時鐘宣告處
Value = 0;
EM_ClockCheckValue_1 = Value; Value = Value + 1;	--活動副本 馳風大道
EM_ClockCheckValue_2 = Value; Value = Value + 1;	--活動副本 瑪拉蒂拉
EM_ClockCheckValue_3 = Value; Value = Value + 1;	--節慶活動 - 歡舞節  480s
EM_ClockCheckValue_4 = Value; Value = Value + 1;	--公會校場 命運好好玩
EM_ClockCheckValue_5 = Value; Value = Value + 1;	--活動副本 哥布林競速
EM_ClockCheckValue_6 = Value; Value = Value + 1;	--公會校場 生存遊戲
EM_ClockCheckValue_7 = Value; Value = Value + 1;	--節慶活動 2009 啤酒節 服務生的一天
EM_ClockCheckValue_8 = Value; Value = Value + 1;	--節慶活動 2009 啤酒節 啤酒大師
EM_ClockCheckValue_9 = Value; Value = Value + 1;	--公會校場 號角響起
EM_ClockCheckValue_10 = Value; Value = Value + 1;	--節慶活動 2009 感恩節 糧草徵收
EM_ClockCheckValue_11 = Value; Value = Value + 1;	--公會校場 神鬼戰士
EM_ClockCheckValue_12 = Value; Value = Value + 1;	--公會戰場 世界奇觀計時
EM_ClockCheckValue_13 = Value; Value = Value + 1;	--公會校場 急救特訓
EM_ClockCheckValue_14 = Value; Value = Value + 1;	--公會校場 救傷試煉
EM_ClockCheckValue_15 = Value; Value = Value + 1;	--活動副本 遠古夢境
EM_ClockCheckValue_16 = Value; Value = Value + 1;	--入侵事件1
EM_ClockCheckValue_17 = Value; Value = Value + 1;          --190時間使用
EM_ClockCheckValue_18 = Value; Value = Value + 1;          --190時間使用
EM_ClockCheckValue_19 = Value; Value = Value + 1;          --191時間使用
EM_ClockCheckValue_20 = Value; Value = Value + 1;	--節慶活動 2011 詠火節、歡舞節  --60sec
EM_ClockCheckValue_21 = Value; Value = Value + 1;	--節慶活動 2011 歡舞節
EM_ClockCheckValue_22 = Value; Value = Value + 1;	--節慶活動2011-春雨節 兔子快遞
EM_ClockCheckValue_23 = Value; Value = Value + 1;	--公會校場 全面衝突
EM_ClockCheckValue_24 = Value; Value = Value + 1; 	-- 公會教場 狼來了
EM_ClockCheckValue_25 = Value; Value = Value + 1;          --Access Control -1時間使用
EM_ClockCheckValue_26 = Value; Value = Value + 1;         --詠火節--打惡獸用
EM_ClockCheckValue_27 = Value; Value = Value + 1;	--愛樂節--打魅影用
EM_ClockCheckValue_28 = Value; Value = Value + 1;          -- 活動副本:Mobius
EM_ClockCheckValue_29 = Value; Value = Value + 1;  	--活動副本:大家來找碴
EM_ClockCheckValue_30 = Value; Value = Value + 1;    -- 節慶活動 : 南瓜節 - 瑪拉的鬼屋遊戲 (預估6分鐘)
EM_ClockCheckValue_31 = Value; Value = Value + 1;   -- 結婚系統 : 新版婚禮會場 計時120分鐘 , 2小時
EM_ClockCheckValue_32 = Value; Value = Value + 1;  --德國五周年，寶箱開翻天 1 min
EM_ClockCheckValue_33 = Value; Value = Value + 1;  --鏡世界副本計時15分鐘
EM_ClockCheckValue_34 = Value; Value = Value + 1;
EM_ClockCheckValue_35 = Value; Value = Value + 1;
EM_ClockCheckValue_36 = Value; Value = Value + 1;
EM_ClockCheckValue_37 = Value; Value = Value + 1;
EM_ClockCheckValue_38 = Value; Value = Value + 1;
EM_ClockCheckValue_39 = Value; Value = Value + 1;
EM_ClockCheckValue_40 = Value; Value = Value + 1;

--int		GuildInfo( int GItemID , int Type )	--取得公會資料
Value = 0;
EM_GuildInfoType_Rank			= Value; Value = Value + 1;
EM_GuildInfoType_GuildMemberCount	= Value; Value = Value + 1;
EM_GuildInfoType_GuildLv			= Value; Value = Value + 1;
EM_GuildInfoType_GuildHouse		= Value; Value = Value + 1;
EM_GuildInfoType_GuildState		= Value; Value = Value + 1;
EM_GuildInfoType_Resource_Gold		= Value; Value = Value + 1;
EM_GuildInfoType_Resource_BonusGold	= Value; Value = Value + 1;
EM_GuildInfoType_Resource_Mine		= Value; Value = Value + 1;
EM_GuildInfoType_Resource_Wood		= Value; Value = Value + 1;
EM_GuildInfoType_Resource_Herb		= Value; Value = Value + 1;
EM_GuildInfoType_Resource_GuildRune	= Value; Value = Value + 1;
EM_GuildInfoType_Resource_GuildStone	= Value; Value = Value + 1;

--寵物數值偏移(  加每的寵物欄位X100 ) 用於ReadRoleValue 
Value = 0;	
EM_CultivatePetStructValueType_ItemOrgID		= Value; Value = Value + 1; -- 寵物蛋的編號
EM_CultivatePetStructValueType_CreateTime		= Value; Value = Value + 1; 
EM_CultivatePetStructValueType_OrgObjID		= Value; Value = Value + 1; --寵物的編號
EM_CultivatePetStructValueType_Lv			= Value; Value = Value + 1; --寵物等級
EM_CultivatePetStructValueType_PetType		= Value; Value = Value + 1; --寵物種族(個性)
EM_CultivatePetStructValueType_EventColdown		= Value; Value = Value + 1;		
EM_CultivatePetStructValueType_EventType		= Value; Value = Value + 1;
EM_CultivatePetStructValueType_LifeSkillTablePos	= Value; Value = Value + 1;
EM_CultivatePetStructValueType_Exp			= Value; Value = Value + 1; --經驗
EM_CultivatePetStructValueType_SKillPoint		= Value; Value = Value + 1; --目前技能點
EM_CultivatePetStructValueType_TotalSkillPoint		= Value; Value = Value + 1; --總技能點數
EM_CultivatePetStructValueType_Loyal			= Value; Value = Value + 1; --親密度
EM_CultivatePetStructValueType_Hunger		= Value; Value = Value + 1; --飽食度
EM_CultivatePetStructValueType_Talent		= Value; Value = Value + 1; --活力度
EM_CultivatePetStructValueType_Spirit			= Value; Value = Value + 1; --資質
EM_CultivatePetStructValueType_Mode			= Value; Value = Value + 1; --寵物狀態(正被召喚、正在旅行、正在生產...etc)
EM_CultivatePetStructValueType_Str			= Value; Value = Value + 1;
EM_CultivatePetStructValueType_Sta			= Value; Value = Value + 1;
EM_CultivatePetStructValueType_Agi			= Value; Value = Value + 1;
EM_CultivatePetStructValueType_Int			= Value; Value = Value + 1;
EM_CultivatePetStructValueType_Mnd			= Value; Value = Value + 1;
EM_CultivatePetStructValueType_Property		= Value; Value = Value + 1;--寵物屬性   0地、1水、2火、3風、4光、5暗
EM_CultivatePetStructValueType_TrainCount		= Value; Value = Value + 1;
EM_CultivatePetStructValueType_MagicID0		= Value; Value = Value + 1;		
EM_CultivatePetStructValueType_MagicID1		= Value; Value = Value + 1;
EM_CultivatePetStructValueType_MagicID2		= Value; Value = Value + 1;
EM_CultivatePetStructValueType_MagicID3		= Value; Value = Value + 1;
EM_CultivatePetStructValueType_MagicID4		= Value; Value = Value + 1;
EM_CultivatePetStructValueType_MagicID5		= Value; Value = Value + 1;
EM_CultivatePetStructValueType_MagicID6		= Value; Value = Value + 1;
EM_CultivatePetStructValueType_MagicID7		= Value; Value = Value + 1;
EM_CultivatePetStructValueType_MagicID8		= Value; Value = Value + 1;
EM_CultivatePetStructValueType_MagicID9		= Value; Value = Value + 1;
EM_CultivatePetStructValueType_MagicLv0		= Value; Value = Value + 1;		
EM_CultivatePetStructValueType_MagicLv1		= Value; Value = Value + 1;
EM_CultivatePetStructValueType_MagicLv2		= Value; Value = Value + 1;
EM_CultivatePetStructValueType_MagicLv3		= Value; Value = Value + 1;
EM_CultivatePetStructValueType_MagicLv4		= Value; Value = Value + 1;
EM_CultivatePetStructValueType_MagicLv5		= Value; Value = Value + 1;
EM_CultivatePetStructValueType_MagicLv6		= Value; Value = Value + 1;
EM_CultivatePetStructValueType_MagicLv7		= Value; Value = Value + 1;
EM_CultivatePetStructValueType_MagicLv8		= Value; Value = Value + 1;
EM_CultivatePetStructValueType_MagicLv9		= Value; Value = Value + 1;
EM_CultivatePetStructValueType_MagicCount		= Value; Value = Value + 1;
EM_CultivatePetStructValueType_LifeSkill1		= Value; Value = Value + 1;
EM_CultivatePetStructValueType_LifeSkill2		= Value; Value = Value + 1;
EM_CultivatePetStructValueType_LifeSkill3		= Value; Value = Value + 1;
EM_CultivatePetStructValueType_LifeSkill4		= Value; Value = Value + 1;
EM_CultivatePetStructValueType_MergeCount		= Value; Value = Value + 1;

--寵物的EventType
Value = 0;
EM_CultivatePetCommandType_None		= Value; Value = Value + 1;--沒狀態(停止生活技能)
EM_CultivatePetCommandType_OnTimeEvent	= Value; Value = Value + 1;--client 端每秒通知Server 看那隻寵物(處理說話or特別事件)
EM_CultivatePetCommandType_Summon	= Value; Value = Value + 1;--召喚寵物
EM_CultivatePetCommandType_Feed		= Value; Value = Value + 1;--餵食
EM_CultivatePetCommandType_Travel		= Value; Value = Value + 1;--旅行
EM_CultivatePetCommandType_Free		= Value; Value = Value + 1;--放生
EM_CultivatePetCommandType_Train		= Value; Value = Value + 1;--特訓
EM_CultivatePetCommandType_Return		= Value; Value = Value + 1;--召喚出的寵物回收
EM_CultivatePetCommandType_LiftSkill	= Value; Value = Value + 1;--生活技能


--int		ReadGuildBuilding( int ItemGUID , int Type )
Value = 0;
EM_GuildBuildValueType_GuildID		= Value; Value = Value + 1;
EM_GuildBuildValueType_BuildingDBID	= Value; Value = Value + 1;
EM_GuildBuildValueType_ParentDBID		= Value; Value = Value + 1;
EM_GuildBuildValueType_BuildingID		= Value; Value = Value + 1;
EM_GuildBuildValueType_IsActive		= Value; Value = Value + 1;
EM_GuildBuildValueType_Value1		= Value; Value = Value + 1;
EM_GuildBuildValueType_Value2		= Value; Value = Value + 1;
EM_GuildBuildValueType_Value3		= Value; Value = Value + 1;


---	bool	SetSmallGameMenuType	( int GItemID , int MenuID , int Type );                                       --介面ID, 介面類型ID, 開關型態
--	bool	SetSmallGameMenuValue	( int GItemID , int MenuID , int ID , int Value );                          --介面ID, 介面類型ID, 可變動數值ID, 變動數值
--	bool	SetSmallGameMenuStr	( int GItemID , int MenuID , int ID , const char* Content );         --介面ID, 介面類型ID, 可變動數值ID, 內容文字

--SetSmallGameMenuType( OwnerID() , Value , Switch )( 使用者 , Value = 字串序號 , Switch = 1開/2關 )
--字串序號
-- 1	公會(範例)
-- 2	公會校場-神鬼戰士
-- 3	公會校場-號角響起
-- 4	節慶活動-果汁節(一日服務生)
-- 5	公會校場-命運好好玩
-- 6	公會校場-針刺試煉
-- 7	公會校場-神鬼戰士
-- 8	公會校場-全面衝突
-- 9	公會校場-就傷試煉
--10	活動副本-遠古夢境
--11	節慶活動-詠火節(全民升火趣)
--12	假面下的真相
--13	節慶活動-夜市射氣球
--14         
--15	節慶活動安德爾靶場
--XX請帶入字串序號
--INSTANCE_SCORE_XX
--INSTANCE_STATE_XX
--INSTANCE_TIPS_XX

EM_SmallGameMenuType_Menu_ScoreBoard  = 0  -- 可改變數值 ID= 1 , 2 ,3
EM_SmallGameMenuType_Open = 1
EM_SmallGameMenuType_Close = 2

-- 女僕數值
Value = 0;
EM_HouseServantValueType_NPCObjID	= Value; Value = Value + 1;  --
EM_HouseServantValueType_Character		= Value; Value = Value + 1;  --
EM_HouseServantValueType_Sex		= Value; Value = Value + 1;  --
EM_HouseServantValueType_Tired		= Value; Value = Value + 1;  --
EM_HouseServantValueType_Value0		= Value; Value = Value + 1;  --// 0-7 基本數值
EM_HouseServantValueType_Value1		= Value; Value = Value + 1;  --
EM_HouseServantValueType_Value2		= Value; Value = Value + 1;  --
EM_HouseServantValueType_Value3		= Value; Value = Value + 1;  --
EM_HouseServantValueType_Value4		= Value; Value = Value + 1;  --
EM_HouseServantValueType_Value5		= Value; Value = Value + 1;  --
EM_HouseServantValueType_Value6		= Value; Value = Value + 1;  --
EM_HouseServantValueType_Value7		= Value; Value = Value + 1;  --
EM_HouseServantValueType_MaxValue0	= Value; Value = Value + 1;  --	// 0-7 最大基本數值
EM_HouseServantValueType_MaxValue1	= Value; Value = Value + 1;  --
EM_HouseServantValueType_MaxValue2	= Value; Value = Value + 1;  --
EM_HouseServantValueType_MaxValue3	= Value; Value = Value + 1;  --
EM_HouseServantValueType_MaxValue4	= Value; Value = Value + 1;  --
EM_HouseServantValueType_MaxValue5	= Value; Value = Value + 1;  --
EM_HouseServantValueType_MaxValue6	= Value; Value = Value + 1;  --
EM_HouseServantValueType_MaxValue7	= Value; Value = Value + 1;  --
EM_HouseServantValueType_ClothColor0	= Value; Value = Value + 1;  --	// 0-1 衣服顏色
EM_HouseServantValueType_ClothColor1	= Value; Value = Value + 1;  --
EM_HouseServantValueType_Flag		= 1000; 		             --	// 0-255 女僕專屬旗標	

--企劃Event_Module 類型
EM_Event_Module_Type_LevelUp 	= 0
EM_Event_Module_Type_PlayerDead 	= 1
EM_Event_Module_Type_ChangeZone	= 2
EM_Event_Module_Type_Login	= 3
EM_Event_Module_Type_NPCDead	= 4
EM_Event_Module_Type_RoleLogin	= 5

--Billboard sorttype 排行榜類型列舉
--系統
--String裡頭的SSB_SORTTYPE_XXX對應下方，第一項EM_BillboardSortType_Money就是對應XXX=001
Value = 0;
EM_BillboardSortType_Money			= Value; Value = Value + 1;  --//擁有的金幣   
EM_BillboardSortType_Money_Account		= Value; Value = Value + 1;  --//擁有的晶鑽   
EM_BillboardSortType_Money_Bonus			= Value; Value = Value + 1;  --//擁有的紅鑽   
EM_BillboardSortType_STR				= Value; Value = Value + 1;  --//力量          
EM_BillboardSortType_AGI				= Value; Value = Value + 1;  --//敏捷          
EM_BillboardSortType_STA				= Value; Value = Value + 1;  --//耐力          
EM_BillboardSortType_INT				= Value; Value = Value + 1;  --//智慧          
EM_BillboardSortType_MND				= Value; Value = Value + 1;  --//精神          
EM_BillboardSortType_ATK				= Value; Value = Value + 1;  --//攻擊強度      
EM_BillboardSortType_MATK			= Value; Value = Value + 1;  --//法術強度      
EM_BillboardSortType_DEF				= Value; Value = Value + 1;  --//物理防禦      
EM_BillboardSortType_MDEF			= Value; Value = Value + 1;  --//法術防禦     
EM_BillboardSortType_Honor			= Value; Value = Value + 1;  --//榮譽點數     
EM_BillboardSortType_TitleCount			= Value; Value = Value + 1;  --//拿到的稱號數量     
EM_BillboardSortType_QuestCompleteCount		= Value; Value = Value + 1;  --//已經完成的任務數量 
--企劃
-- Billboard_Update		( OwnerID() , EM_BillboardSortType_Guildwarrior , 100 )
--EM_BillboardSortType_xxxxEvent	= 100
--上面那行的=100，表 SSB_SORTTYPE_100
EM_BillboardSortType_AncientDreamSpace = 100
EM_BillboardSortType_Range = 101                                               --//靶場活動副本計時模式
EM_BillboardSortType_Range_Survival = 102                               --//靶場活動副本生存模式
--------------------------------------------------------------
--角色數值期標列舉
--value = 0
--EM_LuaValueFlag_GuidePetLvState 		= Value; Value = Value + 1;--//新手導覽寵物目前處理到的等級
--EM_LuaValueFlag_GuidePetState	 		= Value; Value = Value + 1;--//新手導覽寵物目前狀況

--------------------------------------------------------------
--Vip 會員 旗標 代表意思
Vip_Member_Flag_Teleport	= 	0	-- 免費使用傳送之書記點
Vip_Member_Flag_Sys1		= 	1	-- 免費使用傳送之書傳送
Vip_Member_Flag_Sys2		= 	2
Vip_Member_Flag_Sys3		= 	3
Vip_Member_Flag_Sys4		= 	4
Vip_Member_Flag_Sys5		= 	5
Vip_Member_Flag_Sys6		= 	6
Vip_Member_Flag_Sys7		= 	7

value = 8	--企劃用
Vip_Member_Flag_design1		= 	Value;Value = Value + 1	-- 1天內，增加戰鬥所得經驗值50%。
Vip_Member_Flag_design2		= 	Value;Value = Value + 1	-- 1天內，增加戰鬥所得技能點數50%。
Vip_Member_Flag_design3		= 	Value;Value = Value + 1	-- 1天內，增加物品掉落率50%。
Vip_Member_Flag_design4		= 	Value;Value = Value + 1	-- 保留
Vip_Member_Flag_design5		= 	Value;Value = Value + 1	-- 背包第三頁空間租用天數增加1天
Vip_Member_Flag_design6		= 	Value;Value = Value + 1	-- 背包第四頁空間租用天數增加1天
Vip_Member_Flag_design7		= 	Value;Value = Value + 1	-- 背包第五頁空間租用天數增加1天
Vip_Member_Flag_design8		= 	Value;Value = Value + 1	-- 背包第六頁空間租用天數增加1天
Vip_Member_Flag_design9		= 	Value;Value = Value + 1	-- 銀行第二頁空間租用天數增加1天
Vip_Member_Flag_design10		= 	Value;Value = Value + 1	-- 銀行第三頁空間租用天數增加1天
Vip_Member_Flag_design11		= 	Value;Value = Value + 1	-- 銀行第四頁空間租用天數增加1天
Vip_Member_Flag_design12		= 	Value;Value = Value + 1	-- 銀行第五頁空間租用天數增加1天
Vip_Member_Flag_design13		= 	Value;Value = Value + 1	-- 1個每日任務重置券
Vip_Member_Flag_design14		= 	Value;Value = Value + 1	-- 1個菲尼克斯的救贖 
Vip_Member_Flag_design15		= 	Value;Value = Value + 1	-- 1個瑪拉蒂娜活動重置券、1個古代祕寶遺跡調查憑證
Vip_Member_Flag_design16		= 	Value;Value = Value + 1	-- 1天駿馬坐騎( 隨機從 203571、203572、203573 選擇1匹 )
Vip_Member_Flag_design17		= 	Value;Value = Value + 1
--mode bit info
--------------------------------------------------------------
--信任會員機制 旗標 代表意思
--EM_RoleValue_UnTrust_Flag
--程式用
Trusted_Player_Flag_Mail		=	0	-- 無法使用信箱
Trusted_Player_Flag_Item_Shop_Mail	=	1	-- 無法使用商城送禮
Trusted_Player_Flag_AC			=	2	-- 無法使用拍賣場
Trusted_Player_Flag_Trade		=	3	-- 無法與玩家交易
Trusted_Player_Flag_Whisper_Chat	=	4	-- 無法使用密語
Trusted_Player_Flag_Word_Chat		=	5	-- 無法使用世界頻道
Trusted_Player_Flag_Zone_Chat		=	6	-- 無法使用區域頻道
Trusted_Player_Flag_Sys7		=	7
Trusted_Player_Flag_Sys8		=	8
Trusted_Player_Flag_Sys9		=	9
Trusted_Player_Flag_Sys10		=	10
Trusted_Player_Flag_Sys11		=	11
Trusted_Player_Flag_Sys12		=	12
Trusted_Player_Flag_Sys13		=	13
Trusted_Player_Flag_Sys14		=	14
Trusted_Player_Flag_Sys15		=	15
--企劃用
value = 18
Trusted_Player_Flag_Design1		= 	Value;Value = Value + 1	-- 無法使用金幣兌換晶鑽
Trusted_Player_Flag_Design2		= 	Value;Value = Value + 1	-- 無法使用晶鑽對換金幣
Trusted_Player_Flag_Design3		= 	Value;Value = Value + 1
Trusted_Player_Flag_Design4		= 	Value;Value = Value + 1
Trusted_Player_Flag_Design5		= 	Value;Value = Value + 1
Trusted_Player_Flag_Design6		= 	Value;Value = Value + 1
Trusted_Player_Flag_Design7		= 	Value;Value = Value + 1
Trusted_Player_Flag_Design8		= 	Value;Value = Value + 1
Trusted_Player_Flag_Design9		= 	Value;Value = Value + 1
Trusted_Player_Flag_Design10		= 	Value;Value = Value + 1
Trusted_Player_Flag_Design11		= 	Value;Value = Value + 1
Trusted_Player_Flag_Design12		= 	Value;Value = Value + 1
Trusted_Player_Flag_Design13		= 	Value;Value = Value + 1
Trusted_Player_Flag_Design14		= 	Value;Value = Value + 1
Trusted_Player_Flag_Design15		= 	Value;Value = Value + 1
Trusted_Player_Flag_Design16		= 	Value;Value = Value + 1
Trusted_Player_Flag_Design17		= 	Value;Value = Value + 1
Trusted_Player_Flag_Design18		= 	Value;Value = Value + 1


--獨立遊戲戰場									
--bool	InitBgIndependence( int GItemID , int Mode ) 
--例 Mode = Def_InitBgIndependence_RoleLv1 + Def_InitBgIndependence_MaxWeaponSkill+Def_InitBgIndependence_MaxMagicSkill;

value = 1;
Def_InitBgIndependence_RoleLv1		= Value;Value = Value * 2;	--角色資料清為1，等同新創角色
Def_InitBgIndependence_MaxWeaponSkill	= Value;Value = Value * 2;	--升級時自動提升熟練度至最高
Def_InitBgIndependence_MaxMagicSkill	= Value;Value = Value * 2;	--升級時自動提升技能等級至最高
Def_InitBgIndependence_TitleClear		= Value;Value = Value * 2;	--清空頭銜
Def_InitBgIndependence_KeyItemClear		= Value;Value = Value * 2;	--清空重要物品
Def_InitBgIndependence_PetClear		= Value;Value = Value * 2;	--清空寵物資訊
Def_InitBgIndependence_QuestClear		= Value;Value = Value * 2;	--清空任務
Def_InitBgIndependence_BuffClear		= Value;Value = Value * 2;	--清空Buff

--基本法術	結果Lua傳入值
--EM_MagicAtkResult_Miss		--0 	
--EM_MagicAtkResult_Normal	--1
--EM_MagicAtkResult_Critial		--2
--EM_MagicAtkResult_NoEffect	--3
--EM_MagicAtkResult_Absorb	--4
--EM_MagicAtkResult_NoEffect_Dead 	--5
--EM_MagicAtkResult_Cancel	--6
--EM_MagicAtkResult_SpecialAction	--7
--EM_MagicAtkResult_Parry		--8
--EM_MagicAtkResult_ShieldBlock	--9
--EM_MagicAtkResult_Dodge		--10

--增加特殊貨幣
--	bool	AddSpeicalCoin( int GItemID , int ActionType , int MoneyType , int Money );
--減查特殊貨幣
--	bool	CheckSpeicalCoin( int GItemID , int MoneyType , int Money );

Value = 0
EM_ACPriceType_GameMoney		= Value;Value=Value+1	--遊戲幣
EM_ACPriceType_AccountMoney	= Value;Value=Value+1	--帳號幣
EM_ACPriceType_BonusMoney		= Value;Value=Value+1	--紅利幣
EM_ACPriceType_Phirius		= Value;Value=Value+1	--必耳丁
EM_ACPriceType_Honor			= Value;Value=Value+1	--戰場榮譽
EM_ACPriceType_Arena			= Value;Value=Value+1	--競技場點數(Arena)
EM_ACPriceType_GuildWarEnergy	= Value;Value=Value+1	--公會戰能量
EM_ACPriceType_GuildWarHonor	= Value;Value=Value+1	--公會戰戰績
EM_ACPriceType_TrialBadge 		= Value;Value=Value+1	--試煉徽章
EM_ACPriceType_Relics 		= Value;Value=Value+1	--古代遺物
EM_ACPriceType_Dreamland		= Value;Value=Value+1	--夢境先遣印記
EM_ACPriceType_PhiriusShell	= Value;Value=Value+1	--必爾汀圓貝
EM_ACPriceType_EnergyJustice	= Value;Value=Value+1	--正義能量
EM_ACPriceType_ProofLegend		= Value;Value=Value+1	--傳說之證
EM_ACPriceType_DuelistReward	= Value;Value=Value+1	--勇士勳章



end