function kg_104590_Skillinfo(  )
	local Skill = {}
		--	      1	         2	        3	          4	           	5	      6		7	8	   9	    10
	Skill["SkillId"] = { 496931 , 496932 , 496933 , 496934  ,   496936  ,   496937,      496245  ,  496938 ,  496940  ,497444     }
	          	       --獅子放血  獅子破假  獅子AE      普通衝鋒    鞭打獅子   重擊動作     鐵鍊纏繞      4秒扇形  獅子纏身,狂野怒擊
	Skill["SkillLv"] = {      0, 	       0 ,          0 ,              3 ,                    400 ,              0 ,         	8      ,	49	,   3     	,      14  }
	--SkillLv 為0的 請到模板中調整強度
	--重擊動作(狂野重擊) 需到 kg_104590_BossSkill07_RealCast 中調整強度
	Skill["SkillString"] = { "496931" , "496932" , "496933"  , "[SC_104590_04]" , "[SC_104590_05]" , "[SC_104590_06]"   , "[SC_104590_07]"  , "[SC_104590_08]" , "496940" ,"[SC_104590_09]"}
	
	return Skill
end

function kg_104590_Buffinfo(  )
	local Buff = {}
		--	      1	        2
	Buff["BuffId"] = { 508551  ,  508555  }
	          	           --獅子加速   訓獸師狂暴
	Buff["BuffLv"] = { 20	,         50  }
	return Buff
end

--------------------------中控器-----------------------------------
function kg_104590_01()	--Zone19 格拉夫古堡 Boss訓獸師中控器
--EM_RoleValue_Register1 訓獸師
--EM_RoleValue_Register2 獅子
--EM_RoleValue_Register3 預防兩個boss同時死亡同時觸發生寶箱
--EM_RoleValue_Register9 入口
--EM_RoleValue_Register10 出口
	local Ctrl= OwnerID()	--中控器自身
	local RoomID = ReadRoleValue( Ctrl , EM_RoleValue_RoomID )
	local TempString = "Zone136_Boss2_AtkRange_"..RoomID
	kg_BossGV[TempString]={}	--狂野重擊找玩家
	WriteRoleValue( Ctrl , EM_RoleValue_Register3 , 0 )
	
	local ExitDoor = CreateObjByFlag( 103126, 780862 , 1 , 1 )--出口阻擋門
	kg_DoorInit( ExitDoor )
	WriteRoleValue( Ctrl , EM_RoleValue_Register10 , ExitDoor )
	AddToPartition( ExitDoor , RoomID )
	
	kg_104590_CreateBoss( Ctrl )
	kg_104591_CreateBucket()--隨機生五個桶子
end

function kg_104590_ResetBoss()
	local Ctrl =OwnerID()
	Sleep(50)
	kg_104590_CreateBoss( Ctrl )
end

function kg_104590_CreateBoss( Ctrl )
	--780862	--旗標編號	--0:入口  1: 出口  2:Boss初始位置
	--103126	--阻擋門編號
	local FlagID = 780862
	local BossID = 104590	--訓獸師物件編號
	local LionID = 104591	--小貓物件編號
	local RoomID = ReadRoleValue( Ctrl , EM_RoleValue_RoomID )
	
	local Boss = kg_GetRangePos( FlagID , BossID , 20 , 90 , -3 , 2 )--中控器右邊20碼處
	WriteRoleValue( Ctrl , EM_RoleValue_Register1 , Boss )
	WriteRoleValue( Boss , EM_RoleValue_Register1 , Ctrl )
	--MoveToFlagEnabled( Boss, false )	--關閉巡邏路徑劇情
	SetModeEx( Boss , EM_SetModeType_Revive, false )	--可重生
	AddToPartition( Boss , RoomID )
	BeginPlot( Boss,"kg_104590_BossAI", 1 )
	SetPlot( Boss ,"dead","kg_104590_BossDead", 30 )
	
	
	local Lion = kg_GetRangePos( FlagID , LionID , 20 , -90 , -3 , 2 )--中控器左邊20碼處(全域變數)
	local LionName = "Zone136_Boss2_Lion_"..RoomID
	kg_BossGV[LionName]=Lion
	WriteRoleValue(Ctrl,EM_RoleValue_Register2,Lion)
	WriteRoleValue(Lion,EM_RoleValue_Register1,Ctrl)
	WriteRoleValue(Lion,EM_RoleValue_Register2,Boss)
	WriteRoleValue(Boss,EM_RoleValue_Register2,Lion)
	WriteRoleValue(Lion,EM_RoleValue_Register4,0)--狂暴啟動
	--MoveToFlagEnabled( Lion, false )	--關閉巡邏路徑劇情
	SetModeEx( Lion , EM_SetModeType_Revive, false )	--可重生
	AddToPartition( Lion , RoomID )
	SetPlot( Lion,"dead","kg_104591_LionDead",30 )
