--許願池的祝福對話
function Lua_ac1Level1Bless_A()
	LoadQuestOption(OwnerID());
	AddSpeakOption( OwnerID(), TargetID( ),"[SC_AC1_L1_BLESS_S01]", "Lua_ac1Level1Bless_B", 0 );		--S1-->D1
end
--b接a
function Lua_ac1Level1Bless_B()
	local var1=GetWorldVar( "Zone2_WorldPE_Money_1")
	local var2=GetWorldVar( "Zone2_WorldPE_Money_2")
	local var3=GetWorldVar( "Zone2_WorldPE_Money_3")
	SetSpeakDetail( OwnerID(), "[SC_AC1_L1_BLESS_D01][$SETVAR1="..var1.."][$SETVAR2="..var2.."][$SETVAR3="..var3.."]" );
	AddSpeakOption( OwnerID(), TargetID( ),"[SC_AC1_L1_BLESS_S02]", "Lua_ac1Level1Bless_C(1)", 0 );		--S2-->D2
	AddSpeakOption( OwnerID(), TargetID( ),"[SC_AC1_L1_BLESS_S03]", "Lua_ac1Level1Bless_C(2)", 0 );		--S3-->D3	
	AddSpeakOption( OwnerID(), TargetID( ),"[SC_AC1_L1_BLESS_S04]", "Lua_ac1Level1Bless_C(3)", 0 );		--S4-->D4
end
--選項c
function Lua_ac1Level1Bless_C(time)
	if time==1 then SetSpeakDetail( OwnerID(), "[SC_AC1_L1_BLESS_D02]" ) 
	elseif time==2 then SetSpeakDetail( OwnerID(), "[SC_AC1_L1_BLESS_D03]" )
	elseif time==3 then SetSpeakDetail( OwnerID(), "[SC_AC1_L1_BLESS_D04]" ) end
	AddSpeakOption( OwnerID(), TargetID( ),"[SC_AC1_L1_BLESS_S05]", "Lua_ac1Level1Bless_F1("..time..")",0 );	--S5-->D5
	AddSpeakOption( OwnerID(), TargetID( ),"[SC_AC1_L1_BLESS_S06]", "Lua_ac1Level1Bless_F2("..time..")",0 );	--S5-->D5
	AddSpeakOption( OwnerID(), TargetID( ),"[SC_AC1_L1_BLESS_S07]", "Lua_ac1Level1Bless_G", 0 );	--S6-->D6
end
--投水池
function Lua_ac1Level1Bless_F1(time)

	CloseSpeak(OwnerID());
	local numRand=Rand(12);
	if ReadRoleValue(OwnerID(),EM_RoleValue_Money)>=3000 then
		AddRoleValue ( OwnerID() , EM_RoleValue_Money , -3000 );
		Lua_Zone2_WorldPE_PayMoney(time,3000);
		CastSpell(OwnerID(),TargetID(),499241)
		AddBuff(OwnerID(),622131+numRand,0,1800);
		ScriptMessage(  TargetID(),OwnerID(),0,"[SC_AC1_L1_BLESS_M05]",0 );	
--		CallPlot(OwnerID(),"Lua_ac1Level1Bless_H",OwnerID())
		--ScriptMessage( TargetID(),OwnerID(),2, "[SC_AC1_L1_BLESS_M01]",0);
			if CheckQuest( OwnerID(), 425162 , 0 ) or 
			 CheckQuest( OwnerID(), 425163 , 0 ) or
			 CheckQuest( OwnerID(), 425164 , 0 ) or
			 CheckQuest( OwnerID(), 425165 , 0 )  then
				SetFlag(OwnerID(),546167,1)
			end
			if CheckQuest( OwnerID(), 425171 , 0 ) and CheckFlag(OwnerID(),546164)==false then
				SetFlag(OwnerID(),546164,1)
			elseif CheckQuest( OwnerID(), 425172 , 0 ) and CheckFlag(OwnerID(),546164)==false then
				SetFlag(OwnerID(),546166,1)
			elseif CheckQuest( OwnerID(), 425173 , 0 ) and CheckFlag(OwnerID(),546164)==false then
				SetFlag(OwnerID(),546210,1)
			end
	else
		ScriptMessage(  TargetID(),OwnerID(),0,"[SC_AC1_L1_BLESS_M06]",0 );	
	end
