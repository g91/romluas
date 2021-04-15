function Lua_mika_BeerWaiter_talkclose()
	DisableQuest(OwnerID() , true)
end

function Lua_mika_BeerWaiter_Action()
	SetSpeakDetail( OwnerID(), "[SC_BEERDAY_11]"   )  --�S�Ѱ�s�a�����x��
	AddSpeakOption( OwnerID(), TargetID(), "[SC_BEERDAY_06]" , "Lua_mika_BeerWaiter_About", 0 ) --���� �A�ȥͪ��@��
	AddSpeakOption( OwnerID(), TargetID(), "[SC_BEERDAY_12]" , "Lua_mika_BeerWaiter_Ready", 0 ) --�ڭn�ѥ[
end
--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_mika_BeerWaiter_About()
	SetSpeakDetail( OwnerID(), "[SC_BEERDAY_ACT04C]"   )  --���ʤ��e����
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "Lua_mika_BeerWaiter_Action", 0 ) --�^��W�@�h
end
--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_mika_BeerWaiter_Ready() 
	local today= CheckFlag(OwnerID()  , 543323) -- ���Ѱѥ[�L
	local ticket = CountBodyItem(OwnerID(), 205940)  --�ѥ[��

	if today == true then
		SetSpeakDetail( OwnerID(), "[SC_BEERDAY_13]"   )  --�A���Ѥw�g�ѥ[�L�F
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "Lua_mika_BeerWaiter_Action", 0 ) --�^��W�@�h
	elseif CheckBuff( OwnerID() ,504627  ) == true then
			CloseSpeak( OwnerID() )  
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BEERDAY_60]" , C_SYSTEM )  -- �o�Ӭ��ʤw�b�i�椤
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_60]" , C_SYSTEM )  -- �o�Ӭ��ʤw�b�i�椤
	else
		CloseSpeak( OwnerID() )  
		WriteRoleValue(OwnerID() , EM_RoleValue_Register, 0 )   
		WriteRoleValue(OwnerID() , EM_RoleValue_Register+1, 0 )
		WriteRoleValue(OwnerID() , EM_RoleValue_Register+2, 0 )
		WriteRoleValue(OwnerID() , EM_RoleValue_Register+3, 0 )
		WriteRoleValue(OwnerID() , EM_RoleValue_Register+4, 0 )
		WriteRoleValue(OwnerID() , EM_RoleValue_Register+5, 0 )
		WriteRoleValue(OwnerID() , EM_RoleValue_Register+6, 0 )
		WriteRoleValue(OwnerID() , EM_RoleValue_Register+7, 0 )
		WriteRoleValue(OwnerID() , EM_RoleValue_Register+8, 0 )
		WriteRoleValue(OwnerID() , EM_RoleValue_Register+9, 0 )
		ScriptMessage( OwnerID() ,  OwnerID(), 1, "[SC_BEERDAY_14]" , C_SYSTEM )  
		ScriptMessage( OwnerID() ,  OwnerID(), 0, "[SC_BEERDAY_14]" , C_SYSTEM )  
		sleep(10)	
		ScriptMessage( OwnerID() ,  OwnerID(), 1, "[SC_BEERDAY_15]" , C_SYSTEM )  
		ScriptMessage( OwnerID() ,  OwnerID(), 0, "[SC_BEERDAY_15]" , C_SYSTEM )    
		sleep(10)
		ScriptMessage( OwnerID() ,  OwnerID(),  1, " 3 ! " , C_SYSTEM )  
		Sleep(10)
		ScriptMessage( OwnerID() ,  OwnerID(),  1, " 2 ! " , C_SYSTEM )  
		Sleep(10)
		ScriptMessage( OwnerID() ,  OwnerID(),  1, " 1 ! " , C_SYSTEM )  
		Sleep(10)
		Beginplot(OwnerID(),"Lua_mika_BeerWaiter_game", 0)
	end
