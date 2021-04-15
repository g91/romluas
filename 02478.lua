function lua_ft_kors_begin() --NPC�}�l�@��
	BeginPlot(OwnerID(),"LuaN_miyon_action02",0)
	BeginPlot(OwnerID(),"lua_ft_kors_OnC",0)
end

function lua_ft_kors_OnC() --���ʶ}�һP�_�P�_�j��
	while true do	
	local min = GetSystime(2) --��t�ήɶ�(����)
	local hr = GetSystime(1)-- ��p��
		if  hr == 13 or   hr == 16  or hr == 19 or  hr == 22  then
			if min == 0 then --0���ɰ���X�{�@��
			local p = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
				if p ==0 then	
				WriteRoleValue(OwnerID(),EM_RoleValue_PID,1)
				BeginPlot(OwnerID(),"lua_ft_kors_create",0)
				end				
			end
			if min == 59 then --�R���@��
				local p = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
				if p ~= 0 then
				WriteRoleValue(OwnerID(),EM_RoleValue_PID,0)
				BeginPlot(OwnerID(),"lua_ft_kors_FESclose",0)
				end
			end
		end
	Sleep(600)
	end
end

function lua_ft_kors_create() --�}�l���ʳ�NPC
	for i = 1,50 do
		local ft = {}
		ft[i] =	CreateObjByFlag( 113753,781011, i , 1 )
			SetModeEx(ft[i],EM_SetModeType_Revive,TRUE)
			SetModeEx( ft[i]  , EM_SetModeType_ShowRoleHead, true )
			SetRandMove(ft[i],100,100,50) 
			AddToPartition( ft[i], 0 )	
	end
end

function lua_ft_kors_FESclose() --���ʵ�����NPC
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Count = SetSearchAllNPC( RoomID )
	local Obj
	local NPC = 113753
	if  Count ~= 0 then
		for i=1 , Count , 1 do
			local ID = GetSearchResult()
			Obj=Role:New(ID)
			if Obj:IsNPC() == true then
			local Name = ReadRoleValue( ID , EM_RoleValue_OrgID )--�T�{�Ҧ�NPC���s��
				if Name == NPC then  --�Y���}�C������
						DelObj( ID)
				end
			end
		end
	end
end


function lua_ft_kors_00()--for�@���}�Y
DW_CancelTypeBuff( 68,  OwnerID() )-- �����M�����A
local key = CheckFlag(OwnerID(),545526) 
local key2 = CheckFlag(OwnerID(),545527) 
local key3 = CheckFlag(OwnerID(),545528)
local key4 = CheckFlag(OwnerID(),545564)
local open = ReadRoleValue(TargetID(),EM_RoleValue_PID)
	if open ~= 0 then --���ʮɶ�
		if key ==FALSE and key2 == FALSE  then
			SetSpeakDetail(OwnerID(),"[SC_FT_FES_KORS_00]")
			AddSpeakOption(OwnerID(),TargetID(),"[SC_FT_FES_KORS_01]","lua_ft_kors_01",0)
		elseif key == TRUE and key2 == FALSE then
			SetSpeakDetail(OwnerID(),"[SC_FT_FES_KORS_05]")
		elseif key2 == TRUE and key3 == FALSE then
			SetSpeakDetail(OwnerID(),"[SC_FT_FES_KORS_05]")
				if key4 == TRUE then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_FT_FES_KORS_15]","lua_ft_kors_AW",0)
				end
		elseif key3 == TRUE then
			SetSpeakDetail(OwnerID(),"[SC_FT_FES_KORS_16]")
		end
	elseif open == 0 then --�D���ʮɶ�
		SetSpeakDetail(OwnerID(),"[SC_FT_FES_KORS_04]")
	end
end

function lua_ft_kors_01() --�����@��
	SetSpeakDetail(OwnerID(),"[SC_FT_FES_KORS_02]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_FT_FES_KORS_03]","lua_ft_kors_Start",0)
end

function lua_ft_kors_Start() --���ʶ}�l
	CloseSpeak(OwnerID())
	SetFlag(OwnerID(),545526,1)
	GiveBodyItem(OwnerID(),240041,1)
	AddBuff(OwnerID(),620804,1,180)
	WriteRoleValue(OwnerID(),EM_RoleValue_Register+1,0)
	ScriptMessage(OwnerID(),OwnerID(),1,"[SC_FT_FES_KORS_06]",C_SySTEM)
end


