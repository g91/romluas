function Init_RoleValue_ENUM1( )
local Value = 0;

EM_RoleValue_HP	= Value; Value = Value + 1;	-- 當前生命點數
EM_RoleValue_MP	= Value; Value = Value + 1;	-- 當前魔力點數
EM_RoleValue_RACE	= Value; Value = Value + 1;	-- 種族
EM_RoleValue_VOC	= Value; Value = Value + 1;	-- 職業
EM_RoleValue_SEX	= Value; Value = Value + 1;	-- 性別
EM_RoleValue_EXP	= Value; Value = Value + 1;	-- 經驗值
EM_RoleValue_LV	= Value; Value = Value + 1;	-- 等級
EM_RoleValue_X	= Value; Value = Value + 1;	-- X軸
EM_RoleValue_Y	= Value; Value = Value + 1;	-- Y軸(高度)
EM_RoleValue_Z	= Value; Value = Value + 1;	-- Z軸
EM_RoleValue_Dir	= Value; Value = Value + 1;	-- 面向
EM_RoleValue_STR	= Value; Value = Value + 1;	-- 力量
EM_RoleValue_STA	= Value; Value = Value + 1;	-- 耐力
EM_RoleValue_INT	= Value; Value = Value + 1;	-- 智慧
EM_RoleValue_MND	= Value; Value = Value + 1;	-- 精神
EM_RoleValue_AGI	= Value; Value = Value + 1;	-- 敏捷
EM_RoleValue_Point	= Value; Value = Value + 1;
EM_RoleValue_SkillPoint	= Value; Value = Value + 1;
EM_RoleValue_SP		= Value; Value = Value + 1;	
EM_RoleValue_SP_Sub	= Value; Value = Value + 1;
EM_RoleValue_MaxHP	= Value; Value = Value + 1;	-- 最大生命點數
EM_RoleValue_MaxMP	= Value; Value = Value + 1;	-- 最大魔力點數
EM_RoleValue_MaxSP	= Value; Value = Value + 1;
EM_RoleValue_MaxSP_Sub	= Value; Value = Value + 1;
EM_RoleValue_VOC_SUB	= Value; Value = Value + 1;	--副職業
EM_RoleValue_LV_SUB	= Value; Value = Value + 1;	--副職業等級
EM_RoleValue_ThisLVExp	= Value; Value = Value + 1;
EM_RoleValue_LiveTime	= Value; Value = Value + 1;	-- 物件生存時間
EM_RoleValue_BodyCount	= Value; Value = Value + 1;	-- 0 ~ 49 商城背包空間，50 ~ 59 魔幻寶盒空間，60 ~ 239 玩家背包空間
EM_RoleValue_BankCount	= Value; Value = Value + 1;	-- 銀行空間
EM_RoleValue_RoomID	= Value; Value = Value + 1;
EM_RoleValue_TpExp		= Value; Value = Value + 1;
EM_RoleValue_Money	= Value; Value = Value + 1;	-- 金錢
EM_RoleValue_Money_Account	= Value; Value = Value + 1;	--晶鑽
EM_RoleValue_KillRate 		= Value; Value = Value + 1;
EM_RoleValue_StomachPoint	= Value; Value = Value + 1;
EM_RoleValue_SysFlag		= Value; Value = Value + 1;
EM_RoleValue_AddExp		= Value; Value = Value + 1;
EM_RoleValue_AddTP		= Value; Value = Value + 1;
EM_RoleValue_PlayTimeQuota	= Value; Value = Value + 1;
EM_RoleValue_GoodEvil		= Value; Value = Value + 1;	-- 善惡值
EM_RoleValue_VocCount	= Value; Value = Value + 1;
EM_RoleValue_BoxEnergy	= Value; Value = Value + 1;	--融合箱能量
EM_RoleValue_MedalCount	= Value; Value = Value + 1;	--榮譽點數
EM_RoleValue_BonusMoney	= Value; Value = Value + 1;	--紅鑽(紅利點數)
EM_RoleValue_MaxLv 	= Value; Value = Value + 1;
EM_RoleValue_DebtExp	= Value; Value = Value + 1;	--經驗值負債
EM_RoleValue_DebtTP	= Value; Value = Value + 1;	--TP負債

EM_RoleValue_FinStr		= Value; Value = Value + 1;	--計算後STR
EM_RoleValue_FinSta		= Value; Value = Value + 1;	--計算後STA
EM_RoleValue_FinInt		= Value; Value = Value + 1;	--計算後INT
EM_RoleValue_FinMnd	= Value; Value = Value + 1;	--計算後MND
EM_RoleValue_FinAgi		= Value; Value = Value + 1;	--計算後AGI

