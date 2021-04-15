--423295德銳克的行蹤--423301安格爾的問題

function LuaS_423295_0()							--掛在吉喀喀‧蠍腿下
LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest( OwnerID() ,423295 ) == true then
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_423295_3]" , "LuaS_423295_01", 0 )
	end
	if  CheckAcceptQuest( OwnerID() ,423301 ) == true then
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_423301_3]" , "LuaS_423301_01", 0 )
	end
end

function LuaS_423295_01()
	SetSpeakDetail(OwnerID(),"[SC_423295_0]")	
	SetFlag(OwnerID(),544181,1)
	if CheckFlag( OwnerID(), 544181 ) and CheckFlag( OwnerID(), 544182 ) and CheckFlag( OwnerID(), 544183 ) then
		SetFlag(OwnerID(),544180,1)
	end
end

function LuaS_423301_01()
	SetSpeakDetail(OwnerID(),"[SC_423301_0]")	
	SetFlag(OwnerID(),544186,1)
	if CheckFlag( OwnerID(), 544186 ) and CheckFlag( OwnerID(), 544187 ) and CheckFlag( OwnerID(), 544188 ) then
		SetFlag(OwnerID(),544185,1)
	end
end

function LuaS_423295_1()							--多多羅‧蛞蝓
LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest( OwnerID() ,423295 ) == true then
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_423295_3]" , "LuaS_423295_02", 0 )
	end	
	if  CheckAcceptQuest( OwnerID() ,423301 ) == true then
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_423301_3]" , "LuaS_423301_02", 0 )
	end
end

function LuaS_423295_02()
	SetSpeakDetail(OwnerID(),"[SC_423295_1]")	
	SetFlag(OwnerID(),544182,1)
	if CheckFlag( OwnerID(), 544181 ) and CheckFlag( OwnerID(), 544182 ) and CheckFlag( OwnerID(), 544183 ) then
		SetFlag(OwnerID(),544180,1)
	end
end

function LuaS_423301_02()
	SetSpeakDetail(OwnerID(),"[SC_423301_1]")	
	SetFlag(OwnerID(),544187,1)
	if CheckFlag( OwnerID(), 544187 ) and CheckFlag( OwnerID(), 544187 ) and CheckFlag( OwnerID(), 544188 ) then
		SetFlag(OwnerID(),544185,1)
	end
end

function LuaS_423295_2()							--札札克‧蛛爪
LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest( OwnerID() ,423295 ) == true then
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_423295_3]" , "LuaS_423295_03", 0 )
	end	
	if  CheckAcceptQuest( OwnerID() ,423301 ) == true then
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_423301_3]" , "LuaS_423301_03", 0 )
	end
end
function LuaS_423295_03()
	SetSpeakDetail(OwnerID(),"[SC_423295_2]")	
	SetFlag(OwnerID(),544183,1)
	if CheckFlag( OwnerID(), 544181 ) and CheckFlag( OwnerID(), 544182 ) and CheckFlag( OwnerID(), 544183 ) then
		SetFlag(OwnerID(),544180,1)
	end
end
function LuaS_423301_03()
	SetSpeakDetail(OwnerID(),"[SC_423301_2]")	
	SetFlag(OwnerID(),544188,1)
	if CheckFlag( OwnerID(), 544188 ) and CheckFlag( OwnerID(), 544187 ) and CheckFlag( OwnerID(), 544188 ) then
		SetFlag(OwnerID(),544185,1)
	end
end
----------423304大獵手的告誡-----------
function LuaS_423304_5()		--掛在任務423304 接受任務後執行的LUA欄
	if CheckAcceptQuest( TargetID() ,423304 ) == true	then
		ScriptMessage( TargetID(), TargetID()  , 0 , "[SC_423304_0]" ,  "0xFFFFFF00" ) 	--蓋上大獵手之印
		ScriptMessage( TargetID()  , TargetID()  , 1 , "[SC_423304_0]" ,  "0xFFFFFF00" ) 
	end
end

function LuaS_423304()		--掛在115590落寞的安格爾戰士
LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest( OwnerID() ,423304 ) == true	then 
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_423304_8]" , "LuaS_423304_0", 0 )	
	end
end

function LuaS_423304_0()
	SetSpeakDetail(OwnerID(),"[SC_423304_1]")
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_423304_2]" , "LuaS_423304_1", 0 )	
end

function LuaS_423304_1()
	SetSpeakDetail(OwnerID(),"[SC_423304_3]")		
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_423304_4]" , "LuaS_423304_2", 0 )	
end

