

Function Hsiang_TreasureTest() --神願之蛋

	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[203553]][$SETVAR3=[203553]]"

	local itemset = {  	  15 ,Prize1Str	, { 202928,4 , 206340,11, 202881,1}
			, 30 ,Prize1Str	, { 202928,4 , 206340,12, 202881,1}
			, 50 ,""		, { 202928,4 , 206340,13, 202881,1}
			, 70 ,""		, { 202928,4 , 206340,14}
			, 72 ,""		, { 206340,15} 
			, 75,"" 		, { 206340,16}
			, 80,"" 		, { 202928,4 , 206340,17} 
			, 100,""		, { 202928,4 , 206340,18} }


	return BaseTressureProc(   itemset  , 5  )
end


Function Hsiang_TreasureTest2() --神願之蛋

	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[203553]][$SETVAR3=[203553]]"

	local itemset = {  	  -1 ,""	, { 202506,1 }
			, 10 ,""	, { 202928,2 }
			, 30 ,""		, { 202928,3 }
			, 50 ,""		, { 202928,4  }
			, 52 ,""		, { 206340,5} 
			, 55 ,"" 		, { 206340,6}
		--	, 80 ,"7" 		, { 202928,7 } 
		--	, 100,"8"		, { 202928,8 } 
							}


	return BaseTressureProc2(   itemset  , 3  )
end


function BaseTressureProc2(   itemset  , maxprizecount  )

	--檢查是否夠欄位			
	if Check_Bag_Space( OwnerID() , maxprizecount ) == false then
		return false
	end

	GiveBodyItem( OwnerID() , itemset[3][1] , itemset[3][2 ] )

	for i = 1 , maxprizecount   do
		local RandValue = rand(100)
		for i = 4 , table.getn( itemset ),3 do
			if RandValue < itemset [i] then		
				GiveBodyItem( OwnerID() , itemset[i+2][1] , itemset[i+2][2 ] )
				if itemset[i+1] ~= "" then
					RunningMsgEx( OwnerID() , 2 , 2 , itemset[i+1] )
				--	RunningMsg( OwnerID() , 2 , itemset[i+1] )
				end
			return true;
			end
		end
	end
	
	return true;

end
Function Hsiang_TreasureTest3() --神願之蛋

	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[203553]][$SETVAR3=[203553]]"

	local itemset = {  	  20 ,""		, { 202506,1 }
			, 20 ,""		, { 202928,2 }
			, 20 ,""		, { 202928,3 }
			, 20 ,""		, { 202928,4 }
			, 20 ,""		, { 206340,5 } 
			, 20 ,"" 		, { 206340,6 }
			, 20 ,"" 		, { 202928,7 } 
			, 20 ,""		, { 202928,8 } 
							}


	return BaseTressureProc3(   itemset  , 3  )
end

function BaseTressureProc3(   itemset  , maxprizecount  )

	--檢查是否夠欄位			
	if Check_Bag_Space( OwnerID() , maxprizecount ) == false then
		return false
	end
	local count = 0

	for i = 1 , table.getn( itemset ),3 do
		local RandValue = rand(100)
		if RandValue < itemset [i] then		
			GiveBodyItem( OwnerID() , itemset[i+2][1] , itemset[i+2][2 ] )
			if itemset[i+1] ~= "" then
				RunningMsgEx( OwnerID() , 2 , 2 , itemset[i+1] )
			--	RunningMsg( OwnerID() , 2 , itemset[i+1] )
			end
			count = count + 1;
			if count >= maxprizecount then
				break;
			end
		end
	end

	if count == 0 then
		GiveBodyItem( OwnerID() , itemset[3][1] , itemset[3][2 ] )	
	end
	
	return true;

end

