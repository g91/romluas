-----------------------------------------------------------------------------------------------�H���������(�i�ƩZ)
function ic_HateRemain(TargetObj,Num)---TargetObj==�ؼ� Num= 0�H���� 1�ƩZ 2��1-2
	local mob=TargetObj
	local AllList = {}
	local AllListHate = {}
	local TempList = 0
	local TempValue = 0
--�v�@�ˬd�Ҧ�������m
	for i=0,HateListCount(mob)-1,1 do
		TempList = HateListInfo(OwnerID(),i,EM_HateListInfoType_GItemID)
--�P�ɰO����ID�������
		AllList[table.getn(AllList)+1] = TempList
		AllListHate[table.getn(AllListHate)+1] = HateListInfo(mob,i,EM_HateListInfoType_HatePoint)
	end
	if	Num == 0 then
		return AllList
	end
--��������ƦW�e�X�����a
	for j=1,Num,1 do
		TempList = 0
		TempValue = 0
		for i = 1,table.getn(AllListHate),1 do
			if	AllListHate[i] > TempList	then
				TempValue = i
				TempList = AllListHate[i]
			end
		end
		table.remove(AllList,TempValue)
		table.remove(AllListHate,TempValue)
	end
--�^�ǳѤU�����a�W��
	return AllList
end
function ic_RandKK(TargetObj,play123) --TargetObj==�ؼ� play123= 0�H���� 1�ƩZ 2��1-2
	local mob=TargetObj
	local kk123=play123
	local play1x={} 
	local plays=0
	if hatelistcount(mob)==1 then
		play1x=ic_HateRemain(mob,0)	
		plays=DW_Rand(table.getn(play1x))
		return play1x[plays]
	elseif hatelistcount(mob)>1 then
		play1x=ic_HateRemain(mob,kk123)
		plays=DW_Rand(table.getn(play1x))
		return play1x[plays]
	end
end
-----------------------------------------------------------------------------------------------����+�H��+�ۤv 6��1(�����a��)
function ic_All_mob_KK123(TargetObj,kk123,play1kk,skill_1,skill_1_lv,sleep1,skill_2,skill_2_lv,sleep2)
---TargetObj=���ֱo����� 
---kk123=�Ҧ� 1=����ޯ� 2=�H���ؼ� 3=���ۤv 2��1 4=����P�H���ؼ� 5=����+���ۤv 2��1 6=�H����+���ۤv  2��1
---play1kk=0���Z 1�ƩZ
---kk123=1	skill_1=����  
---kk123=2	skill_1=�H��  
---kk123=3	skill_1=���ۤv  
---kk123=4	skill_1=���� 	skill_2=�H��  
---kk123=5	skill_1=����	skill_2=���ۤv 
---kk123=6	skill_1=�H�� 	skill_2=���ۤv
local mob=TargetObj
local mob1=OwnerID()
local mobkk=kk123
local Luck=0	
local play1x={} 
local plays=0
local play123
local AttackTarget = ReadRoleValue(mob, EM_RoleValue_AttackTargetID )
	if 	mobkk==1 then		---����
		CastSpellLV( mob1, AttackTarget, skill_1, skill_1_lv )
		sleep(sleep1)	
	elseif mobkk==2 then	---�H��
		play123=ic_RandKK(mob,play1kk)
		CastSpellLV( mob1,play123, skill_1, skill_1_lv )	
		sleep(sleep1)
	elseif	mobkk==3 then 	---���ۤv
		CastSpellLV( mob1, mob1, skill_1, skill_1_lv )
		sleep(sleep1)
	elseif 	mobkk==4 then	---���� or �H��
		Luck=DW_Rand(2)
		if Luck==1 then		---����
			CastSpellLV( mob1, AttackTarget, skill_1, skill_1_lv )
			sleep(sleep1)	
		elseif Luck==2 then	---�H��
			play123=ic_RandKK(mob,play1kk)
			CastSpellLV( mob1,play123, skill_2, skill_2_lv )
			sleep(sleep2)				
		end		
	elseif 	mobkk==5 then	---���� or ���ۤv
		Luck=DW_Rand(2)
		if Luck==1 then		--����
			CastSpellLV( mob1, AttackTarget, skill_1, skill_1_lv )
			sleep(sleep1)	
		elseif Luck==2 then	---���ۤv
			CastSpellLV( mob1, mob1, skill_2, skill_2_lv )
				sleep(sleep2)
		end	
	elseif 	mobkk==6 then	---�H�� or ���ۤv
		Luck=DW_Rand(2)
		if Luck==1 then		---�H��
			play123=ic_RandKK(mob,play1kk)
			CastSpellLV( mob1,play123, skill_1, skill_1_lv )	
			sleep(sleep2)
		elseif Luck==2 then	---���ۤv
			CastSpellLV( mob1, mob1, skill_2, skill_2_lv )
			sleep(sleep1)	
		end	
	end
