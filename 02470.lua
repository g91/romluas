function ic_106021_02()   																	 ---��AI(��10�T�w�g�ɥ�)
	local isaac=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local Boss=OwnerID()
	local RoomID=ReadRoleValue(Boss,EM_RoleValue_RoomID)
	local play44=0																			 ---�g�z��
	local killidtime=0								 										 ---�g�ɥ�
	local MaxHP = ReadRoleValue( Boss , EM_RoleValue_MaxHP )							 ---Ū����q
	local NowHP = ReadRoleValue( Boss , EM_RoleValue_HP )     						 ---Ū���ثe��q
	local HPPercent = NowHP / MaxHP	
	local play1x={} 									 									 ---�H������
	local plays=0   									 									 ---�H������
	local Luck=0										 									 ---�H�����
	local time1=0
	local time2=0
	local time3=0
	local time4=0
	local time5=0
	local time6=0
	local time7=0
	local time8=0
	local yy =0
	local xx=0
	local ZZ=0
	local bosskkpaly = {}
	local playKKboss
	local play1
	local play2
	local play3
	local mob1
	local mob2
	local mob3
	local mobkk1
	local mobkk2
	local mobkk3
	local XBoss
	local YBoss
	local ZBoss
	local Luck=0
	local play1x={} 
	local plays=0
		while 1 do
			Sleep(10)
			local AttackTarget = ReadRoleValue(Boss, EM_RoleValue_AttackTargetID )    		 ---��M�ثe�������ؼ�
			local BossTarget=AttackTarget
			time4=ReadRoleValue(Boss,EM_RoleValue_register1)
			killidtime=ReadRoleValue(Boss,EM_RoleValue_register10)
			MaxHP = ReadRoleValue( Boss , EM_RoleValue_MaxHP )						 		---Ū����q
			NowHP = ReadRoleValue(  Boss , EM_RoleValue_HP )     					 		---Ū���ثe��q
			HPPercent = NowHP / MaxHP
			time7=ReadRoleValue(Boss,EM_RoleValue_register5)
			playKKboss=hatelistcount(boss)
			time1=time1+1
			time2=time2+1
			time3=time3+1
			time8=time8+1
			if killidtime==1 and play44==0 then												 ---�g�z�F
				AddBuff(Boss,620276,0 ,-1 )
				killidtime=0
				WriteRoleValue(Boss,EM_RoleValue_register10,0)							 	 ---��f�U10�k0
				play44=1
			end
			if HPPercent<=0.8 and time7==0 or HPPercent<=0.6 and time7==1 or HPPercent<=0.4 and time7==2 or HPPercent<=0.2 and time7==3 or HPPercent<=0.1 and time7==4   then
				if CheckBuff( Boss , 509642 ) == true then
					yy= Lua_BuffPosSearch( Boss , 509642 )
					xx=BuffInfo( Boss, yy , EM_BuffInfoType_Power )---Ū���ޯ൥��
					if xx==0 then
					CancelBuff(Boss, 509642)
					ZZ=XX+1
					AddBuff(Boss,509642,ZZ ,-1 )
					WriteRoleValue(Boss,EM_RoleValue_register5,time7+1)
					--say(OwnerID(),"0")
					end
					if xx>0 then
					CancelBuff(Boss, 509642)
					ZZ=XX+1
					AddBuff(Boss,509642,ZZ ,-1 )
					WriteRoleValue(Boss,EM_RoleValue_register5,time7+1)
					--say(OwnerID(),"1")
					end
				end
				if CheckBuff( Boss , 509642 ) == false then
					AddBuff(Boss,509642,0 ,-1 )
					WriteRoleValue(Boss,EM_RoleValue_register5,time7+1)
					--say(OwnerID(),"XX")
				end			
			end
			if time4==1 then---�j��
				while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
						sleep(10)
				end
					SetModeEx( Boss , EM_SetModeType_Move, false) 							---����
					ScriptMessage( OwnerID(), -1 , 2, "[SC_105641_06]" , 2 )
					CastSpellLV( Boss ,Boss, 498284 ,7)
					Sleep(30)
					SetModeEx( Boss , EM_SetModeType_Move, true) 							---����
					WriteRoleValue(Boss,EM_RoleValue_register1,0)
			end
			if time8>=27 then
				while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
						sleep(10)
				end
				CastSpellLV( Boss ,Boss, 498375 ,29)
				sleep(60)
				time8=0
			end
			if time3>=25 or time3>=5 and time5==1 then---�v����
				while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
						sleep(10)
				end
				ScriptMessage( OwnerID(), -1 , 2, "[SC_105641_05]" , 2 )
				if playKKboss==1 then
						SetModeEx( Boss , EM_SetModeType_Move, false) 							---����
						CastSpellLV( Boss ,Boss, 497602 ,0)
						XBoss=ReadRoleValue(Boss ,EM_RoleValue_X)
						YBoss=ReadRoleValue(Boss ,EM_RoleValue_Y)
						ZBoss=ReadRoleValue(Boss ,EM_RoleValue_Z)
						sleep(20)
						bosskkpaly = ic_HateListSort(boss)
						mobkk1=bosskkpaly[1]
						mob1=CreateObj(106032,XBoss,YBoss,ZBoss,0,1)---����1
						mob2=CreateObj(106033,XBoss,YBoss,ZBoss,0,1)---����1
						--mob3=CreateObj(106034,XBoss,YBoss,ZBoss,0,1)---����1
						SetModeEx( mob1 , EM_SetModeType_Searchenemy, false)								---����(�_)
						SetModeEx( mob1 , EM_SetModeType_Fight, false) 										---�i���
						SetModeEx( mob1 , EM_SetModeType_Mark, false)										---�i�I��(�_)
						SetModeEx( mob2 , EM_SetModeType_Searchenemy, false)								---����(�_)
						SetModeEx( mob2 , EM_SetModeType_Fight, false) 										---�i���
						SetModeEx( mob2 , EM_SetModeType_Mark, false)										---�i�I��(�_)
						--SetModeEx( mob3 , EM_SetModeType_Searchenemy, false)								---����(�_)
						--SetModeEx( mob3 , EM_SetModeType_Fight, false) 										---�i���
						--SetModeEx( mob3 , EM_SetModeType_Mark, false)										---�i�I��(�_)
						WriteRoleValue(mob1,EM_RoleValue_PID,Boss)	
						WriteRoleValue(mob2,EM_RoleValue_PID,Boss)	
						--WriteRoleValue(mob3,EM_RoleValue_PID,Boss)	
						AddToPartition(mob1,RoomID)
						AddToPartition(mob2,RoomID)
						--AddToPartition(mob3,RoomID)
						WriteRoleValue(mob1,EM_RoleValue_register9,mobkk1)
						WriteRoleValue(mob2,EM_RoleValue_register9,mobkk1)
						--WriteRoleValue(mob3,EM_RoleValue_register9,mobkk1)
						SetAttack(mob1 , mobkk1)
						SetAttack(mob2 , mobkk1)
						--SetAttack(mob3 , mobkk1)
						BeginPlot(mob1 , "ic_106021_mob44" , 0)
						BeginPlot(mob2 , "ic_106021_mob44" , 0)
						--BeginPlot(mob3 , "ic_106021_mob44" , 0)
						SetModeEx( Boss , EM_SetModeType_Move, true) 							---����
						time3=0
						time5=2
				elseif	playKKboss==2 then
						SetModeEx( Boss , EM_SetModeType_Move, false) 							---����
						CastSpellLV( OwnerID() ,OwnerID(), 497602 ,0)
						XBoss=ReadRoleValue(Boss ,EM_RoleValue_X)
						YBoss=ReadRoleValue(Boss ,EM_RoleValue_Y)
						ZBoss=ReadRoleValue(Boss ,EM_RoleValue_Z)
						sleep(20)
						bosskkpaly = ic_HateListSort(boss)
						mobkk1=bosskkpaly[1]
						mobkk2=bosskkpaly[2]
						mob1=CreateObj(105642,XBoss,YBoss,ZBoss,0,1)---����1
						mob2=CreateObj(105647,XBoss,YBoss,ZBoss,0,1)---����1
						--mob3=CreateObj(105648,XBoss,YBoss,ZBoss,0,1)---����1
						SetModeEx( mob1 , EM_SetModeType_Searchenemy, false)								---����(�_)
						SetModeEx( mob1 , EM_SetModeType_Fight, false) 										---�i���
						SetModeEx( mob1 , EM_SetModeType_Mark, false)										---�i�I��(�_)
						SetModeEx( mob2 , EM_SetModeType_Searchenemy, false)								---����(�_)
						SetModeEx( mob2 , EM_SetModeType_Fight, false) 										---�i���
						SetModeEx( mob2 , EM_SetModeType_Mark, false)										---�i�I��(�_)
						--SetModeEx( mob3 , EM_SetModeType_Searchenemy, false)								---����(�_)
						--SetModeEx( mob3 , EM_SetModeType_Fight, false) 										---�i���
						--SetModeEx( mob3 , EM_SetModeType_Mark, false)										---�i�I��(�_)
						WriteRoleValue(mob1,EM_RoleValue_PID,Boss)	
						WriteRoleValue(mob2,EM_RoleValue_PID,Boss)	
						--WriteRoleValue(mob3,EM_RoleValue_PID,Boss)	
						AddToPartition(mob1,RoomID)
						AddToPartition(mob2,RoomID)
						--AddToPartition(mob3,RoomID)
						WriteRoleValue(mob1,EM_RoleValue_register9,mobkk1)
						WriteRoleValue(mob2,EM_RoleValue_register9,mobkk2)
						--WriteRoleValue(mob3,EM_RoleValue_register9,mobkk2)
						SetAttack(mob1 , mobkk1)
						SetAttack(mob2 , mobkk2)
						--SetAttack(mob3 , mobkk2)
						BeginPlot(mob1 , "ic_106021_mob44" , 0)
						BeginPlot(mob2 , "ic_106021_mob44" , 0)
						--BeginPlot(mob3 , "ic_106021_mob44" , 0)
						SetModeEx( Boss , EM_SetModeType_Move, true) 							---����
						time3=0
						time5=2
				elseif	playKKboss>=3 then
						SetModeEx( Boss , EM_SetModeType_Move, false) 							---����
						CastSpellLV( OwnerID() ,OwnerID(), 497602 ,0)
						bosskkpaly = ic_HateListSort(boss)
						play123=playKKboss-3
						Luck=DW_Rand(play123)
						play1=Luck+1
						play2=Luck+2
						play3=Luck+3
						XBoss=ReadRoleValue(Boss ,EM_RoleValue_X)
						YBoss=ReadRoleValue(Boss ,EM_RoleValue_Y)
						ZBoss=ReadRoleValue(Boss ,EM_RoleValue_Z)
						sleep(20)
						bosskkpaly = ic_HateListSort(boss)	
						mobkk1=bosskkpaly[play1]
						mobkk2=bosskkpaly[play2]
						mobkk3=bosskkpaly[play3]
						mob1=CreateObj(105642,XBoss,YBoss,ZBoss,0,1)---����1
						mob2=CreateObj(105647,XBoss,YBoss,ZBoss,0,1)---����1
						--mob3=CreateObj(105648,XBoss,YBoss,ZBoss,0,1)---����1
						SetModeEx( mob1 , EM_SetModeType_Searchenemy, false)								---����(�_)
						SetModeEx( mob1 , EM_SetModeType_Fight, false) 										---�i���
						SetModeEx( mob1 , EM_SetModeType_Mark, false)										---�i�I��(�_)
						SetModeEx( mob2 , EM_SetModeType_Searchenemy, false)								---����(�_)
						SetModeEx( mob2 , EM_SetModeType_Fight, false) 										---�i���
						SetModeEx( mob2 , EM_SetModeType_Mark, false)										---�i�I��(�_)
						--SetModeEx( mob3 , EM_SetModeType_Searchenemy, false)								---����(�_)
						--SetModeEx( mob3 , EM_SetModeType_Fight, false) 										---�i���
						--SetModeEx( mob3 , EM_SetModeType_Mark, false)										---�i�I��(�_)
						WriteRoleValue(mob1,EM_RoleValue_PID,Boss)	
						WriteRoleValue(mob2,EM_RoleValue_PID,Boss)	
						--WriteRoleValue(mob3,EM_RoleValue_PID,Boss)	
						AddToPartition(mob1,RoomID)
						AddToPartition(mob2,RoomID)
						--AddToPartition(mob3,RoomID)
						WriteRoleValue(mob1,EM_RoleValue_register9,mobkk1)
						WriteRoleValue(mob2,EM_RoleValue_register9,mobkk2)
						--WriteRoleValue(mob3,EM_RoleValue_register9,mobkk3)
						SetAttack(mob1 , mobkk1)
						SetAttack(mob2 , mobkk2)
						--SetAttack(mob3 , mobkk3)
						BeginPlot(mob1 , "ic_106021_mob44" , 0)
						BeginPlot(mob2 , "ic_106021_mob44" , 0)
						--BeginPlot(mob3 , "ic_106021_mob44" , 0)
						SetModeEx( Boss , EM_SetModeType_Move, true) 							---����
						time3=0
						time5=2
				end
			end
			if time2>=15 or time2>=2 and time5==0 then---�`�J�F�𵹥ۦ�
				while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
						sleep(10)
				end
					CastSpellLV( Boss ,Boss, 497600 ,199)
					Sleep(20)
					WriteRoleValue(isaac,EM_RoleValue_register5,1)
					time2=0
					time5=1	
			end
			if time1>=7 then---�H���ؼЪ��u�ˮ`(�ƩZ)
				while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
						sleep(10)
				end
				if hatelistcount(boss)==1 then
					CastSpellLV( Boss,BossTarget, 497603,4)						
					Sleep(25)
					time1=0
				elseif hatelistcount(boss)>=2 then	
					play1x=DW_HateRemain(1)	---1�ƩZ
					plays=DW_Rand(table.getn(play1x))
					CastSpellLV( Boss,play1x[plays], 497603,4)						
					Sleep(25)
					time1=0
				end
			end
		end	