EM_RoleValue_Honor		 = Value; Value = Value + 1;	-- 榮譽
EM_RoleValue_MaxPlantCount 	= Value; Value = Value + 1;	--最多可種植的數量
EM_RoleValue_AttackDelay		= Value; Value = Value + 1;	--攻擊延遲 0.1sec

EM_RoleValue_TotalTpExp		 = Value; Value = Value + 1;	--TP上限值
EM_RoleValue_CliOk_X		 = Value; Value = Value + 1;	--確認可走的點
EM_RoleValue_CliOk_Y		 = Value; Value = Value + 1;	--確認可走的點
EM_RoleValue_CliOk_Z		 = Value; Value = Value + 1;	--確認可走的點
EM_RoleValue_VIP_Type 		= Value; Value = Value + 1;	--Vip Member Type
EM_RoleValue_VIP_Flag		= Value; Value = Value + 1;
EM_RoleValue_UnTrust_Flag		= Value; Value = Value + 1;	
EM_RoleValue_Money_AccountLock	= Value; Value = Value + 1;	--鎖定的帳號幣數量
EM_RoleValue_TitleID		= Value; Value = Value + 1;	--目前頭銜的ID

EM_RoleValue_TitleSys_Famous	= Value; Value = Value + 1;	--頭銜系統名聲
EM_RoleValue_TitleSys_Lv	  	= Value; Value = Value + 1;	--頭銜系統等級
EM_RoleValue_TitleSys_Exp	  	= Value; Value = Value + 1;	--頭銜系統經驗值
EM_RoleValue_TitleSys_TitleID1	= Value; Value = Value + 1;	--頭銜系統裝備頭銜
EM_RoleValue_TitleSys_TitleID2	= Value; Value = Value + 1;	--頭銜系統裝備頭銜
EM_RoleValue_TitleSys_TitleID3	= Value; Value = Value + 1;	--頭銜系統裝備頭銜
EM_RoleValue_TitleSys_TitleID4	= Value; Value = Value + 1;	--頭銜系統裝備頭銜
EM_RoleValue_TitleSys_TitleID5	= Value; Value = Value + 1;	--頭銜系統裝備頭銜

EM_RoleValue_SoulPoint		= Value; Value = Value + 1;	--靈魂值
EM_RoleValue_MoveDelay		= Value; Value = Value + 1;	--移動延遲

EM_RoleValue_SlotMachineFreeCount	= Value; Value = Value + 1;	--角子老虎免費次數
EM_RoleValue_DuelistReward	= Value; Value = Value + 1;	--勇士勳章
EM_RoleValue_TrialBadgeCoin	= Value; Value = Value + 1;	--試煉徽章
EM_RoleValue_RelicsCoin		= Value; Value = Value + 1;	--古代遺物
EM_RoleValue_DreamlandCoin	= Value; Value = Value + 1;	--夢境先遣印記
EM_RoleValue_PhiriusShellCoin	= Value; Value = Value + 1;	--必爾汀圓貝
EM_RoleValue_EnergyJusticeCoin	= Value; Value = Value + 1;	--正義能量
EM_RoleValue_ProofLegendCoin	= Value; Value = Value + 1;	--傳奇之證
EM_RoleValue_VenderCount		= Value; Value = Value + 1;	--幣商回報權值
EM_RoleValue_LockHP		= Value; Value = Value + 1;	--lockHP
EM_RoleValue_WeekResetCount	= Value; Value = Value + 1;	--
EM_RoleValue_MirrorCoin		= Value; Value = Value + 1;	--鏡幻徽印

EM_RoleValue_Famous	= 400;	-- EM_RoleValue_Famous + X
EM_RoleValue_Register	= 450;	-- EM_RoleValue_Register + X
EM_RoleValue_Register1	= EM_RoleValue_Register;		-- EM_RoleValue_Register + X
EM_RoleValue_Register2 	= EM_RoleValue_Register1 + 1;	-- EM_RoleValue_Register + X
EM_RoleValue_Register3	= EM_RoleValue_Register2 + 1;	-- EM_RoleValue_Register + X
EM_RoleValue_Register4	= EM_RoleValue_Register3 + 1;	-- EM_RoleValue_Register + X
EM_RoleValue_Register5	= EM_RoleValue_Register4 + 1;	-- EM_RoleValue_Register + X
EM_RoleValue_Register6	= EM_RoleValue_Register5 + 1;	-- EM_RoleValue_Register + X
EM_RoleValue_Register7	= EM_RoleValue_Register6 + 1;	-- EM_RoleValue_Register + X
EM_RoleValue_Register8	= EM_RoleValue_Register7 + 1;	-- EM_RoleValue_Register + X
EM_RoleValue_Register9	= EM_RoleValue_Register8 + 1;
EM_RoleValue_Register10	= EM_RoleValue_Register9 + 1;	

