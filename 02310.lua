function dr_range424063_01() 								 --���b���~���k�N(���~�ϥΥH��Ĳ�o�k�N�A�ҥH���b�k�N���X�z����"�򥻪k�N")
											 --�򥻪k�N��������"����@��"
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)					   
	local own = OwnerID()								 --���ŧiown = OwnerID()�קK���ƫŧi�y���t�έt��			 		   
	local searchrange = SearchRangeNPC ( own , 100 )                       				 --�ХX�@��table�˱��d��npc
	local monsterid
	DW_CancelTypeBuff(68,own)
	if CheckAcceptQuest( own, 424063 ) == true and   						--�P�_���a�O�_��������
		CheckCompleteQuest( own, 424063 ) ~= true  then  				--�ˬd���a�O�_��������
		for i= 0 , table.getn(searchrange) , 1  do      					--table.getn(searchrange) = �ݳotable�̭����X�Ӽ�
		monsterid = ReadRoleValue(searchrange[i],EM_RoleValue_OrgID) 			--Ū���X�}�C�̭���npc��GID(��Ʈw�������󸹽X)
			if monsterid == 117790   then  		 			--XXXXX��J�p�n�P�_�����󸹽X
				local car = LuaFunc_CreateObjByObj ( 105495 , own) 		--�A�n�ͥX�Ӫ����A�ͦA�ϥΪ��~���H���y��
				SetModeEx(car,EM_SetModeType_AlignToSurface,false)  
				SetModeEx(car,EM_SetModeType_Mark,false)
				SetModeEx(car,EM_SetModeType_Strikback,false)      		--�������A�Q�����٤�
				SetModeEx(car,EM_SetModeType_HideName,false)        		--�����Y�W�O�_��ܦW��
				SetModeEx(car,EM_SetModeType_Searchenemy,false)   		--����ġA���|�h�l��
				SetModeEx(car,EM_SetModeType_Fight,true)			--�i���
				AddToPartition(car,RoomID)                        			--��{�Xcar�A�o��zone�A�t�XLuaFunc_CreateObjByObj��
				WriteRoleValue(car,EM_RoleValue_register1,own)     		--�⪱�a�g�J����reg1(�Ȧs��
				AttachObj( car , own, 0 ,"p_down","p_top" )
				CallPlot(car,"dr_laugh_01",own)                     			--����script
			end
		end	
	end
end

function dr_laugh_01(own) --beginplot����
	local car = OwnerID()
	local ttable = {}  --��searchnpc��
	local skilltime=0
	while 1 do
		sleep(10)
		skilltime=skilltime+1
		if skilltime%2==0 then                                           					--�C1���@��	(%=?)
			FA_GetHeight (car)							--�۰ʧ찪�סA�קK����a�ϤU�����}
			ttable = SearchRangeNPC ( OwnerID() , 100 )             			--���׶g��100���Ҧ����Ǩӥ���
			for i= 0 , table.getn(ttable) do
				sysCastSpellLv (OwnerID() , ttable[i] ,498368, 0 )  		--�J�إi�H�Ѧ� 496758 �o�����N�O�J��
				                                                        		   		--������ǼJ�ءA���}��n�Ƿ|����snpc������
				if  CheckAcceptQuest( own, 424063 ) ==false 
					or checkid(own)==0 
					or ReadRoleValue( own, EM_RoleValue_IsDead )== 1 then
					delobj(car)
				end	
			end
		end
	end
end


function dr_range424063_03() 								--setflag�����n���~
	local skilltime = 0       								--�ɶ�
	local skilltable = {}     								--���P��npc
	local monsterid
	while 1 do
	sleep(10)
	skilltime=skilltime+1
		if skilltime%2 == 0 then   							--2���@��
			--say(own,"7")
			skilltable = SearchRangeNPC ( OwnerID() , 100 )             			--���g��100���Ҧ�����
			for i=0 , table.getn(skilltable) do
				monsterid = ReadRoleValue(skilltable[i],EM_RoleValue_OrgID)
				if monsterid == 105495   then 					 --XXXX=��
					local master = ReadRoleValue(skilltable[i],EM_RoleValue_register1)  --Ū�������D�H
					SetFlag( master, 544892, 1 ) 				 --�����l�D�HXXXXXX�����n����
					delobj(skilltable[i])
				end
			end	
		end	
	end
