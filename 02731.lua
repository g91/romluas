
--SC_FAIRYTALE2012_SASA_01~06
--241639--���n�a
--850370--�b��
--623324--�Q�b����
--121266--�ǧJ�D�촵
--121267--��
--781181--�X��1~15 = �ͤ� , 16 = ��F�B , 17 = �ͬ]��
--546877--�������Q�^�����
--546901--������������
--546902--���L���n�a
--107205--��]��
--106823--����
--107209--�a�^������
-----------------------------------------------���

--�� NPC ��--

function sasa_Fairytale_npc01()
	LoadQuestOption(OwnerID())
	local OID = OwnerID()	--player
	local TID = TargetID()  --Target
	local Ok = CheckFlag( OID , 546901 )		--�������ȺX��
	if Ok == false then							--�p�G�S���������ȺX��
		--SetSpeakDetail( OID , "HELP" )   --���
		--AddSpeakOption( OID , OID , "[SC_0908SEANSON_60]" , "LuaN_mika_09summerlove_good_story" , 0 )
		--SC_FAIRYTALE2012_SASA_01
		--�ڷQ���D<CB>���ܸ`</CB>���Ѩ�
		AddSpeakOption( OID , OID , "[SC_FAIRYTALE2012_SASA_02]" , "sasa_Fairytale_npc02" , 0 )
		--�p���X������
	elseif Ok == true then
		--SetSpeakDetail( OID , "HELP" )   --���
		--AddSpeakOption( OID , OID , "[SC_0908SEANSON_60]" , "LuaN_mika_09summerlove_good_story" , 0 )
		--SC_FAIRYTALE2012_SASA_01
		--�ڷQ���D<CB>���ܸ`</CB>���Ѩ�
		AddSpeakOption( OID , OID , "[SC_FAIRYTALE2012_SASA_02]" , "sasa_Fairytale_npc02" , 0 )
		--�p���X������

		-- 2013. 07.23 6.0.1 �����_ �s�W�x���ݨD - �B�����m�ﶵ -----------
		local Language = GetServerDataLanguage() 
	--	if Language ~= "rw" then  -- �S�����m�ﶵ ���ե�
		if Language ~= "tw" then  -- �S�����m�ﶵ ������
			AddSpeakOption( OID , TID , "[SC_FAIRYTALE2012_SASA_04]" , "sasa_Fairytale_again01" , 0 )  --�ڷQ�A���A�@��
		end
	end
end

function sasa_Fairytale_npc02()
	local OID = OwnerID()  --player
	local TID = TargetID()  --Target
	SetSpeakDetail( OID , "[SC_FAIRYTALE2012_SASA_03]" )   --�p�󻰤�
	--1. �����A����������ϥιa�L�A��������O�D�H�C
	--2. ���b�����I����񲾰ʡC�]�ŶZ���ӻ��A�H�K�����ֲ��ʩζè��C�^
	--3. �N�����i���餺�Y�i�C
	
	--<CS>�`�N�G�����W���a�n�����ɮɨ��O���A�H�K�����]���C</CS>
	AddSpeakOption( OID , OID , "[SC_111352_2]" , "sasa_Fairytale_npc01" , 0 )    --back
	--�^�W�@��
end

function sasa_Fairytale_again01()	--�ڷQ�I�����ܸ`���m��
	SetSpeakDetail( OwnerID(), "[SC_FAIRYTALE2012_SASA_05]"   )
	--���§A�@�N���ڡA�i�O�a�L�����S��a�ۭ��L�a�F�K�i�H�ЧA��<CN>[203784]</CN>�ӵ��ڶܡH�ڰ��W���@�ӷs���I
	AddSpeakOption( OwnerID(), TargetID(), "[SC_0908SEANSON_65]" , "sasa_Fairytale_again02" , 0 ) 
	--�T�w
end

function sasa_Fairytale_again02()	--�T�w���m
	CloseSpeak(OwnerID())
	local item = CountBodyItem( OwnerID() , 203784 )  --���|�����ǰe��
	if item >= 1 then
		SetFlag( OwnerID() , 546901 , 0 )		--���m
		--GiveBodyItem( OwnerID() , 240043 , 1 )	--���m��
		DelBodyItem( OwnerID() , 203784 , 1 )	--���|�����ǰe��
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_FAIRYTALE2012_SASA_08]" , C_YELLOW )
		--�a�L�צn�F�A�A�u���n���ڶܡH
	else
		ScriptMessage( OwnerID() ,  OwnerID() , 1 , "[SC_112503_NO]" , 0 )  --�A�ҫ������~�ƶq������I
		ScriptMessage( OwnerID() ,  OwnerID() , 0 , "[SC_112503_NO]" , 0 )  --�A�ҫ������~�ƶq������I
	end