Value = 700;
EM_RoleValue_Skill_Unarmed	= Value; Value = Value + 1;
EM_RoleValue_Skill_Blade		= Value; Value = Value + 1;
EM_RoleValue_Skill_Dagger		= Value; Value = Value + 1;
EM_RoleValue_Skill_Wand		= Value; Value = Value + 1;
EM_RoleValue_Skill_Axe		= Value; Value = Value + 1;
EM_RoleValue_Skill_Bludgeon	= Value; Value = Value + 1;
EM_RoleValue_Skill_Claymore	= Value; Value = Value + 1;
EM_RoleValue_Skill_Staff		= Value; Value = Value + 1;
EM_RoleValue_Skill_2H_Axe		= Value; Value = Value + 1;
EM_RoleValue_Skill_2H_Hammer	= Value; Value = Value + 1;
EM_RoleValue_Skill_Polearm		= Value; Value = Value + 1;
EM_RoleValue_Skill_Bow		= Value; Value = Value + 1;
EM_RoleValue_Skill_CossBow	= Value; Value = Value + 1;
EM_RoleValue_Skill_Gun		= Value; Value = Value + 1;
EM_RoleValue_Skill_Define		= Value; Value = Value + 1;

EM_RoleValue_Skill_BlackSmith 	= Value; Value = Value + 1;	--15	打鐵
EM_RoleValue_Skill_Carpenter 	= Value; Value = Value + 1;	--16	木工
EM_RoleValue_Skill_MakeArmor 	= Value; Value = Value + 1;	--17	製甲
EM_RoleValue_Skill_Tailor		= Value; Value = Value + 1;	--18	裁縫
EM_RoleValue_Skill_Cook		= Value; Value = Value + 1;	--19	烹飪
EM_RoleValue_Skill_Alchemy		= Value; Value = Value + 1;	--20	煉金
EM_RoleValue_Skill_Mining		= Value; Value = Value + 1;	--21	挖礦
EM_RoleValue_Skill_Lumbering	= Value; Value = Value + 1;	--22	伐木
EM_RoleValue_Skill_Herblism	= Value; Value = Value + 1;	--23	採藥
EM_RoleValue_Skill_Fishing		= Value; Value = Value + 1;
EM_RoleValue_Skill_Plant		= Value; Value = Value + 1;
EM_RoleValue_Skill_CatchPet	= Value; Value = Value + 1;


Value = 750;
EM_RoleValue_Skill_Fin_Unarmed	= Value; Value = Value + 1;
EM_RoleValue_Skill_Fin_Blade	= Value; Value = Value + 1;
EM_RoleValue_Skill_Fin_Dagger	= Value; Value = Value + 1;
EM_RoleValue_Skill_Fin_Wand	= Value; Value = Value + 1;
EM_RoleValue_Skill_Fin_Axe		= Value; Value = Value + 1;
EM_RoleValue_Skill_Fin_Bludgeon	= Value; Value = Value + 1;
EM_RoleValue_Skill_Fin_Claymore	= Value; Value = Value + 1;
EM_RoleValue_Skill_Fin_Staff		= Value; Value = Value + 1;
EM_RoleValue_Skill_Fin_2H_Axe	= Value; Value = Value + 1;
EM_RoleValue_Skill_Fin_2H_Hammer	= Value; Value = Value + 1;
EM_RoleValue_Skill_Fin_Polearm	= Value; Value = Value + 1;
EM_RoleValue_Skill_Fin_Bow		= Value; Value = Value + 1;
EM_RoleValue_Skill_Fin_CossBow	= Value; Value = Value + 1;
EM_RoleValue_Skill_Fin_Gun		= Value; Value = Value + 1;
EM_RoleValue_Skill_Fin_Define	= Value; Value = Value + 1;

EM_RoleValue_Skill_Fin_BlackSmith	= Value; Value = Value + 1;
EM_RoleValue_Skill_Fin_Carpenter	= Value; Value = Value + 1;
EM_RoleValue_Skill_Fin_MakeArmor	= Value; Value = Value + 1;
EM_RoleValue_Skill_Fin_Tailor	= Value; Value = Value + 1;
EM_RoleValue_Skill_Fin_Cook	= Value; Value = Value + 1;
EM_RoleValue_Skill_Fin_Alchemy	= Value; Value = Value + 1;
EM_RoleValue_Skill_Fin_Mining	= Value; Value = Value + 1;
EM_RoleValue_Skill_Fin_Lumbering	= Value; Value = Value + 1;
EM_RoleValue_Skill_Fin_Herblism	= Value; Value = Value + 1;
EM_RoleValue_Skill_Fin_Fishing	= Value; Value = Value + 1;
EM_RoleValue_Skill_Fin_Plant	= Value; Value = Value + 1;
EM_RoleValue_Skill_Fin_CatchPet	= Value; Value = Value + 1;


