--�Ұʾ�
--EM_RoleValue_PID �D���
--EM_RoleValue_Register1
--EM_RoleValue_Register2 B
--EM_RoleValue_Register3 O
--EM_RoleValue_Register4 �԰�
--EM_RoleValue_Register5 ��
--EM_RoleValue_Register6 ��
--EM_RoleValue_Register7 ��
--EM_RoleValue_Register8 ��
--EM_RoleValue_Register9 

--baron
--EM_RoleValue_PID 
--EM_RoleValue_Register1
--EM_RoleValue_Register2 
--EM_RoleValue_Register3 
--EM_RoleValue_Register4 
--EM_RoleValue_Register5
--EM_RoleValue_Register6 
--EM_RoleValue_Register7 �k��
--EM_RoleValue_Register8 ��
--EM_RoleValue_Register9 �D����

--office holder
--EM_RoleValue_PID 
--EM_RoleValue_Register1
--EM_RoleValue_Register2 
--EM_RoleValue_Register3 
--EM_RoleValue_Register4 
--EM_RoleValue_Register5 
--EM_RoleValue_Register6 
--EM_RoleValue_Register7 
--EM_RoleValue_Register8 
--EM_RoleValue_Register9 �D����

--4 ���F�x ���s  
--5 ���F�x �԰�
--6 ��h���s
--7 ��h�԰�
--8 ���l���s
--9 ���l�԰�
--10 ���l���`


--------------------------------------------------------------�D��
function Cang_129_2bo_all_e()

	local Pass = 0	--�Ĥ@�h��
	local Pass2 = 0	--�ĤG�h��
	local sys = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
	local Queen
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local Count = 0
	local Count1 = 0
	--���w�k���@��	
	Queen = CreateObj( 103936, 2124, 600, 2036, 38.8, 1)
	SetModeEX( Queen  , EM_SetModeType_Gravity , false )--���O
	SetModeEx( Queen  , EM_SetModeType_Move, false )--����
	SetModeEx( Queen  , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( Queen  , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( Queen  , EM_SetModeType_Strikback, false )--����		
	--Queen = CreateObjByFlag( 103936, 780668, 0, 1) 
	AddToPartition( Queen , RoomID )
	CastSpellLV( Queen, Queen, 495712 , 1 )
	sleep(10)
	ScriptMessage( Queen , -1 , 2 , "[SC_103942_01]", 1 )	
----------���w�k���I����w�N�A�۳���w���l
	local corpse01 = ReadRoleValue(sys,EM_RoleValue_Register8)
	local corpse02 = ReadRoleValue(sys,EM_RoleValue_Register9)	
	local X1 = ReadRoleValue( corpse01 , EM_RoleValue_X )
	local Y1 = ReadRoleValue( corpse01 , EM_RoleValue_Y )
	local Z1 = ReadRoleValue( corpse01 , EM_RoleValue_Z )
	local Dir1 = ReadRoleValue( corpse01 , EM_RoleValue_Dir )			
	local show2 = CreateObj( 103956 , X1 , Y1 , Z1 , Dir1 , 1 )	
	SetModeEx( show2  , EM_SetModeType_NotShowHPMP, true )--���	
	SetModeEX( show2  , EM_SetModeType_Gravity , false )--���O
	SetModeEx( show2  , EM_SetModeType_ShowRoleHead, false )--���q�Y����
	SetModeEx( show2  , EM_SetModeType_Mark, false )--�аO
	SetModeEx( show2  , EM_SetModeType_Move, false )--����
	SetModeEx( show2  , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( show2  , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( show2  , EM_SetModeType_Strikback, false )--����				
	AddToPartition( show2 , RoomID )	
	local X2 = ReadRoleValue( corpse02 , EM_RoleValue_X )
	local Y2 = ReadRoleValue( corpse02 , EM_RoleValue_Y )
	local Z2 = ReadRoleValue( corpse02 , EM_RoleValue_Z )
	local Dir2 = ReadRoleValue( corpse02 , EM_RoleValue_Dir )			
	local show3 = CreateObj( 103956 , X2 , Y2 , Z2 , Dir2 , 1 )	
	SetModeEx( show3  , EM_SetModeType_NotShowHPMP, true )--���	
	SetModeEX( show3  , EM_SetModeType_Gravity , false )--���O
	SetModeEx( show3  , EM_SetModeType_ShowRoleHead, false )--���q�Y����
	SetModeEx( show3  , EM_SetModeType_Mark, false )--�аO
	SetModeEx( show3  , EM_SetModeType_Move, false )--����
	SetModeEx( show3  , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( show3  , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( show3  , EM_SetModeType_Strikback, false )--����				
	AddToPartition( show3 , RoomID )	
	
	CastSpellLV( show2, show2, 495670 , 1 )
	CastSpellLV( show3, show3, 495670 , 1 )
	Sleep(30)	
	SetModeEx( corpse01  , EM_SetModeType_Show, false )
	SetModeEx( corpse02  , EM_SetModeType_Show, false )

----------��t�۴�
	local show0 = CreateObjByFlag( 103956, 780668, 1, 1)		
	SetModeEx( show0  , EM_SetModeType_NotShowHPMP, true )--���	
	SetModeEX( show0  , EM_SetModeType_Gravity , false )--���O
	SetModeEx( show0  , EM_SetModeType_ShowRoleHead, false )--���q�Y����
	SetModeEx( show0  , EM_SetModeType_Mark, false )--�аO
	SetModeEx( show0  , EM_SetModeType_Move, false )--����
	SetModeEx( show0  , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( show0  , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( show0  , EM_SetModeType_Strikback, false )--����				
	AddToPartition( show0 , RoomID )			
	local show1 = CreateObjByFlag( 103956, 780668, 2, 1)
	SetModeEx( show1  , EM_SetModeType_NotShowHPMP, true )--���	
	SetModeEX( show1  , EM_SetModeType_Gravity , false )--���O
	SetModeEx( show1  , EM_SetModeType_ShowRoleHead, false )--���q�Y��
	SetModeEx( show1  , EM_SetModeType_Mark, false )--�аO
	SetModeEx( show1  , EM_SetModeType_Move, false )--����
	SetModeEx( show1  , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( show1  , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( show1  , EM_SetModeType_Strikback, false )--����				
	AddToPartition( show1 , RoomID )			
	CastSpellLV(show0, show0, 495670 , 1 )
	CastSpellLV(show1, show1, 495670 , 1 )
	
	ScriptMessage( Queen , -1 , 2 , "[SC_103942_02]", 1 )
----------������h
	local Temp1 = CreateObjByFlag( 104052, 780668, 1, 1) 
	AddToPartition( Temp1 , RoomID )	
	WriteRoleValue( OwnerID() ,EM_RoleValue_Register2, Temp1)	--����g�J
	WriteRoleValue( Temp1 ,EM_RoleValue_Register9, OwnerID())	--����g�J
	sleep(10)
	AddBuff( Temp1, 506849, 0, -1)
----------���Ͱ��F�x
	local Temp2 = CreateObjByFlag( 104053, 780668, 2, 1)
	AddToPartition( Temp2 , RoomID )
	WriteRoleValue( OwnerID() ,EM_RoleValue_Register3, Temp2)	--����g�J
	WriteRoleValue( Temp2 ,EM_RoleValue_Register9, OwnerID())	--����g�J	
	sleep(10)
	AddBuff( Temp2, 506849, 0, -1)	
	
	--�k���ܨ��z���y
	AddBuff( Queen, 506848, 0, -1) 
	WriteRoleValue( Temp1 ,EM_RoleValue_Register7, Queen)	--�g�JPID	
----------���s
	WriteRoleValue( Temp2 ,EM_RoleValue_PID, Temp1)	--�g�JPID
	WriteRoleValue( Temp1 ,EM_RoleValue_PID, Temp2)	--�g�JPID	
----------�Ұʤ�AI
	BeginPlot( Temp1, "Cang_129_2bo_baron_e", 0)
	BeginPlot( Temp2, "Cang_129_2bo_oh_e", 0)
	BeginPlot( OwnerID() , "Cang_129_2bo_GD_e" , 0)

	local res = 0 --�^�ǭ���
	local Door1, Door2, Door3, Door4
	local playing
	
	while 1 do
		sleep(10)
		Door1 = ReadRoleValue( OwnerID(),EM_RoleValue_Register5 )
		Door2 = ReadRoleValue( OwnerID(),EM_RoleValue_Register6 )
		Door3 = ReadRoleValue( OwnerID(),EM_RoleValue_Register7 )
		Door4 = ReadRoleValue( OwnerID(),EM_RoleValue_Register8 )
		playing = ReadRoleValue( OwnerID(),EM_RoleValue_Register4 )
		
----------�ˬd�ϰ줺���S�����a
		local TempPlayer = SetSearchAllPlayer(ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)) --���{�b�ӰϤ����Ҧ����a
		local ThesePlayer = {}	
		local sway = {}
		for i=1,TempPlayer do
			ThesePlayer[i] = GetSearchResult() -- ���Ȧs��
			if CheckID( ThesePlayer[i] ) == true and 
			ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and 
			ReadRoleValue( ThesePlayer[i] , EM_RoleValue_VOC ) ~= 0 and
			ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then
			--�ˬd���a�O���O�٦b�F�ˬd�O�_���`
				sway[table.getn(sway)+1] = ThesePlayer[i]	--��Jsway��
			end					
		end		
