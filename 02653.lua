function ic_106450_01()  																	---��10�f�U�T�w���`�@����--��9�f�U�T�w���նZ����					--say(OwnerID(),"boss44="..boss44)														
	local isaac=OwnerID()																	---���
	local ZoneID=ic_ReadRoleValue(isaac,17)													---���ϰ�
	local flag_id=781141																	---�X��
	local door_id=105078																	---���ת�
	local boss_Reset=520																	---���Z��
	local open=0						  													---�}�ԺX��				        
	local killidtime=0																		---�g�ɭp��
	local BOSSXX=0																			---BOSS���`				
	local door1																				---���ת�
	local BOSS9898=0																		---���նZ��	
	local RoomID=ic_ReadRoleValue(isaac,11)													---0=PID 1-10=1-10�f�U 11=ROOMID 12=��e�ؼ�
	local Boss																				---BOSS�Цb  �X��1
	local door=ic_mob_flag_add_Y_N( isaac,door_id,flag_id,2,1)								---���ת�(�����~�|����)
	local mob00																				---�R�OBOSS����
	local boss1_id={106450,107592,107615}													---BOSS���X{Hard,Normal,Easy}
	local boss2_id={106450,107592,107615}													---BOSS���X{Hard,Normal,Easy}(���m��)	
	local Zone={151,152,153}
		if 		ZoneID==Zone[1] then														
			ic_WriteRoleValue(isaac,0,1)
		elseif 	ZoneID==Zone[2] then													
			ic_WriteRoleValue(isaac,0,2)
		elseif 	ZoneID==Zone[3] then														
			ic_WriteRoleValue(isaac,0,3)
		end
	local play_Mode=ic_ReadRoleValue(isaac,0)												---���� 1=�x��12�H 2=���`6�H 3=²��6�H												
		Boss=ic_mob_flag_add_Y_N( isaac,boss1_id[play_Mode],flag_id,1,1)	
		ic_All_door(door)
		ic_WriteRoleValue(Boss,0,isaac)  
		ic_106450_mob_0	()
		mob00=ic_mob_Rand_noadd(isaac,106858 ,0,0)
		ic_All_nolook_00(mob00)
		AddToPartition(mob00,RoomID)
		ic_WriteRoleValue(mob00,0,Boss)
		BeginPlot(mob00,"ic_106450_00",0)
		SetPlot( Boss,"dead","ic_All_BOSSXX",0 )											---�����`�@��
	while true do
		sleep(10)
		BOSS9898=ic_ReadRoleValue(isaac , 9)								
		BOSSXX=ic_ReadRoleValue(isaac , 10)
		if hatelistcount(boss)~=0 then    													---Ū����H��
			killidtime=killidtime+1
			--say(Boss,"crazy = "..killidtime)
			if killidtime==360 and play_Mode==1 or 
			   killidtime==360 and play_Mode==2 then									---�g�ɮɶ�
				ic_WriteRoleValue(boss,10,1)												---�g�z�F
				ic_say_all_play("[SC_106450_04]",2)
				AddBuff(Boss,623851,0 ,-1 )
				killidtime=0
			end
			if open==0 then
				open=1																		----�}���F
				ic_All_Boss100_1(flag_id,isaac,Boss,boss_Reset)								---���O�Z����(�X��,������,BOSS,�Z��)�^�ǭȨ��10�f�U
				door1=ic_mob_flag_add_Y_N( isaac,door_id,flag_id,3,2)						---��������ת�
				ic_All_door(door1)
				AddToPartition(door1,RoomID)
				ic_say_all_play("[SC_106450_01]",2)											---�}�����---
				BeginPlot(boss , "ic_106450_02" , 0)										---�R�O���ⰵ�Ʊ�
				DelObj(mob00)
			end
		end	
		if hatelistcount(boss)==0 and open==1 then				---�}�ԫᤳ���S�H
			if ReadRoleValue( boss , EM_RoleValue_IsDead)==0 then   						---���S�� ���a����
				ic_say_all_play("[SC_106450_02]",2)	
				sleep(20)
				DelObj(boss)                                        						---�S���ۤv������
				DelObj(door1)																---�R�����ת�
				ic_WriteRoleValue(isaac,9,0)
				ic_WriteRoleValue(isaac,10,0)
				ic_npcXX(0,106370,106858,0,0,0,0,0,0,0,0)
				sleep(30)
				if 		play_Mode==1 then														
					ic_playBUFFXX(0,622353,622355,622357,622358,622360,622361,0,0,0,0)		
				elseif 	play_Mode==2 then															
					--ic_playBUFFXX(play0_400,BUFF1,BUFF2,BUFF3,BUFF4,BUFF5,BUFF6,BUFF7,0,0,0)
				elseif 	play_Mode==3 then														
					--ic_playBUFFXX(play0_400,BUFF1,BUFF2,BUFF3,BUFF4,BUFF5,BUFF6,BUFF7,0,0,0)
				end	
				ic_106450_mob_0	()
				Boss=ic_mob_flag_add_Y_N( isaac,boss2_id[play_Mode],flag_id,1,1)				
				ic_WriteRoleValue(Boss,0,isaac)
				mob00=ic_mob_Rand_noadd(isaac,106858 ,0,0)
				ic_All_nolook_00(mob00)
				AddToPartition(mob00,RoomID)
				ic_WriteRoleValue(mob00,0,Boss)
				BeginPlot(mob00,"ic_106450_00",0)				
				SetPlot( Boss,"dead","ic_All_BOSSXX",0 )									---�����`�@��
				sleep(10)
				open=0																		---���m�԰�
				mob123=0
				killidtime=0
			end				
		end	
		if BOSSXX==1   then																	---�L�ı��F��
			ic_say_all_play("[SC_106450_03]",2)		   							 			---�ڭ̫�|��O �o��C���W�h���Ū�~~��~~---���`
			if play_Mode == 2 then
				DelObj(door)
			end
			DelObj(mob00)
			if open==1 then
				DelObj(door1)
			end	
			ic_WriteRoleValue(isaac,9,0)
			ic_WriteRoleValue(isaac,10,0)
			ic_npcXX(0,106370,106873,106858,0,0,0,0,0,0,0)
			sleep(10)
			if 		play_Mode==1 then														
				ic_playBUFFXX(0,622353,622355,622357,622358,622360,622361,0,0,0,0)		
			elseif 	play_Mode==2 then															
				--ic_playBUFFXX(play0_400,BUFF1,BUFF2,BUFF3,BUFF4,BUFF5,BUFF6,BUFF7,0,0,0)
			elseif 	play_Mode==3 then														
				--ic_playBUFFXX(play0_400,BUFF1,BUFF2,BUFF3,BUFF4,BUFF5,BUFF6,BUFF7,0,0,0)
			end
			open=0	
			mob123=7
			killidtime=0
			BOSSXX=2
			sleep(100)		
			break	
		end	
	end		
