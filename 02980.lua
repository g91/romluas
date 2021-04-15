--122693 ��O�F
--426280 �x�v���p��
--242784 �w������
function lua_Z26NPC122693_1()
	if CheckAcceptQuest( OwnerID() ,426280 )==true  and  CountBodyItem( OwnerID(),242784 )<1 then
		SetSpeakDetail( OwnerID(), "[SC_NPC122693_1]" )--�q�p�����N���ڶ��ΦU���U�˪��į�A�Ʊ�ڥi�H���d���j���H�A�p�G�A�����쪾�D�į��Ѫ��ܡA�ګ��@�N�M�A���ɡC
		AddSpeakOption(  OwnerID(),TargetID(),"[SC_NPC122693_2]","lua_Z26NPC122693_1_1",0 )--�ڥu�Q�n�@��[242784]�I
	else
		LoadQuestOption( OwnerID() )
	end
end
function lua_Z26NPC122693_1_1()
	SetSpeakDetail( OwnerID(), "[SC_NPC122693_3]" )
	AddSpeakOption(  OwnerID(),TargetID(),"[SC_NPC122693_4]","lua_Z26NPC122693_1_2",0 )--�h�ֿ�����A�ֵ��ڡC
	AddSpeakOption(  OwnerID(),TargetID(),"[SC_NPC122693_5]","lua_Z26NPC122693_1_3",0 )--�ӶQ�F�a......
end
--���h4000��
function lua_Z26NPC122693_1_2()
	CloseSpeak(OwnerID())
	if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) >= 5000 then
		AddRoleValue( OwnerID() , EM_RoleValue_Money , -4000 )
		GiveBodyItem( OwnerID(), 242784, 1 )
		CastSpell( TargetID(), OwnerID() , 497860)
		SetSpeakDetail( OwnerID(), "[SC_NPC122693_6]" )
	else
		Say( TargetID(), "[SC_NPC122693_8]" )--�A�s5000�����S���A�o�N�S����n�ͪ��աC
	end
end
--���h1000��
function lua_Z26NPC122693_1_3()
	CloseSpeak(OwnerID())
	if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) >= 5000 then
		AddRoleValue( OwnerID() , EM_RoleValue_Money , -1000 )
		GiveBodyItem( OwnerID(), 242784, 1 )
		CastSpell( TargetID(), OwnerID() , 497860)
		SetSpeakDetail( OwnerID(), "[SC_NPC122693_7]" )
	else
		Say( TargetID(), "[SC_NPC122693_8]" )--�A�s5000�����S���A�o�N�S����n�ͪ��աC
	end
end

