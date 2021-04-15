
function Discowood_Vocation_Talk_license_Lv15()
	local ItemID = {
			[1] = 201723	,
			[2] = 201761	,
			[3] = 201799
			}
	local Item = {
			[1] = 3	,
			[2] = 3	,
			[3] = 3
			}
	local Money = 8000
	local Count = 0
	for i=1 , table.getn(ItemID) do
		if CountBodyItem(OwnerID() , ItemID[i] ) >= Item[i] then
			Count = Count + 1
		end
	end
	if	Count <table.getn(ItemID)	then
		SetSpeakDetail(OwnerID(),"[SC_111454_23]")
		return
	end
	if ReadRoleValue(OwnerID() , EM_RoleValue_Money) >= Money then
		Count = Count + 1
	else
		SetSpeakDetail ( OwnerID(), "[SC_111454_20]") 
		return
	end

	if Count == table.getn(ItemID)+1 then
		for i =1 , table.getn(ItemID) do
			DelBodyItem(OwnerID() , ItemID[i] , Item[i] )
		end
		AddRoleValue( OwnerID() , EM_RoleValue_Money , -1*Money )
		GiveBodyItem(OwnerID() , 202949 , 1 )
		SetSpeakDetail ( OwnerID(), GetString ("SC_111454_5")   ) 
	else
		SetSpeakDetail ( OwnerID(), GetString ("SC_111454_4_15")   ) 
	end
end


function Discowood_Vocation_Talk_license_Lv20()
	local ItemID = {
			[1] = 201724	,
			[2] = 201762	,
			[3] = 201800
			}
	local Item = {
			[1] = 3	,
			[2] = 3	,
			[3] = 3
			}
	local Money = 15000
	local Count = 0
	for i=1 , table.getn(ItemID) do
		if CountBodyItem(OwnerID() , ItemID[i] ) >= Item[i] then
			Count = Count + 1
		end
	end
	if	Count <table.getn(ItemID)	then
		SetSpeakDetail(OwnerID(),"[SC_111454_23]")
		return
	end
	if ReadRoleValue(OwnerID() , EM_RoleValue_Money) >= Money then
		Count = Count + 1
	else
		SetSpeakDetail ( OwnerID(), "[SC_111454_20]") 
		return
	end

	if Count == table.getn(ItemID)+1 then
		for i =1 , table.getn(ItemID) do
			DelBodyItem(OwnerID() , ItemID[i] , Item[i] )
		end
		AddRoleValue( OwnerID() , EM_RoleValue_Money , -1*Money )
		GiveBodyItem(OwnerID() , 202950 , 1 )

		SetSpeakDetail ( OwnerID(), GetString ("SC_111454_5")   ) 
	else
		SetSpeakDetail ( OwnerID(), GetString ("SC_111454_4_20")   ) 
	end
end


function Discowood_Vocation_Talk_license_Lv25()
	local ItemID = {
			[3] = 202939	,
			[2] = 202940	,
			[1] = 202941
			}
	local Item = {
			[1] = 15	,
			[2] = 15	,
			[3] = 15
			}
	local Money = 20000
	local Count = 0
	local Vocation = { [0]=0, [1]=1, [2]=2, [3]=2, [4]=1, [5]=3, [6]=3,[7]=3,[8]=3 }
	local VocationLicense = {	202953	,	202954	,	202956	,	202952	,	202951	,	202955	,	206126  	,	206127}
	local job = ReadRoleValue(OwnerID() , EM_RoleValue_VOC_SUB )
	if job <= 0 then job = 0 end -- 零以下為不合法
	local i = Vocation[job]
	if i == 0 then
