

--======================================================================================================
--423255	�M���R½�g���p��l���
--======================================================================================================
function LuaS_423255_0()
	
	LoadQuestOption(OwnerID()) 	
	--�Y�d�h���N�n�F�A�ؤ���СH
	if 	CheckAcceptQuest(OwnerID(),423255)==true 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423255_0]","LuaS_423255_1",0)
		--�u�K�A��M�n�ءA����d�h���Y���N�Ӥ��ΤF�C�v
	end
end

function LuaS_423255_1()
	SetSpeakDetail(OwnerID(),"[SC_423255_1]")
	--�J�M�O�A�����A�@�w���D�z�A�ڦ^�h�إФF�C
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423255_1_1]","LuaS_423255_2",0)
	--�u���Ѭݨ��A�^�h�|�ܪY�����C�v
end

function LuaS_423255_2()
	CloseSpeak(OwnerID())
	SetFlag(OwnerID(),543948,1)	--�o��X�СAĲ�o������client
end

function LuaS_423255_3()
	LoadQuestOption(OwnerID()) 	
	--�N��ڭ̦A�V�O�A��L�����٬O�������ڭ̡A�����n����֪��h�إжܡH�@�I�N�q���S���C
	if 	CheckAcceptQuest(OwnerID(),423255)==true 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423255_2]","LuaS_423255_4",0)
		--�u���ԯѧ@���@�w�|���n�����A���A�����L�]���ө�󼽺ت��A�ҶܡH�v
	end
end

function LuaS_423255_4()
	SetSpeakDetail(OwnerID(),"[SC_423255_3]")
	--�O���ѽЧA�Ӫ��a�H���§A�A�����ڤ����ӧѤF��J�A���ڭ̰��o�ǨƨèS���s�ۤ���ت��A
	--�u�O��ª��X��P�¡A�]�����@�ӥi�H�w�y���a��C�����A�ڸӦ^�h½�g�F�C
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423255_4]","LuaS_423255_5",0)
	--�u�h�a�C�v
end

function LuaS_423255_5()
	CloseSpeak(OwnerID())
	SetFlag(OwnerID(),543981,1)	--�o��X��
end

function LuaS_423255_6()
	LoadQuestOption(OwnerID()) 	
	--½�g�o�Ӥu�@�u�O�֦��H�F�A�{�b���������n�ڥ��Ӥp�O��......
	if 	CheckAcceptQuest(OwnerID(),423255)==true 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423255_5]","LuaS_423255_7",0)
		--�u�~�M½�X�U�g�N�۲֡A�A�O���Y�l�٬O�~���H�H�v
	end
end

function LuaS_423255_7()
	SetSpeakDetail(OwnerID(),"[SC_423255_6]")
	--�O�֦b���̡H�ڡA�O�A......�O�H���A���ڭ̰��F�I�ơA�N�i�H�b�o�̹�ګ���e�}���A�A���A�A�٨S�����ǥ��Y���Uť�A���O�A��I
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423255_7]","LuaS_423255_8",0)
	--�u�O�ڡA�{�b�ڲ��e�]���@�����Y���U��ť�ڪ��O�C�v
end

function LuaS_423255_8()
	SetSpeakDetail(OwnerID(),"[SC_423255_8]")
	--�A���ڬO����H�ڡB��......��ڡA���o�Ǹܤ@�V�O���ǥ��Y���U�̷|�����A�ڬO���F�H�u�I�٬O�^�h½�g�a�I
	SetFlag(OwnerID(),543982,1)	--�o��X�СAĲ�o������client
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423255_9]","LuaS_423255_9",0)
	--�u�Q�Q��ì�ɪ��߮��C�v
end

function LuaS_423255_9()
	CloseSpeak(OwnerID())
	SetFlag(OwnerID(),543982,1)	--�o��X��
end



