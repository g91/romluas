function ic_104694_01()   ------�D����
	local Ctrl = OwnerID()					--���
	local open=0						    --�}�ԺX��
	local open1=0						    --�}�ԺX��
	local BOSS1open=0						    --�}�ԺX��
	local BOSS2open1=0						    --�}�ԺX��
	local time5=0								--�p�ɾ�
	local time44=0
	local opendoor0=0								--�}����
	local opendoor=0								--�}����
	local time1=0
	local time2=0
	local time3=0
	local time10=0
	local time20=0
	local killidtime=0
	local killidtime1=0	
	local mob1
	local mob2
	local door1								--���ת�1
	local door2								--���ת�2
	local door3								--���ת�1
	local door4								--���ת�2
	local RoomID=ReadRoleValue(Ctrl,EM_RoleValue_RoomID)
	local Boss1=CreateObjByFlag(104763,780772,1,1) 	-----BOSS�Цb  �X��1--��ù�E�U�J
	local Boss2=CreateObjByFlag(104764,780772,2,1) 	-----BOSS�Цb  �X��2--�责�F
	local door=CreateObjByFlag(104198,780772,3,1)	-----���ת�(�����~�|����)
	local door0=CreateObjByFlag(104198,780772,4,1)	-----���ת�(�����~�|����)
	local boss1up=0
	local boss2up=0
	local XBoss1--=ReadRoleValue(Boss1 ,EM_RoleValue_X)
	local YBoss1--=ReadRoleValue(Boss1 ,EM_RoleValue_Y)
	local ZBoss1--=ReadRoleValue(Boss1 ,EM_RoleValue_Z)
	local XBoss2--=ReadRoleValue(Boss2 ,EM_RoleValue_X)
	local YBoss2--=ReadRoleValue(Boss2 ,EM_RoleValue_Y)
	local ZBoss2--=ReadRoleValue(Boss2 ,EM_RoleValue_Z)
				SetModeEx( door , EM_SetModeType_Mark, false)
				SetModeEx( door , EM_SetModeType_ShowRoleHead, false) 	
				SetModeEx( door , EM_SetModeType_Obstruct, true) 
				SetModeEx( door , EM_SetModeType_Strikback, false) ---����
				SetModeEx( door , EM_SetModeType_Move, false) ---����	
				SetModeEx( door , EM_SetModeType_Fight, false) ---�i���
				SetModeEx( door , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( door , EM_SetModeType_Searchenemy, false)
				AddToPartition(door,RoomID)
				SetModeEx( door0 , EM_SetModeType_Mark, false)
				SetModeEx( door0 , EM_SetModeType_ShowRoleHead, false) 	
				SetModeEx( door0 , EM_SetModeType_Obstruct, true) 
				SetModeEx( door0 , EM_SetModeType_Strikback, false) ---����
				SetModeEx( door0 , EM_SetModeType_Move, false) ---����	
				SetModeEx( door0 , EM_SetModeType_Fight, false) ---�i���
				SetModeEx( door0 , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( door0 , EM_SetModeType_Searchenemy, false)
				AddToPartition(door0,RoomID)					
				AddToPartition(Boss1,RoomID)
				SetPlot( Boss1,"dead","ic_104694_0344",0 )
				SetPlot( boss2,"dead","ic_104694_0444",0 )
	WriteRoleValue(Boss1,EM_RoleValue_register1,Ctrl)   --�Ȧs�f�U1 BOSS1=ctrl
	WriteRoleValue(Ctrl,EM_RoleValue_register1,Boss1)
	AddToPartition(Boss2,RoomID)
	WriteRoleValue(Boss2,EM_RoleValue_register2,Ctrl)   --�Ȧs�f�U2 BOSS2=ctrl
	WriteRoleValue(Ctrl,EM_RoleValue_register2,Boss2)
	WriteRoleValue(Boss1,EM_RoleValue_register5,Boss2)   --�Ȧs�f�U5 BOSS1=BOSS2
	WriteRoleValue(Boss2,EM_RoleValue_register5,Boss1)
	while true do
		sleep(10)
		--say(OwnerID(),"opendoor0="..opendoor0)
		--say(OwnerID(),"opendoor="..opendoor)
		--say(OwnerID(),"time3="..time44)
		boss1up=ReadRoleValue(OwnerID(),EM_RoleValue_register6)--1��
		boss2up=ReadRoleValue(OwnerID(),EM_RoleValue_register7)--2��
		BOSS1open= ReadRoleValue(OwnerID(),EM_RoleValue_register8)
		BOSS2open1= ReadRoleValue(OwnerID(),EM_RoleValue_register9)
		opendoor0= ReadRoleValue(OwnerID(),EM_RoleValue_register3)---1��
		opendoor= ReadRoleValue(OwnerID(),EM_RoleValue_register4)----2��
		if opendoor0==1 or opendoor==1 and time3<=19 then
			time3=time3+1
		end
		if opendoor0==1 and time3>=10 and time3<=12 then
		WriteRoleValue(OwnerID(),EM_RoleValue_register6,1)
		time3=0
		elseif opendoor==1 and time3>=10 and time3<=12 then
		WriteRoleValue(OwnerID(),EM_RoleValue_register7,1)
		time3=0
		end
		if opendoor0==1 and opendoor==1 then---2�������F �R������
			time3=20
			DelObj(door1)										--�R�����ת�
			DelObj(door2)										--�R�����ת�
			DelObj(door3)
			DelObj(door4)
			BeginPlot(OwnerID(), "ic_ha_de_191_03" , 0)----���b��
			bobo=CreateObjByFlag(105111,780772,1,1)-------�_�c  
				SetModeEx( bobo , EM_SetModeType_Mark, true)			---�i�I��(�_)
				SetModeEx( bobo , EM_SetModeType_ShowRoleHead, true) 		---�Y����(�_)
				SetModeEx( bobo , EM_SetModeType_Obstruct, true) 			--����(�O)
				SetModeEx( bobo , EM_SetModeType_Strikback, false) ---����
				SetModeEx( bobo , EM_SetModeType_Move, false) ---����	
				SetModeEx( bobo , EM_SetModeType_Fight, false) ---�i���
				SetModeEx( bobo , EM_SetModeType_SearchenemyIgnore, false) 	---�O�_�Q�j�M(�_)
				SetModeEx( bobo , EM_SetModeType_Searchenemy, false)			--����(�_)	
				SetModeEx( bobo , EM_SetModeType_NotShowHPMP, true) --
				AddToPartition(bobo,RoomID)
			bobo2=CreateObjByFlag(105112,780772,2,1)-------�_�c
				SetModeEx( bobo2 , EM_SetModeType_Mark, true)			---�i�I��(�_)
				SetModeEx( bobo2 , EM_SetModeType_ShowRoleHead, true) 		---�Y����(�_)
				SetModeEx( bobo2 , EM_SetModeType_Obstruct, true) 			--����(�O)
				SetModeEx( bobo2 , EM_SetModeType_Strikback, false) ---����
				SetModeEx( bobo2 , EM_SetModeType_Move, false) ---����	
				SetModeEx( bobo2 , EM_SetModeType_Fight, false) ---�i���
				SetModeEx( bobo2 , EM_SetModeType_SearchenemyIgnore, false) 	---�O�_�Q�j�M(�_)
				SetModeEx( bobo2 , EM_SetModeType_Searchenemy, false)			--����(�_)	
				SetModeEx( bobo2 , EM_SetModeType_NotShowHPMP, true) ---����
			AddToPartition(bobo2,RoomID)	
			DelObj(door)
			DelObj(door0)
			BeginPlot(OwnerID(), "ic_104694_99" , 0)
			sleep(50)
			WriteRoleValue(OwnerID(),EM_RoleValue_register3,0)
			WriteRoleValue(OwnerID(),EM_RoleValue_register4,0)
			break			
		end
		if BOSS1open==1 or BOSS2open1==1  then---1���}�� �� 2���}��
			time5=time5+1
		end
		if BOSS1open==1 or BOSS2open1==1  then---1���}�� �� 2���}��
			time44=time44+1
		end
		if time44>=30 then
		WriteRoleValue(boss2,EM_RoleValue_register3,1)
		WriteRoleValue(boss1,EM_RoleValue_register3,1)
		time44=0
		end
		if BOSS1open==1 and BOSS2open1==0 and time5>=10  then
			XBoss1=ReadRoleValue(Boss1 ,EM_RoleValue_X)
			YBoss1=ReadRoleValue(Boss1 ,EM_RoleValue_Y)
			ZBoss1=ReadRoleValue(Boss1 ,EM_RoleValue_Z)
			SetPos( Boss2, XBoss1, YBoss1, ZBoss1 , 0 )
			AddToPartition(Boss2,RoomID)
			sleep(10)
			while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
					sleep(5)
			end
			CastSpellLV( Boss2 , Boss2 , 496358 , 20)
			BOSS2open1=2
			time5=0
		end	
		if BOSS1open==0 and BOSS2open1==1 and time5>=10 then---1���S���}�� 2���}��
			XBoss2=ReadRoleValue(Boss2 ,EM_RoleValue_X)
			YBoss2=ReadRoleValue(Boss2 ,EM_RoleValue_Y)
			ZBoss2=ReadRoleValue(Boss2 ,EM_RoleValue_Z)
			SetPos( Boss1, XBoss2, YBoss2, ZBoss2 , 0 )	
			AddToPartition(Boss1,RoomID)
			sleep(10)
			while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
					--say(OwnerID(),"time8NO")
					sleep(5)
			end
			CastSpellLV( Boss1 , Boss1 , 496355 , 20)
			BOSS1open=2
			time5=0
		end
		
		if hatelistcount(boss1)~=0 then    		---Ū����H��
			killidtime=killidtime+1
			if killidtime>=360 and time1==0 then
				WriteRoleValue(boss1,EM_RoleValue_register7,1)---�^��1��BOSS
			end
			if open==0 then
				open=1					--�}���F
				time10=0 
			 door2=CreateObjByFlag(104198,780772,7,1)-------�J�f���ת�
				SetModeEx( door2 , EM_SetModeType_Mark, false)			----�i�I��(�_)
				SetModeEx( door2 , EM_SetModeType_ShowRoleHead, false) 	---�Y����(�_)
				SetModeEx( door2 , EM_SetModeType_Obstruct, true) 		---����(�O)
				SetModeEx( door2 , EM_SetModeType_Strikback, false) ---����(�_)
				SetModeEx( door2 , EM_SetModeType_Move, false) ---����	(�_)
				SetModeEx( door2 , EM_SetModeType_Fight, false) ---�i���(�_)
				SetModeEx( door2 , EM_SetModeType_SearchenemyIgnore, false) ---�O�_�Q�j�M(�_)
				SetModeEx( door2 , EM_SetModeType_Searchenemy, false)	---����(�_)
				AddToPartition(door2,RoomID)	
			door1=CreateObjByFlag(104198,780772,8,1)-------��������ת�
				SetModeEx( door1 , EM_SetModeType_Mark, false)			---�i�I��(�_)
				SetModeEx( door1 , EM_SetModeType_ShowRoleHead, false) 		---�Y����(�_)
				SetModeEx( door1 , EM_SetModeType_Obstruct, true) 			--����(�O)
				SetModeEx( door1 , EM_SetModeType_Strikback, false) ---����
				SetModeEx( door1 , EM_SetModeType_Move, false) ---����	
				SetModeEx( door1 , EM_SetModeType_Fight, false) ---�i���
				SetModeEx( door1 , EM_SetModeType_SearchenemyIgnore, false) 	---�O�_�Q�j�M(�_)
				SetModeEx( door1 , EM_SetModeType_Searchenemy, false)			--����(�_)	
				AddToPartition(door1,RoomID)
				ScriptMessage( OwnerID(), -1 , 1 , "[SC_104694_01]" , 2 )	-------�}�����--�o�Ӱϰ�ڨӦu�@
				BeginPlot(boss1 , "ic_104694_03" , 0)				------�R�O���ⰵ�Ʊ�
			end
		end
		if boss1up==1 then---1���_����
				ScriptMessage( OwnerID(), -1 , 1 , "[SC_104694_06]" , 2 )---�P�®R��F���O�q
				Boss1=CreateObjByFlag(104763,780772,1,1)           --�A�гy1��				
				AddToPartition(Boss1,RoomID)					---�гy�� ���n		
				SetPlot( Boss1,"dead","ic_104694_0344",0 )
				WriteRoleValue(Ctrl,EM_RoleValue_register1,Boss1)
				WriteRoleValue(Boss1,EM_RoleValue_register1,Ctrl)
				WriteRoleValue(Boss1,EM_RoleValue_register5,Boss2)   --�Ȧs�f�U5 BOSS1=BOSS2
				WriteRoleValue(Boss2,EM_RoleValue_register5,Boss1)
				BeginPlot(OwnerID(), "ic_104694_05" , 0)
				open=0					--���m�԰�
				WriteRoleValue(OwnerID(),EM_RoleValue_register6,0)
				BOSS1open=0
				Check_pet = 0
				time5=0
				time44=0
				killidtime=0
				WriteRoleValue(OwnerID(),EM_RoleValue_register3,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register8,0)
		end		
		if hatelistcount(boss1)==0 and open==1 then			--�}�ԫᤳ���S�H
			if ReadRoleValue( boss1 , EM_RoleValue_IsDead)==0 then   --���S�� ���a����
				sleep(10)
				DelObj(boss1)                                        --�S���ۤv������
				DelObj(door1)										--�R�����ת�
				DelObj(door2)										--�R�����ת�
				sleep(10)                                           --1��
				Boss1=CreateObjByFlag(104763,780772,1,1)           --�A�гy1��				
				AddToPartition(Boss1,RoomID)	                                ---�гy�� ���n				
				WriteRoleValue(Ctrl,EM_RoleValue_register1,Boss1)
				WriteRoleValue(Boss1,EM_RoleValue_register1,Ctrl)
				WriteRoleValue(Boss1,EM_RoleValue_register5,Boss2)   --�Ȧs�f�U5 BOSS1=BOSS2
				WriteRoleValue(Boss2,EM_RoleValue_register5,Boss1)
				BeginPlot(OwnerID(), "ic_104694_05" , 0)
				open=0					--���m�԰�
				BOSS1open=0
				Check_pet = 0
				time5=0
				time44=0
				killidtime=0
				WriteRoleValue(OwnerID(),EM_RoleValue_register3,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register8,0)
			elseif	ReadRoleValue( boss1 , EM_RoleValue_IsDead)==1 and time10==0 then---�����F
				BeginPlot(OwnerID(), "ic_104694_05" , 0)
				DelObj(door1)
				DelObj(door2)
				WriteRoleValue(OwnerID(),EM_RoleValue_register3,1)---�^��1��BOSS	
				open=0				--���m�԰�
				BOSS1open=0
				killidtime=0
				time5=0
				time44=0
				time10=1
				WriteRoleValue(OwnerID(),EM_RoleValue_register8,0)
			end				
		end	
		if ReadRoleValue( boss1 , EM_RoleValue_IsDead)==1 and time10==0  then---�L�ı��F��
				open=0
				BOSS1open=0	
				killidtime=0
				time5=0
				time44=0
				time10=1
				WriteRoleValue(OwnerID(),EM_RoleValue_register3,1)---�^��1��BOSS
				WriteRoleValue(OwnerID(),EM_RoleValue_register8,0)	
		end		
		if hatelistcount(boss2)~=0 then    		---Ū����H��
			killidtime1=killidtime1+1
			if killidtime1>=360 and time2==0 then
				WriteRoleValue(boss2,EM_RoleValue_register7,1)---�^��1��BOSS
			end
			if open1==0 then
				open1=1					--�}���F
				time20=0 
			 door4=CreateObjByFlag(104198,780772,9,1)-------�J�f���ת�
				SetModeEx( door4 , EM_SetModeType_Mark, false)			----�i�I��(�_)
				SetModeEx( door4 , EM_SetModeType_ShowRoleHead, false) 	---�Y����(�_)
				SetModeEx( door4 , EM_SetModeType_Obstruct, true) 		---����(�O)
				SetModeEx( door4 , EM_SetModeType_Strikback, false) ---����(�_)
				SetModeEx( door4 , EM_SetModeType_Move, false) ---����	(�_)
				SetModeEx( door4 , EM_SetModeType_Fight, false) ---�i���(�_)
				SetModeEx( door4 , EM_SetModeType_SearchenemyIgnore, false) ---�O�_�Q�j�M(�_)
				SetModeEx( door4 , EM_SetModeType_Searchenemy, false)	---����(�_)
				AddToPartition(door4,RoomID)	
			door3=CreateObjByFlag(104198,780772,10,1)-------��������ת�
				SetModeEx( door3 , EM_SetModeType_Mark, false)			---�i�I��(�_)
				SetModeEx( door3, EM_SetModeType_ShowRoleHead, false) 		---�Y����(�_)
				SetModeEx( door3 , EM_SetModeType_Obstruct, true) 			--����(�O)
				SetModeEx( door3 , EM_SetModeType_Strikback, false) ---����
				SetModeEx( door3 , EM_SetModeType_Move, false) ---����	
				SetModeEx( door3 , EM_SetModeType_Fight, false) ---�i���
				SetModeEx( door3 , EM_SetModeType_SearchenemyIgnore, false) 	---�O�_�Q�j�M(�_)
				SetModeEx( door3 , EM_SetModeType_Searchenemy, false)			--����(�_)	
				AddToPartition(door3,RoomID)
				ScriptMessage( OwnerID(), -1 , 2 , "[SC_104694_02]" , 2 )	-------�}�����--�o�Ӱϰ�ڨӨ���
				BeginPlot(boss2 , "ic_104694_04" , 0)				------�R�O���ⰵ�Ʊ�
			end
		end	
		if boss2up==1 then---2���_����
				ScriptMessage( OwnerID(), -1 , 2 , "[SC_104694_07]" , 2 )	-------�}�����--�P�¥i�Y���O�q
				Boss2=CreateObjByFlag(104764,780772,2,1)           --�A�гy1��				
				AddToPartition(Boss2,RoomID)	    				---�гy�� ���n	
				SetPlot( boss2,"dead","ic_104694_0444",0 )		
				WriteRoleValue(Ctrl,EM_RoleValue_register2,Boss2)
				WriteRoleValue(Boss2,EM_RoleValue_register2,Ctrl)
				WriteRoleValue(Boss1,EM_RoleValue_register5,Boss2)   --�Ȧs�f�U5 BOSS1=BOSS2
				WriteRoleValue(Boss2,EM_RoleValue_register5,Boss1)	
				BeginPlot(OwnerID(), "ic_104694_06" , 0)
				open1=0					--���m�԰�
				WriteRoleValue(OwnerID(),EM_RoleValue_register7,0)
				BOSS2open1=0
				Check_pet = 0
				killidtime1=0
				time5=0
				time44=0
				WriteRoleValue(OwnerID(),EM_RoleValue_register4,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register9,0)
		end
		if hatelistcount(boss2)==0 and open1==1 then			--�}�ԫᤳ���S�H
			if ReadRoleValue( boss2 , EM_RoleValue_IsDead)==0 then   --���S�� ���a����
				sleep(10)
				DelObj(boss2)                                        --�S���ۤv������
				DelObj(door3)										--�R�����ת�
				DelObj(door4)										--�R�����ת�
				sleep(10)                                           --1��
				Boss2=CreateObjByFlag(104764,780772,2,1)           --�A�гy1��				
				AddToPartition(Boss2,RoomID)	                                ---�гy�� ���n				
				WriteRoleValue(Ctrl,EM_RoleValue_register2,Boss2)
				WriteRoleValue(Boss2,EM_RoleValue_register2,Ctrl)
				WriteRoleValue(OwnerID(),EM_RoleValue_register4,0)
				WriteRoleValue(Boss1,EM_RoleValue_register5,Boss2)   --�Ȧs�f�U5 BOSS1=BOSS2
				WriteRoleValue(Boss2,EM_RoleValue_register5,Boss1)	
				BeginPlot(OwnerID(), "ic_104694_06" , 0)
				open1=0					--���m�԰�
				BOSS2open1=0
				Check_pet = 0
				killidtime1=0
				time5=0
				time44=0
				WriteRoleValue(OwnerID(),EM_RoleValue_register4,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register9,0)
			elseif	ReadRoleValue( boss2 , EM_RoleValue_IsDead)==1 and time20==0  then---�����F
				BeginPlot(OwnerID(), "ic_104694_06" , 0)
				DelObj(door3)
				DelObj(door4)			
				open1=0										--���m�԰�
				BOSS2open1=0
				killidtime1=0
				time5=0
				time44=0
				time20=1
				WriteRoleValue(OwnerID(),EM_RoleValue_register4,1)
				WriteRoleValue(OwnerID(),EM_RoleValue_register9,0)
			end				
		end	
		if ReadRoleValue( boss2 , EM_RoleValue_IsDead)==1 and time20==0 then---�L�ı��F��
				open1=0
				BOSS2open1=0	
				killidtime1=0
				time5=0
				time44=0
				time20=1
				WriteRoleValue(OwnerID(),EM_RoleValue_register9,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register4,1)
				
		end	
	end			
