function Init_RoleValue_ENUM2()

-- 裝備位置列舉
Value = 0;
EM_EQWearPos_Head       = Value; Value = Value + 1;
EM_EQWearPos_Gloves	= Value; Value = Value + 1;
EM_EQWearPos_Shoes	= Value; Value = Value + 1;
EM_EQWearPos_Clothes	= Value; Value = Value + 1;
EM_EQWearPos_Pants	= Value; Value = Value + 1;
EM_EQWearPos_Back		= Value; Value = Value + 1;
EM_EQWearPos_Belt		= Value; Value = Value + 1;
EM_EQWearPos_Shoulder	= Value; Value = Value + 1;
EM_EQWearPos_Necklace   = Value; Value = Value + 1;
EM_EQWearPos_Ammo       = Value; Value = Value + 1;
EM_EQWearPos_Bow        = Value; Value = Value + 1;
EM_EQWearPos_Ring1      = Value; Value = Value + 1;
EM_EQWearPos_Ring2      = Value; Value = Value + 1;
EM_EQWearPos_Earring1   = Value; Value = Value + 1;
EM_EQWearPos_Earring2   = Value; Value = Value + 1;
EM_EQWearPos_MainHand	= Value; Value = Value + 1;
EM_EQWearPos_SecondHand = Value; Value = Value + 1;
EM_EQWearPos_Manufactory= Value; Value = Value + 1;

Value = 100;
EM_EQWearPos_BK_Head       	= Value; Value = Value + 1; 
EM_EQWearPos_BK_Gloves	   	= Value; Value = Value + 1;
EM_EQWearPos_BK_Shoes		= Value; Value = Value + 1;
EM_EQWearPos_BK_Clothes		= Value; Value = Value + 1;
EM_EQWearPos_BK_Pants		= Value; Value = Value + 1;
EM_EQWearPos_BK_Back		= Value; Value = Value + 1;
EM_EQWearPos_BK_Belt		= Value; Value = Value + 1;
EM_EQWearPos_BK_Shoulder	= Value; Value = Value + 1;
EM_EQWearPos_BK_Necklace	= Value; Value = Value + 1;
EM_EQWearPos_BK_Ammo       	= Value; Value = Value + 1;
EM_EQWearPos_BK_Bow        	= Value; Value = Value + 1;
EM_EQWearPos_BK_Ring1      	= Value; Value = Value + 1;
EM_EQWearPos_BK_Ring2      	= Value; Value = Value + 1;
EM_EQWearPos_BK_Earring1   	= Value; Value = Value + 1;
EM_EQWearPos_BK_Earring2   	= Value; Value = Value + 1;
EM_EQWearPos_BK_MainHand	= Value; Value = Value + 1;
EM_EQWearPos_BK_SecondHand 	= Value; Value = Value + 1;
EM_EQWearPos_BK_Manufactory	= Value; Value = Value + 1;
EM_EQWearPos_BK_MagicTool1	= Value; Value = Value + 1;
EM_EQWearPos_BK_MagicTool2	= Value; Value = Value + 1;
EM_EQWearPos_BK_MagicTool3	= Value; Value = Value + 1;
EM_EQWearPos_BK_Ornament	= Value; Value = Value + 1;

--對話介面類型
EM_LuaDialogType_YesNo = 0
EM_LuaDialogType_Select =1
EM_LuaDialogType_Input=2
EM_LuaDialogType_Message=3
EM_LuaDialogType_Pet=4

-- int GetItemInfo( int GItemID , int PGType , int Pos , int ValueType ) Pos = -1 表示取使用中的物品資料
--包裹類型
EM_ItemPacketType_Body = 0
EM_ItemPacketType_Bank = 1
EM_ItemPacketType_EQ = 2

--物品類型列舉
Value = 0;
EM_ItemValueType_OrgObjID =  Value ; Value = Value + 1;
EM_ItemValueType_Inherent1=  Value ; Value = Value + 1;
EM_ItemValueType_Inherent2=  Value ; Value = Value + 1;
EM_ItemValueType_Inherent3=  Value ; Value = Value + 1;
EM_ItemValueType_Inherent4=  Value ; Value = Value + 1;
EM_ItemValueType_Inherent5=  Value ; Value = Value + 1;
EM_ItemValueType_Inherent6=  Value ; Value = Value + 1;
EM_ItemValueType_Rune1	=  Value ; Value = Value + 1;
EM_ItemValueType_Rune2	=  Value ; Value = Value + 1;
EM_ItemValueType_Rune3	=  Value ; Value = Value + 1;
EM_ItemValueType_Rune4	=  Value ; Value = Value + 1;
EM_ItemValueType_Level	 = Value; Value=Value+1;
EM_ItemValueType_Durable	 = Value; Value=Value+1;
EM_ItemValueType_MaxDurable= Value;Value=Value+1;
EM_ItemValueType_PowerQuality= Value;Value=Value+1;
EM_ItemValueType_RuneVolume= Value;Value=Value+1;


