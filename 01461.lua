function LiveSkillUpDate()
	Beginplot( OwnerID() ,"LiveSkillUpDateDialog", 0 )
end

function LiveSkillUpDateDialog()	-- 
	local n = 0
	local DialogStatus = 0

	local SkillUpdateSelect = {}
	SkillUpdateSelect[0] = { "[SYS_SKILLNAME_MINING]"	,EM_RoleValue_Skill_Mining }		--採礦
	SkillUpdateSelect[1] = { "[SYS_SKILLNAME_HERBLISM]"	,EM_RoleValue_Skill_Herblism }		--採藥
	SkillUpdateSelect[2] = { "[SYS_SKILLNAME_LUMBERING]"	,EM_RoleValue_Skill_Lumbering }		--伐木
	SkillUpdateSelect[3] = { "[SYS_SKILLNAME_BLACKSMITH]"	,EM_RoleValue_Skill_BlackSmith }		--打鐵
	SkillUpdateSelect[4] = { "[SYS_SKILLNAME_CARPENTER]"	,EM_RoleValue_Skill_Carpenter }		--木工
	SkillUpdateSelect[5] = { "[SYS_SKILLNAME_MAKEARMOR]"	,EM_RoleValue_Skill_MakeArmor }		--製甲
	SkillUpdateSelect[6] = { "[SYS_SKILLNAME_TAILOR]"	,EM_RoleValue_Skill_Tailor }		--裁縫
	SkillUpdateSelect[7] = { "[SYS_SKILLNAME_COOK]"		,EM_RoleValue_Skill_Cook }		--烹飪
	SkillUpdateSelect[8] = { "[SYS_SKILLNAME_ALCHEMY]"	,EM_RoleValue_Skill_Alchemy }		--煉金
	SkillUpdateSelect[9] = { "[SO_EXIT]" }								-- 離開


	DialogCreate( OwnerID() , EM_LuaDialogType_Select , "Update What Skill ?" )
	for i = 0, table.getn( SkillUpdateSelect ) do
		DialogSelectStr( OwnerID() , SkillUpdateSelect[i][1] )
	end
	if( DialogSendOpen( OwnerID() ) == false ) then 
		ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("SYS_FIXEQ_DATA_ERROR") , 0 )	--資料送出有問題
		return 0
	end
	while 1 do
		sleep( 1 )
		n = n + 1
		DialogStatus = DialogGetResult( OwnerID() )
		--Say( OwnerID() , DialogStatus )
		if n > 600 then -- 防無窮迴圈，600 = 一分鐘
			ScriptMessage( OwnerID() , OwnerID() , 0, "無窮迴圈或閒置過久", 0 )
			DialogClose( OwnerID() )
			break
		else
			--ScriptMessage( OwnerID() , OwnerID() , 0, "合法迴圈", 0 )
		end

		if ( DialogStatus == 9 ) or ( DialogStatus == -1 ) then
			DialogClose( OwnerID() )
			break
		elseif  ( DialogStatus ~= -2 ) then
			--DialogStatus = DialogStatus + 1
			DialogClose( OwnerID() )
			break
		end
	end

	if ( DialogStatus == 0 ) then	--挖礦
		local SkillUpdate = {}
		SkillUpdate[0] = { "[540269]",540269,20,SkillUpdateSelect[DialogStatus][2] }						-- 20
		SkillUpdate[1] = { "[540340]",540340,40,SkillUpdateSelect[DialogStatus][2] }						-- 40
		SkillUpdate[2] = { "[540349]",540349,60,SkillUpdateSelect[DialogStatus][2] }						-- 60
		SkillUpdate[3] = { "[540358]",540358,80,SkillUpdateSelect[DialogStatus][2] }						-- 80
		SkillUpdate[4] = { "[540371]",540371,100,SkillUpdateSelect[DialogStatus][2] }					--100		-- 100
		SkillUpdate[5] = { "[SO_EXIT]" }					-- 離開對話
		local SkillUpdatePlace = SkillUpdateDialog( OwnerID(), SkillUpdate )

	elseif ( DialogStatus == 1 ) then	--採藥
		local SkillUpdate = {}
		SkillUpdate[0] = { "[540333]",540333,20,SkillUpdateSelect[DialogStatus][2] }						-- 20
		SkillUpdate[1] = { "[540342]",540342,40,SkillUpdateSelect[DialogStatus][2] }						-- 40
		SkillUpdate[2] = { "[540351]",540351,60,SkillUpdateSelect[DialogStatus][2] }						-- 60
		SkillUpdate[3] = { "[540360]",540360,80,SkillUpdateSelect[DialogStatus][2] }						-- 80
		SkillUpdate[4] = { "[540372]",540372,100,SkillUpdateSelect[DialogStatus][2] }					--100		-- 100
		SkillUpdate[5] = { "[SO_EXIT]" }					-- 離開對話
		local SkillUpdatePlace = SkillUpdateDialog( OwnerID(), SkillUpdate )

	elseif ( DialogStatus == 2 ) then	--伐木
		local SkillUpdate = {}
		SkillUpdate[0] = { "[540270]",540270,20,SkillUpdateSelect[DialogStatus][2] }						-- 20
		SkillUpdate[1] = { "[540341]",540341,40,SkillUpdateSelect[DialogStatus][2] }						-- 40
		SkillUpdate[2] = { "[540350]",540350,60,SkillUpdateSelect[DialogStatus][2] }						-- 60
		SkillUpdate[3] = { "[540359]",540359,80,SkillUpdateSelect[DialogStatus][2] }						-- 80
		SkillUpdate[4] = { "[540370]",540370,100,SkillUpdateSelect[DialogStatus][2] }					--100		-- 100
		SkillUpdate[5] = { "[SO_EXIT]" }					-- 離開對話
		local SkillUpdatePlace = SkillUpdateDialog( OwnerID(), SkillUpdate )

	elseif ( DialogStatus == 3 ) then	--打鐵
		local SkillUpdate = {}
		SkillUpdate[0] = { "[540268]",540268,20,SkillUpdateSelect[DialogStatus][2] }						-- 20
		SkillUpdate[1] = { "[540343]",540343,40,SkillUpdateSelect[DialogStatus][2] }						-- 40
		SkillUpdate[2] = { "[540352]",540352,60,SkillUpdateSelect[DialogStatus][2] }						-- 60
		SkillUpdate[3] = { "[540361]",540361,80,SkillUpdateSelect[DialogStatus][2] }						-- 80
		SkillUpdate[4] = { "[540369]",540369,100,SkillUpdateSelect[DialogStatus][2] }					--100		-- 100
		SkillUpdate[5] = { "[SO_EXIT]" }					-- 離開對話
		local SkillUpdatePlace = SkillUpdateDialog( OwnerID(), SkillUpdate )

	elseif ( DialogStatus == 4 ) then	--木工
		local SkillUpdate = {}
		SkillUpdate[0] = { "[540334]",540334,20,SkillUpdateSelect[DialogStatus][2] }						-- 20
		SkillUpdate[1] = { "[540344]",540344,40,SkillUpdateSelect[DialogStatus][2] }						-- 40
		SkillUpdate[2] = { "[540353]",540353,60,SkillUpdateSelect[DialogStatus][2] }						-- 60
		SkillUpdate[3] = { "[540362]",540362,80,SkillUpdateSelect[DialogStatus][2] }						-- 80
		SkillUpdate[4] = { "[540368]",540368,100,SkillUpdateSelect[DialogStatus][2] }					--100		-- 100
		SkillUpdate[5] = { "[SO_EXIT]" }					-- 離開對話
		local SkillUpdatePlace = SkillUpdateDialog( OwnerID(), SkillUpdate )

	elseif ( DialogStatus == 5 ) then	--製甲
		local SkillUpdate = {}
		SkillUpdate[0] = { "[540335]",540335,20,SkillUpdateSelect[DialogStatus][2] }						-- 20
		SkillUpdate[1] = { "[540345]",540345,40,SkillUpdateSelect[DialogStatus][2]}						-- 40
		SkillUpdate[2] = { "[540354]",540354,60,SkillUpdateSelect[DialogStatus][2] }						-- 60
		SkillUpdate[3] = { "[540363]",540363,80,SkillUpdateSelect[DialogStatus][2] }						-- 80
		SkillUpdate[4] = { "[544329]",544329,100,SkillUpdateSelect[DialogStatus][2] }					--100		-- 100
		SkillUpdate[5] = { "[SO_EXIT]" }					-- 離開對話
		local SkillUpdatePlace = SkillUpdateDialog( OwnerID(), SkillUpdate )

	elseif ( DialogStatus == 6 ) then	--裁縫
		local SkillUpdate = {}
		SkillUpdate[0] = { "[540336]",540336,20,SkillUpdateSelect[DialogStatus][2] }						-- 20
		SkillUpdate[1] = { "[540346]",540346,40,SkillUpdateSelect[DialogStatus][2] }						-- 40
		SkillUpdate[2] = { "[540355]",540355,60,SkillUpdateSelect[DialogStatus][2] }						-- 60
		SkillUpdate[3] = { "[540364]",540364,80,SkillUpdateSelect[DialogStatus][2] }						-- 80
		SkillUpdate[4] = { "[540374]",540374,100,SkillUpdateSelect[DialogStatus][2] }					--100		-- 100
		SkillUpdate[5] = { "[SO_EXIT]" }					-- 離開對話
		local SkillUpdatePlace = SkillUpdateDialog( OwnerID(), SkillUpdate )

	elseif ( DialogStatus == 7 ) then	--烹飪
		local SkillUpdate = {}
		SkillUpdate[0] = { "[540337]",540337,20,SkillUpdateSelect[DialogStatus][2] }						-- 20
		SkillUpdate[1] = { "[540347]",540347,40,SkillUpdateSelect[DialogStatus][2] }						-- 40
		SkillUpdate[2] = { "[540356]",540356,60,SkillUpdateSelect[DialogStatus][2] }						-- 60
		SkillUpdate[3] = { "[540365]",540365,80,SkillUpdateSelect[DialogStatus][2] }						-- 80
		SkillUpdate[4] = { "[540373]",540373,100,SkillUpdateSelect[DialogStatus][2] }					--100		-- 100
		SkillUpdate[5] = { "[SO_EXIT]" }					-- 離開對話
		local SkillUpdatePlace = SkillUpdateDialog( OwnerID(), SkillUpdate )

	elseif ( DialogStatus == 8 ) then	--煉金
		local SkillUpdate = {}
		SkillUpdate[0] = { "[540338]",540338,20,SkillUpdateSelect[DialogStatus][2] }						-- 20
		SkillUpdate[1] = { "[540348]",540348,40,SkillUpdateSelect[DialogStatus][2] }						-- 40
		SkillUpdate[2] = { "[540357]",540357,60,SkillUpdateSelect[DialogStatus][2] }						-- 60
		SkillUpdate[3] = { "[540366]",540366,80,SkillUpdateSelect[DialogStatus][2] }						-- 80
		SkillUpdate[4] = { "[540375]",540375,100,SkillUpdateSelect[DialogStatus][2] }					--100		-- 100
		SkillUpdate[5] = { "[SO_EXIT]" }					-- 離開對話
		local SkillUpdatePlace = SkillUpdateDialog( OwnerID(), SkillUpdate )

	end

