
function LuaS_205672_0()	--422678 ��ê�H�U�O�H
	if	CheckAcceptQuest( OwnerID() , 422678 ) == true then
		if CheckFlag( OwnerID() , 543005 ) == true then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_205672_1]" , 0 ) --�A�w�g�j�[�F�@�W[102494]�A�X�L�Q��k�k�椧�e�ֱa�^�h[113458]���̡C
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_205672_1]" , 0 ) 
			return false
		end

		if	ReadRoleValue( TargetID(), EM_RoleValue_IsDead) == 1 then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422202_4]" , 0 ) --�ؼФw�g���F�C
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422202_4]" , 0 )
		return false
	end

		local sole =  LuaFunc_SearchNPCbyOrgID( OwnerID() , 102494 , 50 )
		if Type(sole) == "number" and CheckID(sole) == false then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_205672_2]" , 0 ) --�A����������[102494]�~��ϥ�[205672]
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_205672_2]" , 0 ) 
			return false 
		end

		if	ReadRoleValue(TargetID(),EM_RoleValue_HP)/ReadRoleValue(TargetID(),EM_RoleValue_MaxHP)	> 0.5	then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_101614_2]" ,  C_SYSTEM )
			return false
		else			
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_205672_3]" , 0 ) --[102494]�y�L�ܱo�I�z�A�o�O�@�Ӹj�[�L���n�ɾ��I
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_205672_3]" , 0 ) 
			return true
		end
	end
			return false 
end


function LuaS_205672_1()
	BeginPlot( TargetID() , "LuaS_205672_2" , 0 )
end
function LuaS_205672_2()
	say(OwnerID(),"[SC_205672_4]")	--��}�ڡI�I�A�O���Ӫ��H
	sleep(20)	
	say(OwnerID(),"[SC_205672_5]")	--ĵ�i�A�̦n�O�I�ڡ���ڡI�����
	sleep(10)
	if CheckID( TargetID() ) == true then
		SetFlag( TargetID() , 543005 , 1 )
	end
	LuaFunc_ResetObj( OwnerID() )
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--422679�˺ɭG�f
--�ϥκX�l�G780293  1-2

function LuaS_422679()  
	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),422679)==true )and( CheckCompleteQuest( OwnerID(),422679)==false) 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422679_0]","LuaS_422679_1",0) --���a�A�A�̦b������H
	end
end

function LuaS_422679_1()
	SetSpeakDetail(OwnerID(),"[SC_422679_1]")				--�ڬ�����n�i�D�A�A�A�쩳�O�q���̨Ӫ��H�T����Q�ʦ�...��Ԩ��󤣥i���...
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422679_2]","LuaS_422679_2",0)	--�A�i�H��ܤ����A�ڤ����N�Τ@�ǿE�P��q...
end

function LuaS_422679_2()  
	SetSpeakDetail(OwnerID(),"[SC_422679_3]")				--�c...�p�G�A�⥦�̥Φb�ڨ��W...���A�@�w�O�ƤF...
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422679_4]","LuaS_422679_3",0)	--1�A�i�H�D�Ԭݬݧڪ����u�C	 
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422679_5]","LuaS_422679_3",0)	--2.�O�ڡ�ڨS����ơ�
end

function LuaS_422679_3()  
	SetSpeakDetail(OwnerID(),"[SC_422679_6]")				--�ޡI�U�A�O�x�A�̦n�O���֩�ڨ�
	BeginPlot( TargetID(), "LuaS_422679_4", 0 )
end


function LuaS_422679_7()	--���b���p���y��l�@��
	local MIDI = Lua_DW_CreateObj("flag" ,113489,780293,1 )	--���p���y�X�ͻs�y�K�f��
	WriteRoleValue ( OwnerID() , EM_RoleValue_PID,MIDI  )	--�NOwnerID()<���p���y>�g�iMIDI�K�f���
	WriteRoleValue ( MIDI  , EM_RoleValue_PID, OwnerID())
end

function LuaS_422679_4()  
		Local BBS= ReadRoleValue(OwnerID(),EM_RoleValue_PID)
		tell(TargetID(),BBS,"[SC_422679_7]")			 	--�O�A��L�o�ܤF�A�A��c�l�H�K���@�ˤu��C
		sleep(20)	
		tell(TargetID(),BBS,"[SC_422679_8]")				--���n��ڻ��@�n�A�ڨӨ��L�C
		