Value = 850;
EM_RoleValue_SkillMax_Unarmed	= Value; Value = Value + 1;
EM_RoleValue_SkillMax_Blade	= Value; Value = Value + 1;
EM_RoleValue_SkillMax_Dagger	= Value; Value = Value + 1;
EM_RoleValue_SkillMax_Wand	= Value; Value = Value + 1;
EM_RoleValue_SkillMax_Axe		= Value; Value = Value + 1;
EM_RoleValue_SkillMax_Bludgeon	= Value; Value = Value + 1;
EM_RoleValue_SkillMax_Claymore	= Value; Value = Value + 1;
EM_RoleValue_SkillMax_Staff		= Value; Value = Value + 1;
EM_RoleValue_SkillMax_2H_Axe	= Value; Value = Value + 1;
EM_RoleValue_SkillMax_2H_Hammer	= Value; Value = Value + 1;
EM_RoleValue_SkillMax_Polearm	= Value; Value = Value + 1;
EM_RoleValue_SkillMax_Bow		= Value; Value = Value + 1;
EM_RoleValue_SkillMax_CossBow	= Value; Value = Value + 1;
EM_RoleValue_SkillMax_Gun		= Value; Value = Value + 1;
EM_RoleValue_SkillMax_Define	= Value; Value = Value + 1;

EM_RoleValue_SkillMax_BlackSmith	= Value; Value = Value + 1;
EM_RoleValue_SkillMax_Carpenter	= Value; Value = Value + 1;
EM_RoleValue_SkillMax_MakeArmor	= Value; Value = Value + 1;
EM_RoleValue_SkillMax_Tailor	= Value; Value = Value + 1;
EM_RoleValue_SkillMax_Cook	= Value; Value = Value + 1;
EM_RoleValue_SkillMax_Alchemy	= Value; Value = Value + 1;

EM_RoleValue_SkillMax_Mining	= Value; Value = Value + 1;
EM_RoleValue_SkillMax_Lumbering	= Value; Value = Value + 1;
EM_RoleValue_SkillMax_Herblism	= Value; Value = Value + 1;
EM_RoleValue_SkillMax_Fishing	= Value; Value = Value + 1;
EM_RoleValue_SkillMax_Plant	= Value; Value = Value + 1;
EM_RoleValue_SkillMax_CatchPet	= Value; Value = Value + 1;

Value = 900
EM_RoleValue_VOCLV_GM		= Value; Value = Value + 1;	
EM_RoleValue_VOCLV_Warrior	= Value; Value = Value + 1;	
EM_RoleValue_VOCLV_Ranger	= Value; Value = Value + 1;	
EM_RoleValue_VOCLV_Rogue	= Value; Value = Value + 1;	
EM_RoleValue_VOCLV_Wizard	= Value; Value = Value + 1;	
EM_RoleValue_VOCLV_Priest		= Value; Value = Value + 1;	
EM_RoleValue_VOCLV_Knight	= Value; Value = Value + 1;	
EM_RoleValue_VOCLV_RuneDancer	= Value; Value = Value + 1;
EM_RoleValue_VOCLV_Druid		= Value; Value = Value + 1;	
EM_RoleValue_VOCLV_HARPSYN	= Value; Value = Value + 1;	
EM_RoleValue_VOCLV_PSYRON	= Value; Value = Value + 1;	

EM_RoleValue_ClinetSetting	 		= 950		--Client 端設定數值資料
EM_RoleValue_FamilyFriendListLv_Pos	= 1000;	--好友等級( 共20 個)
EM_RoleValue_LuaMagicID			= 1100;	
EM_RoleValue_TimeFlag			= 1200;	--200個時間旗標 (0-99 真實時間 100-199 線上時間)

EM_RoleValue_MagicPowerLv_SP		= 2000;	--主職技能等級
EM_RoleValue_MagicPowerLv_Normal	= 2200;	--一般技能等級
EM_RoleValue_MagicPowerLv_SubJob	= 2250;	--副職技能等級
EM_RoleValue_MagicID_SP			= 2300;	--主職技能ID
EM_RoleValue_MagicID_Normal		= 2500;	--一般技能ID
EM_RoleValue_MagicID_SubJob		= 2550;	--副職技能ID

EM_RoleValue_CultivatePet_Money		= 2998;	--寵物幣
EM_RoleValue_CultivatePet_NextMergeResetTime	= 2999;--最後一次寵物融合時間
EM_RoleValue_CultivatePet_Value		= 3000;	--寵物數值起使位置
EM_RoleValue_LuaValueFlag			= 4000;	--1000個

EM_RoleValue_Coldown		= 6000; --冷卻時間1+200+15+30 = 246個
EM_RoleValue_Coldown_All 		= 6000; -- 共用冷卻 1 個
EM_RoleValue_Coldown_Job		= 6001; --職業技能冷卻 500個
EM_RoleValue_Coldown_EQ		= 6501;
EM_RoleValue_Coldown_Item	= 6516;