--======================================================================================================
--423256	�����ȫ�script�A�����ᵹ�X�СA���h�o���ȴ����Υ�Z�g�A�G�u�ꤣ��hide ownerid
--======================================================================================================
function LuaS_423256_0()
	DisableQuest( OwnerID() , true )
	AddBuff( TargetID()  , 504004  , 1 , 300 ) 
	local Ton = LuaFunc_CreateObjByObj( 115078 , OwnerID() )
	local Rose = Lua_DW_CreateObj("flag" ,115081,780630,1)
		DisableQuest(Ton , true )					--�������
			DisableQuest(Rose , true )					--�������
	Hide(Rose)
	Sleep(10)
	Hide(Ton)
	Show(Ton,0)
	WriteRoleValue (Ton, EM_RoleValue_IsWalk, 0)
	WriteRoleValue (Rose, EM_RoleValue_IsWalk, 0)
	Sleep(10)
	Beginplot(Ton,"LuaS_423256_1",0)	
	Sleep(20)
	Show(Rose,0)

--	Beginplot(Rose,"LuaS_423256_2",0)
	Say(Rose,"[SC_423256_ACT0]")						--�����ַݡA�е����ڡI
	DW_MoveToFlag(Rose,780630,3,0,1)
--	Sleep(50)
	AdjustFaceDir(  Rose,TargetID() , 3 )
	Say(Rose,"[SC_423256_ACT2]")						--[$playername]�A�ڻP�����ַݥ���A�A�@�|��o���稦�a�J�f��ڭ̡C
	Sleep(30)
	DW_MoveToFlag(Rose,780630,2,0,1)
	CancelBuff( TargetID()  , 504004  ) 	--�٪��a�ۥ�
	Delobj(Ton)
	Delobj(Rose)
	DisableQuest( OwnerID() , false )
end


function LuaS_423256_1()
	DW_MoveToFlag(OwnerID(),780630,2,0,1)
	Hide(OwnerID())
end

function LuaS_423256_2()
	DW_MoveToFlag(OwnerID(),780630,3,0,1)
end





--======================================================================================================
--423257	���ȫ�script	OwnerID=��Z�g�A�|��client
--======================================================================================================
function LuaS_423257_ACT0()	
--	Hide(OwnerID())
	DisableQuest( OwnerID() , true )
	AddBuff( TargetID()  , 503977 , 1 , 300 )
	local Rose = LuaFunc_CreateObjByObj(115270 , OwnerID() )
	SetFlag(TargetID(),544014,1)	--�������X��
	local Cral = Lua_DW_CreateObj("flag" ,115138,780631,1)
	local Jx = Lua_DW_CreateObj("flag" ,115264,780631,2)
	Local Ton = Lua_DW_CreateObj("flag" ,115273,780631,3) 
	DisableQuest(Rose, true )	
	DisableQuest(Cral , true )	
	DisableQuest(Jx , true )	
	DisableQuest(Ton, true )	

--	Sleep(10)
	Hide(Rose)
	Hide(Cral)
	Hide(Ton)
	Show(Rose,0)
	WriteRoleValue (Rose, EM_RoleValue_IsWalk, 1)
	WriteRoleValue (Cral, EM_RoleValue_IsWalk, 1)
	WriteRoleValue (Ton, EM_RoleValue_IsWalk, 1)
	Sleep(20)	
	Show(Ton,0)
	Show(Cral,0)
	Beginplot(Cral,"LuaS_423257_ACT2",0)
