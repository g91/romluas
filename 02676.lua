--水之妖精初始劇情
function lua_z23npc120845_ini()
	SetPlot(OwnerID(),"touch","",0)
end
--水之妖精對話劇情
function lua_z23npc120845_talk()
	LoadQuestOption(OwnerID())
	AddSpeakOption(OwnerID(), TargetID( ), GetString("test"), "lua_z23npc120845_01", 0 )
end
function lua_z23npc120845_01()
	if	DelBodyItem(OwnerID(),241307,1) then
		CallPlot(TargetID(),"lua_z23npc120845_02",TargetID());
		CloseSpeak(OwnerID());
	else
		DebugMsg(0,0,"close")
		CloseSpeak(OwnerID());
	end
end
function lua_z23npc120845_02()
	SetPlot(OwnerID(),"touch","lua_z23npc120845_touch",25)
	for i=0,30 do Sleep(10); Say(OwnerID(),i); end
	CallPlot( OwnerID(), "LuaFunc_ResetObj", OwnerID() )
end
function lua_z23npc120845_touch()
	local O_ID = OwnerID() 	-- 玩家
	local T_ID = TargetID()  	-- NPC
	DW_CancelTypeBuff(68,O_ID)	--下馬
		if 	BeginCastBarEvent( O_ID, T_ID,"[SC_421029_2]", 50, 131, 133, 0, "lua_z23npc120845_t1" ) ~= 1 then
				ScriptMessage( O_ID, O_ID, 0,"[SAY_NPC_BUSY]", 0 );		--目標忙碌中
				ScriptMessage( O_ID, O_ID, 2,"[SAY_NPC_BUSY]", 0 );		--目標忙碌中
		end
end
function lua_z23npc120845_t1(ObjID, CheckStatus)
	local O_ID = OwnerID() 	-- 玩家
	local T_ID = TargetID()  	-- NPC
	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			EndCastBar( O_ID, CheckStatus )
			GiveBodyItem( O_ID, 241295, 1 )		
			CallPlot(T_ID,"LuaFunc_ResetObj",T_ID)
		else
			EndCastBar( O_ID, CheckStatus )
		end
	end
end	

function luaT120713_01()	--與卡爾沛斯．沃克對話01
	AdjustFaceDir(TargetID(),OwnerID(),0)
	local Cd={};
	 Cd[1] = CheckCompletequest( OwnerID(),425427 )	--是否完成主線任務
	 Cd[2] = CheckAcceptQuest( OwnerID(),425443 )	--
		if Cd[2] then
			LoadQuestOption(OwnerID())	
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_425443_1"), "luaT120713_02", 0 );
		else
			LoadQuestOption(OwnerID())		
		end
end
function luaT120713_02()	--與卡爾沛斯．沃克對話02
	if CountBodyItem( OwnerID(),241301 )>=1 then
		SetSpeakDetail( OwnerID(), "[SC_425443_2]" ); 
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_425443_3"), "luaT120713_03", 0 );
	else
		SetSpeakDetail( OwnerID(), "[SC_425443_6]" ); 
	end
end
function luaT120713_03()
	ScriptMessage( TargetID(),OwnerID(),0,"[SC_425443_4]","0xffffffff" )
	SetFlag( OwnerID(),546495,1 )
	CloseSpeak( OwnerID())
end
--初始動作為施法動作
function lua_z23npc120474_ini()
	CastSpell(OwnerID(),OwnerID(),499378)
	SetDefIdleMotion( OwnerID(), ruFUSION_MIME_CAST_LOOP )
end
--任務用
function lua_z23npc120474_a()
	AddSpeakOption( OwnerID(),TargetID(),"[SC_424094_1]","lua_z23npc120474_b",0);
end
function lua_z23npc120474_b()
	CloseSpeak(OwnerID())
end

