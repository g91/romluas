	
--======================================================================================================
--423245	�M�������
--======================================================================================================
function LuaS_423245_0()
	LoadQuestOption(OwnerID())
	--������襴�ڧ��ѡA���ڤ����Ӷ]��Ƿϴ˪L�̥h�A�n�h��I
	if CheckAcceptQuest(OwnerID(),423245)==true 	and
		Checkflag(OwnerID(),543943)==false			then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423245_0]","LuaS_423245_1",0)
		--�u������A�n�@�ӤH�h���̡H�v
	end
end
		
function LuaS_423245_1()
	SetSpeakDetail(OwnerID(),"[SC_423245_1]")
	--�H��������b�˪L�ܡH�ڭn����g�D�N���S�@�ˡA�M�H���ǲߤ}�N�A
	--�����n�F�`�����b��A�����������̱R���o�F�A�i�O�����������̪�߱����n�A
	--�j�a���H���ڦ~���p�A���򳣤����D�A���L���ڪ��D��I
	--�������g�D�N���S���l�]�A�N�O�L�h�����H�A�������ڭ̧��a�H���a�H�A
	--ı�o�����L�A�ڴN�Q�A�p�G�ڬO���b��A�N���������F...... 
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423245_2]","LuaS_423245_2",0)
	--�u�A�ٰO�o�A�O���Q�H��쪺�ܡH�v
end

function LuaS_423245_2()
	SetSpeakDetail(OwnerID(),"[SC_423245_3]")
	--���ɭ԰ڡA�ڸ��b�@�ʤj��M�j���Y�᭱�A�ݨ�@�s��ۤ@�˦�A���H�A�M�����ǩǪ��~�H���[�A
	--����~�H����N�����Q�쨫......�M��ڪ����e�N�¶ª��A�n���εۤF�A���Ӫ��ɭԡA�w�g�M�̶��^����l�̤F�C
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423245_4]","LuaS_423245_3",0)
	--�u�o�{�ۤv�b���ͤH������ӡA�A�Ȥ��ȡH�v
end

function LuaS_423245_3()
	SetSpeakDetail(OwnerID(),"[SC_423245_5]")
	--�ڤ��Ȧ̶��M�ä��j�j�A�]���L�̬O�n�H�A�̶����A�p�G���Ǥh�L�o�{�ڡA
	--�|�s�ڳ��@�_����......���ӡA���l�̤������H�]�O�L�̮����ܡH
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423245_6]","LuaS_423245_4",0)
	--�u�ڤ����D�A���L�A�ڷ|�V�O��쵪�ת��C�v
end

function LuaS_423245_4()
	SetSpeakDetail(OwnerID(),"[SC_423245_7]")
	--���M�ڥ��ĤġA���n�F��I
	SetFlag(OwnerID(),543943,1)	--�o����ȧ����X��
end




--======================================================================================================
--423246	���a��J�A���H���h�L���X����
--======================================================================================================
function LuaS_423246_0()	--�سz������115265�A���d��@��
	Setplot(OwnerID(),"range","LuaS_423246_1",50)	--�]�wĲ�o�d��G�b�i�J��npc50���A����Lua
end	

function LuaS_423246_1()	--OWNER�O���a
	Setplot(OwnerID(),"range","",0)

	if CheckAcceptQuest(OwnerID(),423246)== true 	and
		ReadRoleValue(OwnerID(),EM_RoleValue_IsAttackMode)==0	and
		CountBodyItem( OwnerID(), 207307)<1			then
		Beginplot(TargetID(),"LuaS_423246_2",0)
	end
	Setplot(OwnerID(),"range","LuaS_423246_1",100)
end

function LuaS_423246_2()	--OwnerID�O115265

	Setplot(OwnerID(),"range","",0)

	Local player="here"
	local R=RandRange(1,5)
	local So = LuaFunc_CreateObjByObj( 103558 , OwnerID() )	--�سz������B�����ͥX���H����
	--		DisableQuest( So , true )					--�������
	Yell(So,"[SC_423246_"..R.."]",1)
	SetAttack(So , TargetID())
	
	while 1 do

		if 	GetDistance( TargetID(), OwnerID()) >300   or
			ReadRoleValue(TargetID() , EM_RoleValue_IsDead)==1 	or
			CheckID(TargetID()) == false	then
			player="Nothere"
			break	
		end
		if 	CheckID(So) == false	then
			break
		end
		Sleep(10)
	end
	
	if player=="Nothere" then
		Sleep(50)
		delobj(So)
	end
	Setplot(OwnerID(),"range","LuaS_423246_1",50)
end




--======================================================================================================
--423247	�M�k�e�a�����d���
--======================================================================================================
function LuaS_423247_0()	
	LoadQuestOption(OwnerID())
	--���R���e�@������ݵe���H�߱��r�֡A�A�P�N�ڪ��ܶܡH
	if CheckAcceptQuest(OwnerID(),423247)==true 	and
		Checkflag(OwnerID(),543944)==false			then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423247_0]","LuaS_423247_1",0)
		--�u�ڦP�N�C�аݧA�O�����d�D���ܡH�Ьݳo�ӫ����C�v
	end
end
		
function LuaS_423247_1()
	if  CountBodyItem(OwnerID(),207307)==1			and
		CountBodyItem(OwnerID(),206403)==1			then
		SetSpeakDetail(OwnerID(),"[SC_423247_1]")
		--�ɨd���B�K�����B������A�o�ӫ����O�g�F�����᪺�ڭ��H
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423247_2]","LuaS_423247_2",0)	--�u�O�ɨd���a�C�v
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423247_3]","LuaS_423247_3",0)	--�u�O�K�����a�C�v
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423247_4]","LuaS_423247_4",0)	--�u�O������a�C�v
	else
		Beginplot(OwnerID(),"LuaS_423247_7",0)
	end
	
end	
	
function LuaS_423247_2()
	SetSpeakDetail(OwnerID(),"[SC_423247_5]")
	--���쪺���סA�d���O�ᤤ���̡A�����ڭ��u�|��¶�b���a�Ϊ��v�����W�C
	--�A�A�Q�Q�A�֬O�������D�H�A�Q�M������A�L�ӧ�ڡC
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423247_6]","LuaS_423247_5",0)
	--(�Q�Q�A�L��)
end
	
function LuaS_423247_3()
	SetSpeakDetail(OwnerID(),"[SC_423247_7]")
	--��������_�ӡA�A��F�讳���ڡA���ڧ⥦�B�z�n�|�����e����������D�H�A�A�i�H���F�C
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423247_8]","LuaS_423247_6",0)
	--(�N�����浹�����d�D���)
end
	
function LuaS_423247_4()
	SetSpeakDetail(OwnerID(),"[SC_423247_9]")
	--�_�S����ܡA����ͩ�����A�֮z��U�A�����ڭ��u���ۤv���o�C
	--�A�A�Q�Q�A�֬O�������D�H�A�Q�M������A�L�ӧ�ڡC
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423247_6]","LuaS_423247_5",0)
	--(�Q�Q�A�L��)
end
	
function LuaS_423247_5()
	CloseSpeak(OwnerID())	--������ܭ���
end

function LuaS_423247_6()
	CloseSpeak(OwnerID())
	SetFlag(OwnerID(),543944,1)	--�o����ȧ����X��
	DelBodyItem(OwnerID(),207307,1)		--�R���I�]�����K�H

end

function LuaS_423247_7()
	CloseSpeak(OwnerID())
	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_110497_5]" , 0 )
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_110497_5]" , 0 )
	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_QUESTSTRING_09]" , 0 )
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_QUESTSTRING_09]" , 0 )
end
	




--======================================================================================================
--423249	�����㰩
--======================================================================================================
function LuaI_423249_207308_Check()		--���b���~�ϥΤU��<�ˬdlua>���U�C
	local OrgID = 0
	if CheckAcceptQuest( OwnerID() , 423249 ) == false or CountBodyItem( OwnerID() , 207309 ) >= 10 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_206446_0]" , 0 ) --�A���ݭn�ϥΦ����~
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_206446_0]" , 0 )
		return false
	end

	if CheckID( TargetID() ) == true then
		OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	end
	
	if OrgID == 0 or ( OrgID ~= 103595 ) or CheckBuff( TargetID() , 504004 ) == true then
		if OrgID == 103595 then
			if ReadRoleValue( TargetID() , EM_RoleValue_IsDead ) == 1 then
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_423249_0]" , 0 ) --���`���㰩�L�k��i
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_423249_0]" , 0 )
				return false
			else
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_423249_1]" , 0 ) --����[207308]�i��L�k�x��[103595]
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_423249_1]" , 0 )
				return false
			end
		end
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_423249_2]" , 0 ) --�����~������[103595]�ϥ�
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_423249_2]" , 0 )
		return false
	end
	if 	ReadRoleValue( TargetID() , EM_RoleValue_IsDead ) == 1 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_423249_0]" , 0 ) --���`���㰩�L�k��i
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_423249_0]" , 0 )
		return false
	end
	if ReadRoleValue( TargetID() , EM_RoleValue_HP ) > 0.5*ReadRoleValue( TargetID() , EM_RoleValue_MaxHP ) then