--	Sleep(30)
	
	Sleep(20)
	Say(Cral,"[SC_423257_ACT1]")					--�����§ڡA�ثe�̥��n�����O�A�T�{���j�o����O�_�u���s�b�A��~��P�M�ڦb����¶�F�@�U�A�S�ݨ줰�򹳬O���~���ͪ��A���L......
	Beginplot(Ton,"LuaS_423257_ACT1",0)
	Sleep(40)
	
	PlayMotion(Cral,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Say(Cral,"[SC_423257_ACT2]")					--�٦��A�A�̪`�N��F�ܡH�o�̦a�Ωǩ_�A�����֫����K���}�ޡA�ӥB�o�ǫo����i�h����٦������M�����ǡC
	Sleep(30)
	
	PlayMotion(Rose,ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	Say(Rose,"[SC_423257_ACT3]")				--�O�ڡA���O��`�ۤ���H�����O�b��ʡC
	Sleep(20)
	
	Local Derek = Lua_DW_CreateObj("flag" ,115083,780631,6)
	DisableQuest(Derek, true )
	DW_MoveToFlag(Derek,780631,7,0,1)
	AdjustFaceDir( Derek, Ton ,3 )
	
	PlayMotion(Derek,ruFUSION_ACTORSTATE_EMOTE_APPLAUSE)	--���
	Say(Derek,"[SC_423257_ACT4]")					--�ݬݧڧ��F��......
	Sleep(40)
	AdjustFaceDir( Ton, Derek ,3 )
	AdjustFaceDir( Cral , Derek ,3 )
	AdjustFaceDir( Rose , Derek ,3 )
	AdjustFaceDir( Jx , Derek ,3 )
	
	PlayMotionEX(Derek,ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_LOOP)
	Say(Derek,"[SC_423257_ACT5]")					--�ڴL�Q���H�����U�A�б����ܼ}�����ꪺ�w�U�J�D����V�z�P�W�̸ۼ����q�N�C
	Sleep(40)
	PlayMotion(Derek,ruFUSION_ACTORSTATE_CROUCH_END)
	Sleep(20)

	PlayMotion(Rose,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Say(Rose,"[SC_423257_ACT6]")					--������D��|ĳ�A�å�����Q�ꬣ�����Ϫ̡C
	Sleep(30)
	
	PlayMotion(Derek,ruFUSION_ACTORSTATE_BUFF_SP01)
	Say(Derek,"[SC_423257_ACT7]")					--�K�����ڦb�ܼ}����v���h�������դO�A�A�̲��e���A�O�@�W�Q�ܥh�N�x���ΡB�߱�̥S�A�@�L�Ҧ������H�C
	Sleep(50)
	
	PlayMotion(Ton,ruFUSION_ACTORSTATE_EMOTE_POINT)
	Say(Ton,"[SC_423257_ACT8]")						--�A���|�b�o�̡H
	Sleep(30)
	
	PlayMotion(Derek,ruFUSION_ACTORSTATE_EMOTE_SPEAK)	--����
	Say(Derek,"[SC_423257_ACT9]")					--���U�A�z�ݤF�@�Ӧn���D�C�d�~�e�A�����d�U�J�D����b�V�H���d�ĩi����k�����ɡA�O�_�]���^����~���d�ĩi���U�P�˪����D�O�H�o�Ӥ��|���H���D�F�C
	Sleep(60)
	
	PlayMotion(Derek,ruFUSION_ACTORSTATE_EMOTE_CRY)
	Say(Derek,"[SC_423257_ACT10]")					--���L�A�d�~�᪺�{�b�A�H���d�ĩi����߫o�N�_���b�ڪ���W�A�O���O�ܿب�O�H					--�_���I
	Sleep(40)
	
	local Chip = Lua_DW_CreateObj("flag" ,115277,780631,8)
	DisableQuest(Chip, true )
	--AddBuff(TargetID(),506116,1,300)			--���
	CastSpell(Derek,TargetID(),491276)
	Sleep(30)
	Delobj(Derek)
	Delobj(Ton)
	Sleep(20)
	Hide(Rose)
	Show(Rose,0)
	Hide(Cral)
	Show(Cral,0)
	WriteRoleValue (Rose, EM_RoleValue_IsWalk, 0)
	WriteRoleValue (Cral, EM_RoleValue_IsWalk, 0)
	Sleep(10)
	
	local Derek = Lua_DW_CreateObj("flag" ,115083,780631,9)
	local Ton = Lua_DW_CreateObj("flag" ,115273,780631,10)
	DisableQuest( Derek, true )
	DisableQuest(Ton, true )
	PlayMotion(Ton,ruFUSION_ACTORSTATE_DYING)	--���������U�ʧ@
	Sleep(30)
	
	PlayMotion(Rose,ruFUSION_ACTORSTATE_CAST_SP01)
	Say(Rose,"[SC_423257_ACT11]")				--�O�@���U�I
	Sleep(20)
	
	--AddBuff(TargetID(),506116,1,300)			--���
	CastSpell(Derek,TargetID(),491276)
	Sleep(30)
	Delobj(Derek)
	Delobj(Ton)
	Delobj(Chip)
	
	PlayMotion(Cral,ruFUSION_ACTORSTATE_BUFF_SP01)
--	Say(Cral,"[SC_423257_ACT12]")				--�O���j�o����I
--	Sleep(20)

	Beginplot(Cral,"LuaS_423257_ACT3",0)
	Sleep(10)
	DW_MoveToFlag(Jx,780631,11,0,1)
	Hide(Jx)

	CancelBuff( TargetID()  , 503977  ) 	--�٪��a�ۥ�
	Setflag(TargetID(),544014,0)
	Delobj(Rose)
	Delobj(Cral)
	
	Setflag(TargetID(),543934,1)
	DisableQuest( OwnerID() , false )
end	
	
function LuaS_423257_ACT1()
	DW_MoveToFlag(OwnerID(),780631,4,0,1)
end

function LuaS_423257_ACT2()
	DW_MoveToFlag(OwnerID(),780631,5,0,1)
end

function LuaS_423257_ACT3()
	DW_MoveToFlag(OwnerID(),780631,11,0,1)
	Hide(OwnerID())
end


function LuaS_423257_Break()	
	LoadQuestOption(OwnerID()) 
	if 	CheckCompleteQuest(OwnerID(),423257)==true	and
		CheckAcceptQuest(OwnerID(),423258)==false	and
		Checkflag(OwnerID(),543934)==false			then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423257_ACT12]","LuaS_423257_Break1",0)	--�A���[��@��
		
	end
