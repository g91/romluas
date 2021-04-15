--����NPC 124106 ���� (������)
function Lua_na_2014xmas_124106() --����
	local Owner = OwnerID()
	local Target = TargetID()
	local StartKey = 549354 --�����ȺX��
	local EndKey = 549353 --�C��X��	
	AdjustFaceDir(Target , Owner , 0 )
	if  	CheckFlag( Owner , EndKey) == true then
		SetSpeakDetail( Owner , "[SC_2014XMAS_03]" ) --���֧A�x�V�`�ּ֡I
	elseif CountBodyItem( Owner , 243286 ) >= 1 then
		SetSpeakDetail( Owner , "[SC_2014XMAS_02]" ) --���B�����u��������H�@�Ӥp�ɥ��k�A�ҥH�Ʊ�A���ֱN���浹�ڪ��f�f�[��C
	else
		SetFlag( Owner , StartKey, 1)	--������ܥ��ȺX��
		LoadquestOption( Owner )
	end
end

function Lua_na_2014xmas_124106_2()
	local Owner = OwnerID() --NPC
	local Target = TargetID() --PLAYER
	SetFlag( Target , 549353 , 1 ) --�������ȥΧP�_
	ScriptMessage( Target , Target, 2 , "[SC_2014XMAS_05]", 0 ) --�]����M�`�a�@�۳��H�K�^
	PlayMotion( Owner , ruFUSION_ACTORSTATE_USE	)
	Sleep(40)
	Tell(Target ,Owner , "[SC_2014XMAS_06]")  --�ש󧹦��F�I�·ЧA���ڰe�h���[��a�I
	ScriptMessage( Target , Target, 2 , "[SC_2014XMAS_07]", 0 ) --�]����M�`�a�@�۳��H�K�^
	GiveBodyItem( Target , 243286 , 1 )
	AddBuff( Target , 626280 , 0 , -1 )
end


--�ϰ쪫��@��
function Lua_na_2014Xmas_Flag() --����2014Xmas���ʺX�Ъ�������
	local Owner = OwnerID()
	local Room = ReadRoleValue( Owner , EM_RoleValue_RoomID)
	local Flag = 781452
	local Flower = {}
	local Ice = {}
	for i = 1 , 10 do --����10����
		Flower[i] = CreateObjByFlag( 124105 , Flag , i , 1 )	
		AddToPartition( Flower[i] , Room)
	end

	local ICE_PLACE = {	[1] = { 11, 12, 13, 14 } , 
				[2] = { 15, 16, 17, 18 } , 
				[3] = { 19, 20, 21, 22 }	}
	for j = 1 , 3 do  --����3�����B����
		local R = DW_Rand(#ICE_PLACE[j])
		Ice[j] = CreateObjByFlag( 109237 , Flag , ICE_PLACE[j][R] , 1 )
		WriteRoleValue( Ice[j] , EM_RoleValue_PID , j )
		AddToPartition( Ice[j] , Room)
		table.remove( ICE_PLACE[j] , ICE_PLACE[j][R])
	end
end


--���B������l�@���A�k�]
function Lua_na_2014Xmas_ICE()    
	local ID = OwnerID()
	local RoomID = ReadRoleValue( ID , EM_RoleValue_RoomID)
	local x,y,z,dir = DW_Location(ID)
	SetModeEx( ID , EM_SetModeType_Fight , true )--�i�������
	SetModeEx( ID , EM_SetModeType_Obstruct, false )--����
	SetModeEx( ID , EM_SetModeType_Strikback, false )--����
	SetModeEx( ID  , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( ID  , EM_SetModeType_Move, true )--����
	SetRandMove( ID , 40, 50 , 30)
	while true do 
		local XX = Rand(40)+30     --�Z��30~70��
		local Player = SearchRangePlayer( ID , XX ) --�P�_����O�_�����a
		if CheckID( Player[0] ) == true then	--�p�G����XX�������a
			local Dis = Rand(40)+20 
			AdjustFaceDir(ID, Player[0] , 180 ) --���V �I��
			WriteRoleValue( ID  ,EM_RoleValue_IsWalk , 0  )--�ζ]��
			sleep(5)
			Lua_MoveLine( ID , Dis ) --�ѦҪ���A�V�e���ʨ�Dis�Z������m (Dis �� �t�� �� �V�Ჾ��)
		else
			MoveDirect( ID , x, y, z)
		end
		sleep(10)
	end
end


--���b���B���������`�@��
function Lua_na_2014Xmas_Icedie() 
	local Owner = OwnerID()
	local Flag = 781452
	local Room = ReadRoleValue( Owner , EM_RoleValue_RoomID)
	local ICE_PLACE = {	[1] = { 11, 12, 13, 14 } , 
				[2] = { 15, 16, 17, 18 } , 
				[3] = { 19, 20, 21, 22 }	}
	local PID = ReadRoleValue( Owner , EM_RoleValue_PID)
	local R = DW_Rand(#ICE_PLACE[PID])
	local Ice = CreateObjByFlag( 109237 , Flag , ICE_PLACE[PID][R] , 1 )
	WriteRoleValue( Ice , EM_RoleValue_PID , PID )	
	AddToPartition(Ice , Room)
	return true
end


--�Ĥp��
function Lua_na_2014xmas_flower()
	local Owner = OwnerID()
	SetPlot( Owner , "touch" , "Lua_na_2014xmas_flower_1" , 10)
end

function Lua_na_2014xmas_flower_1()
	local Owner = OwnerID()
	local Target = TargetID()
	if CountBodyItem( Owner , 243284) >= 5 then
		ScriptMessage( Owner , Owner , 2 , "[SC_423188_1]" , 0 )
		return
	end
	if BeginCastBarEvent( Owner, Target,  "[SC_2014XMAS_01]" , 10, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "Lua_na_2014xmas_flower_2" ) ~= 1 then --10��bar�ʧ@�ɶ��A�r��"�Ķ���ä"
	end
end

function Lua_na_2014xmas_flower_2(Owner, CheckStatus)
	local Target = TargetID()
	EndCastBar( Owner, CheckStatus );
	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			-- ���\
			GiveBodyItem( Owner , 243284 , 1)
			BeginPlot( Target , "Lua_na_2014xmas_flower_3" , 0 )
		end
	end
end

function Lua_na_2014xmas_flower_3()
	local Owner = OwnerID()
	local R = DW_Rand(5)
	Hide( Owner)
	sleep(R*100)
	show(Owner , 0)
end

--�ϫ�������AĲ�I�@��
function Lua_na_2014Xmas_sheep()
	local Owner = OwnerID()
	SetPlot( Owner, "touch" , "Lua_na_2014Xmas_sheep2" , 10 )
end

function Lua_na_2014Xmas_sheep2()
	local Owner = OwnerID()
	local Target = TargetID()
	local Room = ReadRoleValue( Owner , EM_RoleValue_RoomID)
	local R = DW_Rand( 100)
	local wool
	local x, y, z, dir = DW_Location( Target)
	SetPlot( Target, "touch" , "" , 0 )
	if R >= 40 then
		wool = CreateObj( 124108 , x, y, z , dir , 1 )
		AddToPartition( wool , Room)
		ScriptMessage( Target, Owner ,2, "[SC_2014XMAS_10] ", 0 )
	else
		ScriptMessage( Target, Owner, 1 , "[SC_2014XMAS_11] ", 0 )
	end
	AddBuff( Target, 624067, 0 , 3 )
	sleep(30)
	SetPlot( Target, "touch" , "Lua_na_2014Xmas_sheep2" , 10 )
end


--�Ϥ�Ĳ�I�@��
function Lua_na_2014xmas_wool()
	local Owner = OwnerID()
	AddBuff( Owner , 620015 , 0, -1 ) --�G�����S��
	BeginPlot( Owner , "Lua_na_2014Xmas_wool3" , 0 )
	SetPlot( Owner, "touch" , "Lua_na_2014Xmas_wool2" , 10 )
end

function Lua_na_2014Xmas_wool2()
	local Owner = OwnerID()
	local Target = TargetID()
	SetPlot( Target, "touch" , "" , 0 )
	GiveBodyItem( Owner , 243285 , 1 )
	DelObj( Target)
end

function Lua_na_2014Xmas_wool3()
	local Time = 0
	while true do 
		if Time == 15 then
			DelObj(OwnerID() )
		else
			Time = Time + 1
		end
		sleep(10)
	end
end


--�[�઺��ܼ@��
function Lua_na_2014xmas_124104()
	local Owner = OwnerID()
	local Target = TargetID()
	AdjustFaceDir(Target , Owner , 0 )
	if CountBodyItem( Owner , 243286 ) >= 1 then
		SetSpeakDetail( Owner , "[SC_2014XMAS_08]") --�o�O����e���ڪ��ܡH
		CancelBuff_NoEvent( Owner, 626280 )
		DelBodyItem( Owner , 243286 , 1 )
		GiveBodyItem( Owner , 203178 , 1 )
	else
		SetSpeakDetail( Owner , "[SC_2014XMAS_09]" ) --�x�V�`�ּ֡I
	end		
end


--�R�����W�Ҧ���������
function Lua_na_2014xmas_DEL() 
	local Owner = OwnerID() --���ê���
	local Room = ReadRoleValue( Owner , EM_RoleValue_RoomID)
	local ObjID = {	124105, 109237	}  --�ݭn�Q�R���_�c������NPC ID 
	local NPC = SearchRangeNPC(Owner , 1500)
--	Say( Owner ,"NPC =".. #NPC)
	for i = 0 , #NPC do 		--�R���Ҧ����ʬ���NPC
		for j = 1 , #ObjID do
			if ReadRoleValue( NPC[i] , EM_RoleValue_OrgID) == ObjID[j] then
				DelObj( NPC[i] )
			end
		end
	end
end


--���H�������ɭԡA�R�����a���W���T��BUFF�ABUFFĲ�o���ܰT��
function Lua_na_2014Xmas_snowman() 
	local Owner = OwnerID()
	CancelBuff( Owner , 626280)
end 

--���H�ĤưT��
function Lua_na_2014Xmas_243286()
	local Owner = OwnerID()
	ScriptMessage( Owner, Owner , 3 , "[SC_2014XMAS_04]" , 0 ) --���H�ĤƤF
	return false
end 

--���a�ʧ@
function Lua_na_2014XMAS_Motion2()
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_IDLE0)
end