--		local Str = "[SC_206446_5][$SETVAR1="..GetName(TargetID()).."]"
		ScriptMessage( OwnerID() , OwnerID() , 1 ,"[SC_423249_3]" , 0 ) --�A�չϨ�A[103595]�A���e���O�ö}�F�C
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_423249_3]" , 0 )
		if HateListCount( TargetID() ) == 0  then
			SetAttack( TargetID() , OwnerID() )
		end
		return false
	end
	return true
end

function LuaI_207308_Use()	--���b<�ϥήĪG����:server�ݼ@��>�U���ϥήĪG�U
	if GiveBodyItem( OwnerID() , 207309 , 1 ) then
		AddBuff( TargetID() , 504004 , 0 , 3 )
		UseItemDestroy( OwnerID() )
	end
	ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_423249_4]" , 0 ) --�A���\������@��[103595]�I
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_423249_4]" , 0 )
	CallPlot(TargetID(),"LuaFunc_ResetObj",TargetID())
end

--�������ȫ�
function LuaS_423249_USECHECK()	--���b���ȧ���
	if	 CountBodyItem( TargetID(), 207308)>0	 then 
		 DelBodyItem( TargetID(), 207308, 1 )
	end
	
end



--======================================================================================================
--423251	���U���ȫ�@��		�֦~�Ǹ�
--======================================================================================================