end

function LuaS_423257_Break1()
	CloseSpeak(OwnerID())
	Setflag(OwnerID(),543934,1)
end		
	


	
	
	


--======================================================================================================
--423258	���U����script	OwnerID=��Z�g
--======================================================================================================
function LuaS_423258_ACT0()
	if 	(CheckAcceptQuest(TargetID(),423258)== true ) 		and
	 	(CheckCompleteQuest(TargetID(),423258)==  false)  	and
		(CheckAcceptQuest(TargetID(),423259)== false)		and 
		(CheckFlag(TargetID(), 543935 )==false) 		then
		AddBuff( TargetID()  , 504004 , 1 , 300 )	
		DisableQuest( OwnerID() , true )
		--
		local Rose = LuaFunc_CreateObjByObj(115279 , OwnerID() )
		DisableQuest(Rose, true )
		Sleep(20)
		WriteRoleValue (Rose, EM_RoleValue_IsWalk, 0)
		
		local Dog1  = Lua_DW_CreateObj("flag" ,103557,780633,1)			
		local Dog2  = Lua_DW_CreateObj("flag" ,103557,780633,2)
		local Dog3  = Lua_DW_CreateObj("flag" ,103557,780633,3)
			

		
			Setplot(Dog1,"dead","LuaS_423258_Dead",100)	--���Ǫ����`�ɫ���Y����
			Setplot(Dog2,"dead","LuaS_423258_Dead",100)
			Setplot(Dog3,"dead","LuaS_423258_Dead",100)

		SetDefIdleMotion(Dog1,ruFUSION_MIME_IDLE_COMBAT_1H	)
		SetDefIdleMotion(Dog2,ruFUSION_MIME_IDLE_COMBAT_1H	)
		SetDefIdleMotion(Dog3,ruFUSION_MIME_IDLE_COMBAT_1H	)
		
		SetModeEx(Rose,EM_SetModeType_Strikback,true) 		--����
		SetModeEx(Rose,EM_SetModeType_Fight,true) 			--����
		SetModeEx(Rose,EM_SetModeType_Searchenemy,true) 	--����

		SetAttack(Dog2 , Rose)
		SetAttack(Dog1 , Rose)
		SetAttack(Dog3 , Rose)
		SetAttack(Rose,Dog3)

		local player="here"
		local Monster="NotDead"
		local MonID="true"
	
		while 1 do
			if 	CheckAcceptQuest(TargetID(),423258)== false			then
				break
			end
			
			if	ReadRoleValue(TargetID() , EM_RoleValue_IsDead)==1 	or
				CheckID(TargetID()) == false	then
				player="Nothere"
				break	
			end
			
			if 	(ReadRoleValue(Dog1, EM_RoleValue_IsDead)==1 or  CheckID(Dog1)== false)	and	--�p���סA�]�����������������t�Τ��|�C�J�����P�_�A�X�b�@�_�P�_�A�N���|�ܦ��Ǧ����ܤ[�A�~�����ȺX�Ъ����D
				(ReadRoleValue(Dog2, EM_RoleValue_IsDead)==1 or  CheckID(Dog2)== false) 	and
				(ReadRoleValue(Dog3, EM_RoleValue_IsDead)==1 or  CheckID(Dog3)== false)	then
				Monster="IsDead"
				break
			end
			Sleep(10)
		end
	
		Local X = ReadRoleValue(OwnerID(),EM_RoleValue_X)
		Local Y = ReadRoleValue(OwnerID(),EM_RoleValue_Y)
		Local Z = ReadRoleValue(OwnerID(),EM_RoleValue_Z)
		
		if player=="Nothere" then
			
			ScriptMessage(OwnerID(), TargetID() , 1 , "[SAY_420635_1]" , 0 )		--���ȥ��ѡA�Щ�󭫱�
			ScriptMessage(OwnerID(), TargetID() , 0 , "[SAY_420635_1]" , 0 )		--���ȥ��ѡA�Щ�󭫱�
			Sleep(30)
			ScriptMessage(OwnerID(), TargetID() , 1 , "[SAY_420635_1]" , 0 )		--���ȥ��ѡA�Щ�󭫱�
			ScriptMessage(OwnerID(), TargetID() , 1 , "[SAY_420635_1]" , 0 )		--���ȥ��ѡA�Щ�󭫱�
			SetStopAttack(Rose)
			SetStopAttack(Dog1)
			SetStopAttack(Dog2)
			SetStopAttack(Dog3)

			Delobj(Dog1)
			Delobj(Dog2)
			Delobj(Dog3)
		end
		
		if  (CheckAcceptQuest(TargetID(),423258)== true ) 		and
			(CheckCompleteQuest(TargetID(),423258)==  false)  	and
			(CheckAcceptQuest(TargetID(),423259)== false)		and 
			(CheckFlag(TargetID(), 543935 )==false) 		then
			if	Monster=="IsDead" or MonID=="false" then
				Move(Rose,X,Y,Z)		--Ū115272���y�СA��J
				SetFlag(TargetID() , 543935 , 1)		--���X�СA�������ȡA�����٥��ȥ�Z�g�X�{ 
				Hide(Rose)
				Show(OwnerID(),0)
				Sleep(40)
					SetStopAttack(Rose)
					SetStopAttack(Dog1)
					SetStopAttack(Dog2)
					SetStopAttack(Dog3)
	
				Delobj(Dog1)
				Delobj(Dog2)
				Delobj(Dog3)
			end
		end
		DisableQuest( OwnerID() , false )
		CancelBuff( TargetID()  , 504004  )	
		DelObj(Rose)
		Delobj(Dog1)
		Delobj(Dog2)
		Delobj(Dog3)
	end
end
	

function LuaS_423258_Dead()
	Sleep(20)
	Delobj(OwnerID())
end


--======================================================================================================
--423259 	�N�x�X�D�A�q�q�d�Ժ��O���@��
--======================================================================================================

function LuaS_423259_104()		--For115104
	LoadQuestOption(OwnerID()) 
	--�ڡA�i�����M�h�A���F�A������A�A�|���X�h�j���묹�O�H
	if 	CheckAcceptQuest(OwnerID(),423259)==true 	and
		CheckFlag(OwnerID(), 543929 )==false 		then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423259_0]","LuaS_423259_1",0)
		--�u���U�O�H�A�Ӥ��|�v�g��L......�v
	end
	if 	CheckCompleteQuest(OwnerID(),423258)==true 			then
			
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423259_12]","LuaS_423259_Move2",0)
	--����A�������}�o�̡C
	end
		
end


function LuaS_423259_0()		--For115100
	LoadQuestOption(OwnerID()) 
	--�ڡA�i�����M�h�A���F�A������A�A�|���X�h�j���묹�O�H
	if 	CheckAcceptQuest(OwnerID(),423259)==true 	and
		CheckFlag(OwnerID(), 543929 )==false 		then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423259_0]","LuaS_423259_1",0)
		--�u���U�O�H�A�Ӥ��|�v�g��L......�v
	end
	if 	CheckAcceptQuest(OwnerID(),423259)==true 	and
		CheckFlag(OwnerID(), 543929 )==true		then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423259_5]","LuaS_423259_12",0)
	--�u�n�A�ڿ�C�v
	
	end
		
end

function LuaS_423259_1()
	SetSpeakDetail(OwnerID(),"[SC_423259_1]")
	--�ɹɡA�@�ߡA�A�M���Өů䥼�����H���p�����o�Ƿ|�o�@�I�C
	--�ڭ̨Ӫ��ӹC���a�A�p�G�AĹ�F�A�ڴN��A�����U�ٵ��A�C
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423259_1_1]","LuaS_423259_2",0)
	--�u�A�Q������H�v
end

function LuaS_423259_2()
	SetSpeakDetail(OwnerID(),"[SC_423259_2]")
	--�o�ӹC���A�@�w�ܦ�����A�ӡA�q�q���@�ӬO�u�����{���H���d�Ժ��D�d�ĩi�A�n�n�q�A�q�����N���i�O�ܰ����C
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423259_3]","LuaS_423259_3",0)
	--�u���n��O�H��³J�I�v
end

function LuaS_423259_3()
	SetSpeakDetail(OwnerID(),"[SC_423259_4]")
	--���ժ��ܡA�d�Ժ��N�u���û����^���h�L���y���۰�������A���שҦ��H���s�z���n�ǤJ���}�G���c�A
	--���Ӧb��ΩM�L�h���j�j�x�O���L�֫O�@�U�A������L��D��e�h���¸t���A
	--�o�L�����ǦP�ˤ]�O�^����N����D�̧x�Ҫ��H���A�o�˦n�ܡH 
	SetFlag(OwnerID(),543929,1)	--���X�СA�{�X���ð_���ƭӥd�Ժ�
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423259_5]","LuaS_423259_12",0)
	--�u�n�A�ڿ�C�v
	--AddSpeakOption(OwnerID(),TargetID(),"[SC_423259_12]","LuaS_423259_Move2",0)
	--����A�������}�o�̡C

end

function LuaS_423259_Move2()
	CloseSpeak(OwnerID())
	Say(TargetID(),"[SC_423259_13]")
	BeginPlot( OwnerID() , "LuaQ_423259_Move_3" , 0 )
end

function LuaQ_423259_Move_3()
	CastSpell( OwnerID() , OwnerID() , 491008 )
	sleep(5)
	ChangeZone( OwnerID() , 16 , 0 , -2905.7 ,-794.9, 24806 , 2.3 )
	SetFlag(OwnerID(),544034,1)
end

function LuaS_423259_12()	
	CloseSpeak(OwnerID())
	BeginPlot( OwnerID() , "LuaQ_423259_Accept_Do" , 0 )

end
	
function LuaQ_423259_Accept_Do()
	CastSpell( OwnerID() , OwnerID() , 491008 )
	sleep(5)
	ChangeZone( OwnerID() , 16 , 0 , -3108.4 ,-419, 25098 , 325.9 )
end	
	
	
function LuaS_423259_4()
	LoadQuestOption(OwnerID()) 
	--�i�����M�h�A�A�諸�S���A�ڴN�O�u�����H���@�D�d�Ժ��C
	if 	CheckAcceptQuest(OwnerID(),423259)==true 	and
		CheckFlag(OwnerID(),543929)==true			and
		CheckFlag(OwnerID(), 543985 )==false		and
		ReadRoleValue(OwnerID(),EM_RoleValue_IsAttackMode)==0	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423259_6]","LuaS_423259_5",0)
		--�u���U�A�A�O���U�a�C�v
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423259_7]","LuaS_423259_6",0)
		--�u�A���O���U�C�v
	end
end

function LuaS_423259_5()
	CloseSpeak(OwnerID())
	Yell(TargetID(),"[SC_423259_8]",1)
	--�m�˦b�A�ҿ�ܪ��H���}�U�A�m�X�A������a�A�����I
	--WriteRoleValue(TargetID(),EM_RoleValue_PID,591)--�����b�إX��npc�W�]pid��
	Beginplot(TargetID(),"LuaS_423259_7",0)

end

function LuaS_423259_6()	
	CloseSpeak(OwnerID())
	PlayMotion(TargetID(),ruFUSION_ACTORSTATE_EMOTE_ANGRY	)
	Yell(TargetID(),"[SC_423259_9]",1)	--�O�ڡA��M�O�ڡA�ڬO�d�Ժ��I
end

function LuaS_423259_7()	--�ͩǥ����a
	DisableQuest( OwnerID() , true )
	Local player="here"
	Local Monster="live"
	Hide(OwnerID())
	local fake = LuaFunc_CreateObjByObj(103555, OwnerID() )
		
	Setplot(fake ,"dead","LuaS_423259_Dead",100)
	SetAttack(fake, TargetID())
	Sleep(20)
	While 1 do

		if 	CheckID(fake) == false	or
			ReadRoleValue(fake, EM_RoleValue_IsDead)==1 then
			Monster="Dead"
			break
		end
		
		if	GetDistance( TargetID(), OwnerID()) >200   or
			ReadRoleValue(TargetID() , EM_RoleValue_IsDead)==1 	or
			CheckID(TargetID()) == false	or
			ReadRoleValue(TargetID(),EM_RoleValue_IsAttackMode)==0 then
			player="Nothere"
			break	
		end
		
		if 	CheckAcceptQuest(TargetID(),423259)==false 
			 then
			break
		end
		Sleep(10)
	end
	

	if player=="Nothere" then
		Sleep(50)
		SetStopAttack(fake)
		Delobj(fake)
		Show(OwnerID(),0)
		ScriptMessage(TargetID(), TargetID() , 1 , "[SAY_420635_1]" , 0 )	--���ȥ��ѡA�Э����@��	
		ScriptMessage(TargetID(), TargetID() , 0 , "[SAY_420635_1]" , 0 )	--���ȥ��ѡA�Э����@��
		SetFlag(TargetID(),543929,0)
		SetFlag(TargetID(),543985,0)
		SetFlag(TargetID(),543986,0)
		SetFlag(TargetID(),543987,0)
	end
	
	if 	CheckAcceptQuest(TargetID(),423259)==true 	and
	
		Monster=="Dead" 							then
			if 	ReadRoleValue(OwnerID(),EM_RoleValue_PID)==591	then
				SetFlag(TargetID() , 543985 , 1)
			end
			
			if 	ReadRoleValue(OwnerID(),EM_RoleValue_PID)==592	then
				SetFlag(TargetID() , 543986 , 1)
			end

			if 	ReadRoleValue(OwnerID(),EM_RoleValue_PID)==593	then
				SetFlag(TargetID() , 543987 , 1)
			end	
	end
	SetStopAttack(fake)
	Delobj(fake)
	DisableQuest( OwnerID() , false )
	Sleep(50)
	Show(OwnerID(),0)
	
end


function LuaS_423259_8()
	LoadQuestOption(OwnerID()) 
	--�Ӧ����A�A����ڪ��ܡA�^��F�ԥ����A�N���J�F�I
	if 	CheckAcceptQuest(OwnerID(),423259)==true 	and
		CheckFlag(OwnerID(), 543986 )==false		and
		ReadRoleValue(OwnerID(),EM_RoleValue_IsAttackMode)==0	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423259_6]","LuaS_423259_9",0)
		--�u���U�A�A�O���U�a�C�v
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423259_7]","LuaS_423259_6",0)
		--�u�A���O���U�C�v
	end
end

function LuaS_423259_9()
	CloseSpeak(OwnerID())
	Yell(TargetID(),"[SC_423259_10]",1)
	--�N�A�o�˦����L�]���H�A�~�M�٬O����M�h�Ϊ��M�h�H
--	WriteRoleValue(TargetID(),EM_RoleValue_PID,592)--�����b�إX��npc�W�]pid��
	Beginplot(TargetID(),"LuaS_423259_7",0)
end

function LuaS_423259_10()
	LoadQuestOption(OwnerID()) 
	--���n�Q���G�Ӱ��f�F�F�A�ڤ~�O�d�Ժ��I
	if 	CheckAcceptQuest(OwnerID(),423259)==true 	and
		CheckFlag(OwnerID(), 543987 )==false		and
		ReadRoleValue(OwnerID(),EM_RoleValue_IsAttackMode)==0	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423259_6]","LuaS_423259_11",0)
		--�u���U�A�A�O���U�a�C�v
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423259_7]","LuaS_423259_6",0)
		--�u�A���O���U�C�v
	end
end

function LuaS_423259_11()
	CloseSpeak(OwnerID())
	Yell(TargetID(),"[SC_423259_11]",1)
	--�Q���f���F���Pı�p��ڡH����......
--	WriteRoleValue(TargetID(),EM_RoleValue_PID,593)--�����b�إX��npc�W�]pid��
	Beginplot(TargetID(),"LuaS_423259_7",0)
end

function LuaS_423259_Dead()
	
	
	Delobj(OwnerID())
end

--======================================================================================================
--423259		���ȧ����᪺�S��
--======================================================================================================

function LuaS_423259_ACT0()
	AddBuff( TargetID()  , 504004 , 1 , 300 )
	local ball = Lua_DW_CreateObj("flag" ,115280,780634,1)		--�ؤ@�ӳz������A�R�W���w�S�Jù

	DisableQuest(ball, true )
	CastSpell(ball,ball,494399)				--��S��
	Sleep(30)
	Tell(TargetID() ,ball,"[SC_423259_ACT0]")			--�O�Q�A�����Ҩ��g�b�A�o�ǥu�O�۶H�C
	SetFlag(TargetID() , 543988 , 1)		--���X�СA�ñN�x�A�{�X�o���Ȫ��w�S�Jù
	CastSpell(ball,ball,494399)				--��S��
	Sleep(30)
	CancelBuff( TargetID()  , 504004  )
	Delobj(ball)
end
	
	

	
	
	