--�I������
function Lua_na_124129()
	local Owner = OwnerID()
	local Target = TargetID()
	AdjustFaceDir(Target, Owner, 0 )
	SetSpeakDetail( Owner , "[SC_PHANTOM_STORY1]")
	AddSpeakOption( Owner, Owner , "[SC_PHANTOM_OPTION7]", "Lua_na_Phantom_Story1" , 0 )
	if CheckCompleteQuest( Owner , 427354 ) == false then
		AddSpeakOption( Owner, Owner , "[SC_PHANTOM_OPTION6]", "Lua_na_124129_1" , 0 ) --�ǳƱ�����
	end
	if CheckFlag( Owner , 540033) == true then
		AddSpeakOption( Owner , Owner , "[SC_PHANTOM_OPTION8]", "Lua_na_phantom_type" , 0 ) --������F����
	end
		
end

function Lua_na_Phantom_Story1()
	local Owner = OwnerID()
	SetSpeakDetail( Owner , "[SC_PHANTOM_STORY2]")
	AddSpeakOption( Owner, Owner , "[SC_PHANTOM_OPTION4]", "Lua_na_Phantom_Story2" , 0 )
end

function Lua_na_Phantom_Story2()
	local Owner = OwnerID()
	SetSpeakDetail( Owner , "[SC_PHANTOM_STORY3]")
	AddSpeakOption( Owner, Owner , "[SC_PHANTOM_OPTION5]", "Lua_na_Phantom_Story3" , 0 )
	AddSpeakOption( Owner, Owner , "[SO_110068_2]", "Lua_na_Phantom_Story1" , 0 )
end

function Lua_na_Phantom_Story3()
	local Owner = OwnerID()
	SetSpeakDetail( Owner , "[SC_PHANTOM_STORY4]")
	if CheckCompleteQuest( Owner , 427354 ) == false then
		AddSpeakOption( Owner, Owner , "[SC_PHANTOM_OPTION6]", "Lua_na_124129_1" , 0 ) --�ǳƱ�����
	end
	AddSpeakOption( Owner, Owner , "[SO_110068_2]", "Lua_na_Phantom_Story2" , 0 )
end

