function LuaI_102387_1(Yuris)
	local Obj = OwnerID()
	local HateCount = 0
	ScriptMessage( Yuris, -1, 0, "[SC_102387_40]", C_Yellow )--�A�̪��İ�......�ש����ګ�_�F�@����������
	ScriptMessage( Yuris, -1, 2, "[SC_102387_40]", C_Yellow )
	sleep(30)
	ScriptMessage( Yuris, -1, 0, "[SC_102387_41]", C_Yellow )--���ޥ��̷Q�n����A�ڵ��藍�|�����̱o�x��......
	ScriptMessage( Yuris, -1, 2, "[SC_102387_41]", C_Yellow )
	while	true	do
		HateCount = HateListCount(Obj)
		if	HateCount ~=0	then --�԰���
			if	Global_508902_DeadCount ==150	then --��q��������25%�H�U
				for i=0,HateCount,1 do
					local GUID = HateListInfo(Obj,i , EM_HateListInfoType_GItemID)
					if	ReadRoleValue(GUID,EM_RoleValue_IsPlayer)==1	then --�O���a
						if	CheckBuff(GUID,508899)==false	then --�Sbuff
							Tell(GUID,Yuris,"[SC_102387_42]")--�K�y�G�n�n�ϥΥ��A�ڬ۫H�A�|�ݭn��......
							AddBuff(GUID,508899,0,-1) --���L
						end
					end
				end
			elseif	(Global_508902_DeadCount ~= 0)and(Global_508902_OverTime~="BossDie")	then --��q������25%�H�U  �B���٥���
				for i=0,HateCount,1 do
					local GUID = HateListInfo(Obj,i , EM_HateListInfoType_GItemID)
					if	ReadRoleValue(GUID,EM_RoleValue_IsPlayer)==1	then --�O���a
						if	CheckBuff(GUID,508902)==false	then --�٨S���L�̲״c��
							if	(CheckBuff(GUID,500745)==false)and(ReadRoleValue(GUID,EM_RoleValue_IsAttackMode)==1)	then
								Tell(GUID,Yuris,"[SC_102387_45]")--�K�y�G�ڭ̳ѤU���ɶ����h�I�Y�O�S��k�����L�A�����H�N�|�O�ڭ̡I
								AddBuff(GUID,508902,0,Global_508902_DeadCount) --���P�Ѿl��Ʈɶ���buff
							end
						end
					end
				end
			end
		end
		sleep(30)
	end
end


