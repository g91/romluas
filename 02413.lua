function LuaQ_dr424300_01()
	local O_ID=OwnerID()
	local T_ID=TargetID()
	if 	ReadRoleValue(T_ID,EM_RoleValue_OrgID)==105668 and
		(ReadRoleValue(T_ID,EM_RoleValue_HP)/ReadRoleValue(T_ID,EM_RoleValue_MaxHP))>0.4  then
		ScriptMessage(O_ID,O_ID,1,"[SC_424317_02]",0)					--�o���ͪ��A�ͩR�O�٤ӹL�j���L�k�����I
		return false
		elseif 	ReadRoleValue(T_ID,EM_RoleValue_OrgID)==105668 and
			(ReadRoleValue(T_ID,EM_RoleValue_HP)/ReadRoleValue(T_ID,EM_RoleValue_MaxHP))<=0.4 then
			ScriptMessage(O_ID,O_ID,1,"[SC_424317_03]",0)				--�o���ͪ��A�g�L�X�f�ä��٬O�Q�A�����F�I
			return true
		elseif 	ReadRoleValue(T_ID,EM_RoleValue_OrgID)==105668 and
			ReadRoleValue(T_ID,EM_RoleValue_IsDead)==true then
			return false
		else 
			ScriptMessage(O_ID,O_ID,1,"[SC_424300_01]",0)			 	--�o�u���[105668]�ϥΡI
			return false
	end
end

function LuaQ_dr424300_02()
	local O_ID=OwnerID()
	local T_ID=TargetID()
	if CheckAcceptQuest(O_ID,424300)==true and 
		ReadRoleValue(T_ID,EM_RoleValue_OrgID)==105668 then
		CallPlot( T_ID, "LuaFunc_ResetObj",T_ID )
		GiveBodyItem(O_ID,240209,1)
		
	end
end


function LuaS_dr424309_01()						--424309�ѵ�
	local O_ID=OwnerID()
	local T_ID=TargetID()
	LoadQuestOption(O_ID)
	if CheckAcceptQuest(O_ID,424309)==true then
	AddSpeakOption(O_ID,T_ID,"[SC_424309_01]","LuaS_dr424309_02",0)   	--<��D�A�H���Ʊ�z�त��Ԫ��A�X�ϻ�D��|ĳ>
	else
	LoadQuestOption(O_ID)
	end
end

function LuaS_dr424309_02()
	local O_ID=OwnerID()
	local T_ID=TargetID()
	SetSpeakDetail(O_ID,"[SC_424309_02]")				--���M�ڤ���F�w�~�J�D�ը����_�کҵo�G���x�Ʀ��...
	AddSpeakOption(O_ID,T_ID,"[SC_424309_03]","LuaS_dr424309_03",0)	--<�i�O�A��D�I�ڵL�N�_�ǡA���b�ݹL���ǫH���A���Ӧ��������Ҿڥh�ҹ�A�o�Ʊ��I��֩w�����D�I>
end

function LuaS_dr424309_03()
	local O_ID=OwnerID()
	local T_ID=TargetID()
	SetSpeakDetail(O_ID,"[SC_424309_04]")				--�i���U�A�n�ھ̳o�X�i�N�����Y�����H��...
	GiveBodyItem(O_ID,545119,1)
end

function LuaS_dr424310_01()
	local O_ID=OwnerID()
	local T_ID=TargetID()
	LoadQuestOption(O_ID)
	if CheckAcceptQuest(O_ID,424310)==true 
	and CountBodyItem(O_ID,240287)==0	then
	AddSpeakOption(O_ID,T_ID,"[SC_424310_01]","LuaS_dr424310_02",0)  	 --<�аݯ�ɧ�[240287]��?>
	else
	LoadQuestOption(O_ID)
	end
end

function LuaS_dr424310_02()
	local O_ID=OwnerID()
	local T_ID=TargetID()
	SetSpeakDetail(O_ID,"[SC_424310_02]")				--�ڥ��n���h���A�ϥ��o�Ӥ]���a�F���ܴN�e�A�a�I
	GiveBodyItem(O_ID,240287,1)
end