function LuaS_423304_2()
	SetSpeakDetail(OwnerID(),"[SC_423304_5]")		
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_423304_6]" , "LuaS_423304_3", 0 )	
end

function LuaS_423304_3()
	SetSpeakDetail(OwnerID(),"[SC_423304_7]")		
	SetFlag(OwnerID() , 544191 , 1 )
end
---------423306大自然的腐蝕-------------
function LuaS_423306()			--掛在115597任務NPC的物品下
	SetPlot( OwnerID(), "range","LuaS_423306_1", 200 )
end

function LuaS_423306_1()--  OwnerID是玩家  演出劇情不可在玩家身上執行
	if	CheckAcceptQuest( OwnerID() ,423306 ) == true	then
		--SetFlag(OwnerID() , 544192 , 1 )	--玩家變成TargetID()
		BeginPlot( TargetID(), "LuaS_423306_2", 1 )
	end	
end

function LuaS_423306_2()
	SetFlag(TargetID() , 544192 , 1 )	--玩家變成TargetID()
end


-----------423307酋長與大獵手的爭執------------

--780661-拉夏娜旗子  780662-湯尼旗子  780663-伊崔妮旗子

function LuaS_423307_1_1()	
	CloseSpeak(OwnerID())
	BeginPlot(TargetID(),"LuaS_423307",0)
end
function LuaS_423307_false()
	SetSpeakDetail(OwnerID(),"[SC_423307_8]")			---靜候消息，酋長現在不在。