Value = 7000
EM_RoleValue_IsNPC 	= Value; Value = Value + 1;
EM_RoleValue_IsPlayer  	= Value; Value = Value + 1;
EM_RoleValue_OrgID     	= Value; Value = Value + 1;
EM_RoleValue_AttackTargetID	= Value; Value = Value + 1;
EM_RoleValue_PID		= Value; Value = Value + 1;
EM_RoleValue_IsWalk 	=Value; Value = Value + 1;
EM_RoleValue_MaxHit	= Value; Value = Value + 1;
EM_RoleValue_DBID		= Value; Value = Value + 1;
EM_RoleValue_IsDead	= Value; Value = Value + 1;
EM_RoleValue_GroupID	= Value; Value = Value + 1;
EM_RoleValue_GuildID	= Value; Value = Value + 1;
EM_RoleValue_ZoneID	= Value; Value = Value + 1;
EM_RoleValue_HouseDBID	= Value; Value = Value + 1;
EM_RoleValue_PetID		= Value; Value = Value + 1;	-- 職業技能招喚的寵物OrgID
EM_RoleValue_IsAttackMode	= Value; Value = Value + 1;
EM_RoleValue_IsUnholster	 	= Value; Value = Value + 1; 
EM_RoleValue_SpellMagicID		= Value; Value = Value + 1;	--正在施的法術
EM_RoleValue_CampID		= Value; Value = Value + 1;	--陣營號碼(read only )
EM_RoleValue_OwnerDBID		= Value; Value = Value + 1;	--主人的DBID

EM_RoleValue_OwnerGUID		= Value; Value = Value + 1;	--主人的物件
EM_RoleValue_DodgeState		= Value; Value = Value + 1;	--(最近有)閃避
EM_RoleValue_MissState		= Value; Value = Value + 1;	--(最近有)Miss
EM_RoleValue_ParryState		= Value; Value = Value + 1;	--(最近有)Parry
EM_RoleValue_BeParryState		= Value; Value = Value + 1;	--(最近有)被Parry
EM_RoleValue_BeDodgeState	= Value; Value = Value + 1;	--(最近有)被閃避
EM_RoleValue_CritialState		= Value; Value = Value + 1;	--(最近有)物理Critial
EM_RoleValue_BeCritialState		= Value; Value = Value + 1;	--(最近有)被物理Critial
EM_RoleValue_MagicCritialState	= Value; Value = Value + 1;	--(最近有)法術Critial
EM_RoleValue_BeMagicCritialState	= Value; Value = Value + 1;	--(最近有)被法術Critial
EM_RoleValue_ShieldBlockState	= Value; Value = Value + 1;	--(最近有)盾檔
EM_RoleValue_BeShieldBlockState	= Value; Value = Value + 1;	--(最近有)被盾檔	
EM_RoleValue_LastDHp		= Value; Value = Value + 1;	--最後一次HP變化量
EM_RoleValue_LastDHpTarget	= Value; Value = Value + 1;	--最後一次改變者

EM_RoleValue_VisitHouseDBID	= Value; Value = Value + 1;	--參觀的方屋DBID

EM_RoleValue_PetID_Cultivate	= Value; Value = Value + 1;	--寵物系統招喚的寵物OrgID
EM_RoleValue_Fin_Phy_ATK		= Value; Value = Value + 1;	--攻擊力
EM_RoleValue_Fin_Phy_Dmg		= Value; Value = Value + 1;	--主手傷害
EM_RoleValue_Fin_Phy_Def		= Value; Value = Value + 1;	--防禦力
EM_RoleValue_Fin_Mag_ATK		= Value; Value = Value + 1;	--魔攻
EM_RoleValue_Fin_Mag_Dmg	= Value; Value = Value + 1;	--魔法傷害
EM_RoleValue_Fin_Mag_Def		= Value; Value = Value + 1;	--魔法防禦
EM_RoleValue_Fin_Phy_DodgeLv	= Value; Value = Value + 1;	--閃避等級
EM_RoleValue_Fin_Phy_HitLv		= Value; Value = Value + 1;	--物理命中等級
EM_RoleValue_Fin_Mag_HitLv	= Value; Value = Value + 1;	--魔法命中等級
EM_RoleValue_Fin_Phy_ParryRate	= Value; Value = Value + 1;	--格檔率
EM_RoleValue_Fin_Phy_CritRate	= Value; Value = Value + 1;	--物理致命一擊率
EM_RoleValue_Fin_Phy_CritResistRate	= Value; Value = Value + 1;	--抗物理致命一擊率
EM_RoleValue_Fin_Phy_CritPower	= Value; Value = Value + 1;	--物理致命一擊威力
EM_RoleValue_Fin_Mag_CritRate	= Value; Value = Value + 1;	--法術致命一擊率
EM_RoleValue_Fin_Mag_CritResistRate	= Value; Value = Value + 1;	--抗法術致命一擊率
EM_RoleValue_Fin_Mag_CritPower	= Value; Value = Value + 1;	--法術致命一擊威力
EM_RoleValue_CliState		= Value; Value = Value + 1;	--取得目前角色的Cli端狀態
EM_RoleValue_AroundPlayer		= Value; Value = Value + 1;	--周圍玩家角色數量
EM_RoleValue_NpcOnMove		= Value; Value = Value + 1;	--npc 是否正在移動
EM_RoleValue_IncursivePoint 	= Value; Value = Value + 1;	-- 世界入侵個人積分
EM_RoleValue_RecalculateAll	= Value; Value = Value + 1;	-- 角色資料重新計算
EM_RoleValue_PassengerAttackable	= Value; Value = Value + 1;	--可攻擊乘客
EM_RoleValue_AttachObjGUID 	= Value; Value = Value + 1;	--載具物件ID
EM_RoleValue_BeginAtkDBID 	= Value; Value = Value + 1;	--取得第一個殺怪的人
EM_RoleValue_DualTargetDBID	= Value; Value = Value + 1;	--取得比試的目標
EM_RoleValue_CastingType		= Value; Value = Value + 1;	--取得是否有Client使用條
EM_RoleValue_SetNPCAttackRange	= Value; Value = Value + 1;	--設定NPC攻擊距離