----------�Ӱϰ줺�S�����a�A���歫�m		
		if table.getn(sway) == 0 then
			if res == 0 then
				DelObj(Temp1)
				DelObj(Temp2)				
				SetDefIdleMotion( Door1 , ruFUSION_MIME_IDLE_STAND )
				SetModeEx( Door1  , EM_SetModeType_Obstruct, false )--����	
				SetDefIdleMotion( Door2 , ruFUSION_MIME_IDLE_STAND )
				SetModeEx( Door2  , EM_SetModeType_Obstruct, false )--����
				SetDefIdleMotion( Door3 , ruFUSION_MIME_IDLE_STAND )
				SetModeEx( Door3  , EM_SetModeType_Obstruct, false )--����
				SetDefIdleMotion( Door4 , ruFUSION_MIME_IDLE_STAND )
				SetModeEx( Door4  , EM_SetModeType_Obstruct, false )--����
				SetModeEx( corpse01  , EM_SetModeType_Show, true )
				SetModeEx( corpse02  , EM_SetModeType_Show, true )
				DelObj( Queen )
				WriteRoleValue( sys ,EM_RoleValue_Register1, 8)				
				res = 1
			end
		end		
----------�ˬd��Ӥ��O�_����
		if playing == 1 then
			if CheckID(Temp1)==false or								--�ˬdTemp1�O�_�s�b
				ReadRoleValue(Temp1,EM_RoleValue_IsDead)==1	then	--�ˬdTemp1�O�_���`	
				if	ReadRoleValue(Temp2,EM_RoleValue_IsDead)==0	and	--�ˬdTemp2�O���O�٬���
					CheckID(Temp2)==true and						--�ˬdTemp2�O���O�s�b
					HateListCount( Temp2 )  == 0 then				--�ˬdTemp2������٦��S���H
					Pass2 = Pass2 + 1								--���� Pass2 +1
				end
			end		
			if CheckID(Temp2)==false	or							--�ˬdTemp2�O�_�s�b
				ReadRoleValue(Temp2,EM_RoleValue_IsDead)==1	then	--�ˬdTemp2�O�_���`		
				if	ReadRoleValue(Temp1,EM_RoleValue_IsDead)==0	and	--�ˬdTemp1�O�_���`
					CheckID(Temp1)==true and						--�ˬdTmep1�O���O�s�b
					HateListCount( Temp1 )  == 0 then				--�ˬdTemp1�O�_�԰���
					Pass2 = Pass2 + 1								--���� Pass2 +1
				end
			end
----------Pass2 �u�|��0��1, 0���󳣦�, 1�����@���`�B�t�@���}�԰�
			if Pass2 == 1 then
				if res == 0 then 
				--�R���{�s			
					DelObj(Temp1)
					DelObj(Temp2)
					sleep(50)
					SetDefIdleMotion( Door1 , ruFUSION_MIME_IDLE_STAND )
					SetModeEx( Door1  , EM_SetModeType_Obstruct, false )--����	
					SetDefIdleMotion( Door2 , ruFUSION_MIME_IDLE_STAND )
					SetModeEx( Door2  , EM_SetModeType_Obstruct, false )--����
					SetDefIdleMotion( Door3 , ruFUSION_MIME_IDLE_STAND )
					SetModeEx( Door3  , EM_SetModeType_Obstruct, false )--����
					SetDefIdleMotion( Door4 , ruFUSION_MIME_IDLE_STAND )
					SetModeEx( Door4  , EM_SetModeType_Obstruct, false )--����						
					SetModeEx( corpse01  , EM_SetModeType_Show, true )
					SetModeEx( corpse02  , EM_SetModeType_Show, true )
					DelObj( Queen )
					WriteRoleValue( sys ,EM_RoleValue_Register1, 8)	
					res = 1
				end
			end	
----------��Ⱖ�������A���_�c�A�^�ǥD��			
			if	CheckID(Temp1)==false or ReadRoleValue(Temp1,EM_RoleValue_IsDead)==1 then		
				if	CheckID(Temp2)==false or ReadRoleValue(Temp2,EM_RoleValue_IsDead)==1 then
					if res == 0 then
						Hide(Temp1)	--���ë���
						Hide(Temp2)	--���ë���
						DelObj( Queen )
						WriteRoleValue( sys ,EM_RoleValue_Register1, 10)					
						SetDefIdleMotion( Door1 , ruFUSION_MIME_IDLE_STAND )
						SetModeEx( Door1  , EM_SetModeType_Obstruct, false )--����	
						SetDefIdleMotion( Door2 , ruFUSION_MIME_IDLE_STAND )
						SetModeEx( Door2  , EM_SetModeType_Obstruct, false )--����
						SetDefIdleMotion( Door3 , ruFUSION_MIME_IDLE_STAND )
						SetModeEx( Door3  , EM_SetModeType_Obstruct, false )--����
						SetDefIdleMotion( Door4 , ruFUSION_MIME_IDLE_STAND )
						SetModeEx( Door4  , EM_SetModeType_Obstruct, false )--����
						local Box = CreateObjByFlag( 104054, 780670, 12, 1)	--�_�c
						SetModeEx( Box  , EM_SetModeType_HideName, false )--�W��
						SetModeEx( Box  , EM_SetModeType_ShowRoleHead, false )--���q�Y����
						SetModeEx( Box  , EM_SetModeType_NotShowHPMP, true )--���					
						SetModeEx( Box  , EM_SetModeType_Move, false )--����
						SetModeEx( Box  , EM_SetModeType_Searchenemy, false )--����
						SetModeEx( Box  , EM_SetModeType_Strikback, false )--����						
						AddToPartition( Box , RoomID ) 
						res = 1				
					end	
				end	
			end
		end	
	end	
end

--------------------------------------------------------------�Z���P�w
function Cang_129_2bo_GD_e()
	local Temp1 = ReadRoleValue(OwnerID(),EM_RoleValue_Register2)
	local Temp2 = ReadRoleValue(OwnerID(),EM_RoleValue_Register3)

	while true do
		sleep(10)
----------�Z����h50�X���A�|�@���I�񺧺������F�Z����h50�~�A���`����
		if GetDistance( Temp1, Temp2) <= 100 then
			if CheckID( Temp1 ) == true then
				AddBuff( Temp2 , 506817, 1, -1)	
			end				
		elseif GetDistance( Temp1, Temp2) > 100 then
			CancelBuff( Temp2 , 506817 )
		end
	end
end

--------------------------------------------------------------��h
function Cang_129_2bo_baron_e()

	local RoomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID)
	local OH = ReadRoleValue(OwnerID() , EM_RoleValue_PID)
	local start = ReadRoleValue(OwnerID() , EM_RoleValue_Register9)
	local fight = 0		--1�N��i�J�԰�
	local CheckTime = 10
	local BossTarget
	local SkillShow
	local countskill = 0
	local skill = 0
	local Doorstart = 0
	local SkillDelay = { 2 , 2 , 3 }	-- �ޯੵ��ɶ�
		--
	local showskill = { 495683, 495671, 495028 }
		--�K�����, �x�Τ���, �x�k�f�P
	local SkillID = { 495650 , 495672 }	-- �ۦ�ID	
		--�C�����, �Q��� 
	local SkillLV = { 4 , 7 }	--�ޯ൥��
		--
	local SkillSay = {"[SC_103941_03]"}	 
	local CountSay = {"[SC_103941_01]"}
	local Saycount = 0
	while true do
		sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID ) 	
		if (  AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- �ˬd�O�_���}�԰�
			countskill = countskill + 1
			skill = skill + 1	
			fight = 1			
			WriteRoleValue( start ,EM_RoleValue_Register4, 1)		
----------�԰��}�l�A�ܤj�B����			
			if Doorstart == 0 then	
				--�ܤj
				--ScriptMessage( OwnerID() , -1 , 2 , CountSay[1], 1 )
				CastSpellLV( OwnerID(), OwnerID() , 495671 , 0 )
				--����
				Door1 = CreateObjByFlag( 104016, 780668, 4, 1)			
				SetModeEX( Door1  , EM_SetModeType_Gravity , false )--���O
				SetModeEx( Door1  , EM_SetModeType_ShowRoleHead, false )--���q�Y����
				SetModeEx( Door1  , EM_SetModeType_Mark, false )--�аO
				SetModeEx( Door1  , EM_SetModeType_Move, false )--����
				SetModeEx( Door1  , EM_SetModeType_Searchenemy, false )--����
				SetModeEx( Door1  , EM_SetModeType_Fight , false )--�i�������
				SetModeEx( Door1  , EM_SetModeType_Strikback, false )--����
				AddToPartition( Door1 , RoomID )
				WriteRoleValue( start ,EM_RoleValue_Register5, 	Door1)			
				SetDefIdleMotion( Door1 , ruFUSION_MIME_ACTIVATE_LOOP)
				SetModeEx( Door1 , EM_SetModeType_Obstruct, true )--����
				Door2 = CreateObjByFlag( 104016, 780668, 5, 1)			
				SetModeEX( Door2  , EM_SetModeType_Gravity , false )--���O
				SetModeEx( Door2  , EM_SetModeType_ShowRoleHead, false )--���q�Y����
				SetModeEx( Door2  , EM_SetModeType_Mark, false )--�аO
				SetModeEx( Door2  , EM_SetModeType_Move, false )--����
				SetModeEx( Door2  , EM_SetModeType_Searchenemy, false )--����
				SetModeEx( Door2  , EM_SetModeType_Fight , false )--�i�������
				SetModeEx( Door2  , EM_SetModeType_Strikback, false )--����
				AddToPartition( Door2 , RoomID )
				WriteRoleValue( start ,EM_RoleValue_Register6, 	Door2)			
				SetDefIdleMotion( Door2,ruFUSION_MIME_ACTIVATE_LOOP)
				SetModeEx( Door2 , EM_SetModeType_Obstruct, true )--����
				Door3 = CreateObjByFlag( 104016, 780668, 6, 1)			
				SetModeEX( Door3  , EM_SetModeType_Gravity , false )--���O
				SetModeEx( Door3  , EM_SetModeType_ShowRoleHead, false )--���q�Y����
				SetModeEx( Door3  , EM_SetModeType_Mark, false )--�аO
				SetModeEx( Door3  , EM_SetModeType_Move, false )--����
				SetModeEx( Door3  , EM_SetModeType_Searchenemy, false )--����
				SetModeEx( Door3  , EM_SetModeType_Fight , false )--�i�������
				SetModeEx( Door3  , EM_SetModeType_Strikback, false )--����
				AddToPartition( Door3 , RoomID )
				WriteRoleValue( start ,EM_RoleValue_Register7, 	Door3)			
				SetDefIdleMotion( Door3,ruFUSION_MIME_ACTIVATE_LOOP)
				SetModeEx( Door3 , EM_SetModeType_Obstruct, true )--����
				Door4 = CreateObjByFlag( 104016, 780668, 7, 1)			
				SetModeEX( Door4  , EM_SetModeType_Gravity , false )--���O
				SetModeEx( Door4  , EM_SetModeType_ShowRoleHead, false )--���q�Y����
				SetModeEx( Door4  , EM_SetModeType_Mark, false )--�аO
				SetModeEx( Door4  , EM_SetModeType_Move, false )--����
				SetModeEx( Door4  , EM_SetModeType_Searchenemy, false )--����
				SetModeEx( Door4  , EM_SetModeType_Fight , false )--�i�������
				SetModeEx( Door4  , EM_SetModeType_Strikback, false )--����
				AddToPartition( Door4 , RoomID )
				WriteRoleValue( start ,EM_RoleValue_Register8, 	Door4)			
				SetDefIdleMotion( Door4,ruFUSION_MIME_ACTIVATE_LOOP)
				SetModeEx( Door4 , EM_SetModeType_Obstruct, true )--����				
				Doorstart = 1
			end		
----------�¥��}
			if countskill == 7 then
				--����F�x���ۡA�¥��}���ؼЬO���F�x���ؼ�
				if ReadRoleValue( OH,EM_RoleValue_IsDead ) == 0	then	--�ˬdOH�O�_���`
					local OH_attackTarget = ReadRoleValue( OH, EM_RoleValue_AttackTargetID )
					local MessageString
					local PlayerName = GetName( OH_attackTarget )
					MessageString = "[SC_103941_02][$SETVAR1="..PlayerName.."]" --�bstring���i�H�q�X���a���W�r
					ScriptMessage( OwnerID() , -1 , 2 ,  MessageString, 1 )
					while 	ReadRoleValue( OwnerID() , EM_RoleValue_SpellMagicID ) ~= 0   do
						sleep(3)
					end					
					--��t�k�N���Უ�ͤ@�Ӫk�}
					CastSpellLV( OwnerID(), OwnerID() , 495670 , 2 )
					local NowX = ReadRoleValue( OH_attackTarget , EM_RoleValue_X )
					local NowY = ReadRoleValue( OH_attackTarget , EM_RoleValue_Y )
					local NowZ = ReadRoleValue( OH_attackTarget , EM_RoleValue_Z )
					local NowDir = ReadRoleValue( OH_attackTarget , EM_RoleValue_Dir )			
					local SpellCaster = CreateObj( 103956 , NowX , NowY , NowZ , NowDir , 1 )
					SetModeEx( SpellCaster  , EM_SetModeType_HideName, false )--�W��
					SetModeEX( SpellCaster  , EM_SetModeType_Gravity , false )--���O
					SetModeEx( SpellCaster  , EM_SetModeType_ShowRoleHead, false )--���q�Y����
					SetModeEx( SpellCaster  , EM_SetModeType_Mark, false )--�аO
					SetModeEx( SpellCaster  , EM_SetModeType_Move, false )--����
					SetModeEx( SpellCaster  , EM_SetModeType_Searchenemy, false )--����
					SetModeEx( SpellCaster  , EM_SetModeType_Fight , false )--�i�������
					SetModeEx( SpellCaster  , EM_SetModeType_Strikback, false )--����	
					AddToPartition( SpellCaster , RoomID )	--�[�i�R�x	
					WriteRoleValue( SpellCaster , EM_RoleValue_Livetime, 30 )--�s�b�ɶ�
					WriteRoleValue( SpellCaster , EM_RoleValue_PID, OwnerID() )
					WriteRoleValue( SpellCaster , EM_RoleValue_Register1, OH )
					BeginPlot( SpellCaster , "Cang_129_2bo_b_summomkill_e" , 0)
					countskill = 0
				--�p�G���F�x���F�A�¥��}����H����	
				elseif ReadRoleValue( OH,EM_RoleValue_IsDead ) == 1	then
					local TempPlayer1 = SetSearchAllPlayer(ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)) --���{�b�ӰϤ����Ҧ����a
					local ThesePlayer1 = {}	
					local sway1 = {}
					for i=1,TempPlayer1 do
						ThesePlayer1[i] = GetSearchResult() -- ���Ȧs��
						if CheckID( ThesePlayer1[i] ) == true and 
						ReadRoleValue( ThesePlayer1[i] , EM_RoleValue_IsDead ) == 0 and 
						ReadRoleValue( ThesePlayer1[i] , EM_RoleValue_VOC ) ~= 0 and
						ReadRoleValue( ThesePlayer1[i] , EM_RoleValue_IsPlayer ) == 1 then
						--�ˬd���a�O���O�٦b�F�ˬd�O�_���`
							sway1[table.getn(sway1)+1] = ThesePlayer1[i]	--��Jsway��
						end					
					end		
	----------RAND�@�ӤH�X�ӥ�����		
					if table.getn(sway1) ~= 0 then
						local anyone = DW_Rand(table.getn(sway1))	--rand
						local MessageString
						local PlayerName = GetName( sway1[anyone] )
						MessageString = "[SC_103941_02][$SETVAR1="..PlayerName.."]" --�bstring���i�H�q�X���a���W�r
						ScriptMessage( OwnerID() , -1 , 2 ,  MessageString, 1 )
						while 	ReadRoleValue( OwnerID() , EM_RoleValue_SpellMagicID ) ~= 0   do
							sleep(3)
						end					
						--��t�k�N���Უ�ͤ@�Ӫk�}
						CastSpellLV( OwnerID(), OwnerID() , 495670 , 2 )
						local NowX = ReadRoleValue( sway1[anyone] , EM_RoleValue_X )
						local NowY = ReadRoleValue( sway1[anyone] , EM_RoleValue_Y )
						local NowZ = ReadRoleValue( sway1[anyone] , EM_RoleValue_Z )
						local NowDir = ReadRoleValue( sway1[anyone] , EM_RoleValue_Dir )			
						local SpellCaster = CreateObj( 103956 , NowX , NowY , NowZ , NowDir , 1 )
						SetModeEx( SpellCaster  , EM_SetModeType_HideName, false )--�W��
						SetModeEX( SpellCaster  , EM_SetModeType_Gravity , false )--���O
						SetModeEx( SpellCaster  , EM_SetModeType_ShowRoleHead, false )--���q�Y����
						SetModeEx( SpellCaster  , EM_SetModeType_Mark, false )--�аO
						SetModeEx( SpellCaster  , EM_SetModeType_NotShowHPMP, true )
						SetModeEx( SpellCaster  , EM_SetModeType_Move, false )--����
						SetModeEx( SpellCaster  , EM_SetModeType_Searchenemy, false )--����
						SetModeEx( SpellCaster  , EM_SetModeType_Fight , false )--�i�������
						SetModeEx( SpellCaster  , EM_SetModeType_Strikback, false )--����	
						AddToPartition( SpellCaster , RoomID )	--�[�i�R�x	
						WriteRoleValue( SpellCaster , EM_RoleValue_Livetime, 30 )--�s�b�ɶ�
						WriteRoleValue( SpellCaster , EM_RoleValue_PID, OwnerID() )
						WriteRoleValue( SpellCaster , EM_RoleValue_Register1, OH )
						BeginPlot( SpellCaster , "Cang_129_2bo_b_summomkill_e" , 0)
						countskill = 0
					end	
				end	
			end
----------���q�ޯ�I��			
			if skill >= 5 then
				local SkillRND = DW_Rand ( 100 ) 
				if SkillRND <= 100 and SkillRND > 75 then 
					SkillShow = 1	--
					BossTarget = OwnerID()					
				elseif SkillRND <= 75 and SkillRND > 50 then 
					SkillShow = 2	--
					BossTarget = AttackTarget						
				elseif SkillRND <= 50 and SkillRND > 25 then 
					SkillShow = 1	--
					BossTarget = OwnerID()										
				elseif SkillRND <= 25 and SkillRND > 0 then 
					SkillShow = 2	--
					BossTarget = AttackTarget				
				end	
				while 	ReadRoleValue( OwnerID() , EM_RoleValue_SpellMagicID ) ~= 0   do
					sleep(3)
				end
				--ScriptMessage( OwnerID() , -1 , 2 , SkillSay[SkillShow], 1 )
				CastSpellLV( OwnerID() , BossTarget , SkillID[SkillShow] , SkillLV[SkillShow] )
				Sleep( SkillDelay[SkillShow] * CheckTime )	
				SkillShow = 0
				skill = 0
			end			
		end
	end
end

--------------------------------------------------------------��h�k�}
function Cang_129_2bo_b_summomkill_e()
	AddBuff( OwnerID() , 505675 , 1 , -1 )
	sleep(30)
	SetPlot( OwnerID(), "range" , "Cang_129_2bo_b_s_range_e" ,30 )
	local OH = ReadRoleValue( OwnerID() , EM_RoleValue_Register1 )
	local Baron = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	while true do
		sleep(10)
----------�j�M55�X�����LNPC, NPC�p�G�OHO��, �N��L����, ��t
		local NPC = SearchRangeNPC ( OwnerID() , 40 )
		if table.getn( NPC )~= 0 then
			if NPC[0] == OH then
				--��NPC�OHO, ��baron�Wbuff
				--AddBuff( baron, 506080, 1, -1)
				SysCastSpellLV( baron , baron , 495683 , 0 )
				BeginPlot( OH , "Cang_129_Dontmove_e", 0) 
				sleep(10)
				DelObj( OwnerID() )
				break
			end
		end
----------�p�G�����}�԰��άO�����`�A�R���ۤv		
		local AttackTarget = ReadRoleValue( Baron , EM_RoleValue_AttackTargetID )		
		if (  AttackTarget == 0 ) and ( CheckID( Baron ) == true ) then  -- �ˬd�O�_���}�԰�
			DelObj( OwnerID() )
		end
		if ReadRoleValue( Baron ,EM_RoleValue_IsDead ) == 1 and ( CheckID( Baron ) == false ) then  -- �ˬd�O�_���}�԰�
			DelObj( OwnerID() )		
		end		
	end	