end

function Lua_drsayno()
	local Obj=OwnerID()
	say(obj,"f**k")
end


function LuaQ_drcheck_01()  --�b���|���E�p������~��ϥ�
	local tableA={}
	local x = 0
	local own = OwnerID()
	tableA = SearchRangeNPC ( own , 50 )  --�d��
	-say(OwnerID(),"tableA = "..table.getn(tableA))
		for i=0, table.getn(tableA) do
			--say(OwnerID(),"tableA"..i+1 .."= "..ReadRoleValue( tableA[i] , EM_RoleValue_OrgID))
			if	ReadRoleValue( tableA[i] , EM_RoleValue_OrgID) == 117790  then --�n�P�_��NPC
				x=x+1
			--else
				--ScriptMessage( OwnerID(), 0 , 2 ,"[SC_104140_08]" , 2 )
			end
		end
		--say(OwnerID(),X)
		if x ~=0 then
			return true
		else
			ScriptMessage( own, own , 2 ,"[SC_424063_01]" , 2 ) --�ݭnXXXXX
			return false
		end	
end	

function LuaQ_drCheck_02()	--�b���|���E�p������~��ϥ�
	local tableX={}
	local obj = OwnerID()
	local Y=0
	tableX = SearchRangeNPC(obj,50)
	for i = 0,table.getn(tableX), 1 do
		if ReadRoleValue(tableX[i],EM_RoleValue_OrgID) == 117790 then
		Y = Y+1
		end
	end
	
	if Y~=0 then
		return true
	else 
		ScriptMessage( obj, obj, 2 ,"[SC_424063_01]" , 2 )
		return false
	end
end


function Lua_drwar_matrix()

--		<<�y�� Matrix ��ƥN���m���ܷN��>>
-- [1]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
-- [2]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
-- [3]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
--               		                :
-- [Count]	[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
	local dis = 15
	local count = 3 --�}�C���j�p�A��J3 �|�O 3*3 ���}�C�F���L�]����ƥ������_�ơA�ҥH��J 4 �|�O 5*4 ���}�C�C
	local checktime = 10 --�P�_���ɶ����Z�A�ƭȷU�C�A�P�_���W�v�U���A�U�۵M�A���Ӫ��귽�]�U�h
	local ReviveTime = 600000  --��}�C����������������ɡA�i��}�C���m���ʧ@�A�p�G�� -1 �A�N�|���� OwnerID() �]�w�����ͮɶ����m
	local circle = 6000  --�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��

--�إ߳o�Ӱ}�C
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 

--�إߤ@�� table�A�b�Q���ͪ��󪺦�m�� LuaFunc_CreateNPCByMatrix(ObjID,Matrix,A,B ) ���ͪ���C �䤤�|�ӼƭȨ̧ǥN�� 1.�n�ͦ�������ID 2.�@����Ǫ��}�C 3.�C��m 4.���m
	local ObjMatrix ={}
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(117820,Matrix,2,-1 )
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(117820,Matrix,2, 1 )
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(117820,Matrix,2, 0 )
--	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(100054,Matrix,1, 0 )
--	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(110001,Matrix,2, 1 )
--	ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(110001,Matrix,2, 0 )
--���� PID �H�� MONEY �N�@���@�}�l�x�s��ƩҥΡA�p�G�n�ܧ󤺳����ȡA�Цܤ� sleep( checktime )

--�Ѱj��禡Ū�J��ơA�ӱ���Ҧ��}�C�������󲾰�
	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	--���Ӽƭȶ��Ǭ� 1.�إߪ�����ҦbTABLE 2.�إߪ��}�C 3.���Z 4.�}�C���j�p 5.�P�_���ɶ� 6.�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��
	--PS.�p�G�]�w���� NPC ���W���� SCRIPT�A�h�g������ 0 �� �ANPC ���ͫ�N���|�۰ʱ� SCRIPT

