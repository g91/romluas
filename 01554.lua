--422688�x�Ʊ���

function LuaS_422688_0()	
		LoadQuestOption(OwnerID())	
	if (CheckAcceptQuest(OwnerID(),422688)==true )and( CheckFlag( OwnerID(),543009)==false)and( CheckFlag( OwnerID(),543344)==true) and( CheckFlag( OwnerID(),543345)==true) then 
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422688_0]","LuaS_422688_1",0) --�ڬݧ��F...
	end
	
	if 	(CheckAcceptQuest(OwnerID(),422688)==true )and( CheckFlag( OwnerID(),543009)==false) 	then 
		AddSpeakOption(OwnerID(),TargetID(),"[SC_205763_0]","LuaS_205763_1",0)
	end
	
	if 	(CheckAcceptQuest(OwnerID(),422688)==true )and( CheckFlag( OwnerID(),543009)==false) 	then 
		AddSpeakOption(OwnerID(),TargetID(),"[SC_205764_0]","LuaS_205764_1",0)
	end

	if 	(CheckAcceptQuest(OwnerID(),422695)==true )and( CheckFlag( OwnerID(),543330)==false) and( CheckFlag( OwnerID(),543187)==true) then 
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422695_0]","LuaS_422695_1",0)		 --�ڬݧ��F�C
	end

end

function LuaS_422688_1()
	SetSpeakDetail(OwnerID(),"[SC_422688_1]")					--��m�ܡH�@�L���ƱN�o�س��i�H����a...				
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422688_2]","LuaS_422688_2",0)		--��A�ڪ��D�C
end

function LuaS_422688_2()
	SetSpeakDetail(OwnerID(),"[SC_422688_3]")	
	BeginPlot( OwnerID(), "LuaS_422688_3", 0 )												
end

function LuaS_422688_3()								
	SetFlag( TargetID(), 543009, 1 )
end

function LuaS_205763_1()	--�H�󤺮e
	SetSpeakDetail(OwnerID(),"[SC_205763_1]")
	BeginPlot( OwnerID(), "LuaS_205763_2", 0 )
end

function LuaS_205763_2()
	SetFlag( TargetID()  , 543344, 1 )
end

function LuaS_205764_1()
	SetSpeakDetail(OwnerID(),"[SC_205764_1]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_205764_2]","LuaS_205764_2",0)
end

function LuaS_205764_2()
	SetSpeakDetail(OwnerID(),"[SC_205764_3]")
	BeginPlot( OwnerID(), "LuaS_205764_3", 0 )
	
end

function LuaS_205764_3()
	SetFlag( TargetID()  , 543345, 1 )
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--422689«��K��780353 3��

--function LuaS_422689_0()	�]�h��422687�^
--		LoadQuestOption(OwnerID())	
--	if 	(CheckAcceptQuest(OwnerID(),422689)==true )and(ReadRoleValue( TargetID() , EM_RoleValue_PID )  == 0) and(CheckCompleteQuest( OwnerID(), 422689 )==false) then 
--		AddSpeakOption(OwnerID(),TargetID(),"[SC_422689_0]","LuaS_422689_1",0)			 --�ڨӤF�A�Ⱥk�R�����浹��[205765]�M[205909]�C
--	else
--		AddSpeakOption(OwnerID(),TargetID(),"[SC_422687_0]","LuaS_422689_3",0)			 --�ڨӤF�A�Ⱥk�R�����浹��[205765]�M[205909]�C
--end

function LuaS_422689_1()
	closespeak(OwnerID())
	say(TargetID(),"[SC_422689_1]")						--�S���D�A�ڥh�����h�X�ӡC
	WriteRoleValue( TargetID() , EM_RoleValue_Register , 1 )
	--WriteRoleValue( TargetID() , EM_RoleValue_PID , 1 )
	BeginPlot( TargetID(), "LuaS_422689_2", 0 )		
end

function LuaS_422689_2()
	local RED = Lua_DW_CreateObj("flag" ,113517,780353,3)	
	WriteRoleValue ( RED  ,  EM_RoleValue_Register , OwnerID())	--�NOwnerID()<�·G>�g�iRED���D��
	sleep(300)
	Local NPC= ReadRoleValue(RED  ,EM_RoleValue_Register )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
--	WriteRoleValue( NPC , EM_RoleValue_PID , 0 )	
	delobj(RED)	
end