end

function kg_104590_BossAllDead()
	DebugMsg(0,0,"BossAllDead..")
	local Ctrl = OwnerID()
	local RoomID = ReadRoleValue(Ctrl,EM_RoleValue_RoomID)
	DelObj(ReadRoleValue( Ctrl , EM_RoleValue_Register9 ))--刪除入口
	DelObj(ReadRoleValue( Ctrl , EM_RoleValue_Register10 ))--刪除出口
	kg_104590_BornBox( RoomID )
	BeginPlot(OwnerID(), "ic_ha_de_136_02" , 0)----防駭客
	local TempString = "Zone136_Boss2_AtkRange_"..RoomID
	kg_BossGV[TempString]=nil
	kg_104591_SetBucket( RoomID,2 )
end

function kg_104590_CheckHight( Boss )
	local Lion = ReadRoleValue( Boss , EM_RoleValue_Register2 )
	--local FlagY = GetMoveFlagValue( 780862 , 2 , EM_RoleValue_Y )
	--local BossY = ReadRoleValue(Boss,EM_RoleValue_Y)
	--local LionY = ReadRoleValue(Lion,EM_RoleValue_Y)
	--DebugMsg(0,0," dBossY = "..(BossY-FlagY).." ,dLionY"..(LionY-FlagY) )
	--local Height = 60
	--if ( (BossY-FlagY)>=Height ) or ( (LionY-FlagY)>=Height ) then
		if (DW_CheckDis(Boss,780862,2,428)~=true and CheckID(Boss)==true ) or (DW_CheckDis(Lion,780862,2,428)~=true and CheckID(Lion)==true ) then
			DebugMsg(0,0,"Boss2 Error!!!")
			local Ctrl = ReadRoleValue( Boss , EM_RoleValue_Register1 )
			local EnterDoor = ReadRoleValue( Ctrl,EM_RoleValue_Register9 )
			DelObj(EnterDoor)--刪除入口
			DelObj(Lion)
			BeginPlot( Ctrl,"kg_104590_ResetBoss",1 )
			DelObj(Boss)--刪除自己
		end
	--end