function lua_TalkandTurnUniversal()
	LoadQuestOption(OwnerID())
	AdjustFaceDir(TargetID(),OwnerID(),0)
	PlayMotion( TargetID(), 112) 
end

function lua_z23q425428_talk() --毒龍薩瓦對話
	LoadQuestOption(OwnerID())
	if ReadRoleValue(TargetID(),EM_RoleValue_Register)==0 and
		CheckBuff( OwnerID(),622611 )==false then
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_423617_5"), "lua_z23q425428_t01", 0 )
	end
end
function lua_z23q425428_t01() 
	CloseSpeak( OwnerID() )
	WriteRoleValue( TargetID(),EM_RoleValue_Register,1 )
	local Poison = Lua_DW_CreateObj( "flag" , 101232 , 780871 , 6 , 1 , 1 )
	WriteRoleValue( Poison,EM_RoleValue_Register,TargetID() )
	ScriptMessage( TargetID(),0,1,"[SC_Z23425428_1]",0)
	SetAttack(Poison,OwnerID())
end
function lua_z23q425428_END()
	local obj=ReadRoleValue( OwnerID(),EM_RoleValue_Register )
	WriteRoleValue( obj , EM_RoleValue_Register , 0 )
	if ReadRoleValue(OwnerID(),EM_RoleValue_IsDead)==0 then
		DelObj(OwnerID())
	end
end

function lua_z23q425428_DEAD()
	local Rang=SearchRangePlayer(OwnerID(),200)
		for i=0,#Rang do AddBuff( Rang[i],622611,10,60 ) --say(OwnerID(),Rang[i]) 
		end
	local obj=ReadRoleValue( OwnerID(),EM_RoleValue_Register )
	WriteRoleValue( obj , EM_RoleValue_Register , 0 )
end

function lua_z23q425428_Complete()
	ScriptMessage( OwnerID(),TargetID(),1,"[SC_206589_5]",0)
	PlayMotion(TargetID(),9)
	AddBuff( TargetID(),506098,0,3 )
	SetPosByFlag( TargetID(),780871,7 )
	CancelBuff( TargetID(),622611 )
end
--任務425440，讓團隊成員也殺死這隻怪。
function lua_z23q425440deadElement()
	local num=GetPartyID( TargetID(), -1 )
	if num==0 then	--隊伍不存在
		DW_QietKillOne(1,101238)
	else
		for i=1,num do
			local menber =GetPartyID( TargetID(), i )
			if menber~=nil then
				if CheckDistance( OwnerID(), menber, 500 ) then
					DW_QietKillOne(menber,101238)
				end
			end
		end
	end
	return true
end

--任務425443，向老皮拿銀絲線
function lua_z23Q425443talktoBeaver_1()
	LoadQuestOption(OwnerID());
	AdjustFaceDir(TargetID(),OwnerID(),0)
	PlayMotion( TargetID(), 112) 
	if CheckAcceptQuest(OwnerID(),425443) then
		AddSpeakOption( OwnerID(),TargetID(),"[SC_Z23Q425443_01]","lua_z23Q425443talktoBeaver_2",0)
	end
	if CheckCompleteQuest( OwnerID(),425442 ) and CheckFlag( OwnerID(),546495 ) and CountBodyItem( OwnerID(),241301 )<2 then
		AddSpeakOption( OwnerID(),TargetID(),"[SC_Z23Q425443_05]","lua_z23Q425443talktoBeaver_5",0)
	end
end
function lua_z23Q425443talktoBeaver_2()
	SetSpeakDetail( OwnerID(),"[SC_Z23Q425443_02]" )
	if CheckFlag( OwnerID(),546495 ) then
		AddSpeakOption( OwnerID(),TargetID(),"[SC_Z23Q425443_01]","lua_z23Q425443talktoBeaver_3",0 )
	else
		AddSpeakOption( OwnerID(),TargetID(),"[SC_Z23Q425443_01]","lua_z23Q425443talktoBeaver_4",0 )
	end
