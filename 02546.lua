function lua_pfes_kors_DXCon()--中控器
local oid = OwnerID()
local NPC 
local NPC2 
local room = ReadRoleValue (OID , EM_RoleValue_RoomID )
	while TRUE do
	local hr = GetSystime(1)-- 抓小時
	local min = GetSystime(2)--抓目前分鐘
		if hr == 13 or hr == 15 or hr == 17 or hr == 19 or hr == 21 or hr == 23 then
			if min == 10 then --創出南瓜小姐
				NPC = CreateObjByFlag ( 119979 , 781051 , 0 , 1 )
				MoveToFlagEnabled(NPC,FALSE)
				WriteRoleValue(NPC,EM_RoleValue_IsWalk,0)
				AddToPartition ( NPC ,0 )
				local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
				local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
				if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
					RunningMsgEx( oid, 2 , 3 , "[SC_PFES_KORS_QDX_00]" ) 
				end
				NPC2 = CreateObjByFlag ( 119974 , 781052 , 0 , 1 )
				MoveToFlagEnabled(NPC2,FALSE)
				WriteRoleValue(NPC2,EM_RoleValue_IsWalk,0)
				BeginPlot ( NPC2 , "lua_pfes_kors_DXrun",0)
				AddToPartition ( NPC2,0 )
			elseif min == 50 then --刪除
				local count = SetSearchAllNPC( room )
				for i = 1, count ,1 do
					local NPC = GetSearchResult() 
					local OrgID = ReadRoleValue( NPC ,EM_RoleValue_OrgID )
						if OrgID == 119974 or OrgID == 119979 then				
						DelObj(NPC)
						end
				end
			end
		end
	Sleep(600)
	end
end

function lua_pfes_kors_DX00()		  --對話劇情
local OID = OwnerID()
local TID = TargetID()
local key = CheckFlag( OID , 546000 ) 	 --任務都沒開始
local key2 = CheckFlag( OID , 546001)	--追到第一次
local key3 = CheckFlag ( OID , 546002 )	 --追到第二次
local key4 = CheckFlag ( OID , 546003 )	 --追到3次了
local gift = CheckFlag ( OID , 546004 )	 --領到獎了
	if key == FALSE and key4 == FALSE  then
		SetSpeakDetail ( OID ,"[SC_PFES_KORS_QDX_01]" )
		AddSpeakOption ( OID , TID , "[SC_PFES_KORS_QDX_02]","lua_pfes_kors_DXapply" , 0 )
	elseif key == TRUE and key2 == FALSE then
		SetSpeakDetail ( OID , "[SC_PFES_KORS_QDX_06]" )
	elseif key2 == TRUE and KEY3 == FALSE then
		SetSpeakDetail ( OID , "[SC_PFES_KORS_QDX_07]")
	elseif key3 == TRUE and key4 == FALSE then
		SetSpeakDetail ( OID , "[SC_PFES_KORS_QDX_07]" )
	elseif key4 == TRUE and gift == FALSE then 
		SetSpeakDetail ( OID ,"[SC_PFES_KORS_QDX_07]" )
		AddSpeakOption ( OID, TID , "[SC_PFES_KORS_QDX_08]" , " lua_pfes_kors_DXGIFT" , 0 )
	elseif gift == TRUE then
		SetSpeakDetail ( OID , "[SC_PFES_KORS_QDX_11]" )
	end
end

function lua_pfes_kors_DXapply() --選擇是否答應參加
local OID = OwnerID()
local TID = TargetID ()
	SetSpeakDetail ( OID , "[SC_PFES_KORS_QDX_03]" )
	AddSpeakOption ( OID , TID , " [SC_PFES_KORS_QDX_04]", "lua_pfes_kors_DXgoto" , 0 )
end

function lua_pfes_kors_DXgoto() --出發給flag
local OID = OwnerID()
local TID = TargetID()
	CloseSpeak ( OID )
	ScriptMessage ( TID , OID , 2 , "[SC_PFES_KORS_QDX_05]" , C_SYSTEM)
	SetFlag ( OID , 546000 , 1 )
end

function lua_pfes_kors_DXGIFT() --交回南瓜先生信物
local OID = OwnerID()
local TID = TargetID()
	SetSpeakDetail(OID , "[SC_PFES_KORS_QDX_09]")
	AddSpeakOption( OID ,TID, "[SC_PFES_KORS_QDX_10]" ,"lua_pfes_kors_DXgive", 0)
--	DelBodyItem( OID , 240508 , 1 )
end

function lua_pfes_kors_DXgive()	 --得到獎勵。
local OID = OwnerID()
	CloseSpeak( OID )
	GiveBodyItem( OID , 209433 , 6)
	DelBodyItem( OID , 240508 , 1 )
	SetFlag ( OID , 546004 ,1 )
end


function lua_pfes_kors_DXrun() --南瓜逃跑中
local OID = OwnerID()
local flag = 781052
local boost = 621333
	while TRUE do
		local MOVEn = Rand(10)
		local RUN = ReadRoleValue( OID , EM_RoleValue_PID )
		local lastRun = ReadRoleValue ( OID ,EM_RoleValue_Register1)
		local min = GetSystime(2)--抓目前分鐘
		if RUN >= 4 then
		LuaFunc_MoveToFlag ( OID , flag , MOVEn , 25 )
		WriteRoleValue(OID , EM_RoleValue_PID ,0)
		AddBuff ( OID , boost , 1 , 10 )
		WriteRoleValue(OID ,EM_RoleValue_Register1 ,min)
		end
		if ( min - lastRun ) >=3 then
		LuaFunc_MoveToFlag ( OID , flag , MOVEn , 25 )
		WriteRoleValue( OID , EM_RoleValue_Register1 ,min)
		end
	Sleep(200)
	end
