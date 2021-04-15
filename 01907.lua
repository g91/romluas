-------------------423320有解史詩------------------------------
function LuaS_423320()		----player => owner   ;  隱形球 => target	
	SetPlot(OwnerID() , "range","LuaS_423320_1_1",200)
end

function LuaS_423320_not()		----player => owner   ;  隱形球 => target	
	SetPlot(OwnerID() , "range","LuaS_423320_0",200)
end

function LuaS_423320_0()		----player => owner   ;  隱形球 => target	
	if 	CheckAcceptQuest( OwnerID() , 423320 ) == true	and	----有接423320
		CheckCompleteQuest( OwnerID() , 423354 ) == true	and
		CheckFlag( OwnerID() , 544215) == false	and	----沒有任務flag
		CheckBuff(OwnerID() , 506972) == false	then	----沒有演戲buff
		if	ReadRoleValue(TargetID(),EM_RoleValue_Register +1) == 0	 then --演戲,給演戲buff
				BeginPlot(TargetID(),"LuaS_423320_2",1)
		else									----buzy then 給等待buff
				BeginPlot(TargetID(),"LuaS_423320_1",1)
		end


	end 
end

function LuaS_423320_1()		----player => target   ;  隱形球 => Owner	
	ScriptMessage( TargetID() , TargetID() , 0 , "[SC_423320_1]" ,  "0xFFFFFF00" ) 		-----菲恩彌爾說在這裡等他，不妨在這裡多等一會。
	ScriptMessage( TargetID() , TargetID() , 1 , "[SC_423320_1]" ,  "0xFFFFFF00" ) 
	AddBuff(TargetID(),506977,1,60)				---給予等待BUFF
end

function LuaS_423320_2()
	--WriteRoleValue ( OwnerID() , EM_RoleValue_Register +2,0 )
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,1 )
	AddBuff(TargetID(),506972,1,-1)	
	
	Local buzy = 1
	while buzy == 1 do	

		local Player = SearchRangePlayer ( OwnerID() , 200 )			---有等待BUFF沒有演戲BUFF的玩家,給予演戲BUFF
		for i = 0 , table.getn(Player) do
			if	CheckBuff(player[i] , 506977) == true	then
				CancelBuff( player[i]  , 506977  ) 	--
				AddBuff(player[i],506972,1,-1)
			
			end
			if	CheckBuff(player[i] , 506972) == true	then
				ScriptMessage( player[i] , player[i] , 0 , "[SC_423320_2]" ,  "0xFFFFFF00" ) 		-----你聽見後面傳來不急不徐的腳步聲。
				ScriptMessage( player[i] , player[i] , 1 , "[SC_423320_2]" ,  "0xFFFFFF00" ) 				
			end
		end
		Local fen =    Lua_DW_CreateObj("flag" ,115659,780678,1)
		CallPlot(fen,"LuaS_423320_cancel",OwnerID(),200)	---任務失敗條件檢查
		DisableQuest( fen , true )
		sleep(20)
		WriteRoleValue(fen , EM_RoleValue_IsWalk, 1 )			---用走的
		sleep(10)
		DW_MoveToFlag(fen,780678 , 2,0 ,1)		
		yell(fen,"[SC_423320_24]",3)	---人王的使者[$playername]，我將帶你進入精靈的住所，居爾納塔瑞森林，切記我們的約定。
		sleep(20)
		WriteRoleValue(fen , EM_RoleValue_IsWalk, 0 )		---用跑的
		sleep(10)
		DW_MoveToFlag(fen,780678 , 3,0 ,1)
		DW_MoveToFlag(fen,780678 , 14,0 ,1)
		DW_MoveToFlag(fen,780678 , 4,0 ,1)
		DW_MoveToFlag(fen,780678 , 5,0 ,1)
		DW_MoveToFlag(fen,780678 , 6,0 ,1)
		DW_MoveToFlag(fen,780678 , 7,0 ,1)
		local fen2 = LuaFunc_SearchNPCbyOrgID( fen,115658 , 500 , 0)		---移動到他後來的位置
		local x = ReadRoleValue ( fen2, EM_RoleValue_X)
		local y = ReadRoleValue ( fen2, EM_RoleValue_Y)
		local z = ReadRoleValue ( fen2, EM_RoleValue_Z)
		DW_WaitMoveTo( fen , x , y, z)	
		sleep(10)

		for i = 0 , table.getn(Player) do								---仍有BUFF的玩家可以得到旗標
			if	CheckBuff(player[i] , 506972) == true	and	CheckAcceptQuest( player[i] , 423320 ) == true		then
				SetFlag(player[i],544215,1)	--give mission flag
				CancelBuff( player[i]  , 506972  ) 	--
			end
		end
		delobj(fen)