end


function LuaS_422679_8() 
	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),422679)==true ) then
		if  CountBodyItem( OwnerID(), 205762)<1 or CountBodyItem( OwnerID(), 205761)<1 then
			if  CountBodyItem( OwnerID(), 205965)>0 or CountBodyItem( OwnerID(), 205966)>0 or CountBodyItem( OwnerID(), 205967)>0  then
				AddSpeakOption(OwnerID(),TargetID(),"[SC_422679_9]","LuaS_422679_9",0)	--�n�F�A�}�l�a��		
			end
		end
	end
end

function LuaS_422679_9()
	CloseSpeak( OwnerID() )
	if	 CountBodyItem( OwnerID(), 205965)>0	 then 
		DelBodyItem( OwnerID(), 205965, 1 )
	elseif	 CountBodyItem( OwnerID(), 205966)>0 	then
		delBodyItem( OwnerID(), 205966, 1 ) 
	elseif	CountBodyItem( OwnerID(), 205967)>0 	then
		DelBodyItem( OwnerID(), 205967, 1 )
	end	
	DisableQuest( TargetID() , true)
	say(TargetID(),"[SC_422679_13]")					--��I�ǳƤW�F�I
	BeginPlot( TargetID(), "LuaS_422679_10", 0 )
	
end

function LuaS_422679_10() 
	MoveToFlagEnabled( OwnerID(), true )
	LuaFunc_MoveToFlag(OwnerID() , 780293, 2 , 0 )
	CastSpell( OwnerID(), OwnerID(), 492671)	--�I�k�S��
	Local SOLE= ReadRoleValue(OwnerID(), EM_RoleValue_PID)
	say( SOLE,"[SC_422679_10]")				--...������H�A�̷Q...���B���B���I�ڻ{��I�O���B�O���ڡI�S�B�S�B�S��
	sleep(30)
	say( SOLE,"[SC_422679_11]")				--���L�N�O�Q���D�ڭ̦b�F����O�a�H�ڻ��N�O�F...����´��R�o�ئY�O���Q�n���Ƥ��A�X�ڰ�...
	sleep(40)
	say( SOLE,"[SC_422679_12]")				--�ȵ����ӡ�ڥμg���A�O�A�a��ڤF�I
--	if CheckID( TargetID() ) == true then
--		SetFlag( TargetID() , 543351 , 1 )
--	end
	sleep(20)
	WriteRoleValue(  OwnerID(), EM_RoleValue_IsWalk , 1 )--�Ψ���
	LuaFunc_MoveToFlag(OwnerID(), 780293, 1, 0 )
	if CheckID( TargetID() ) == true then
		if CountItem( TargetID(), 205762)<1 then
			GiveBodyItem( TargetID(),205762, 1 )
		end
		
		if CountItem( TargetID(), 205761)<1 then
			GiveBodyItem( TargetID(),205761, 1 )
		end
	end
	DisableQuest( OwnerID() , false)
end

function LuaS_422679_11()	
	if (CheckAcceptQuest(OwnerID(),422679)==true )and( CheckCompleteQuest( OwnerID(),422679)==false) 	then
		local R = Rand( 100 ) + 1
		if R >= 0 and R < 33	then
		GiveBodyItem( OwnerID(), 205965, 1 )
		return true
		end

		if R >= 34 and R < 66	then
		GiveBodyItem( OwnerID(), 205966, 1 )
		return true
		end

		if R >= 67 and R < 100	then
		GiveBodyItem( OwnerID(), 205967, 1 )
		return true
		end
	end
end


--------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ���� 422681���u�t��

function LuaS_422681_0()	--�����˹��
	if CheckBuff( OwnerID() , 504317 ) == true or CheckCompleteQuest( OwnerID() , 422681 ) == true then
		LoadQuestOption(OwnerID())
	else
		SetSpeakDetail( OwnerID(),  "[SC_422681_0]" ) --(���e��ۯ��p���y�A�����H���A���X�{���G�]��Y�Ӯ̰ʨ��ΡC)
	end
end


function LuaI_205760_Check()	--���b���p���y�A��

	if CheckBuff( OwnerID() , 504317 ) == true then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_205760_0]" , 0 ) --�A�w�g���˦����p���y������
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_205760_0]" , 0 ) 
		return false
	end

	if ReadRoleValue( OwnerID() , EM_RoleValue_IsAttackMode ) ~= 0 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_205426_1]" , 0 ) --�A���b�԰��I
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_205426_1]" , 0 ) 
		return false
	end

	local X = ReadRoleValue( OwnerID() , EM_RoleValue_X )
	local Y = ReadRoleValue( OwnerID() , EM_RoleValue_Y )
	local Z = ReadRoleValue( OwnerID() , EM_RoleValue_Z )

	if CheckMapID(  X ,Y ,Z , 717 ) == false  then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_205760_1]" , 0 ) --�����a��[ZONE_THE MOLTEN BRIDGE]���񪺶³D��a�ϥ�
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_205760_1]" , 0 ) 
		return false
	end
