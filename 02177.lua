function kg_105039_01()	--Boss������
	local Ctrl= OwnerID()	--�������ۨ�
	local BossID = 105039	--Boss ����s��
	local RoomID = ReadRoleValue( Ctrl,EM_RoleValue_RoomID)
	local Parent = ReadRoleValue(Ctrl,EM_RoleValue_Register3)	--���o������ID

	local FlagID = 780805	--���|�X��ID
	local PathA = {13,14,15,21}	--���|A�X�а}�C
	local PathB = {16,17,18,24}	--���|B�X�а}�C
	local RandStart	--Boss�_�l�X�нs��
	local Path	--Boss�̫���|�X�а}�C
	
	--�H���]�w���|
	if math.random(100)<51 then
		RandStart=PathA[1]
		Path=PathA
		--debugmsg(0,0,"RandStart= "..RandStart.." Path[1]= "..Path[1])
	else
		RandStart=PathB[1]
		Path=PathB
		--debugmsg(0,0,"RandStart= "..RandStart.." Path[1]= "..Path[1])
	end

	local Goal = 4	
	local step = 2	

	local Boss = CreateObjByFlag( BossID, FlagID , RandStart , 1 )	--�Ы�Boss
	MoveToFlagEnabled( Boss, false )	--�������޸��|�@��
	WriteRoleValue(Ctrl,EM_RoleValue_Register1,Boss)
	WriteRoleValue(Boss,EM_RoleValue_Register1,Ctrl)
	WriteRoleValue(Boss,EM_RoleValue_Register3,Parent)
	AddToPartition( Boss , RoomID )		--ø�sBoss
	BeginPlot(Boss,"kg_105039_BossAI",1)
	SetPlot(Boss,"dead","kg_105039_BossDead",30)
	--debugmsg(0,0,"WTF!!!!")

	while true do
		if KS_InCombat(Boss) ~= true then	--���p���b�԰���
			WriteRoleValue(Boss,EM_RoleValue_IsWalk, 1 )	--Boss�Ψ�������
			if CheckBuff(Boss,508173)==true then
				CancelBuff(Boss,508173)
			end
			if step<=Goal then
				if DW_CheckDis( Boss, FlagID, Path[step], 30 ) == true and step < Goal  then	--�P�w�����e�X�ЮɡA�~�򩹤U�ӺX�Ш�
					if  step==2 and KS_InCombat(Boss) ~= true then	--�ϥζǰe
						sleep(10)
						SetPosByFlag( Boss, FlagID , Path[step+1] )
						step = step + 2
					else 
						step = step + 1
					end
				
				elseif DW_CheckDis( Boss, FlagID, Path[step], 30 ) == true and step == Goal  then
					--break--��F���I
				elseif step<=Goal then
					KS_Move( Boss, 30, FlagID , Path[step] )	--���ʨ���w�X��
				end
			end
		end
		if ReadRoleValue(Boss,EM_RoleValue_IsDead)==1 or CheckID(Boss)==FALSE then	--Boss���`�h���X�j��
			--DebugMsg(0,0,"Boss is Dead!!!")
			WriteRoleValue(Parent,EM_RoleValue_Register9,3)
			break
		end
		sleep(10)
	end
end

function kg_105039_BossAI()
--EM_RoleValue_Register1 ������ID
--EM_RoleValue_Register2 �p��p�q��
--EM_RoleValue_Register3 ��������ParentID

	local timer =0
	local EnterFight = 0
	local ALL = 496771	--���F����
	WriteRoleValue(OwnerID() , EM_RoleValue_Register2 , 0 )	--�]�w�p��p�q������l�Ȭ�0
	
	while 1 do
		if KS_InCombat(OwnerID())==true then
			if EnterFight == 0 then
				ScriptMessage( OwnerID() , -1 , 2 , "[SC_105039_03]" , 1 )
				--���I�H�A�̳o���୮�S���H���ݧL����Ө�o�̡H
				EnterFight = 1
			end
			
			if timer>1 and timer%7==0 then		--�k�O+�g�ᤧ��(�ߦ�����)
				kg_105039_WorldSkill()
			end
			if timer>1 and timer%18==0 then	--�ƭ�(�Űʧ@)
				kg_105039_FinalCounter()
			end
			if timer>1 and timer%25==0	--�ʪἺ��(�ͤp��)
			 and ReadRoleValue( OwnerID() , EM_RoleValue_Register2)<20 
			 and (ReadRoleValue(OwnerID(),EM_RoleValue_HP)/ReadRoleValue(OwnerID(),EM_RoleValue_MaxHP))*100<60 then	
				if ReadRoleValue( OwnerID() , EM_RoleValue_Register2)<0 then	--���p�p��p�ƾ��p��s�A�h�k�s
				 	WriteRoleValue(OwnerID() , EM_RoleValue_Register2 , 0 )
				 end
				 ScriptMessage( OwnerID() , -1 , 2 , "[SC_105039_01]" , 1 )
				 -----------�ڥi�R����k�̡A�ӧa! ���ک^�m�A�̪���O!
				kg_105039_04()
			end
			if timer>1 and timer%30==0  then	--��K�ۮi
				kg_105039_ShareCounter()
			end
			if timer>1 and timer%37==0 then	--���F����
				SysCastSpellLv( OwnerID(), OwnerID() , ALL , 2 )
			end
			
			timer = timer +1
		else
			EnterFight = 0
			timer =0
		end
		sleep(10)
	end
end

function kg_105039_WorldSkill()		---RAND
	local Skill = { 496765 , 496766 }		---�k�O�A�g�ᤧ��(�ߦ�����)
	local SkillLv = { 40 , 53 }			---(500+500*11)*0.78=4680 , (500*55)=27500 , DOT(100*55)=5500
	local Luck = Rand(100)
	local LuckyPlayer = {}
	local PlayerInHate = {}
	PlayerInHate = star_HateListSort(OwnerID())
	local BossTarget
	local SkillIndex
	---local TargetTable = {}
	
	if ( Luck >= 0 and Luck < 50 ) then
		SkillIndex = 1
		local RandTarget1 = Rand(table.getn(PlayerInHate))+1	--�H���줳��������a
		BossTarget = PlayerInHate[RandTarget1]
		if ( BossTarget ~= nil ) and ( ReadRoleValue( BossTarget , EM_RoleValue_IsDead ) == 0 ) then
			CastSpellLv( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )
			Sleep(10)
		end
	elseif ( Luck >= 50 and Luck < 100 ) then
		SkillIndex = 2		
		for m=1 , table.getn(PlayerInHate) do
			local temp2 = PlayerInHate[m]			 
			if ReadRoleValue(temp2 , EM_RoleValue_Voc) ~= 0 				--GM�ư�
			 and ReadRoleValue(temp2 , EM_RoleValue_IsDead ) == 0 then 	--���H�ư�
				LuckyPlayer[table.getn(LuckyPlayer)+1] = temp2 				--��쪺���a��iTABLE
			end	
		end
		--Say(OwnerID() , "Before ="..table.getn(LuckyPlayer))
		if table.getn(LuckyPlayer) >= 5 then							------�j��5�H�Nrand 5��
			for n=1 , 5 do						
				local Lucky2 = Rand(table.getn(LuckyPlayer))+1						--RAND�쪺�Ʀr	
				if ( LuckyPlayer[Lucky2] ~= nil ) and ( ReadRoleValue( LuckyPlayer[Lucky2] , EM_RoleValue_IsDead ) == 0 ) then
					SysCastSpellLv( OwnerID() , LuckyPlayer[Lucky2] , Skill[SkillIndex] , SkillLv[SkillIndex] )
				end
				table.remove( LuckyPlayer , Lucky2 )
				sleep(1)
				--Say(OwnerID() , "After ="..table.getn(LuckyPlayer))
			end	
		else													-------5�H�H�U�N����
			for p=1 , table.getn(LuckyPlayer) do				
				if ( LuckyPlayer[p] ~= nil ) and ( ReadRoleValue( LuckyPlayer[p] , EM_RoleValue_IsDead ) == 0 ) then
					SysCastSpellLv( OwnerID() , LuckyPlayer[p] , Skill[SkillIndex] , SkillLv[SkillIndex] )
				end
				sleep(1)
			end
		end
	end
	--Say( OwnerID() , "Nice Good job!!" )	
end


function kg_105039_Sasa_FinalCounter()				--------�������r�ˬd�˼�
	local Pos = Lua_BuffPosSearch( OwnerID() , 508403 )		--�ˬd
	local Time = BuffInfo( OwnerID() , Pos , EM_BuffInfoType_Time )
	
	if CheckBuff( OwnerID() , 508402 ) == false and Time > 2 then			--�s�򲣥�
		CancelBuff( OwnerID() , 508403 )
	elseif CheckBuff( OwnerID() , 508402 ) == false and Time <= 2 then		
		SysCastSpellLv( OwnerID() , OwnerID() , 496769 , 0 )	--�˼ƽT�{�A�I���ƭ�(10%/20%)=30% , DOT(100/50%)=600
		CancelBuff( OwnerID() , 508403 )
	end	
end

function kg_105039_FinalCounter()
					local Final = 496767							--�ƭ�(�Űʧ@)
					local PlayerInHate1 = {}
					PlayerInHate1 = star_HateListSort( OwnerID() )
					--sleep(10)
					--Say(OwnerID() , "FinalCounter ="..FinalCounter)
					local LuckyFarmer = {}				--���عA��X5					
					--local Farmer = {}				--�A�ҭ�
					for i=1 , table.getn(PlayerInHate1) do
						local temp2 = PlayerInHate1[i]			 
						if ReadRoleValue(temp2 , EM_RoleValue_Voc) ~= 0 				--GM�ư�
						 and ReadRoleValue(temp2 , EM_RoleValue_IsDead ) == 0       	--���H�ư�
						 and GetDistance( temp2 , OwnerID() ) <= 600 then				--�Z��600�H��
							LuckyFarmer[table.getn(LuckyFarmer)+1] = temp2 				--��쪺���a��iTABLE
						end	
					end
					--Say(OwnerID() , "FarmerCounter ="..table.getn(LuckyFarmer))
					if table.getn(LuckyFarmer) >= 5 then							------�j��5�H�Nrand 5��
						ScriptMessage( OwnerID() , -1 , 2 , "[SC_104666_03]" , 1 )
						--�N�O�A�F�A�˷R���A��[104666]�n�n�a���o�y�O�E���a�I
						CastSpellLV( OwnerID(), OwnerID() , Final , 0 )		--�ƭ�(�Űʧ@)
						sleep(15)
						for j=1 , 5 do						
							local Lucky2 = Rand(table.getn(LuckyFarmer))+1						--RAND�쪺�Ʀr	
							if ( LuckyFarmer[Lucky2] ~= nil ) and ( ReadRoleValue( LuckyFarmer[Lucky2] , EM_RoleValue_IsDead ) == 0 ) then
								--Say( OwnerID() , "LuckyFarmer ="..LuckyFarmer[Lucky2] )
								AddBuff( LuckyFarmer[Lucky2] , 508402 , 0 , 5 )	--�������r : ��ª�dubuff�A�L����ĪG�A�u�|�˼�5��
								AddBuff( LuckyFarmer[Lucky2] , 508403 , 0 , 7 )	--�ˬd�˼� : ����7��A�C�@���ͭ������r�@���A��ۤv�I�i�A�|����sasa_FinalCounter					
							end
							table.remove(LuckyFarmer , Lucky2)
							sleep(1)														
						end	
					else													-------5�H�H�U�N����
						ScriptMessage( OwnerID() , -1 , 2 , "[SC_104666_03]" , 1 )
						--�N�O�A�F�A�˷R���A��[104666]�n�n�a���o�y�O�E���a�I
						CastSpellLV( OwnerID(), OwnerID() , Final , 0 )		--�ƭ�(�Űʧ@)
						sleep(15)
						for l=1 , table.getn(LuckyFarmer) do	
							--Say(OwnerID() , "LuckyFarmer = "..GetName(LuckyFarmer[l]))
							if ( LuckyFarmer[l] ~= nil ) and ( ReadRoleValue( LuckyFarmer[l] , EM_RoleValue_IsDead ) == 0 ) then
								AddBuff( LuckyFarmer[l] , 508402 , 0 , 5 )	--�������r
								AddBuff( LuckyFarmer[l] , 508403 , 0 , 7 )	--�ˬd�˼�									
							end
							sleep(1)
						end
					end

end

function kg_105039_ShareCounter()
					local Share = 496770							--��K�ۮi
					local PlayerInHate2 = {}
					PlayerInHate2 = star_HateListSort( OwnerID() )	--�u�j�M���몱�a��Gid
					local RandTarget1 = PlayerInHate2[Rand(table.getn(PlayerInHate2))+1]
					while 1 do
						sleep(1)
						if ReadRoleValue( RandTarget1 , EM_RoleValue_Voc ) == 0 then	--¾�~�DGM
							for ii=1 , table.getn(PlayerInHate2) do
								if RandTarget1 == PlayerInHate2[ii] then
									table.remove( PlayerInHate2 , ii )	
									break	
								end	
							end
							sleep(5)	
							RandTarget1 = PlayerInHate2[Rand(table.getn(PlayerInHate2))+1]
							--Say(OwnerID() , "HateCount ="..table.getn(PlayerInHate2) )	
						else
							break
						end	
					end	
					local PlayerName = GetName( RandTarget1 )
					local MessageString = "[SC_104666_02][$SETVAR1="..PlayerName.."]" 		----�bstring���i�H�q�X���a���W�r
					ScriptMessage( OwnerID() , -1 , 2 , MessageString , 1 )
					--[$VAR1]�A���ڸոէA���h�֯�@�I
					sleep(30)
					local SharedPlayer = {}
					local TempShare = {}
					SharedPlayer = SearchRangePlayer( RandTarget1 , 80 )
					for m=0 , table.getn(SharedPlayer)-1 do							
						if ReadRoleValue( SharedPlayer[m] , EM_RoleValue_Voc ) ~= 0 				--GM�ư�
						 and GetDistance( SharedPlayer[m] , OwnerID() ) <= 600
						 and SharedPlayer[m] ~= nil												
						 and ReadRoleValue( SharedPlayer[m] , EM_RoleValue_IsDead ) == 0 then 	--���H�ư�
							TempShare[table.getn(TempShare)+1] = SharedPlayer[m]
							--table.remove( SharedPlayer , m )
						end
					end	
					local TotalDamage = 240000						--����Ʀr
					local PLV = math.floor( TotalDamage/(table.getn(TempShare)*100) )					
					CastSpellLv( OwnerID() , RandTarget1 , Share , PLV )
					--for ii=1 , table.getn(TempShare) do
						--Say( OwnerID() , GetName(TempShare[ii]) )
					--end
					sleep(40)

end



function kg_105039_BossDead()
	local Parent = ReadRoleValue(OwnerID(),EM_RoleValue_Register3)
	ScriptMessage( OwnerID() , -1 , 1 , "[SC_104666_04]" , 1 )	--���R���K�ᦷ�K�A�ױN�K��K�¡K
	WriteRoleValue(Parent,EM_RoleValue_Register9,3)
	--DebugMsg(0,0,"Boss is Dead!!!")
end

function kg_105039_04()	--�ʪἺ��(�ͤp��)
	local Boss=OwnerID()
	local FlowerCount=ReadRoleValue(Boss,EM_RoleValue_Register2)	--���o��e���p��ƶq
	local FlowerMaxCount=20	--�p��i���ͪ��̤j�ƶq
	local FlowerID=117116	--�p�᪺����s��
	local Flower	--�p�᪺GitemID
	local RoomID = ReadRoleValue(Boss,EM_RoleValue_RoomID)
	local HP=ReadRoleValue(Boss,EM_RoleValue_HP)
	local MaxHP=ReadRoleValue(Boss,EM_RoleValue_MaxHP)
	local HPP=(HP/MaxHP)*100	--��q�ʤ���
	if HPP<60 and KS_InCombat(Boss)==true and FlowerCount<FlowerMaxCount then	--HP�C��60%�B�԰����B���W�����٨S��W��
		local Max = math.random(3,5)	--�C�����ͪ��p��ƶq�W��
		if Max+FlowerCount>FlowerMaxCount then
			Max=FlowerMaxCount-FlowerCount
			DebugMsg(0,0,"Max= "..Max)
		end
		for i=1,Max do	--�H�����ͤp��
			Sleep(1)
			FlowerCount=FlowerCount+1
			WriteRoleValue(Boss,EM_RoleValue_Register2,FlowerCount)
			Flower =  LuaFunc_CreateObjByObj(FlowerID,Boss)
			WriteRoleValue(Flower,EM_RoleValue_Register3,Boss)	--�NBossGID��b�p�᪺�f�U3
			SetModeEx( Flower , EM_SetModeType_HideName, false)	---�����Y�W�O�_��ܦW��
			SetModeEx( Flower , EM_SetModeType_Move, false) ---����
			SetModeEx( Flower , EM_SetModeType_Revive, false)	--�i����
			ks_RandRangeSetPos(Flower,Boss,nil,100)	--�b100�X���H���]�w��m
			AdjustDir(Flower,math.random(-180,180))	--�H����V
			AddToPartition(Flower,RoomID)
			BeginPlot(Flower,"kg_105039_05",0)
			DebugMsg(0,0,"There are "..FlowerCount.." flowers")
		end
	end

end