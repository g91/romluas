function lua_skwerl_zone23_briefing() ---���b����npc�W��
	LoadQuestOption(OwnerID())
	LuaPG_425234_Give()
	local quest = CheckAcceptQuest( OwnerID(), 425175 )  
		if quest== true then
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SKWERL_PE_BBQ_07") , " lua_skwerl_pe_01_rearm", 0 ) -- I WANT TO COOK CHICKEN
		end
end

function lua_skwerl_pe_01_torch() --������
	local npc=OwnerID()
	local player= TargetID()
	GiveBodyItem(Player, 241144, 3 )
	ScriptMessage(npc,Player,1, "[SKWERL_PE_BBQ_05]", C_SYSTEM) --�o�ǿU�N�Ť�N���A�F�A���A�n�B�I�p�G�Χ����ܦA�^�Ӹ�ڮ��I
	ScriptMessage(npc,Player,0, "[SKWERL_PE_BBQ_05]", C_SYSTEM)
end


function lua_skwerl_pe_01_rearm() --�ɵ��U�N�֤�Ϊ�script
	local player=OwnerID()
	local npc=TargetID()
	local ammo 
	local burn
	ammo= CountBodyItem(player, 241144) --�T�O�U�N�֤�ƶq�p��3
	burn= CountBodyItem(player, 241181)  --���u�ƶq�A�j��2�N����ȧ���
	if ammo > 2 then 
		ScriptMessage(npc,Player,1, "[SKWERL_PE_BBQ_04]", C_SYSTEM)  --�i�D���a�Ť�w��
		ScriptMessage(npc,Player,0, "[SKWERL_PE_BBQ_04]", C_SYSTEM)
	elseif burn > 2 then
		ScriptMessage(npc,Player,1, "[SKWERL_PE_BBQ_06]", C_SYSTEM) --�A���ݭn��h���U�N�֤�A���Ȥw�g�����F�I
		ScriptMessage(npc,Player,0, "[SKWERL_PE_BBQ_06]", C_SYSTEM)
	else
		Delbodyitem(player,241144,ammo)
		GiveBodyItem(player, 241144, 3 )
		ScriptMessage(npc,Player,1, "[SKWERL_PE_BBQ_05]", C_SYSTEM) --�Ť�ɵ�����
		ScriptMessage(npc,Player,0, "[SKWERL_PE_BBQ_05]", C_SYSTEM)
	
	end
	CloseSpeak(player)
