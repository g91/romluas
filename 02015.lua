function ic_104461_01()   ------�D����
	local Ctrl = OwnerID()					--���
	local open=0						    --�}�ԺX��	
	local Luck1=0							--�p���H����	
	local Luck=0							--�H����
	local time3=0							--�p�ɾ� �p�ǥ�
	local killidtime=0  					--�g�z�ɶ�
	local mob								--�p��1
	local mob1								--�p��2
	local door1								--���ת�1
	local door2								--���ת�2
	local RoomID=ReadRoleValue(Ctrl,EM_RoleValue_RoomID)
	local Boss=CreateObjByFlag(104461,780699,1,1) 	-----BOSS�Цb  �X��1
	local door=CreateObjByFlag(103125,780699,7,1)	-----���ת�(�����~�|����)
				SetModeEx( door , EM_SetModeType_Mark, false)
				SetModeEx( door , EM_SetModeType_ShowRoleHead, false) 	
				SetModeEx( door , EM_SetModeType_Obstruct, true) 
				SetModeEx( door , EM_SetModeType_Strikback, false) ---����
				SetModeEx( door , EM_SetModeType_Move, false) ---����	
				SetModeEx( door , EM_SetModeType_Fight, false) ---�i���
				SetModeEx( door , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( door , EM_SetModeType_Searchenemy, false)
				AddToPartition(door,RoomID)	
	SetModeEx( boss, EM_SetModeType_Move, false)
	AddToPartition(Boss,RoomID)
	AddBuff( Boss,507216,0 ,-1 )
	WriteRoleValue(Boss,EM_RoleValue_PID,Ctrl)   --�Ȧs�f�U 1 BOSS=ctrl
	WriteRoleValue(Ctrl,EM_RoleValue_PID,Boss)
	while true do
		sleep(10)	
		if hatelistcount(boss)~=0 then    		---Ū����H��
			time3=time3+1
			killidtime=killidtime+1
			if killidtime>=480 then
				WriteRoleValue(boss,EM_RoleValue_register4,1)---�^��1��BOSS
			end
			if open==0 then
				open=1										--�}���F
			 door2=CreateObjByFlag(103126,780699,6,1)-------�J�f���ת�
				SetModeEx( door2 , EM_SetModeType_Mark, false)			----�i�I��(�_)
				SetModeEx( door2 , EM_SetModeType_ShowRoleHead, false) 	---�Y����(�_)
				SetModeEx( door2 , EM_SetModeType_Obstruct, true) 		---����(�O)
				SetModeEx( door2 , EM_SetModeType_Strikback, false) ---����(�_)
				SetModeEx( door2 , EM_SetModeType_Move, false) ---����	(�_)
				SetModeEx( door2 , EM_SetModeType_Fight, false) ---�i���(�_)
				SetModeEx( door2 , EM_SetModeType_SearchenemyIgnore, false) ---�O�_�Q�j�M(�_)
				SetModeEx( door2 , EM_SetModeType_Searchenemy, false)	---����(�_)	
				AddToPartition(door2,RoomID)	
			door1=CreateObjByFlag(103126,780699,5,1)-------��������ת�
				SetModeEx( door1 , EM_SetModeType_Mark, false)			---�i�I��(�_)
				SetModeEx( door1 , EM_SetModeType_ShowRoleHead, false) 		---�Y����(�_)
				SetModeEx( door1 , EM_SetModeType_Obstruct, true) 			--����(�O)
				SetModeEx( door1 , EM_SetModeType_Strikback, false) ---����
				SetModeEx( door1 , EM_SetModeType_Move, false) ---����	
				SetModeEx( door1 , EM_SetModeType_Fight, false) ---�i���
				SetModeEx( door1 , EM_SetModeType_SearchenemyIgnore, false) 	---�O�_�Q�j�M(�_)
				SetModeEx( door1 , EM_SetModeType_Searchenemy, false)			--����(�_)	
				AddToPartition(door1,RoomID)
				BeginPlot(boss , "ic_104461_02" , 0)				------�R�O���ⰵ�Ʊ�
			end
			if time3>=30 then										---30���1��
				Luck1=DW_Rand(9)
				---say(OwnerID(),"4")
				mob=CreateObjByFlag(104463,780721,Luck1,1) 			----�ͤp�� �X��2 �k�v
				AddToPartition(mob,RoomID)	
				WriteRoleValue(mob,EM_RoleValue_PID,boss)		---��p�ǻ�BOSS�O��
				BeginPlot(mob,"ic_104461_05",0)                     ---�p��AI
		    end
			if time3>=30 then										---30���1��
				Luck1=DW_Rand(9)
				---say(OwnerID(),"4")
				ScriptMessage( OwnerID(), -1 , 2 , "[SC_104108_04]" , 2 )--�p�ǥX�ͪ����
				mob1=CreateObjByFlag(104462,780721,Luck1,1) 			----�ͤp�� �X��2 �Ԥh
				AddToPartition(mob1,RoomID)	
				WriteRoleValue(mob1,EM_RoleValue_PID,boss)			--��p�ǻ�BOSS�O��
				BeginPlot(mob1,"ic_104461_06",0)					----�p��AI
			time3=0 		--���m�p��
			end		
		end	
		if hatelistcount(boss)==0 and open==1 then			--�}�ԫᤳ���S�H
			if ReadRoleValue( boss , EM_RoleValue_IsDead)==0 then   --���S�� ���a����
				BeginPlot(OwnerID() , "ic_104108_07" , 0)
            local NPCXX = SearchRangeNPC ( OwnerID() , 300 )----�ۨ��d��300  ���ϰ��NPC
				for i = 0 , table.getn(NPCXX)	do
					if NPCXX[i] ~= OwnerID() then
						if	ReadRoleValue(NPCXX[i],EM_RoleValue_OrgID) == 	104462	then  ---��T�wID NPC
							DelObj( NPCXX[i] )
						end
						if	ReadRoleValue(NPCXX[i],EM_RoleValue_OrgID) == 	104463	then  ---��T�wID NPC
							DelObj( NPCXX[i] )
						end
					end
				end		
				DelObj(boss)                                        --�S���ۤv������
				DelObj(door1)										--�R�����ת�
				DelObj(door2)										--�R�����ת�
				sleep(50)                                           --5��
				Boss=CreateObjByFlag(104461,780699,1,1)           --�A�гy1��				
				AddToPartition(Boss,RoomID)	                                ---�гy�� ���n		
				AddBuff( Boss,507216,0 ,-1 )	
				SetModeEx( boss, EM_SetModeType_Move, false)	
				WriteRoleValue(Ctrl,EM_RoleValue_PID,Boss)
				WriteRoleValue(Boss,EM_RoleValue_PID,Ctrl)
				open=0										--���m�԰�
				time3=0
				killidtime=0
			elseif	ReadRoleValue( boss , EM_RoleValue_IsDead)==1 then---�����F
				ScriptMessage( OwnerID(), -1 , 2 , "[SC_104108_03]" , 2 )----���M�ڳQ���ѤF~�᭱����j���u�@�̦A���ۧA---���`��
				BeginPlot(OwnerID() , "ic_104108_07" , 0)
				local NPCXX = SearchRangeNPC ( OwnerID() , 300 )----�ۨ��d��300  ���ϰ��NPC
				for i = 0 , table.getn(NPCXX)	do
					if NPCXX[i] ~= OwnerID() then
						if	ReadRoleValue(NPCXX[i],EM_RoleValue_OrgID) == 	104462	then  ---��T�wID NPC
							DelObj( NPCXX[i] )
						end
						if	ReadRoleValue(NPCXX[i],EM_RoleValue_OrgID) == 	104463	then  ---��T�wID NPC
						DelObj( NPCXX[i] )
						end
					end
				end		
				DelObj(door)
				DelObj(door1)
				DelObj(door2)	
				open=0										--���m�԰�
				time3=0
				killidtime=0
			end				
		end
		if ReadRoleValue( boss , EM_RoleValue_IsDead)==1 then---�����F
				ScriptMessage( OwnerID(), -1 , 2 , "[SC_104108_03]" , 2 )----���M�ڳQ���ѤF~�᭱����j���u�@�̦A���ۧA---���`��
				BeginPlot(OwnerID() , "ic_104108_07" , 0)
				local NPCXX = SearchRangeNPC ( OwnerID() , 300 )----�ۨ��d��300  ���ϰ��NPC
				for i = 0 , table.getn(NPCXX)	do
					if NPCXX[i] ~= OwnerID() then
						if	ReadRoleValue(NPCXX[i],EM_RoleValue_OrgID) == 	104462	then  ---��T�wID NPC
							DelObj( NPCXX[i] )
						end
						if	ReadRoleValue(NPCXX[i],EM_RoleValue_OrgID) == 	104463	then  ---��T�wID NPC
						DelObj( NPCXX[i] )
						end
					end
				end		
				DelObj(door)
				open=0										--���m�԰�
				time3=0
				killidtime=0
				break	
		end		
	end		
