function star_WorldBattle_BuffGiver()
	local BonusOn = GetWorldVar( "star_WorldBattle_Prize_On" )
	--Say( OwnerID() , BonusOn )	
	if BonusOn == 1 then 
		LoadQuestOption(OwnerID())
		AddSpeakOption ( OwnerID(), TargetID( ), "[SC_WORLDBATTLE_PRIZENPC_BUFF1]" , "star_WorldBattle_BuffGiver_1", 0 ) 
		AddSpeakOption ( OwnerID(), TargetID( ), "[SC_WORLDBATTLE_PRIZENPC_BUFF2]" , "star_WorldBattle_BuffGiver_2", 0 ) 
		AddSpeakOption ( OwnerID(), TargetID( ), "[SC_WORLDBATTLE_PRIZENPC_BUFF3]" , "star_WorldBattle_BuffGiver_3", 0 ) 
		AddSpeakOption ( OwnerID(), TargetID( ), "[SC_WORLDBATTLE_PRIZENPC_BUFF4]" , "star_WorldBattle_BuffGiver_4", 0 ) 
		AddSpeakOption ( OwnerID(), TargetID( ), "[SC_WORLDBATTLE_PRIZENPC_BUFF5]" , "star_WorldBattle_BuffGiver_5", 0 ) 
		AddSpeakOption ( OwnerID(), TargetID( ), "[SC_WORLDBATTLE_PRIZENPC_TITLE]" , "star_WorldBattle_BuffGiver_6", 0 ) 
	elseif BonusOn == 0 then
		SetSpeakDetail ( OwnerID(), "[SC_WORLDBATTLE_PRIZENPC_NOPRIZETALK]" )		--未在獎勵時間的對話
	end
end

function star_WorldBattle_BuffGiver_1()
	local BuffTable = { 508997 , 508998 , 508999 , 509000 , 509001 }
	local IsBuff = 0		--判斷是否玩家身上已有buff
	for i=1 , 5 do 
		if CheckBuff( OwnerID() , BuffTable[i] ) == true then	
			IsBuff = 1
			break
		end
	end
	if IsBuff == 0 then
		AddBuff( OwnerID() , 508997 , 0 ,  -1 )
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_WORLDBATTLE_PRIZENPC_ALREADYBUFF]" , 1 )
	end	
	CloseSpeak(  OwnerID() )
	--Say( OwnerID() , "Buff1!" )
end

function star_WorldBattle_BuffGiver_2()
	local BuffTable = { 508997 , 508998 , 508999 , 509000 , 509001 }
	local IsBuff = 0		--判斷是否玩家身上已有buff
	for i=1 , 5 do 
		if CheckBuff( OwnerID() , BuffTable[i] ) == true then	
			IsBuff = 1
			break
		end
	end
	if IsBuff == 0 then
		AddBuff( OwnerID() , 508998 , 0 ,  -1 )
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_WORLDBATTLE_PRIZENPC_ALREADYBUFF]" , 1 )
	end		
	CloseSpeak(  OwnerID() )	
	--Say( OwnerID() , "Buff2!" )
end

function star_WorldBattle_BuffGiver_3()
	local BuffTable = { 508997 , 508998 , 508999 , 509000 , 509001 }
	local IsBuff = 0		--判斷是否玩家身上已有buff
	for i=1 , 5 do 
		if CheckBuff( OwnerID() , BuffTable[i] ) == true then
			IsBuff = 1
			break
		end
	end
	if IsBuff == 0 then
		AddBuff(  OwnerID() , 508999 , 0 ,  -1 )
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_WORLDBATTLE_PRIZENPC_ALREADYBUFF]" , 1 )
	end		
	CloseSpeak(  OwnerID() )
	--Say( OwnerID() , "Buff3!" )
end

function star_WorldBattle_BuffGiver_4()
	local BuffTable = { 508997 , 508998 , 508999 , 509000 , 509001 }
	local IsBuff = 0		--判斷是否玩家身上已有buff
	for i=1 , 5 do 
		if CheckBuff( OwnerID() , BuffTable[i] ) == true then
			IsBuff = 1
			break
		end
	end
	if IsBuff == 0 then
		AddBuff(  OwnerID() , 509000 , 0 ,  -1 )
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_WORLDBATTLE_PRIZENPC_ALREADYBUFF]" , 1 )
	end		
	CloseSpeak(  OwnerID() )
	--Say( OwnerID() , "Buff4!" )
end

function star_WorldBattle_BuffGiver_5()
	local BuffTable = { 508997 , 508998 , 508999 , 509000 , 509001 }
	local IsBuff = 0		--判斷是否玩家身上已有buff
	for i=1 , 5 do 
		if CheckBuff( OwnerID() , BuffTable[i] ) == true then
			IsBuff = 1
			break
		end
	end
	if IsBuff == 0 then
		AddBuff( OwnerID() , 509001 , 0 , -1 )
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_WORLDBATTLE_PRIZENPC_ALREADYBUFF]" , 1 )
	end	
	CloseSpeak(  OwnerID() )
	--Say( OwnerID() , "Buff5!" )
end

function star_WorldBattle_BuffGiver_6()
	if ReadRoleValue( OwnerID() , EM_RoleValue_IncursivePoint ) >= 831600 then
		givebodyitem( OwnerID() , 530677 , 1 )
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_WORLDBATTLE_PRIZENPC_NOTENOUGH]" , 1 )
	end
	CloseSpeak(  OwnerID() )
	--Say( OwnerID() , "Title!" )
end