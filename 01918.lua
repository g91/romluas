----------------------423321--------------------------
function LuaS_115647()
	LoadQuestOption( OwnerID() )					---Ū�����ȼҪO
	if	CheckAcceptQuest( OwnerID() , 423321 ) == true	and	CheckFlag( OwnerID(),544218 ) == false	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423321_1]","LuaS_423321_1",0)		---�ڷQ�F�Ѩ��¯����C
	end	--<=423321��	
	if	CheckAcceptQuest( OwnerID() , 423321 ) == true	and	CheckFlag( OwnerID(),544218 ) == true	and	CheckFlag( OwnerID(),544219 ) == false	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423321_4]","LuaS_423321_1_1",0)		---�W���y�L�F�ѯ����F�A���H���L���¯��ܡH
	end	--<=423321��	
	if	CheckAcceptQuest( OwnerID() , 423321 ) == true	and	CheckFlag( OwnerID(),544219 ) == true	and	CheckFlag( OwnerID(),544220 ) == false	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423321_7]","LuaS_423321_3",0)		---�W�����쯫�������D�J�A�A�ۤv�k�X�ӤF�H
	end	--<=423321��
----------423324��
	if CheckAcceptQuest( OwnerID() , 423324 ) == true  and	CheckFlag( OwnerID(),544223 ) == false	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423324_1]","LuaS_423324_1_1",0)	--�n��ڭ̻�����O�H
	end	--<=423324��
	
	if	CheckAcceptQuest( OwnerID() , 423324 ) == true	and	CheckFlag( OwnerID(),544223 ) == true	and	CheckFlag( OwnerID(),544224 ) == false	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423324_1]","LuaS_423324_1",0)		---�n��ڭ̻�����O�H
	end	--<=423318��	
	if	CheckAcceptQuest( OwnerID() , 423324 ) == true	and	CheckFlag( OwnerID(),544224 ) == true	and	CheckFlag( OwnerID(),544225 ) == false	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423324_4]","LuaS_423324_2",0)		---��p�W�������}�A���~�򻡤U�h�C
	end	--<=423318��	
	if	CheckAcceptQuest( OwnerID() , 423324 ) == true	and	CheckFlag( OwnerID(),544225 ) == true	and	CheckFlag( OwnerID(),544226 ) == false	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423324_7]","LuaS_423324_3",0)		---�W������Z�Ҽڴ������X�z�A�P�d�g���D�����D�ܡH
	end	--<=423318��	
	if	CheckAcceptQuest( OwnerID() , 423324 ) == true	and	CheckFlag( OwnerID(),544226 ) == true	and	CheckFlag( OwnerID(),544227 ) == false	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423324_10]","LuaS_423324_4",0)		---�W���O���w�溸�H�O���F�l�d�u���~�[�J�H���x�o�H
	end	--<=423318��	
------17�ƥ�����423478��---
	if	CountBodyItem ( OwnerID(), 207759 )	== 1 and CountBodyItem ( OwnerID(), 207920 )	== 1 and 
		CheckAcceptQuest( OwnerID() ,423478 ) == true	then
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_423478_1]" , "LuaS_k423478_1", 0 )
	end
		
end



function LuaS_423321_1()
	local Dis =  GetDistance( OwnerID() , TargetID() )					---�Z���W�L50����
	if	Dis > 50 then
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204592_2]" ,  "0xFFFFFF00" ) 	---
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204592_2]" ,  "0xFFFFFF00" )
		CloseSpeak( OwnerID() )
	else
		SetSpeakDetail(OwnerID(),"[SC_423321_2]")			---�ǻ��d�~�e�P�d�g�a��ڤH�b���إ߻�D���...
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423321_3]","LuaS_423321_2",0)	--���¯������X�F������D�H
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423321_9]","LuaS_423321_1_1",0)	--	���g���H���L���¯��ܡH
		if	CheckAcceptQuest ( OwnerID()   , 423321 )	 == true	then
			SetFlag(OwnerID(),544218,1)
		end	
	end
end

function LuaS_423321_1_1()
	local Dis =  GetDistance( OwnerID() , TargetID() )					---�Z���W�L50����
	if	Dis > 50 then
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204592_2]" ,  "0xFFFFFF00" ) 	---
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204592_2]" ,  "0xFFFFFF00" )
		CloseSpeak( OwnerID() )
	else
		SetSpeakDetail(OwnerID(),"[SC_423321_10]")			---�{�b���w�溸�H�A�S�H�u�����L�u�O�L�u�@�̡v����...
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423321_3]","LuaS_423321_2",0)	--	���¯������X�F������D�H
	end
end

function LuaS_423321_2()
	local Dis =  GetDistance( OwnerID() , TargetID() )					---�Z���W�L50����
	if	Dis > 50 then
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204592_2]" ,  "0xFFFFFF00" ) 	---
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204592_2]" ,  "0xFFFFFF00" )
		CloseSpeak( OwnerID() )
	else
		SetSpeakDetail(OwnerID(),"[SC_423321_5]")			---�o�n����ڪ����˶��˥d...
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423321_6]","LuaS_423321_3",0)	--�ҥH�A�k�X�ӤF�H
		if	CheckAcceptQuest ( OwnerID()   , 423321 )	 == true	then
			SetFlag(OwnerID(),544219,1)
		end
	end
end

function LuaS_423321_3()
	local Dis =  GetDistance( OwnerID() , TargetID() )					---�Z���W�L50����
	if	Dis > 50 then
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204592_2]" ,  "0xFFFFFF00" ) 	---
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204592_2]" ,  "0xFFFFFF00" )
		CloseSpeak( OwnerID() )
	else
		SetSpeakDetail(OwnerID(),"[SC_423321_8]")			---��...�ڰk�X�ӤF�A�I�t�ۮ��d...���ڱڥ����n���H�N���������@���Ʊ��i�D�P��...
		if	CheckAcceptQuest ( OwnerID()   , 423321 )	 == true	then
			SetFlag(OwnerID(),544220,1)
		end	
	end