end
--[[
function kg_104590_CheckLionCombat(Boss,Lion)--訓獸師進入戰鬥後五秒獅子沒進入戰鬥就重置
	Sleep(50)
	if KS_InCombat(Lion)~=true then
		DebugMsg(0,0,"Boss2 Error!!!")
		local Ctrl = ReadRoleValue( Boss , EM_RoleValue_Register1 )
		local EnterDoor = ReadRoleValue(Ctrl,EM_RoleValue_Register9)
		DelObj(EnterDoor)--刪除入口
		DelObj(Lion)
		BeginPlot( Ctrl,"kg_104590_ResetBoss",1 )
		DelObj(Boss)--刪除自己
	end
end
]]--
------------------------訓獸師----------------------------------
function kg_104590_BossAI()
--EM_RoleValue_Register1 中控器
--EM_RoleValue_Register2 獅子
	local Boss = OwnerID()
	local timer =0
	local EnterBattle = 0
	local EndBattle = 1
	local Skill = kg_104590_Skillinfo()
	local Buff = kg_104590_Buffinfo()
	local Ctrl = ReadRoleValue( Boss , EM_RoleValue_Register1 )
	local Lion = ReadRoleValue( Boss , EM_RoleValue_Register2 )
	local RoomID = ReadRoleValue( Boss , EM_RoleValue_RoomID )
	while 1 do
		if KS_InCombat(Boss)==true then
			if EnterBattle == 0 then	--剛進入戰鬥的開場白
				--SysCastSpellLv(Boss,Boss,497085,0)
				--SysCastSpellLv(Lion,Lion,497085,0)
				BeginPlot(Ctrl,"kg_104590_BossCrazy",0)
				--CallPlot(Boss,"kg_104590_CheckLionCombat",Boss,Lion)
				local EnterDoor = CreateObjByFlag( 103126, 780862 , 0 , 1 )--入口阻擋門
				kg_DoorInit( EnterDoor )
				WriteRoleValue(Ctrl,EM_RoleValue_Register9,EnterDoor)
				AddToPartition( EnterDoor , RoomID )
				
				ScriptMessage( Boss , -1 , 2 , "[SC_104590_01]" , C_SYSTEM )
				--[104591]，有人要陪我們一起玩了
				DebugMsg(0,0,"Atom EnterBattle!")
				EnterBattle = 1
				EndBattle = 0
				kg_104591_SetBucket( RoomID,0 )--桶子可以點選
			end
			kg_104590_CheckHight( Boss )
			if timer>0 and timer%11==0 then
				kg_104590_BossSkill10s( Boss , Lion , Skill , Buff )
			elseif timer>0 and timer%17==0  then
				kg_104590_BossSkill15s( Boss , Lion , Skill , Buff )
			elseif timer>0 and timer%23==0  then
				kg_104590_BossSkill20s( Boss , Lion , Skill , Buff )
			elseif timer>0 and timer%31==0 then
				kg_104590_BossSkill30s( Boss , Lion , Skill , Buff )
			end
			timer = timer +1 
		else
			if EndBattle==0 then
				kg_104591_SetBucket( RoomID,1 )
				EnterBattle = 0
				EndBattle = 1
				timer = 0
				local EnterDoor = ReadRoleValue(Ctrl,EM_RoleValue_Register9)
				DelObj(EnterDoor)--刪除入口
				DelObj(Lion)
				BeginPlot( Ctrl,"kg_104590_ResetBoss",1 )
				DelObj(Boss)--刪除自己
			end
		end
		
		sleep(10)
	end
end

function kg_104590_BossDead()
	local Boss = OwnerID()
	local Ctrl = ReadRoleValue( Boss , EM_RoleValue_Register1 )
	local Lion = ReadRoleValue( Boss , EM_RoleValue_Register2 )
	if kg_CheckLive( Lion )==TRUE then
		WriteRoleValue(Lion,EM_RoleValue_Register4,1)--獅子進入狂暴
		BeginPlot(Lion,"kg_104591_CrazyLionAI",1 )--啟動獅子狂暴AI
		ScriptMessage( Boss , -1 , 2 , "[SC_104590_02]" , C_SYSTEM )	--[104591]..........幫我........咬碎他們......
	else
		DebugMsg(0,0,"BossDead")
		ScriptMessage( Boss , -1 , 2 , "[SC_104590_10]" , C_SYSTEM )	--.......[104591]..............
		if ReadRoleValue(Ctrl,EM_RoleValue_Register3)==0 then
			WriteRoleValue(Ctrl,EM_RoleValue_Register3,1)
			BeginPlot(Ctrl,"kg_104590_BossAllDead",0)
		end
	end
end

