function Lua_mika_springfes_reset()
	local Owner = OwnerID()
	SetFlag(Owner , 542427, 0)  --�Q���Ѫ��m�J
	SetFlag(Owner , 542428, 0)  --��ä������1
	SetFlag(Owner , 542519, 0) --��ä������2
	SetFlag(Owner , 542433, 0) -- �a�ߤl�^�a1
	SetFlag(Owner , 542491, 0) -- �a�ߤl�^�a2
	SetFlag(Owner , 544861, 0) --���D�a~�Ԥ��
	SetFlag(Owner , 545001,0)--�m�J�ְּe
	SetFlag(Owner , 545002,0)
	SetFlag(Owner , 545003,0)
	SetFlag(Owner , 546228, 0 ) --�u�@�m�J�j�@��
	SetFlag(Owner , 546288, 0 ) --�u�@�m�J�@�μ��y
	ic_Easter_play(0)--�e�m�J
	SetFlag(Owner,546257, 0 ) --�Ԥ�l�r�O
	BeginPlot(Owner,"lua_kors_sprfes_rabbitTaxi_RE",0)
	BeginPlot(Owner,"lua_kors_SprinRain_2012_ReDo",0)
	ScriptMessage( Owner ,  Owner , 1, "[SC_SPRINGFES_NEW06]" , C_SYSTEM )  --�A�{�b�i�H���s�i��Ҧ��K�B�`�����o�I
	ScriptMessage( Owner ,  Owner , 0, "[SC_SPRINGFES_NEW06]" , C_SYSTEM )  --�A�{�b�i�H���s�i��Ҧ��K�B�`�����o�I
end