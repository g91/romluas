Function LuaS_423225_complete()
	AddBuff( TargetID()  , 506699 , 1 , 300 ) 
 	SetPosByFlag( TargetID()  , 780605 , 1 )
	AddBuff( TargetID()  , 503977 , 1 , 300 ) 				--����a
				
													--SetFlag(TargetID(),543951,1)
	local ith = Lua_DW_CreateObj("obj",115054,OwnerID())   --ith���H
	DisableQuest( ith , true )												--Lua_ObjDontTouch( ith ) 	---����Iith���H
	local NPC = LuaFunc_SearchNPCbyOrgID( OwnerID() ,115146  , 1000 , 0)
	local baden = Lua_DW_CreateObj("obj",115147,NPC)   --baden���H
	DisableQuest( baden , true )													--Lua_ObjDontTouch( ith ) 	---����Ibaden���H	
	AdjustFaceDir( ith ,TargetID(), 0 )				---ith���缾�a
	sleep(5)
	say(ith,"[SC_423225_0]")					---�����I�������}�B�n�K�A���O�@�ӤH�ӡH
	sleep(20)
	local tony2 = Lua_DW_CreateObj("flag" ,115148,780605,2)		---tony���H
	DisableQuest( tony2 , true )													--Lua_ObjDontTouch( tony2 ) 	---����Itony���H
	sleep(20)
	WriteRoleValue(tony2 , EM_RoleValue_IsWalk, 1 ) 		----tony2 move to tony 
	local tony = LuaFunc_SearchNPCbyOrgID( OwnerID() ,115149  , 1000 , 0)
	local X = ReadRoleValue ( tony, EM_RoleValue_X)
	local Y = ReadRoleValue ( tony, EM_RoleValue_Y)
	local Z = ReadRoleValue ( tony, EM_RoleValue_Z)
	AdjustFaceDir( ith ,tony2, 0 )
	sleep(10)
	say(ith,"[SC_423225_1]")       		---�X�ӧa��O�֡H
	sleep(30)
	say(tony2,"[SC_423225_2]")			---�O�ڡA�d�Ժ��C

	DW_WaitMoveTo( tony2 , X , Y, Z)
													--Move(tony2,X,Y,Z)
	say(ith,"[SC_423225_3]")			---���U�I
	sleep(30)
	say(ith,"[SC_423225_4]")			---�ӦM�I�F�I�z�@�ӤH�Ӫ��ܡH�S���@���H��H
	sleep(35)
	say(tony2,"[SC_423225_5]")			---�~�@�p�q���A�󥲭n�@�áH�n�F�A�{�b�n�h�ѨM[ZONE_SHADOR]���Ʊ��a�H
	sleep(40)
	say(ith,"[SC_423225_6]")			---�ڥ����H�^[ZONE_DAELANIS]�V[114367]�q���A�i���L�z���ݦb[ZONE_SHADOR]�A���ξ�ߡC
	sleep(35)
	say(tony2,"[SC_423225_7]")			---���å�u�|�ͮ�A���i���ߡC
	sleep(30)
	say(ith,"[SC_423225_8]")			---�z���w������O�̭��n���Ʊ��I
	sleep(25)
	AdjustFaceDir( ith ,baden, 0 )
	sleep(5)
	AdjustFaceDir( baden ,ith, 0 )	
	say(ith,"[SC_423225_9]")			---[115146]�A�A���^[ZONE_DAELANIS]�[�i[114367]�o��ơC
	sleep(30)
	PlayMotion(baden,ruFUSION_ACTORSTATE_EMOTE_SALUTE)
	say(baden,"[SC_423222_14]")		---�O!
	sleep(30)	
	DW_MoveToFlag(baden,780605 , 3,0 ,1)
	delobj(baden)
	sleep(20)
	delobj(ith)
	delobj(tony2)
	SetFlag(TargetID(),543951,0)	
	CancelBuff( TargetID()  , 506699  ) 	--�٪��a�ۥ�	
	CancelBuff( TargetID()  , 503977  ) 	--�٪��a�ۥ�
end

function LuaS_423226()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 423226 ) == true  then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423226_0]","LuaS_423226_1",0)	--�ƹΪ��A�ڭ̭n�i�h�F�H
	end
end