function LuaS_422689_3()
	SetSpeakDetail(OwnerID(),"[SC_422689_2]")	--[113517]������N�b����A�ֶX�{�b�S�H�`�N�ɩ�m[205765]�M[205909]�I	
end


function LuaS_113517_0()--�����ȨS�X�� �I�����~��

	if 	(CheckAcceptQuest(OwnerID(),422689)==true ) then
		if ( CheckFlag( OwnerID(),542977) ==false) and CountBodyItem( OwnerID(), 205765) > 0	then	--�S���X�Ц����~
			DelBodyItem( OwnerID(), 205765, 1 )
			SetFlag( OwnerID()  , 542977, 1 )
		end
		if  CheckFlag( OwnerID(),543186)==false and CountBodyItem( OwnerID(), 205909 ) >0 then	--�S���X�Ц����~
			DelBodyItem( OwnerID(), 205909, 1 )	 
			SetFlag( OwnerID(),543186,1)		
		end
		
		if (CheckFlag( OwnerID(),542977)==false) and  (CheckFlag( OwnerID(),543186)== false) and CountBodyItem( OwnerID(), 205765) <1 and CountBodyItem( OwnerID(), 205909 ) <1	then											ScriptMessage( OwnerID() , OwnerID(), 2, "[SC_112217_0]" , 0 ) --�A�����֦�[205765]�M[205909]
		end

		if  CheckFlag( OwnerID(),542977)==false and CountBodyItem( OwnerID(), 205765 )<1 then	--�S���X�ШS�����~
			ScriptMessage( OwnerID() , OwnerID(), 2, "[SC_112217_1]" , 0 ) --�A�����֦�[205765]	
		end

		if CheckFlag( OwnerID(),543186)==false  and CountBodyItem( OwnerID(), 205909 ) <1 then	--�S���X�ШS�����~
			ScriptMessage( OwnerID() , OwnerID(), 2, "[SC_112217_2]" , 0 ) --�A�����֦�[205909]	
		end
	end	

	if 	(CheckAcceptQuest(OwnerID(),422689)==true )and( CheckFlag( OwnerID(),542977) ==true)and CheckFlag( OwnerID(),543186)==true	then
			ScriptMessage( OwnerID() , OwnerID(), 2, "[SC_112217_3]" , 0 ) --�A�w�g��[205765]�M[205909]�w�m�����W�F
--			return -1
	end
	return 1
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--�����������K

function LuaS_113507_0()	--�ˬd�P�@�ʫH�u��֦��@�� 
	if	CountItem( OwnerID(), 205910 )==0	then
		GiveBodyItem(OwnerID (), 205910, 1 )
		ScriptMessage( OwnerID() , OwnerID(), 2, "[SC_113507_1]" , 0 ) --�c�l���٦��H��
		Return 1
	end

	if 	CountItem( OwnerID(), 205911 )==0	then
		GiveBodyItem(OwnerID (), 205911, 1 )
		ScriptMessage( OwnerID() , OwnerID(), 2, "[SC_113507_1]" , 0 ) 
		Return 1
	end

	if 	CountItem( OwnerID(), 205912 )==0	then
		GiveBodyItem(OwnerID (), 205912, 1 )
		ScriptMessage( OwnerID() , OwnerID(), 2, "[SC_113507_1]" , 0 ) 
		Return 1
	end

	if 	CountItem( OwnerID(), 205914 )==0	then
		GiveBodyItem(OwnerID (), 205914, 1 )
		SetFlag( OwnerID(),543187,1)
		Return 1
	end
	Return -1
end

--function LuaS_422695_0()	�]�h��422688�^
--	if 	(CheckAcceptQuest(OwnerID(),422695)==true )and( CheckFlag( OwnerID(),543330)==false) and( CheckFlag( OwnerID(),543187)==true) then 
--		AddSpeakOption(OwnerID(),TargetID(),"[SC_422695_0]","LuaS_422695_1",0)		 --�ڬݧ��F�C
--	end
--end

function LuaS_422695_1()
	SetSpeakDetail(OwnerID(),"[SC_422695_1]")					       	--���U�Ӫ��p�e�y��ڷ|�i�D�A�A�A���𮧤@�U�a�C
	SetFlag( OwnerID(),543330,1)				
end

function LuaS_205910()
	ClearBorder( OwnerID())	--��l�ƥ۸O����
	AddBorderPage( OwnerID(), "[SC_205910]" )
	ShowBorder( OwnerID(), 0, "[205910]", "ScriptBorder_Texture_Paper" )	
End

function LuaS_205911()
	ClearBorder( OwnerID())	--��l�ƥ۸O����
	AddBorderPage( OwnerID(), "[SC_205911]" )
	ShowBorder( OwnerID(), 0, "[205911]", "ScriptBorder_Texture_Paper" )	
End

function LuaS_205912()
	ClearBorder( OwnerID())	--��l�ƥ۸O����
	AddBorderPage( OwnerID(), "[SC_205912]" )
	ShowBorder( OwnerID(), 0, "[205912]", "ScriptBorder_Texture_Paper" )	
End

function LuaS_205914()
	ClearBorder( OwnerID())	--��l�ƥ۸O����
	AddBorderPage( OwnerID(), "[SC_205914]" )
	ShowBorder( OwnerID(), 0, "[205914]",  "ScriptBorder_Texture_Paper" )	
End

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--422690�s�ݶi�i 780350 

function LuaI_422690_1()		--�u�n�Хߤ@���ˬd�d�����Ϊ���EX.113331�v
	if CheckBuff( OwnerID() , 504761) == false then
		SetPosByFlag( OwnerID(), 780350 , 1)
	end
end

function LuaM_504765_0()--BUFF�ˬd�ǰe
	SetPosByFlag( OwnerID(), 780350 , 1)
--	�إX�t�˪��·G
end

--function LuaS_422690_0() --���b�·G���W	�]����422678�^
--	if 	(CheckAcceptQuest(OwnerID(),422690)==true )and( CheckFlag( OwnerID(),543332)==false) 	then 
--		AddSpeakOption(OwnerID(),TargetID(),"[SC_422690_0]","LuaS_422690_1",0)		 --...�i�H��ڶ�i�c�l�̤F...
--	end
--end

function LuaS_422690_1()
	closespeak(OwnerID())
	if ReadRoleValue( TargetID() , EM_RoleValue_Register+9 ) == 0 then
		say(TargetID(),"[SC_422690_1]")						--���I�n��S���D�A�ګݷ|�N���b�A���䪺�c�l�A������ơI	
		WriteRoleValue ( TargetID()  , EM_RoleValue_Register+9, OwnerID())			--�NOwnerID()<���a>�g�iTargetID()�·G��
		BeginPlot( TargetID(), "LuaS_422690_2", 0 )					-- TargetID()�O�·G							    	    
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SAY_NPC_BUSY]" , 0 )
		tell(OwnerID() ,TargetID(), "[SC_422690_2]" )			 --�{�b�٤����A��i�c�l���A�ڭ�ݨ��D�H�b���ޡC
	end
end

function LuaS_422690_2()
	DisableQuest( OwnerID(), true )						--OwnerID�O�·G
	Yell( OwnerID() , "[SC_422690_3]" , 3 ) 		--�ǳƦ�ʡA�ݷ|�A�i�O�u�X�h�F��				--�i�| OwnerID,TargetID�O�·G
	sleep( 20 )
	local player = ReadRoleValue(OwnerID(),EM_RoleValue_Register+9)							--�]�w���a���ŧi
	if CheckID( player ) == true then
		SetPosByFlag( player  , 780350 , 2 )										--�ǰe���a
		AddBuff( player  , 504761 , 1 , -1 )										--�����aBUFF ����
		AddBuff( player  , 503977 , 1 , 60 )										--�����aBUFF �ĨĬ���
		ScriptMessage(  player , player, 2 , "[SC_422690_4]" , 0 ) 	--�c�l�]���A����J�Ӳ��L�̰ʡA�D�H���G�S�o�{���ˡC	
	--	ScriptMessage(  player , player, 0 , "[SC_422690_4]" , 0 ) 
		local MA = CreateObjByFlag( 113574 , 780350 , 3 , 1 )							--�إX�t��NPC
		WriteRoleValue(MA , EM_RoleValue_IsWalk, 1 )									--����
		SetRoleCamp(  MA , "Visitor" )	
		AddToPartition( MA , 0 )									--���ܰ}��A�K�o���a�Q���A�]��l�v�էC
		tell(player ,OwnerID() , "[SC_422690_5]")		--�p�ߡI�L�̨ӤF��
		MoveToFlagEnabled( MA  , false )	
		BeginPlot( MA , "LuaI_113488_2" , 0 )	
	else
			WriteRoleValue(OwnerID(),EM_RoleValue_Register+9 , 0 )
	end
	DisableQuest( OwnerID(), false )
end

function LuaI_113488_1()
	say( TargetID() , "[SC_422690_2]" )			 --�{�b�٤����A��i�c�l���A�ڭ�ݨ��D�H�b���ޡC
end

function LuaI_113488_2()
	local SNAKE,WASN ,AIDE = 0
	local player = ReadRoleValue(TargetID(),EM_RoleValue_Register+9)							--�������� 			
	sleep(10)
	DW_MoveToFlag( OwnerID() , 780350 , 4, 0 )	
	AIDE = CreateObjByFlag( 113575 , 780350 , 3, 1 )
	WriteRoleValue(AIDE , EM_RoleValue_IsWalk, 1 )
	Hide( AIDE )
	Show( AIDE ,0)	
	SetRoleCamp(  AIDE , "Visitor" )
	AddToPartition( AIDE , 0 )
	MoveToFlagEnabled( AIDE , false )
	BeginPlot( AIDE, "LuaI_113488_3", 0 )	
	Yell( AIDE , "[SC_422690_18]" , 3 )	 	--�N�x�I									
	DW_MoveToFlag( OwnerID() , 780350 , 5, 0 )
	SetFightMode( AIDE , 0 , 0 , 0 , 0)										--�]�w�԰��S�x �����ġB���k�]�B�����ʡB������
	sleep( 10)
	AdjustFaceDir( OwnerID() ,AIDE , 0 ) 										--���V
	sleep( 5 )
	Yell( OwnerID() , "[SC_422690_6]" , 3 ) 		--�P�˪��ܧO���ڦA���ĤG���I
	sleep(20)
	Yell( AIDE , "[SC_422690_7]" , 3 )	 	--�N�x�A���D�N�x�S�a���L���˽ùL�ӡA�]�\�T����ơC
	sleep(25)
	Yell( OwnerID() , "[SC_422690_8]" , 3 )		--�R�O�O�������A�k�h�˦۵o�G�A�A��óo���ŧi�N���ۧA�{���F�Q�w�u���t�����F����H
	sleep(35)
	Yell( AIDE , "[SC_422690_9]" , 3 ) 		--...�N�x...����ݤU�_�ǡA�ڤ��O�̪�~����z���Ʃx�A�o��Ʊ����o�i�u���ܥi��...
	sleep(20)
	Yell( AIDE , "[SC_422690_10]" , 3 ) 		--�ӥB�K��W�]���X�Q�i�@�B�T�{�i�H�V���D�N�x�M�D�Ҿ�...
	sleep(25)
	Yell( OwnerID() , "[SC_422690_11]" , 3 ) 		--�q�L�����D�H�����@�Ѱ_�A�ڤw�M�w�m�W�ڪ����ۡA�O�A���o�جy���X���C
	sleep(25)
	Yell( OwnerID() , "[SC_422690_12]" , 3 ) 		-- �A�u�n�O�o�L�O�ڭ̪����A���աH
	sleep(30)
	Yell( AIDE , "[SC_422690_13]" , 3 )		--���O...�ڪ��N�x�O�A...�ӳD�H������쥻���Ӥ]�O...
	sleep(20)
	Yell( OwnerID() , "[SC_422690_14]" , 3 ) 		--�A�O�ڳ̫H�����U�ݡA�A��ڪ����ۧګܲM���A�w�g����H�����ܧO�������X�f�C
	sleep(35)
	Yell( AIDE , "[SC_422690_15]" , 3 ) 		--...�N�x�A���D�N�x���˽ä����J�`�A�Юe�\�ݤU�N���N�x�e�h��m�ﯸ��F���ݡC
	sleep(30)
	Yell( OwnerID() , "[SC_422690_16]" , 3 )		 --�A...
	ScriptMessage(  player , player, 2 , "[SC_422690_33]" , 0 ) 	--[102509]�X���i�D�a�ĤF�@�f��..
	sleep(10)
	Yell( OwnerID() , "[SC_422690_34]" , 3 ) 		--�n�a�A�d�دΪ��˽ö��b�ڪ���a�D����`�A�A�N���ڨ��@���m�ﯸ�C
	sleep(20)
	Yell( AIDE , "[SC_422690_17]" , 3 )		--�O�I�ݤU��R�I
--	DW_MoveToFlag( OwnerID(), 780350 , 8, 0 )									--�]�����O�K�����^
	sleep(20)			
	DelObj( AIDE )
	if CheckID(player) then
		if CheckAcceptQuest( player , 422690) == true then
			SetFlag( player , 543332  , 1 )
		end
	end
	sleep(30)	
	BeginPlot( AIDE, "LuaI_113488_4", 0 )
	Yell( OwnerID() , "[SC_422690_19]" , 3 ) 			--�{�b�A�֯ର�ڻ����A�O���@�Ӧb�ڨ����ɾզۨM�w�B�m�F�u���p���y�v���H�H
	SNAKE  = CreateObjByFlag( 113573 , 780350 , 3 , 1 )								--�إX�t��NPC
	WriteRoleValue(SNAKE , EM_RoleValue_IsWalk, 0 )								--�]�B
	SetRoleCamp( SNAKE , "Visitor" )										--���ܰ}��A�K�o���a�Q���A�]��l�v�էC
	AddToPartition(  SNAKE, 0 )
	MoveToFlagEnabled( SNAKE  , false )	
	DW_MoveToFlag( SNAKE , 780350 , 4, 0 )
	AdjustFaceDir( SNAKE  ,OwnerID() , 0 ) 										--���V
	sleep(10)
	Yell( SNAKE , "[SC_422690_20]" , 3 ) 			   --�N�x...�ڡB��...�O��...
	sleep(20)
	ScriptMessage(  player , player, 2 , "[SC_422690_21]" , 0 )   	   --�P�D���G�R�q�U�ӡA���^��^���D�H�����h���@�y�ܡC
	sleep(30)
	Yell( OwnerID(), "[SC_422690_22]" , 3 )  			   --�����C
	sleep(20)
	Yell( SNAKE , "[SC_422690_23]" , 3 )			   --�O�I�L�̡B���p���y�X�ӳå�X�j�a�S�`�N�ɩ���N�F�@�Ǫ���A�ݤU�@�ɮ𼫤~�|�B�~�|...
	sleep(25)
	Yell( OwnerID(), "[SC_422690_24]" , 3 )  			   --�A�̿˲��ݨ��H
	sleep(20)
	Yell( SNAKE , "[SC_422690_25]" , 3 )			   --�c...�[�i�N�x...�S��...���O��a�̴N�u�������o�����L�̡A�@�w�O�L��...
	sleep(25)
	Yell( OwnerID(), "[SC_422690_26]" , 3 )  			   --�A�̦b��a�n�u�A�o�S��˲��ݨ��ǤH�A�S�������Ҿګo�@�f�r�w�O���p���y�A�O�ܡH
	sleep(20)
	Yell( SNAKE , "[SC_422690_27]" , 3 )			   --�N�x�ǩR�I�N�x�ǩR�I
	sleep(15)
	Yell( OwnerID(), "[SC_422690_28]" , 3 )  			   --�U�h�a�A�x���Ҿڤ��e�O���ڦA�ݨ��o�شX�G�O�x�@�ɤ��֪��|�ʡC
	sleep(20)
	Yell( SNAKE , "[SC_422690_29]" , 3 )			   --�O�B�O�I���±N�x�C
	sleep(20)
	DW_MoveToFlag( OwnerID() , 780350 , 6, 0 )
	sleep(10)
	tell(player ,TargetID(),"[SC_422690_30]")	                   --�Ӧn�F�I�L�I��ڭ̡�t���ɾ��N�O�{�b�I
	sleep(10)
	ScriptMessage(  player , player, 2 , "[SC_422690_36]" , 0 )   	   --[113488]�|�C�ĤF�X�h�I
	WASN = CreateObjByFlag( 113576 , 780350 , 7 , 1 )
	AddToPartition(  WASN , 0 )
	sleep(20)
	Yell( SNAKE , "[SC_422690_31]" , 3 )			   --�O�֡H���p���y�I
	sleep(10)
	SetAttack(WASN,OwnerID())
	PlayMotion( WASN, ruFUSION_ACTORSTATE_ATTACK_1H)
	sleep(10)
	AdjustFaceDir( OwnerID() , WASN, 0 )
	SetAttack(OwnerID(),WASN)
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_ATTACK_1H)
	sleep(20)
	Yell( WASN, "[SC_422690_35]" , 3 )  			   --��...
	sleep(15)
	if CheckID(player) then
		tell(player ,TargetID(),"[SC_422690_32]")	           	   --�V�|�I����...���M�h�B�A�֨��B�֨�...
		if CheckAcceptQuest( player , 422690) == true then
			SetFlag( player , 543332  , 1 )
			SetFlag( player , 543349  , 1 )
		end
		CancelBuff_NoEvent( player  , 503977 )									--����BUFF
		CancelBuff( player  , 504761 )
	end
	WriteRoleValue ( TargetID()  , EM_RoleValue_Register+9, 0 )
	DelObj( SNAKE )
	DelObj( WASN )
	DelObj( OwnerID() )
end


function LuaI_113488_3()
	DW_MoveToFlag( OwnerID(), 780350 , 4, 0 )	
	Yell( OwnerID(), "[SC_422690_18]" , 3 )		--�N�x�I
end


--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--422774�¹��Ϥ�	�X�l�G780356


function LuaI_113508_Use()
	local Fire = {}	
	local amount = 20
	For i=1, amount  do
		Fire[i] = Lua_DW_CreateObj("flag" ,112399, 780356, i )
		CastSpell( Fire[i], Fire[i], 493828 )
		AddBuff(Fire[i] , 503605 , 1 , -1 )	
--		Lua_ObjDontTouch( Fire ) 
--		AddToPartition( Fire , 0 )
--		AddBuff( Fire , 503605 , 1 , -1 )
		BeginPlot( Fire[i]  , "LuaI_113508_Play" , 0 )
		if CheckAcceptQuest( OwnerID() , 422774) == true then
			SetFlag( OwnerID() , 543331 , 1 )
		ScriptMessage(  OwnerID(), OwnerID(), 1 , "[SC_422774_0]" , 0 )   	   --�A���z�F���ġI
		end
	end
	return 1
end

function LuaI_113508_Play()
	local Me = Role:new( OwnerID() )
	AddBuff( OwnerID() , 502724 , 1 , -1 )
	CastSpell( OwnerID(), OwnerID(), 493828 )
	local Count = GetMoveFlagCount(780356)
	local Dis = 20
	local Fire = {}
	local num = 1
	local FirePoint = {}
	for i = 1 , Count-4 , 1 do
		FirePoint[i] = i + 3
	end
--	SetFlag( OwnerID() , 543349 , 1 )
	while table.getn( Fire ) < Count -4 do
		for pry , obj in pairs(FirePoint) do
			if obj ~= 0 then
				local X = GetMoveFlagValue( 780356 , obj , EM_RoleValue_X )
				local Y = GetMoveFlagValue( 780356 , obj , EM_RoleValue_Y )
				local Z = GetMoveFlagValue( 780356 , obj , EM_RoleValue_Z )
				if ( ( Me:X() - X ) ^ 2 + ( Me:Z() - Z ) ^ 2 ) < Dis^2 then
					Fire[num] = CreateObj( 112399 , X , Y , Z , 0 , 1 )
					Lua_ObjDontTouch( Fire[num] ) 
					AddToPartition( Fire[num] , 0 )
--					BeginPlot( Fire[num] , "LuaI_205579_Fire" , 0 )
					WriteRoleValue(  Fire[num]  , EM_RoleValue_LiveTime , 60 )
					num = num + 1
					FirePoint[pry] = 0
				end
			end
		end
		Dis =Dis + 20
		if Dis > 320 then
			break
		end
		sleep( 30 )
	end
	sleep( 60 )
	CancelBuff_NoEvent( OwnerID() , 502724 )
	sleep( 50 )
--	SetFlag( TargetID() , 543350 , 1 )
	DelObj( OwnerID() )
end


--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--���������� �X�l�G780353	 1-2��
function LuaS_113550_0()
		LoadQuestOption(OwnerID())	
	if 	(CheckAcceptQuest(OwnerID(),422697)==true )and( CheckCompleteQuest( OwnerID(),422697)==false)and (CheckBuff( OwnerID() , 504781 ) == true) then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422697_0]","LuaS_113550_1",0)		 --�N�x�A�ڧ��o�u�c�l
	end
end

function LuaS_113550_1()
	closespeak(OwnerID())
	BeginPlot( TargetID() , "LuaS_113550_2" , 0 )
	
	if	CountBodyItem( OwnerID(), 205930 )>0	then
		DelBodyItem( OwnerID(), 205930, 1 )
	end
	local BOX =  LuaFunc_SearchNPCbyOrgID( OwnerID() , 113572 , 100 )
	if CheckID(BOX ) == false then
		local box=CreateObjByFlag( 113572 , 780353 , 1, 1 )
		AddToPartition(  box, 0 )
	end
	say(TargetID(),"[SC_422697_1]")				--�~�[�S��..�A�b���̧�쥦�H	
end

function LuaS_113550_2()
	sleep(25)
	ScriptMessage( TargetID() , TargetID(), 2, "[SC_422697_2]" , 0 ) 	--�X��������ݽc�l�A�o�O�@�ӧ������n�ɾ��I
	sleep(30)
	local BA,Player=0							
	Hide(OwnerID())		--OwnerID�O������
	local MA = Lua_DW_CreateObj("obj" , 102509 , OwnerID() )	
	ScriptMessage( TargetID() , TargetID(), 1, "[SC_422697_7]" , 0 ) 	--�A�����˳Q�ѯ}�F�I
	CancelBuff_NoEvent( TargetID() , 504781 )							
	SetPlot(MA,"dead","LuaS_422697_3",0 )
	BeginPlot(MA, "LuaS_Discowood_CheckPeace" , 0 )
	sleep(10)
	BA= CreateObjByFlag( 102551 , 780353 , 2 , 1 )	
	AddToPartition(  BA, 0 )
	SetAttack(MA,TargetID())
	SetAttack(BA,MA)
	sleep(30)
	local YA=CreateObjByFlag( 102552 , 780353 ,2, 1 )
	AddToPartition(  YA, 0 )
	WriteRoleValue (YA , EM_RoleValue_PID,BA  ) 
	WriteRoleValue (BA , EM_RoleValue_PID,YA  ) 
	say(YA,"[SC_422697_3]")--�ڨӤ䴩�A�̡I
	WriteRoleValue (MA , EM_RoleValue_PID,YA  ) 
	SetAttack(YA,MA)
	SetAttack(MA,YA)
	while true do
		sleep(10)
		if CheckID(MA)==false then
			Show(OwnerID() , 0)
			break
		end
	end
end


--function LuaS_422697_2() --�Ⱥk�R�n��
--	local YA=CreateObjByFlag( 102552 , 780353 , 2, 1 )
--	AddToPartition(  YA, 0 )
--	say(OwnerID(),"888")
--	say(YA,"[SC_422697_3]")--�ڨӤ䴩�A�̡I
--	WriteRoleValue (OwnerID() , EM_RoleValue_PID,YA  ) 
--	SetAttack(YA,OwnerID())
--end

function LuaS_422697_3() --�Ǫ����`�@��
	local YA = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local BA = ReadRoleValue(YA,EM_RoleValue_PID)
	local Player 
	for i=0, HateListCount( OwnerID() )-1 do
		Player = HateListInfo(OwnerID() , i , EM_HateListInfoType_GItemID )
		if	CheckAcceptQuest ( Player   , 422697 )	then
			SetFlag( Player   , 540799, 1 )
		end
		if	CountBodyItem( Player , 205964 )>0	then
			DelBodyItem( Player , 205964, 1 )
		end
		ScriptMessage( Player  , Player , 2, "[SC_422697_5]" , 0 ) --	--��a�X�{�@�}�̰ʡA�³D�Ʃx���G�^�ӤF�C
	end

	if CheckID(YA) == true and ReadRoleValue( YA , EM_RoleValue_OrgID ) == 102552 and ReadRoleValue( YA , EM_RoleValue_IsDead ) == 0 then
		BeginPlot( YA , "LuaS_422697_4" , 0)
	else
		if CheckID(BA) == true and ReadRoleValue( BA , EM_RoleValue_OrgID ) == 102551 then
			delobj(BA)
		end
	end

	return true
End

function LuaS_422697_4() 
	local BA = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	Lua_CancelAllBuff( OwnerID()  ) 
	SetStopAttack( OwnerID() )
	SetRoleCamp( OwnerID() , "Visitor" )
	if CheckID(BA) == true and ReadRoleValue( BA , EM_RoleValue_OrgID ) == 102551 then
		Lua_CancelAllBuff( BA) 
		SetStopAttack( BA)
		SetRoleCamp( BA, "Visitor" )
	end
	Say(OwnerID(), "[SC_422697_4]")	--������...
	sleep(30)
	Say(OwnerID(), "[SC_422697_6]")	--���a�A���}�o�̡�
	sleep(30)
	if CheckID(BA) == true and ReadRoleValue( BA , EM_RoleValue_OrgID ) == 102551 then
		DelObj(BA)
	end
	DelObj( OwnerID())
end

--�ܨ��D�H�ľ�
function LuaI_205964_Check()	--���b���˳D�H�ľ�

	if CheckBuff( OwnerID() , 504781 ) == true then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_205964_0]" , 0 ) --�A�w�g���˦��D�H
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_205964_0]" , 0 ) 
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

	if	CheckAcceptQuest(OwnerID(),422697)== false then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_205964_1]" , 0 ) --�u��b��������������ʤ��ϥ�
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_205964_1]" , 0 ) 
		return false
	end
	if CheckMapID(  X ,Y ,Z , 717 ) == false  then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_205760_1]" , 0 ) --�����a��[ZONE_THE MOLTEN BRIDGE]���񪺶³D��a�ϥ�
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_205760_1]" , 0 ) 
		return false
	end
	ScriptMessage( OwnerID() , OwnerID(), 2, "[SC_205964_2]" , 0 ) 	--���˦��D�H���ɶ��u�ȡA�ɧֱN[205930]�e�h�³D�N�x��b�I
	sleep(10)
	ScriptMessage( OwnerID() , OwnerID(), 1, "[SC_205964_3]" , 0 ) 	--�`�N�ƾԡI�H�ɦ��Q�o�{���M�I�I
end

function Lua_ObjAreaCheck_504782_0() --���˰����a�I
		if	Lua_ObjAreaCheck(OwnerID() , 717 ) == false 	then
			CancelBuff_NoEvent( OwnerID() , 504781 )
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_205760_1]" , 0 ) --�����a��[ZONE_THE MOLTEN BRIDGE]���񪺶³D��a�ϥ�
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_205760_1]" , 0 ) 
		end