--OpenClientMenu( OwnerID() , EM_ClientMenuType_Bag )
-- 開Client端介面
Value = 0;
EM_ClientMenuType_Bag			= Value; Value = Value + 1;	--背包
EM_ClientMenuType_Skill			= Value; Value = Value + 1;	--技能書
EM_ClientMenuType_EQ			= Value; Value = Value + 1;	--EQ介面
EM_ClientMenuType_Quest			= Value; Value = Value + 1;	--任物日誌
EM_ClientMenuType_FriendList		= Value; Value = Value + 1;	--朋友列表
EM_ClientMenuType_CardBook		= Value; Value = Value + 1;	--卡片
EM_ClientMenuType_LifeSkill		= Value; Value = Value + 1;	--生活技能
EM_ClientMenuType_Guild			= Value; Value = Value + 1;	--公會介面
EM_ClientMenuType_GuildList		= Value; Value = Value + 1;	--公會列表
EM_ClientMenuType_GuildBillboard		= Value; Value = Value + 1;	--公會留言板
EM_ClientMenuType_Loading		= Value; Value = Value + 1;	--Loading畫面
EM_ClientMenuType_SetGuildFlag                        = Value; Value = Value + 1;	--設定公會旗介面
EM_ClientMenuType_Merchant		= Value; Value = Value + 1;	--開啟商城
EM_ClientMenuType_GuildBank		= Value; Value = Value + 1;	--開啟公會銀行

EM_ClientMenuType_BlackSmith		= Value; Value = Value + 1;	--開啟打鐵
EM_ClientMenuType_Carpenter		= Value; Value = Value + 1;	--開啟木工
EM_ClientMenuType_MakeArmor		= Value; Value = Value + 1;	--開啟製甲
EM_ClientMenuType_Tailor			= Value; Value = Value + 1;	--開啟裁縫
EM_ClientMenuType_Cook			= Value; Value = Value + 1;	--開啟烹飪
EM_ClientMenuType_Alchemy		= Value; Value = Value + 1;	--開啟煉金
EM_ClientMenuType_Mining			= Value; Value = Value + 1;	--開啟挖礦
EM_ClientMenuType_Lumbering		= Value; Value = Value + 1;	--開啟砍材
EM_ClientMenuType_Herblism		= Value; Value = Value + 1;	--開啟採藥
EM_ClientMenuType_Fishing			= Value; Value = Value + 1;	--開啟釣魚
EM_ClientMenuType_Plant			= Value; Value = Value + 1;	--開啟種植
EM_ClientMenuType_BillBoard		= 10000;	--開啟排行榜 --開啟特定排行榜項目，使用 EM_ClientMenuType_BillBoard+(項目號碼)

--關系列舉
Value = -1;
EM_RelationType_None 		= Value;Value = Value + 1; -- 沒關係
EM_RelationType_Stranger		= Value; Value = Value + 1;	--莫生人(不可使用 )
EM_RelationType_Friend		= Value; Value = Value + 1;	--好友( 不可使用 )
EM_RelationType_Enemy		= Value; Value = Value + 1;	--仇人( 不可使用 )
EM_RelationType_Student		= Value; Value = Value + 1;	--學生
EM_RelationType_Teacher		= Value; Value = Value + 1;	--老師
EM_RelationType_Wife		= Value; Value = Value + 1;	--妻子
EM_RelationType_Husband		= Value; Value = Value + 1;	--先生
EM_RelationType_Lover		= Value; Value = Value + 1;	--情人
EM_RelationType_Family		= Value; Value = Value + 1;	--親人
EM_RelationType_BestFriend		= Value; Value = Value + 1;	--摯友
EM_RelationType_BadCompany	= Value; Value = Value + 1;	--損友

