--say
function LuaZ13WS_423846()
----�����̴�
	local A=RandRange( 1 , 4 )  
	if 	CheckAcceptQuest( OwnerID(), 423846 ) == true 			and
		CheckCompleteQuest(OwnerID(),423846)==false			and
		Checkflag(OwnerID(),544740) ==false				then
			if	CheckBuff(OwnerID(),508198)==false				then 
				SetSpeakDetail(OwnerID(), "[SC_423846_"..A.."]" ) 
				--����A���Z���A���Ӱ��b�F�A�ݭn�Φ�n�n����@�U�A�{�b�i�H��ڭ̨��F�ܡH
				--���|��i�o����I�A�O�����F�A�{�b�n���F�ܡH
				--�`�N�O�@�B�鶤���A�Y�j�a�������F�A�o���f���i�N�K�y���ǤS��S�઺���K�J�F�A�n�A�n���F�ܡH
				--�A�ݰ_�ӫܯॴ�A�ܤ����ܤ����A�ڭ̳o�N�X�o�ܡH
				AddSpeakOption( OwnerID(), TargetID(), "[SC_111796_0]", "LuaZ13WS_423846_1",0) 
				--�ڷǳƦn�F�C (���a�T�w�n�}�l�t��)
				AddSpeakOption( OwnerID(), TargetID(), "[SC_423236_11]", "LuaZ13WS_423846_wait",0) 
				--�ЦA���ڤ@�U�C
			else
				CloseSpeak(OwnerID())
				ScriptMessage( OwnerID(), OwnerID(), 2,"[SC_423846_10]", 0 )
				ScriptMessage( OwnerID(), OwnerID(), 0,"[SC_423846_10]", 0 )
				--�A�w�[�J��L���@�e�p���A�u�ɶ������i�A�[�J��L�@�e�p���C
			end
	else
		LoadQuestOption(OwnerID())
	end
end

function LuaZ13WS_423846_wait()
	SetSpeakDetail(OwnerID(), "[SC_423846_5]" ) 
	--�n�A�ǳƦn�A��ڡC
	CloseSpeak( OwnerID() )
end

function LuaZ13WS_423846_1()
	CloseSpeak( OwnerID() )
	AddBuff(OwnerID(),508198,1,100)
	Beginplot(TargetID(),"LuaZ13WS_423846_2",0)
end

function LuaZ13WS_423846_2()
--�ⶤ�OOWNER
	local Ctrl = OwnerID()
	local Player = TargetID()
	DisableQuest(Ctrl, true )
	Hide(Ctrl)
	
	local leader= LuaFunc_CreateObjByObj( 105247 , Ctrl )
	WriteRoleValue( leader ,  EM_RoleValue_PID , Player )
	WriteRoleValue( Player ,  EM_RoleValue_PID , leader )
	--say(leader,ReadRoleValue( leader, EM_RoleValue_PID))
	--say(Player,ReadRoleValue( Player, EM_RoleValue_PID))
	local actor={105251,105252,105266,105273,117352}
	local One={}
	local OneDis = {}
	for i= 1,5 do
		One[i]= Lua_DW_CreateObj("flag" ,actor[i],780643,i)	
	end
	
	for i=1,5,1 do		
		WriteRoleValue(One[i], EM_RoleValue_IsWalk, 1)
		MoveToFlagEnabled( One[i], false)
		if i == 5 then
			OneDis[i] = GetDistance( One[i], leader )+30
		else
			OneDis[i] = GetDistance( One[i], One[5] )
		end
	end
	MoveToFlagEnabled( leader, false)
	WriteRoleValue(leader, EM_RoleValue_IsWalk, 1)
	
	BeginPlot(leader,"LuaZ13WS_423846_3",0)		
	BeginPlot(One[1],"LuaZ13WS_423846_4",0)
	BeginPlot(One[2],"LuaZ13WS_423846_5",0)
	BeginPlot(One[3],"LuaZ13WS_423846_4",0)
	BeginPlot(One[4],"LuaZ13WS_423846_5",0)
	--AttachObj( One[5] , leader , 0 ,"p_down","p_top" )
	--���H
	
	local N=0			--����L�ɰj��
	local Enemy = 0
	local QuestSuccess = false
	
	while N < 500 do
		Fight = false
		for i=1, 5 do
			if i ~= 5 then
				Enemy = ReadRoleValue( One[i], EM_RoleValue_AttackTargetID )
			else
				Enemy = ReadRoleValue( leader, EM_RoleValue_AttackTargetID )
			end
				
			if	Enemy ~= 0 	then
				for j=1, 4 do
					if	CheckID(One[j]) == true and 
						ReadRoleValue( One[j], EM_RoleValue_IsDead) == 0 and
						ReadRoleValue( One[j], EM_RoleValue_AttackTargetID ) == 0	then
						stopMove( One[j], true )
						SysCastSpellLv( Enemy, One[j], 496266, 499 )
					end
				end
					
				if 	CheckID(leader) == true and 
					ReadRoleValue( leader, EM_RoleValue_IsDead) == 0 and
					ReadRoleValue( leader, EM_RoleValue_AttackTargetID ) == 0	then
					
					stopMove( leader, true )
					SysCastSpellLv( Enemy, leader, 496266, 499 )					
				end
				stopMove( One[5], true )
				Fight = true
				break
			end
		end
		
		if Fight == false and Getdistance( One[5], leader ) > 20 and GetDistance( leader, Ctrl ) > GetDistance( One[5], Ctrl )  then
			WriteRoleValue(leader, EM_RoleValue_IsWalk, 1)
			
			local X = ReadRoleValue( leader, EM_RoleValue_X )
			local Y = ReadRoleValue( leader, EM_RoleValue_Y )
			local Z = ReadRoleValue( leader, EM_RoleValue_Z )
			local Dir = ReadRoleValue( leader, EM_RoleValue_Dir )-180
			
			if Dir > 360 then Dir = Dir -360 
			elseif Dir < 0 then Dir = Dir +360 end
			
			local radian = (math.pi/180)*( Dir )--�|��
			X = X  +20*math.cos(radian)
			Z = Z - 20*math.sin(radian)
			Y  = GetHeight( X, Y, Z )
			
			local TransTeamPosition = Lua_Zone14_PE02_FormationPosition( X , Y , Z, 35, Dir )--�|���}���]�w��				
			--Say( One[5], OneDis[5].."Dis = "..GetDistance( One[5], leader ) )
			if GetDistance( One[5], leader ) > OneDis[5] then
				WriteRoleValue( One[5], EM_RoleValue_IsWalk, 0)
			else
				WriteRoleValue( One[5], EM_RoleValue_IsWalk, 1)
			end
			MoveDirect( One[5], X, Y, Z )
			for i=1,4 do
				--Say( One[i], OneDis[i]..";Dis = "..GetDistance( One[i], One[5] ))
				if GetDistance( One[i], One[5] ) > OneDis[i] and GetDistance( One[i], leader ) > GetDistance( One[5], leader ) then
					WriteRoleValue( One[i], EM_RoleValue_IsWalk, 0)
				else
					WriteRoleValue( One[i], EM_RoleValue_IsWalk, 1)
				end
				MoveDirect( One[i] , TransTeamPosition["X"][i] , TransTeamPosition["Y"][i] , TransTeamPosition["Z"][i] )
			end
		end
			
		if	GetDistance(leader, Player )>200		then
			ScriptMessage( Player, Player, 2,"[SC_423846_16]", 0 )
			ScriptMessage( Player, Player, 0,"[SC_423846_16]", 0 )
			--�A�Z���@�e�p���ӻ��A�Ч��k���I
		end
		
		if	CheckID( Player ) == false or 
			ReadRoleValue( Player, EM_RoleValue_IsDead) == 1 or
			CheckID( leader ) == false or 
			ReadRoleValue( leader, EM_RoleValue_IsDead) == 1 or
			CheckAcceptQuest( Player,423846) == false	or
			GetDistance(leader, Player) > 400 then
			QuestSuccess = false
			break
		end

		if	Checkflag(Player,544740)==true	then	--��buff�N�b�����F�ت������
			break
		end
		if N>488	then	
				ScriptMessage( Player, Player, 0,499-N, 0 )
				ScriptMessage( Player, Player, 2,499-N, 0 )
		end	
		N=N+1
		sleep(10)
	end

	if	QuestSuccess == false			and
		Checkflag(Player,544740)==false	then
		ScriptMessage( Player, Player, 0,"[SC_423846_6]", 0 )
		ScriptMessage( Player, Player, 2,"[SC_423846_6]", 0 )
		--�B�騮�����\��F�ؼСA�Ϊ̧A�P�B�騮�Z���ӻ��A���ȥ��ѡA�Щ�󭫱��C
	end
		
	for i=1,5,1 do
		Delobj(One[i])
	end
	Delobj(leader)
	Show(Ctrl,0)
	DisableQuest(Ctrl, false)
end
			
function LuaZ13WS_423846_3()
	DisableQuest( OwnerID() , true )
	Hide(OwnerID())
	Show(OwnerID(),0)
	WriteRoleValue(OwnerID(), EM_RoleValue_IsWalk, 1)
	for	i=6,10 do
		DW_MoveToFlag( OwnerID(), 780643, i,0,1 )
	end
	Sleep(30)
	Say(OwnerID(),"[SC_423846_8]")
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_SALUTE2)
	Sleep(50)
	
	local player =SearchRangePlayer ( OwnerID() , 250  )   				
			--�j�Mnpc���� 400�d�򤺪����a�A��J�}�C��
			for i=0,table.getn(player),1 do
				if 	ReadRoleValue( player[i],  EM_RoleValue_PID ) == OwnerID() then	
					Setflag(player[i],544740,1)
				end
			end
	Hide(OwnerID())
	Sleep(100)
	Show(OwnerID(),0)
	DisableQuest( OwnerID() , false )
end

function LuaZ13WS_423846_4()
--�]����client�A�ҥH�t�쩳	
	DisableQuest(OwnerID(), true )	
	Hide(OwnerID())
	Show(OwnerID(),0)
	WriteRoleValue(OwnerID(), EM_RoleValue_IsWalk, 1)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_APPROVAL)
	Sleep(50)
end

function LuaZ13WS_423846_5()
--�]����client�A�ҥH�t�쩳	
	DisableQuest(OwnerID(), true )
	Hide(OwnerID())
	Show(OwnerID(),0)
	WriteRoleValue(OwnerID(), EM_RoleValue_IsWalk, 1)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_APPROVAL)
	Sleep(50)
end

function LuaZ13WS_423846_6()
	DisableQuest( OwnerID() , true )
	Hide(OwnerID())
	Show(OwnerID(),0)
	WriteRoleValue(OwnerID(), EM_RoleValue_IsWalk, 1)
	for i= 6,10 do
		DW_MoveToFlag( OwnerID(), 780643, i,0,1 )
	end
	Sleep(100)
end


-------

------------------------------------------------------------
function LuaZ13WS_423846A()
--�����D�v��
--544740���ȧ������� 
--508198����a�u�ɶ������Ʊ���
	local A=RandRange( 1 , 4 )  
	if 	CheckAcceptQuest( OwnerID(), 423846 ) == true 			and
		CheckCompleteQuest(OwnerID(),423846)==false			and
		Checkflag(OwnerID(),544740) ==false				then
			if	CheckBuff(OwnerID(),508198)==false				then 
				SetSpeakDetail(OwnerID(), "[SC_423846_"..A.."]" ) 
				--����A���Z���A���Ӱ��b�F�A�ݭn�Φ�n�n����@�U�A�{�b�i�H��ڭ̨��F�ܡH
				--���|��i�o����I�A�O�����F�A�{�b�n���F�ܡH
				--�`�N�O�@�B�鶤���A�Y�j�a�������F�A�o���f���i�N�K�y���ǤS��S�઺���K�J�F�A�n�A�n���F�ܡH
				--�A�ݰ_�ӫܯॴ�A�ܤ����ܤ����A�ڭ̳o�N�X�o�ܡH
				AddSpeakOption( OwnerID(), TargetID(), "[SC_111796_0]", "LuaZ13WS_423846A_1",0) 
				--�ڷǳƦn�F�C (���a�T�w�n�}�l�t��)
				AddSpeakOption( OwnerID(), TargetID(), "[SC_423236_11]", "LuaZ13WS_423846A_wait",0) 
				--�ЦA���ڤ@�U�C
			else
				CloseSpeak(OwnerID())
				ScriptMessage( OwnerID(), OwnerID(), 2,"[SC_423846_10]", 0 )
				ScriptMessage( OwnerID(), OwnerID(), 0,"[SC_423846_10]", 0 )
				--�A�w�[�J��L���@�e�p���A�u�ɶ������i�A�[�J��L�@�e�p���C
			end
	else
		LoadQuestOption(OwnerID())
	end
end

function LuaZ13WS_423846A_wait()
	SetSpeakDetail(OwnerID(), "[SC_423846_5]" ) 
	--�n�A�ǳƦn�A��ڡC
	CloseSpeak( OwnerID() )
end

function LuaZ13WS_423846A_1()
	CloseSpeak( OwnerID() )
	AddBuff(OwnerID(),508198,1,100)
	Beginplot(TargetID(),"LuaZ13WS_423846A_2",0) 
end

function LuaZ13WS_423846A_2()
--�ⶤ�OOWNER
	local Ctrl = OwnerID()
	local Player = TargetID()
	DisableQuest(Ctrl, true )
	Hide(Ctrl)
	local leader= LuaFunc_CreateObjByObj( 105248 , Ctrl)
	WriteRoleValue( leader ,  EM_RoleValue_PID , Player  )--�NLEADER���ȰO�J���a��pid
	WriteRoleValue( Player  ,  EM_RoleValue_PID , leader)

	local actor={105251,105252,105266,105273,117352}
	local One={}
	local OneDis = {}
	for i= 1,5 do
		One[i]= Lua_DW_CreateObj("flag" ,actor[i],780642,i)	
	end
	for i=1,5 do
		WriteRoleValue(One[i], EM_RoleValue_IsWalk, 1)
		MoveToFlagEnabled( One[i], false)
		if i == 5 then
			OneDis[i] = GetDistance( One[i], leader )+30
		else
			OneDis[i] = GetDistance( One[i], One[5] )
		end
	end
	MoveToFlagEnabled( leader, false)
	WriteRoleValue(leader, EM_RoleValue_IsWalk, 1)
	
	BeginPlot(leader,"LuaZ13WS_423846A_3",0)		
	BeginPlot(One[1],"LuaZ13WS_423846A_4",0)
	BeginPlot(One[2],"LuaZ13WS_423846A_5",0)
	BeginPlot(One[3],"LuaZ13WS_423846A_4",0)
	BeginPlot(One[4],"LuaZ13WS_423846A_5",0)

	
	local N=0			--����L�ɰj��
	local Enemy = 0
	local QuestSuccess = false
	
	while N < 500 do
		Fight = false
		for i=1, 5 do
			if i ~= 5 then
				Enemy = ReadRoleValue( One[i], EM_RoleValue_AttackTargetID )
			else
				Enemy = ReadRoleValue( leader, EM_RoleValue_AttackTargetID )
			end
				
			if	Enemy ~= 0 	then
				for j=1, 4 do
					if	CheckID(One[j]) == true and 
						ReadRoleValue( One[j], EM_RoleValue_IsDead) == 0 and
						ReadRoleValue( One[j], EM_RoleValue_AttackTargetID ) == 0	then
						stopMove( One[j], true )
						SysCastSpellLv( Enemy, One[j], 496266, 499 )
					end
				end
					
				if 	CheckID(leader) == true and 
					ReadRoleValue( leader, EM_RoleValue_IsDead) == 0 and
					ReadRoleValue( leader, EM_RoleValue_AttackTargetID ) == 0	then
					
					stopMove( leader, true )
					SysCastSpellLv( Enemy, leader, 496266, 499 )					
				end
				stopMove( One[5], true )
				Fight = true
				break
			end
		end
	
	if Fight == false and Getdistance( One[5], leader ) > 20 and GetDistance( leader, Ctrl ) > GetDistance( One[5], Ctrl )  then
			WriteRoleValue(leader, EM_RoleValue_IsWalk, 1)
			
			local X = ReadRoleValue( leader, EM_RoleValue_X )
			local Y = ReadRoleValue( leader, EM_RoleValue_Y )
			local Z = ReadRoleValue( leader, EM_RoleValue_Z )
			local Dir = ReadRoleValue( leader, EM_RoleValue_Dir )-180
			
			if Dir > 360 then Dir = Dir -360 
			elseif Dir < 0 then Dir = Dir +360 end
			
			local radian = (math.pi/180)*( Dir )--�|��
			X = X  +20*math.cos(radian)
			Z = Z - 20*math.sin(radian)
			Y  = GetHeight( X, Y, Z )
			
			local TransTeamPosition = Lua_Zone14_PE02_FormationPosition( X , Y , Z, 35, Dir )--�|���}���]�w��
						
			--Say( One[5], OneDis[5].."Dis = "..GetDistance( One[5], leader ) )
			if GetDistance( One[5], leader ) > OneDis[5] then
				WriteRoleValue( One[5], EM_RoleValue_IsWalk, 0)
			else
				WriteRoleValue( One[5], EM_RoleValue_IsWalk, 1)
			end
			MoveDirect( One[5], X, Y, Z )
			for i=1,4 do
				--Say( One[i], OneDis[i]..";Dis = "..GetDistance( One[i], One[5] ))
				if GetDistance( One[i], One[5] ) > OneDis[i] and GetDistance( One[i], leader ) > GetDistance( One[5], leader ) then
					WriteRoleValue( One[i], EM_RoleValue_IsWalk, 0)
				else
					WriteRoleValue( One[i], EM_RoleValue_IsWalk, 1)
				end
				MoveDirect( One[i] , TransTeamPosition["X"][i] , TransTeamPosition["Y"][i] , TransTeamPosition["Z"][i] )
			end
		end

		if	GetDistance(leader, Player )>200		then
			ScriptMessage( Player, Player, 2,"[SC_423846_16]", 0 )
			ScriptMessage( Player, Player, 0,"[SC_423846_16]", 0 )
			--�A�Z���@�e�p���ӻ��A�Ч��k���I
		end

		if	CheckID( Player ) == false or 
			ReadRoleValue( Player, EM_RoleValue_IsDead) == 1 or
			CheckID( leader ) == false or 
			ReadRoleValue( leader, EM_RoleValue_IsDead) == 1 or
			CheckAcceptQuest( Player,423846) == false	or
			GetDistance(leader, Player) > 400 then
			
			QuestSuccess = false
			break
		end

		if	Checkflag(Player,544740)==true	then	--��buff�N�b�����F�ت������
			break
		end
		if N>488	then	
				ScriptMessage( Player, Player, 0,499-N, 0 )
				ScriptMessage( Player, Player, 2,499-N, 0 )
		end	
		N=N+1
		
		sleep(10)
	end
		
	if	QuestSuccess == false	and
		Checkflag(Player,544740)==false	then
		ScriptMessage( Player, Player, 0,"[SC_423846_6]", 0 )
		ScriptMessage( Player, Player, 2,"[SC_423846_6]", 0 )
		--�B�騮�����\��F�ؼСA�Ϊ̧A�P�B�騮�Z���ӻ��A���ȥ��ѡA�Щ�󭫱��C
		
	end
		
	for i=1,5,1 do
		Delobj(One[i])
	end
	Delobj(leader)
	Show(Ctrl,0)
	DisableQuest(Ctrl, false)
end
			
function LuaZ13WS_423846A_3()
	DisableQuest( OwnerID() , true )
	Hide(OwnerID())
	Show(OwnerID(),0)
	WriteRoleValue(OwnerID(), EM_RoleValue_IsWalk, 1)
	for i=6,13 do
		DW_MoveToFlag( OwnerID(), 780642, i,0,1 )
	end
	Sleep(30)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_SALUTE2)
	Sleep(50)
	Say(OwnerID(),"[SC_423846_8]")
	local player =SearchRangePlayer ( OwnerID() , 250  )   				
			--�j�Mnpc���� 400�d�򤺪����a�A��J�}�C��
			for i=0,table.getn(player),1 do
				if 	ReadRoleValue( player[i],  EM_RoleValue_PID ) == OwnerID() then	
					Setflag(player[i],544740,1)
				end
			end
	Hide(OwnerID())
