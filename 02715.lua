--初始劇情，無血條、死亡
function lua_z24_DeadandNoHPMP()
	SetModeEx( OwnerID() , EM_SetModeType_NotShowHPMP, true )
	SetDefIdleMotion(OwnerID(),ruFUSION_MIME_DEATH_LOOP)
	SetPlot( OwnerID(),"touch","lua_z24_FiretheDeadMonsterBody",20 )
end

function lua_z24_FiretheDeadMonsterBody()
	local O_ID=OwnerID();
	if CountBodyItem( O_ID,241612 )>=1 then
		DW_CancelTypeBuff(68,O_ID)
		if 	BeginCastBarEvent( O_ID, T_ID,"[SC_Z24Q425523_1]", 50, 131, 133, 0, "lua_z24_FiretheDeadMonsterBody2" ) ~= 1 then
				ScriptMessage( O_ID, O_ID, 0,"[SAY_NPC_BUSY]", 0 );		--目標忙碌中
				ScriptMessage( O_ID, O_ID, 2,"[SAY_NPC_BUSY]", 0 );		--目標忙碌中
		end
	else
		ScriptMessage( O_ID, O_ID, 2,"[SAY_NPC_BUSY]", 0 );
	end
end

function lua_z24_FiretheDeadMonsterBody2(ObjID, CheckStatus)
	local O_ID = OwnerID() 	-- 玩家
	local T_ID = TargetID()  	-- NPC
	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			local num=GetPartyID( O_ID, -1 )
			if num==0 then	--隊伍不存在
				DW_QietKillOne( O_ID,107065 )
			else
				for i=1,num do
					local menber =GetPartyID( O_ID, i )
					if menber~=nil then
						if CheckDistance( O_ID, menber, 500 ) then
							DW_QietKillOne( menber,107065 )
						end
					end
				end
			end
--燃燒、消失、重生，還沒做。
			DebugMsg(0,0,"1")
			EndCastBar( O_ID, CheckStatus )
		else
			DebugMsg(0,0,"2")
			EndCastBar( O_ID, CheckStatus )
		end
	end
end


function lua_z24_RayTheOtherObj()
	z24_testObj={}
	table.insert(z24_testObj,OwnerID())
end
function lua_z24_RayTheOtherObj1()
	table.insert(z24_testObj,OwnerID())
end
function lua_z24_testuse00()
	while 1 do
	for i=1,4 do
		for j=i+1,5 do
			SysCastSpellLv(z24_testObj[i],z24_testObj[j],850321,88)
			SysCastSpellLv(z24_testObj[j],z24_testObj[i],850321,88)
			DebugMsg(0,0,"i="..i..",j="..j)
		end
	end
	Sleep(10)
	end
end

--任務425140，對話產生表演，掛在npc113988身上

function Lua_z24q425160_1()	--對話
	LoadQuestOption(OwnerID())
	if CheckAcceptQuest(OwnerID(),425160)==true and CheckFlag(OwnerID(),546713)==false then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_Z24Q5140_00]","Lua_z24q425160_3",0);
	end
end
function Lua_z24q425160_3()	--呼叫表演
	CloseSpeak(OwnerID());
	local tmpNPC = SearchRangeNPC( TargetID(), 50 )	--search NPC周圍找中控(106794)
	local objnum =0					--記錄物件數量
	local obj = 0						--回傳的中控器ID
		for i = 0,#tmpNPC-1 do
			if ReadRoleValue( tmpNPC[i], EM_RoleValue_OrgID ) == 106794 then
				objnum = objnum +1
			end
		end
		if objnum >0 then
			ScriptMessage(OwnerID(),OwnerID(),0,"[SC_424528_3]",C_SYSTEM);
			CloseSpeak(OwnerID());
		else
			local tx,ty,tz,tdir 
				tx=ReadRoleValue( TargetID(),EM_RoleValue_X);
				ty=ReadRoleValue( TargetID(),EM_RoleValue_Y);
				tz=ReadRoleValue( TargetID(),EM_RoleValue_Z);
				tdir=ReadRoleValue(TargetID(),EM_RoleValue_Dir);
			obj = CreateObj( 106794, tx, ty, tz, tdir, 1 )
			SetFightMode ( obj, 0, 0, 0,0 ) 
			SetModeEx( obj, EM_SetModeType_Show, false )
			SetModeEx( obj, EM_SetModeType_Mark, false )
			AddToPartition( obj, 0 )
			CallPlot( obj, "Lua_z24q425160_4",obj )
		end