--�N�ѦҪ���]�w�^��Ӫ��X���I
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
--�n�D���s�����l�@��
	BeginPlot( OwnerID() , "Lua_drwar_matrix" , 0 )
end

function Lua_drwar_matrix_Reset()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_drwar_matrix" , 0 )
end


------------------------------------------------------------------------------
function LuaQ_drCheckFlag_01()        --�F�_�������ȹ��
	LoadQuestOption( OwnerID() )
	local x = CheckAcceptQuest( OwnerID(),  424187 )
	local y = CheckFlag(OwnerID(), 544910)
	if x == true and y==true  then
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_117817_02]", "LuaQ_drCheckFlag_02", 0 )
	else 
	LoadQuestOption( OwnerID() )
	end 
end 

function LuaQ_drCheckFlag_02()
	SetSpeakDetail( OwnerID(), "[SC_117817_03]" )
	GiveBodyItem( OwnerID(), 544906, 1 )
end
-------------------------------------------------------------------
function dr123(Angle)
	SetDir( OwnerID(), Angle ) 
end
-----------------------------------------------------------------
function LuaQ_drspell_01()
	local obj = ownerID()
	 CastSpell(obj,obj,497182)
end

----------------------------------------------------
function LuaS_dr117741_01()			--�Ƿ�̹�ܿﶵ
	LoadQuestOption( OwnerID() )
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_117741_01]", "LuaS_dr117741_02", 0 )
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_117741_03]", "LuaS_dr117741_03", 0 )
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_117741_05]", "LuaS_dr117741_04", 0 )
end 

function LuaS_dr117741_02()			--�]��
	SetSpeakDetail( OwnerID(), "[SC_117741_02]" )
end

function LuaS_dr117741_03()			--�o�i
	SetSpeakDetail( OwnerID(), "[SC_117741_04]" )
end

function LuaS_dr117741_04()			--����
	SetSpeakDetail( OwnerID(), "[SC_117741_06]" )
end
--------------------------------------------------------------------------------
function  LuaQ_drborder117824_01()			--���Ĥ@��
	local Str = "["..GetUseItemGUID(OwnerID()).."]"		
	ClearBorder( OwnerID());			--��l�ƥ۸O����
	AddBorderPage( OwnerID(), "[SC_117824_01]")
	ShowBorder( OwnerID(),0, str,"ScriptBorder_Texture_Paper" )	
end

function  LuaQ_drborder117824_02()			--���ĤG��
	local Str = "["..GetUseItemGUID(OwnerID()).."]"		
	ClearBorder( OwnerID());			--��l�ƥ۸O����
	AddBorderPage( OwnerID(), "[SC_117824_02]")
	ShowBorder( OwnerID(),0, str,"ScriptBorder_Texture_Paper" )	
end

function  LuaQ_drborder117824_03()			--���ĤT��
	local Str = "["..GetUseItemGUID(OwnerID()).."]"		
	ClearBorder( OwnerID());			--��l�ƥ۸O����
	AddBorderPage( OwnerID(), "[SC_117824_03]")
	ShowBorder( OwnerID(),0, str,"ScriptBorder_Texture_Paper" )	
end

--------------------------------------------------------------------------------
function LuaQ_424061_02()				--�����H���٤����ȧR�����y
	DelBodyItem(OwnerID(),209242,8)
end

function LuaQ_424044_02()				--�o�H���������ȧR���ͻH
	DelBodyItem(OwnerID(),209233,10)
end

function LuaQ_424045_02()				--����������ȧR������
	DelBodyItem(OwnerID(),209235,1)
end

function LuaQ_424059_02()				--���ɧֻ��ȧR�����Y
	DelBodyItem(OwnerID(),209266,5)
end

function LuaQ_424062_02()				--�U�Q�������R���q��
	DelBodyItem(OwnerID(),209240,10)
end

function LuaQ_424050_02()				--�����������R������
	DelBodyItem(OwnerID(),209234,10)
end