function LuaI_102387_0(Yuris)

	local Count = 0
	local TimeCount = 0
	local ShadowKnight = CreateObjByFlag( 102386 , 780407 , 1 , 1 )
	local HPLevel = ReadRoleValue( ShadowKnight , EM_RoleValue_MaxHP )/4
	local TempHP = HPLevel*3
	local HP = 0
	local Min = 0
	local Buff = {504053,504054,504094,505637,508590}
	local Monster = { 0 , 0 , 0 , 0 , 0 , 0 }
	Global_508902_OverTime = "PlayerDie"
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local LittleBoss = {102408,102409,102410}	
	local Effect = CreateObjByFlag( 113330 , 780407 , 1 , 1 )
	local Battle = "off"
	local FearProgess = 0
	local FearIf = true
	Global_508902_DeadCount = 150

	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_IDLE1 )
	ScriptMessage( OwnerID() , -1 , 2 , "[SC_102387_1]" , 0 ) --[102387]���n���j�T�ۡG�w�R�a�I�u�������ڤ~���n�}�l......
	ScriptMessage( OwnerID() , -1 , 0 , "[SC_102387_1]" , C_Red  )
	Lua_ObjDontTouch( Effect )
	WriteRoleValue( Effect , EM_RoleValue_LiveTime , 70 )
	AddToPartition( Effect , RoomID )
	AddBuff( Effect , 500900 , 0 , 60 )
	sleep( 30 )
	AddToPartition( ShadowKnight , RoomID )
	SetPlot(ShadowKnight,"dead","LuaI_102387_DeadPlot",0)
	AddBuff( ShadowKnight , 504094 , 0 , -1 )
	AddBuff(ShadowKnight,508590,1,360)
	AddBuff(ShadowKnight,505637,0,-1)
	CallPlot(ShadowKnight,"LuaI_102387_1",Yuris)
	DelObj( Effect )

	while Min < 600 do--�p�� 10 ����
		
		if CheckID( ShadowKnight ) == false or ReadRoleValue(ShadowKnight , EM_RoleValue_IsDead) == 1 then --�p�G�w�h�Q�����`�ή����A�N�����j��
			Global_508902_OverTime = "BossDie"
			local PlayerAmount = SetSearchAllPlayer(0)
			local TempPlayer
			for i=1,PlayerAmount,1 do
				TempPlayer = GetSearchResult()
				if	(ReadRoleValue(TempPlayer,EM_RoleValue_IsDead)==0)	then
					CancelBuff_NoEvent(TempPlayer,508902)
					ScriptMessage( TempPlayer, TempPlayer, 0, "[SC_102387_47]", C_Yellow )
				end
			end
			break
		else
			if CheckBuff( ShadowKnight , 504051 ) == false then --�w�h�Q���@��I�k�����A���ˬd�O�_������
			--	CastSpell(  ShadowKnight ,  ShadowKnight , 493753 )
				AddRoleValue( ShadowKnight , EM_RoleValue_HP , 30000 ) --�C��w�ɦ^�� 50000
			end
			AdjustFaceDir( OwnerID(), ShadowKnight , 0 ) 
		end

		if HateListCount( ShadowKnight ) > 0 then --�w�h�Q���԰��ɪ��B�z
			if Battle == "off" then
				Battle = "on"
			end

			Count = Count +1

			HP = ReadRoleValue( ShadowKnight , EM_RoleValue_HP )
			if	FearIf == false	then
				if	Global_508902_DeadCount ~= 0	then
					Global_508902_DeadCount = Global_508902_DeadCount -1
				else
					local PlayerAmount = SetSearchAllPlayer(0)
					local TempPlayer
					for i=1,PlayerAmount,1 do
						TempPlayer = GetSearchResult()
						if	(ReadRoleValue(TempPlayer,EM_RoleValue_IsDead)==0)	and
							(CheckBuff(TempPlayer,500745)==false)			then
							ScriptMessage( TempPlayer, TempPlayer, 1 , "[SC_102387_46]", C_Red )
							KillID(TempPlayer,TempPlayer)
						end
					end
				end
			end
			if	HP < HPLevel	then
				FearIf = false
			end
			if HP > TempHP and TempHP < HPLevel*3 then
				TempHP = HP
			end

			if math.floor( TempHP/HPLevel) > math.floor(HP/HPLevel) and CheckBuff( ShadowKnight , 504051 ) == false then --�C�Q���� 75% 50% 25% ��H�U�N�����X�p Boss
				ScriptMessage( OwnerID() , -1 , 2 , "[SC_102387_29]" , 0 ) 
				ScriptMessage( OwnerID() , -1 , 0 , "[SC_102387_29]" , C_Red  )

				TempHP = HP
				TimeCount = Count
				SetModeEX( ShadowKnight  , EM_SetModeType_Move , false)
				Lua_CancelAnotherBuff( ShadowKnight  , Buff  )
				AddBuff( ShadowKnight , 504051 , 0 , -1 )
				local DK = Role:new(ShadowKnight)
				local HatePos = DW_Rand(HateListCount(ShadowKnight) ) -1
				local Pos = DW_Rand(3)
				local NowTarget
				local Ball = CreateObj( 113330 , DK:X() , DK:Y() , DK:Z() , DK:Dir() , 1 )
				Lua_ObjDontTouch( Ball )
				WriteRoleValue( Ball , EM_RoleValue_LiveTime , 70 )
				AddToPartition( Ball , RoomID )
				AddBuff( Ball , 500900 , 0 , 60 )
--				yell( OwnerID() , 3-math.floor(HP/HPLevel)  , 3 )
				for i = 1 , 3-math.floor(HP/HPLevel) , 1 do
--					yell( OwnerID() ,i , 3 )
					NowTarget = HateListInfo(ShadowKnight , HatePos , EM_HateListInfoType_GItemID )
					local You = Role:new(NowTarget)

					CastSpell( Ball , NowTarget , 493732 )

					Monster[i] = CreateObj( 102359 + Pos , You:X() , You:Y() , You:Z() , You:Dir() , 1 )
					WriteRoleValue( Monster[i] , EM_RoleValue_PID , ShadowKnight )
					WriteRoleValue( Monster[i] , EM_RoleValue_Register , NowTarget )
--					yell( OwnerID() ,Monster[i]  , 3 )
					Beginplot( Monster[i] , "LuaI_102387_SubBossShow" , 0 )

					HatePos = HatePos + 1
					if HatePos >= HateListCount(ShadowKnight) then
						HatePos = 0
					end

					Pos = Pos + 1
					if Pos > 3 then 
						Pos = 1 
					end
				end
				sleep( 10 )
				Count = Count + 1
			end

			if TimeCount > 0 then --�������� 1 �����A��p Boss �^���A�øѰ�����
				local Check = "ShowBoss"

				for i = 1 , 3 , 1 do
					if CheckID( Monster[i] ) == true then
						Check = "HideBoss"
					end
				end
--				ScriptMessage( OwnerID() , -1 , 2 ,Check.." "..Count.." "..TimeCount , 0 ) 
				if Count == TimeCount then
					local Refresh = 0
					for i = 1 , 3 , 1 do
						--ScriptMessage( OwnerID() , -1 , 0 , Monster[i]  , 0 ) 
						if CheckID( Monster[i] ) == true then
							Refresh = Refresh + 1
							BeginPlot( Monster[i] , "LuaI_102387_LittleBossDisappear" , 0 )
						end
					end
					AddRoleValue( ShadowKnight , EM_RoleValue_HP , Refresh*HPLevel )
					Check = "ShowBoss"
				end
				if Check == "ShowBoss" then
					TempHP = ReadRoleValue( ShadowKnight , EM_RoleValue_HP )
					if TempHP >= HPLevel*4 then
						TempHP = HPLevel*3
					end
					local NowTargetPlayer = DW_HateRemainEX(ShadowKnight,"Include",1 ,true)
					if	NowTargetPlayer[1] ~=nil	then
						SetAttack(ShadowKnight,NowTargetPlayer[1])
					end
					CancelBuff( ShadowKnight , 504051 )
					SetModeEX( ShadowKnight  , EM_SetModeType_Move , true)
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_102387_30]" , 0 ) 
					ScriptMessage( OwnerID() , -1 , 0 , "[SC_102387_30]" , C_Red  )
					Count = 0
					TimeCount = 0
				end
				if math.floor( TempHP/HPLevel) < 1 then
					if CheckBuff( ShadowKnight , Buff[2] ) == false then
						AddBuff( ShadowKnight ,  Buff[2] , 10 , -1 )
					end
				end
			end
			

			if ReadRoleValue( ShadowKnight , EM_RoleValue_HP) < HPLevel then
				if CheckBuff( ShadowKnight , 504051 ) == false then
					for i = 1 , 3 , 1 do
						if CheckID( Monster[i+3] ) == false or ReadRoleValue( Monster[i+3] , EM_RoleValue_IsPlayer ) ~= 0 then
							Monster[i+3] = CreateObjByFlag( LittleBoss[i] , 780089 , i , 1 )
							AddToPartition( Monster[i+3], RoomID )
							SetPlot( Monster[i+3] , "dead" , "LuaFunc_DeadPlay" , 0 )
							SetAttack( Monster[i+3] , ReadRoleValue( ShadowKnight , EM_RoleValue_AttackTargetID ) ) 
							CallPlot(Monster[i+3],"LuaFunc_Obj_Suicide",60)
						end
					end
				end
			else
				if CheckBuff( ShadowKnight , Buff[2] ) == true then
					CancelBuff_NoEvent( ShadowKnight , Buff[2] )
				end
			end
			
			if CheckBuff( ShadowKnight , 504051 ) == false then --�w�h�Q���@��I�k�����A���ˬd�O�_������

--				if (Count~=0)and(Count>5) then
--						CastSpellLV(  ShadowKnight ,  ShadowKnight , 493754 , 1 ) ---���e�N 100 �令 1
--				end

				if (Count~=0)and(Count>8) then
						local ChargePos = DW_Rand(HateListCount(ShadowKnight) ) -1
						local AttackTarget = HateListInfo(ShadowKnight , ChargePos , EM_HateListInfoType_GItemID )
						CastSpellLv(  ShadowKnight ,  AttackTarget , 493756 , 0 )  ---�����N 1 �令 0
				end

				if (Count~=0)and(Count>15) then
						CastSpellLV(  ShadowKnight ,  ShadowKnight , 493755 , 1 )  ---���e�N 100 �令 1
				end
			end

			if	((Count%15 == 0)and(Count%2==1)and(Count~=0))		and--�C15��i��@�����ߵ{��
				CheckBuff(ShadowKnight,504051)==false			and--�X�p�Ǫ��ɭԤ���
				FearIf == true							then --�屼��25%��N����
--DeBugMSG(0,0,"Count ==> "..Count)
				local FearTarget
				local Temp = {}
				local TankTemp = {}
				local FearList = {}
				local ManCount = HateListCount(ShadowKnight) --�`�H��
				local Pos = Rand(HateListCount(ShadowKnight)  )
				local Num = 0

				if	ManCount >24		then
					Num =3
				elseif	ManCount > 12	then
					Num =2
				else
					Num =1
				end

				if	FearProgess==0	or
					FearProgess==3	then
					FearProgess =1
				end

				ScriptMessage( OwnerID() , -1 , 2 , "[SC_102387_2]" , 0 ) --[102387]���n���j�T�ۡG�d��a�I���̲`�I���·t�i�J�A�̪��F����I
				ScriptMessage( OwnerID() , -1 , 0 , "[SC_102387_2]" , C_Red  )
				CastSpell( OwnerID() , OwnerID() , 493774 )
				for i=1,Num,1 do
					if	i==1	then
						TankTemp = DW_HateRemainEX(ShadowKnight,"Include",2 ,true)
						Temp = DW_HateRemainEX(ShadowKnight,"Exclude",2 ,true)
						if	FearProgess==2	then --�@�w���Z
							FearTarget = TankTemp[DW_Rand(2)]
						else
							local UnFine = DW_Rand(ManCount)
--DeBugMSG(0,0,"UnFine  = "..UnFine)
							if	UnFine <=2	then
								FearTarget = TankTemp[UnFine]
							else
								UnFine = UnFine-2
								FearTarget = Temp[UnFine]

								table.remove(Temp,UnFine)
							end
						end
					else --�ƩZ
						local XValue = DW_Rand(table.getn(Temp))
						FearTarget = Temp[XValue]
						table.remove(Temp,XValue)
					end
--DeBugMSG(0,0,"FearTarget Add ==>"..FearTarget)
					table.insert(FearList,FearTarget)
				end
				for i=1,table.getn(FearList),1 do
--DebugMsg(0,0,"FearTarget ==> "..FearTarget)
--YELL(FearTarget,"Me!!",3)
					local ReadyDiePlayer = {}
					ReadyDiePlayer = SearchRangePlayer ( FearList[i] , 50 )
					local RDP
					for n=0,table.getn(ReadyDiePlayer),1 do
						RDP = ReadyDiePlayer[n]
						if	ReadRoleValue(RDP,EM_RoleValue_IsDead)==0	and
							(CheckBuff(RDP,504057)==false  or CheckBuff(RDP,508900)==false)	then
							AddBuff(RDP,508900,0,5) --�u��
							SysCastSpellLv(OwnerID(),RDP,497132,1) --�񮣪��S��
						end
					end
				end
			end

			if Count == 60 then

				if CheckBuff( ShadowKnight , 504051 ) == false then
					PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_IDLE0 )
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_102387_3]" , 0 ) --[102387]���n���j�T�ۡG�A�̪����ߡA�b���ڤ��N�����u��I
					ScriptMessage( OwnerID() , -1 , 0 , "[SC_102387_3]" , C_Red  )
				end
				AddBuff(  ShadowKnight , Buff[1] , 0 , 1000 )--�C 60 ���w�h�Q���i��j��

				Count = 0 --�p�ƾ��k 0
			end

		else
			Count = 0--�p�ƾ��k 0
			ClearHateList(ShadowKnight,-1)
			Global_508902_DeadCount = 150
			if Battle == "on" then

				WriteRoleValue( ShadowKnight ,EM_RoleValue_HP , 4*HPLevel ) --���}�԰��ạ��
				FearIf = true
				TempHP = HPLevel*3

				if CheckBuff( ShadowKnight , 504051 ) == true then --�������A�ˬd�p���A�p���b���ܧR���p��
					for pry , obj in pairs(Monster) do
--						ScriptMessage( OwnerID() , -1 , 0 , obj , 0 ) 
						if CheckID( obj ) == true and ReadRoleValue(obj , EM_RoleValue_IsPlayer) ~= 1 then
							Delobj( obj )
						end
					end
					CancelBuff_NoEvent( ShadowKnight   , 504051 )
					TimeCount = 0
				end

				--if BuffCount(ShadowKnight) > 0 then --�M�������W�Ҧ� BUFF
				--	ScriptMessage( OwnerID() , -1 , 2 ,"Buff count = "..BuffCount(ShadowKnight ), 0 ) 
				--	ScriptMessage( OwnerID() , -1 , 0 ,"Buff count = "..BuffCount(ShadowKnight ), 0 ) 
				--end
				local BuffCount = BuffCount(ShadowKnight )
				for i = 1 , BuffCount do
					local BuffID = BuffInfo( ShadowKnight  , BuffCount-i , EM_BuffInfoType_BuffID)
				--	ScriptMessage( OwnerID() , -1 , 2 ,"Buff ID = "..BuffID , 0 ) 
				--	ScriptMessage( OwnerID() , -1 , 0 ,"Buff ID = "..BuffID , 0 ) 
					CancelBuff_NoEvent( ShadowKnight   , BuffID )
				end
				SetModeEX( ShadowKnight  , EM_SetModeType_Move , true)
				AddBuff( ShadowKnight , 504094 , 0 , -1 )
				Battle = "off"
			end
		end
		sleep( 10 )
		if	HateListCount(ShadowKnight)==0	then
			Min = Min + 1 --�p��w�h�Q���X�{�X����
		else
			Min = 0
		end
		if math.floor(Min/30) ==Min/30 and  Min~= 0  then
			local CountDown = 600-Min
			ScriptMessage( OwnerID() , -1 , 0 , "[SC_102387_24]"..CountDown , C_Yellow   )
		end
	end

	for pry , obj in pairs(Monster) do
		if CheckID( obj ) == true and ReadRoleValue(obj , EM_RoleValue_IsPlayer) ~= 1 then
			Delobj( obj )
		end
	end

	if Global_508902_OverTime == "PlayerDie" then --10���������᪺�B�z

		local Player = SetSearchAllPlayer(RoomID )
		local Group = {}
		for i = 1 , Player  , 1 do
			local ID = GetSearchResult()
			if ReadRoleValue( ID , EM_RoleValue_IsDead ) == 0 then
				Group[i] = ID
			end
		end
		PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_IDLE1 )
		ScriptMessage( OwnerID() , -1 , 2 , "[SC_102387_4]" , 0 ) --[102387]���n���j�T�ۡG���a�I�u���j�̪����߯�������ڡA�o�ǳå�u�|���O�ڪ��ɶ��I
		ScriptMessage( OwnerID() , -1 , 0 , "[SC_102387_4]" , C_Red  )
		sleep( 20 )

		Delobj( ShadowKnight )

		for pry , obj in pairs(Group) do
			if CheckID( obj ) == true and ReadRoleValue( obj , EM_RoleValue_IsDead ) == 0 then
				local GoOut = DW_Rand(7)
				if GoOut == 1 then
					ChangeZone( obj , 2 , 0, 6372, 61, -3106, 50)	--�Z��R������F��	
				elseif GoOut == 2 then
					ChangeZone( obj, 2 , 0,4745, 115, -1968, 51)	--�Z��R���������s����
				elseif GoOut == 3 then
					ChangeZone( obj , 2 , 0, 4472, 52, -35, 54)	--�Z��R�������U�F��
				elseif GoOut == 4 then
					ChangeZone( obj , 2 , 0, 2908, 56, -798, 51)	--�Z��R�������U���
				elseif GoOut == 5 then
					ChangeZone( obj , 2 , 0,2758,55,956,50)	--�Z��R���������X�f
				elseif GoOut == 6 then
					ChangeZone( obj , 2 , 0,5267,61,-3901,50)	--�Z��R����¾�~�j�U
				else
					ChangeZone( obj, 2 , 0,6922,59,-2496,50)	--��̤���
				end
			end
		end

	else --�w�h�Q�����`�᪺�B�z
		PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_IDLE1 )
		ScriptMessage( OwnerID() , -1 , 2 , "[SC_102387_5]" , 0 ) --[102387]���n���j�T�ۡG���ߤ��|�����A�u�|���_�ֿn�A�`���@�ѡA�A�̱N�ڪA��......
		ScriptMessage( OwnerID() , -1 , 0 , "[SC_102387_5]" , C_Red  )
		sleep( 20 )
		ScriptMessage( OwnerID() , -1 , 2 , "[SC_102387_6]" , 0 ) --[102387]���n���j�T�ۡG������������
		ScriptMessage( OwnerID() , -1 , 0 , "[SC_102387_6]" , C_Red  )
		StepDownNumber = 0
	end
	sleep( 20 )
	DelObj( OwnerID() ) --�R���ۤv
end

function LuaI_102387_SubBossShow()
	AddBuff( OwnerID() , 504051 , 0 , 10 )
	sleep(50)
	AddToPartition( OwnerID() ,ReadRoleValue( TargetID() , EM_RoleValue_RoomID ) )
	SetPlot( OwnerID() , "dead" , "LuaFunc_DeadPlay" , 0 )
	CancelBuff_NoEvent( OwnerID() , 504051 )
	SetAttack( OwnerID() , ReadRoleValue( OwnerID() , EM_RoleValue_Register ) )
--	Yell(OwnerID()  , OwnerID() , 5 ) 
end

function LuaI_102387_LittleBossDead()
	SetModeEx(OwnerID() ,EM_SetModeType_Fight , false) 
	BeginPlot( OwnerID() , "LuaI_102387_LittleBossDisappear" , 0 )
	return false
end

function LuaI_102387_LittleBossDisappear()

	SetStopAttack(OwnerID() )
	Lua_CancelAllBuff( OwnerID() )
	SetFightMode( OwnerID() , 0 , 1 , 0 , 0 )
	SetRoleCamp( OwnerID() , "Visitor" )

	local Goal = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	if CheckID( Goal ) == true and ReadRoleValue( Goal , EM_RoleValue_OrgID ) == 102386 then
		local Goal_T = Role:new( Goal )
		for i = 1 , 10 , 1 do
			if GetDistance( OwnerID() , Goal ) < 50 then
				break
			end
			Move( OwnerID() , Goal_T:X() , Goal_T:Y() , Goal_T:Z() )
			sleep(10)
		end
	end

	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_DYING)
	sleep(15)
	Delobj( OwnerID() )
end
--�Y�J�c��
--�P�R�c��
--�ͱ�������
--�����~��
function LuaM_508900_Check()--�Y�J�c��
	local Obj = OwnerID()
	local Target = TargetID()
	if	CheckBuff(Target,508900)	or
		CheckBuff(Target,504057)	then --�ư��ؼ� �Y�J�c��&�P�R�c��
		return false
	end
	return true
end
function LuaM_504057_Check() --�P�R�c��
	local Target = TargetID()
	if	ReadRoleValue(Target,EM_RoleValue_IsDead)==1	 	or
		ReadRoleValue(Target , EM_RoleValue_ZoneID ) ~= 208 		then
DeBugMSG(0,0,"LuaM_504057_Check----Dead :"..ReadRoleValue(Target,EM_RoleValue_IsDead))
DeBugMSG(0,0,"LuaM_504057_Check----ZOID : "..ReadRoleValue(Target , EM_RoleValue_ZoneID ))
		return false
	end
	return true
end
function LuaM_508901_Check()--�ͱ�������
	local Obj = OwnerID()--���a
	local Target = TargetID()--�ؼЪ��a
	if	Obj == Target	then
		return false
	end
	local BuffPos = Lua_BuffPosSearch( Target , 508901 )
DeBugMSG(0,0,"BuffLv = "..BuffInfo(Target,BuffPos,EM_BuffInfoType_Power))
	if	BuffInfo(Target,BuffPos,EM_BuffInfoType_Power)>4	then
		CancelBuff_NoEvent(Target,504057) --�o�ϡG���h�P�R�c��
		CancelBuff(Target,508901) --�M���G�ͱ�������
		ScriptMessage( Target, Target, 2 , "[SC_102387_43]", C_YELLOW )
		ScriptMessage( Target, Target, 0 , "[SC_102387_43]", C_YELLOW )
		return false --�������@��
	end
	PlayMotion(Obj,ruFUSION_ACTORSTATE_EMOTE_KICK) --�ʧ@
	return true
end
function LuaM_493730_Check()--�����~��
	local Target = TargetID()
	local Obj = OwnerID()
	if	ReadRoleValue(Target,EM_RoleValue_IsDead)==1	 	or
		ReadRoleValue(Target , EM_RoleValue_ZoneID ) ~= 208 	or
		CheckBuff(Target,500745)==true				then--����
DeBugMSG(0,0,"LuaM_493730_Check----Dead :"..ReadRoleValue(Target,EM_RoleValue_IsDead))
DeBugMSG(0,0,"LuaM_493730_Check----ZOID : "..ReadRoleValue(Target , EM_RoleValue_ZoneID ))
		return false
	end

	if	Global_508902_DeadCount~= 150	then
		ScriptMessage( Target, Target, 1 , "[SC_102387_46]", C_Red )
		ScriptMessage( Target, Target, 0 , "[SC_102387_46]", C_Red )
	else
		ScriptMessage( Target, Target, 1 , "[SC_102387_44]", C_Red )
		ScriptMessage( Target, Target, 0 , "[SC_102387_44]", C_Red )
	end
	KillID(Obj,Target)
	return true
end


function LuaM_504059_Check()
	local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	if OrgID == 102361 or OrgID == 102362 or OrgID == 102363 then
		CancelBuff_NoEvent( TargetID() , 504051 )
	end
	return false
end

function LuaM_504056_0()
	local You = Role:new( TargetID() )
	local Ball = CreateObj( 113332 , You:X() , You:Y() , You:Z() , You:Dir() , 1 )
	local RoomID = ReadRoleValue( TargetID() , EM_RoleValue_RoomID )
	Lua_ObjDontTouch( Ball )
	WriteRoleValue( Ball, EM_RoleValue_LiveTime , 20 )
	AddToPartition( Ball , RoomID )
	BeginPlot( Ball , "LuaM_504056_1" , 0 )
end

function LuaM_504056_1()
	AddBuff( OwnerID() , 507730 , 0 , -1 ) --�S�ĥΡA�ª�503605
	AddBuff( OwnerID() , 504054 , 10 , 15 ) --��ڶˮ`
