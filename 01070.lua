function LuaYU_ClickFunGoBox_test1() 
	SetPlot( OwnerID() ,"touch",  "LuaYU_ClickFunGoBox_01" , 20 )   --
--	SetPlot( OwnerID() ,"touch",  "LuaYU_ClickFunGoBox_test2" , 20 )   --
end

--function LuaYU_ClickFunGoBox_test2()
function LuaYU_ClickFunGoBox_01()
	BeginPlot( TargetID() , "LuaYU_ClickFunGoBox_01_1" , 0 )  
end

function LuaYU_ClickFunGoBox_01_1()   --�n�_
	local O_ID = OwnerID() --����
	local T_ID = TargetID()  --���a
	local Manager = ReadRoleValue( O_ID , EM_RoleValue_PID  ) --�Щx
	local MissionOK = ReadRoleValue( Manager , EM_RoleValue_Register+1  ) --�P�_�ثe�ĴX�^�X
	local NeedTime 

--	say(O_ID, "OID 1")
--	say(T_ID, "TID 1")
--	say(Manager, "Manager 1")
--	say(Manager, "Mission ="..MissionOK)

	local P = 3
	local XX = Rand( P )     
						
	if XX == 0 then   
		AdjustFaceDir( Manager, T_ID , 0 ) --���V
		PlayMotion( Manager, 112) 
		Say( Manager, "[SC_CLICKFUNGO13]")	
	elseif XX == 1 then  
		AdjustFaceDir( Manager, T_ID , 0 ) --���V
		PlayMotion( Manager, 123) 
		Say( Manager, "[SC_CLICKFUNGO38]")	

	elseif XX == 2 then  
		AdjustFaceDir( Manager, T_ID , 0 ) --���V
		PlayMotion( Manager, 110) 
		Say( Manager, "[SC_CLICKFUNGO39]")	
	end


	if CheckBuff( T_ID , 503693 ) == true then
		NeedTime = 15
	elseif CheckBuff( T_ID , 503694 ) == true then
		NeedTime = 80
	else
		NeedTime = 50
	end
	
	SetPlot( O_ID,"touch","",0 )

	if Lua_Hao_Check_SetPlot_Touch( T_ID ) == false then
		if BeginCastBarEvent( T_ID, O_ID,"[SO_110195_1]", NeedTime, ruFUSION_ACTORSTATE_CROUCH_BEGIN, ruFUSION_ACTORSTATE_CROUCH_END, 0, "LuaYU_ClickFunGoBox_01_2" ) ~= 1 then
			ScriptMessage( T_ID, T_ID, 0,"[SAY_NPC_BUSY]", 0 );--�ؼЦ��L��
			return
		else 
			SetPlot( O_ID,"touch","LuaYU_ClickFunGoBox_01",10 )
		end
	end
end

function LuaYU_ClickFunGoBox_01_2( ObjID, CheckStatus )
	local O_ID = OwnerID() -- ���a
	local T_ID = TargetID()  -- ����
	local Manager = ReadRoleValue( T_ID , EM_RoleValue_PID  ) --�Щx
	local MissionOK = ReadRoleValue( Manager , EM_RoleValue_Register+1  ) --�P�_�ثe�ĴX�^�X

--	say(O_ID, "OID 1")
--	say(T_ID, "TID 1")
--	say(Manager, "Manager 1")

	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			-- ���\
			EndCastBar( O_ID, CheckStatus );

			if EmptyPacketCount( O_ID ) >= 1  and QueuePacketCount( O_ID ) == 0 then
				local LuckyToken =  CountBodyItem( O_ID , 205018 )  --���B����

				PlayMotionEX( T_ID, ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP)  --���򼽩�145    146
				GiveBodyItem( O_ID , 721820 , 1 );  

				AdjustFaceDir( Manager, O_ID , 0 ) --���V
				Say( Manager, "[SC_CLICKFUNGO14]" )

				PlayMotion( Manager, 102) 
				SetPlot( T_ID,"touch","",0 )
				sleep(10)
				local Token =  CountBodyItem( O_ID , 205017 )  --�R�B����
				local LuckyToken2 =  CountBodyItem( O_ID , 205018 )  --���B����
				local newlucky = (LuckyToken2 - LuckyToken)

			--	say(O_ID, "destiny token ="..token)
			--	say(O_ID, "before - LuckyToken = "..LuckyToken )
			--	say(O_ID, "after  - LuckyToken = "..newlucky )

				WriteRoleValue(  O_ID  , EM_RoleValue_Register+7 ,  Token ) --�R�B����
				AddRoleValue(  O_ID  , EM_RoleValue_Register+8 ,  newlucky ) --���B����
				local R7 = ReadRoleValue(O_ID, EM_RoleValue_Register+7 )
				local R8 = ReadRoleValue(O_ID, EM_RoleValue_Register+8)
			--	say(O_ID, "destiny token ="..R7..", lucky token  = "..R8 )

				MissionOK = MissionOK+1
				WriteRoleValue(  Manager  , EM_RoleValue_Register+1 ,  MissionOK ) 
				local Mission = ReadRoleValue( Manager , EM_RoleValue_Register+1  ) --�P�_�ثe�ĴX�^�X
			--	say(Manager, "Mission now ="..MissionOK..", Mission next = "..Mission )
			else
				ScriptMessage( T_ID , O_ID , 1 , "[K_08MID_DIALOG8]" , 0 ) --�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
				SetPlot( T_ID,"touch","LuaYU_ClickFunGoBox_01",10 )
			end

		else
			-- ����
			EndCastBar( O_ID, CheckStatus );
		end
	end