function LuaS_423226_1()
	if  ReadRoleValue( TargetID(), EM_RoleValue_Register +1) == 0  then                   --+1�Ω�423226�B�ƹΪ�not buzy
		CloseSpeak(OwnerID())
		BeginPlot(TargetID(),"LuaS_423226_2",2)
	else
		SetSpeakDetail(OwnerID(),"[SC_423226_1]")	--�y�ԡA�p�G�i��A�ڧƱ氡�U���������O���S�A�{�b[ZONE_SHADOR]���A�פ����A���ޡK�o�̭쥻�O�ڼ��x���a�m�C
							--���F���U���w�M�۷Q�A�ڥ������V���U�ب��@�f�C
	end
	
end


function Luas_423226_2()                              --ith=Owner , player = target
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,1 )			---ith is buzy
	AddBuff( TargetID()  , 506696 , 1 , 300 ) 					
	--SetFlag(TargetID(),543914,1)						--�t���}��+
	--say(TargetID(),"Owner")
	local ith = Lua_DW_CreateObj("obj",115155,OwnerID())   --ith���H
	DisableQuest( ith , true )		--Lua_ObjDontTouch( ith ) 	---����Iith���H	
	local kara = LuaFunc_SearchNPCbyOrgID( OwnerID() ,115149 , 10000, 0)		---��kara��m�гy�t����kara���H
	local kara2 = Lua_DW_CreateObj("obj",115156,kara)   --kara���H	
	DisableQuest( kara2 , true )		--Lua_ObjDontTouch( kara ) 	---����Ikara���H
	--local hadi = LuaFunc_SearchNPCbyOrgID( OwnerID() ,115150 , 10000, 0)		--��hadi��m�гy�t����hadi���H
	--local hadi2 = Lua_DW_CreateObj("obj",115152,hadi)   --hadi���H
	local hadi2 = Lua_DW_CreateObj("flag" ,115152,780606,13)
	DisableQuest( hadi2 , true )	
	--say(hadi,hadi2)
	--Lua_ObjDontTouch( hadi2 ) 	---����Ihadi���H	
	WriteRoleValue(ith , EM_RoleValue_IsWalk, 1 )
	WriteRoleValue(kara2 , EM_RoleValue_IsWalk, 1 )
	MoveToFlagEnabled(ith,false)
	MoveToFlagEnabled(kara2,false)

	local paper = LuaFunc_SearchNPCbyOrgID( hadi2 ,115151 , 10000 , 0)




	Check_Drama_DA( ith , 423226 , 200 ,506696) 				---check distance
	Callplot(ith,"LuaS_423226_ith_move",ith)
	DW_MoveToFlag(kara2,780606 , 11,0 ,1)	  		---move to �U�@�Ӧ�m

	if Lua_Check_Drama_Statu(ith) == false then			---���ӻ�
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )
		delobj(ith)
		delobj(kara2)
		delobj(hadi2)

		CancelBuff( TargetID()  , 506696  ) 	--�٪��a�ۥ�
		--SetFlag(TargetID(),543914,0)
		return		
	end

	DW_MoveToFlag(kara2,780606 , 9,0 ,1)	  		---move to �U�@�Ӧ�m

	if Lua_Check_Drama_Statu(ith) == false then			---���ӻ�
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )
		delobj(ith)
		delobj(kara2)
		delobj(hadi2)

		CancelBuff( TargetID()  , 506696  ) 	--�٪��a�ۥ�
		--SetFlag(TargetID(),543914,0)
		return		
	end
	
	DW_MoveToFlag(kara2,780606 , 10,0 ,1)	  		---move to �U�@�Ӧ�m

	if Lua_Check_Drama_Statu(ith) == false then			---���ӻ�
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )
		delobj(ith)
		delobj(kara2)
		delobj(hadi2)

		CancelBuff( TargetID()  , 506696  ) 	--�٪��a�ۥ�
		--SetFlag(TargetID(),543914,0)
		return		
	end
		
	DW_MoveToFlag(kara2,780605 , 4,0 ,1)	  		---move to �U�@�Ӧ�m

	if Lua_Check_Drama_Statu(ith) == false then			---���ӻ�
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )
		delobj(ith)
		delobj(kara2)
		delobj(hadi2)

		CancelBuff( TargetID()  , 506696  ) 	--�٪��a�ۥ�
		--SetFlag(TargetID(),543914,0)
		return		
	end	
	sleep(10)
 --	SetPosByFlag( TargetID()  , 780606 , 6 )
