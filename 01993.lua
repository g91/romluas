function LuaS_116168_sleep()	--�˦a���ܼ}
	LuaP_Sleeping()
end

function Lua_423469_before()
	local NPC = SearchRangeNPC ( OwnerID() , 50 )
	for i=0,table.getn(NPC)-1 do
		if	ReadRoleValue(NPC[i],EM_RoleValue_OrgID) ==116157	then
			if	(CheckAcceptQuest(OwnerID(),423469)==true )and( CheckCompleteQuest( OwnerID(),423469)==false) 	then
				if	CheckFlag( OwnerID() , 544334) ==false	then
					if	CountBodyItem(OwnerID(),208099) > 0 	then
						return true
						else
						ScriptMessage(OwnerID(),OwnerID(), 1, "[SC_423469_0]",0) --�A���W�S���U�e���f���I
						return false
					end
				else
				return false
				end
			end
		end
		if	ReadRoleValue(NPC[i],EM_RoleValue_OrgID) ==116158	then
			if	CheckFlag( OwnerID() , 544334) ==true	then
				if	CheckFlag( OwnerID() , 544335) ==false	then
					if 	(ReadRoleValue( TargetID() , EM_RoleValue_Register+1 ) == 0)	then
						if	CountBodyItem(OwnerID(),208098) > 0		then
							return true
							else
							ScriptMessage(OwnerID(),OwnerID(), 1, "[SC_423469_1]",0) --�A���W�S�����d���¾K�ġI
							return false
						end
					else
					ScriptMessage(OwnerID(),OwnerID(), 1, "[SAY_NPC_BUSY]",0) --�ؼХ��b���L��
					return false
					end
				
				else
				return false
				end
			else
			ScriptMessage(OwnerID(),OwnerID(), 1, "[SC_423469_4]",0) --��������m�ܼ}�H�ʶR���f���I
			return false
			end
		end
	end
end

function LuaS_423469_PONPON()	--�V���d���¾K��
	LoadQuestOption( OwnerID() )
	if	(CheckAcceptQuest(OwnerID(),423469)==true )and( CheckCompleteQuest( OwnerID(),423469)==false) 	then
		if	CheckFlag( OwnerID() , 544335) ==false	then
			if	CountBodyItem(OwnerID(),208098) < 1		then
				AddSpeakOption(OwnerID(),TargetID(),"[SC_423469_2]","LuaS_423469_PONPON_1",0)	--�ڻݭn�@�~[208098]�C
			end
		end
	end	
	if	(CheckAcceptQuest(OwnerID(),423470)==true )and( CheckCompleteQuest( OwnerID(),423470)==false) 	then
		if	CheckFlag( OwnerID() , 544337) ==false	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423470_0]","LuaS_423470_PONPON_1",0)	--�ڤw�g��¾K�ĩ�n�F�C
		end
	end		
end

function LuaS_423469_PONPON_1()	
	SetSpeakDetail(OwnerID(),"[SC_423469_3]")--�A�˥�F�H���i�O�ڶO�F�@�f�ߤO�~�˨Ӫ��n�f�ڡI�A�˥�O�ǧڱq�A���S�Ҧ��@�I
	GiveBodyItem(OwnerID(),208098,1) 
end