function Lua_na_124129_1()
	local Owner = OwnerID()
	SetFlag( Owner , 540033 , 1 ) --���������ȥκX��
	SetSpeakDetail( Owner , "[SC_PHANTOM_NPC_SPEAK7]") --�{�b�N�h��[124126]�A�o�|�i�D�A�i�J��@�ɪ��覡�C
end

function Lua_na_phantom_type()
	local Owner = OwnerID()
	SetSpeakDetail( Owner , "[SC_PHANTOM_TYPE_00]")  --���F�����С@�u���F�v�Ӧ۩���Y�����z�L�e���`�J��q���ϥd
	if CheckCompleteQuest( Owner , 427354 ) == false then
		AddSpeakOption( Owner, Owner , "[SC_PHANTOM_OPTION6]", "Lua_na_124129_1" , 0 ) --�ǳƱ�����
	end
end


----------------------------------------------------------------
--���K�ӤH[124125]
function Lua_na_121270() --���K�ӤH������
	local Owner = OwnerID()
	local Room = ReadRoleValue( Owner, EM_RoleValue_RoomID)
	local ShopGuy
	local FlagGroup = 12
	local R = DW_Rand(FlagGroup)
	ShopGuy = CreateObjByFlag( 124125 , 781454, R , 1 ) --�H����m����NPC
	WriteRoleValue( Owner , EM_RoleValue_PID , R ) --�קK���Ʀb�P�@�Ӧ�m�X�{�A���������O��X�Ц�m�A�g�JPID
	SetModeEx(ShopGuy, EM_SetModeType_Mark, true )--�аO
	AddToPartition( ShopGuy, Room )
	while true do
		local hour = GetSystime(1) --��
		local min = GetSystime(2) --��
		if hour%2 == 0 then
			if min == 0 then
				local R1 = DW_Rand(11)
				local PID = ReadRoleValue( Owner , EM_RoleValue_PID)
				DelObj( ShopGuy )
				Sleep(10)
				if R1 == PID then
					ShopGuy = CreateObjByFlag( 124125 , 781454, R1+1 , 1 ) --�H����m����NPC
					WriteRoleValue( Owner , EM_RoleValue_PID , R1+1 ) --�קK���Ʀb�P�@�Ӧ�m�X�{�A�ҥH�N�ثe�X�Ц�m�g�JPID
				else
					ShopGuy = CreateObjByFlag( 124125 , 781454, R1 , 1 ) --�H����m����NPC
					WriteRoleValue( Owner , EM_RoleValue_PID , R1 ) --�קK���Ʀb�P�@�Ӧ�m�X�{�A�ҥH�N�ثe�X�Ц�m�g�JPID
				end
				SetModeEx(ShopGuy, EM_SetModeType_Mark, true )--�аO
				AddToPartition( ShopGuy, Room )
			end			
		end
		sleep(600)
	end
end


function Lua_na_124125_TALK()
	local Owner = OwnerID() --PLAYER
	local Target = TargetID() -- NPC
	if CheckQuest( Owner , 427355 , 0 ) == true or CountBodyItem( Owner , 243289) >= 1 or CheckFlag( Owner , 549361) == true or CheckFlag( Owner , 549372 ) == true then --���a�w�ʶR�L
		SetSpeakDetail( Owner, "[SC_PHANTOM_NPC_SPEAK6]")  --�ڳo�̨S���A�ݭn���F��I
	else
		SetSpeakDetail( Owner , "[SC_PHANTOM_NPC_SPEAK1]")
		AddSpeakOption( Owner, Owner , "[SC_PHANTOM_NPC_SPEAK5]" , "Lua_na_124125_OPTION" , 0 )
	end
end


function Lua_na_124125_OPTION()
	local Owner = OwnerID()
	if CheckFlag( Owner , 549361) == false then
		if CheckFlag( Owner , 549360) == true then
			SetSpeakDetail( Owner, "[SC_PHANTOM_NPC_SPEAK4]")  --�A�u�������ꥴ���F�I	
			AddSpeakOption( Owner , Owner, "[SO_OPENSHOP]" , "Lua_na_124125_Shop" , 0 )	--�ө���ܿﶵ	
		elseif CheckFlag( Owner , 549359) == true then
			SetSpeakDetail( Owner, "[SC_PHANTOM_NPC_SPEAK3]")  --�A���S�ӤF! 
			SetFlag( Owner , 549361 , 1 ) --�C��
			SetFlag( Owner , 549360 , 1 ) --�ĤG��
		else
			SetSpeakDetail( Owner, "[SC_PHANTOM_NPC_SPEAK2]")  --���Ȫ��u���~�H�ڤ����D���O����I
			SetFlag( Owner , 549361 , 1 ) --�C��
			SetFlag( Owner , 549359 , 1 ) --�Ĥ@��
		end
	end
end

	
function Lua_na_124125_Shop()	--�}�ұ��ȹ��~�c��
	SetShop( TargetID() , 600586 , "Test_Shop_Close" )
	CloseSpeak( OwnerID() )	--������ܵ���
	OpenShop()
end


----------------------------------------------------------------------------------------------
--[���ȼ@��
function Lua_na_243290_open()
	local Owner = OwnerID()
	local Target = TargetID()
	Setflag ( Target , 549372, 1 ) --�����i�J��@�ɪ��X��
	ScriptMessage( Target, Target , 3 , "[SC_243290_USE]" , 0 ) --���H����뺸�ȸ��A�{�G�������x������
	CastSpell( Owner, Target, 852232) --�I��S��
end


function Lua_na_243291_use()
	BeginPlot( OwnerID() , "Lua_na_243291_use1", 0)
end


function Lua_na_243291_use1()
	local Owner =  OwnerID()
	local Phantom = { 104472 , 104482 , 104526 }	--�[��Bڦ���B��������
	
	DialogCreate( Owner , EM_LuaDialogType_Select , "[SC_PHANTOM_TYPE_04]" )
	DialogSelectStr( Owner , "[SC_PHANTOM_OPTION1]" )  --�B�ʫ����F
	DialogSelectStr( Owner , "[SC_PHANTOM_OPTION2]" )  --��í�����F
	DialogSelectStr( Owner , "[SC_PHANTOM_OPTION3]" )  --�`�������F

	if( DialogSendOpen( Owner ) == false ) then
		ScriptMessage( Owner , Owner , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 ) --��ưe�X�����D
		return 0
	end

	local SelectID = Hsiang_GetDialogResoult( Owner );--�����]�_�Ӫ����ݦ^�Х�function

	if SelectID == 0 then 
		SetFlag( Owner , 549372, 1)
		GiveBodyItem( Owner , 200023 , 50)	--�}�Ҥ��F���O�A�ݸm�� 104526 ��������
		delbodyitem( Owner , 243291 , 1)
	elseif SelectID == 1 then
		SetFlag( Owner , 549372, 1)
		GiveBodyItem( Owner , 200024 , 50)	--�}�Ҥ��F���O�A�ݸm�� 104482 ڦ��
		delbodyitem( Owner , 243291 , 1)
	elseif SelectID == 2 then
		SetFlag( Owner , 549372, 1)
		GiveBodyItem( Owner , 200025 , 50)	--�}�Ҥ��F���O�A�ݸm�� 104472 �[��
		delbodyitem( Owner , 243291 , 1)
	end
	DialogClose( Owner )
end


function Lua_na_243291_close()
	local Owner = OwnerID()
	DelBodyItem( Owner , 243291 , 1 )
	return false
end
----------------------------------------------------------------------------------------------
--������L�ӤH - �]�w�p�a��Icon
function LuaS_124126_0()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Magic)
end

--������L�ӤH - ���
function YoYo_MirrorShopSpace_NPC124129()
	SetSpeakDetail( OwnerID() , "[SC_NPC124129_TALK]" )
	AddSpeakOption( OwnerID() , TargetID() , "[SC_240181_SHOP_02]" , "YoYo_OpenMirrorShop" , 5 )	--�}�Ұө��ﶵ
end

function YoYo_OpenMirrorShop()
	SetShop( TargetID() , 600559 , "Test_Shop_Close" )
	CloseSpeak( OwnerID() )	--������ܵ���
	OpenShop()
end
----------------------------------------------------------------------------------------------
--��@�ɻP���F�t�� - �e�ɥ��ȵn�J���ܰT��
function YoYo_Phantom_Remind()
	if ReadRoleValue( OwnerID() , EM_RoleValue_LV ) >= 90 then	--���a�D¾���Ťw��90
		if CheckFlag( OwnerID() , 540033 ) == false then	--���a�|���i�J���F�ɤޥ��Ȧ�
			ScriptMessage( OwnerID() , OwnerID() , 3 , "[SC_PHANTOM_REMIND]" , 0 )
		end
	end
end