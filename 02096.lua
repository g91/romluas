function ic_104653_01()   ------�D����
	local Ctrl = OwnerID()					--���
	local open=0						    --�}�ԺX��				        
	local Luck=0							--�H����
	local time6=0							--�p�ɾ� �p�ǥ�
	local time7=0							--�p�ɾ� �¦⭷�ɥ�
	local killidtime=0
	local door1								--���ת�1
	local door2								--���ת�2
	local RoomID=ReadRoleValue(Ctrl,EM_RoleValue_RoomID)
	local Boss=CreateObjByFlag(104653,780730,13,1) 	-----BOSS�Цb  �X��1
	local door=CreateObjByFlag(104506,780730,14,1)	-----���ת�(�����~�|����)
				SetModeEx( door , EM_SetModeType_Mark, false)
				SetModeEx( door , EM_SetModeType_ShowRoleHead, false) 	
				SetModeEx( door , EM_SetModeType_Obstruct, true) 
				SetModeEx( door , EM_SetModeType_Strikback, false) ---����
				SetModeEx( door , EM_SetModeType_Move, false) ---����	
				SetModeEx( door , EM_SetModeType_Fight, false) ---�i���
				SetModeEx( door , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( door , EM_SetModeType_Searchenemy, false)
				AddToPartition(door,RoomID)	
				AddToPartition(Boss,RoomID)
				WriteRoleValue(Boss,EM_RoleValue_PID,Ctrl)   --�Ȧs�f�U 1 BOSS=ctrl
				WriteRoleValue(Ctrl,EM_RoleValue_PID,Boss)
	while true do
		sleep(10)	
		if hatelistcount(boss)~=0 then    		---Ū����H��
			time6=time6+1
			time7=time7+1
			---killidtime=killidtime+1
			---say(OwnerID(),"killidtime"..killidtime)
			if time7>=20 then
				WriteRoleValue(boss,EM_RoleValue_register3,1)---�^��1��BOSS
				time7=0
			end
			if time6>=31 then
				WriteRoleValue(boss,EM_RoleValue_register7,1)---�^��1��BOSS
				time6=0
			end
			--if killidtime>=480 then
				--WriteRoleValue(boss,EM_RoleValue_register8,1)---�^��1��BOSS
				--killidtime=0
			--end
			if open==0 then
				open=1										--�}���F
			 door2=CreateObjByFlag(104198,780730,11,1)-------�J�f���ת�
				SetModeEx( door2 , EM_SetModeType_Mark, false)			----�i�I��(�_)
				SetModeEx( door2 , EM_SetModeType_ShowRoleHead, false) 	---�Y����(�_)
				SetModeEx( door2 , EM_SetModeType_Obstruct, true) 		---����(�O)
				SetModeEx( door2 , EM_SetModeType_Strikback, false) ---����(�_)
				SetModeEx( door2 , EM_SetModeType_Move, false) ---����	(�_)
				SetModeEx( door2 , EM_SetModeType_Fight, false) ---�i���(�_)
				SetModeEx( door2 , EM_SetModeType_SearchenemyIgnore, false) ---�O�_�Q�j�M(�_)
				SetModeEx( door2 , EM_SetModeType_Searchenemy, false)	---����(�_)
				AddToPartition(door2,RoomID)	
			door1=CreateObjByFlag(104198,780730,12,1)-------��������ת�
				SetModeEx( door1 , EM_SetModeType_Mark, false)			---�i�I��(�_)
				SetModeEx( door1 , EM_SetModeType_ShowRoleHead, false) 		---�Y����(�_)
				SetModeEx( door1 , EM_SetModeType_Obstruct, true) 			--����(�O)
				SetModeEx( door1 , EM_SetModeType_Strikback, false) ---����
				SetModeEx( door1 , EM_SetModeType_Move, false) ---����	
				SetModeEx( door1 , EM_SetModeType_Fight, false) ---�i���
				SetModeEx( door1 , EM_SetModeType_SearchenemyIgnore, false) 	---�O�_�Q�j�M(�_)
				SetModeEx( door1 , EM_SetModeType_Searchenemy, false)			--����(�_)	
				AddToPartition(door1,RoomID)
				ScriptMessage( OwnerID(), -1 , 2 , "[SC_104224_08]" , 2 )	-------�}�����--�s�Ӫ�~�O�����A�̶i�Ӫ�~�����a
				BeginPlot(boss , "ic_104653_02" , 0)				------�R�O���ⰵ�Ʊ�
			end
		end	
		if hatelistcount(boss)==0 and open==1 then			--�}�ԫᤳ���S�H
			if ReadRoleValue( boss , EM_RoleValue_IsDead)==0 then   --���S�� ���a����
				BeginPlot(OwnerID() , "ic_104224_07" , 0)
				local NPCXX = SetSearchAllNPC(RoomID )---���ϰ��NPC
				local ID=GetSearchResult()
				local ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
				for i = 0 , NPCXX do
					ID=GetSearchResult()
					ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
					--say(OwnerID(),"NPCXX"..NPCXX)
					if ID2==104654 or ID2==104655 then
					DelObj(ID)
					end
				end
				sleep(20)
				DelObj(boss)                                        --�S���ۤv������
				DelObj(door1)										--�R�����ת�
				DelObj(door2)										--�R�����ת�
				sleep(30)                                           --5��
				Boss=CreateObjByFlag(104653,780730,13,1)           --�A�гy1��				
				AddToPartition(Boss,RoomID)	                                ---�гy�� ���n				
				WriteRoleValue(Ctrl,EM_RoleValue_PID,Boss)
				WriteRoleValue(Boss,EM_RoleValue_PID,Ctrl)
				open=0										--���m�԰�
				time6=0
				time7=0
				killidtime=0
			elseif	ReadRoleValue( boss , EM_RoleValue_IsDead)==1 then---�����F
				ScriptMessage( OwnerID(), -1 , 2 , "[SC_104108_03]" , 2 )----���M�ڳQ���ѤF~�᭱����j���u�@�̦A���ۧA---���`
				BeginPlot(OwnerID() , "ic_104653_07" , 0)
				local NPCXX = SetSearchAllNPC(RoomID )---���ϰ��NPC
				local ID=GetSearchResult()
				local ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
				for i = 0 ,NPCXX do
					if ID2==104654 or ID2==104655 then
					ID=GetSearchResult()
					ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
					DelObj(ID)
					end
				end
				DelObj(door)
				DelObj(door1)
				DelObj(door2)	
				open=0										--���m�԰�
				time6=0
				time7=0
				killidtime=0
				break
			end				
		end	
		if ReadRoleValue( boss , EM_RoleValue_IsDead)==1 then---�L�ı��F��
				ScriptMessage( OwnerID(), -1 , 2 , "[SC_104108_03]" , 2 )----���M�ڳQ���ѤF~�᭱����j���u�@�̦A���ۧA---���`
				BeginPlot(OwnerID() , "ic_104653_07" , 0)
				local NPCXX = SetSearchAllNPC(RoomID )---���ϰ��NPC
				local ID=GetSearchResult()
				local ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
				for i = 0 ,NPCXX do
					if ID2==104304 or ID2==104303 then
					ID=GetSearchResult()
					ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
					DelObj(ID)
					end
				end
				DelObj(door)
				open=0										
				time6=0
				time7=0
				killidtime=0
				sleep(600000) 
			end	
	end		
