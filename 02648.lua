-- Z31 �s�رڤ�u���ȼ@�� (�̨�)  -- 11 - 20

--------------Q12   --------------
--425043 ����p�e

--���~ - �t���^���Ť�	241064�ϥ��ˬd
function lua_mika_Q425043_item_check()
	local TID = TargetID()    -- NPC
	local OID = OwnerID()  -- Player

	local OrgID = ReadRoleValue( TID , EM_RoleValue_OrgID )
	local MaxHP = ReadRoleValue( TID , EM_RoleValue_MaxHP )	--Ū����q
	local NowHP = ReadRoleValue(  TID , EM_RoleValue_HP )
	local HPPercent = NowHP / MaxHP	--��q�ʤ���
	local PID = ReadRoleValue( TID, EM_RoleValue_PID )  -- Ū���Ǫ�PID

	if  CheckAcceptQuest(OID , 425043 ) == true then  -- ����������
		if ( CheckID( TID ) == false ) then  --�S����H
			ScriptMessage( OID , OID , 1 , "[SC_424142_1]" , 0 ) --�ϥΥؼп��~�I
			return false
		elseif ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) == 1 then --�I�k��H�O���a
			ScriptMessage( OID , OID , 1 , "[SC_424142_1]" , 0 ) --�ϥΥؼп��~�I
			return false
		else  
			if OrgID == 106564  or OrgID == 106566 then   -- ��H���T �t����w(106564)  ,  �t�����(106566) 
				if  ReadRoleValue(  TID , EM_RoleValue_IsDead ) == 1 then   -- �p�G�ؼФw������
					ScriptMessage( OID , OID , 1 , "[SC_493625_2]" , 0 )	--�ؼФw���`
					return false
				else
					if  HPPercent > 0.3  then  -- �ؼЦ�q �h��30 %
						ScriptMessage( OID , OID , 1 , "[SC_Z31_Q425043_01]" , 0 ) -- new �]�k�~�F�Ӧa�k��F�C
						return false
					else
						if  PID == 9 then 
							ScriptMessage( OID , OID , 1 , "[SC_Z31_Q425043_02]" , 0 ) -- new  �L�k�A�����h���t��C
							return false
						else	-- ���\
							return true
						end
					end
				end
			else
				ScriptMessage( OID , OID , 1 , "[SC_424142_1]" , 0 )  --�ϥΥؼп��~�I
				return false
			end
		end
	else
		ScriptMessage( OID,  OID, 1, "[SC_424626_2]" , 0 )  -- �S��������
		return false
	end
end


--���~ - �t���^���Ť�	241064�ϥ�
function lua_mika_Q425043_item_use()
	local OID = OwnerID()  -- Player
	local TID = TargetID()   -- �Ǫ�
	local npcid = 106686  -- ����t��	
	local magicid = 850059

	CastSpell(TID, OID , magicid )   -- �Ǫ��^�X�k�N�S��
	WriteRoleValue(TID, EM_RoleValue_PID , 9 )  -- �g�J�Ǫ�PID?
	local PID = ReadRoleValue( TID, EM_RoleValue_PID )  -- Ū���Ǫ�PID
--	Say(OID, PID )
	DW_QietKillOne(OID, npcid  )
end


--------------Q14   --------------
-- 425045 �h�L���D�]

-- ���D����120454
--npc��l��ܼ@��
Function lua_mika_Q425045_npc01()
	local OID = OwnerID()
	local TID = TargetID()
	local keyid = 546227 -- �������D�������D�� 
	local questid = 425045
	local buffid =   622243 -- ���ȶi�椤buff

	if CheckAcceptQuest( OID, questid ) == true  then --��������
		if CheckFlag(OID, keyid ) == False and CheckBuff(OID, buffid ) == false  then  -- �S���ȶi�椤buff
			SetSpeakDetail(OID, "[SC_Z31_Q425045_02]"  )  -- new �A�ǳƦn�����D�ԤF�ܡH
			AddSpeakOption( OID, OID, "[SC_421955_1]", "lua_mika_Q425045_npcspeak2", 0 )--  �ڷǳƦn�F!  (�J���r��)
		else
			LoadQuestOption(OID)
		end
	else 
		LoadQuestOption(OID)
	end
end


function lua_mika_Q425045_npcspeak2()
	local OID = OwnerID()
	local TID = TargetID()
	local buffid =  622243 -- ���ȱM��buffid   Ĳ�o�k�N�� �C�����@��   (���u, ���Ϯ���)
	local keyid = 546268  -- �h�L�D�]���ȶi�椤

	CloseSpeak(OID)
	WriteRoleValue(TID, EM_RoleValue_PID , 9 )   -- �g�JNPC PID �Ȭ� 9 

	WriteRoleValue(OID, EM_RoleValue_Register1 , 0 )  -- score
	WriteRoleValue(OID, EM_RoleValue_Register2 , 12 )  -- timer
	local score = ReadRoleValue(OID, EM_RoleValue_Register1 )
	local timer  = ReadRoleValue(OID, EM_RoleValue_Register2 )

--	Say(OID , "score = "..score )
--	Say(OID , "timer ="..timer )
	local Time = timer*5

	Setflag(OID, keyid, 1 )  -- ����������keyitem �����ȮɧR��
	AddBuff(OID, buffid, 0 , 60 )   -- Ĳ�o�k�N�� �C�����@��
	ScriptMessage( OID , OID , 1 , "[SC_Z31_Q425045_01][$SETVAR1="..Time.."]" , C_SYSTEM ) -- new �Ѿl�ɶ��G[$VAR1]��

end



-- buff  �C5��Ĳ�o�k�N
function lua_mika_Q425045_buff()
	local OID = OwnerID()  -- Player
	local buffid =  622243 -- ���ȱM��buffid   Ĳ�o�k�N�� �C�����@��   (���u, ���Ϯ���)
	local keyid = 546268  -- �h�L�D�]���ȶi�椤
	local key = Checkflag(OID, 546268 )  -- ���ȶi�椤BUFF

	if key == true then
		AddRoleValue(OID, EM_RoleValue_Register2 , -1)
		local timer  = ReadRoleValue(OID, EM_RoleValue_Register2 )

		local Time = timer*5
		if timer > 0 then
			ScriptMessage( OID , OID , 1 , "[SC_Z31_Q425045_01][$SETVAR1="..Time.."]" , C_SYSTEM ) -- new �Ѿl�ɶ��G[$VAR1]��
		end
		if time == 0 then
			local keyid = 546227 -- �������D�������D�� 
			SetFlag(OID, keyid , 1)
			ScriptMessage( OID , OID , 1 , "[SC_DANCEFES_SUKI_MAKE15]" , C_SYSTEM ) -- �ɶ��� (�J���r��)
		end
	else
	--	Say(OID, "no key, Cancel buff")
		CancelBuff(OID, Buffid )
	end
end


-- �Ǫ����`�@��
function lua_mika_Q425045_dead()
	local OID = OwnerID()
	SetPlot( OID , "dead" , "lua_mika_Q425045_dead1" , 0 );
