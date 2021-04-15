function lua_skwerl_Z23_InitialSet()
	local NPC=OwnerID();
	local RoomID=ReadRoleValue(NPC,EM_RoleValue_RoomID);
	OldCaptain=OldCaptain or {};
	NewCaptain=NewCaptain or {};
	local OldCaptainOrgID=106679
	if ReadRoleValue(NPC,EM_RoleValue_OrgID)==OldCaptainOrgID then
		OldCaptain[RoomID]=NPC;
	else
		NewCaptain[RoomID]=NPC;
	end
end
function lua_skwerl_Z23_MobHide(GUID)
	SetModeEx(GUID,EM_SetModeType_Show,false);
	DW_UnFight(GUID,true);
end
function lua_skwerl_Z23_MobShow(GUID,captain)
	sleep(20);
	SetModeEx(GUID,EM_SetModeType_Show,true);
	DW_UnFight(GUID,false);
	SysCastSpellLv(GUID, captain, 496266,-1 )
	SysCastSpellLv(captain, GUID, 496266,-1 )
end
function lua_skwerl_Z23_controller()
	
	local npc= OwnerID()
	local Monster
	local RoomID = ReadRoleValue( npc , EM_RoleValue_RoomID )
	local Obj = Role:new( npc )  -- ���onpc X.Y.Z.Dir��
	local BaseX = Obj :X()
 	local BaseY = Obj :Y()
 	local BaseZ = Obj :Z()
	local BaseDir = Obj:Dir()
	local MaxHP = ReadRoleValue( npc , EM_RoleValue_MaxHP )
	while true do
		local NowHP = ReadRoleValue( npc , EM_RoleValue_HP )
		if NowHP/MaxHP <= 0.3 then
			SysCastSpellLv(npc, npc, 497114, 3 ) 
		end
		sleep (100)
	end
end




function lua_skwerl_Z23_controller2()
	SetPlot( OwnerID(),"range","lua_skwerl_Z23_area1",120 )  
end