--------------------
		buzy = 0
		local Player3 = SearchRangePlayer ( OwnerID() ,200 )			----觸發點附近有玩家有等待BUFF,BUZY=1,重複演戲
		for i = 0 , table.getn(Player3) do
			if	CheckFlag( player3[i] , 544215) == false	and	
				CheckAcceptQuest( player3[i] , 423320 ) == true	and	
				CheckBuff(player3[i] , 506977) == false	and	
				CheckCompleteQuest( player3[i] , 423354 ) == true	then
				AddBuff(player3[i],506977,1,-1)
			end			
			if	CheckBuff(player3[i] , 506977) == true	and	CheckAcceptQuest( player3[i] , 423320 ) == true		then
				buzy = 1
			end
		end
		--WriteRoleValue ( OwnerID() , EM_RoleValue_Register +2,buzy )
	end
	WriteRoleValue(OwnerID(),EM_RoleValue_Register +1,0)
end

function LuaS_423320_cancel(boss,range)
	local Player = SearchRangePlayer ( boss , range )			---有等待BUFF沒有演戲BUFF的玩家,給予演戲BUFF
	while	true	do
		sleep(10)
		for i = 0 , table.getn(Player) do
			if	GetDistance( player[i] , OwnerID() ) > range	and	CheckBuff(player[i] , 506972) == true	then
				CancelBuff( player[i]  , 506972  ) 	--
				ScriptMessage( player[i]  , player[i]  , 0 , "[SC_423320_3]" ,  "0xFFFFFF00" ) 		-----距離跟隨的目標太遠，請回到起點重試。
				ScriptMessage( player[i]  , player[i]  , 1 , "[SC_423320_3]" ,  "0xFFFFFF00" ) 				
			end
			if	ReadRoleValue( player[i] , EM_RoleValue_AttackTargetID ) ~= 0	and	CheckBuff(player[i] , 506972) == true	then
				CancelBuff( player[i]  , 506972  ) 	--
				ScriptMessage( player[i]  , player[i]  , 0 , "[SC_423320_4]" ,  "0xFFFFFF00" ) 		-----違反約定任務失敗，請回到起點重試。
				ScriptMessage( player[i] , player[i]  , 1 , "[SC_423320_4]" ,  "0xFFFFFF00" ) 				
			end
			if	CheckAcceptQuest( player[i] , 423320 ) == false	and	CheckBuff(player[i] , 506972) == true	then
				CancelBuff( player[i]  , 506972  ) 	--				
			end
			if	CheckBuff(player[i] , 506972) == true	then
				AddBuff(player[i],506976,1,2)	
			end
		end
	end
end

function LuaS_115635()
--	if 	CheckCompleteQuest(OwnerID(),423357)==true  then
--			SetSpeakDetail( OwnerID(), "[SC_423353_99]"  ) 
--	else
		LoadQuestOption( OwnerID() )		--423320
		if 	CheckCompleteQuest(OwnerID(),423353)==true  then
			SetSpeakDetail( OwnerID(), "[SC_423353_99]"  ) 
		end
		if	CheckAcceptQuest( OwnerID() , 423353 ) == true	and	CheckFlag( OwnerID(),544259) == false and	 CountBodyItem( OwnerID(), 207740)>=1 		then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423353_1]","LuaS_423353_1",0)	--[115635]...
		end
		if	CheckAcceptQuest( OwnerID() , 423320 ) == true	and	CheckFlag( OwnerID(),544215 ) == true	and	CheckFlag( OwnerID(),544216 ) == false	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423320_5]","LuaS_423320_0_1",0)	--偉大的聖樹，為何繼續吸取自然之力？
		end	
		if	CheckAcceptQuest( OwnerID() , 423320 ) == true	and	CheckFlag( OwnerID(),544215 ) == true	and	CheckFlag( OwnerID(),544216 ) == true	and
			CheckFlag( OwnerID(),544232 ) == false	and	CountBodyItem ( OwnerID(), 207457 ) > 0	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423320_9]","LuaS_423320_0_3",0)	--請讓我回安格爾古林。
		end
		if	CheckAcceptQuest( OwnerID() , 423320 ) == true	and	CheckFlag( OwnerID(),544215 ) == true	and	CheckFlag( OwnerID(),544216 ) == true	and
			CheckFlag( OwnerID(),544232 ) == false	and	CountBodyItem ( OwnerID(), 207457 ) == 0	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423320_21]","LuaS_423320_0_reget",0)	--你給我的葉子遺失了...
		end	
		if	(CheckAcceptQuest(OwnerID(),423355)==true )	and	( CheckCompleteQuest( OwnerID(),423355)==false)   and CheckFlag( OwnerID() , 544261 ) ==false	then
					AddSpeakOption(OwnerID(),TargetID(),"[SC_423355_0]","LuaS_423355_1",0)		--精靈王讓我來...
		end	
--	end
end

function LuaS_423320_0_1()
	local Dis =  GetDistance( OwnerID() , TargetID() )					---距離超過50失效
	if	Dis > 50 then
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204592_2]" ,  "0xFFFFFF00" ) 	---
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204592_2]" ,  "0xFFFFFF00" )
		CloseSpeak( OwnerID() )
	else
		SetSpeakDetail(OwnerID(),"[SC_423320_6]")			---精靈們雖然不再受到符文毒害...
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423320_7]","LuaS_423320_0_2",0)	--但安格爾古林現在也受到您的影響，慢慢枯萎了。
	end
end