Function Hsiang_TreasureTest7() --神願之蛋

	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[203553]][$SETVAR3=[203553]]"

	if Check_Bag_Space( OwnerID() , 2 ) == false then
		return false
	end
	
	local itemset1 = {  	 
		10 ,""	, { 202928,2 }
			, 30 ,""		, { 202928,3 }
			, 50 ,""		, { 202928,4  }
			, 52 ,""		, { 206340,5} 
			, 55 ,"" 		, { 206340,6}
		--	, 80 ,"7" 		, { 202928,7 } 
		--	, 100,"8"		, { 202928,8 } 
							}
							
	local itemset2 = {  	 
		10 ,""	, { 202928,2 }
			, 30 ,""		, { 202928,3 }
			, 50 ,""		, { 202928,4  }
			, 52 ,""		, { 206340,5} 
			, 55 ,"" 		, { 206340,6}
		--	, 80 ,"7" 		, { 202928,7 } 
		--	, 100,"8"		, { 202928,8 } 
							}							
							

	BaseTressureProc7(   itemset1 , 1 );
	BaseTressureProc7(   itemset2 , 1 );
	
	return true;
end

function BaseTressureProc7(   itemset  , maxprizecount  )

	for i = 1 , maxprizecount   do
		local RandValue = rand(100)
		for i = 1 , table.getn( itemset ),3 do
			if RandValue < itemset [i] then		
				GiveBodyItem( OwnerID() , itemset[i+2][1] , itemset[i+2][2 ] )
				if itemset[i+1] ~= "" then
					RunningMsgEx( OwnerID() , 2 , 2 , itemset[i+1] )
				--	RunningMsg( OwnerID() , 2 , itemset[i+1] )
				end
			return true;
			end
		end
	end
	
	return true;

end


function BaseTressureProc(   itemset  , maxprizecount )

	local RandValue = rand(100)

	for i = 1 , table.getn( itemset ),3 do
		if RandValue < itemset [i] then		
			--檢查是否夠欄位			
			if Check_Bag_Space( OwnerID() , maxprizecount ) == false then
				return false
			end
			
			for j = 1 , table.getn( itemset[i+2] ) ,2 do
				GiveBodyItem( OwnerID() , itemset[i+2][j] , itemset[i+2][j+1 ] )
			end
	
			if itemset[i+1] ~= "" then
				RunningMsgEx( OwnerID() , 2 , 2 , itemset[i+1] )
			--	RunningMsg( OwnerID() , 2 , itemset[i+1] )
			end
			return true;
		end
	end
	
	return false;
end


function Hsiang_SetRoleCampID( GItemID , CampID )
	SetRoleCampID( GItemID , CampID )
end
function Hsiang_SetExSkill(  SpellerID , SkillID , SkillLv )
	SetExSkill( OwnerID() , SpellerID , SkillID , SkillLv )
end

function Hsiang_DelExSkill(  SpellerID , SkillID  )
	DelExSkill( OwnerID() , SpellerID , SkillID )
end

function Hsiang_CreateObj_ByObjPoint(GItemID)
	local Obj = Role:new( OwnerID() )
	local ItemID = CreateObj_ByObjPoint( GItemID , 100052 ,'gate_01' )
	AddToPartition( ItemID  , Obj:RoomID() );
	ItemID = CreateObj_ByObjPoint( GItemID , 100052 ,'gate_02' )
	AddToPartition( ItemID  , Obj:RoomID() );
	ItemID = CreateObj_ByObjPoint( GItemID , 100052 ,'gate_03' )
	AddToPartition( ItemID  , Obj:RoomID() );
	ItemID = CreateObj_ByObjPoint( GItemID , 100052 ,'gate_04' )
	AddToPartition( ItemID  , Obj:RoomID() );

end

function Hsiang_SetRoomValue(KeyID,Value)
	local Obj = Role:new( OwnerID() )
	SetRoomValue( Obj:RoomID() , KeyID , Value )
end
function Hsiang_ClsRoomValue(KeyID)
	local Obj = Role:new( OwnerID() )
	ClsRoomValue( Obj:RoomID() , KeyID )