end
function Lua_ac1Level1Bless_F2(time)
	CloseSpeak(OwnerID());
	local numRand=Rand(12);
	if ReadRoleValue(OwnerID(),EM_RoleValue_Money)>=30000 then
		AddRoleValue ( OwnerID() , EM_RoleValue_Money , -30000 );
		Lua_Zone2_WorldPE_PayMoney(time,30000);
		CastSpell(OwnerID(),TargetID(),499241)
		AddBuff(OwnerID(),622131+numRand,0,7200);
		ScriptMessage(  TargetID(),OwnerID(),0,"[SC_AC1_L1_BLESS_M05]",0 );	
--		CallPlot(OwnerID(),"Lua_ac1Level1Bless_H",OwnerID())
		--ScriptMessage( TargetID(),OwnerID(),2, "[SC_AC1_L1_BLESS_M01]",0);
			if CheckQuest( OwnerID(), 425162 , 0 ) or 
			 CheckQuest( OwnerID(), 425163 , 0 ) or
			 CheckQuest( OwnerID(), 425164 , 0 ) or
			 CheckQuest( OwnerID(), 425165 , 0 )  then
				SetFlag(OwnerID(),546167,1)
			end
			if CheckQuest( OwnerID(), 425171 , 0 ) and CheckFlag(OwnerID(),546164)==false then
				SetFlag(OwnerID(),546164,1)
			elseif CheckQuest( OwnerID(), 425172 , 0 ) and CheckFlag(OwnerID(),546164)==false then
				SetFlag(OwnerID(),546166,1)
			elseif CheckQuest( OwnerID(), 425173 , 0 ) and CheckFlag(OwnerID(),546164)==false then
				SetFlag(OwnerID(),546210,1)
			end
	else
		ScriptMessage(  TargetID(),OwnerID(),0,"[SC_AC1_L1_BLESS_M06]",0 );	
	end
end
function Lua_ac1Level1Bless_G()
	ScriptMessage(TargetID(),OwnerID(),2,"[SC_AC1_L1_BLESS_M04]",0)
	CloseSpeak(OwnerID());
end

--每當有人投錢就跑判斷
function Lua_ac1Level1Bless_H()
	local kkk= GetWorldVar( "Zone2_WorldPE_Money_0")
	local total=0
	for i=1, #Zone2_WorldPE_Buff do
		 total = total + GetWorldVar( "Zone2_WorldPE_Money_"..i )--設定金錢
	end
	if total >=67000000 and GetWorldVar( "Zone2_WorldPE_Money_0")==0 then
		SetWorldVar( "Zone2_WorldPE_Money_0", 1 )
		Lua_Zone2_WorldPE_SetBuff()
	elseif total >=134000000 and GetWorldVar( "Zone2_WorldPE_Money_0")==1 then
		SetWorldVar( "Zone2_WorldPE_Money_0", 2 )
		Lua_Zone2_WorldPE_SetBuff()
	end
end

--測試用，可直接設定某一項的金額
function WorldAC_Bless1(money)
	SetWorldVar( "Zone2_WorldPE_Money_1", money )--設定金錢(固定跳錢)
end
function WorldAC_Bless2(money)
	SetWorldVar( "Zone2_WorldPE_Money_2", money )--設定金錢(固定跳錢)
end
function WorldAC_Bless3(money)
	SetWorldVar( "Zone2_WorldPE_Money_3", money )--設定金錢(固定跳錢)
end

--測試隨機buff指令
function AC1testRandbuff()
	local numRand=Rand(12);
	AddBuff(OwnerID(),622131+numRand,0,1800);
end

--兩個buff
--一個集合
function ACcheckBuffEvery60s()
	local Phase = GetWorldVar( "Zone2_WorldPE_Phase");
	--DebugMsg(0,0,"the buff60s one time")
	if Phase==1 or Phase==5 then
		local Systime= GetSystime(0)
		local recordtime=GetWorldVar("Zone2_WorldPE_CtrlBuffTime")
		local buff=GetWorldVar("Zone2_WorldPE_SelectBuffID")
		if Systime >= recordtime then 
			return
		elseif CheckBuff( OwnerID(),buff ) then
			return
		else	
			Systime = recordtime - Systime
			AddBuff( OwnerID() , buff , 0 , Systime )
		end	
	else
		CancelBuff( OwnerID() , 622224 )
		return
	end
end