function LuaS_423320_0_2()
	local Dis =  GetDistance( OwnerID() , TargetID() )					---距離超過50失效
	if	Dis > 50 then
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204592_2]" ,  "0xFFFFFF00" ) 	---
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204592_2]" ,  "0xFFFFFF00" )
		CloseSpeak( OwnerID() )
	else
		SetSpeakDetail(OwnerID(),"[SC_423320_8]")			---此非吾所願，希望佩謝諒解...
		if	CheckAcceptQuest ( OwnerID()   , 423320 )	 == true	then
			SetFlag(OwnerID(),544216,1)
			GiveBodyItem ( OwnerID(), 207457, 1 )	
		end
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423320_9]","LuaS_423320_0_3",0)	--請讓我回安格爾古林。
	end
end

function LuaS_423320_0_reget()
	local Dis =  GetDistance( OwnerID() , TargetID() )					---距離超過50失效
	if	Dis > 50 then
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204592_2]" ,  "0xFFFFFF00" ) 	---
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204592_2]" ,  "0xFFFFFF00" )
		CloseSpeak( OwnerID() )
	else
		SetSpeakDetail(OwnerID(),"[SC_423320_22]")			---遺失了嗎？也只是歸於吾身...
		if	CheckAcceptQuest ( OwnerID()   , 423320 )	 == true	then
			GiveBodyItem ( OwnerID(), 207457, 1 )	
		end
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423320_9]","LuaS_423320_0_3",0)	--請讓我回安格爾古林。
	end
end
function LuaS_423320_0_3()
	CloseSpeak(OwnerID())					---回到安格爾
	AddBuff(OwnerID(),506976,1,3)
 	SetPosByFlag( OwnerID()  , 780675 , 1 )
end

function LuaS_115645()
	LoadQuestOption( OwnerID() )					---讀取任務模板
	if	CountBodyItem ( OwnerID(), 207457 ) > 0	then	
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423320_19]","LuaS_423320_0_getflag",0)	--(回報居爾納塔瑞森林所發生的事情)
	end
	if	CheckAcceptQuest( OwnerID() , 423320 ) == true	and
		CheckCompleteQuest( OwnerID() , 423354 ) == true	and
		CheckFlag( OwnerID(),544232 ) == true		and
		CheckFlag( OwnerID(),544217 ) == false	then	---
		if	ReadRoleValue(TargetID(),EM_RoleValue_Register +1) == 0	then		---人王不忙
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423320_10]","LuaS_423320_0_4",0)	--請陛下去說服拉夏娜吧。
		else
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423320_10]","LuaS_423320_false",0)	--	請陛下去說服拉夏娜吧。		
		end
	end	

	if	CheckAcceptQuest( OwnerID() , 423320 ) == true	and
		CheckCompleteQuest( OwnerID() , 423354 ) == false	and
		CheckFlag( OwnerID(),544232 ) == true		and
		CheckFlag( OwnerID(),544217 ) == false	then	---
		if	ReadRoleValue(TargetID(),EM_RoleValue_Register +2) == 0	then		---人王不忙
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423320_10]","LuaS_423320_1_3",0)	--請陛下去說服拉夏娜吧。
		else
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423320_10]","LuaS_423320_false",0)	--	請陛下去說服拉夏娜吧。		
		end
	end	
end

function LuaS_423320_0_getflag()
	SetSpeakDetail(OwnerID(),"[SC_423320_20]")	---幹的好，騎士，這麼一來安格爾古林就不會再受到精靈的危害...
	SetFlag(OwnerID(),544232,1)
	DelBodyItem(OwnerID(),207457,1)
	if	CheckAcceptQuest( OwnerID() , 423320 ) == true	and
		CheckCompleteQuest( OwnerID() , 423354 ) == true	and
		CheckFlag( OwnerID(),544232 ) == true		and
		CheckFlag( OwnerID(),544217 ) == false	then	---
		if	ReadRoleValue(TargetID(),EM_RoleValue_Register +1) == 0	then		---人王不忙
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423320_10]","LuaS_423320_0_4",0)	--請陛下去說服拉夏娜吧。
		else
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423320_10]","LuaS_423320_false",0)	--	請陛下去說服拉夏娜吧。		
		end
	end	
	if	CheckAcceptQuest( OwnerID() , 423320 ) == true	and
		CheckCompleteQuest( OwnerID() , 423354 ) == false	and
		CheckFlag( OwnerID(),544232 ) == true		and
		CheckFlag( OwnerID(),544217 ) == false	then	---
		if	ReadRoleValue(TargetID(),EM_RoleValue_Register +2) == 0	then		---人王不忙
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423320_10]","LuaS_423320_1_3",0)	--請陛下去說服拉夏娜吧。
		else
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423320_10]","LuaS_423320_false",0)	--	請陛下去說服拉夏娜吧。		
		end
	end		
end
function LuaS_423320_0_4()
	CloseSpeak(OwnerID())	
	BeginPlot(TargetID(),"LuaS_423320_0_5",1)	
end

function LuaS_423320_false()
	SetSpeakDetail(OwnerID(),"[SC_423320_11]")	---沒想到事情這麼順利，但只憑這些可能還是難以取信她...