end

----------------------423322---------------------------
function LuaS_423322()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 423322 ) == true  and	CheckFlag( OwnerID(),544221 ) == false	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423322_1]","LuaS_423322_1",0)	--�ڭ̭n��ԮL�R������O�H
	end	--<=423317��
end

function LuaS_423322_1()
	if  ReadRoleValue( TargetID(), EM_RoleValue_Register +1) == 0  then                   --
		WriteRoleValue ( TargetID() , EM_RoleValue_Register +1,1 )
		CloseSpeak(OwnerID())
		BeginPlot(TargetID(),"LuaS_423322_2",0)
	else
		SetSpeakDetail(OwnerID(),"[SC_423322_2]")			---���ھ�z�@�U����A��������M�h�Υثe�H�⤣���A�o�Q��k���A�ԮL�R...	
	end
end

function LuaS_423322_false()
	SetSpeakDetail(OwnerID(),"[SC_423322_2]")			---���ھ�z�@�U����A��������M�h�Υثe�H�⤣���A�o�Q��k���A�ԮL�R...
end

function LuaS_423322_2()

	AddBuff( TargetID()  , 506994 , 1 , -1 ) 
	CallPlot(OwnerID(),"LuaS_Check_noquest_single", 1 , 1 , 423322 , 506994,TargetID(),OwnerID(),150)
	local ith = Lua_DW_CreateObj("obj",115701,OwnerID())   --ith���H	
	local NPC = LuaFunc_SearchNPCbyOrgID( OwnerID() ,115645  , 200 , 0)		---
	local tony = Lua_DW_CreateObj("obj",115700,NPC)   --tony���H	
	local NPC1 = LuaFunc_SearchNPCbyOrgID( OwnerID() ,115647  , 200 , 0)		---
	local lasha = Lua_DW_CreateObj("obj",115702,NPC1)   --lasha���H	
	MoveToFlagEnabled(ith,false)							
	MoveToFlagEnabled(tony,false)
	MoveToFlagEnabled(lasha,false)
	DisableQuest( ith , true )							---�t�����i���
	DisableQuest( tony , true )	
	DisableQuest( lasha , true )	
	PlayMotion( ith,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Yell(ith,"[SC_423322_3]",3)						---���٬O���٦�����M�h�ΥX�L�C
	sleep(35)
	WriteRoleValue(ith , EM_RoleValue_IsWalk, 0 )		---�ζ]��
	WriteRoleValue(lasha , EM_RoleValue_IsWalk, 0 )		---�ζ]��
	AdjustFaceDir( lasha ,ith, 0 )
	PlayMotion(lasha,ruFUSION_ACTORSTATE_EMOTE_POINT)
	sleep(5)
	Yell(lasha,"[SC_423322_4]",3)						---���u�O�A�����z����{�A�f�f�n�n����U��D��A�J����D�o�u�|����C
	sleep(35)
	PlayMotion( ith,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Yell(ith,"[SC_423322_5]",3)							---���O�]���Ʊ���b�����_�A�S���Ҿڮڥ����H�۫H�C
	sleep(35)
	
	if	CheckBuff(TargetID() , 506994 ) == false	then
		delobj(tony)
		delobj(lasha)
		delobj(ith)
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )	---
		return
	end
		
	PlayMotionEX( lasha , ruFUSION_ACTORSTATE_ATTACK_1H , ruFUSION_ACTORSTATE_NORMAL )
	Yell(lasha,"[SC_423322_6]",3)						---�ڨ��W���˲��N�O�ҾڡA�A���p�G�H�����۫H��
	WriteRoleValue(ith , EM_RoleValue_IsWalk, 1 )
	sleep(25)	
	PlayMotion(ith,ruFUSION_ACTORSTATE_EMOTE_POINT)	
	Yell(ith,"[SC_423322_7]",3)							---�ԮL�R�I
	DW_MoveToFlag(ith,780679 , 11,0 ,1)
	Yell(tony,"[SC_423322_8]",3)						---�A�̳��N�R�U�ӡI
	sleep(15)	

	AdjustFaceDir( ith ,tony, 0 )
	AdjustFaceDir( lasha ,tony, 0 )
	sleep(5)
	Yell(ith,"[SC_423317_8]",3)							----....
	Yell(lasha,"[SC_423317_8]",3)						----....
	sleep(50)
		
	if	CheckBuff(TargetID() , 506994 ) == false	then
		delobj(tony)
		delobj(lasha)
		delobj(ith)
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )	---
		return
	end
		
	AdjustFaceDir( tony ,lasha, 0 )
	PlayMotion( tony,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Yell(tony,"[SC_423322_9]",3)					---�S���A�ڭ̽T��ݭn�ҾڡA�ҥH�i�H�ЩԮL�R�a�ڭ̹�ڰɬd�@���ܡH
	sleep(10)
	Yell(ith,"[SC_423225_3]",3)						---���U�I
	sleep(25)
	PlayMotion(lasha,ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	Yell(lasha,"[SC_423322_10]",3)					---�n�I�ڳo�N�h�ǳơA�٬O�H�����z�C
	AdjustFaceDir( ith ,lasha, 0 )
	sleep(30)

	CallPlot(tony,"LuaS_face_someone", lasha,5)		---���򭱹�ԮL�R
	CallPlot(ith,"LuaS_face_someone", lasha,5)
	DW_MoveToFlag(lasha,780679 , 1,0 ,1)
	delobj(lasha)
	local X = ReadRoleValue ( OwnerID(), EM_RoleValue_X)
	local Y = ReadRoleValue ( OwnerID(), EM_RoleValue_Y)
	local Z = ReadRoleValue ( OwnerID(), EM_RoleValue_Z)
	DW_WaitMoveTo( ith , X , Y, Z)
	sleep(20)
		
	if	CheckBuff(TargetID() , 506994 ) == false	then
		delobj(tony)
		delobj(ith)
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )	---
		return
	end
		
	AdjustFaceDir( ith ,tony, 0 )
	AdjustFaceDir( tony ,ith, 0 )
	sleep(5)
	PlayMotion( ith,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Yell(ith,"[SC_423322_11]",3)					---���U�A�o�ӦM�I�F�C
	sleep(30)
	Yell(tony,"[SC_423322_12]",3)					---��ߡA�u�O�ɬd�Ӥw�A�ӥB�p�G���M�I�A�ڷ|�ۤv�O�@�ۤv�C
	sleep(40)

	if	CheckBuff(TargetID() , 506994 ) == false	then
		delobj(tony)
		delobj(ith)
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )	---
		return
	end
		
	PlayMotion(tony,ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	Yell(tony,"[SC_423322_13]",3)					---�ڭ̻ݭn���ǭp�e�A�O�o�ܡH���}�n������覡�A���B�N�������ߡC
	sleep(40)
	Yell(ith,"[SC_423322_14]",3)					---���U...
	sleep(30)
	AdjustFaceDir( ith ,NPC1, 0 )
	AdjustFaceDir( tony ,NPC1, 0 )
	sleep(5)
	if	CheckAcceptQuest ( TargetID()   , 423322 )	 == true	and	CheckBuff( TargetID() , 506994 ) == true	then
		SetFlag(TargetID(),544221,1)
	end
	delobj(tony)
	delobj(ith)
	CancelBuff( TargetID()  , 506994  ) 	--
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )
end