end



function Hsiang_SetMapMark()
	local Obj = Role:new( OwnerID() )
	SetMapMark( Obj:RoomID() , 0 , Obj:X() , Obj:Y() , Obj:Z() , "ABCDE" , 0 );
end
function Hsiang_ClsMapMark()
	local Obj = Role:new( OwnerID() )
	ClsMapMark( Obj:RoomID() , 0 );
end

function Hsinag_ReadAccountFlag(x)
	if( ReadAccountFlag( OwnerID() , x ) == true ) then
		say( OwnerID() , "AccountFlag[1]=true")
	else
		say( OwnerID() , "AccountFlag[1]=false")	
	end
end

function Hsinag_WriteAccountFlag(x,Value)
	WriteAccountFlag( OwnerID() , x , Value )
	say( OwnerID() , "OK"  )
end

function Hsinag_MoveDirect(x)
	local Owner = Role:new( OwnerID() ) 
	MoveDirect( OwnerID() , Owner:X() , Owner:Y()+x , Owner:Z() )
end

function Hsiang_InstanceSaveTest(a,b )
	WriteInstanceArg( a , b );
end

function Hsiang_InstanceLoadTest(a)
	Say( OwnerID() , "Key[" ..a .. "]=" ..ReadInstanceArg( a  ) );
end


function Hsiang_PetLootTreasure()
	local TreasureID;
	local WaitTime;
	local PetOwnerID = ReadRoleValue( OwnerID() , EM_RoleValue_OwnerGUID ); --寵物的主人

	while 1 do
		if (CheckBuff( PetOwnerID , 503479 ) == true) then		--主人身上有 自動撿寶的道具BUFF 時才撿
		--	Say( PetOwnerID , "1" )
			TreasureID = SearchTreasure( OwnerID() )
			if( TreasureID ~= 0 ) then
				EnableNpcAI( OwnerID() , false )
				WriteRoleValue( OwnerID() , EM_RoleValue_IsWalk , 0 )
				WaitTime = MoveTarget( OwnerID() , TreasureID )
				Sleep( WaitTime + 20 )
				if CheckBuff( PetOwnerID , 503479 ) == false then
				--	Say( PetOwnerID , "2" )
					break
				end
				GetTreasure( PetOwnerID , OwnerID() , TreasureID )
				Sleep( 20 )
				if CheckBuff( PetOwnerID , 503479 ) == false then
				--	Say( PetOwnerID , "3" )
					break
				end
				EnableNpcAI( OwnerID() , true )
			else
				if( ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID ) == 0 ) then
					Sleep( 50 )
				else
					Sleep( 10 )
				end
			end
		else
		--	Say( PetOwnerID , "0" )
			break
		end
	end
end


function Hsiang_GetTickCount()
	say( OwnerID() , GetTickCount() );
end

function Hsiang_Loop()
	for i = 0 , 100 do
		Say( OwnerID() , "Test " .. i )
		Sleep( 10 )
	end
end

--1234
function Hsiang_OpenEqGamble()
	OpenEqGamble( );
end


function Hsiang_MagicInfoTest()
	for i = 0 , 20 do
		Say( OwnerID() , "ID.."..ReadRoleValue( OwnerID() , EM_RoleValue_MagicID_SP+ i ) )
		Say( OwnerID() , "LV.."..ReadRoleValue( OwnerID() , EM_RoleValue_MagicPowerLv_SP + i ) )
	end
end

function Hsiang_DelJobTest()
	DelJob( OwnerID() , 1 );
end

function Hsiang_MoveTest()
	MoveToFlagEnabled(OwnerId() , false )
	WaitMoveTo( OwnerID() , 0 , 0 , 0 )
	Say( OwnerID() , "TEST" ..i )
	return

end

function Hsiang_DeadCount()
	Say(OwnerID() , "**Sys_NPC_DeadCount = "..Sys_NPC_DeadCount )
end