--122691�d����
function lua_quest426280_1()--�g�w�H��
	local tmp = SearchRangeNPC( OwnerID(),100 )
	local newNPC = 122701--��t�H��
	local x,y,z,dir 
		for i=0,#tmp,1 do		
			if ReadRoleValue( tmp[i],EM_RoleValue_OrgID ) == 122070 then--orgid =�b��Ʈw�����s��
				x,y,z,dir = DW_Location( tmp[i] )	--���o�Ө���y��
			end
		end
				local obj =CreateObj( newNPC,x,y,z,dir,1 )
				SetModeEx( obj  , EM_SetModeType_Mark, false )
				MoveToFlagEnabled( obj ,false )
				AddToPartition( obj,0 )
				AddBuff( TargetID(), 621881,0,17)
				PlayMotion ( OwnerID() , ruFUSION_ACTORSTATE_CRAFTING_BEGIN )
				Tell(TargetID() ,OwnerID() , "[SC_Q426280_1]")		--�K��K�o�˴N��F�K
				Sleep(20)
				ScriptMessage( TargetID(), TargetID(), 2, "[SC_Q426280_5]", 0 )--[122701]�ܤU�F�[�ƪ���
				PlayMotion ( OwnerID() , ruFUSION_ACTORSTATE_CRAFTING_END )
				Sleep(20)
				PlayMotion(obj,ruFUSION_ACTORSTATE_EMOTE_DRINK)
				Say( obj, "[SC_Q426280_2]" )--�Ѯv�K�{�b�u�����O�ܯ����ɶ��A�ڧ�A�L�ӬO���F�K
				Sleep(30)
				--PlayMotion(obj,ruFUSION_ACTORSTATE_DAZED_BEGIN)
				Say( obj, "[SC_Q426280_3]" )--���K������ڳܧ��ᦳ�I�Y���C
				Sleep(20)
				Say( obj, "[SC_Q426280_4]" )--�ڥ��^��b�@�U�A�Ѯv�A�ڭ̵����A�͡K
				Sleep(30)
				LuaFunc_moveToFlag( obj,780871,1,0 )	--���� �X�l ID �d��
				DelObj( obj)
end

--122695 �t��j������ܡA����426282
function szLuaScript_122695_1()
	if CheckAcceptQuest( OwnerID(),426283 ) and CheckBuff( OwnerID(),624552 )==false then
		LoadQuestOption(OwnerID())
		AddSpeakOption( OwnerID(),OwnerID(),"[SC_426283_2]","szLuaScript_122695_2",0)	--�����ڤƨ����H�ϡC
	elseif CheckAcceptQuest( OwnerID(),426282) and CheckFlag(OwnerID(),548126)==false then
		SetSpeakDetail( OwnerID(),"[SC_426282_1]")
		AddSpeakOption( OwnerID(),OwnerID(),"[SC_426282_2]","szLuaScript_122695_426282",0)	--���զr��
	else
		LoadQuestOption(OwnerID())
	end
end

function szLuaScript_122695_426282()
	SetSpeakDetail( OwnerID(),"[SC_426282_3]")	--���զr��
	SetFlag( OwnerID(),548126,1 )
end


--����426283�A�ܨ����t��Ϫ�
--�����ȥ�
function szScript_OnAccept_426283_1()
	ScriptMessage( TargetID(),TargetID(),2,"[SC_426283_1]",0 )	--���զr��
	AddBuff( TargetID(),622310,0,5 )	--�w����
	CastSpell( OwnerID(),TargetID(),851011 )	--�ܨ����t��Ϫ�
end
--��ܥ�
function szLuaScript_122695_2()
	CloseSpeak( OwnerID())
	ScriptMessage( OwnerID(),OwnerID(),2,"[SC_426283_1]",0 )	--���զr��
	AddBuff( OwnerID(),622310,0,5 )	--�w����
	CastSpell( TargetID(),OwnerID(),851011 )	--�ܨ����t��Ϫ�
end

--242634������(�ϥΪ��~)
function Z26_ITEM242634_00() 
	local Player = OwnerID()
		DW_CancelTypeBuff( 68 , Player) 
		BeginPlot( Player , "ItemUseOKScript_242634_2" , 0 ) 
end
--�������]��
function ItemUseOKScript_242634_2()
	local ID = OwnerID() 	--���a
	if BeginCastBarEvent( ID, ID,"[SC_242634_USE]", 50 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "ItemUseOKScript_242634_3" ) ~= 1 then
		ScriptMessage( ID, ID, 0,"[SAY_NPC_BUSY]", 0 );--�ؼЦ��L��
		return
	end
end
function ItemUseOKScript_242634_3(ObjID,CheckStatus)--��˦w�˳���
	local ID = OwnerID() --���a
	if ( CheckStatus ~= 0 ) then
		if ( CheckStatus > 0 ) then
			-- ���\
			EndCastBar( ID, CheckStatus );
			CastSpell( ID , ID , 851025 )
			CallPlot( ID,"Z26_ITEM242634_01",0 )
		else
			-- ����
			EndCastBar( ID, CheckStatus );
		end
	end
end
function Z26_ITEM242634_01() 
	Sleep(5)
	ChangeZone( OwnerID(), 25, -1, -7937, 1680, -9815, 165 )
--	SetPosByFlag( OwnerID(), 780871 , 2 )
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_CROUCH_BEGIN)
	CastSpell( OwnerID() , OwnerID() , 851025 )
	Sleep(20)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_CROUCH_END)
	ScriptMessage( OwnerID(), OwnerID(), 3, "[SC_ITEM242634_1]", 0 )--[122694]�G�ڵ��ݳo�@��w�g�\�[�A�O�ɭ����ڭ̭��ﭱ�ͽ�����w�����ơC
	CastSpell( OwnerID() , OwnerID() , 851025 )
end

--�P���F�t��122694���
function szLuaScript_122694_1()
	LoadQuestOption(OwnerID())
	if CheckAcceptQuest( OwnerID(),426281) and CheckFlag( OwnerID(),548125)==false then
		SetFlag( OwnerID(),548125,1)
		CloseSpeak(OwnerID())
	end
end
--���Ȥj�a���O�СA�P�H�����
function szLuaScript_122704_1()
	LoadQuestOption(OwnerID())
	if CheckAcceptQuest( OwnerID(),426283) and CheckBuff( OwnerID(),624552 ) and CheckBuff( OwnerID(),622310 )==false  then
		AddSpeakOption( OwnerID(),OwnerID(),"[SC_426283_3]","szLuaScript_122704_426283",0)	--����A���O�q�C
	end
end
function szLuaScript_122704_426283()
	CloseSpeak( OwnerID() )
	CancelBuff( OwnerID(),624552 )		--�Ѱ��ܨ����A
--	AddBuff( OwnerID(),621881,0,10 )	--������
	CallPlot( OwnerID(),"Show_426283_1",0 )	--
end
function Show_426283_1()
--	local tmp = SearchRangePlayer( OwnerID(),80 )
	local num = GetPartyID( OwnerID(), -1 )	--�d�����
		if num==0 then 
			if CheckAcceptQuest( OwnerID(),426283) then
				AddBuff( OwnerID(),622310,0,15 )	--�w����
				CallPlot( OwnerID(),"Show_426283_2",0 )
			end
			return
		end

		for i =1,num,1 do
			local menber = GetPartyID( OwnerID(), i ) 
			if CheckAcceptQuest( menber,426283) then
				AddBuff( menber,622310,0,15 )	--�w����
				CallPlot( menber,"Show_426283_2",0 )
			end
		end
end
function Show_426283_2()
	Sleep( 10 )
	ScriptMessage( OwnerID(),OwnerID(),2,"[SC_424528_28]",0)	--�o�K
	Sleep( 30 )
	ScriptMessage( OwnerID(),OwnerID(),2,"[SC_426283_4]",0)		--�o�O�ڶܡK
	Sleep( 30 )
	ScriptMessage( OwnerID(),OwnerID(),2,"[SC_426283_5]",0)		--�A�O�K[122054]�K
	Sleep( 30 )
	ScriptMessage( OwnerID(),OwnerID(),2,"[SC_426283_6]",0)		--�o��C�K���ۧڪ��ϩR�K
	Sleep( 30 )
	ScriptMessage( OwnerID(),OwnerID(),2,"[SC_426283_7]",0)		--�P�ˡK�֦������O�q�K
	Sleep( 20 )
		if CheckAcceptQuest( OwnerID(),426283) then
			SetFlag( OwnerID(),548127,1 )	
		end
end
--�P122696�H����ܡA�ѥ���426284 �����C
function szLuaScript_122696_1()
	if CheckAcceptQuest( OwnerID(),426284 ) and CheckFlag( OwnerID(),548128)==false then
		SetSpeakDetail( OwnerID(),"[SC_426284_1]" )	--��~�K���G���F�@�q��
		AddSpeakOption( OwnerID(),OwnerID(),"[SC_426284_2]","szLuaScript_122704_426284",0) --����C�H
	else
		LoadQuestOption(OwnerID())
	end
end
function szLuaScript_122704_426284()
	SetSpeakDetail( OwnerID(),"[SC_426284_3]" )	--�O���K����C�ڭ̳������L�K
	AddSpeakOption( OwnerID(),OwnerID(),"[SC_426284_4]","szLuaScript_122704_426284_NO",0)
	AddSpeakOption( OwnerID(),OwnerID(),"[SC_426284_5]","szLuaScript_122704_426284_NO",0)
	AddSpeakOption( OwnerID(),OwnerID(),"[SC_ELANDSAAR]","szLuaScript_122704_426284_YES",0)
	AddSpeakOption( OwnerID(),OwnerID(),"[SC_426284_6]","szLuaScript_122704_426284_NO",0)
end
--���諸��
function szLuaScript_122704_426284_YES()
	CloseSpeak( OwnerID() )
	tell( OwnerID() ,TargetID() ,"[SC_426284_7]");
	SetFlag( OwnerID(),548128,1)
end
--��������
function szLuaScript_122704_426284_NO()
	CloseSpeak( OwnerID() )
	tell( OwnerID() ,TargetID() ,"[SC_426284_8]");
end

--�P�N���ܡC
function szQuestNpcText_122698()
	if CheckAcceptQuest( OwnerID(),426287) then
		SetSpeakDetail( OwnerID(),"[SC_426287_1]" )
		AddSpeakOption( OwnerID(),OwnerID(),"[SC_426287_2]","szQuestNpcText_122698_1",0)
	else
		LoadQuestOption(OwnerID())
	end
end
--����ܡA��obj����t
function szQuestNpcText_122698_1()
	CloseSpeak( OwnerID() )
	local tmpObj = SearchRangeNPC( TargetID(),50 )
	local tmpNum = 0
		for i=0,#tmpObj,1 do
			if ReadRoleValue( tmpObj[i],EM_RoleValue_OrgID )==116858 then
				tmpNum = tmpNum + 1
			end
		end
		if tmpNum>=1 then
			ScriptMessage( OwnerID(),OwnerID(),3,"[SC_424528_3]",0)	--��t���b�i�椤�A�еy�ԡK
		else
			local x,y,z,dir = DW_Location( TargetID() )
			local obj = CreateObj( 116858,x,y,z,dir,1 )
				SetModeEx( obj, EM_SetModeType_Show, false )
				AddToPartition( obj, 0 )
				CallPlot( obj,"Show_426287_1",0 )
		end
end
--����t
function Show_426287_1(  )
	local player ={}
	local play2 = {}
	local tmpPlayer = SearchRangePlayer( OwnerID(),100 )
	local x,y,z,dir = DW_Location( OwnerID() )
	local Jill = CreateObj( 122708,x,y,z,dir,1 )
		AddToPartition( Jill,0 )
		for i =0, #tmpPlayer do
			if CheckAcceptQuest( tmpPlayer[i],426287 ) then
				AddBuff( tmpPlayer[i],621881,0,12 )
				table.insert( player,tmpPlayer[i] )
			end
		end
			Sleep(20)
				Say( Jill, "[SC_426287_3]" )	--���K�n�w�K�ګr��F�K�ťۡH
			Sleep(30)
				SetDefIdleMotion( Jill,ruFUSION_MIME_JUMP_LOOP )
				Say( Jill, "[SC_426287_4]" )	--�o�ӬO�����ѥ]���K�A���O�d�������A���ܡH
			Sleep(30)
				Say( Jill, "[SC_426287_5]" )
			Sleep(10)
			for i =1, #player do
				if CheckAcceptQuest( player[i],426287 ) and CheckBuff( player[i],621881 ) then
					AddBuff( player[i],620001,0,5 )
					table.insert( play2,player[i] )
				end
			end
			CastSpell( Jill,Jill,850908)
			Sleep(10)	
			--�����Ȫ��~��
			for i =1, #play2 do
				if CheckAcceptQuest( play2[i],426287 ) and CheckBuff( play2[i],620001 ) then
					ChangeZone( play2[i],23, 0, -10662, 935, -19883, 126 ) 
					SetFlag( play2[i],548170,1)
				end
			end
		DelObj( Jill )
		DelObj( OwnerID())
