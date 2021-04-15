function Lua_GoblinGacha() -- 2014.08.21新增 哥布林閃爍轉蛋，50個勇者勳章換一顆轉蛋
	local RoleName = GetName( OwnerID() ) 	
	if Check_Bag_Space( OwnerID() , 1 ) == false then
		return false
	end
	local itemset = {	  1 ,""	, { 520643 ,1 } --
		        		, 2 ,""	, { 520623 , 1 } -- 
				, 27,""	, { 724941 , 2 } --III階符文
				,100, ""	, { 720529 , 1 }	}  --商城道具組
	BaseTressureProc7(   itemset , 1 );
	return true;

end


--6.1.1之後開始使用這個版本(台版斟酌提前版號推出)
function Lua_na_GoblinTitle0()
	local Owner = OwnerID()
	local Target = TargetID()
	local Title = {	530375 , 530376 , 530377 , 530988	}

	if CountBodyItem(Owner , Title[4] ) == 1 then
		SetSpeakDetail(Owner, "[SC_GOBLINTITLE005]" )--　	
		AddSpeakOption(Owner, Target, "[SC_GOBLINTITLE006]", "Lua_na_GoblinTitle_Check(15)", 0) --用15個<CM>[205037]</CM>換取哥布林閃爍轉蛋[205037]
	elseif CountBodyItem(Owner , Title[3] ) == 1 then
		SetSpeakDetail(Owner, "[SC_GOBLINTITLE004]" )--　
		AddSpeakOption(Owner, Target, "[SC_GOBLINTITLE006]", "Lua_na_GoblinTitle_Check(400)", 0) --用400個<CM>[205037]</CM>換取稱號<CP>「哥布林好朋友」</CP>
	elseif CountBodyItem(Owner , Title[2] ) == 1 then
		SetSpeakDetail(Owner, "[SC_GOBLINTITLE003]" )--　
		AddSpeakOption(Owner, Target, "[SC_GOBLINTITLE006]", "Lua_na_GoblinTitle_Check(250)", 0) --用250個<CM>[205037]</CM>換取稱號<CP>「綠色奇蹟」</CP>
	elseif CountBodyItem(Owner , Title[1] ) == 1 then
		SetSpeakDetail(Owner, "[SC_GOBLINTITLE002]" )--　
		AddSpeakOption(Owner, Target, "[SC_GOBLINTITLE006]", "Lua_na_GoblinTitle_Check(100)", 0) --用100個<CM>[205037]</CM>換取稱號<CP>「翻滾吧，哥布林！」</CP>
	else
		SetSpeakDetail(Owner, "[SC_GOBLINTITLE001]" )--　
		AddSpeakOption(Owner, Target, "[SC_GOBLINTITLE006]", "Lua_na_GoblinTitle_Check(10)", 0) --用10個<CM>[205037]</CM>換取稱號<CP>「哥布林勇士」</CP>		
	end
end


function Lua_na_GoblinTitle_Check(num)
	local Owner = OwnerID()
	local Item = 205037
	local Title = {	[10] = 530375 , 
			[100] = 530376 , 
			[250] = 530377 , 
			[400] = 530988 , 
			[15] = 205688	}
	if CountBodyItem( Owner, Item ) >= num then
		SetSpeakDetail(Owner, "[SC_GOBLINTITLE007]" )
		GiveBodyItem( Owner , Title[num], 1 )
		DelBodyItem( Owner , Item , num )
	else
		SetSpeakDetail(OwnerID(), "[SC_GOBLINTITLE07]" )--你沒有足夠的<CP>[205037]</CP>
	end
end