function lua_skwerl_Z23_Monsterdeath()
	local npc= OwnerID()
	Lua_Z23_BloodyBF_AntDead();--�Գ��Ʊڦ��`�@��
	local hatenumber
	local killer
	local check
-------------------------------------------------------------------------���ͥ�
	local Monster
	local RoomID = ReadRoleValue( npc , EM_RoleValue_RoomID )
	local Obj = Role:new( npc )  -- ���onpc X.Y.Z.Dir��
	local BaseX = Obj :X()
 	local BaseY = Obj :Y()
 	local BaseZ = Obj :Z()
	local BaseDir = Obj:Dir()
	local captain=NewCaptain[RoomID];
--------------------------------------------------------------------------------



	hatenumber= HateListCount( npc );
	SysCastSpellLv( npc, npc, 499290,1 )--- �����z
	for i=0, hatenumber-1, 1 do
		killer=HateListInfo(npc, i , EM_HateListInfoType_GItemID ); 
		check=ReadRoleValue(killer, EM_RoleValue_IsPlayer ) 
		if check==1 and CheckFlag( killer, 546203)== true then
			If Checkflag(killer, 546201)==true then
				ScriptMessage( captain,killer, 1, "[SKWERL_MISSION01_03]", C_SYSTEM ); --���n�d�����ڡA���٥i�H���U�h�I
			else
				ScriptMessage( captain,killer, 1, "[SKWERL_MISSION01_09]", C_SYSTEM );  --�i�c�A�����z�A�ܦh���ͳ��O�]���o�˦����I
				ScriptMessage( captain,killer, 1, "[SKWERL_MISSION01_02]", C_SYSTEM );   --���§A�����U�A�o�ϴN�浹�ڳB�z�I
				Setflag(killer, 546201, 1) ---area1 rescue �Խu�@�@�Ϧ��\
			end
		elseif check==1 and DW_CheckQuestAccept("or",killer,425318,425332,425346)==true then
			DW_QietKillOne(killer,102374);
		end
	end
------------------------- �ͩ�------------------------------------------------------------
	Monster= CreateObjByFlag( 106774 , 781109 , 0  , 1 )
	lua_skwerl_Z23_MobHide(Monster);
	AddToPartition(Monster , RoomID )
	SetFlag(Monster,544801,1);
	SetPlot(Monster,"dead","lua_skwerl_Z23_Monsterdeath",0);
	CallPlot(Monster,"lua_skwerl_Z23_MobShow",Monster,captain);
end 
				
function lua_skwerl_Z23_antspawn1()  ---�������A���A���}���ɥͩǥ�
	local npc= OwnerID()
	sleep(20)
	local captain= Lua_Hao_NPC_Closest_Search(npc , 106677 ,450)   
	local RoomID = ReadRoleValue( npc , EM_RoleValue_RoomID )
	BeginPlot(captain,"lua_skwerl_Z23_InitialSet",0);--�O������������
	local Obj = Role:new( npc )  -- ���onpc X.Y.Z.Dir��
	local BaseX = Obj :X()
 	local BaseY = Obj :Y()
 	local BaseZ = Obj :Z()
	local BaseDir = Obj:Dir()
	local Monster1
	local Monster2

	Monster1= CreateObjByFlag( 106774 , 781109 , 0  , 1 )
	AddToPartition(Monster1 , RoomID )
	SetFlag(Monster1,544801,1);
	SetPlot(Monster1,"dead","lua_skwerl_Z23_Monsterdeath",0);
	SysCastSpellLv(captain, Monster1, 496266,-1 )
	SysCastSpellLv(Monster1, captain, 496266,-1 )

	Monster2= CreateObjByFlag( 106774 , 781109 , 0  , 1 )
	AddToPartition(Monster2 , RoomID )
	SetFlag(Monster2,544801,1);
	SetPlot(Monster2,"dead","lua_skwerl_Z23_Monsterdeath",0);
	SysCastSpellLv(captain, Monster2, 496266,-1 )
	SysCastSpellLv(Monster2, captain, 496266,-1 )

end	


function luaS_skwerl_Z23_respawn()
	local npc= OwnerID()
	local Monster
	local RoomID = ReadRoleValue( npc , EM_RoleValue_RoomID )
	local Obj = Role:new( npc )  -- ���onpc X.Y.Z.Dir��
	local BaseX = Obj :X()
 	local BaseY = Obj :Y()
 	local BaseZ = Obj :Z()
	local BaseDir = Obj:Dir()



	Monster = CreateObjByFlag( 106774 , 781109 , 0  , 1 )		-- �b�X�Хͩ�(���ͪ���ID , ���ͺX�lID , �X�l��mID , ���ͼƶq)
	AddToPartition( Monster , RoomID )
	SetFlag(Monster,544801,1);
	SysCastSpellLv(captain, Monster, 496266,-1 )
	SysCastSpellLv(Monster, captain, 496266,-1 )

end

function lua_skwerl_Z23_area1()   ---�㴵���
---targetid()= captain----
	Local player= OwnerID()
	Local captain= TargetID()
	if CheckFlag( player, 546203)== true and CheckFlag( player, 546199)== false then --546203= ������Ȥ������a  546199=��npc��ܹL��flag
		if CheckFlag( player, 546202)== true then --�p�G���e���U�L�t�@��npc����
		ScriptMessage(Captain,Player,1, "[SKWERL_MISSION01_04]", C_SYSTEM)  --������U[106679]���_�I�a�N�O�A�ڡI�ڬO[106677]�A�z�d�˶����w�g���F�A�ҥH�o�ϥѧڨӥN���L�I
		ScriptMessage(Captain,Player,0, "[SKWERL_MISSION01_04]", C_SYSTEM) 
		SetFlag(player, 546199, 1) --���L�ܤF
		else
		ScriptMessage(Captain,Player,1, "[SKWERL_MISSION01_01]", C_SYSTEM)  --�z�d�˶����w�g���F�C�ڬO[106677]�A�o�ϼȮɥѧڭt�d�I
		ScriptMessage(Captain,Player,0, "[SKWERL_MISSION01_01]", C_SYSTEM)
		SetFlag(player, 546199, 1) --���L�ܤF
		end
	end

end



function lua_skwerl_Z23_testcmd()
	local player=OwnerID()
		SetFlag(player, 546199, 0)
		SetFlag(player, 546200, 0)
		SetFlag(player, 546201, 0)
		SetFlag(player, 546202, 0)
		SetFlag(player, 546209, 0)
		SetFlag(player, 546203, 1)
end


------------------------------------------------------------------------------------------------------------------------
------------------------------------area 2--(106679��)---------------------------------------------------------------------




function lua_skwerl_Z23_controller3()  --captain bishop controller
	SetPlot( OwnerID(),"range","lua_skwerl_Z23_area1B",120 )  
end

function lua_skwerl_Z23_MonsterdeathB()  --�ͤ����ǿ��Ʀ��`�@��
	local npc= OwnerID()
	Lua_Z23_BloodyBF_AntDead();--�Գ��Ʊڦ��`�@��
	local hatenumber
	local killer
	local check
	------------------------�ͩǥ�---------------------------------------------
	local Monster
	local RoomID = ReadRoleValue( npc , EM_RoleValue_RoomID )
	local Obj = Role:new( npc )  -- ���onpc X.Y.Z.Dir��
	local BaseX = Obj :X()
 	local BaseY = Obj :Y()
 	local BaseZ = Obj :Z()
	local BaseDir = Obj:Dir()
	local choice
	local Monsterid
	local captain= OldCaptain[RoomID];
	----------------------------------------------------------------------

	hatenumber= HateListCount( npc );
--	SysCastSpellLv( npc, npc, 499258,1 )  --�����ǽϥ�fx
	for i=0, hatenumber-1, 1 do
		killer=HateListInfo(npc, i , EM_HateListInfoType_GItemID ); 
		check=ReadRoleValue(killer, EM_RoleValue_IsPlayer ) 
		if check==1 and CheckFlag( killer, 546203)== true then
			ScriptMessage( captain,killer, 1, "[SKWERL_MISSION01_10]", C_SYSTEM ); --�O�P�ӡI�����ǭn�X�{�F�I
		elseif check==1 and DW_CheckQuestAccept("or",killer,425319,425333,425347)==true then
			DW_QietKillOne(killer,102375);
		end
	end
	----------------------------�ͤ�����----------------------------------------
	choice=Rand(100)
	if choice < 25 then   --�������H����Ǻ���
		Monsterid=106681 
	elseif choice >= 25 and choice <=50 then
		Monsterid= 106682 
	elseif choice>50 and choice<=75 then
		Monsterid=106683
	else
		Monsterid=106888
	end
	Monster= CreateObj(Monsterid , BaseX+10 , BaseY , BaseZ+10 , BaseDir , 1 )
	AddToPartition(Monster , RoomID )
	SysCastSpellLv(captain, Monster, 496266,-1 )   ---�}���w
	SysCastSpellLv(Monster, captain, 496266,-1 )    --�}���w

end 	


				
function lua_skwerl_Z23_elementalMonsterdeath()  --�����Ǧ��`�@��
	local npc= OwnerID()
	local hatenumber
	local killer
	local check