end

function LuaS_423320_0_5()
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,1 )	---
	AddBuff( TargetID()  , 506973 , 1 , -1 ) 		
	local checker = Lua_DW_CreateObj("obj",115672,OwnerID())   --fen假人
	local tony = Lua_DW_CreateObj("obj",115660,OwnerID())   --fen假人		
	local NPC = LuaFunc_SearchNPCbyOrgID( OwnerID(),115647 , 300 , 0)
	local lasha = Lua_DW_CreateObj("obj",115668,NPC)   --lasha假人	
	local NPC1 = LuaFunc_SearchNPCbyOrgID( OwnerID(),115646 , 300 , 0)
	local ith = Lua_DW_CreateObj("obj",115698,NPC1)   --ith假人	
	DisableQuest( tony , true )
	DisableQuest( lasha , true )	
	DisableQuest( ith , true )
	WriteRoleValue ( checker , EM_RoleValue_Register +1,1 )	---
	CallPlot(checker,"LuaS_Check_noquest_single", 1 , 1 , 423320 , 506973,TargetID(),OwnerID(),150)		---放棄任務或距離太遠立刻取消BUFF
	MoveToFlagEnabled(tony,false)
	AdjustFaceDir( tony ,lasha, 0 )	
	sleep(5)
	PlayMotion(tony,ruFUSION_ACTORSTATE_EMOTE_POINT)
	sleep(5)
	yell(tony,"[SC_423320_12]",3)	---拉夏娜，這是聖樹妮克絲的葉子...
	sleep(40)
	PlayMotion(lasha,ruFUSION_ACTORSTATE_EMOTE_POINT)
	AdjustFaceDir( lasha ,tony, 0 )	
	sleep(5)
	yell(lasha,"[SC_423320_13]",3)		---我怎麼知道那是真是假，誰來做證！
	
	if	CheckBuff(TargetID() , 506973 ) == false	then
		delobj(tony)
		delobj(lasha)
		delobj(ith)
		delobj(checker)
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )	---
		return
	end
	
	local fen = Lua_DW_CreateObj("flag" ,115661,780679,1)		---fen假人
	DisableQuest( fen , true )
	sleep(10)
	yell(fen,"[SC_423320_14]",3)		---我來作證。
	sleep(10)
	WriteRoleValue(fen , EM_RoleValue_IsWalk, 1 )			
	sleep(10)
	yell(lasha,"[SC_423320_26]",3)		---該死的精靈？
	DW_MoveToFlag(fen,780679 , 2,0 ,1)	
	sleep(10)
	AdjustFaceDir( fen ,tony, 0 )		
	sleep(5)
	AdjustFaceDir( tony ,fen, 0 )	
	sleep(5)
	PlayMotion( fen,ruFUSION_ACTORSTATE_EMOTE_SPEAK )	
	yell(fen,"[SC_423320_15]",3)		---卡拉維?卡薩姆陛下，葉子請交給我。
	sleep(40)
		
	if	CheckBuff(TargetID() , 506973 ) == false	then
		delobj(fen)
		delobj(tony)
		delobj(lasha)
		delobj(ith)
		delobj(checker)
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )	---
		return
	end
		
	DW_MoveToFlag(fen,780679 , 3,0 ,1)	
	AdjustFaceDir( tony ,fen, 0 )	
	sleep(5)
	AdjustFaceDir( fen ,lasha, 0 )	
	sleep(5)
	PlayMotion( fen ,ruFUSION_ACTORSTATE_CROUCH_BEGIN)	   --下跪	
	local shine = Lua_DW_CreateObj("flag" ,115671,780679,4)		---shine假人
	local shine2 = Lua_DW_CreateObj("flag" ,115671,780679,4)		---shine假人
	Lua_ObjDontTouch( shine) 	---不能碰shine假人	
	Lua_ObjDontTouch( shine2) 	---不能碰shine2假人		
	CallPlot(shine,"LuaS_423320_windmove")
	CallPlot(shine2,"LuaS_423320_windmove")
	CastSpell(shine2,shine,495606)	
	sleep(20)	
	CastSpell(shine,shine,495606)	
	PlayMotion( fen ,ruFUSION_ACTORSTATE_CROUCH_END)	   --下跪
	sleep(20)	
	AdjustFaceDir( fen ,lasha, -20 )	
	AdjustFaceDir( tony ,fen,-20 )	
	AdjustFaceDir( ith ,fen,-20 )	
	AdjustFaceDir( lasha ,fen,20 )
	if	CheckBuff(TargetID() , 506973 ) == true	and	CheckAcceptQuest ( TargetID()   , 423320 )	 == true	then
		ScriptMessage( TargetID() , TargetID() , 0 , "[SC_423320_16]" ,  "0xFFFFFF00" ) 	---安格爾古林吹起一股清風，讓人神清氣爽。
		ScriptMessage( TargetID() , TargetID() , 1 , "[SC_423320_16]" ,  "0xFFFFFF00" )		
	end
	sleep(20)
		
	if	CheckBuff(TargetID() , 506973 ) == false	then
		delobj(fen)
		delobj(tony)
		delobj(lasha)
		delobj(ith)
		delobj(checker)
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )	---
		return
	end
		
	AdjustFaceDir( fen ,lasha, 20 )				---感覺自然之風
	AdjustFaceDir( tony ,fen,20 )	
	AdjustFaceDir( ith ,fen,20 )	
	AdjustFaceDir( lasha ,fen,-20 )
	sleep(20)
	AdjustFaceDir( fen ,lasha, 90 )	
	AdjustFaceDir( tony ,fen,90 )	
	AdjustFaceDir( ith ,fen,90 )	
	AdjustFaceDir( lasha ,fen,-50 )
	sleep(20)
	AdjustFaceDir( fen ,lasha, -10 )	
	AdjustFaceDir( tony ,fen,-10 )	
	AdjustFaceDir( ith ,fen,-10 )	
	AdjustFaceDir( lasha ,fen,20 )
	sleep(20)		
	AdjustFaceDir( fen ,lasha,0 )	
	AdjustFaceDir( tony ,fen,0 )	
	AdjustFaceDir( ith ,fen,0 )	
	AdjustFaceDir( lasha ,fen,0 )
	yell(fen,"[SC_423320_23]",3)		---如此一來安格爾古林將不再失去自然之力。
	sleep(40)	
		
	if	CheckBuff(TargetID() , 506973 ) == false	then
		delobj(fen)
		delobj(tony)
		delobj(lasha)
		delobj(ith)
		delobj(checker)
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )	---
		return
	end

	yell(fen,"[SC_423320_17]",3)		---而我將留在安格爾城治療其他受到不明能量影響的精靈...
	sleep(50)
	PlayMotionEX( lasha , ruFUSION_ACTORSTATE_ATTACK_1H , ruFUSION_ACTORSTATE_NORMAL )
	yell(lasha,"[SC_423320_18]",3)		---哼...好！如果精靈再次干涉安格爾古林的生態，你就等著吧。
	sleep(30)
	yell(fen,"[SC_423320_25]",3)		---感謝酋長，我願負起精靈所造成的過錯，那麼先告辭了。
	sleep(20)
	DW_MoveToFlag(fen,780679 , 1,0 ,1)	
	AdjustFaceDir( tony ,lasha, 0 )	
	AdjustFaceDir( ith ,lasha,0 )		
	if	CheckBuff(TargetID() , 506973 ) == true	and		CheckAcceptQuest ( TargetID()   , 423320 )	 == true	then
		SetFlag(TargetID(),544217,1)
	end
	delobj(tony)
	delobj(lasha)
	delobj(fen)
	delobj(ith)
	delobj(checker)
	CancelBuff( TargetID()  , 506973  ) 	--
	WriteRoleValue ( checker , EM_RoleValue_Register +1,0 )	---
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )	---
end

