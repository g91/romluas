function lua_skwerl_easter_test()

	local player = OwnerID()
	local RoomID = ReadRoleValue(player, EM_RoleValue_RoomID )
	local Obj = Role:new( player )  
	local BaseX = Obj :X()
 	local BaseY = Obj :Y()
 	local BaseZ = Obj :Z()
	local BaseDir = Obj:Dir()
	local bunnycontrol = CreateObj( 120326 , BaseX , BaseY , BaseZ , BaseDir , 1 ) --�Хߨߤl������
	local RoleName = GetName( OwnerID() ) 
	SetModeEx( bunnycontrol  , EM_SetModeType_Mark, false )--�аO
	SetModeEx( bunnycontrol , EM_SetModeType_NotShowHPMP , true)
	AddToPartition( bunnycontrol , RoomID )
	CallPlot(bunnycontrol , "lua_skwerl_easter_bunnycontrol" , player) 
	Cancelbuff(player,  622241)
	Cancelbuff(player, 622249)--��ߤl�w�t
	Cancelbuff(player, 622237)-- ���y�H�[�t
	Cancelbuff(player, 622229) --���������
--	Cancelbuff(player, 622226)--���y�H�ͳJ
	addbuff(player, 622206, 1, 5) --bunny cooldown buff
	addbuff(player, 622233,1,5)  --�ؼеL��
	addbuff(player, 622183, 1, 5)--�L�ĮĪG


	Addbuff(player, 622186, 1, 180) --�ܨ������ߤl
	Addbuff(Player, 622247, 1, 180) --�ߤl�o��
	ScriptMessage(player, player, 2, "[SKWERL_EASTER_01]", C_SYSTEM );
end

function lua_skwerl_easter_test2()
--	Addbuff(OwnerID(), 622226, 1, -1)
	Addbuff(OwnerID(), 622229, 1, -1)
 	Addbuff(OwnerID(), 622259, 1, -1) 
end

function lua_skwerl_easter_iff()
	addbuff(OwnerID(), 622260, 1, 190)
end

function lua_skwerl_easter_test3()
	Lua_Hao_Round_wall( OwnerID() , 120559 , 45 , 200 , 0 ) --����
end

function lua_skwerl_easter_backdoor()
	local OID= OwnerID()
	local NPC= Lua_Hao_NPC_Closest_Search( OID , 120549 ,20 )
	local NPC2= Lua_Hao_NPC_Closest_Search( OID , 120584 ,20 )
	say(npc, "test")
	say(npc2, "test") 
	WriteRoleValue(NPC , EM_RoleValue_Register+6, 1 ) 
	WriteRoleValue(NPC2 , EM_RoleValue_Register+2, 1 ) 
 end


function lua_skwerl_easter_backdoor_off()
	local OID= OwnerID()
	local NPC= Lua_Hao_NPC_Closest_Search( OID , 120549 ,20 )
	local NPC2= Lua_Hao_NPC_Closest_Search( OID , 120584 ,20 )
	say(npc, "test off")
	say(npc2, "test off") 
	WriteRoleValue(NPC , EM_RoleValue_
+6, 0 ) 
	WriteRoleValue(NPC2 , EM_RoleValue_Register+2, 0 ) 
 end


function lua_skwerl_easter_backdoor2()
	local OID= OwnerID()
	local NPC= Lua_Hao_NPC_Closest_Search( OID , 120549 ,300 )
	say(npc, "test") 
	WriteRoleValue(NPC , EM_RoleValue_Register+5, 9) 

	local backdoor
	backdoor= ReadRoleValue( npc , EM_RoleValue_Register+5  )
	say(npc, "current"..backdoor) 

end



function lua_skwerl_easter_boxtest()
	local npc= OwnerID()
	local monster
	local random=Rand(6) -- (0, 1, 2, 3, 4, 5)
	local RoomID = ReadRoleValue( npc , EM_RoleValue_RoomID )
	Monster = CreateObjByFlag( 120548, 781114 , random  , 1 )		-- �b�X�Хͩ�(���ͪ���ID , ���ͺX�lID , �X�l��mID , ���ͼƶq)
	SetModeEx( Monster  , EM_SetModeType_Mark, false )--�аO
	AddToPartition( Monster , RoomID )

end


function lua_skwerl_easter_bunnycontrol(player)
--	say(OwnerID(), player)
	for i=1, 1800, 1 do
		if i%10==0 then --�C�@��[�@����
			addbuff(player, 622228,0,300)
		end
		--test stat--
		if i%10==0 then --�C�@��[�@����
			addbuff(player, 622318,0,300)
		end
		--test stat--

		if i>=1 and i<100 then  ---�ߤl���t���u��
			local x= 35-i
			Cancelbuff(player, 622212)
			addbuff(player, 622212, x, 180)
		end
		if i==150 then
			if CountBodyItem(player, 530895)==0 then-- �ˬd�O�_�����ߤl���N�A�p�G�S���A�����N
				givebodyitem(player, 530895, 1)
			end
		end

		if i>200 and i<400 then --�ߤl�ܺC
			local y=i-200
			Cancelbuff(player, 622213)
			addbuff(player, 622213, 2*y, 180) --max level at 400
		end

		if checkbuff(player, 622186)==false then
			Cancelbuff(player, 622212) --��[�tbuff
			Cancelbuff(player, 622213) --���tbuff
			sleep(5)
			Cancelbuff(Player, 622193)----��Ĩ�buff
			sleep(5)
			Cancelbuff(Player, 622193)--��Ĩ�buff
			DelObj(OwnerID())
			break
		end
		SysCastSpellLv(player, player,499267,1) --���y�H
--		SysCastSpellLv(player, player,499263,1) --�����J --experimental
		sleep(1)
	end
	DelObj(OwnerID())
end





function lua_skwerl_easter_touch() --�ߤl�}��汵
	local Owner=OwnerID()
	local Target=TargetID()
	if checkbuff(target, 622232)==true  or checkbuff(target, 622260)==false then	--�ˬd �˦a���a�����ߤl 622260==���O�C�������a
		return false
	else
		local teststat= FN_CountBuffLevel(Owner, 622318)+1
		local name= GetName(Owner )
		ScriptMessage(Owner, Owner, 2, "[SKWERL_EASTER_05]", 0); --�A�Q���F!
		ScriptMessage(Owner,0,1, name.."[SKWERL_EASTER_11][$SETVAR1="..teststat.."]", C_SYSTEM) --���ߤl�ͦs�ɶ�
	--	say(Owner, teststat)
		--for ex-bunny player--(�Q��쪺�ߤl)
		cancelbuff(Owner, 622186) 
		AddBuff(Owner, 622206, 1, 5) -- bunny cooldown
		Cancelbuff(Owner, 622212) --��[�tbuff
		Cancelbuff(Owner, 622213) --���tbuff
		CancelBuff(Owner, 622183)--��Ĩ�buff
		CancelBuff(Owner, 622193)--��Ĩ�}��buff
		Cancelbuff(Owner, 622318) --cancel test stat
	--	Addbuff(Owner, 622226, 1, -1)--�y�H�ͳJ
		Addbuff(Owner, 622229, 1, 180) --��������
		Cancelbuff(Owner, 622247)--��ߤl�o��
		Cancelbuff(Owner, 622249)--��ߤl�w�t
		--for new bunny player--(�s�ߤl)
		Cancelbuff(Target, 622241)--���y�H��t
		Cancelbuff(Target, 622233)--���y�H�L��
		Cancelbuff(Target, 622237)-- ���y�H�[�t
		Cancelbuff(Target, 622229) --���������
	--	Cancelbuff(Target, 622226)--���y�H�ͳJ
		addbuff(Target, 622206, 1, 5) --bunny cooldown buff
		addbuff(Target, 622183, 1, 5) --�ߤl�L�ĮĪG
		CallPlot(Target, "lua_skwerl_easter_test" ) 
	--	SysCastSpellLv( Target, Target, 499275,1 ) --������H���˦a
	end
end

function lua_skwerl_easter_touchdetect()
	say(targetID(), "target")
	say(ownerID(), "owner")
end


function lua_skwerl_easter_safetyswitch()
	local Caster= OwnerID()
	local target= TargetID()
	if Caster== target then  ---���ॴ�ۤv
		return false
	end
	
	if checkbuff(Caster, 622206)== true then
		return false
	end
	
	if checkbuff(target, 622206)== true then
		return false
	end

	if checkbuff(target, 622260)==false then --���O�C�������a
		return false
	end
end



----------------------�����t��-----
function lua_skwerl_easter_explosion()
local Player = TargetID()
local Mine = OwnerID()
local bufflv= FN_CountBuffLevel(Player, 621916)+1
	
	local Obj_X = ReadRoleValue ( Mine, EM_RoleValue_X)
	local Obj_Y = ReadRoleValue ( Mine, EM_RoleValue_Y)
	local Obj_Z = ReadRoleValue ( Mine, EM_RoleValue_Z)   ---------Ū���ª�BOSS�������y�Ц�m
	
	Sleep (13)

	SysCastSpellLv( Player, Mine, 499275,1 )
	sleep ( 10 )
end


function lua_skwerl_easter_explosionhit()  --�p�G���a�Q����  --experiment
	local score
	local target=targetID()
	local Player=OwnerID()
	if  checkbuff (targetID(), 622260)== false then --���O���ʪ��a
	return false                                                                      --�L�k�����D���ʪ��a
	end

	if checkbuff(target,622186)==true then
		addbuff(target, 622249, 0, 7)  --bunny slows down when hit
		addbuff(player, 622234,0,180) ----�@��R������
		addbuff(player, 622235,0,180) ----�@��R������	


	else 
		SysCastSpellLv(target, Player, 499108, 1 )--�o��q���ĪG
		addbuff(target, 622241,1,5)   --�ؼнw�t
		addbuff(target, 622233,1,6)  --�ؼеL��
		addbuff(Player, 622237,1, 4) --�[�t
		addbuff(player, 622234,0,180) ----�@��R������
		ScriptMessage(player, player, 1, "[SKWERL_EASTER_07]", C_SYSTEM );

	end
end

function lua_skwerl_easter_explosioncheck()
	
	local target=targetID()
	local Player=OwnerID()
	
	if target== Player then --���|�Q�ۤv���k�N����
		return false
	end
	
	if checkbuff(target, 622233)==true then --�����@��
		return false
	end
	


end

-----------------------------------------------------------------------------


function lua_skwerl_easter_speedboost() ---�ߤl�[�t
local Player = OwnerID()
local bufflv= FN_CountBuffLevel(Player, 622193)+1 
--	if bufflv+1 ==0 then                          --�[�t�ΤT���k�s
		ScriptMessage(player, player, 2, "[SKWERL_EASTER_04]", C_SYSTEM );
		AddBuff(player, 622183, 1, 7)
		Cancelbuff(Player, 622193)


end

-----------------------------------------------------------------------
--���J�t��
function lua_skwerl_easter_egglaying()
	local player = OwnerID()
	local RoomID = ReadRoleValue(player, EM_RoleValue_RoomID )
	local Obj = Role:new( player )  
	local BaseX = Obj :X()
 	local BaseY = Obj :Y()
 	local BaseZ = Obj :Z()
	local BaseDir = Obj:Dir()
	local random= Rand(10)
	if Random > 6 then
		local egg = CreateObj( 119552 , BaseX , BaseY , BaseZ , BaseDir , 1 ) --�Хߪ��J
		AddToPartition( egg , RoomID )
		CallPlot(egg , "lua_skwerl_easter_eggdelete") 
	end
end



function lua_skwerl_easter_eggdetection()
	while true do
	local egg= OwnerID()
	local rabbit = SearchRangePlayer( egg , 50 )  --���d�򤺪��a�C
	for i=0, table.getn(rabbit), 1 do
		if CheckBuff( rabbit[i] , 622186 ) == true then 
		ScriptMessage(rabbit[i],rabbit[i], 1, "+3", C_SYSTEM );  
		addbuff(rabbit[i], 622228,2,300) --�[3��
		Addbuff(rabbit[i], 622250, 1, 1) 
		SysCastSpellLv(egg, rabbit[i], 499108, 0 )--�o��q���ĪG
		AddBuff(rabbit[i], 622237, 1, 3)
		sleep(10)
		Hide(egg)
		DelOBJ(egg)
					
		end
	end	
	sleep(1)
	end
end


function lua_skwerl_easter_eggdelete()--���J�ۧڧR��
	sleep(115)
	DelOBJ(OwnerID())
end
-------------------------��������-------------------game system code----------------------------------------
function lua_skwerl_easter_controller()

	Local Hour
	Local Min
	local npc= OwnerID()
	local wall
	local backdoor
	--���ɨt��--
	while true do
	local backdoor
	backdoor= ReadRoleValue( npc , EM_RoleValue_Register+5  ) --����A�j��}�l�C��
	backdoor2= ReadRoleValue( npc , EM_RoleValue_Register+6  ) --����A�j��}�l�C��
		 Hour = GetSystime(1) --���o�{�b�ɶ��G��
		 Min = GetSystime(2) --���o�{�b�ɶ��G��
		if  Hour==21 or Hour==22 or Hour==23 or Hour==0 or backdoor==9 or backdoor==8 or backdoor2==1 then
			if Min==7 or Min== 17 or Min==27 or Min==37 or Min==47 or backdoor==9  or backdoor==8 then
				lua_skwerl_easter_magicformation()  --�]�k�}
				
				lua_skwerl_easter_judge()  ---���P/�C������
				lua_skwerl_objectdelete(120559) ---�R��
				lua_skwerl_objectdelete(120586) --���ê
				lua_skwerl_objectdelete(120587) --���ê
				lua_skwerl_objectdelete(119552)--����ڽ�
			end
		end
--	say (npc, hour..":"..min.." backdoor:"..backdoor)
	WriteRoleValue(npc , EM_RoleValue_Register+5, 0) -- ����� 
	sleep(10)
	end
end


function lua_skwerl_easter_magicformation() --�]�k�}
	local npc= OwnerID()
	local RoomID = ReadRoleValue( npc , EM_RoleValue_RoomID )
	local backdoor= ReadRoleValue( npc , EM_RoleValue_Register+5  ) --����A�j��}�l�C��
	local Obj = Role:new( npc )  -- ���onpc X.Y.Z.Dir��
	local BaseX = Obj :X()
 	local BaseY = Obj :Y()
 	local BaseZ = Obj :Z()
	local BaseDir = Obj:Dir()
	local magicformation
	magicformation= CreateObj(120550, BaseX , BaseY , BaseZ , BaseDir , 1 )
	SetModeEx( magicformation  , EM_SetModeType_Mark, false )--�аO
	SetModeEx( magicformation , EM_SetModeType_NotShowHPMP , true )
	AddToPartition( magicformation , RoomID )
	SetModeEx( magicformation  , EM_SetModeType_Mark, false )--�аO
	if backdoor==0 then
	sleep (1500) ---�k�}�s���ɶ�
	end
	ScriptMessage(npc,0,1,"[SKWERL_VAL_12]", C_SYSTEM)
	sleep (300)
	delobj(magicformation)

end


function lua_skwerl_easter_judge()
	local npc = OwnerID()
	local backdoor
	backdoor= ReadRoleValue( npc , EM_RoleValue_Register+5  ) --����A�j��}�l�C��
	local activeplayer = SearchRangePlayer( npc , 300 )  --���d�򤺪��a�C
	local activeplayer2={}
	for i=0, table.getn(activeplayer), 1 do
		if CheckBuff( activeplayer[i] ,622259 ) == true then 
			table.insert(activeplayer2 , activeplayer[i]);
		end
	end

	if #activeplayer2 < 4 and backdoor~=9 then--�H�Ƥ���|�H

		for i=1, table.getn(activeplayer2), 1 do --�ť��H�Ƥ���
				ScriptMessage( activeplayer2[i],activeplayer2[i],1, "[SKWERL_EASTER_12]", C_SYSTEM) --�ť��H�Ƥ���
				ScriptMessage(activeplayer2[i],activeplayer2[i],0, "[SKWERL_EASTER_12]", C_SYSTEM)
				lua_skwerl_easter_cleanup(activeplayer2[i]) 
		end

	else
		lua_Hao_Round_wall( npc , 120559 , 26 , 145 , 0 ) --���� l( OwnerID() , 120559 , 45 , 200 , 0 ) 
		lua_skwerl_easter_boxspawn() --�ͻ�ê
		lua_skwerl_easter_gamebuff (activeplayer2)   --�C���}�lbuff
		sleep(15)
		lua_skwerl_easter_beginteleport(activeplayer2) --�Ǩ�_�]�I	
		lua_skwerl_easter_monitor (activeplayer2) --�C���i��^��

	end
