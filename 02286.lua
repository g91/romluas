function ic_105514_01()  																	---��10�f�U�T�w���`�@����				[$VAR1]			 SC_105267_00												
	local isaac=OwnerID()																	---���
	local RoomID=ReadRoleValue(isaac,EM_RoleValue_RoomID)
	local open=0						  													---�}�ԺX��				        
	local killidtime=0																		---�g�ɭp��
	local BOSSXX=0																			---BOSS���`
	local Boss100
	local BOSS9898=0
	local door1																				---���ת�
	local mob1																				---�wBOSS�Τp�y
	local mob2																				---�wBOSS�Τp�y
	local mob3																				---�wBOSS�Τp�y
	local mob4																				---�wBOSS�Τp�y
	local mob5=0																			---�}��		
	local mobplay																			---�p�y�}�l�]�@��
	local Boss=CreateObjByFlag(105514,780870,1,1) 											---BOSS�Цb  �X��1
	local door=CreateObjByFlag(105585,780870,2,1)											---���ת�(�����~�|����)
	SetModeEx( Boss , EM_SetModeType_Move, false) 							---����	
	SetModeEx( Boss , EM_SetModeType_Fight, false) 						---�i���
		mob1=CreateObjByFlag(105704,780870,11,1)												
			SetModeEx( mob1  , EM_SetModeType_ShowRoleHead, false )							--���q�Y����
			SetModeEx( mob1  , EM_SetModeType_Move, false )									--����
			SetModeEx( mob1  , EM_SetModeType_Searchenemy, false )							--����
			SetModeEx( mob1  , EM_SetModeType_Fight , false )								--�i�������
			SetModeEx( mob1 , EM_SetModeType_Mark, false)									---�i�I��(�_)
			AddToPartition( mob1 , RoomID )
			WriteRoleValue(mob1,EM_RoleValue_PID,Boss)										---mob1�Ȧs�f�UPID mob1=BOSS
		mob2=CreateObjByFlag(105704,780870,12,1)
			SetModeEx( mob2  , EM_SetModeType_ShowRoleHead, false )							--���q�Y����
			SetModeEx( mob2  , EM_SetModeType_Move, false )									--����
			SetModeEx( mob2  , EM_SetModeType_Searchenemy, false )							--����
			SetModeEx( mob2  , EM_SetModeType_Fight , false )								--�i�������
			SetModeEx( mob2 , EM_SetModeType_Mark, false)									---�i�I��(�_)	
			AddToPartition( mob2 , RoomID )
			WriteRoleValue(mob2,EM_RoleValue_PID,Boss)										---mob2�Ȧs�f�UPID mob2=BOSS
		mob3=CreateObjByFlag(105704,780870,13,1)
			SetModeEx( mob3  , EM_SetModeType_ShowRoleHead, false )							--���q�Y����
			SetModeEx( mob3  , EM_SetModeType_Move, false )									--����
			SetModeEx( mob3  , EM_SetModeType_Searchenemy, false )							--����
			SetModeEx( mob3  , EM_SetModeType_Fight , false )								--�i�������
			SetModeEx( mob3 , EM_SetModeType_Mark, false)									---�i�I��(�_)	
			AddToPartition( mob3 , RoomID )
			WriteRoleValue(mob3,EM_RoleValue_PID,Boss)										---mob3�Ȧs�f�UPID mob3=BOSS
		mob4=CreateObjByFlag(105704,780870,14,1)
			SetModeEx( mob4  , EM_SetModeType_ShowRoleHead, false )							--���q�Y����
			SetModeEx( mob4  , EM_SetModeType_Move, false )									--����
			SetModeEx( mob4  , EM_SetModeType_Searchenemy, false )							--����
			SetModeEx( mob4  , EM_SetModeType_Fight , false )								--�i�������
			SetModeEx( mob4 , EM_SetModeType_Mark, false)									---�i�I��(�_)
			AddToPartition( mob4 , RoomID )
			WriteRoleValue(mob4,EM_RoleValue_PID,Boss)										---mob4�Ȧs�f�UPID mob4=BOSS
		door1=CreateObjByFlag(105586,780870,3,1)									---��������ת�
			SetModeEx( door1 , EM_SetModeType_Mark, false)							---�i�I��(�_)
			SetModeEx( door1 , EM_SetModeType_ShowRoleHead, false) 					---�Y����(�_)
			SetModeEx( door1 , EM_SetModeType_Obstruct, true) 						---����(�O)
			SetModeEx( door1 , EM_SetModeType_Strikback, false) 					---����
			SetModeEx( door1 , EM_SetModeType_Move, false) 							---����	
			SetModeEx( door1 , EM_SetModeType_Fight, false) 						---�i���
			SetModeEx( door1 , EM_SetModeType_SearchenemyIgnore, false) 			---�O�_�Q�j�M(�_)
			SetModeEx( door1 , EM_SetModeType_Searchenemy, false)					---����(�_)	
			AddToPartition(door1,RoomID)		
			SetModeEx( door , EM_SetModeType_Mark, false)									---�i�I��(�_)
			SetModeEx( door , EM_SetModeType_ShowRoleHead, false) 							---�Y�ۮ�(�_)
			SetModeEx( door , EM_SetModeType_Obstruct, true) 								---����(�O)
			SetModeEx( door , EM_SetModeType_Strikback, false) 								---����
			SetModeEx( door , EM_SetModeType_Move, false) 									---����	
			SetModeEx( door , EM_SetModeType_Fight, false) 									---�i���
			SetModeEx( door , EM_SetModeType_SearchenemyIgnore, false)						---�O�_�Q�j�M(�_) 
			SetModeEx( door , EM_SetModeType_Searchenemy, false)							---����(�_)
			AddToPartition(door,RoomID)	
			AddToPartition(Boss,RoomID)
			SetPlot( Boss,"dead","ic_105514_BOSSXX",0 )										---�����`�@��
			SetIdleMotion( door1 ,ruFUSION_ACTORSTATE_ACTIVATE_BEGIN)
			SetIdleMotion( door ,ruFUSION_ACTORSTATE_ACTIVATE_END)			
			WriteRoleValue(Boss,EM_RoleValue_PID,isaac)   									---BOSS�Ȧs�f�UPID BOSS=isaac
			WriteRoleValue(isaac,EM_RoleValue_PID,Boss)										---isaac�Ȧs�f�UPID isaac=BOSS
	while true do
		sleep(10)
		BOSSXX=ReadRoleValue(isaac , EM_RoleValue_register10)
		mobplay=ReadRoleValue(isaac , EM_RoleValue_register9)								---�p�y�]�@��
		BOSS9898=ReadRoleValue(isaac , EM_RoleValue_register8)
		--say(OwnerID(),"mobplay="..mobplay)
		--say(OwnerID(),"mob5="..mob5)
		if mobplay==1 and mob5==0 then
			BeginPlot(mob1 , "ic_105514_mob" , 0)
			BeginPlot(mob2 , "ic_105514_mob" , 0)
			BeginPlot(mob3 , "ic_105514_mob" , 0)
			BeginPlot(mob4 , "ic_105514_mob" , 0)
			--say(OwnerID(),"playmob")
			sleep(5)
			WriteRoleValue(isaac,EM_RoleValue_register9,0)
			mob5=1
		elseif mobplay==2 and mob5==1 then	
			WriteRoleValue(mob1,EM_RoleValue_register9,1)
			WriteRoleValue(mob2,EM_RoleValue_register9,1)
			WriteRoleValue(mob3,EM_RoleValue_register9,1)
			WriteRoleValue(mob4,EM_RoleValue_register9,1)
			sleep(10)
			WriteRoleValue(mob1,EM_RoleValue_register9,0)
			WriteRoleValue(mob2,EM_RoleValue_register9,0)
			WriteRoleValue(mob3,EM_RoleValue_register9,0)
			WriteRoleValue(mob4,EM_RoleValue_register9,0)
			mob5=0
			--say(OwnerID(),"stopmob")
		end
			if hatelistcount(boss)==0 and open==0 then 
				PlayMotion ( Boss,ruFUSION_ACTORSTATE_SLEEP_BEGIN	 )---------------��1�|�ʧ@
			end
			if hatelistcount(boss)~=0 then    												---Ū����H��
				killidtime=killidtime+1
				if killidtime==360 then														---�g�ɮɶ�
					--WriteRoleValue(boss,EM_RoleValue_register10,1)							---�g�z�F
					killidtime=0
				end
				if open==0 then
					open=1																	---�}���F
				SetIdleMotion( door1 ,ruFUSION_ACTORSTATE_ACTIVATE_END)	
				Boss100=Lua_DW_CreateObj("flag",104693,780870,1,0)							---���նZ����
						SetModeEx( Boss100  , EM_SetModeType_HideName, false )					---�W��
						SetModeEX( Boss100  , EM_SetModeType_Gravity , false )					---���O
						SetModeEx( Boss100  , EM_SetModeType_ShowRoleHead, false )				---���q�Y����
						SetModeEx( Boss100  , EM_SetModeType_Mark, false )						---�аO
						SetModeEx( Boss100  , EM_SetModeType_Move, false )						---����
						SetModeEx( Boss100  , EM_SetModeType_Searchenemy, false )				---����
						SetModeEx( Boss100  , EM_SetModeType_Fight , false )					---�i�������
						SetModeEx( Boss100  , EM_SetModeType_Strikback, false )					---����	
						AddToPartition(Boss100,RoomID)
						WriteRoleValue(Boss100,EM_RoleValue_PID,isaac)
						WriteRoleValue(Boss100,EM_RoleValue_register1,Boss)
						BeginPlot(Boss100 , "ic_105514_100" , 0)---���նZ��			
					ScriptMessage( OwnerID(), -1 , 2 , "[SC_105267_00]" , 2 )				---�}�����---�i�����Z�H�A�Q�D�ԭ^�����O�q��? 
					PlayMotion ( boss,ruFUSION_ACTORSTATE_SLEEP_END	 )---------------��1�|�ʧ@
					sleep(20)
					SetModeEx( Boss , EM_SetModeType_Move, true) 							---����	
					SetModeEx( Boss , EM_SetModeType_Fight, true) 						---�i���
					AddBuff(Boss,508864,6,-1 )
					BeginPlot(boss , "ic_105514_02" , 0)									---�R�O���ⰵ�Ʊ�
				end
			end	
			if hatelistcount(boss)==0 and open==1 or BOSS9898==1 and open==1 then			---�}�ԫᤳ���S�H
				if ReadRoleValue( boss , EM_RoleValue_IsDead)==0 then   					---���S�� ���a����
					sleep(20)
					DelObj(boss)                                        					---�S���ۤv������	
					DelObj(mob1)
					DelObj(mob2)
					DelObj(mob3)
					DelObj(mob4)
					DelObj(Boss100)
					WriteRoleValue(isaac,EM_RoleValue_register9,0)
					WriteRoleValue(isaac,EM_RoleValue_register8,0)
					SetIdleMotion( door1 ,ruFUSION_ACTORSTATE_ACTIVATE_BEGIN)
					sleep(20)
					SetIdleMotion( door1 ,ruFUSION_ACTORSTATE_ACTIVATE_LOOP)
					sleep(20)                                          
					Boss=CreateObjByFlag(105514,780870,1,1)           						---�A�гy1��				
					AddToPartition(Boss,RoomID)	                               				---�гy�� ���n	
					SetModeEx( Boss , EM_SetModeType_Move, false) 
					SetModeEx( Boss , EM_SetModeType_Fight, false) 						---�i���
					SetPlot( Boss,"dead","ic_105514_BOSSXX",0 )								---�����`�@��
					WriteRoleValue(isaac,EM_RoleValue_PID,Boss)
					WriteRoleValue(Boss,EM_RoleValue_PID,isaac)
					BeginPlot(isaac, "ic_105514_BUFFXX" , 0)								---�R��BUFF
					mob1=Lua_DW_CreateObj("flag",105704,780870,11,0)
						SetModeEx( mob1  , EM_SetModeType_ShowRoleHead, false )							--���q�Y����
						SetModeEx( mob1  , EM_SetModeType_Move, false )									--����
						SetModeEx( mob1  , EM_SetModeType_Searchenemy, false )							--����
						SetModeEx( mob1  , EM_SetModeType_Fight , false )								--�i�������
						SetModeEx( mob1 , EM_SetModeType_Mark, false)									---�i�I��(�_)	
						AddToPartition( mob1 , RoomID )
						WriteRoleValue(mob1,EM_RoleValue_PID,Boss)										---mob1�Ȧs�f�UPID mob1=BOSS
					mob2=Lua_DW_CreateObj("flag",105704,780870,12,0)
						SetModeEx( mob2  , EM_SetModeType_ShowRoleHead, false )							--���q�Y����
						SetModeEx( mob2  , EM_SetModeType_Move, false )									--����
						SetModeEx( mob2  , EM_SetModeType_Searchenemy, false )							--����
						SetModeEx( mob2  , EM_SetModeType_Fight , false )								--�i�������
						SetModeEx( mob2 , EM_SetModeType_Mark, false)									---�i�I��(�_)	
						AddToPartition( mob2 , RoomID )
						WriteRoleValue(mob2,EM_RoleValue_PID,Boss)										---mob2�Ȧs�f�UPID mob2=BOSS
					mob3=Lua_DW_CreateObj("flag",105704,780870,13,0)
						SetModeEx( mob3  , EM_SetModeType_ShowRoleHead, false )							--���q�Y����
						SetModeEx( mob3  , EM_SetModeType_Move, false )									--����
						SetModeEx( mob3  , EM_SetModeType_Searchenemy, false )							--����
						SetModeEx( mob3  , EM_SetModeType_Fight , false )								--�i�������
						SetModeEx( mob3 , EM_SetModeType_Mark, false)									---�i�I��(�_)
						AddToPartition( mob3 , RoomID )
						WriteRoleValue(mob3,EM_RoleValue_PID,Boss)										---mob3�Ȧs�f�UPID mob3=BOSS
					mob4=Lua_DW_CreateObj("flag",105704,780870,14,0)
						SetModeEx( mob4  , EM_SetModeType_ShowRoleHead, false )							--���q�Y����
						SetModeEx( mob4  , EM_SetModeType_Move, false )									--����
						SetModeEx( mob4  , EM_SetModeType_Searchenemy, false )							--����
						SetModeEx( mob4  , EM_SetModeType_Fight , false )								--�i�������
						SetModeEx( mob4 , EM_SetModeType_Mark, false)									---�i�I��(�_)
						AddToPartition( mob4 , RoomID )
						WriteRoleValue(mob4,EM_RoleValue_PID,Boss)										---mob4�Ȧs�f�UPID mob4=BOSS	
					open=0																				---���m�԰�
					killidtime=0
				elseif	BOSSXX==1 and open==1 then														---�����F
					ScriptMessage( OwnerID(), -1 , 2 , "[SC_105267_01]" , 2 )							---���`���---�i����A���O�]���^�����O���������M��|��
					SetIdleMotion( door1 ,ruFUSION_ACTORSTATE_ACTIVATE_BEGIN)
					SetIdleMotion( door ,ruFUSION_ACTORSTATE_ACTIVATE_BEGIN)
					sleep(10)
					SetIdleMotion( door ,ruFUSION_ACTORSTATE_ACTIVATE_LOOP)
					SetModeEx( door , EM_SetModeType_Obstruct, false) 	
					SetModeEx( door1 , EM_SetModeType_Obstruct, false) 		
					DelObj(mob1)
					DelObj(mob2)
					DelObj(mob3)
					DelObj(mob4)
					DelObj(Boss100)
					BeginPlot(isaac, "ic_105514_BUFFXX" , 0)											---�R��BUFF
					open=0																				---���m�԰�
					killidtime=0
					WriteRoleValue(isaac,EM_RoleValue_register9,0)
					WriteRoleValue(isaac,EM_RoleValue_register8,0)
					mob5=0
					BOSSXX=2
					sleep(100)
					DelObj(door)
					DelObj(door1)
					break
				end				
			end	
			if BOSSXX==1  then---�L�ı��F��
					ScriptMessage( OwnerID(), -1 , 2 , "[SC_105267_01]" , 2 )			   				---�i����A���O�]���^�����O���������M��|��---���`
					SetIdleMotion( door ,ruFUSION_ACTORSTATE_ACTIVATE_BEGIN)
					sleep(10)
					SetIdleMotion( door ,ruFUSION_ACTORSTATE_ACTIVATE_LOOP)
					SetModeEx( door , EM_SetModeType_Obstruct, false) 	
					SetModeEx( door1 , EM_SetModeType_Obstruct, false) 	
					DelObj(mob1)
					DelObj(mob2)
					DelObj(mob3)
					DelObj(mob4)
					BeginPlot(isaac, "ic_105514_BUFFXX" , 0)							  				---�R��BUFF
					WriteRoleValue(isaac,EM_RoleValue_register9,0)
					WriteRoleValue(isaac,EM_RoleValue_register8,0)
					mob5=0
					open=0	
					killidtime=0
					BOSSXX=2
					sleep(100)
					DelObj(door)
					DelObj(door1)	
					break	
			end	
	end		