end

function LuaI_102387_FireAround()
--	AddBuff(  OwnerID()  , 504098 , 0 , -1)
	local Ball ={}
	local Pos = {}
--	local Dis = 120
	local Boss = Role:new( OwnerID() )
	local RoomID = Boss:RoomID()

	Lua_ObjDontTouch( OwnerID() )

	local EffectA = CreateObj ( 113332  ,Boss:X() , Boss:Y()  ,Boss:Z() , 0 , 1)
	Lua_ObjDontTouch( EffectA )
	SetModeEX( EffectA , EM_SetModeType_Gravity , false )
	MoveToFlagEnabled( EffectA , false )
	AddToPartition( EffectA, RoomID )
	AddBuff( EffectA , 504098 , 0 , -1)
	AddBuff( EffectA , 502725 , 0 , -1 )
	BeginPlot( EffectA  , "LuaI_102387_CheckDel" , 0 )

--	for i = 0 , 5 , 1 do
--		Pos["X"] = Boss:X()+(Dis)*math.cos(i*2*math.pi/6) 
--		Pos["Z"] = Boss:Z()+(Dis)*math.sin(i*2*math.pi/6) 
--		Pos["Y"] = Boss:Y() + 100 + (Dis)*math.cos(i*2*math.pi/6) *0.5*(2^0.5)
--		Ball[i] = CreateObj ( 113332  , Pos["X"] , Pos["Y"]  ,Pos["Z"] , 0 , 1)
--		Lua_ObjDontTouch( Ball[i] )
--		WriteRoleValue( Ball[i] , EM_RoleValue_PID , i )
--		SetModeEX( Ball[i] , EM_SetModeType_Gravity , false )
--		MoveToFlagEnabled( Ball[i] , false )
--		AddToPartition( Ball[i] , RoomID )
--		BeginPlot( Ball[i] , "LuaI_102387_FireAround_Do" , 0 )
--	end
--	for i = 1 , 6 , 1 do
--		Pos["X"] = Boss:X()+(Dis)*math.cos(((i*2)-1)*math.pi/6) 
--		Pos["Z"] = Boss:Z()+(Dis)*math.sin(((i*2)-1)*math.pi/6) 
--		Pos["Y"] = Boss:Y() + 100 - (Dis)*math.cos(((i*2)-1)*math.pi/6)*0.5*(2^0.5)
--		Ball[i] = CreateObj ( 113332  , Pos["X"] , Pos["Y"]  ,Pos["Z"] , 0 , 1)
--		Lua_ObjDontTouch( Ball[i] )
--		WriteRoleValue( Ball[i] , EM_RoleValue_PID , -1*i )
--		SetModeEX( Ball[i] , EM_SetModeType_Gravity , false )
--		MoveToFlagEnabled( Ball[i] , false )
--		AddToPartition( Ball[i] , RoomID )
--		BeginPlot( Ball[i] , "LuaI_102387_FireAround_Do" , 0 )
--	end
end