EM_RoleValue_LastAttackType	= Value; Value = Value + 1;	--(全域)最後一次攻擊類型(OnAttackTypeENUM)
EM_RoleValue_LastAttackOwnerID	= Value; Value = Value + 1;	--(全域)最後一次被攻擊者
EM_RoleValue_LastAttackTargetID	= Value; Value = Value + 1;	--(全域)最後一次攻擊者
EM_RoleValue_LastAttackMagColID	= Value; Value = Value + 1;	--(全域)最後一次攻擊法術集合
EM_RoleValue_LastAttackMagBaseID= Value; Value = Value + 1;	--(全域)最後一次攻擊法術基本
EM_RoleValue_LastAttackDamage	= Value; Value = Value + 1;	--(全域)最後一次攻擊傷害量
EM_RoleValue_LastAttackDmgType	= Value; Value = Value + 1;	--(全域)最後一次攻擊傷害類型(ATTACK_DMGTYPE_ENUM)
EM_RoleValue_CycleMagicID		= Value; Value = Value + 1;	--目前循環的法術

EM_RoleValue_BaseEQ_Str	= Value; Value = Value + 1;	--str不算Buff的數值
EM_RoleValue_BaseEQ_Sta	= Value; Value = Value + 1;	--sta不算Buff的數值
EM_RoleValue_BaseEQ_Int	= Value; Value = Value + 1;	--int不算Buff的數值
EM_RoleValue_BaseEQ_Mnd	= Value; Value = Value + 1;	--mnd不算Buff的數值
EM_RoleValue_BaseEQ_Agi	= Value; Value = Value + 1;	--agi不算Buff的數值


EM_RoleValue_RealZoneID 			= Value; Value = Value + 1;	--所在區域（不去分流）
EM_RoleValue_HidePlotOwnerDBID		 = Value; Value = Value + 1;	--(DEBIG)隱藏劇情執行者DBID
EM_RoleValue_HidePlotOwnerOrgObjID	 = Value; Value = Value + 1;	--(DEBIG)隱藏劇情執行者OrgObjID

EM_RoleValue_SuitSkill_LeanSkillCount 	= 8000	--學習的裝備技能
EM_RoleValue_SuitSkill_MaxEqSkillCount	= 8001	--最大可裝的到裝技能數，設定玩家可以使用的格數

EM_RoleValue_SuitSkill_EqID		= 8100	--目前裝備的技能(10)個
EM_RoleValue_SuitSkill_LeanSkillID	= 8200	--目前學會的技能(200個)
EM_RoleValue_BG_Return_Value	= 8500	--戰場回傳數值(10個)

EM_RoleValue_SPMagic		= 9000   				 --法術等級
EM_RoleValue_NormalMagic		= EM_RoleValue_SPMagic + 200   	--法術等級