function lua_ft_kors_false()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local npcm = SetSearchAllNPC( RoomID )
		for i=1 , npcm, 1 do 											 
			local npcde = GetSearchResult()	
				if ReadRoleValue(npcde,EM_RoleValue_OrgID) == 113753 then
					if ReadRoleValue(npcde,EM_RoleValue_PID) == OwnerID() then
							DelObj(npcde)
						local ft  = {}
						local c =Rand(40)
							ft[i] =CreateObjByFlag( 113753,781011, c , 1 )
							SetModeEx(ft[i],EM_SetModeType_Revive,TRUE)
							SetModeEx( ft[i]  , EM_SetModeType_ShowRoleHead, true )
							SetRandMove(ft[i],100,100,50) 
							AddToPartition( ft[i], 0 )	
					end
				end
		end
		ScriptMessage(OwnerID(),OwnerID(),0,"[SC_FT_FES_KORS_20]",C_SySTEM)
		SetFlag(OwnerID(),545527,1)
		SetFlag(OwnerID(),545528,1)
		SetFlag(OwnerID(),545564,1)
end

function lua_ft_kors_SQchek()
	while TRUE do
		local player = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
		if CheckID( player ) == FALSE then
			local ft  = {}
				local c =Rand(40)
				ft[i] =CreateObjByFlag( 113753,781011, c , 1 )
				SetModeEx(ft[i],EM_SetModeType_Revive,TRUE)
				SetModeEx( ft[i]  , EM_SetModeType_ShowRoleHead, true )
				SetRandMove(ft[i],100,100,50) 
				AddToPartition( ft[i], 0 )	
		Sleep(5)
			DelObj(OwnerID())
		end
	Sleep(50)
	end
end

function lua_ft_kors_Nautilus() --�x�M���ϥ�
local tar = ReadRoleValue(TargetID(),EM_RoleValue_OrgID)
local count = ReadRoleValue(OwnerID(),EM_RoleValue_Register+1)
local loot = ReadRoleValue(TargetID(),EM_RoleValue_PID)
	if tar ~= 113753 then --�ؼп��~
		ScriptMessage(OwnerID(),OwnerID(),1,"[SC_FT_FES_KORS_07]",C_SySTEM)
	elseif tar == 113753 then --�ؼХ��T
		local OID =OwnerID()
		if loot == 0 then --�D�m��
			PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_PLAY_SAXOPHONE)
			PlaySound(OwnerID(),"sound/sound_new/skill/Music_Festival/instruments/french_horn.mp3",FALSE)
			AddBuff(TargetID(),620803,1,180)
			WriteRoleValue(OwnerID(),EM_RoleValue_Register+1,count+1)
			WriteRoleValue(TargetID(),EM_RoleValue_PID,OID)
			BeginPlot(TargetID(),"lua_ft_kors_SQchek",0)
		elseif loot ~= 0 and loot ~= OID then --�m�ܨӪ�
			PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_PLAY_SAXOPHONE)
			PlaySound(OwnerID(),"sound/sound_new/skill/Music_Festival/instruments/french_horn.mp3",FALSE)
			AddBuff(TargetID(),620803,1,180)
			WriteRoleValue(OwnerID(),EM_RoleValue_Register+1,count+1)
			WriteRoleValue(TargetID(),EM_RoleValue_PID,OID)
			local lootcount =ReadRoleValue(loot,EM_RoleValue_Register+1)
			WriteRoleValue(loot,EM_RoleValue_Register+1,lootcount-1)
			BeginPlot(TargetID(),"lua_ft_kors_SQchek",0)
		elseif loot ~= 0 and loot == OID then
			ScriptMessage(OwnerID(),OwnerID(),1,"[SC_FT_FES_KORS_19]",C_SySTEM) 
		end	
			ScriptMessage(OwnerID(),OwnerID(),0,"[SC_FT_FES_KORS_08]",C_SySTEM)		
			SetFollow(TargetID(),OwnerID())
			BeginPlot(OwnerID(),"lua_ft_kors_check",10)
	end	
end

function lua_ft_kors_check() --�˹�O�_��5��
local count = ReadRoleValue(OwnerID(),EM_RoleValue_Register+1)
	if count >= 4 then
		ScriptMessage(OwnerID(),OwnerID(),1,"[SC_FT_FES_KORS_09]",C_SySTEM)
		SetFlag(OwnerID(),545527,1)
	end
end

function lua_ft_kors_catch() --�^������NPC
local key = CheckFlag(OwnerID(),545526) 
local key2 = CheckFlag(OwnerID(),545527) 
local key3 = CheckFlag(OwnerID(),545564)
local open = ReadRoleValue(TargetID(),EM_RoleValue_PID)
local report = ReadRoleValue(OwnerID(),EM_RoleValue_Register+1)
	if open == 0 then
		if key ==FALSE and key2 == FALSE  then
			SetSpeakDetail(OwnerID(),"[SC_FT_FES_KORS_10]")
		elseif key == TRUE and key3 == FALSE then
			SetSpeakDetail(OwnerID(),"[SC_FT_FES_KORS_11]")
			if report >= 4 then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_FT_FES_KORS_12]","lua_ft_kors_report",0)
			end
		elseif key3 == TRUE then
			SetSpeakDetail(OwnerID(),"[SC_FT_FES_KORS_18]")
		end
	elseif open ~= 0 then
		SetSpeakDetail(OwnerID(),"[SC_FT_FES_KORS_04]")
	end