end

function lua_skwerl_easter_gamebuff(playerlist)   ---���C���}�lbuff
	for i=1 , table.getn(playerlist) , 1 do
		cancelbuff(playerlist[i] ,622259)
		--Addbuff(playerlist[i], 622226, 1, 180)
		Addbuff(playerlist[i], 622229, 1, 180)
		Addbuff(playerlist[i], 622260, 1, 190)
	end
end


function lua_skwerl_easter_mountban(tmp) --�T��M

	for i = 1 , table.getn(tmp) , 1 do
		local BuffType = 0
		local Count = BuffCount( tmp[i] )
		for j = 1 , Count  , 1 do
			local BuffID = BuffInfo(tmp[i] , j , EM_BuffInfoType_BuffID )
			if GameObjInfo_int( BuffID , "AssistType" ) == 68 then
				BuffType = GameObjInfo_int( BuffID , "AssistType" )
				break
			end
		end
		if BuffType == 68 then --���M�����M
			DW_CancelTypeBuff( 68,  tmp[i] ) --�U��
			ScriptMessage( tmp[i] , tmp[i] , 1 , "[SKWERL_VAL_29]" , 0 )  --���ʶi�椤�A���B�L�k�M�����M�I0�O����  C_SYSTEM�O����
		end

	end

end