end  
function ic_104461_02()    ------��AI
	local time1=0 	----�p�ɾ�1 -�ޯ��
	local time2=0	---- �p�ɾ�-�ޯ�j�ۥ�
	local time10=0	------��t��
	local Luck=0	----�H�����
	local MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )	--Ū����q
	local NowHP = ReadRoleValue(  OwnerID() , EM_RoleValue_HP )     --Ū���ثe��q
	local HPPercent = NowHP / MaxHP	                                --��q�ʤ���	
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID) 
	local y = 0
	local killidtime1 =0
	while 1 do 
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )   ------ ��M�ثe�������ؼ�  
		local BossTarget=AttackTarget
		MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )	--Ū����q
		NowHP = ReadRoleValue(  OwnerID() , EM_RoleValue_HP )--------Ū���ثe��q
		HPPercent = NowHP / MaxHP	--��q�ʤ���
		if time10<=0 then
		---say(OwnerID(),"99")
			----sleep(10)
			time10=time10+1
			CastSpellLV( OwnerID() , OwnerID() ,495953, 1)------��t��ܭ�
			CancelBuff( OwnerID() ,507216 ) ----------------------------�M���L��buff
			SetModeEx( OwnerID() , EM_SetModeType_Move, true)
			sleep(5)
		end
		sleep(10)
		y = ReadRoleValue(OwnerID(),EM_RoleValue_register3)
		if y==1 then-------��ۤv��+15%������
			---say(OwnerID(),"99")
			AddBuff( OwnerID(),507268,0 ,-1 )
			y=0
			WriteRoleValue(OwnerID(),EM_RoleValue_register3,0)----��f�U3�k0
		elseif y==2 then-----��ۤv��+50%������
		---say(OwnerID(),"00")
		AddBuff( OwnerID(),507269,0 ,-1 )
			y=0
			WriteRoleValue(OwnerID(),EM_RoleValue_register3,0)---��f�U3�k0
		elseif y==3 then-----��ۤv��+80%������
		---say(OwnerID(),"00")
		AddBuff( OwnerID(),507276,0 ,-1 )
			y=0
			WriteRoleValue(OwnerID(),EM_RoleValue_register3,0)---��f�U3�k0		
		end
		killidtime1= ReadRoleValue(OwnerID(),EM_RoleValue_register4)
		if killidtime1>=1 then
			ScriptMessage( OwnerID(), -1 , 2 , "[SC_104108_06]" , 2 )------���ªk�N�[��~�����˥d�O�q�z�W~�]�a�]�a~�L���J�I�̡C---�g�z
			AddBuff( OwnerID(),507277,0 ,-1 )
			AddBuff( OwnerID(),507364,0 ,-1 )
			sleep(600)
			end
		if HPPercent >=0.71 then  ------��q>=71% �γo�ޯ�
			time1=time1+1
			---say(OwnerID(),"time"..time1)
			if time1>=7 then 
				Luck=DW_Rand(3)---�H�����o�Ʀr��
				if Luck == 1 then
				while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
					sleep(10)
				end
				--say(OwnerID(),"1")
				CastSpellLV( OwnerID() , BossTarget , 495838, 200 )----����ޯ�
				elseif Luck == 2 then 
				while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
					sleep(10)
				end
				--say(OwnerID(),"2")
				CastSpellLV( OwnerID() , OwnerID() , 495923, 1 )----�ۨ��d��
				elseif Luck == 3 then 
				while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
					sleep(10)
				end			
				---say(OwnerID(),"3")	
					ScriptMessage( OwnerID(), -1 , 2 , "[SC_104108_01]" , 1 )	---�ФH���J�I�̡A���A����|�߱ڤH���F�`�C---½���			
					CastSpellLV( OwnerID() ,OwnerID() , 495837, 2 )----½��
					sleep(30)		    
				end
				time1=0
		    end
		end
	    if HPPercent <=0.70 then------��q�C��70% �γo�ޯ�
			time1=time1+1
			time2=time2+1
			---say(OwnerID(),"time"..time1)
			if time1>=7 then 
				Luck=DW_Rand(3)---�H�����o�Ʀr��
				if Luck == 1 then
				--say(OwnerID(),"4")
				while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
					sleep(10)
				end
				CastSpellLV( OwnerID() , BossTarget , 495838, 200 )-----����ޯ�
				elseif Luck == 2 then
				while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
					sleep(10)
				end	
				--say(OwnerID(),"5")
				CastSpellLV( OwnerID() , OwnerID() , 495923, 1)-----�ۨ��d��
				elseif Luck == 3 then 
				--say(OwnerID(),"6")
				while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
					sleep(10)
				end
				ScriptMessage( OwnerID(), -1 , 2 , "[SC_104108_01]" , 2 )----�ФH���J�I�̡A���A����|�߱ڤH���F�`�C---½���
				CastSpellLV( OwnerID() ,OwnerID() , 495837, 1 )----½��
				sleep(30)		    
				end
				time1=0
			end	
			if time2>=40 then------�j�� 40��T�w��---����
				while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
					sleep(2)
				end			
			    ---say(OwnerID(),"7")
				ScriptMessage( OwnerID(), -1 , 2 , "[SC_104108_02]" , 2 )---------------�S���H�i�H�b�߱ڼ���U�ͦs�C---�j����
				sleep(20)
				PlayMotion ( OwnerID(),ruFUSION_ACTORSTATE_SLEEP_BEGIN	 )---------------��1�|�ʧ@
				---say(OwnerID(),"[SC_104108_02]")
				SetModeEx( OwnerID() , EM_SetModeType_Fight, false) ---�i���
				SetModeEx( OwnerID() , EM_SetModeType_Move, false) ---����	
				sleep(5)
				SetIdleMotion( OwnerID() ,ruFUSION_ACTORSTATE_SLEEP_LOOP	)-----------------------�����ʧ@
				CastSpellLV( OwnerID() , OwnerID() , 495834 , 0 )
				sleep(30)
				while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
					sleep(2)
				end			
				PlayMotion ( OwnerID(), ruFUSION_ACTORSTATE_SLEEP_END )---------------------����U��
				SetModeEx( OwnerID() , EM_SetModeType_Fight, true) ---�i���
				SetModeEx( OwnerID() , EM_SetModeType_Move, true) ---����	
				SetIdleMotion( OwnerID() ,  ruFUSION_ACTORSTATE_NORMAL)--------�O���a�U�Ҧ�
				time2=0
			end
		end
	end