end



--****************************************************************--
function LuaYU_ClickFunGoBox_test2() 
	SetPlot( OwnerID() ,"touch",  "LuaYU_ClickFunGoBox_02" , 20 )   --
--	SetPlot( OwnerID() ,"touch",  "LuaYU_ClickFunGoBox_test2" , 20 )   --
end

--function LuaYU_ClickFunGoBox_test2()
function LuaYU_ClickFunGoBox_02()
	BeginPlot( TargetID() , "LuaYU_ClickFunGoBox_02_1" , 0 )  
end

function LuaYU_ClickFunGoBox_02_1()   --�̹BBOSS      Game Over
	local O_ID = OwnerID() --����
	local T_ID = TargetID()  --���a
	local Manager = ReadRoleValue( O_ID , EM_RoleValue_PID  ) --�Щx
	local NeedTime 

--	say(O_ID, "OID 2")
--	say(T_ID, "TID 2")
--	say(Manager, "Manager 2")

	local P = 3
	local XX = Rand( P )     
						
	if XX == 0 then   
		AdjustFaceDir( Manager, T_ID , 0 ) --���V
		PlayMotion( Manager, 112) 
		Say( Manager, "[SC_CLICKFUNGO13]")	
	elseif XX == 1 then  
		AdjustFaceDir( Manager, T_ID , 0 ) --���V
		PlayMotion( Manager, 123) 
		Say( Manager, "[SC_CLICKFUNGO38]")	
	elseif XX == 2 then  
		AdjustFaceDir( Manager, T_ID , 0 ) --���V
		PlayMotion( Manager, 110) 
		Say( Manager, "[SC_CLICKFUNGO39]")	
	end

	if CheckBuff( T_ID , 503693 ) == true then
		NeedTime = 15
	elseif CheckBuff( T_ID , 503694 ) == true then
		NeedTime = 80
	else
		NeedTime = 50
	end
	
	SetPlot( O_ID,"touch","",0 )

	if Lua_Hao_Check_SetPlot_Touch( T_ID ) == false then
		if BeginCastBarEvent( T_ID, O_ID,"[SO_110195_1]", NeedTime, ruFUSION_ACTORSTATE_CROUCH_BEGIN, ruFUSION_ACTORSTATE_CROUCH_END, 0, "LuaYU_ClickFunGoBox_02_2" ) ~= 1 then
			ScriptMessage( T_ID, T_ID, 0,"[SAY_NPC_BUSY]", 0 );--�ؼЦ��L��
			return
		else 
			SetPlot( O_ID,"touch","LuaYU_ClickFunGoBox_02",10 )
		end
	end
end

function LuaYU_ClickFunGoBox_02_2( ObjID, CheckStatus )
	local O_ID = OwnerID() -- ���a
	local T_ID = TargetID()  -- ����
	local Manager = ReadRoleValue( O_ID , EM_RoleValue_PID  ) --�Щx
	local MissionOK = ReadRoleValue( Manager , EM_RoleValue_Register+1  ) --�P�_�ثe�ĴX�^�X

--	say(O_ID, "OID 2")
--	say(T_ID, "TID 2")
--	say(Manager, "Manager 2")

	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			-- ���\
			EndCastBar( O_ID, CheckStatus );

			local RoomID = ReadRoleValue( T_ID ,EM_RoleValue_RoomID) 
			local Master = LuaFunc_CreateObjByObj ( 101554 , T_ID  )

			Delobj(T_ID)

			SetModeEx( Master , EM_SetModeType_Fight , false )--�i�������
			SetModeEx( Master , EM_SetModeType_Searchenemy, false )--����	
			Hide(Master)
			Show(Master, RoomID)

			WriteRoleValue(  Master  , EM_RoleValue_Register+2 ,  Manager ) 
			WriteRoleValue(  Master  , EM_RoleValue_Register+3 ,  O_ID ) 

			BeginPlot( Master , "LuaYU_ClickFunGoMonstetr_01" , 0 )
		else
			-- ����
			EndCastBar( O_ID, CheckStatus );
		end
	end

end


--****************************************************************--
function LuaYU_ClickFunGoBox_test3() 
	SetPlot( OwnerID() ,"touch",  "LuaYU_ClickFunGoBox_03" , 20 )   --
--	SetPlot( OwnerID() ,"touch",  "LuaYU_ClickFunGoBox_test3" , 20 )   --
end

--function LuaYU_ClickFunGoBox_test3()
function LuaYU_ClickFunGoBox_03()
	BeginPlot( TargetID() , "LuaYU_ClickFunGoBox_03_1" , 0 )  