function LuaQ_424194_02()				--�Y�D���d��R���Ф�
	DelBodyItem(OwnerID(),209316,12)
end

function LuaQ_424195_02()				--�ɤO�ϤO�R���Z��
	DelBodyItem(OwnerID(),209317,8)
	DelBodyItem(OwnerID(),209318,8)
end

function LuaQ_424185_02()				--�ͩR�����R���ؤl
	DelBodyItem(OwnerID(),209310,12)
	PlayMotion(targetID() , ruFUSION_ACTORSTATE_EMOTE_CRY)
end

--------------------------------------------------------------------------------
function andrus_keyitem117722_01()			--�ᥧ���Ѭr��
	DelBodyItem( OwnerID(),544841, 1 ) 
end

function LuaQ_drkeyitem209245_01()			--���������i�����
	DelBodyItem( OwnerID(),544878, 1 ) 
end

function LuaQ_drkeyitem209244_01()			--�������w�����
	DelBodyItem( OwnerID(),544871, 1 ) 
end

function LuaQ_drkeyitem209313_01()			--������
	DelBodyItem( OwnerID(),544909, 1 ) 
end

function LuaQ_drkeyitem209315_01()			--��̤��������
	DelBodyItem( OwnerID(),544907, 1 ) 
end


function Lua_drwar_matrix01()

--		<<�y�� Matrix ��ƥN���m���ܷN��>>
-- [1]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
-- [2]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
-- [3]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
--               		                :
-- [Count]	[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
	local dis = 15
	local count = 3 --�}�C���j�p�A��J3 �|�O 3*3 ���}�C�F���L�]����ƥ������_�ơA�ҥH��J 4 �|�O 5*4 ���}�C�C
	local checktime = 10 --�P�_���ɶ����Z�A�ƭȷU�C�A�P�_���W�v�U���A�U�۵M�A���Ӫ��귽�]�U�h
	local ReviveTime = 600000  --��}�C����������������ɡA�i��}�C���m���ʧ@�A�p�G�� -1 �A�N�|���� OwnerID() �]�w�����ͮɶ����m
	local circle = 6000  --�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��

--�إ߳o�Ӱ}�C
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 

--�إߤ@�� table�A�b�Q���ͪ��󪺦�m�� LuaFunc_CreateNPCByMatrix(ObjID,Matrix,A,B ) ���ͪ���C �䤤�|�ӼƭȨ̧ǥN�� 1.�n�ͦ�������ID 2.�@����Ǫ��}�C 3.�C��m 4.���m
	local ObjMatrix ={}
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(117820,Matrix,2,-1 )
	SetModeEx(ObjMatrix[1],EM_SetModeType_Mark,false)                ---�����Y�W�O�_��ܦW��
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(117820,Matrix,2, 1 )
	SetModeEx(ObjMatrix[2],EM_SetModeType_Mark,false)         
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(117820,Matrix,2, 0 )
	SetModeEx(ObjMatrix[3],EM_SetModeType_Mark,false)         
--	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(100054,Matrix,1, 0 )
--	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(110001,Matrix,2, 1 )
--	ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(110001,Matrix,2, 0 )
--���� PID �H�� MONEY �N�@���@�}�l�x�s��ƩҥΡA�p�G�n�ܧ󤺳����ȡA�Цܤ� sleep( checktime )

--�Ѱj��禡Ū�J��ơA�ӱ���Ҧ��}�C�������󲾰�
	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	--���Ӽƭȶ��Ǭ� 1.�إߪ�����ҦbTABLE 2.�إߪ��}�C 3.���Z 4.�}�C���j�p 5.�P�_���ɶ� 6.�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��
	--PS.�p�G�]�w���� NPC ���W���� SCRIPT�A�h�g������ 0 �� �ANPC ���ͫ�N���|�۰ʱ� SCRIPT

--�N�ѦҪ���]�w�^��Ӫ��X���I
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
--�n�D���s�����l�@��
	BeginPlot( OwnerID() , "Lua_drwar_matrix" , 0 )
end

function Lua_drwar_matrix_Reset01()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_drwar_matrix" , 0 )
end