end

----------OH����M��
function Cang_129_Dontmove_e()
	SetModeEx( OwnerID() , EM_SetModeType_Move, false )
	--���^�夣����buff
	AddBuff( OwnerID() , 506091, 1, 10)
	sleep(100)
	SetModeEx( OwnerID() , EM_SetModeType_Move, true )
end

----------�¥��}�A�缾�a�P�w
function Cang_129_2bo_b_s_range_e()	
	--�p�G���a���k�}, �Wbuff, �M�ᵹ���Wbuff
	if ReadRoleValue( OwnerID() , EM_RoleValue_VOC ) ~= 0 then
		local Baron = ReadRoleValue( TargetID() , EM_RoleValue_PID )
		SetPlot( TargetID(), "range" , "" ,55 )
		--CastSpellLV( TargetID(), OwnerID(), 495028 , 0 )
		AddBuff( OwnerID() , 506079 , 0 , 5 )
		AddBuff( OwnerID() , 506088 , 0 , 5 )
		ScriptMessage( baron , -1 , 2 , "[SC_103941_04]", 1 )
		--�A�̪��ϧܳ��O�S���Ϊ��I	
		SysCastSpellLV( Baron , Baron , 495683 , 0 )
		DelObj( TargetID() )	
	end	
end

--------------------------------------------------------------���F�x
function Cang_129_2bo_oh_e()

	local RoomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID)
	local baron = ReadRoleValue(OwnerID() , EM_RoleValue_PID)
	local start = ReadRoleValue(OwnerID() , EM_RoleValue_Register9)
	local fight = 0		--1�N��i�J�԰�
	local CheckTime = 10
	local BossTarget
	local SkillShow
	local countskill = 0
	local skill = 0
	local Doorstart = 0
	local roseskill = 0
	local beg = 0
	local Lietime = 0
	local skill01 = 0
	local skill02 = 0
	local SkillDelay = { 2 , 2 }	-- �ޯੵ��ɶ�
		--
	local SkillID = { 495027, 495469 } 
		--����, ����
	local SkillLV = { 4 , 7 }	--�ޯ൥��
		--
	local SkillSay = {"[SC_103934_03]"}	
	local Saycount = 0
	--�����z�R
	local CountSay = {"[SC_103934_01]"}	
	--�}��
	local any, any1, any2
	while true do
		sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID ) 	
		if (  AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- �ˬd�O�_���}�԰�
			skill = skill +1
			roseskill = roseskill +1
			fight = 1
			Lietime = Lietime + 1
			skill01 = skill01 + 1
			skill02 = skill02 + 1
			WriteRoleValue( start ,EM_RoleValue_Register4, 1)