end

function SkillUpdateDialog( Player, SkillUpdateLocation )
	local n = 0
	local DialogStatus = 0
	DialogClose( Player )
	DialogCreate( Player , EM_LuaDialogType_Select , "What Lv ?" )
	for i = 0, table.getn( SkillUpdateLocation ) do
		DialogSelectStr( Player , SkillUpdateLocation[i][1] )
	end

	if( DialogSendOpen( Player ) == false ) then 
		ScriptMessage( Player , Player , 1 , GetString("SYS_FIXEQ_DATA_ERROR") , 0 )	--資料送出有問題
		return 0
	end

	while 1 do
		sleep( 1 )
		n = n + 1
		DialogStatus = DialogGetResult( Player )
		if n > 300 then -- 防無窮迴圈，300 = 三十秒
			ScriptMessage( Player , Player , 0, "無窮迴圈或閒置過久", 0 )
			DialogClose( Player )
			break
		else
			--ScriptMessage( Player , Player , 0, "合法迴圈", 0 )
		end
		

		if ( DialogStatus == 5 ) or ( DialogStatus == -1 ) then
			DialogClose( Player )
			break
		elseif ( DialogStatus ~= -2 ) then
			--DialogStatus = DialogStatus + 1
			DialogClose( Player )
			SetFlag( Player , SkillUpdateLocation[DialogStatus][2] , 1  )
			WriteRoleValue( Player , SkillUpdateLocation[DialogStatus][4] , SkillUpdateLocation[DialogStatus][3] )
			break
		end
	end
end