end
function lua_z23Q425443talktoBeaver_3()
	SetSpeakDetail( OwnerID(),"[SC_Z23Q425443_03]" )
	if CountBodyItem( OwnerID(),241301 )<2 then
		AddSpeakOption( OwnerID(),TargetID(),"[SC_Z23Q425443_05]","lua_z23Q425443talktoBeaver_5",0)
	end
end
function lua_z23Q425443talktoBeaver_4()
	SetSpeakDetail( OwnerID(),"[SC_Z23Q425443_04]" )
	GiveBodyItem( OwnerID(),241301,2 )
	SetFlag( OwnerID(),546495,1 )
end
function lua_z23Q425443talktoBeaver_5()
	SetSpeakDetail( OwnerID(),"[SC_Z23Q425443_06]" )
	AddSpeakOption( OwnerID(),TargetID(),"[SC_Z23Q425443_07]","lua_z23Q425443talktoBeaver_6",0)
end
function lua_z23Q425443talktoBeaver_6()
	if ReadRoleValue ( OwnerID() , EM_RoleValue_Money )>=10000 then
		AddRoleValue ( OwnerID() , EM_RoleValue_Money , -10000 ) 
		GiveBodyItem( OwnerID(),241301,2 )
	else
		ScriptMessage(OwnerID(),OwnerID(),1,"[SAY_MOUTH_ERROR_A]",0)
	end
	CloseSpeak( OwnerID() )
end
--任務425444，獲得祝福之環
function lua_z23Q425444SiawaseRing_1()
	AdjustFaceDir(TargetID(),OwnerID(),0)
	if CheckAcceptQuest( OwnerID(),425444 ) and CountBodyItem( OwnerID(),241308 ) == 0 then	--假如沒幸環
		SetSpeakDetail( OwnerID(),"[SC_Z23Q425444_01]" )
		if CountBodyItem(  OwnerID(),241301 )~=0 then						--假如有銀絲線
			AddSpeakOption( OwnerID(),TargetID(),"[SC_Z23Q425444_02]","lua_z23Q425444SiawaseRing_2(1)",0 )
			AddSpeakOption( OwnerID(),TargetID(),"[SC_Z23Q425444_03]","lua_z23Q425444SiawaseRing_2(2)",0 )
		end
		if CountBodyItem( OwnerID(),241294 )>=1 and CountBodyItem( OwnerID(),241295 )>=1 then	--假如有兩種絲線
			AddSpeakOption( OwnerID(),TargetID(),"[SC_Z23Q425444_04]","lua_z23Q425444SiawaseRing_3",0 )
		end
	else
		LoadQuestOption(OwnerID())
	end
end
function lua_z23Q425444SiawaseRing_2(num)
	CloseSpeak( OwnerID() )
	local item=CountBodyItem( OwnerID(),241301 )
	if item>=2 then
		if  num==1 and DelBodyItem( OwnerID(),241301,item ) then
			GiveBodyItem( OwnerID(),241294,item )
			CastSpell( TargetID(),TargetID(),499378 )
		elseif num==2 and DelBodyItem( OwnerID(),241301,item ) then
			GiveBodyItem( OwnerID(),241295,item )
			CastSpell( TargetID(),TargetID(),499378 )
		else
			return
		end
	else
		SAY( TargetID(),"[SC_Z23Q425444_05]" )
		return
	end
end
function lua_z23Q425444SiawaseRing_3()
	CloseSpeak( OwnerID() )
	local item1 = CountBodyItem( OwnerID(),241294 )
	local item2 = CountBodyItem( OwnerID(),241295 )
		CastSpell( TargetID(),TargetID(),499378 )
		DelBodyItem( OwnerID(),241294,1 )
		DelBodyItem( OwnerID(),241295,1 )
		GiveBodyItem( OwnerID(),241308,1 )
