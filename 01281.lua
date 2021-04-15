
--------------------�߰ݭ���

function LuaS_422137()  

	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),422137)==true )and( CheckCompleteQuest( OwnerID() , 422137) == false)then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422137]","LuaS_422137_1",0) --���������A�ڷQ�߰�����u�����v���Ʊ��C
	end

	if (CheckAcceptQuest(OwnerID(),422125)==true )and( CheckFlag( OwnerID() , 542439 )==false)then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422125]","LuaS_422125",0) --���j�����������A�Ʊ�i�H�ɥαz���O�q�A�N�o�ӻ`��������q�R���C
	end

	if (CheckAcceptQuest(OwnerID(),422351)==true )and( CheckFlag( OwnerID() , 542697) == false)then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422351]","LuaS_422351_0",0) --
	end

	if (CheckAcceptQuest(OwnerID(),422830)==true )and( CountBodyItem( OwnerID(), 206172 )<1  )	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_ 422830]","LuaS_422830",0) --�v�֥��Ȳb�Ƥ���
	end

	if	(CheckAcceptQuest(OwnerID(),422814)==true ) and (ReadRoleValue( TargetID(),  EM_RoleValue_Register+2 )==0) and CheckFlag(OwnerID(),543451) == false then	--��ܡA�i�s
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422814_0]","LuaS_102796_2",0)	--���������H
	end
		
	if	(CheckAcceptQuest(OwnerID(),422824)==true ) and (ReadRoleValue( TargetID(),  EM_RoleValue_Register+2 )==0) and CheckFlag(OwnerID(),543417) == false then	--��ܡA�i�s
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422824_2]","LuaS_102796_2",0)	--���������A�ڬO��...
	end

	if	(CheckAcceptQuest(OwnerID(),422814)==true ) and (ReadRoleValue( TargetID(),  EM_RoleValue_Register+2 )==1) and CheckFlag(OwnerID(),543451) == false then	--���
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422814_0]","LuaS_102796_1",0)	--���������H
	end

	if	(CheckAcceptQuest(OwnerID(),422824)==true ) and (ReadRoleValue( TargetID(),  EM_RoleValue_Register+2 )==1) and CheckFlag(OwnerID(),543417) == false then	--��ܡA���i�s
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422824_2]","LuaS_102796_1",0)	--���������A�ڬO��...
	end
end

function LuaS_422137_1()  

	SetSpeakDetail(OwnerID(),"[SC_422137_1]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422137_2]","LuaS_422137_2",0) --���������A�аݱz���D�{�b�u�����v�o�ͤ���Ʊ��F�ܡH
end

function LuaS_422137_2()  

	SetSpeakDetail(OwnerID(),"[SC_422137_3]")
	SetFlag(OwnerID() , 542442 , 1 )
end

------------------�������������A

function LuaS_422138()	

	if CountBodyItem( OwnerID(), 204133 )>0  then
		DelBodyItem( OwnerID() , 204133 , 1 ) 
		BeginPlot( OwnerID() , "LuaS_422138_1" , 0 )
		return true
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422138_10]" , C_SYSTEM ) -- �A�ʤ֤�����q�I
		return false
	end
end

function LuaS_422138_1()	

	local NPC = CreateObjByFlag( 112574 , 780297 , 1 , 1 )  --���d�i
	AddToPartition( NPC , 0 )

	MoveToFlagEnabled( NPC , false )
	Say( NPC , "[SC_422138]" )             --  �ڡI�o���O������q�ܡH
	LuaFunc_MoveToFlag( NPC , 780297 , 2 ,  0 )
	sleep(20)
	Say( NPC , "[SC_422138_1]" )         --  ��ӧA�Q�n�N����i�������ߡA�ӨϪ���ͪ����ͪ���o������I  
	sleep(20)
	Say( NPC , "[SC_422138_2]" )         --  �ڬO�������������A�p�G�A��������q�浹�ڡA�ڱN���a�^�������b�����q���ܡA�i�H�������������Ӫ��ͪ��o�󶶧Q....
	sleep(20)
	Say( NPC , "[SC_422138_3]" )         --  �浹�ڧa...
	sleep(20)
	BeginPlot( OwnerID() , "LuaS_422138_2" , 0 )
	LuaFunc_MoveToFlag( NPC , 780297 , 5 ,  0 )
	sleep(30)
	BeginPlot( OwnerID() , "LuaS_422138_3" , 0 )
	BeginPlot( NPC , "LuaS_422138_4" , 0 )
end

function LuaS_422138_2()	

	local NPCA = CreateObjByFlag( 112576 , 780297 , 3 , 1 )  --��Q���E��Ž
	AddToPartition( NPCA , 0 )

	MoveToFlagEnabled( NPCA , false )
	Say( NPCA , "[SC_422138_4]" )         --  ���i�H�浹�L�I
	LuaFunc_MoveToFlag( NPCA , 780297 , 4 ,  0 )
	sleep(20)
	Say( NPCA , "[SC_422138_5]" )         --  ���M�Q���˦��H���F�H�I
	sleep(20)
	Say( NPCA , "[SC_422138_6]" )         --  ���}�I���}�I
	LuaFunc_MoveToFlag( NPCA , 780297 , 8 ,  0 )
	sleep(20)
	Say( NPCA , "[SC_422138_8]" )         --  ���}�I�֨��}�I
	sleep(30)
	BeginPlot( NPCA , "LuaS_422138_4" , 0 )
end

function LuaS_422138_3()	

	local NPCB = CreateObjByFlag( 112596 , 780297 , 5 , 1 )  --���d�i(�D)
	AddToPartition( NPCB , 0 )
	CastSpell( OwnerID() , OwnerID() , 491276  )

	MoveToFlagEnabled( NPCB , false )
	sleep(20)
	LuaFunc_MoveToFlag( NPCB , 780297 , 6 ,  0 )
	sleep(20)
	LuaFunc_MoveToFlag( NPCB , 780297 , 9 ,  0 )
	Say( NPCB , "[SC_422138_7]" )         --  �i�c�A�n���O�W�Y��N�A�������Ӧh�H���D�ڭ̪�����....
	sleep(20)
	Say( NPCB , "[SC_422138_9]" )         --  ��I���̨����@�I
	sleep(20)
	LuaFunc_MoveToFlag( NPCB , 780297 , 7 ,  0 )
	BeginPlot( NPCB , "LuaS_422138_4" , 0 )
end

function LuaS_422138_4()	

	sleep(10)		
	Delobj( OwnerID() )
end

----------------�b�ƴӪ�

function LuaS_422139()	

	BeginPlot( TargetID() , "LuaS_422139_1" , 0 )
	return true
end

function LuaS_422139_1()	

	local R = Rand( 4 ) 
	for i =R, 4, 1 do
		local i = LuaFunc_CreateObjByObj ( 101830 , OwnerID() )
		WriteRoleValue( i  , EM_RoleValue_LiveTime , 120 ) --�ɶ��H��p
		AddToPartition( i , 0 )
	end
end