function kg_104590_BornBox( RoomID )--產生寶箱
	local Box = kg_GetRangePos( 780862 , 105456 , 0 , 0 , -3 , 2 )
	kg_BoxInit( Box )
	AddToPartition(Box,RoomID)
end

------------------------訓獸師技能------------------------------
function  kg_104590_BossCrazy()--Boss進入狂暴
	local Ctrl = OwnerID()
	local CrazyBuff = 507744
	local Boss= ReadRoleValue(Ctrl,EM_RoleValue_Register1)
	local Lion = ReadRoleValue(Ctrl,EM_RoleValue_Register2)
	local timer = 0
	while 1 do
		if KS_InCombat(Boss)~=TRUE and KS_InCombat(Lion)~=TRUE then
			DebugMsg(0,0,"BattleEnd")
			break
		elseif  timer==480 then
			if KS_InCombat(Boss)==TRUE then
				AddBuff(Boss,CrazyBuff,0,-1)
			end
			if KS_InCombat(Lion)==TRUE then
				AddBuff(Lion,CrazyBuff,0,-1)
			end
			break
		else
			
		end
		sleep(10)
		timer=timer+1
	end
end

function kg_104590_BossSkill10s( Boss , Lion , Skill , Buff )--獅子:破假+放血, 訓獸師:拿鞭子打獅子,雙手重擊,鐵鍊
	local Skillindex = 1
	local Buffindex = 1
	local randSkill = kg_Rand(100)
	DebugMsg(0,0,"randSkill = "..randSkill )
	local atkTarget = ReadRoleValue( Lion , EM_RoleValue_AttackTargetID )--讀取lion的攻擊目標
	if kg_CheckLive( Lion )==TRUE and CheckBuff( Lion , 508544 )==FALSE and GetDistance(Lion,atkTarget)<=60 and kg_CheckAtk( atkTarget )==TRUE then
		SysCastSpellLv( Lion , atkTarget , Skill["SkillId"][SkillIndex] , Skill["SkillLv"][SkillIndex] )--流血
		Skillindex = 2
		SysCastSpellLv( Lion , atkTarget , Skill["SkillId"][SkillIndex] , Skill["SkillLv"][SkillIndex] )--破甲
	end
	
	if randSkill>66 then--雙手重擊(需分散)
		Skillindex = 6
		local atkTarget = ReadRoleValue( Boss , EM_RoleValue_AttackTargetID )--讀取Boss的攻擊目標
		CastSpellLv( Boss , atkTarget , Skill["SkillId"][SkillIndex] , Skill["SkillLv"][SkillIndex] )
		ScriptMessage( Boss , -1 , 2 ,Skill["SkillString"][SkillIndex] , C_SYSTEM )
		--跑吧 盡情地跑吧
		--DebugMsg(0,0,Skillindex )
		Sleep(20)
	elseif randSkill>33 and randSkill<=66 then
		Skillindex = 10
		CastSpellLv( Boss , Boss , Skill["SkillId"][SkillIndex] , Skill["SkillLv"][SkillIndex] )
		ScriptMessage( Boss , -1 , 2 ,Skill["SkillString"][SkillIndex] , C_SYSTEM )
		--品嚐一下我的憤怒吧
		Sleep(20)
	else	--鐵鍊
		Skillindex = 7
		local PlayersInHate = KS_GetHateList( Boss , 1 )
		atkTarget = PlayersInHate[ math.random( table.getn(PlayersInHate) ) ]	--隨機取一名
		if kg_CheckAtk(atkTarget)==TRUE then
			CastSpellLv( Boss , atkTarget , Skill["SkillId"][SkillIndex] , Skill["SkillLv"][SkillIndex] )
			ScriptMessage( Boss , -1 , 2 ,Skill["SkillString"][SkillIndex] , C_SYSTEM )
			--別亂跑，要好好地參與演出阿
			--DebugMsg(0,0,Skillindex )
			Sleep(30)
		end
	end