end
function Lua_z24q425160_4( O_ID )
	local QuestID = 425160				--任務編號
	local FinishFlagID = 546713			--完成任務獲得的旗標
	local CheckBuffID = 507178			--檢查是否正在演戲的BUFF
	local CheckRange = 150				--演戲的檢查範圍
	local ActorArray = {}				--(新版修改)演員陣列表
		local npc=SearchRangeNPC( O_ID,100 )
		for i=0,#npc do
			if ReadRoleValue(npc[i], EM_RoleValue_OrgID)==113988	then	--伊崔妮
				ActorArray[1] =LuaFunc_CreateObjByObj( 120971,npc[i] )
				SetModeEx( ActorArray[1],EM_SetModeType_Mark,false )
			end
			if ReadRoleValue(npc[i], EM_RoleValue_OrgID)==120969	then	--穎克兒
				ActorArray[2] =LuaFunc_CreateObjByObj( 120972,npc[i] )
				SetModeEx( ActorArray[2],EM_SetModeType_Mark,false )
			end
			if ReadRoleValue(npc[i], EM_RoleValue_OrgID)==120970	then	--卡德摩斯
				ActorArray[3] =LuaFunc_CreateObjByObj( 120974,npc[i] )
				SetModeEx( ActorArray[3],EM_SetModeType_Mark,false )
			end
		end
		npc=nil;
	CallPlot( O_ID, "Ag_QuestS1", QuestID, FinishFlagID, CheckBuffID, CheckRange, ActorArray  )
	--範圍看戲用的檢查函式
		Sleep(20)
		Say(ActorArray[2],"[SC_Z24Q5140_01]" )
		Sleep(20)
		Say(ActorArray[2],"[SC_Z24Q5140_02]" )
		Sleep(20)
		Say(ActorArray[2],"[SC_Z24Q5140_03]" )
		Sleep(40)
		Say(ActorArray[1],"[SC_Z24Q5140_04]" )
		Sleep(20)
		Say(ActorArray[2],"[SC_Z24Q5140_05]" )
		Sleep(30)
		Say(ActorArray[2],"[SC_Z24Q5140_06]" )
		Sleep(30)
		Say(ActorArray[1],"[SC_Z24Q5140_07]" )
		Sleep(20)
		Say(ActorArray[1],"[SC_Z24Q5140_08]" )
		Sleep(20)
		Say(ActorArray[1],"[SC_Z24Q5140_09]" )
		Sleep(30)
		Say(ActorArray[2],"[SC_Z24Q5140_10]" )
		Sleep(20)
		Say(ActorArray[3],"[SC_Z24Q5140_11]" )
		Sleep(20)
		Say(ActorArray[2],"[SC_Z24Q5140_12]" )
		Sleep(20)
		Say(ActorArray[3],"[SC_Z24Q5140_13]" )
		Sleep(20)
		Say(ActorArray[3],"[SC_Z24Q5140_14]" )
		Sleep(20)
		Say(ActorArray[3],"[SC_Z24Q5140_15]" )
		Sleep(30)
		Say(ActorArray[3],"[SC_Z24Q5140_16]" )
		Sleep(30)
		Say(ActorArray[3],"[SC_Z24Q5140_17]" )
		Sleep(30)
		Say(ActorArray[3],"[SC_Z24Q5140_18]" )
		Sleep(30)
		Say(ActorArray[3],"[SC_Z24Q5140_19]" )
		Sleep(30)
		Say(ActorArray[3],"[SC_Z24Q5140_20]" )
		Sleep(10)
		Say(ActorArray[2],"[SC_Z24Q5140_21]" )
		Sleep(30)
		Say(ActorArray[3],"[SC_Z24Q5140_22]" )
		Sleep(20)
		Say(ActorArray[1],"[SC_Z24Q5140_23]" )
		Sleep(20)
		Say(ActorArray[2],"[SC_Z24Q5140_24]" )
		Sleep(20)
	Ag_QuestEnd1( QuestID, FinishFlagID, CheckBuffID, CheckRange, ActorArray,O_ID ) --戲演完了 給予旗標\物品
end
--z24,野生動物躲避人類
function lua_Z24DodgePlayer()    
	local ID = OwnerID()--老鼠
	local RoomID = ReadRoleValue( ID , EM_RoleValue_RoomID)
	local stime = 10

	WriteRoleValue( ID,EM_RoleValue_IsWalk ,0)--用跑的
	SetPlot( ID,"range","lua_Z24DodgePlayerChange",50 )
	--轉變 OwnerID() 、 TargetID()
	function lua_Z24DodgePlayerChange()
		local ID = TargetID()
		local Player = OwnerID()
		CallPlot( ID,"lua_Z24DodgePlayer_RangeDrama",Player )
	end
