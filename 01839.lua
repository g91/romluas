--423267 用到的演戲NPC，掛在115411湯尼	--旗子780622--1 780621--10
function LuaS_115411_0()
	local Itry = CreateObjByFlag( 115412, 780622, 1 , 1 )	 				
	AddToPartition(  Itry, 0 )
	DisableQuest(Itry, true )							--關閉對話
	MoveToFlagEnabled(Itry, false )						--關閉巡邏
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register+7, Itry)			--將Itry寫進湯尼裡

	local WAA = CreateObjByFlag( 115413, 780621,18 , 1 )	 	
	AddToPartition(  WAA, 0 )
	DisableQuest(WAA, true )							--關閉對話
	MoveToFlagEnabled(WAA, false )						--關閉巡邏
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register+8, WAA)			--將WAA寫進湯尼裡

--	local NIGHT = CreateObjByFlag( 115420, 780622,2 , 1 )	 	
--	AddToPartition(  NIGHT, 0 )
--	--DisableQuest(NIGHT, true )							--關閉對話
--	MoveToFlagEnabled(NIGHT, false )						--關閉巡邏
--	WriteRoleValue ( OwnerID() , EM_RoleValue_Register+4, NIGHT)			--將NIGHT寫進湯尼裡
	
--	local STAR = CreateObjByFlag( 115422, 780622,3 , 1 )	 	
--	AddToPartition(  STAR, 0 )
--	--DisableQuest(STAR, true )							--關閉對話
--	MoveToFlagEnabled(STAR, false )						--關閉巡邏
--	WriteRoleValue ( OwnerID() , EM_RoleValue_Register+5, STAR)			--將STAR寫進湯尼裡

	local Itry= CreateObjByFlag( 115384, 780622,4 , 1 )	 	
	AddToPartition(  Itry, 0 )
	DisableQuest(Itry, true )							--關閉對話
	MoveToFlagEnabled(Itry, false )						--關閉巡邏
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register+3, Itry)			--將Itry寫進湯尼裡
	
end

function LuaS_423267_0()	--晨星
	LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest(OwnerID(),423267) == true	then  
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423267_0]","LuaS_423267_0_1",0)		--你們在瓦納多肯碉堡有更深入的發現嗎？
	end

end


function LuaS_423267_0_1()
	SetSpeakDetail(OwnerID(),"[SC_423267_1]")							--呵呵～碉堡的事情，卡爾會仔細說給你們聽。
	SetFlag(OwnerID(), 544004, 1)
end



function LuaS_423267_1()	--夜梟
	LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest(OwnerID(),423267) == true	then    
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423267_0]","LuaS_423267_1_1",0)		--你們
	end
end

function LuaS_423267_1_1()
	SetSpeakDetail(OwnerID(),"[SC_423267_2]")						--羅嚴．傑爾在卻普瑞谷地失敗後，
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423267_3]","LuaS_423267_1_2",0)		--夏多爾是因為使者的假諭令造成錯誤決策，艾娜莉亞可以操控屍體？
End


function LuaS_423267_1_2()
	SetSpeakDetail(OwnerID(),"[SC_423267_4]")						--十三年前，碉堡內還沒有聽說過操控屍體這類事
	SetFlag(OwnerID(), 544005, 1)
end


function LuaS_423267_2()	--湯尼115411
	LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest(OwnerID(), 423266) == true	then  
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423266_2]","LuaS_423266_1",0)	--陛下？	
	end

	if	CheckAcceptQuest(OwnerID(),423267) == true then
		if 	CheckFlag(OwnerID(),544004) == true and CheckFlag(OwnerID(),544005) == true	and	CheckFlag(OwnerID(),544006) == false	then
			if	(ReadRoleValue( TargetID() , EM_RoleValue_Register+9 )  == 0)	 then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423267_5]","LuaS_423267_2_3",0)	--我
			else
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423267_5]","LuaS_423267_2_2",0)	--我
			end
		end
	end
end

function LuaS_423267_2_2()
	SetSpeakDetail(OwnerID(),"[SC_423267_6]")		--所以，艾娜莉亞極有可能是操控屍體
End

function LuaS_423267_2_3()
	WriteRoleValue( TargetID() , EM_RoleValue_Register+9 , 2 )		--TargetID是湯尼
	closespeak(OwnerID())
	BeginPlot(TargetID()  , "LuaS_423267_2_5" , 0 )

end

function LuaS_423267_2_5()
	AddBuff( TargetID()  , 506743, 1 , 90 )	
	Yell(OwnerID(), "[SC_423267_7]" , 3 )			--綜合這些情報，瓦納多肯碉堡的亂象
	
	local STAR = Lua_DW_CreateObj("flag",115416, 780622,8 )			--<晨星出現>
	MoveToFlagEnabled(STAR, false )
	WriteRoleValue(STAR, EM_RoleValue_IsWalk, 1)

	local NIGHT = Lua_DW_CreateObj("flag",115415, 780622,7 )			--<夜梟出現>		
	MoveToFlagEnabled(NIGHT, false )	
	WriteRoleValue(NIGHT, EM_RoleValue_IsWalk, 1 )

	Yell(NIGHT , "[SC_423267_8]" , 3 )			--這件事先讓我來處理。
	Sleep(20)

	local Itry=ReadRoleValue( OwnerID() , EM_RoleValue_Register+3 ) 
	Yell(Itry, "[SC_423267_9]" , 3 )			--陛下，屬下也認為我們可以先回夏多爾，讓屬下先查
	Sleep(20)

	Yell(OwnerID(), "[SC_423267_10]" , 3 )			--伊崔妮，別擔心，這次我不會貿然行事。
	Sleep(20)
	Yell(OwnerID(), "[SC_423267_11]" , 3 )			--夜梟…卡爾．戴維斯，我明白你想
	Sleep(20)

	Yell(NIGHT , "[SC_423267_12]" , 3 )			--等查清當年來不及釐清
	Sleep(30)
	Yell(NIGHT , "[SC_423267_13]" , 3 )			--順利解決此事，
	Sleep(20)

	Yell(NIGHT , "[SC_423267_14]" , 3 )			--在此，我以墨斐拉．傑爾
	Sleep(20)

	Yell(OwnerID(), "[SC_423267_15]" , 3 )			--墨斐拉．傑爾…你的本名，
	Sleep(20)
	BeginPlot(STAR , "LuaS_423267_2_4", 0 )
	LuaFunc_MoveToFlag(NIGHT , 780622,5,0)
	DelObj(NIGHT )
	if 	CheckFlag(TargetID(),544006) == false	then
		SetFlag(TargetID(), 544006, 1)
	end
	if	CheckBuff(TargetID () , 506742) == true then
		CancelBuff_NoEvent(TargetID() , 506742)
	end
	WriteRoleValue(OwnerID () , EM_RoleValue_Register+9, 0 )
End

function LuaS_423267_2_4()
	LuaFunc_MoveToFlag(OwnerID(), 780622,6,0)
	DelObj(OwnerID())
end








