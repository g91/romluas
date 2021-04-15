function lua_skwerl_Z23_InitialSet()
	local NPC=OwnerID();
	local RoomID=ReadRoleValue(NPC,EM_RoleValue_RoomID);
	OldCaptain=OldCaptain or {};
	NewCaptain=NewCaptain or {};
	local OldCaptainOrgID=106679
	if ReadRoleValue(NPC,EM_RoleValue_OrgID)==OldCaptainOrgID then
		OldCaptain[RoomID]=NPC;
	else
		NewCaptain[RoomID]=NPC;
	end
end
function lua_skwerl_Z23_MobHide(GUID)
	SetModeEx(GUID,EM_SetModeType_Show,false);
	DW_UnFight(GUID,true);
end
function lua_skwerl_Z23_MobShow(GUID,captain)
	sleep(20);
	SetModeEx(GUID,EM_SetModeType_Show,true);
	DW_UnFight(GUID,false);
	SysCastSpellLv(GUID, captain, 496266,-1 )
	SysCastSpellLv(captain, GUID, 496266,-1 )
end
function lua_skwerl_Z23_controller()
	
	local npc= OwnerID()
	local Monster
	local RoomID = ReadRoleValue( npc , EM_RoleValue_RoomID )
	local Obj = Role:new( npc )  -- 取得npc X.Y.Z.Dir值
	local BaseX = Obj :X()
 	local BaseY = Obj :Y()
 	local BaseZ = Obj :Z()
	local BaseDir = Obj:Dir()
	local MaxHP = ReadRoleValue( npc , EM_RoleValue_MaxHP )
	while true do
		local NowHP = ReadRoleValue( npc , EM_RoleValue_HP )
		if NowHP/MaxHP <= 0.3 then
			SysCastSpellLv(npc, npc, 497114, 3 ) 
		end
		sleep (100)
	end
end




function lua_skwerl_Z23_controller2()
	SetPlot( OwnerID(),"range","lua_skwerl_Z23_area1",120 )  
end

function lua_skwerl_Z23_Monsterdeath()
	local npc= OwnerID()
	Lua_Z23_BloodyBF_AntDead();--戰場蟻族死亡劇情
	local hatenumber
	local killer
	local check
-------------------------------------------------------------------------重生用
	local Monster
	local RoomID = ReadRoleValue( npc , EM_RoleValue_RoomID )
	local Obj = Role:new( npc )  -- 取得npc X.Y.Z.Dir值
	local BaseX = Obj :X()
 	local BaseY = Obj :Y()
 	local BaseZ = Obj :Z()
	local BaseDir = Obj:Dir()
	local captain=NewCaptain[RoomID];
--------------------------------------------------------------------------------



	hatenumber= HateListCount( npc );
	SysCastSpellLv( npc, npc, 499290,1 )--- 元素爆
	for i=0, hatenumber-1, 1 do
		killer=HateListInfo(npc, i , EM_HateListInfoType_GItemID ); 
		check=ReadRoleValue(killer, EM_RoleValue_IsPlayer ) 
		if check==1 and CheckFlag( killer, 546203)== true then
			If Checkflag(killer, 546201)==true then
				ScriptMessage( captain,killer, 1, "[SKWERL_MISSION01_03]", C_SYSTEM ); --不要留著幫我，我還可以撐下去！
			else
				ScriptMessage( captain,killer, 1, "[SKWERL_MISSION01_09]", C_SYSTEM );  --可惡，元素爆，很多隊友都是因為這樣死的！
				ScriptMessage( captain,killer, 1, "[SKWERL_MISSION01_02]", C_SYSTEM );   --謝謝你的幫助，這區就交給我處理！
				Setflag(killer, 546201, 1) ---area1 rescue 戰線一拯救成功
			end
		elseif check==1 and DW_CheckQuestAccept("or",killer,425318,425332,425346)==true then
			DW_QietKillOne(killer,102374);
		end
	end