end


function Lua_ObjAreaCheck_504318_0() --���˰����a�I
	if	Lua_ObjAreaCheck(OwnerID() , 717 ) ==false  then
		CancelBuff_NoEvent( OwnerID() , 504317 )
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_205760_1]", 0 ) --�����b����[ZONE_THE MOLTEN BRIDGE]����ʤ��ϥ�
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_205760_1]", 0 )
	end
end


--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--����422682 �B�~����

function LuaS_422682_6()
	if  CheckAcceptQuest(TargetID(),422682)==true then
		if	CountBodyItem( TargetID(), 205760 )<1	then
		GiveBodyItem( TargetID(), 205760, 1 )
		end
	end
end

function LuaS_422682_0()	--�I�����~��
	if  CheckAcceptQuest(OwnerID(),422682)==true and CountBodyItem( OwnerID(),205920)>0 then	
 		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422682_7]" , 0 ) 	--�A�w�g����@��[205920]�A�i�H�h��̿ռw�F
		return 1
	end

	if CheckBuff( OwnerID() , 504317 ) == false and CheckAcceptQuest(OwnerID(),422682)==true and CountBodyItem( OwnerID(),205920)<1 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422682_3]" , 0 ) --�A�Q�s���o���|�ʤް_�D�H�`�N�I���G���@�s���޶���o�̾a��I�I
		ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_422682_4]" , 0 ) --�o��Q�c�c�T�w�ۡC
		--local boss == Lua_DW_CreateObj("flag" ,113567,780298,1 )
		return 1
	end
	if CheckBuff( OwnerID() , 504317 ) == true and CheckAcceptQuest(OwnerID(),422682)==true and CountBodyItem( OwnerID(),205920)<1  then
		ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_422682_0]" , 0 ) --�H�l���o���b�g�̡A�A���H�w�C�t�׷h�ʵ�......
		local FOE = Lua_DW_CreateObj("flag" ,113567,780298,1 )
		WriteRoleValue ( OwnerID() , EM_RoleValue_PID,FOE   )	
		WriteRoleValue ( FOE  , EM_RoleValue_PID, OwnerID())	--�NOwnerID()<���a>�g�iFOE�D�H��
		BeginPlot(FOE,"LuaS_422682_1", 0 )	
		BeginPlot(TargetID(),"LuaS_422682_5", 0 )	
		return 1
	end
	return -1
end

function LuaS_422682_1()
	WriteRoleValue( OwnerID(),EM_RoleValue_IsWalk , 1 )--�]�Ψ����^
	DW_MoveToFlag(OwnerID(), 780298, 2 , 0 ,1)
	Say(OwnerID(),"[SC_422682_1]")		--�ݬݳo�å�㤣���O������~���{�������Y��´�㨺�ӯ��p���y���H�ܡH
	sleep(40)
	Local NPC= ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	GiveBodyItem( NPC,205920, 1 )
	Say(OwnerID(),"[SC_422682_2]")		--�h�Ӫo��o�򨯭W�ڡH�s���W�u���ܮz�㫢��������L�٤�A�j�A�ܤ֥L�̫��q�t�ק֦h�F��
	sleep(30)
	Say(OwnerID(),"[SC_422682_6]")		--�����L�٤�A�j�A�ܤ֥L�̫��q�t�ק֦h�F��
	WriteRoleValue( OwnerID(),EM_RoleValue_IsWalk , 1 )--�]�Ψ����^
	sleep(20)

	DW_MoveToFlag(OwnerID(), 780298, 3 , 0 ,1)
	DelObj (OwnerID())