end  
function ic_106450_00()																		---��BOSS������
	local flag_id=781141																	---�X��
	local Boss=ic_ReadRoleValue(OwnerID(),0)    						 			
	local HPPercent
	local Luck=0
	while true do
		for i=91,95 do 
			HPPercent =ic_HP_Max_Now(Boss)
			if HPPercent==1 then
				DW_MoveToFlag(Boss,flag_id ,i,0)
				Luck=DW_Rand(4)
				--say(OwnerID(),"Luck="..Luck)
				if Luck==1 then--��ͻH
					PlayMotion(Boss,ruFUSION_ACTORSTATE_BUFF_SP01)
					sleep(30)
				elseif Luck==2 then--��}
					PlayMotion(Boss,ruFUSION_ACTORSTATE_EMOTE_IDLE1)	
					sleep(40)
				elseif Luck==3 then--���Y
					PlayMotion(Boss,ruFUSION_ACTORSTATE_EMOTE_IDLE0)
					sleep(30)
				elseif Luck==4 then--��}
					ic_crafting(Boss,1,10)
					ic_crafting(Boss,2,20)
					ic_crafting(Boss,3,20)
				end
			end	
		end	
		sleep(10)
	end	
end
function ic_106450_mob_0()																	---�į�
	local RoomID=ic_ReadRoleValue(OwnerID(),11)
	local flag_id=781141																	---�X��
	local mob={}
	local Luck={}
	local Luck1=0
	local Luck2=0
	for i=1,6 do
		Luck1=10*i+1
		Luck2=10*i+8
		Luck[i]=RandRange(Luck1,Luck2)
		mob[i]=ic_mob_flag_add_Y_N( OwnerID(),106370,flag_id,Luck[i],2)
		SetCursorType( mob[i] , eCursor_Interact)
		ic_All_bobo(mob[i])
		SetModeEx(mob[i],EM_SetModeType_ShowRoleHead, false) 
		AddToPartition(mob[i],RoomID)
		SetPlot(mob[i],"touch","ic_106450_mob_1",10)
		ic_WriteRoleValue(mob[i],1,i)	
	end	