end

--122699���ۧQ��
function szLuaScript_122699()
	if CheckAcceptQuest( OwnerID(),426288) and CheckFlag( OwnerID(),548187 )==false then
		SetSpeakDetail( OwnerID(),"[SC_426288_1]" )
		AddSpeakOption( OwnerID(),OwnerID(),"[SC_426288_2]","szLuaScript_122699_1",0)
	else
		LoadQuestOption(OwnerID())
	end
end

--����ܡA��obj����t
function szLuaScript_122699_1()
	CloseSpeak( OwnerID() )
	local tmpObj = SearchRangeNPC( TargetID(),50 )
	local tmpNum = 0
		for i=0,#tmpObj,1 do
			if ReadRoleValue( tmpObj[i],EM_RoleValue_OrgID )==116858 then
				tmpNum = tmpNum + 1
			end
		end
		if tmpNum>=1 then
			ScriptMessage( OwnerID(),OwnerID(),3,"[SC_424528_3]",0)	--��t���b�i�椤�A�еy�ԡK
		else
			local x,y,z,dir = DW_Location( TargetID() )
			local obj = CreateObj( 116858,x,y,z,dir,1 )
				SetModeEx( obj, EM_SetModeType_Show, false )
				AddToPartition( obj, 0 )
				CallPlot( obj,"Show_426288_1",0 )
		end