end

function lua_mika_Q425045_dead1()
	local OID = OwnerID() 
	local TID = TargetID()  -- player 
	local questid = 425045   -- �h�L���D�]
	local buffid =   622243 -- ���ȶi�椤buff

	if CheckAcceptQuest( TID, questid ) == true  and CheckBuff(TID, buffid ) == true  then
		AddRoleValue(TID , EM_RoleValue_Register1 , 1  ) -- score
		local score = ReadRoleValue(TID, EM_RoleValue_Register1 )   --����
		ScriptMessage( TID , TID , 2 , "[SC_Z31_Q425045_03][$SETVAR1="..score.."]" , C_SYSTEM ) -- �ثe�o���G[$VAR1]��
--		Say(TID , "score ="..score )

	end

end


function lua_mika_Q425045_complete()
	local OID = OwnerID()
	local TID = TargetID()  -- player 

	local score = ReadRoleValue(TID, EM_RoleValue_Register1 )   --����

	if score >= 5 then
		ScriptMessage( TID , TID , 1 , "[SC_Z31_Q425045_06]" , C_SYSTEM ) 
		GiveBodyItem( TID, 203489 , 5 )  -- �����Ū�ů��_��
 		-- �n�a�A�ڿ�F...���D�G�M�S���ݿ��A�A�A�h�a�A�O�d�t�ڭ̪�����C
	elseif score < 5 then
		ScriptMessage( TID , TID , 1 , "[SC_Z31_Q425045_05]" , C_SYSTEM ) 
		-- ...�S�Q��A�]���L�p���A�����p�����D�@�w���o���z�ѡC�A�|�a�C
	end

end

--------------Q15   --------------

--425046-׶���H��

-- �I�����Ȫ��� �U�N������	120431
function lua_mika_Q425046_touch()
	local obj = OwnerID()
	Setplot(obj,  "touch" , "lua_mika_Q425046_touch2" , 50 )
end