end

function kg_104590_BossSkill07_CountObj()
	local O_id = OwnerID()
	local T_id = TargetID()
	local OrgID = ReadRoleValue( T_id , EM_RoleValue_OrgID )
	local RoomID = ReadRoleValue(O_id,EM_RoleValue_RoomID)
	local TempString = "Zone136_Boss2_AtkRange_"..RoomID
	if OrgID~=117200 and kg_CheckAtk( T_id )==TRUE then
		table.insert( kg_BossGV[TempString] , T_id )
	end
	DebugMsg(0,0,table.getn(kg_BossGV[TempString]))
end

function kg_104590_BossSkill07_Cast()--真狂野重擊
	local Boss = OwnerID()
	CallPlot( Boss ,"kg_104590_BossSkill07_RealCast",Boss )--為了能夠sleep
end

function kg_104590_BossSkill07_RealCast( Boss )
	Sleep(10)--法術延遲
	local Skillid = 496939--真狂野重擊
	local SkillLv = 399
	local RoomID = ReadRoleValue(Boss , EM_RoleValue_RoomID)
	local TempString = "Zone136_Boss2_AtkRange_"..RoomID
	local FanRange = kg_BossGV[TempString]
	local ShareNum = table.getn( FanRange )
	if ShareNum<=0 then ShareNum=1 end
	DebugMsg(0,0,"ShareCount = "..ShareNum )
	local Damage = math.ceil( ( SkillLv/ShareNum ) )	-- 200*1000/share
	for i=1 , table.getn( FanRange ) do
		SysCastSpellLv( Boss , FanRange[i] , Skillid , Damage )
	end
	kg_BossGV[TempString] = {}
	DebugMsg(0,0,table.getn(kg_BossGV[TempString]))
end

function kg_104590_BossSkill15s( Boss , Lion , Skill , Buff )--獅子大吼
	DebugMsg(0,0,"15s")
	local Buffindex = 1
	local Skillindex = 3
	if kg_CheckLive( Lion )==TRUE and CheckBuff( Lion , 508544 )==FALSE then
		SysCastSpellLv( Lion , Lion , Skill["SkillId"][SkillIndex] , Skill["SkillLv"][SkillIndex] )
	end
	Skillindex = 5
	if GetDistance( Boss , Lion )<=550 and kg_CheckLive(Lion)==TRUE then
		CastSpellLv( Boss , Lion , Skill["SkillId"][SkillIndex] , Skill["SkillLv"][SkillIndex] )
		AddBuff( Lion , Buff["BuffId"][Buffindex] , Buff["BuffLv"][Buffindex] , 10 )
		ScriptMessage( Boss , -1 , 2 ,Skill["SkillString"][SkillIndex] , C_SYSTEM )
		--奔跑吧   [104591]
		--DebugMsg(0,0,Skillindex )
		Sleep(10)
	end
end

function kg_104590_BossSkill20s( Boss , Lion , Skill , Buff )--獅子衝鋒
	DebugMsg(0,0,"20s")
	local Skillindex = 4
	--local atkTarget = ReadRoleValue( Boss, EM_RoleValue_AttackTargetID )
	local PlayersInHate = KS_GetHateList( Boss , 1 )
	local atkTarget = PlayersInHate[ math.random( table.getn(PlayersInHate) ) ]	--隨機取一名
	if kg_CheckLive( Lion )==TRUE and CheckBuff( Lion , 508544 )==FALSE and kg_CheckAtk(atkTarget)==TRUE then
		Hide(Lion)
		SetModeEx( Lion , EM_SetModeType_Strikback, false) ---反擊(否)
		Show(Lion,ReadRoleValue(Boss,EM_RoleValue_RoomID))
		CallPlot(Lion,"kg_104590_LionStrikback",Lion)
		CastSpellLv( Lion , atkTarget , Skill["SkillId"][SkillIndex] , Skill["SkillLv"][SkillIndex] )
		local messageString = Skill["SkillString"][SkillIndex].."[$SETVAR1="..GetName( atkTarget ).."]"
		ScriptMessage( Boss , -1 , 2 ,messageString , C_SYSTEM )
		--[104591]，[$VAR1]在偷懶阿
	end
	Sleep(10)