end
function LuaS_423307()					
	WriteRoleValue(OwnerID(),EM_RoleValue_Register +1,1)	
	AddBuff( TargetID()  , 503977 , 1 , 300 ) 	--棟住玩家
	local ch = LuaFunc_CreateObjByObj ( 115681 , OwnerID() ) --漢奇赫假人
	CallPlot(OwnerID(),"LuaS_Check_noquest_single",1,1,423307,503977,TargetID(),ch,100)--失去任務則中斷劇情並刪除玩家BUFF
	DisableQuest( ch, true )		--使漢奇赫無法開啟式窗
	local LCL = Lua_DW_CreateObj("flag" ,115593,780661,1)	--將115593物件在780661的第一根旗子上種出來 並宣告為LCL
	DisableQuest( LCL, true )		--使LCL無法開啟式窗
	Sleep(20)
	WriteRoleValue(LCL, EM_RoleValue_IsWalk, 1)		--改變角色數值 使其以下移動方式皆為走路
	Sleep(10)
	if 	CheckID(TargetID()) == false	or	CheckBuff( TargetID() , 503977 ) == false	 then	--確認玩家不在或沒有BUFF則刪除演員
		delobj(ch)
		delobj(LCL)
		delobj(icl)
		delobj(tony)
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )			--並讓漢奇赫不忙
		return 
	end
	local tony = Lua_DW_CreateObj("flag" ,115679,780662,1)	--將115679物件在780662的第一根旗子上種出來 並宣告為tony
	DisableQuest( tony, true )		--使tony無法開啟式窗
	local icl = Lua_DW_CreateObj("flag" ,115680,780663,1)	--將115680物件在780663的第一根旗子上種出來 並宣告為icl
	DisableQuest( icl, true )		--使icl無法開啟式窗	
	if 	CheckID(TargetID()) == false	or	CheckBuff( TargetID() , 503977 ) == false	 then	--確認玩家不在或沒有BUFF則刪除演員
		delobj(ch)
		delobj(LCL)
		delobj(icl)
		delobj(tony)
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )			--並讓漢奇赫不忙
		return 
	end
	CallPlot( tony, "LuaS_423307_1", tony,LCL )		--使漢奇赫呼叫Script  LuaS_423307_1
	CallPlot( icl, "LuaS_423307_2", icl,LCL )			--使漢奇赫呼叫Script  LuaS_423307_2
	Sleep(10)
	DW_MoveToFlag(LCL,780661 , 2 ,0 ,1)		--使LCL走到780600的第二根旗子
	Sleep(10)
	if 	CheckID(TargetID()) == false	or	CheckBuff( TargetID() , 503977 ) == false	 then	--確認玩家不在或沒有BUFF則刪除演員
		delobj(ch)
		delobj(LCL)
		delobj(icl)
		delobj(tony)
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )			--並讓漢奇赫不忙
		return 
	end
	AdjustFaceDir ( LCL, ch ,0 )		--使拉夏娜面對漢奇赫
	Sleep(10)
	PlayMotion( LCL ,ruFUSION_ACTORSTATE_EMOTE_POINT)	--使拉夏娜指著漢奇赫
	Say(LCL,"[SC_423307_0]")
	Sleep(30)
	ScriptMessage( TargetID(), TargetID()  , 0 , "[SC_423307_1]" ,  "0xFFFFFF00" ) 	
	ScriptMessage( TargetID()  , TargetID () , 1 , "[SC_423307_1]" ,  "0xFFFFFF00" ) 
	Sleep(30)
	if 	CheckID(TargetID()) == false	or	CheckBuff( TargetID() , 503977 ) == false	 then
		delobj(ch)
		delobj(LCL)
		delobj(icl)
		delobj(tony)
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )	
		return 
	end
	say(ch , "[SC_423307_2]" )		--他是被選中的人
	Sleep(40)
	say(LCL , "[SC_423307_3]" )		--你讓我如何相信一個恩古達?
	PlayMotion( LCL ,ruFUSION_ACTORSTATE_SHIELD_BLOCK)
	Sleep(30)
	say(LCL , "[SC_423307_3_1]" )		--你讓我如何相信一個恩古達?
	Sleep(30)
	if 	CheckID(TargetID()) == false	or	CheckBuff( TargetID() , 503977 ) == false	 then	--確認玩家不在或沒有BUFF則刪除演員
		delobj(ch)
		delobj(LCL)
		delobj(icl)
		delobj(tony)
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )			--並讓漢奇赫不忙
		return 
	end
	say(ch ,"[SC_423307_4]" )			--我知道
	PlayMotion( ch ,ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)
	Sleep(50)
	say(LCL , "[SC_423307_5]" )		--別說了
	PlayMotion( LCL ,ruFUSION_ACTORSTATE_ATTACK_OH)
	Sleep(20)
	if 	CheckID(TargetID()) == false	or	CheckBuff( TargetID() , 503977 ) == false	 then
			delobj(ch)
			delobj(LCL)
			delobj(icl)
			delobj(tony)
			WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )	
			return 
	end
	DW_MoveToFlag(LCL,780661 , 3 ,0 ,1)	--使LCL走到780600的第3根旗子
	delobj(LCL)
	Tell(TargetID(),tony,"[SC_423307_6]" )	--湯尼悄悄告訴玩家
	CallPlot( tony, "LuaS_423307_3" )		--使漢奇赫呼叫Script  LuaS_423307_1
	CallPlot( icl, "LuaS_423307_4")			--使漢奇赫呼叫Script  LuaS_423307_2
	if 	CheckID(TargetID()) == false	or	CheckBuff( TargetID() , 503977 ) == false	 then	--確認玩家不在或沒有BUFF則刪除演員
		delobj(ch)
		delobj(LCL)
		delobj(icl)
		delobj(tony)
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )			--並讓漢奇赫不忙
		return 
	end
	Sleep(60)
	delobj(tony)
	delobj(icl)
	delobj(ch)
	SetFlag(TargetID() , 544193 , 1 )
	DisableQuest( OwnerID(), false )	--讓漢奇赫可以再次開啟視窗
	CancelBuff( TargetID()  , 503977  ) 	--還玩家自由
	WriteRoleValue(OwnerID(),EM_RoleValue_Register +1,0)
end


function LuaS_423307_1(tony,LCL)                      
	Sleep(20)
	WriteRoleValue(tony, EM_RoleValue_IsWalk, 1)		--改變角色數值 使其以下移動方式皆為走路
	Sleep(20)
	DW_MoveToFlag(tony,780662 , 2 ,0 ,1)		--使tony走到780600的第二根旗子
	Sleep(20)
	AdjustFaceDir ( tony, LCL ,0 )			--使湯尼面對拉夏娜	
end

function LuaS_423307_2(icl,LCL)
Sleep(20)
	WriteRoleValue(icl, EM_RoleValue_IsWalk, 1)			--改變角色數值 使其以下移動方式皆為走路
	Sleep(20)
	DW_MoveToFlag(icl,780663 , 2 ,0 ,1)		--使ich走到780600的第二根旗子
	Sleep(20)
	AdjustFaceDir ( icl, LCL ,0 )			--使依崔妮面對拉夏娜	
end
function LuaS_423307_3()    
	--Sleep(20)                  
	WriteRoleValue(OwnerID(), EM_RoleValue_IsWalk, 1)		--改變角色數值 使其以下移動方式皆為走路
	Sleep(20)
	DW_MoveToFlag(OwnerID(),780662 , 3 ,0 ,1)		--使tony走到780600的第二根旗子