function lua_skwerl_easter_monitor(activeplayer2)
		local npc= OwnerID()
		local RoomID = ReadRoleValue( npc , EM_RoleValue_RoomID )
		local condition
		local time
		local random

		for time=1, 1800, 1 do
			local tmp = {}
			local rabbitcount=0
			CallPlot(npc , "lua_skwerl_easter_mountban", activeplayer2) 	--�ק��M
			if (time> 10 or time <1770) and time%40==0 then
				SysCastSpellLv(npc, npc, 499304,1)  --�Ǩ����~���a
			end
			-----------�ͳJ--------------------------------
			if time%120==0 then --�C10��[�@���J
		  		random= Az_RND_Ary(0,5,3) --- �q1~10����3��
		  		lua_skwerl_easter_balltest(random[1])
		  	end
	
			-------------------�s��--------------------------------
			if time==1 then
				lua_skwerl_easter_broadcast (activeplayer2, "[SKWERL_EASTER_04]")
			end 
		
			if time==1200 then
				lua_skwerl_easter_broadcast (activeplayer2, "[SKWERL_EASTER_02]")
			end 	

			if time==1500 then
				lua_skwerl_easter_broadcast (activeplayer2, "[SKWERL_VAL_19]")
			end 
			
			if time==1800 then
				lua_skwerl_easter_broadcast (activeplayer2, "[SKWERL_VAL_08]")
			end 
		
			------------------------------------------------------------------
			for i=1 , table.getn(activeplayer2) , 1 do  ---�V�ɥX��
				local Distance= GetDistance(npc, activeplayer2[i])
	--			say(npc, activeplayer2[i]..distance)	
				if Distance > 165 then
					lua_skwerl_easter_cleanup(activeplayer2[i]) 
					ScriptMessage( activeplayer2[i],activeplayer2[i],1, "[SKWERL_VAL_07]", C_SYSTEM)  --���a�X��
					ScriptMessage( activeplayer2[i],activeplayer2[i],0, "[SKWERL_VAL_07]", C_SYSTEM)
				else
					if distance >150 then
					ScriptMessage(activeplayer2[i],activeplayer2[i],1, "[SKWERL_EASTER_03]", 0)

					end
					if Checkbuff(activeplayer2[i], 622186)== true then --�ˬd�����ߤl
						rabbitcount=rabbitcount+1 
					end
					table.insert( tmp, activeplayer2[i] )
				end
					
			end
			if rabbitcount>0 then   ---�p�G���W���ߤl
				WriteRoleValue(npc , EM_RoleValue_Register+1, 2 ) --���W���ߤl
			end
			if rabbitcount==0 then
				condition= ReadRoleValue( npc , EM_RoleValue_Register+1  )
				if condition==0 then --�C���}�l 
					WriteRoleValue(npc , EM_RoleValue_Register+1, 1 ) ---���D�ͤF�i�O�S�H��
					callplot (npc, "lua_skwerl_easter_boxtest")
				end
									
				if condition==2 then --���W���ߤl�X���F
					WriteRoleValue(npc , EM_RoleValue_Register+1, 1 ) ---���D�ͤF�i�O�S�H��
					callplot (npc, "lua_skwerl_easter_boxtest")
				end
			end
		
							
			activeplayer2 = tmp;
			sleep(1)
		end
		
		WriteRoleValue(npc , EM_RoleValue_Register+1, 0 )  --�C�������Aregister���]
		lua_skwerl_easter_balldelete() --�R�ߤl���y
		sleep(30)
		--���\�������ʭp��--
		local finishedcount1= ReadRoleValue( npc , EM_RoleValue_Register+8  )
		local finishedcount2= finishedcount1+table.getn(activeplayer2)
		WriteRoleValue(npc, EM_RoleValue_Register+8, finishedcount2 ) 
	--	say(npc, "finished total:"..finishedcount2.." ")
		DesignLog( npc, 120549 , "successful completion count for easter bunny hunt "..finishedcount2 )

		------
		for i=1 , table.getn(activeplayer2) , 1 do
			lua_skwerl_easter_endgame(activeplayer2[i])
			lua_skwerl_easter_cleanup(activeplayer2[i])
		end
		