end

function kg_104590_LionStrikback( Lion )
	Sleep(70)
	local RoomID =ReadRoleValue(Lion,EM_RoleValue_RoomID)
	Hide(Lion)
	SetModeEx( Lion , EM_SetModeType_Strikback, true) ---反擊(否)
	Show(Lion,RoomID)
end

function kg_104590_BossSkill30s( Boss , Lion , Skill , Buff )--4秒唱法扇形攻擊,獅子纏身，獅子抓主坦4秒後自動跑回原目標
	DebugMsg(0,0,"30s")
	local Skillindex = 9
	local atkTarget = ReadRoleValue( Boss, EM_RoleValue_AttackTargetID )
	if GetDistance( Boss,atkTarget )<50 and kg_CheckAtk(atkTarget)==TRUE then
		if kg_CheckLive( Lion )==TRUE then
			CancelBuff( Lion , 508544 )--取消肉的嘲諷
			SysCastSpellLv( atkTarget , Lion, 496930, 3 )--可決定秒數的挑釁
			CastSpellLv( Lion , atkTarget , Skill["SkillId"][SkillIndex] , Skill["SkillLv"][SkillIndex] )--獅子纏身
			Skillindex = 8
			ScriptMessage( Boss , -1 , 2 ,Skill["SkillString"][SkillIndex] , C_SYSTEM )
			--[104591]  來吧  幫我個忙
		end
		Skillindex = 8	--4秒唱法扇形攻擊
		CastSpellLv( Boss , atkTarget , Skill["SkillId"][SkillIndex] , Skill["SkillLv"][SkillIndex] )
		Sleep(70)
		CancelBuff( Lion , 508544 )--取消嘲諷
	end
end

