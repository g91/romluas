
-----------------------------------------------------------------------------------------����������
--�Z���U�����⪺�ɶ��GSYS_WORLD_EVENT_END_TIME
--�դO��GSYS_WORLD_EVENT_INFLUENCE_SCORE
--���y�ɶ��GSYS_WORLD_EVENT_PRIZE_TIME
-----------------------------------------------------------------------------------------���t�ӯ�]�w����
--�}�ҳ]�w����ɶ��\��}���GSETTING_TurnOn_WorldBattle_EVENT_END_TIME( 0 �������A1 ���}��)
--�]�w����ɶ�(��)�GSETTING_WorldBattle_EVENT_END_TIME1
--�]�w����ɶ�(��)�GSETTING_WorldBattle_EVENT_END_TIME2
----------------------------------------------------------------------------------------�P�_�ϥ�
--�O�_�}����y�Gstar_WorldBattle_Prize_On  ( 0 �������A1 ���}��)
----------------------------------------------------------------------------------------
function star_WorldBattle_EventControl()
	SetWorldVar( "star_WorldBattle_Prize_On" , 0 )			--�O�_�}����y�ɶ�(0������A1��ܶ})
	SetWorldVar( "SYS_WORLD_EVENT_PRIZE_TIME" , 0 )
	local IsReset = 0			-----�O�_���m�L
	local BonusNpc
	local NPCID = 105110
	local NPCFlag = 780843		--���yNPC��flag
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	while 1 do
		sleep(1)
		local CountDownBuff 	------�p��ɶ���		
		local TimeCounter1 = 0
		local TimeCounter2 = 0
		local EndTime1 			------����ɶ�(�դ�)�A�p��
		local EndTime2 			------����ɶ�(�ߤW)�A�p��
		local EndMinute = 00 	------����ɶ��A����

		if GetWorldVar( "SETTING_TurnOn_WorldBattle_EVENT_END_TIME" ) == 0 then
			EndTime1 = 10		------����ɶ�(�դ�)
			EndTime2 = 22		------����ɶ�(�ߤW)	
		elseif GetWorldVar( "SETTING_TurnOn_WorldBattle_EVENT_END_TIME" ) == 1 then
			EndTime1 = GetWorldVar( "SETTING_WorldBattle_EVENT_END_TIME1" )		------����ɶ�(�դ�)
			EndTime2 = GetWorldVar(	"SETTING_WorldBattle_EVENT_END_TIME2" ) 		------����ɶ�(�ߤW)
			if EndTime1 > EndTime2 then
				local SwitchTemp1 = EndTime1
				EndTime1 = EndTime2
				EndTime2 = SwitchTemp1
			end
		end		
		
		local MinusPerHR = 200	--�C�p�ɩT�w����
		local Score = -20		--�_�l�դO�����
		local EndTime_Temp 
		local EndTime_Counter = 0
		SetWorldVar( "SYS_WORLD_EVENT_INFLUENCE_SCORE" , -20 )  --�]�w�_�l�դO����
		
		local TestCounter = 0
		
		local TimeVal = GetLocaltime( 0 , 0 ) -- ���o�t�ήɶ������, �q 1900 �~�}�l��
		local hr = GetLocaltime( TimeVal , 1 )	-- ���o�Ӯɶ��Ȫ��p��
		local minute = GetLocaltime( TimeVal , 2 )	-- ���o�Ӯɶ��Ȫ��� 
		local second = GetLocaltime( TimeVal , 3 )	-- ���o�Ӯɶ��Ȫ���
		
		EndTime_Counter = star_WorldBattle_TimeCount(hr , minute , second , EndTime1 , EndTime2 , EndMinute)
		
		while 1 do
			sleep(10)	
			TimeVal = GetLocaltime( 0 , 0 ) -- ���o�t�ήɶ������, �q 1900 �~�}�l��
			hr = GetLocaltime( TimeVal , 1 )	-- ���o�Ӯɶ��Ȫ��p��
			minute = GetLocaltime( TimeVal , 2 )	-- ���o�Ӯɶ��Ȫ��� 
			second = GetLocaltime( TimeVal , 3 )	-- ���o�Ӯɶ��Ȫ���
			
			if EndTime_Counter ~= 0 then
				EndTime_Counter = EndTime_Counter - 1
				SetWorldVar( "SYS_WORLD_EVENT_END_TIME" , EndTime_Counter )
			end
			
			TestCounter = TestCounter + 1
			if TestCounter == 5 then				
				--Say(OwnerID() , "hr ="..hr)
				--Say(OwnerID() , "minute ="..minute)
				--Say(OwnerID() , "second ="..second)
				--Say(OwnerID() , "Score ="..GetWorldVar( "SYS_WORLD_EVENT_INFLUENCE_SCORE" ))
				--Say(OwnerID() , "EndTime ="..GetWorldVar( "SYS_WORLD_EVENT_END_TIME" ))
				--Say(OwnerID() , "PrizeTime ="..GetWorldVar( "SYS_WORLD_EVENT_PRIZE_TIME" ))
				TestCounter	= 0
			end
			
			if (hr == EndTime1 and minute == EndMinute) or (hr == EndTime2 and minute == EndMinute) then		--���m�ɶ�
				if IsReset == 0 then					
					if GetWorldVar( "SYS_WORLD_EVENT_INFLUENCE_SCORE" ) > 0 then
						SetWorldVar( "star_WorldBattle_Prize_On" , 1 )		--�}����y�ɶ�
						sleep(50)					
						BonusNpc = CreateObjByFlag( NPCID , NPCFlag , 1 , 1 )
						--BonusNpc = star_CreateObj_NoAdd( OwnerID() , NPCID , 20 , 0 , 0 , Room , 0 ) 
						SetModeEx( BonusNpc , EM_SetModeType_Show , false )			------�����
						SetModeEx( BonusNpc , EM_SetModeType_Move , false )			------������
						SetModeEx( BonusNpc , EM_SetModeType_Strikback , false )	------������
						SetModeEx( BonusNpc , EM_SetModeType_Fight , false )		------���i���
						SetModeEx( BonusNpc , EM_SetModeType_Searchenemy , false )	------������
						SetModeEx( BonusNpc , EM_SetModeType_Mark , false )			------���i�I��
						SetModeEx( BonusNpc , EM_SetModeType_NotShowHPMP , false )	------��show���
						AddToPartition( BonusNpc , Room )
						WriteRoleValue( BonusNpc , EM_RoleValue_register1 , OwnerID() )
						BeginPlot( BonusNpc , "star_WorldBattle_BonusNPC" , 0 )
					end	
					IsReset = 1		-----�N��w���m
					break
				end	
				if TimeCounter1 >= 0 then
					TimeCounter1 = TimeCounter1 + 1
					--Say(OwnerID() , "Counter_1 ="..TimeCounter1)
				end	
			elseif (hr ~= EndTime1 or hr ~= EndTime2) and minute == EndMinute then						--�C�p�ɦ���
				if TimeCounter2 == 0 then
					Score = GetWorldVar( "SYS_WORLD_EVENT_INFLUENCE_SCORE" )
					if (Score - MinusPerHR) <= -10000 then 
						SetWorldVar( "SYS_WORLD_EVENT_INFLUENCE_SCORE" , -10000 )
					else
						SetWorldVar( "SYS_WORLD_EVENT_INFLUENCE_SCORE" , Score - MinusPerHR )
					end	
					TimeCounter2 = TimeCounter2 + 1
					--Say(OwnerID() , "Counter_2 ="..TimeCounter2)
					--Say(OwnerID() , "Score_2 ="..GetWorldVar( "SYS_WORLD_EVENT_INFLUENCE_SCORE" ))
				elseif TimeCounter2 > 0 then 
					TimeCounter2 = TimeCounter2 + 1
					--Say(OwnerID() , "Counter_3 ="..TimeCounter2)
				end	
			else																--���m�ܼ�
				if TimeCounter1 ~= 0 then
					TimeCounter1 = 0
					IsReset = 0
					--Say(OwnerID() , "Clear 1" )
				elseif TimeCounter2 ~= 0 then
					TimeCounter2 = 0
					--Say(OwnerID() , "Clear 2" )
				end
			end
		end
	end	