end
--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_mika_BeerWaiter_game() --��s�j�v����Buff   --OwnerID ���a  --TargetID ����NPC
	ScriptMessage( OwnerID() ,  OwnerID(), 1, "[SC_BEERDAY_16]" , C_SYSTEM )  
	ScriptMessage( OwnerID() ,  OwnerID(), 0, "[SC_BEERDAY_16]" , C_SYSTEM )  
	sleep(10)
	AddBuff( OwnerID() , 504627 , 1, -1)
	sleep(1)	
	AddBuff( OwnerID() , 504637 , 1, -1)
	sleep(1)
	AddBuff( OwnerID() , 504638 , 1, -1)
	sleep(1)
	AddBuff( OwnerID() , 504639 , 1, -1)
	sleep(1)	
	AddBuff( OwnerID() , 504663 , 1, -1) --X
	sleep(10)
	SetSmallGameMenuType( OwnerID() , 4 , 1 ) --�}�Ҥ��� 
	local score = ReadRoleValue ( OwnerID() , EM_RoleValue_Register+6 )
	SetSmallGameMenuStr( OwnerID() , 4 , 1 , "[SC_BEERDAY_62]" ) -- �@��A�ȥ�
	SetSmallGameMenuStr( OwnerID() , 4 , 2 , "[SC_BEERDAY_49][$SETVAR1="..score.."]"  ) -- Change grade (++String�Ʀr"))  �Ʀr
	ClockOpen( OwnerID() ,EM_ClockCheckValue_7, 180 ,180,0,"Lua_mika_beerwaiter_close","Lua_mika_beerwaiter_clockclose") --�˼ƭp�ɾ�  (�᭱����өI�s�禡�G "���Ϯ���"�A"�ɶ���ɩI�s�禡")

end
--------------------------------------------------------------------------------------------------------------------------------------------
function LuaN_mika_beerwaiter_cust1()  --10
	while true do
		sleep(50)
		WriteRoleValue(OwnerID() , EM_RoleValue_Register+1,  0 )     --�M��NPC���D��
		sleep(50)
		local RANDOWN = rand(3)			
		if RANDOWN == 0 then  
			sleep(10)
		--	Say(OwnerID(), "[SC_BEERDAY_17]" )
			NpcSay(OwnerID(),"[SC_BEERDAY_17]" )
			WriteRoleValue(OwnerID() , EM_RoleValue_Register+1,  1 )     --���D��
			PlayMotion( OwnerID(), 109) 
		--	Say(OwnerID(), ReadRoleValue ( OwnerID() , EM_RoleValue_Register+1 ) ) 
		elseif RANDOWN == 1 then 
			sleep(20)
		--	Say(OwnerID(), "[SC_BEERDAY_19]" )
			NpcSay(OwnerID(),"[SC_BEERDAY_19]" )
			WriteRoleValue(OwnerID() , EM_RoleValue_Register+1,  3 )     --���D��
			PlayMotion( OwnerID(), 109) 
		--	Say(OwnerID(), ReadRoleValue ( OwnerID() , EM_RoleValue_Register+1 ) ) 
		elseif RANDOWN == 2 then 
			sleep(30)
	--		Say(OwnerID(), "[SC_BEERDAY_18]" )
			NpcSay(OwnerID(),"[SC_BEERDAY_18]" )
			WriteRoleValue(OwnerID() , EM_RoleValue_Register+1,  2 )     --���D��
			PlayMotion( OwnerID(), 109) 
		--	Say(OwnerID(), ReadRoleValue ( OwnerID() , EM_RoleValue_Register+1 ) ) 
		elseif RANDOWN == 3 then 
			sleep(50)
		--	Say(OwnerID(), "[SC_BEERDAY_20]" )
			NpcSay(OwnerID(),"[SC_BEERDAY_20]" )
			WriteRoleValue(OwnerID() , EM_RoleValue_Register+1,  4 )     --���D��
		--	Say(OwnerID(), ReadRoleValue ( OwnerID() , EM_RoleValue_Register+1 ) ) 
		end
	end
end
--------------------------------------------------------------------------------------------------------------------------------------------
function LuaN_mika_beerwaiter_cust2()    --13
	while true do
		sleep(50)	 
		WriteRoleValue(OwnerID() , EM_RoleValue_Register+1,  0 )     --�M��NPC���D��
		sleep(70)
		local RANDOWN = rand(3)			
		if RANDOWN == 0 then  
			sleep(50)
		--	Say(OwnerID(), "[SC_BEERDAY_20]" )
			NpcSay(OwnerID(),"[SC_BEERDAY_20]" )
			WriteRoleValue(OwnerID() , EM_RoleValue_Register+1,  4 )     --���D��
		--	Say(OwnerID(), ReadRoleValue ( OwnerID() , EM_RoleValue_Register+1 ) ) 
		elseif RANDOWN == 1 then 
			sleep(30)
		--	Say(OwnerID(), "[SC_BEERDAY_17]" )
			NpcSay(OwnerID(),"[SC_BEERDAY_17]" )
			WriteRoleValue(OwnerID() , EM_RoleValue_Register+1,  1 )     --���D��
			PlayMotion( OwnerID(), 109) 
		--	Say(OwnerID(), ReadRoleValue ( OwnerID() , EM_RoleValue_Register+1 ) ) 
		elseif RANDOWN == 2 then 
			sleep(20)
		--	Say(OwnerID(), "[SC_BEERDAY_19]" )
			NpcSay(OwnerID(),"[SC_BEERDAY_19]" )
			WriteRoleValue(OwnerID() , EM_RoleValue_Register+1,  3 )     --���D��
			PlayMotion( OwnerID(), 109) 
		--	Say(OwnerID(), ReadRoleValue ( OwnerID() , EM_RoleValue_Register+1 ) ) 
		elseif RANDOWN == 3 then 
			sleep(10)
		--	Say(OwnerID(), "[SC_BEERDAY_18]" )
			NpcSay(OwnerID(),"[SC_BEERDAY_18]" )
			WriteRoleValue(OwnerID() , EM_RoleValue_Register+1,  2 )     --���D��
			PlayMotion( OwnerID(), 109) 
		--	Say(OwnerID(), ReadRoleValue ( OwnerID() , EM_RoleValue_Register+1 ) ) 

		end
	end
end
--------------------------------------------------------------------------------------------------------------------------------------------
function LuaN_mika_beerwaiter_cust3()   --18
	while true do
		sleep(50)
		WriteRoleValue(OwnerID() , EM_RoleValue_Register+1,  0 )     --�M��NPC���D��
		sleep(100)
		local RANDOWN = rand(3)			
		if RANDOWN == 0 then  
			sleep(10)
		--	Say(OwnerID(), "[SC_BEERDAY_20]" )
			NpcSay(OwnerID(),"[SC_BEERDAY_20]" )
			WriteRoleValue(OwnerID() , EM_RoleValue_Register+1,  4 )     --���D��
		--	Say(OwnerID(), ReadRoleValue ( OwnerID() , EM_RoleValue_Register+1 ) ) 
		elseif RANDOWN == 1 then 
			sleep(30)
		--	Say(OwnerID(), "[SC_BEERDAY_18]" )
			NpcSay(OwnerID(),"[SC_BEERDAY_18]" )
			WriteRoleValue(OwnerID() , EM_RoleValue_Register+1,  2 )     --���D��
			PlayMotion( OwnerID(), 109) 
		--	Say(OwnerID(), ReadRoleValue ( OwnerID() , EM_RoleValue_Register+1 ) ) 
		elseif RANDOWN == 2 then 
			sleep(20)
		--	Say(OwnerID(), "[SC_BEERDAY_19]" )
			NpcSay(OwnerID(),"[SC_BEERDAY_19]" )
			WriteRoleValue(OwnerID() , EM_RoleValue_Register+1,  3 )     --���D��
			PlayMotion( OwnerID(), 109) 
		--	Say(OwnerID(), ReadRoleValue ( OwnerID() , EM_RoleValue_Register+1 ) ) 
		elseif RANDOWN == 3 then 
			sleep(50)
		--	Say(OwnerID(), "[SC_BEERDAY_17]" )
			NpcSay(OwnerID(),"[SC_BEERDAY_17]" )
			WriteRoleValue(OwnerID() , EM_RoleValue_Register+1,  1 )     --���D��
			PlayMotion( OwnerID(), 109) 
		--	Say(OwnerID(), ReadRoleValue ( OwnerID() , EM_RoleValue_Register+1 ) ) 
		end
	end
end
--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Beerservice_check()
	local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	local CustID = {111657, 111658, 111677 ,113464, 113465, 113466, 113608, 113609 ,113610, 113611, 113612, 113613}

	if ( CheckID( TargetID() ) == false ) then  --�S����H
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_MAGIC03]" , C_SYSTEM )	--�йﬡ�ʹ�H���ȤH�ϥΡC
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BEERDAY_MAGIC03]"  , C_SYSTEM )	--�йﬡ�ʹ�H���ȤH�ϥΡC
		return false
	else

		if ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) == 1 then --�I�k��H�O���a
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_MAGIC03]" , C_SYSTEM )	--�йﬡ�ʹ�H���ȤH�ϥΡC
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BEERDAY_MAGIC03]"  , C_SYSTEM )	--�йﬡ�ʹ�H���ȤH�ϥΡC
			return false
		else  --���O���a
			for i = 1 , 12  do
				if ( OrgID == CustID[i] ) then  --��H���O��6��npc
					return true
				end
			end
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_MAGIC03]" , C_SYSTEM )	--�йﬡ�ʹ�H���ȤH�ϥΡC
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BEERDAY_MAGIC03]"  , C_SYSTEM )	--�йﬡ�ʹ�H���ȤH�ϥΡC
			return false
		end
	end