end  
function ic_104694_0344()    ------��AI--��ù�E�U�J
local Ctrl=ReadRoleValue(OwnerID(),EM_RoleValue_register1)
ScriptMessage( Ctrl, -1 , 1 , "[SC_104694_08]" , 2 )----���i��|�Q����---���`
WriteRoleValue(Ctrl,EM_RoleValue_register3,1)
end
function ic_104694_0444()    ------��AI--�责�F
local Ctrl=ReadRoleValue(OwnerID(),EM_RoleValue_register2)
ScriptMessage( Ctrl, -1 , 2 , "[SC_104694_09]" , 2 )----���i��|��---���`
WriteRoleValue(Ctrl,EM_RoleValue_register4,1)
end
function ic_104694_03()    ------��AI--��ù�E�U�J
	local Ctrl=ReadRoleValue(OwnerID(),EM_RoleValue_register1)
	local boss2=ReadRoleValue(OwnerID(),EM_RoleValue_register5)
	local Boss1=OwnerID()
	local time1=0 	----�p�ɾ�
	local Luck=0	----�H�����---�ޯ��
	local time3=0 	----�p�ɾ�
	local time8=0 	----�p�ɾ�
	local time6=0 	----�p�ɾ�
	local play1x={} ---�H������
	local plays=0   ---�H������
	local time11=0
	local time111=0
	local time1111=0
	local time11111=0
	WriteRoleValue(OwnerID(),EM_RoleValue_register9,time111)
	local play1x={} 
	local plays=0
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID) 
	local killidtime1 =0---�g�ɥ�
	local MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )	--Ū����q
	local NowHP = ReadRoleValue(  OwnerID() , EM_RoleValue_HP )     --Ū���ثe��q
	local HPPercent = NowHP / MaxHP	
	while 1 do
		Sleep(10)
		--say(OwnerID(),"time1111="..time1111)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )   ------ ��M�ثe�������ؼ�
		local BossTarget=AttackTarget
		MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )	--Ū����q
		NowHP = ReadRoleValue( OwnerID() , EM_RoleValue_HP )--------Ū���ثe��q
		HPPercent = NowHP / MaxHP	--��q�ʤ���
		time111=ReadRoleValue(OwnerID(),EM_RoleValue_register9)
		time8=ReadRoleValue(OwnerID(),EM_RoleValue_register3)
		if time3==0 then
			WriteRoleValue(Ctrl,EM_RoleValue_register8,1)---�^��1�����
			time3=1
		end
		killidtime1= ReadRoleValue(OwnerID(),EM_RoleValue_register7)
		if killidtime1>=1 then
			AddBuff( OwnerID(),508659,0 ,-1 )
			killidtime1=0
			WriteRoleValue(OwnerID(),EM_RoleValue_register7,0)---��f�U8�k0
		end
		time1=time1+1
		time11111=time11111+1
			if  time11111 ==5 then
				while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
					sleep(10)
				end
				ScriptMessage( OwnerID(), -1 , 1 , "[SC_104694_04]" , 2 )---���i�������{
				WriteRoleValue(OwnerID(),EM_RoleValue_register9,time111+1)
				CastSpellLV( OwnerID() , OwnerID() , 496355 , 5)
				sleep(90)
			end
			if time111==0 and time8==1 then
				while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
					sleep(10)
				end
				ScriptMessage( OwnerID(), -1 , 1 , "[SC_104694_04]" , 2 )---���i�������{
				WriteRoleValue(OwnerID(),EM_RoleValue_register9,time111+1)
				time111=1
				CastSpellLV( OwnerID() , OwnerID() , 496355 , 5)
				sleep(90)
			elseif	time111==1 and time8==1 then
				while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
					sleep(5)
				end
				time111=0
				WriteRoleValue(OwnerID(),EM_RoleValue_register9,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register3,0)
			end
		if 	HPPercent>=0.5 then
			if time1>=8 then ---����ޯ�
					Luck=DW_Rand(2)---�H�����o�Ʀr��
				if luck==1 then
					CastSpellLV( OwnerID() , BossTarget , 496353 , 150)
					sleep(10)
					time1=0
				elseif luck==2 then
					CastSpellLV( OwnerID() , OwnerID() , 496354 , 120 )
					sleep(30)
					time1=0
				end
			end
		elseif 	HPPercent<=0.49 then
		time1111=time1111+1	
			if	time1111>=20 then 
				if hatelistcount(Boss1)==1 then	
					while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
					sleep(10)
					end
					CastSpellLV( OwnerID() , BossTarget , 496704 , 0 )
					time1111=0	
					sleep(30)
				elseif hatelistcount(Boss1)>=1 then
					while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
					sleep(10)
					end
					play1x=DW_HateRemain(1)-----------------------�H����--�����Z
					plays=DW_Rand(table.getn(play1x))
					CastSpellLV( OwnerID() , play1x[plays] , 496704 , 0 )
					time1111=0	
					sleep(30)
				end				
			end
			if time1>=8 then ---����ޯ�
					Luck=DW_Rand(2)---�H�����o�Ʀr��
				if luck==1 then
					CastSpellLV( OwnerID() , BossTarget , 496353 , 150)
					time1=0
				elseif luck==2 then
					CastSpellLV( OwnerID() , OwnerID() , 496354 , 120)
					time1=0
				end
			end
		end	
	end
end
function ic_104694_04()    ------��AI--�责�F
	local Ctrl=ReadRoleValue(OwnerID(),EM_RoleValue_register2)
	local boss1=ReadRoleValue(OwnerID(),EM_RoleValue_register5)
	local Boss2=OwnerID()
	local time2=0 	----�p�ɾ�
	local time7=0 	----�p�ɾ�
	local play1x={} ---�H������
	local plays=0   ---�H������
	local time9=0	
	local time4=0
	local time22=0
	local time222=0
	local time2222=0
	local time22222=0
	WriteRoleValue(OwnerID(),EM_RoleValue_register9,time222)
	local Luck=0	----�H�����---�ޯ��
	local play1x={} 
	local plays=0
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID) 
	local killidtime1 =0---�g�ɥ�
	local MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )	--Ū����q
	local NowHP = ReadRoleValue(  OwnerID() , EM_RoleValue_HP )     --Ū���ثe��q
	local HPPercent = NowHP / MaxHP	
	while 1 do
		Sleep(10)
		--say(OwnerID(),"time2222="..time2222)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )   ------ ��M�ثe�������ؼ�
		local BossTarget=AttackTarget
		MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )	--Ū����q
		NowHP = ReadRoleValue( OwnerID() , EM_RoleValue_HP )--------Ū���ثe��q
		HPPercent = NowHP / MaxHP	--��q�ʤ���
		time9=ReadRoleValue(OwnerID(),EM_RoleValue_register3)
		time222=ReadRoleValue(OwnerID(),EM_RoleValue_register9)
		if time4==0 then
			WriteRoleValue(Ctrl,EM_RoleValue_register9,1)---�^��1�����
			time4=1
		end
		killidtime1= ReadRoleValue(OwnerID(),EM_RoleValue_register7)
		if killidtime1>=1 then
			AddBuff( OwnerID(),508659,0 ,-1 )
			AddBuff( boss1,508659,0 ,-1 )
			killidtime1=0
			WriteRoleValue(OwnerID(),EM_RoleValue_register7,0)---��f�U8�k0
		end
		--say(OwnerID(),"time9="..time9)
		--say(OwnerID(),"time222="..time222)
		time2=time2+1
		time22222=time22222+1
		if time22222==5 then
			while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
					sleep(10)
			end
				ScriptMessage( OwnerID(), -1 , 2 , "[SC_104694_05]" , 2 )---����U�N���{
				WriteRoleValue(OwnerID(),EM_RoleValue_register9,time222+1)
				CastSpellLV( OwnerID() , OwnerID() , 496358 , 5)
				sleep(90)
		end
		if time222==0 and time9==1 then
				while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
					sleep(10)
				end
				ScriptMessage( OwnerID(), -1 , 2 , "[SC_104694_05]" , 2 )---����U�N���{
				WriteRoleValue(OwnerID(),EM_RoleValue_register9,time222+1)
				time222=1
				CastSpellLV( OwnerID() , OwnerID() , 496358 , 5)
				sleep(90)
		elseif time222==1 and time9==1 then
				while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
					sleep(5)
				end
				time222=0
				WriteRoleValue(OwnerID(),EM_RoleValue_register9,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register3,0)
		end
		if 	HPPercent>=0.5 then
			if time2>=8 then ---����ޯ�
				Luck=DW_Rand(2)---�H�����o�Ʀr��
				if luck==1 then
					CastSpellLV( OwnerID() , BossTarget , 496356 , 150)
					sleep(10)
					time2=0
				elseif luck==2 then
					CastSpellLV( OwnerID() , OwnerID() , 496357 , 120)
					sleep(30)
					time2=0
				end
			end
		elseif 	HPPercent<=0.49 then
			time2222=time2222+1
			if time2222>=20 then
				if hatelistcount(Boss2)==1 then	
					while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
					sleep(10)
					end
					CastSpellLV( OwnerID() ,BossTarget , 496705 , 0 )
					time2222=0
					sleep(30)
				elseif hatelistcount(Boss2)>=1 then
					while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
					sleep(10)
					end
					play1x=DW_HateRemain(1)-----------------------�H����--�����Z
					plays=DW_Rand(table.getn(play1x))
					CastSpellLV( OwnerID() , play1x[plays] , 496705 , 0 )
					time2222=0
					sleep(30)
				end
			end
			if time2>=8 then ---����ޯ�
				Luck=DW_Rand(2)---�H�����o�Ʀr��
				if luck==1 then
					CastSpellLV( OwnerID() , BossTarget , 496356 , 150)
					sleep(10)
					time2=0
				elseif luck==2 then
					CastSpellLV( OwnerID() , OwnerID() , 496357 , 120)
					sleep(30)
					time2=0
				end
			end
		end	
	end
end
function ic_104694_06()----�R��BUFF��--3��
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local TempPlayer = SetSearchAllPlayer(RoomID)----��ϰ�Ҧ����a
	local ThesePlayer = {}
	for i=1,TempPlayer do
		ThesePlayer[i] = GetSearchResult() -- ���Ȧs��
		if CheckID( ThesePlayer[i] ) == true and 
			ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and 
			ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then
				--�ˬd���a�O���O�٦b�F�ˬd�O�_���`
				if CheckBuff( ThesePlayer[i] , 507969 ) == true then
					CancelBuff(ThesePlayer[i], 507969)
				end	
		end					
	end
end
function ic_104694_05()----�R��BUFF��---2��
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local TempPlayer = SetSearchAllPlayer(RoomID)----��ϰ�Ҧ����a
	local ThesePlayer = {}
	for i=1,TempPlayer do
		ThesePlayer[i] = GetSearchResult() -- ���Ȧs��
		if CheckID( ThesePlayer[i] ) == true and 
			ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and 
			ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then
				--�ˬd���a�O���O�٦b�F�ˬd�O�_���`
				if CheckBuff( ThesePlayer[i] , 507970 ) == true then
					CancelBuff(ThesePlayer[i], 507970)
				end	
		end					
	end
end
function ic_104694_99()----�R��BUFF��---2��
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local TempPlayer = SetSearchAllPlayer(RoomID)----��ϰ�Ҧ����a
	local ThesePlayer = {}
	for i=1,TempPlayer do
		ThesePlayer[i] = GetSearchResult() -- ���Ȧs��
		if CheckID( ThesePlayer[i] ) == true and 
			ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and 
			ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then
				--�ˬd���a�O���O�٦b�F�ˬd�O�_���`
						CancelBuff(ThesePlayer[i], 507970)
						CancelBuff(ThesePlayer[i], 507969)	
		end					
	end
end