end

function sasa_121267_Bullsay()
	local OID = OwnerID()  --player
	local TID = TargetID()  --Target
	SetSpeakDetail( OID , "[SC_FAIRYTALE2012_SASA_06]" )
	--�N�N�K
end

function sasa_Fairytale_npcgive()	--���U���Ȱ���@��
	local Getring = CheckFlag( TargetID() , 546902 )	--���n�aFLAG
	if Getring == false then							--�p�G�S�����n�aFLAG
		GiveBodyItem( TargetID() , 241639 , 1 )			--���n�a
		Setflag( TargetID() , 546902 , 1 )				--��FLAG
	end
end

function sasa_Fairytale_reward()	--��������
	local Player = TargetID()
	Setflag( Player , 546901 , 1 )		--��������KEYITEM
	local Lv = ReadRoleValue( Player , EM_RoleValue_Lv )
	DesignLog( Player , 121266 , "Fairytale Farm Boy Lv"..Lv )
	Sleep(20)
	Lua_Festival_08_All(Player)
	--[[local TID = Player  
	--< OID���нж�J�Ӭ��ʤ��O"���a"���ܼ�,  �Ҧp Local OID = player
	-- �p�G���q��OwnerID �����a�h���ݧ��
	local allcount = 3	--�Ҧ��s���ʼƶq
	local count = 0
	local keylist =  {
		546901,	--�����֦~
		541322,	--�ܼ@�j��
		546907	--�Q�泌�s
			}
	for i = 1 , table.getn(keylist) do
		if Checkflag( Player , keylist[i] )  == true then
			count = count + 1
		end
		if i == table.getn(keylist) then
			if count == allcount then	--�p�G��������
				lua_mika_festivalbuffgive( Player , 0 )		--2012. 8�뵣�ܸ`���ʬ�����0
			end
		end
	end]]--
end

------------------------------�H�W---------���Ȱ�-----

-----���-----------�H�U----------------------------

function sasa_Fairytale_BullandCtrl()	--�ͤ�+�]��ͦ���+�F�}��
	--Say( OwnerID() , "Come the Bull!" )
	Beginplot( OwnerID() , "sasa_Fairytale_BullBorn" , 0 )		--��
--	Sleep(10)
	--Say( OwnerID() , "Ctrl to live!" )
	--Beginplot( OwnerID() , "sasa_Fairytale_CtrlRange" , 0 )		--����Z��
	--Sleep(10)
	--Say( OwnerID() , "Get done!" )
	--Beginplot( OwnerID() , "sasa_Fairytale_GetDone" , 0 )		--�F�}
end

--�� �]��ͦ��� ��--
--[[function sasa_Fairytale_CtrlRange()
	local Ctrl = CreateObjByFlag( 121268 , 781181 , 17 , 1 )
	Beginplot( Ctrl , "sasa_107205_wood" , 0 )
end]]--

--�� �]��+���� ��--
function sasa_107205_wood()
	Lua_Hao_Round_wall( OwnerID() , 107205 , 12 , 120 , 0 )		--���11
	Sleep(10)
	Lua_Hao_Round_wall( OwnerID() , 106823 , 12 , 95 , 0 )		--���7
end

-- 2015.08.28 ���E�A�s�W�A�Ω� Script �s��������(��L�s���L�k�s��)�A���b����A�קK�Ť��L�G���������D
local g_CowList = {};	-- ��e�Ť��M��

-------------------------------------------------------------------
--�� �ͤ��� ��--
function sasa_Fairytale_BullBorn()

	-- 2015.08.28 ���E�G���b����A�קK�Ť��L�G���������D
	local Zone = ReadRoleValue( OwnerID(), EM_RoleValue_RealZoneID );	-- �u��ϰ�(���h���y)
	g_CowList[Zone] = {};
	--

	local Control = CreateObjByFlag( 121268 , 781181 , 17 , 1 )		--�F�}��
	SetModeEx( Control , EM_SetModeType_Searchenemy , false )	--����
	SetModeEx( Control , EM_SetModeType_Mark , false )			--�аO
	SetModeEx( Control , EM_SetModeType_Fight , false ) 		--���
	SetModeEx( Control , EM_SetModeType_Move , false )	--����
	SetModeEx( Control , EM_SetModeType_ShowRoleHead , true )
	SetModeEx( Control , EM_SetModeType_Strikback , false )	--����
	SetModeEx( Control , EM_SetModeType_Show , false )		--���q�X
	AddToPartition( Control , 0 )

	-- 2015.08.28 ���E�G���b����A�קK�Ť��L�G���������D
	for i = 1 , 15 do
		sasa_Fairytale_BullBorn2( i , Control );
	end
	CallPlot( Control, "Hao_CheckCowCount", Control )
	Beginplot( Control, "sasa_Check5_OverOK" , 0 )
	-- 

end

-- 2015.08.28 ���E�A�s�W�A�Ω� Script �s��������(��L�s���L�k�s��)�A���b����A�קK�Ť��L�G���������D
function Hao_CheckCowCount( Control )

	local Zone = ReadRoleValue( Control, EM_RoleValue_RealZoneID );	-- �u��ϰ�(���h���y)

	while true do
		local CowList = #g_CowList[Zone];
		for i = 1, CowList do
			if not CheckID( g_CowList[Zone][i] ) then
			--	DebugMsg( 0, 0, "CowCount = "..CowList..", Born = "..i );
				sasa_Fairytale_BullBorn2( i , Control );
			end
		end
		Sleep(100);	-- �C 10 ���ˬd�@�������O�_���L�G���������D�A�����ܱN�����s������������
	end
end

function sasa_Fairytale_BullBorn2( Number , Control )
	local Bull = CreateObjByFlag( 121267 , 781181 , Number , 1 )
	SetModeEx( Bull , EM_SetModeType_Strikback , false )		--����
	SetModeEx( Bull , EM_SetModeType_SearchenemyIgnore , false )		--�Q�j�M
	SetModeEx( Bull , EM_SetModeType_Obstruct , false )		--����
	SetModeEx( Bull , EM_SetModeType_Fight , false )			--�i�������
	SetModeEx( Bull , EM_SetModeType_Searchenemy , false )	--����
	SetModeEx( Bull , EM_SetModeType_Mark , true )			--�аO
	SetModeEx( Bull , EM_SetModeType_Move , true )			--����
	SetModeEx( Bull , EM_SetModeType_HideName , true )		--�W��
	SetModeEx( Bull , EM_SetModeType_ShowRoleHead , true )	--�Y����
	AddToPartition( Bull , 0 )
	WriteRoleValue( Bull , EM_RoleValue_PID , Number )
	WriteRoleValue( Bull , EM_RoleValue_register10 , Control )

	-- 2015.08.28 ���E�G���b����A�קK�Ť��L�G���������D
	local Zone = ReadRoleValue( Bull, EM_RoleValue_RealZoneID );	-- �u��ϰ�(���h���y)
	g_CowList[Zone][Number] = Bull;
	--
	Beginplot( Bull , "sasa_Fairytale_BullAI" , 0 )
end

function sasa_Fairytale_BullAI()
	local MO = OwnerID()	--��
	local Check = ReadRoleValue( MO , EM_RoleValue_register10 )	--�P�_�c
	local MOGO = 623324		--�Q�b����
	local X = ReadRoleValue( MO , EM_RoleValue_X )
	local Y = ReadRoleValue( MO , EM_RoleValue_Y )
	local Z = ReadRoleValue( MO , EM_RoleValue_Z )
	local D = ReadRoleValue( MO , EM_RoleValue_Dir )
	local IsTamed = 0		--�O�_���Q�b���L	
	
	while 1 do
		if GetDistance( MO , Check ) >= 600 then
			ScriptMessage( MO , 0 , 1 , "[SC_FAIRYTALE2012_SASA_09]" , 0 )
			--�A�w�g�W�L���`�������d��
			sasa_Fairytale_runaway();
		end
		if CheckBuff( MO , MOGO ) == true then	--���Q�b����BUFF
			if IsTamed == 0 then
				IsTamed = 1
			end
		else								--���W�S���Q�b������buff
			local Range = 20 + rand(6)		--�üƲ��ʽd��
			WriteRoleValue( MO  , EM_RoleValue_IsWalk , 2 )		--�Ψ���
			--say( MO , "MO range = "..range )
			--sleep(30) 
			local Time = MoveDirect( MO , X+math.random(-Range,Range) , Y , Z+math.random(-Range,Range) );
			Sleep(Time);
			if IsTamed ~= 0 then			--���Q�b���L
				IsTamed = 0;
				sasa_Fairytale_runaway();
			end
		end
		sleep(10)
	end
end

--�� ���]+���� ��--
function sasa_Fairytale_runaway()
	local FlagNum = ReadRoleValue( OwnerID() , EM_RoleValue_PID )   --Ū���o�����O�b�X���Ѥl�X�ͪ� 
	local Check = ReadRoleValue( OwnerID() , EM_RoleValue_register10 )	--�P�_�c
	Npcsay( OwnerID() , "[SC_FAIRYTALE2012_SASA_06]" )
	--�N�N�K
	--AdjustFaceDir( OwnerID() , Player , 180 )	--���V�I��
	WriteRoleValue( OwnerID() , EM_RoleValue_IsWalk , 0 )	--�ζ]��
	WriteRoleValue( OwnerID() , EM_RoleValue_register1 , 0 )
	sleep(5)
	Lua_MoveLine( OwnerID() , 50 )	--�ѦҪ���A�V�e���ʨ�Dis�Z������m(Dis��t�Ƭ��V�Ჾ��)
	sleep(10)
	Hide(OwnerID())			
	sleep(50)	--5���X�{
	sasa_Fairytale_BullBorn2(FlagNum , Check)
	Delobj(OwnerID())
	--Show( OwnerID() , 0 ) 
end

function sasa_Fairytale_Bull_Go()		--�s���]
	local Self = OwnerID()
	local MO = TargetID()	--��
	local MOGO = 623324		--�Q�b����	
	local dis = Rand( 50 )    --�����a�h���ʶZ��20-50
	if dis < 30 then
		dis = 30
	end
	--Say( MO , "go ="..dis )	
	AdjustFaceDir( MO , Self , 180 )			--���V�I��
	WriteRoleValue( MO , EM_RoleValue_IsWalk , 1 )	--�Ψ���
	sleep(5)
	Lua_MoveLine( MO , Dis )	--�ѦҪ���A�V�e���ʨ�Dis�Z������m(Dis��t�Ƭ��V�Ჾ��)
	sleep(10)	