--�I�����~��G
function Lua_423469_after()
	local NPC = SearchRangeNPC ( OwnerID() , 50 )
	for i=0,table.getn(NPC)-1 do
		if	ReadRoleValue(NPC[i],EM_RoleValue_OrgID) ==116157	then
			if	CheckAcceptQuest( OwnerID() , 423469) == true	and	CheckFlag( OwnerID() , 544334) ==false	then
				DelBodyItem(OwnerID(), 208099, 1 )
				SetFlag(OwnerID() , 544334, 1 )		
				return true
			end
		end	
	
		if	ReadRoleValue(NPC[i],EM_RoleValue_OrgID) ==116158	then
			if	CheckAcceptQuest( OwnerID() , 423469) == true	and	CheckFlag( OwnerID() , 544335) ==false	then
				WriteRoleValue( TargetID() , EM_RoleValue_Register+1 , 2 )
				DelBodyItem(OwnerID(), 208098, 1 )
				local WATER= LuaFunc_CreateObjByOBj(116160, TargetID() )				--�X�{�t�����g��116160
				DisableQuest( WATER, true )
				WriteRoleValue( WATER,EM_RoleValue_Register+2,OwnerID())				--�⪱�a�g�i�t����
				WriteRoleValue( WATER,EM_RoleValue_Register+3,TargetID())				--�����g�i�t����
				BeginPlot( WATER, "Lua_423469_end" , 0 )
				return true
			end
		end
	end
end

function Lua_423469_end()
--OwnerID �t����
	local QWATER = ReadRoleValue(OwnerID(),EM_RoleValue_Register+3)	
	if 	CheckAcceptQuest( TargetID() , 423469) == true		and
		GetDistance(TargetID(), OwnerID() ) < 250		and 
		ReadRoleValue(TargetID() ,EM_RoleValue_IsDead) == 0	then
		SetFlag(TargetID() , 544336, 1 )					--544336�P�_�Z����		
		AddBuff(TargetID() , 507473, 1 , 120 )  						
	end
	BeginPlot( OwnerID() , "LuaS_423469_Range_CHECK" , 0 )			--���t�����j���ˬd--���a���b�N�R���t����
	local WHITE = Lua_DW_CreateObj("flag" ,116161,780723,1,1)			--116161�դ��B�X�l�s��780723�B1
	DisableQuest(  WHITE , true )							--�}��NPC�Y�W�����ȴ��ܥH�ι�ܼ@��(true����)
	MoveToFlagEnabled( WHITE , false )
	WriteRoleValue(  WHITE ,EM_RoleValue_IsWalk , 1 )
	WriteRoleValue( WHITE,EM_RoleValue_Register+2,OwnerID())			--�⪱�a�g�i�t����
	WriteRoleValue(  WHITE,EM_RoleValue_Register+3,OwnerID())			--��t�����g�i�t���դ�
	BeginPlot(WHITE, "LuaS_423469_MO_CHECK" , 0 )	
	
	Yell( WHITE , "[SC_423469_5]" , 3 )						--�ܼ}�G���A�F...���F��......
	sleep(30)
	AddBuff(TargetID() , 507474 , 1 , 35 )  						--���a�Q�w��--��ʤ���505110
	ScriptMessage( TargetID(),TargetID(), 0,"[SC_423469_11]", 0 )
	ScriptMessage( TargetID(),TargetID(), 1,"[SC_423469_11]", 0 )			--�A�Q��M�X�{��[116155]�_��A�L�k���ʸ}�B�I

	Yell( WHITE , "[SC_423469_6]" , 3 )						--�ܼ}�G�~�ڤH�����D�A�ڭ֦̾��ѯ}�����������A�ۺٰe�f...�a�۴c�N�e�Ӫ��A...�Բӻ��X�p�w�d�H���N�ϧa�I
	DisableQuest(  WHITE , false)	
	local Time = 0
		for i = 1, 40 , 1 do							--�ɶ���N�R����lNPC�A�^�_�쪬
		Time = Time + 1

			if	Time>30		then
				WriteRoleValue( QWATER  , EM_RoleValue_Register+1 , 0 )
				DelObj (OwnerID())
				if	CheckBuff( TargetID() , 507473) == true	then
					CancelBuff( TargetID() , 507473)  
				end
				if	CheckBuff( TargetID() , 507474 ) == true	then
					CancelBuff( TargetID() , 507474 )  
				end	
				ScriptMessage( TargetID() , TargetID(), 1 , "[SC_423469_10]" , 0 )	--�W�L�ɶ��A���ȥ��ѡI
				break
			end
			if	CheckFlag( TargetID() , 544335 ) == true 	then
				WriteRoleValue( QWATER  , EM_RoleValue_Register+1 , 0 )
				Delobj( OwnerID() )
				break		
			end
		sleep(10)
		end
end
	
function LuaS_423469_WHITE_0()--�ܼ}���W����ܼ@��
	LoadQuestOption( OwnerID() )
	if	(CheckAcceptQuest(OwnerID(),423469)==true )and( CheckCompleteQuest( OwnerID(),423469)==false) 	then
		if 	CheckFlag( OwnerID()  , 544335) == false	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423469_9]","LuaS_423469_WHITE_1",0)	--�]�i�D�L�걡�C�^
		end	
	end		
end