--技能設定
Value = 0;
EM_SkillValueType_Unarmed	= Value; Value = Value + 1;	--Unarmed空手
EM_SkillValueType_Blade             	= Value; Value = Value + 1;	-- 劍
EM_SkillValueType_Dagger            	= Value; Value = Value + 1;	--匕首
EM_SkillValueType_Wand             	 = Value; Value = Value + 1;	--權杖
EM_SkillValueType_Axe              	 = Value; Value = Value + 1;	--斧
EM_SkillValueType_Bludgeon          	= Value; Value = Value + 1;	--鎚棍棒
EM_SkillValueType_Claymore          	= Value; Value = Value + 1;	--雙手劍
EM_SkillValueType_Staff             	= Value; Value = Value + 1;	--杖
EM_SkillValueType_2H_Axe            	= Value; Value = Value + 1;	--雙手斧
EM_SkillValueType_2H_Hammer         	= Value; Value = Value + 1;	--雙手鎚
EM_SkillValueType_Polearm		= Value; Value = Value + 1;	--槍(長矛)
EM_SkillValueType_Bow		= Value; Value = Value + 1;	--遠程武器弓
EM_SkillValueType_CossBow	= Value; Value = Value + 1;	--遠程武器十字弓
EM_SkillValueType_Gun		= Value; Value = Value + 1;	--遠程武器槍
EM_SkillValueType_Define		= Value; Value = Value + 1;	--防禦
EM_SkillValueType_BlackSmith	= Value; Value = Value + 1;	--打鐵
EM_SkillValueType_Carpenter	= Value; Value = Value + 1;	--木工
EM_SkillValueType_MakeArmor	= Value; Value = Value + 1;	--製甲
EM_SkillValueType_Tailor		= Value; Value = Value + 1;	--裁縫
EM_SkillValueType_Cook		= Value; Value = Value + 1;	--烹飪
EM_SkillValueType_Alchemy		= Value; Value = Value + 1;	--煉金
EM_SkillValueType_Mining		= Value; Value = Value + 1;	--挖礦
EM_SkillValueType_Lumbering	= Value; Value = Value + 1;	--砍材
EM_SkillValueType_Herblism		= Value; Value = Value + 1;	--採藥
EM_SkillValueType_Fishing		= Value; Value = Value + 1;	--釣魚
EM_SkillValueType_Plant		= Value; Value = Value + 1;	--種植

--程式使用時間旗標
Value = 0;
EM_TimeFlagEffect_BagPage3	= Value; Value = Value + 1;	--背包
EM_TimeFlagEffect_BagPage4	= Value; Value = Value + 1;	--背包
EM_TimeFlagEffect_BagPage5	= Value; Value = Value + 1;	--背包
EM_TimeFlagEffect_BagPage6	= Value; Value = Value + 1;	--背包
Value = 10;
EM_TimeFlagEffect_BankBag2	= Value; Value = Value + 1;	--銀行背包開放
EM_TimeFlagEffect_BankBag3	= Value; Value = Value + 1;	--銀行背包開放
EM_TimeFlagEffect_BankBag4	= Value; Value = Value + 1;	--銀行背包開放
EM_TimeFlagEffect_BankBag5	= Value; Value = Value + 1;	--銀行背包開放
Value = 20;
EM_TimeFlagEffect_HonorParty	= Value; Value = Value + 1;	--榮譽組隊
EM_TimeFlagEffect_MailPaper	= Value; Value = Value + 1;	--郵件信紙	
EM_TimeFlagEffect_DailyFlag	= Value; Value = Value + 1;	--每日重要物品清除機制	
EM_TimeFlagEffect_MailMultiItem	= Value; Value = Value + 1;	--郵件單次傳送多個物品
EM_TimeFlagEffect_HandyBank	= Value; Value = Value + 1;	--隨身銀行
EM_TimeFlagEffect_HandyAuction	= Value; Value = Value + 1;	--隨身AC
EM_TimeFlagEffect_HandyMail	= Value; Value = Value + 1;	--隨身信箱

Value = 30;
EM_TimeFlagEffect_PetPage3		= Value; Value = Value + 1;	--寵物第三頁
EM_TimeFlagEffect_PetPage4		= Value; Value = Value + 1;	--寵物第三頁
EM_TimeFlagEffect_PetPage5		= Value; Value = Value + 1;	--寵物第三頁
EM_TimeFlagEffect_PetPage6		= Value; Value = Value + 1;	--寵物第三頁



--企劃使用時間旗標（企劃使用從99號往回用）
EM_TimeFlagEffect_OOXX			= 99	-- OOXX使用