function LuaS_423320_windmove()
	WriteRoleValue(OwnerID() , EM_RoleValue_IsWalk, 1 )
	DW_MoveToFlag(OwnerID(),780679 , 5,0 ,1)	
	DW_MoveToFlag(OwnerID(),780679 , 6,0 ,1)	
	DW_MoveToFlag(OwnerID(),780679 , 7,0 ,1)	
	DW_MoveToFlag(OwnerID(),780679 , 8,0 ,1)	
	DW_MoveToFlag(OwnerID(),780679 , 5,0 ,1)
	DW_MoveToFlag(OwnerID(),780679 , 6,0 ,1)
	DW_MoveToFlag(OwnerID(),780679 , 1,0 ,1)
	delobj(OwnerID())
end


---------------423320沒解史詩---------------------

function LuaS_423320_1_1()
	if 	CheckAcceptQuest( OwnerID() , 423320 ) == true	and	----有接423320
		CheckCompleteQuest( OwnerID() , 423354 ) == false	and
		CheckFlag( OwnerID() , 544215) == false	and	----沒有任務flag
		CheckBuff(OwnerID() , 506974) == false	then	----沒有演戲buff
		if	ReadRoleValue(TargetID(),EM_RoleValue_Register +3) == 0	then	----not buzy then 演戲,給演戲buff
				BeginPlot(TargetID(),"LuaS_423320_1_2",1)
		else									----buzy then 給等待buff
				BeginPlot(TargetID(),"LuaS_423320_1_wait",1)
		end

	end 
end