end

function LuaYU_ClickFunGoBox_03_1()  
	local O_ID = OwnerID() --����
	local T_ID = TargetID()  --���a
	local Manager = ReadRoleValue( O_ID , EM_RoleValue_PID  ) --�Щx
	local MissionOK = ReadRoleValue( Manager , EM_RoleValue_Register+1  ) --�P�_�ثe�ĴX�^�X
	local NeedTime

--	say(O_ID, "OID 3")
--	say(T_ID, "TID 3")
--	say(Manager, "Manager 3")

	local P = 3
	local XX = Rand( P )     
						
	if XX == 0 then   
		AdjustFaceDir( Manager, T_ID , 0 ) --���V
		PlayMotion( Manager, 112) 
		Say( Manager, "[SC_CLICKFUNGO13]")	

	elseif XX == 1 then  
		AdjustFaceDir( Manager, T_ID , 0 ) --���V
		PlayMotion( Manager, 123) 
		Say( Manager, "[SC_CLICKFUNGO38]")	

	elseif XX == 2 then  
		AdjustFaceDir( Manager, T_ID , 0 ) --���V
		PlayMotion( Manager, 110) 
		Say( Manager, "[SC_CLICKFUNGO39]")	
	end

	if CheckBuff( T_ID , 503693 ) == true then
		NeedTime = 15
	elseif CheckBuff( T_ID , 503694 ) == true then
		NeedTime = 80
	else
		NeedTime = 50
	end

	SetPlot( O_ID,"touch","",0 )

	if Lua_Hao_Check_SetPlot_Touch( T_ID ) == false then
		if BeginCastBarEvent( T_ID, O_ID,"[SO_110195_1]", NeedTime, ruFUSION_ACTORSTATE_CROUCH_BEGIN, ruFUSION_ACTORSTATE_CROUCH_END, 0, "LuaYU_ClickFunGoBox_03_2" ) ~= 1 then
			ScriptMessage( T_ID, T_ID, 0,"[SAY_NPC_BUSY]", 0 );--�ؼЦ��L��
			return
		else 
			SetPlot( O_ID,"touch","LuaYU_ClickFunGoBox_03",10 )
		end
	end
end

function LuaYU_ClickFunGoBox_03_2( ObjID, CheckStatus )
	local O_ID = OwnerID() -- ���a
	local T_ID = TargetID()  -- ����
	local Manager = ReadRoleValue( T_ID , EM_RoleValue_PID  ) --�Щx
	local MissionOK = ReadRoleValue( Manager , EM_RoleValue_Register+1  ) --�P�_�ثe�ĴX�^�X

--	say(O_ID, "OID 3")
--	say(T_ID, "TID 3")
--	say(Manager, "Manager 3")

	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			-- ���\
			EndCastBar( O_ID, CheckStatus );

			AdjustFaceDir( Manager, O_ID , 0 ) --���V
			Say( Manager, "[SC_CLICKFUNGO16]" ) --�H�Ͱ����]�ӥ[�ָ}�B�I

			PlayMotion( Manager, 109) 
			CastSpelllv( Manager , O_ID , 492461 , 1 )

			PlayMotionEX( T_ID, ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP)  --���򼽩�145    146
			SetPlot( T_ID,"touch","",0 )

		else
			-- ����
			EndCastBar( O_ID, CheckStatus );
		end
	end
end


--****************************************************************--
function LuaYU_ClickFunGoBox_test4() 
	SetPlot( OwnerID() ,"touch",  "LuaYU_ClickFunGoBox_04" , 20 )   --
--	SetPlot( OwnerID() ,"touch",  "LuaYU_ClickFunGoBox_test4" , 20 )   --
end

--function LuaYU_ClickFunGoBox_test4()
function LuaYU_ClickFunGoBox_04()
	BeginPlot( TargetID() , "LuaYU_ClickFunGoBox_04_1" , 0 )  
end

function LuaYU_ClickFunGoBox_04_1()   --�R�B������    ��t
	local O_ID = OwnerID() --����
	local T_ID = TargetID()  --���a
	local Manager = ReadRoleValue( O_ID , EM_RoleValue_PID  ) --�Щx
	local MissionOK = ReadRoleValue( Manager , EM_RoleValue_Register+1  ) --�P�_�ثe�ĴX�^�X
	local NeedTime 

