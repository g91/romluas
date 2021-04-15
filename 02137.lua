--==================================
--			測試指令 自訂函式
--==================================
function BGAA_BetaCode_Go(PosNum)
--	旗標 781187 的	1、2是用來產生兩邊隊伍的開場阻擋門
--			3、4、5、6是用來產生據點
--			0  是旗子位置
--			21 22 23 24 25 26 是用來產生野怪
--			31 32是用來產生3號據點的守護怪物
--			41 42是用來產生4號據點的守護怪物
	local Player = OwnerID()
	local x,y,z,dir = DW_Location(781187,PosNum)
--DW_NewLocation(Angle,Dis,x,y,z,Dir)	
	SetPos( Player, x, y, z, dir )
	ScriptMessage( Player, Player, 0, "You can choose where you want go to :", 0 )
	ScriptMessage( Player, Player, 0, "0 --> Mid Flag", 0 )
	ScriptMessage( Player, Player, 0, "1 , 2 --> Team Base ", 0 )
	ScriptMessage( Player, Player, 0, "3 , 4 --> Base Crystal", 0 )
	ScriptMessage( Player, Player, 0, "5 , 6 --> Treasure Box", 0 )
	ScriptMessage( Player, Player, 0, "21~26 --> Creep camp", 0 )
end

function BGAA_BetaCode_Score(Num)	--直接加減戰場分數
	local Player = OwnerID()
	local RoomID = ReadRoleValue( Player, EM_RoleValue_RoomID )
	local TeamID = GetTeamID(Player)
	local Score = GetScore( RoomID, TeamID )
	SetScore( RoomID, TeamID, Score+Num )
end

function GetTeamMemberList( RoomID, TeamID )	--取特定隊伍的所有成員資料 , TeamID=-1傳回所有人資料
	local AllPlayer = SetSearchAllPlayer( RoomID )
	local TeamMemberList = {}

	if TeamID == -1 then
		for i = 0, AllPlayer do
			local PlayerID = GetSearchResult()
			table.insert(TeamMemberList, PlayerID)
		end
	else
		for i = 0, AllPlayer do
			local PlayerID = GetSearchResult()
			if GetTeamID( PlayerID ) == TeamID then
				table.insert(TeamMemberList, PlayerID)
			end
		end
	end

	return TeamMemberList
end
--==================================
--			戰場裝備包
--==================================
function Z448_bag_A()	--SilverWing
	local clothes = {213836,230822,230823,230824,230825,230826,230827,230828,230829,230830,230831,230832,230833,230834}
	for giveitem=1,table.getn(clothes) do
		GiveBodyItemEx( TargetID() , clothes[giveitem] ,  1 , 1 , 0 ,0 ,0 , 0 , 0 )
	end
end


function Z448_bag_B()	--LionKing
	local clothes = {213837,230809,230810,230811,230812,230813,230814,230815,230816,230817,230818,230819,230820,230821}
	for giveitem=1,table.getn(clothes) do
		GiveBodyItemEx( TargetID() , clothes[giveitem] ,  1 , 1 , 0 ,0 ,0 , 0 , 0 )
	end
end