function LuaS_423469_WHITE_1()
	SetSpeakDetail(OwnerID(),"[SC_423469_7]")--���I�p�w�d�H�ߦa���}�B�L�p�^�m�H�o�u�O�@�ӭȱo�d�_�����ܡC
					--�p�w�d�H�u���X�F�W���O���I�B���B�A����ͩR�B�����u�ݱo���Q�q�A�L�̬O�s�Q�ڭ̺٬��u�B�͡v����泣�S�����رڡC
					--�ܼ}���H�ժ��Z�O���ӡA�]�P�˾ժ�����F�N�A��I�u�����æb�I�᪺�p�H...�N�p�N�p...��Z�O��e���O�L�̧Ҽ��C
					--�P�L�̦P�٪��A...��ܧa�A�[�J�ڪ��ϵ��p�e�A�n�Τ��n...
					--�ڻ{���A���ץu���@�ӡC
	
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423469_8]","LuaS_423469_WHITE_2",0)	--�n�C
end
	
function LuaS_423469_WHITE_2()	
	closespeak(OwnerID())
	if	CheckAcceptQuest( OwnerID(), 423469) == true	and
		CheckFlag( OwnerID(), 544336) == true		then
		CancelBuff( OwnerID(), 507474 )
		CancelBuff( OwnerID(), 507473 )
		SetFlag(OwnerID(), 544335, 1 )
	end
end

function LuaS_423469_Range_CHECK()
	local QWATER = ReadRoleValue(OwnerID(),EM_RoleValue_Register+3)	
	local play  = ReadRoleValue(OwnerID(),EM_RoleValue_Register+2)	
	local Num
	for i = 0 , 60 , 1 do
		Num = 0
			if	CheckAcceptQuest( play, 423469) == true	and
				CheckFlag( play , 544336) == true		then
				Num = Num + 1
			end
		if	Num == 0		then
			break
		end
		sleep(20)
	end
	writerolevalue(QWATER, EM_RoleValue_Register+1, 0 )
	Delobj( OwnerID() )
end

function LuaS_423469_Player_CHECK()
	if	(CheckAcceptQuest(OwnerID(),423469)==false )	then
		if 	CheckBuff( OwnerID(), 507473) == true	then
			CancelBuff( OwnerID() , 507473)  
		end
		if 	CheckBuff( OwnerID(), 507474 ) == true	then
			CancelBuff( OwnerID() , 507474 )  
		end
		return false
	end
	local WATER= {}
	WATER= SearchRangeNPC(OwnerID() , 250)
	for i=0,table.getn(WATER)-1 do
		if	ReadRoleValue(WATER[i] , EM_RoleValue_OrgID) == 116158	then
			return false
		end
		if	i == table.getn(WATER)	then
			return true
		end
	end
end

function LuaS_423469_Player_CHECK_FINAL()
	CancelBuff( OwnerID() , 507473 )
	ScriptMessage(OwnerID() , OwnerID() , 2 , "[SC_423177_10]" , 0 )	--�Z���ӻ��A���ȥ��ѡI
	ScriptMessage( OwnerID() , OwnerID(), 0 , "[SC_423177_10]" , 0 )
	SetFlag(OwnerID() , 544336, 0 )
end

function LuaS_423469_MO_CHECK()	
	local WATER = ReadRoleValue(OwnerID(),EM_RoleValue_Register+3)		--�t����
	for i = 0 , 60 , 1 do
		if	CheckID(WATER) == false	then
			break
		end
		sleep( 20 )
	end
	Delobj( OwnerID() )
end

---------423470
--function LuaS_423470_PONPON()
--	if	(CheckAcceptQuest(OwnerID(),423470)==true )and( CheckCompleteQuest( OwnerID(),423470)==false) 	then
--		if	CheckFlag( OwnerID() , 544337) ==false	then
--			AddSpeakOption(OwnerID(),TargetID(),"[SC_423470_0]","LuaS_423470_PONPON_1",0)	--�ڤw�g��¾K�ĩ�n�F�C
--		end
--	end	
--end

function LuaS_423470_PONPON_1()	
	closespeak(OwnerID())
	SetFlag(OwnerID()  , 544337, 1 )
	BeginPlot(TargetID() , "LuaS_423470_PONPON_2" , 0 )	
end	
	
function LuaS_423470_PONPON_2()	
	AddBuff(TargetID() , 507539, 1 , 15 )  	
	local PONPON= LuaFunc_CreateObjByOBj(116163, OwnerID() )			--�X�{�t�������d116163
	AddToPartition( PONPON , 0 )
	WriteRoleValue(  PONPON ,EM_RoleValue_IsWalk , 1 )
	MoveToFlagEnabled( PONPON , false )
	DisableQuest( PONPON, true )
	sleep(10)
	Yell( PONPON , "[SC_423470_1]" , 3 )						--�@�I���o�����A���U�ӴN���쵽�}���p�w�d�H�n���ա�
	sleep(10)
	LuaFunc_MoveToFlag(PONPON, 780723,2,0)
	Yell( PONPON , "[SC_423470_2]" , 3 )						--�A�n��W�ڪ��}�B�A���ٻݭn�A�O�I
	LuaFunc_MoveToFlag(PONPON, 780723,3,0)
	SetFlag(TargetID() , 544339, 1 )						--544339���d���i���P�_�P�_
	DelObj (PONPON)	
	CancelBuff( TargetID() , 507539)  