end
-----------------------------------------------------------------------------------------------²��AI(�����O+���ۤv)1�ޯ�
function ic_All_mob_KKplay_1(SKILL1,SKILL1_LV,sleep1,time1_1,KK1,NOK11)
---SKILL1=���X���X,SKILL1_LV=����,sleep1=����,time1_1=���,KK1=1���Z2�H��3���ۤv,NOK11=1�ƩZ0���ƩZ
local mob=OwnerID()						
local time1=0	
	while true do
		if hatelistcount(mob)==0 then
			time1=0
		elseif hatelistcount(mob)~=0 then
			time1=time1+1
			if time1>=time1_1 then
				ic_magic_ing(mob,5)
				ic_All_mob_KK123(mob,KK1,NOK11,SKILL1,SKILL1_LV,sleep1,0,0,0)
				time1=0	
			end
		end
		sleep(10)
	end	
end
-----------------------------------------------------------------------------------------------²��AI(�����O+���ۤv)2�ޯ�
function ic_All_mob_KKplay_2(SKILL1,SKILL1_LV,sleep1,time1_1,KK1,NOK11,
						     SKILL2,SKILL2_LV,sleep2,time2_1,KK2,NOK21)
---SKILL1=���X���X,SKILL1_LV=����,sleep1=����,time1_1=���,KK1=1���Z2�H��3���ۤv,NOK11=1�ƩZ0���ƩZ 
local mob=OwnerID()						
local time1=0
local time2=0	
	while true do
		if hatelistcount(mob)==0 then
			time1=0
			time2=0
		elseif hatelistcount(mob)~=0 then
			time1=time1+1
			time2=time2+1
			if time2>=time2_1 then
				ic_magic_ing(mob,5)
				ic_All_mob_KK123(mob,KK2,NOK21,SKILL2,SKILL2_LV,sleep2,0,0,0)
				time2=0
			end
			if time1>=time1_1 then
				ic_magic_ing(mob,5)
				ic_All_mob_KK123(mob,KK1,NOK11,SKILL1,SKILL1_LV,sleep1,0,0,0)
				time1=0
			end
		end
		sleep(10)
	end	
end
-----------------------------------------------------------------------------------------------²��AI(�����O+���ۤv)3�ޯ�
function ic_All_mob_KKplay_3(SKILL1,SKILL1_LV,sleep1,time1_1,KK1,NOK11,
						     SKILL2,SKILL2_LV,sleep2,time2_1,KK2,NOK21,
						     SKILL3,SKILL3_LV,sleep3,time3_1,KK3,NOK31)
---SKILL1=���X���X,SKILL1_LV=����,sleep1=����,time1_1=���,KK1=1���Z2�H��3���ۤv,NOK11=1�ƩZ0���ƩZ
local mob=OwnerID()						
local time1=0
local time2=0
local time3=0
	while true do
		if hatelistcount(mob)==0 then
			time1=0
			time2=0
			time3=0
		elseif hatelistcount(mob)~=0 then
			time1=time1+1
			time2=time2+1
			time3=time3+1
			if time3>=time3_1 then	
				ic_magic_ing(mob,5)
				ic_All_mob_KK123(mob,KK3,NOK31,SKILL3,SKILL3_LV,sleep3,0,0,0)
				time3=0
			end
			if time2>=time2_1 then
				ic_magic_ing(mob,5)
				ic_All_mob_KK123(mob,KK2,NOK21,SKILL2,SKILL2_LV,sleep2,0,0,0)
				time2=0	
			end
			if time1>=time1_1 then
				ic_magic_ing(mob,5)
				ic_All_mob_KK123(mob,KK1,NOK11,SKILL1,SKILL1_LV,sleep1,0,0,0)
				time1=0
			end			
		end
		sleep(10)
	end	
end
-----------------------------------------------------------------------------------------------²��AI(�����O+���ۤv)4�ޯ�
function ic_All_mob_KKplay_4(SKILL1,SKILL1_LV,sleep1,time1_1,KK1,NOK11,
							 SKILL2,SKILL2_LV,sleep2,time2_1,KK2,NOK21,
						     SKILL3,SKILL3_LV,sleep3,time3_1,KK3,NOK31,
						     SKILL4,SKILL4_LV,sleep4,time4_1,KK4,NOK41)