function LuaS_face_someone(Target,time)
	for i = 0,time*2 do
		sleep(5)
		if	CheckID(Target)	== true	then
			AdjustFaceDir( OwnerID() ,Target, 0 )	
		end
	end
end

-----------------------423323--------------------------
function LuaS_115753()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 423323 ) == true  and	CheckFlag( OwnerID(),544222 ) == false	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423323_1]","LuaS_423323_1",0)	--�ڭ̭n�i�h�F�ܡH
	end	--<=423317��
end

function LuaS_423323_1()
	if  ReadRoleValue( TargetID(), EM_RoleValue_Register +1) == 0  then                   --
		WriteRoleValue ( TargetID() , EM_RoleValue_Register +1,1 )
		CloseSpeak(OwnerID())
		BeginPlot(TargetID(),"LuaS_423323_2",0)
	else
		SetSpeakDetail(OwnerID(),"[SC_423323_2]")			---�i�h�H�h���̡H�A�a�H���p�����٨S�ӫ��H
	end
end

function LuaS_423323_false()
	SetSpeakDetail(OwnerID(),"[SC_423323_2]")			---�i�h�H�h���̡H�A�a�H���p�����٨S�ӫ��H
end

function LuaS_423323_2()

	AddBuff( TargetID()  , 506995 , 1 , -1 ) 

	local lasha = Lua_DW_CreateObj("obj",115705,OwnerID())   --lasha���H	
	local NPC = LuaFunc_SearchNPCbyOrgID( OwnerID() ,115754  , 200 , 0)		---
	local samu1 = Lua_DW_CreateObj("obj",115706,NPC)   --samu1���H	
	local NPC1 = LuaFunc_SearchNPCbyOrgID( OwnerID() ,115755  , 200 , 0)		---
	local samu2 = Lua_DW_CreateObj("obj",115707,NPC1)   --samu2���H	
	local tony = Lua_DW_CreateObj("flag" ,115703,780680,1)		---tony���H	
	local ith = Lua_DW_CreateObj("flag" ,115704,780680,2)		---ith���H
	CallPlot(OwnerID(),"LuaS_Check_noquest_single", 1 , 1 , 423323 , 506995,TargetID(),lasha,150)
	MoveToFlagEnabled(ith,false)							
	MoveToFlagEnabled(tony,false)
	MoveToFlagEnabled(lasha,false)
	MoveToFlagEnabled(samu1,false)							
	MoveToFlagEnabled(samu2,false)
	DisableQuest( ith , true )							---�t�����i���
	DisableQuest( tony , true )	
	DisableQuest( lasha , true )		
	DisableQuest( samu1 , true )							---�t�����i���
	DisableQuest( samu2 , true )
	sleep(20)
	WriteRoleValue(tony , EM_RoleValue_IsWalk, 1 )		---�Ψ���
	WriteRoleValue(ith , EM_RoleValue_IsWalk, 1 )		---�Ψ���
	WriteRoleValue(lasha , EM_RoleValue_IsWalk, 1 )		---�Ψ���
	WriteRoleValue(samu1 , EM_RoleValue_IsWalk, 1 )		---�Ψ���
	WriteRoleValue(samu2 , EM_RoleValue_IsWalk, 1 )		---�Ψ���
	sleep(10)
	Yell(tony,"[SC_423323_3]",3)						---�ڭ̨ӤF�C
	CallPlot(ith,"DW_MoveToFlag",ith,780680 , 4,0 ,1)
	DW_MoveToFlag(tony,780680 , 3 ,0 ,1)
	sleep(5)
	AdjustFaceDir( ith ,lasha, 0 )
	AdjustFaceDir( tony ,lasha, 0 )
	AdjustFaceDir( lasha ,tony, 0 )
	sleep(5)	
	PlayMotion(lasha,ruFUSION_ACTORSTATE_EMOTE_THINK)
	Yell(lasha,"[SC_423323_4]",3)						---�ڭ̨S���Ӧh�ɶ��A�@�����p�ߨ����}�C
	sleep(40)	
	PlayMotion(tony,ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	Yell(tony,"[SC_423323_5]",3)						---�F�ѡC
	sleep(30)

	if	CheckBuff(TargetID() , 506995 ) == false	then
		delobj(samu1)
		delobj(samu2)
		delobj(tony)
		delobj(lasha)
		delobj(ith)
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )	---
		return
	end

	CallPlot(ith,"DW_MoveToFlag",ith,780680 , 6,0 ,1)	
	CallPlot(tony,"DW_MoveToFlag",tony,780680 , 5,0 ,1)
	CallPlot(samu1,"DW_MoveToFlag",samu1,780680 , 7,0 ,1)
	CallPlot(samu2,"DW_MoveToFlag",samu2,780680 , 8,0 ,1)
	DW_MoveToFlag(lasha,780680 , 9 ,0 ,1)
	local fire = Lua_DW_CreateObj("flag" ,115756,780680,10)		---ith���H	
	MoveToFlagEnabled(fire,false)
	DisableQuest( fire , true )
	WriteRoleValue(lasha , EM_RoleValue_IsWalk, 0 )		---�Ψ���
	WriteRoleValue(samu1 , EM_RoleValue_IsWalk, 0 )		---�Ψ���
	WriteRoleValue(samu2 , EM_RoleValue_IsWalk, 0 )		---�Ψ���
	WriteRoleValue(tony , EM_RoleValue_IsWalk, 0 )		---�Ψ���
	WriteRoleValue(ith , EM_RoleValue_IsWalk, 0 )		---�Ψ���
	Yell(fire,"[SC_423323_6]",3)						---�w�溸���U��а��U�ӧa�C
	CallPlot(fire,"MK_MoveToFlag_Face",fire,780680 , 11,0 ,1,lasha)
	sleep(20)

	if	CheckBuff(TargetID() , 506995 ) == false	then
		delobj(samu1)
		delobj(samu2)
		delobj(tony)
		delobj(lasha)
		delobj(ith)
		delobj(fire)
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )	---
		return
	end
		
	Yell(lasha,"[SC_423320_34]",3)						---�ͽáI
	CallPlot(samu1,"DW_MoveToFlag",samu1,780680 , 12,0 ,1)
	CallPlot(samu2,"DW_MoveToFlag",samu2,780680 , 13,0 ,1)
	CallPlot(tony,"MK_MoveToFlag_Face", tony , 780680 , 20, 0 , 1 ,fire )	
	CallPlot(ith,"MK_MoveToFlag_Face", ith , 780680 , 22, 0 , 1 ,fire )	
	sleep(20)
	PlayMotion(lasha,ruFUSION_ACTORSTATE_EMOTE_POINT)
	sleep(5)
	Yell(lasha,"[SC_423323_7]",3)						---�A�O...���ڤH�I
	sleep(15)	
	SetIdleMotion( samu1,ruFUSION_ACTORSTATE_COMBAT_UNARMED)		----�԰�����
	SetIdleMotion( samu2,ruFUSION_ACTORSTATE_COMBAT_UNARMED)		----�԰�����
	CallPlot(samu1,"DW_MoveToFlag",samu1,780680 , 14,0 ,1)
	CallPlot(samu2,"DW_MoveToFlag",samu2,780680 , 15,0 ,1)
	CallPlot(lasha,"DW_MoveToFlag",lasha,780680 , 16,0 ,1)
	AdjustFaceDir( tony ,fire, 0 )	
	Yell(fire,"[SC_423323_8]",3)						---�A�����˭n�ڸ�A��...
	sleep(15)
	Yell(lasha,"[SC_423323_9]",3)						---�ڪ������٬���!?
	sleep(35)
		
	if	CheckBuff(TargetID() , 506995 ) == false	then
		delobj(samu1)
		delobj(samu2)
		delobj(tony)
		delobj(lasha)
		delobj(ith)
		delobj(fire)
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )	---
		return
	end
		
	Yell(fire,"[SC_423323_10]",3)						---��...���ӬO���F...
	sleep(15)

	PlayMotion(lasha,ruFUSION_ACTORSTATE_EMOTE_POINT)
	sleep(5)
	Yell(lasha,"[SC_423323_11]",3)						---�A����!!
	sleep(35)
	Yell(fire,"[SC_423323_12]",3)						---�ڤ]���T�w�A�����Ӥ]���⬡�ۡC
	sleep(15)

	PlayMotion(lasha,ruFUSION_ACTORSTATE_EMOTE_ANGRY)
	Yell(lasha,"[SC_423323_13]",3)						---���μo�ܤF�A�������ڤH!!
		

		
	sleep(15)

	PlayMotion(lasha,ruFUSION_ACTORSTATE_EMOTE_POINT)
	sleep(5)
	Yell(tony,"[SC_423323_14]",3)						----�����A�N�R�I�A��ťť�o�����k,�γ\�i�H���D�̭������p!!
	CallPlot(samu1,"DW_MoveToFlag",samu1,780680 , 17,0 ,1)
	CallPlot(samu2,"DW_MoveToFlag",samu2,780680 , 18,0 ,1)
	CallPlot(lasha,"DW_MoveToFlag",lasha,780680 , 19,0 ,1)	
	CallPlot(ith,"DW_MoveToFlag",ith,780680 , 20,0 ,1)		
	MK_MoveToFlag_Face( tony , 780680 , 21, 0 , 1,lasha  )
	AdjustFaceDir( ith ,lasha, 0 )		
	sleep(20)
	WriteRoleValue(samu1 , EM_RoleValue_IsWalk, 1 )		---�Ψ���
	WriteRoleValue(samu2 , EM_RoleValue_IsWalk, 1 )		---�Ψ���
	WriteRoleValue(lasha , EM_RoleValue_IsWalk, 1 )		---�Ψ���	
	WriteRoleValue(tony , EM_RoleValue_IsWalk, 1 )		---�Ψ���
	WriteRoleValue(ith , EM_RoleValue_IsWalk, 1 )		---�Ψ���
	Yell(lasha,"[SC_423317_8]",3)						----....
	sleep(30)
	Yell(lasha,"[SC_423323_15]",3)						----��!�ݷ|�A���]����!!�A��!!�h�U�h!!
	sleep(5)
	CallPlot(samu1,"DW_MoveToFlag",samu1,780680 , 5,0 ,1)
	DW_MoveToFlag(samu2,780680 , 6 ,0 ,1)
	delobj(samu1)
	delobj(samu2)
		
	if	CheckBuff(TargetID() , 506995 ) == false	then
		delobj(tony)
		delobj(lasha)
		delobj(ith)
		delobj(fire)
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )	---
		return
	end
		
	AdjustFaceDir( tony ,fire, 0 )	
	AdjustFaceDir( ith ,fire, 0 )		
	AdjustFaceDir( lasha ,fire, 0 )
	AdjustFaceDir( fire ,tony, 0 )			
	sleep(5)
	Yell(tony,"[SC_423323_16]",3)						---�ä�...�A�i�h�L���¯����H
	sleep(35)	
	Yell(fire,"[SC_423323_17]",3)						---�S��...��ť��߱ڶ��˥d�����b���¯����X�ƪ�������...
	sleep(55)	
	Yell(fire,"[SC_423323_18]",3)						---���S�Q��ڬݨ쪺���O���˥d�A�ӬO���˥d���F��A�L�P�ڰ��F�@������C
	sleep(50)

	if	CheckBuff(TargetID() , 506995 ) == false	then
		delobj(tony)
		delobj(lasha)
		delobj(ith)
		delobj(fire)
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )	---
		return
	end

	AdjustFaceDir( fire ,lasha, 0 )			
	sleep(5)	
	Yell(fire,"[SC_423323_19]",3)						---�L�N�_�ê���m�i�D�ڡA�N���O�n�ګO�@�L�̭��n���_���A�]�N�O�A�A�ԮL�R�C
	sleep(15)	
	PlayMotion(lasha,ruFUSION_ACTORSTATE_EMOTE_ANGRY)
	sleep(5)
	Yell(lasha,"[SC_423323_20]",3)						---����!�A�b����!!
	sleep(30)	
	Yell(fire,"[SC_423323_21]",3)						---����©ҿ襤���H�X�{�ɡA�����N�n���@����...
	sleep(35)
	Yell(lasha,"[SC_423323_22]",3)						---�o�O...�u�������~�ા�D������...
	sleep(30)
		
	if	CheckBuff(TargetID() , 506995 ) == false	then
		delobj(tony)
		delobj(lasha)
		delobj(ith)
		delobj(fire)
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )	---
		return
	end
		
	Yell(fire,"[SC_423323_23]",3)						---�O��...�A�����˧Y�ϥh�@�F���b���ߧA��o���j�L...
	sleep(55)
	PlayMotion(lasha,ruFUSION_ACTORSTATE_EMOTE_TIRED)
	Yell(lasha,"[SC_423323_24]",3)						---����...
	sleep(30)	
	Yell(fire,"[SC_423323_25]",3)						---�L�]�i�D�ڲ{�b�٤��O�ѩ���¯������ɭ�...
	sleep(55)
		
	if	CheckBuff(TargetID() , 506995 ) == false	then
		delobj(tony)
		delobj(lasha)
		delobj(ith)
		delobj(fire)
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )	---
		return
	end
		
	AdjustFaceDir( lasha ,fire, 180 )	
	sleep(5)
	Yell(lasha,"[SC_423323_26]",3)						---��...�ڨä��۫H�A�A�����٬O���ܪ��u�z�A���ѴN����L�A�C
	sleep(40)
	Yell(fire,"[SC_423323_27]",3)						---��A�D�J�M�I�ɡA�ڤ��|��u�P���˥d�����w�O�@�A�C
	sleep(40)
	AdjustFaceDir( lasha ,fire, 0 )		
	sleep(5)
	PlayMotion(lasha,ruFUSION_ACTORSTATE_EMOTE_POINT)
	sleep(5)

	if	CheckBuff(TargetID() , 506995 ) == false	then
		delobj(tony)
		delobj(lasha)
		delobj(ith)
		delobj(fire)
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )	---
		return
	end

	Yell(lasha,"[SC_423323_28]",3)						---��...�ڥu���D�p�G�A�{�b�����}����N�|�����ڤH���b�o�̡C
	sleep(40)
	CallPlot(fire,"DW_MoveToFlag",fire,780680 , 10,0 ,1)
	sleep(10)
	AdjustFaceDir( lasha ,fire, 180 )		
	sleep(5)
	Yell(lasha,"[SC_423323_29]",3)						---�^�b�פ��ᦳ�Ǹܭn�i�D�A�̡C
	sleep(20)
	CallPlot(lasha,"DW_MoveToFlag",lasha,780680 , 9,0 ,1)
	CallPlot(ith,"DW_MoveToFlag",ith,780680 , 7,0 ,1)	
	CallPlot(tony,"DW_MoveToFlag",tony,780680 , 5,0 ,1)
	sleep(30)
	if	CheckAcceptQuest ( TargetID()   , 423323 )	 == true	and	CheckBuff( TargetID() , 506995 ) == true	then
		SetFlag(TargetID(),544222,1)
	end	
	delobj(ith)
	delobj(tony)
	delobj(lasha)
	delobj(fire)
	CancelBuff( TargetID()  , 506995  ) 	--

	WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )
end

--------------------------------------423324----------------------------------------

function LuaS_423324_1_1()
	if  ReadRoleValue( TargetID(), EM_RoleValue_Register +1) == 0  then                   --
		WriteRoleValue ( TargetID() , EM_RoleValue_Register +1,1 )
		CloseSpeak(OwnerID())
		BeginPlot(TargetID(),"LuaS_423324_1_2",0)
	else
		SetSpeakDetail(OwnerID(),"[SC_423323_36]")			---�ڭn�����Ʊ������F�ԥ����P�w�溸���P�����Y...	
	end			
end

function LuaS_423324_false()
	SetSpeakDetail(OwnerID(),"[SC_423323_36]")			---�ڭn�����Ʊ������F�ԥ����P�w�溸���P�����Y...
end

function LuaS_423324_1_2()
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,1 )
	AddBuff( TargetID()  , 506996 , 1 , -1 ) 	
	CallPlot(OwnerID(),"LuaS_Check_noquest_single", 1 , 1 , 423324 , 506996,TargetID(),OwnerID(),150)
	local lasha = Lua_DW_CreateObj("obj",115757,OwnerID())   --lasha���H
	local NPC = LuaFunc_SearchNPCbyOrgID( OwnerID() ,115645  , 200 , 0)		---
	local tony = Lua_DW_CreateObj("obj",115758,NPC)   --tony���H	
	local NPC1 = LuaFunc_SearchNPCbyOrgID( OwnerID() ,115646  , 200 , 0)		---
	local ith = Lua_DW_CreateObj("obj",115759,NPC1)   --ith���H
	local knight = Lua_DW_CreateObj("flag" ,115762,780679,1)
	MoveToFlagEnabled(tony,false)
	MoveToFlagEnabled(lasha,false)
	MoveToFlagEnabled(ith,false)							
	MoveToFlagEnabled(knight,false)
	DisableQuest( ith , true )							---�t�����i���
	DisableQuest( tony , true )	
	DisableQuest( lasha , true )		
	DisableQuest( knight , true )
	sleep(20)
	WriteRoleValue(knight , EM_RoleValue_IsWalk, 1 )		---�Ψ���

	sleep(10)
	MK_MoveToFlag_Face(knight,780679 , 7 ,0 ,1,lasha)		
	AdjustFaceDir( lasha ,knight, 0 )
	sleep(5)
	Yell(knight,"[SC_423323_30]",3)							----���i�����A�u�j�N�x�v�����b���~�D���I
	sleep(30)	
	PlayMotion(lasha,ruFUSION_ACTORSTATE_EMOTE_POINT)
	sleep(5)
	Yell(lasha,"[SC_423323_31]",3)							---�j�N�x��...��I
	sleep(5)
	Yell(tony,"[SC_423323_32]",3)							---�����H
	sleep(20)
	CallPlot(knight,"DW_MoveToFlag",knight,780679 , 1,0 ,1)
	AdjustFaceDir( ith ,tony, 0 )	
	sleep(5)
	AdjustFaceDir( tony ,ith, 0 )		
	PlayMotion( ith ,ruFUSION_ACTORSTATE_CROUCH_BEGIN)	   --�|��§
	sleep(15)
	Yell(ith,"[SC_423323_33]",3)							---��Z�g�V���U�иo�A�ݤU��߸��W�|�D�J�w��J����
	sleep(25)
	delobj(knight)
	sleep(20)
	Yell(tony,"[SC_423323_34]",3)							---��...�S���Y...
	local lance = Lua_DW_CreateObj("flag" ,115760,780679,9)	
	sleep(20)
	PlayMotion( ith ,ruFUSION_ACTORSTATE_CROUCH_END)	   --�|��§
	WriteRoleValue(lance , EM_RoleValue_IsWalk, 1 )		---�Ψ���
	MoveToFlagEnabled(lance,false)
	DisableQuest( lance , true )
	sleep(5)
	local lance2 = LuaFunc_SearchNPCbyOrgID( OwnerID() ,115761  , 200 , 0)		---��������w��
	local X = ReadRoleValue ( lance2, EM_RoleValue_X)
	local Y = ReadRoleValue ( lance2, EM_RoleValue_Y)
	local Z = ReadRoleValue ( lance2, EM_RoleValue_Z)
	DW_WaitMoveTo( lance , X , Y, Z)
	AdjustFaceDir( tony ,lance, 0 )	
	sleep(5)
	AdjustFaceDir( lance ,tony, 0 )		
	sleep(5)
	if	CheckBuff( TargetID() , 506996 ) == true	then
		ScriptMessage( TargetID(), TargetID(), 0, "[SC_423323_35]", "0xff8080ff" )--�u�j�N�x�v���������۴����A�S�X���o�@�������e�C
		ScriptMessage( TargetID(), TargetID(), 1, "[SC_423323_35]",  "0xff8080ff" )--
	end
	sleep(40)
	AdjustFaceDir( lance ,lasha, 0 )
	sleep(5)	
	AdjustFaceDir(tony ,lasha, 0 )	
	AdjustFaceDir( ith ,lasha, 0 )
	sleep(20)
	delobj(tony)
	delobj(ith)
	delobj(lasha)
	delobj(lance)
	if	CheckBuff( TargetID() , 506996 ) == true	then

		SetFlag(TargetID(),544223,1)
	end	
	CancelBuff( TargetID()  , 506996  ) 	--
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )
end