end


--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--�V�b�̿ռw �X�l780352 1-16

function LuaM_422684_Range_0() --�б��b�ˬd�I�W
	writerolevalue( OwnerID() , EM_RoleValue_PID , 0 )
	SetPlot( OwnerID() , "range" , "LuaM_422684_Range_1" , 30 ) --�վ�̫᪺�Ʀr�H���ܰ����d��
end

function LuaM_422684_0()--�����ȫ�
	if	CheckAcceptQuest( TargetID() , 422684 ) == true and CheckFlag( TargetID() , 543347 ) == false then
	ScriptMessage( TargetID() , TargetID() , 0 , "[SC_422684_25]" , 0 ) --[113487]�쥻������m���G���@�ǷL�z���G���A�]�\�i�H�L�h�@�@�I
	ScriptMessage( TargetID() , TargetID() , 2 , "[SC_422684_25]" , 0 )
	end
end

function LuaM_422684_Range_1()
	if	CheckAcceptQuest( OwnerID() , 422684 ) == true and 
		CheckFlag( OwnerID() , 543347 ) == false and
		CheckBuff( OwnerID() , 504319)== false then   --�w��BUFF
		
		AddBuff( OwnerID() , 504319 , 1 , -1 ) --�w��BUFF
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422684_0]" , 0 ) --[113487]�b�a�W�]�m�F�@�Ӫ��M���A�ݱo�X�O�ܫP���U���X�A�M���ĥΨ��A�e�i���B��C
		ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_422684_0]" , 0 )
		sleep(30)
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422684_1]" , 0 ) 	--��d�b�a�W���@�i���ҭ�ær��g�ۡG�u�Ƹ���S�A����֨��I�O�ӧ�ڡ�v
		ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_422684_1]" , 0 )
		if ReadRoleValue( TargetID() , EM_RoleValue_PID ) == 0 then
			BeginPlot(TargetID() , "LuaM_422684_1" , 0) 	
		end
		SetPosByFlag( OwnerID(), 780355 ,1 )
	end
