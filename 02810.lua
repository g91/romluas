function Q425840_Test()
	local ply = OwnerID()
	local tar = TargetID()
	local QID = 425840
	
-- EM_RoleValue_Register	紀錄 是否開始任務
-- EM_RoleValue_Register1	紀錄 BUFF的DBID
-- EM_RoleValue_Register10	紀錄 任務中BUFF層數

	LoadQuestOption( ply )
	
	if CheckAcceptQuest( ply, QID ) == false then
		WriteRoleValue( ply, EM_RoleValue_Register, 0)	
		WriteRoleValue( ply, EM_RoleValue_Register10, 0)
	end
		
	if CheckAcceptQuest( ply, QID ) == true then
	
		if ReadRoleValue( ply, EM_RoleValue_Register10 ) ~= 0 then
			AddSpeakOption( ply, tar, "[Z953_Q4_RE]", "Q425840_refreshBuff()", 0)	--debug 用
		end
		
		if ReadRoleValue( ply, EM_RoleValue_Register ) == 0 then
			AddSpeakOption( ply, tar, "[Z953_Q4]", "Q425840_initQuestEvent()", 0)	--僅執行一次
		end
	end
end

function Q425840_initQuestEvent()
	Say( OwnerID(), "Yes, i get quest" )
	
	WriteRoleValue( OwnerID(), EM_RoleValue_Register, 1 )	-- 設定 開始任務 旗標	
	WriteRoleValue( OwnerID(), EM_RoleValue_Register10, 1 )	--- buff 已給予旗標
	
	Q425840_addBuff()
	Q425840_CreateByFlag()
	
	CloseSpeak( OwnerID() )
end

function Q425840_refreshBuff()
	Q425840_cancelBuff( OwnerID() )
	Q425840_addBuff()
	
	CloseSpeak( OwnerID() )
end

function Q425840_addBuff()
	local buffTable = { 623924, 623926, 623927, 623928 } --風,火,水,地	
	local preBuffID = ReadRoleValue( OwnerID(), EM_RoleValue_Register1 )

	for i = 1 , 4 do
		if (buffTable[i] ==  preBuffID) then	
			table.remove( buffTable, i)
		end	
	end
	
	local len = table.getn(buffTable)	
	local newBuffID = buffTable[ (rand(len)+1) ]
		
	AddBuff( OwnerID(), newBuffID, 0, 10 )		
	WriteRoleValue( OwnerID(), EM_RoleValue_Register1, newBuffID )
end

function Q425840_addBuffCount()
	local nowBuffStep = ReadRoleValue( OwnerID(), EM_RoleValue_Register10 )	

--	Say( OwnerID(), "startStep:"..ReadRoleValue( OwnerID(), EM_RoleValue_Register10 ) )
	WriteRoleValue( OwnerID(), EM_RoleValue_Register10, (nowBuffStep+1) )	
	Say( OwnerID(), "buffStep:"..ReadRoleValue( OwnerID(), EM_RoleValue_Register10 ) )
end

function Q425840_cancelBuff( ply )
	local buffTable = { 623924, 623926, 623927, 623928 } --風,火,水,地

	local cancelName = ReadRoleValue( ply, EM_RoleValue_Register1 )	
	CancelBuff( ply,  cancelName ) 		
end

function Q425840_CreateByFlag()
	local Center = TargetID()
	local FlagID = 781255
	local monoID = 121725	

	local x,y,z,dir=DW_Location(Center)
	local RoomID = ReadRoleValue(Center, EM_RoleValue_RoomID)
	local CenPID = ReadRoleValue(Center, EM_RoleValue_PID)
	local monoArr = {0,0,0,0}
	local len = table.getn(monoArr)
	
--	Say(Center, "myID:"..Center)
--	Say(Center, "RoomID:"..RoomID)
--	Say(Center, "CenPID:"..CenPID)

	for i = 1, len do
		monoArr[i] = CreateObjByFlag( monoID, FlagID , (i-1) , 1 )		-- obj DBID, flag DBID, flag PID, amount	
		AddToPartition( monoArr[i], RoomID )