function LuaS_423320_1_2()
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register +3,1 )
	AddBuff(TargetID(),506974,1,-1)	

	Local buzy = 1
	while buzy == 1 do	
		Local fen =    Lua_DW_CreateObj("flag" ,115662,780678,1)
		CallPlot(fen,"LuaS_423320_1_cancel",OwnerID(),200)
		local Player = SearchRangePlayer ( OwnerID() , 200 )			---有等待BUFF沒有演戲BUFF的玩家,給予演戲BUFF
		for i = 0 , table.getn(Player) do
			if	CheckBuff(player[i] , 506978) == true	then
				CancelBuff( player[i]  , 506978  ) 	--
				AddBuff(player[i],506974,1,-1)
			
			end
			if	CheckBuff(player[i] , 506974) == true	then
				ScriptMessage( player[i] , player[i] , 0 , "[SC_423320_2]" ,  "0xFFFFFF00" ) 		-----你聽見後面傳來不急不徐的腳步聲。
				ScriptMessage( player[i] , player[i] , 1 , "[SC_423320_2]" ,  "0xFFFFFF00" ) 				
			end
		end

		DisableQuest( fen , true )
		sleep(20)
		WriteRoleValue(fen , EM_RoleValue_IsWalk, 1 )			
		sleep(10)
		DW_MoveToFlag(fen,780678 , 2,0 ,1)		
		yell(fen,"[SC_423320_24]",3)		---人王的使者[$playername]，我將帶你進入精靈的住所，居爾納塔瑞森林，切記我們的約定。
		sleep(20)
		WriteRoleValue(fen , EM_RoleValue_IsWalk, 0 )		
		sleep(10)
		Local ant =    Lua_DW_CreateObj("flag" ,115664,780678,3)
		DisableQuest( ant , true )
		yell(ant,"[SC_423320_27]",3)		---別再前進了，來自達拉尼斯的騎士。
		DW_MoveToFlag(fen,780678 , 10,0 ,1)
		yell(fen,"[SC_423320_28]",3)		---王！這...不可能！
		sleep(10)	
		WriteRoleValue(ant , EM_RoleValue_IsWalk, 1 )	
		WriteRoleValue(fen , EM_RoleValue_IsWalk, 1 )		
		sleep(10)		
		yell(ant,"[SC_423320_29]",3)		---確實，說來話長，但當務之急是解決問題，年輕的精靈。
		sleep(5)
		DW_MoveToFlag(ant,780678 , 11,0 ,1)	
		AdjustFaceDir( fen ,ant, 0 )
		PlayMotion( ant,ruFUSION_ACTORSTATE_EMOTE_SPEAK )	
		yell(ant,"[SC_423320_30]",3)		---[$playername]，這是聖樹妮克絲的葉片...
		local time=0
		for i = 0 , table.getn(Player) do
			if	CheckBuff(player[i] , 506974) == true	then
				AdjustFaceDir( ant ,player[i], 0 )
				sleep(8)
				time = time + 8		
			end
		end		
		if	time < 45	then
			sleep(40-time)
		end		
		yell(ant,"[SC_423320_31]",3)			---剩下的是精靈族的問題，身為精靈之王，必然負起族人所犯下的錯誤。
		sleep(40)
		yell(ant,"[SC_423320_32]",3)			---因此請回吧，來自達拉尼斯的騎士。
		for i = 0 , table.getn(Player) do				---有BUFF且有任務的玩家得到旗標
			if	CheckBuff(player[i] , 506974) == true	and	CheckAcceptQuest( player[i] , 423320 ) == true		then
				SetFlag(player[i],544215,1)	--give mission flag
				SetFlag(player[i],544216,1)	--give mission flag
				GiveBodyItem ( player[i], 207457, 1 )	
			end
		end
		sleep(35)
		AdjustFaceDir( ant ,fen, 0 )			---
		sleep(5)
		yell(ant,"[SC_423320_33]",3)			---年輕的精靈，吾等將回應聖樹妮克絲的召喚。
		sleep(30)
		CallPlot(ant,"LuaS_423320_ant_move")
		sleep(20)
		DW_MoveToFlag(fen,780678 , 12,0 ,1)		

--------------------
		for i = 0 , table.getn(Player) do				---有BUFF且有任務的玩家得到旗標
			if	CheckBuff(Player[i] , 506974) == true	and	CheckAcceptQuest( Player[i] , 423320 ) == true		then
				CancelBuff( Player[i]  , 506974  ) 	--
			end
		end
		delobj(fen)
		delobj(ant)
--------------------
		buzy = 0
		local Player3 = SearchRangePlayer ( OwnerID() , 200 )			----觸發點附近有玩家有等待BUFF,BUZY=1,重複演戲
		for i = 0 , table.getn(player3) do
			if	CheckFlag(player3[i] , 544215) == false	and	CheckAcceptQuest( player3[i] , 423320 ) == true	and	CheckBuff(player3[i] , 506978) == true	then
				AddBuff(player3[i],506974,1,-1)
			end			
			if	CheckBuff(player3[i] , 506978) == true	and	CheckAcceptQuest( player3[i] , 423320 ) == true		then
				buzy = 1
			end
		end
	end
	WriteRoleValue(OwnerID(),EM_RoleValue_Register +3,0)
end

function LuaS_423320_1_wait()
	ScriptMessage( TargetID() , TargetID() , 0 , "[SC_423320_1]" ,  "0xFFFFFF00" ) 		-----菲恩彌爾說在這裡等他，不妨在這裡多等一會。
	ScriptMessage( TargetID() , TargetID() , 1 , "[SC_423320_1]" ,  "0xFFFFFF00" ) 
	AddBuff(TargetID(),506978,1,60)				---給予等待BUFF
end

