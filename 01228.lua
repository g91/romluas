
---�����ȫ᪺�T���q��

function LuaS_421900() 
	
	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_421900]" , C_SYSTEM ) --�B���G�H������j���w�Q�}�ҡI
end

-----�q�G�H�O��ï��������

function LuaS_421902() 
	local str = "["..GetUseItemGUID(OwnerID()).."]"
	ClearBorder( OwnerID());	--��l�ƥ۸O����
	AddBorderPage( OwnerID(), GetQuestDetail( 421902, 1 ));
	ShowBorder( OwnerID(), 421902, str , "ScriptBorder_Texture_Paper" )				
end

----��}������

function LuaS_421913() 
	local str = "["..GetUseItemGUID(OwnerID()).."]"
	ClearBorder( OwnerID());	--��l�ƥ۸O����
	AddBorderPage( OwnerID(), GetQuestDetail( 421913, 1 ));
	ShowBorder( OwnerID(), 421913, str , "ScriptBorder_Texture_Paper" )				
end

----�߰ݦB���G�H���ʦV

function LuaS_421904() 

	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),421904)==true )and(CheckFlag( OwnerID() , 542398 )==false)then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_421904]","LuaS_421904_1",0) --�аݦB���G�H�̪񦳤��򲧪��ܡH
	end		
end

function LuaS_421904_1() 

	SetSpeakDetail(OwnerID(),"[SC_421904_1]")	
	SetFlag(OwnerID() , 542398 , 1 )
end

function LuaS_421904_2() --NPC�˹��ʧ@ 

	AddBuff( OwnerID() ,502280,1 ,-1)
	PlayMotionEX( OwnerID(),ruFUSION_ACTORSTATE_COMBAT_UNARMED, ruFUSION_ACTORSTATE_COMBAT_UNARMED)
end

----��¾���N��

function LuaS_421908()  

	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),421908)==true )and( CheckCompleteQuest( OwnerID() , 421908) == false)then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_421908]","LuaS_421908_1",0) --�Чi�D�ڧA���@�N���}�o�̪��z�ѡC
	end

end

function LuaS_421908_1()  

	SetSpeakDetail(OwnerID(),"[SC_421908_1]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_421908_2]","LuaS_421908_2",0) --�A�|���F��g���A��^�h�A�i���A�u���ܷR�o�C
end

function LuaS_421908_2()  

	SetSpeakDetail(OwnerID(),"[SC_421908_3]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_421908_4]","LuaS_421908_3",0) --�o�u�O�ӥO�H�_��F�I
end

function LuaS_421908_3()  

	SetSpeakDetail(OwnerID(),"[SC_421908_5]")
	PlayMotion(TargetID() , ruFUSION_ACTORSTATE_EMOTE_CRY)
	AddSpeakOption(OwnerID(),TargetID(),"[SC_421908_6]","LuaS_421908_4",0) --�Ʊ��o�ͮɡA�A���Ӱ��W���^�ӳq���j�a���C
end

function LuaS_421908_4()  

	SetSpeakDetail(OwnerID(),"[SC_421908_7]")
	SetFlag(OwnerID() , 542401 , 1 )
end

----�����ٷ������

function LuaS_421907()  
	DelBodyItem( OwnerID(), 203874 , 1 ) 
	BeginPlot( OwnerID() , "LuaS_421907_1" , 0 )
	BeginPlot( OwnerID() , "LuaS_421907_2" , 0 )
	return true
end

function LuaS_421907_1()  

	local NPC = CreateObjByFlag( 112337 , 780289 , 1 , 1 )  --�H�֡E�|��
	AddToPartition( NPC , 0 )

	MoveToFlagEnabled( NPC , false )
	Say( NPC , "[SC_421907]" )             --  �ڡI�A����F�r�I�ڥh�ǳƤF�ǪF��A�ҥH�ӿ�F......�Ʊ�A�ਣ�̡C
	LuaFunc_MoveToFlag( NPC , 780289 , 3 ,  0 )
	sleep(30)
	PlayMotionEX( NPC, ruFUSION_ACTORSTATE_CROUCH_BEGIN,ruFUSION_ACTORSTATE_CROUCH_LOOP)
	Say( NPC , "[SC_421907_1]" )         --  ��g���A�ڨӬݩp�F.....
	sleep(30)
	Say( NPC , "[SC_421907_2]" )         --  �H�e�p�ѬO�W�ۭn�ڧﱼ�ʤߤj�N���a��f�A���O�ڤ@�����H���N...
	sleep(40)
	Say( NPC , "[SC_421907_3]" )         --  �p�G���ѧڰO�o���K����A�X�o�A���`�N����W�i��|�o�ͪ��M�I......�گu�Ӧ��I
	sleep(80)
	LuaFunc_MoveToFlag( NPC , 780289 , 4 , 0 )
	Say( NPC , "[SC_421907_4]" )         --  ��p���A�ݯ��ܤF�A�_�I��......
	sleep(30)
	Say( NPC , "[SC_421907_5]" )         --  �ڷQ�@�ӤH�R�@�R......�p�G�A�٦��Ʊ��n��ڡA�ڨ��·|�ݦb�ڪ��a�騺....
	LuaFunc_MoveToFlag( NPC , 780289 , 5 , 0 )
	BeginPlot( NPC , "LuaS_421907_4" , 0 )
end

function LuaS_421907_2()  

	local FLOWER = CreateObjByFlag( 112338 , 780289 , 2 , 1 )  -- �������
	AddToPartition( FLOWER , 0 )
	BeginPlot( FLOWER , "LuaS_421907_3" , 0 )
end

function LuaS_421907_3()  

	Sleep(200)
	Delobj( OwnerID() )
end

function LuaS_421907_4()  

	Sleep(30)
	Delobj( OwnerID() )
end


