--�I�䤧��������
function LuaI_110250_0()
	SetPlot( OwnerID() , "touch" , "LuaI_110250_1" , 40 )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	sleep(5)
	Ver_Zone103_Trap[RoomID]["FIRECONTROL"] = OwnerID() 
end

function LuaI_110449_Range()
	ScriptMessage( TargetID(), 0, 1, GetString("EM_110449_0"), 0 ); --/*�K�D���j�������A�L�k�e�i
end

function LuaI_110250_1()
	BeginPlot( TargetID() , "LuaI_110250_Touch" , 0 )
end

function LuaI_110250_Touch()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local CheckState = Ver_Zone103_Trap[RoomID]["TARPA"] 

	if CountBodyItem( TargetID() , 200734 ) > 0 then
		SetPlot(OwnerID(),"touch","",0)
		local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		local Fire1 = Ver_Zone103_Trap[RoomID]["Fire1"] 
		local Fire2 = Ver_Zone103_Trap[RoomID]["Fire2"] 
		local BOX1 = Ver_Zone103_Trap[RoomID]["BOX1"] 
		local BOX2 = Ver_Zone103_Trap[RoomID]["BOX2"] 
		DelBodyItem( TargetID() , 200734 , 1 )
		if CheckState == "CLOSE" then
			PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP )
			Sleep( 20 )
			PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_ACTIVATE_END )
			ScriptMessage( OwnerID() , 0, 1, GetString("EM_110449_2"), 0 )
			SetPlot( OwnerID() , "touch" , "LuaI_110250_1" , 40 )
		else
			local Player = LuaFunc_PartyData(TargetID())
			for i = 1 , Player[0] , 1 do
				if CheckAcceptQuest( Player[i] , 420279) == true and CheckFlag( Player[i] , 540207) == false then
					SetFlag( Player[i] , 540207 , 1 )
				end 	
			end
			Hide( Fire1 )
			Hide( Fire2 )
			ScriptMessage( Fire1 , 0, 1, GetString("EM_110449_1"), 0 ) --/*�K�D�������K�����F�C
			ScriptMessage( Fire2 , 0, 1, GetString("EM_110449_1"), 0 ) --/*�K�D�������K�����F�C
			sleep(5)
			Hide( BOX1 )
			Hide( BOX2 )
			PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP )

			local EatFireMonsterTrap = CallMonsterNORepeat( TargetID(), OwnerID(), "EatFireMonsterTrap" )		-- Ĳ�o�����H���X�{�����]��������	
		end
		sleep(30)
--		PlaySound( TargetID(), "Interface\Sound\xxxx.wav", false ); --���񭵮�

	end
end

function LuaQ_110250_End()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP )
	Sleep( 30 )
	SetPlot(OwnerID(),"touch","",0)
end

function LuaI_FireTrapA() 

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	sleep(5)
	Ver_Zone103_Trap[RoomID]["Fire1"] = OwnerID() --�ǻ��ۤv��ID

end
function LuaI_FireTrapB() 

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	sleep(5)
	Ver_Zone103_Trap[RoomID]["Fire2"] = OwnerID() --�ǻ��ۤv��ID
end
function LuaI_BlockA() 

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	sleep(5)
	Ver_Zone103_Trap[RoomID]["BOX1"] = OwnerID() --�ǻ��ۤv��ID
	SetPlot( OwnerID() , "range" ,"LuaI_110449_Range" , 75 )

end
function LuaI_BlockB() 

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	sleep(5)
	Ver_Zone103_Trap[RoomID]["BOX2"] = OwnerID() --�ǻ��ۤv��ID
	SetPlot( OwnerID() , "range" ,"LuaI_110449_Range" , 75 )
end
----------------------------------------------------------------------------------------------------------
--�w������
function LuaI_110249()
	SetPlot(OwnerID(),"touch","LuaI_110249_Touch",40)
end

function LuaI_110249_Touch()
	if CountBodyItem(OwnerID(),200734) == 0 then
		SetPlot(TargetID(),"touch","LuaFunc_Obj_BUSY",40)
		GiveBodyItem( OwnerID() , 200734 , 1 )
		
		local MagicGroup = {491021, 491021, 491022, 491022, 491023, 491023 }
		local TrapMagic = MagicRND( TargetID() , OwnerID() , MagicGroup )	-- Ĳ�o�����H���ˮ`�k�N
		local WaterElfMonsterTrap = CallMonsterNORepeat( OwnerID(), TargetID(), "WaterElfMonsterTrap" )	-- Ĳ�o�����H���X�{���F������

		sleep( 5 )
		SetPlot(TargetID(),"touch","LuaI_110249_Touch",40)
	else
		Say( OwnerID(), GetString("ST_110249") )	-- �@���t���N�w�g�����F�I
	end
end
----------------------------------------------------------------------------------------------------
--�b����������
function LuaI_110780() --�]�w������l�@���A�P�ɭ��m�����ܼ�

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	sleep(5)
	Ver_Zone103_Trap[RoomID]["Door1"] = OwnerID() --�ǻ��ۤv��ID

end

function LuaI_110781() --�]�w������l�@���A�P�ɭ��m�����ܼ�

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	sleep(5)
	Ver_Zone103_Trap[RoomID]["Door2"] = OwnerID() --�ǻ��ۤv��ID

end

function LuaI_110248()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	Ver_Zone103_Trap[RoomID] = {} 
	sleep(5)
	SetPlot( OwnerID() , "touch" , "LuaI_110248_Open" , 40 )
	Ver_Zone103_Trap[RoomID]["TARPA"] = "CLOSE" 
	Ver_Zone103_Trap[RoomID]["STATE"] = OwnerID() 
end

function LuaI_110248_Open()
	SetPlot(TargetID(),"touch","",0)
	BeginPlot( TargetID() , "LuaI_110248_Door" , 0 )
end

function LuaI_110248_Door()
	
	local Target = Role:new(TargetID())
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Door1 = Ver_Zone103_Trap[RoomID]["Door1"]
	local Door2 = Ver_Zone103_Trap[RoomID]["Door2"]
--	SAY( OwnerID() , Door )
	for i = 0 , 9 , 1 do
		sleep( 5 )
		AdjustDir( OwnerID(), 18 )
		Hide(OwnerID() )
		Show(OwnerID() , RoomID )
	end
	local Player = LuaFunc_PartyData(TargetID())
	for i = 1 , Player[0] , 1 do
		if CheckAcceptQuest( Player[i] , 420278) == true and CheckFlag( Player[i] , 540206) == false then
			SetFlag( Player[i] , 540206 , 1 )
		end 
	end
	Ver_Zone103_Trap[RoomID]["TARPA"] = "OPEN" 
	sleep( 10 )
	Delobj( Door1 )
	Delobj( Door2 )

	
end

function LuaQ_110248_End()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	if Ver_Zone103_Trap[RoomID]["TARPA"] == "CLOSE" then
		AdjustDir( OwnerID(), 180)
		Hide(OwnerID() )
		Show(OwnerID() , RoomID )
		SetPlot(OwnerID(),"touch","",0)
	end
end
--------------------------------------------------------------------------------------------