--企劃用劇情記次旗標
Value = EM_RoleValue_LuaValueFlag;
EM_LuaValueFlag_UseItem1  	= Value; Value = Value + 1; --使用物品記次--情人節（每日）
EM_LuaValueFlag_UseItem2  	= Value; Value = Value + 1; --使用物品記次--情人節（計總次）
EM_LuaValueFlag_UseItem3  	= Value; Value = Value + 1; --使用物品記次--瑪拉蒂娜
EM_LuaValueFlag_UseItem4  	= Value; Value = Value + 1; --使用物品記次--競技場體驗特殊獎勵
EM_LuaValueFlag_UseItem5  	= Value; Value = Value + 1; --使用物品記次--古代密寶
EM_LuaValueFlag_UseItem6  	= Value; Value = Value + 1; --使用物品記次--活動校場 神鬼戰士
EM_LuaValueFlag_UseItem7  	= Value; Value = Value + 1; --使用物品記次--black day (korea)
EM_LuaValueFlag_UseItem8  	= Value; Value = Value + 1; --使用物品記次--台灣雨蛙大作戰
EM_LuaValueFlag_UseItem9  	= Value; Value = Value + 1; --使用物品記次--中東齋月節活動物品記數(紅棗)
EM_LuaValueFlag_UseItem10  	= Value; Value = Value + 1; --使用物品記次--bearevent contest
EM_LuaValueFlag_UseItem11  	= Value; Value = Value + 1; --使用物品記次--廠商客製活動 隨機建立NPC 遊戲幣兌換晶鑽
EM_LuaValueFlag_UseItem12  	= Value; Value = Value + 1; --使用物品記次--廠商客製活動 隨機建立NPC 晶鑽兌換遊戲幣
EM_LuaValueFlag_UseItem13  	= Value; Value = Value + 1; --使用物品記次--廠商客製活動 定點建立NPC 遊戲幣兌換晶鑽
EM_LuaValueFlag_UseItem14  	= Value; Value = Value + 1; --使用物品記次--廠商客製活動 定點建立NPC 晶鑽兌換遊戲幣
EM_LuaValueFlag_UseItem15  	= Value; Value = Value + 1; --使用物品記次--老帶新系統 兌換力量次數
EM_LuaValueFlag_UseItem16  	= Value; Value = Value + 1; --使用物品記次--老帶新系統 兌換敏捷次數
EM_LuaValueFlag_UseItem17  	= Value; Value = Value + 1; --使用物品記次--老帶新系統 兌換耐力次數
EM_LuaValueFlag_UseItem18  	= Value; Value = Value + 1; --使用物品記次--老帶新系統 兌換智慧次數
EM_LuaValueFlag_UseItem19  	= Value; Value = Value + 1; --使用物品記次--老帶新系統 兌換精神次數
EM_LuaValueFlag_UseItem20  	= Value; Value = Value + 1; --使用物品記次--活動校場 全面衝突
EM_LuaValueFlag_UseItem21  	= Value; Value = Value + 1; --使用物品記次--暖冬節 攻擊冰霜王次數
EM_LuaValueFlag_UseItem22  	= Value; Value = Value + 1; --使用物品記次--暖冬節 幫助其它玩家次數
EM_LuaValueFlag_UseItem23  	= Value; Value = Value + 1; --使用物品記次--暖冬節 裝飾暖冬樹
EM_LuaValueFlag_UseItem24  	= Value; Value = Value + 1; --使用物品記次--花神節 真愛與奇蹟
EM_LuaValueFlag_UseItem25  	= Value; Value = Value + 1; --使用物品記次--童話節
EM_LuaValueFlag_UseItem26  	= Value; Value = Value + 1; --使用物品記次--新手導覽寵物目前處理到的等級
EM_LuaValueFlag_UseItem27  	= Value; Value = Value + 1; --使用物品記次--新手導覽寵物目前狀況
EM_LuaValueFlag_UseItem28  	= Value; Value = Value + 1; --使用物品記次 --中東齋月節活動物品記數(新鮮的椰棗)
EM_LuaValueFlag_UseItem29  	= Value; Value = Value + 1; --使用物品記次 (Zone2 World PE 記錄玩家參予第幾場PE)
EM_LuaValueFlag_UseItem30  	= Value; Value = Value + 1; --使用物品記次 --詠火節--紅色惡獸
EM_LuaValueFlag_UseItem31  	= Value; Value = Value + 1; --使用物品記次  --詠火節--藍色惡獸
EM_LuaValueFlag_UseItem32  	= Value; Value = Value + 1; --使用物品記次 --花神節--單人或2人以上buff	
EM_LuaValueFlag_UseItem33  	= Value; Value = Value + 1; --使用物品記次 --花神節--雙人buff (春雨節畫蛋完成度用)
EM_LuaValueFlag_UseItem34  	= Value; Value = Value + 1; --使用物品記次 --花神節--全部npc找到次數
EM_LuaValueFlag_UseItem35  	= Value; Value = Value + 1; --使用物品記次 --春雨節100%蛋記數
EM_LuaValueFlag_UseItem36  	= Value; Value = Value + 1; --使用物品記次 --春雨節220%蛋記數
EM_LuaValueFlag_UseItem37  	= Value; Value = Value + 1; --使用物品記次 --愛樂節打倒魅影記數
EM_LuaValueFlag_UseItem38  	= Value; Value = Value + 1; --使用物品記次 --麒均活動副本靶場計時模式
EM_LuaValueFlag_UseItem39  	= Value; Value = Value + 1; --使用物品記次 --麒均活動副本靶場生存模式
EM_LuaValueFlag_UseItem40  	= Value; Value = Value + 1; --使用物品記次 --活動副本 大家來找碴計分
EM_LuaValueFlag_UseItem41  	= Value; Value = Value + 1; --使用物品記次 --2012節慶童話節，討伐巨龍計算次數
EM_LuaValueFlag_UseItem42  	= Value; Value = Value + 1; --使用物品記次 --2012節慶南瓜節，瑪拉鬼屋當日挖掘次數
EM_LuaValueFlag_UseItem43  	= Value; Value = Value + 1; --使用物品記次 --5.0.6 婚禮系統租用中房間序號
EM_LuaValueFlag_UseItem44  	= Value; Value = Value + 1; --使用物品記次 -- 6.0.1 新增 2011春雨節活動補加任務計次用
EM_LuaValueFlag_UseItem45  	= Value; Value = Value + 1; --使用物品記次 -- 6.0.2活動副本 大家來找碴活動計次
EM_LuaValueFlag_UseItem46  	= Value; Value = Value + 1; --使用物品記次 -- 2011愛樂節 遺失的魔法音符 完成任務次數
EM_LuaValueFlag_UseItem47  	= Value; Value = Value + 1; --使用物品記次 -- 2015童話節 支援童話劇團 完成任務次數(將就活動的BUFF判斷改成判斷USEITEM)
--EM_LuaValueFlag_UseItem999  = Value; Value = Value + 1; --使用物品記次 -- 蘇哥 - 檢查多玩家執行任務的狀態

