--禮物的初始劇情
function LuaS_XmasChest()
	SetPlot(OwnerID() , "touch" , "LuaS_TouchXmasChest" , 40 )
end
--禮物盒的觸碰劇情
function LuaS_TouchXmasChest()
	local Org = ReadRoleValue(TargetID(),EM_RoleValue_OrgID)
	local j = 1
	local Gitem = {	112015,	112016,	112017,	112018,	112019,
			112020,	112021,	112022,	112023,	112024,
			112025,	112026,	112027,	112028,	112029,
			112030,	112031,	112032,	112033,	112034,
			116651, 116652, 116653, 116654	}

	local Item = {	203516,	203517,	203518,	203519,	203516,
			203517,	203518,	203519,	203516,	203517,
			203518,	203519,	203516,	203517,	203518,
			203519,	203516,	203517,	203518,	203519,
			203519,	203516,	203517,	203518,	203519}

	local Flag = {	542260,	542261,	542262,	542263,	542264,
			542265,	542266,	542267,	542268,	542269,
			542270,	542271,	542272,	542273,	542274,
			542275,	542276,	542277,	542278,	542279,
			544565, 544566, 544567, 544568	}
	for i = 1, table.getn(Gitem) do
		if Gitem[i] == Org then
			j = i
			break
		end
	end
	if CheckFlag( OwnerID()  , Flag[j] ) ~= true then
		if BeginCastBar( OwnerID(), "[SC_XMAS_OPENCHEST]" , 20 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_END , 0 ) == 1 then	-- 打開禮物
			while 1 do
				sleep( 2 );
				local CastBarStatus = CheckCastBar( OwnerID() );
				if ( CastBarStatus ~= 0 ) then 
					if ( CastBarStatus > 0) then -- 成功
						result = "OKOK"
						EndCastBar( OwnerID() , CastBarStatus )
						break;
					elseif ( CastBarStatus < 0 ) then -- 失敗
						result = "DAME"
						EndCastBar( OwnerID() , CastBarStatus )
						break;
					end
				end
			end
			if ( result == "OKOK" ) then
				SetFlag( OwnerID()  , Flag[j] , 1 );
				GiveBodyItem ( OwnerID() , Item[j] , 1 );
			end
		end
	else
		ScriptMessage(OwnerID() , OwnerID() , 1 , "[SC_XMAS_OPENNOFLAG]" , C_SYSTEM )
	end
end