end
function ic_104461_05 () -----�p��AI-1 �k�v
	local boss=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local AttackTarget = ReadRoleValue( boss, EM_RoleValue_AttackTargetID )   ------ ��MBOSS�������ؼ�  
	local BossTarget=0
	SetAttack( ownerid() , AttackTarget) ----------------------------�X�ͪ������h�ݥؼЬO�֥h���o�@�U
	while true do
		BossTarget = ReadRoleValue( ownerid(), EM_RoleValue_AttackTargetID )   ------ ��MBOSS�������ؼ�  
		sleep(10)
		CastSpellLV( OwnerID() , BossTarget , 495948, 100 )---�T���ޯ�
		sleep(50)
		if hatelistcount(boss)==0 then   --�ˬd�����S���ؼ�
			DelObj(OwnerID())            --�S����ۤv����    
		end	
	end
end
function ic_104461_06 () -----�p��AI-2 �Ԥh
	local boss=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local AttackTarget = ReadRoleValue( boss , EM_RoleValue_AttackTargetID )   ------ ��MBOSS�������ؼ�  
	local BossTarget=0
	SetAttack( ownerid() , AttackTarget) 
	while true do
		BossTarget = ReadRoleValue( ownerid(), EM_RoleValue_AttackTargetID )   ------ ��MBOSS�������ؼ�  
		sleep(10)
		CastSpellLV( OwnerID() , BossTarget , 495979, 1 )---�}�ҧޯ�
		sleep(50)
		if hatelistcount(boss)==0 then   --�ˬd�����S���ؼ�
			DelObj(OwnerID())            --�S����ۤv����    
		end	
	end
end
 
 --SC_104108_01---�ФH���J�I�̡A���A����|�߱ڤH���F�`�C---½���
 --SC_104108_02---�S���H�i�H�b�߱ڼ���U�ͦs�C---�j����
 --SC_104108_03---���M�ڳQ���ѤF~�᭱����j���u�@�̦A���ۧA---���`��
-- SC_104108_04--�X�ӧa~�ڪ��ڤH~���U�ڻ����J�I�̡C---�ۤp�L��
 --SC_104108_05--���ϵL�k�ϥ