end
--任務完成後關掉這個旗標
function lua_Q425444_OnComplete()
	SetFlag(TargetID(),546495,0)
end

--營地中拿紙，1、2、4、7
function Lua_z23N120840_touche()
		SetPlot( OwnerID(),"touch","Lua_z23N120840_1",40 );
end
function Lua_z23N120840_1()
	local O_ID = OwnerID() 	-- 玩家
	local T_ID = TargetID()  	-- NPC
	CallPlot(O_ID,"Lua_z23N120840_2",O_ID,T_ID);
end

function Lua_z23N120840_2(O_ID,T_ID)
	DW_CancelTypeBuff(68,O_ID)	--下馬
		if 	BeginCastBarEvent( O_ID, T_ID,"[SC_USEOBJ_02]", 20, 131, 133, 0, "Lua_z23N120840_3" ) ~= 1 then
				ScriptMessage( O_ID, O_ID, 0,"[SAY_NPC_BUSY]", 0 );		--目標忙碌中
				ScriptMessage( O_ID, O_ID, 2,"[SAY_NPC_BUSY]", 0 );		--目標忙碌中
		end
end
function Lua_z23N120840_3(ObjID, CheckStatus)
	local O_ID = OwnerID() 	-- 玩家
	local T_ID = TargetID()  	-- NPC
	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			EndCastBar( O_ID, CheckStatus )
			CallPlot(O_ID,"lua_z23Q425436CheckPage",T_ID)
		else
			EndCastBar( O_ID, CheckStatus )
		end
	end
end
--營地中拿紙，1、2、4、7
function lua_z23Q425436CheckPage(T_ID)
	local PID=ReadRoleValue( T_ID , EM_RoleValue_PID )
	local num=CountBodyItem( OwnerID(),241292 )
	local PlayR=ReadRoleValue( OwnerID(),EM_RoleValue_Register10 )
		if num==0 then
			CallPlot( OwnerID(),"lua_z23Q425436_check",PlayR,PID )
			return
		elseif num==1 then
			if PID==PlayR then
				CallPlot( OwnerID(),"lua_z23Q425436_deny",OwnerID())
				return
			else
				CallPlot( OwnerID(),"lua_z23Q425436_check",PlayR,PID )
				return
			end
		elseif num==2 then
			local Score=PID+PlayR
			if PlayR==6 and PID==4 then
				CallPlot( OwnerID(),"lua_z23Q425436_deny",OwnerID())
				return
			elseif Score ==7 or Score==10 or Score==12 or Score==13 then
				CallPlot( OwnerID(),"lua_z23Q425436_check",PlayR,PID )
				return
			else
				CallPlot( OwnerID(),"lua_z23Q425436_deny",OwnerID())
				return
			end				
		elseif num==3 then
			local Score=PID+PlayR
			if Score==14 then
				CallPlot( OwnerID(),"lua_z23Q425436_check",PlayR,PID )
				return
			else
				CallPlot( OwnerID(),"lua_z23Q425436_deny",OwnerID())
				return
			end
		else
			WriteRoleValue( OwnerID(),EM_RoleValue_Register10,0 )
			ScriptMessage( T_ID,OwnerID(),2,"[SC_Z23Q425436_1]",0 )
		end
end
function lua_z23Q425436_check(PlayR,PID)
	GiveBodyItem(OwnerID(),241292,1)
	WriteRoleValue( OwnerID(),EM_RoleValue_Register10,PlayR+PID )
	--Say(OwnerID(),ReadRoleValue(OwnerID(),EM_RoleValue_Register10))
	return
end
function lua_z23Q425436_deny()
	DebugMsg(0,0,"YouAllreadyHave!")
	--你已經擁有相同的東西了。
	ScriptMessage( OwnerID(),OwnerID(),2,"[SC_Z23Q425436_2]",0 )
	return