end
function ic_106450_mob_1()																	---�I���
	local player = OwnerID() 	
	local npc = TargetID()  	
		DW_CancelTypeBuff(68,player)
		ic_WriteRoleValue(npc,9,9)
		SetCursorType( npc , eCursor_Interact)
		if 	BeginCastBarEvent( player, npc,"[SC_GERMANY2_CONCERTO_05]", 10, 148, 150, 0, "ic_106450_mob_2" ) ~= 1 then
				ScriptMessage( player, player, 0,"[SAY_NPC_BUSY]", 0 );		--�ؼЦ��L��
				ScriptMessage( player, player, 2,"[SAY_NPC_BUSY]", 0 );		--�ؼЦ��L��
		end
	
end
function ic_106450_mob_2(ObjID, CheckStatus)												---�I���
	local flag_id=781141																	---�X��
	local player = OwnerID() 	-- ���a
	local NPC = TargetID()  	-- NPC
	local RoomID=ic_ReadRoleValue(NPC,11)
	local mob123456=ic_ReadRoleValue(NPC,1)
	local mob={}
	local Luck={}
	local Luck1=0
	local Luck2=0
	if( CheckStatus~= 0)then
		if( CheckStatus > 0 ) then
			SetModeEx(NPC,EM_SetModeType_Show, false)
			GiveBodyItem(player, 241225, 1 )
			EndCastBar( player, CheckStatus )
			Luck1=10*mob123456+1
			Luck2=10*mob123456+8
			Luck[mob123456]=RandRange(Luck1,Luck2)
			mob[mob123456]=ic_mob_flag_add_Y_N( NPC,106370,flag_id,Luck[mob123456],2)
			ic_All_bobo(mob[mob123456])
			SetModeEx(mob[mob123456],EM_SetModeType_ShowRoleHead, false) 
			AddToPartition(mob[mob123456],RoomID)
			SetPlot(mob[mob123456],"touch","ic_106450_mob_1",10)
			ic_WriteRoleValue(mob[mob123456],1,mob123456)
			sleep(20)
			DelObj(NPC)
		else
			EndCastBar( player, CheckStatus )
		end
		Sleep(10)
	end
end	 
function ic_106450_boss_mob_1() 															---�z���y
local mob=OwnerID()
local killid
local time1=0
	while 1 do
		sleep(10)
		killid= ic_ReadRoleValue(mob,1)  
		if killid==1 then
			time1=time1+1
			if time1>3 then
				DelObj(mob)
			end
		end
	end