--	say(O_ID, "OID 4")
--	say(T_ID, "TID 4")
--	say(Manager, "Manager 4")

	local P = 3
	local XX = Rand( P )     
						
	if XX == 0 then   
		AdjustFaceDir( Manager, T_ID , 0 ) --���V
		PlayMotion( Manager, 112) 
		Say( Manager, "[SC_CLICKFUNGO13]")	

	elseif XX == 1 then  
		AdjustFaceDir( Manager, T_ID , 0 ) --���V
		PlayMotion( Manager, 123) 
		Say( Manager, "[SC_CLICKFUNGO38]")	

	elseif XX == 2 then  
		AdjustFaceDir( Manager, T_ID , 0 ) --���V
		PlayMotion( Manager, 110) 
		Say( Manager, "[SC_CLICKFUNGO39]")	
	end

	if CheckBuff( T_ID , 503693 ) == true then
		NeedTime = 15
	elseif CheckBuff( T_ID , 503694 ) == true then
		NeedTime = 80
	else
		NeedTime = 50
	end

	SetPlot( O_ID,"touch","",0 )

	if Lua_Hao_Check_SetPlot_Touch( T_ID ) == false then
		if BeginCastBarEvent( T_ID, O_ID,"[SO_110195_1]", NeedTime, ruFUSION_ACTORSTATE_CROUCH_BEGIN, ruFUSION_ACTORSTATE_CROUCH_END, 0, "LuaYU_ClickFunGoBox_04_2" ) ~= 1 then
			ScriptMessage( T_ID, T_ID, 0,"[SAY_NPC_BUSY]", 0 );--�ؼЦ��L��
			return
		else 
			SetPlot( O_ID,"touch","LuaYU_ClickFunGoBox_04",10 )
		end
	end
end

function LuaYU_ClickFunGoBox_04_2( ObjID, CheckStatus )
	local O_ID = OwnerID() -- ���a
	local T_ID = TargetID()  -- ����
	local Manager = ReadRoleValue( T_ID , EM_RoleValue_PID  ) --�Щx
	local MissionOK = ReadRoleValue( Manager , EM_RoleValue_Register+1  ) --�P�_�ثe�ĴX�^�X

--	say(O_ID, "OID 4")
--	say(T_ID, "TID 4")
--	say(Manager, "Manager 4")

	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			-- ���\
			EndCastBar( O_ID, CheckStatus );

			AdjustFaceDir( Manager, O_ID , 0 ) --���V
			Say( Manager, "[SC_CLICKFUNGO17]" ) --�H�Ͱ����]�ө�C�}�B�I
			PlayMotion( Manager, 109) 

			CastSpelllv( Manager , O_ID , 492606 , 1 )

			PlayMotionEX( T_ID, ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP)  --���򼽩�145    146
			SetPlot( T_ID,"touch","",0 )
		else
			-- ����
			EndCastBar( O_ID, CheckStatus );
		end

	end
end


--****************************************************************--
function LuaYU_ClickFunGoBox_test5() 
	SetPlot( OwnerID() ,"touch",  "LuaYU_ClickFunGoBox_05" , 20 )   --
--	SetPlot( OwnerID() ,"touch",  "LuaYU_ClickFunGoBox_test5" , 20 )   --
end

--function LuaYU_ClickFunGoBox_test5()
function LuaYU_ClickFunGoBox_05()
	BeginPlot( TargetID() , "LuaYU_ClickFunGoBox_05_1" , 0 )  
end

function LuaYU_ClickFunGoBox_05_1()   --�R�B������    ����
	local O_ID = OwnerID() --����
	local T_ID = TargetID()  --���a
	local Manager = ReadRoleValue( O_ID , EM_RoleValue_PID  ) --�Щx
	local MissionOK = ReadRoleValue( Manager , EM_RoleValue_Register+1  ) --�P�_�ثe�ĴX�^�X
	local NeedTime 

--	say(O_ID, "OID 5")
--	say(T_ID, "TID 5")
--	say(Manager, "Manager 5")

	local P = 3
	local XX = Rand( P )     
						
	if XX == 0 then   
		AdjustFaceDir( Manager, T_ID , 0 ) --���V
		PlayMotion( Manager, 112) 
		Say( Manager, "[SC_CLICKFUNGO13]")	

	elseif XX == 1 then  
		AdjustFaceDir( Manager, T_ID , 0 ) --���V
		PlayMotion( Manager, 123) 
		Say( Manager, "[SC_CLICKFUNGO38]")	

	elseif XX == 2 then  
		AdjustFaceDir( Manager, T_ID , 0 ) --���V
		PlayMotion( Manager, 110) 
		Say( Manager, "[SC_CLICKFUNGO39]")	
	end

	if CheckBuff( T_ID , 503693 ) == true then
		NeedTime = 15
	elseif CheckBuff( T_ID , 503694 ) == true then
		NeedTime = 80
	else
		NeedTime = 50
	end

	SetPlot( O_ID,"touch","",0 )	

	if Lua_Hao_Check_SetPlot_Touch( T_ID ) == false then
		if BeginCastBarEvent( T_ID, O_ID,"[SO_110195_1]", NeedTime, ruFUSION_ACTORSTATE_CROUCH_BEGIN, ruFUSION_ACTORSTATE_CROUCH_END, 0, "LuaYU_ClickFunGoBox_05_2" ) ~= 1 then
			ScriptMessage( T_ID, T_ID, 0,"[SAY_NPC_BUSY]", 0 );--�ؼЦ��L��
			return
		else 
			SetPlot( O_ID,"touch","LuaYU_ClickFunGoBox_05",10 )
		end
	end
end