----------�԰��}�l�A�ܤj			
			if beg == 0 then
				--�ܤj
				CastSpellLV( OwnerID(), OwnerID() , 495029 , 2 )
				beg = 1
			end
----------���ˬdBUFF�A�I�񺧺�����			
			if CheckBuff( OwnerID() , 506817 ) == true then
				if Lietime >= 2 then
					while 	ReadRoleValue( OwnerID() , EM_RoleValue_SpellMagicID ) ~= 0   do
						sleep(3)
					end			
					ScriptMessage( OwnerID() , -1 , 2 , CountSay[1], 1 )
					CastSpellLV( OwnerID(), OwnerID() , 495027 , 2 )
					Lietime = 0
				end	
			end
----------�������			
			if roseskill >= 10 then
				--��h���۪��ɭԡA�ؼЬO��h���ؼ�
				if ReadRoleValue( baron , EM_RoleValue_IsDead ) == 0 then	--�ˬdOH�O�_���`				
					local B_attackTarget = ReadRoleValue( baron, EM_RoleValue_AttackTargetID ) 
					local MessageString
					local PlayerName = GetName( B_attackTarget )
					MessageString = "[SC_103934_02][$SETVAR1="..PlayerName.."]" --�bstring���i�H�q�X���a���W�r
					ScriptMessage( OwnerID() , -1 , 2 ,  MessageString, 1 )
					while 	ReadRoleValue( OwnerID() , EM_RoleValue_SpellMagicID ) ~= 0   do
						sleep(3)
					end					
					--������
					CastSpellLV( OwnerID(), B_attackTarget , 495025 , 2)
					roseskill = 0
				--��h������A�ؼЬO�ۤv���ؼ�
				elseif ReadRoleValue( baron , EM_RoleValue_IsDead ) == 1 then
					local TempPlayer1 = SetSearchAllPlayer(ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)) --���{�b�ӰϤ����Ҧ����a
					local ThesePlayer1 = {}	
					local sway1 = {}
					for i=1,TempPlayer1 do
						ThesePlayer1[i] = GetSearchResult() -- ���Ȧs��
						if CheckID( ThesePlayer1[i] ) == true and 
						ReadRoleValue( ThesePlayer1[i] , EM_RoleValue_IsDead ) == 0 and 
						ReadRoleValue( ThesePlayer1[i] , EM_RoleValue_VOC ) ~= 0 and
						ReadRoleValue( ThesePlayer1[i] , EM_RoleValue_IsPlayer ) == 1 then
						--�ˬd���a�O���O�٦b�F�ˬd�O�_���`
							sway1[table.getn(sway1)+1] = ThesePlayer1[i]	--��Jsway��
						end					
					end		
	----------RAND�@�ӤH�X�ӥ�����		
					if table.getn(sway1) ~= 0 then
						local anyone = DW_Rand(table.getn(sway1))	--rand
						local MessageString
						local PlayerName = GetName( sway1[anyone] )
						MessageString = "[SC_103934_02][$SETVAR1="..PlayerName.."]" --�bstring���i�H�q�X���a���W�r
						ScriptMessage( OwnerID() , -1 , 2 ,  MessageString, 1 )
						while 	ReadRoleValue( OwnerID() , EM_RoleValue_SpellMagicID ) ~= 0   do
							sleep(3)
						end					
						--������
						CastSpellLV( OwnerID(), sway1[anyone] , 495025 , 2 )
						roseskill = 0
					end	
				end	
			end	