end  
function ic_104653_02()    ------��AI
	local Boss=OwnerID()
	local time1=0 	-----��1���q��
	local time2=0 	----�p�ɾ�2 -��1-2���q��
	local time3=0 	----�p�ɾ�3 -��2���q��
	local time4=0 	----�p�ɾ�4 -��2���q��
	local time5=0 	----�p�ɾ�4 -��2���q��
	local mob		----�����κX�Х�---�¦�x��
	local mob1		----�ͤp�Υ�
	local mob2		----�ͤp�Υ�
	local mob3		----�ͪ��H��
	local Luck=0	----�H�����---�ޯ��
	local Luck2=0	----�H���y�Х�
	local Luck3=0	----�p���H����
	local play1x={} 
	local plays=0
	local MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )	--Ū����q
	local NowHP = ReadRoleValue(  OwnerID() , EM_RoleValue_HP )     --Ū���ثe��q
	local HPPercent = NowHP / MaxHP	                                --��q�ʤ���	
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID) 
	local killidtime1 =0---�g�ɥ�
	local TempPlayer = SetSearchAllPlayer(RoomID)----��ϰ�Ҧ����a
	local ThesePlayer = {}
	local searchplay={}
	local searmuch=0 ------------�ƶq
	while 1 do 
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )   ------ ��M�ثe�������ؼ�  
		local BossTarget=AttackTarget
		MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )	--Ū����q
		NowHP = ReadRoleValue(  OwnerID() , EM_RoleValue_HP )--------Ū���ثe��q
		HPPercent = NowHP / MaxHP	--��q�ʤ���
		sleep(10)
		--killidtime1= ReadRoleValue(OwnerID(),EM_RoleValue_register8)
		--if killidtime1>=1 then
			--AddBuff( OwnerID(),507663,0 ,-1 )
			--killidtime1=0
			--WriteRoleValue(OwnerID(),EM_RoleValue_register8,0)---��f�U8�k0
			--sleep(600)
		--end
		if HPPercent >=0.61 then  ------��q>=61% �γo�ޯ�
			time2=time2+1
			time3=time3+1
			---say(OwnerID(),"time"..time4)
			if time2==25 then ---��k�}---�ͤp�Υ�30��
				Luck2=DW_Rand(9)
				Luck3=Luck2+1
				while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
					sleep(2)
				end
				ScriptMessage( OwnerID(), -1 , 2 , "[SC_104224_03]" , 2 )---------------�X�ӧa~�·t���P
				CastSpellLV( OwnerID() , OwnerID() , 496024, 2)
				mob1=CreateObjByFlag(104655,780730,Luck2,1)
				AddToPartition(mob1,RoomID)
				WriteRoleValue(mob1,EM_RoleValue_PID,boss)			--��p�ǻ�BOSS�O��
				BeginPlot(mob1,"ic_104653_06",0)
				mob2=CreateObjByFlag(104655,780730,Luck3,1)
				AddToPartition(mob2,RoomID)
				WriteRoleValue(mob2,EM_RoleValue_PID,boss)			--��p�ǻ�BOSS�O��
				BeginPlot(mob2,"ic_104653_06",0)
				time2=0								
			elseif  time2==15 then---�ªk�} 15��
				while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
					sleep(10)
				end
				---say(OwnerID(),"5")
				play1x=DW_HateRemain(0)-----------------------�H����
				plays=DW_Rand(table.getn(play1x))	
				SetModeEx( OwnerID() , EM_SetModeType_Fight, false) ---�i���
				SetModeEx( OwnerID() , EM_SetModeType_Move, false) ---����	
				PlayMotion ( OwnerID(),ruFUSION_ACTORSTATE_SLEEP_BEGIN	 )---------------��1�|�ʧ@
				ScriptMessage( OwnerID(), -1 , 2 , "[SC_104224_05]" , 2 )---------------�·t�O�q�X��	
				sleep(5)
				SetIdleMotion( OwnerID() ,ruFUSION_ACTORSTATE_SLEEP_LOOP	)-----------------------�����ʧ@
				CastSpellLV( OwnerID() , play1x[plays] , 496026 , 30 )
				sleep(30)
				while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
					sleep(2)
				end			
				PlayMotion ( OwnerID(), ruFUSION_ACTORSTATE_SLEEP_END )---------------------�����ʧ@
				SetModeEx( OwnerID() , EM_SetModeType_Fight, true) ---�i���
				SetModeEx( OwnerID() , EM_SetModeType_Move, true) ---����
			elseif time2==20 then 
				Luck=DW_Rand(3)---�H�����o�Ʀr��
				if Luck == 1 then-----�ժk�} 20��
				play1x=DW_HateRemain(0)-----------------------�H����
				plays=DW_Rand(table.getn(play1x))
				---say(OwnerID(),"1")
				while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
					sleep(2)
				end	
				SetModeEx( OwnerID() , EM_SetModeType_Fight, false) ---�i���
				SetModeEx( OwnerID() , EM_SetModeType_Move, false) ---����	
				PlayMotion ( OwnerID(),ruFUSION_ACTORSTATE_SLEEP_BEGIN	 )---------------��1�|�ʧ@
				ScriptMessage( OwnerID(), -1 , 2 , "[SC_104224_01]" , 2 )---------------	����ڱڤH���L���ˮ`�a
				sleep(5)
				SetIdleMotion( OwnerID() ,ruFUSION_ACTORSTATE_SLEEP_LOOP	)-----------------------�����ʧ@
				CastSpellLV( OwnerID() ,play1x[plays] , 496022 , 4 )
				sleep(30)
				while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
					sleep(2)
				end					
				PlayMotion ( OwnerID(), ruFUSION_ACTORSTATE_SLEEP_END )---------------------�����ʧ@
				SetModeEx( OwnerID() , EM_SetModeType_Fight, true) ---�i���
				SetModeEx( OwnerID() , EM_SetModeType_Move, true) ---����
				sleep(50)
				elseif Luck == 2 then ---���k�}
				---say(OwnerID(),"2")
				play1x=DW_HateRemain(0)-----------------------�H����
				plays=DW_Rand(table.getn(play1x))
				ScriptMessage( OwnerID(), -1 , 2 , "[SC_104224_02]" , 2 )---------------�Ө����K������a
				sleep(20)
				searchplay= SearchRangePlayer ( play1x[plays] , 75 )----�d��75  ���ϰ��NPC
				searmuch=table.getn(searchplay)
				SetModeEx( OwnerID() , EM_SetModeType_Fight, false) ---�i���
				SetModeEx( OwnerID() , EM_SetModeType_Move, false) ---����	
				while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
					sleep(2)
				end	
				PlayMotion ( OwnerID(),ruFUSION_ACTORSTATE_SLEEP_BEGIN	 )---------------��1�|�ʧ@
				sleep(5)
				SetIdleMotion( OwnerID() ,ruFUSION_ACTORSTATE_SLEEP_LOOP	)----------------------�����ʧ@
				if searmuch == 1 then 
					CastSpellLV( OwnerID() , play1x[plays] , 496023, 100)
				elseif searmuch == 2 then
					CastSpellLV( OwnerID() , play1x[plays] , 496023, 50)
				elseif searmuch == 3 then
					CastSpellLV( OwnerID() , play1x[plays] , 496023, 25)
				elseif searmuch >= 4 then
					CastSpellLV( OwnerID() , play1x[plays] , 496023, 12)
				end	
				sleep(30)
				while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
					sleep(2)
				end			
				PlayMotion ( OwnerID(), ruFUSION_ACTORSTATE_SLEEP_END )---------------------�����ʧ@
				SetModeEx( OwnerID() , EM_SetModeType_Fight, true) ---�i���
				SetModeEx( OwnerID() , EM_SetModeType_Move, true) ---����
				elseif Luck == 3 then --���k�}
				play1x=DW_HateRemain(0)-----------------------�H����
				plays=DW_Rand(table.getn(play1x))			
				--say(OwnerID(),"4")
				while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
					sleep(2)
				end	
				SetModeEx( OwnerID() , EM_SetModeType_Fight, false) ---�i���
				SetModeEx( OwnerID() , EM_SetModeType_Move, false) ---����	
				PlayMotion ( OwnerID(),ruFUSION_ACTORSTATE_SLEEP_BEGIN	 )---------------��1�|�ʧ@
				ScriptMessage( OwnerID(), -1 , 2 , "[SC_104224_04]" , 2 )---------------�����F�Ш���a	
				sleep(5)
				SetIdleMotion( OwnerID() ,ruFUSION_ACTORSTATE_SLEEP_LOOP	)-----------------------�����ʧ@
				CastSpellLV( OwnerID() ,play1x[plays], 496025, 50 )
				sleep(30)
				while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
					sleep(2)
				end			
				PlayMotion ( OwnerID(), ruFUSION_ACTORSTATE_SLEEP_END )---------------------�����ʧ@
				SetModeEx( OwnerID() , EM_SetModeType_Fight, true) ---�i���
				SetModeEx( OwnerID() , EM_SetModeType_Move, true) ---����
				end
		    end
		end
	    if HPPercent <=0.60 then------��q�C��60% �γo�ޯ�
			time5=time5+1
			--time4=ReadRoleValue(OwnerID(),EM_RoleValue_register3)
			---say(OwnerID(),"time"..time5)
			if time5==13  then---�ªk�}--15��
				while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
					sleep(10)
				end
				play1x=DW_HateRemain(0)-----------------------�H����
				plays=DW_Rand(table.getn(play1x))
				SetModeEx( OwnerID() , EM_SetModeType_Fight, false) ---�i���
				SetModeEx( OwnerID() , EM_SetModeType_Move, false) ---����		
				PlayMotion ( OwnerID(),ruFUSION_ACTORSTATE_SLEEP_BEGIN	 )---------------��1�|�ʧ@
				ScriptMessage( OwnerID(), -1 , 2 , "[SC_104224_05]" , 2 )---------------�·t�O�q�X��	
				sleep(5)
				SetIdleMotion( OwnerID() ,ruFUSION_ACTORSTATE_SLEEP_LOOP	)-----------------------�����ʧ@
				CastSpellLV( OwnerID() , play1x[plays] , 496026 , 30)
				sleep(30)
				while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
					sleep(2)
				end			
				PlayMotion ( OwnerID(), ruFUSION_ACTORSTATE_SLEEP_END )---------------------�����ʧ@
				SetModeEx( OwnerID() , EM_SetModeType_Fight, true) ---�i���
				SetModeEx( OwnerID() , EM_SetModeType_Move, true) ---����
				sleep(20)
			elseif time5>=20 then------�j���a--30��
				while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
					sleep(2)
				end	
				ScriptMessage( OwnerID(), -1 , 2 , "[SC_104224_06]" , 2 )---------------�X�{�a~�ڱڳ̱j���i�h
				Luck2=DW_Rand(10)
				play1x=DW_HateRemain(0)-----------------------���Z
				plays=DW_Rand(table.getn(play1x))
				if CheckBuff( play1x[plays], 507530 ) == false then					
					CastSpellLV( OwnerID() , play1x[plays] , 496126, 2)
					sleep(10)
					mob3=CreateObjByFlag(104654,780730,Luck2,1)
					AddToPartition(mob3,RoomID)
					WriteRoleValue(mob3,EM_RoleValue_PID,boss)
					BeginPlot(mob3,"ic_104653_08",0)
					time5=0
				end		
			elseif time5==15 then------�ºx��--20��
				while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
					sleep(2)
				end	
				ScriptMessage( OwnerID(), -1 , 2 , "[SC_104224_07]" , 8 )---------------�Ө����������ɶ�?
				play1x=DW_HateRemain(0)-----------------------���Z
				plays=DW_Rand(table.getn(play1x))
				if CheckBuff( play1x[plays] , 507413 ) == false then 
					CastSpellLV( OwnerID() , play1x[plays] , 496020, 7 )
					WriteRoleValue(OwnerID(),EM_RoleValue_register3,0)
				end				
			end	
		end
	end
end 
function ic_104653_06()----�p��AI
local boss=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
local AttackTarget = ReadRoleValue( boss , EM_RoleValue_AttackTargetID )
SetAttack( ownerid() , AttackTarget) ----------------------------�X�ͪ������h�ݥؼЬO�֥h���o�@�U
	while true do
	---say(OwnerID(),"1")
	if hatelistcount(boss)==0 then   --�ˬd�����S���ؼ�
		DelObj(OwnerID())            --�S����ۤv����    
	end	
	sleep(10)
	CastSpellLV( OwnerID() ,OwnerID() , 496131, 1)
	sleep(300)
	end	
end

function ic_104653_07()----�R��BUFF��
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local TempPlayer = SetSearchAllPlayer(RoomID)----��ϰ�Ҧ����a
	local ThesePlayer = {}
	for i=1,TempPlayer do
		ThesePlayer[i] = GetSearchResult() -- ���Ȧs��
		if CheckID( ThesePlayer[i] ) == true and 
			ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and 
			ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then
				--�ˬd���a�O���O�٦b�F�ˬd�O�_���`
				if CheckBuff( ThesePlayer[i] , 507419 ) == true then
					CancelBuff(ThesePlayer[i], 507419)
					CancelBuff(ThesePlayer[i], 507534)	
					CancelBuff(ThesePlayer[i], 507530)
				elseif CheckBuff( ThesePlayer[i] , 507534 ) == true then
					CancelBuff(ThesePlayer[i], 507419)
					CancelBuff(ThesePlayer[i], 507534)	
					CancelBuff(ThesePlayer[i], 507530)
				elseif CheckBuff( ThesePlayer[i] , 507530 ) == true then
					CancelBuff(ThesePlayer[i], 507419)
					CancelBuff(ThesePlayer[i], 507534)	
					CancelBuff(ThesePlayer[i], 507530)	
				end
		end					
	end
end
function ic_104653_08()----���HAI
local boss=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	while true do
		if hatelistcount(boss)==0 then   --�ˬd�����S���ؼ�
			DelObj(OwnerID())            --�S����ۤv����    
		end
		sleep(10)
	end
end
--SC_104224_01--����ڱڤH���L���ˮ`�a
--SC_104224_02--�Ө����K������a
--SC_104224_03--�X�ӧa~�·t���P
--SC_104224_04--�����F�Ш���a
--SC_104224_05--�·t�O�q�X��
--SC_104224_06--�X�{�a~�ڱڳ̱j���i�h
--SC_104224_07--�Ө����������ɶ�?
--SC_104224_08--�s�Ӫ�~�O�����A�̶i�Ӫ�~�����a