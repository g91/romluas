function Lua_kors_pfes_Q3() --Q3
	local OID = OwnerID()
	local TID = TargetID()
	local buff = 0
	local bufftable = {502130,502131,502132,502156,502157,502184,507705,507706}
	local count = table.getn( bufftable)
	local key = CheckFlag(OID , 546010)
	for i = 1,count do
		if CheckBuff(OID,bufftable[i]) == TRUE then
			buff = buff +1
		end
	end

	if key == FALSE then
		if buff == 0 then
			SetSpeakDetail(OID,"[SC_PFES_KORS_Q3_00]")
			if  CountBodyItem( OID , 240524 ) ~= 0 or CountBodyItem( OID , 240525 ) ~= 0 then
				AddSpeakOption(OID,TID ,"[SC_PFES_KORS_Q3_04]","Lua_kors_pfes_Q3GIVEC",0)
			else
				AddBuff(OID,502500,1,3)
			end
		elseif buff ~= 0 then
			SetSpeakDetail(OID,"[SC_PFES_KORS_Q3_01]")
			GiveBodyItem(OID,725749,1)
			GiveBodyItem ( OID , 209433 , 2 )
			SetFlag(OID,546010,1)
		end
	elseif key == TRUE then
		SetSpeakDetail(OID,"[SC_PFES_KORS_Q3_02]")
		if  CountBodyItem( OID , 240524 ) ~= 0 or CountBodyItem( OID , 240525 ) ~= 0 then
			AddSpeakOption(OID,TID ,"[SC_PFES_KORS_Q3_04]","Lua_kors_pfes_Q3GIVEC",0)
		end
	end
end

function Lua_kors_pfes_Q3GIVEC()
	local OID = OwnerID()
	CloseSpeak(OID)

	if CountBodyItem( OID , 240524 ) ~= 0 then 
		DelBodyItem( OID , 240524 , 1)
		GiveBodyItem(OID , 725749 ,1)
		ScriptMessage(OID , OID , 2,"[SC_PFES_KORS_Q3_03]",C_SYSTEM)
	elseif CountBodyItem( OID , 240525 ) ~=0 then
		DelBodyItem( OID , 240525 ,1 )
		GiveBodyItem(OID , 725749 ,1)
		ScriptMessage(OID , OID , 2,"[SC_PFES_KORS_Q3_03]",C_SYSTEM)
	else
		ScriptMessage(OID , OID , 1 ,"[SC_112503_NO]", 0 )
	end

end

function Lua_kors_pfes_Q3RE()
	SetFlag(OwnerID(),546010,0)
end

function Lua_kors_pfes_Q3TAgive() --變身藥水給予
	local OID = OwnerID()
	local item = {203085,203087,203090,203091,203155,207965,207966,}
	for i = 1,table.getn(item) ,1 do
		GiveBodyItem(OID ,item[i],1)
	end
end

function Lua_kors_pfes_Q3GIV()
	GiveBodyItem(OwnerID(), 725748 ,1)
end