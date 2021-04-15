function LuaQ_420178_OnClick()
	local ItemID = 200635
	local ItemCount = 1

	local Count = CountBodyItem( OwnerID(), ItemID );

	if( Count >= ItemCount ) then
		return 1;
	else
		return -1;
	end
end
----------------------------------------------------------------------------------------------------------------------------
function LuaQ_420178_AfterClick()

	if DelBodyItem( OwnerID(),200635, 1 ) then
		BeginPlot( TargetID() , "LuaQ_420178_1" , 0 )
		return 1
	end
	return -1
end
-----------------------------------------------------------------------------------------------------------------------------
function LuaQ_420178_1()
	
	DisableQuest( OwnerID() , true )
	Local V_Ankaria = LuaFunc_SearchNPCbyOrgID( OwnerID() , 100074 , 500 )--��X�ŧ��w�d���Ȫ�����ID

	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP ) --�N�k�]�}�H�����䦺�`�ʧ@			
	if CheckID(V_Ankaria) == true and ReadRoleValue( V_Ankaria , EM_RoleValue_IsDead) ~= 1 then 
--		CastSpell( V_Ankaria,OwnerID() , 490102 ) -- �����W�@�ӭt��BUFF
		SetPlot( V_Ankaria ,"dead", "LuaQ_420178_2" , 40 )
	else

		local Ankaria = LuaFunc_CreateObjByObj ( 110205 , OwnerID() )

		CastSpell( Ankaria, Ankaria, 490102 ) -- �w�d�����F��X�{�ɪ��S�� 
		local Player = LuaFunc_PartyData( TargetID() )
		for i = 1 , Player[0] , 1 do
			if CheckAcceptQuest( Player[i] , 420178 ) == true then 
				SetFlag( Player[i] , 540332 , 1 )
			end
		end
	end
	SetPlot( OwnerID() ,"Touch","LuaFunc_Obj_BUSY",40)
--	DisableQuest( OwnerID() , fasle )

end
-----------------------------------------------------------------------------------------------------------------------------
function LuaQ_420178_2()
	Say( OwnerID() ,GetString("SAY_100074_3")) --/*�i�c......�p�G������o�ӸT�D�ڪ��cŢ�A�گu�����O�q......
	local Orb = LuaFunc_SearchNPCbyOrgID( OwnerID() , 110206 , 500 )
	local Ankaria = LuaFunc_CreateObjByObj ( 110205 , OwnerID() )
	local PlayerLV = ReadRoleValue( TargetID() , EM_RoleValue_LV )
	local PlayerSUBLV = ReadRoleValue( TargetID() , EM_RoleValue_LV_SUB )
	DesignLog(OwnerID(),100074,"Killer Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)
	CastSpell( Ankaria, Ankaria, 490102 ) -- �w�d�����F��X�{�ɪ��S�� 
	local Player = LuaFunc_PartyData( TargetID() )
	for i = 1 , Player[0] , 1 do
		if CheckBuff( Player[i] , 502039 ) == true and CountBodyItem( Player[i] , 530358 ) <1 then
			GiveBodyItem ( Player[i] , 530358 , 1 )	-- �Y�ΡG�u�����R���̡v
		end
		if CheckAcceptQuest( Player[i] , 420178 ) == true then 
			SetFlag( Player[i] , 540332 , 1 )
		end
	end
	return true	
end
-----------------------------------------------------------------------------------------------------------------------------
function LuaQ_420179_Complet()
	WriteRoleValue(OwnerID() , EM_RoleValue_IsWalk , 1 )
--	SetPlot( OwnerID(),"Touch","LuaFunc_Obj_BUSY",40)
	DisableQuest( OwnerID() , true )
	local Ankaria = CreateObjByFlag ( 110205 , 780022 , 1 , 1 )
	AdjustFaceDir( OwnerID(), Ankaria , 0 )
	AddToPartition( Ankaria , 0 )
--	SetPlot( Ankaria ,"Touch","LuaFunc_Obj_BUSY",40)
	DisableQuest( Ankaria , true )
	Sleep(30)
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Say( OwnerID(),GetString("SAY_110203_1")) --/*�w�d���ȡK�K�p���¦p�������R�K�K
	Sleep(20)
	Say( Ankaria,GetString("SAY_110205_1")) 
	PlayMotion( Ankaria,ruFUSION_ACTORSTATE_EMOTE_SPEAK)	
	--/*�ڿ˷R���B�G�A�ڪ��ɶ����h�F�A�b���[�����뤤�ڪ��F��w�Q�C�C���d�z�A�Y�N�����b�o�ӥ@�ɡK�K���n�b�˪L�k�������֤U�A���گ�A����A�@���C
	Sleep(30)
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	sleep(20)
	PlayMotion( Ankaria,ruFUSION_ACTORSTATE_EMOTE_SPEAK)	
	Say( Ankaria,GetString("SAY_110205_2")) 	
	--/*�ڦ��@��ܭ��n���ƭn�i�D�A�A�ѩ�ڪ��F��w�g�S���O�q���c�F�V���A�e����M�s���O�q�ӷ��ӥN���ڡK�K���N�|�Ϩe�����ʦL������A�A�@�w�n����e�K�K
	Sleep(50)
	PlayMotion( Ankaria,ruFUSION_ACTORSTATE_EMOTE_SPEAK)	
	Say( Ankaria,GetString("SAY_110205_3")) 	
	--/*�٦��A�ܷ洵�šK�K�R�B�N�|�Ϧo�P�o���ƪ��L�h�s���A�ӬO�N�ڭ̬��o�ǳƪ�§���浹�o���ɭԤF�A�Ʊ�o����O�@�o�C
	Sleep(30)
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	sleep(20)	
	PlayMotion( Ankaria,ruFUSION_ACTORSTATE_EMOTE_SPEAK)	
	Say( Ankaria,GetString("SAY_110205_4")) 	
	--/*�ڷR�A�A�]��ܷ洵�Ż��A�ڷR�o�A�åB�藍�_�A�ڨS������@�ӥ��˸Ӱ����ơK�K�A���F�A�ڿ˷R���B�G�K�K
	Sleep(10)
	PlayMotion( Ankaria,ruFUSION_ACTORSTATE_EMOTE_EAT)
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_BEG)	
	Say( OwnerID(),GetString("SAY_110203_2")) --/*���I���n���I�w�d���ȡI
	Sleep(20)
	DelObj ( Ankaria )
	sleep(10)
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_CRY )
	sleep(50)
	LuaFunc_MoveToFlag( OwnerID(), 780022 , 1 ,10 )
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_CROUCH_BEGIN)
	sleep(30)
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_CROUCH_END)
	LuaFunc_MoveToFlag( OwnerID(), 780022 , 0 ,10)
	AdjustFaceDir( OwnerID(), TargetID() , 0 )
	Sleep(30)
	Say( OwnerID(),GetString("SAY_110203_3")) --/*�K�̫�ڷQ�A���U�A�@��ơC
	DisableQuest( OwnerID() , false )
--	SetPlot( OwnerID(),"Touch","",40)
END
---------------------------------------------------------------------------------------------------------------------------
function LuaQ_420178_Complete() 
	local Count = CountBodyItem( TargetID() , 200635)
	if Count > 0 then
		DelBodyItem(  TargetID() , 200635 ,Count )
	end
end