end
--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_mika_BeerWaiter_service1()--
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register+7 , 1 ) -- �O�D�جO 
	local Q = ReadRoleValue ( TargetID() , EM_RoleValue_Register+1 )
	local A = ReadRoleValue ( OwnerID() , EM_RoleValue_Register+7 )
	local score = ReadRoleValue ( OwnerID() , EM_RoleValue_Register+6 )
	if CheckBuff(TargetID(), 504617) == false then  -- npc�S�b�ܰsbuff���A
		if  Q == A  then --�p�G�D�ػP���׬ۦP
			AddBuff(TargetID(), 504617, 1 , 5) --��npc�ܰsbuff
			Tell(OwnerID() ,  TargetID(), "[SC_BEERDAY_21]")
			PlayMotion( TargetID(), 118) --Cast��t
			AddRoleValue ( OwnerID() , EM_RoleValue_Register+6 , 1 ) -- �b���a���W�O����+1
			local nowscore = ReadRoleValue ( OwnerID() , EM_RoleValue_Register+6 )  --����
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_30][$SETVAR1="..nowscore.."]" , C_SYSTEM )	--�{�b���ơG[$VAR1] ��
			local sidescore = ReadRoleValue ( OwnerID() , EM_RoleValue_Register+6 )
			SetSmallGameMenuStr( OwnerID() , 2 , 1 , "[SC_BEERDAY_62]" ) -- �@��A�ȥ�
			SetSmallGameMenuStr( OwnerID() , 2 , 2 , "[SC_BEERDAY_49][$SETVAR1="..sidescore.."]"  ) -- Change grade (++String�Ʀr"))  �Ʀr
		else
			Tell(OwnerID() ,  TargetID(), "[SC_BEERDAY_22]")
			PlayMotion( TargetID(), 101) --Cast��t
			if  score > 0 then
				AddRoleValue ( OwnerID() , EM_RoleValue_Register+6 , -1 ) -- �b���a���W�O����-1
			end
			local nowscore = ReadRoleValue ( OwnerID() , EM_RoleValue_Register+6 )  --����
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_30][$SETVAR1="..nowscore.."]" , C_SYSTEM )	--�{�b���ơG[$VAR1] ��
			local sidescore = ReadRoleValue ( OwnerID() , EM_RoleValue_Register+6 )
			SetSmallGameMenuStr( OwnerID() , 2 , 1 , "[SC_BEERDAY_62]" ) -- �@��A�ȥ�
			SetSmallGameMenuStr( OwnerID() , 2 , 2 , "[SC_BEERDAY_49][$SETVAR1="..sidescore.."]"  ) -- Change grade (++String�Ʀr"))  �Ʀr
		end
	else --��buff
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_61]" , C_SYSTEM )
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BEERDAY_61]"  , C_SYSTEM )
	end