--Ū���I�k���e�ˬd
function lua_mika_Q425046_touch2()

	local Player = OwnerID()
	local NPC = TargetID()
	local Mount = Lua_Mounts_Copilot( Player ) --�ˬd���a�O�_�b���H���M��y (true=���b��y�Afalse=�b��y)
	local questid = 425046
	local questid2 = 425223
	local buffid = 622201 -- cd �Ϊkbuff
	local needid =  241066 --���㲰

	DW_CancelTypeBuff( 68 , Player ) --�M�����M�ɡA�I���U��

	if CheckAcceptQuest( Player, questid ) == true or CheckAcceptQuest( Player, questid2 ) == true then

		if Mount == true then --���b��y
			if CountBodyItem(Player, needid ) > 0 then 
				if CheckBuff(NPC, buffid ) == false then
					if BeginCastBarEvent( Player , NPC , "[SC_Z31_Q425046_02]" , 50 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_END , 0 , "lua_mika_Q425046_touch3") ~= 1 then 
					--3��/�_�l�ʧ@/�����ʧ@/0=���ʤ��_/�����ɰ��檺�禡)
					-- �K�[����
						ScriptMessage( Player , Player , 1 , "[SAY_NPC_BUSY]" , 0 ) --�ؼЦ��L��
					end
				else
					ScriptMessage( Player , Player , 1 , "[SC_Z31_Q425046_03]" , 0 ) --  �{�b�٤��ݭn[SC_Z31_Q425046_02]�C
				end
			else
				ScriptMessage( Player , Player , 1 , "[NO_ITEM][$SETVAR1=[241066]]" , 0 )   --  �A�S��[$VAR1]�C
			end
		else --�b��y
			ScriptMessage( Player , Player , 1 , "[SC_CRAFT_2011_08]" , 0 ) --"�M�����M�ɵL�k�i�榹�ʧ@�A�Х��Ѱ��M�����A�C"
		end
	else
		ScriptMessage( Player , Player , 1 , "[SC_Z31_Q425046_01]" , 0 ) -- New �A�{�b�٤��ݭn�ϥΥ��C
	end

end

function lua_mika_Q425046_touch3( Player , CheckStatus )
	local Player = OwnerID()
	local NPC = TargetID()  
	local npcid = 106687  -- �K�[���	
	local buffid = 622201 -- cd �Ϊkbuff

	DW_CancelTypeBuff( 68 , Player) --�M�����M�ɡA�I���U��
	if CheckStatus ~= 0 then
		if CheckStatus > 0 then --���\
			AddBuff(NPC, buffid, 0 , 30 )
			DW_QietKillOne(Player, npcid  )
			EndCastBar( Player , CheckStatus ) --�M���I�k��	
		else --����
			EndCastBar( Player , CheckStatus ) --�M���I�k��
		end
	end
end



--------------Q18   --------------
--  425054	��m�~��

-- �Z������ �Ϊk�N�P�_

-- ���~ - �]�ޤ��� 241117  �ϥμ@��
function lua_mika_Q425054_itemcheck()
	local OID = OwnerID()
	local TID = TargetID()
	local OrgID = 106585 --	���W��a�u��
	local TargetNPC = ReadRoleValue(TID, EM_RoleValue_OrgID )
	local buffid = 622203  -- �]�ޤ��ĮĪG
	local bufftime = 25

	if Checkquest( OID, 425054, 0 )  == true or Checkquest( OID, 425225, 0 )  == true then  -- ���������� 
		if ( CheckID( TargetID() ) == false ) then  --�S����H
			ScriptMessage( OID , OID , 1 , "[SC_424142_1]" , 0 ) --�ϥΥؼп��~�I
			return false
		elseif ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) == 1 then --�I�k��H�O���a
			ScriptMessage( OID , OID , 1 , "[SC_424142_1]" , 0 ) --�ϥΥؼп��~�I
			return false
		else  
			if OrgID ~= TargetNPC then
				ScriptMessage( OID , OID , 1 , "[SC_424142_1]" , 0 ) --�ϥΥؼп��~�I
				return false
			else
				if CheckBuff( TID, buffid ) == false then  -- �Sbuff
					return true
				else  -- ��buff
					ScriptMessage( OID , OID , 1 , "[SC_Z31_Q425054_01]" , 0 )   -- new �o�e��H�w����[622203]�C
					return false
				end
			end
		end
	else
		ScriptMessage( OID(),  OID, 1, "[SC_424626_2]" , 0 )  -- �S��������
		return false
	end
end


-- ���~ - �]�ޤ��� 241117  �ϥμ@��
function lua_mika_Q425054_itemuse()
	local OID = OwnerID()  -- Player 
	local TID = TargetID()   -- npc
	local npcid = 106688  --	�ϥ��]�ޤ���
	local buffid = 622203  -- �]�ޤ��ĮĪG
	local bufftime = 15	

	CastSpell(TID, TID, 850062 )  -- �º�S��
	DW_QietKillOne(OID, npcid  )
	AddBuff(TID, buffid , 0 , bufftime ) 
	local R = Rand(100)+1

	if R > 70 then 
		NPCSAY(TID, "[SC_Z31_Q425054_02]" )
	else
		NPCSAY(TID, "[SC_Z31_Q425054_03]" )
	end