end
--接還任務時初始化值
function lua_z23Q425436_iniR()
	WriteRoleValue( TargetID(),EM_RoleValue_Register10,0 )
	WriteRoleValue( OwnerID(),EM_RoleValue_Register10,0 )
	--Say(TargetID(),ReadRoleValue(TargetID(),EM_RoleValue_Register10))
end
function lua_oneofidle()
	PlayMotion(OwnerID(),121)
end

--z23點擊物品209472，接取任務425363
function lua_z23I209472_Open()
	DW_Border(425363)
end

--任務425353，填模版點擊物品後觸發
function Lua_z23Q425353_OnClickObjBegin()
	--判斷有沒有物品
	if	CountBodyItem(OwnerID(),209468) < 1	then
		local ID = 209468
		local name = "["..ID.."]"
		local Str = "[SC_SYS_0][$SETVAR1="..name.."]"	
		ScriptMessage( OwnerID(), OwnerID(), 1, Str , 0 );	
		return false
	end
	return true
end
function Lua_z23Q425353_OnClickObjEnd()
	DelBodyItem( OwnerID(),209468,1)
	DW_QietKillOne( OwnerID(),106739 )
	BeginPlot( TargetID(),"Lua_z23Q425353_0",0)
	return 1
end
function Lua_z23Q425353_0()
	local GoodTree = Lua_DW_CreateObj("obj",112872,OwnerID()) -- 建個靚樹
	DisableQuest( OwnerID() , true ) 
	SetModeEx( GoodTree,EM_SetModeType_Mark, false )
	AddBuff( GoodTree,623077,1,30 )
	Sleep(300)
	DelObj(GoodTree)
	DisableQuest( OwnerID() , false ) 
end
--z23任務425354，對目標使用物品，使用前判定。
function lua_z23I209469_CheckUseScript()
	local T_ID=ReadRoleValue( TargetID(),EM_RoleValue_OrgID)
	local MaxHP = ReadRoleValue( TargetID() , EM_RoleValue_MaxHP )
	local HP=ReadRoleValue( TargetID() , EM_RoleValue_HP )
	if T_ID==106867 and HP~=MaxHP then
		return true
	else
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SYS_CASTSPELL_TARGET_ERROR]" , 0 );
		return false
	end
end

	
--425439 咬碎的信件
function Lua_Z23Q425439_1() 
	ClearBorder( OwnerID() );
	AddBorderPage( OwnerID(), GetQuestDetail( 425439, 1  ) );
	ShowBorder( OwnerID(), 425439, "[425439]", "ScriptBorder_Texture_Paper" );
end
--死亡會噴信件，掛在蛇尾雞的死亡劇情上
function Lua_Z23Q425439_GetM()
	local hateNum=HateListCount( OwnerID() )
	local tagObj=0
	for i=0,hateNum do
		tagObj = HateListInfo(OwnerID() , i , EM_HateListInfoType_GItemID)
		if CheckCompleteQuest( tagObj,425437 ) and CheckCompleteQuest( tagObj,425439 )==false then
			GiveBodyItem( tagObj,209511,1 )
		end
	end
end
--龍的死亡劇情，太強~會被撞到地上
function lua_z23_Q106795DeadDrama()
	SetModeEx( OwnerID() , EM_SetModeType_Gravity , true) 
end
--龍的初始劇情。
function lua_z23_NPC106795InitDrama()
	SetModeEx( OwnerID()  , EM_SetModeType_Mark, true )--標記
	SetModeEx( OwnerID()  , EM_SetModeType_Searchenemy, true )--索敵
	SetModeEx( OwnerID()  , EM_SetModeType_Fight , true )--可砍殺攻擊
	SetModeEx( OwnerID()  , EM_SetModeType_Strikback, true )--反擊
	SetModeEx( OwnerID() , EM_SetModeType_Gravity , false) 
	SetModeEx( OwnerID() , EM_SetModeType_Mark , true) 
	Cl_ZoneMonster_RandBuff()
end