end
--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_mika_BeerWaiter_service2()--
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register+7 , 2 ) -- �O����
	local Q = ReadRoleValue ( TargetID() , EM_RoleValue_Register+1 )
	local A = ReadRoleValue ( OwnerID() , EM_RoleValue_Register+7 )
	local score = ReadRoleValue ( OwnerID() , EM_RoleValue_Register+6 )
	if CheckBuff(TargetID(), 504617) == false then  -- npc�S�b�ܰsbuff���A
		if  Q == A  then --�p�G�D�ػP���׬ۦP
			AddBuff(TargetID(), 504617, 1 , 5) --��npc�ܰsbuff
			Tell(OwnerID() ,  TargetID(), "[SC_BEERDAY_21]")
			PlayMotion( TargetID(), 118) --Cast��t
			AddRoleValue ( OwnerID() , EM_RoleValue_Register+6, 1 ) -- �b���a���W�O����+1
			local nowscore = ReadRoleValue ( OwnerID() , EM_RoleValue_Register+6 )  --����
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_30][$SETVAR1="..nowscore.."]" , C_SYSTEM )	--�{�b���ơG[$VAR1] ��
			local sidescore = ReadRoleValue ( OwnerID() , EM_RoleValue_Register+6 )
			SetSmallGameMenuStr( OwnerID() , 2 , 1 , "[SC_BEERDAY_62]" ) -- �@��A�ȥ�
			SetSmallGameMenuStr( OwnerID() , 2 , 2 , "[SC_BEERDAY_49][$SETVAR1="..sidescore.."]"  ) -- Change grade (++String�Ʀr"))  �Ʀr
		else
			Tell(OwnerID() ,  TargetID(), "[SC_BEERDAY_22]")
			PlayMotion( TargetID(), 101) --Cast��t
			if  score > 0 then
				AddRoleValue ( OwnerID() , EM_RoleValue_Register+6 , -1 ) -- �b���a���W�O����-1
			end
			local nowscore = ReadRoleValue ( OwnerID() , EM_RoleValue_Register+6 )  --����
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_30][$SETVAR1="..nowscore.."]" , C_SYSTEM )	--�{�b���ơG[$VAR1] ��
			local sidescore = ReadRoleValue ( OwnerID() , EM_RoleValue_Register+6 )
			SetSmallGameMenuStr( OwnerID() , 2 , 1 , "[SC_BEERDAY_62]" ) -- �@��A�ȥ�
			SetSmallGameMenuStr( OwnerID() , 2 , 2 , "[SC_BEERDAY_49][$SETVAR1="..sidescore.."]"  ) -- Change grade (++String�Ʀr"))  �Ʀr
		end
	else --��buff
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_61]" , C_SYSTEM )
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BEERDAY_61]"  , C_SYSTEM )
	end