end

function LuaS_422682_5()
	SetPlot( OwnerID() , "touch" , "LuaFunc_Obj_BUSY" , 40 )
	for i = 1, 30 , 1 do
		if  CheckID( TargetID()) == false	then
			break
		end
		if  CountBodyItem( TargetID(), 205920) > 0	then
			Hide( OwnerID() )
			sleep(150)
			Show(OwnerID() , 0)
			break
		end
		sleep(10)
	end
	SetPlot( OwnerID() , "touch" , "" , 0 )
end


function LuaS_422682_2()	--��b�٥��ȫ�
	tell(TargetID(),OwnerID(),"[SC_422682_5]")	--�ӡ�ڨ��W�ѤU�o�������Ĥ��A�A���h�Ρ㦬�n�B���n�A�O�Q���ު��D�H�ݨ��F�C
	GiveBodyItem( TargetID(),200274, 5 )
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--���K���

function LuaS_113516_0()
	if CheckAcceptQuest(OwnerID(),422683)==true and CountItem( OwnerID(), 205920) == 0 and  CheckFlag( OwnerID(),543006) ==false then
		ScriptMessage( OwnerID() , OwnerID(), 2, "[SC_422683_1]" , 0 ) --�A�����֦��@��[205920]
		return -1	--�������_���X��-1
	end
	if CheckAcceptQuest(OwnerID(),422683)==true and  CheckFlag( OwnerID(),543006) ==true and  CheckFlag( OwnerID(),543007) ==false then 	
		ScriptMessage( OwnerID() , OwnerID(), 2, "[SC_422683_3]" , 0 ) --�A�w�N����������A���ֵo�g��ϵ��q��[113487]
		return -1	--�������_���X��-1
	end
	return 1
end

function LuaS_205921_0()
	if( CheckFlag( OwnerID(),543007) ==true) or (CheckCompleteQuest(OwnerID(),422683)==true) then			
		ScriptMessage( OwnerID() , OwnerID(), 2, "[SC_422591_0]" , 0 ) 	--�A�{�b���ݭn�ϥΦ����~
		return false
	end
	if( CheckFlag( OwnerID(),543006) ==false) and( CheckFlag( OwnerID(),543007) ==false)and (CheckCompleteQuest(OwnerID(),422683)==false) then		
		ScriptMessage( OwnerID() , OwnerID(), 2, "[SC_422683_0]" , 0 )	 --�A�������N������
		return false
	end
	if( CheckFlag( OwnerID(),543006) ==true) and( CheckFlag( OwnerID(),543007) ==false) and (CheckCompleteQuest(OwnerID(),422683)==false) then	
		BeginPlot( OwnerID(), "LuaS_205921_1",0 )
	end

end

function LuaS_205921_1()
	CastSpell( OwnerID(), OwnerID(), 494274 )
	sleep(30)
	ScriptMessage( OwnerID() , OwnerID(), 1, "[SC_422683_2]" , 0 )	 --��ϵo�g���X���⩷�u��b��a�t�@�䪺[113487]�]�H��Ϧ^����
	SetFlag( OwnerID() , 543007 , 1 )
end


function LuaS_422683_0()
	if CheckAcceptQuest(OwnerID(),422683)==true and CountBodyItem(OwnerID(), 205920)>0 and CheckFlag( OwnerID(),543006) ==false then
	--	CastSpell( TargetID(), TargetID(), 494274 )
		AddBuff(TargetID() , 503605 , 1 , 10 )	
		DelBodyItem( OwnerID(), 205920, 1 )
		SetFlag( OwnerID() , 543006 , 1 )
		return 1
	end
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--���D�˽ö� �X�l780354 1-2