function LuaQ_dr424311_01()										--�ԯǮ�424311��
	local own=OwnerID()
	local tar = TargetID()
	local Atable={}
	Atable=SearchRangeNPC(own,100)
	local ZNum=0
	for i = 0,table.getn(Atable),1 do
		local Z=ReadRoleValue(Atable[i],EM_RoleValue_OrgID)
		if Z==118309 then
			ZNum = ZNum+1
		end
	end
	if  ZNum~=0 then
		return true
	else
	ScriptMessage( own, own , 2 ,"[SC_424311_01]" , 0 )						--�o�k���٬O��[118773]�n���Χa�I	
		return false
	end
end

function LuaQ_dr424311_02()
	local own=OwnerID()
	ScriptMessage(own,own,1,"[SC_424311_11]",0)
	CastSpell(own,own,497927)
end

function LuaQ_dr424311_03()
	local O_ID=OwnerID()
	local T_ID=TargetID()
	LoadQuestOption(O_ID)
	if CheckBuff(O_ID,620174)==true and CheckAcceptQuest(O_ID,424311)==true then
		AddSpeakOption(O_ID,T_ID,"[SC_424311_02]","LuaQ_dr424311_04",0)   		--�ڤw���D�ϥΤF[620174]�A�A�i�H��ߪ����A�ڷ|��U�A���I
		local Atable={}
        		 Atable=SearchRangePlayer(T_ID,80)
			for i=0,table.getn(Atable),1 do
				if CheckAcceptQuest(Atable[i],424311)==true then
			CloseSpeak(Atable[i])
			end
		end

	else
		LoadQuestOption(O_ID)
	end
end

function LuaQ_dr424311_04()
		local own=OwnerID()
		local tar=TargetID()
		DisableQuest( Tar, true ) 
		AddBuff(own,620113,0,26)
		CloseSpeak(own)
		callplot(Tar,"LuaQ_dr424311_07",Tar)
		BeginPlot(own,"LuaQ_dr424311_05",0)
		BeginPlot(own,"LuaQ_dr424311_06",0)
end

function LuaQ_dr424311_07(T_ID)
		local own=OwnerID()
		local tar=TargetID()
		sleep(250)
		DisableQuest( T_ID, false)
end

function LuaQ_dr424311_05()
	local  Aman =Lua_DW_CreateObj( "flag" ,118828,  780950  , 9 , 1 , 1 )		
	DW_MoveDirectToFlag( Aman ,  780950  , 10 , 1  )
	PlayMotion(Aman,112)
	sleep(70)
	say(Aman ,"[SC_424311_04]")						--[118827]�I�S�ϡI�o�O���^�ơI�^��...�I
	sleep(30)
	PlayMotion(Aman,101)	
	say(Aman ,"[SC_424311_06]")						--�Z�����z�A�O���O���Ǵc�r[SC_ZONE20_01]�I�J�M�p���A�N�����������h���A�Q�^���D���I
	sleep(30)
	PlayMotion(Aman,112)
	say(Aman ,"[SC_424311_08]")						--���u������쩳�O�֡I
	Sleep(70)
	say(Aman ,"[SC_424311_10]")
	PlayMotion(Aman,105)						
	DW_MoveDirectToFlag( Aman ,  780950  , 12 , 1  )				
	Sleep(50)
	DelObj(Aman)
end