end

function lua_pfes_kors_DXarun()
local OID = OwnerID()
local room = ReadRoleValue(OID ,EM_RoleValue_RoomID)
local count = SetSearchAllPlayer( room )
	for i = 1 , count , 1  do
		local Player = GetSearchResult() 
		if CheckFlag( Player , 546000 ) == TRUE and CheckDistance( OID , Player , 120 ) == TRUE  then 
			local mov = Rand(10)
			ScriptMessage( oid , 0 , 2 , "[SC_PFES_KORS_QDX_13]", C_SYSTEM)
			LuaFunc_MoveToFlag(OID ,781052 , mov , 15 )
			return
		end
	end
end

function lua_pfes_kors_DXtalk() --南瓜先生的talk
local OID =OwnerID()
local TID = TargetID()
local KEY = CheckFlag ( OID , 546000)
local KEY2 = CheckFlag ( OID , 546001 )
local KEY3 = CheckFlag ( OID , 546002 )
local KEY4 = CheckFlag ( OID , 546003 )
local gift = CheckFlag ( OID , 546004 )
local GO = ReadRoleValue ( TID , EM_RoleValue_PID )
local CHECKTIME = 621501
local boost = 621333
		if KEY == FALSE and gift == FALSE then			--沒再追逐
			SetSpeakDetail ( OID ,"[SC_PFES_KORS_QDX_12]" )
		elseif key == TRUE and key2 == FALSE then		--追逐到第一次
			SetSpeakDetail ( OID , "[SC_PFES_KORS_QDX_14]" )
			BeginPlot( TID , "lua_pfes_kors_DXarun" , 0)
			SetFlag( OID , 546001 ,1 )
			AddBuff ( OID , CHECKTIME , 1 , 20 )
			AddBuff ( TID , boost , 1 , 10 )
			WriteRoleValue(TID ,EM_RoleValue_PID ,GO+1)
		elseif KEY2 == TRUE and KEY3 == FALSE then		--追逐到第二次
			if CheckBuff ( OID , CHECKTIME ) == FALSE then
			SetSpeakDetail ( OID , "[SC_PFES_KORS_QDX_17]" )
				SetFlag( OID , 546002 ,1 )
				AddBuff ( OID , CHECKTIME , 1 , 20 )
				AddBuff ( TID , boost , 1 , 10 )
				WriteRoleValue(TID ,EM_RoleValue_PID ,GO+1)
				BeginPlot( TID , "lua_pfes_kors_DXarun" , 0)
			else
			SetSpeakDetail ( OID , "[SC_PFES_KORS_QDX_14]" )
			end
		elseif key3 == TRUE and KEY4 == FALSE then		--追到第三次
			if CheckBuff ( OID , CHECKTIME ) == FALSE then
			SetSpeakDetail ( OID , "[SC_PFES_KORS_QDX_15]" )
			GiveBodyItem( OID , 240508, 1)
			SetFlag( OID, 546003 ,1 )
			AddBuff ( OID , CHECKTIME , 1 , 20 )
			WriteRoleValue(TID ,EM_RoleValue_PID ,GO+1)
			else
			SetSpeakDetail ( OID , "[SC_PFES_KORS_QDX_17]" )	
			BeginPlot( TID , "lua_pfes_kors_DXarun" , 0)
			end
		elseif KEY4 ==TRUE and gift == FALSE then 		--回報
			SetSpeakDetail( OID , "[SC_PFES_KORS_QDX_15]" )
		elseif gift == TRUE then					--今天完成過了
			SetSpeakDetail ( OID , "[SC_PFES_KORS_QDX_16]" )
		end
end

function lua_pfes_kors_DXtestON()
local oid = OwnerID()
local NPC = 0 
local NPC2 = 0
	NPC = CreateObjByFlag ( 119979 , 781051 , 0 , 1 )
	MoveToFlagEnabled(NPC,FALSE)
	WriteRoleValue(NPC,EM_RoleValue_IsWalk,0)
	AddToPartition ( NPC ,0 )
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
	if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
		RunningMsgEx( oid, 2 , 3 , "[SC_PFES_KORS_QDX_00]" ) 
	end
	NPC2 = CreateObjByFlag ( 119974 , 781052 , 0 , 1 )
	MoveToFlagEnabled(NPC2,FALSE)
	BeginPlot ( NPC2 , "lua_pfes_kors_DXrun",0)
	WriteRoleValue(NPC2,EM_RoleValue_IsWalk,0)
	AddToPartition ( NPC2,0 )
end

function lua_pfes_kors_DXtestEND()
local OID = OwnerID()
local room = ReadRoleValue (OID , EM_RoleValue_RoomID )
local count = SetSearchAllNPC( room )
	for i = 1, count ,1 do
		local NPC = GetSearchResult() 
		local OrgID = ReadRoleValue( NPC ,EM_RoleValue_OrgID )
			if OrgID == 119974 or OrgID == 119979 then				
				DelObj(NPC)
			end
	end
end

function lua_pfes_kors_DXBREAK()
SetFlag( OwnerID(), 546004 ,1 )
end

function lua_pfes_kors_DXreDO()
local OID = OwnerID()
local flag = {546000 , 546001 , 546002 , 546003 , 546004 }
	for i = 1,5,1 do
		SetFlag(OID , flag[i] , 0)
	end
end