function LuaS_422687_0()	
		LoadQuestOption(OwnerID())	
	if 	(CheckAcceptQuest(OwnerID(),422687)==true )and( CheckCompleteQuest( OwnerID(),422687)==false) and( CheckFlag( OwnerID(),543008) ==false)  	then 
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422687_0]","LuaS_422687_1",0) 	--�Ⱥk�R�����n�ڨӰt�X�A����ʡA�x�����D�˽ö����ʾ��C
	end

	if 	(CheckAcceptQuest(OwnerID(),422689)==true )and(ReadRoleValue( TargetID() , EM_RoleValue_Register )  == 0) and ( CheckCompleteQuest( OwnerID(),422689)==false) then 
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422689_0]","LuaS_422689_1",0)			 --�ڨӤF�A�Ⱥk�R�����浹��[205765]�M[205909]�C
	end

	if 	(CheckAcceptQuest(OwnerID(),422689)==true )and(ReadRoleValue( TargetID() , EM_RoleValue_Register )  == 1) and(CheckCompleteQuest( OwnerID(), 422689 )==false) then 
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422689_0]","LuaS_422689_3",0)			 
	end

	if 	(CheckAcceptQuest(OwnerID(),422690)==true )and( CheckFlag( OwnerID(),543332)==false) 	then 
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422690_0]","LuaS_422690_1",0)		 --...�i�H��ڶ�i�c�l�̤F...
	end
end

function LuaS_422687_1()
	SetSpeakDetail(OwnerID(),"[SC_422687_1]")
	if ReadRoleValue( TargetID() , EM_RoleValue_PID )  == 0 then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422687_2]","LuaS_422687_2",0)	--���H�ɥi�H�i��԰��C	
	else
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422687_2]","LuaS_422687_3",0)	--���H�ɥi�H�i��԰��C
	end	
		
end			

function LuaS_422687_2()  
	CloseSpeak( OwnerID())
	say(TargetID(),"[SC_422687_3]")						--�ӤF�A����ĵı�I
	WriteRoleValue( TargetID() , EM_RoleValue_PID , 1 )
	BeginPlot( TargetID() , "LuaS_422687_4" , 0)
end

function LuaS_422687_3()  
	SetSpeakDetail(OwnerID(),"[SC_422687_4]")				--�ܦn�A�٭n�A���@�|�C
end
		

function LuaS_422687_4()							
		local RED = Lua_DW_CreateObj("flag" ,102668,780354,1)
		MoveToFlagEnabled( RED , false )
		WriteRoleValue( RED,EM_RoleValue_IsWalk , 1 )--�]�Ψ����^
		sleep(20)
		Hide( RED)
		Show( RED,0)
		WriteRoleValue ( RED  , EM_RoleValue_PID,OwnerID() )	--�NOwnerID()<���p���y>�g�iRED���D��
		BeginPlot(RED,"LuaS_422687_5", 0 )
		BeginPlot( TargetID() , "LuaS_422687_6" , 0 )
		SetPlot(RED,"dead","LuaS_422687_7",0 )
		sleep(100)
		SetAttack(RED ,TargetID())
		
end

function LuaS_422687_5()
	LuaFunc_MoveToFlag(OwnerID(), 780354,2 , 0 )
	yell(OwnerID(),"[SC_422687_5]",3)
	sleep(20)
	yell(OwnerID(),"[SC_422687_6]",3)

end