------------------------------獅子狂暴--------------------------------
function kg_104591_CrazyLionAI()--訓獸師死亡時才會執行
--EM_RoleValue_Register1 中控器
--EM_RoleValue_Register2 Boss
--EM_RoleValue_Register4 狂暴中
	local Lion = OwnerID()
	AddBuff(Lion ,508680,0,-1)--不能普攻
	local EnterBattle = 0
	local EndBattle = 1
	local PlayersInHate ={}
	local atkTarget
	local Skill = kg_104590_Skillinfo()
	local SkillIndex = 4
	
	while 1 do
		if KS_InCombat( Lion )==true then
			if EnterBattle == 0 then	--進入戰鬥
				EnterBattle = 1
				EndBattle = 0
				
				PlayersInHate = KS_GetHateList( Lion , 1 )
				atkTarget = PlayersInHate[ math.random( table.getn(PlayersInHate) ) ]	--隨機取一名
				if  kg_CheckAtk(atkTarget)==TRUE then
					CancelBuff( Lion , 507181 )--取消挑釁
					SysCastSpellLv( atkTarget, Lion, 495767, 0 )--單體最高級挑釁
					CastSpellLv( Lion , atkTarget , Skill["SkillId"][SkillIndex] , Skill["SkillLv"][SkillIndex] )
					Sleep(20)
				end
			end
			
			if GetDistance( Lion, atkTarget)<=60 then
				SkillIndex = 1
				SysCastSpellLv( Lion , atkTarget , Skill["SkillId"][SkillIndex] , Skill["SkillLv"][SkillIndex] )--流血
				PlayersInHate = KS_GetHateList( Lion , 1 )
				if table.getn(PlayersInHate)>1 then
					local RandVar = math.random(table.getn(PlayersInHate))
					local TempTarget = PlayersInHate[RandVar]--從仇恨列表中隨意抓一個
					if TempTarget == atkTarget or kg_CheckAtk(TempTarget)==FALSE  then--隨機目標剛好為當前攻擊目標
						table.remove( PlayersInHate , RandVar )--將隨機目標從仇恨列表中移除
						atkTarget = PlayersInHate[ math.random(table.getn(PlayersInHate)) ]--重新抓取隨機目標
					else
						atkTarget = PlayersInHate[ RandVar ]
					end
				elseif table.getn(PlayersInHate)==1 then
					atkTarget = PlayersInHate[1]
				end
				SkillIndex = 4
				CancelBuff( Lion , 507181 )--取消身上的挑釁
				SysCastSpellLv( atkTarget , Lion, 495767, 0 )--單體最高級挑釁
				CastSpellLv( Lion , atkTarget , Skill["SkillId"][SkillIndex] , Skill["SkillLv"][SkillIndex] )--衝鋒
				Sleep(12)
			else
				if ReadRoleValue( Lion, EM_RoleValue_AttackTargetID )~=atkTarget then--目標不正確時再加強挑釁
					CancelBuff( Lion , 507181 )--取消挑釁
					SysCastSpellLv( atkTarget , Lion , 495767, 0 )--單體最高級挑釁
				end
			end
		else
			if EndBattle==0 then	--小貓獲勝，玩家滅團，Boss重新產生
				local RoomID =ReadRoleValue(Lion,EM_RoleValue_RoomID)
				kg_104591_SetBucket( RoomID,1 )
				EnterBattle = 0
				EndBattle = 1
				local Ctrl = ReadRoleValue(Lion,EM_RoleValue_Register1)
				local EnterDoor = ReadRoleValue(Ctrl,EM_RoleValue_Register9)
				DelObj(EnterDoor)--刪除入口
				BeginPlot( Ctrl,"kg_104590_ResetBoss",1 )
				DelObj(Lion)--刪除自己
				break
			end
		end
		sleep(10)
	end
end

function kg_104591_LionDead()
	DebugMsg(0,0,"Lion Dead...")
	local Lion = OwnerID()
	local Boss = ReadRoleValue( Lion,EM_RoleValue_Register2 )
	local Ctrl = ReadRoleValue( Lion , EM_RoleValue_Register1 )
	local Buff = kg_104590_Buffinfo()
	ScriptMessage( Lion , -1 , 2 , "[SC_104590_03]" , C_SYSTEM )	--.........吼............
	if kg_CheckLive( Boss )==TRUE then
		AddBuff( Boss , Buff["BuffId"][2] , Buff["BuffLv"][2] , -1 )	--訓獸師狂暴
	else
		DebugMsg(0,0,"Lion Dead...")
		if ReadRoleValue(Ctrl,EM_RoleValue_Register3)==0 then
			WriteRoleValue(Ctrl,EM_RoleValue_Register3,1)
			BeginPlot(Ctrl,"kg_104590_BossAllDead",1)
		end
	end
end

function kg_104591_CheckLion()--獅子被鞭子打到不會損傷
	local monsterid = ReadRoleValue(TargetID(),EM_RoleValue_OrgID)
	if monsterid == 104591 or monsterid == 105457 or monsterid == 105543 or monsterid == 105545 then
		return FALSE
	else
		return TRUE
	end
end

---------------------------桶子與肉塊------------------------------
function kg_104591_PutMeatDown()	--玩家使用肉執行的Script
--meatID  117200
	local Player = OwnerID()
	local RoomID = ReadRoleValue(Player,EM_RoleValue_RoomID)
	local meat = kg_GetRangePos( Player , 105457 , 10 )  --原地種 kg_GetPos( Player , 117200 )
	kg_Target( meat )
	SetModeEx( meat , EM_SetModeType_Fight, false) ---可砍殺(否)
	AddToPartition( meat,RoomID )
	BeginPlot(meat,"kg_104591_MeatAI",0 )
end