function LuaI_102387_FireAround_Do()
	
	local OrgRa 
	local Rate
	if ReadRoleValue( OwnerID() , EM_RoleValue_PID ) >= 0 then
		OrgRa = ReadRoleValue( OwnerID() , EM_RoleValue_PID )*2*math.pi/6
		Rate = 1
	else
		OrgRa = ((-1*ReadRoleValue( OwnerID() , EM_RoleValue_PID )*2)-1)*math.pi/6
		Rate = -1
	end
	local Ra = OrgRa
	local Dis = 120
	local Boss= Role:new( TargetID() )
	local Pos = {}

	WriteRoleValue( OwnerID() , EM_Rolevalue_IsWalk , 0 )
	AddBuff( OwnerID() , 504094 , 0 , -1)
--	AddBuff( OwnerID() , 503605 , 0 , -1 )
	while 1 do
		if CheckID( TargetID() ) == false or ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) ~= 102387 then
			break
		end

		Ra = Ra + (Rate/360)* (2*math.pi)


		if Ra >= 2*math.Pi then 
			Ra = Ra - 2*math.Pi
		elseif Ra < 0 then
			Ra = 2*math.pi + Ra
		end

		Pos["X"] = Boss:X()+ dis*math.cos(Ra)
		Pos["Z"] = Boss:Z()+ dis*math.sin(Ra)
		Pos["Y"] = Boss:Y() + 100 + Rate*dis*math.cos(Ra)*0.5*(2^0.5)

		local SleepTime = MoveDirect( OwnerID(), Pos["X"]  , Pos["Y"], Pos["Z"] ) 

		if SleepTime <= 0 then
			SleepTime = 1
		end

		sleep(SleepTime)
	end
	DelObj( OwnerID() )
end

function LuaI_102387_CheckDel()
	while 1 do
		if CheckID( TargetID() ) == false or ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) ~= 102387 then
			break
		end
		sleep( 10 )
	end
	DelObj( OwnerID() )
end

function LuaI_102387_DeadPlot()
	local Obj = OwnerID()
	local Box
	if	CheckBuff(Obj,508590)==true	then
		Box = CreateObj ( 105220 , 767.5 , 190 , 453 , 87.8 , 1)
		AddToPartition(Box,ReadRoleValue(Obj,EM_RoleValue_RoomID))
		SetPlot(Box,"touch","LuaI_102387_BoxTouchPlot",50)
		WriteRoleValue(Box,EM_RoleValue_LiveTime,360)
	end
	return true
end

function LuaI_102387_BoxTouchPlot()
	local Obj = OwnerID()
	local Target = TargetID()
	SetPlot(Target,"touch","",0)
	KillID(Obj,Target)
end