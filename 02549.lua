---�����U�O�����F�A�����j�b�PNPC���W�C�t�~�]���ǰe�L�h�F=_=
function Lua_kors_pfes_Q4create()
local OID = OwnerID()
BeginPlot(OID,"LuaN_miyon_action02",0)
end

function Lua_kors_pfes_Q4() --Q4���
local OID = OwnerID()
local TID = TargetID()
local key = CheckFlag(OID,546011) --�����ȧ_
local keyO = CheckFlag(OID,546007) --�e�@���ȬO�_����������
local key2 = CheckFlag(OID,546012) --�ӱ����ȧ����_
local key3 = CheckFlag(OID,546013) --�^�������_
local doing = ReadRoleValue(TID , EM_RoleValue_Register9 )
	if doing == 0 then
		if keyO == TRUE then
			if key == FALSE and key2 == FALSE then
				SetSpeakDetail(OID,"[SC_PFES_KORS_Q4_00]")
				AddSpeakOption(OID,TID,"[SC_PFES_KORS_Q4_11]","Lua_kors_pfes_Q4_app",0)
			elseif key == TRUE and key2 ==FALSE then
				SetSpeakDetail(OID,"[SC_PFES_KORS_Q4_01]")
				AddSpeakOption(OID,TID,"[SC_PFES_KORS_Q4_12]","Lua_kors_pfes_Q4_ST",0)
			elseif key2 == TRUE and key3 == FALSE then
				SetSpeakDetail(OID,"[SC_PFES_KORS_Q4_02]")
				AddSpeakOption(OID,TID,"[SC_PFES_KORS_Q4_13]","Lua_kors_pfes_Q4fin",0)
			elseif key3 == TRUE then
				SetSpeakDetail(OID,"[SC_PFES_KORS_Q4_03]")
			end
		elseif keyO == FALSE then
			SetSpeakDetail(OID,"[SC_PFES_KORS_Q4_04]")
		end	
	else
		ScriptMessage(OID,OID,1,"[SC_PFES_KORS_Q4_05]",C_SYSTEM)
	end
end