--		Say(OwnerID() , i )
		SetSpeakDetail ( OwnerID(), "[SC_111454_17]"  ) 
	else
		if	ReadRoleValue(OwnerID() , EM_RoleValue_Money) < Money then
			SetSpeakDetail ( OwnerID(), "[SC_111454_20]") 
			return
		end
		if 	CountBodyItem(OwnerID() , ItemID[i] ) >= Item[i] and
			ReadRoleValue(OwnerID() , EM_RoleValue_Money) >= Money then
			if	CountBodyItem(OwnerID() , VocationLicense[ReadRoleValue(OwnerID() , EM_RoleValue_VOC_SUB )] )>0	then
				SetSpeakDetail ( OwnerID(), GetString ("SC_111454_21")   ) 
				return
			end
			DelBodyItem(OwnerID() , ItemID[i] , Item[i] )
			AddRoleValue( OwnerID() , EM_RoleValue_Money , -1*Money )
			GiveBodyItem(OwnerID() , VocationLicense[ReadRoleValue(OwnerID() , EM_RoleValue_VOC_SUB )] , 1 )

			SetSpeakDetail ( OwnerID(), GetString ("SC_111454_5")   ) 
		else
			SetSpeakDetail ( OwnerID(), "[SC_111454_23]"   ) 
		end
	end
end

function Discowood_Vocation_Talk_license_Lv30()
	local ItemID = {
			[1] = 201726	,
			[2] = 201764	,
			[3] = 201802
			}
	local Item = {
			[1] = 3	,
			[2] = 3	,
			[3] = 3
			}
	local Money = 28000
	local Count = 0
	for i=1 , table.getn(ItemID) do
		if CountBodyItem(OwnerID() , ItemID[i] ) >= Item[i] then
			Count = Count + 1
		end
	end
	if	Count <table.getn(ItemID)	then
		SetSpeakDetail(OwnerID(),"[SC_111454_23]")
		return
	end
	if ReadRoleValue(OwnerID() , EM_RoleValue_Money) >= Money then
		Count = Count + 1
	else
		SetSpeakDetail ( OwnerID(), "[SC_111454_20]") 
		return
	end

	if Count == table.getn(ItemID)+1 then
		for i =1 , table.getn(ItemID) do
			DelBodyItem(OwnerID() , ItemID[i] , Item[i] )
		end
		AddRoleValue( OwnerID() , EM_RoleValue_Money , -1*Money )
		GiveBodyItem(OwnerID() , 202957 , 1 )

		SetSpeakDetail ( OwnerID(), GetString ("SC_111454_5")   ) 
	else
		SetSpeakDetail ( OwnerID(), GetString ("SC_111454_4_30")   ) 
	end
end


function Discowood_Vocation_Talk_license_Lv35()
	local ItemID = {
			[1] = 202942	,
			[2] = 202943	,
			[3] = 202944
			}
	local Item = {
			[1] = 15	,
			[2] = 15	,
			[3] = 15
			}
	local Money = 35000
	local Count = 0
	local Vocation = { [0]=0, [1]=3, [2]=2, [3]=2, [4]=3, [5]=1, [6]=1,[7]=1,[8]=1 }
	local VocationLicense =  {	202959	,	202963	,	202962	,	202961	,	202958 	,	202960	,	206433	,	206434	}
	local job = ReadRoleValue(OwnerID() , EM_RoleValue_VOC_SUB )
	if job <= 0 then job = 0 end -- 零以下為不合法
	local i = Vocation[job]


	if i == 0 then
		SetSpeakDetail ( OwnerID(), "[SC_111454_17]"  ) 
	else
		if	ReadRoleValue(OwnerID() , EM_RoleValue_Money) < Money then
			SetSpeakDetail ( OwnerID(), "[SC_111454_20]") 
			return
		end
		if 	CountBodyItem(OwnerID() , ItemID[i] ) >= Item[i] and
			ReadRoleValue(OwnerID() , EM_RoleValue_Money) >= Money then
			if	CountBodyItem(OwnerID() , VocationLicense[ReadRoleValue(OwnerID() , EM_RoleValue_VOC_SUB )] )>0	then
				SetSpeakDetail ( OwnerID(), GetString ("SC_111454_21")   ) 
				return
			end
			DelBodyItem(OwnerID() , ItemID[i] , Item[i] )
			AddRoleValue( OwnerID() , EM_RoleValue_Money , -1*Money )
			GiveBodyItem(OwnerID() , VocationLicense[ReadRoleValue(OwnerID() , EM_RoleValue_VOC_SUB )] , 1 )

			SetSpeakDetail ( OwnerID(), GetString ("SC_111454_5")   ) 
		else
			SetSpeakDetail ( OwnerID(), "[SC_111454_23]"   ) 			
		end
	end