end

function LuaS_423307_4()
	--Sleep(20)
	WriteRoleValue(OwnerID(), EM_RoleValue_IsWalk, 1)			--改變角色數值 使其以下移動方式皆為走路
	Sleep(20)
	DW_MoveToFlag(OwnerID(),780663 , 3 ,0 ,1)		--使ich走到780600的第二根旗子
end

-----------423308與湯尼深談-----------
function LuaS_423308()		--掛在115682湯尼
	LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest( OwnerID() ,423308 ) == true	then 
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_423308_0]" , "LuaS_423308_1", 0 )
	end
end

function LuaS_423308_1()
	SetSpeakDetail(OwnerID(),"[SC_423308_1]")		
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_423308_2]" , "LuaS_423308_2", 0 )	
end

function LuaS_423308_2()
	SetSpeakDetail(OwnerID(),"[SC_423308_3]")		
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_423308_4]" , "LuaS_423308_3", 0 )	
end

function LuaS_423308_3()
	SetSpeakDetail(OwnerID(),"[SC_423308_5]")		
	SetFlag(OwnerID() , 544194 , 1 )
end
------------423309綁架居爾納精靈------------
--204046是捕抓用的道具，可以直接拷貝後修改使用
--103992居爾納精靈法師
--207464堅韌套索
--207459裝著墮落精靈的布袋

function LuaS_423309_0()-----掛在物品207464"堅韌套索"使用下的<檢查lua>之下。103992"居爾納精靈法師"是可以被捕抓的怪物編號
	local OrgID = 0
	if CheckAcceptQuest( OwnerID() , 423309 ) == false or CountBodyItem( OwnerID() ,207459) == 1 then	--207459"裝著墮落精靈的布袋"為使用道具之後得到的道具
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_207464_0]" , 0 ) --你不能再使用此物品
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_207464_0]" , 0 )
		return false
	end			--當沒有任務或身上有相關道具時 顯示"不能使用物品"的提示
	
	if CheckID( TargetID() ) == true then
		OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	end
	
	if  	ReadRoleValue( TargetID(), EM_RoleValue_Register10 ) > 0  then		--忙碌中
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SAY_NPC_BUSY]" )--忙碌
		return false
	end
	
	if   OrgID ~= 103992 then		--道具的使用對象編號
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_207464_2]", 0 ); -----[207464]只能對[103992]使用
		return false
	end

	if GetDistance(TargetID(), OwnerID() ) > 120  then -------距離
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_207464_3]", 0 ); -----距離太過遙遠
		return false
	end

	if	ReadRoleValue(TargetID(),EM_RoleValue_HP)/ReadRoleValue(TargetID(),EM_RoleValue_MaxHP)	>0.5	then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_207464_4]", 0 ); ----目標奮力掙扎中，你無法順利捉住你的目標！
		return false
	end


	if	ReadRoleValue( TargetID(), EM_RoleValue_IsDead) == 1 or  CheckBuff( TargetID() , 504004 ) == true  then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_207464_5]" , 0 ) --目標已經死了。
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_207464_5]" , 0 )
		return false
	end
	WriteRoleValue( TargetID(), EM_RoleValue_Register10, 1 )
	return true
end

function LuaS_423309_1()	--掛在<使用效果類型:server端劇情>下的使用效果下 範例任務422113=
	UseItemDestroy( OwnerID() )---正在使用的物品
	WriteRoleValue( TargetID(), EM_RoleValue_Register10, 0 )
	--hide(TargetID())
	CallPlot(TargetID(),"LuaFunc_ResetObj",TargetID())
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_207464_6]", 0 ); -------你抓到[103301]了
	GiveBodyItem( OwnerID() , 207459 , 1 )
end

----------423312時機和方法---------

function LuaS_423312()		--掛在115582大獵手之下
	LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest( OwnerID() ,423312 ) == true	and CheckFlag( OwnerID(),544196 ) == false  then 
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_423312_0]" , "LuaS_423312_1", 0 )
	end

	if CheckAcceptQuest( OwnerID() , 423307 ) == true  and CheckFlag( OwnerID(), 544193 ) ==false  then
		if  ReadRoleValue( TargetID(), EM_RoleValue_Register +1) == 0  then                   --大獵手不忙
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423307_7]","LuaS_423307_1_1",0)	--我準備好了。
		else
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423307_7]","LuaS_423307_false",0)	--我準備好了。
		end
	end	--<=423307用
	