----------------------------------------------���ͥ�---------------------
	local npc= OwnerID()
	local Monster
	local RoomID = ReadRoleValue( npc , EM_RoleValue_RoomID )
	local Obj = Role:new( npc )  -- ���onpc X.Y.Z.Dir��
	local BaseX = Obj :X()
 	local BaseY = Obj :Y()
 	local BaseZ = Obj :Z()
	local BaseDir = Obj:Dir()
	local captain=OldCaptain[RoomID]
------------------------------------------------------------------------
	hatenumber= HateListCount( npc );
	for i=0, hatenumber-1, 1 do
		killer=HateListInfo(npc, i , EM_HateListInfoType_GItemID ); 
		check=ReadRoleValue(killer, EM_RoleValue_IsPlayer ) 
		if check==1 and CheckFlag( killer, 546203)== true then  ---�T�{����O������Ȥ������a
			If Checkflag(killer, 546202)==true then
				ScriptMessage( captain,killer, 1, "[SKWERL_MISSION01_08]", C_SYSTEM ); --"�o�ϥѧڭt�d�A�A���ݭn�d�b�o�̡I"
			else
				ScriptMessage( captain,killer, 1, "[SKWERL_MISSION01_07]", C_SYSTEM ); --�h�¤F�A�A�����a�I�o�ϴN�浹�ڤF�I
				Setflag(killer, 546202, 1) -- �Խu�G�@�Ϧ��\
			end
		elseif check==1 and DW_CheckQuestAccept("or",killer,425319,425333,425347)==true then
			DW_QietKillOne(killer,102375);
		end
	end
----------�ͩ�----------------------------------------------------
	Monster= CreateObjByFlag( 106775 ,  781128  , 0  , 1 )
	lua_skwerl_Z23_MobHide(Monster);
	AddToPartition(Monster , RoomID )
	SetFlag(Monster,544801,1);
	SetPlot(Monster,"dead","lua_skwerl_Z23_MonsterdeathB",0);
	CallPlot(Monster,"lua_skwerl_Z23_MobShow",Monster,captain);
end 		


function lua_skwerl_Z23_antspawn2()  ---�������A���A���}���ɥͩǥ�
	local npc= OwnerID()
	sleep(20)
	local captain= Lua_Hao_NPC_Closest_Search(npc , 106679 ,450)   
	local RoomID = ReadRoleValue( npc , EM_RoleValue_RoomID )
	BeginPlot(captain,"lua_skwerl_Z23_InitialSet",0);--�O������������
	local Obj = Role:new( npc )  -- ���onpc X.Y.Z.Dir��
	local BaseX = Obj :X()
 	local BaseY = Obj :Y()
 	local BaseZ = Obj :Z()
	local BaseDir = Obj:Dir()
	local Monster1
	local Monster2

	Monster1= CreateObjByFlag( 106775 , 781128 , 0  , 1 )
	AddToPartition(Monster1 , RoomID )
	SetPlot(Monster1,"dead","lua_skwerl_Z23_MonsterdeathB",0);
	SysCastSpellLv(captain, Monster1, 496266,-1 )
	SysCastSpellLv(Monster1, captain, 496266,-1 )

	Monster2= CreateObjByFlag( 106775 , 781128 , 0  , 1 )
	AddToPartition(Monster2 , RoomID )
	SetPlot(Monster2,"dead","lua_skwerl_Z23_MonsterdeathB",0)
	SysCastSpellLv(captain, Monster2, 496266,-1 )
	SysCastSpellLv(Monster2, captain, 496266,-1 )