end

--------------------423472
function LuaS_423472_PONPON()	--�V���d���U�l
	LoadQuestOption( OwnerID() )
	if	(CheckAcceptQuest(OwnerID(),423472)==true )and( CheckCompleteQuest( OwnerID(),423472)==false) 	then
		if	CheckFlag( OwnerID() , 544338) ==false	then
			if	CountBodyItem(OwnerID(),208168) < 1		then
				AddSpeakOption(OwnerID(),TargetID(),"[SC_423472_0]","LuaS_423472_PONPON_1",0)	--�A���n���ڹS�ҡC
			end
		end
	end		
end

function LuaS_423472_PONPON_1()	
	SetSpeakDetail(OwnerID(),"[SC_423472_1]")--��...���@��[208168]�A�M�w�F�I�o���٨S�T�{�L�������ݩ�A�A�H�K�A���B�m�C���L�A�n�b�ڮ��䥴�}�A�ڤ]�Q�ݬݸ��Y�ˤF�����
	GiveBodyItem(OwnerID(),208168,1) 
end

--�ϥΪ��~�e�ˬd
function LuaS_423472_208168_1()	
	local NPC = {}

	if	CheckAcceptQuest( OwnerID() , 423472) == true	and	CheckFlag( OwnerID() , 544338) ==false	then
		 NPC = SearchRangeNPC ( OwnerID() , 250 )
		for i=0,table.getn(NPC) do
			if	ReadRoleValue(NPC[i],EM_RoleValue_OrgID) ==116170	then
				return true 
			end
			if	i==table.getn(NPC)	then
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_423472_2]" , 0 ) --�A�����b���d.�β����񥴶}�C
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_423472_2]" , 0 ) 
				return false
			end
		end
	else
	return false 
	end
end

--�ϥΪ��~��
function LuaS_423472_208168_2()
	UseItemDestroy() -- �R���ϥΤ���
	BeginPlot( TargetID() , "LuaS_423472_208168_3" , 0 )
end
function LuaS_423472_208168_3()
	AddBuff(TargetID() , 507540, 1 , 20 )  
	local NPC = SearchRangeNPC ( OwnerID() , 250 )
		for i=0,table.getn(NPC)-1 do
			if  ReadRoleValue(NPC[i],EM_RoleValue_OrgID) ==116171	then
				return flase
			end
		end
	local PON = Lua_DW_CreateObj("flag",116171 ,780723,4 )
	MoveToFlagEnabled( PON , false )
	DisableQuest(  PON  , false)	
	WriteRoleValue( PON ,EM_RoleValue_IsWalk , 1 )
	CastSpell( PON , PON ,  496128 )							--�I�k�z��496128--494226�Ϲ�
	ScriptMessage( TargetID() , TargetID() , 2 , "[SC_423472_3]" , 0 ) 				--�F���n�q���d.�β��˵����c�l�Ǩ�......
	ScriptMessage( TargetID() , TargetID() , 0 , "[SC_423472_3]" , 0 ) 
	sleep(20)
	Yell( PON , "[SC_423472_4]" , 3 )							--���d�G�y�B�y�I�A���y�I			
	sleep(20)
	Yell( PON , "[SC_423472_5]" , 3 )							--���d�G�d����H
	sleep(10)
	if	CheckID( TargetID() ) == true then							--���X��
		SetFlag( TargetID() , 544338 , 1 )
	end
	DelObj (PON)
	CancelBuff( TargetID() , 507540)  
end