function kg_104591_MeatAI()	--嘲諷吧!肉!
--496930 嘲諷獅子
	local meat = OwnerID()
	local RoomID = ReadRoleValue(meat,EM_RoleValue_RoomID)
	local LionName = "Zone136_Boss2_Lion_"..RoomID
	local Lion = kg_BossGV[LionName]
	DebugMsg(0,0,"LionGID = "..Lion )
	for i=1 , 6 do
		local Player = KS_GetHateList( Lion, 3 )--仇恨表( Type:1 依仇恨; 2 依距離; 3 玩家)
		if table.getn(Player)~=0 then
			Hide(meat)
			SetModeEx( meat , EM_SetModeType_Fight, TRUE) ---可砍殺(否)
			Show(meat,RoomID)
			if GetDistance( meat, Lion )<=100 and ReadRoleValue(Lion,EM_RoleValue_Register4)~=1 then
				SysCastSpellLv( meat , Lion, 496930, 3 )--可決定秒數的挑釁
				DebugMsg(0,0,"come on , Lion!! ")
			end
		else
			Hide(meat)
			SetModeEx( meat , EM_SetModeType_Fight, false) ---可砍殺(否)
			Show(meat,RoomID)
		end
		Sleep(10)
	end
	DelObj(meat)
end

function kg_104591_CreateBucket()
--BucketID 117201
--EM_RoleValue_Register8 桶子CD中
	local Ctrl = OwnerID()
	local RoomID = ReadRoleValue(Ctrl ,EM_RoleValue_RoomID)
	local Buckets = kg_CreateMultiObj( Ctrl , 117201 , 1 , 5 , -3 , 100 , 150 , 0 , 360 ,"kg_104591_BucketInit" )--創造多個桶子並初始化
	local TempString = "Zone136_Boss2_Buckets_"..RoomID
	kg_BossGV[TempString] = Buckets
end

function kg_104591_BucketInit()
	local Bucket = OwnerID()
	WriteRoleValue( Bucket , EM_RoleValue_Register8,0 )
	--SetPlot( Bucket , "touch" , "kg_104591_TouchBucket" , 30 )
	--Sleep(300)
	--DelObj(Bucket)
end

function kg_104591_SetBucket( RoomID,Mode )--0:讓桶子可以拿  1:讓桶子不能拿  2:將桶子刪除
	local TempString = "Zone136_Boss2_Buckets_"..RoomID
	local Buckets = kg_BossGV[TempString]
	if Buckets~=nil then
		for i in pairs(Buckets) do
			if Mode==0 then
				SetPlot( Buckets[i] , "touch" , "kg_104591_TouchBucket" , 30 )
			elseif Mode==1 then
				SetPlot( Buckets[i],"touch","",0 )
			elseif Mode==2 then
				DelObj( Buckets[i] )
			end
		end
	end
	if Mode==2 then kg_BossGV[TempString]=nil end
end

function kg_104591_TouchBucket()
--物品肉id 208712
	local Player=OwnerID()
	local Bucket = TargetID()
	if CountBodyItem( Player, 208712 )==0 then
		if ReadRoleValue(Bucket,EM_RoleValue_Register8)==0 then
			WriteRoleValue( Bucket,EM_RoleValue_Register8,1 )
			GiveBodyItem( Player , 208712 , 1  )
			CallPlot( Bucket,"kg_104591_BucketCD", Bucket )
		else
			ScriptMessage( Bucket,Player,0,"[SC_104590_11]", C_SYSTEM )
			--這桶子很堅固，桶子內沒有東西
		end
	else
		ScriptMessage( Bucket,Player,0,"[SC_104590_12]", C_SYSTEM )
		--一人一片，不要貪心
	end
end

function kg_104591_BucketCD( Bucket )
	Sleep(300)--CD30秒
	DebugMsg(0,0,"time's up")
	WriteRoleValue( Bucket,EM_RoleValue_Register8,0 )
end