function Lua_kors_pfes_Q4_app()			--�����ѥ[
local OID = OwnerID()
local TID = TargetID()
	SetSpeakDetail(OID,"[SC_PFES_KORS_Q4_06]")
	AddSpeakOption(OID, TID,"[SC_PFES_KORS_Q4_12]","Lua_kors_pfes_Q4_ST",0)
end

function Lua_kors_pfes_Q4_ST()				--�Ұʰѥ[�åB�N���a�ǰe�L�h�C
local OID = OwnerID()
local TID = TargetID()
local party = {}
local count = GetPartyID( OID, -1 )

		CloseSpeak(OID)
	if count ~= 0 then
		for i = 1, count , 1 do
		 	party[i] = GetPartyID(OID , i )
			SetFlag (party[i],546011, 1 )
		end
	local tcon = LuaFunc_CreateObjByObj( con , TID )
	WriteRoleValue( tcon , EM_RoleValue_Register9 , OID )
	WriteRoleValue (tcon, EM_RoleValue_Register8 , TID )
	WriteRoleValue( TID , EM_RoleValue_Register9 , 1)
	elseif count == 0 then
		ScriptMessage(OID,OID , 1 ,-1, "[SC_PFES_KORS_Q4_10]",C_SYSTEM)
	end	
end

function Lua_kors_pfes_Q4fin()
local OID =OwnerID()
local TID = TargetID()
	CloseSpeak(OID )
	GiveBodyItem (OID , iD, 3)
	SetFlag (OID , 546013, 1 )
end	


function Lua_kors_pfes_Q4Tcon()--Q4���ʤ���
local OID = OwnerID()  							--������
local tree = {}								--��TABLE
local treeID = 0								--�Q�襤����
local star = 0								--�}���}��
local score = 0								--����
local player = ReadRoleValue(OID , EM_RoleValue_Register9 )		--���a��ID�A�춤���
local partycount = GetPartyID( player , -1) 				--����H��
local party = {}
local fal = 0								--���Ѷ}��
local complete = 0							--�����}��
local time = 0								--�X�Ǫi��
local lock = 0								--�X����
local monster = {}							--�Ǫ�TABLE
local life = 0								--�Ǫ��s���q
local dura = ReadRoleValue(OID , EM_RoleValue_Register8 )
	for i = 1,4 do
		tree[i] = CreateObjByFlag(106493,781056, i ,1)
		SetModeEx( tree[i], EM_RoleValue_Fight , TRUE)		--����
		SetModeEx( tree[i], EM_SetModeType_Strikback, FALSE )	--����
		SetModeEx(  tree[i], EM_SetModeType_Obstruct, TRUE )	--����
		SetModeEx(  tree[i], EM_SetModeType_Move, FALSE )	--����
		AddBuff ( tree[i] , 621332 , 1 , -1 )
		AddToPartition(tree[i],0)
	end
		ScriptMessage (OID , 0 , 2 , "[SC_PFES_KORS_Q4_09]",C_SYSTEM)
		Sleep(100)
	while TRUE do 
		if star == 0 then					--�}��
			local  gr= Rand (3)+1	
			treeID = tree[gr]
			star = star +1 
		end
		if treeID ~= 0 and star ~= 0 then				--�ˬd�ؼЦu�@�O�_���ѡC
			if CheckBuff ( treeID , buff ) == FALSE then
				fal = fal+1
			end
		end 
		if lock  == 0 then
			if time <= 5 then
				for i = 1 ,8 do
				local r = Rand(3)+1
				monster[i] = CreateObjByFlag(106492 , 781055 ,i , 1 )
				SetModeEx( monster[i], EM_RoleValue_Fight , TRUE)
				SetModeEx( monster[i], EM_SetModeType_Strikback, FALSE )	--����
				SetModeEx(  monster[i], EM_SetModeType_Obstruct, TRUE )	--����
				SetModeEx(  monster[i], EM_SetModeType_Move, FALSE )	--����
				SetAttack (monster[i] , tree[r] )
				AddToPartition (monster[i],0)
				end
			time = time +1
			lock = lock+1
			life = 8
			elseif time == 6 then
				local flagR = Rand (8)
				monster[flagR] = CreateObjByFlag(106491 , 781055 , flagR , 1)
				SetModeEx( monster[flagR], EM_RoleValue_Fight , TRUE)
				SetModeEx( monster[flagR], EM_SetModeType_Strikback, FALSE )	--����
				SetModeEx(  monster[flagR], EM_SetModeType_Obstruct, TRUE )	--����
				SetModeEx(  monster[flagR], EM_SetModeType_Move, FALSE )		--����
--				SetPlot (monster[flagR] , "dead" , "Lua_kors_pfes_PKMdead",50)
				WriteRoleValue ( monster[flagR], EM_RoleValue_Register1 , tree )
				SetAttack (monster[i] , treeID )
				AddToPartition( monster[flagR] , 0 )
			lock = lock+1
			life = life+1
			end
		elseif lock ~= 0 then
			local count = table.getn(monster)
			for e = 1, count ,1 do 
				if  CheckID ( monster[e] ) == FALSE then			
					life = life - 1						
					table.remove (monster , e ) 				--�Ǫ������R����TABLE��m�A�����
				end
			end
			if life == 0 then
				if time <= 6 then 
				lock = 0
				else
				complete = complete+1	
				end
			end
		end
		if fal ~= 0 and star ~= 0 then 							--����
			ScriptMessage(OID , 0 , 2 , "[SC_PFES_KORS_Q4_07]" , C_SYSTEM)
			WriteRoleValue( dura , EM_RoleValue_Register9 , 0)
			Sleep(10)
			DelObj(OID)
		end	
		if complete ~= 0 and star ~= 0 then 
			for f = 1, partycount , 1 do
				party[f] = GetPartyID(player , f )
				if CheckFlag (party[f] ,546011) == TRUE then
					SetFlag(player[f] , 546012 , 1 )
				end
			end
			WriteRoleValue( dura , EM_RoleValue_Register9 , 0)
			ScriptMessage(OID , 0 , 2 ,"[SC_PFES_KORS_Q4_08]",C_SYSTEM)
			Sleep(10)
			DelObj (OID )
		end				
	Sleep (100)
	end	
end
 

		