function LuaS_423251_ACT0()	
	AddBuff( TargetID()  , 503977 , 1 , 300 ) 				--����a
	local boy = Lua_DW_CreateObj("flag" ,115095,780628,1)
	DisableQuest( boy , true )					--�������
	DW_MoveToFlag(boy,780628,2,0,1)
	
	AdjustFaceDir( boy, TargetID(),3 )
	Sleep(30)
	Say(boy,"[SC_423251_ACT0]")
	--�N�O�A�A���g�b�Ƿϴ˪L�̩M�_�Ǫ��H���a�H���H�b���~��ť�A���ơA���Q��A��@��C
	Sleep(40)
	AdjustFaceDir( OwnerID(), TargetID(),3 )
	Say(OwnerID(),"[SC_423251_ACT1]")
	--��......�A�h�ݬݧa�A�����w�|�o�줰��s���u���C
	Sleep(30)
	Say(boy,"[SC_423251_ACT2]")
	--�ڸܤv�g�a��A�h���h�H�K�A�C
	Sleep(30)
	DW_MoveToFlag(boy,780628,3,0,1)
	SetFlag(TargetID(),544010,1)	--�o��X��(�}�ҤU�ӥ��ȡ^
	CancelBuff( TargetID()  , 503977  ) 		--�٪��a�ۥ�


	Delobj(boy)
end


	

--======================================================================================================
--423251	�M�]���b�d�����~���
--======================================================================================================
function LuaS_423251_0()	
	LoadQuestOption(OwnerID())
	if 	CheckAcceptQuest(OwnerID(),423251)==true	and
		Checkflag(OwnerID(),543931)==false			then
		
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423251_0]","LuaS_423251_1",0)
			--�u�аݡA�A��ڦ��ƶܡH�v
		
	end
end

function LuaS_423251_1()
	SetSpeakDetail(OwnerID(),"[SC_423251_1]")
	--ť���A���g��Ƿϴ˪L�A�J��@�Ǥh�L�A�����L�̪��ˤl�C
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423251_2]","LuaS_423251_2",0)
	--�u�L�̪�����ҫܴM�`�A�N�s�Z���]�ܴ��q�C�v
end

function LuaS_423251_2()
	SetSpeakDetail(OwnerID(),"[SC_423251_3]")
	--�A���L�L�̪��Z���A�i�H�ήe�@�U�ܡH

	AddSpeakOption(OwnerID(),TargetID(),"[SC_423251_4]","LuaS_423251_3",0)
	--�u�o�̦��@�`�L�̿򸨪��K�C�C�v

