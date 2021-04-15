function Lua_dragoon_Get_SYS(  ) --A 理智容許值、B 情感容許值 、C 尊嚴容許值

	if TargetID() == OwnerID() or TargetID() == nil then
		Say( OwnerID() , " I don't hav any target " )
		return false
	else
		for i = 1  , 4 , 1 do
			WriteRoleValue( TargetID() , EM_RoleValue_Register + i - 1 , 0 )
		end
		return true
	end

end

function Lua_dragoon_Get_SYS_2(  )
	local A , B , C = 50+(DW_Rand(6)-1) * 20 , 50+(DW_Rand(6)-1) * 20 , 50+(DW_Rand(6)-1) * 20
	local Dragon = TargetID()
	Say( Dragon , " A = "..A.." B = "..B.." C = "..C )
	WriteRoleValue( dragon , EM_RoleValue_Register + 9 , 1  )
	BeginPlot( Dragon , "Lua_dragoon_Get_SYS_CountDown" , 0 )
	Callplot( OwnerID() , "Lua_dragon_Get_SYS_DO_B" , A , B , C , Dragon )
end

function Lua_dragon_Get_SYS_DO_B( A , B , C , Dragon)

	local DeltaLv = ReadRoleValue( OwnerID() , EM_RoleValue_LV ) / ReadRoleValue( dragon, EM_RoleValue_LV ) 
	local InitialValue = { }
	local Limit = { [1] = A, [2] = B , [3] = C }

	for i = 1 , 3 , 1 do
		if ReadRoleValue( dragon , EM_RoleValue_Register+i ) == 0 then
			if i ~= 2 then
				InitialValue[i] =  math.floor( Limit[i] - DW_Rand( Limit[i] * 0.2 ) + Limit[i] * 0.1 -20*(DeltaLv-1)  )--公式1
			else
				InitialValue[i] =  math.floor( Limit[i] + DW_Rand( Limit[i] * 0.1 ) + 20  )--公式1.5
			end
			if InitialValue[i] < 0 then InitialValue[i] = 0 end
			if InitialValue[i] > 250 then InitialValue[i] = 250 end
			WriteRoleValue( dragon , EM_RoleValue_Register+i , InitialValue[i]  )
		else
			InitialValue[i] = ReadRoleValue( dragon , EM_RoleValue_Register +i) 
		end
	end

	local FinalValue = {  InitialValue[1] , InitialValue[2] , InitialValue[3]  }
	local TargetValue = 0

	if ReadRoleValue( dragon , EM_RoleValue_Register ) == 0 then
		local Value = 2000 + 5*( InitialValue[1]  + InitialValue[2] +InitialValue[3] ) - Lua_dragon_KnowledgeValue()/100 --公式2
		WriteRoleValue( dragon , EM_RoleValue_Register ,Value  )		
	end

	TargetValue = ReadRoleValue( dragon , EM_RoleValue_Register ) 

	local EmotionFix = {}
	EmotionFix[1] = { [1] = -5 ,  [2] = -5 , [3] = -5 }
	EmotionFix[2] = { [1] = 5 ,  [2] = -5 , [3] = -5 }
	EmotionFix[3] = { [1] = -5 ,  [2] = 5 , [3] = -5 }
	EmotionFix[4] = { [1] = -5 ,  [2] = -5 , [3] = 5 }
	EmotionFix[5] = { [1] = -5 ,  [2] = 5 , [3] = 5 }
	EmotionFix[6] = { [1] = 5 ,  [2] = -5 , [3] = 5 }
	EmotionFix[7] = { [1] = 5 ,  [2] = 5 , [3] = -5 }
	EmotionFix[8] = { [1] = 5 ,  [2] = 5 , [3] = 5 }
	EmotionFix[9] = { [1] = 0 ,  [2] = 0 , [3] = 0 }

	local EmotionState = 0	
	local EmotionCheck = {	[0] = 1 ,[1] = 2 ,[10] = 3 ,[100] = 4 ,[110] = 5 ,[101] = 6,[11] = 7 ,[111] = 8 }

	if  FinalValue[1] > (Limit[1]*1.5+30) or FinalValue[2] >  (Limit[2]*1.5+30) or  FinalValue[3] >  (Limit[3]*1.5+30) or FinalValue[1] == 255 or FinalValue[2] == 255 or FinalValue[3] == 255 then
		EmotionState = 9
	else
		local Check = 0
		for i = 1 , 3 , 1 do
			if ( FinalValue[i] - Limit[i] ) > 0 then
				Check = Check + 10^( 3 - i )
			end
		end
		EmotionState = EmotionCheck[Check]
		Say( OwnerID() , EmotionState )
	end

	local Emote = {"|cff0080ffTrust|r" , "|cff00ff80Fancy|r" , "|cff00ff80Reverence|r" , "|cff00ff80Admiration|r" , "|cffff8040Angry|r" , "|cffff8040Stubborn|r" , "|cffff8040Doubt|r" , "|cffdd5a22Scornful|r" , "|cffff0000Ignore|r"}

	DialogCreate( OwnerID() , EM_LuaDialogType_Select , "TargetValue = "..TargetValue.." Taget Emotion is "..Emote[EmotionState].." , Select Your Action : " ) 
	DialogSelectStr( OwnerID() , "Negotiate( Usefull to Admiration,Angry,Stubborn,Scornful )") 
	DialogSelectStr( OwnerID() , "Threaten( Usefull to Fancy , Stubborn,Doubt,Scornful )") 
	DialogSelectStr( OwnerID() , "Placate( Usefull to Reverence,Angry,Doubt,Scornful )") 
	DialogSelectStr( OwnerID() , "Silence( Like Placate & Threaten , Maybe release Ignore State)") 
	DialogSelectStr( OwnerID() , "Provoke( Like Placate & Negotiate , Maybe release Ignore State )") 
	DialogSelectStr( OwnerID() , "Frolic( Like Negotiate & Threaten , Maybe release Ignore State )") 
	DialogSelectStr( OwnerID() , "Check" )
	DialogSelectStr( OwnerID() , "Quit" )

	local Action = {}
	Action[1] = { 10 , 0 , -20 }
	Action[2] = { -20 , 10 , 0  }
	Action[3] = { 0 , -20 , 10  }
	Action[4] = { -10 , -10 , 15  }
	Action[5] = { -10 , 15 , -10  }
	Action[6] = { 15 , -10 , -10  }
	Action[7] = { 0 , 0 , 0  }

	if( DialogSendOpen( OwnerID() ) == false ) then 
		ScriptMessage( OwnerID(),OwnerID(),1,GetString("SYS_FIXEQ_DATA_ERROR"),0)	
		--資料送出有問題
		return 0
	end

	local SelectID = EX_GetDialogResoult( OwnerID(), 30 , 50 , TargetID() )

	DialogClose( OwnerID() )

	if SelectID >= 0 and SelectID < 7 then
		SelectID = SelectID + 1
		Say( OwnerID() ," A = "..FinalValue[1].." B = "..FinalValue[2].." C= "..FinalValue[3] )
		if EmotionState ~= 9 then
			local DeltaTrust = 0
			local DeltaValue  = 0
			for i = 1 , 3 , 1 do
				DeltaValue = Action[SelectID][i] + EmotionFix[EmotionState][i] + (DW_Rand(10) - 5 )
				FinalValue[i] =  FinalValue[i] + DeltaValue
				Say( OwnerID() , " Delta "..i.." = "..DeltaValue )
				if FinalValue[i] < 0 then FinalValue[i] = 0 end
				if FinalValue[i] > 255 then FinalValue[i] = 255 end
				WriteRoleValue( dragon , EM_RoleValue_Register+i , FinalValue[i]  )
				local FixValue = FinalValue[i] - Limit[i]
				if FixValue == 0 then FixValue = 1 end
				Say( OwnerID() , " DeltaValue =  50*"..DeltaValue.."*(1+("..FixValue.."/5*"..math.abs(FixValue).."))" )
				 DeltaTrust =  DeltaTrust + 50*DeltaValue*( 1 + FixValue/(5* math.abs(FixValue) ) )  --公式3
			end
			Say( OwnerID() , " DeltaTrust = "..DeltaTrust.." *(1+"..Lua_dragon_KnowledgeValue().."*("..DeltaValue.."/"..math.abs(DeltaValue)..")/5000 )")
			if DeltaTrust ~= 0 then
				DeltaTrust = DeltaTrust*( 1 -  Lua_dragon_KnowledgeValue()*(DeltaTrust/math.abs(DeltaTrust))/5000 ) --公式4
			end
			Say( OwnerID() , " DeltaTrust "..DeltaTrust )
			TargetValue = TargetValue + DeltaTrust
			if TargetValue > 5000 then TargetValue = 5000 end
			WriteRoleValue( dragon , EM_RoleValue_Register ,TargetValue  )
		else
			if SelectID > 3 and SelectID ~= 7 then
				local CheckMotion = "NO"

				if SelectID == 4 then
					if Limit[1] > 100 and Limit[2] > 100 and Limit[3] > 100 then  CheckMotion = "YES" end
					if Limit[1] <= 100 and Limit[2] > 100 and Limit[3] > 100 then  CheckMotion = "YES" end
					if Limit[1] <= 100 and Limit[2] <= 100 and Limit[3] > 100 then  CheckMotion = "YES" end
				end
				if SelectID == 5 then
					if Limit[1] > 100 and Limit[2] <= 100 and Limit[3] <= 100 then CheckMotion = "YES" end
					if Limit[1] <= 100 and Limit[2] > 100 and Limit[3] <= 100 then CheckMotion = "YES" end
					if Limit[1] <= 100 and Limit[2] <= 100 and Limit[3] <= 100 then CheckMotion = "YES" end
				end
				if SelectID == 6 then
					if Limit[1] > 100 and Limit[2] <= 100 and Limit[3] > 100 then CheckMotion = "YES" end
					if Limit[1] > 100 and Limit[2] > 100 and Limit[3] <= 100 then CheckMotion = "YES" end
					if Limit[1] <= 100 and Limit[2] > 100 and Limit[3] > 100 then  CheckMotion = "YES" end
				end

				local RandNum =  ( 25 + Lua_dragon_KnowledgeValue()/50 ) * 100
				if DW_Rand( 10000 ) <= RandNum and CheckMotion == "YES" then
					for i = 1 , 3 , 1 do
						if FinalValue[i] > (Limit[i]*1.5 + 30 ) then
							if i ~= 2 then
								FinalValue[i] =  math.floor( Limit[i] - DW_Rand( Limit[i] * 0.2 ) + Limit[i] * 0.1 -20*(DeltaLv-1)  )--公式1
							else
								FinalValue[i] =  math.floor( Limit[i] + DW_Rand( Limit[i] * 0.1 ) + 20  )--公式1.5
							end
							if FinalValue[i] > (Limit[i]*1.5 + 30 ) then FinalValue[i] = Limit[i]*1.5  end
							WriteRoleValue( dragon , EM_RoleValue_Register+i , FinalValue[i]  )
						end
					end	
					Say( OwnerID() , " Release Ignore" )
				end
			end
		end
		Say( OwnerID() ," A = "..FinalValue[1].." B = "..FinalValue[2].." C= "..FinalValue[3] )

		if ReadRoleValue( Dragon , EM_RoleValue_Register ) <= 100  then
			if EmotionState < 5 then
				Say( Dragon , "GET" )
				WriteRoleValue( dragon , EM_RoleValue_Register + 9 , 0  )
				return 1
			else
				WriteRoleValue( dragon , EM_RoleValue_Register ,100  )
			end
		end
		CallPlot( OwnerID() , "Lua_dragon_Get_SYS_Result" ,A , B , C , Dragon)
		return 1

	else
		WriteRoleValue( dragon , EM_RoleValue_Register + 9 , 0  )
		return -1
	end
end

function Lua_dragon_Get_SYS_Result( A , B , C , Dragon)

	Callplot( OwnerID() , "Lua_dragon_Get_SYS_DO_B" , A , B , C , dragon )
end

function Lua_dragon_KnowledgeValue()

	local DragonKnowledge = 500*ReadRoleValue( OwnerID() , EM_RoleValue_VOC)
	return DragonKnowledge

end

function Lua_dragoon_Get_SYS_CountDown()
	for i = 0 , 500 , 1 do
		sleep( 10 )
		if i == 30 then
			Say( OwnerID() , "Time Out" )
		end
		if ReadRoleValue( OwnerID() , EM_RoleValue_Register + 9 ) == 0 then
			Say( OwnerID() , "Use "..i.." Sec" )
			break
		end
	end
end