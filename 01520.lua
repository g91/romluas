
function LuaS_422666()	

	CloseSpeak( OwnerID() )
	if ReadRoleValue( TargetID() ,EM_RoleValue_PID ) == 0 then
		DisableQuest( TargetID() , true )
		writerolevalue( TargetID() , EM_RoleValue_PID , 1 )
		BeginPlot( TargetID() , "LuaS_422666_1" , 0 )
		BeginPlot( TargetID() , "LuaS_422666_2" , 0 )
	else
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SAY_NPC_BUSY]" , 0 )  
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SAY_NPC_BUSY]" , C_SYSTEM )	
	end
end

function LuaS_422666_2()

	local NPC = CreateObjByFlag( 113415 , 780431 , 1 , 1 )  --��̤����k�v
	writerolevalue( NPC , EM_RoleValue_IsWalk , 0 )
	AddToPartition( NPC , 0 )

	MoveToFlagEnabled( NPC , false )
	Say( NPC , "[SC_422666]" )             --
	LuaFunc_MoveToFlag( NPC , 780431 , 2 ,  0 )
	sleep(20)
	Say( NPC , "[SC_422666_1]" )         --  
	sleep(20)
	Say( NPC , "[SC_422666_2]" )         --  
	sleep(20)
	LuaFunc_MoveToFlag( NPC , 780431 , 3 ,  0 )
	Delobj( NPC )
	SetFlag(TargetID(),543265,1)
end

function LuaS_422666_1()	

	sleep(10)
	Say(OwnerID() , "[SC_422666_3]" ) --�N�R�@�I�A�C�C��
	sleep(80)
	Say(OwnerID() , "[SC_422666_4]")--��I���A�ѤF�A�A�֥h�a�I
	DisableQuest( OwnerID() , false )
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 )
end



function LuaS_422669()	
--780429�X�l
--504352����BUFF
	
	local NPC = CreateObjByFlag( 113414 , 780429 , 2 , 0 )  --�ڮu�Ǵ�
	AddToPartition( NPC , 0 )
	local NPC1 = CreateObjByFlag( 113429 , 780429 , 1 , 0 )  --����§�g
	AddToPartition( NPC1 , 0 )
	local NPC3 = CreateObjByFlag( 112047 , 780429 , 1 , 0 )  --����§�g
	AddToPartition( NPC3 , 0 )
	AddBuff( NPC3 , 504352 , 99 , -1 ) 

	MoveToFlagEnabled( NPC , false )
	LuaFunc_MoveToFlag( NPC , 780429 , 3 ,  0 )
	Say( NPC , "[SC_422669_1]" )               -- �ڨ̬��ӨӡA���u�C
	sleep(30)
	Say(OwnerID() , "[SC_422669_2]"  )     -- �o��R���o�c���]�C�A����N�浹�A�ӺR���F�I
	sleep(30)
	Say(OwnerID() , "[SC_422669_3]"  )     -- �]�ߦ�ű���a�ڡA�~��֦��p�����޳N...
	sleep(30)
	Say( NPC , "[SC_422669_4]" )               -- �ϥθT�ҲŤ奴�y�Z���A�O�ڤ@���Q�٥h���a�ڦ��I�C
	sleep(30)
	Say( NPC , "[SC_422669_5]" )               -- ���ڨӧ�W�Y���T�ҲŤ�R���A�ٳo��C�ۥѧa�I
	sleep(30)
	CastSpell( NPC , OwnerID() , 491276  )
	CancelBuff( NPC3 , 504352 )

	local NPC2 = CreateObjByFlag( 113427 , 780429 , 4 , 0 )  --�ĭۼw
	writerolevalue( NPC2 , EM_RoleValue_IsWalk , 0 )
	AddToPartition( NPC2 , 0 )
	MoveToFlagEnabled( NPC2 , false )
	
	sleep(20)
	Say( NPC2 , "[SC_422669_6]" ) 	-- ���I���I.....���i�H...���i�H�}�a�o��C�H
	Delobj( NPC1)
	sleep(10)
	Say(OwnerID() , "[SC_422669_7]"  )     -- �ĭۼw�H
	LuaFunc_MoveToFlag( NPC2 , 780429 , 5 ,  0 )
	sleep(30)
	Say(NPC2 , "[SC_422669_8]"  )  	-- �y....���u�A�ڪ��N��O���A�ڭ������ǥѳo��C���O�q�A�ӹ�ܨ��c�դO...
	sleep(30)
	Say(OwnerID() , "[SC_422669_9]"  )     -- �o������O�ڪ��Ʊ�
	sleep(30)
	Say(OwnerID() , "[SC_422669_10]"  )   -- �Y�K�O�ѽ�̤����ӫO�ޥ��A�������o�w���ڡI
	sleep(40)
	Say(NPC2 , "[SC_422669_11]"  )           -- �O...�O��....�ک��աA���u......
	sleep(50)
	Delobj( NPC )
	Delobj( NPC2)
end

