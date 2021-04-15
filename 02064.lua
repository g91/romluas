function sasa_clear_monster()											-------------使用之後在開始找尋怪物檢查旗標
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )		-------------讀出現在的room 
	local dbid=0                                                      	-------------設定一個變數他代表的是這個物件資料庫id 
	local dbcl=0     												  	-------------讀取這個物件資料欄位程式所記錄的一個值
	if RoomID == 0 then 
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_CANTHOME]" , 1 )
	elseif RoomID ~= 0 then 
		local npcm=SetSearchAllNPC(RoomID)----------------------取出數量  -------------找尋這個room所有npc物件放在一個table裡，然後npcm代表這個資料裡面有多少個npc 
		for i=1 , npcm, 1 do 											  -------------有多少物件就做多少次
		local npcde = GetSearchResult()									  -------------逐一取每個npc編號	
		dbid=ReadRoleValue( npcde,EM_RoleValue_OrgID )                    -------------dbid讀取物件的資料庫ID
		dbcl=GameObjInfo_Int(dbid,"NpcMode")                              -------------dbcl這個物件的npcmode的旗標代碼
			if CheckBit( dbcl, 21 ) == true then                          -------------讀出來的代碼CheckBit去檢查他的位置 從上面算下來從0開始第21剛好是小怪除怪卷的旗標檢查他是否有勾起來
				DelObj(npcde)                                             -------------true代表勾起來刪掉這個物件
			elseif CheckBit( dbcl, 21 ) == false then                     -------------flase代表沒勾起來不刪物件
				
			end
		end
	end
end
function sasa_clear_monster_208220() 									-------------填在檢查的部分先確定他能不能使用 
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )   	-------------讀出現在的room 
	if RoomID == 0 then 
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_CANTHOME]" , 1 )
		return false
	elseif RoomID ~= 0 then 	
		---卡沃克(簡),格拉夫(簡),薩爾多堡(簡),七英雄(簡),永恆(簡),庫勒奇(簡),封蝕城(簡),布托曼(簡)
		local Zone={ 135,138,140,143,145,148,150,153 }					-----------判斷的副本zone (6人簡易)
		local ID=table.getn(Zone)										-----------對於這個zone的table 讀取他的數量
		for i=1 , ID , 1 do												-----------逐一取出這個陣列裡面的值
			if ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID) == Zone[i] then-----判斷每個取出來的zone 值
				return true                                             -----------要是有一個相等就代表可以使用這個物品
			end
		end
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_CANTHOME]" , 1 )-----------全部檢查都不是就跟他說你不能使用歐~
		return false													-----------回報說不能使用
	end
end
function sasa_clear_monster_208221()									-----------填在檢查的部分先確定他能不能使用
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )  	-----------讀出現在的room 
	if RoomID == 0 then 
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_CANTHOME]" , 1 )
		return false
	elseif RoomID ~= 0 then 	
		---卡沃克之墓,格拉夫古堡,薩爾多堡,七英雄,永恆法陣,庫勒奇,封蝕城,布托曼
		local Zone={ 134,137,139,142,144,147,149,151 }					-----------判斷的副本的zone (普通6人+12人簡易)
		local ID=table.getn(Zone)										-----------對於這個zone的table 讀取他的數量
		for i=1 , ID , 1 do												-----------逐一取出這個陣列裡面的值
			if ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID) == Zone[i] then-----判斷每個取出來的zone 值
				return true                                             -----------要是有一個相等就代表可以使用這個物品
			end
		end	
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_CANTHOME]" , 1 )-----------全部檢查都不是就跟他說你不能使用歐~
		return false                                                    -----------回報說不能使用
	end
end
function sasa_clear_monster_208222()									------------填在檢查的部分先確定他能不能使用
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )   	------------讀出現在的room .
	if RoomID == 0 then 
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_CANTHOME]" , 1 )
		return false
	elseif RoomID ~= 0 then 	
		---格拉夫古堡(困),七英雄(困),庫勒奇(困),布托曼(困)
		local Zone={ 136,141,146,152 }									------------判斷的副本的zone (困難+12人普通)
		local ID=table.getn(Zone)										------------對於這個zone的table 讀取他的數量
		for i=1 , ID , 1 do												------------逐一取出這個陣列裡面的值
			if ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID) == Zone[i] then------判斷每個取出來的zone 值
				return true                                             ------------要是有一個相等就代表可以使用這個物品
			end
		end	
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_CANTHOME]" , 1 )------------全部檢查都不是就跟他說你不能使用歐~
		return false                                                    ------------回報說不能使用
	end
end