----------����
			if skill01 >= 30 then
				ScriptMessage( OwnerID() , -1 , 2 , "[SC_103934_04]", 1 )
				--while 	ReadRoleValue( OwnerID() , EM_RoleValue_SpellMagicID ) ~= 0   do
				--	sleep(3)
				--end	
				--CastSpellLV( OwnerID(), OwnerID() , 495465 , 2 )				
				--local Use = DW_HateRemain(1)     --������H ��0�N�� ���ư��D�Z
				--for i = 1, table.getn(Use) do				
				--	Addbuff( Use[i], 506785, 0, -1)				
				--end
				--sleep(20)
				while 	ReadRoleValue( OwnerID() , EM_RoleValue_SpellMagicID ) ~= 0   do
					sleep(3)
				end				
				CastSpellLV( OwnerID(), OwnerID() , 495026 , 2 )
				sleep(20)
				skill01 = 0
			end	
			if skill02 >= 20 then
				local SkillRND = DW_Rand ( 2 )
				if SkillRND == 1 then		
					--�Ĥ@��rand
					local TempPlayer1 = SetSearchAllPlayer(ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)) --���{�b�ӰϤ����Ҧ����a
					local ThesePlayer1 = {}	
					local Use = {}
					for i=1,TempPlayer1 do
						ThesePlayer1[i] = GetSearchResult() -- ���Ȧs��
						if CheckID( ThesePlayer1[i] ) == true and 
						ReadRoleValue( ThesePlayer1[i] , EM_RoleValue_IsDead ) == 0 and 
						ReadRoleValue( ThesePlayer1[i] , EM_RoleValue_VOC ) ~= 0 and
						ReadRoleValue( ThesePlayer1[i] , EM_RoleValue_IsPlayer ) == 1 then
						--�ˬd���a�O���O�٦b�F�ˬd�O�_���`
							Use[table.getn(Use)+1] = ThesePlayer1[i]	--��Jsway��
						end					
					end					
					--local Use = DW_HateRemain(0)     			--������H ��0�N�� ���ư��D�Z
					local Use1 = {}		
					local Use2 = {}
					any = DW_Rand(table.getn(Use))		--rand Use
					Addbuff( Use[any], 506986, 0, 10)
					--�ĤG��rand
					for i = 1 , table.getn(Use) do				--use���X�ӤH���X��		
						if Use[i] ~= Use[any] then				--i������any1
							Use1[table.getn(Use1)+1] = Use[i]	--��Juse1
						end
					end
					if table.getn(Use1) ~= 0 then				--use1����0���ɭ�
						any1 = DW_Rand(table.getn(Use1))	--rand any2�X��
						if Use1[any1] ~= nil then				--������nil���ɭ԰���
							Addbuff( Use1[any1], 506986, 0, 10)
							sleep(10)
						end		
					--�ĤT��rand	
						for j = 1 , table.getn(Use1) do				--use1���X�ӤH���X��	
							if Use1[j] ~= Use1[any1] then			--i������any2
								Use2[table.getn(Use2)+1] = Use1[j]	--��Juse2
							end
						end	
						if table.getn(Use2) ~= 0 then				--use2����0���ɭ�	
							any2 = DW_Rand(table.getn(Use2))	--rand any3�X��	
							if Use2[any2] ~= nil then				--������nil���ɭ԰���
								Addbuff( Use2[any2], 506986, 0, 10)
								--CastSpellLV( OwnerID() , Use[any] , 495456 , 0 )
								--CastSpellLV( OwnerID() , Use1[any1] , 495456 , 0 )
								--CastSpellLV( OwnerID() , Use2[any2] , 495456 , 0 )
								sleep(10)
							end	
						end		
					end		
					local control = Lua_DW_CreateObj( "obj" , 103956 , OwnerID() , 0)	
					SetModeEx( control  , EM_SetModeType_NotShowHPMP, true )--���					
					SetModeEX( control  , EM_SetModeType_Gravity , false )--���O
					SetModeEx( control  , EM_SetModeType_ShowRoleHead, false )--���q�Y����
					SetModeEx( control  , EM_SetModeType_Mark, false )--�аO
					SetModeEx( control  , EM_SetModeType_Move, false )--����
					SetModeEx( control  , EM_SetModeType_Searchenemy, false )--����
					SetModeEx( control  , EM_SetModeType_Fight , false )--�i�������
					SetModeEx( control  , EM_SetModeType_Strikback, false )--����
					AddToPartition( control , RoomID )	
					WriteRoleValue( control , EM_RoleValue_Livetime, 13 )		
					BeginPlot( control, "Cang_129_oh_buffskill_in_e" , 0 )
					skill02 = 0
				elseif SkillRND == 2 then
					--�Ĥ@��rand
					local Use = DW_HateRemain(0)				--������H ��0�N�� ���ư��D�Z
					local Use1 = {}		
					local Use2 = {}
					any = DW_Rand(table.getn(Use))		--rand Use
					Addbuff( Use[any], 506987, 0, 10)
					--SysCastSpellLV( OwnerID() , Use[any] , 495457 , 0 )
					--�ĤG��rand
					for i = 1 , table.getn(Use) do				--use���X�ӤH���X��		
						if Use[i] ~= Use[any] then				--i������any1
							Use1[table.getn(Use1)+1] = Use[i]	--��Juse1
						end
					end
					if table.getn(Use1) ~= 0 then				--use1����0���ɭ�
						any1 = DW_Rand(table.getn(Use1))	--rand any2�X��
						if Use1[any1] ~= nil then				--������nil���ɭ԰���
							Addbuff( Use1[any1], 506987, 0, 10)
							--SysCastSpellLV( OwnerID() , Use1[any1] , 495457 , 0 )
							sleep(10)
						end	
					--�ĤT��rand	
						for j = 1 , table.getn(Use1) do				--use1���X�ӤH���X��	
							if Use1[j] ~= Use1[any1] then			--i������any2
								Use2[table.getn(Use2)+1] = Use1[j]	--��Juse2
							end
						end	
						if table.getn(Use2) ~= 0 then				--use2����0���ɭ�	
							any2 = DW_Rand(table.getn(Use2))	--rand any3�X��	
							if Use2[any2] ~= nil then				--������nil���ɭ԰���
								Addbuff( Use2[any2], 506987, 0, 10)
								--CastSpellLV( OwnerID() , Use[any] , 495457 , 0 )
								--CastSpellLV( OwnerID() , Use1[any1] , 495457 , 0 )
								--CastSpellLV( OwnerID() , Use2[any2] , 495457 , 0 )
								sleep(10)
							end	
						end		
					end		
					local control = Lua_DW_CreateObj( "obj" , 103956 , OwnerID() , 0)
					SetModeEx( control  , EM_SetModeType_NotShowHPMP, true )--���
					SetModeEX( control  , EM_SetModeType_Gravity , false )--���O
					SetModeEx( control  , EM_SetModeType_ShowRoleHead, false )--���q�Y����
					SetModeEx( control  , EM_SetModeType_Mark, false )--�аO
					SetModeEx( control  , EM_SetModeType_Move, false )--����
					SetModeEx( control  , EM_SetModeType_Searchenemy, false )--����
					SetModeEx( control  , EM_SetModeType_Fight , false )--�i�������
					SetModeEx( control  , EM_SetModeType_Strikback, false )--����
					AddToPartition( control , RoomID )		
					WriteRoleValue( control , EM_RoleValue_Livetime, 13 )
					BeginPlot( control, "Cang_129_oh_buffskill_out_e" , 0 )	
					skill02 = 0
				end							
			end
----------���q�ޯ�I��			
			if skill >= 10 then
				local SkillRND = DW_Rand ( 100 ) 
				if SkillRND <= 100 and SkillRND > 75 then 
					SkillShow = 1	--
					BossTarget = OwnerID()					
				elseif SkillRND <= 75 and SkillRND > 0 then 
					SkillShow = 2	--
					BossTarget = AttackTarget											
				end	
				while 	ReadRoleValue( OwnerID() , EM_RoleValue_SpellMagicID ) ~= 0   do
					sleep(3)
				end
				--ScriptMessage( OwnerID() , -1 , 2 , SkillSay[SkillShow], 1 )
				CastSpellLV( OwnerID() , BossTarget , SkillID[SkillShow] , SkillLV[SkillShow] )
				Sleep( SkillDelay[SkillShow] * CheckTime )	
				SkillShow = 0
				skill = 0
			end		
		end
	end
end

--------------------------------------------------------------���F�x�y��ޯ�
function Cang_129_2bo_oh_skill_e()
	BeginPlot( TargetID() , "Cang_129_2bo_oh_skill_do_e" , 0)
end

function Cang_129_2bo_oh_skill_do_e()

	while true do
		sleep(10)
		--���T�{���a�O���O���`�Ϊ̤��s�b
		if ReadRoleValue( OwnerID() , EM_RoleValue_IsDead) == 1 or 
		ReadRoleValue( OwnerID() , EM_RoleValue_IsPlayer) == 0 then
			break
		end
		--�˹�a���W���S�����obuff
		if CheckBuff( OwnerID() , 506086 ) == false then
			break
		end
		--�p�G���a����q�j��άO���󺡦媺�ɭ�, �M��buff���
		if ReadRoleValue( OwnerID() , EM_RoleValue_HP) >= ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP ) then
			CancelBuff_NoEvent( OwnerID() , 506086 )
			break
		end
	end	
end
	
	
	
	