------------------------- 生怪------------------------------------------------------------
	Monster= CreateObjByFlag( 106774 , 781109 , 0  , 1 )
	lua_skwerl_Z23_MobHide(Monster);
	AddToPartition(Monster , RoomID )
	SetFlag(Monster,544801,1);
	SetPlot(Monster,"dead","lua_skwerl_Z23_Monsterdeath",0);
	CallPlot(Monster,"lua_skwerl_Z23_MobShow",Monster,captain);
end 
				
function lua_skwerl_Z23_antspawn1()  ---中控器，伺服器開機時生怪用
	local npc= OwnerID()
	sleep(20)
	local captain= Lua_Hao_NPC_Closest_Search(npc , 106677 ,450)   
	local RoomID = ReadRoleValue( npc , EM_RoleValue_RoomID )
	BeginPlot(captain,"lua_skwerl_Z23_InitialSet",0);--記錄隊長的全域
	local Obj = Role:new( npc )  -- 取得npc X.Y.Z.Dir值
	local BaseX = Obj :X()
 	local BaseY = Obj :Y()
 	local BaseZ = Obj :Z()
	local BaseDir = Obj:Dir()
	local Monster1
	local Monster2

	Monster1= CreateObjByFlag( 106774 , 781109 , 0  , 1 )
	AddToPartition(Monster1 , RoomID )
	SetFlag(Monster1,544801,1);
	SetPlot(Monster1,"dead","lua_skwerl_Z23_Monsterdeath",0);
	SysCastSpellLv(captain, Monster1, 496266,-1 )
	SysCastSpellLv(Monster1, captain, 496266,-1 )

	Monster2= CreateObjByFlag( 106774 , 781109 , 0  , 1 )
	AddToPartition(Monster2 , RoomID )
	SetFlag(Monster2,544801,1);
	SetPlot(Monster2,"dead","lua_skwerl_Z23_Monsterdeath",0);
	SysCastSpellLv(captain, Monster2, 496266,-1 )
	SysCastSpellLv(Monster2, captain, 496266,-1 )

end	


function luaS_skwerl_Z23_respawn()
	local npc= OwnerID()
	local Monster
	local RoomID = ReadRoleValue( npc , EM_RoleValue_RoomID )
	local Obj = Role:new( npc )  -- 取得npc X.Y.Z.Dir值
	local BaseX = Obj :X()
 	local BaseY = Obj :Y()
 	local BaseZ = Obj :Z()
	local BaseDir = Obj:Dir()



	Monster = CreateObjByFlag( 106774 , 781109 , 0  , 1 )		-- 在旗標生怪(產生物件ID , 產生旗子ID , 旗子位置ID , 產生數量)
	AddToPartition( Monster , RoomID )
	SetFlag(Monster,544801,1);
	SysCastSpellLv(captain, Monster, 496266,-1 )
	SysCastSpellLv(Monster, captain, 496266,-1 )

end

function lua_skwerl_Z23_area1()   ---艾斯對話
---targetid()= captain----
	Local player= OwnerID()
	Local captain= TargetID()
	if CheckFlag( player, 546203)== true and CheckFlag( player, 546199)== false then --546203= 執行任務中的玩家  546199=跟此npc對話過的flag
		if CheckFlag( player, 546202)== true then --如果之前幫助過另一位npc的話
		ScriptMessage(Captain,Player,1, "[SKWERL_MISSION01_04]", C_SYSTEM)  --原來幫助[106679]的冒險家就是你啊！我是[106677]，理查森隊長已經死了，所以這區由我來代替他！
		ScriptMessage(Captain,Player,0, "[SKWERL_MISSION01_04]", C_SYSTEM) 
		SetFlag(player, 546199, 1) --講過話了
		else
		ScriptMessage(Captain,Player,1, "[SKWERL_MISSION01_01]", C_SYSTEM)  --理查森隊長已經死了。我是[106677]，這區暫時由我負責！
		ScriptMessage(Captain,Player,0, "[SKWERL_MISSION01_01]", C_SYSTEM)
		SetFlag(player, 546199, 1) --講過話了
		end
	end

end



function lua_skwerl_Z23_testcmd()
	local player=OwnerID()
		SetFlag(player, 546199, 0)
		SetFlag(player, 546200, 0)
		SetFlag(player, 546201, 0)
		SetFlag(player, 546202, 0)
		SetFlag(player, 546209, 0)
		SetFlag(player, 546203, 1)