--	CallPlot(OwnerID(),"LuaFunc_ResetObj",OwnerID())
	Sleep(100)
	Show(OwnerID(),0)
	DisableQuest( OwnerID() , false )
end

function LuaZ13WS_423846A_4()
--�]����client�A�ҥH�t�쩳	
	DisableQuest(OwnerID(), true )	
	Hide(OwnerID())
	Show(OwnerID(),0)
	WriteRoleValue(OwnerID(), EM_RoleValue_IsWalk, 1)
--	NPCSay(OwnerID(),"[SC_423846_7]")
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_APPROVAL)
	Sleep(50)
--	Delobj(OwnerID())
end

function LuaZ13WS_423846A_5()
--�]����client�A�ҥH�t�쩳	
	DisableQuest(OwnerID(), true )
	Hide(OwnerID())
	Show(OwnerID(),0)
	WriteRoleValue(OwnerID(), EM_RoleValue_IsWalk, 1)
--	NPCSay(OwnerID(),"[SC_423846_7]")
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_APPROVAL)
	Sleep(50)
--	Delobj(OwnerID()
end




----------------------------------------------------------
function LuaZ13WS_423846B()
	local A=RandRange( 1 , 4 )  
	if 	CheckAcceptQuest( OwnerID(), 423846 ) == true 			and
		CheckCompleteQuest(OwnerID(),423846)==false				and
		Checkflag(OwnerID(),544740) ==false						then
			if	CheckBuff(OwnerID(),508198)==false				then 
				SetSpeakDetail(OwnerID(), "[SC_423846_"..A.."]" ) 
				--����A���Z���A���Ӱ��b�F�A�ݭn�Φ�n�n����@�U�A�{�b�i�H��ڭ̨��F�ܡH
				--���|��i�o����I�A�O�����F�A�{�b�n���F�ܡH
				--�`�N�O�@�B�鶤���A�Y�j�a�������F�A�o���f���i�N�K�y���ǤS��S�઺���K�J�F�A�n�A�n���F�ܡH
				--�A�ݰ_�ӫܯॴ�A�ܤ����ܤ����A�ڭ̳o�N�X�o�ܡH
				AddSpeakOption( OwnerID(), TargetID(), "[SC_111796_0]", "LuaZ13WS_423846B_1",0) 
				--�ڷǳƦn�F�C (���a�T�w�n�}�l�t��)
				AddSpeakOption( OwnerID(), TargetID(), "[SC_423236_11]", "LuaZ13WS_423846B_wait",0) 
				--�ЦA���ڤ@�U�C
			else
				CloseSpeak(OwnerID())
				ScriptMessage( OwnerID(), OwnerID(), 2,"[SC_423846_10]", 0 )
				ScriptMessage( OwnerID(), OwnerID(), 0,"[SC_423846_10]", 0 )
				--�A�w�[�J��L���@�e�p���A�u�ɶ������i�A�[�J��L�@�e�p���C
			end
	else
		LoadQuestOption(OwnerID())
	end
end

function LuaZ13WS_423846B_wait()
	SetSpeakDetail(OwnerID(), "[SC_423846_5]" ) 
	--�n�A�ǳƦn�A��ڡC
	CloseSpeak( OwnerID() )
end

function LuaZ13WS_423846B_1()
	CloseSpeak( OwnerID() )
	AddBuff(OwnerID(),508198,1,100)
	Beginplot(TargetID(),"LuaZ13WS_423846B_2",0)
end

function LuaZ13WS_423846B_2()
--�ⶤ�OOWNER
	local Ctrl = OwnerID()
	local Player = TargetID()
	DisableQuest(Ctrl, true )	
	Hide(Ctrl)
	local leader= LuaFunc_CreateObjByObj( 105250 , Ctrl  )
	WriteRoleValue( leader ,  EM_RoleValue_PID , Player )
	WriteRoleValue( Player  ,  EM_RoleValue_PID , leader )
	---say(leader,ReadRoleValue( leader, EM_RoleValue_PID))
	--say(Player,ReadRoleValue( Player, EM_RoleValue_PID))
	local actor={105251,105252,105266,105273,117352}
	local One={}
	local OneDis = {}
	for i= 1,5 do
		One[i]= Lua_DW_CreateObj("flag" ,actor[i],780641,i)	
	end

	for i=1,5,1 do		
		WriteRoleValue(One[i], EM_RoleValue_IsWalk, 1)
		MoveToFlagEnabled( One[i], false)
		if i == 5 then
			OneDis[i] = GetDistance( One[i], leader )+30
		else
			OneDis[i] = GetDistance( One[i], One[5] )
		end
	end
	MoveToFlagEnabled( leader, false)
	WriteRoleValue(leader, EM_RoleValue_IsWalk, 1)
	
	BeginPlot(leader,"LuaZ13WS_423846B_3",0)		
	BeginPlot(One[1],"LuaZ13WS_423846B_4",0)
	BeginPlot(One[2],"LuaZ13WS_423846B_5",0)
	BeginPlot(One[3],"LuaZ13WS_423846B_4",0)
	BeginPlot(One[4],"LuaZ13WS_423846B_5",0)

	local N=0			--����L�ɰj��
	local Enemy = 0
	local QuestSuccess = false
	
	while N < 500 do
		Fight = false
		for i=1, 5 do
			if i ~= 5 then
				Enemy = ReadRoleValue( One[i], EM_RoleValue_AttackTargetID )
			else
				Enemy = ReadRoleValue( leader, EM_RoleValue_AttackTargetID )
			end
				
			if	Enemy ~= 0 	then
				for j=1, 4 do
					if	CheckID(One[j]) == true and 
						ReadRoleValue( One[j], EM_RoleValue_IsDead) == 0 and
						ReadRoleValue( One[j], EM_RoleValue_AttackTargetID ) == 0	then
						stopMove( One[j], true )
						SysCastSpellLv( Enemy, One[j], 496266, 499 )
					end
				end
					
				if 	CheckID(leader) == true and 
					ReadRoleValue( leader, EM_RoleValue_IsDead) == 0 and
					ReadRoleValue( leader, EM_RoleValue_AttackTargetID ) == 0	then
					
					stopMove( leader, true )
					SysCastSpellLv( Enemy, leader, 496266, 499 )					
				end
				stopMove( One[5], true )
				Fight = true
				break
			end
		end
		
		if Fight == false and Getdistance( One[5], leader ) > 20 and GetDistance( leader, Ctrl ) > GetDistance( One[5], Ctrl )  then
			WriteRoleValue(leader, EM_RoleValue_IsWalk, 1)
			
			local X = ReadRoleValue( leader, EM_RoleValue_X )
			local Y = ReadRoleValue( leader, EM_RoleValue_Y )
			local Z = ReadRoleValue( leader, EM_RoleValue_Z )
			local Dir = ReadRoleValue( leader, EM_RoleValue_Dir )-180
			
			if Dir > 360 then Dir = Dir -360 
			elseif Dir < 0 then Dir = Dir +360 end
			
			local radian = (math.pi/180)*( Dir )--�|��
			X = X  +20*math.cos(radian)
			Z = Z - 20*math.sin(radian)
			Y  = GetHeight( X, Y, Z )
			
			local TransTeamPosition = Lua_Zone14_PE02_FormationPosition( X , Y , Z, 35, Dir )--�|���}���]�w��
						
			--Say( One[5], OneDis[5].."Dis = "..GetDistance( One[5], leader ) )
			if GetDistance( One[5], leader ) > OneDis[5] then
				WriteRoleValue( One[5], EM_RoleValue_IsWalk, 0)
			else
				WriteRoleValue( One[5], EM_RoleValue_IsWalk, 1)
			end
			MoveDirect( One[5], X, Y, Z )
			for i=1,4 do
				--Say( One[i], OneDis[i]..";Dis = "..GetDistance( One[i], One[5] ))
				if GetDistance( One[i], One[5] ) > OneDis[i] and GetDistance( One[i], leader ) > GetDistance( One[5], leader ) then
					WriteRoleValue( One[i], EM_RoleValue_IsWalk, 0)
				else
					WriteRoleValue( One[i], EM_RoleValue_IsWalk, 1)
				end
				MoveDirect( One[i] , TransTeamPosition["X"][i] , TransTeamPosition["Y"][i] , TransTeamPosition["Z"][i] )
			end
		end
			
		if	GetDistance(leader, Player )>200		then
			ScriptMessage( Player, Player, 2,"[SC_423846_16]", 0 )
			ScriptMessage( Player, Player, 0,"[SC_423846_16]", 0 )
			--�A�Z���@�e�p���ӻ��A�Ч��k���I
		end
		
		if	CheckID( Player ) == false or 
			ReadRoleValue( Player, EM_RoleValue_IsDead) == 1 or
			CheckID( leader ) == false or 
			ReadRoleValue( leader, EM_RoleValue_IsDead) == 1 or
			CheckAcceptQuest( Player,423846) == false	or
			GetDistance(leader, Player) > 400 then
			QuestSuccess = false
			break
		end

		if	Checkflag(Player,544740)==true	then	--��buff�N�b�����F�ت������
			break
		end
		
		if N>488	then	
				ScriptMessage( Player, Player, 0,499-N, 0 )
				ScriptMessage( Player, Player, 2,499-N, 0 )
		end	
		N=N+1
	
		sleep(10)
	end

	if	QuestSuccess == false			and
		Checkflag(Player,544740)==false		then
		ScriptMessage( Player, Player, 0,"[SC_423846_6]", 0 )
		ScriptMessage( Player, Player, 2,"[SC_423846_6]", 0 )
		--�B�騮�����\��F�ؼСA�Ϊ̧A�P�B�騮�Z���ӻ��A���ȥ��ѡA�Щ�󭫱��C
	end
		
	for i=1,5,1 do
		Delobj(One[i])
	end
	Delobj(leader)
	Show(Ctrl,0)
	DisableQuest(Ctrl, false)
end
			
function LuaZ13WS_423846B_3()
	local leader=OwnerID()
	DisableQuest( leader , true )
	Hide(leader)
	Show(leader,0)
	WriteRoleValue(leader, EM_RoleValue_IsWalk, 1)
	for i=6,9 do
		DW_MoveToFlag( leader, 780641, i,0,1 )
	end
	Sleep(30)
	Say(leader,"[SC_423846_8]")
	PlayMotion(leader,ruFUSION_ACTORSTATE_EMOTE_SALUTE2)
	Sleep(50)
	
	local player =SearchRangePlayer ( leader , 250 )   				
			--�j�Mnpc���� 400�d�򤺪����a�A��J�}�C��
			for i=0,table.getn(player),1 do
				if 	ReadRoleValue( player[i],  EM_RoleValue_PID ) ==  OwnerID() then	
					Setflag(player[i],544740,1)
				end
			end
	Hide(leader)
	Sleep(100)
	Show(leader,0)
	DisableQuest( leader , false )
end

function LuaZ13WS_423846B_4()
--�]����client�A�ҥH�t�쩳	
	DisableQuest(OwnerID(), true )	
	Hide(OwnerID())
	Show(OwnerID(),0)
	WriteRoleValue(OwnerID(), EM_RoleValue_IsWalk, 1)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_APPROVAL)
	Sleep(50)
end

function LuaZ13WS_423846B_5()
--�]����client�A�ҥH�t�쩳	
	DisableQuest(OwnerID(), true )
	Hide(OwnerID())
	Show(OwnerID(),0)
	WriteRoleValue(OwnerID(), EM_RoleValue_IsWalk, 1)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_APPROVAL)
	Sleep(50)
end



-------