end
--z24,野生動物躲避人類,產生的範圍劇情
function lua_Z24DodgePlayer_RangeDrama( Player )
	local ID = OwnerID()		--怪物
	local M = 60			--有玩家則移動之距離
	local Randdis = Rand( M )    
		if Randdis < 20 then
			Randdis = 20
		end

		AdjustFaceDir( ID, Player , 180 ) --面向 背對
		sleep(5)
		local Dis = Randdis	
		Lua_MoveLine( ID , Dis ) --參考物件，向前移動到Dis距離的位置 (Dis 填 負數 為 向後移動)
end

--Z24，第一區，產生旗子用
--產生旗子的中控器
function lua_AG24CreatFlag_InitS()
	Var_Ag24_FlagCenter = nil or {}	--全域變數，裝用來產生旗子的陣列

	local OrgID = ReadRoleValue( OwnerID(),EM_RoleValue_OrgID ) 
	--假如有編號，就記錄值
	if OrgID >= 1 then
		Var_Ag24_FlagCenter[ OrgID ] = OwnerID()
		return
	else
		--沒Orgid編號就當主控
		BeginPlot( OwnerID(),"lua_AG24FlagCtrlCetner_InitS",10 )
	end
end
--主中控主要用來依序產生旗子，才不會在產生旗子時互相搶到
function lua_AG24FlagCtrlCetner_InitS()
	Var_Z24Only_UseForCreatFlag = 0	--全域變數，旗子裝到幾號的變數 
	local iFlag = Var_Ag24_FlagCenter
	for i=1,#iFlag,1 do
		CallPlot ( iFlag[i],"lua_Z24AgCreFlag_Creat",0 )
		Sleep(10)
	end
end	
--開機時，用來產生一大片旗子的function
function lua_Z24AgCreFlag_Creat()
	local Owner = Role:new( OwnerID() ) 
	local BaseX = Owner:X()
 	local BaseY = Owner:Y();
 	local BaseZ = Owner:Z();
 	local BaseDir = Owner:Dir();
	local flag=781182
	local dis=80
	local angle=8
 	local Inc = Var_Z24Only_UseForCreatFlag
	CreateFlag( flag , Inc  , BaseX,BaseY,BaseZ,BaseDir  )
	Inc = Inc + 1
	for j=1,5,1 do
		for i = 1 , angle , 1 do
			local tmpY = GetHeight(BaseX+dis*math.cos(2*math.pi*(i/angle)),BaseY,BaseZ-dis*math.sin(2*math.pi*(i/angle)) )
			if math.abs(BaseY-tmpY) <=50 then
				CreateFlag( flag , Inc  , BaseX+dis*math.cos(2*math.pi*(i/angle)),tmpY,BaseZ-dis*math.sin(2*math.pi*(i/angle)),BaseDir  )		
				Inc = Inc + 1	
			end
		end 
		dis=dis+80
		angle=angle+4
	end
	Var_Z24Only_UseForCreatFlag = Inc
