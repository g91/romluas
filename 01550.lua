-----------------Ĳ�I�_���۶�

function LuaS_422742_0()----Ĳ�I�@��
		SetPlot( OwnerID() , "touch" , "LuaS_422742_1" , 40 )
end
function LuaS_422742_1()----�ˬd���L���� ���LBUFF
         if (CheckAcceptQuest(OwnerID(),422742)==true )and    (CheckFlag(OwnerID(), 543334) == false)    and   (CheckBuff( OwnerID(),504706)==true  ) then
             BeginPlot( OwnerID(), "LuaS_422742_2", 0)
------ 	sleep(20)
	BeginPlot( TargetID(),  "LuaS_422742_kk", 0)
         else
         ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_422742_KK]", 0 )
         end
end

function LuaS_422742_Busy()
	ScriptMessage( OwnerID(),OwnerID(),0, "[SC_422742_KK]", 0 )---�]�k�W�R�त�A�L�k�}��.......
	ScriptMessage( OwnerID(),OwnerID(),1, "[SC_422742_KK]", 0 )---	
end

function LuaS_422742_kk()----�b�_���۶����W�]�ˬd�@��
 	SetPlot( OwnerID(), "touch", "LuaS_422742_Busy", 40)
	sleep(20)
	local FF = LuaFunc_SearchNPCbyOrgID( OwnerID() ,102673 ,500 )
	local TT = LuaFunc_SearchNPCbyOrgID( OwnerID() ,102674 ,500 )
	While 1 do
		if CheckID(FF) == false and CheckID(TT) == false then	--�p�G���Ⱖ���b���W	
			SetPlot( OwnerID() , "touch" , "LuaS_422742_1" , 40 )	--�Ѱ��۬W����w
			--LuaFunc_ResetObj( OwnerID() )
			break	--���X�j��
		end
		if CheckID(TargetID()) == false or ReadRoleValue(TargetID() , EM_RoleValue_IsDead) == 1 or ReadRoleValue(TargetID() , EM_RoleValue_IsNPC) == 1 then	--�p�G���a���b���W
			SetPlot( OwnerID() , "touch" , "LuaS_422742_1" , 40 )	--�Ѱ��۬W����w
			--LuaFunc_ResetObj( OwnerID() )
			if CheckID(FF) == true then
				Delobj(FF)
			end
			if CheckID(TT) == true then
				Delobj(TT)
			end

			break	--���X�j��
		end
		sleep( 20 )	--�j���ˬd���j�ɶ�
	end
End


