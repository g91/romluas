function Lua_na_Q425021_CHECK() --������w���ȡA�ˬd���a���W�O�_���V���Ų~
	local Owner = OwnerID()
	local Target = TargetID()
	if CountBodyItem( Owner , 241076 ) >=1 then
		return true	 
	else
		ScriptMessage( Owner , Owner , 1 , "[SC_425021_1]" , 0 ) --[SC_425021_1]����S���i�H�����S�����e���I
		return false
	end
end


function Lua_na_Q425021_DEL() --���o������w�A�R���Ų~
	local Owner = OwnerID()
	local Target = TargetID()
	local R = rand(100)+1
	if  R < 30 then
		GiveBodyItem( Owner , 241077 , 1 )
		DelBodyItem( Owner , 241076 , 1 ) --�R���V���Ų~
		return true	 
	else
		ScriptMessage( Owner , Owner , 2 , "[SC_425021_2]" , C_SYSTEM ) --[SC_425021_2]�����W�����]�Ƹ���a���F�I
		return false
	end
end



----
--���ե�NPC
function Lua_na_117251_Quest_TEST()

end

---------����702584 LuaQ_425071_SAY ��b�q ------------

function Lua_na_120245_YES() --���å���
	local Owner = OwnerID() 
	SetSpeakDetail( Owner , "[SC_120245_Q_4]" ) --
 	AddSpeakOption ( Owner , Owner , "[SC_120245_Q_5]" , "Lua_na_120245_YES2", 0) --�ӿշ|�����@��۹ꪺ�H
end

function Lua_na_120245_YES2()
	local Owner = OwnerID() 
	SetSpeakDetail( Owner , "[SC_120245_Q_6]" ) --�ܦn�I�Ʊ�A���Ӥ��|�]���_�I�ȳ~���I�c�A�ӿ�Ѧ��誺�ӿաI
	GiveBodyItem( Owner , 530876 , 1 )
end

function Lua_na_120245_NO()
	local Owner = OwnerID() 
	SetSpeakDetail( Owner , "[SC_120245_Q_7]" ) -- �O�ܡK�K�A�n�n�Q�Q�a�I
end