-----數值技能使用
Value = EM_RoleValue_LuaValueFlag+201;
EM_LuaValueFlag_SkillUse1  	= Value; Value = Value + 1; --技能使用	--仇恨轉移
EM_LuaValueFlag_SkillUse2  	= Value; Value = Value + 1; --技能使用	--仇恨轉移
EM_LuaValueFlag_SkillUse3  	= Value; Value = Value + 1; --技能使用	--仇恨轉移
EM_LuaValueFlag_SkillUse4  	= Value; Value = Value + 1; --技能使用	--仇恨轉移
EM_LuaValueFlag_SkillUse5  	= Value; Value = Value + 1; --技能使用	--凡夢
EM_LuaValueFlag_SkillUse6  	= Value; Value = Value + 1; --技能使用	--影森50 幻影血刃
EM_LuaValueFlag_SkillUse7  	= Value; Value = Value + 1; --技能使用	--影森50 幻影血刃
EM_LuaValueFlag_SkillUse8  	= Value; Value = Value + 1; --技能使用	--影森50 幻影血刃
EM_LuaValueFlag_SkillUse9  	= Value; Value = Value + 1; --技能使用	--遊神40
EM_LuaValueFlag_SkillUse10  	= Value; Value = Value + 1; --技能使用	--法師套裝技-大地崩環

--精英技能 祭/靈50 招換物
EM_LuaValueFlag_EliteSummon 	=Value; Value = Value + 1; --精英技能 祭/靈50 招換物

-----新型PE記錄使用
Value = EM_RoleValue_LuaValueFlag+401;
EM_LuaValueFlag_PENum		= Value; Value = Value + 1; --PE編號，五位數字 前三位是區域代碼 後兩位是此PE在該區的序號
EM_LuaValueFlag_PEBuffTrace	= Value; Value = Value + 1; --以二進位記錄目前已取得的BUFF  最多32個
EM_LuaValueFlag_PEBuffKeep	= Value; Value = Value + 1; --目前擁有的BUFF編號
EM_LuaValueFlag_PECount		= Value; Value = Value + 1; --目前進行的PE任務完成次數
EM_LuaValueFlag_PEBuffKeep2	=Value; Value = Value + 1; --目前進行的PE所附帶的獎勵狀態

--系統參數設定
Value = EM_RoleValue_LuaValueFlag+451;
--背景音樂關閉與否
EM_LuaValueFlag_IsStopBGM	=Value; Value = Value + 1; --背景音樂播放狀態


