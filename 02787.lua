--/GM ? delkeyitem 547228 Q1�P�_���
--/GM ? delkeyitem 547230 ����
--/GM ? delkeyitem 547190 ���p��
--/GM ? delkeyitem 547226 Q2�i�_��

function sasa_121598_quest()
	local OID = OwnerID()	--player
	local TID = TargetID()  --Target
	local Down = CheckFlag( OID , 547230 )		--����
	local Q1 = CheckFlag( OID , 547228 )		--�i��Q1
	
	if Down == true then		--��������
		SetSpeakDetail( OID , "[SC_121600_7]" )   --���
		--�A������ƶܡH
	elseif Q1 == true then
		LoadQuestOption(OwnerID())	--Ū�����ȼҪO
	else
		SetSpeakDetail( OID , "[SC_121600_5]" )   --���
		--�N�檺�Ů𥿦���ۥͦs����I�A�Ӫ����n�A�Q���A�]�O�ӫi�r��U���_�I�̡C�Яd�U�}�Bťť�ڪ��ШD�A�n�ܡH
		AddSpeakOption( OID , TID , "[SC_121600_6]" , "sasa_121598_quest_2" , 0 )
		--�n�a�A���M�ګܦ��K
	end
end

function sasa_121598_quest_2()
	SetFlag( OwnerID() , 547228 , 1 )
	LoadQuestOption( OwnerID())	--Ū�����ȼҪO
	CloseSpeak(OwnerID())
end

--LuaP_Sleeping

function sasa_121600_quest()
	LoadQuestOption( OwnerID() )
	if ( CheckAcceptQuest( OwnerID() , 425784 ) == true )
	 and CheckFlag( OwnerID() , 547190 ) == false then
		AddSpeakOption( OwnerID() , TargetID() , "[SC_121600_1]" , "sasa_121600_01" , 0 )
		--�K�K�]�n�۹��^
		AddSpeakOption( OwnerID() , TargetID() , "[SC_121600_2]" , "sasa_121600_02" , 0 )
		--�аݡA�A�O[121600]�O�ܡH
	end
end

function sasa_121600_01()
	CloseSpeak( OwnerID() )
end
	
function sasa_121600_02()
	SetSpeakDetail( OwnerID() , "[SC_121600_3]" )
	--�ڡA�ڴN�O[121600]�I�A�O�ӱϧڪ��ܡH���ӺF�\�A���ӵy�����ǳƦ^��A�o�Q�����l�k��o�̨ӡA
	--�^�窺���]�ݤ��M�A���u�ܱo�V�ӶV�ҽk�A���٥H���ۤv�n���b�o�F�O�I
	--���K�ڪ��}���G���F�A�����ڳq��[121598]���H��U[QUEST_DIR_038]�A
	--��F�K���䨺�ǥմ����G�����O�ǻ�����[242040]�A�A���K���ںK�ӴX���e��[121598]���a�I
	--�@���N���U�A�F�K�y�I
	AddSpeakOption( OwnerID() , TargetID() , "[SC_121600_4]" , "sasa_121600_03" , 0 )
	--�O���F�K�o�J�������ܤU�a�I
end
	
function sasa_121600_03()
	local Soup = 242039
	local Count = CountBodyItem ( OwnerID(), Soup )
	
	if Count >= 1 then
		DelBodyItem( OwnerID() , Soup , 1 )	--�R����
		SetFlag( OwnerID() , 547190 , 1 )	--���X��(���)
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_421029_5]" , 2 )
	end
	CloseSpeak( OwnerID() )
end

function sasa_425783_Winter()
	SetFlag( TargetID() , 547226 , 1 )
	SetFlag( TargetID() , 547228 , 0 )
	SetFlag( TargetID() , 547230 , 1 )
	SetFlag( TargetID() , 547330 , 1 )
	local Lv = ReadRoleValue( TargetID() , EM_RoleValue_Lv )
	DesignLog( TargetID() , 121599 , "Winter Game01 Lv"..Lv )
end

function sasa_425783_Winter_2()
	SetFlag( TargetID() , 547226 , 0 )
	SetFlag( TargetID() , 547331 , 1 )
	local LLv = ReadRoleValue( TargetID() , EM_RoleValue_Lv )
	DesignLog( TargetID() , 121599 , "Winter Game02 LLv"..LLv )
end