end
--初始劇情：掛在npc107069上
--在原地天空生出一隻npc
function lua_Z24NPC107069_1()
	local Obj = OwnerID()
	SetModeEx( Obj  , EM_SetModeType_Mark, false )
	SetModeEx( Obj  , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( Obj  , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( Obj  , EM_SetModeType_Fight, false )--砍殺
	SetModeEx( Obj  , EM_SetModeType_HideName, true )--名稱
	if ReadRoleValue( Obj,EM_RoleValue_PID ) ~= 0 then
		SetPlot( Obj,"range","lua_Z24NPC107069_2",30 )
		return
	end
	local ZoneID = ReadRoleValue(Obj,EM_RoleValue_ZoneID)
	local RoomID = ReadRoleValue(Obj,EM_RoleValue_RoomID)
	local NewObjID = 107068
	local x,y,z,dir = DW_Location( Obj )
	local monster = CreateObj( NewObjID, x, y+RandRange(100,130) , z, dir, 1 )	
		SetModeEx( monster  , EM_SetModeType_Searchenemy, false )--索敵
		SetModeEx( monster  , EM_SetModeType_Strikback, false )--反擊
		SetModeEx( monster , EM_SetModeType_AlignToSurface, false )--貼地
		SetModeEx( monster  ,EM_SetModeType_Save , true ) --儲存*
		SetModeEx( monster  , EM_SetModeType_ShowRoleHead, false )--頭像框
		SetModeEx( monster  ,EM_SetModeType_Gravity , false ) --重力*
		MoveToFlagEnabled ( monster,false )
		AddToPartition( monster,RoomID )
	WriteRoleValue( Obj,EM_RoleValue_PID,monster)
	WriteRoleValue( monster,EM_RoleValue_PID,Obj)
	SetPlot( Obj,"range","lua_Z24NPC107069_2",35 )	--範圍劇情
end
--範圍劇情，當有人經過就會從天掉下來
function lua_Z24NPC107069_2()
	local Player =OwnerID()
	local Obj = TargetID()
	local x,y,z,dir = DW_Location( Player )
	if ReadRoleValue( Player,EM_RoleValue_VOC ) == 0 then
--or	 CheckRelation( Obj,Player,EM_CheckRelationType_Attackable )==false then
		return
	end
--	AddBuff( Player,508560,0,2 )
	PlayMotion(Obj,ruFUSION_MIME_CAST_SP01)	--擊地板動作
	local monster = ReadRoleValue( Obj,EM_RoleValue_PID)
		CastSpell( monster,Player,850323)
		Sleep(1)
		SetPos( monster,x,y+50,z,dir )
		Sleep(1)
		SetPos( monster,x,y,z,dir )
	AddBuff( Player,622665,0,2 )		--倒地buff
	--	CastSpellPos( monster, x,y,z, Int MagicID, 40)
	CallPlot( monster,"lua_Z24NPC107069_3",Obj)		--跑一個自爆狀態
end
--掉下來自爆表演，刪掉
function lua_Z24NPC107069_3(Obj)
	local flame = 121129	--火焰
	local x,y,z,dir = DW_Location( OwnerID() )
	local fire = CreateObj( flame, x, y, z, dir, 1 )
		AddToPartition( fire,0 )
		SetModeEx( OwnerID()   , EM_SetModeType_Mark, false )--索敵
		SetModeEx( Obj  , EM_SetModeType_Fight, true )--砍殺
		SetStopAttack(OwnerID() ) 
		SysCastSpellLv( OwnerID(),OwnerID(),850461,1 )
		CallPlot( fire,"lua_Z24NPC121128_del",fire)	--火焰自刪
		WriteRoleValue( Obj,EM_RoleValue_PID,0)
		CallPlot( Obj,"LuaFunc_ResetObj",Obj)	--重生
	return
end
--火焰自刪
function lua_Z24NPC121128_del()
	Sleep(35)
	DelObj(OwnerID())
end
--怪物直死亡叫中控重生
function lua_Z24NPC107068_dead( )
	SetModeEx( OwnerID()  ,EM_SetModeType_Gravity , true ) 
	local Obj = ReadRoleValue( OwnerID(),EM_RoleValue_PID)
	WriteRoleValue( Obj,EM_RoleValue_PID,0)
	CallPlot( Obj,"LuaFunc_ResetObj",Obj)	--重生
end
--聯盟守衛陪你說話
function lua_Z24AllySFTalk2U()
	SetPlot(OwnerID(),"touch","lua_Z24AllySFTalk2U_2",30)
	SetCursorType( OwnerID() , eCursor_Speak) 
end
--聯盟守衛陪你說話_2
function lua_Z24AllySFTalk2U_2()
	local num = Rand(5)+1
	AdjustFaceDir( TargetID(),OwnerID(),0)
	NpcSay(TargetID(),"[SC_Z24ALLY_"..num.."]")
end
--山羊陪你說話
function lua_Z24GoatTalk2U()
	SetPlot(OwnerID(),"touch","lua_Z24GoatTalk2U_2",30)
	SetCursorType( OwnerID() , eCursor_Speak) 
end
--山羊陪你說話_2
function lua_Z24GoatTalk2U_2()
	local num = Rand(7)+1
	AdjustFaceDir( TargetID(),OwnerID(),0)
	NpcSay(TargetID(),"[SC_Z24GOATSAY_"..num.."]")
end
--z24小怪說垃圾話
function lua_Z24TrashTalking()
	local Org = ReadRoleValue(OwnerID(),EM_RoleValue_OrgID)
	local RanNum = Rand(3)+1
	if Org ==107419 then
		NpcSay( OwnerID(),"[SC_Z24FIGHTSAY_"..RanNum.."]" )
	elseif Org ==107420 then
		NpcSay( OwnerID(),"[SC_Z24ARCHERSAY_"..RanNum.."]" )
	end
end
--矮人守衛陪你說話
function lua_Z24DwarfTalk2U()
	SetPlot(OwnerID(),"touch","lua_Z24DwarfTalk2U_2",30)
	SetCursorType( OwnerID() , eCursor_Speak) 
end
--矮人守衛陪你說話_2
function lua_Z24DwarfTalk2U_2()
	local num = Rand(7)+1
	AdjustFaceDir( TargetID(),OwnerID(),0)
	NpcSay(TargetID(),"[SC_Z24DWARFSAY_"..num.."]")
end