end
--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_mika_BeerWaiter_service3()--
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register+7 , 3 ) -- �O����
	local Q = ReadRoleValue ( TargetID() , EM_RoleValue_Register+1 )
	local A = ReadRoleValue ( OwnerID() , EM_RoleValue_Register+7 )
	local score = ReadRoleValue ( OwnerID() , EM_RoleValue_Register+6 )
	if CheckBuff(TargetID(), 504617) == false then  -- npc�S�b�ܰsbuff���A
		if  Q == A  then --�p�G�D�ػP���׬ۦP
			AddBuff(TargetID(), 504617, 1 , 5) --��npc�ܰsbuff
			Tell(OwnerID() ,  TargetID(), "[SC_BEERDAY_21]")
			PlayMotion( TargetID(), 118) --Cast��t
			AddRoleValue ( OwnerID() , EM_RoleValue_Register+6 , 1 ) -- �b���a���W�O����+1
			local nowscore = ReadRoleValue ( OwnerID() , EM_RoleValue_Register+6 )  --����
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_30][$SETVAR1="..nowscore.."]" , C_SYSTEM )	--�{�b���ơG[$VAR1] ��
			local sidescore = ReadRoleValue ( OwnerID() , EM_RoleValue_Register+6 )
			SetSmallGameMenuStr( OwnerID() , 2 , 1 , "[SC_BEERDAY_62]" ) -- �@��A�ȥ�
			SetSmallGameMenuStr( OwnerID() , 2 , 2 , "[SC_BEERDAY_49][$SETVAR1="..sidescore.."]"  ) -- Change grade (++String�Ʀr"))  �Ʀr
		else
			Tell(OwnerID() ,  TargetID(), "[SC_BEERDAY_22]")
			PlayMotion( TargetID(), 101) --Cast��t
			if  score > 0 then
				AddRoleValue ( OwnerID() , EM_RoleValue_Register+6 , -1 ) -- �b���a���W�O����-1
			end
			local nowscore = ReadRoleValue ( OwnerID() , EM_RoleValue_Register+6 )  --����
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_30][$SETVAR1="..nowscore.."]" , C_SYSTEM )	--�{�b���ơG[$VAR1] ��
			local sidescore = ReadRoleValue ( OwnerID() , EM_RoleValue_Register+6 )
			SetSmallGameMenuStr( OwnerID() , 2 , 1 , "[SC_BEERDAY_62]" ) -- �@��A�ȥ�
			SetSmallGameMenuStr( OwnerID() , 2 , 2 , "[SC_BEERDAY_49][$SETVAR1="..sidescore.."]"  ) -- Change grade (++String�Ʀr"))  �Ʀr
		end
	else --��buff
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_61]" , C_SYSTEM )
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BEERDAY_61]"  , C_SYSTEM )
	end