function LuaS_423324_1()
	local Dis =  GetDistance( OwnerID() , TargetID() )					---�Z���W�L50����
	if	Dis > 50 then
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204592_2]" ,  "0xFFFFFF00" ) 	---
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204592_2]" ,  "0xFFFFFF00" )
		CloseSpeak( OwnerID() )
	else

		SetSpeakDetail(OwnerID(),"[SC_423324_2]")	---�o�O�@�q����ǻ��^���P�d�g�P�Z�Ҽڴ�.�d�ĩi���G�ơC...
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423324_3]","LuaS_423324_2",0)	--��p�A�ڨS�ݹL�v�ѡA���o�ئX�@���Y�ݨӨä��a�C
		if	CheckAcceptQuest ( OwnerID()   , 423324 )	 == true	then
			SetFlag(OwnerID(),544224,1)
		end
	end
end

function LuaS_423324_2()
	local Dis =  GetDistance( OwnerID() , TargetID() )					---�Z���W�L50����
	if	Dis > 50 then
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204592_2]" ,  "0xFFFFFF00" ) 	---
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204592_2]" ,  "0xFFFFFF00" )
		CloseSpeak( OwnerID() )
	else

		SetSpeakDetail(OwnerID(),"[SC_423324_5]")	---���O�J�ӷQ�Q�A����Z�Ҽڴ��n���ıN�����t�d�H
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423324_6]","LuaS_423324_3",0)	--�o�T��O�D�`���X�z�A�P�d�g���D�����D�ܡH
		if	CheckAcceptQuest ( OwnerID()   , 423324 )	 == true	then
			SetFlag(OwnerID(),544225,1)
		end
	end