end  
function ic_105514_BOSSXX()																	---���`��
	local isaac=ReadRoleValue(OwnerID(),EM_RoleValue_PID)	
		WriteRoleValue(isaac,EM_RoleValue_register10,1)
end 
function ic_105514_BUFFXX()																	---�R��BUFF��
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local TempPlayer = SetSearchAllPlayer(RoomID)											---��ϰ�Ҧ����a
	local ThesePlayer = {}
		for i=1,TempPlayer do
			ThesePlayer[i] = GetSearchResult() 												---���Ȧs�� 508865
			if CheckID( ThesePlayer[i] ) == true and 										---�ˬd���a�O���O�٦b�F�ˬd�O�_���`
				ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and 				---EM_RoleValue_IsDead   =1  =���`
				ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then			---EM_RoleValue_IsPlayer =1  =���a
				if CheckBuff( ThesePlayer[i] , 508866 ) == true or
				   CheckBuff( ThesePlayer[i] , 508784 ) == true	or
				   CheckBuff( ThesePlayer[i] , 508785 ) == true or
				   CheckBuff( ThesePlayer[i] , 508863 ) == true or
				   CheckBuff( ThesePlayer[i] , 508865 ) == true then						---�T�{BUFF
					CancelBuff(ThesePlayer[i], 508866)										---�n�R����BUFF
					CancelBuff(ThesePlayer[i], 508784)
					CancelBuff(ThesePlayer[i], 508785)	
					CancelBuff(ThesePlayer[i], 508863)
					CancelBuff(ThesePlayer[i], 508865)
				end
			end					
		end
end	
function ic_105514_100()																	---���նZ����
	local isaac=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local Boss=ReadRoleValue(OwnerID(),EM_RoleValue_register1)
	local BOSS9898=GetDistance( OwnerID(), Boss)
		while true do
			BOSS9898=GetDistance( OwnerID(), Boss)
			sleep(10)
			if  BOSS9898>=430 then
				WriteRoleValue(isaac,EM_RoleValue_register8,1)
			end
		end
end
function ic_105514_02()   																	 ---��AI(��10�T�w�g�ɥ�)
	local isaac=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local Boss=OwnerID()
	local RoomID=ReadRoleValue(Boss,EM_RoleValue_RoomID)
	local play44=0																			 ---�g�z��
	local killidtime=0								 										 ---�g�ɥ�
	local play1x={} 									 									 ---�H������
	local plays=0   									 									 ---�H������
	local Luck=0										 									 ---�H�����
	local time0=0																			 ---���2���q��
	local time00=0
	local time1=0																			 ---���2���q��
	local time2=0																			 ---����DOT��	
	local time3=0																			 ---����ޯ��
	local time4=0																			 ---5���ؼХ�
	local time5=0																			 ---�e��d��ޯ��
	local time6=0																			 ---�i�J�l�H�M����
	local time9=0
	local time10=0	
	local boss9898=0																		 ---�l�H��
	local plya9898																			 ---��������
	local play1=0
	local play2=0
	local play3=0
	local play4=0
	local play0=0
		while 1 do
			Sleep(10)
			local AttackTarget = ReadRoleValue(Boss, EM_RoleValue_AttackTargetID )    		 ---��M�ثe�������ؼ�
			local BossTarget=AttackTarget
			killidtime=ReadRoleValue(Boss,EM_RoleValue_register10)
			--say(OwnerID(),"boss9898="..boss9898)
			--say(OwnerID(),"play0="..play0)
			--say(OwnerID(),"play1="..play1)
			--say(OwnerID(),"play2="..play2)
			--say(OwnerID(),"play3="..play3)
			--say(OwnerID(),"play4="..play4)
			if killidtime==1 and play44==0 then												  ---�g�z�F	
				---AddBuff(Boss,620042,0 ,-1 )
				killidtime=0
				WriteRoleValue(Boss,EM_RoleValue_register10,0)							 	  ---��f�U10�k0
				play44=1
			end
			if time0==1 then																  ---��2���q
				if time6==0 then
					if hatelistcount(boss)>=2 then	
						CastSpellLV( OwnerID(), OwnerID(), 498049, 0 )						  ---����d��ޯ�
						sleep(20)
						CancelBuff(Boss,508864)
						sleep(20)
						time6=1
					elseif hatelistcount(boss)==1 then	
						CastSpellLV( OwnerID(), OwnerID(), 498049, 0 )						  ---����d��ޯ�
						sleep(20)
						CancelBuff(Boss,508864)
						sleep(20)
						time6=1
					end	
					
				end	
					if hatelistcount(boss)==1 then											  ---1�ꦺ(1��)
						if play1==0 or play2==0 or play3==0 or play4==0 then
							---WriteRoleValue(isaac,EM_RoleValue_register9,1)
							local PlayerName = GetName( BossTarget )
							local MessageString = "[SC_105267_03][$SETVAR1="..PlayerName.."]" 		----�bstring���i�H�q�X���a���W�r
									  ScriptMessage( OwnerID() , -1 , 2 , MessageString , 1 )
							sleep(10)		  
							sysCastSpellLV( BossTarget, boss, 508491, 0 )						---�J��		  
							sleep(10)
							SetAttack(Boss , BossTarget)										---�sBOSS�����a
							sleep(10)
							CastSpellLV( OwnerID(), BossTarget, 497447, 999)				---�ľW
							time0=0	
							time1=0
							play1=0
							play2=0	
							play3=0
							play4=0
							boss9898=0
							local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
							local TempPlayer = SetSearchAllPlayer(RoomID)				  ---��ϰ�Ҧ����a
							local ThesePlayer = {}
							for i=1,TempPlayer do
								ThesePlayer[i] = GetSearchResult() 						  ---���Ȧs��
								if CheckID( ThesePlayer[i] ) == true and 
									ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and 
									ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then
										--�ˬd���a�O���O�٦b�F�ˬd�O�_���`
									if CheckBuff( ThesePlayer[i] , 508785 ) == true then
										CancelBuff(ThesePlayer[i], 508785)
									end				
								end
							end	
						end	
					end	
					if hatelistcount(boss)==2 then											  ---2�ꦺ(2����)
					if  boss9898==0 then
						if play1==0 then
							play1x=DW_HateRemain(0)											  ---�H����
							plays=DW_Rand(table.getn(play1x))
							WriteRoleValue(Boss,EM_RoleValue_register2,play1x[plays])		  ---��������
						end
						plya9898=ReadRoleValue(Boss,EM_RoleValue_register2)			
						if CheckBuff( plya9898, 508785 ) == false then						  ---�T�{ �Q��L�����|�Q�l
							play1=1
						end	
						if play1==1 then
							if CheckID( plya9898 ) == true and ReadRoleValue( plya9898 , EM_RoleValue_IsDead ) == 1 then
								CancelBuff(plya9898, 508785)
								WriteRoleValue(Boss,EM_RoleValue_register1,0)
								WriteRoleValue(Boss,EM_RoleValue_register2,0)
								time1=0
								play1=0
								play2=0	
								play3=0
								play4=0
								play0=0
								boss9898=0
								time0=0
							end
							if play0==0 then
								plya9898=ReadRoleValue(Boss,EM_RoleValue_register2)
								sleep(10)
								SetAttack(Boss , plya9898)										---�sBOSS�����a
								sleep(10)
								sysCastSpellLV( plya9898, boss, 497474, 0 )						---�J��
								SetAttack(Boss , plya9898)										---�sBOSS�����a
								sleep(30)
								SetAttack(Boss , plya9898)										---�sBOSS�����a
								sysCastSpellLV( plya9898, boss, 497474, 0 )					  	---�J��	
								SetAttack(Boss , plya9898)										---�sBOSS�����a
								if CheckBuff( boss, 508491 ) == true and play0==0 then			---�T�{	
									AddBuff(Boss,508864,0,-1 )
									play0=1
								end	
							end
							if play0==1  then
								AddBuff(plya9898,508785,0 ,-1 )
								WriteRoleValue(Boss,EM_RoleValue_register1,1)
								boss9898=1
								boss9898=ReadRoleValue(Boss,EM_RoleValue_register1)				---���]�����q
							end
						end
					elseif	boss9898==1 then
						if play1==1 then														---�T�{��誱�a���S�����`
							plya9898=ReadRoleValue(Boss,EM_RoleValue_register2)	
							if CheckID( plya9898 ) == true and ReadRoleValue( plya9898 , EM_RoleValue_IsDead ) == 1 then
								WriteRoleValue(Boss,EM_RoleValue_register1,0)
								WriteRoleValue(Boss,EM_RoleValue_register2,0)
								time1=0
								play1=0
								play2=0	
								play3=0
								play4=0
								play0=0
								boss9898=0
								time0=0
								local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
								local TempPlayer = SetSearchAllPlayer(RoomID)					---��ϰ�Ҧ����a
								local ThesePlayer = {}
									  for i=1,TempPlayer do
											ThesePlayer[i] = GetSearchResult() 					---���Ȧs��
											if CheckID( ThesePlayer[i] ) == true and 
												ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and 
												ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then
												--�ˬd���a�O���O�٦b�F�ˬd�O�_���`
												if CheckBuff( ThesePlayer[i] , 508785 ) == true then
												CancelBuff(ThesePlayer[i], 508785)
												end
											end					
									  end
							end
							play1=2
							WriteRoleValue(Boss,EM_RoleValue_register2,0)					---�����k0	
						end	
						if play2==0 then
							play1x=DW_HateRemain(0)												---�H����
							plays=DW_Rand(table.getn(play1x))
							WriteRoleValue(Boss,EM_RoleValue_register2,play1x[plays])			---��������
						end
						plya9898=ReadRoleValue(Boss,EM_RoleValue_register2)	
						if CheckBuff( plya9898, 508785 ) == false then							---�T�{ �Q��L�����|�Q�l
							play2=1
						end	
						if play2==1 then
							if play0==1 then
								plya9898=ReadRoleValue(Boss,EM_RoleValue_register2)
								sleep(10)
								SetAttack(Boss , plya9898)
							    sleep(10)
								sysCastSpellLV( plya9898, boss, 497474, 0 )						---�J��	
								SetAttack(Boss , plya9898)										---�sBOSS�����a								
								sleep(30)
								SetAttack(Boss , plya9898)										---�sBOSS�����a
								sysCastSpellLV( plya9898, boss, 497474, 0 )						---�J��	
								SetAttack(Boss , plya9898)										---�sBOSS�����a	
								if CheckBuff( boss, 508491 ) == true and play0==1 then			---�T�{	
									AddBuff(Boss,508864,0,-1 )
									---WriteRoleValue(isaac,EM_RoleValue_register9,1)
									local PlayerName = GetName( plya9898)
									local MessageString = "[SC_105267_03][$SETVAR1="..PlayerName .."]" 		----�bstring���i�H�q�X���a���W�r
										  ScriptMessage( OwnerID() , -1 , 2 , MessageString , 1 )
									sleep(20)
									CastSpellLV( OwnerID(), plya9898, 497447, 999 )				---�ľW
									play0=2
									time0=0
								end	
							end		
							if CheckID( plya9898) == true and ReadRoleValue( plya9898 , EM_RoleValue_IsDead ) == 1 or play0==2 then	
								WriteRoleValue(Boss,EM_RoleValue_register1,0)
								WriteRoleValue(Boss,EM_RoleValue_register2,0)					---�����k0
								time1=0
								play1=0
								play2=0
								play3=0
								play4=0
								play0=0
								boss9898=0
								local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
								local TempPlayer = SetSearchAllPlayer(RoomID)					---��ϰ�Ҧ����a
								local ThesePlayer = {}
									for i=1,TempPlayer do
									ThesePlayer[i] = GetSearchResult() 							---���Ȧs��
									if CheckID( ThesePlayer[i] ) == true and 
										ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and 
										ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then
											--�ˬd���a�O���O�٦b�F�ˬd�O�_���`
										if CheckBuff( ThesePlayer[i] , 508785 ) == true then
											CancelBuff(ThesePlayer[i], 508785)
										end
									end					
								end
								time0=0
							end	
						end	
					end
					end	
					if hatelistcount(boss)==3 then											  ---3�ꦺ(3����)
					if  boss9898==0 then
						if play1==0 then
							play1x=DW_HateRemain(0)											  ---�H����
							plays=DW_Rand(table.getn(play1x))
							WriteRoleValue(Boss,EM_RoleValue_register2,play1x[plays])		  ---��������
						end
						plya9898=ReadRoleValue(Boss,EM_RoleValue_register2)			
						if CheckBuff( plya9898, 508785 ) == false then						  ---�T�{ �Q��L�����|�Q�l
							play1=1
						end	
						if play1==1 then
							if CheckID( plya9898 ) == true and ReadRoleValue( plya9898 , EM_RoleValue_IsDead ) == 1 then
								CancelBuff(plya9898, 508785)
								WriteRoleValue(Boss,EM_RoleValue_register1,0)
								WriteRoleValue(Boss,EM_RoleValue_register2,0)
								time1=0
								play1=0
								play2=0	
								play3=0
								play4=0
								play0=0
								boss9898=0
								time0=0
							end
							if play0==0 then
								plya9898=ReadRoleValue(Boss,EM_RoleValue_register2)
								sleep(10)
								SetAttack(Boss , plya9898)									  ---�sBOSS�����a	
								sleep(10)
								sysCastSpellLV( plya9898, boss, 497474, 0 )					  ---�J��
								SetAttack(Boss , plya9898)									  ---�sBOSS�����a	
								sleep(30)
								SetAttack(Boss , plya9898)										---�sBOSS�����a
								sysCastSpellLV( plya9898, boss, 497474, 0 )					  ---�J��
								SetAttack(Boss , plya9898)									  ---�sBOSS�����a	
								if CheckBuff( Boss, 508491 ) == true and play0==0 then		  ---�T�{
									AddBuff(Boss,508864,0,-1 )
									play0=1
								end	
							end	
							if play0==1 then
								AddBuff(plya9898,508785,0 ,-1 )
								WriteRoleValue(Boss,EM_RoleValue_register1,1)
								boss9898=1
								boss9898=ReadRoleValue(Boss,EM_RoleValue_register1)				---���]�����q
							end
						end
					elseif	boss9898==1 then
						if play1==1 then														---�T�{��誱�a���S�����`
							plya9898=ReadRoleValue(Boss,EM_RoleValue_register2)	
							if CheckID( plya9898 ) == true and ReadRoleValue( plya9898 , EM_RoleValue_IsDead ) == 1 then
								WriteRoleValue(Boss,EM_RoleValue_register1,0)
								WriteRoleValue(Boss,EM_RoleValue_register2,0)
								time1=0
								play1=0
								play2=0	
								play3=0
								play4=0
								play0=0
								boss9898=0
								time0=0
								local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
								local TempPlayer = SetSearchAllPlayer(RoomID)					---��ϰ�Ҧ����a
								local ThesePlayer = {}
									  for i=1,TempPlayer do
											ThesePlayer[i] = GetSearchResult() 					---���Ȧs��
											if CheckID( ThesePlayer[i] ) == true and 
												ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and 
												ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then
												--�ˬd���a�O���O�٦b�F�ˬd�O�_���`
												if CheckBuff( ThesePlayer[i] , 508785 ) == true then
												CancelBuff(ThesePlayer[i], 508785)
												end
											end					
									  end
							end
							play1=2
							WriteRoleValue(Boss,EM_RoleValue_register2,0)					---�����k0	
						end		
						if play2==0 then
							play1x=DW_HateRemain(0)												---�H����
							plays=DW_Rand(table.getn(play1x))
							WriteRoleValue(Boss,EM_RoleValue_register2,play1x[plays])			---��������
						end
						plya9898=ReadRoleValue(Boss,EM_RoleValue_register2)	
						if CheckBuff( plya9898, 508785 ) == false then							---�T�{ �Q��L�����|�Q�l
							play2=1
						end	
						if play2==1 then
							if CheckID( plya9898) == true and ReadRoleValue( plya9898 , EM_RoleValue_IsDead ) == 1 then
								CancelBuff(plya9898, 508785)
								WriteRoleValue(Boss,EM_RoleValue_register1,0)
								WriteRoleValue(Boss,EM_RoleValue_register2,0)
								time1=0
								play1=0
								play2=0
								play3=0
								play4=0
								play0=0
								boss9898=0
								local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
								local TempPlayer = SetSearchAllPlayer(RoomID)					---��ϰ�Ҧ����a
								local ThesePlayer = {}
										for i=1,TempPlayer do
											ThesePlayer[i] = GetSearchResult() 					---���Ȧs��
											if CheckID( ThesePlayer[i] ) == true and 
												ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and 
												ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then
												--�ˬd���a�O���O�٦b�F�ˬd�O�_���`
												if CheckBuff( ThesePlayer[i] , 508785 ) == true then
												CancelBuff(ThesePlayer[i], 508785)
												end
											end					
										end
								time0=0	
							end
							if play0==1 then
								plya9898=ReadRoleValue(Boss,EM_RoleValue_register2)
								sleep(10)
								SetAttack(Boss , plya9898)										---�sBOSS�����a
								sleep(10)
								sysCastSpellLV( plya9898, boss, 497474, 0 )						---�J��
								SetAttack(Boss , plya9898)										---�sBOSS�����a
								sleep(30)
								SetAttack(Boss , plya9898)										---�sBOSS�����a
								sysCastSpellLV( plya9898, boss, 497474, 0 )						---�J��
								SetAttack(Boss , plya9898)										---�sBOSS�����a
								if CheckBuff( Boss, 508491 ) == true and play0==1  then			---�T�{
									AddBuff(Boss,508864,0,-1 )
									play0=2
								end	
							end	
							if play0==2 then
								AddBuff(plya9898,508785,0 ,-1 )
								WriteRoleValue(Boss,EM_RoleValue_register1,2)	
								boss9898=2
								boss9898=ReadRoleValue(Boss,EM_RoleValue_register1)				---���]�����q
							end
						end	
					elseif	boss9898==2 then
						if play2==1 then														---�T�{��誱�a���S�����`
							plya9898=ReadRoleValue(Boss,EM_RoleValue_register2)	
							if CheckID( plya9898 ) == true and ReadRoleValue( plya9898 , EM_RoleValue_IsDead ) == 1 then
								WriteRoleValue(Boss,EM_RoleValue_register1,0)
								WriteRoleValue(Boss,EM_RoleValue_register2,0)
								time1=0
								play1=0
								play2=0	
								play3=0
								play4=0
								play0=0
								boss9898=0
								time0=0
								local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
								local TempPlayer = SetSearchAllPlayer(RoomID)					---��ϰ�Ҧ����a
								local ThesePlayer = {}
									  for i=1,TempPlayer do
											ThesePlayer[i] = GetSearchResult() 					---���Ȧs��
											if CheckID( ThesePlayer[i] ) == true and 
												ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and 
												ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then
												--�ˬd���a�O���O�٦b�F�ˬd�O�_���`
												if CheckBuff( ThesePlayer[i] , 508785 ) == true then
												CancelBuff(ThesePlayer[i], 508785)
												end
											end					
									  end
							end
							play2=2
							WriteRoleValue(Boss,EM_RoleValue_register2,0)					---�����k0	
						end
						if play3==0 then
							play1x=DW_HateRemain(0)												---�H����
							plays=DW_Rand(table.getn(play1x))
							WriteRoleValue(Boss,EM_RoleValue_register2,play1x[plays])			---��������
						end
						plya9898=ReadRoleValue(Boss,EM_RoleValue_register2)	
						if CheckBuff( plya9898, 508785 ) == false then							---�T�{ �Q��L�����|�Q�l
							play3=1
						end	
						if play3==1 then
							if play0==2 then
								plya9898=ReadRoleValue(Boss,EM_RoleValue_register2)
								sleep(10)
								SetAttack(Boss , plya9898)										---�sBOSS�����a
								sleep(10)
								sysCastSpellLV( plya9898, boss, 497474, 0 )						---�J��
								SetAttack(Boss , plya9898)										---�sBOSS�����a
								sleep(30)
								SetAttack(Boss , plya9898)										---�sBOSS�����a
								sysCastSpellLV( plya9898, boss, 497474, 0 )						---�J��
								SetAttack(Boss , plya9898)										---�sBOSS�����a
								if CheckBuff( Boss, 508491 ) == true and play0==2  then			---�T�{	
									AddBuff(Boss,508864,0,-1 )
									---WriteRoleValue(isaac,EM_RoleValue_register9,1)
									local PlayerName = GetName( plya9898)
									local MessageString = "[SC_105267_03][$SETVAR1="..PlayerName .."]" 		----�bstring���i�H�q�X���a���W�r
										  ScriptMessage( OwnerID() , -1 , 2 , MessageString , 1 )
									sleep(20)
									CastSpellLV( OwnerID(), plya9898, 497447, 999)				---�ľW	
									play0=3
									time0=0
								end	
							end	
							if CheckID( plya9898) == true and ReadRoleValue( plya9898 , EM_RoleValue_IsDead ) == 1 or play0==3 then	
								WriteRoleValue(Boss,EM_RoleValue_register1,0)
								WriteRoleValue(Boss,EM_RoleValue_register2,0)					---�����k0
								time1=0
								play1=0
								play2=0
								play3=0
								play4=0
								play0=0
								boss9898=0
								local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
								local TempPlayer = SetSearchAllPlayer(RoomID)					---��ϰ�Ҧ����a
								local ThesePlayer = {}
									for i=1,TempPlayer do
									ThesePlayer[i] = GetSearchResult() 							---���Ȧs��
									if CheckID( ThesePlayer[i] ) == true and 
										ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and 
										ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then
										--�ˬd���a�O���O�٦b�F�ˬd�O�_���`
										if CheckBuff( ThesePlayer[i] , 508785 ) == true then
											CancelBuff(ThesePlayer[i], 508785)
										end
									end					
								end
								time0=0
							end	
						end
					end	
					end
					if hatelistcount(boss)>=4 then											  ---N�H��
					if  boss9898==0 then
						if play1==0 then
							play1x=DW_HateRemain(0)											  ---�H����
							plays=DW_Rand(table.getn(play1x))
							WriteRoleValue(Boss,EM_RoleValue_register2,play1x[plays])		  ---��������
						end
						plya9898=ReadRoleValue(Boss,EM_RoleValue_register2)			
						if CheckBuff( plya9898, 508785 ) == false then						  ---�T�{ �Q��L�����|�Q�l
							play1=1
						end	
						if play1==1 then
							if CheckID( plya9898 ) == true and ReadRoleValue( plya9898 , EM_RoleValue_IsDead ) == 1 then
								CancelBuff(plya9898, 508785)
								WriteRoleValue(Boss,EM_RoleValue_register1,0)
								WriteRoleValue(Boss,EM_RoleValue_register2,0)
								time1=0
								play1=0
								play2=0	
								play3=0
								play4=0
								play0=0
								boss9898=0
								time0=0
							end
							if play0==0 then
								plya9898=ReadRoleValue(Boss,EM_RoleValue_register2)
								local PlayerName = GetName( plya9898)
								local MessageString = "[SC_105267_05][$SETVAR1="..PlayerName .."]" 		----�bstring���i�H�q�X���a���W�r
								ScriptMessage( OwnerID() , -1 , 2 , MessageString , 1 )
								sleep(10)
								SetAttack(Boss , plya9898)										---�sBOSS�����a
								sleep(10)
								sysCastSpellLV( plya9898, boss, 497474, 0 )						---�J��	
								SetAttack(Boss , plya9898)										---�sBOSS�����a									
								sleep(30)
								SetAttack(Boss , plya9898)										---�sBOSS�����a
								sysCastSpellLV( plya9898, boss, 497474, 0 )						---�J��	
								SetAttack(Boss , plya9898)										---�sBOSS�����a
								if CheckBuff( boss, 508491 ) == true and play0==0 then			---�T�{	
									AddBuff(Boss,508864,0,-1 )
									play0=1
								end	
							end	
							if play0==1 then
								AddBuff(plya9898,508785,0 ,-1 )
								WriteRoleValue(Boss,EM_RoleValue_register1,1)
								boss9898=1
								boss9898=ReadRoleValue(Boss,EM_RoleValue_register1)				---���]�����q
							end
						end
					elseif	boss9898==1 then
						if play1==1 then														---�T�{��誱�a���S�����`
							plya9898=ReadRoleValue(Boss,EM_RoleValue_register2)	
							if CheckID( plya9898 ) == true and ReadRoleValue( plya9898 , EM_RoleValue_IsDead ) == 1 then
								WriteRoleValue(Boss,EM_RoleValue_register1,0)
								WriteRoleValue(Boss,EM_RoleValue_register2,0)
								time1=0
								play1=0
								play2=0	
								play3=0
								play4=0
								play0=0
								boss9898=0
								time0=0
								local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
								local TempPlayer = SetSearchAllPlayer(RoomID)					---��ϰ�Ҧ����a
								local ThesePlayer = {}
									  for i=1,TempPlayer do
											ThesePlayer[i] = GetSearchResult() 					---���Ȧs��
											if CheckID( ThesePlayer[i] ) == true and 
												ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and 
												ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then
												--�ˬd���a�O���O�٦b�F�ˬd�O�_���`
												if CheckBuff( ThesePlayer[i] , 508785 ) == true then
												CancelBuff(ThesePlayer[i], 508785)
												end
											end					
									  end
							end
							play1=2
							WriteRoleValue(Boss,EM_RoleValue_register2,0)					---�����k0	
						end	
						if play2==0 then
							play1x=DW_HateRemain(0)												---�H����
							plays=DW_Rand(table.getn(play1x))
							WriteRoleValue(Boss,EM_RoleValue_register2,play1x[plays])			---��������
						end
						plya9898=ReadRoleValue(Boss,EM_RoleValue_register2)	
						if CheckBuff( plya9898, 508785 ) == false then							---�T�{ �Q��L�����|�Q�l
							play2=1
						end	
						if play2==1 then
							if CheckID( plya9898) == true and ReadRoleValue( plya9898 , EM_RoleValue_IsDead ) == 1 then
								CancelBuff(plya9898, 508785)
								WriteRoleValue(Boss,EM_RoleValue_register1,0)
								WriteRoleValue(Boss,EM_RoleValue_register2,0)
								time1=0
								play1=0
								play2=0	
								play3=0
								play4=0
								play0=0
								boss9898=0
								time0=0
								local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
								local TempPlayer = SetSearchAllPlayer(RoomID)					---��ϰ�Ҧ����a
								local ThesePlayer = {}
										for i=1,TempPlayer do
											ThesePlayer[i] = GetSearchResult() 					---���Ȧs��
											if CheckID( ThesePlayer[i] ) == true and 
												ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and 
												ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then
												--�ˬd���a�O���O�٦b�F�ˬd�O�_���`
												if CheckBuff( ThesePlayer[i] , 508785 ) == true then
												CancelBuff(ThesePlayer[i], 508785)
												end
											end					
										end
							end
							if play0==1 then
								plya9898=ReadRoleValue(Boss,EM_RoleValue_register2)
								local PlayerName = GetName( plya9898)
								local MessageString = "[SC_105267_05][$SETVAR1="..PlayerName .."]" 		----�bstring���i�H�q�X���a���W�r
								ScriptMessage( OwnerID() , -1 , 2 , MessageString , 1 )
								sleep(10)
								SetAttack(Boss , plya9898)										---�sBOSS�����a
								sleep(10)
								sysCastSpellLV( plya9898, boss, 497474, 0 )						---�J��	
								SetAttack(Boss , plya9898)										---�sBOSS�����a
								sleep(30)
								SetAttack(Boss , plya9898)										---�sBOSS�����a
								sysCastSpellLV( plya9898, boss, 497474, 0 )						---�J��
								SetAttack(Boss , plya9898)										---�sBOSS�����a	
								if CheckBuff( boss, 508491 ) == true and play0==1 then			---�T�{	
									AddBuff(Boss,508864,0,-1 )
									play0=2
								end	
							end	
							if play0==2 then
								AddBuff(plya9898,508785,0 ,-1 )
								WriteRoleValue(Boss,EM_RoleValue_register1,2)	
								boss9898=2
								boss9898=ReadRoleValue(Boss,EM_RoleValue_register1)				---���]�����q
							end
						end	
					elseif	boss9898==2 then
						if play2==1 then														---�T�{��誱�a���S�����`
							plya9898=ReadRoleValue(Boss,EM_RoleValue_register2)	
							if CheckID( plya9898 ) == true and ReadRoleValue( plya9898 , EM_RoleValue_IsDead ) == 1 then
								WriteRoleValue(Boss,EM_RoleValue_register1,0)
								WriteRoleValue(Boss,EM_RoleValue_register2,0)
								time1=0
								play1=0
								play2=0	
								play3=0
								play4=0
								play0=0
								boss9898=0
								time0=0
								local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
								local TempPlayer = SetSearchAllPlayer(RoomID)					---��ϰ�Ҧ����a
								local ThesePlayer = {}
									  for i=1,TempPlayer do
											ThesePlayer[i] = GetSearchResult() 					---���Ȧs��
											if CheckID( ThesePlayer[i] ) == true and 
												ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and 
												ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then
												--�ˬd���a�O���O�٦b�F�ˬd�O�_���`
												if CheckBuff( ThesePlayer[i] , 508785 ) == true then
												CancelBuff(ThesePlayer[i], 508785)
												end
											end					
									  end
							end
							play2=2
							WriteRoleValue(Boss,EM_RoleValue_register2,0)					---�����k0	
						end
						if play3==0 then
							play1x=DW_HateRemain(0)												---�H����
							plays=DW_Rand(table.getn(play1x))
							WriteRoleValue(Boss,EM_RoleValue_register2,play1x[plays])			---��������
						end
						plya9898=ReadRoleValue(Boss,EM_RoleValue_register2)	
						if CheckBuff( plya9898, 508785 ) == false then							---�T�{ �Q��L�����|�Q�l
							play3=1
						end	
						if play3==1 then
							if CheckID( plya9898 ) == true and ReadRoleValue( plya9898 , EM_RoleValue_IsDead ) == 1 then
								CancelBuff(plya9898, 508785)
								WriteRoleValue(Boss,EM_RoleValue_register1,0)
								WriteRoleValue(Boss,EM_RoleValue_register2,0)
								time1=0
								play1=0
								play2=0	
								play3=0
								play4=0
								play0=0
								boss9898=0
								time0=0
								local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
								local TempPlayer = SetSearchAllPlayer(RoomID)					---��ϰ�Ҧ����a
								local ThesePlayer = {}
									 for i=1,TempPlayer do
											ThesePlayer[i] = GetSearchResult() 					---���Ȧs��
											if CheckID( ThesePlayer[i] ) == true and 
												ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and 
												ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then
												--�ˬd���a�O���O�٦b�F�ˬd�O�_���`
												if CheckBuff( ThesePlayer[i] , 508785 ) == true then
												CancelBuff(ThesePlayer[i], 508785)
												end
											end					
										end
							end
							if play0==2 then
								plya9898=ReadRoleValue(Boss,EM_RoleValue_register2)
								local PlayerName = GetName( plya9898)
								local MessageString = "[SC_105267_05][$SETVAR1="..PlayerName .."]" 		----�bstring���i�H�q�X���a���W�r
								ScriptMessage( OwnerID() , -1 , 2 , MessageString , 1 )
								sleep(10)
								SetAttack(Boss , plya9898)										---�sBOSS�����a
								sleep(10)
								sysCastSpellLV( plya9898, boss, 497474, 0 )						---�J��
								SetAttack(Boss , plya9898)										---�sBOSS�����a							
								sleep(30)
								SetAttack(Boss , plya9898)										---�sBOSS�����a
								sysCastSpellLV( plya9898, boss, 497474, 0 )						---�J��
								SetAttack(Boss , plya9898)										---�sBOSS�����a
								if CheckBuff( boss, 508491 ) == true and play0==2 then			---�T�{	
									AddBuff(Boss,508864,0,-1 )
									play0=3
								end	
							end	
							if play0==3 then
								AddBuff(plya9898,508785,0 ,-1 )
								WriteRoleValue(Boss,EM_RoleValue_register1,3)	
								boss9898=3

								boss9898=ReadRoleValue(Boss,EM_RoleValue_register1)				---���]�����q
							end
						end	
					elseif	boss9898==3 then
						if play3==1 then														---�T�{��誱�a���S�����`
							plya9898=ReadRoleValue(Boss,EM_RoleValue_register2)	
							if CheckID( plya9898 ) == true and ReadRoleValue( plya9898 , EM_RoleValue_IsDead ) == 1 then
								WriteRoleValue(Boss,EM_RoleValue_register1,0)
								WriteRoleValue(Boss,EM_RoleValue_register2,0)
								time1=0
								play1=0
								play2=0	
								play3=0
								play4=0
								play0=0
								boss9898=0
								time0=0
								local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
								local TempPlayer = SetSearchAllPlayer(RoomID)					---��ϰ�Ҧ����a
								local ThesePlayer = {}
									  for i=1,TempPlayer do
											ThesePlayer[i] = GetSearchResult() 					---���Ȧs��
											if CheckID( ThesePlayer[i] ) == true and 
												ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and 
												ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then
												--�ˬd���a�O���O�٦b�F�ˬd�O�_���`
												if CheckBuff( ThesePlayer[i] , 508785 ) == true then
												CancelBuff(ThesePlayer[i], 508785)
												end
											end					
									  end
							end
							play3=2
							WriteRoleValue(Boss,EM_RoleValue_register2,0)					---�����k0	
						end
						if play4==0 then
							play1x=DW_HateRemain(0)												---�H����
							plays=DW_Rand(table.getn(play1x))
							WriteRoleValue(Boss,EM_RoleValue_register2,play1x[plays])			---��������
						end
						plya9898=ReadRoleValue(Boss,EM_RoleValue_register2)	
						if CheckBuff( plya9898, 508785 ) == false then							---�T�{ �Q��L�����|�Q�l
							play4=1
						end	
						if play4==1 then
							if play0==3 then
								plya9898=ReadRoleValue(Boss,EM_RoleValue_register2)
								local PlayerName = GetName( plya9898)
								local MessageString = "[SC_105267_05][$SETVAR1="..PlayerName .."]" 		----�bstring���i�H�q�X���a���W�r
								ScriptMessage( OwnerID() , -1 , 2 , MessageString , 1 )
								sleep(10)
								SetAttack(Boss , plya9898)										---�sBOSS�����a
								sleep(10)
								sysCastSpellLV(plya9898, boss, 497474, 0 )						---�J��
								SetAttack(Boss , plya9898)										---�sBOSS�����a
								sleep(30)
								SetAttack(Boss , plya9898)										---�sBOSS�����a
								sysCastSpellLV(plya9898, boss, 497474, 0 )						---�J��
								SetAttack(Boss , plya9898)										---�sBOSS�����a
								if CheckBuff( boss, 508491 ) == true and play0==3 then			---�T�{	
									AddBuff(Boss,508864,0,-1 )
									local PlayerName = GetName( plya9898)
									local MessageString = "[SC_105267_03][$SETVAR1="..PlayerName .."]" 		----�bstring���i�H�q�X���a���W�r
										  ScriptMessage( OwnerID() , -1 , 2 , MessageString , 1 )
									sleep(10)	  
									WriteRoleValue(isaac,EM_RoleValue_register9,1)				---�p�y	  
									sleep(20)
									if CheckBuff( OwnerID() , 508787 ) == false then
										CastSpellLV( OwnerID(), plya9898, 497447, 999)				---�ľW
									end	
									play0=4
								end	
							end	
							if CheckID( plya9898) == true and ReadRoleValue( plya9898 , EM_RoleValue_IsDead ) == 1 or play0==4 then	
								WriteRoleValue(Boss,EM_RoleValue_register1,0)
								WriteRoleValue(Boss,EM_RoleValue_register2,0)					---�����k0
								time1=0
								play1=0
								play2=0
								play3=0
								play4=0
								play0=0
								boss9898=0
								local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
								local TempPlayer = SetSearchAllPlayer(RoomID)					---��ϰ�Ҧ����a
								local ThesePlayer = {}
								for i=1,TempPlayer do
									ThesePlayer[i] = GetSearchResult() 							---���Ȧs��
									if CheckID( ThesePlayer[i] ) == true and 
										ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and 
										ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then
											--�ˬd���a�O���O�٦b�F�ˬd�O�_���`
										if CheckBuff( ThesePlayer[i] , 508785 ) == true then
											CancelBuff(ThesePlayer[i], 508785)
										end
									end		
								end	
								time0=0	
							end
						end	
					end	
				end	
			end
			---say(OwnerID(),"time9="..time9)
			---say(OwnerID(),"time0="..time0)
			if time0==0  then
				if 	time9==1 then
					WriteRoleValue(isaac,EM_RoleValue_register9,2)
					CancelBuff(Boss,508864)
					sleep(20)
					SetModeEx( boss  , EM_SetModeType_Move, true )							 ---����
					SetModeEx( boss  , EM_SetModeType_Strikback, true )						 ---����
					sleep(20)
					CastSpellLV( OwnerID(), OwnerID(), 498049,0)							 ---����d��ޯ�
					sleep(20)
					CancelBuff(Boss,508491)
					sleep(10)
					AddBuff(Boss,508864,6,-1 )
				end	
				if time5>=2 and time10==0 then
					SetModeEx( boss  , EM_SetModeType_Move, true )							 ---����
					time10=1
				end
				time6=0
				WriteRoleValue(isaac,EM_RoleValue_register9,2)
				WriteRoleValue(Boss,EM_RoleValue_register1,0)
				WriteRoleValue(Boss,EM_RoleValue_register2,0)								---�����k0
				play1=0
				play2=0
				play3=0
				play4=0
				play0=0
				time9=0
				boss9898=0		
				time1=time1+1
				time2=time2+1
				time3=time3+1
				time4=time4+1
				time5=time5+1
				if time1>=21 or time4==5 then															---��l�H���q��
					time0=1
					time1=0
					time9=1
					time2=0
					time3=0
					time5=0
					time10=0
				end	
				if time2>=19 then
					ScriptMessage( OwnerID(), -1 , 2 , "[SC_105267_04]" , 2 )			   	---�Z�H��Ө��^�����O���j�j��?
					CastSpellLV( OwnerID(), OwnerID(), 498050, 0)							---����d��ޯ�
					sleep(20)
					time2=0
				end
				if time3>=13 then	
					if hatelistcount(boss)==1 then
						local PlayerName = GetName( BossTarget )
						local MessageString = "[SC_105267_02][$SETVAR1="..PlayerName.."]" 		----�bstring���i�H�q�X���a���W�r
							  ScriptMessage( OwnerID() , -1 , 2 , MessageString , 1 )
						CastSpellLV( OwnerID(), BossTarget, 497055,20)						---����d��ޯ�
						sleep(30)
						time3=0
					elseif hatelistcount(boss)>=2	then
						play1x=DW_HateRemain(1)												---�H����--�����Z
						plays=DW_Rand(table.getn(play1x))
						local PlayerName = GetName( play1x[plays] )
						local MessageString = "[SC_105267_02][$SETVAR1="..PlayerName .."]" 		----�bstring���i�H�q�X���a���W�r
							  ScriptMessage( OwnerID() , -1 , 2 , MessageString , 1 )
						CastSpellLV( OwnerID(), play1x[plays], 497055,20)					---����d��ޯ�
						sleep(30)
						time3=0
					end	
				end
				if time5>=7 then
					CastSpellLV( OwnerID(), BossTarget, 497054,0)							 ---�e��d��ޯ�
					sleep(40)
					time5=0
					time10=0
				end
			end	
		end	
end
function ic_105514_mob() 
	local boss=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local BOSS9898=GetDistance( OwnerID(), Boss)
	local time1=0
	local mobstop=ReadRoleValue(OwnerID(),EM_RoleValue_register9)	
	while 1 do
		local BOSS9898=GetDistance( OwnerID(), Boss)
		mobstop=ReadRoleValue(OwnerID(),EM_RoleValue_register9)
		--say(OwnerID(),"BOSS9898="..BOSS9898)
		if BOSS9898<=30 and time1==0 then
			AddBuff(Boss,508787,0 ,-1 )
			SetModeEx( boss  , EM_SetModeType_Move, false )									---����
			SetModeEx( boss  , EM_SetModeType_Strikback, false )							---����	
			---say(OwnerID(),"123")
			time1=1
		end
		if time1==1 or mobstop==1 then
			--say(OwnerID(),"456")
			break
		end
		sleep(5)
	end
  
end	