end
function Lua_Z23_Ray_skwerl_PE01()--�����H������
	local x,y,z,dir=DW_Location(OwnerID());
	local CorpseList={120498,120675,120676,120677};
	local Corpse=CreateObj(CorpseList[DW_Rand(4)],x,y,z,dir,1);
	SetDefIdleMotion(Corpse,ruFUSION_MIME_IDLE_DEAD);
	AddToPartition(Corpse,0);
	local InvisibleObj=0;
	local IsReset,WaitSec=false,1;
	while true do
		if IsReset==true then	--���魫��
			IsReset=false;
			sleep(WaitSec*10);
			Corpse=CreateObj(CorpseList[DW_Rand(4)],x,y,z,dir,1);
			SetDefIdleMotion(Corpse,ruFUSION_MIME_IDLE_DEAD);
			AddToPartition(Corpse,0);
		end
		if CheckID(Corpse)==false then
			if InvisibleObj~=0 then
				if ReadRoleValue(InvisibleObj,EM_RoleValue_Register+5)~=0 then--�ΨӽT�{�ͥX���T�ƬO�_���Ч�
					DelObj(InvisibleObj);
					sleep(210+DW_Rand(180));
					IsReset=true;
					WaitSec=1;
				else
					sleep(30);
				end
			else
				IsReset=true;
				WaitSec=1;
			end
		else
			if ReadRoleValue(Corpse,EM_RoleValue_Register+6)~=0 then
				DelObj(Corpse);
				IsReset=true;
				WaitSec=30;
			end
			InvisibleObj=ReadRoleValue(Corpse,EM_RoleValue_Register+1);
			sleep(30);
		end
	end
end
function lua_skwerl_pe_01_corpse_command()
	local Player,Corpse = OwnerID(),TargetID();
	LoadQuestOption(Player);
	local IsSearched,DyQuestItem,AntOrgID=622208,241229,120676
--�p��ߴ��e
	if ReadRoleValue(Corpse,EM_RoleValue_OrgID)==AntOrgID then
		if CheckBuff(Corpse,IsSearched)==false then
			if DW_CheckQuestAccept("or",Player,425295,425300,425305)==true then
				if CountBodyItem(player,DyQuestItem)<5 then
					AddSpeakOption(Player,Player,"[SC_Q425295_00]","Dy_Z23_13_TAKE", 0 );
				end
			end
		end
	end
--�Q���N����
	local burn= CountBodyItem(OwnerID(), 241181);  --�Φ��\�N�����骺���ƨӧP�_�O�_�i�H�A�N����
	if Checkflag(OwnerID(), 546272)==true  and burn <6 then
		AddSpeakOption( Player, Corpse, "[SKWERL_PE_BBQ_02]" , "lua_skwerl_pe_01_corpse_begin", 0 ) -- �U�N����
	end
end

function lua_skwerl_pe_01_corpse_begin()
	local player= OwnerID()
	local corpse= TargetID()
	local RoomID = ReadRoleValue( corpse , EM_RoleValue_RoomID )
	local Obj = Role:new( corpse )  -- ���ocorpse X.Y.Z.Dir��
	local BaseX = Obj :X()
 	local BaseY = Obj :Y()
 	local BaseZ = Obj :Z()
	local BaseDir = Obj:Dir()
	local registercount= ReadRoleValue( corpse , EM_RoleValue_Register+1  ) --�p�G���H�b�N�Aregister�Ȭ�1
	local number
	number= CountBodyItem(player, 241144) --�ˬd���ضq
	if number >0 then --�p�G�����ءA�}�l�U�N
		if registercount>0 then --�w�g���H�b�U�N����
			ScriptMessage(Player,Player,1, "[SC_425103_D]", C_SYSTEM) --�q�����a����w�Q�U�N
			ScriptMessage(Player,Player,0, "[SC_425103_D]", C_SYSTEM)
			CloseSpeak(Player);
		else
			Closespeak(Player);
			DelBodyItem(Player, 241144, 1)-- �α��@������
			local InvisibleObj = CreateObj( 120504 , BaseX , BaseY, BaseZ , BaseDir ,1 ) --�ͤ�
			WriteRoleValue(corpse , EM_RoleValue_Register+1, InvisibleObj)
			AddToPartition( InvisibleObj, RoomID )
			SetModeEx( InvisibleObj, EM_SetModeType_Mark , false )--�аO
			CallPlot( InvisibleObj , "lua_skwerl_pe_01_corpsetest" , Player, corpse ) --�����Ϊ��󵹩Ǫ���
		end
	else
			ScriptMessage(Player,Player,1, "[SKWERL_PE_BBQ_03]", C_SYSTEM)
			ScriptMessage(Player,Player,0, "[SKWERL_PE_BBQ_03]", C_SYSTEM)
	end

end


function lua_skwerl_pe_01_fire() --���K�~�[�ק�
	local fire= OwnerID()
	For i= 1, 60, 1 do
		if  i==20 then
	             	ChangeObjID(fire , 120500)
	             	SetModeEx( fire , EM_SetModeType_Mark , false )--�аO (�p���ܤ���)
	             elseif i==40 then
	             	ChangeObjID(fire , 120501)
	             	SetModeEx( fire , EM_SetModeType_Mark , false )--�аO(�����ܤj��)
		end
	sleep(10)
	end

end

function lua_skwerl_pe_01_corpsetest(player, corpse) --���Ǫ��������Ϊ���
	local number
	local InvisibleObj= OwnerID()
	local RoomID = ReadRoleValue( InvisibleObj , EM_RoleValue_RoomID )
	local Obj = Role:new( InvisibleObj )  -- ���oInvisibleObj  X.Y.Z.Dir��
	local BaseX = Obj :X()
 	local BaseY = Obj :Y()
 	local BaseZ = Obj :Z()
	local BaseDir = Obj:Dir()
	local shieldlv
	local MaxHP = ReadRoleValue( InvisibleObj , EM_RoleValue_MaxHP )
	SetModeEx( corpse, EM_SetModeType_Mark, false )--����A�������
	SetModeEx( corpse, EM_SetModeType_HideName, true) --���ë���W��
	SetModeEx( InvisibleObj , EM_SetModeType_Fight , true )--�i�������Ϊ���
	SetModeEx( InvisibleObj, EM_SetModeType_HideName, true) --�������Ϊ���W��
	Addbuff(InvisibleObj, 622154, 1, -1)
	local fire = CreateObj( 120499 , BaseX , BaseY+10 , BaseZ , BaseDir , 1 ) --�ͤ�
	AddToPartition( fire, RoomID )
	SetModeEx( fire, EM_SetModeType_Mark , false )--�аO

	--�ͩǪ������ؼ�--
	local target = CreateObj( 106803 , BaseX , BaseY , BaseZ , BaseDir , 1 ) --�ͤ�
	AddToPartition( target, RoomID )
	SetModeEx( target, EM_SetModeType_Mark , false )--�аO
	SetModeEx( target , EM_SetModeType_Strikback, false )--�L�k����
	Addbuff(target, 622154, 1, -1)
	


--	local number = {}
	local number = lua_skwerl_pe_01_corpseloop(player, RoomID, BaseX, BaseY, BaseZ, BaseDir, target) --�}�l�U�N�^��
	delobj(fire)
	delobj(target)
	if  number==60 then --�p�G���\�U�N�A����|���z
			SysCastSpellLv( InvisibleObj , InvisibleObj , 497005 , 0 )
	
		If CheckID(player)== true then
			DW_QietKillOne(player, 106712 ) --�������ȴ���(���ȥؼ�:�U�N����A�o�O�����ؼХΪ����O)

			local burn= CountBodyItem(player, 241181)  --���u�ƶq�A�j��2�N����ȧ���
			if burn >2 then
				ScriptMessage(player,player,1, "[SKWERL_PE_BBQ_08]", C_SYSTEM) --���u�U�w���A�L�k�`����h�����u�C
				ScriptMessage(player,player,0, "[SKWERL_PE_BBQ_08]", C_SYSTEM) --���u�U�w���A�L�k�`����h�����u�C
			else
				GiveBodyItem(player, 241181, 1 )--�����U�N���u
			end
		end
	
	end
	local ant1=ReadRoleValue( InvisibleObj , EM_RoleValue_Register+2 )
	local ant2=ReadRoleValue( InvisibleObj , EM_RoleValue_Register+3 )
	local ant3=ReadRoleValue( InvisibleObj , EM_RoleValue_Register+4 )

	SetModeEx( InvisibleObj , EM_SetModeType_Fight , false )--���i�������Ϊ���
	DelObj(corpse);
	
	while true do ---�j��--�p�G����ͥX�����Ƥ��b�԰����A�ɫ�~�|�A�}�ҥ��ȡC�קK�ͥX�L�h������
		if checkID(ant1)==false and checkID(ant2)==false and checkID(ant3)==false then
			break		
		end	
		sleep(20)
	end
	sleep(300)
	WriteRoleValue(InvisibleObj , EM_RoleValue_Register+5, 1 );