function LuaS_422742_2()----�b�X�l���a�� �X��  437 �Ⱖ113511  113512----if CheckBuff( OwnerID(),504706)==0-----�P�_���S��BUFF  ��BUFF���ܴN�~��U�@�qSCRIPT �p�G�S��BUFF���ܴN���ܬF�� �������a
	local EE = Lua_DW_CreateObj("flag",113568,780437, 0 )
	local FF = Lua_DW_CreateObj("flag",113568,780437, 1 )
	CastSpell( EE, EE,  491276)  
	CastSpell( FF,  FF,  491276)
	sleep(35)  
	local CC = Lua_DW_CreateObj("flag",102673,780437, 0 )
	local TT = Lua_DW_CreateObj("flag",102674,780437, 1 )
	DelObj(EE)
	DelObj(FF)
	--CastSpell( CC,CC,490100)  
	--CastSpell( TT,TT,490100)  
	DisableQuest( CC , true )
	DisableQuest( TT , true )                
        	if	CheckBuff(OwnerID(),504706)==false	then
		SAY(CC,"[SC_422742_17]")
		SAY(TT,"[SC_422742_17]")
		SetRoleCamp(CC,"Monster")
		SetRoleCamp(TT,"Monster")
		SetAttack(CC, OwnerID())
		SetAttack(TT, OwnerID())
		CallPlot(CC,"LuaFunc_Obj_Suicide",60)
		CallPlot(TT,"LuaFunc_Obj_Suicide",60)
		return
	end
 	BeginPlot(CC,"LuaS_422742_3",0)
 	BeginPlot(TT,"LuaS_422742_4",0)

	while	(ReadRoleValue(CC,EM_RoleValue_PID)==0) or (ReadRoleValue(TT,EM_RoleValue_PID)==0)	do
		sleep(10)
		if	CheckBuff(OwnerID(),504706)==false	then
			SAY(CC,"[SC_422742_17]")
		          	SAY(TT,"[SC_422742_17]")
			SetRoleCamp(CC,"Monster")
			SetRoleCamp(TT,"Monster")
			SetAttack(TT, OwnerID())
			SetAttack(CC, OwnerID())
			CallPlot(CC,"LuaFunc_Obj_Suicide",60)
			CallPlot(TT,"LuaFunc_Obj_Suicide",60)
					return
			end
		end


	Say(TT,"[SC_422742_2]")----[113442]�A�ڪ������٦n�ܡH
		--PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
		for	i=1,3,1	do---
			sleep(10)
			if	CheckBuff(OwnerID(),504706)==false	then
				SAY(CC,"[SC_422742_17]")
		          		SAY(TT,"[SC_422742_17]")
				SetRoleCamp(CC,"Monster")
				SetRoleCamp(TT,"Monster")
				SetAttack(TT, OwnerID())
				SetAttack(CC, OwnerID())
				CallPlot(CC,"LuaFunc_Obj_Suicide",60)
				CallPlot(TT,"LuaFunc_Obj_Suicide",60)
				return
			end
		end
         	Say(TT,"[SC_422742_3]")----�۱q�W���A���L�f�F�A�ڴN�@����ߵۥL�K�K
		for  i=1,4,1	do
			sleep(10)
			if	CheckBuff(OwnerID(),504706)==false	then
				SAY(CC,"[SC_422742_17]")
		          		SAY(TT,"[SC_422742_17]")
				SetRoleCamp(CC,"Monster")
				SetRoleCamp(TT,"Monster")
				SetAttack(TT, OwnerID())
				SetAttack(CC, OwnerID())
				CallPlot(CC,"LuaFunc_Obj_Suicide",60)
				CallPlot(TT,"LuaFunc_Obj_Suicide",60)
				return
			end
		end
	PlayMotion( CC,ruFUSION_ACTORSTATE_BUFF_SP01)
	Say(CC,"[SC_422742_4]")----���L�A��Ǻ��I�ڭ̥i���O���F�A�����¦ӨӪ��I
		for  i=1,3,1	do
			sleep(10)
			if	CheckBuff(OwnerID(),504706)==false	then
				SAY(CC,"[SC_422742_17]")
		          		SAY(TT,"[SC_422742_17]")
				SetRoleCamp(CC,"Monster")
				SetRoleCamp(TT,"Monster")
				SetAttack(TT, OwnerID())
				SetAttack(CC, OwnerID())
				CallPlot(CC,"LuaFunc_Obj_Suicide",60)
				CallPlot(TT,"LuaFunc_Obj_Suicide",60)
				return
			end
		end
	PlayMotion( CC,ruFUSION_ACTORSTATE_EMOTE_APPROVAL)
	Say(CC,"[SC_422742_5]")---[113442]�H�Ʊ�����n�F��? 
		for  i=1,4,1	do
			sleep(10)
			if	CheckBuff(OwnerID(),504706)==false	then
				SAY(CC,"[SC_422742_17]")
		          		SAY(TT,"[SC_422742_17]")
				SetRoleCamp(CC,"Monster")
				SetRoleCamp(TT,"Monster")
				SetAttack(TT, OwnerID())
				SetAttack(CC, OwnerID())
				CallPlot(CC,"LuaFunc_Obj_Suicide",60)
				CallPlot(TT,"LuaFunc_Obj_Suicide",60)
				return
			end
		end
	PlayMotion( TT,ruFUSION_ACTORSTATE_EMOTE_IDLE2)
	PlayMotion( CC,ruFUSION_ACTORSTATE_EMOTE_POINT)
	Say(CC,"[SC_422742_6]")----�N�O��[ZONE_DIMARKA]�������P���s�����������h�L�_�Ĭ𪺨Ƨr�I
		for  i=1,3,1	do
			sleep(10)
			if	CheckBuff(OwnerID(),504706)==false	then
				SAY(CC,"[SC_422742_17]")
		          		SAY(TT,"[SC_422742_17]")
				SetRoleCamp(CC,"Monster")
				SetRoleCamp(TT,"Monster")
				SetAttack(TT, OwnerID())
				SetAttack(CC, OwnerID())
				CallPlot(CC,"LuaFunc_Obj_Suicide",60)
				CallPlot(TT,"LuaFunc_Obj_Suicide",60)
				return
			end
		end
	PlayMotion( TT,ruFUSION_ACTORSTATE_EMOTE_IDLE)
	Say(CC,"[SC_422742_7]")----�O�M�ڸ˻[�I�_�h�A�l��ڭ̹L�ӭn������H
		for  i=1,3,1	do
				sleep(10)
			if	CheckBuff(OwnerID(),504706)==false	then
				SAY(CC,"[SC_422742_17]")
		          		SAY(TT,"[SC_422742_17]")
				SetRoleCamp(CC,"Monster")
				SetRoleCamp(TT,"Monster")
				SetAttack(TT, OwnerID())
				SetAttack(CC, OwnerID())
				CallPlot(CC,"LuaFunc_Obj_Suicide",60)
				CallPlot(TT,"LuaFunc_Obj_Suicide",60)
				return
			end
		end
	PlayMotion( TT,ruFUSION_ACTORSTATE_EMOTE_IDLE2)
	PlayMotion( CC,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Say(CC,"[SC_422742_8]")----�W�����H�i�O�ܴ��ݧA�o�����^��[ZONE_DIMARKA]���H���C
		for  i=1,4,1	do
				sleep(10)
			if	CheckBuff(OwnerID(),504706)==false	then
				SAY(CC,"[SC_422742_17]")
		          		SAY(TT,"[SC_422742_17]")
				SetRoleCamp(CC,"Monster")
				SetRoleCamp(TT,"Monster")
				SetAttack(TT, OwnerID())
				SetAttack(CC, OwnerID())
				CallPlot(CC,"LuaFunc_Obj_Suicide",60)
				CallPlot(TT,"LuaFunc_Obj_Suicide",60)
				return
			end
		end
	PlayMotion( CC,ruFUSION_ACTORSTATE_EMOTE_LAUGH)
	Say(CC,"[SC_422742_9]")----���ǪF��M[ZONE_DIMARKA]�������A���O������������I�A����a�H��Ǻ��H
		for  i=1,3,1	do
				sleep(10)
			if	CheckBuff(OwnerID(),504706)==false	then
				SAY(CC,"[SC_422742_17]")
		          		SAY(TT,"[SC_422742_17]")
				SetRoleCamp(CC,"Monster")
				SetRoleCamp(TT,"Monster")
				SetAttack(TT, OwnerID())
				SetAttack(CC, OwnerID())
				CallPlot(CC,"LuaFunc_Obj_Suicide",60)
				CallPlot(TT,"LuaFunc_Obj_Suicide",60)
				return
			end
		end
	PlayMotion( TT,ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)
	Say(TT,"[SC_422742_10]")----���A��.......
		for  i=1,3,1	do
			sleep(10)
			if	CheckBuff(OwnerID(),504706)==false	then
				SAY(CC,"[SC_422742_17]")
		          		SAY(TT,"[SC_422742_17]")
				SetRoleCamp(CC,"Monster")
				SetRoleCamp(TT,"Monster")
				SetAttack(TT, OwnerID())
				SetAttack(CC, OwnerID())
				CallPlot(CC,"LuaFunc_Obj_Suicide",60)
				CallPlot(TT,"LuaFunc_Obj_Suicide",60)
				return
			end
		end
	Say(CC,"[SC_422742_11]")----�ɡI�S�Ϊ��å�I���M�٦b�ʴ̥H���C
		for  i=1,3,1	do
			sleep(10)
			if	CheckBuff(OwnerID(),504706)==false	then
				SAY(CC,"[SC_422742_17]")
		          		SAY(TT,"[SC_422742_17]")
				SetRoleCamp(CC,"Monster")
				SetRoleCamp(TT,"Monster")
				SetAttack(TT, OwnerID())
				SetAttack(CC, OwnerID())
				CallPlot(CC,"LuaFunc_Obj_Suicide",60)
				CallPlot(TT,"LuaFunc_Obj_Suicide",60)
				return
			end
	PlayMotion( CC,ruFUSION_ACTORSTATE_BUFF_SP01)
	Say(CC,"[SC_422742_12]")---��F�I�����o�ǤF�I[113442]�A�֧�F�赹�ڧa�I
		for  i=1,4,1	do
			sleep(10)
			if	CheckBuff(OwnerID(),504706)==false	then
				SAY(CC,"[SC_422742_17]")
		          		SAY(TT,"[SC_422742_17]")
				SetRoleCamp(CC,"Monster")
				SetRoleCamp(TT,"Monster")
				SetAttack(TT, OwnerID())
				SetAttack(CC, OwnerID())
				CallPlot(CC,"LuaFunc_Obj_Suicide",60)
				CallPlot(TT,"LuaFunc_Obj_Suicide",60)
				return
			end
		end
	 Say(CC,"[SC_422742_13]")----���ֵ��ڡA�ڭ̥i�H�������X��h�����d���]�~�r�I
		for  i=1,3,1      do
			sleep(10)
			if	CheckBuff(OwnerID(),504706)==false	then
				SAY(CC,"[SC_422742_17]")
		          		SAY(TT,"[SC_422742_17]")
				SetRoleCamp(CC,"Monster")
				SetRoleCamp(TT,"Monster")
				SetAttack(TT, OwnerID())
				SetAttack(CC, OwnerID())
				CallPlot(CC,"LuaFunc_Obj_Suicide",60)
				CallPlot(TT,"LuaFunc_Obj_Suicide",60)
				return
			end
		end
	Say(CC,"[SC_422742_14]")----���I���ڡI�ڥi�O�ܴ��ݮ������ǳD�H���U��I
		for  i=1,3,1	do
			sleep(10)
			if	CheckBuff(OwnerID(),504706)==false	then
				SAY(CC,"[SC_422742_17]")
		          		SAY(TT,"[SC_422742_17]")
				SetRoleCamp(CC,"Monster")
				SetRoleCamp(TT,"Monster")
				SetAttack(TT, OwnerID())
				SetAttack(CC, OwnerID())
				CallPlot(CC,"LuaFunc_Obj_Suicide",60)
				CallPlot(TT,"LuaFunc_Obj_Suicide",60)
				return
			end
		end
	PlayMotion( TT,ruFUSION_ACTORSTATE_SHIELD_BASH)
	 Say(TT,"[SC_422742_15]")----����I�L���O[113442]�I�L�����W�S���Ǩ�[113442]�S�������D�I
		for  i=1,3,1	do
			sleep(10)
			if	CheckBuff(OwnerID(),504706)==false	then
				SAY(CC,"[SC_422742_17]")
		          		SAY(TT,"[SC_422742_17]")
				SetRoleCamp(CC,"Monster")
				SetRoleCamp(TT,"Monster")
				SetAttack(TT, OwnerID())
				SetAttack(CC, OwnerID())
				CallPlot(CC,"LuaFunc_Obj_Suicide",60)
				CallPlot(TT,"LuaFunc_Obj_Suicide",60)
				return
			end
		end
	Say(CC,"[SC_422742_16]")----�A......�A�s���O�֡I
		for  i=1,3,1	do
			sleep(10)
			if	CheckBuff(OwnerID(),504706)==false	then
				SAY(CC,"[SC_422742_17]")
		          		SAY(TT,"[SC_422742_17]")
				SetRoleCamp(CC,"Monster")
				SetRoleCamp(TT,"Monster")
				SetAttack(TT, OwnerID())
				SetAttack(CC, OwnerID())
				CallPlot(CC,"LuaFunc_Obj_Suicide",60)
				CallPlot(TT,"LuaFunc_Obj_Suicide",60)
				return
			end
		end
	 Setflag(OwnerID(),543334,1)
	 CancelBuff(OwnerID(),504706)
		while	true	do
			sleep(10)
			if	CheckBuff(OwnerID(),504706)==false	then
				SAY(CC,"[SC_422742_17]")
		          		SAY(TT,"[SC_422742_17]")
				SetRoleCamp(CC,"Monster")
				SetRoleCamp(TT,"Monster")
				SetAttack(TT, OwnerID())
				SetAttack(CC, OwnerID())
				CallPlot(CC,"LuaFunc_Obj_Suicide",60)
				CallPlot(TT,"LuaFunc_Obj_Suicide",60)
				return
			end
		end
end
end





function LuaS_422742_3()--���沾�ʼ@��(���@�����j�� ���F�ت����|�V�U����)

	DW_MoveToFlag( OwnerID(),780437,2,0 ,1 )
	--FaceObj( OwnerID(), TargetID() )
	AdjustFaceDir( OwnerID(), TargetID(), 0 )

	WriteRoleValue(OwnerID(),EM_RoleValue_PID,1)

end

function LuaS_422742_4()--���沾�ʼ@��(���@�����j�� ���F�ت����|�V�U����)
	DW_MoveToFlag( OwnerID(),780437,3,0,1 )
	--FaceObj( OwnerID(), TargetID() )
	AdjustFaceDir( OwnerID(), TargetID(), 0 )
	WriteRoleValue(OwnerID(),EM_RoleValue_PID,1)

end

----------------------------------
function LuaI_422742_Check()----�ܨ��צ̦h��

	if CheckBuff( OwnerID() , 504706 ) == true then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422704_01]" , 0 ) --���ˤ��O�Ȥ��C�p�ߡI�O���S���C
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422704_01]" , 0 ) 
		return false
	end

	if ReadRoleValue( OwnerID() , EM_RoleValue_IsAttackMode ) ~= 0 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_205426_1]" , 0 ) --�԰���
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_205426_1]" , 0 ) 
		return false
	end

	if	Lua_ObjAreaCheck(OwnerID() , 715 ) ==false then-----715
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_422704_02]", 0 ) --�A�u��b[ZONE_DIMARKA]�ϥΡI
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422704_02]", 0 )
		return false
	end

	return true
end

function LuaM_422742_0() --�ܨ����O�Ȫ������a�I

	if	Lua_ObjAreaCheck(OwnerID() , 715) ==false then--------�ˬd���w�Y�Ӱϰ�---715
		CancelBuff( OwnerID() , 504706 )
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_422704_02]", 0 ) --�A�u��b[ZONE_DIMARKA]�ϥΡI
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422704_02]", 0 )
	end
end