--AddMoney( OwnerID() , EM_ActionType_Rent_BackPacket , 1000 )			-- 金幣
--AddMoney_Bonus( OwnerID() , EM_ActionType_Rent_BackPacket , 1000 )			-- 紅鑽
--AddMoney_Account( OwnerID() , EM_ActionType_Rent_BackPacket , 1000 )		-- 晶鑽	--已經停用
--AddMoneyEx_Account( OwnerID() , int ActionType , 1000 , bool LockMoneyProc )		-- 鎖定晶鑽 LockMoneyProc 若 = true 會處理鎖定的晶鑽 若 = false 不處理鎖定的晶鑽
--金錢或物品給予原因
Value = 0
EM_ActionType_Unknow		= Value; Value = Value + 1; --
EM_ActionType_LevelUp		= Value; Value = Value + 1; --升級
EM_ActionType_EnterWorld		= Value; Value = Value + 1; --入遊戲
EM_ActionType_LeaveWorld		= Value; Value = Value + 1; --離開遊戲
EM_ActionType_Buy		= Value; Value = Value + 1; --買
EM_ActionType_Buy_Record	= Value; Value = Value + 1; --買 過去賣掉的
EM_ActionType_Sell		= Value; Value = Value + 1; --賣
EM_ActionType_Tran		= Value; Value = Value + 1; --玩家交易
EM_ActionType_Get		= Value; Value = Value + 1; --撿取地上
EM_ActionType_Drop		= Value; Value = Value + 1; --放到地上
EM_ActionType_GMGive		= Value; Value = Value + 1; --GM給予
EM_ActionType_PlotGive		= Value; Value = Value + 1; --劇情給予
EM_ActionType_PlotDestory		= Value; Value = Value + 1; --劇情刪除
EM_ActionType_KillMonster		= Value; Value = Value + 1; --打怪物
EM_ActionType_DestroyItem		= Value; Value = Value + 1; --物品消除
EM_ActionType_ErrorDestory	= Value; Value = Value + 1; --錯誤清除
EM_ActionType_MagicSummonItem	= Value; Value = Value + 1; --魔法召喚物品
EM_ActionType_MagicDestory	= Value; Value = Value + 1; --魔法需求藥引	
EM_ActionType_UseItemGive	= Value; Value = Value + 1; --物品使用給予
EM_ActionType_UseItemDestroy	= Value; Value = Value + 1; --物品使用消失
EM_ActionType_OffLienDestory	= Value; Value = Value + 1; --離線消失
EM_ActionType_ChangeZoneDestory	= Value; Value = Value + 1; --換區消失
EM_ActionType_GiveSystem		= Value; Value = Value + 1; --用贈與系統給物品
EM_ActionType_CombineGet		= Value; Value = Value + 1; --煉製得到
EM_ActionType_CombineDestory	= Value; Value = Value + 1; --煉製消去
EM_ActionType_Steal		= Value; Value = Value + 1; --偷竊
EM_ActionType_ToAC		= Value; Value = Value + 1; --放到拍賣所
EM_ActionType_ToACError		= Value; Value = Value + 1; --放到拍賣所退回(有錯誤)
EM_ActionType_ToMail		= Value; Value = Value + 1; --放到拍賣所
EM_ActionType_ToMailError		= Value; Value = Value + 1; --放到拍賣所退回(有錯誤)
EM_ActionType_FromMail		= Value; Value = Value + 1; --由Mail取得
EM_ActionType_FromParty		= Value; Value = Value + 1; --由Party分享
EM_ActionType_Dissolution		= Value; Value = Value + 1; --分解
EM_ActionType_ACTex		= Value; Value = Value + 1; --使用拍賣所所需
EM_ActionType_ACBuy		= Value; Value = Value + 1; --拍賣所買東西
EM_ActionType_Money		= Value; Value = Value + 1; --銀票
EM_ActionType_Card		= Value; Value = Value + 1; --卡片
EM_ActionType_Gamble		= Value; Value = Value + 1; --賭博
EM_ActionType_ItemExchange	= Value; Value = Value + 1; --兌換物品
EM_ActionType_Buy_Account	= Value; Value = Value + 1; --點數商品購買
EM_ActionType_Buy_Lottery	= Value; Value = Value + 1; --買彩卷
EM_ActionType_Gather		= Value; Value = Value + 1; --採集
EM_ActionType_EqBroken		= Value; Value = Value + 1; --裝備損壞
EM_ActionType_SysChannel		= Value; Value = Value + 1; --系統頻道消耗物品
EM_ActionType_ColoringShop_Player	= Value; Value = Value + 1; --染色商店(更換照型)
EM_ActionType_Lottery_Prize	= Value; Value = Value + 1; --彩金
EM_ActionType_CreateGuild		= Value; Value = Value + 1; --建立公會
EM_ActionType_FixEQ		= Value; Value = Value + 1; --修裝備
EM_ActionType_BuyHouseEnergy	= Value; Value = Value + 1; --買房屋能量
EM_ActionType_ImportAccountMoney	= Value; Value = Value + 1; --匯入帳號幣		
EM_ActionType_QuestComplete	= Value; Value = Value + 1; --完成任務
EM_ActionType_Exp		= Value; Value = Value + 1; --經驗值改變
EM_ActionType_PlayerDead		= Value; Value = Value + 1; --玩家死亡
EM_ActionType_MonsterDead	= Value; Value = Value + 1; --怪物死亡
EM_ActionType_RefineFailedDestroy	= Value; Value = Value + 1; --精鍊升等失敗消失 
EM_ActionType_EQCombineDestroy	= Value; Value = Value + 1; --裝備合成消失 	
EM_ActionType_GuildWarDeclare	= Value; Value = Value + 1; --公會宣戰金錢
EM_ActionType_RefineLvUp		= Value; Value = Value + 1; --精鍊升等
EM_ActionType_RefineLvDn		= Value; Value = Value + 1; --精鍊降等
EM_ActionType_RefineNone		= Value; Value = Value + 1; --精鍊沒改變
EM_ActionType_RefineProtect	= Value; Value = Value + 1; --精鍊保護
EM_ActionType_ACSell		= Value; Value = Value + 1; --ac販賣
EM_ActionType_PKItemProtect	= Value; Value = Value + 1; --PK物品懲治保護
EM_ActionType_PKDropItem		= Value; Value = Value + 1; --PK掉落
EM_ActionType_Loot		= Value; Value = Value + 1; --檢屍
EM_ActionType_MagicBox		= Value; Value = Value + 1; --寶箱融合
EM_ActionType_GuildContribution	= Value; Value = Value + 1; --公會貢獻
EM_ActionType_SellMailGroup	= Value; Value = Value + 1; --群發信件
EM_ActionType_TimeUp		= Value; Value = Value + 1; --時間到刪除
EM_ActionType_GuildStoreHouse	= Value; Value = Value + 1; --公會倉庫
EM_ActionType_GuildHouse_Funiture	= Value; Value = Value + 1; --公會擺設
EM_ActionType_OpenPacket		= Value; Value = Value + 1; --打開商城打包
EM_ActionType_ColoringShop_Horse	= Value; Value = Value + 1; --染色商店(坐騎染色)
EM_ActionType_Rent_BackPacket	= Value; Value = Value + 1; --租用背包欄位
EM_ActionType_Rent_BankPacket	= Value; Value = Value + 1; --租用銀行欄位
EM_ActionType_Rent_Bank		= Value; Value = Value + 1; --租用隨身銀行
EM_ActionType_Rent_Mail		= Value; Value = Value + 1; --租用隨身信箱
EM_ActionType_Rent_AC		= Value; Value = Value + 1; --租用隨身交易所
EM_ActionType_Buy_Account_Gift	= Value; Value = Value + 1; --購買商城禮物
EM_ActionType_Buy_Account_Bonus	= Value; Value = Value + 1; --商城紅利幣購買
EM_ActionType_Buy_Account_Free	= Value; Value = Value + 1; --商城必爾丁	購買
EM_ActionType_Plant_Product	= Value; Value = Value + 1; --種植(產物)
EM_ActionType_Plant_Destroy	= Value; Value = Value + 1; --種植(刪除)
EM_ActionType_GuildStoreHouse_Get= Value; Value = Value + 1; --公會倉庫(拿出)
EM_ActionType_GuildHouse_Funiture_Get= Value; Value = Value + 1; --公會擺設(拿出)
EM_ActionType_Card_Destroy	= Value; Value = Value + 1; --卡片放入
EM_ActionType_MagicBox_Destroy	= Value; Value = Value + 1; --魔幻寶盒刪除
EM_ActionType_PetRetrain_Destroy= Value; Value = Value + 1; --寵物重修鍊刪除
EM_ActionType_Attribute_Gamble	= Value; Value = Value + 1; --物品屬性賭博
EM_ActionType_GMDestroy		= Value; Value = Value + 1; --GM刪除
EM_ActionType_BodyShop		= Value; Value = Value + 1; --修改身材
EM_ActionType_QuestDelete	= Value; Value = Value + 1; --刪除任務
EM_ActionType_EQCombineResult	= Value; Value = Value + 1; --物品合成結果
EM_ActionType_MagicBoxResult	= Value; Value = Value + 1; --魔幻寶盒合成結果
EM_ActionType_ItemtoItemResult	= Value; Value = Value + 1; --物品對物品使用結果
EM_ActionType_MagicStoneShop	= Value; Value = Value + 1; --魔石兌換商店
EM_ActionType_ServantHire	= Value; Value = Value + 1; --雇用女僕
EM_ActionType_SuitSkillCost	= Value; Value = Value + 1; --套裝技能消費金錢
EM_ActionType_DestroyItem_Buy	= Value; Value = Value + 1; --購買消失
EM_ActionType_DestroyItem_PetTriMerge	= Value; Value = Value + 1; --寵物融合消耗
EM_ActionType_DestroyItem_DrawOutRune	= Value; Value = Value + 1; --取出符文
EM_ActionType_DestroyItem_CoolSuit	= Value; Value = Value + 1; --套裝衣櫃
EM_ActionType_DestroyItem_CloneItem	= Value; Value = Value + 1; --疑是複製物品刪除
EM_ActionType_DestroyItem_ErrItem	= Value; Value = Value + 1; --問題物品刪除
EM_ActionType_Rare3EqExchangeItem	= Value; Value = Value + 1; --稀有度三的物品兌換刪除
EM_ActionType_DestroyItem_CloneItem_House= Value; Value = Value + 1; --疑是複製物品刪除(房屋)
EM_ActionType_PetBag_In			= Value; Value = Value + 1; --放入寵物包
EM_ActionType_PetBag_Out		= Value; Value = Value + 1; --取出寵物包
EM_ActionType_HorseBag_In		= Value; Value = Value + 1; --放入坐騎包
EM_ActionType_HorseBag_Out		= Value; Value = Value + 1; --取出坐騎包
EM_ActionType_ClsItemAttribute		= Value; Value = Value + 1; --
EM_ActionType_PutItemToWarDrobe		= Value; Value = Value + 1; --把東西放入衣櫥需求物
EM_ActionType_BG_IndependenceGame	= Value; Value = Value + 1; --戰場獨立遊戲
EM_ActionType_SlotMachine		= Value; Value = Value + 1; --角子老虎機
EM_ActionType_BUY_COOLSUITPAGE	= Value; Value = Value + 1; --買魔法衣櫥
EM_ActionType_BUY_COOLSUITSET		= Value; Value = Value + 1; --買酷裝設定
EM_ActionType_Item_ClsAttribute		= Value; Value = Value + 1; --使用屬性清潔石
EM_ActionType_Item_DrawAttribute	= Value; Value = Value + 1; --使用屬性抽取石
--公會戰場用記錄列舉
Value = 0
EM_GuildWar_Energy		= Value; Value = Value + 1; --能量
--公會戰場成績表TYPE列舉
Value = 0
EM_GuildWar_ScoreType1		= Value; Value = Value + 1; --戰鬥部隊/15
EM_GuildWar_ScoreType2		= Value; Value = Value + 1; --守備部隊/10
EM_GuildWar_ScoreType3		= Value; Value = Value + 1; --後勤部隊/10
EM_GuildWar_ScoreType4		= Value; Value = Value + 1; --補給部隊/10
EM_GuildWar_ScoreType5		= Value; Value = Value + 1; --支援部隊/--