end






function lua_skwerl_Z23_area1B()
---targetid()= captain----
	Local player= OwnerID()
	Local captain= TargetID()
	if CheckFlag( player, 546203)== true and CheckFlag( player, 546200)== false then --546203= ������Ȥ������a  546200=��npc��ܹL��flag
		if CheckFlag( player, 546201)== true then --�p�G���e���U�L�t�@��npc����
		ScriptMessage(Captain,Player,1, "[SKWERL_MISSION01_06]", C_SYSTEM)  --������U[106677]���_�I�a�N�O�A�ڡI�ڬO[106679]�A�ܺa�H�i�H��A�@�_�êӧ@�ԡI
		ScriptMessage(Captain,Player,0, "[SKWERL_MISSION01_06]", C_SYSTEM) 
		SetFlag(player, 546200, 1) --���L�ܤF
		else
		ScriptMessage(Captain,Player,1, "[SKWERL_MISSION01_05]", C_SYSTEM) --�ڬO[106679]�A�ܺa�H�i�H��A�@�_�êӧ@�ԡI
		ScriptMessage(Captain,Player,0, "[SKWERL_MISSION01_05]", C_SYSTEM) --�ڬO[106679]�A�ܺa�H�i�H��A�@�_�êӧ@�ԡI
		SetFlag(player, 546200, 1) --���L�ܤF
		end
	end

end


function lua_skwerl_Z23_briefing()
	local player= TargetID()
	local npc= OwnerID()
	if CheckFlag( player, 546209)== false then 
		Addbuff(Player, 622152, 1, 180)
		Setflag(Player, 546209, 1)
		ScriptMessage(npc, Player,1, "[SKWERL_MISSION01_11]", C_SYSTEM)
	elseif CheckFlag( player, 546209)== true then 
		ScriptMessage(npc, player,1, "[SKWERL_MISSION01_12]", C_SYSTEM)
	end
end

function lua_skwerl_Z23_test()
	local npc=OwnerID()
	say(npc, "test")
	SysCastSpellLv(npc, npc, 499246, 1 ) 
end