end

function LuaS_423324_3()
	local Dis =  GetDistance( OwnerID() , TargetID() )					---�Z���W�L50����
	if	Dis > 50 then
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204592_2]" ,  "0xFFFFFF00" ) 	---
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204592_2]" ,  "0xFFFFFF00" )
		CloseSpeak( OwnerID() )
	else

		SetSpeakDetail(OwnerID(),"[SC_423324_8]")	---�P�d�g�]���O�³J�A�۵M���D�o�@�I...
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423324_9]","LuaS_423324_4",0)	--�o�򻡨ӡA�w�溸�H�O���F�l�d�u���~�[�J�H���x�o�H
		if	CheckAcceptQuest ( OwnerID()   , 423324 )	 == true	then
			SetFlag(OwnerID(),544226,1)
		end
	end
end

function LuaS_423324_4()
	local Dis =  GetDistance( OwnerID() , TargetID() )					---�Z���W�L50����
	if	Dis > 50 then
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204592_2]" ,  "0xFFFFFF00" ) 	---
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204592_2]" ,  "0xFFFFFF00" )
		CloseSpeak( OwnerID() )
	else

		SetSpeakDetail(OwnerID(),"[SC_423324_11]")	---�@�}�l�γ\�O�o�ˡA���b�P�d�g���O����...
		if	CheckAcceptQuest ( OwnerID()   , 423324 )	 == true	then
			SetFlag(OwnerID(),544227,1)
		end
	end