function LuaQ_dr424311_06()
		local own=ownerID()
		local tar=TargetID()
		local Aghost=Lua_DW_CreateObj( "flag" ,118827,  780950  , 7 , 1 , 1 )
		DW_MoveDirectToFlag( Aghost  , 780950 , 8 , 1  )
		sleep(40)
		npcsay(Aghost ,"[SC_424311_03]")						--���ˡA�藍�_�A�h���S�ϡA�ש���A���ܤF�I
		--npcsay(own,"[SC_424311_03]")
		sleep(40)
		npcsay(Aghost ,"[SC_424311_05]")						--���ˡI����o���Ԫ��a�I�ڪ����I�T��O���H�b�I��ާˡI
		--npcsay(own,"[SC_424311_05]")
		sleep(40)
		npcsay(Aghost ,"[SC_424311_07]")						--���I���O�o�˪��I�����`�ڪ��O�Q�ޱ���SC_ZONE20_01]����I�����藍�O[SC_ZONE20_01]�D�Ϫ��I
		--npcsay(own,"[SC_424311_07]")
		sleep(40)
		npcsay(Aghost ,"[SC_424311_09]")						--�o�N�n���U�S�Ϥj�H�h�լd�F�I���ˡA�ڤ��@�A����A���ڪ������L�A�ҥH�ШD�A�@�w�n��U�S�ϡI���X����u���I�o�˧ڤ~��w��...
		--npcsay(own,"[SC_424311_09]")
		sleep(40)
		DW_MoveDirectToFlag( Aghost ,  780950  , 11 , 1  )
		Sleep(50)
		DelObj(Aghost)
		if CheckAcceptQuest(own,424311)==true then
		GiveBodyItem(own,545083,1)
		end
end

function LuaQ_DRBBQ_01()--Ĳ�I�@��							--424299(���\�@�yBBQ����)
	SetCursorType( OwnerID() , 13)
	SetPlot( OwnerID(),"touch","LuaQ_DRBBQ_02",30 )

end

function LuaQ_DRBBQ_02()
	local O_ID = OwnerID() 	-- ���a
	local T_ID = TargetID()  	-- NPC

	DW_CancelTypeBuff(68,O_ID)
	
	--�P�_���S������
	--�P�_���S�����~
	--�P�_�����S��
	if 	checkAcceptQuest(O_ID,424299)==true and
		countbodyitem(O_ID,240298)>0 then
		WriteRoleValue(T_ID,EM_RoleValue_Register9,9)
		DelBodyItem( O_ID, 240298, 1 )						--�ϥΫᦩ1
		ScriptMessage( O_ID, O_ID, 1,"[SC_COOKING_05]", 0 )
		CallPlot(T_ID,"LuaQ_DRBBQ_04",T_ID)
		if 	BeginCastBarEvent( O_ID, T_ID,"[SC_COOKING_01]", 80, 148, 150, 0, "LuaQ_DRBBQ_03" ) ~= 1 then
				ScriptMessage( O_ID, O_ID, 0,"[SAY_NPC_BUSY]", 0 );		--�ؼЦ��L��
				ScriptMessage( O_ID, O_ID, 2,"[SAY_NPC_BUSY]", 0 );		--�ؼЦ��L��
		end
	else 
		ScriptMessage( O_ID, O_ID, 0,"[SYS_GAMEMSGEVENT_422]", 0 )
		return
	end
end

function LuaQ_DRBBQ_03(ObjID, CheckStatus)
	local O_ID = OwnerID() 	-- ���a
	local T_ID = TargetID()  	-- NPC
	EndCastBar( O_ID, CheckStatus )
	WriteRoleValue(T_ID,EM_RoleValue_Register9,0)
		Sleep(10)
	local num=ReadRoleValue(T_ID,EM_RoleValue_Register10)
		if( CheckStatus ~= 0 ) then
			if num <= 40 then
				ScriptMessage( O_ID, O_ID, 1,"[SC_COOKING_02]", 0 );
				GiveBodyItem(O_ID,240206,1)
			elseif num <=60 then
				ScriptMessage( O_ID, O_ID, 2,"[SC_COOKING_03]", 0 );
				GiveBodyItem(O_ID,240207,1)
			else
				ScriptMessage( O_ID, O_ID, 1,"[SC_COOKING_04]", 0 );
				GiveBodyItem(O_ID,240208,1)
			end
		else
			-- ����
			EndCastBar( O_ID, CheckStatus )
		end
	WriteRoleValue(T_ID,EM_RoleValue_Register10,0)
end

function LuaQ_DRBBQ_04(T_ID)
	for i=1,80,1 do
		local x=ReadRoleValue(T_ID,EM_RoleValue_Register9)
			if x==0 then
				return
			end
		Sleep(1)
		local y=i%10
			if y==0 then
				WriteRoleValue(T_ID,EM_RoleValue_Register10,i)
			end
		--Say(T_ID,y..","..i)
	end
	return			
end

function LuaQ_dr424300_05()							--�J����424300�������t
		local Agirl=Lua_DW_CreateObj( "flag" ,118834,  780950  , 13 , 1 , 1 )
		DW_MoveDirectToFlag( Agirl  , 780950 , 14 , 1  )
		AddBuff(ownerID(),620113,0,6)
		Say(Agirl,"[SC_423221_13]")
		sleep(40)
		DelObj(Agirl)
end