end
--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_mika_BeerWaiter_service4()--
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register+7 , 4 ) -- �O����
	local Q = ReadRoleValue ( TargetID() , EM_RoleValue_Register+1 )
	local A = ReadRoleValue ( OwnerID() , EM_RoleValue_Register+7 )
	local score = ReadRoleValue ( OwnerID() , EM_RoleValue_Register+6 )
	if CheckBuff(TargetID(), 504617) == false then  -- npc�S�b�ܰsbuff���A
		if  Q == A  then --�p�G�D�ػP���׬ۦP
			AddBuff(TargetID(), 504617, 1 , 5) --��npc�ܰsbuff
			Tell(OwnerID() ,  TargetID(), "[SC_BEERDAY_21]")
			PlayMotion( TargetID(), 103) --Cast��t
			AddRoleValue ( OwnerID() , EM_RoleValue_Register+6 , 1 ) -- �b���a���W�O����+1
			local nowscore = ReadRoleValue ( OwnerID() , EM_RoleValue_Register+6 )  --����
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_30][$SETVAR1="..nowscore.."]" , C_SYSTEM )	--�{�b���ơG[$VAR1] ��
			local sidescore = ReadRoleValue ( OwnerID() , EM_RoleValue_Register+6 )
			SetSmallGameMenuStr( OwnerID() , 2 , 1 , "[SC_BEERDAY_62]" ) -- �@��A�ȥ�
			SetSmallGameMenuStr( OwnerID() , 2 , 2 , "[SC_BEERDAY_49][$SETVAR1="..sidescore.."]"  ) -- Change grade (++String�Ʀr"))  �Ʀr
		else
			Tell(OwnerID() ,  TargetID(), "[SC_BEERDAY_22]")
			PlayMotion( TargetID(), 101) --Cast��t
			if  score > 0 then
				AddRoleValue ( OwnerID() , EM_RoleValue_Register+6 , -1 ) -- �b���a���W�O����-1
			end
			local nowscore = ReadRoleValue ( OwnerID() , EM_RoleValue_Register+6 )  --����
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_30][$SETVAR1="..nowscore.."]" , C_SYSTEM )	--�{�b���ơG[$VAR1] ��
			local sidescore = ReadRoleValue ( OwnerID() , EM_RoleValue_Register+6 )
			SetSmallGameMenuStr( OwnerID() , 2 , 1 , "[SC_BEERDAY_62]" ) -- �@��A�ȥ�
			SetSmallGameMenuStr( OwnerID() , 2 , 2 , "[SC_BEERDAY_49][$SETVAR1="..sidescore.."]"  ) -- Change grade (++String�Ʀr"))  �Ʀr
		end
	else --��buff
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_61]" , C_SYSTEM )
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BEERDAY_61]"  , C_SYSTEM )
	end