end

function star_WorldBattle_TimeCount(hr , minute , second , EndTime1 , EndTime2 , EndMinute)		--�p��ɶ��ϥ�
	local EndTime_Temp
	local EndTime_Counter
	if (hr < EndTime1) and (hr < EndTime2) then
		EndTime_Temp = (EndTime1-hr-1)*60*60 + (60-minute+EndMinute-1)*60 + (60 - second)
		EndTime_Counter = EndTime_Temp
		SetWorldVar( "SYS_WORLD_EVENT_END_TIME" , EndTime_Counter )
	elseif hr == EndTime1 then
		if minute < EndMinute then
			EndTime_Temp = (EndMinute-minute-1)*60 + (60 - second)
			EndTime_Counter = EndTime_Temp
			SetWorldVar( "SYS_WORLD_EVENT_END_TIME" , EndTime_Counter )
		elseif minute >= EndMinute then
			EndTime_Temp = (EndTime2-hr-1)*60*60 + (60-minute+EndMinute-1)*60 + (60 - second)
			EndTime_Counter = EndTime_Temp
			SetWorldVar( "SYS_WORLD_EVENT_END_TIME" , EndTime_Counter )
		end	
	elseif (hr > EndTime1) and (hr < EndTime2) then	
		EndTime_Temp = (EndTime2-hr-1)*60*60 + (60-minute+EndMinute-1)*60 + (60 - second)
		EndTime_Counter = EndTime_Temp
		SetWorldVar( "SYS_WORLD_EVENT_END_TIME" , EndTime_Counter )
	elseif hr == EndTime2 then
		if minute < EndMinute then
			EndTime_Temp = (EndMinute-minute-1)*60 + (60 - second)
			EndTime_Counter = EndTime_Temp
			SetWorldVar( "SYS_WORLD_EVENT_END_TIME" , EndTime_Counter )
		elseif minute >= EndMinute then
			EndTime_Temp = (24+EndTime1-hr-1)*60*60 + (60-minute+EndMinute-1)*60 + (60 - second)
			EndTime_Counter = EndTime_Temp
			SetWorldVar( "SYS_WORLD_EVENT_END_TIME" , EndTime_Counter )
		end		
	elseif (hr > EndTime2) and (hr > EndTime1) then
		EndTime_Temp = (24+EndTime1-hr-1)*60*60 + (60-minute+EndMinute-1)*60 + (60 - second)
		EndTime_Counter = EndTime_Temp
		SetWorldVar( "SYS_WORLD_EVENT_END_TIME" , EndTime_Counter )
	end	
	
	return EndTime_Counter
