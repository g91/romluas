function at_103821_01()   ------BOSS���D����
	local Ctrl = OwnerID()					--�ŧi����s��Ctrl
	local open=0						    --�}�ԺX��		
	local killidtime=0  					--�g�z�ɶ�
	local time1=0							--�p�ɾ� �p�ǥ�
	local Luck7=0	----�H�����
	local mob								--�p��1
	local mob123                            --�p�ƾ� �p�ǥ�
	local door1								--���ת�1
	local RoomID=ReadRoleValue(Ctrl,EM_RoleValue_RoomID)       ---�ŧi�o�Ӧa��~�O�ڲ{�bŪ�쪺�a��
	local Boss=CreateObjByFlag(103821,781027,1,1) 	-----BOSS�Цb  �X��1
	local door=CreateObjByFlag(104199,781027,2,1)	-----���ת�(�����~�|����)
				SetModeEx( door , EM_SetModeType_Mark, false)
				SetModeEx( door , EM_SetModeType_ShowRoleHead, false) 	
				SetModeEx( door , EM_SetModeType_Obstruct, true) 
				SetModeEx( door , EM_SetModeType_Strikback, false) ---����
				SetModeEx( door , EM_SetModeType_Move, false) ---����	
				SetModeEx( door , EM_SetModeType_Fight, false) ---�i���
				SetModeEx( door , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( door , EM_SetModeType_Searchenemy, false)
				AddToPartition(door,RoomID)
	AddToPartition ( boss,RoomID )  ---------�⪫��[�J������----�n�b�o�Ӧa�貣�ͤ@�ӷs���F�賣�����n���o�Ӱʧ@
	WriteRoleValue(Boss,EM_RoleValue_PID,Ctrl)
	while true do
		sleep(10)	
		if hatelistcount(boss)~=0 then    		---Ū����H��
			time1=time1+1
			killidtime=killidtime+1
			mob123=ReadRoleValue(Ctrl,EM_RoleValue_register1)
			if killidtime>=480 then
				WriteRoleValue(boss,EM_RoleValue_register2,1)---�^��1��BOSS
			end
			if open==0 then
				open=1
			door1=CreateObjByFlag(104198,781027,3,1)-------�J�f���ת� 
				SetModeEx( door1 , EM_SetModeType_Mark, false)			---�i�I��(�_)
				SetModeEx( door1 , EM_SetModeType_ShowRoleHead, false) 		---�Y����(�_)
				SetModeEx( door1 , EM_SetModeType_Obstruct, true) 			--����(�O)
				SetModeEx( door1 , EM_SetModeType_Strikback, false) ---����
				SetModeEx( door1 , EM_SetModeType_Move, false) ---����	
				SetModeEx( door1 , EM_SetModeType_Fight, false) ---�i���
				SetModeEx( door1 , EM_SetModeType_SearchenemyIgnore, false) 	---�O�_�Q�j�M(�_)
				SetModeEx( door1 , EM_SetModeType_Searchenemy, false)			--����(�_)
				AddToPartition(door1,RoomID)				
				BeginPlot(boss , "at_103821_02" , 0)				------�R�O���ⰵ�Ʊ�
				say(OwnerID(),"1")
			end
			if time1>=20 and mob123<20  then			---10���1��  �̦h5��
				mob123=ReadRoleValue(Ctrl,EM_RoleValue_register1)    -----Ū�p�Ǽƶq
				WriteRoleValue(Ctrl,EM_RoleValue_register1,mob123+1)      -----Ū�p�Ǽƶq   ��ƶq�O�i�f�U��
				mob=CreateObjByFlag(104110,781027,4,1) 			----�ͤp�� 
				AddToPartition(mob,RoomID)
				AddBuff(Boss,507663,0 ,-1 )
					Luck7=DW_Rand(3)---�H�����o�Ʀr��
					if Luck7 == 1 then
					AddBuff(mob,507663,0 ,-1 )
					elseif Luck7 == 2 then 
					AddBuff(mob,507663,0 ,-1 )
					elseif Luck7 == 3 then 
					AddBuff(mob,507663,0 ,-1 )
					end
				BeginPlot(mob , "at_103821_03" , 0)				------�R�O���ⰵ�Ʊ�
				SetPlot( mob,"dead","ic_106292_mobXX",0 )			----�p�Ǧ��`�@��
				WriteRoleValue(mob,EM_RoleValue_PID,Ctrl)
			time1=0 		--���m�p��
			end
		end
		if hatelistcount(boss)==0 and open==1 then			--�}�ԫᤳ���S�H
			if ReadRoleValue( boss , EM_RoleValue_IsDead)==0 then   --���S�� ���a����
			local NPCXX = SearchRangeNPC ( OwnerID() , 300 )----�ۨ��d��300  ���ϰ��NPC
				for i = 0 , table.getn(NPCXX)	do
					if NPCXX[i] ~= OwnerID() then
						if	ReadRoleValue(NPCXX[i],EM_RoleValue_OrgID) == 	104110	then  ---��T�wID NPC
							DelObj( NPCXX[i] )
						end
					end
				end		
				say(OwnerID(),"2")
				DelObj(boss)                                        --�S���ۤv������
				DelObj(door1)										--�R�����ת�
				sleep(50)                                           --5��
				Boss=CreateObjByFlag(103821,781027,1,1)           --�A�гy1��				
				AddToPartition(Boss,RoomID)	                                ---�гy�� ���n		
				WriteRoleValue(Ctrl,EM_RoleValue_PID,Boss)
				WriteRoleValue(Boss,EM_RoleValue_PID,Ctrl)
				WriteRoleValue(Ctrl,EM_RoleValue_register1,0)   ---�p�ǰO���k�s
				time1=0 		                               --���m�p��
				open=0										--���m�԰�
				killidtime=0
			elseif	ReadRoleValue( boss , EM_RoleValue_IsDead)==1 then---�����F
				local NPCXX = SearchRangeNPC ( OwnerID() , 300 )----�ۨ��d��300  ���ϰ��NPC
				for i = 0 , table.getn(NPCXX)	do
					if NPCXX[i] ~= OwnerID() then
						if	ReadRoleValue(NPCXX[i],EM_RoleValue_OrgID) == 	104110	then  ---��T�wID NPC
							DelObj( NPCXX[i] )
						end
					end
				end
				DelObj(door)										--�R�����ת�
				DelObj(door1)										--�R�����ת�
				open=0										--���m�԰�
				killidtime=0
				say(OwnerID(),"3")
			end				
		end	
		if ReadRoleValue( boss , EM_RoleValue_IsDead)==1 then 
			local NPCXX = SearchRangeNPC ( OwnerID() , 300 )----�ۨ��d��300  ���ϰ��NPC
			for i = 0 , table.getn(NPCXX)	do
				if NPCXX[i] ~= OwnerID() then
					if	ReadRoleValue(NPCXX[i],EM_RoleValue_OrgID) == 	104110	then  ---��T�wID NPC
						DelObj( NPCXX[i] )
					end
				end
			end
			DelObj(door)										--�R�����ת�
			DelObj(door1)										--�R�����ת�
			open=0										--���m�԰�
			killidtime=0
			say(OwnerID(),"4")
			break	
		end
	end
end



function at_103821_02()   ----bossAI
	local time2=0 	----�p�ɾ�  �ޯ��
	local time3=0	---- �p�ɾ�  �ޯ��
	local time4=0	------�p�ɾ�  �ޯ��
	local Luck=0	----�H�����
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)    ---�ŧi�o�Ӧa��~�O�ڲ{�bŪ�쪺�a��
	local killidtime1 =0    ----�g�ɭp�ɾ�
	local play1x={} 
	local plays=0
	local mbe1
	local mbe2
	local mbe3
	local mbe4
	while 1 do 
		sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )   ------ ��M�ثe�������ؼ�  
		local BossTarget=AttackTarget
		killidtime1= ReadRoleValue(OwnerID(),EM_RoleValue_register2)
		time2=time2+1
		time3=time3+1
		if killidtime1>=1 then
			AddBuff( OwnerID(),507277,0 ,-1 ) 
			sleep(600)
			end
		if time2>=9 then
			Luck=DW_Rand(2)---�H�����o�Ʀr��
			if Luck == 1 then
			while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
				sleep(10)
			end
			play1x=DW_HateRemain(0)	---1�ƩZ
			plays=DW_Rand(table.getn(play1x))
			CastSpellLV( OwnerID() ,play1x[plays] , 496022 , 19 )   ---�H����1�H��ޯ�
			elseif Luck == 2 then
			while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
				sleep(10)
			end
			local bosskkpaly = {}
			play1x=DW_HateRemain(1)	---1�ƩZ
			plays=DW_Rand(table.getn(play1x))
			CastSpellLV( OwnerID() ,play1x[plays] , 497733 , 1 )
			bosskkpaly = ic_HateListSort(OwnerID())
			local Tank = bosskkpaly[1]
			SYSCastSpellLV( OwnerID(), Tank, 497733, 1 )  ---���w���Z
			end
			time2=0
		end
		if time3>=21 then
			while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
				sleep(10)
			end
		if hatelistcount(boss)==1 then   -----Ūboss������X�H
			local bosskkpaly = {}
			bosskkpaly = ic_HateListSort(OwnerID())
			mbe1 = bosskkpaly[1]       -------������1�W��mbe1
			SYSCastSpellLV( OwnerID(), mbe1, 497733, 1 )     -------��mbe1�I��k�N
			elseif hatelistcount(boss)==2 then
			local bosskkpaly = {}
			bosskkpaly = ic_HateListSort(OwnerID())
			mbe1 = bosskkpaly[1]           
			mbe2 = bosskkpaly[2]             -------������2�W��mbe2
			SYSCastSpellLV( OwnerID(), mbe1, 497733, 1 )
			SYSCastSpellLV( OwnerID(), mbe2, 497733, 1 )
			elseif hatelistcount(boss)==3 then
			local bosskkpaly = {}
			bosskkpaly = ic_HateListSort(OwnerID())
			mbe1 = bosskkpaly[1]
			mbe2 = bosskkpaly[2]
			mbe3 = bosskkpaly[3]             -------������3�W��mbe3
			SYSCastSpellLV( OwnerID(), mbe1, 497733, 1 )
			SYSCastSpellLV( OwnerID(), mbe2, 497733, 1 )
			SYSCastSpellLV( OwnerID(), mbe3, 497733, 1 )
			elseif hatelistcount(boss)>=4 then
			local bosskkpaly = {}
			bosskkpaly = ic_HateListSort(OwnerID())
			mbe2 = bosskkpaly[2]
			mbe3 = bosskkpaly[3]
			mbe4 = bosskkpaly[4]           -------������4�W��mbe4
			SYSCastSpellLV( OwnerID(), mbe2, 497733, 1 )
			SYSCastSpellLV( OwnerID(), mbe3, 497733, 1 )
			SYSCastSpellLV( OwnerID(), mbe4, 497733, 1 )
			end
			time3=0
		end
	end	
end		
		


		
function at_103821_03()    ----�p��ai
	local boss=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local AttackTarget = ReadRoleValue( boss, EM_RoleValue_AttackTargetID )   ------ ��MBOSS�������ؼ�  
	local BossTarget=0
	local time6=0
	local MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )							---Ū����q
	local NowHP = ReadRoleValue( OwnerID() , EM_RoleValue_HP )     						 	---Ū���ثe��q
	local HPPercent = NowHP / MaxHP
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)    ---�ŧi�o�Ӧa��~�O�ڲ{�bŪ�쪺�a��
	SetAttack( ownerid() , AttackTarget)
	while true do
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )   ------ ��M�ثe�������ؼ�  
		if  HPPercent >0.10 then	
			sleep(10)
			CastSpellLV( OwnerID() , AttackTarget , 495948, 100 )  ----��]�t�ޯ�
		end
		if  HPPercent <0.10 then    ------��q�C��40% �γo�ޯ�
			time6=time6+1
			if time6<10 then 
				while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
					sleep(10)
				end
				CastSpellLV( OwnerID() , AttackTarget, 495948, 100 )  ----�I�k10���ޯ�
			end
			if time6>=10 then 
				while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
					sleep(10)
				end
				local NPCXX = SearchRangeNPC ( OwnerID() , 300 )----�ۨ��d��300  ���ϰ��NPC
				for i = 0 , table.getn(NPCXX)	do
					if NPCXX[i] ~= OwnerID() then
						if	ReadRoleValue(NPCXX[i],EM_RoleValue_OrgID) == 	104110	then  ---��T�wID NPC
							DelObj( NPCXX[i] )
						end
					end
				end
				ic_mob_Rand_noadd( OwnerID() , 103821 ,0,0)
			end
		end
	end
end



function ic_106292_mobXX()			  	---���`��  �O�ƥ�
	local Ctrl=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local mob123	
		mob123=ReadRoleValue(Ctrl,EM_RoleValue_register1)
		WriteRoleValue(Ctrl,EM_RoleValue_register1,mob123-1)
	local NPCXX = SearchRangeNPC ( OwnerID() , 300 )      ----�ۨ��d��300  ���ϰ��NPC
			for i = 0 , table.getn(NPCXX)	do
				if NPCXX[i] ~= OwnerID() then
					if	ReadRoleValue(NPCXX[i],EM_RoleValue_OrgID) == 	104110	then  ---��T�wID NPC
					sleep(10)
					elseif ReadRoleValue(NPCXX[i],EM_RoleValue_OrgID) == 	103821	then
					CancelBuff(boss, 507663)
					end
				end
	end
end

				