function LuaYU_ClickFunGoBox_05_2( ObjID, CheckStatus )
	local O_ID = OwnerID() -- ���a
	local T_ID = TargetID()  -- ����
	local Manager = ReadRoleValue( T_ID , EM_RoleValue_PID  ) --�Щx
	local MissionOK = ReadRoleValue( Manager , EM_RoleValue_Register+1  ) --�P�_�ثe�ĴX�^�X

--	say(O_ID, "OID 5")
--	say(T_ID, "TID 5")
--	say(Manager, "Manager 5")

	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			-- ���\
			EndCastBar( O_ID, CheckStatus );

			AdjustFaceDir( Manager, O_ID , 0 ) --���V			
			Say( Manager, "[SC_CLICKFUNGO18]" ) --���U�}�B

			PlayMotion( Manager, 109) 

			CastSpelllv( Manager , O_ID , 492794 , 1 )

			PlayMotionEX( T_ID, ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP)  --���򼽩�145    146
			SetPlot( T_ID,"touch","",0 )

		else
			-- ����
			EndCastBar( O_ID, CheckStatus );
		end
	end
end

--****************************************************************--
function LuaYU_ClickFunGoBox_test6() 
	SetPlot( OwnerID() ,"touch",  "LuaYU_ClickFunGoBox_06" , 20 )   --
--	SetPlot( OwnerID() ,"touch",  "LuaYU_ClickFunGoBox_test6" , 20 )   --
end

--function LuaYU_ClickFunGoBox_test6()
function LuaYU_ClickFunGoBox_06()
	BeginPlot( TargetID() , "LuaYU_ClickFunGoBox_06_1" , 0 )  
end

function LuaYU_ClickFunGoBox_06_1()   --�R�B��ê��    �~�@��
	local O_ID = OwnerID() --����
	local T_ID = TargetID()  --���a
	local Manager = ReadRoleValue( O_ID , EM_RoleValue_PID  ) --�Щx
	local MissionOK = ReadRoleValue( Manager , EM_RoleValue_Register+1  ) --�P�_�ثe�ĴX�^�X
	local NeedTime 

--	say(O_ID, "OID 6")
--	say(T_ID, "TID 6")
--	say(Manager, "Manager 6")

	local P = 3
	local XX = Rand( P )     
						
	if XX == 0 then   
		AdjustFaceDir( Manager, T_ID , 0 ) --���V
		PlayMotion( Manager, 112) 
		Say( Manager, "[SC_CLICKFUNGO13]")	

	elseif XX == 1 then  
		AdjustFaceDir( Manager, T_ID , 0 ) --���V
		PlayMotion( Manager, 123) 
		Say( Manager, "[SC_CLICKFUNGO38]")	

	elseif XX == 2 then  
		AdjustFaceDir( Manager, T_ID , 0 ) --���V
		PlayMotion( Manager, 110) 
		Say( Manager, "[SC_CLICKFUNGO39]")	
	end

	if CheckBuff( T_ID , 503693 ) == true then
		NeedTime = 15
	elseif CheckBuff( T_ID , 503694 ) == true then
		NeedTime = 80
	else
		NeedTime = 50
	end

	SetPlot( O_ID,"touch","",0 )

	if Lua_Hao_Check_SetPlot_Touch( T_ID ) == false then
		if BeginCastBarEvent( T_ID, O_ID,"[SO_110195_1]", NeedTime, ruFUSION_ACTORSTATE_CROUCH_BEGIN, ruFUSION_ACTORSTATE_CROUCH_END, 0, "LuaYU_ClickFunGoBox_06_2" ) ~= 1 then
			ScriptMessage( T_ID, T_ID, 0,"[SAY_NPC_BUSY]", 0 );--�ؼЦ��L��
			return
		else 
			SetPlot( O_ID,"touch","LuaYU_ClickFunGoBox_06",10 )
		end
	end
end

function LuaYU_ClickFunGoBox_06_2( ObjID, CheckStatus )
	local O_ID = OwnerID() -- ���a
	local T_ID = TargetID()  -- ����
	local Manager = ReadRoleValue( T_ID , EM_RoleValue_PID  ) --�Щx
	local MissionOK = ReadRoleValue( Manager , EM_RoleValue_Register+1  ) --�P�_�ثe�ĴX�^�X

--	say(O_ID, "OID 6")
--	say(T_ID, "TID 6")
--	say(Manager, "Manager 6")

	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			-- ���\
			EndCastBar( O_ID, CheckStatus );

			local RoomID = ReadRoleValue( T_ID ,EM_RoleValue_RoomID) 
			local Master = LuaFunc_CreateObjByObj ( 101553 , T_ID  )

			Delobj(T_ID)

			SetModeEx( Master , EM_SetModeType_Fight , false )--�i�������
			SetModeEx( Master , EM_SetModeType_Searchenemy, false )--����
			--Hide(Master)	--131225 K.J. Aris
			--Show(Master, RoomID)	--131225 K.J. Aris

			WriteRoleValue(  Master  , EM_RoleValue_Register+2 ,  Manager ) 
			WriteRoleValue(  Master  , EM_RoleValue_Register+3 ,  O_ID ) 

			BeginPlot( Master , "LuaYU_ClickFunGoMonstetr_02" , 0 )
		else
			-- ����
			EndCastBar( O_ID, CheckStatus );
		end
	end