end


--------------Q19   --------------
-- 425055	�����h��

-- �ǰe�ۼ@��
function lua_mika_Q425055_stone()  --�ǰe��
	ChangeZone(OwnerID() , 31, 0, 1263, 1560, -947, 81)
end


-- �ï��D�v�K ��l��ܼ@��
function LuaS_120441_0()  --lua_mika_Q425055_npcspeak��function�W��
	local OID = OwnerID()
	local TID = TargetID()
	local questid = 425055
	local keyid = 546226  -- ���o�ï��D�v�K���P�N
	local key = Checkflag(OID, keyid )
	
	LoadQuestOption(OID)
	SetSpeakDetail(OID, "[SC_Z31_Q425055_01]"  )  -- new 
	if CheckAcceptQuest( OID, questid ) == true and key == false then -- ���������� & no key
		AddSpeakOption( OID, OID, "[SC_Z31_Q425055_02]", "lua_mika_Q425055_npcspeak2", 0 )--  new 
		-- �൹�ڤ@�ǰs�ܡH
	end
	LuaS_110388_0()	--2012/09/24�W�[�ǲ߲i���ﶵ
end

-- �ï��D�v�K2
function lua_mika_Q425055_npcspeak2()
	local OID = OwnerID()
	local TID = TargetID()
	local keyid = 546226  -- ���o�ï��D�v�K���P�N

	Setflag(OID, keyid, 1 )
	SetSpeakDetail(OID, "[SC_Z31_Q425055_03]"  )  -- new 
	-- ���䦳�ǰs�~�A�n�h�֧A�N�ۤv���a�A�O�Ȯ�I
end


--���~�s��	120322
--- ����Ĳ�I�@��  
function lua_mika_Q425055_touch()
	local obj = OwnerID()	
	Setplot(obj,  "touch" , "lua_mika_Q425055_touch2" , 50 )		
end 

function lua_mika_Q425055_touch2()
	local NPC = TargetID()
	local player = OwnerID()
	local Mount = Lua_Mounts_Copilot( Player ) --�ˬd���a�O�_�b���H���M��y (true=���b��y�Afalse=�b��y)
	local keyid = 546226  -- ���o�ï��D�v�K���P�N
	local key = Checkflag(player, keyid )

	local itemid  = 241118 --�ż����s	
	local count = CountBodyItem(player, itemid )   --  �ż����s count 	

	DW_CancelTypeBuff( 68 , Player ) --�M�����M�ɡA�I���U��

	if CheckAcceptQuest( Player, 425055 ) == true then
		if key == true then  -- ��key
			if count < 3 then 
				if Mount == true then --���b��y
					if BeginCastBarEvent( Player , NPC , "[SC_Z31_Q425055_04]" , 30 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_END , 0 , "lua_mika_Q425055_touch3") ~= 1 then 
					--3��/�_�l�ʧ@/�����ʧ@/0=���ʤ��_/�����ɰ��檺�禡)  
					-- new ���ˬ��s
						ScriptMessage( Player , Player , 1 , "[SAY_NPC_BUSY]" , 0 ) --�ؼЦ��L��
					end
				else --�b��y
					ScriptMessage( Player , Player , 1 , "[SC_CRAFT_2011_08]" , 0 ) --"�M�����M�ɵL�k�i�榹�ʧ@�A�Х��Ѱ��M�����A�C"
				end
			else
				ScriptMessage( Player , Player , 1 , "[SC_Z31_Q425055_06]" , 0 ) --  new  �A�w���o���������~�C
			end

		else
			ScriptMessage( Player , Player , 1 , "[SC_Z31_Q425055_05]" , 0 ) -- new �٬O���M[120441]���@�n�a�H
		end
	else
		ScriptMessage( Player, Player, 1, "[SC_424626_2]" , 0 ) -- �S�������� 
	end
end

function lua_mika_Q425055_touch3( Player , CheckStatus )
	local NPC = TargetID()  -- �s��
	local itemid  = 241118 --�ż����s	

	if CheckStatus ~= 0 then
		if CheckStatus > 0 then --���\
			local Orgid = ReadRoleValue(NPC , EM_RoleValue_OrgID )
	
			GiveBodyItem(Player, itemid , 1 )
			BeginPlot(NPC, "lua_mika_Q425055_hidden", 10 )  
			EndCastBar( Player , CheckStatus ) --�M���I�k��	
		else --����
			EndCastBar( Player , CheckStatus ) --�M���I�k��
		end
	end
end

function lua_mika_Q425055_hidden()
	local npc = OwnerID()
	local sleeptime = 250

	Hide(npc)
	Sleep(sleeptime)
	Show(npc, 0 )

end