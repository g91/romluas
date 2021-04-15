function LuaN_mika_09summerlove_cast() --掛童話節廣播員 物件產生劇情 隱藏物件
	while true do
		local hour = GetSystime(1)
		local min = GetSystime(2)
		Sleep(300)
		local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域		
		if ZoneID <= 1000 then
			if  min == 0 then  -- 整點
			RunningMsg( OwnerID() , 2 , "[SC_0908SEANSON_CAST]" )
			--「童話節活動開始囉！在凡瑞娜絲城城下西區出現了愛搗亂的小惡魔，你要選擇幫他惡作劇，還是選擇協助西區的小天使恢復平靜呢？
			end
		end
	end
end