end


------------------------------------------------------------------------------------------------------------------------
------------------------------------area 2--(106679用)---------------------------------------------------------------------




function lua_skwerl_Z23_controller3()  --captain bishop controller
	SetPlot( OwnerID(),"range","lua_skwerl_Z23_area1B",120 )  
end

function lua_skwerl_Z23_MonsterdeathB()  --生元素怪螞蟻死亡劇情
	local npc= OwnerID()
	Lua_Z23_BloodyBF_AntDead();--戰場蟻族死亡劇情
	local hatenumber
	local killer
	local check
	------------------------生怪用---------------------------------------------
	local Monster
	local RoomID = ReadRoleValue( npc , EM_RoleValue_RoomID )
	local Obj = Role:new( npc )  -- 取得npc X.Y.Z.Dir值
	local BaseX = Obj :X()
 	local BaseY = Obj :Y()
 	local BaseZ = Obj :Z()
	local BaseDir = Obj:Dir()
	local choice
	local Monsterid
	local captain= OldCaptain[RoomID];
	----------------------------------------------------------------------

	hatenumber= HateListCount( npc );
--	SysCastSpellLv( npc, npc, 499258,1 )  --元素怪誕生fx
	for i=0, hatenumber-1, 1 do
		killer=HateListInfo(npc, i , EM_HateListInfoType_GItemID ); 
		check=ReadRoleValue(killer, EM_RoleValue_IsPlayer ) 
		if check==1 and CheckFlag( killer, 546203)== true then
			ScriptMessage( captain,killer, 1, "[SKWERL_MISSION01_10]", C_SYSTEM ); --別鬆懈！元素怪要出現了！
		elseif check==1 and DW_CheckQuestAccept("or",killer,425319,425333,425347)==true then
			DW_QietKillOne(killer,102375);
		end
	end
	----------------------------生元素怪----------------------------------------
	choice=Rand(100)
	if choice < 25 then   --元素怪隨機選怪種類
		Monsterid=106681 
	elseif choice >= 25 and choice <=50 then
		Monsterid= 106682 
	elseif choice>50 and choice<=75 then
		Monsterid=106683
	else
		Monsterid=106888
	end
	Monster= CreateObj(Monsterid , BaseX+10 , BaseY , BaseZ+10 , BaseDir , 1 )
	AddToPartition(Monster , RoomID )
	SysCastSpellLv(captain, Monster, 496266,-1 )   ---開朝唪
	SysCastSpellLv(Monster, captain, 496266,-1 )    --開朝唪

end 	


				
function lua_skwerl_Z23_elementalMonsterdeath()  --元素怪死亡劇情
	local npc= OwnerID()
	local hatenumber
	local killer
	local check
----------------------------------------------重生用---------------------
	local npc= OwnerID()
	local Monster
	local RoomID = ReadRoleValue( npc , EM_RoleValue_RoomID )
	local Obj = Role:new( npc )  -- 取得npc X.Y.Z.Dir值
	local BaseX = Obj :X()
 	local BaseY = Obj :Y()
 	local BaseZ = Obj :Z()
	local BaseDir = Obj:Dir()
	local captain=OldCaptain[RoomID]
------------------------------------------------------------------------
	hatenumber= HateListCount( npc );
	for i=0, hatenumber-1, 1 do
		killer=HateListInfo(npc, i , EM_HateListInfoType_GItemID ); 
		check=ReadRoleValue(killer, EM_RoleValue_IsPlayer ) 
		if check==1 and CheckFlag( killer, 546203)== true then  ---確認殺手是執行任務中的玩家
			If Checkflag(killer, 546202)==true then
				ScriptMessage( captain,killer, 1, "[SKWERL_MISSION01_08]", C_SYSTEM ); --"這區由我負責，你不需要留在這裡！"
			else
				ScriptMessage( captain,killer, 1, "[SKWERL_MISSION01_07]", C_SYSTEM ); --多謝了，你先走吧！這區就交給我了！
				Setflag(killer, 546202, 1) -- 戰線二拯救成功
			end
		elseif check==1 and DW_CheckQuestAccept("or",killer,425319,425333,425347)==true then
			DW_QietKillOne(killer,102375);
		end
	end