end

function LuaS_423251_3()
	if 	CountBodyItem(OwnerID(),207306)==1			then
		SetSpeakDetail(OwnerID(),"[SC_423251_5]")
		--��A�o���T�O�@��ܥ��Z���K�C�A���L�A�X�{�b�o���ϰ�N�����`�F�C�o�̯ʥF�K���A�����K�C�����֨��A���|�N�K�C��󪺤֤��S�֡A���D�L�Ӧۤ@�Ӥ��ʥF�o�ظ˳ƪ��a��A�@�몺�p�L����S���o�ر���A�u�i��O......(�]���N��b�C�`�W�g�����U�t����񪺥����Ѷ}�A�ݦV��P)�G�M�A�O�N��˯Ǧh�֪����O�C
		--��P�A�ڭ̻ݭn�M�A���B�ͽͽ͡C	(�����ȺX�СA�HĲ�o�U�ӥ���)
		DelBodyItem(OwnerID(),207306,1)		--�R���I�]�����K�C
		SetFlag(OwnerID(),543931,1)	--�o��X��(�}�ҤU�ӥ��ȡ^
	else
		Beginplot(OwnerID(),"LuaS_423251_4",0)
	end
end

function LuaS_423251_4()
	CloseSpeak(OwnerID())
	ScriptMessage(OwnerID(), TargetID() , 0 , "[SC_110497_5]" , 0 )
	ScriptMessage(OwnerID(), TargetID() , 1 , "[SC_110497_5]" , 0 )

end

--======================================================================================================
--423252	���ȱ�����@��		�����A��P�B�]���i���O�˯Ǧh�֮��H��
--======================================================================================================



function LuaS_423252_ACT0()
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register4 , TargetID() )
	AddBuff( TargetID()  , 506805 , 1 , 300 ) 	--�w���a
	Beginplot(OwnerID(),"LuaS_423252_AK_CHECK",0)
	DisableQuest( OwnerID() , true )	

	local Star = Lua_DW_CreateObj("flag" ,115085,780629,1)
	local Cral = Lua_DW_CreateObj("flag" ,115084,780629,2)
	local Ton = LuaFunc_CreateObjByObj( 115119 , OwnerID() )


	DisableQuest( Star , true )					--�������
	DisableQuest(Cral  , true )					--�������
	DisableQuest( Ton , true )					--�������
	AdjustFaceDir(  OwnerID() , Star ,3 )
--		AddBuff( TargetID()  , 506805 , 1 , 300 ) 	--�w���a
--	Hide(OwnerID())
	Beginplot(Star,"LuaS_423252_ACT1",0)
	Beginplot(Cral,"LuaS_423252_ACT2",0)
	Sleep(60)