end

function lua_ft_kors_report() --�^��
local count = ReadRoleValue(OwnerID(),EM_RoleValue_Register+1)
		SetFlag(OwnerID(),545564,1)
	if count <= 7 then
		SetSpeakDetail(OwnerID(),"[SC_FT_FES_KORS_13]")
		BeginPlot(OwnerID(),"lua_ft_kors_Del",0)
	elseif count > 7 and count <= 12 then
		SetSpeakDetail(OwnerID(),"[SC_FT_FES_KORS_14]")
		BeginPlot(OwnerID(),"lua_ft_kors_Del",0)
		GiveBodyItem(OwnerID(),530776,1)
	elseif count >12 then
		SetSpeakDetail(OwnerID(),"[SC_FT_FES_KORS_14]")
		BeginPlot(OwnerID(),"lua_ft_kors_Del",0)
		GiveBodyItem(OwnerID(),530725,1)
 	end
			WriteRoleValue(OwnerID(),EM_RoleValue_Register+1,0)
			CancelBuff_NoEvent(OwnerID(),620804)
end	

function lua_ft_kors_Del() --�^����R������
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local npcm = SetSearchAllNPC( RoomID )
		for i=1 , npcm, 1 do 											 
			local npcde = GetSearchResult()	
				if ReadRoleValue(npcde,EM_RoleValue_OrgID) == 113753 then
					if ReadRoleValue(npcde,EM_RoleValue_PID) == OwnerID() then
							DelObj(npcde)
						local ft  = {}
						local c =Rand(40)
							ft[i] =CreateObjByFlag( 113753,781011, c , 1 )
							SetModeEx(ft[i],EM_SetModeType_Revive,TRUE)
							SetModeEx( ft[i]  , EM_SetModeType_ShowRoleHead, true )
							SetRandMove(ft[i],100,100,50) 
							AddToPartition( ft[i], 0 )	
					end
				end
		end
end	

function lua_ft_kors_AW() --���y
	SetSpeakDetail(OwnerID(),"[SC_FT_FES_KORS_17]")
	GiveBodyItem(OwnerID(),240059,5)
	DelBodyItem(OwnerID(),240041,1)
	SetFlag(OwnerID(),545528,1)
	WriteRoleValue(OwnerID(),EM_RoleValue_Register+2,0)
end

function lua_ft_kors_Topen() --for testopen
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Count = SetSearchAllNPC( RoomID )
	local Obj
	local NPC = 119224
	if  Count ~= 0 then
		for i=1 , Count , 1 do
			local ID = GetSearchResult()
			Obj=Role:New(ID)
			if Obj:IsNPC() == true then
			local Name = ReadRoleValue( ID , EM_RoleValue_OrgID )--�T�{�Ҧ�NPC���s��
				if Name == NPC then  --�Y���}�C������
					WriteRoleValue(ID,EM_RoleValue_PID,1)
					BeginPlot(OwnerID(),"lua_ft_kors_create",0)
				end
			end
		end
	end
end

function lua_ft_kors_Tclose() --for testclose
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Count = SetSearchAllNPC( RoomID )
	local Obj
	local NPC = 119224
	if  Count ~= 0 then
		for i=1 , Count , 1 do
			local ID = GetSearchResult()
			Obj=Role:New(ID)
			if Obj:IsNPC() == true then
			local Name = ReadRoleValue( ID , EM_RoleValue_OrgID )--�T�{�Ҧ�NPC���s��
				if Name == NPC then  --�Y���}�C������
					WriteRoleValue(ID,EM_RoleValue_PID,0)
					BeginPlot(OwnerID(),"lua_ft_kors_FESclose",0)
				end
			end
		end
	end
end

function lua_ft_kors_Redo() --redo use
	local Owner = OwnerID()
	SetFlag(Owner, 545526,0)
	SetFlag(Owner, 545527,0)
	SetFlag(Owner, 545528,0)
	SetFlag(Owner, 545564,0)
	SetFlag(Owner, 541322, 0) --2012�ɯ�
	SetFlag(Owner, 548188, 0 ) --2013���ܼ@�ΡX�p���U
	CancelBuff(Owner,620804)
	DelBodyItem(Owner,240041,1)
	WriteRoleValue(Owner,EM_RoleValue_Register+1,0)
	WriteRoleValue(Owner,EM_RoleValue_Register+2,0)
--	BeginPlot(Owner,"lua_ft_kors_Del",0)
	BeginPlot(Owner,"Lua_na_2012Fairy_Reset",0 )--�`
end

function lua_ft_REplay() -- for ���m��
	SetFlag(OwnerID(),545525,0)
	BeginPlot(OwnerID(),"lua_ft_kors_Redo",0)
	ScriptMessage(OwnerID(),OwnerID(),0,"[SC_FT_FES_KORS_21]",C_SySTEM)
end