--	AddBuff( TargetID()  , 503977 , 1 , 3000 ) 				--����a	
	AdjustFaceDir( ith ,hadi2, 0 )	
	AdjustFaceDir( kara2 ,hadi2, 0 )	
	AdjustFaceDir( hadi2 ,ith, 0 )
	sleep(5)
	say(hadi2,"[SC_423226_2]")					---��Z�g�I�ڱ���ͽê��q���A�G�M�O�p�I
	sleep(25)
	say(ith,"[SC_423226_3]")					---���n�C
	sleep(20)
	say(hadi2,"[SC_423226_4]")					---�p�r�A�۱q�ѥ[�{���H�����[�è�§��A���M�N�d�b�F�ԥ��������̤F�C
	sleep(40)
	say(ith,"[SC_423226_5]")					---�ڲ{�b�O����M�h�Ϊ��ƹΪ��C
	sleep(30)
	say(hadi2,"[SC_423226_6]")					---�ڪ��D�A�Ϊ��O�u�j�N�x�v�����A��a�H
	sleep(30)
	say(ith,"[SC_423226_7]")					---�y�A���n�A�L�h���o���S���X�u��D��|ĳ�A�ӥB�A�ڻ��٩ڵ��䴩�d�����H
	sleep(40)
	say(hadi2,"[SC_423226_8]")					---�x�H�K�O�ڡA�o�ǳ��O�Ϫ̱q�F�ԥ��������ǨӪ��R�O�C�p�O�����S�a�^�ӡH
	sleep(35)
	say(ith,"[SC_423226_9]")					---�ڪ��T�O�����e�ӡA���O�A���i�઺�A�F�ԥ����S���o�X�o�˪��R�O�C
	sleep(35)
	say(kara2,"[SC_423226_10]")				---��A���i��I�ڤ~�S���K
	sleep(15)
	say(hadi2,"[SC_423226_11]")				---��Z�g�A�L�O�K�H
	sleep(15)	
	say(ith,"[SC_423226_12]")					---�S����A���n�A�p�����Ϫ̫e�ӡH
	sleep(35)
	say(hadi2,"[SC_423226_13]")				---�O�A�ӥB�ڽT�꦳����u�٥O�v�K�o�O���^�ơH


	Hide(paper)					

	sleep(30)
	say(hadi2,"[SC_423226_14]")				---�M�h�A�A�W�e�ӧ�u�٥O�v�M�Ϫ̿�d������������Z�g�ݬݡC
	CancelBuff( TargetID()  , 503977  ) 	--�٪��a�ۥ�

	AddBuff( TargetID()  , 506746 , 1 , 300 ) 
	local pig = Lua_DW_CreateObj("flag" ,115507,780606,14)
	DisableQuest( pig , true )
	DW_MoveToFlag(pig,780606 , 7,0 ,1)	
	AdjustDir( pig ,180 )
	Show(paper,0)
	--local KK = Lua_DW_CreateObj("obj",115218,paper)   --kara���H
	--SetModeEx( KK , EM_SetModeType_Gravity , false )	

	--say(ith,paper)
	
	AdjustFaceDir( kara2 ,pig, 0 )
	AdjustFaceDir( ith ,pig, 0 )	

	SetPlot(paper, "touch","LuaS_423226_3", 30)		---�٥O�i�I
	--AddBuff( paper  , 502140 , 1 , 3000 ) 				--paper stop shine	
	--CastSpell(paper,paper,490196)	

	SetPlot(ith, "touch","LuaS_423226_4", 30)		---ith�i�I,if ���٥O�I�i�o��432915
	sleep(40)


	local Time = 0
		for i = 1, 70 , 1 do						
		Time = Time + 1

				if Lua_Check_Drama_Statu(ith) == false then			---���ӻ�
					WriteRoleValue( OwnerID() , EM_RoleValue_Register+1 , 0 )
					--delobj(KK)
					delobj(ith)
					delobj(kara2)
					delobj(hadi2)
					delobj(pig)
					CancelBuff( TargetID()  , 506696  ) 	--
					CancelBuff( TargetID()  , 506746  ) 	--
					SetPlot(paper, "touch","", 0)
					return	
				end	
		
			if	Time>60		then				--30��ɶ���N�R����lNPC�A�^�_�쪬
				CancelBuff( TargetID()  , 506746  ) 	--
				SetPlot(ith, "touch","", 0)		---ith���H�I�L�ƥ�
				DelBodyItem(TargetID(),207269,1)
				AdjustFaceDir( ith ,hadi2, 0 )
				say(ith,"[SC_423226_27]")				---
				sleep(35)	
				Local x1,y1,z1
				x1 = GetMoveFlagValue( 780606 , 10 , EM_RoleValue_X )
				y1 = GetMoveFlagValue( 780606 , 10 , EM_RoleValue_Y )
				z1 = GetMoveFlagValue(780606 , 10 , EM_RoleValue_Z )
				move(ith,x1,y1,z1)
				move(kara2,x1,y1,z1)
				sleep(50)		
				DW_MoveToFlag(pig,780606 , 14,0 ,0)					


				--delobj(KK)
				delobj(ith)
				delobj(kara2)
				delobj(hadi2)
				delobj(pig)
				sleep(20)
				WriteRoleValue( OwnerID() , EM_RoleValue_Register+1 , 0 )

				CancelBuff( TargetID()  , 506696  ) 	--�٪��a�ۥ�
				--SetFlag(TargetID(),543914,0)
				SetPlot(paper, "touch","", 0)

				return
					
			end

			if Time == 15	or	Time == 30	or	Time == 45	then
			Tell(TargetID(),OwnerID(),"[SC_423226_28]")			--�ʫP
			end

			if	  CheckID( TargetID() ) == false	then		---���a�U�{
				WriteRoleValue( OwnerID() , EM_RoleValue_Register+1 , 0 )
				delobj(ith)
				--delobj(KK)
				delobj(kara2)
				delobj(hadi2)
				delobj(pig)
				CancelBuff( TargetID()  , 506746  ) 	--
				CancelBuff( TargetID()  , 506696  ) 	--�٪��a�ۥ�
				--SetFlag(TargetID(),543914,0)
				SetPlot(paper, "touch","", 0)
				return
			end
			if	CheckFlag( TargetID() , 543915 ) == true 	then	---finish��continue
				---i=40	
				break		
			end
		sleep(10)
	end

	CancelBuff( TargetID()  , 506746  ) 	---�ݤ����㰩	
	Local x1,y1,z1
	x1 = GetMoveFlagValue( 780606 , 14 , EM_RoleValue_X )
	y1 = GetMoveFlagValue( 780606 , 14 , EM_RoleValue_Y )
	z1 = GetMoveFlagValue(780606 , 14 , EM_RoleValue_Z )
	move(pig,x1,y1,z1)

	AdjustFaceDir( ith ,hadi2, 0 )
	AdjustFaceDir( kara2 ,ith, 0 )	

	
	SetPlot(paper, "touch","", 0)
	--Lua_ObjDontTouch( ith ) 	---����Iith���H
	SetPlot(ith, "touch","", 0)		---ith���H�I�L�ƥ�
 --	SetPosByFlag( TargetID()  , 780606 , 6 )
	AddBuff( TargetID()  , 503977 , 1 , 3000 ) 

	Local x2,y2,z2
	Local kara9 = LuaFunc_SearchNPCbyOrgID( kara2 ,115154  , 10000, 0)
	x2 = ReadRoleValue ( kara9, EM_RoleValue_X)
	y2 = ReadRoleValue ( kara9, EM_RoleValue_Y)
	z2 = ReadRoleValue ( kara9, EM_RoleValue_Z)
				--����a	
	Move(kara2,x2,y2,z2)		---kara�a��
	sleep(15)
	AdjustFaceDir( kara2 ,ith, 0 )
	PlayMotion(kara2,ruFUSION_ACTORSTATE_EMOTE_POINT)		---point �٥O
	say(kara2,"[SC_423226_15]")			---�W��������Q«��L�I�o���O�ڡK 
	sleep(10)
	ScriptMessage( TargetID() , TargetID() , 0 , "[SC_423226_16]" ,  "0xFFFFFF00" ) 
	ScriptMessage( TargetID() , TargetID() , 1 , "[SC_423226_16]" ,  "0xFFFFFF00" ) 
	sleep(30)

	delobj(pig)

	say(hadi2,"[SC_423226_17]")			---��Z�g�H�L��򪾹D���񦳨S���Q��ʹL�H
	sleep(30)

	

	say(ith,"[SC_423226_18]")				---���ܥJ���ˬd���ܡA�r��T��Q�ק�F�����A�p�໡���ݨϪ̪��˻��ܡH
	sleep(5)
	AdjustFaceDir( kara2 ,hadi2, 0 )
	sleep(30)	
	say(hadi2,"[SC_423226_19]")			---�Ŧ�u�v�A���Τj���P�ڨ��Ǫ��ͽît���h�A��K�իᦳ�@�D���ͩ������l�A�L�ਭ���h�ɧڬݨ����C
	sleep(40)	
	say(ith,"[SC_423226_20]")				---�p�����Ϫ̡A���ӬO�Q�����ӳq����D��|ĳ�|���������@��A�u�O�K�L�e�}�l�w�g���`�F�K�L�Ӫ��ɭԡA�����󲧼˶ܡH
	sleep(45)
	say(hadi2,"[SC_423226_21]")			---���F�y��a�դ��~�A�������⥿�`�C
	sleep(30)	
	say(ith,"[SC_423226_22]")				---�ƹ�W�A�ڭ̳̪��o����εo�ͤ@��ơA���`�w�[������Q�Y�ؤO�q�ޱ��A�٫��򬡰ʤF�X�~�C
	sleep(45)	
	say(hadi2,"[SC_423226_23]")			---�ޱ�����H����O�q�i�H����o�بơH�ޱ��̪��ت��O����H
	sleep(30)	
	say(ith,"[SC_423226_24]")				---�ثe���٤��M���A�p�����Ϫ̡A�ڦb�Q�K
	sleep(30)	
	say(hadi2,"[SC_423226_25]")			---���i��M��ξD�J���Ʊ��ۦP�H
	sleep(30)	
	say(ith,"[SC_423226_26]")				---��A�ڷ|�ФH�A�h���Ҩ���Ϫ̪��T�����`�ɶ��C
	sleep(30)	
	--say(ith,"you did")
	sleep(40)
	delobj(ith)
	delobj(kara2)
	delobj(hadi2)
	CancelBuff( TargetID()  , 506696  ) 	--
	--SetFlag(TargetID(),543914,0)
	SetFlag(TargetID(),543915,0)
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )
	CancelBuff( TargetID()  , 503977  ) 	--�٪��a�ۥ�
	if	CheckAcceptQuest ( TargetID()   , 423226 )	 == true	then
		SetFlag(TargetID(),543913,1)
	end
end

function killpaper()
	local paper = LuaFunc_SearchNPCbyOrgID( OwnerID() ,115151 , 10000 , 0)
	say(OwnerID(),"i catch "..paper)
	delobj(paper)
end
function LuaS_115507()
	SetIdleMotion( OwnerID() , ruFUSION_MIME_IDLE_STAND)
end

function LuaS_423226_ith_move(ith)
	Local x1,y1,z1
	Local ith9 = LuaFunc_SearchNPCbyOrgID( OwnerID() ,115153  , 10000, 0)
	x1 = ReadRoleValue ( ith9, EM_RoleValue_X)
	y1 = ReadRoleValue ( ith9, EM_RoleValue_Y)
	z1 = ReadRoleValue ( ith9, EM_RoleValue_Z)


	DW_MoveToFlag(ith,780606 , 8,0 ,1)	  		---move to �U�@�Ӧ�m
	DW_MoveToFlag(ith,780606 , 9,0 ,1)	  		---move to �U�@�Ӧ�m	
	DW_MoveToFlag(ith,780606 , 10,0 ,1)	  		---move to �U�@�Ӧ�m
	DW_MoveToFlag(ith,780606 , 12,0 ,1)	  		---move to �U�@�Ӧ�m
end


function LuaS_423226_3()                           --player=>owner ,  
	SetPlot(TargetID(),"touch","",0)
	if CountBodyItem ( OwnerID(), 207269 ) == 0 then
		GiveBodyItem(OwnerID(),207269,1)
	end
	--local KK = LuaFunc_SearchNPCbyOrgID( OwnerID() ,115218 , 10000 , 0)
	--say(OwnerID(),KK)
	--delobj(KK)
	CallPlot(TargetID(),"LuaFunc_ResetObj",TargetID())
	SetPlot(TargetID(), "touch","LuaS_423226_3", 30)		---�٥O�i�I	
end

function LuaS_423226_4()                           --player=>owner ,  

	--say(OwnerID(),"Owner")
	--say(TargetID(),"Target")
	if CountBodyItem ( OwnerID(), 207269 ) > 0 then
		DelBodyItem(OwnerID(),207269,1)
		SetFlag(OwnerID(),543915,1)
	end
end

function Check_Drama_DA( ObjID , QuestID , Range,Buff ) 
	if Range == nil or Type( Range ) ~= "number" then
		Range = 250
	end
	AddBuff( ObjID , 506345 , 0 , -1 )
	CallPlot( ObjID , "Check_Drama_DA_SUB" ,  QuestID , Range,Buff )
end

function Check_Drama_DA_SUB(QuestID , Range,Buff)
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Players = 0
	local Count = 0
	local Name = "[QuestID]"
	local Str = "[SC_QUEST_OVER_RANGE][$SETVAR1="..Name.."]"
	while 1 do
		Players = SetSearchAllPlayer(RoomID )
		Count = 0
		for i = 1 , Players , 1 do 
			local ID = GetSearchResult()
			if CheckID(ID) == true and CheckAcceptQuest(ID , QuestID ) == true and CheckBuff(ID , BUFF) == true	then
				if GetDistance( ID , OwnerID() ) > Range then
					ScriptMessage( ID , ID , 0 , "[SC_SOFAR]" , 0 ) --�A�w�g���}���ȡG[$VAR1] ���ˬd�d��
					ScriptMessage( ID , ID , 1 , "[SC_SOFAR]" , 0 ) --�A�w�g���}���ȡG[$VAR1] ���ˬd�d��
				else
					Count = Count + 1
				end
			end
		end
		if Count == 0 then
			CancelBuff( OwnerID() , 506345 )
			break
		end
		sleep( 30 + Rand(20) )
	end
end

function LuaS_423227()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 423227 ) == true and CheckFlag( OwnerID() , 543912) == false then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423227_0]","LuaS_423227_1",0)	--�ڭ̭n�h�߰ݲĤ@���k�F�H
	end
