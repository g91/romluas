--�`�y���� 2009�~4��K�B�`
--�إߪ�  : ���ʥ��� ��ʨ�
------------------------------------------------------------------------------
--���� �a�ߤl�^�a�h
--NPC �����D�Ԥ�
-----------------------------------------------------------------------------
function LuaN_112503_0() --NPC �����D�Ԥ�  OK
	SetSpeakDetail(OwnerID(), "[SC_112503_01]" )--�i�H�����ڧ��g�F�����P��ܡH 
	AddSpeakOption(OwnerID(), TargetID(), "[SC_112502_01]", "LuaN_112503_01", 0) --����a�ߤl�^�a�h����
	AddSpeakOption(OwnerID(), TargetID(), "[SC_112503_012]", "LuaN_112503_02", 0) --�ڭn�ѥ[����
	AddSpeakOption(OwnerID(), TargetID(), "[SC_112503_201]", "LuaN_112503_201", 0) --�H5����^���Ԥ�ߧI�����y
end
------------------------------------------------------------------------------
function LuaN_112503_01() --����a�ߤl�^�a����  OK
	SetSpeakDetail(OwnerID(), "[SC_112503_111]" ) --�C�~��F�o�ɭԡA�ڭ̩Ԥ�ߤ@�ڷ|�a�۱m�J�æb��U���A�C(��)
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112503_0", 0 ) --�^��W�@�� 
end
------------------------------------------------------------------------------
function LuaN_112503_02() --�ڭn�ѥ[����   OK  
	local today1= CheckFlag(OwnerID()  , 542433) -- ����w���o�d���c
	local rabbit =  CountBodyItem( OwnerID() , 204120 ) --��^���Ԥ��
	local bag =  CountBodyItem( OwnerID() , 204119 )   --�d���c

	if today1 == true then   --�p�G�����o�X��
		SetSpeakDetail(OwnerID(), "[SC_112503_END]" )--�A���Ѥw�g���o�L�d���c�o��I
		AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112503_0", 0 ) --�^��W�@�� 
	else         --�p�G�S���X��
		SetSpeakDetail(OwnerID(), "[SC_112503_GOGO]" )--�A�ǳƦn�F�ܡH3�B2�B1�AGOGO�I�I 
		GiveBodyItem( OwnerID() , 204119  , 5 ) --�� �d���cX5
		SetFlag( OwnerID()  , 542433 , 1 )   --�����a����w���o�d���cFlag
	end
end
------------------------------------------------------------------------------
function LuaN_112503_201() --�H5����^���Ԥ�ߧI�����y OK
	local today = CheckFlag( OwnerID() , 542491) --���ѧI���L���y
	local rabbit = CountBodyItem( OwnerID() , 204120 ) --��^���Ԥ��
	if today == true then
		SetSpeakDetail (OwnerID(), "[SC_DAN_111700_20]") --�w�g�I���L���y���(���W��flag)
	else
		if rabbit >= 5 then --�p�G�ƶq��
			SetSpeakDetail(OwnerID(), "[SC_112503_GET]" )--�P�§A��A���ݧA���Ѫ��ѥ[���I 
			GiveBodyItem( OwnerID() , 204218  , 3 )   -- �귽
			DelBodyItem( OwnerID() , 204120 , 5 ) --�R ��^���Ԥ��X5
			SetFlag(OwnerID(), 542491 , 1) 
			AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112503_0", 0 ) --�^��W�@�� 
		else --�p�G�ƶq����
			SetSpeakDetail(OwnerID(), "[SC_112503_NO]" )--�A�ҫ������~�ƶq������I	
			AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112503_0", 0 ) --�^��W�@�� 
		end
	end	
end
------------------------------------------------------------------------------