EM_RoleValue_SuitWardrobe	= 10000	--魔法衣櫥
EM_RoleValue_PetCard	= 11000	--寵物卡片
--帳號旗標
Value = 0	--Currency Exchange(貨幣兌換)  
-- 20150709 請祥人將 256 位元擴編至 1024 位元，以因應德國廠商新需求(阿浩)，每 1 項方案需 12 + 8 = 20 位元。
EM_AccountFlag_CE_Date1_12		=Value; Value = Value + 12	--晶鑽兌換金幣 招喚NPC用(最大2048) 2^12 -2048 ~ 2047
EM_AccountFlag_CE_Count1_8		=Value; Value = Value + 8	--晶鑽兌換金幣 招喚NPC用(最大128)   2^8    -128 ~ 127
EM_AccountFlag_CE_Date2_12		=Value; Value = Value + 12	--金幣兌換晶鑽 招喚NPC用(最大2048) 2^12
EM_AccountFlag_CE_Count2_8		=Value; Value = Value + 8	--金幣兌換晶鑽 招喚NPC用(最大128)   2^8
EM_AccountFlag_CE_Date3_12		=Value; Value = Value + 12	--晶鑽兌換金幣 Zone2 NPC用(最大2048) 2^12
EM_AccountFlag_CE_Count3_8		=Value; Value = Value + 8	--晶鑽兌換金幣 Zone2 NPC用(最大128)   2^8
EM_AccountFlag_CE_Date4_12		=Value; Value = Value + 12	--金幣兌換晶鑽 Zone2 NPC用(最大2048) 2^12
EM_AccountFlag_CE_Count4_8		=Value; Value = Value + 8	--金幣兌換晶鑽 Zone2 NPC用(最大128)   2^8
EM_AccountFlag_CE_Date5_12		=Value; Value = Value + 12	--以A換B 方案1 招喚NPC用(最大2048) 2^12 -2048 ~ 2047	記錄日期用
EM_AccountFlag_CE_Count5_8		=Value; Value = Value + 8	--以A換B 方案1 招喚NPC用(最大128)   2^8    -128 ~ 127	記錄次數用
EM_AccountFlag_TJ_Check_1			=Value; Value = Value + 1	--擁有第三職業旗標(最大1)   2^1    0 ~ 1
EM_AccountFlag_CE_Date6_12		=Value; Value = Value + 12	--以A換B 方案2 招喚NPC用(最大2048) 2^12 -2048 ~ 2047	記錄日期用
EM_AccountFlag_CE_Count6_8		=Value; Value = Value + 8	--以A換B 方案2 招喚NPC用(最大128)   2^8    -128 ~ 127	記錄次數用
EM_AccountFlag_CE_Date7_12		=Value; Value = Value + 12	--以A換B、C、D 方案3 招喚NPC用(最大2048) 2^12 -2048 ~ 2047	記錄日期用
EM_AccountFlag_CE_Count7_8		=Value; Value = Value + 8	--以A換B、C、D 方案3 招喚NPC用(最大128)   2^8    -128 ~ 127	記錄次數用
EM_AccountFlag_CE_Date8_12		=Value; Value = Value + 12	--以A換B、C、D 招喚NPC用(最大2048) 2^12 -2048 ~ 2047	記錄日期用
EM_AccountFlag_CE_Count8_8		=Value; Value = Value + 8	--以A換B、C、D 招喚NPC用(最大128)   2^8    -128 ~ 127	記錄次數用

EM_AccountFlag_MW_Space_Switch_1		=Value; Value = Value + 1	--魔法衣櫥擴充用的衣櫥頁面1(最大1)   2^1    0 ~ 1 Magic Wardrobe = MW
EM_AccountFlag_MW_Space_Switch_2		=Value; Value = Value + 1	--魔法衣櫥擴充用的衣櫥頁面2(最大1)   2^1    0 ~ 1
EM_AccountFlag_MW_Space_Switch_3		=Value; Value = Value + 1	--魔法衣櫥擴充用的衣櫥頁面3(最大1)   2^1    0 ~ 1
EM_AccountFlag_MW_Space_Switch_4		=Value; Value = Value + 1	--魔法衣櫥擴充用的衣櫥頁面4(最大1)   2^1    0 ~ 1
EM_AccountFlag_MW_Space_Switch_5		=Value; Value = Value + 1	--魔法衣櫥擴充用的衣櫥頁面5(最大1)   2^1    0 ~ 1
EM_AccountFlag_MW_Space_Switch_6		=Value; Value = Value + 1	--魔法衣櫥擴充用的衣櫥頁面6(最大1)   2^1    0 ~ 1
EM_AccountFlag_MW_Space_Switch_7		=Value; Value = Value + 1	--魔法衣櫥擴充用的衣櫥頁面7(最大1)   2^1    0 ~ 1
EM_AccountFlag_MW_Space_Switch_8		=Value; Value = Value + 1	--魔法衣櫥擴充用的衣櫥頁面8(最大1)   2^1    0 ~ 1