end

function LuaS_115159()

	WriteRoleValue(OwnerID()  , EM_RoleValue_IsWalk, 1 )


end
function LuaS_423227_1()
	if  ReadRoleValue( TargetID(), EM_RoleValue_Register +1) == 0  then                   --+1�Ω�423227�B�ƹΪ�not buzy
		CloseSpeak(OwnerID())
		BeginPlot(TargetID(),"LuaS_423227_2",2)
	else
		SetSpeakDetail(OwnerID(),"[SC_423227_1]")	---���S���i��K�o�]�w�g���O�쥻���o�F�H

							---�ڷQ�A���D�ګ����O����K

							---���O�A�Q������h�Q�ȤҤH�M�Ϫ̳��e�{�D���`�H�����A�A���i��|���{�b���������o��K

							---([114368]���J�I�q��ҡK)
	end
	
end

function LuaS_423227_2()

	WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,1 )	---ith is buzy
	AddBuff( TargetID()  , 506697 , 1 , 300 ) 	

	--SetFlag(TargetID(),543952,1)	---�t���}��+

	CallPlot(OwnerID(),"LuaS_Check_noquest_single", 1 , 1 , 423227 , 506697,TargetID(),OwnerID(),100)

	local ith = Lua_DW_CreateObj("obj",115159,OwnerID())   --ith���H
	DisableQuest( ith , true )
	
	--say(OwnerID(),"OwnerID")
	--say(TargetID(),"TargetID")	
	--Lua_ObjDontTouch( ith ) 	---����Iith���H	
	local kara = LuaFunc_SearchNPCbyOrgID( OwnerID() ,115154 , 10000 , 0)	---��kara��m�гy�t����kara���H
	local kara2 = Lua_DW_CreateObj("obj",115157,kara)   --kara���H	
	DisableQuest( kara2 , true )		--Lua_ObjDontTouch( kara ) 	---����Ikara���H
	local hadi = LuaFunc_SearchNPCbyOrgID( OwnerID() ,115150 , 10000 , 0)	---��hadi��m�гy�t����hadi���H
	local hadi2 = Lua_DW_CreateObj("obj",115158,hadi)   --hadi���H
	DisableQuest( hadi2 , true )

	Check_Drama_DA( ith , 423227 , 100,506697 ) 				---check distance
--	sleep(20)
	sleep(20)	
	WriteRoleValue(ith  , EM_RoleValue_IsWalk, 1 )	
	AdjustFaceDir( ith ,hadi2, 0 )	
	AdjustFaceDir( kara2 ,hadi2, 0 )	
	AdjustFaceDir( hadi2 ,ith, 0 )
	sleep(20)
	--say(ith,"[SC_423227_2]")				---��A���|�����A�o�O�ڼ��x���������C
	--sleep(30)


	DW_MoveToFlag(ith,780606 , 1,0 ,1)

	if Lua_Check_Drama_Statu(ith) == false then			---���ӻ�
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )
		delobj(ith)
		delobj(kara2)
		delobj(hadi2)
		CancelBuff( TargetID()  , 506697  ) 	--
		return	
	end

	say(ith,"[SC_423227_3]")				---���n�A����[ZONE_KAIYA_VILLAGE]�{�b���K
	local million = Lua_DW_CreateObj("flag" ,115160,780606,2)	     ---million���H	
	DisableQuest( million , true )
	WriteRoleValue(million , EM_RoleValue_IsWalk, 1 )
	DW_MoveToFlag(million,780606 , 3,0 ,1)


	AdjustFaceDir( hadi2 ,million, 0 )
	AdjustFaceDir( million ,hadi2, 0 )
	
	if Lua_Check_Drama_Statu(ith) == false then			---���ӻ�
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )
		--say(ith,"no")
		delobj(ith)
		delobj(kara2)
		delobj(hadi2)
		delobj(million)
		CancelBuff( TargetID()  , 506697  ) 	--
		return	
	end


	PlayMotion(million,ruFUSION_ACTORSTATE_EMOTE_POINT)		---point  hadi	
	sleep(10)
	say(million,"[SC_423227_4]")			---�S���Ϊ��I�w�g�����F�A�I���d�о䪺�y�D�A�p�O���v���o�H�A�p�O�o�H�I
	sleep(5)
	AdjustFaceDir( ith ,million, 0 )	
	AdjustFaceDir( kara2 ,million, 0 )	
	sleep(40)	

	if	CheckBuff(TargetID() , 506697 ) == true	then
	ScriptMessage( TargetID() , TargetID() , 0 , "[SC_423227_19]" ,  "0xFFFFFF00" ) 		---(�e�������G���J�@�د�M�o�h�����p�K)
	ScriptMessage( TargetID() , TargetID() , 1 , "[SC_423227_19]" ,  "0xFFFFFF00" ) 
	end	

	PlayMotion(million,	ruFUSION_MIME_DAZED)		---dazed
	say(hadi2,"[SC_423227_5]")				---�e�����K
	sleep(30)	
	PlayMotion(million, ruFUSION_MIME_DAZED)
	say(ith,"[SC_423227_6]")				---�p�f�H
	sleep(20)	
	AdjustFaceDir( ith ,hadi2, 0 )	
	say(ith,"[SC_423227_7]")				---���n�A�L�h���٦��o�ͤ���Ʊ��ܡH
	sleep(20)	
	say(hadi2,"[SC_423227_8]")				---���K�p���D�d�о��ڭ̪����n�ʡK
	sleep(30)	
	PlayMotion(million, ruFUSION_MIME_DAZED)
	say(million,"[SC_423227_9]")			---�d�о�K�P�����޾ɫ��I�Z�H���V���~�A[ZONE_SHADOR]�w�g�ǩӤF�X�ʦ~�A�O���K�X�ʦ~�ӡK����û��K
	sleep(5)
	AdjustFaceDir( ith ,million, 0 )	
	sleep(40)			
	say(million,"[SC_423227_10]")			---�u�n�P�������A�d�о�ä��|���X�����@�ѡA�L�׬O���U[ZONE_KAIYA_VILLAGE]�άO�X�u��D��|ĳ�A�d�о䦭�w���ޥX���T����V�C
	sleep(40)	

	if Lua_Check_Drama_Statu(ith) == false then			---���ӻ�
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )
		--say(ith,"no")
		delobj(ith)
		delobj(kara2)
		delobj(hadi2)
		delobj(million)
		CancelBuff( TargetID()  , 506697  ) 	--
		return	
	end



	PlayMotion(million,ruFUSION_ACTORSTATE_EMOTE_POINT)		---point hadi
	say(million,"[SC_423227_11]")			---�O�p�I�p���ӡB�p���ӡA�p���णť�d�о�I����K
	sleep(30)	
	if	CheckBuff(TargetID() , 506697 ) == true	then
	ScriptMessage( TargetID() , TargetID() , 0 , "[SC_423227_20]" ,  "0xFFFFFF00" ) 	---(�e�������G�A�׳��J�@�د�M�o�h�����p�K)
	ScriptMessage( TargetID() , TargetID() , 1 , "[SC_423227_20]" ,  "0xFFFFFF00" ) 
	end	

	PlayMotion(million,	ruFUSION_MIME_DAZED)		---dazed
	say(hadi2,"[SC_423227_12]")			---�N�p�A��ť�����A�ڿ�ܬ۫H[ZONE_DAELANIS]�����Ϫ̶ǻ����٥O�A���X�H�I�d�о䪺�M�w�C
	sleep(5)
	AdjustFaceDir( ith ,hadi2, 0 )	
	sleep(35)	
	PlayMotion(million, ruFUSION_MIME_DAZED)
	say(ith,"[SC_423227_13]")				---���O�A���n�A�p�f�ݰ_�Ӧ��I�K�_�ǡH
	sleep(30)	
	say(hadi2,"[SC_423227_14]")			---�O�ڡK�ګܾ�ߡA���~�Ӵx�ޤd�о䪺���k���|�ܱo���ǲ��`�A�̪�o�ر��p���Y���F�C
	sleep(40)	
	say(hadi2,"[SC_423227_15]")			---�ר�b�ڻP�o���F�X�u�B�䴩���M�w�o�͹L�X���Ĭ��K
	--PlayMotion(million, ruFUSION_ACTORSTATE_DAZED_END)
	sleep(30)	

	if Lua_Check_Drama_Statu(ith) == false then			---���ӻ�
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )
		--say(ith,"no")
		delobj(ith)
		delobj(kara2)
		delobj(hadi2)
		delobj(million)
		CancelBuff( TargetID()  , 506697  ) 	--
		return	
	end


	PlayMotion(million,ruFUSION_ACTORSTATE_EMOTE_POINT)		---point hadi	
	sleep(10)
	say(million,"[SC_423227_16]")			---���تA�q�H���I�I��u�d�Сv��g�D�N���S���R�ͩR���Q�k�I
	sleep(5)
	AdjustFaceDir( ith ,million, 0 )	
	sleep(15)	
	WriteRoleValue(million , EM_RoleValue_IsWalk, 0 )

	--LuaFunc_MoveToFlag( million,780606 , 3,0 )

	
	--DW_MoveToFlag(million,780606 , 4,0 ,1)
	--sleep(5)



	DW_MoveToFlag(million,780606 , 4,0 ,1)
	AdjustFaceDir( ith ,million, 0 )	
	AdjustFaceDir( kara2 ,million, 0 )
	PlayMotion(million, ruFUSION_ACTORSTATE_ATTACK_1H)
	say(ith,"[SC_423227_17]")				---�e�����I

	sleep(3)			
		
	PlayMotion(ith, ruFUSION_ACTORSTATE_PARRY_BOW)	
	sleep(2)
	PlayMotion(million, ruFUSION_ACTORSTATE_DEAD)	
	--PlayMotion(million, ruFUSION_MIME_SPAWN)
	sleep(40)	


	PlayMotion( ith ,ruFUSION_ACTORSTATE_CROUCH_BEGIN)	   --�|��§

	say(ith,"[SC_423227_5]")				---�e�����K
	sleep(20)		
	say(hadi2,"[SC_423227_18]")			---�ͽáI�߲ĤT���k�h�᭱�𮧡I
	local knight = Lua_DW_CreateObj("flag" ,115161,780606,5)	     ---knight���H

	DisableQuest( knight , true )	
	sleep(30)
	WriteRoleValue(knight , EM_RoleValue_IsWalk, 1 )
	say(knight,"[SC_423222_14]")
	sleep(20)
	PlayMotion( knight ,ruFUSION_ACTORSTATE_CROUCH_END)	   --�|��§
	sleep(10)
	Local x1,y1,z1
	x1 = ReadRoleValue ( OwnerID() , EM_RoleValue_X)
	y1 = ReadRoleValue ( OwnerID() , EM_RoleValue_Y)
	z1 = ReadRoleValue ( OwnerID() , EM_RoleValue_Z)
	move(ith,x1,y1,z1)
	DW_MoveToFlag(knight,780606 , 4,0 ,1)
	sleep(20)
	AdjustFaceDir( ith ,million, 0 )		
	WriteRoleValue(knight , EM_RoleValue_IsWalk, 1 )
	PlayMotion( knight ,ruFUSION_ACTORSTATE_CROUCH_BEGIN)	   --�|��§
	sleep(20)
	delobj(million)
	PlayMotion( knight ,ruFUSION_ACTORSTATE_CROUCH_END)	   --�|��§

	DW_MoveToFlag(knight,780606 , 2,0 ,1)

	delobj(knight)	
	sleep(20)

	delobj(ith)
	delobj(hadi2)
	delobj(kara2)
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )	---ith not buzy
	--SetFlag(TargetID(),543952,0)					---�t���}��-
	if	CheckBuff(TargetID() , 506697 ) == true	and		CheckAcceptQuest ( TargetID()   , 423227 )	 == true	then
		SetFlag(TargetID(),543912,1)
	end
	CancelBuff( TargetID()  , 506697  ) 	--

end
function reflag()
	SetFlag(OwnerID(),543952,0)
	SetFlag(OwnerID(),543914,0)
	SetFlag(OwnerID(),543913,0)
	SetFlag(OwnerID(),543912,0)
end

function LuaS_115163()
	SetDefIdleMotion( OwnerID() ,ruFUSION_MIME_IDLE_SLEEP)	
end