end
--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_mika_beerwaiter_clockclose()--x
	ClockClose( OwnerID() )
	SetSmallGameMenuType( OwnerID() , 2 ,2 ) -- ��������
	ScriptMessage( OwnerID() ,  OwnerID(), 1, "[SC_BEERDAY_23]" , C_SYSTEM )  
	ScriptMessage( OwnerID() ,  OwnerID(), 0, "[SC_BEERDAY_23]" , C_SYSTEM )  
	local totalscore = ReadRoleValue ( OwnerID() , EM_RoleValue_Register+6 )
	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_24][$SETVAR1="..totalscore.."]" , C_SYSTEM )	--�A���`���O�G[$VAR1] ��
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BEERDAY_24][$SETVAR1="..totalscore.."]"  , C_SYSTEM )
	if totalscore >= 31 then
		ScriptMessage( OwnerID() ,  OwnerID(), 1, "[SC_BEERDAY_28]" , C_SYSTEM )  
		ScriptMessage( OwnerID() ,  OwnerID(), 0, "[SC_BEERDAY_28]" , C_SYSTEM )  
		GiveBodyItem(OwnerID(), 205941, 2)
		GiveBodyItem(OwnerID(), 205899, 5) --�s
		--���D��1
	elseif totalscore <31 and totalscore >= 21 then  --31-40
		ScriptMessage( OwnerID() ,  OwnerID(), 1, "[SC_BEERDAY_27]" , C_SYSTEM )  
		ScriptMessage( OwnerID() ,  OwnerID(), 0, "[SC_BEERDAY_27]" , C_SYSTEM )  
		GiveBodyItem(OwnerID(), 205941, 1)
		GiveBodyItem(OwnerID(), 205899, 3) --�s
		--���D��1
	elseif totalscore <21 and totalscore >= 11 then  --11-30
		ScriptMessage( OwnerID() ,  OwnerID(), 1, "[SC_BEERDAY_26]" , C_SYSTEM )  
		ScriptMessage( OwnerID() ,  OwnerID(), 0, "[SC_BEERDAY_26]" , C_SYSTEM )  
		GiveBodyItem(OwnerID(), 205941, 1)
		GiveBodyItem(OwnerID(), 205899, 1) --�s
		--���D��1
	elseif totalscore <11 then  
		ScriptMessage( OwnerID() ,  OwnerID(), 1, "[SC_BEERDAY_25]" , C_SYSTEM )  
		ScriptMessage( OwnerID() ,  OwnerID(), 0, "[SC_BEERDAY_25]" , C_SYSTEM )  
		GiveBodyItem(OwnerID(), 205899, 1) --�s
		--���D��1
	end
	--���D��2
	SetFlag(OwnerID(), 543323, 1 ) --�����Ѥw�ѥ[��s�j�v Flag
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+6, 0 )      --�M�Ū��a������
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+7, 0 )      --�M�Ū��a������
	CancelBuff( OwnerID() , 504663 ) 	
	CancelBuff( OwnerID() , 504639 )
	CancelBuff( OwnerID() , 504638 )
	CancelBuff( OwnerID() , 504637 )
	CancelBuff( OwnerID() , 504627 )
	WriteRoleValue(OwnerID() , EM_RoleValue_Register+6, 0 )
	WriteRoleValue(OwnerID() , EM_RoleValue_Register+7, 0 )