---SKILL1=���X���X,SKILL1_LV=����,sleep1=����,time1_1=���,KK1=1���Z2�H��3���ۤv,NOK11=1�ƩZ0���ƩZ
local mob=OwnerID()						
local time1=0
local time2=0
local time3=0
local time4=0
	while true do
		if hatelistcount(mob)==0 then
			time1=0
			time2=0
			time3=0
			time4=0
		elseif hatelistcount(mob)~=0 then
			time1=time1+1
			time2=time2+1
			time3=time3+1
			time4=time4+1
			if time4>=time4_1 then	
				ic_magic_ing(mob,5)
				ic_All_mob_KK123(mob,KK4,NOK41,SKILL4,SKILL4_LV,sleep4,0,0,0)
				time4=0	
			end
			if time3>=time3_1 then
				ic_magic_ing(mob,5)
				ic_All_mob_KK123(mob,KK3,NOK31,SKILL3,SKILL3_LV,sleep3,0,0,0)
				time3=0	
			end	
			if time2>=time2_1 then
				ic_magic_ing(mob,5)
				ic_All_mob_KK123(mob,KK2,NOK21,SKILL2,SKILL2_LV,sleep2,0,0,0)
				time2=0	
			end
			if time1>=time1_1 then
				ic_magic_ing(mob,5)
				ic_All_mob_KK123(mob,KK1,NOK11,SKILL1,SKILL1_LV,sleep1,0,0,0)
				time1=0
			end
		end
		sleep(10)
	end	
end	
-----------------------------------------------------------------------------------------------²��AI(�����O+���ۤv)5�ޯ�
function ic_All_mob_KKplay_5(SKILL1,SKILL1_LV,sleep1,time1_1,KK1,NOK11,
							 SKILL2,SKILL2_LV,sleep2,time2_1,KK2,NOK21,
						     SKILL3,SKILL3_LV,sleep3,time3_1,KK3,NOK31,
						     SKILL4,SKILL4_LV,sleep4,time4_1,KK4,NOK41,
						     SKILL5,SKILL5_LV,sleep5,time5_1,KK5,NOK51)
---SKILL1=���X���X,SKILL1_LV=����,sleep1=����,time1_1=���,KK1=1���Z2�H��3���ۤv,NOK11=1�ƩZ0���ƩZ
local mob=OwnerID()						
local time1=0
local time1KK=KK1
local time2=0
local time2KK=KK2
local time3=0
local time3KK=KK3
local time4=0
local time4KK=KK4
local time5=0
local time5KK=KK5
local play123
local AttackTarget 
	while true do
		if hatelistcount(mob)==0 then
			time1=0
			time2=0
			time3=0
			time4=0
			time5=0
		elseif hatelistcount(mob)~=0 then
			time1=time1+1
			time2=time2+1
			time3=time3+1
			time4=time4+1
			time5=time5+1
			if time5>=time5_1 then
				ic_magic_ing(mob,5)
				ic_All_mob_KK123(mob,KK5,NOK51,SKILL5,SKILL5_LV,sleep5,0,0,0)
				time5=0
			end
			if time4>=time4_1 then
				ic_magic_ing(mob,5)
				ic_All_mob_KK123(mob,KK4,NOK41,SKILL4,SKILL4_LV,sleep4,0,0,0)
				time4=0	
			end
			if time3>=time3_1 then
				ic_magic_ing(mob,5)
				ic_All_mob_KK123(mob,KK3,NOK31,SKILL3,SKILL3_LV,sleep3,0,0,0)
				time3=0	
			end	
			if time2>=time2_1 then
				ic_magic_ing(mob,5)
				ic_All_mob_KK123(mob,KK2,NOK21,SKILL2,SKILL2_LV,sleep2,0,0,0)
				time2=0		
			end
			if time1>=time1_1 then
				ic_magic_ing(mob,5)
				ic_All_mob_KK123(mob,KK1,NOK11,SKILL1,SKILL1_LV,sleep1,0,0,0)
				time1=0
			end
		end
		sleep(10)
	end	
end
-----------------------------------------------------------------------------------------------²��AI(�����O+���ۤv)(�t��q)
function ic_All_mob_KKplay_HP(HP01,HP1,
							   SKILL1,SKILL1_LV,sleep1,time1_1,KK1,NOK11,
							   SKILL2,SKILL2_LV,sleep2,time2_1,KK2,NOK21,
							   SKILL3,SKILL3_LV,sleep3,time3_1,KK3,NOK31,
							   SKILL4,SKILL4_LV,sleep4,time4_1,KK4,NOK41,
							   SKILL5,SKILL5_LV,sleep5,time5_1,KK5,NOK51)