_MAX_FRIENDLIST_FAMILY_COUNT_ 	= 20	

EM_RunningMsgExType_GM		= 0
EM_RunningMsgExType_Monitor	= 1
EM_RunningMsgExType_Shop		= 2
EM_RunningMsgExType_Other		= 3

--bool	SpecialMove( int GItemID , float X , float Y , float Z , int Type )
Value = 0
EM_SpecialMoveType_Dash		= Value; Value = Value + 1; --衝擊	
EM_SpecialMoveType_StrikeBack	= Value; Value = Value + 1; --震退
EM_SpecialMoveType_StrikeAway	= Value; Value = Value + 1; --震飛
EM_SpecialMoveType_Bomb		= Value; Value = Value + 1; --炸飛
EM_SpecialMoveType_Catch		= Value; Value = Value + 1; --抓取

--貨幣整合資訊
Value = 0
EM_ACPriceType_GameMoney		= Value;Value=Value+1	--遊戲幣
EM_ACPriceType_AccountMoney	= Value;Value=Value+1	--晶鑽
EM_ACPriceType_BonusMoney		= Value;Value=Value+1	--紅鑽
EM_ACPriceType_Phirius		= Value;Value=Value+1	--必爾汀代幣
EM_ACPriceType_Honor		= Value;Value=Value+1	--榮譽點數
EM_ACPriceType_Arena		= Value;Value=Value+1	--競技場點數(Arena)
EM_ACPriceType_GuildWarEnergy	= Value;Value=Value+1	--公會戰能量
EM_ACPriceType_GuildWarHonor	= Value;Value=Value+1	--公會戰戰績
EM_ACPriceType_TrialBadge 		= Value;Value=Value+1	--試煉徽章
EM_ACPriceType_Relics 		= Value;Value=Value+1	--古代遺物
EM_ACPriceType_Dreamland		= Value;Value=Value+1	--夢境先遣印記
EM_ACPriceType_PhiriusShell		= Value;Value=Value+1	--必爾汀圓貝
EM_ACPriceType_EnergyJustice	= Value;Value=Value+1	--正義能量
EM_ACPriceType_ProofLegend		= Value;Value=Value+1	--傳奇之證
EM_ACPriceType_DuelistReward	= Value;Value=Value+1	--勇士勳章
end