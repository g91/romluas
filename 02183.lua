function Lua_xmas_crulmax_na()

	SetSpeakDetail( OwnerID(), GetString("SC_CRULMAX_01") ) --�ݧr�I�ܴΪ��x�V��a�I�����Űӷ|���F�y�P�x�V�`�A���X�F�G�m�x�V�𪺬��ʡA�u�n����@�w�ƶq��������§���A�N�i�H�����˹�����I�C
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_CRULMAX_02"), "Lua_crulmax_na_10", 0 ) --��X10�ӥ�����§��
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_CRULMAX_03"), "Lua_crulmax_na_30", 0 ) --��X30�ӥ�����§��
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_CRULMAX_04"), "Lua_crulmax_na_50", 0 ) --��X50�ӥ�����§��
end


function Lua_crulmax_na_10()
	if CountBodyItem( OwnerID(), 208470) >= 10 then
		DelBodyItem( OwnerID(), 208470, 10)
		GiveBodyItem( OwnerID(), 208471 , 1) --�˹���(10)
		SetSpeakDetail( OwnerID(), "[SC_CRULMAX_05]")  -- ���§A���ѻP�A�o�O�x�V�𪺸˹��~�A�֥h���W�a�I�M�ڭ̤@�_���x�V���ܱo��[�}�ɵ��R�C
		if CheckFlag ( OwnerID(),544559 ) ==false then  --����|������L���y
			GiveBodyItem( OwnerID(), 206437, 1) --�ڬO���_�_�Ү�
			SetFlag( OwnerID(), 544559, 1) --�}�ҨC�����X��
			SetSpeakDetail( OwnerID(), "[SC_CRULMAX_05]")  -- ���§A���ѻP�A�o�O�x�V�𪺸˹��~�A�֥h���W�a�I�M�ڭ̤@�_���x�V���ܱo��[�}�ɵ��R�C
		else 
			return false
		end
	else 
		SetSpeakDetail( OwnerID(), "[SC_CRULMAX_06]")  -- �A���W�S��������������§���C
	end
end



function Lua_crulmax_na_30()
	if CountBodyItem( OwnerID(), 208470) >= 30 then
		DelBodyItem( OwnerID(), 208470, 30)
		GiveBodyItem( OwnerID(), 208574 , 1) --�˹���(30)
		SetSpeakDetail( OwnerID(), "[SC_CRULMAX_05]")  -- ���§A���ѻP�A�o�O�x�V�𪺸˹��~�A�֥h���W�a�I�M�ڭ̤@�_���x�V���ܱo��[�}�ɵ��R�C
		if CheckFlag ( OwnerID(),544559 ) ==false then  --����|������L���y
			GiveBodyItem( OwnerID(), 206437, 1)--�ڬO���_�_�Ү�
			SetFlag( OwnerID(), 544559, 1) --�}�ҨC�����X��
		else 
			return false
		end
	else 
		SetSpeakDetail( OwnerID(), "[SC_CRULMAX_06]")  -- �A���W�S��������������§���C
	end
end



function Lua_crulmax_na_50()
	if CountBodyItem( OwnerID(), 208470) >= 50 then
		DelBodyItem( OwnerID(), 208470, 50)
		GiveBodyItem( OwnerID(), 208575 , 1) --�˹���(50)		
		SetSpeakDetail( OwnerID(), "[SC_CRULMAX_05]")  -- ���§A���ѻP�A�o�O�x�V�𪺸˹��~�A�֥h���W�a�I�M�ڭ̤@�_���x�V���ܱo��[�}�ɵ��R�C
		if CheckFlag ( OwnerID(),544559 ) ==false then  --����|������L���y		
			GiveBodyItem( OwnerID(), 206437, 1) --�ڬO���_�_�Ү�
			SetFlag( OwnerID(), 544559, 1) --�}�ҨC�����X��
		else 
			return false
		end
	else 
		SetSpeakDetail( OwnerID(), "[SC_CRULMAX_06]")  -- �A���W�S��������������§���C
	end
end