function LuaI_110989_1()
	local Name = GetName( OwnerID() ) 
	local String = "[SAY_110989_0][$SETVAR1="..Name.."]"--成功的將礦產運送回來！
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
	if CheckBuff( OwnerID() ,501603 ) == true or CheckBuff( OwnerID() ,502168 ) == true  or  CheckBuff( OwnerID() ,502169 ) == true  or  CheckBuff( OwnerID() ,502170 ) == true  or  CheckBuff( OwnerID() ,502171 ) == true  or  CheckBuff( OwnerID() ,502172 ) == true  or  CheckBuff( OwnerID() ,502173 ) == ture then
		if  GetSystime( 1 ) == 12 or GetSystime( 1 ) == 20 then  --時間內完成給獎賞 
			if CheckBuff( OwnerID() ,501603 ) == true then 
				AddRoleValue( OwnerID() , EM_RoleValue_Money , 6000 ) 
				if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
					RunningMsg( OwnerID() , 2 , String )
				end
				CancelBuff( OwnerID() , 501603 ) --取消BUFF
			elseif CheckBuff( OwnerID() ,502168 ) == true  then  --時間內完成給獎賞 then
				AddRoleValue( OwnerID() , EM_RoleValue_Money , 7200 ) 
				if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
					RunningMsg( OwnerID() , 2 , String )
				end
				CancelBuff( OwnerID() , 502168 ) --取消BUFF
			elseif CheckBuff( OwnerID() ,502169 ) == true then  --時間內完成給獎賞 then
				AddRoleValue( OwnerID() , EM_RoleValue_Money , 10500 ) 
				if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
					RunningMsg( OwnerID() , 2 , String )
				end
				CancelBuff( OwnerID() , 502169 ) --取消BUFF
			elseif CheckBuff( OwnerID() ,502170 ) == true then  --時間內完成給獎賞 then
				AddRoleValue( OwnerID() , EM_RoleValue_Money , 14400 ) 
				if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
					RunningMsg( OwnerID() , 2 , String )
				end
				CancelBuff( OwnerID() , 502170 ) --取消BUFF
			elseif CheckBuff( OwnerID() ,502171 ) == true then  --時間內完成給獎賞 then
				AddRoleValue( OwnerID() , EM_RoleValue_Money , 17100 ) 
				if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
					RunningMsg( OwnerID() , 2 , String )
				end
				CancelBuff( OwnerID() , 502171 ) --取消BUFF
			elseif CheckBuff( OwnerID() ,502172 ) == true then  --時間內完成給獎賞 then
				AddRoleValue( OwnerID() , EM_RoleValue_Money , 20000) 
				if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
					RunningMsg( OwnerID() , 2 , String )
				end
				CancelBuff( OwnerID() , 502172 ) --取消BUFF
			elseif CheckBuff( OwnerID() ,502173 ) == true then  --時間內完成給獎賞 then
				AddRoleValue( OwnerID() , EM_RoleValue_Money , 20000 ) 
				if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
					RunningMsg( OwnerID() , 2 , String )
				end
				CancelBuff( OwnerID() , 502173 ) --取消BUFF
			end
		else --超過時間回來的訊息
		CancelBuff( OwnerID() , 501603 ) --取消BUFF
		CancelBuff( OwnerID() , 502168 ) --取消BUFF
		CancelBuff( OwnerID() , 502169 ) --取消BUFF
		CancelBuff( OwnerID() , 502170 ) --取消BUFF
		CancelBuff( OwnerID() , 502171 ) --取消BUFF
		CancelBuff( OwnerID() , 502172 ) --取消BUFF
		CancelBuff( OwnerID() , 502173 ) --取消BUFF
		ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SAY_110989_1"), 0 ); --水晶在接近此地時突然化為灰塵四散，看來你沒能在時間內抵達。
		end
	end
end