function LuaS_423320_1_cancel(boss,range)
	local player = SearchRangePlayer ( boss , range )			---有等待BUFF沒有演戲BUFF的玩家,給予演戲BUFF
	while	true	do
		sleep(10)
		for i = 0 , table.getn(player) do
			if	GetDistance( player[i] , boss ) > range	and	CheckBuff(player[i] , 506974) == true	then
				CancelBuff( player[i]  , 506974  ) 	--
				ScriptMessage( player[i]  , player[i]  , 0 , "[SC_SOFAR]" , 0 ) --你已經離開任務：[$VAR1] 的檢查範圍
				ScriptMessage( player[i]  , player[i]  , 1 , "[SC_SOFAR]" , 0 ) --你已經離開任務：[$VAR1] 的檢查範圍
			end
			if	ReadRoleValue( player[i] , EM_RoleValue_AttackTargetID ) ~= 0	and	CheckBuff(player[i] , 506974) == true	then
				CancelBuff( player[i]  , 506974  ) 	--
				ScriptMessage( player[i]  , player[i]  , 0 , "[SC_423320_4]" ,  "0xFFFFFF00" ) 		-----違反約定任務失敗，請回到起點重試。
				ScriptMessage( player[i] , player[i]  , 1 , "[SC_423320_4]" ,  "0xFFFFFF00" ) 				
			end
			if	CheckAcceptQuest( player[i] , 423320 ) == false	and	CheckBuff(player[i] , 506974) == true	then
				CancelBuff( player[i]  , 506974  ) 	--				
			end
		end
	end
end

function LuaS_423320_ant_move()
	DW_MoveToFlag(OwnerID(),780678 , 3,0 ,1)		
end
function LuaS_423320_1_3()
	CloseSpeak(OwnerID())	
	BeginPlot(TargetID(),"LuaS_423320_1_4",1)	