end

--****************************************************************--
function LuaYU_ClickFunGoBox_test7() 
	SetPlot( OwnerID() ,"touch",  "LuaYU_ClickFunGoBox_07" , 20 )   --
--	SetPlot( OwnerID() ,"touch",  "LuaYU_ClickFunGoBox_test7" , 20 )   --
end

--function LuaYU_ClickFunGoBox_test7()
function LuaYU_ClickFunGoBox_07()
	BeginPlot( TargetID() , "LuaYU_ClickFunGoBox_07_1" , 0 )  
end

function LuaYU_ClickFunGoBox_07_1()   --�R�B��ê��    �z�Z
	local O_ID = OwnerID() --����
	local T_ID = TargetID()  --���a
	local Manager = ReadRoleValue( O_ID , EM_RoleValue_PID  ) --�Щx
	local MissionOK = ReadRoleValue( Manager , EM_RoleValue_Register+1  ) --�P�_�ثe�ĴX�^�X
	local NeedTime 

--	say(O_ID, "OID 7")
--	say(T_ID, "TID 7")
--	say(Manager, "Manager 7")

	local P = 3
	local XX = Rand( P )     
						
	if XX == 0 then   
		AdjustFaceDir( Manager, T_ID , 0 ) --���V
		PlayMotion( Manager, 112) 
		Say( Manager, "[SC_CLICKFUNGO13]")	

	elseif XX == 1 then  
		AdjustFaceDir( Manager, T_ID , 0 ) --���V
		PlayMotion( Manager, 123) 
		Say( Manager, "[SC_CLICKFUNGO38]")	

	elseif XX == 2 then  
		AdjustFaceDir( Manager, T_ID , 0 ) --���V
		PlayMotion( Manager, 110) 
		Say( Manager, "[SC_CLICKFUNGO39]")	
	end

	if CheckBuff( T_ID , 503693 ) == true then
		NeedTime = 15
	elseif CheckBuff( T_ID , 503694 ) == true then
		NeedTime = 80
	else
		NeedTime = 50
	end
	
	SetPlot( O_ID,"touch","",0 )

	if Lua_Hao_Check_SetPlot_Touch( T_ID ) == false then
		if BeginCastBarEvent( T_ID, O_ID,"[SO_110195_1]", NeedTime, ruFUSION_ACTORSTATE_CROUCH_BEGIN, ruFUSION_ACTORSTATE_CROUCH_END, 0, "LuaYU_ClickFunGoBox_07_2" ) ~= 1 then
			ScriptMessage( T_ID, T_ID, 0,"[SAY_NPC_BUSY]", 0 );--�ؼЦ��L��
			return
		else 
			SetPlot( O_ID,"touch","LuaYU_ClickFunGoBox_07",10 )
		end
	end
end

function LuaYU_ClickFunGoBox_07_2( ObjID, CheckStatus )
	local O_ID = OwnerID() -- ���a
	local T_ID = TargetID()  -- ����
	local Manager = ReadRoleValue( T_ID , EM_RoleValue_PID  ) --�Щx
	local MissionOK = ReadRoleValue( Manager , EM_RoleValue_Register+1  ) --�P�_�ثe�ĴX�^�X

--	say(O_ID, "OID 7")
--	say(T_ID, "TID 7")
--	say(Manager, "Manager 7")

	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			-- ���\
			EndCastBar( O_ID, CheckStatus );

			local RoomID = ReadRoleValue( T_ID ,EM_RoleValue_RoomID) 
			local Master = LuaFunc_CreateObjByObj ( 101553 , T_ID  )

			Delobj(T_ID)

			SetModeEx( Master , EM_SetModeType_Fight , false )--�i�������
			SetModeEx( Master , EM_SetModeType_Searchenemy, false )--����	
			--Hide(Master)	--131225 K.J. Aris
			--Show(Master, RoomID)	--131225 K.J. Aris

			WriteRoleValue(  Master  , EM_RoleValue_Register+2 ,  Manager ) 
			WriteRoleValue(  Master  , EM_RoleValue_Register+3 ,  O_ID ) 

			BeginPlot( Master , "LuaYU_ClickFunGoMonstetr_03" , 0 )

		else
			-- ����
			EndCastBar( O_ID, CheckStatus );
		end
	end

end

--*************************************�Ǫ��ʧ@*************************************************--


function LuaYU_ClickFunGoMonstetr_01()   --�̹BBOSS

		local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
		local Manager = ReadRoleValue( OwnerID() , EM_RoleValue_Register+2  ) --�Щx
		local Player = ReadRoleValue( OwnerID() , EM_RoleValue_Register+3  ) --�Щx
		local Master = OwnerID()


		PlayMotion( Master, 15) 
		sleep(20)
		AddBuff( Master ,503048 ,1 ,-1 ); --�ܤj 2.5
		AddBuff( Master ,500900 ,1 ,-1 ); --����
		AdjustFaceDir( Master, Player , 0 ) --���V
		PlayMotion( Master, 161) 

		Say( Manager, "[SC_CLICKFUNGO15]" ) --�u�I �C������
		PlayMotion( Manager, 101) 

		sleep(20)
		PlayMotion( Master, 31) 
		sleep(20)
		WriteRoleValue(  Manager  , EM_RoleValue_Register+1 ,  10 ) 