function Hsiang_FamousTest( )
	
	local Famouse1 = ReadRoleValue( OwnerID() , EM_RoleValue_Famous )
	Say( OwnerID() , "Fammous" .. Famouse1 );

	Famouse1 = Famouse1 + 10;
	WriteRoleValue( OwnerID() , EM_RoleValue_Famous ,  Famouse1  )


	Famouse1 = ReadRoleValue( OwnerID() , EM_RoleValue_Famous )
	Say( OwnerID() , "Fammous" .. Famouse1 );

end

function Hsiang_FollowTest_Init()
	SetPlot( OwnerID() , "Touch" , "Hsiang_FollowTest" , 50 );
end

function Hsiang_FollowTest()
	SetFollow( TargetID() , OwnerID() ) 
end

function Hsiang_DesignLogTest()
	DesignLog( OwnerID() , 10 , "1234王八" )
end

function Hsinag_SetReviveTest()
	ClearCampRevicePoint();
	SetCampRevicePoint( 0 , 1 , -1658 ,132, -5840, "Sys_Bank_Open" );
end

function Hsiang_SendMailTest()
	SendMail( "B0001" , "TEST" ,"Mail Test" );

end

function Hsiang_DelObjTest( x )
	DelObj(X)
end



function Hsiang_SetRelationTest( OID , TID )
	SetRelation(  OID , TID , EM_RelationType_Wife , 3.5 , EM_RelationType_Husband , 3.5 )
end

function Hsiang_GetRelationTest( OID , TID )
	Tell( OwnerID() , "RelationID =" ..  GetRelation( OID,TID ) );
end

function Hsiang_GetRelationLvTest( OID , TID )
	Tell( OwnerID() , "RelationLv =" ..  GetRelationLv( OID,TID ) );
end

function Hsiang_SetRelationLvTest( OID , TID, Lv )
	SetRelationLv( OID , TID , Lv )
end

function Hisnag_GiveBodyTest( x )
	GiveBodyItem( OwnerID() , x, 3 )
end


function Hsiang_SetValue(Type , Value )
	SetValue( OwnerID() , Type , Value )
end

function Hsiang_SetHonorParty(Value)
	WriteRoleValue( OwnerID() ,EM_RoleValue_TimeFlag , Value )
end

function Hsiang_SetBoxEnergy(Value)
	WriteRoleValue( OwnerID() ,EM_RoleValue_BoxEnergy , Value )
end

function Hsiang_LoopTest()
	for i = 0 , 10 , 1 do
		Sleep( 10 )
		Say( OwnerID() , i );
	end
end	


function Hsiang_OnMAtk( MagicID , Dmg )
	return Dmg*-1
end


function Hsiang_OnMAssist( MagicID )
	return false
end

function Hsiang_OnDead()
	return false
end

function Hsiang_OnKill()
	return false
end

function Hsiang_GiveEQ( )
	GiveBodyItem_EQ( OwnerID() , 210001 , 5 , 1 )
end

function Hsiang_TestObjInfo()
	Say( OwnerID() , "ImageID ="..GameObjInfo_Int( 210001 ,  "ImageID" ) )
	Say( OwnerID() , "Name="..GameObjInfo_Str( 210001 , "Name" ) )
end



function Hsiang_MoveTest1()
	
	local OwnerX = 471
	local OwnerY = 27
	local  OwnerZ =  -7447
	MoveToFlagEnabled( OwnerID(), false )
--	LuaFunc_WaitMoveTo( OwnerID(), OwnerX , OwnerY , OwnerZ  )
	MoveDirect( OwnerID(), OwnerX , OwnerY , OwnerZ  )
--	sleep(100)

end

function Hisnag_SetShopInit( )
 SetShop( OwnerID() , 600000, "" )
 SetPlot( OwnerID() , "touch" , "Hisnag_OpenShop" , 50 )
end

function Hisnag_OpenShop( )
 OpenShop( )
end