function LuaS_422687_7() --�Ǫ����`�@��
	local Player
	for i=0, HateListCount( OwnerID() )-1 do
		Player = HateListInfo(OwnerID() , i , EM_HateListInfoType_GItemID )
		if	CheckAcceptQuest ( Player   , 422687 )and ( CheckFlag( Player ,543008)) ==false 	then
			SetFlag( Player  , 543008, 1 )
			if	CheckAcceptQuest ( TargetID(), 422687 )and CountItem( TargetID(), 205763)<1	then
				GiveBodyItem( TargetID(),205763, 1 )
			end
			if	CheckAcceptQuest ( TargetID(), 422687 )and CountItem( TargetID(), 205764)<1	then
				GiveBodyItem( TargetID(),205764, 1 )
			end
		end
	end	
	Local NPC= ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	WriteRoleValue( NPC , EM_RoleValue_PID , 0 )
	return true
End

function LuaS_422687_6()
	local RED = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	for i = 1, 50 , 1 do
		if CheckID(RED) == false or ReadRoleValue(  RED , EM_RoleValue_IsDead ) == 1 or ReadRoleValue(  RED , EM_RoleValue_OrgID ) ~= 102668 then
			break
		end
		sleep( 60 )
	end
	if CheckID(RED) == true and ReadRoleValue(  RED, EM_RoleValue_IsDead ) == 0 and ReadRoleValue( RED , EM_RoleValue_OrgID ) == 102668 then
		Local NPC= ReadRoleValue(OwnerID(),EM_RoleValue_PID)
		WriteRoleValue( NPC , EM_RoleValue_PID , 0 )
		Delobj( RED)
		
	end
end

function LuaS_422687_9()	--�٧����ȫ�R�����~
	if	CountBodyItem( TargetID(), 205763)>0		then
		DelBodyItem( TargetID(), 205763, 1 )
	end
	if	CountBodyItem( TargetID(), 205764)>0		then
		DelBodyItem( TargetID(), 205764, 1 )
	end
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--422693������������	�X�l�G780351


function LuaS_422693_after()
	if  CheckAcceptQuest(TargetID(),422693)==true then
		if	CountBodyItem( TargetID(), 205760 )<1	then
		GiveBodyItem( TargetID(), 205760, 1 )
		end
	end
end


function LuaI_422693_1()		--�u�Хߤ@���ˬd�d�����Ϊ���EX.113561�v
	if CheckBuff( OwnerID() , 504766) == false then
		SetPosByFlag( OwnerID(), 780351 , 1)
	end
end

function LuaM_504767_0()--BUFF�ˬd�ǰe
	SetPosByFlag( OwnerID(), 780351 , 1)
end

function LuaS_422693_0()	
		LoadQuestOption(OwnerID())	
	if 	(CheckAcceptQuest(OwnerID(),422693)==true )and( CheckFlag( OwnerID(),543333)==false) 	then 
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422693_0]","LuaS_422693_1",0)		 --�����ȸ����F�H
	end
end

function LuaS_422693_1()
	SetSpeakDetail(OwnerID(),"[SC_422693_1]")				--�A�n�A�o��O�Ĥ@���A�M�ڥ��������A�ڬO�Ⱥk�R���������ݰƩx�G�����ȡC
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422693_2]","LuaS_422693_2",0)	--�A�n�C
end

function LuaS_422693_2()
	SetSpeakDetail(OwnerID(),"[SC_422693_3]")	--�J�M�����Q���D�������惡�ƪ��A�פ����A�ڭ̪��ʧ@�����y�L�[�֡A��~�w�g�������D�H�����O�K�����ʡA�L�̪��N�x�X�{	
--	BeginPlot(TargetID(),"LuaS_422693_3",0)
	if	CheckBuff( OwnerID() , 504317 ) == true	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422693_4]","LuaS_422693_4",0)--�ڤw�g��n���p���y�A���F�C
	end
	if	CheckBuff( OwnerID() , 504317 ) == false	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422693_16]","LuaS_422693_5",0)--�ڲ{�b�n������H
	end	
end



function LuaS_422693_4()
	closespeak(OwnerID())
	say(TargetID(),"[SC_422693_6]")--��A���ڱa�A�L�h�C
	WriteRoleValue ( TargetID()  , EM_RoleValue_PID, OwnerID())			--�NOwnerID()<���a>�g�iTargetID()�����ȸ�
	BeginPlot(TargetID(),"LuaS_422693_6",0)
end

function LuaS_422693_5()
	SetSpeakDetail(OwnerID(),"[SC_422693_5]")--�Х���n���p���y�A���C
end

function LuaS_422693_6()					    	    
	DisableQuest( OwnerID(), true )						--OwnerID�O������
	SetPlot( OwnerID(), "touch" , "LuaI_113486_1" , 30 )				--113486�O������	LuaI_113486_1�d��@��
	BeginPlot( OwnerID() , "LuaI_113486_2" , 0 )				
end

function LuaI_113486_1()
	say( TargetID() , "[SC_422693_7]" )			 --�еy���ڤ@�U�C
end

function LuaI_113486_2()
	local MA,player =0
	sleep( 20 )
	player = ReadRoleValue(OwnerID(),EM_RoleValue_PID)								--�]�w���a���ŧi
	SetPosByFlag( player  , 780351 , 2 )										--�ǰe���a
	AddBuff( player  , 504766, 1 , -1 )										--�����aBUFF 
	AddBuff( player  , 503977 , 1 , 60 )										--�����aBUFF �ĨĬ���
	MA = CreateObjByFlag( 102509 , 780351 , 3 , 1 )									--�إX�t��NPC
	SetRoleCamp(  MA , "Visitor" )										--���ܰ}��A�K�o���a�Q���A�]��l�v�էC
	AddToPartition( MA , 0 )
	MoveToFlagEnabled( MA  , false )										--�������� 
	local snake = {}
	for i=4,8,1 do
		snake[i] = CreateObjByFlag( 113563 , 780351 , i , 0 ) --5�D
		AddToPartition( snake[i] , 0 )
		MoveToFlagEnabled( snake[i] , false )
	end
	local KILLER= {}
	for i=9,10,1 do
		KILLER[i] = CreateObjByFlag( 113562 , 780351 , i , 0 ) --2�D
		AddToPartition( KILLER[i] , 0 )
		MoveToFlagEnabled( KILLER[i] , false )
	end
	sleep(30)
	AdjustFaceDir( MA ,snake[6]  , 0 ) 	
	Yell( MA , "[SC_422693_8]" , 3 )-- �N�O�o�X�ӡH	
	sleep(20)
	Yell( snake[6] , "[SC_422693_9]",3 )         --�[�N�x�A�O...
	sleep(20)
	Yell( MA , "[SC_422693_10]" , 3 )--�ڤw�gĵ�i�L...
	AdjustFaceDir( MA ,KILLER[9]  , 0 ) 
	sleep(20)
	PlayMotion( MA , ruFUSION_ACTORSTATE_ATTACK_2H)
	AddBuff( KILLER[9], 503974 , 0 , 30 )
	sleep(20)
	SetDefIdleMotion( KILLER[9], ruFUSION_MIME_DEATH_LOOP)
	sleep(20)
	Yell( KILLER[10] , "[SC_422693_11]" ,3)         --�N�x�I�ЦA���ڤ@�����|�I
	AdjustFaceDir( MA ,KILLER[10]  , 0 ) 
	sleep(20)
	Yell( MA , "[SC_422693_12]" , 3 )--�H�ϭx���A��ť�R�̪��U��...
	sleep(10)
	PlayMotion( MA , ruFUSION_ACTORSTATE_ATTACK_2H)
	AddBuff( KILLER[10], 503974 , 0 , 30 )
	sleep(20)
	SetDefIdleMotion( KILLER[10], ruFUSION_MIME_DEATH_LOOP)
	sleep(20)
	AdjustFaceDir( MA ,snake[7]  , 0 ) 
	sleep(15)
	Yell( MA , "[SC_422693_13]" , 3 )--���ݲM���F�H
	sleep(20)
	AdjustFaceDir( MA , player , 0 ) 
	sleep(10)
	ScriptMessage(  player , player, 1 , "[SC_422693_14]" , 0 ) 	--[102509]��M�ݦV�A���ê��a��I	
	ScriptMessage(  player , player, 0 , "[SC_422693_14]" , 0 ) 	--[102509]��M�ݦV�A���ê��a��I
	sleep(20)
	tell(player ,OwnerID(),"[SC_422693_15]")		--�����A�L�_�äF�I���^�h�a�C
	sleep(20)
	if CheckID(player) then
		if CheckAcceptQuest( player , 422693) == true then
		SetFlag( player , 543333  , 1 )
		end
	end
		CancelBuff_NoEvent( player  , 503977 )							--����BUFF
		CancelBuff( player  , 504766)
	DisableQuest( OwnerID() , false )
	SetPlot( OwnerID() , "touch" , "" , 0 )
	delobj(MA)
	for i=4,8,1 do
	Delobj( snake[i] )  --�R��5�D
	end
	for i=9,10,1 do
	Delobj( KILLER[i] )  --�R��3�D
	end
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--422694�s���W��c�l

function LuaS_422694_2()
	if  CheckAcceptQuest(TargetID(),422694)==true then
		if	CountBodyItem( TargetID(), 205760 )<1	then
		GiveBodyItem( TargetID(), 205760, 1 )
		end
	end
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaI_113605_0()
	SetFightMode( OwnerID() , 0 , 0 , 0 , 0)
	AddBuff( OwnerID() , 504801 , 1, -1 )
end