end

function LuaM_422684_1()
	writerolevalue( OwnerID() , EM_RoleValue_PID , 1 )
	sleep(20)
	ScriptMessage( TargetID() , TargetID() , 0 , "[SC_422684_26]" , 0 ) 		--�@�}�̰�
	ScriptMessage( TargetID() , TargetID() , 1 , "[SC_422684_26]" , 0 )
	sleep(10)

	local Player = {}
	local snake = {}
	for i=1,4,1 do
		snake[i] = CreateObjByFlag( 113564 , 780352 , i , 0 ) --4�D
		AddToPartition( snake[i] , 0 )
		MoveToFlagEnabled( snake[i] , false )
		WriteRoleValue( snake[i] , EM_RoleValue_PID , i+5 )
	end
	local NPC = CreateObjByFlag( 113565 , 780352 , 5 , 0 )  --1�D
	AddToPartition( NPC , 0 )
	MoveToFlagEnabled( NPC , false )


	yell( snake[1] , "[SC_422684_2]",3 )         --  ���F�I
	sleep(10)
	yell( snake[2] , "[SC_422684_3]",3 )         --  ������F��
	sleep(10)
	yell( snake[3] , "[SC_422684_4]",3 )         --  �O���p���y���H�I
	sleep(20)	
	yell( snake[4] , "[SC_422684_5]",3 )         --  �N���L�I�N���L��
	for i = 1, 4 , 1 do
		WriteRoleValue( snake[i] , EM_RoleValue_Register , 0 )
		beginplot( snake[i] , "LuaM_422684_3" , 0 )
	end
	LuaFunc_MoveToFlag( NPC , 780352 , 10 ,  0 )

	local NOD = CreateObjByFlag( 113566 , 780352 , 11 , 0 )  --�̿ռw
	AddToPartition( NOD , 0 )
	SetDefIdleMotion( NOD , ruFUSION_MIME_DEATH_LOOP)
	AddBuff(NOD  ,503605 , 1 , 45 )  --�N���S��	
	AdjustFaceDir( snake[2] ,NOD, 0 ) 
	sleep(20)
	AdjustFaceDir( snake[1] ,NOD, 0 ) 
	yell( NPC , "[SC_422684_6]" ,5) --�ֻ��I���p���y���I�����A�ӯ}�a�ڭ̪��F��H
	AdjustFaceDir( snake[3] ,NOD, 0 ) 
	AdjustFaceDir( snake[4] ,NOD, 0 ) 
	sleep(20)
	yell( NOD, "[SC_422684_7]" ,5)  --�ڡ��ڡ�...
	sleep(20)

	yell( NPC , "[SC_422684_8]" ,5) --�٤����H�L�w�I�ݽ֤���༵�I�ݧA�o�Ҽ����Ӥ��O�D�ѧa�H
	sleep(20)
	yell( NPC , "[SC_422684_9]" ,5) --�A���t�Y���Y�Y�b���H
	sleep(20)
	ScriptMessage( TargetID() , TargetID() , 1 , "[SC_422684_10]" , 0 ) --�ֽ��P����Ĳ���J�`���v�������}��...
	ScriptMessage( TargetID() , TargetID() , 0 , "[SC_422684_10]" , 0 )
	sleep(30)
	yell( NOD, "[SC_422684_11]",5)  --����...�ðd...�ڡ�
	sleep(20)
	yell( NPC , "[SC_422684_12]" ,5) --������A��ťť�A�L�ٷQ���G�I
	sleep(20)
	yell( NPC , "[SC_422684_13]" ,5)--�N�̧A�H
	sleep(20)
	yell( NOD, "[SC_422684_14]" ,5)  --���A�u......
	sleep(20)
	yell( snake[1] , "[SC_422684_15]" ,5)         -- �z�I�N�C�@�I�A�A�ݥL���ֽ����٤������
	sleep(20)
	yell( snake[2] , "[SC_422684_16]" ,5)         --  ������O���ۥL��u�@��Ӭݬݡ�
	sleep(20)
	yell( snake[3] , "[SC_422684_17]" ,5)         --  ���L���R�B���R��N�L���}�I
	sleep(20)	
	yell( snake[4] , "[SC_422684_18]" ,5)         --  �A�ݥL�A�ٷQ�ϧܡA�ä�a��A�s�ڡI
	sleep(20)
	ScriptMessage( TargetID() , TargetID() , 1 , "[SC_422684_19]" , 0 ) --�̿ռw���ä�P�s�z����F......
	ScriptMessage( TargetID() , TargetID() , 0 , "[SC_422684_19]" , 0 )
	sleep(30)
	yell( snake[1] , "[SC_422684_20]",5 )         -- ��...���F�H
	sleep(20)
	yell( snake[2] , "[SC_422684_21]" ,5)         --  �o��֡H
	sleep(20)
	yell( snake[3] , "[SC_422684_22]" ,5)         --  �H���N�O�S�Ρ�
	sleep(20)	
	yell( snake[4] , "[SC_422684_23]" ,5)         --  ��L��F�a��

	LuaFunc_MoveToFlag( NPC , 780352 , 12 ,  0 )
	for i = 1, 4 , 1 do
		WriteRoleValue( snake[i] , EM_RoleValue_Register , 1 )
		beginplot( snake[i] , "LuaM_422684_3" , 0 )
	end

	Delobj( NPC ) --�R���j�D
--	for i=1,4,1 do
--		Delobj( snake[i] )  --�R��4�D
--	end
	Delobj( NOD ) --�R���̿ռw

	--�ˬd���󵹧������ȺX��
	Player = SearchRangePlayer(OwnerID() , 200)
	For i=0,table.getn(Player)-1 do
		If	CheckAcceptQuest( Player[i], 422684 ) == true	and
			CheckFlag( Player[i] , 543347 ) == false then   --�w��BUFF

			SetFlag(Player[i] , 543347 , 1)
			ScriptMessage( Player[i] , Player[i] , 1 , "[SC_422684_24]" , 0 ) --�֧�o��o�ͪ��Ʊ��^����[113488]!
			ScriptMessage( Player[i] , Player[i] , 0 , "[SC_422684_24]" , 0 )
		end
		if CheckBuff( Player[i] , 504319 ) == true then
			CancelBuff( Player[i] , 504319 )  --�Ѱ��w��Buff
		end
	end
	writerolevalue( OwnerID() , EM_RoleValue_PID , 0 )
	
end

function LuaM_422684_3()
	local Flag
	if ReadRoleValue( OwnerID() , EM_RoleValue_Register ) == 0 then
		Flag = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	else
		Flag = ReadRoleValue( OwnerID() , EM_RoleValue_PID ) +7
	end
	LuaFunc_MoveToFlag(OwnerID(), 780352 , Flag,  0 )
	if ReadRoleValue( OwnerID() , EM_RoleValue_Register ) ~= 0 then
		DelObj( OwnerID() )
	end
end