---(HP01(1�|�Ψ�4-5)(0�u�η|1-3),HP1=1-0.1 0�u��4�� >HP1=SKILL4 <HP1=SKILL5,
---SKILL1=���X���X,SKILL1_LV=����,sleep1=����,time1_1=���,KK1=1���Z2�H��3���ۤv,NOK11=1�ƩZ0���ƩZ
local mob=OwnerID()							
local HPPercent 
local time1=0
local time2=0
local time3=0
local time4=0
local time5=0
local time6=0
	while true do
		if hatelistcount(mob)==0 then
			time1=0
			time2=0
			time3=0
			time4=0
			time5=0
		elseif hatelistcount(mob)~=0 then
			time1=time1+1
			time2=time2+1
			time3=time3+1
			if HP01==1 then      					 		
				HPPercent = ic_HP_Max_Now(mob)
				time4=time4+1
				time5=time5+1
				if  HPPercent<=HP1 then 
					if time5>=time5_1 then
						ic_magic_ing(mob,5)
						ic_All_mob_KK123(mob,KK5,NOK51,SKILL5,SKILL5_LV,sleep5,0,0,0)
						time5=0
					end
				end	
				if  HPPercent>HP1 then
					if time4>=time4_1 then
						ic_magic_ing(mob,5)
						ic_All_mob_KK123(mob,KK4,NOK41,SKILL4,SKILL4_LV,sleep4,0,0,0)
						time4=0	
					end
				end	
			elseif	HP01==0 or HP01==1 then 
				if time3>=time3_1 then
					ic_magic_ing(mob,5)
					ic_All_mob_KK123(mob,KK3,NOK31,SKILL3,SKILL3_LV,sleep3,0,0,0)
					time3=0
				end
				if time2>=time2_1 then
					ic_magic_ing(mob,5)
					ic_All_mob_KK123(mob,KK2,NOK21,SKILL2,SKILL2_LV,sleep2,0,0,0)
					time2=0
				end
				if time1>=time1_1 then
					ic_magic_ing(mob,5)
					ic_All_mob_KK123(mob,KK1,NOK11,SKILL1,SKILL1_LV,sleep1,0,0,0)
					time1=0
				end
			end	
		end
		sleep(10)
	end	
end
-----------------------------------------------------------------------------------------------���w��1-6�H��(�t�Ω�ޯ�)
function ic_playkk_Rand_1_6(TargetObj,play1_6_Rand,play1kkOX,skill,skill_lv)   
				---TargetObj=Ū�ֱo����� play1_6=�X�H�w�W�H��  play1kk=1�ƩZ 0���Z skill=�ޯู�X skill_lv=�ޯ൥��
	local mob=TargetObj
	local mob1=OwnerID()
	local bosskkpaly = {}
	local playKKboss
	local play123
	local play1234
	local play1_6=play1_6_Rand
	local play1kk=play1kkOX
	local mobkk1
	local mobkk2
	local mobkk3
	local mobkk4
	local mobkk5
	local mobkk6
	local play1
	local play2
	local play3
	local play4
	local play5
	local play6
	playKKboss=hatelistcount(mob)
	if playKKboss>=1 and play1_6 == 1 or 
	   playKKboss==1 and play1_6 == 2 or 
	   playKKboss==1 and play1_6 == 3 or 
	   playKKboss==1 and play1_6 == 4 or 
	   playKKboss==1 and play1_6 == 5 or 
	   playKKboss==1 and play1_6 == 6 then					---�W�L1�H�H��
		play123=playKKboss-1
		if play1kk==1 or play1kk==0 and play123==0 then 	---�ƩZ
			Luck=DW_Rand(play123)
			play1=Luck+1
		elseif play1kk==0 and play123~=0  then				---���ƩZ
			Luck=DW_Rand(playKKboss)
			play1=Luck
		end	
		bosskkpaly = ic_HateListSort(mob)
			mobkk1=bosskkpaly[play1]
	elseif playKKboss>=2 and play1_6 == 2 or 
		   playKKboss==2 and play1_6 == 3 or 
		   playKKboss==2 and play1_6 == 4 or 
		   playKKboss==2 and play1_6 == 5 or 
		   playKKboss==2 and play1_6 == 6 then				---�W�L2�H�H��	
		play123=playKKboss-2
		if play1kk==1 or play1kk==0 and play123==0  then 	---�ƩZ
			Luck=DW_Rand(play123)
			play1=Luck+1
			play2=Luck+2
		elseif play1kk==0 and play123~=0  then				---���ƩZ
		play1234=playKKboss-1	
			Luck=DW_Rand(play1234)
			play1=Luck
			play2=Luck+1
		end	
		bosskkpaly = ic_HateListSort(mob)
			mobkk1=bosskkpaly[play1]
			mobkk2=bosskkpaly[play2]	
	elseif playKKboss>=3 and play1_6 == 3 or 
		   playKKboss==3 and play1_6 == 4 or 
		   playKKboss==3 and play1_6 == 5 or 
		   playKKboss==3 and play1_6 == 6 then				---�W�L3�H�H��
		play123=playKKboss-3
		if play1kk==1 or play1kk==0 and play123==0  then 	---�ƩZ
			Luck=DW_Rand(play123)
			play1=Luck+1
			play2=Luck+2
			play3=Luck+3
		elseif play1kk==0 and play123~=0  then				---���ƩZ
		play1234=playKKboss-2
			Luck=DW_Rand(play1234)
			play1=Luck
			play2=Luck+1
			play3=Luck+2
		end	
		bosskkpaly = ic_HateListSort(mob)
			mobkk1=bosskkpaly[play1]
			mobkk2=bosskkpaly[play2]
			mobkk3=bosskkpaly[play3]
	elseif playKKboss>=4 and play1_6 == 4 or 
		   playKKboss==4 and play1_6 == 5 or 	
		   playKKboss==4 and play1_6 == 6 then				---�W�L4�H�H��
		play123=playKKboss-4
		if play1kk==1 or play1kk==0 and play123==0  then 	---�ƩZ
			Luck=DW_Rand(play123)
			play1=Luck+1
			play2=Luck+2
			play3=Luck+3
			play4=Luck+4
		elseif play1kk==0 and play123~=0  then				---���ƩZ
		play1234=playKKboss-3
			Luck=DW_Rand(play1234)
			play1=Luck
			play2=Luck+1
			play3=Luck+2
			play4=Luck+3
		end	
		bosskkpaly = ic_HateListSort(mob)
			mobkk1=bosskkpaly[play1]
			mobkk2=bosskkpaly[play2]
			mobkk3=bosskkpaly[play3]
			mobkk4=bosskkpaly[play4]
	elseif playKKboss>=5 and play1_6 == 5 or 
		   playKKboss==5 and play1_6 == 6 then				---�W�L5�H�H��
		play123=playKKboss-5
		if play1kk==1 or play1kk==0 and play123==0  then 	---�ƩZ
			Luck=DW_Rand(play123)
			play1=Luck+1
			play2=Luck+2
			play3=Luck+3
			play4=Luck+4
			play5=Luck+5
		elseif play1kk==0 and play123~=0  then				---���ƩZ
		play1234=playKKboss-4
			Luck=DW_Rand(play1234)
			play1=Luck
			play2=Luck+1
			play3=Luck+2
			play4=Luck+3
			play5=Luck+4
		end	
		bosskkpaly = ic_HateListSort(mob)
			mobkk1=bosskkpaly[play1]
			mobkk2=bosskkpaly[play2]
			mobkk3=bosskkpaly[play3]
			mobkk4=bosskkpaly[play4]
			mobkk5=bosskkpaly[play5]
	elseif playKKboss>=6 and play1_6 == 6  then				---�W�L6�H�H��
		play123=playKKboss-6
		if play1kk==1 or play1kk==0 and play123==0  then 	---�ƩZ
			Luck=DW_Rand(play123)
			play1=Luck+1
			play2=Luck+2
			play3=Luck+3
			play4=Luck+4
			play5=Luck+5
			play6=Luck+6
		elseif play1kk==0 and play123~=0  then				---���ƩZ
		play1234=playKKboss-5
			Luck=DW_Rand(play1234)
			play1=Luck
			play2=Luck+1
			play3=Luck+2
			play4=Luck+3
			play5=Luck+4
			play6=Luck+5
		end	
		bosskkpaly = ic_HateListSort(mob)
			mobkk1=bosskkpaly[play1]
			mobkk2=bosskkpaly[play2]
			mobkk3=bosskkpaly[play3]
			mobkk4=bosskkpaly[play4]
			mobkk5=bosskkpaly[play5]
			mobkk6=bosskkpaly[play6]
	end
	if 	   play1_6==1 and playKKboss>=1 or 
		   play1_6==2 and playKKboss==1 or 
		   play1_6==3 and playKKboss==1 or 
		   play1_6==4 and playKKboss==1 or 
		   play1_6==5 and playKKboss==1 or 
		   play1_6==6 and playKKboss==1 then	
		sysCastSpellLV( mob1, mobkk1, skill, skill_lv )
	elseif play1_6==2 and playKKboss>=2 or 
		   play1_6==3 and playKKboss==2 or 
	       play1_6==4 and playKKboss==2 or 
		   play1_6==5 and playKKboss==2 or 
		   play1_6==6 and playKKboss==2 then
		sysCastSpellLV( mob1, mobkk1, skill, skill_lv )
		sysCastSpellLV( mob1, mobkk2, skill, skill_lv )
	elseif play1_6==3 and playKKboss>=3 or 
	       play1_6==4 and playKKboss==3 or 
		   play1_6==5 and playKKboss==3 or 
		   play1_6==6 and playKKboss==3 then
		sysCastSpellLV( mob1, mobkk1, skill, skill_lv )
		sysCastSpellLV( mob1, mobkk2, skill, skill_lv )
		sysCastSpellLV( mob1, mobkk3, skill, skill_lv )
	elseif play1_6==4 and playKKboss>=4 or 
		   play1_6==5 and playKKboss==4 or 
		   play1_6==6 and playKKboss==4 then
		sysCastSpellLV( mob1, mobkk1, skill, skill_lv )
		sysCastSpellLV( mob1, mobkk2, skill, skill_lv )
		sysCastSpellLV( mob1, mobkk3, skill, skill_lv )
		sysCastSpellLV( mob1, mobkk4, skill, skill_lv )
	elseif play1_6==5 and playKKboss>=5 or 
		   play1_6==6 and playKKboss==5 then
		sysCastSpellLV( mob1, mobkk1, skill, skill_lv )
		sysCastSpellLV( mob1, mobkk2, skill, skill_lv )
		sysCastSpellLV( mob1, mobkk3, skill, skill_lv )
		sysCastSpellLV( mob1, mobkk4, skill, skill_lv )
		sysCastSpellLV( mob1, mobkk5, skill, skill_lv )
	elseif play1_6==6 or playKKboss>=6 then
		sysCastSpellLV( mob1, mobkk1, skill, skill_lv )
		sysCastSpellLV( mob1, mobkk2, skill, skill_lv )
		sysCastSpellLV( mob1, mobkk3, skill, skill_lv )
		sysCastSpellLV( mob1, mobkk4, skill, skill_lv )
		sysCastSpellLV( mob1, mobkk5, skill, skill_lv )
		sysCastSpellLV( mob1, mobkk6, skill, skill_lv )
	end
end
-----------------------------------------------------------------------------------------------���w1-6�H�}�U�ͳz���y
function ic_playkk_mob_1_6(TargetObj,play1_6_Rand,play1kkOX,ObjDBID)   
				---TargetObj=Ū�ֱo����� play1_6=�X�H�w�W�H��  play1kk=1�ƩZ 0���Z ObjDBID=���󸹽X
	local mob=TargetObj
	local RoomID=ReadRoleValue(mob,EM_RoleValue_RoomID)
	local bosskkpaly = {}
	local playKKboss
	local play123
	local play1234
	local play1_6=play1_6_Rand
	local play1kk=play1kkOX
	local mobkk1
	local mobkk2
	local mobkk3
	local mobkk4
	local mobkk5
	local mobkk6
	local play1
	local play2
	local play3
	local play4
	local play5
	local play6
	local mob1
	local mob2
	local mob3
	local mob4
	local mob5
	local mob6
	playKKboss=hatelistcount(mob)
	if playKKboss>=1 and play1_6 == 1 or 
	   playKKboss==1 and play1_6 == 2 or 
	   playKKboss==1 and play1_6 == 3 or 
	   playKKboss==1 and play1_6 == 4 or 
	   playKKboss==1 and play1_6 == 5 or 
	   playKKboss==1 and play1_6 == 6 then					---�W�L1�H�H��
		play123=playKKboss-1
		if play1kk==1 or play1kk==0 and play123==0 then 	---�ƩZ
			Luck=DW_Rand(play123)
			play1=Luck+1
		elseif play1kk==0 and play123~=0  then				---���ƩZ
			Luck=DW_Rand(playKKboss)
			play1=Luck
		end	
		bosskkpaly = ic_HateListSort(mob)
			mobkk1=bosskkpaly[play1]
	elseif playKKboss>=2 and play1_6 == 2 or 
		   playKKboss==2 and play1_6 == 3 or 
		   playKKboss==2 and play1_6 == 4 or 
		   playKKboss==2 and play1_6 == 5 or 
		   playKKboss==2 and play1_6 == 6 then				---�W�L2�H�H��	
		play123=playKKboss-2
		if play1kk==1 or play1kk==0 and play123==0  then 	---�ƩZ
			Luck=DW_Rand(play123)
			play1=Luck+1
			play2=Luck+2
		elseif play1kk==0 and play123~=0  then				---���ƩZ
		play1234=playKKboss-1	
			Luck=DW_Rand(play1234)
			play1=Luck
			play2=Luck+1
		end	
		bosskkpaly = ic_HateListSort(mob)
			mobkk1=bosskkpaly[play1]
			mobkk2=bosskkpaly[play2]	
	elseif playKKboss>=3 and play1_6 == 3 or 
		   playKKboss==3 and play1_6 == 4 or 
		   playKKboss==3 and play1_6 == 5 or 
		   playKKboss==3 and play1_6 == 6 then				---�W�L3�H�H��
		play123=playKKboss-3
		if play1kk==1 or play1kk==0 and play123==0  then 	---�ƩZ
			Luck=DW_Rand(play123)
			play1=Luck+1
			play2=Luck+2
			play3=Luck+3
		elseif play1kk==0 and play123~=0  then				---���ƩZ
		play1234=playKKboss-2
			Luck=DW_Rand(play1234)
			play1=Luck
			play2=Luck+1
			play3=Luck+2
		end	
		bosskkpaly = ic_HateListSort(mob)
			mobkk1=bosskkpaly[play1]
			mobkk2=bosskkpaly[play2]
			mobkk3=bosskkpaly[play3]
	elseif playKKboss>=4 and play1_6 == 4 or 
		   playKKboss==4 and play1_6 == 5 or 	
		   playKKboss==4 and play1_6 == 6 then				---�W�L4�H�H��
		play123=playKKboss-4
		if play1kk==1 or play1kk==0 and play123==0  then 	---�ƩZ
			Luck=DW_Rand(play123)
			play1=Luck+1
			play2=Luck+2
			play3=Luck+3
			play4=Luck+4
		elseif play1kk==0 and play123~=0  then				---���ƩZ
		play1234=playKKboss-3
			Luck=DW_Rand(play1234)
			play1=Luck
			play2=Luck+1
			play3=Luck+2
			play4=Luck+3
		end	
		bosskkpaly = ic_HateListSort(mob)
			mobkk1=bosskkpaly[play1]
			mobkk2=bosskkpaly[play2]
			mobkk3=bosskkpaly[play3]
			mobkk4=bosskkpaly[play4]
	elseif playKKboss>=5 and play1_6 == 5 or 
		   playKKboss==5 and play1_6 == 6 then				---�W�L5�H�H��
		play123=playKKboss-5
		if play1kk==1 or play1kk==0 and play123==0  then 	---�ƩZ
			Luck=DW_Rand(play123)
			play1=Luck+1
			play2=Luck+2
			play3=Luck+3
			play4=Luck+4
			play5=Luck+5
		elseif play1kk==0 and play123~=0  then				---���ƩZ
		play1234=playKKboss-4
			Luck=DW_Rand(play1234)
			play1=Luck
			play2=Luck+1
			play3=Luck+2
			play4=Luck+3
			play5=Luck+4
		end	
		bosskkpaly = ic_HateListSort(mob)
			mobkk1=bosskkpaly[play1]
			mobkk2=bosskkpaly[play2]
			mobkk3=bosskkpaly[play3]
			mobkk4=bosskkpaly[play4]
			mobkk5=bosskkpaly[play5]
	elseif playKKboss>=6 and play1_6 == 6  then				---�W�L6�H�H��
		play123=playKKboss-6
		if play1kk==1 or play1kk==0 and play123==0  then 	---�ƩZ
			Luck=DW_Rand(play123)
			play1=Luck+1
			play2=Luck+2
			play3=Luck+3
			play4=Luck+4
			play5=Luck+5
			play6=Luck+6
		elseif play1kk==0 and play123~=0  then				---���ƩZ
		play1234=playKKboss-5
			Luck=DW_Rand(play1234)
			play1=Luck
			play2=Luck+1
			play3=Luck+2
			play4=Luck+3
			play5=Luck+4
			play6=Luck+5
		end	
		bosskkpaly = ic_HateListSort(mob)
			mobkk1=bosskkpaly[play1]
			mobkk2=bosskkpaly[play2]
			mobkk3=bosskkpaly[play3]
			mobkk4=bosskkpaly[play4]
			mobkk5=bosskkpaly[play5]
			mobkk6=bosskkpaly[play6]
	end
	if 	   play1_6==1 and playKKboss>=1 or 
		   play1_6==2 and playKKboss==1 or 
		   play1_6==3 and playKKboss==1 or 
		   play1_6==4 and playKKboss==1 or 
		   play1_6==5 and playKKboss==1 or 
		   play1_6==6 and playKKboss==1 then
		mob1=ic_mob_Rand_noadd( mobkk1 , ObjDBID ,0,0)
		ic_All_nolook_00(mob1)	
		AddToPartition(mob1,RoomID)
	elseif play1_6==2 and playKKboss>=2 or 
		   play1_6==3 and playKKboss==2 or 
	       play1_6==4 and playKKboss==2 or 
		   play1_6==5 and playKKboss==2 or 
		   play1_6==6 and playKKboss==2 then
		mob1=ic_mob_Rand_noadd( mobkk1 , ObjDBID ,0,0)
		ic_All_nolook_00(mob1)	
		AddToPartition(mob1,RoomID)
		mob2=ic_mob_Rand_noadd( mobkk2 , ObjDBID ,0,0)
		ic_All_nolook_00(mob2)
		AddToPartition(mob2,RoomID)
	elseif play1_6==3 and playKKboss>=3 or 
	       play1_6==4 and playKKboss==3 or 
		   play1_6==5 and playKKboss==3 or 
		   play1_6==6 and playKKboss==3 then
		mob1=ic_mob_Rand_noadd( mobkk1 , ObjDBID ,0,0)
		ic_All_nolook_00(mob1)
		AddToPartition(mob1,RoomID)
		mob2=ic_mob_Rand_noadd( mobkk2 , ObjDBID ,0,0)
		ic_All_nolook_00(mob2)
		AddToPartition(mob2,RoomID)
		mob3=ic_mob_Rand_noadd( mobkk3 , ObjDBID ,0,0)
		ic_All_nolook_00(mob3)
		AddToPartition(mob3,RoomID)
	elseif play1_6==4 and playKKboss>=4 or 
		   play1_6==5 and playKKboss==4 or 
		   play1_6==6 and playKKboss==4 then
		mob1=ic_mob_Rand_noadd( mobkk1 , ObjDBID ,0,0)
		ic_All_nolook_00(mob1)
		AddToPartition(mob1,RoomID)
		mob2=ic_mob_Rand_noadd( mobkk2 , ObjDBID ,0,0)
		ic_All_nolook_00(mob2)
		AddToPartition(mob2,RoomID)
		mob3=ic_mob_Rand_noadd( mobkk3 , ObjDBID ,0,0)
		ic_All_nolook_00(mob3)
		AddToPartition(mob3,RoomID)
		mob4=ic_mob_Rand_noadd( mobkk4 , ObjDBID ,0,0)
		ic_All_nolook_00(mob4)
		AddToPartition(mob4,RoomID)
	elseif play1_6==5 and playKKboss>=5 or 
		   play1_6==6 and playKKboss==5 then
		mob1=ic_mob_Rand_noadd( mobkk1 , ObjDBID ,0,0)
		ic_All_nolook_00(mob1)
		AddToPartition(mob1,RoomID)
		mob2=ic_mob_Rand_noadd( mobkk2 , ObjDBID ,0,0)
		ic_All_nolook_00(mob2)
		AddToPartition(mob2,RoomID)
		mob3=ic_mob_Rand_noadd( mobkk3 , ObjDBID ,0,0)
		ic_All_nolook_00(mob3)
		AddToPartition(mob3,RoomID)
		mob4=ic_mob_Rand_noadd( mobkk4 , ObjDBID ,0,0)
		ic_All_nolook_00(mob4)
		AddToPartition(mob4,RoomID)
		mob5=ic_mob_Rand_noadd( mobkk5 , ObjDBID ,0,0)
		ic_All_nolook_00(mob5)
		AddToPartition(mob5,RoomID)
	elseif play1_6==6 or playKKboss>=6 then
		mob1=ic_mob_Rand_noadd( mobkk1 , ObjDBID ,0,0)
		ic_All_nolook_00(mob1)
		AddToPartition(mob1,RoomID)
		mob2=ic_mob_Rand_noadd( mobkk2 , ObjDBID ,0,0)
		ic_All_nolook_00(mob2)
		AddToPartition(mob2,RoomID)
		mob3=ic_mob_Rand_noadd( mobkk3 , ObjDBID ,0,0)
		ic_All_nolook_00(mob3)
		AddToPartition(mob3,RoomID)
		mob4=ic_mob_Rand_noadd( mobkk4 , ObjDBID ,0,0)
		ic_All_nolook_00(mob4)
		AddToPartition(mob4,RoomID)
		mob5=ic_mob_Rand_noadd( mobkk5 , ObjDBID ,0,0)
		ic_All_nolook_00(mob5)
		AddToPartition(mob5,RoomID)
		mob6=ic_mob_Rand_noadd( mobkk6 , ObjDBID ,0,0)
		ic_All_nolook_00(mob6)
		AddToPartition(mob6,RoomID)
	end
end
-----------------------------------------------------------------------------------------------�Ͳy+LUA
function ic_playkk_mob_1_6_LUA(TargetObj,play1_6_Rand,play1kkOX,ObjDBID,LUA)
	--TargetObj=Ū�ֱo����� play1_6=�X�H�w�W�H��  play1kk=1�ƩZ 0���Z ObjDBID=���󸹽X LUA="LUA"
	if TargetObj == nil then
		return
	end
	local mob=TargetObj
	local RoomID=ReadRoleValue(mob,EM_RoleValue_RoomID)
	ic_playkk_mob_1_6(mob,play1_6_Rand,play1kkOX,ObjDBID)
	local NPCXX = SetSearchAllNPC(RoomID )
	for i = 0 , NPCXX do
		local ID=GetSearchResult()
		local ID2=ReadRoleValue(ID,EM_RoleValue_OrgID) 
		if ID2==ObjDBID then
			BeginPlot(ID,LUA, 0)
		end
	end
end