--	AdjustFaceDir( Star , OwnerID() ,3 )
--	AdjustFaceDir( Cral , OwnerID() ,3 )
	PlayMotion(Star,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Say(Star,"[SC_423252_ACT0]")						--�����A�ڬݨ����㪺���K�b�A�������U�N�A���աH���w��ڶܡH
	Sleep(30)
	AdjustFaceDir(  Ton , Star ,3 )
	
	PlayMotion(Ton,ruFUSION_ACTORSTATE_EMOTE_SPEAK)		--���ܪ�pose
	Say(Ton,"[SC_423252_ACT1]")							--���A�ڮ𪺤��O�A�A�O���ǥ��N���H���V�b�I
	Sleep(30)
	
	PlayMotion(Cral,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Say(Cral,"[SC_423252_ACT2]")						--�ݨ�[$playername]�w�g�i�D�A�F�A���L�N��ڤ����A�A�̿𦭤]���V���X�ӡC 
	Sleep(40)
	
	PlayMotion(Cral,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Say(Cral,"[SC_423252_ACT3]")						--�A�̾ߨ쪺�R�O�H�����ԵX���p�W�A�o�O�˨��h�ֲ{�������F�x�C
	Sleep(30)
	
	PlayMotion(Ton,ruFUSION_ACTORSTATE_USE	)	--����
	Say(Ton,"[SC_423252_ACT4]")							--�ണ�����D��n�A�{�b�u�n���x�N�˨��h�ֳ��񥭡A�o���g�a�N����즳�����R�C
	Sleep(50)
	
	PlayMotion(Cral,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Say(Cral,"[SC_423252_ACT5]")						--�o�N�O�A�ѨM���D����k�H
	Sleep(20)
	
	PlayMotion(Cral,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Say(Cral,"[SC_423252_ACT6]")						--�A�����F�ѥ˨��h�ֳ����{�p�B�D�ɮ��H��ʪ��O�֡A�H�ή��H���I���]�A�N�n���D�ѪZ�O�A²���N���X�۲����K���_�@�˪��w�w
	Sleep(50)
	
--	ScriptMessage(OwnerID(), TargetID() , 0 , "[SC_423252_ACT7]" , 0 )	--(�������_�]������)
--	ScriptMessage(OwnerID(), TargetID() , 1 , "[SC_423252_ACT7]" , 0 )	--(�������_�]������)
	
	PlayMotion(Ton,ruFUSION_ACTORSTATE_SHIELD_BASH)		--��ݤf 
	Say(Ton,"[SC_423252_ACT8]")							--�˨��h�ֳ��u�O�p�p��D��A���ױo�F�ڹF�ԥ����̺�U������M�h�ΡA�[�W�K����ΤΤd�ЮL�h�����j�x�ܡH
	Sleep(50)
	
	PlayMotion(Cral,ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)			--����
	Say(Cral,"[SC_423252_ACT9]")						--�Ԫ��û��O�̫᪺��q�A�A�j�j���Z���A�����|�O�ѨM���D���̦n��k�C
	Sleep(30)
	
	PlayMotion(Cral,ruFUSION_ACTORSTATE_UNHOLSTER)
	Say(Cral,"[SC_423252_ACT10]")						--�����ҿת��X���A�N�y���L�ת��묹�I
	Sleep(30)
	
	Say(Ton,"[SC_423252_ACT11]")						--�����ҿסH
	Sleep(10)
	
	PlayMotion(Ton,ruFUSION_ACTORSTATE_EMOTE_POINT)	--����
	Say(Ton,"[SC_423252_ACT12]")						--�o�W�O�����L�d�H���A�o�ҫh�����ԵX���R�O�H�٦��A���ҵ��A�٦�����ü{�H�ް��r�F�A��M�o�ιp�^��q
	Sleep(50)
	
	DW_MoveToFlag(Cral,780629,5,0,1)	--�ਭ
	Sleep(20)
	
	PlayMotion(Cral,ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)
	Say(Cral,"[SC_423252_ACT13]")						--��I�u���@���Q�O�@�b���c�������A�~�|�������X�o�ػ���H���ʩR���ܡI
	Sleep(30)
	
	AdjustFaceDir(  Star ,Cral , 3 )
	DW_MoveToFlag(Cral,780629,6,0,1)	--����
	Hide(Cral)
	PlayMotion(Ton,ruFUSION_ACTORSTATE_EMOTE_POINT)
	Say(Ton,"[SC_423252_ACT14]")	--�A...����I
	

		if	CheckAcceptQuest( TargetID(), 423252 )==true	and
			CheckBuff( TargetID() , 506805) == true		then

			SetFlag(TargetID() , 543932 , 1)	--���U�@�ӥ��Ȫ��e�m�X�СA�O�o���Ȫ���P�X�{�A�U�����Ѵ����H��A���a�i�����z�|�A����������
			SetFlag(TargetID() , 544038 , 1)
		end
	
	CancelBuff( TargetID()  , 506805  ) 	--�٪��a�ۥ�
	Hide(Star)

	Sleep(30)	
	Delobj(Cral)
	Delobj(Star)
--	Show(OwnerID(),0)
	
	writerolevalue( OwnerID() , EM_RoleValue_PID , 0 )	--�]���b�P�_�禡��function LuaS_423253_Check�̳]��1�A���ϤU�@�쪱�a�n�~���ȡA�O�o�]�^��0
	Delobj(Ton)
	DisableQuest( OwnerID() , false )	
end

function LuaS_423252_ACT1()
	DW_MoveToFlag(OwnerID(),780629,3,0,1)
end

function LuaS_423252_ACT2()
	DW_MoveToFlag(OwnerID(),780629,4,0,1)
end

function LuaS_423252_AK_CHECK()
local Player = ReadRoleValue(OwnerID(),EM_RoleValue_Register4 )	
	for i = 0 , 100 , 1 do
		if	CheckAcceptQuest( Player, 423252 )==false		and	
			CheckBuff( Player , 506805) == true		then
			break
		end
		if	CheckBuff( Player , 506805) == false		then
			break
		end
		sleep( 20 )
	end
	CancelBuff( Player  , 506805  )	
end

--======================================================================================================
--423253
--======================================================================================================
function LuaS_423253_0()
	LoadQuestOption(OwnerID()) 	--�S���H�i�H�ݻ��ڡI
	if CheckAcceptQuest(OwnerID(),423253)==true 	and
		Checkflag(OwnerID(),543947)==false			then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423253_0]","LuaS_423253_1",0)
		--�u��P���ڰݧA�A�O�_�ٰO�o�\�P�X�����G�ơH�v
	end
		
	if 	CheckAcceptQuest(OwnerID(),423252)==true	and		
		CheckCompleteQuest(OwnerID(),423252)==false	and
		Checkflag(OwnerID(),543932)==false	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423252_TON1]","LuaS_423252_TON1",0)
	end
end

function LuaS_423253_Check()		--�P�_���@���t�X��npc�O�_���L���A�p�G�����h�t�X�@���A���h�e�L�@�y�ܡA�ХL���ݡA���b�s���t�Xscript����q�禡
	if	ReadRoleValue( TargetID() ,EM_RoleValue_PID ) == 0	then
		writerolevalue( TargetID() , EM_RoleValue_PID , 1 )
		BeginPlot( TargetID() , "LuaS_423252_ACT0" , 0 )
		CloseSpeak( OwnerID() )
	else
		SetSpeakDetail(OwnerID(),"[GATHER_MSG_OBJBUSY]")			--�ؼХ��b���L���C
	end
end



function LuaS_423252_TON1()
	SetSpeakDetail(OwnerID(),"[SC_423252_TON2]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423252_TON3]","LuaS_423253_Check",0)
end




function LuaS_423253_1()
	SetSpeakDetail(OwnerID(),"[SC_423253_1]")
	--����M�ݰ_�o�ӡH�ٰO�o�j���A�N�O�˪L���D�\�J���@���G�z���S��X���A�n�����O�A]
	--�\�~�M�a�e�^�a�{�@��l�A�M��...�ڷQ�Q ...�\���F���@�˪L�̤l�������w�A��B�h�D�ԩ��~�A
	--�X���b�\�M�˪L��L�p�ʪ������U�U�A�L�۩��֪���l�C
	--���즳�@�ѡA�\��M�ƤF�A�e�y�U���Q����e���l���i�}�A�٤U�O�n�_�F�X���A�M��@���U�l�Ѧڸ��X�ӡA
	--�_����X�������e���A�X���b�d�ˡB�x�b�U���}�˪L�A��_�@��A�Q��X�\���ܪ���]�A
	--�e�}�l�n�W�ۤv���O�q�A�Ƿ|�b�̶ª��]�̼��A�����@�������U�Q����......
	--(�d�Ժ�����o�̡A�Y���ҫ䪺�h�F��P�@��)
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423253_2]","LuaS_423253_2",0)
	--�u�o�O�������G�ơH�v