end
function LuaS_423312_1()
	SetSpeakDetail(OwnerID(),"[SC_423312_1]")		
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_423312_2]" , "LuaS_423312_2", 0 )	
end

function LuaS_423312_2()
	SetSpeakDetail(OwnerID(),"[SC_423312_3]")		
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_423312_4]" , "LuaS_423312_3", 0 )
end

function LuaS_423312_3()	
	SetFlag(OwnerID() , 544196 , 1 )
	CloseSpeak(OwnerID())	----關閉client端任務視窗
end



------------------掛在115763虛弱的居爾納精靈的對話劇情------
function LuaS_115763()
	LoadQuestOption( OwnerID() )					---讀取任務模板
	--423310
	if	CheckAcceptQuest( OwnerID() ,423310 ) == true and CheckFlag( OwnerID(),544195 ) == false	then 
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_423310_0]" , "LuaS_423310_1", 0 )	
	end

	--423313
	if	CheckAcceptQuest( OwnerID() ,423313 ) == true and CheckFlag( OwnerID(),544197 ) == false	and  CountBodyItem ( OwnerID(), 207460 )  then 
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_423313_0]" , "LuaS_423313_1", 0 )	
	end
end
----------423310與墮落精靈的溝通---------

function LuaS_423310_1()
	SetSpeakDetail(OwnerID(),"[SC_423310_1]")		
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_423310_2]" , "LuaS_423310_2", 0 )	
end

function LuaS_423310_2()
	SetSpeakDetail(OwnerID(),"[SC_423310_1]")		
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_423310_3]" , "LuaS_423310_3", 0 )	
end

function LuaS_423310_3()
	SetSpeakDetail(OwnerID(),"[SC_423310_4]")		
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_423310_5]" , "LuaS_423310_4", 0 )
end

function LuaS_423310_4()
	SetSpeakDetail(OwnerID(),"[SC_423310_6]")		
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_423310_7]" , "LuaS_423310_5", 0 )
end

function LuaS_423310_5()
	SetSpeakDetail(OwnerID(),"[SC_423310_8]")		
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_423310_9]" , "LuaS_423310_6", 0 )
end	

function LuaS_423310_6()
	SetSpeakDetail(OwnerID(),"[SC_423310_10]")		
	SetFlag(OwnerID() , 544195 , 1 )
end



----------423313溝通是最好的橋樑---------

function LuaS_423313_1()
	SetSpeakDetail(OwnerID(),"[SC_423313_1]")		
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_423313_2]" , "LuaS_423313_2", 0 )	
end

function LuaS_423313_2()
	SetSpeakDetail(OwnerID(),"[SC_423313_3]")		
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_423313_4]" , "LuaS_423313_3", 0 )	
end

function LuaS_423313_3()
	SetSpeakDetail(OwnerID(),"[SC_423313_5]")		
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_423313_6]" , "LuaS_423313_4", 0 )
end	

function LuaS_423313_4()
	SetSpeakDetail(OwnerID(),"[SC_423313_7]")		
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_423313_8]" , "LuaS_423313_5", 0 )
end

function LuaS_423313_5()
	SetSpeakDetail(OwnerID(),"[SC_423313_9]")		
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_423313_10]" , "LuaS_423313_6", 0 )
end	

function LuaS_423313_6()
	SetSpeakDetail(OwnerID(),"[SC_423313_11]")		
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_423313_12]" , "LuaS_423313_7", 0 )
end	

function LuaS_423313_7()
	SetSpeakDetail(OwnerID(),"[SC_423313_13]")		
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_423313_14]" , "LuaS_423313_8", 0 )
end	

function LuaS_423313_8()	
	SetFlag(OwnerID() , 544197 , 1 )
	CloseSpeak(OwnerID())	--關閉client端任務視窗
end

--------423312時機和方法--------
function LuaS_423312_complete()
	ScriptMessage( OwnerID() , TargetID() , 1 , "[SC_423312_5]" , 0 ) 
	ScriptMessage( OwnerID() , TargetID() , 0 , "[SC_423312_5]" , 0 )
end

----鎮靜藥劑不見了----
function LuaS_115591()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() ,423313 ) == true  and  CountBodyItem ( OwnerID(), 207460 ) == 0 then 
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_207460_1]" , "LuaS_115591_1", 0 )
	end
end

function LuaS_115591_1()
	SetSpeakDetail(OwnerID(),"[SC_207460_0]")
	GiveBodyItem ( OwnerID(), 207460, 1 )
end