--424327 �`�J�Գ�
--Use register 6�B7 and 8
--���@function���bnpc 118337���W
function LuaS_424327_CenterContral()
	local own=OwnerID()
	local Npc
	local x,y,z,dir = DW_Location( own )
		Npc=CreateObj( 118305,x,y,z,dir,1 );
		WriteRoleValue( own,EM_RoleValue_Register6,Npc );	--�Τ�����m6�snpc�s��
		AddToPartition( Npc , 0 );
	CallPlot( own,"Lua_424327_ProShadow",own );		--���ͫռv
	SetPlot( Npc,"Range","Lua_424327_SayHelp",120 );	--�d��@��
	Beginplot( own,"LuaS_118337_ForScript",0 )
end
--�@�ΡG�a��ɻ���
function Lua_424327_SayHelp()
	if CheckAcceptQuest(OwnerID(),424327)==true then
		NpcSay(TargetID(),"[SC_424327_1]")
	end
	return
end
--���ͫռv118680
function Lua_424327_ProShadow(Center)
	local RoomID = ReadRoleValue( Center , EM_RoleValue_RoomID );
	local Loc={};
	local Mon={}
		local x,y,z,dir = DW_Location( Center )
		Mon[1]=CreateObj(118680,x,y,z+30,90,1);
			WriteRoleValue(Center,EM_RoleValue_Register7,Mon[1]);--�Τ�����m7�sMonster1
		Mon[2]=CreateObj(118680,x,y,z-30,270,1);
			WriteRoleValue(Center,EM_RoleValue_Register8,Mon[2]);--�Τ�����m8�sMonster2
				SetModeEx( Mon[1],EM_SetModeType_Mark,false )
				SetModeEx( Mon[2],EM_SetModeType_Mark,false )
				SetFightMode( Mon[1],0,0,0,0 )
				SetFightMode( Mon[2],0,0,0,0 )
			WriteRoleValue(Mon[1],EM_RoleValue_Register5,Center);--�ΩǪ���m5�Ӧs�����s��
			WriteRoleValue(Mon[2],EM_RoleValue_Register5,Center);--�ΩǪ���m5�Ӧs�����s��
			AddToPartition( Mon[1] , RoomID );
			AddToPartition( Mon[2] , RoomID );
			PlayMotion(Mon[1],81)
			PlayMotion(Mon[2],81)
		return
end
--�C��P�w�ۤv�Q���F�S�A���bNPC118680����l�@���W
--���q��2013/02/23�A�ױ����q�A�ثe�S������\��C
function LuaS_Shadow_Snpc_InitScript()
	return
end
--�����^��
function LuaS_118337_ForScript()
	local amount=0;
	local Player=0;
	local Obj=OwnerID();

	while true do
		local tmpPlayer =SearchRangePlayer( Obj,100 )
		for i=0,#tmpPlayer,1 do
			if CheckAcceptQuest( tmpPlayer[i],424327 ) and 
				CheckFlag( tmpPlayer[i],545163 )==false and
				ReadRoleValue( Obj,EM_RoleValue_Register1 )==0 then
				CallPlot( Obj,"Lua_424327_StartAttack",Obj,tmpPlayer[i] )	--���ȳQ�Ұ�
				return
			end
		end
		Sleep(20)
	end
end
--���Ȫ�l�A�]�w���ͩǪ�
function Lua_424327_StartAttack( Center,Player )
	WriteRoleValue( Center,EM_RoleValue_Register1,1 )		--R1�ȡA�Ψ���w�@��
	local Mon1=ReadRoleValue(Center,EM_RoleValue_Register7);	--�Ǫ�1�s��
	local Mon2=ReadRoleValue(Center,EM_RoleValue_Register8);	--�Ǫ�2�s��
	local Mos={};
	local x,y,z,dir = DW_Location( Mon1 )
		Mos[1] = CreateObj( 105824,x,y,z,dir,1  )
			WriteRoleValue(Mos[1],EM_RoleValue_Register5,Center);
			DelObj(Mon1)
			AddToPartition( Mos[1],0 )
		x,y,z,dir = DW_Location( Mon2 )
		Mos[2]=CreateObj( 105824,x,y,z,dir,1  )
			WriteRoleValue(Mos[2],EM_RoleValue_Register5,Center);
			DelObj(Mon2)
			AddToPartition( Mos[2],0 )
			Sleep(5)
			NpcSay( Mos[1],"[SC_101222_YU_07]" )
			CallPlot( Center,"Lua_424327_JudgeSituation",Center,Mos[1],Mos[2],Player )	--�I�s�԰��A�����}�l�P�w�C
			SetAttack( Mos[1],Player )
			SetAttack( Mos[2],Player )
			Sleep(10)
			SetAttack( Mos[1],Player )
			SetAttack( Mos[2],Player )
		return
end
--�I�s�԰��A�����}�l�P�w�C
function Lua_424327_JudgeSituation( Center,Mos1,Mos2,Player )
	local HateListAll={};
	local x = 0 ;
		for i=0,360,1 do
			--�P�_���a
			if 	CheckDistance( Player,Center,200 )==false or
				CheckAcceptQuest( Player,424327 )==false or
				CheckFlag( Player,545163 )==true or
				CheckID(Player)==false then
					--���m
					CallPlot(Center,"Lua_424327_Reset",Center,Mos1,Mos2);
				return
			end
			--�P�_�Ǫ�1
			if ReadRoleValue( Mos1 , EM_RoleValue_IsDead ) == 1 then
				NPCDead( Mos2,Player )	--����2
				CallPlot( Center,"Lua_424327_Success_Show",Center,Mos2 )		--���\��t
				return
			end 
			--�P�_�Ǫ�2
			if ReadRoleValue( Mos2 , EM_RoleValue_IsDead ) == 1 then
				NPCDead( Mos1,Player )	--����1
				CallPlot( Center,"Lua_424327_Success_Show",Center,Mos1 )		--���\��t
				return
			end 
			Sleep(10)	
		end
				--���m
				CallPlot(Center,"Lua_424327_Reset",Center,Mos1,Mos2);
				return
end
--�줳��C��A2013/02/23�A�ױ����q�A�ثe�S������\��C
function Lua_424327_HateListAll(Center)
	return
end
--105824 �Գ��ռv��l�ȱ����`�@���A2013/02/23�A�ױ����q�A�ثe�S������\��C
--��L����åB�Z���ӻ��A�R���ۤv
--�۱��A�ƭ�-1
function LuaS_105801_ReSituation()
	return