end

function LuaS_423253_2()
	SetSpeakDetail(OwnerID(),"[SC_423253_3]")
	--���A�٨S����̫�C
	--�b�u���L�����]�汵�ܤ骺�ɨ�A�@���P�P���ޤF���A�a�e���y���_����ߪ��H�A�]���e�n�䪺���סA
	--�u���b�P�o�ӤH�P�椧��A�~�|�Q���}......��P�A�o�O�]�����G�Ƨa�H
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423253_4]","LuaS_423253_3",0)
	--�u�O�o�˪��ܡH�v
end
	
function LuaS_423253_3()	--������ܭ����A�}�l�@���t�X
	CloseSpeak(OwnerID())
	Beginplot(TargetID(),"LuaS_423253_4",0)
end	
	
function LuaS_423253_4()
	DisableQuest( OwnerID() , true )		
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register4 , TargetID() )
	AddBuff( TargetID()  , 506806 , 1 , 300 ) 	--�w���a
	Beginplot(OwnerID(),"LuaS_423253_AK_CHECK",0)
	local Star = Lua_DW_CreateObj("flag" ,115267,780629,3)
	local Ton = LuaFunc_CreateObjByObj( 115439 , OwnerID() )
		DisableQuest( Ton , true )					--�������
			DisableQuest(Star , true )				--�������
