function ic_104605_01()   ------�D����
		local Ctrl = OwnerID()					--���
		local open=0						    --�}�ԺX��				        
		local killidtime=0
		local boss44=0
		local time1=0							---��ޯ�						
		local door1								--���ת�1
		local door2								--���ת�2
		local BOSS9898=0
		local Boss100
		local RoomID=ReadRoleValue(Ctrl,EM_RoleValue_RoomID)
		local Boss=CreateObjByFlag(104605,780775,1,1) 	-----BOSS�Цb  �X��1
		local door=CreateObjByFlag(105078,780775,2,1)	-----���ת�(�����~�|����)
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
		SetPlot( Boss,"dead","ic_104605_44",0 )
		WriteRoleValue(Boss,EM_RoleValue_PID,Ctrl)   --�Ȧs�f�U 1 BOSS=ctrl
		WriteRoleValue(Ctrl,EM_RoleValue_PID,Boss)
		while true do
			sleep(10)
			--say(OwnerID(),"boss44="..boss44)
			--say(OwnerID(),"open="..open)
			boss44=ReadRoleValue(  OwnerID() , EM_RoleValue_register4 )
			BOSS9898=ReadRoleValue(  OwnerID() , EM_RoleValue_register10)
			if hatelistcount(boss)~=0 then    		---Ū����H��
				killidtime=killidtime+1
				time1=time1+1
				---say(OwnerID(),"killidtime"..killidtime)
				if killidtime==30 then
					say(Boss,"[SC_104605_10]") --�S:�_�I�̪��h�W�N�O�ڪ��ּ�     ��:�P�P�q�_�I�̵h�W����ּ�
				elseif killidtime==30 then
					say(Boss,"[SC_104605_11]") --��:���ڮګ_�I�̪��C���F��        �S: �٨S������A~�C�C���a
				elseif killidtime==90 then
					say(Boss,"[SC_104605_12]") --��:���I���ڪ��F��  �S:�U�@��_�I�̦A���A��
				elseif killidtime==180 then
					say(Boss,"[SC_104605_13]") --��:�h�W��?�`�ȶ�? �S:�u���i�ȱo�٨S�X�{~����
				elseif killidtime==240 then
					say(Boss,"[SC_104605_14]") --�S:�_�I��~�լݬ�~����o�ַP ��:�C�C��i�~�n����
				elseif killidtime==320 then
					say(Boss,"[SC_104605_15]") --�S:�ӵL��F�ڥ��𮧤@�U ��:�����~�C�������~���
				elseif killidtime>=480 then
					say(Boss,"[SC_104605_16]") --�S:���Ӥ[�F���ФF ��:�����I�����o�ӹC���a
					WriteRoleValue(boss,EM_RoleValue_register8,1)---�^��1��BOSS
					killidtime=0
				end
				if open==0 then
					open=1										--�}���F
				 Boss100=Lua_DW_CreateObj("flag",104693,780775,1,0)--���նZ����
					SetModeEx( Boss100  , EM_SetModeType_HideName, false )--�W��
					SetModeEX( Boss100  , EM_SetModeType_Gravity , false )--���O
					SetModeEx( Boss100  , EM_SetModeType_ShowRoleHead, false )--���q�Y����
					SetModeEx( Boss100  , EM_SetModeType_Mark, false )--�аO
					SetModeEx( Boss100  , EM_SetModeType_Move, false )--����
					SetModeEx( Boss100  , EM_SetModeType_Searchenemy, false )--����
					SetModeEx( Boss100  , EM_SetModeType_Fight , false )--�i�������
					SetModeEx( Boss100  , EM_SetModeType_Strikback, false )--����	
					AddToPartition(Boss100,RoomID)
					WriteRoleValue(Boss100,EM_RoleValue_PID,Ctrl)
					WriteRoleValue(Boss100,EM_RoleValue_register1,Boss)
					BeginPlot(Boss100 , "ic_104605_100" , 0)---���նZ��	
				 door2=CreateObjByFlag(105078,780775,3,1)-------�J�f���ת�
					SetModeEx( door2 , EM_SetModeType_Mark, false)			----�i�I��(�_)
					SetModeEx( door2 , EM_SetModeType_ShowRoleHead, false) 	---�Y����(�_)
					SetModeEx( door2 , EM_SetModeType_Obstruct, true) 		---����(�O)
					SetModeEx( door2 , EM_SetModeType_Strikback, false) ---����(�_)
					SetModeEx( door2 , EM_SetModeType_Move, false) ---����	(�_)
					SetModeEx( door2 , EM_SetModeType_Fight, false) ---�i���(�_)
					SetModeEx( door2 , EM_SetModeType_SearchenemyIgnore, false) ---�O�_�Q�j�M(�_)
					SetModeEx( door2 , EM_SetModeType_Searchenemy, false)	---����(�_)
					AddToPartition(door2,RoomID)	
				door1=CreateObjByFlag(104198,780775,4,1)-------��������ת�
					SetModeEx( door1 , EM_SetModeType_Mark, false)			---�i�I��(�_)
					SetModeEx( door1 , EM_SetModeType_ShowRoleHead, false) 		---�Y����(�_)
					SetModeEx( door1 , EM_SetModeType_Obstruct, true) 			--����(�O)
					SetModeEx( door1 , EM_SetModeType_Strikback, false) ---����
					SetModeEx( door1 , EM_SetModeType_Move, false) ---����	
					SetModeEx( door1 , EM_SetModeType_Fight, false) ---�i���
					SetModeEx( door1 , EM_SetModeType_SearchenemyIgnore, false) 	---�O�_�Q�j�M(�_)
					SetModeEx( door1 , EM_SetModeType_Searchenemy, false)			--����(�_)	
					AddToPartition(door1,RoomID)
					ScriptMessage( OwnerID(), -1 , 2 , "[SC_104605_01]" , 2 )	-------�}�����--�_�I�� �ڭ̨Ӫ����C���a �ͩΦ� �ۤv�M�w
					BeginPlot(boss , "ic_104605_02" , 0)				------�R�O���ⰵ�Ʊ�
				end
			end	
			if hatelistcount(boss)==0 and open==1 or BOSS9898==1 and open==1 then			--�}�ԫᤳ���S�H
				if ReadRoleValue( boss , EM_RoleValue_IsDead)==0 then   --���S�� ���a����
					sleep(20)
					DelObj(boss)                                        --�S���ۤv������
					DelObj(door1)										--�R�����ת�
					DelObj(door2)										--�R�����ת�
					DelObj(Boss100)
					local NPCXX = SetSearchAllNPC(RoomID )---���ϰ��NPC
					local ID=GetSearchResult()
					local ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
					for i = 0 , NPCXX do
						ID=GetSearchResult()
						ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
						--say(OwnerID(),"NPCXX"..NPCXX)
						if ID2==104785  then
						DelObj(ID)
						end
					end
					sleep(30)                                           --5��
					Boss=CreateObjByFlag(104605,780775,1,1)           --�A�гy1��				
					AddToPartition(Boss,RoomID)	                                ---�гy�� ���n		
					SetPlot( Boss,"dead","ic_104605_44",0 )	
					WriteRoleValue(Ctrl,EM_RoleValue_PID,Boss)
					WriteRoleValue(Boss,EM_RoleValue_PID,Ctrl)
					BeginPlot(OwnerID() , "ic_104605_04" , 0)
					WriteRoleValue(OwnerID(),EM_RoleValue_register4,0)
					WriteRoleValue(OwnerID(),EM_RoleValue_register10,0)
					open=0					--���m�԰�
					time1=0
					killidtime=0
				elseif	boss44==1 and open==1 then---�����F
					ScriptMessage( OwnerID(), -1 , 2 , "[SC_104605_02]" , 2 )----�ڭ̫�|��O �o��C���W�h���Ū�~~��~~---���`
					DelObj(door)
					DelObj(door1)
					DelObj(door2)
					DelObj(Boss100)
					local NPCXX = SetSearchAllNPC(RoomID )---���ϰ��NPC
					local ID=GetSearchResult()
					local ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
					for i = 0 , NPCXX do
						ID=GetSearchResult()
						ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
						--say(OwnerID(),"NPCXX"..NPCXX)
						if ID2==104785  then
						DelObj(ID)
						end
					end
					WriteRoleValue(OwnerID(),EM_RoleValue_register4,0)
					WriteRoleValue(OwnerID(),EM_RoleValue_register10,0)
					BeginPlot(OwnerID() , "ic_104605_04" , 0)				
					open=0										--���m�԰�
					time1=0
					killidtime=0
					boss44=2
					sleep(100)
					break
				end				
			end	
			if boss44==1  then---�L�ı��F��
					ScriptMessage( OwnerID(), -1 , 2 , "[SC_104605_02]" , 2 )----�ڭ̫�|��O �o��C���W�h���Ū�~~��~~---���`
					DelObj(door)
					WriteRoleValue(OwnerID(),EM_RoleValue_register4,0)
					WriteRoleValue(OwnerID(),EM_RoleValue_register10,0)
					BeginPlot(OwnerID() , "ic_104605_04" , 0)
					open=0	
					time1=0	
					killidtime=0
					boss44=2
					sleep(100)		
					break	
			end	
		end		
	end  
function ic_104605_44()
local Ctrl=ReadRoleValue(OwnerID(),EM_RoleValue_PID)	
WriteRoleValue(Ctrl,EM_RoleValue_register4,1)
end 
function ic_104605_100()---���ե�
local Ctrl=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
local Boss=ReadRoleValue(OwnerID(),EM_RoleValue_register1)
local BOSS9898=GetDistance( OwnerID(), Boss)
	while true do
		BOSS9898=GetDistance( OwnerID(), Boss)
		sleep(10)
		--say(OwnerID(),"BOSS9898="..BOSS9898)
		if  BOSS9898>=600 then
			WriteRoleValue(Ctrl,EM_RoleValue_register10,1)
		end
	end
end	
function ic_104605_02()    ------��AI
		local Ctrl=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
		local Boss=OwnerID()
		local play1x={} ---�H������
		local plays=0   ---�H������
		local Luck=0	----�H�����
		local time2=0 	----�p�ɾ�
		local time3=0 	----�p�ɾ�
		local time4=0 	----�p�ɾ�
		local time5=0 	----�ޯ��
		local time6=0 	----�ޯ��
		local time7=0 	----�ޯ��
		local time8=0 	----�ޯ��
		local time9=0 	----�ޯ��
		local time10=0 	----�ޯ��
		local time11=0	--�i���q��ޯ��
		local time22=0	--�i���q��ޯ��
		local time33=0	
		local time44=0	
		local mob11
		local play44=0
		local Search = SearchRangePlayer ( OwnerID() , 400 )--�䪱�a��
		local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID) 
		local MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )	--Ū����q
		local NowHP = ReadRoleValue(  OwnerID() , EM_RoleValue_HP )     --Ū���ثe��q
		local HPPercent = NowHP / MaxHP	  
		local killidtime1 =0---�g�ɥ�
		while 1 do
			Sleep(10)
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )   ------ ��M�ثe�������ؼ�
			local BossTarget=AttackTarget
			MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )	--Ū����q
			NowHP = ReadRoleValue( OwnerID() , EM_RoleValue_HP )--------Ū���ثe��q
			HPPercent = NowHP / MaxHP	--��q�ʤ���
			killidtime1= ReadRoleValue(OwnerID(),EM_RoleValue_register8)
			if killidtime1==1 and play44==0 then
				AddBuff( OwnerID(),507744,0 ,-1 )
				killidtime1=0
				WriteRoleValue(OwnerID(),EM_RoleValue_register8,0)---��f�U8�k0
				play44=1
			end
				if HPPercent >=0.80   then ---�S
				time2=time2+1
				time3=time3+1
				time4=time4+1
				time10=time10+1
				time7=0 		
				time8=0 		
				time9=0
				time5=0
				time22=0
					if time10==5 then
						ScriptMessage( OwnerID(), -1 , 2 , "[SC_104605_03]" , 2 )----�S:�ѧڥ��}�l �P�A�� ���C�� �঳�X�ӤH�s���O ����
						while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
						sleep(5)
						end
						if hatelistcount(boss)==1 then
							if CheckBuff( BossTarget, 507911 ) == false then	---�T�{�K�B�kBUFF  ������
								local X0, Y0, Z0
								local PlayerName = GetName( BossTarget )
								local MessageString = "[SC_104605_06][$SETVAR1="..PlayerName.."]" 		----�bstring���i�H�q�X���a���W�r
									  ScriptMessage( OwnerID() , -1 , 2 , MessageString , 1 )
								CastSpellLV( OwnerID() , BossTarget , 496363, 0 )
								sleep(30)	
								X0=ReadRoleValue(BossTarget ,EM_RoleValue_X)
								Y0=ReadRoleValue(BossTarget ,EM_RoleValue_Y)
								Z0=ReadRoleValue(BossTarget ,EM_RoleValue_Z)
							if CheckBuff(BossTarget, 507911 ) == true then		
								mob11=CreateObj(104785,X0,Y0,Z0,0,1)-------�����βy
								SetModeEx( mob11 , EM_SetModeType_Strikback, false) ---����(�_)
								SetModeEx( mob11 , EM_SetModeType_Move, false) ---����	(�_)
								SetModeEx( mob11 , EM_SetModeType_Searchenemy, false)--����(�_)
								SetModeEx( mob11 , EM_SetModeType_Mark, true)			---�i�I��(�O)
								SetModeEx( mob11 , EM_SetModeType_ShowRoleHead, true) 		---�Y����(�O)
								SetModeEx( mob11 , EM_SetModeType_Fight, true) ---�i���(�O)
								AddToPartition(mob11,RoomID)
								AddBuff( mob11,506822,15 ,-1 )
								WriteRoleValue( mob11 , EM_RoleValue_register1 , BossTarget )
								SetPlot( mob11,"dead","ic_104605_06",0 )  
								BeginPlot(mob11 , "ic_104605_05" , 0)
							end	
							end	
						elseif hatelistcount(boss)>1 then
								play1x=DW_HateRemain(1)-----------------------�H����--�����Z
								plays=DW_Rand(table.getn(play1x))
							if CheckBuff( play1x[plays], 507911 ) == false then	---�T�{�K�B�kBUFF  ������	
								local X0, Y0, Z0
								local PlayerName = GetName( play1x[plays] )
								local MessageString = "[SC_104605_06][$SETVAR1="..PlayerName .."]" 		----�bstring���i�H�q�X���a���W�r
									  ScriptMessage( OwnerID() , -1 , 2 , MessageString , 1 )
								CastSpellLV( OwnerID() , play1x[plays] , 496363 , 0 )
								sleep(30)
								X0=ReadRoleValue(play1x[plays] ,EM_RoleValue_X)
								Y0=ReadRoleValue(play1x[plays] ,EM_RoleValue_Y)
								Z0=ReadRoleValue(play1x[plays] ,EM_RoleValue_Z)
							if CheckBuff(play1x[plays], 507911 ) == true then	
								mob11=CreateObj(104785,X0,Y0,Z0,0,1)-------�����βy
								SetModeEx( mob11 , EM_SetModeType_Strikback, false) ---����(�_)
								SetModeEx( mob11 , EM_SetModeType_Move, false) ---����	(�_)
								SetModeEx( mob11 , EM_SetModeType_Searchenemy, false)--����(�_)
								SetModeEx( mob11 , EM_SetModeType_Mark, true)			---�i�I��(�O)
								SetModeEx( mob11 , EM_SetModeType_ShowRoleHead, true) 		---�Y����(�O)
								SetModeEx( mob11 , EM_SetModeType_Fight, true) ---�i���(�O)
								AddToPartition(mob11,RoomID)
								AddBuff( mob11,506822,15 ,-1 )
								WriteRoleValue( mob11 , EM_RoleValue_register1 , play1x[plays] )
								SetPlot( mob11,"dead","ic_104605_06",0 )  
								BeginPlot(mob11 , "ic_104605_05" , 0)
							end	
							end	  
						end	
					end
					if time4>=18 then--�K�B�k---�H��1�H
						while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
							sleep(5)
						end
						if hatelistcount(boss)==1 then
							if CheckBuff( BossTarget, 507911 ) == false then	---�T�{�K�B�kBUFF  ������
								local X0, Y0, Z0
								local PlayerName = GetName( BossTarget )
								local MessageString = "[SC_104605_06][$SETVAR1="..PlayerName.."]" 		----�bstring���i�H�q�X���a���W�r
								ScriptMessage( OwnerID() , -1 , 2 , MessageString , 1 )
								CastSpellLV( OwnerID() , BossTarget , 496363, 0 )
								sleep(30)	
								X0=ReadRoleValue(BossTarget ,EM_RoleValue_X)
								Y0=ReadRoleValue(BossTarget ,EM_RoleValue_Y)
								Z0=ReadRoleValue(BossTarget ,EM_RoleValue_Z)
							if CheckBuff(BossTarget, 507911 ) == true then		
								mob11=CreateObj(104785,X0,Y0,Z0,0,1)-------�����βy
								SetModeEx( mob11 , EM_SetModeType_Strikback, false) ---����(�_)
								SetModeEx( mob11 , EM_SetModeType_Move, false) ---����	(�_)
								SetModeEx( mob11 , EM_SetModeType_Searchenemy, false)--����(�_)
								SetModeEx( mob11 , EM_SetModeType_Mark, true)			---�i�I��(�O)
								SetModeEx( mob11 , EM_SetModeType_ShowRoleHead, true) 		---�Y����(�O)
								SetModeEx( mob11 , EM_SetModeType_Fight, true) ---�i���(�O)
								AddToPartition(mob11,RoomID)
								AddBuff( mob11,506822,15 ,-1 )
								WriteRoleValue( mob11 , EM_RoleValue_register1 , BossTarget )
								SetPlot( mob11,"dead","ic_104605_06",0 )  
								BeginPlot(mob11 , "ic_104605_05" , 0)
							end	
								time4=0
							elseif CheckBuff( BossTarget, 507911 ) == true then	
								time4=0
							end	
						elseif hatelistcount(boss)>1 then
								play1x=DW_HateRemain(1)-----------------------�H����--�����Z
								plays=DW_Rand(table.getn(play1x))
							if CheckBuff( play1x[plays], 507911 ) == false then	---�T�{�K�B�kBUFF  ������	
								local X0, Y0, Z0
								local PlayerName = GetName( play1x[plays] )
								local MessageString = "[SC_104605_06][$SETVAR1="..PlayerName .."]" 		----�bstring���i�H�q�X���a���W�r
								ScriptMessage( OwnerID() , -1 , 2 , MessageString , 1 )
								CastSpellLV( OwnerID() , play1x[plays] , 496363 , 0 )
								sleep(30)
								X0=ReadRoleValue(play1x[plays] ,EM_RoleValue_X)
								Y0=ReadRoleValue(play1x[plays] ,EM_RoleValue_Y)
								Z0=ReadRoleValue(play1x[plays] ,EM_RoleValue_Z)
							if CheckBuff(play1x[plays], 507911 ) == true then		
								mob11=CreateObj(104785,X0,Y0,Z0,0,1)-------�����βy
								SetModeEx( mob11 , EM_SetModeType_Strikback, false) ---����(�_)
								SetModeEx( mob11 , EM_SetModeType_Move, false) ---����	(�_)
								SetModeEx( mob11 , EM_SetModeType_Searchenemy, false)--����(�_)
								SetModeEx( mob11 , EM_SetModeType_Mark, true)			---�i�I��(�O)
								SetModeEx( mob11 , EM_SetModeType_ShowRoleHead, true) 		---�Y����(�O)
								SetModeEx( mob11 , EM_SetModeType_Fight, true) ---�i���(�O)
								AddToPartition(mob11,RoomID)
								AddBuff( mob11,506822,15 ,-1 )
								WriteRoleValue( mob11 , EM_RoleValue_register1 , play1x[plays] )
								SetPlot( mob11,"dead","ic_104605_06",0 )  
								BeginPlot(mob11 , "ic_104605_05" , 0)
							end	
								time4=0
							end	
						end	
					end
					if time3>=11 then--�d������--��1���� �����k0(�Ȯ�)
						while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
							sleep(5)
						end
						if hatelistcount(boss)==1 then
							local PlayerName = GetName( BossTarget )
							local MessageString = "[SC_104605_08][$SETVAR1="..PlayerName.."]" 		----�bstring���i�H�q�X���a���W�r
									  ScriptMessage( OwnerID() , -1 , 2 , MessageString , 1 )
							CastSpellLV( OwnerID() , BossTarget , 496362 , 200 )
							sleep(30)
							time3=0
						elseif hatelistcount(boss)>1 then
							play1x=DW_HateRemain(1)-----------------------�H����--�����Z
							plays=DW_Rand(table.getn(play1x))
							local PlayerName = GetName( play1x[plays] )
							local MessageString = "[SC_104605_08][$SETVAR1="..PlayerName .."]" 		----�bstring���i�H�q�X���a���W�r
									  ScriptMessage( OwnerID() , -1 , 2 , MessageString , 1 )
							CastSpellLV( OwnerID() , play1x[plays] , 496362 , 200 )
							sleep(30)
							time3=0
						end	
					end
					if time2>=5 then--����ޯ�--��1����
						while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
							sleep(5)
						end
						CastSpellLV( OwnerID() , BossTarget , 496361, 0 )----����ޯ�
						sleep(10)
						time2=0
					end
				end
				if HPPercent <0.8 and HPPercent >=0.60 then---��
				time9=time9+1
				time7=time7+1
				time8=time8+1
				time22=time22+1
				time2=0 	
				time3=0 	
				time4=0 
				time3=0 
				time11=0
				time33=0 
					if time5==0 then--�ඥ�q��1��
						ScriptMessage( OwnerID(), -1 , 2 , "[SC_104605_04]" , 2 )----��:���ڨӧa �C�C��i �~�O�̦n�����C��
						while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
							sleep(5)
						end
						CastSpellLV( OwnerID() , OwnerID() , 496364, 7 )----����DOT
						time5=1
					end
					if time22==5 then
						if hatelistcount(boss)==1 then
								play1x=DW_HateRemain(0)-----------------------�H����
								plays=DW_Rand(table.getn(play1x))
								while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
								sleep(5)
								end
								if CheckBuff( play1x[plays], 507911 ) == false then	---�T�{�K�B�kBUFF  ������
									local PlayerName = GetName( play1x[plays] )
									local MessageString = "[SC_104605_07][$SETVAR1="..PlayerName .."]" 		----�bstring���i�H�q�X���a���W�r
											  ScriptMessage( OwnerID() , -1 , 2 , MessageString , 1 )
									sleep(20)		  
									CastSpellLV( OwnerID() , play1x[plays] , 496366 , 7 )
									sleep(30)
								end	
						elseif hatelistcount(boss)>1 then
							play1x=DW_HateRemain(1)-----------------------�H����
								plays=DW_Rand(table.getn(play1x))
								while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
								sleep(5)
								end
								if CheckBuff( play1x[plays], 507911 ) == false then	---�T�{�K�B�kBUFF  ������
									local PlayerName = GetName( play1x[plays] )
									local MessageString = "[SC_104605_07][$SETVAR1="..PlayerName .."]" 		----�bstring���i�H�q�X���a���W�r
											  ScriptMessage( OwnerID() , -1 , 2 , MessageString , 1 )
									sleep(20)		  
									CastSpellLV( OwnerID() , play1x[plays] , 496366 , 7 )
									sleep(30)
								end	
						end	
					end
					if time9>=21 then--�w��--�H��1�H
						if hatelistcount(boss)==1 then
								play1x=DW_HateRemain(0)-----------------------�H����
								plays=DW_Rand(table.getn(play1x))
								while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
								sleep(5)
								end
								if CheckBuff( play1x[plays], 507911 ) == false then	---�T�{�K�B�kBUFF  ������
								local PlayerName = GetName( play1x[plays] )
								local MessageString = "[SC_104605_07][$SETVAR1="..PlayerName.."]" 		----�bstring���i�H�q�X���a���W�r
											  ScriptMessage( OwnerID() , -1 , 2 , MessageString , 1 )
									sleep(20)		  
									CastSpellLV( OwnerID() , play1x[plays] , 496366 , 7 )
									sleep(30)
									time9=0
								end	
						elseif hatelistcount(boss)>1 then
								play1x=DW_HateRemain(1)-----------------------�H����
								plays=DW_Rand(table.getn(play1x))
								while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
								sleep(5)
								end
								if CheckBuff( play1x[plays], 507911 ) == false then	---�T�{�K�B�kBUFF  ������
								local PlayerName = GetName( play1x[plays] )
								local MessageString = "[SC_104605_07][$SETVAR1="..PlayerName.."]" 		----�bstring���i�H�q�X���a���W�r
											  ScriptMessage( OwnerID() , -1 , 2 , MessageString , 1 )
									sleep(20)		  
									CastSpellLV( OwnerID() , play1x[plays] , 496366 , 7 )
									sleep(30)
									time9=0
								end	
						end	
					end
					if time7>=15 then--�H�H����
					while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
						sleep(5)
					end
						CastSpellLV( OwnerID() , OwnerID() , 496364,9)----����DOT
						time7=0
					end
					if time8>=11 then---���鮣��
						ScriptMessage( OwnerID(), -1 , 2 , "[SC_104605_09]" , 2 )----���� ���� �����A�̷P���ݬݤF
						play1x=DW_HateRemain(0)-----------------------�H����
						plays=DW_Rand(table.getn(play1x))
						while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
							sleep(5)
						end
						sleep(10)
						CastSpellLV( OwnerID() , OwnerID() , 496365,9)----�H��3�H�]�a
						sleep(10)
						time8=0
					end
				end
				if HPPercent <0.60 then--�S�̤@�_��
					time2=time2+1
					time3=time3+1
					time4=time4+1
					time6=time6+1
					time11=time11+1
					time33=time33+1
					--say(OwnerID(),"time11="..time11)
					--say(OwnerID(),"time2="..time2)
					if time44==0 then--�K�B�k---�H��1�H
						while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
						sleep(5)
						end
						CastSpellLV( OwnerID() , OwnerID() , 496243,9)----����DOT
						sleep(10)	
						while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
							sleep(5)
						end
						if hatelistcount(boss)==1 then
							if CheckBuff( BossTarget, 507911 ) == false then	---�T�{�K�B�kBUFF  ������
								CastSpellLV( OwnerID() , BossTarget , 496363, 0 )
								sleep(30)	
								local X0, Y0, Z0
								local PlayerName = GetName( BossTarget )
								local MessageString = "[SC_104605_06][$SETVAR1="..PlayerName.."]" 		----�bstring���i�H�q�X���a���W�r
									  ScriptMessage( OwnerID() , -1 , 2 , MessageString , 1 )	
								X0=ReadRoleValue(BossTarget ,EM_RoleValue_X)
								Y0=ReadRoleValue(BossTarget ,EM_RoleValue_Y)
								Z0=ReadRoleValue(BossTarget ,EM_RoleValue_Z)
							if CheckBuff(BossTarget, 507911 ) == true then		
								mob11=CreateObj(104785,X0,Y0,Z0,0,1)-------�����βy
								SetModeEx( mob11 , EM_SetModeType_Strikback, false) ---����(�_)
								SetModeEx( mob11 , EM_SetModeType_Move, false) ---����	(�_)
								SetModeEx( mob11 , EM_SetModeType_Searchenemy, false)--����(�_)
								SetModeEx( mob11 , EM_SetModeType_Mark, true)			---�i�I��(�O)
								SetModeEx( mob11 , EM_SetModeType_ShowRoleHead, true) 		---�Y����(�O)
								SetModeEx( mob11 , EM_SetModeType_Fight, true) ---�i���(�O)
								AddToPartition(mob11,RoomID)
								AddBuff( mob11,506822,3,-1 )
								WriteRoleValue( mob11 , EM_RoleValue_register1 , BossTarget )
								SetPlot( mob11,"dead","ic_104605_06",0 )  
								BeginPlot(mob11 , "ic_104605_05" , 0)
							end	
								time44=1
							elseif CheckBuff( BossTarget, 507911 ) == true then	
								time44=1	
							end	
						elseif hatelistcount(boss)>1 then
								play1x=DW_HateRemain(1)-----------------------�H����--�����Z
								plays=DW_Rand(table.getn(play1x))
							if CheckBuff( play1x[plays], 507911 ) == false then	---�T�{�K�B�kBUFF  ������	
								--CastSpellLV( OwnerID() , OwnerID() , 496243,9)----����DOT
								--sleep(10)
								CastSpellLV( OwnerID() , play1x[plays] , 496363 , 0 )
								sleep(30)
								local X0, Y0, Z0
								local PlayerName = GetName( play1x[plays] )
								local MessageString = "[SC_104605_06][$SETVAR1="..PlayerName .."]" 		----�bstring���i�H�q�X���a���W�r
									  ScriptMessage( OwnerID() , -1 , 2 , MessageString , 1 )	
									X0=ReadRoleValue(play1x[plays] ,EM_RoleValue_X)
									Y0=ReadRoleValue(play1x[plays] ,EM_RoleValue_Y)
									Z0=ReadRoleValue(play1x[plays] ,EM_RoleValue_Z)
								if CheckBuff( play1x[plays], 507911 ) == true then	
									mob11=CreateObj(104785,X0,Y0,Z0,0,1)-------�����βy
									SetModeEx( mob11 , EM_SetModeType_Strikback, false) ---����(�_)
									SetModeEx( mob11 , EM_SetModeType_Move, false) ---����	(�_)
									SetModeEx( mob11 , EM_SetModeType_Searchenemy, false)--����(�_)
									SetModeEx( mob11 , EM_SetModeType_Mark, true)			---�i�I��(�O)
									SetModeEx( mob11 , EM_SetModeType_ShowRoleHead, true) 		---�Y����(�O)
									SetModeEx( mob11 , EM_SetModeType_Fight, true) ---�i���(�O)
									AddToPartition(mob11,RoomID)
									AddBuff( mob11,506822,3 ,-1 )
									WriteRoleValue( mob11 , EM_RoleValue_register1 , play1x[plays] )
									SetPlot( mob11,"dead","ic_104605_06",0 )  
									BeginPlot(mob11 , "ic_104605_05" , 0)
								end	
								time44=1
							elseif CheckBuff( BossTarget, 507911 ) == true then	
								time44=1		
							end	
						end	
					elseif time44==1 then--�w��--�H��1�H
						if hatelistcount(boss)==1 then
								while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
								sleep(5)
								end
								ScriptMessage( OwnerID(), -1 , 2 , "[SC_104605_09]" , 2 )----���� ���� �����A�̷P���ݬݤF
								sleep(10)
								CastSpellLV( OwnerID() , OwnerID() , 496365,1)----�H��3�H�]�a
								sleep(30)	
									play1x=DW_HateRemain(0)-----------------------�H����
									plays=DW_Rand(table.getn(play1x))
								while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
								sleep(5)
								end
								if CheckBuff( play1x[plays], 507911 ) == false then	---�T�{�K�B�kBUFF  ������	
								local PlayerName = GetName( play1x[plays] )
								local MessageString = "[SC_104605_07][$SETVAR1="..PlayerName.."]" 		----�bstring���i�H�q�X���a���W�r
											  ScriptMessage( OwnerID() , -1 , 2 , MessageString , 1 )
									sleep(20)		  
									CastSpellLV( OwnerID() , play1x[plays] , 496366 ,7)
									sleep(30)
									time44=3
								end	
						elseif hatelistcount(boss)>1 then	
								while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
								sleep(5)
								end
								ScriptMessage( OwnerID(), -1 , 2 , "[SC_104605_09]" , 2 )----���� ���� �����A�̷P���ݬݤF
								CastSpellLV( OwnerID() , OwnerID() , 496365,1)----�H��3�H�]�a
								sleep(30)	
									play1x=DW_HateRemain(1)-----------------------�H����
									plays=DW_Rand(table.getn(play1x))
								while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
								sleep(5)
								end
								if CheckBuff( play1x[plays], 507911 ) == false then	---�T�{�K�B�kBUFF  ������	
								local PlayerName = GetName( play1x[plays] )
								local MessageString = "[SC_104605_07][$SETVAR1="..PlayerName.."]" 		----�bstring���i�H�q�X���a���W�r
											  ScriptMessage( OwnerID() , -1 , 2 , MessageString , 1 )
									sleep(20)		  
									CastSpellLV( OwnerID() , play1x[plays] , 496366 ,7)
									sleep(30)
									time44=3
								end	
						
						end	
					end
					if time6>=27 then--�K�B�k---�H��1�H
						while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
						sleep(5)
						end
						CastSpellLV( OwnerID() , OwnerID() , 496243,9)----����DOT
						sleep(10)
						while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
							sleep(5)
						end
						if hatelistcount(boss)==1 then
							if CheckBuff( BossTarget, 507911 ) == false then	---�T�{�K�B�kBUFF  ������
								local X0, Y0, Z0
								local PlayerName = GetName( BossTarget )
								local MessageString = "[SC_104605_06][$SETVAR1="..PlayerName.."]" 		----�bstring���i�H�q�X���a���W�r
									  ScriptMessage( OwnerID() , -1 , 2 , MessageString , 1 )
								CastSpellLV( OwnerID() , BossTarget , 496363, 0 )
								sleep(30)	
								X0=ReadRoleValue(BossTarget ,EM_RoleValue_X)
								Y0=ReadRoleValue(BossTarget ,EM_RoleValue_Y)
								Z0=ReadRoleValue(BossTarget ,EM_RoleValue_Z)
							if CheckBuff(BossTarget, 507911 ) == true then		
								mob11=CreateObj(104785,X0,Y0,Z0,0,1)-------�����βy
								SetModeEx( mob11 , EM_SetModeType_Strikback, false) ---����(�_)
								SetModeEx( mob11 , EM_SetModeType_Move, false) ---����	(�_)
								SetModeEx( mob11 , EM_SetModeType_Searchenemy, false)--����(�_)
								SetModeEx( mob11 , EM_SetModeType_Mark, true)			---�i�I��(�O)
								SetModeEx( mob11 , EM_SetModeType_ShowRoleHead, true) 		---�Y����(�O)
								SetModeEx( mob11 , EM_SetModeType_Fight, true) ---�i���(�O)
								AddToPartition(mob11,RoomID)
								AddBuff( mob11,506822,3,-1 )
								WriteRoleValue( mob11 , EM_RoleValue_register1 , BossTarget )
								SetPlot( mob11,"dead","ic_104605_06",0 )  
								BeginPlot(mob11 , "ic_104605_05" , 0)
							end	
								time6=0
							elseif CheckBuff( BossTarget, 507911 ) == true then	
								time6=0	
							end	
						elseif hatelistcount(boss)>1 then
								play1x=DW_HateRemain(1)-----------------------�H����--�����Z
								plays=DW_Rand(table.getn(play1x))
							if CheckBuff( play1x[plays], 507911 ) == false then	---�T�{�K�B�kBUFF  ������	
								local X0, Y0, Z0
								local PlayerName = GetName( play1x[plays] )
								local MessageString = "[SC_104605_06][$SETVAR1="..PlayerName .."]" 		----�bstring���i�H�q�X���a���W�r
									  ScriptMessage( OwnerID() , -1 , 2 , MessageString , 1 )
								CastSpellLV( OwnerID() , play1x[plays] , 496363 , 0 )
								sleep(30)	
								X0=ReadRoleValue(play1x[plays] ,EM_RoleValue_X)
								Y0=ReadRoleValue(play1x[plays] ,EM_RoleValue_Y)
								Z0=ReadRoleValue(play1x[plays] ,EM_RoleValue_Z)
							if CheckBuff( play1x[plays], 507911 ) == true then	
								mob11=CreateObj(104785,X0,Y0,Z0,0,1)-------�����βy
								SetModeEx( mob11 , EM_SetModeType_Strikback, false) ---����(�_)
								SetModeEx( mob11 , EM_SetModeType_Move, false) ---����	(�_)
								SetModeEx( mob11 , EM_SetModeType_Searchenemy, false)--����(�_)
								SetModeEx( mob11 , EM_SetModeType_Mark, true)			---�i�I��(�O)
								SetModeEx( mob11 , EM_SetModeType_ShowRoleHead, true) 		---�Y����(�O)
								SetModeEx( mob11 , EM_SetModeType_Fight, true) ---�i���(�O)
								AddToPartition(mob11,RoomID)
								AddBuff( mob11,506822,3,-1 )
								WriteRoleValue( mob11 , EM_RoleValue_register1 , play1x[plays] )
								SetPlot( mob11,"dead","ic_104605_06",0 )  
								BeginPlot(mob11 , "ic_104605_05" , 0)
							end	
								time6=0	
							end		
						end	
					end
					if time4>=17 then--�w��--�H��1�H
						if hatelistcount(boss)==1 then
									play1x=DW_HateRemain(0)-----------------------�H����
									plays=DW_Rand(table.getn(play1x))
									while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
									sleep(5)
									end
									ScriptMessage( OwnerID(), -1 , 2 , "[SC_104605_09]" , 2 )----���� ���� �����A�̷P���ݬݤF
									sleep(20)
									CastSpellLV( OwnerID() , OwnerID() , 496365,1)----�H��3�H�]�a
									sleep(30)
									while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
									sleep(5)
									end
									if CheckBuff( play1x[plays], 507911 ) == false then	---�T�{�K�B�kBUFF  ������
										local PlayerName = GetName( play1x[plays] )
										local MessageString = "[SC_104605_07][$SETVAR1="..PlayerName .."]" 		----�bstring���i�H�q�X���a���W�r
												  ScriptMessage( OwnerID() , -1 , 2 , MessageString , 1 )
										sleep(20)		  
										CastSpellLV( OwnerID() , play1x[plays] , 496366 ,7)
										sleep(30)
										time4=0
									end	
						elseif hatelistcount(boss)>1 then	
									play1x=DW_HateRemain(1)-----------------------�H����
									plays=DW_Rand(table.getn(play1x))
									while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
									sleep(5)
									end
									ScriptMessage( OwnerID(), -1 , 2 , "[SC_104605_09]" , 2 )----���� ���� �����A�̷P���ݬݤF
									sleep(20)
									CastSpellLV( OwnerID() , OwnerID() , 496365,1)----�H��3�H�]�a
									sleep(30)
									while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
									sleep(5)
									end
									if CheckBuff( play1x[plays], 507911 ) == false then	---�T�{�K�B�kBUFF  ������
										local PlayerName = GetName( play1x[plays] )
										local MessageString = "[SC_104605_07][$SETVAR1="..PlayerName .."]" 		----�bstring���i�H�q�X���a���W�r
												  ScriptMessage( OwnerID() , -1 , 2 , MessageString , 1 )
										sleep(20)		  
										CastSpellLV( OwnerID() , play1x[plays] , 496366 ,7)
										sleep(30)
										time4=0
									end	
									
						end		
					end
				end 
				if time3>=12 then--�d������--��1���� �����k0(�Ȯ�)
						while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
						sleep(5)
						end
					if hatelistcount(boss)==1 then
							local PlayerName = GetName( BossTarget )
							local MessageString = "[SC_104605_08][$SETVAR1="..PlayerName.."]" 		----�bstring���i�H�q�X���a���W�r
							ScriptMessage( OwnerID() , -1 , 2 , MessageString , 1 )
							CastSpellLV( OwnerID() , BossTarget , 496362 , 200 )
							sleep(30)
							time3=0
					elseif hatelistcount(boss)>1 then
							play1x=DW_HateRemain(1)-----------------------�H����--�����Z
							plays=DW_Rand(table.getn(play1x))
							local PlayerName = GetName( play1x[plays] )
							local MessageString = "[SC_104605_08][$SETVAR1="..PlayerName .."]" 		----�bstring���i�H�q�X���a���W�r
									  ScriptMessage( OwnerID() , -1 , 2 , MessageString , 1 )
							CastSpellLV( OwnerID() , play1x[plays] , 496362 , 200 )
							sleep(30)
							time3=0
					end		
				end
				if time33>=10 then---���鮣��
					while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
						sleep(5)
					end
						CastSpellLV( OwnerID() , BossTarget , 496361,0)----����ޯ�
						sleep(10)
						time33=0
					end	
				end
end
	function ic_104605_04()----�R��BUFF��
		local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
		local TempPlayer = SetSearchAllPlayer(RoomID)----��ϰ�Ҧ����a
		local ThesePlayer = {}
		for i=1,TempPlayer do
			ThesePlayer[i] = GetSearchResult() -- ���Ȧs��
			if CheckID( ThesePlayer[i] ) == true and 
				ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and 
				ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then
					--�ˬd���a�O���O�٦b�F�ˬd�O�_���`
				if CheckBuff( ThesePlayer[i] , 507908 ) == true 
				or CheckBuff( ThesePlayer[i] , 507911 ) == true 
				or CheckBuff( ThesePlayer[i] , 507907 ) == true 
				or CheckBuff( ThesePlayer[i] , 507736 ) == true
				or CheckBuff( ThesePlayer[i] , 508381 ) == true	then
					CancelBuff(ThesePlayer[i], 507908)
					CancelBuff(ThesePlayer[i], 507911)
					CancelBuff(ThesePlayer[i], 507907)
					CancelBuff(ThesePlayer[i], 507934)
					CancelBuff(ThesePlayer[i], 507736)
					CancelBuff(ThesePlayer[i], 508381)
				end
			end					
		end
	end
	function ic_104605_05()
		local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
		local player = ReadRoleValue( OwnerID() , EM_RoleValue_register1 )
		local skillLV1=0 ---ReadRoleValue( OwnerID() , EM_RoleValue_register4 )
		local skillLV2=0 
		--local yy = Lua_BuffPosSearch( player, 507934 )
		--local xx=0
		local time1=0
		while 1 do
			--say(OwnerID(),"skillLV1="..skillLV1)
			--say(OwnerID(),"skillLV2="..skillLV2)
			if time1==0 then
				if	ReadRoleValue( player , EM_RoleValue_IsDead ) == 0 then
					CastSpellLV( OwnerID() , player , 496368,23)
					WriteRoleValue(  OwnerID() , EM_RoleValue_register4 ,17)
					--yy= Lua_BuffPosSearch( player , 507934 )
					--xx=BuffInfo( player, yy , EM_BuffInfoType_Power )---Ū���ޯ൥��
					--CastSpellLV( OwnerID() , player , 496368,XX+2)
					time1=1
				elseif	ReadRoleValue( player , EM_RoleValue_IsDead ) == 1 then
						DelObj(OwnerID())
				end
			elseif time1==1 then
				skillLV1=ReadRoleValue( OwnerID() , EM_RoleValue_register4 )
				sleep(10)
				skillLV2=skillLV1+6
				--yy= Lua_BuffPosSearch( player , 507934 )
				--xx=BuffInfo( player, yy , EM_BuffInfoType_Power )---Ū���ޯ൥��
				if	ReadRoleValue( player , EM_RoleValue_IsDead ) == 0 then	
					CastSpellLV( OwnerID() , player , 496368,skillLV2)
					WriteRoleValue(  OwnerID() , EM_RoleValue_register4 , skillLV2 )
				elseif	ReadRoleValue( player , EM_RoleValue_IsDead ) == 1 then	
					DelObj(OwnerID())
				end	
			end	
			sleep(10)
		end
	end
	function ic_104605_06()
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local player = ReadRoleValue( OwnerID() , EM_RoleValue_register1 )	
			CancelBuff(player, 507934)
			sleep(1)
			CancelBuff(player, 507911)
			sleep(1)
			DelObj(OwnerID())
			sleep(10)
	end