end


function lua_skwerl_objectdelete(object)
	local wall
	wall= LuaFunc_SearchNPCbyOrgID(OwnerID() , object, 350 , 1 )   	
	for i=0, table.getn(wall), 1 do
	Delobj(wall[i])
	end
end

function lua_skwerl_easter_endgame(Owner)

	local bufflv= FN_CountBuffLevel(Owner, 622228)+1
	ScriptMessage(Owner,Owner,1, "[SKWERL_VAL_33]"..":"..bufflv.."[SKWERL_VAL_34]", C_SYSTEM) 
	ScriptMessage(Owner,Owner,0, "[SKWERL_VAL_33]"..":"..bufflv.."[SKWERL_VAL_34]", C_SYSTEM)		
--	say(Owner, "game"..bufflv)
		if bufflv >=60 then
	       		  Givebodyitem(Owner, 204218,3)  ---Ū���ơA�����y
		elseif bufflv >= 30 then
			  Givebodyitem(Owner, 204218,2)		
		 else
	        		  Givebodyitem(Owner, 204218,1)	
		end	

	local bufflv3= FN_CountBuffLevel(Owner, 622234)+1  --�������h�ƥؼЦ��N
		if bufflv3>15 then
			if CountBodyItem(Owner, 530896 )==0 then-- �ˬd�O�_���������⦨�N�A�p�G�S���A�����N
				givebodyitem(Owner, 530896, 1)
			end
		end
	