end



function lua_skwerl_pe_01_corpseloop(player, RoomID, X, Y, Z, Dir, target)
local NPC=OwnerID()
local Distance
local number

	for  i= 1, 60, 1 do
		local registercount= ReadRoleValue(NPC , EM_RoleValue_Register+1  ) --�p�G����Q�Y���Aregister count�|�ܦ� 1
		if registercount==1 then
			ScriptMessage(Player,Player,1, "[SKWERL_PE_BBQ_01]", C_SYSTEM)
			ScriptMessage(Player,Player,0, "[SKWERL_PE_BBQ_01]", C_SYSTEM)
			break --���}�j��
		end
		if i==15 then
			local ant1= CreateObj( 106774 , X +100 , Y , Z , Dir , 1 ) --�Ϳ���1
			AddToPartition( ant1, RoomID )
			setattack(ant1, target)
			BeginPlot( ant1 , "luaS_skwerl_pe_01_hatetest" , 0 )
			WriteRoleValue( NPC , EM_RoleValue_Register+2 , ant1 )	-- �Nant1�g�i���骺 Reg+2 
		end
	
		if i==30 then
			local ant2= CreateObj( 106774 , X +100 , Y , Z , Dir , 1 ) --�Ϳ���2
			AddToPartition( ant2, RoomID )
			setattack(ant2, target)
			BeginPlot( ant2 , "luaS_skwerl_pe_01_hatetest" , 0 )
			WriteRoleValue( NPC , EM_RoleValue_Register+3 , ant2 )	-- �Nant2�g�i���骺 Reg+3 
		end

		if i==45 then
			local ant3= CreateObj( 106774 , X +100 , Y , Z , Dir , 1 ) --�Ϳ���3
			AddToPartition( ant3, RoomID )
			setattack(ant3, target)
			BeginPlot( ant3 , "luaS_skwerl_pe_01_hatetest" , 0 )
			WriteRoleValue( NPC , EM_RoleValue_Register+4 , ant3 )	-- �Nant3�g�i���骺 Reg+4 
		end


		number=i
		sleep(10)
		
	end

	return number


end

function luaS_skwerl_pe_01_hatetest() ---�Ǫ��p�G�S���ؼдN����(�H�����ӧP�_)
	local npc= OwnerID()
	local hatenumber
	while true do
		sleep(50)
		hatenumber= HateListCount( npc )
--		say (npc, hatenumber)
		if hatenumber==0 then
			DelObj(npc)
		end
		sleep(10)
	end
end

function lua_skwerl_corpse_eaten() --�p�G����Q���ƦY�����ܡA����game over
--	say(OwnerID(), "dead")
	local NPC= Lua_Hao_NPC_Closest_Search( OwnerID() , 120504 ,5 )
	WriteRoleValue(NPC , EM_RoleValue_Register+1, 1 ) 
end