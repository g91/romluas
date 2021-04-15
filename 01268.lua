
-------------------------------------------���_���������ĻI����
function LuaS_422119()  

	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),422119)==true )and( CheckCompleteQuest( OwnerID() , 422119) == false)then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422119]","LuaS_422119_1",0) --����������������q�|�U��H
	end
	if (CheckAcceptQuest(OwnerID(),422127)==true )and( CheckFlag( OwnerID() , 542485 )==false)and(CountBodyItem( OwnerID(), 204260 )>0)then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422127_3]","LuaS_422127_4",0) --�p�l�I�O�Q���f�F�I�o�i�r���O���^�ơH
	end
	
end

function LuaS_422119_1()  

	SetSpeakDetail(OwnerID(),"[SC_422119_1]")
	SetFlag(OwnerID() , 542431 , 1 )
end

-----------------------------------------�`�����������O(������)
function LuaS_204116()  

	local water = ReadRoleValue(TargetID() , EM_RoleValue_OrgID)
	if water == 101765 then
		if CheckFlag( TargetID() , 542497 ) == true then
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_ALREADY_USED]" , 0 )
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_ALREADY_USED]" , 0 )
			return false
		end
		return true
	else
		return false
	end

end

function LuaS_204116_1()  

	if CheckFlag( TargetID() , 542497 ) == false then
		GiveBodyItem( OwnerID(), 204117, 1 )
		SetFlag( TargetID() , 542497 , 1 )
	end
end

-------------------------------------��@�������]�ܺ񪺡^

function LuaS_422121()  

	if CountBodyItem( OwnerID(), 204117 )>0  then
		BeginPlot( TargetID() , "LuaS_422121_1" , 0 )
		return true
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422121]" , C_SYSTEM ) -- �A�ʤ֤�����q�I
		return false
	end
end

function LuaS_422121_1()  

	CastSpell( OwnerID(),OwnerID(),491010)
	sleep(10)
	local i = LuaFunc_CreateObjByObj ( 112501 , OwnerID() )
	AddToPartition( i , 0 )
	DelBodyItem( TargetID(), 204117 , 1 ) 
	SetFlag(OwnerID() , 542432 , 1 )
	sleep(100)
	Delobj( i )
end

-------------------------------------��@�������]���ܬ��^

function LuaS_422123()  

	if CountBodyItem( OwnerID(), 204118 )>0  then
		BeginPlot( TargetID() , "LuaS_422123_1" , 0 )
		return true
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422123]" , C_SYSTEM ) -- �A�ʤ֤������֤ߡI
		return false
	end
end

function LuaS_422123_1()  

	CastSpell( OwnerID(),OwnerID(),491010)
	sleep(10)
	local i = LuaFunc_CreateObjByObj ( 112501 , OwnerID() )
	AddToPartition( i , 0 )
	SetFlag(OwnerID() , 542438 , 1 )
	DelBodyItem( TargetID(), 204118 , 1 ) 
	sleep(50)
	CastSpell( OwnerID(),OwnerID(),491010)
	Delobj( i )

	local A = LuaFunc_CreateObjByObj ( 112600 , OwnerID() )
	AddToPartition( A , 0 )
	sleep(60)
	Delobj( A )
end

-------------------------------------���ﳱ��

function LuaS_422127()  
	
	if CountBodyItem( OwnerID(), 204260 )<1  then
		BeginPlot( OwnerID() , "LuaS_422127_1" , 0 )
		BeginPlot( OwnerID() , "LuaS_422127_2" , 0 )
		SetFlag(OwnerID() , 542486 , 1 )
		return true
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422127_2]" , C_SYSTEM ) -- �A�w�g�j�d�L�f���c�I
		return false
	end
end

function LuaS_422127_1()  
	
	local MonA = CreateObjByFlag( 101835 , 780349 , 1 , 0 )  
	AddToPartition( MonA ,    0 )
	SetAttack( MonA , OwnerID() )
	Say( MonA , "[SC_422127]" ) --  �O�@�f���I
	BeginPlot(MonA , "LuaS_422127_3" , 0 )	
end

function LuaS_422127_2()  

	local MonB = CreateObjByFlag( 101836 , 780349 , 2 , 0 )  	
	AddToPartition( MonB ,    0 )
	SetAttack( MonB , OwnerID() )
	Say( MonB , "[SC_422127_1]" )  --  ��Q�N�F��a���I
	BeginPlot(MonB , "LuaS_422127_3" , 0 )	
end

function LuaS_422127_3()
	local Monster = OwnerID()
	while true do
		if ReadRoleValue( Monster , EM_RoleValue_AttackTargetID ) ~= 0 and CheckID( Monster ) == true then  --�ˬd�O�_���}�԰�
			Sleep( 10 )	-- �@���ˬd�@��	
		else
			if CheckID( Monster ) == true then	DelObj( Monster )	end 
			break
		end
	end
end

function LuaS_422127_4()  --�ݥX�u��
	
	CloseSpeak( OwnerID() )
	BeginPlot( TargetID() , "LuaS_422127_5" , 0 )
end

function LuaS_422127_5()  
	
	DisableQuest( OwnerID() , true )
	local ANPC = ReadRoleValue( TargetID(), EM_RoleValue_DBID ) 
	CastSpell( OwnerID(),OwnerID(),490098)
	sleep( 10 )
	SetFlag( TargetID() , 542487, 0 )
	local NPC = LuaFunc_CreateObjByObj ( 101837 , OwnerID() )
	MoveToFlagEnabled ( OwnerID() , false )
	Hide( OwnerID() )
	SetPlot(NPC,"dead" , "LuaS_422127_6",0)
	BeginPlot(NPC,"LuaS_422127_7",0)
	SetAttack( NPC , TargetID() )
	Say( NPC , "[SC_422127_4]" ) --���M�Q�A���r���A�o�U�i�V�F�I
	sleep( 10 )
	while true do
		if CheckID(NPC) == false then
			sleep( 10 )
			Show( OwnerID() , 0 )
			sleep( 10 )
			if  Luafunc_Player_Alive( TargetID(),ANPC,250 ) == true and ReadRoleValue( TargetID(), EM_RoleValue_IsDead) ~= 1 and CheckFlag( TargetID() , 542487 ) == true then 
				Say( OwnerID() , "[SC_422127_5]" ) --�ڧi�D�A�u�ۡA��ڪ��D�����i�D�A�A�O�A�ʤ�F....
				SetFlag(TargetID() , 542485 , 1 )
				DelBodyItem( TargetID(), 204260 , 1 ) 
			end
			sleep( 50 )
			MoveToFlagEnabled ( OwnerID() , true )
			DisableQuest( OwnerID() , false )
			break
		end
		sleep( 10 )
	end
end

function LuaS_422127_6()  
	
	if  ReadRoleValue( TargetID(), EM_RoleValue_IsDead) ~= 1 then 
		SetFlag( TargetID() , 542487, 1 )
	end	
	Delobj( OwnerID() )
	return false
end

function LuaS_422127_7()
	LuaFunc_Obj_Suicide(50)
end



--------------�T�D

function LuaS_422125()
	CloseSpeak( OwnerID() )
	BeginPlot( TargetID() , "LuaS_422125_1" , 0 )
	SetFlag(OwnerID() , 542439 , 1 )
end

function LuaS_422125_1()

	DisableQuest( OwnerID() , true )
	Say( OwnerID() , "[SC_422125_1]" ) --�ɥΧڪ��O�q�H
	sleep(20)
	Say( OwnerID() , "[SC_422125_2]" ) --�A�򨺸s�T�D�ڪ��H�O�P�@�s���ܡH
	sleep(20)
	Say( OwnerID() , "[SC_422125_3]" ) --�ڤ��|��̧A�̳o�s�C�����ͪ��A�x���T�D�ڪ��C���ͪ��I
	sleep(20)

	local NPC = LuaFunc_CreateObjByObj ( 101767 , OwnerID() )
	MoveToFlagEnabled ( OwnerID() , false )
	Hide( OwnerID() )
	SetAttack( NPC , TargetID() )
	sleep(10)
	BeginPlot(NPC,"LuaS_422125_2",0)
	BeginPlot(TargetID(), "LuaS_422125_3",0)
	sleep( 10 )
	while true do
		if CheckID(NPC) == false then
			sleep( 10 )
			Show( OwnerID() , 0 )
			sleep( 10 )
			CancelBuff( TargetID() , 503102 )
			sleep( 10 )
			MoveToFlagEnabled ( OwnerID() , true )
			DisableQuest( OwnerID() , false )
			break
		end
		sleep( 10 )
	end
end

function LuaS_422125_2()

	AddBuff(OwnerID() , 503049 , 0 , 1200 )  --�p��buff

	local NPCB = CreateObjByFlag( 111824 , 780300 , 1 , 0 )  --�ժ�
	AddToPartition( NPCB , 0 )

	MoveToFlagEnabled( NPCB , false )
	Say( NPCB , "[SC_422125_4]" ) -- ���i�H�A���O�u�ȯ��C
	sleep(30)
	Say( NPCB , "[SC_422125_5]" ) -- �a�ϧA�����ߥR������A�������ӵo���b�o�ǵL�d���ȤH���W�C
	sleep(30)
	Say( NPCB , "[SC_422125_6]" ) -- �L�̤��O�T�D�A���H�A�u�O�Q���s�H�Q�ΤF...
	sleep(30)
	LuaFunc_MoveToFlag( NPCB , 780300 , 2 ,  0 )
	BeginPlot(NPCB,"LuaS_422125_4",0)
	sleep(20)
	Delobj( OwnerID() )
end

function LuaS_422125_3()

	AddBuff(OwnerID() , 503102 , 0 , 600 )  --�p��buff
end

function LuaS_422125_4()

	CastSpell( OwnerID() , TargetID() , 491276  )
	Say( OwnerID() , "[SC_422125_7]" ) -- �н̸Ѵ��O�u�ȯ����欰�A�_�I�̡C��A�]�����@�N�N�O�q�ɵ��O�H�ϥΡA�Ӧ]���Q�T�D�X�d�~�ɡA����H���ʮ𳣤��|�ܦn���C
	sleep(30)
	Say( OwnerID() , "[SC_422125_8]" ) -- �ڪ��D�A�P���Ǭ��F�v�O�P����A�ӷQ�ɥδ��O�u�ȯ��O�q���H���P�A�X�۩�贈�����������������ߡA�~�ɭP�A�Q���s�H�Q�ΡC
	sleep(30)
	Say( OwnerID() , "[SC_422125_9]" ) -- �~��O���A�����}���ߡA�_�I�̡A���Ӧp�G���t�A�ڭ̷|�A�۹J��...
	sleep(30)
	CastSpell( OwnerID() , OwnerID() , 491276  )
	sleep(20)
	Delobj( OwnerID() )
end