---�M�~�ȹ�
function Lua_na_425023() --�M�~�ȹ�����A�|�X�{�Ǫ�-���_��������
	local Player = OwnerID()
	local Target = TargetID()
	local Obj = Role:new( Target )  -- ������o X.Y.Z.Dir��
	local BaseX = Obj :X()
 	local BaseY = Obj :Y();
 	local BaseZ = Obj :Z();
	local BaseDir = Obj:Dir();
	local Monster = CreateObj(  106674  , BaseX, BaseY, BaseZ, BaseDir, 1 ) --�b����y�� X.Y.Z.Dir ���W�ǳƳХߪ��� 
	SetModeEx(Monster, EM_SetModeType_Strikback, true )--����
	SetModeEx(Monster, EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx(Monster, EM_SetModeType_Obstruct, false )--����
	SetModeEx(Monster, EM_SetModeType_Mark, true )--�аO
	SetModeEx(Monster, EM_SetModeType_Move, true )--����
	SetModeEx(Monster, EM_SetModeType_Searchenemy, true )--����
	SetModeEx(Monster, EM_SetModeType_HideName, false )--�W��
	SetModeEx(Monster, EM_SetModeType_ShowRoleHead, true )--�Y����
	SetModeEx(Monster, EM_SetModeType_Fight , true  )--�i�������
	SetModeEx(Monster, EM_SetModeType_Drag , false )--���O
	SetModeEx(Monster, EM_SetModeType_Show, true )--���
	AddToPartition( Monster , 0 ) -- �إߪ���
	BeginPlot( Monster , "Lua_na_425023_monster_attack" , 0 )
	Setflag(Player, 545768,  1)

end

function Lua_na_425023_monster_attack()
	SetAttack( OwnerID(), TargetID()) --�� ���_�������� �D�ʧ������a
end


function Lua_na_120372_check() --�I���r���ɡA�ˬd���W���S���j�Ѫ��w��
	local Owner = OwnerID()
	local Target = TargetID()
	if CountBodyItem( Owner , 241079 ) >=1 then
		return true
	else
		return false
	end
end



function Lua_na_425023_monster_dead()

	local Owner = OwnerID()
	local Target = TargetID()
	local Step1 = Checkflag( Target , 545768 ) --�w�g�M�~�ȹ�
	local Step2 = Checkflag( Target , 545775 ) --�|��������_����
	
	if Checkquest( Target , 425023, 0 ) == true and Step1 == true and Step2 == false then 
		DelBodyItem( Target , 241079 ,1 ) --�R�� �j�Ѫ��ȹ�
		ScriptMessage ( Target , Target , 1 , "[SC_425023_0]" , 0 )
		Setflag( Target , 545771 , 1 ) --�������a�������Ȫ�����
		Setflag( Target , 545775 , 1 ) --�������a�������Ȫ�����
		GiveBodyItem( Target , 241080 , 1 ) --�������a���_����
	end

end


function Lua_na_241080_DEL() --���a�R�����_�����|�R��KEYITEM 545775
	local Owner = OwnerID()
	Setflag( Owner , 545775 , 0 ) -- �y���ݱa�Ӫ��O�K�K�z
end


--�u���Ѥ��A�u��P�_
function Lua_na_120376() -- �Ӥu�J��u��
	SetPlot( OwnerID() , "touch" , "Lua_na_120376_touch" , 50 )
end


function Lua_na_120377() --�y���J��u��
	SetPlot( OwnerID() , "touch" , "Lua_na_120377_touch" , 50 )
end


function Lua_na_120376_touch() --�Ӥu�J��u��
	local Owner = OwnerID()
	local Target = TargetID()
	local Qcheck = CheckAcceptQuest( Owner , 425024 ) --�ˬd���W�O�_������ �u���Ѥ�


	if Qcheck == true then --�Y���a�w������
		if CountBodyItem( Owner , 240808 ) >= 1 then
			return false	
		elseif  CheckFlag( Owner , 545773 ) == true then
			ScriptMessage ( Owner , Owner , 1 , "[SC_425024_0]" , 0 ) --�A�w�g�ϥιL�o���u��F
			return false	
		else
			if BeginCastBarEvent( Owner , Target ,"[SC_425024_1]", 10, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "Lua_na_120376_castbar" ) ~= 1 then --20��bar�ʧ@�ɶ�  �ϥ��J��u��
			end
		end
	end			
end


function Lua_na_120376_castbar(Owner , CheckStatus )
	local Owner = OwnerID()
	local Target = TargetID()
	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			-- ���\
			EndCastBar( Owner, CheckStatus );

			if CheckFlag( Owner , 545772 ) == true then --�w�g�ϥιL�Ӥu�J��u��
				GiveBodyItem ( Owner , 545773 , 1 )
				DelBodyItem (Owner , 240807 , 1 ) --�R�� �J��Υ��Y
				GiveBodyItem( Owner , 240808 , 1 ) --�������J�@�~	
			else
				GiveBodyItem ( Owner , 545773 , 1 )
			end
		else
			-- ����
			EndCastBar( Owner, CheckStatus );
		end
	end
end


function Lua_na_120377_touch() --�y���J��u��
	local Owner = OwnerID()
	local Target = TargetID()
	local Qcheck = CheckAcceptQuest( Owner , 425024 ) --�ˬd���W�O�_������ �u���Ѥ�

	if Qcheck == true then --�Y���a�w������
		if CountBodyItem( Owner , 240808 ) >= 1 then
			return false 
		elseif  CheckFlag( Owner , 545772 ) == true then
			ScriptMessage ( Owner , Owner , 1 , "[SC_425024_0]" , 0 ) --�A�w�g�ϥιL�o���u��F
			return false

		else
			if BeginCastBarEvent( Owner , Target ,"[SC_425024_1]", 10, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "Lua_na_120377_castbar" ) ~= 1 then --20��bar�ʧ@�ɶ�  �ϥ��J��u��
			end
		end
	end
end



function Lua_na_120377_castbar(Owner , CheckStatus )
	local Owner = OwnerID()
	local Target = TargetID()
	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			-- ���\
			EndCastBar( Owner , CheckStatus );

			if CheckFlag( Owner , 545773 ) == true then
				GiveBodyItem ( Owner , 545772 , 1 )
				DelBodyItem ( Owner , 240807 , 1 ) --�R�� �J��Υ��Y
				GiveBodyItem( Owner , 240808 , 1 ) --�������J�@�~	
			else
				GiveBodyItem ( Owner , 545772 , 1 )
			end
		else
			-- ����
			EndCastBar(Owner , CheckStatus );
		end
	end
end


function Lua_na_240803_Check() --�g���~Ţ�ϥμ@�� �ˬd�ؼ�
	local Owner = OwnerID()
	local Target = TargetID()
	local OrgID = ReadRoleValue( Target , EM_RoleValue_OrgID ) 
	local NowHP = ReadRoleValue( Target , EM_RoleValue_HP )
	local MaxHP = ReadRoleValue( Target , EM_RoleValue_MaxHP)
	local HPPercent = NowHP / MaxHP
	local X = (HPPercent*100)

	if OrgID == 106564 then --�p�G�ؼЬO���ȩ�
		if X > 30 then
			ScriptMessage ( Owner , Owner , 1 , "[SC_240803_1]" , 0 )  --��������
			return false
		elseif X <=5 then --�ؼйL���z�A�L�k�@����s�˥�
			ScriptMessage ( Owner , Owner , 1 , "[SC_240803_2]" , 0 ) --�ؼйL���z�A�L�k�@����s�˥�
			return false
		elseif X == 0 then --�ؼп��~
			ScriptMessage ( Owner , Owner , 1 , "[SC_493625_2]" , 0 )  --�ؼФw���`
			return false
		else --�u�� 6-30% ��q���ؼХi�H�Q����	
				return true
		end

	else
		ScriptMessage ( Owner , Owner , 1 , "[SC_421249_4]" , 0 )  	--�ؼп��~
		return false
	end
end


function Lua_na_240803_Get()
	local Owner = OwnerID()	
	local Target = TargetID()	
	GiveBodyItem( Owner , 240804 , 1 )
	Hide( Target)
	killid( Target , Target)
end



--function Lua_106564_reset()
--	sleep( 50)
--	Show( OwnerID() , 0 )
--end



function Lua_119881_check() --��i�D�v�_�ˬd���a���W�O�_�� 241080���_����
	local Owner = OwnerID() 
	local Target = TargetID()
	if CheckAcceptQuest( Owner , 425023) == true then --�w��������
		if CheckFlag( Owner , 545768 ) == true then --�w�I���L�r��
			if CountBodyItem( Owner , 241080) >=1 then  --�p�G���W�� ���_����
			--	say(Owner, "123123" )
				LoadQuestOption( Owner)

			elseif CountBodyItem(Owner , 241079 ) == 0 then--�p�G���W�S�����_����, �w�g�����L���_���������A���W�S���ȹ�
				SetSpeakDetail( Owner , "[SC_425023_2]" ) --�A���ӬO��|�F����a�I�ڳo���٦��@��[241079]�A�p�G�o�{����S�O���F��A�]�\�N�O�y���ݡz�a�Ӫ�§���K�K
			--	say( Owner , "123")
				GiveBodyItem( Owner , 241079 , 1 ) --�������a�j�Ѫ��w��
			else				
				SetSpeakDetail( Owner , "[SC_425023_1]" ) -- �A�u���ݨ��u���ݡv�F�ܡH�ڷQ�A���ӤӮ`�ȡA�ҥH�ਭ�k���F�a�I
				--say(Owner, "NONONO" )
			end
		else
			SetSpeakDetail( Owner , "[SC_425023_1]" ) -- �A�u���ݨ��u���ݡv�F�ܡH�ڷQ�A���ӤӮ`�ȡA�ҥH�ਭ�k���F�a�I	
		end
	else
		LoadQuestOption( Owner)
	end
end


---------------------

function lua_Z31_Q425040_touch()
	local obj = OwnerID()
	Setplot(obj,  "touch" , "lua_Z31_Q425040_touch2" , 50 )
end

--Ū���I�k���e�ˬd
function lua_Z31_Q425040_touch2()

	local Player = OwnerID()
	local NPC = TargetID()
	local Mount = Lua_Mounts_Copilot( Player ) --�ˬd���a�O�_�b���H���M��y (true=���b��y�Afalse=�b��y)
	local questid = 425040
	local keyid = 545769 

	DW_CancelTypeBuff( 68 , Player ) --�M�����M�ɡA�I���U��

	if CheckAcceptQuest( Player, questid ) == true  then
		if CheckFlag(Player, keyid )  == false then
			if Mount == true then --���b��y
				if BeginCastBarEvent( Player , NPC , "[120661]" , 30 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_END , 0 , "lua_Z31_Q425040_touch3") ~= 1 then 
				--3��/�_�l�ʧ@/�����ʧ@/0=���ʤ��_/�����ɰ��檺�禡)
					ScriptMessage( Player , Player , 1 , "[SAY_NPC_BUSY]" , 0 ) --�ؼЦ��L��
				end
			else --�b��y
				ScriptMessage( Player , Player , 1 , "[SC_CRAFT_2011_08]" , 0 ) --"�M�����M�ɵL�k�i�榹�ʧ@�A�Х��Ѱ��M�����A�C"
			end
		else
			ScriptMessage( Player , Player , 1 , "[SC_Z31_Q425040_01]" , 0 ) --�ݰ_�Ӧ��I�޲����ť�...�C
		end
	else
		ScriptMessage( Player , Player , 1 , "[SC_Z31_Q425040_01]" , 0 ) --�ݰ_�Ӧ��I�޲����ť�...�C
	end

end

function lua_Z31_Q425040_touch3( Player , CheckStatus )
	local Target = TargetID()   -- npc


	DW_CancelTypeBuff( 68 , Player) --�M�����M�ɡA�I���U��

	if CheckStatus ~= 0 then
		if CheckStatus > 0 then --���\
			BeginPlot(Target, "lua_mika_Q425040_objborn", 0 )  
			EndCastBar( Player , CheckStatus ) --�M���I�k��	
		else --����
			EndCastBar( Player , CheckStatus ) --�M���I�k��
		end
	end
end



function lua_mika_Q425040_objborn()
	local OID = OwnerID()   -- OBJ
	local Player = TargetID()
	local Room = ReadRoleValue( OID, EM_RoleValue_RoomID )
	Local keyid = 545769 -- ���ȱ���
	local npcid = 106566  -- �t��C��

	BeginPlot(OID, "lua_mika_Q425040_hidden", 0 )  

	local NPC = Lua_CreateObjByDir( OID , npcid , 50 , 0);
	SetModeEx(NPC, EM_SetModeType_Move, true )--����
	SetModeEx(NPC, EM_SetModeType_Show, true )--���

	SetModeEx(NPC, EM_SetModeType_Strikback, false )--����
	SetModeEx(NPC, EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx(NPC, EM_SetModeType_Obstruct, false )--����
	SetModeEx(NPC, EM_SetModeType_Mark, false )--�аO
	SetModeEx(NPC, EM_SetModeType_Searchenemy, false )--����
	SetModeEx(NPC, EM_SetModeType_HideName, false )--�W��
	SetModeEx(NPC, EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx(NPC, EM_SetModeType_Fight , false  )--�i�������
	SetModeEx(NPC, EM_SetModeType_Drag , false )--���O

	AddToPartition( NPC , Room ) -- �إߪ���
	sleep(15)

	local X = ReadRoleValue( NPC, EM_RoleValue_X )
	local Y = ReadRoleValue( NPC, EM_RoleValue_Y )
	local Z = ReadRoleValue( NPC, EM_RoleValue_Z )
		
	local Range = 20 +  rand(6) --�üƲ��ʽd��
	MoveDirect( NPC, X+math.random(-Range,Range), Y, Z+math.random(-Range,Range) )

	Setflag(Player, keyid , 1)
	sleep(15)
	Delobj(NPC)
end


function lua_mika_Q425040_hidden()
	local npc = OwnerID()
	local sleeptime = 300    --30

	Hide(npc)
	Sleep(sleeptime)
	Show(npc, 0 )

end



function Lua_425023_endMessage() --�t����U �����᪺�T��
	local Target = TargetID()
	ScriptMessage( Target  , Target  , 1 , "[SC_425023_3]" , 0)
end