end

function star_WorldBattle_BonusNPC()		--���yNPC
	local ControlNPC = ReadRoleValue(OwnerID() , EM_RoleValue_register1)
	local TimeCounter = 0
	local BonusTime = 10800  -- ���y�ɶ�3�p��
	while 1 do
		sleep(10)
		--TimeCounter = TimeCounter + 1
		BonusTime = BonusTime - 1
		SetWorldVar( "SYS_WORLD_EVENT_PRIZE_TIME" , BonusTime )
		if BonusTime == 0 then
			WriteRoleValue(ControlNPC , EM_RoleValue_register1 , 1)		--�q������NPC���y�ɶ�����
			SetWorldVar( "star_WorldBattle_Prize_On" , 0 )				--���y����
			SetWorldVar( "SYS_WORLD_EVENT_PRIZE_TIME" , 0 )
			sleep(50)
			DelObj(OwnerID())
		end
	end
end


function star_WorldBattle_ScoreCal(IsWin , MapNumber)		--IsWin  �^�ǳӭt����( 0��ܿ�A1���Ĺ )�AMapNumber �^�ǬO�X���Գ�
	local WinScore = { 20 , 5 , 15 }		--�@�ɾԳ�1�A�@�ɾԳ�2�A�@�ɾԳ�3
	local LossScore = { -20 , -5 , -15 }
	if MapNumber == 1 then
		if IsWin == 1 then
			if ( GetWorldVar( "SYS_WORLD_EVENT_INFLUENCE_SCORE" )+WinScore[1] ) >= 10000 then
				SetWorldVar( "SYS_WORLD_EVENT_INFLUENCE_SCORE" , 10000 )
			else
				SetWorldVar( "SYS_WORLD_EVENT_INFLUENCE_SCORE" , GetWorldVar( "SYS_WORLD_EVENT_INFLUENCE_SCORE" )+WinScore[1] )
			end	
		elseif IsWin == 0 then
			if ( GetWorldVar( "SYS_WORLD_EVENT_INFLUENCE_SCORE" )+WinScore[1] ) <= -10000 then
				SetWorldVar( "SYS_WORLD_EVENT_INFLUENCE_SCORE" , -10000 )
			else
				SetWorldVar( "SYS_WORLD_EVENT_INFLUENCE_SCORE" , GetWorldVar( "SYS_WORLD_EVENT_INFLUENCE_SCORE" )+LossScore[1] )
			end	
		end
	elseif MapNumber == 2 then
		if IsWin == 1 then
			if ( GetWorldVar( "SYS_WORLD_EVENT_INFLUENCE_SCORE" )+WinScore[2] ) >= 10000 then
				SetWorldVar( "SYS_WORLD_EVENT_INFLUENCE_SCORE" , 10000 )
			else
				SetWorldVar( "SYS_WORLD_EVENT_INFLUENCE_SCORE" , GetWorldVar( "SYS_WORLD_EVENT_INFLUENCE_SCORE" )+WinScore[2] )
			end	
		elseif IsWin == 0 then
			if ( GetWorldVar( "SYS_WORLD_EVENT_INFLUENCE_SCORE" )+WinScore[2] ) <= -10000 then
				SetWorldVar( "SYS_WORLD_EVENT_INFLUENCE_SCORE" , -10000 )
			else
				SetWorldVar( "SYS_WORLD_EVENT_INFLUENCE_SCORE" , GetWorldVar( "SYS_WORLD_EVENT_INFLUENCE_SCORE" )+LossScore[2] )
			end	
		end
	elseif MapNumber == 3 then
		if IsWin == 1 then
			if ( GetWorldVar( "SYS_WORLD_EVENT_INFLUENCE_SCORE" )+WinScore[3] ) >= 10000 then
				SetWorldVar( "SYS_WORLD_EVENT_INFLUENCE_SCORE" , 10000 )
			else
				SetWorldVar( "SYS_WORLD_EVENT_INFLUENCE_SCORE" , GetWorldVar( "SYS_WORLD_EVENT_INFLUENCE_SCORE" )+WinScore[3] )
			end	
		elseif IsWin == 0 then
			if ( GetWorldVar( "SYS_WORLD_EVENT_INFLUENCE_SCORE" )+WinScore[3] ) <= -10000 then
				SetWorldVar( "SYS_WORLD_EVENT_INFLUENCE_SCORE" , -10000 )
			else
				SetWorldVar( "SYS_WORLD_EVENT_INFLUENCE_SCORE" , GetWorldVar( "SYS_WORLD_EVENT_INFLUENCE_SCORE" )+LossScore[3] )
			end	
		end	
	end	
end

function star_WorldBattle_CheckBonus()				--���_��T�{�O�_�O���y�ɶ���
	local BonusOn = GetWorldVar( "star_WorldBattle_Prize_On" )
	if BonusOn == 1 then
		return true
	elseif BonusOn == 0 then
		return false
	end
end