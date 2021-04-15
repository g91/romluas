--梅奇由達 的編號 112866
function LuaS_112866_0()
	LoadQuestOption(OwnerID())
	if ( CheckCompleteQuest( OwnerID() , 422282 ) == false or CheckCompleteQuest( OwnerID() , 422283 ) == false or CheckCompleteQuest( OwnerID() , 422284 ) == false ) then
		if CountBodyItem( OwnerID() , 204615 ) == 0 then
			local Check = 0
			if ( CheckAcceptQuest( OwnerID() , 422281 ) == true or CheckCompleteQuest( OwnerID() , 422281 ) == true ) then
				if  ( CheckAcceptQuest( OwnerID() , 422282 ) ==true and CountBodyItem( OwnerID() , 204616 ) == 0 ) then
					Check = 1
				end
				if  ( CheckAcceptQuest( OwnerID() , 422283 ) ==true and CountBodyItem( OwnerID() , 204617 ) == 0 ) then
					Check = 1
				end
				if  ( CheckAcceptQuest( OwnerID() , 422284 ) ==true and CountBodyItem( OwnerID() , 204618 ) == 0 ) then
					Check = 1
				end
			end
			if Check == 1 then
				AddSpeakOption(OwnerID(),TargetID(),"[SC_112866_0]","LuaS_112866_1",0) --順便幫他送其他東西
			end
		end
	end
end
function LuaS_112866_1()
	CloseSpeak( OwnerID() )
	if CountBodyItem( OwnerID() , 204615 ) == 0 then
		GiveBodyItem( OwnerID() , 204615 , 1 )
	end
	if ReadRoleValue( TargetID() , EM_RoleValue_Register ) == 0 then
		Beginplot( TargetID() , "LuaS_112866_2" , 0 )
	end
end

function LuaS_112866_2()
	WriteRoleValue( OwnerID() , EM_RoleValue_Register  , 1 )
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Say( OwnerID() , "[SC_112866_1]" ) --袋子裡還有一些要給學生們的東西，你可以從東西上頭小紙條的說明瞭解那些學生的位置，麻煩你也順道幫我將東西送過去給他們吧！
	sleep(30)
	WriteRoleValue( OwnerID() , EM_RoleValue_Register  , 0 )		
end
--梅奇由達的袋子
function LuaI_204615_0()
	local Bag = 0
	if CheckAcceptQuest( OwnerID() , 422281 ) == true or CheckCompleteQuest( OwnerID() , 422281 ) == true or CheckAcceptQuest( OwnerID() , 422282 ) ==true or CheckAcceptQuest( OwnerID() , 422283 ) == true or CheckAcceptQuest( OwnerID() , 422284 ) == true then
			if CountBodyItem( OwnerID() , 204616 ) < 1 and CheckCompleteQuest( OwnerID() , 422282 ) == false then
				GiveBodyItem( OwnerID() , 204616, 1 )
				Bag = Bag + 1
			end
			if CountBodyItem( OwnerID() , 204617 ) < 1 and CheckCompleteQuest( OwnerID() , 422283 ) == false then
				GiveBodyItem( OwnerID() ,204617, 1 )
				Bag = Bag + 1
			end
			if CountBodyItem( OwnerID() , 204618 ) < 1 and CheckCompleteQuest( OwnerID() , 422284 ) == false then
				GiveBodyItem( OwnerID() , 204618 , 1 )
				Bag = Bag + 1
			end
			if Bag == 0 then
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204615_0]" , 0  ) --這個袋子中沒有任何東西
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204615_0]" , 0  )
			end
	else
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204615_1]" , 0  ) --這個袋子對你來說不具任何意義
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204615_1]" , 0  )
	end
	UseItemDestroy()
end

--梅奇由達的方巾
function LuaI_204616_0()
	local str = "["..GetUseItemGUID(OwnerID()).."]"
	ClearBorder( OwnerID());
	AddBorderPage( OwnerID(), GetQuestDetail( 422282, 1 ));
	ShowBorder( OwnerID(), 422282, str ,"ScriptBorder_Texture_Paper" )