end

function sasa_Fairytale_623324_Check()		--��b623324���ˬdLua
	local Self = OwnerID()
	local MO = TargetID()	--��
	local MOGO = 623324		--�Q�b����
	local TakeMo = 107209	--�a�^������
	local IsMyMo = 623341	--�P�_�O�_�O�ۤv�񪪪���

	if CheckBuff( MO , MOGO ) == true then		--���Q�b����BUFF
		local MOGO_Owner = star_BuffInfo( MO , MOGO , EM_BuffInfoType_OwnerID )		--�ˬd�����W�Q�b�����O�֩�
		if MOGO_Owner == Self then		--�p�G�����W���Q�b�����O�ۤv��
			if CheckBuff( MO , 623329 ) == true then	--�p�G����F�ت��a
				if DW_CheckQuestAccept( "or" , Self , 425687 ) == true then	--����QUEST
					DW_QietKillOne( Self , TakeMo )		--���H�����Ϊ�����o��������
				end
				AddBuff( MO , 507956 , 0 , 10 )			--�w���
				ScriptMessage( Self , Self , 1 , "[SC_FAIRYTALE2012_SASA_07]" , C_YELLOW )
				--�����b�A����U�U�^��F����C
				return false
			else
				sasa_Fairytale_Bull_Go()	--�s���]
				return true
			end	
		else	
			return false
		end
	elseif CheckBuff( MO , IsMyMo ) == true then		--�ˬd�O�_�O�Q�ۤv�񪪹L����
		local IsMyMo_Owner = star_BuffInfo( MO , IsMyMo , EM_BuffInfoType_OwnerID )
		if IsMyMo_Owner == Self then
			return true
		else
			ScriptMessage( MO , 0 , 1 , "[SC_FAIRYTALE2012_SASA_10]" , 0 )
			--���H���b�񪪳o����
			return false	
		end
	else
		sasa_Fairytale_Bull_Go()	--�s���]
		return true
	end
