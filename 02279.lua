function Ks_ShortestPath()--物件找最短路徑範例

	--if ObjMovePath == nil then
	-----------------------------------------全域宣告--------------------------------------------
	local ObjMovePath = {} --紀錄NPC路徑
	local FlagSite = {}--旗標座標
	local FlagID = 780657--旗標ID
	for i=1, GetMoveFlagCount( FlagID ) do--取得所有旗標位置
		FlagSite[i] = { }
		FlagSite[i]["X"] = GetMoveFlagValue( FlagID, i, EM_RoleValue_X )
		FlagSite[i]["Y"] = GetMoveFlagValue( FlagID, i, EM_RoleValue_Y )
		FlagSite[i]["Z"] = GetMoveFlagValue( FlagID, i, EM_RoleValue_Z )
	end
	-----------------------------------------------------------------------------------------------	
	--end
	
	local OID = OwnerID()
	MoveToFlagEnabled( OID, false )
	local Num = table.getn(FlagSite )-1
	local Path = {}
	local X = ReadRoleValue( OID, EM_RoleValue_X )
	local Y = ReadRoleValue( OID, EM_RoleValue_Y )
	local Z = ReadRoleValue( OID, EM_RoleValue_Z )
			
	for i =1, Num do--取得所有距離
		Path[i] = { }
		local DisX = ( FlagSite[i]["X"]- X )^2
		local DisZ = ( FlagSite[i]["Z"]- Z )^2 
		Path[i]["Flag"] = i
		Path[i]["Dis"] = math.floor(( DisX+ DisZ)^0.5)				
		Path[i]["X"] = FlagSite[i]["X"]
		Path[i]["Y"] = FlagSite[i]["Y"]
		Path[i]["Z"] = FlagSite[i]["Z"]	
	end
			
	local temp = {}		
	for i=1, Num do--SWAP 最小距離在前面
		for j=i+1, Num do
			if Path[i]["Dis"] > Path[j]["Dis"] then
				temp["Flag"] = path[i]["Flag"]
				temp["Dis"] = path[i]["Dis"]
				temp["X"] = path[i]["X"]
				temp["Y"] = path[i]["Y"]
				temp["Z"] = path[i]["Z"]
				
				path[i]["Flag"] = path[j]["Flag"]
				path[i]["Dis"] = path[j]["Dis"]
				path[i]["X"] = path[j]["X"]
				path[i]["Y"] = path[j]["Y"]
				path[i]["Z"] = path[j]["Z"]
				
				path[j]["Flag"] = temp["Flag"]
				path[j]["Dis"] = temp["Dis"]
				path[j]["X"] = temp["X"]
				path[j]["Y"] = temp["Y"]
				path[j]["Z"] = temp["Z"]
			end
		end
	end
	
	if ObjMovePath[OID] == nil then
		ObjMovePath[OID] = {}
		while true do
		for i =1, Num do
			local DisX1 = ( FlagSite[1]["X"]- X )^2
			local DisZ1 = ( FlagSite[1]["Z"]- Z )^2 
			local Dis1 = math.floor(( DisX1+ DisZ1)^0.5)--移動者與距離終點

			local DisX2 = ( FlagSite[1]["X"]- path[i]["X"] )^2
			local DisZ2 = ( FlagSite[1]["Z"]- path[i]["Z"] )^2
			local Dis2 = math.floor(( DisX2+ DisZ2)^0.5)--旗標與終點距離
			
			if CheckLine( OID, path[i]["X"], path[i]["Y"], path[i]["Z"] ) == true and Dis1 > Dis2 then--記錄路徑
				table.insert( ObjMovePath[OID], path[i]["Flag"] )
				DebugMsg(0,0,"Find = "..path[i]["Flag"])
				break
			else
				DebugMsg(0,0,"Run Error = "..path[i]["Flag"])
			end
		end
			if ObjMovePath[OID][table.getn(ObjMovePath[OID])] == 1 then
				DebugMsg(0,0,"While break")
				break
			end
			sleep(10)
		end
	end
	
	local Array = ObjMovePath[OID]
	for Site in pairs( Array ) do
		DebugMsg(0,0,"MoveToFlag = "..Array[Site])
		Hide(OID)
		WriteRoleValue( OID, EM_RoleValue_IsWalk, 1 )
		Show(OID, 0 )
		MoveDirect( OID, FlagSite[Array[Site]]["X"], FlagSite[Array[Site]]["Y"], FlagSite[Array[Site]]["Z"] )
		while true do
			X = ReadRoleValue( OID, EM_RoleValue_X )
			Y = ReadRoleValue( OID, EM_RoleValue_Y )
			Z = ReadRoleValue( OID, EM_RoleValue_Z )
		
			local DisX = ( FlagSite[Array[Site]]["X"]- X )^2
			local DisZ = ( FlagSite[Array[Site]]["Z"]- Z )^2 
			if math.floor(( DisX+ DisZ )^0.5) < 20 then
				break
			end
			sleep(10)
		end
	end
end