EM_AccountFlag_MW_Set_Switch_1		=Value; Value = Value + 1	--魔法衣櫥擴充用的衣組設定6(最大1)   2^1    0 ~ 1
EM_AccountFlag_MW_Set_Switch_2		=Value; Value = Value + 1	--魔法衣櫥擴充用的衣組設定7(最大1)   2^1    0 ~ 1
EM_AccountFlag_MW_Set_Switch_3		=Value; Value = Value + 1	--魔法衣櫥擴充用的衣組設定8(最大1)   2^1    0 ~ 1
EM_AccountFlag_MW_Set_Switch_4		=Value; Value = Value + 1	--魔法衣櫥擴充用的衣組設定9(最大1)   2^1    0 ~ 1
EM_AccountFlag_MW_Set_Switch_5		=Value; Value = Value + 1	--魔法衣櫥擴充用的衣組設定10(最大1)   2^1    0 ~ 1

EM_AccountFlag_CE_Date9_12		=Value; Value = Value + 12	--彈性設定以物換物 方案1 召喚NPC用(最大2048) 2^12 -2048 ~ 2047	記錄日期用
EM_AccountFlag_CE_Count9_8		=Value; Value = Value + 8	--彈性設定以物換物 方案1 召喚NPC用(最大128)   2^8    -128 ~ 127	記錄次數用
EM_AccountFlag_CE_Date10_12		=Value; Value = Value + 12	--彈性設定以物換物 方案2 召喚NPC用(最大2048) 2^12 -2048 ~ 2047	記錄日期用
EM_AccountFlag_CE_Count10_8		=Value; Value = Value + 8	--彈性設定以物換物 方案2 召喚NPC用(最大128)   2^8    -128 ~ 127	記錄次數用
EM_AccountFlag_CE_Date11_12		=Value; Value = Value + 12	--彈性設定以物換物 方案3 召喚NPC用(最大2048) 2^12 -2048 ~ 2047	記錄日期用
EM_AccountFlag_CE_Count11_8		=Value; Value = Value + 8	--彈性設定以物換物 方案3 召喚NPC用(最大128)   2^8    -128 ~ 127	記錄次數用
EM_AccountFlag_CE_Date12_12		=Value; Value = Value + 12	--彈性設定以物換物 方案4 召喚NPC用(最大2048) 2^12 -2048 ~ 2047	記錄日期用
EM_AccountFlag_CE_Count12_8		=Value; Value = Value + 8	--彈性設定以物換物 方案4 召喚NPC用(最大128)   2^8    -128 ~ 127	記錄次數用
EM_AccountFlag_CE_Date13_12		=Value; Value = Value + 12	--彈性設定以物換物 方案5 召喚NPC用(最大2048) 2^12 -2048 ~ 2047	記錄日期用
EM_AccountFlag_CE_Count13_8		=Value; Value = Value + 8	--彈性設定以物換物 方案5 召喚NPC用(最大128)   2^8    -128 ~ 127	記錄次數用
EM_AccountFlag_CE_Date14_12		=Value; Value = Value + 12	--彈性設定以幣換幣 方案1 召喚NPC用(最大2048) 2^12 -2048 ~ 2047	記錄日期用
EM_AccountFlag_CE_Count14_8		=Value; Value = Value + 8	--彈性設定以幣換幣 方案1 召喚NPC用(最大128)   2^8    -128 ~ 127	記錄次數用
EM_AccountFlag_CE_Date15_12		=Value; Value = Value + 12	--彈性設定以幣換幣 方案2 召喚NPC用(最大2048) 2^12 -2048 ~ 2047	記錄日期用
EM_AccountFlag_CE_Count15_8		=Value; Value = Value + 8	--彈性設定以幣換幣 方案2 召喚NPC用(最大128)   2^8    -128 ~ 127	記錄次數用
EM_AccountFlag_CE_Date16_12		=Value; Value = Value + 12	--彈性設定以幣換幣 方案3 召喚NPC用(最大2048) 2^12 -2048 ~ 2047	記錄日期用
EM_AccountFlag_CE_Count16_8		=Value; Value = Value + 8	--彈性設定以幣換幣 方案3 召喚NPC用(最大128)   2^8    -128 ~ 127	記錄次數用
EM_AccountFlag_CE_Date17_12		=Value; Value = Value + 12	--彈性設定以幣換幣 方案4 召喚NPC用(最大2048) 2^12 -2048 ~ 2047	記錄日期用
EM_AccountFlag_CE_Count17_8		=Value; Value = Value + 8	--彈性設定以幣換幣 方案4 召喚NPC用(最大128)   2^8    -128 ~ 127	記錄次數用
EM_AccountFlag_CE_Date18_12		=Value; Value = Value + 12	--彈性設定以幣換幣 方案5 召喚NPC用(最大2048) 2^12 -2048 ~ 2047	記錄日期用
EM_AccountFlag_CE_Count18_8		=Value; Value = Value + 8	--彈性設定以幣換幣 方案5 召喚NPC用(最大128)   2^8    -128 ~ 127	記錄次數用

-- 新加入的 Value ( EM_AccountFlag) 值，必須要宣告在最下面，否則會導致帳號資料錯亂... 
end