end
--105824 �Գ��ռv�����`�@��
--�Q���A�ƭ�-3
function LuaS_105801_ReSituation_01()
	return
end
--�������t
function Lua_424327_Success_Show(Center,Mon)
		local Npc=ReadRoleValue(Center,EM_RoleValue_Register6);
			NpcSay(Npc,"[SC_424327_2]")
			Sleep(20)
			DelObj(Mon)
			NpcSay(Npc,"[SC_424327_1]");
			LuaFunc_MoveToFlag(Npc,780871,1,0)
			Sleep(10);
			DelObj(Npc);
		--���X��
		local tmpPlayer = SearchRangePlayer( Center,250 )
		local x=0
			for i=0,#tmpPlayer-1 do
				if CheckAcceptQuest( tmpPlayer[i],424327)==true and
					CheckFlag( tmpPlayer[i],545163 )==false then
						SetFlag( tmpPlayer[i],545163,1 );
				end
			end
		WriteRoleValue( Center,EM_RoleValue_Register1,0 )
		CallPlot( Center, "LuaFunc_ResetObj", Center );
end
--���ѭ��m
function Lua_424327_Reset( Center,Mos1,Mos2 )
	local Npc=ReadRoleValue(Center,EM_RoleValue_Register6);
		if CheckID(Mos1) then
			DelObj(Mos1)
		end
		if CheckID(Mos2) then
			DelObj(Mos2)
		end
		DelObj(Npc)
		Sleep(1)
		WriteRoleValue( Center,EM_RoleValue_Register1,0 )
		CallPlot( Center, "LuaFunc_ResetObj", Center );
end
function Lua_424327_neverdead()
	return false
end