end

function sasa_Fairytale_623341_Check()		--��b623341���ˬdLua
	local Self = OwnerID()
	local MO = TargetID()	--��
	local IsMyMo = 623341	--�P�_�O�_�O�ۤv�񪪪���
	if CheckBuff( MO , IsMyMo ) == true then		--�ˬd�O�_�O�Q�ۤv�񪪹L����
		local IsMyMo_Owner = star_BuffInfo( MO , IsMyMo , EM_BuffInfoType_OwnerID )
		if IsMyMo_Owner == Self then
			return true
		else
			return false
		end	
	else
		return true
	end
end

function sasa_Fairytale_850370_Check()		--��b850370���ˬdLua
	local GID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )	--�ˬd�I�k�ؼЪ�ID
	if GID == 121267 then		--�O���~�i�H�I��
		return true
	elseif GID ~= 121267 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_FAIRYTALE2012_SASA_01]" , 0 )
		--�n�a�ɭn��ۤ��ϥΡK
		return false
	end
end

function sasa_Fairytale_Buff_623246()		--���a�b�����P�w
	AddBuff( OwnerID() , 623246 , 0 , 6 )
end

--�� �F�}�� ��--
--�w�X�֦ܥͤ��ϸ�

--�� �O�_��5�� ��--
function sasa_Check5_OverOK()
	local ball = OwnerID()
	while 1 do
		sleep(10)
		CastSpellLV( ball , ball , 850380 , 0 )
	end
end