--	Setflag(TargetID(),544039,1)					--���ݤ���115130�������X��		
--	Hide(OwnerID())
--	SetFlag(TargetID(),543946,1)		--���X�СA����Ӫ���Pclient�_�@�ΡA���X�Цb�U�ӥ��ȷ|�^���A�ҥH�]�X�Эn��������
	
	Sleep(30)
	WriteRoleValue(Star, EM_RoleValue_IsWalk, 1)
	Hide(Star)
	Show(Star,0)		--hide�Ashow�i��WriteRoleValue���\	
	
	PlayMotion(Star,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Say(Star,"[SC_423253_5]")
	--�����A�N���G�Ƥ��һ����A�X���������Ѯ����]���աC
	Sleep(30)
	
	PlayMotion(Ton,ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)
	Say(Ton,"[SC_423253_6]")
	--�Ǥ��o�L�����o��j�A��P�A�p�G�O�H�e���ڡA�j���|�]�����X�L�����Y�A���O�{�b......�ڻݭn�Q�@�Q�C	
	Sleep(40)
	
	PlayMotion(Star,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Say(Star,"[SC_423253_7]")
	--���F�B�͡A�N�⤰��]�����A���̮ɥ��q���_���y�u�A�]�ëD�O�@�L��ì���ڡA�����C
	Sleep(40)
	
	AdjustFaceDir(  Ton ,TargetID() , 3 )
	Sleep(50)
	AdjustFaceDir(  Ton ,Star , 3 )
	Say(Ton,"[SC_423253_8]")
	--PlayMotion(Ton,ruFUSION_ACTORSTATE_SLUMBER_END)
	
	PlayMotion(Ton,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	--�n�a�A�ڸյ۷Q�Q�A���S���X���H�~���覡�i�H�ѨM�˨��h�ֳ������D�C
	Sleep(40)
	
	PlayMotion(Ton,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Say(Ton,"[SC_423253_9]")
	--���L�A���M�ڦP���]���A���O���������Q���O�ƹ�A�p�G���ζ}�l���V�A�ڤ��|�a�ۤj�x�e�h�˨��h�ֳ��C
	Sleep(50)
	
	PlayMotion(Star,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Say(Star,"[SC_423253_10]")
	--���A���@�ѬO�_��ӡA�{�b�٨S������x���O�C
	Sleep(40)
	
	PlayMotion(Star,ruFUSION_ACTORSTATE_EMOTE_KISS)	
	Say(Star,"[SC_423253_11]")
	--�{�b���ڭ̥��Ȯɤ��O�a�A�ڪ��B�͡A�۫H�ڡA�o���|�Ӥ[���C

	Sleep(40)
	DW_MoveToFlag(Star,780629,6,0,1)
	Delobj(Star)
--	Show(OwnerID(),0)


if	CheckAcceptQuest( TargetID(), 423253 )==true	and
	CheckBuff( TargetID() , 506806) == true		then
		SetFlag(TargetID(),543947,1)
end

--	Setflag(TargetID(),544039,0)
	Delobj(Ton)
	CancelBuff( TargetID()  , 506806  ) 	--�٪��a�ۥ�
	DisableQuest( OwnerID() , false )	
	
end

function LuaS_423253_AK_CHECK()
local Player = ReadRoleValue(OwnerID(),EM_RoleValue_Register4 )	
	for i = 0 , 100 , 1 do
		if	CheckAcceptQuest( Player, 423253 )==false		and	
			CheckBuff( Player , 506806) == true		then
			break
		end
		if	CheckBuff( Player , 506806) == false		then
			break
		end
		sleep( 20 )
	end
	CancelBuff( Player  , 506806  )	
end	
	
	