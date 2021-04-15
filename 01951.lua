function bk_clear_sm_monster()   ----------------使用之後在開始找尋怪物檢查旗標
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )   -------------讀出現在的room 
	local dbid=0                                                      -------------設定一個變數他代表的是這個物件資料庫id 
	local dbcl=0     												  -------------讀取這個物件資料欄位程式所記錄的一個值
	if RoomID == 0 then 
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_CANTHOME]" , 1 )
	elseif RoomID ~= 0 then 
		local npcm=SetSearchAllNPC(RoomID)----------------------取出數量  -------------找尋這個room 所有npc物件放在一個table 裡面然後npcm 代表這個資料裡面有多少個npc 
		for i=1 , npcm, 1 do 											  -------------有多少物件就做多少次
		local npcde = GetSearchResult()									  -------------逐一取每個npc編號	
		dbid=ReadRoleValue( npcde,EM_RoleValue_OrgID )                    -------------dcid讀取物件的資料庫ID
		dbcl=GameObjInfo_Int(dbid,"NpcMode")                              -------------abcl這個物件的npcmode的旗標代碼
			if CheckBit( dbcl, 21 ) == true then                          -------------讀出來的代碼CheckBit去檢查他的位置 從上面算下來從0開始第21剛好是小怪除怪卷的旗標檢查他是否有勾起來
				DelObj(npcde)                                             -------------true代表勾起來刪掉這個物件
			elseif CheckBit( dbcl, 21 ) == false then                     -------------flase代表沒勾起來不刪物件
				
			end
		end
	end
end
function bk_clear_sm0_207928() ---------------填在檢查的部分先確定他能不能使用 
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )   -------------讀出現在的room 
	if RoomID == 0 then 
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_CANTHOME]" , 1 )
		return false
	elseif RoomID ~= 0 then 	
		---251,250,102,113,103,104,106,252,114,107,108,126,128,132
		local Zone={251,250,102,113,103,104,106,252,114,107,108,126,128,132}----------判斷的副本的zone (6人簡易)
		local ID=table.getn(Zone)-----------對於這個zone的table 讀取他的數量
		for i=1 , ID , 1 do  -------------逐一取出這個陣列裡面的值
			if ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID) == Zone[i] then----------------------------判斷每個取出來的zone 值
				return true                                                   --------要是有一個相等就代表可以使用這個物品
			end
		end	
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_CANTHOME]" , 1 )	-----------------------------全部檢查都不是就跟他說你不能使用歐~
		return false  
	end-----------------------------回報說不能使用
end
function bk_clear_sm1_207928() ---------------填在檢查的部分先確定他能不能使用
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )   -------------讀出現在的room 
	if RoomID == 0 then 
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_CANTHOME]" , 1 )
		return false
	elseif RoomID ~= 0 then 	
	---115,116,118,123,125,124,127,130
		local Zone={115,116,118,123,127,130}----------判斷的副本的zone (普通+12人簡易)
		local ID=table.getn(Zone)-----------對於這個zone的table 讀取他的數量
		for i=1 , ID , 1 do  -------------逐一取出這個陣列裡面的值
			if ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID) == Zone[i] then----------------------------判斷每個取出來的zone 值
				return true                                                   --------要是有一個相等就代表可以使用這個物品
			end
		end	
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_CANTHOME]" , 1 )	-----------------------------全部檢查都不是就跟他說你不能使用歐~
		return false                                                        -----------------------------回報說不能使用
	end
end
function bk_clear_sm2_207928() ---------------填在檢查的部分先確定他能不能使用
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )   -------------讀出現在的room .
	if RoomID == 0 then 
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_CANTHOME]" , 1 )
		return false
	elseif RoomID ~= 0 then 	
		---117,119,120,122
		local Zone={117,119,120,122}----------判斷的副本的zone (困難)
		local ID=table.getn(Zone)-----------對於這個zone的table 讀取他的數量
		for i=1 , ID , 1 do  -------------逐一取出這個陣列裡面的值
			if ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID) == Zone[i] then----------------------------判斷每個取出來的zone 值
				return true                                                   --------要是有一個相等就代表可以使用這個物品
			end
		end	
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_CANTHOME]" , 1 )	-----------------------------全部檢查都不是就跟他說你不能使用歐~
		return false                                                        -----------------------------回報說不能使用
	end
end