--780030 的旗標編號
-- 81~92 士兵包圍玩家的位置
-- 101 ~ 112 士兵進入密道前列隊的位置
-- 0 奧古達出現的位置
-- 1 奧古達移動到稍前的位置、集合士兵的位置
-- 2 奧古達的定位
-- 3 
-- 4 奧古達與多魯梭戰鬥時，奧古達的位置\屍骸奧古達出現的位置
-- 5 奧古達與多魯梭戰鬥時，多魯梭的位置
-- 6 多魯梭原來的位置
-- 7 赫龍出現的位置
-- 8 
-- 9
-- 61~71 士兵屍體的位置
-- 72~80 魔物屍體的位置
-- 10 ~ 30 通過密道的旗標
----------------------------------------------------------------------------------------------------------
--奧古達一開始的劇情
function LuaI_420278() --設定範圍劇情點
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	sleep(5)
	Ver_Zone103_Trap[RoomID]["OGD"] = OwnerID()
	Ver_Zone103_Trap[RoomID]["DRAMA"] = 0
	SetPlot( OwnerID() ,"Range" , "LuaI_420278_Range" , 300 )
end
function LuaI_420278_Range()
	SetPlot( TargetID() ,"Range" , "" , 0 )
	BeginPlot( TargetID() , "LuaI_420278_Play", 0  )
end
function LuaI_420278_Play()
	local Soldier = LuaFunc_SearchNPCbyOrgID( OwnerID() , 110450 , 500 )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	Ver_Zone103_Trap[RoomID]["Soldiers"] = {}
	Ver_Zone103_Trap[RoomID]["Soldiers"] = Soldier
--	 --擺放士兵的位置是後來他們回到的原位
	local i = 0
	local OGD = OwnerID()
	DisableQuest( OGD , true )
	MoveToFlagEnabled( OGD, false );
	FaceObj( TargetID() , OGD )
	sleep( 10 )
	yell( OGD ,  GetString("SAY_110247_1"),5 ) --/*你們聞起來和那群入侵者不同……是巫醫說的那群人類吧！
	sleep( 20 )
	yell( OGD ,  GetString("SAY_110247_2") ,5) --/*巫醫要我們別干擾你們的使命，而我也希望你們別干擾我們的作戰。
	LuaFunc_MoveToFlag( OGD,780030 , 0 ,0 )
	sleep( 30 )
	yell( OGD ,  GetString("SAY_110247_3"),5 ) --/*不過若你們對於作戰內容有興趣，我這裡倒是有一些有意思的工作。	
	while 1 do 
		if Soldier[i] == -1 then
			break
		end
		WriteRoleValue( Soldier[i] , EM_RoleValue_PID , i )
		BeginPlot( Soldier[i],"LuaI_420278_RUNNING",0)
		sleep(1)
		i = i + 1 
	end
	sleep( 30 )
	LuaFunc_MoveToFlag( OGD, 780030 , 2 ,0 )
	--這裡接開啟大門的劇情
	DisableQuest( OGD , false )
	
end
function LuaI_420278_RUNNING()
	local i = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	MoveToFlagEnabled(OwnerID(), false );
	WriteRoleValue(OwnerID() ,EM_RoleValue_IsWalk , 0  )
	LuaFunc_MoveToFlag( OwnerID() , 780030 , i+81 ,0 ) --擺放士兵的位置81~92
	WriteRoleValue( OwnerID() ,EM_RoleValue_IsWalk ,1)			
end