end
--����t
function Show_426288_1()
	local player ={}
	local x,y,z,dir = DW_Location( OwnerID() )
	local Jill = CreateObj( 122708,x,y,z,dir,1 )
	local King = CreateObj( 122705,-10696,935,-19923,307,1 )
		AddToPartition( Jill, 0 )
		AddToPartition( King, 0 )
	local tmpPlayer = SearchRangePlayer( OwnerID(),100 )
			for i =0, #tmpPlayer do
				if CheckAcceptQuest( tmpPlayer[i],426288 ) then
					AddBuff( tmpPlayer[i],621881,0,16 )
					table.insert( player,tmpPlayer[i] )
				end
			end
			AdjustFaceDir( King,Jill,0 )
			Sleep(10)
				Say( King, "[SC_426288_3]" )	
			Sleep(20)
				Say( King, "[SC_426288_4]" )	
			Sleep(20)
				Say( Jill,"[SC_425786_07]")	
			Sleep(20)
				Say( King, "[SC_426288_5]" )
			Sleep(20)
				Say( Jill, "[SC_426288_6]" )
			Sleep(20)
				Say( Jill, "[SC_426288_7]" )
			Sleep(20)
				Say( King, "[SC_426288_8]" )
			Sleep(10)
			for i =1, #player do
				if CheckAcceptQuest( player[i],426288 ) and CheckBuff( player[i],621881 ) then
					SetFlag( player[i],548187,1)
				end
			end
		DelObj( Jill )
		DelObj( King )
		DelObj( OwnerID())
end
--�ۧڿU�N
function szLuaInitScript_122706()
	AddBuff( OwnerID(),621795,0,-1 )
end
--�R����t�Ϊ���
function lua_szLuaInitScript_DelSelf()
	Sleep(80)
	DelObj( OwnerID() )
end
--����426319�������Ȫ�t
function szScript_OnAccept_426319()
	local x,y,z,dir = DW_Location( OwnerID() )
	local obj = CreateObj( 122701,x,y,z,dir,1 )
	local Jill = CreateObj( 122692,-10693,935,-19893,84,1 )
		moveToFlagEnabled( obj, false )
		AddToPartition( Jill,0 )
		AddToPartition( obj,0 )
		AddBuff( TargetID(),621881,0, 6)
		Sleep(10)
		PlayMotion( TargetID(),ruFUSION_ACTORSTATE_EMOTE_SPEAK)
		Say( obj,"[SC_426319_1]")
		Sleep(10)
		LuaFunc_moveToFlag( obj,780871,11,0 )	--���� �X�l ID �d��
		Sleep(20)
		DelObj(Jill)
		DelObj(obj)
end