----------生怪----------------------------------------------------
	Monster= CreateObjByFlag( 106775 ,  781128  , 0  , 1 )
	lua_skwerl_Z23_MobHide(Monster);
	AddToPartition(Monster , RoomID )
	SetFlag(Monster,544801,1);
	SetPlot(Monster,"dead","lua_skwerl_Z23_MonsterdeathB",0);
	CallPlot(Monster,"lua_skwerl_Z23_MobShow",Monster,captain);
end 		


function lua_skwerl_Z23_antspawn2()  ---中控器，伺服器開機時生怪用
	local npc= OwnerID()
	sleep(20)
	local captain= Lua_Hao_NPC_Closest_Search(npc , 106679 ,450)   
	local RoomID = ReadRoleValue( npc , EM_RoleValue_RoomID )
	BeginPlot(captain,"lua_skwerl_Z23_InitialSet",0);--記錄隊長的全域
	local Obj = Role:new( npc )  -- 取得npc X.Y.Z.Dir值
	local BaseX = Obj :X()
 	local BaseY = Obj :Y()
 	local BaseZ = Obj :Z()
	local BaseDir = Obj:Dir()
	local Monster1
	local Monster2

	Monster1= CreateObjByFlag( 106775 , 781128 , 0  , 1 )
	AddToPartition(Monster1 , RoomID )
	SetPlot(Monster1,"dead","lua_skwerl_Z23_MonsterdeathB",0);
	SysCastSpellLv(captain, Monster1, 496266,-1 )
	SysCastSpellLv(Monster1, captain, 496266,-1 )

	Monster2= CreateObjByFlag( 106775 , 781128 , 0  , 1 )
	AddToPartition(Monster2 , RoomID )
	SetPlot(Monster2,"dead","lua_skwerl_Z23_MonsterdeathB",0)
	SysCastSpellLv(captain, Monster2, 496266,-1 )
	SysCastSpellLv(Monster2, captain, 496266,-1 )

end






function lua_skwerl_Z23_area1B()
---targetid()= captain----
	Local player= OwnerID()
	Local captain= TargetID()
	if CheckFlag( player, 546203)== true and CheckFlag( player, 546200)== false then --546203= 執行任務中的玩家  546200=跟此npc對話過的flag
		if CheckFlag( player, 546201)== true then --如果之前幫助過另一位npc的話
		ScriptMessage(Captain,Player,1, "[SKWERL_MISSION01_06]", C_SYSTEM)  --原來幫助[106677]的冒險家就是你啊！我是[106679]，很榮信可以跟你一起並肩作戰！
		ScriptMessage(Captain,Player,0, "[SKWERL_MISSION01_06]", C_SYSTEM) 
		SetFlag(player, 546200, 1) --講過話了
		else
		ScriptMessage(Captain,Player,1, "[SKWERL_MISSION01_05]", C_SYSTEM) --我是[106679]，很榮信可以跟你一起並肩作戰！
		ScriptMessage(Captain,Player,0, "[SKWERL_MISSION01_05]", C_SYSTEM) --我是[106679]，很榮信可以跟你一起並肩作戰！
		SetFlag(player, 546200, 1) --講過話了
		end
	end

end


function lua_skwerl_Z23_briefing()
	local player= TargetID()
	local npc= OwnerID()
	if CheckFlag( player, 546209)== false then 
		Addbuff(Player, 622152, 1, 180)
		Setflag(Player, 546209, 1)
		ScriptMessage(npc, Player,1, "[SKWERL_MISSION01_11]", C_SYSTEM)
	elseif CheckFlag( player, 546209)== true then 
		ScriptMessage(npc, player,1, "[SKWERL_MISSION01_12]", C_SYSTEM)
	end
end

function lua_skwerl_Z23_test()
	local npc=OwnerID()
	say(npc, "test")
	SysCastSpellLv(npc, npc, 499246, 1 ) 
end