end
function ic_106021_mob44()---�v�����ޯ�
local Boss=ReadRoleValue(OwnerID(),EM_RoleValue_PID)  
local AttackTarget = ReadRoleValue(OwnerID(), EM_RoleValue_register9 )
local time1=0
local time2=0
local playKKboss
local play1x={} 
local plays=0
local playjob
local bosskkpaly = {}	
local mobkk1
	while 1 do
		Sleep(10)
		AttackTarget = ReadRoleValue(OwnerID(), EM_RoleValue_register9 )	
		SetAttack(OwnerID() , AttackTarget)
		playjob=ReadRoleValue(AttackTarget , EM_RoleValue_VOC )
		playKKboss=hatelistcount(boss)
		time1=time1+1
		time2=time2+1
		if  ReadRoleValue( AttackTarget , EM_RoleValue_IsDead ) == 1  then
			if hatelistcount(boss)==0 then
				DelObj(OwnerID())
			elseif hatelistcount(boss)~=0 then		
				bosskkpaly = star_HateListSort(Boss)
				mobkk1=bosskkpaly[1]
				WriteRoleValue(OwnerID(),EM_RoleValue_register9,mobkk1)
			end		
		end
		if time1>=18 or playKKboss==0 then
			DelObj(OwnerID())
			time1=0
		end
		if time2>=5 and playjob==1 or time2>=5 and playjob==2 or time2>=5 and playjob==3 or time2>=5 and playjob==6 or time2>=5 and playjob==7 or time2>=7 and playjob==10 then --���z¾�~
			SetModeEx( OwnerID() , EM_SetModeType_Move, false) 							---����
			CastSpellLV( OwnerID(),AttackTarget, 497605,20)						
			Sleep(20)
			SetModeEx( OwnerID() , EM_SetModeType_Move, true) 							---����
			time2=0
		elseif 	time2>=5 and playjob==4 or time2>=5 and playjob==5 or time2>=5 and playjob==8 or time2>=7 and playjob==9 then	--�k�N¾�~
			SetModeEx( OwnerID() , EM_SetModeType_Move, false) 							---����
			CastSpellLV( OwnerID(),AttackTarget, 497604,800)						
			Sleep(20)
			SetModeEx( OwnerID() , EM_SetModeType_Move, true) 							---����
			time2=0
		end
	end
end