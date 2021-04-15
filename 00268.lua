function LuaI_BossDoor_Zone2A()
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 )
	SetPlot( OwnerID() , "Touch" , "LuaI_BossDoor_Zone2A_0",40)	
end

function LuaI_100_BOSS1() 
	SetPlot( OwnerID() , "dead" , "LuaI_100_BOSS1_Dead",40)	
end

function LuaI_100_BOSS1_Dead() 
	GiveBodyItem( TargetID() ,200666 , 1 )
	local master=ReadRoleValue(TargetID(),EM_RoleValue_OwnerGUID )
		if master~=-1 then GiveBodyItem( master ,200666 , 1 ) end
	local PlayerLV = ReadRoleValue( TargetID() , EM_RoleValue_LV )
	local PlayerSUBLV = ReadRoleValue( TargetID() , EM_RoleValue_LV_SUB )
	DesignLog(OwnerID(),100561,"Killer Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)
	return true
end

function LuaI_100_BOSS2() 
	SetPlot( OwnerID() , "dead" , "LuaI_100_BOSS2_Dead",40)	
end

function LuaI_100_BOSS2_Dead() 
	GiveBodyItem(TargetID() ,200667 , 1 )
	local master=ReadRoleValue(TargetID(),EM_RoleValue_OwnerGUID )
		if master~=-1 then GiveBodyItem( master ,200667 , 1 ) end
	local PlayerLV = ReadRoleValue( TargetID() , EM_RoleValue_LV )
	local PlayerSUBLV = ReadRoleValue( TargetID() , EM_RoleValue_LV_SUB )
	DesignLog(OwnerID(),100562,"Killer Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)
	return true
end

function LuaI_100_BOSS3() 
	SetPlot( OwnerID() , "dead" , "LuaI_100_BOSS3_Dead",40)	
end

function LuaI_100_BOSS3_Dead() 
	GiveBodyItem( TargetID() ,200668 , 1 )
	local master=ReadRoleValue(TargetID(),EM_RoleValue_OwnerGUID )
		if master~=-1 then GiveBodyItem( master ,200668 , 1 ) end
	local PlayerLV = ReadRoleValue( TargetID() , EM_RoleValue_LV )
	local PlayerSUBLV = ReadRoleValue( TargetID() , EM_RoleValue_LV_SUB )
	DesignLog(OwnerID(),100563,"Killer Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)
	return true
end
--------------------------------------------------------------------------------------------------------------------
function LuaI_BossDoor_Zone2A_0()

	if CountBodyItem( OwnerID() , 200666 ) > 0 then --檢查鑰匙
		local val = ReadRoleValue( TargetID() , EM_RoleValue_PID );
		local val2 = val - math.floor( val / 10 )*10;
		if( val2 == 0 )then
			DelBodyItem( OwnerID() , 200666 , 1 )
			WriteRoleValue( TargetID() , EM_RoleValue_PID , (val + 1) );
			ScriptMessage( OwnerID(), 0, 0, GetString("SAY_ZONE2A_DOOR_0"), C_YELLOW ); --/*缺少綠色魔法徽記。			
		end
	end
	if CountBodyItem( OwnerID() , 200667 ) > 0 then --檢查鑰匙
		local val = ReadRoleValue( TargetID() , EM_RoleValue_PID );
		local val2 = val - math.floor( val / 100 )*100;
		if( val2 < 10    )then
			DelBodyItem( OwnerID() , 200667 , 1 )
			WriteRoleValue( TargetID() , EM_RoleValue_PID , (val +10) )
			ScriptMessage( OwnerID(), 0, 0, GetString("SAY_ZONE2A_DOOR_1"), C_YELLOW ); --/*缺少紅色魔法徽記。
		end

	end
	if CountBodyItem( OwnerID() , 200668 ) > 0 then --檢查鑰匙
		local val =  ReadRoleValue( TargetID() , EM_RoleValue_PID ) 
		if ReadRoleValue( TargetID() , EM_RoleValue_PID ) < 100 then
			DelBodyItem( OwnerID() , 200668 , 1 )
			WriteRoleValue( TargetID() , EM_RoleValue_PID , (val + 100) )
			ScriptMessage( OwnerID(), 0, 0, GetString("SAY_ZONE2A_DOOR_2"), C_YELLOW ); --/*缺少黃色魔法徽記。
		end
	end

	if ReadRoleValue( TargetID() , EM_RoleValue_PID ) == 111 then
		ScriptMessage( OwnerID(), 0, 1, GetString("SAY_ZONE2A_DOOR_3"), C_YELLOW ); --/*你將三個魔法徽記放到對應的位置，門緩緩地打開了。
		BeginPlot( TargetID() , "LuaI_BossDoor_Zone2A_1",0)
		SetPlot( TargetID() , "Touch" , "",0 )
	else
		ScriptMessage( OwnerID(), 0, 0, GetString("SAY_ZONE2A_DOOR_4"), 0) --/*必須從三個僕役身上取得三種徽記，這扇門上的魔法才能解除。
		return
	end

end
--------------------------------------------------------------------------------------------------------------------
function LuaI_BossDoor_Zone2A_1()

	local Player = LuaFunc_PartyData( TargetID() )
	Local V_Ankaria = LuaFunc_SearchNPCbyOrgID( OwnerID() , 100074 , 500 )
	local Count = 0
	for i = 1 , Player[0] , 1 do
		if CheckAcceptQuest( Player[i] , 420552 ) == true then
			Count = 1
		end
	end 
	if Count ~= 0 then
		BeginPlot( V_Ankaria , "LuaI_BossPlay" , 0 )
	end

	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP )
	sleep( 40 )
end
--------------------------------------------------------------------------------------------------------------------
function LuaI_BossPlay()

	local Room = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID )			
	local Ser1 = CreateObjByFlag( 100069,780022,3,1)
	local Ser2 = CreateObjByFlag( 100069,780022,4,1)
	Show( Ser1, Room)
	Show( Ser2, Room)

	SetRoleCamp( OwnerID() , "Visitor" )
	SetRoleCamp( Ser1 , "Visitor" )
	SetRoleCamp( Ser2 , "Visitor" )

	Yell( OwnerID(),GetString("SAY_100074_0") , 5) --/*你們可以先讓我離開這些咒縛，我就能幫助你們更多。
	sleep(30)
	Yell( Ser1,GetString("SAY_100069_0") , 5) --/*經由索雷爾頓之環的示意，在整個計畫更完善之前，我們不希望有太大的動作而打草驚蛇。
	sleep(30)
	Yell( OwnerID(),GetString("SAY_100074_1"),5) --/*喔？我看你們只是想要這個筆記吧！說到底你們只是在利用我！
	sleep(30)
	Yell( Ser1,GetString("SAY_100069_1"),5) --/*不要太著急，我們的計畫必然會使虛界與現實合而為一，到時候你自然能獲得離開這裡的力量。						
	sleep(30)
	Yell( OwnerID(),GetString("SAY_100074_2"),5) --/*別以為自己擁有和我相同的地位，我現在雖然缺乏力量，但要殺死你們仍輕而易舉。
	sleep(30)
	Yell( Ser1,GetString("SAY_100069_2"),5) --/*閣下，但這些從剛剛就在這裡的入侵者，似乎代表你的力量有點...嗯...連關好門都有問題吧？
	sleep(30)

	Yell( OwnerID(),GetString("SAY_100074_4"),5) --/*趁還能笑的時候笑吧！等你們看到他們怎麼死的，我相信你們會學到與我交涉時應該具備的禮貌。
	sleep(30)
	Yell( Ser1,GetString("YELL_100069"),5) --/*閣下的幽默很值得欣賞，但為了保險起見，我們也會加入戰鬥，請閣下見諒。

	SetRoleCamp( OwnerID() , "Monster" )
	SetRoleCamp( Ser1 , "Monster" )
	SetRoleCamp( Ser2 , "Monster" )				

end
--------------------------------------------------------------------------------------------------------------------