--		Say(Center, "mono:"..monoArr[i])			
	end	
	

	local buffTable = { 623924, 623926, 623927, 623928 } --風,火,水,地
	local checkFunTable = {	"Q425840_checkWind",
				"Q425840_checkFire",
				"Q425840_checkWater",
				"Q425840_checkEarth"}
	local regTable = {	EM_RoleValue_Register1,
				EM_RoleValue_Register2,
				EM_RoleValue_Register3,
				EM_RoleValue_Register4}

 --		SetPlot( monoArr[ 1],  "collision", checkFunTable[ 1 ], 100)	--加入checkFun給祭壇
 --		SetPlot( monoArr[ 2 ],  "collision", checkFunTable[2], 100)	--加入checkFun給祭壇
 --		SetPlot( monoArr[ 3 ],  "collision", checkFunTable[ 3 ], 100)	--加入checkFun給祭壇
 --		SetPlot( monoArr[ 4 ],  "collision", checkFunTable[ 4 ], 100)	--加入checkFun給祭壇
 --		
 --		AddBuff( monoArr[ 1 ], buffTable[ 1 ], 0, 1800 )			--加入特效給祭壇
 --		AddBuff( monoArr[ 2 ], buffTable[ 2 ], 0, 1800 )			--加入特效給祭壇		
 --		AddBuff( monoArr[ 3], buffTable[ 3 ], 0, 1800 )			--加入特效給祭壇		
 --		AddBuff( monoArr[ 4 ], buffTable[ 4 ], 0, 1800 )			--加入特效給祭壇


								
   	while ( len ~= 0 ) do
 		local ranIdx = math.random( 1, len)
 			
 		SetPlot( monoArr[ len ],  "collision", checkFunTable[ ranIdx ], 60 )	--加入checkFun給祭壇
 		AddBuff( monoArr[ len ], buffTable[ ranIdx ], 0, 1800 )			--加入特效給祭壇
  
 		WriteRoleValue ( Center , regTable[ len ],  monoArr[ len ] ) 
 
 		table.remove( checkFunTable, ranIdx )
 		table.remove( buffTable, ranIdx )
   		len = len - 1   			
   	end	 



		
			
	WriteRoleValue ( Center , EM_RoleValue_Register9,  OwnerID()) 
--	Say(Center, "PlyID:"..OwnerID() )
--	Say(Center, "PlyID:"..ReadRoleValue( Center , EM_RoleValue_Register9 ) )
	
			
--	Say(Center, "reg1:"..ReadRoleValue( Center, EM_RoleValue_Register1) )
--	Say(Center, "reg2:"..ReadRoleValue( Center, EM_RoleValue_Register2) )
--	Say(Center, "reg3:"..ReadRoleValue( Center, EM_RoleValue_Register3) )
--	Say(Center, "reg4:"..ReadRoleValue( Center, EM_RoleValue_Register4) )								
end


function Q425840_checkWind()
	if CheckBuff( OwnerID(),  623924 ) == true then
		Q425840_cancelBuff( OwnerID() )
		Q425840_addBuff()
		Q425840_addBuffCount()
	end
end
function Q425840_checkFire()
	if CheckBuff( OwnerID(),  623926 ) == true then
		Q425840_cancelBuff( OwnerID() )
		Q425840_addBuff()
		Q425840_addBuffCount()
	end
end
function Q425840_checkWater()
	if CheckBuff( OwnerID(),  623927 ) == true then
		Q425840_cancelBuff( OwnerID() )
		Q425840_addBuff()
		Q425840_addBuffCount()
	end
end
function Q425840_checkEarth()
	if CheckBuff( OwnerID(),  623928 ) == true then
		Q425840_cancelBuff( OwnerID() )
		Q425840_addBuff()
		Q425840_addBuffCount()
	end
end
---

function Q425840_DelObj()
	local Center = OwnerID()
	
	DelObj( ReadRoleValue( Center, EM_RoleValue_Register1) )	
	DelObj( ReadRoleValue( Center, EM_RoleValue_Register2) )
	DelObj( ReadRoleValue( Center, EM_RoleValue_Register3) )
	DelObj( ReadRoleValue( Center, EM_RoleValue_Register4) )
	
	Q425840_cancelBuff( ReadRoleValue( Center , EM_RoleValue_Register9 ) )	
end