end
function LuaS_423320_1_4()
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register +2,1 )	---
	AddBuff( TargetID()  , 506975 , 1 , -1 ) 		
	local tony = Lua_DW_CreateObj("obj",115665,OwnerID())   --fen假人		
	local NPC = LuaFunc_SearchNPCbyOrgID( OwnerID(),115647 , 300 , 0)
	local lasha = Lua_DW_CreateObj("obj",115669,NPC)   --fen假人
	local NPC1 = LuaFunc_SearchNPCbyOrgID( OwnerID(),115646 , 300 , 0)
	local ith = Lua_DW_CreateObj("obj",115699,NPC1)   --ith假人	
	DisableQuest( tony , true )
	DisableQuest( lasha , true )	
	DisableQuest( ith , true )
	CallPlot(OwnerID(),"LuaS_Check_noquest_single", 2 , 1 , 423320 , 506975,TargetID(),OwnerID(),150)
	MoveToFlagEnabled(tony,false)
	AdjustFaceDir( tony ,lasha, 0 )	
	sleep(5)
	PlayMotion(tony,ruFUSION_ACTORSTATE_EMOTE_POINT)
	sleep(5)
	yell(tony,"[SC_423320_12]",3)			---拉夏娜，這是聖樹妮克絲的葉子...
	sleep(40)
	PlayMotion(lasha,ruFUSION_ACTORSTATE_EMOTE_POINT)
	sleep(5)
	yell(lasha,"[SC_423320_13]",3)			---我怎麼知道那是真是假，誰來做證！
	
	if	CheckBuff(TargetID() , 506975 ) == false	then
		delobj(tony)
		delobj(lasha)
		delobj(ith)
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +2,0 )	---
		return
	end
			
	local fen = Lua_DW_CreateObj("flag" ,115666,780679,1)		---fen假人
	local ant = Lua_DW_CreateObj("flag" ,115667,780679,9)		---fen假人
	DisableQuest( fen , true )
	DisableQuest( ant , true )
	sleep(10)
	yell(ant,"[SC_423320_14]",3)			---我來作證。
	sleep(10)
	WriteRoleValue(fen , EM_RoleValue_IsWalk, 1 )	
	WriteRoleValue(ant , EM_RoleValue_IsWalk, 1 )			
	sleep(10)
	yell(lasha,"[SC_423320_34]",3)			---侍衛！
	sleep(20)
	yell(ant,"[SC_423320_35]",3)			---請別衝動，年輕的酋長，我是精靈王，安特克羅。現在僅代表居爾納精靈向安格爾城表達歉意。
	CallPlot(fen,"DW_MoveToFlag",fen,780679,10,0,1)
	DW_MoveToFlag(ant,780679 , 2,0 ,1)	
	sleep(10)
	AdjustFaceDir( ant ,tony, 0 )		
	sleep(5)
	AdjustFaceDir( tony ,ant, 0 )	
	sleep(5)
	if	CheckBuff(TargetID() , 506975 ) == false	then
		delobj(ant)
		delobj(fen)
		delobj(tony)
		delobj(lasha)
		delobj(ith)
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +2,0 )	---
		return
	end
	PlayMotion( ant,ruFUSION_ACTORSTATE_EMOTE_SPEAK )	
	yell(ant,"[SC_423320_36]",3)			---年輕的人王，葉子請交給我。
	sleep(40)
	DW_MoveToFlag(ant,780679 , 3,0 ,1)	
	AdjustFaceDir( tony ,ant, 0 )	
	sleep(5)
	AdjustFaceDir( ant ,lasha, 0 )	
	sleep(5)
	PlayMotion( ant ,ruFUSION_ACTORSTATE_CROUCH_BEGIN)	   --下跪	
	local shine = Lua_DW_CreateObj("flag" ,115672,780679,4)		---shine假人
	local shine2 = Lua_DW_CreateObj("flag" ,115672,780679,4)		---shine假人
	Lua_ObjDontTouch( shine) 	---不能碰shine假人	
	Lua_ObjDontTouch( shine2) 	---不能碰shine2假人		
	CallPlot(shine,"LuaS_423320_windmove")
	CallPlot(shine2,"LuaS_423320_windmove")
	CastSpell(shine2,shine,495606)	
	sleep(20)	
	CastSpell(shine,shine,495606)	
	PlayMotion( ant ,ruFUSION_ACTORSTATE_CROUCH_END)	   --下跪
	sleep(20)	
	AdjustFaceDir( fen ,lasha, -20 )	
	AdjustFaceDir( tony ,fen,-20 )
	AdjustFaceDir( ith ,fen,-20 )		
	AdjustFaceDir( lasha ,fen,20 )
	if	CheckBuff(TargetID() , 506975 ) == true	and	CheckAcceptQuest ( TargetID()   , 423320 )	 == true	then
		ScriptMessage( TargetID() , TargetID() , 0 , "[SC_423320_16]" ,  "0xFFFFFF00" ) 	---安格爾古林吹起一股清風，讓人神清氣爽。
		ScriptMessage( TargetID() , TargetID() , 1 , "[SC_423320_16]" ,  "0xFFFFFF00" )		
	end
	sleep(20)
	if	CheckBuff(TargetID() , 506975 ) == false	then
		delobj(ant)
		delobj(fen)
		delobj(tony)
		delobj(lasha)
		delobj(ith)
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +2,0 )	---
		return
	end
	AdjustFaceDir( fen ,lasha, 20 )			---感覺自然之風
	AdjustFaceDir( tony ,fen,20 )	
	AdjustFaceDir( ith ,fen,20 )	
	AdjustFaceDir( lasha ,fen,-20 )
	sleep(20)
	AdjustFaceDir( fen ,lasha, 90 )	
	AdjustFaceDir( tony ,fen,90 )	
	AdjustFaceDir( ith ,fen,90 )	
	AdjustFaceDir( lasha ,fen,-50 )
	sleep(20)
	AdjustFaceDir( fen ,lasha, -10 )	
	AdjustFaceDir( tony ,fen,-10 )	
	AdjustFaceDir( ith ,fen,-10 )	
	AdjustFaceDir( lasha ,fen,20 )
	sleep(20)		
	AdjustFaceDir( fen ,lasha,0 )	
	AdjustFaceDir( tony ,fen,0 )
	AdjustFaceDir( ith ,fen,0 )		
	AdjustFaceDir( lasha ,fen,0 )
	yell(ant,"[SC_423320_23]",3)				---如此一來安格爾古林將不再失去自然之力。
	sleep(40)	
	if	CheckBuff(TargetID() , 506975 ) == false	then
		delobj(ant)
		delobj(fen)
		delobj(tony)
		delobj(lasha)
		delobj(ith)
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +2,0 )	---
		return
	end
	yell(ant,"[SC_423320_37]",3)				---安格爾酋長，如今居爾納精靈的問題尚未解決事情就有復發的一天，請容我先告退盡早處理。
	sleep(50)
	yell(fen,"[SC_423320_17]",3)				---而我將留在安格爾城治療其他受到不明能量影響的精靈，如果聖樹妮克絲的葉子失效，願受處置。
	sleep(50)
	if	CheckBuff(TargetID() , 506975 ) == false	then
		delobj(ant)
		delobj(fen)
		delobj(tony)
		delobj(lasha)
		delobj(ith)
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +2,0 )	---
		return
	end
	PlayMotionEX( lasha , ruFUSION_ACTORSTATE_ATTACK_1H , ruFUSION_ACTORSTATE_NORMAL )
	yell(lasha,"[SC_423320_18]",3)				---哼...好！如果精靈再次干涉安格爾古林的生態，你就等著吧。
	sleep(30)
	yell(fen,"[SC_423320_25]",3)				---感謝酋長，我願負起精靈所造成的過錯，那麼先告辭了。
	sleep(20)
	CallPlot(ant,"DW_MoveToFlag",ant,780679,9,0,1)
	DW_MoveToFlag(fen,780679 , 1,0 ,1)	
	AdjustFaceDir( ith ,lasha,0 )	
	AdjustFaceDir( tony ,lasha, 0 )		
	if	CheckBuff(TargetID() , 506975 ) == true	and		CheckAcceptQuest ( TargetID()   , 423320 )	 == true	then
		SetFlag(TargetID(),544217,1)
	end
	delobj(tony)
	delobj(lasha)
	delobj(fen)
	delobj(ant)
	delobj(ith)
	CancelBuff( TargetID()  , 506975  ) 	--
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register +2,0 )	---
end