end

-------------------423326--------------------------

function LuaS_115761()
	LoadQuestOption( OwnerID() )					---Ū�����ȼҪO
	if CheckAcceptQuest( OwnerID() , 423326 ) == true  and	CheckFlag( OwnerID(),544228 ) == false	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423326_1]","LuaS_423326_1",0)	--�S�������A�ڭ̤S�p��V�ԮL�R�����H
	end	--<=423326��	
end
	
function LuaS_423326_1()
	if  ReadRoleValue( TargetID(), EM_RoleValue_Register +1) == 0  then                   --
		WriteRoleValue ( TargetID() , EM_RoleValue_Register +1,1 )
		CloseSpeak(OwnerID())
		BeginPlot(TargetID(),"LuaS_423326_2",0)
	else
		SetSpeakDetail(OwnerID(),"[SC_423326_2]")			---�v�����D�p�ä�������w�溸�H��H���x���q��...		
	end
end

function LuaS_423326_false()
	SetSpeakDetail(OwnerID(),"[SC_423326_2]")			---�v�����D�p�ä�������w�溸�H��H���x���q��...
end	
	
function LuaS_423326_2()
	AddBuff( TargetID()  , 506997 , 1 , -1 ) 	
	CallPlot(OwnerID(),"LuaS_Check_noquest_single", 1 , 1 , 423326 , 506997,TargetID(),OwnerID(),150)	
	local lance = Lua_DW_CreateObj("obj",115766,OwnerID())   --lance���H
	local NPC = LuaFunc_SearchNPCbyOrgID( OwnerID() ,115764  , 200 , 0)		---
	local tony = Lua_DW_CreateObj("obj",115767,NPC)   --tony���H	
	local NPC1 = LuaFunc_SearchNPCbyOrgID( OwnerID() ,115765  , 200 , 0)		---
	local ith = Lua_DW_CreateObj("obj",115768,NPC1)   --ith���H
	local NPC2 = LuaFunc_SearchNPCbyOrgID( OwnerID() ,115647  , 200 , 0)		---
	local lasha = Lua_DW_CreateObj("obj",115769,NPC2)   --lasha���H
	MoveToFlagEnabled(tony,false)
	MoveToFlagEnabled(lasha,false)
	MoveToFlagEnabled(ith,false)							
	MoveToFlagEnabled(lance,false)
	DisableQuest( ith , true )							---�t�����i���
	DisableQuest( tony , true )	
	DisableQuest( lasha , true )		
	DisableQuest( lance , true )	
	sleep(20)
	WriteRoleValue(lance , EM_RoleValue_IsWalk, 1 )		---�Ψ���
	PlayMotion( lance,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Yell(lance,"[SC_423326_3]",3)						---�~�����w�溸�H�����ԮL�R�A�P�d�g���O���۫H�@�w���L���ھ�...
	sleep(5)	
	AdjustFaceDir(tony ,lance, 0 )	
	AdjustFaceDir( ith ,lance, 0 )	
	AdjustFaceDir( lasha ,lance, 0 )	
	sleep(15)
	Yell(ith,"[SC_423326_4]",3)							---�j�N�x�H
	sleep(30)
	Yell(lance,"[SC_423326_5]",3)						---�M�ӧڥ����ӻ{�A�o�N�ް_�w�溸�H��H���x�����H��...
	sleep(55)
	
	if	CheckBuff(TargetID() , 506997 ) == false	then
		delobj(lance)
		delobj(tony)
		delobj(lasha)
		delobj(ith)
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )	---
		return
	end
			
			
	if	CheckBuff( TargetID() , 506997 ) == true	then
		ScriptMessage( TargetID(), TargetID(), 0, "[SC_423326_6]", "0xff8080ff" )--(�ԮL�R�������a�ۼ���)
		ScriptMessage( TargetID(), TargetID(), 1, "[SC_423326_6]",  "0xff8080ff" )--
	end
	sleep(5)
	PlayMotion(lasha,ruFUSION_ACTORSTATE_EMOTE_POINT)	
	sleep(5)
	Yell(lasha,"[SC_423326_7]",3)						---�A�]�Q�p�Z�Ҽڴ�����N�o�ܡH
	sleep(40)	
	PlayMotion( lance,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Yell(lance,"[SC_423326_8]",3)						---���A�d�~�e���L�h���H�l�d...
	sleep(55)
		
	if	CheckBuff(TargetID() , 506997 ) == false	then
		delobj(lance)
		delobj(tony)
		delobj(lasha)
		delobj(ith)
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )	---
		return
	end		
			
	Yell(lance,"[SC_423326_9]",3)						---�åB�ɥ��O�l�d��ɩҵo�ͪ��@��...
	sleep(15)		
	if	CheckBuff( TargetID() , 506997 ) == true	then
		ScriptMessage( TargetID(), TargetID(), 0, "[SC_423326_10]", "0xff8080ff" )--�ԮL�R���G��u�j�N�x�v�������ǷN�~
		ScriptMessage( TargetID(), TargetID(), 1, "[SC_423326_10]",  "0xff8080ff" )--
	end	
	sleep(35)
	Yell(lasha,"[SC_423326_11]",3)						---�����ɪ��o�^�N�p�P��߶ǩӶܡH�u���쪺���k�A�γ\����b�ڳo�@�N�Ƹѹ�F�ԥ������q�ҡC
	sleep(45)	
	PlayMotion( lance,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Yell(lance,"[SC_423326_12]",3)						---�p���U�a�ƥ�|�_�A���s�l���P�����Y�褣�e�w�A����M�h�αN���O�䴩�w�溸���ҭ��{���U�ذ��D�C
	sleep(55)	

	if	CheckBuff(TargetID() , 506997 ) == false	then
		delobj(lance)
		delobj(tony)
		delobj(lasha)
		delobj(ith)
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )	---
		return
	end		

	PlayMotion( lasha,ruFUSION_ACTORSTATE_EMOTE_SPEAK )		
	Yell(lasha,"[SC_423326_13]",3)						---��...�{�b���O�ɭԡA�ڱN���ݥ��F�̪��T���A���ɦA�q���F�ԥ��������U��C
	sleep(45)	
	PlayMotion( lance,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Yell(lance,"[SC_423326_14]",3)						---�P�¦w�溸������̡A����ήɰѻP���n�|ĳ��b�U���A�Ʊ�o�i�H�Ѱ��w�溸�������ôb�C
	sleep(55)	
	PlayMotion(lasha,ruFUSION_ACTORSTATE_EMOTE_APPLAUSE)	
	Yell(lasha,"[SC_423326_15]",3)						---�H�������M�N�K�F�a�A�ڥi�S��������̧A��...
	sleep(15)
		
	if	CheckBuff(TargetID() , 506997 ) == false	then
		delobj(lance)
		delobj(tony)
		delobj(lasha)
		delobj(ith)
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )	---
		return
	end				
		
	PlayMotion(lasha,ruFUSION_ACTORSTATE_EMOTE_POINT)	
	sleep(30)		
	PlayMotion( lance,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Yell(lance,"[SC_423326_16]",3)						---�O�ܡH���@�F�ԥ������۷N�i�H���s���^�w�溸��H���x���H���C
	sleep(35)		
	Yell(lance,"[SC_423326_17]",3)						---���F�Ȧb���A�ٽнЮe�ڥ����}�C
	sleep(25)		
	PlayMotion( lasha,ruFUSION_ACTORSTATE_EMOTE_SPEAK )		
	Yell(lasha,"[SC_423326_18]",3)						---���e�C
	sleep(15)	
	DW_MoveToFlag(lance,780679 , 1 ,0 ,1)
	delobj(lance)		
	AdjustFaceDir(tony ,lasha, 0 )	
	AdjustFaceDir( ith ,lasha, 0 )	
	AdjustFaceDir( lasha ,tony, 0 )	
	sleep(5)
	Yell(lasha,"[SC_423326_19]",3)						---���n�N��A�o�ͪ��Ʊ��Ӧh�A�{�b�������R�@�R�C
	sleep(25)		
	delobj(tony)
	delobj(ith)
	delobj(lasha)

	if	CheckBuff( TargetID() , 506997 ) == true	then
		CancelBuff( TargetID()  , 506997  ) 	--
		SetFlag(TargetID(),544228,1)
	end	
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )
end	
	