--測試用升級訊息 701782
Function lua_mika_petlvupevent() --寵物升級事件
	local Lv =     ReadRoleValue( OwnerID() , EM_RoleValue_LV  ) 
	local PlayerRace = ReadRoleValue( OwnerID() , EM_RoleValue_RACE )

	if Lv== 2 then
		if PlayerRace == 0 then
			Say( OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100054]][$SETVAR2=[100452]][$SETVAR3="..Lv.."]"  );
		elseif PlayerRace == 1 then
			Say( OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[101925]][$SETVAR2=[101924]][$SETVAR3="..Lv.."]"  );
		end
	elseif Lv == 3 then 
		if PlayerRace == 0 then
			Say( OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100054]][$SETVAR2=[100452]][$SETVAR3="..Lv.."]"  );
		elseif PlayerRace == 1 then
			Say( OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[101926]][$SETVAR2=[101924]][$SETVAR3="..Lv.."]"  );
		end
	elseif Lv == 4 then 
		if PlayerRace == 0 then
			Say( OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100056]][$SETVAR2=[100054]][$SETVAR3="..Lv.."]"  );
		elseif PlayerRace == 1 then
			Say( OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[101929]][$SETVAR2=[101926]][$SETVAR3="..Lv.."]"  );
		end
	elseif Lv == 5 then 
		if PlayerRace == 0 then
			Say( OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100056]][$SETVAR2=[100146]][$SETVAR3="..Lv.."]"  );
		elseif PlayerRace == 1 then
			Say( OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[101932]][$SETVAR2=[101933]][$SETVAR3="..Lv.."]"  );
		end
	elseif Lv == 6 then 
		if PlayerRace == 0 then
			Say( OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100156]][$SETVAR2=[100118]][$SETVAR3="..Lv.."]"  );
		elseif PlayerRace == 1 then
			Say( OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[101935]][$SETVAR2=[101936]][$SETVAR3="..Lv.."]"  );
		end
	elseif Lv == 7 then 
		if PlayerRace == 0 then
			Say( OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100156]][$SETVAR2=[100118]][$SETVAR3="..Lv.."]"  );
		elseif PlayerRace == 1 then
			Say( OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[101936]][$SETVAR2=[101938]][$SETVAR3="..Lv.."]"  );
		end
	elseif Lv == 8 then 
		if PlayerRace == 0 then
			Say( OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100061]][$SETVAR2=[100030]][$SETVAR3="..Lv.."]"  );
		elseif PlayerRace == 1 then
			Say( OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[101939]][$SETVAR2=[101937]][$SETVAR3="..Lv.."]"  );
		end
	elseif Lv == 9 then 
		if PlayerRace == 0 then
			Say( OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100152]][$SETVAR2=[100203]][$SETVAR3="..Lv.."]"  );
		elseif PlayerRace == 1 then
			Say( OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[101942]][$SETVAR2=[101943]][$SETVAR3="..Lv.."]"  );
		end
	elseif Lv == 10 then 
		if PlayerRace == 0 then
			Say( OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100055]][$SETVAR2=[100063]][$SETVAR3="..Lv.."]"  );
		elseif PlayerRace == 1 then
			Say( OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[101942]][$SETVAR2=[101943]][$SETVAR3="..Lv.."]"  );
		end
	elseif Lv == 11 then 
		if PlayerRace == 0 then
			Say( OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100132]][$SETVAR2=[100063]][$SETVAR3="..Lv.."]"  );
		elseif PlayerRace == 1 then
			Say( OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100132]][$SETVAR2=[101941]][$SETVAR3="..Lv.."]"  );
		end
	elseif Lv == 12 then 
		Say( OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100211]][$SETVAR2=[100212]][$SETVAR3="..Lv.."]"  );
	elseif Lv == 13 then 
		Say( OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100294]][$SETVAR2=[100082]][$SETVAR3="..Lv.."]"  );
	elseif Lv == 14 then 
		Say( OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100079]][$SETVAR2=[100080]][$SETVAR3="..Lv.."]"  );
	elseif Lv == 15 then 
		Say( OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100456]][$SETVAR2=[100399]][$SETVAR3="..Lv.."]"  );
	elseif Lv == 16 then 
		Say( OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100295]][$SETVAR2=[100213]][$SETVAR3="..Lv.."]"  );
	elseif Lv == 17 then 
		Say( OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100299]][$SETVAR2=[100298]][$SETVAR3="..Lv.."]"  );
	elseif Lv == 18 then 
		Say( OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100379]][$SETVAR2=[100209]][$SETVAR3="..Lv.."]"  );
	elseif Lv == 19 then 
		Say( OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100064]][$SETVAR2=[100065]][$SETVAR3="..Lv.."]"  );
	elseif Lv == 20 then 
		Say( OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100454]][$SETVAR2=[100455]][$SETVAR3="..Lv.."]"  );
	end
end


function lua_mika_newpet_guide()  --點擊寵物會出現的新手提示
	local master = ReadRoleValue(TargetID(),EM_RoleValue_OwnerGUID) 
	local Lv =  ReadRoleValue( master , EM_RoleValue_LV  ) 
	local PlayerRace = ReadRoleValue( master , EM_RoleValue_RACE )
	CloseSpeak(master)
	Sleep(10)
	Say( TargetID(), "[SC_NEWPLAYERPET_LVNOW][$SETVAR1=[100152]][$SETVAR2=[100203]][$SETVAR3="..Lv.."]"  );
	Say( OwnerID(), "[SC_NEWPLAYERPET_LVNOW][$SETVAR1=[100152]][$SETVAR2=[100203]][$SETVAR3="..Lv.."]"  );
end