--	say(Owner, "total kill"..bufflv3)
	setFlag(Owner, 546257,1)   --���ѻP�Lflag 

	local OID =Owner  
--< OID���нж�J�Ӭ��ʤ��O���a���ܼ�,  �Ҧp Local OID = player

	local allcount = 4  -- �Ҧ��s���ʼƶq
	local count = 0
	local keylist =  {
			546288,	--�Ԥ�ߨ��þ�
			546257,	--�Ԥ�l�r�O
			546264,	--�ڤ۱m��
			546232		--�m�J��~
			}
	for i =  1 , table.getn(keylist) do
		if Checkflag(OID , keylist[i] )  == true then
			count = count +1
		end
		if i == table.getn(keylist) then
			if count == allcount then -- �p�G��������
				lua_mika_festivalbuffgive(OID, 0 )  -- 2012. 4��K�B�`���� ������0
			end
		end
	end

--give achievement--
end



function lua_skwerl_easter_cleanup(Owner)

	cancelbuff(Owner, 622259)--����Wbuff
	cancelbuff(Owner, 622186) 
	cancelbuff(Owner, 622206) -- bunny cooldown
	Cancelbuff(Owner, 622212) --��[�tbuff
	Cancelbuff(Owner, 622213) --���tbuff
	CancelBuff(Owner, 622183)--��ߤl�L��
	CancelBuff(Owner, 622193)--��Ĩ�}��buff
	Cancelbuff(Owner, 622247)--��ߤl�o��
	Cancelbuff(Owner, 622249)--��ߤl�w�t
	Cancelbuff(Owner, 622318)--��ߤl�ͦs
	Cancelbuff(Owner, 622235)-- ���y�H���Ƭ���(�ߤl)
	Cancelbuff(Owner, 622234)-- ���y�H���Ƭ���(�@��)
	Cancelbuff(Owner, 622237)-- ���y�H�[�t
	Cancelbuff(Owner, 622229) --���������
--	Cancelbuff(Owner, 622226)--���y�H�ͳJ
	Cancelbuff(Owner, 622260)--��IFF���a���ѻP�C���F
	Cancelbuff(Owner,622228)--�����
	

end

function lua_skwerl_easter_boxspawn()
	local box1
	local box4
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )

	for i=0,20,1 do
		box1 = CreateObjByFlag( 120587 , 781115, i , 1 )		-- �b�X�Х͸G�c�l(���ͪ���ID , ���ͺX�lID , �X�l��mID , ���ͼƶq)
		SetModeEx( box1 , EM_SetModeType_NotShowHPMP , true )
		SetModeEx( box1 , EM_SetModeType_Obstruct, true )
		SetModeEx( box1  , EM_SetModeType_Mark, false )--�аO
		AddToPartition( box1 , RoomID )		
	end
	
	for i=0,20,1 do
		box4 = CreateObjByFlag(  120586  , 781116, i , 1 )		-- �b�X�Х� ���c�l(���ͪ���ID , ���ͺX�lID , �X�l��mID , ���ͼƶq)
		SetModeEx(box4 , EM_SetModeType_NotShowHPMP , true )
		SetModeEx( box4 , EM_SetModeType_Obstruct, true )
		SetModeEx( box4  , EM_SetModeType_Mark, false )--�аO
		AddToPartition( box4 , RoomID )
	end

end



---------------------------------------------���W�t��-----------------------------------------------

function lua_skwerl_easter_npc()  --�D��H
	SetSpeakDetail( OwnerID(), "[SKWERL_EASTER_06]" ) --((Correction:stove introduction))
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SKWERL_VAL_18") , "lua_skwerl_easter_aboutrules", 0) --���ʳW�h
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SKWERL_VAL_27") , "lua_skwerl_easter_abouttime", 0) --���ʮɶ�	
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SKWERL_VAL_02") , "Lua_skwerl_easter_registration", 0 ) --�ѥ[�C��
end

function lua_skwerl_easter_aboutrules() --����W�h�r��
	SetSpeakDetail( OwnerID(), GetString("SKWERL_EASTER_09") ) 
	AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , " lua_skwerl_easter_npc", 0 ) --�^�W�@��
end

function lua_skwerl_easter_abouttime() --����ɶ��r��
	SetSpeakDetail( OwnerID(), GetString("SKWERL_EASTER_10") ) 
	AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , " lua_skwerl_easter_npc", 0 ) --�^�W�@��
end


function lua_skwerl_easter_teleporter() --�K�B�ǰe�v
	SetSpeakDetail( OwnerID(), "[SKWERL_EASTER_08]" ) --((Correction:stove introduction))
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_FIREDAY_2012_EV1_20") , "lua_skwerl_easter_npcteleport", 0) --�ǰe�쬡�ʳ��a
end

function Lua_skwerl_easter_registration() --Npc���W�@��
	local Player = OwnerID()
	local npc= TargetID()
	local registercount= ReadRoleValue( npc , EM_RoleValue_Register+1  )
	Local Hour
	Local Min
	Local Backdoor
	 Hour = GetSystime(1) --���o�{�b�ɶ��G��
	 Min = GetSystime(2) --���o�{�b�ɶ��G��
	--place backdoor system here----
	backdoor= ReadRoleValue( npc , EM_RoleValue_Register+2  ) 
	local check=checkbuff(Player, 622035)
		if CheckFlag( Player, 546257 ) == true then
		Closespeak(Player);
		ScriptMessage(Player,Player,1, "[SKWERL_VAL_15]", C_SYSTEM) --�A���Ѥw�g�ѥ[�L�F�A�Щ��ѦA��!
	 	ScriptMessage(Player,Player,0, "[SKWERL_VAL_15]", C_SYSTEM)
			
		elseif check==true then
		Closespeak(Player);
		ScriptMessage(Player,Player,1, "[SKWERL_VAL_22]", C_SYSTEM) --�A�w�g���U�L�F
	 	ScriptMessage(Player,Player,0, "[SKWERL_VAL_22]", C_SYSTEM)
	
		elseif Hour==21 or Hour==22 or Hour==23 or Hour==00 or  backdoor==1 then

			if registercount>7 then   ---�C���̰��H��
			Closespeak(Player);
			ScriptMessage(Player,Player,1, "[SKWERL_VAL_24]", C_SYSTEM)--���ʤw�B��
	 		ScriptMessage(Player,Player,0, "[SKWERL_VAL_24]", C_SYSTEM)
			elseif (Min>=7 and Min<10) or (Min>=17 and Min<20) or (Min >=27 and Min<30) or (Min >=37 and Min<40) or (Min >=47 and Min<50)  then 	
			Closespeak(Player);
			ScriptMessage(Player,Player,1, "[SKWERL_VAL_01]", C_SYSTEM) --���U���\
			ScriptMessage(Player,Player,0, "[SKWERL_VAL_01]", C_SYSTEM)
			newregistercount=registercount+1
			WriteRoleValue(npc , EM_RoleValue_Register+1, newregistercount ) 
			Addbuff(Player, 622259, 1, 185)--���U�ҩ� ---give registration buff 
			else
			Closespeak(Player);
			ScriptMessage(Player,Player,1, "[SKWERL_VAL_25]", C_SYSTEM) --�Цb���ʶ}�l�T�����e���W
			ScriptMessage(Player,Player,0, "[SKWERL_VAL_25]", C_SYSTEM)

			end
		else
		Closespeak(Player);
		ScriptMessage(Player,Player,1, "[SKWERL_VAL_25]", C_SYSTEM) --�Цb���ʶ}�l�T�����e���W
		ScriptMessage(Player,Player,0, "[SKWERL_VAL_25]", C_SYSTEM)


	end
end

function lua_skwerl_easter_timer() ---npc �ɶ��p��
		local npc=TargetID()
		Local Hour
		Local Min
		local ZoneID = ReadRoleValue( npc , EM_RoleValue_RealZoneID )
		while true do
		 Hour = GetSystime(1) --���o�{�b�ɶ��G��
		 Min = GetSystime(2) --���o�{�b�ɶ��G��
			if (hour==21 and Min==0) or (hour==22 and Min==0) or (hour == 23 and Min==0) or (hour == 0 and Min==0)  then
				if ZoneID <= 999 then
					RunningMsgEx( OwnerID() , 2 , 3 , "[SKWERL_EASTER_13]" )   --�s���}�l
				sleep(600)
				end
			end
		
			 if Min==0 or Min==10 or Min==20 or Min==30 or  Min==40 or Min ==50 then   

			---���a�έp��--
			local totalplayer1= ReadRoleValue( npc , EM_RoleValue_Register+1  )  
			local totalplayer2= ReadRoleValue( npc , EM_RoleValue_Register+9  )
			local totalplayer3
			totalplayer3= totalplayer1+totalplayer2
			WriteRoleValue(TargetID() , EM_RoleValue_Register+9, totalplayer3)
		--	say(npc, "total player:"..totalplayer3.." ")
			DesignLog( npc, 120584 , "registration count for easter bunny hunt "..totalplayer3 )
			---------------
			
			WriteRoleValue(TargetID() , EM_RoleValue_Register+1, 0) --�M�ŵ��U���a�ƶq
			 end	
		sleep (600)
		end
end



---------------------------------------------------------------------------------------------------------------------------
function lua_skwerl_easter_rabbitballcheck() ----- �ߤl���y�ˬd
	
	local target= targetID()	
	local owner= OwnerID()
	if checkbuff (targetID(), 622260)== false then --���O���ʪ��a
		return false
	else
		Callplot(target, "lua_skwerl_easter_test")
		delobj(owner)
	end

end

function lua_skwerl_easter_rabbitball() --
	for i= 1, 1800, 1 do
			SysCastSpellLv(OwnerID(), OwnerID(),499281,1)
			sleep(1)
	end
	delobj(OwnerID())
end


function lua_skwerl_easter_balldelete()
	local ball
	ball= LuaFunc_SearchNPCbyOrgID(OwnerID() , 120548, 350 , 1 )   	
	for i=0, table.getn(ball), 1 do
	Delobj(ball[i])
	end
end

function lua_skwerl_easter_broadcast(table1, phrase)
	for  i=1, table.getn(table1), 1 do
		ScriptMessage(table1[i],table1[i],1, phrase, C_SYSTEM) --���C�������٦�5��
		ScriptMessage(table1[i],table1[i],0, phrase, C_SYSTEM)
	end

end

function lua_skwerl_easter_balltest(random)  ---�ͬ��ڽ�
	local npc= OwnerID()
	local monster
	local RoomID = ReadRoleValue( npc , EM_RoleValue_RoomID )
	Monster = CreateObjByFlag( 119552, 781114 , random  , 1 )		-- �b�X�Хͩ�(���ͪ���ID , ���ͺX�lID , �X�l��mID , ���ͼƶq)
	SetModeEx( Monster , EM_SetModeType_NotShowHPMP , true )
	SetModeEx( Monster  , EM_SetModeType_Mark, false )--�аO
	AddToPartition( Monster , RoomID )
	CallPlot(Monster , "lua_skwerl_easter_eggdelete") 
end


function lua_skwerl_easter_teleportcheck()
	local Player= TargetID()


	if (Checkbuff(player,622260)==false and Checkbuff(player, 622259)== true) then
		ChangeZone(player , 2, 0, 6551.7, 49.5, -2226.6, 148.8)
		ScriptMessage(player,player,1, "[SKWERL_VAL_35]", C_SYSTEM)  --�Ф��n�z�Z���ʡC
		ScriptMessage( player,player,0, "[SKWERL_VAL_35]", C_SYSTEM)
	elseif Checkbuff(player,622260)==false then    --�S���W�����a�|�ǥX��
		ChangeZone(player , 2, 0, 6551.7, 49.5, -2226.6, 148.8)
		ScriptMessage(player,player,1, "[SKWERL_VAL_11]", C_SYSTEM)  --�Ф��n�z�Z���ʡC
		ScriptMessage( player,player,0, "[SKWERL_VAL_11]", C_SYSTEM)
	end


end

function lua_skwerl_easter_beginteleport(playerlist) ---�H�����a�Q�d�b�c�l��������C�⪱�a�Ǩ�_�]�I

	Local npc=OwnerID()
	local RoomID = ReadRoleValue( npc , EM_RoleValue_RoomID )
	local Obj = Role:new( npc )  -- ���onpc X.Y.Z.Dir��
	local ZoneID = ReadRoleValue( npc , EM_RoleValue_ZoneID )
	local BaseX = Obj :X()
 	local BaseY = Obj :Y()
 	local BaseZ = Obj :Z()
	local BaseDir = Obj:Dir()
	local x= BaseX
	local y= BaseY
	local z= BaseZ
	local  direction= BaseDir
	
	for i=1 , table.getn(playerlist) , 1 do
		ChangeZone(playerlist[i] , ZoneID, RoomID, x, y, z, 74.5)
	end

end


function lua_skwerl_easter_npcteleport()
	ChangeZone(OwnerID() , 2, 0, 6487.7, 49.5, -2239.3, 340.9)
end