end


function Lua_mika_beerwaiter_close()--x
	ClockClose( OwnerID() )
	CancelBuff( OwnerID() , 504663 ) 	
	CancelBuff( OwnerID() , 504639 )
	CancelBuff( OwnerID() , 504638 )
	CancelBuff( OwnerID() , 504637 )
	CancelBuff( OwnerID() , 504627 )
	ScriptMessage( OwnerID() ,  OwnerID(), 1, "[SC_BEERDAY_23]" , C_SYSTEM )  
	ScriptMessage( OwnerID() ,  OwnerID(), 0, "[SC_BEERDAY_23]" , C_SYSTEM )  
	sleep(20)
	SetFlag(OwnerID(), 543323, 1 ) --�����Ѥw�ѥ[��s�j�v Flag
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+6, 0 )      --�M�Ū��a������
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+7, 0 )      --�M�Ū��a���D��
	SetSmallGameMenuType( OwnerID() , 2 ,2 ) -- ��������
end

-----------------
function Lua_mika_BeerWaiter_Clearvalue()
	WriteRoleValue(OwnerID() , EM_RoleValue_Register, 0 )   
	WriteRoleValue(OwnerID() , EM_RoleValue_Register+1, 0 )
	WriteRoleValue(OwnerID() , EM_RoleValue_Register+2, 0 )
	WriteRoleValue(OwnerID() , EM_RoleValue_Register+3, 0 )
	WriteRoleValue(OwnerID() , EM_RoleValue_Register+4, 0 )
	WriteRoleValue(OwnerID() , EM_RoleValue_Register+5, 0 )
	WriteRoleValue(OwnerID() , EM_RoleValue_Register+6, 0 )
	WriteRoleValue(OwnerID() , EM_RoleValue_Register+7, 0 )
	WriteRoleValue(OwnerID() , EM_RoleValue_Register+8, 0 )
	WriteRoleValue(OwnerID() , EM_RoleValue_Register+9, 0 )
end

function Lua_mika_BeerWaiter_sayvalue() --show�X�{�br�ȦU�ӭȬ���
	Say(OwnerID(),  ReadRoleValue(OwnerID() , EM_RoleValue_Register ))
	Say(OwnerID(), ReadRoleValue ( OwnerID() , EM_RoleValue_Register+1 ))
	Say(OwnerID(), ReadRoleValue ( OwnerID() , EM_RoleValue_Register+2 ))
	Say(OwnerID(), ReadRoleValue ( OwnerID() , EM_RoleValue_Register+3 ))
	Say(OwnerID(), ReadRoleValue ( OwnerID() , EM_RoleValue_Register+4 ))
	Say(OwnerID(), ReadRoleValue ( OwnerID() , EM_RoleValue_Register+5 ))
	Say(OwnerID(), ReadRoleValue ( OwnerID() , EM_RoleValue_Register+6 ))
	Say(OwnerID(), ReadRoleValue ( OwnerID() , EM_RoleValue_Register+7 ))
	Say(OwnerID(), ReadRoleValue ( OwnerID() , EM_RoleValue_Register+8 ))
	Say(OwnerID(), ReadRoleValue ( OwnerID() , EM_RoleValue_Register+9 ))
end