end

function LuaYU_ClickFunGoMonstetr_02()   --�~�@��

		local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
		local Manager = ReadRoleValue( OwnerID() , EM_RoleValue_Register+2  ) --�Щx
		local Player = ReadRoleValue( OwnerID() , EM_RoleValue_Register+3  ) --�Щx
		local Master = OwnerID()

		PlayMotion( Master, 15) --�ܨ�
		AdjustFaceDir( Manager, Player , 0 ) --���V
		Say( Manager, "[SC_CLICKFUNGO19]" ) --�X�{�F�R�B����ê��
		PlayMotion( Manager, 105) --��
		sleep(20)
		AdjustFaceDir( Master, Player , 0 ) --���V
		AddBuff( Master ,503048 ,1 ,-1 ); --�ܤj 2.5
		PlayMotion( Master, 164) --�~�@��
		sleep(10)
		AddBuff( Player ,502500 ,1 ,2 ); --����
		sleep(10)
		SetFollow( Master, Player )
		PlayMotion( Master, 56) --�岴
		sleep(20)
		BeginPlot(  Master , "LuaP_Dead" , 0 )   
		CancelBuff( Master, 503048 )

		PlayMotion( Manager, 112) 
		Say( Manager, "[SC_CLICKFUNGO20]" ) --���I����@��

		SetModeEx( Master , EM_SetModeType_Move, false )--����
		Hide(Master)
		Show(Master, RoomID)

end

function LuaYU_ClickFunGoMonstetr_03()   --�z�Z

		local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
		local Manager = ReadRoleValue( OwnerID() , EM_RoleValue_Register+2  ) --�Щx
		local Player = ReadRoleValue( OwnerID() , EM_RoleValue_Register+3  ) --�Щx
		local Master = OwnerID()


		PlayMotion( Master, 15) --�ܨ�
		AdjustFaceDir( Manager, Player , 0 ) --���V
		Say( Manager, "[SC_CLICKFUNGO19]" ) --�X�{�F�R�B����ê��
		PlayMotion( Manager, 105) --��
		sleep(20)
		AdjustFaceDir( Master, Player , 0 ) --���V
		AddBuff( Master ,503048 ,1 ,-1 ); --�ܤj 2.5
		PlayMotion( Master, 164) --�~�@��
		sleep(10)
		AddBuff( Player ,502500 ,1 ,2 ); --����
		sleep(10)
		PlayMotion( Master, 32) --���D����
		sleep(20)
		AdjustFaceDir( Manager, Player , 0 ) --���V
		Say( Manager, "[SC_CLICKFUNGO21]" ) --��H����
		ScriptMessage( Player , Player , 1 , "[SC_CLICKFUNGO37]" , 1 ) 
		PlayMotion( Manager, 115) --�E�y

		SetModeEx( Master , EM_SetModeType_Searchenemy, true )--����	
		Hide(Master)
		Show(Master, RoomID)

		SetAttack( Master , Player )

end

--*****************************   �R�B������ ***************************************--

function LuaYU_ClickFunMM_00()--�ѤH�ܨ�

	local SEX = ReadRoleValue( TargetID() , EM_RoleValue_SEX ) 
	if SEX == 0 then
		AddBuff( TargetID()  ,503751 ,1 , 3600 ); --�Ѥ���
	elseif SEX == 1 then
		AddBuff( TargetID()  ,503752 ,1 , 3600 ); --�ѱC�C
	end

end

function LuaYU_ClickFunMM_01()--�p���ܨ�
	local SEX = ReadRoleValue( TargetID()  , EM_RoleValue_SEX ) 
	if SEX == 0 then
		AddBuff( TargetID()  ,503760 ,1 , 3600 ); --�k��
	elseif SEX == 1 then
		AddBuff( TargetID()  ,503761 ,1 , 3600 ); --�k��
	end
end


function LuaYU_Life_is_Good_01( Option ) --204464

	if ( Option == "CHECK" ) then

		local BuffType = 0
		local Count = BuffCount ( OwnerID())
		for i = 0 , Count do
			local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
			if GameObjInfo_int ( BuffID , "AssistType" ) == 68 then
				BuffType = GameObjInfo_int ( BuffID , "AssistType" )
				break
			end
		end

		if BuffType == 68 then				       	    --/*���M�����A�L�k�ϥ�
			ScriptMessage(OwnerID(), OwnerID() , 1 , "[SYS_GAMEMSGEVENT_167]" , 0 )  --�M������ϥ�
			return false
		else
			return true
		end

	elseif ( Option == "USE" ) then

		local CD_BUFF =  Davis_CheckUse(OwnerID(),493515) -- �P�_�Ӫk�N�� CD�ɶ��A0 ������CD�AFALSE �� CD�D������ "�L"               Davis_CheckUse(OwnerID(),�k�N���XID)
		if CD_BUFF ~= 0  then --�p�G�ثe ��� �٦b
			ScriptMessage(OwnerID(), OwnerID() , 1 , "[SYS_GAMEMSGEVENT_107]" , 0 )  --�N�o���C
			ScriptMessage(OwnerID(), OwnerID() , 0 , "[SYS_GAMEMSGEVENT_107]" , 0 )  --�N�o���C
		else			
			Beginplot( OwnerID(),"LuaYU_Life_is_Good_00", 0 )
		end
	end
end


function LuaYU_Life_is_Good_00()
	local PlayerID = OwnerID()
	local CheckTime = 1
	local RunTime = 1
	local DialogStatus = 0
	local TransferSelect = {}
	local RoomID = ReadRoleValue( PlayerID ,EM_RoleValue_RoomID) 
	TransferSelect[0] = { "[493509]" }
	TransferSelect[1] = { "[493510]" }
	TransferSelect[2] = { "[493511]" }
	TransferSelect[3] = { "[493513]" }
	TransferSelect[4] = { "[493514]" }
	TransferSelect[5] = { "[SO_EXIT]" }				-- ���}���
	if CheckBuff( OwnerID() , 501570) == false then  --�W�[�ˬd�P�_
		DialogCreate( OwnerID() , EM_LuaDialogType_Select , "[SC_YU_GUILDGAMEGOODLIFE_01]" )
		for i = 0, table.getn( TransferSelect ) do
			DialogSelectStr( OwnerID() , TransferSelect[i][1] )
		end
		AddBuff(OwnerID() , 501570,0,-1);--�M�ᵹ��BUFF
		if( DialogSendOpen( OwnerID() ) == false ) then 
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 )	--��ưe�X�����D
			return 0
		end
		while true do
			Sleep( 5 )
			RunTime = RunTime + 1
			if RunTime  > 100 then -- ���L�a�j��
				DebugMsg( 0, RoomID ,"Exit the MENU because IDLE a long Time !!")
				DialogClose( PlayerID )
				CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
				break
			end

			DialogStatus = DialogGetResult( PlayerID )
			--Say( PlayerID , DialogStatus )

			if DialogStatus == -2   then
				-- DO nothing
			elseif DialogStatus == 5 or DialogStatus == -1 then
				DialogClose( PlayerID )
				CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
				break

			elseif DialogStatus == 0 then

				CastSpelllv( PlayerID , PlayerID , 493509 , 0 )	
			--	Beginplot( PlayerID ,"LuaYU_Life_is_Good_02", 0 )
				DialogClose( PlayerID )
				CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
				break

			elseif DialogStatus == 1 then

				CastSpelllv( PlayerID , PlayerID , 493510 , 0 )	
			--	Beginplot( PlayerID ,"LuaYU_Life_is_Good_02", 0 )
				DialogClose( PlayerID )
				CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
				break

			elseif DialogStatus == 2 then

				CastSpelllv( PlayerID , PlayerID , 493511 , 0 )	
			--	Beginplot( PlayerID ,"LuaYU_Life_is_Good_02", 0 )
				DialogClose( PlayerID )
				CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
				break


			elseif DialogStatus == 3 then

				CastSpelllv( PlayerID , PlayerID , 493513 , 0 )	
			--	Beginplot( PlayerID ,"LuaYU_Life_is_Good_02", 0 )
				DialogClose( PlayerID )
				CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
				break

			elseif DialogStatus == 4 then

				CastSpelllv( PlayerID , PlayerID , 493514 , 0 )	
			--	Beginplot( PlayerID ,"LuaYU_Life_is_Good_02", 0 )
				DialogClose( PlayerID )
				CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
				break

			end
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	end

end

function LuaYU_Life_is_Good_02()

	DelBodyItem( OwnerID() , 205019 , 1 )

end

function mika_ClickFunGo_test1()
	local O_ID = OwnerID()
	local LuckyToken =  CountBodyItem( O_ID , 205018 )  --���B����

	GiveBodyItem( O_ID , 721820 , 1 );  
	sleep(10)
	local Token =  CountBodyItem( O_ID , 205017 )  --�R�B����
	local LuckyToken2 =  CountBodyItem( O_ID , 205018 )  --���B����
	local newlucky = (LuckyToken2 - LuckyToken)

	say(O_ID, "destiny token ="..token)
	say(O_ID, "before - LuckyToken = "..LuckyToken )
	say(O_ID, "after  - LuckyToken = "..newlucky )

	WriteRoleValue(  O_ID  , EM_RoleValue_Register+7 ,  Token ) --�R�B����
	AddRoleValue(  O_ID  , EM_RoleValue_Register+8 ,  newlucky ) --���B����
	local R7 = ReadRoleValue(O_ID, EM_RoleValue_Register+7 )
	local R8 = ReadRoleValue(O_ID, EM_RoleValue_Register+8)
	say(O_ID, "destiny token ="..R7..", lucky token  = "..R8 )
end