end
--梅奇由達的手印泥板
function LuaI_204617_0()
	local str = "["..GetUseItemGUID(OwnerID()).."]"
	ClearBorder( OwnerID());
	AddBorderPage( OwnerID(), GetQuestDetail( 422283, 1 ));
	ShowBorder( OwnerID(), 422283, str , "ScriptBorder_Texture_Paper" )
end
--梅奇由達的簽名畫像
function LuaI_204618_0()
	local str = "["..GetUseItemGUID(OwnerID()).."]"
	ClearBorder( OwnerID());
	AddBorderPage( OwnerID(), GetQuestDetail( 422284, 1 ));
	ShowBorder( OwnerID(), 422284, str , "ScriptBorder_Texture_Paper" )
end
--親自指導 任務編號 422286
function LuaQ_422286_Complete()
	DisableQuest( OwnerID() , true)
	local Org = Role:new( OwnerID()  )
	local Pos = {}
	local Dir = Org:Dir()
	local  NewRole
	local Cal

	Cal = (math.pi/180)*(Dir ) 
	Pos["X"] = Org:X() +(70*math.cos(Cal))
	Pos["Z"] = Org:Z() - (70*math.sin(Cal))
	Pos["Y"] = GetHeight( Pos["X"] , Org:Y() , Pos["Z"] )
	Pos["X2"] = Org:X() +(30*math.cos(Cal))
	Pos["Z2"] = Org:Z() - (30*math.sin(Cal))
	Pos["Y2"] = GetHeight( Pos["X2"] , Org:Y() , Pos["Z2"] )
	local Dir2 = Dir + 180
	if Dir2 > 360 then
		Dir2 = Dir2 - 360 
	end
	local Teacher = CreateObj ( 112866 , Pos["X"]  , Pos["Y"] , Pos["Z"] , Dir2 , 1)
	DisableQuest( Teacher , true)
	Lua_ObjDontTouch( Teacher  ) 
	AddToPartition( Teacher  , 0 )
	MoveToFlagEnabled( Teacher , false )
	WriteRoleValue( Teacher , EM_RoleValue_IsWalk , 1 )
	sleep(10)
	Move( Teacher  , Pos["X2"] , Pos["Y2"] , Pos["Z2"] )
	AdjustFaceDir( OwnerID(), Teacher, 0 ) 
	sleep( 30 )
	PlayMotion(Teacher  , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Say( Teacher , "[SC_422286_0]" )--聽說你在學習上遇到瓶頸，瑞金斯？
	sleep( 30 )
	PlayMotion(OwnerID()  , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Say( OwnerID() , "[SC_422286_1]" )--真的是梅奇由達大師！我竟然有這個榮幸，跟大師這麼近距離的說話。
	sleep( 30 )
	PlayMotion(Teacher  , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Say( Teacher , "[SC_422286_2]" )--你將一件平凡的事情過度誇張了，孩子。在出征之所裡學習，只要你有任何問題，隨時都可以來找我的。
	sleep( 30 )
	PlayMotion(OwnerID()  , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Say( OwnerID() , "[SC_422286_3]" )--我真的可以嗎？大師。
	sleep( 30 )
	PlayMotion( Teacher , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Say( Teacher , "[SC_422286_4]" )--你當然可以，孩子。準備好後，就直接到戰技練習場來吧，讓我實際看看你的動作，再針對你的盲點給予你建議。
	sleep( 30 )
	PlayMotion(OwnerID()  , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Say( OwnerID() , "[SC_422286_5]" )--是的，大師。我將練習用的戰技護具穿好，馬上就到練習場去。
	sleep( 30 )
	Move( Teacher  , Pos["X"] , Pos["Y"] , Pos["Z"] )
	sleep( 20 )
	SetDir( OwnerID(), Dir )
	sleep( 10 )
	DelObj( Teacher )
	DisableQuest( OwnerID() , false)
end