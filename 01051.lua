
function OrgID_SpellStart()
	local OrgID = ReadRoleValue(OwnerID(), EM_RoleValue_OrgID)
	local MonsterAI = "MonsterAI_"..OrgID
	BeginPlot(OwnerID() , MonsterAI , 0 )
end


function Discowood_OrgID_SpellCheck()
	if CheckBuff(OwnerID() , 502708) then
		return false
	else
		return true
	end
end

function MonsterAI_101357()
	AddBuff( OwnerID() , 502708 , 1 , -1)
	while true do
		if ReadRoleValue(OwnerID(),EM_RoleValue_IsAttackMode) == 1 then
			if MonsterAI_101357_1() == true then
				AddBuff( OwnerID() ,500977,3,25)
			end			
		else
			CancelBuff( OwnerID(), 502708 )
			return
		end
		sleep(10)
	end
end

function MonsterAI_101357_1()
	local BuffTable = {[0] = 0 , [1] = 4 , [2] = 6 , [3]= 7 ,[4] = 17 , [5] = 37 , [6] = 43  ,[7] = 44 , [8] = 45}
	local Buff = BuffCount ( OwnerID())
	local Mode = 0
	local BuffID = {}
	if Buff>0 then
		for i = 0 , Buff , 1 do
			table.insert( BuffID, BuffInfo( OwnerID() , i-1, EM_BuffInfoType_BuffID) );
		end
		for j,v in ipairs(BuffID) do
			for k,n in ipairs(BuffTable) do
				if GameObjInfo_int ( v , "AssistType" ) == n then
					CancelBuff( OwnerID() , v )
					Mode = 1
				end
			end
		end
	end
	if Mode == 1 then
		return true
	else
		return false
	end
end