end


function Discowood_Vocation_Talk_license_Lv40()
	local ItemID = {
			[1] = 202945	,
			[2] = 202946
			}
	local Item = {
			[1] = 10	,
			[2] = 10
			}
	local Money = 42000
	local Count = 0
	for i=1 , table.getn(ItemID) do
		if CountBodyItem(OwnerID() , ItemID[i] ) >= Item[i] then
			Count = Count + 1
		end
	end
	if	Count <table.getn(ItemID)	then
		SetSpeakDetail(OwnerID(),"[SC_111454_23]")
		return
	end
	if ReadRoleValue(OwnerID() , EM_RoleValue_Money) >= Money then
		Count = Count + 1
	else
		SetSpeakDetail ( OwnerID(), "[SC_111454_20]") 
		return
	end

	if Count == table.getn(ItemID)+1 then
		for i =1 , table.getn(ItemID) do
			DelBodyItem(OwnerID() , ItemID[i] , Item[i] )
		end
		AddRoleValue( OwnerID() , EM_RoleValue_Money , -1*Money )
		GiveBodyItem(OwnerID() , 202964 , 1 )

		SetSpeakDetail ( OwnerID(), GetString ("SC_111454_5")   ) 
	else
		SetSpeakDetail ( OwnerID(), GetString ("SC_111454_4_40")   ) 
	end
end


function Discowood_Vocation_Talk_license_Lv45()
	local ItemID = {
			[1] = 202947
			}
	local Item = {
			[1] = 20
			}
	local Money = 58000
	local Count = 0
	for i=1 , table.getn(ItemID) do
		if CountBodyItem(OwnerID() , ItemID[i] ) >= Item[i] then
			Count = Count + 1
		end
	end
	if	Count <table.getn(ItemID)	then
		SetSpeakDetail(OwnerID(),"[SC_111454_23]")
		return
	end
	if ReadRoleValue(OwnerID() , EM_RoleValue_Money) >= Money then
		Count = Count + 1
	else
		SetSpeakDetail ( OwnerID(), "[SC_111454_20]") 
		return
	end

	if Count == table.getn(ItemID)+1 then
		for i =1 , table.getn(ItemID) do
			DelBodyItem(OwnerID() , ItemID[i] , Item[i] )
		end
		AddRoleValue( OwnerID() , EM_RoleValue_Money , -1*Money )
		GiveBodyItem(OwnerID() , 202965 , 1 )

		SetSpeakDetail ( OwnerID(), GetString ("SC_111454_5")   ) 
	else
		SetSpeakDetail ( OwnerID(), GetString ("SC_111454_4_45")   ) 
	end
end


function Discowood_Vocation_Talk_license_Lv50()
	local ItemID = {
			[1] = 202948
			}
	local Item = {
			[1] = 20
			}
	local Money = 100000
	local Count = 0
	for i=1 , table.getn(ItemID) do
		if CountBodyItem(OwnerID() , ItemID[i] ) >= Item[i] then
			Count = Count + 1
		end
	end
	if ReadRoleValue(OwnerID() , EM_RoleValue_Money) >= Money then
		Count = Count + 1
	else
		SetSpeakDetail ( OwnerID(), "[SC_111454_20]") 
		return
	end

	if Count == table.getn(ItemID)+1 then
		for i =1 , table.getn(ItemID) do
			DelBodyItem(OwnerID() , ItemID[i] , Item[i] )
		end
		AddRoleValue( OwnerID() , EM_RoleValue_Money , -1*Money )
		GiveBodyItem(OwnerID() , 202966 , 1 )

		SetSpeakDetail ( OwnerID(), GetString ("SC_111454_5")   ) 
	else
		SetSpeakDetail ( OwnerID(), GetString ("SC_111454_4_50")   ) 
	end
end