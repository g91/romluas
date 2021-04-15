function Lua_ying_clearpkbuff()	--�M��PK�O�@

	local Player = OwnerID()

	CancelBuff( Player , 502931 ) --�@��PK�O�@
	CancelBuff( Player , 502932 )
	CancelBuff( Player , 502933 )
	-- �W�߾Գ����ե�
	InitBgIndependence( Player , Def_InitBgIndependence_MaxWeaponSkill+Def_InitBgIndependence_MaxMagicSkill+Def_InitBgIndependence_TitleClear+Def_InitBgIndependence_KeyItemClear+Def_InitBgIndependence_QuestClear )
--	DebugMsg( 0 , 1 , "--------------------------------------Player="..Player )
end

function LuaZone_All_World_BG_JoinQueue( dbid, BattleGroundType, WorldGroupID, LevelGroupID )
	local TotalTeam	= GetNumTeam()-- ���o�o�Գ��̦h���\������ƶq
	local MaxPlayerNum = GetMaxTeamMember()	--���o�ӾԳ��C���̦h���\�H��
	local MaxTotal= MaxPlayerNum*TotalTeam
	local TotalRoom	= GetBattleGroundRoomID( -1 )--���o�{�����ж��`��
	DebugLog( 6, "<BGALL> Player "..dbid..", join queue" )
	DebugLog( 6, "<BGALL> MaxTotal= "..MaxTotal )
	-- �p�G�w�g���ж����b���A�N��C�өж����Y�C�@�����H�ƺ�i�Ӷ����`�H�Ʒ�
	local NearFullRoom = nil
	local NearFullPlayerNum = nil
	local MinNumTeamType=0;--���[�J���@��
	--��H�Ƭۮt�̤֪��ж�
	if TotalRoom==0 then--�٨S�}���A��̤֤H��Queue�e
		local QueueNum=0;
		local Supposition=20;--���i��d�F20�H
		for TeamType=1,TotalTeam,1 do
			QueueNum=GetNumQueueMember(LevelGroupID,TeamType);
			if Supposition>QueueNum then
				Supposition=QueueNum;
				MinNumTeamType=TeamType;
			end
		end
		return MinNumTeamType
	else
		local RoomData={};
		local Drop=MaxPlayerNum;
		for RoomSN=1,TotalRoom,1 do--��X�C�ӾԳ��`�H��;��X�ثe�p��
			local MaxNum,MinNum=0,0;
			local MinTeamNum=MaxPlayerNum;--�����̤j��
			RoomData[RoomSN]={};
			for TeamType=1,TotalTeam,1 do
				local TeamSize=GetNumEnterTeamMember(RoomSN,TeamType);
				if TeamType==1 then
					MaxNum=TeamSize;
					MinNum=TeamSize;
					RoomData[RoomSN]["InferiorityType"]=TeamType;
				else
					if MaxNum<=TeamSize then
						MaxNum=TeamSize;
					end
					if MinNum>=TeamSize then
						MinNum=TeamSize;
						RoomData[RoomSN]["InferiorityType"]=TeamType;
					end
				end
			end
			RoomData[RoomSN]["Drop"]=MaxNum-MinNum;
			if RoomData[RoomSN]["Drop"]~=0 then
				if Drop>=RoomData[RoomSN]["Drop"] then
					Drop=RoomData[RoomSN]["Drop"];
				end
			end
		end
		if Drop==MaxPlayerNum then--�Y�Ҧ��ж��դO�����šA��̤֤H��Queue�e
			local Supposition=20;--���i��d�F20�H
			for TeamType=1,TotalTeam,1 do
				local QueueNum=GetNumQueueMember(LevelGroupID,TeamType)
				if Supposition>QueueNum then
					Supposition=QueueNum;
					MinNumTeamType=TeamType;
				end
			end
			return MinNumTeamType;
		end
		for RoomSN=1,TotalRoom,1 do--�簣���H�Ƹ��t�Ӥj��
			if RoomData[RoomSN]["Drop"]>Drop or RoomData[RoomSN]["Drop"]==0 then
				RoomData[RoomSN]=nil;
			end
		end
		local Statistic={}
		for TeamType=1,TotalTeam,1 do
			Statistic[TeamType]=0;
		end
		for RoomSN,Data in pairs(RoomData) do
			Statistic[Data["InferiorityType"]]=Statistic[Data["InferiorityType"]]+1;
		end
		local InferiorityType=TotalRoom;
		local AssignTeamType=0;
		for TeamType=1,TotalTeam,1 do--��X�H�Ƹ��t�̤֪��ж� �åB �̤֪��H��Queue�e
			if InferiorityType>=Statistic[TeamType] and Statistic[TeamType]~=0 then
				InferiorityType=Statistic[TeamType];
				AssignTeamType=TeamType
			end
		end
		return AssignTeamType;
	end
	--��̺����ж�
--	if TotalRoom==0 then--�٨S�}���A��̤֤H��Queue�e
--		local QueueNum=0;
--		local Supposition=20;--���i��d�F20�H
--		for TeamType=1,TotalTeam,1 do
--			QueueNum=GetNumQueueMember(LevelGroupID,TeamType);
--			if Supposition>QueueNum then
--				Supposition=QueueNum;
--				MinNumTeamType=TeamType;
--			end
--		end
--		return MinNumTeamType
--	else
--		local StandardNearFull=MaxTotal;
--		local RoomData={};
--		for RoomSN=1,TotalRoom,1 do--��X�C�ӾԳ��`�H��;��X�ثe�p��
--			local ThisRoundNear=MaxTotal;
--			local MinTeamNum=MaxPlayerNum;--�����̤j��
--			RoomData[RoomSN]={};
--			for TeamType=1,TotalTeam,1 do
--				local TeamSize=GetNumEnterTeamMember(RoomSN,TeamType);
--				RoomData[RoomSN]["Total"]=RoomData[RoomSN]["Total"]+TeamSize;
--				if TeamSize<=MinTeamNum then
--					MinTeamNum=TeamSize;
--					RoomData[RoomSN]["InferiorityType"]=TeamType;
--				end
--			end
--			ThisRoundNear=MaxTotal-RoomData[RoomSN]["Total"];
--			if ThisRoundNear~=0 then
--				if ThisRoundNear<=StandardNearFull then
--					StandardNearFull=ThisRoundNear;--��s�з�
--				end
--			end
--		end
--		if StandardNearFull==MaxTotal then--�Y�Ҧ��ж������A��̤֤H��Queue�e
--			local Supposition=20;--���i��d�F20�H
--			for TeamType=1,TotalTeam,1 do
--				local QueueNum=GetNumQueueMember(LevelGroupID,TeamType)
--				if Supposition>QueueNum then
--					Supposition=QueueNum;
--					MinNumTeamType=TeamType;
--				end
--			end
--			return MinNumTeamType;
--		end
--		for RoomSN=1,TotalRoom,1 do--�簣���H�Ƹ��t�Ӥj��
--			if MaxTotal-RoomData[RoomSN]["Total"]>StandardNearFull or MaxTotal-RoomData[RoomSN]["Total"]==MaxTotal then
--				RoomData[RoomSN]=nil;
--			end
--		end
--		local Statistic={}
--		for TeamType=1,TotalTeam,1 do
--			Statistic[TeamType]=0;
--		end
--		for RoomSN,Data in pairs(RoomData) do
--			Statistic[Data["InferiorityType"]]=Statistic[Data["InferiorityType"]]+1;
--		end
--		local InferiorityType=TotalRoom;
--		local AssignTeamType=0;
--		for TeamType=1,TotalTeam,1 do--��X�H�Ƹ��t�̤֪��ж� �åB �̤֪��H��Queue�e
--			if InferiorityType>=Statistic[TeamType] and Statistic[TeamType]~=0 then
--				InferiorityType=Statistic[TeamType];
--				AssignTeamType=TeamType
--			end
--		end
--		return AssignTeamType;
--	end

	--FN������
--	if TotalRoom >= 1 then
--		DebugLog( 6, "<BGALL> TotalRoom "..TotalRoom )
--		for i = 1, TotalRoom do
--			local RoomID = GetBattleGroundRoomID( i );--���o�C�@�өж���RoomID
--			local RoomPlayerCount = 0
--			for p = 1, TotalTeam do
--				local TeamCount = GetNumEnterTeamMember( RoomID, p );--�p��U�ж����C��Team�����a��
--				RoomPlayerCount = RoomPlayerCount + TeamCount
--			end
--			--
--			if NearFullRoom == nil and RoomPlayerCount ~= MaxTotal then--�M��}�l�z��o�O���O"�̱��񺡤H"���ж� ���L"�w�g���H"���ж�
--				NearFullRoom = RoomID
--				NearFullPlayerNum = RoomPlayerCount
--				DebugLog( 6, "<BGALL> NearFullRoom change to R"..NearFullRoom.." and this room PlayerNum= "..NearFullPlayerNum )
--			elseif NearFullPlayerNum < RoomPlayerCount and RoomPlayerCount ~= MaxTotal then
--				NearFullRoom = RoomID
--				NearFullPlayerNum = RoomPlayerCount
--				DebugLog( 6, "<BGALL> NearFullRoom change to R"..NearFullRoom.." and this room PlayerNum= "..NearFullPlayerNum )
--			end
--		end
--		if NearFullRoom == nil then DebugLog( 6, "<BGALL> NearFullRoom is  nil" ) else DebugLog( 6, "<BGALL> NearFullRoom is  R"..NearFullRoom ) end
--		--�ܦ���X�F�̱��񺡤H���ж�NearFullRoom
--	end
--	--
--	local lowestTeam	= nil
--	local lowestPlayerNum	= nil
--
--	for y = 1, TotalTeam do
--		local TempPlayerNum
--		if TotalRoom >= 1 and NearFullPlayerNum ~= MaxTotal and NearFullRoom ~= nil then 	--�p�G�w�g���ж� & ���O���H & �̱��񺡤H���ж����Onil
--			DebugLog( 6, "<BGALL> NearFullPlayerNum= "..NearFullPlayerNum.." and MaxTotal="..MaxTotal )
--			TempPlayerNum = GetNumEnterTeamMember( NearFullRoom, y )				--���N�p��өж����C�Ӷ���H��
--			DebugLog( 6, "<BGALL> EnterTeamMember= "..TempPlayerNum )
--		else
--			TempPlayerNum = GetNumQueueMember( LevelGroupID, y )					--�_�h�p��Queue���C�Ӷ���H��
--			DebugLog( 6, "<BGALL> QueueMember= "..TempPlayerNum )
--		end
--															--�M��N�}�l�z��̤֤H������O����
--		if lowestTeam == nil then
--			lowestTeam = y
--			lowestPlayerNum = TempPlayerNum
--		elseif TempPlayerNum < lowestPlayerNum then
--			lowestTeam = y
--			lowestPlayerNum = TempPlayerNum
--		end
--	end
--	DebugLog( 6, "<BGALL> Player "..dbid..", join Team "..lowestTeam )
--	return lowestTeam
end