end
function ic_106450_boss_mob_2() 															---�į�
	local mob=OwnerID()
	if CheckBuff(mob,622357) == true  then--12�H
		CancelBuff(mob,622357)
			AddBuff(mob,622358,0,-1)
	elseif CheckBuff(mob,00) == true  then--���`6�H  
		CancelBuff(mob,00)
	elseif CheckBuff(mob,0) == true  then--²��6�H  
		CancelBuff(mob,0)
	end

	DelBodyItem(mob,241225,1)
end
function ic_106450_02()   																	---��AI(��10�T�w�g�ɥ�)
	local Boss=OwnerID()
	local isaac=ic_ReadRoleValue(Boss,0)
	local RoomID=ic_ReadRoleValue(Boss,11)													---0=PID 1-10=1-10�f�U 11=ROOMID 12=��e�ؼ�
	local play_Mode=ic_ReadRoleValue(isaac,0)												--���� 1=�x��12�H 2=���`6�H 3=²��6�H
	local play44=0																			---�g�z��
	local killidtime=0								 										---�g�ɥ�
	local time0=0	
	local time1=0
	local time2=0
	local time3=0
	local time4=0
	local time5=0
	local time6 = 0 
	local AttackTarget  						 		
	local HPPercent																			---Ū��q��
	while 1 do
		Sleep(10)
		AttackTarget = ic_ReadRoleValue(Boss, 12 )    				
		killidtime=ic_ReadRoleValue(Boss,10)
		HPPercent=ic_HP_Max_Now(Boss)
		if time0==1	then
			time1=time1+1
		end	
			time2=time2+1
			time3=time3+1
			time4=time4+1
			time6=time6+1			
		if killidtime==1 and play44==0 then												 	---�g�z�F
				AddBuff(Boss,623851,0 ,-1 )
				killidtime=0
				ic_WriteRoleValue(Boss,10,0)							 					---��f�U10�k0
				play44=1
		end
		if HPPercent<0.91 and time5==0 or 
		   HPPercent<0.81 and time5==1 or
           HPPercent<0.71 and time5==2 or
		   HPPercent<0.61 and time5==3 or
		   HPPercent<0.51 and time5==4 or
		   HPPercent<0.41 and time5==5 or
		   HPPercent<0.31 and time5==6 or
		   HPPercent<0.21 and time5==7 or
		   HPPercent<0.11 and time5==8 or 
		   time1>5 then
		   if time1<6 then
				time5=time5+1
		   end		
			ic_magic_ing(Boss,5)	
			ScriptMessage(Boss, -1 , 2 , "[SC_104224_05]" , 2 )								---�·t�O�q�X��
			ic_crafting(Boss,1,20)
			ic_crafting(Boss,2,10)
			addbuff(Boss,622362,0,3)
			
			SetModeEx(Boss,EM_SetModeType_Strikback,false)
			CastSpellLV(Boss,Boss, 850094 , 0 )												---��t�ʧ@
			
			sleep(10)
			if play_Mode==1 then
				ic_playkk_mob_1_6_LUA(Boss,6,0,106858,"ic_106450_boss_mob_1")
			elseif	play_Mode==2 then
				ic_playkk_mob_1_6_LUA(Boss,3,0,106858,"ic_106450_boss_mob_1")
			elseif	play_Mode==3 then
				ic_playkk_mob_1_6_LUA(Boss,2,0,106858,"ic_106450_boss_mob_1")
			end
			sleep(10)	
			local NPCXX = SetSearchAllNPC(RoomID )
			for i = 0 , NPCXX do
				local ID=GetSearchResult()
				local ID2=ReadRoleValue(ID,EM_RoleValue_OrgID) 
				if ID2==106858 then
					if play_Mode==1 then
						sysCastSpellLV(Boss,ID, 850096 , 7 )
					elseif	play_Mode==2 then
						sysCastSpellLV(Boss,ID, 850096 , 11 )
					elseif	play_Mode==3 then
						sysCastSpellLV(Boss,ID, 850096 , 3 )
					end
					ic_WriteRoleValue(ID,1,1)	
				end
			end
			SetModeEx(Boss,EM_SetModeType_Strikback,true)
			ic_crafting(Boss,2,20)
			ic_crafting(Boss,3,10)
			time1=0
			time2=0
			time0=0
		end
		if time2>=10 and time0==0 then
			ic_magic_ing(Boss,5)
			if play_Mode==1 then
				CastSpellLV( Boss , Boss , 850093 , 99 )
			elseif	play_Mode==2 then
				CastSpellLV( Boss , Boss , 850093 , 399 )
			elseif	play_Mode==3 then
				CastSpellLV( Boss , Boss , 850093 , 49 )
			end
			ic_magic_ing(Boss,5)
			SetIdleMotion(Boss,ruFUSION_ACTORSTATE_NORMAL)
			sleep(10)
			time2=0
			time0=1
		end
		if time6 %5 == 0 then
			sysCastSpellLV(Boss,Boss, 850095 , 0 )
		end
		if time3>=7 then
			ic_magic_ing(Boss,5)	
			if play_Mode==1 then
				CastSpellLV( Boss , Boss , 850092 , 0 )
			elseif	play_Mode==2 then
				CastSpellLV( Boss , Boss , 850092 , 0 )
			elseif	play_Mode==3 then
				CastSpellLV( Boss , Boss , 850092 , 0 )
			end
			ic_magic_ing(Boss,5)
			SetIdleMotion(Boss,ruFUSION_ACTORSTATE_NORMAL)
			sleep(10)
			time3=0
		end
	end	
end