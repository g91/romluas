function lua_skwerl_zone23_briefing() ---掛在任務npc上用
	LoadQuestOption(OwnerID())
	LuaPG_425234_Give()
	local quest = CheckAcceptQuest( OwnerID(), 425175 )  
		if quest== true then
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SKWERL_PE_BBQ_07") , " lua_skwerl_pe_01_rearm", 0 ) -- I WANT TO COOK CHICKEN
		end
end

function lua_skwerl_pe_01_torch() --給火種
	local npc=OwnerID()
	local player= TargetID()
	GiveBodyItem(Player, 241144, 3 )
	ScriptMessage(npc,Player,1, "[SKWERL_PE_BBQ_05]", C_SYSTEM) --這些燃燒符文就給你了，祝你好運！如果用完的話再回來跟我拿！
	ScriptMessage(npc,Player,0, "[SKWERL_PE_BBQ_05]", C_SYSTEM)
end


function lua_skwerl_pe_01_rearm() --補給燃燒福文用的script
	local player=OwnerID()
	local npc=TargetID()
	local ammo 
	local burn
	ammo= CountBodyItem(player, 241144) --確保燃燒福文數量小於3
	burn= CountBodyItem(player, 241181)  --灰燼數量，大於2代表任務完成
	if ammo > 2 then 
		ScriptMessage(npc,Player,1, "[SKWERL_PE_BBQ_04]", C_SYSTEM)  --告訴玩家符文已滿
		ScriptMessage(npc,Player,0, "[SKWERL_PE_BBQ_04]", C_SYSTEM)
	elseif burn > 2 then
		ScriptMessage(npc,Player,1, "[SKWERL_PE_BBQ_06]", C_SYSTEM) --你不需要更多的燃燒福文，任務已經完成了！
		ScriptMessage(npc,Player,0, "[SKWERL_PE_BBQ_06]", C_SYSTEM)
	else
		Delbodyitem(player,241144,ammo)
		GiveBodyItem(player, 241144, 3 )
		ScriptMessage(npc,Player,1, "[SKWERL_PE_BBQ_05]", C_SYSTEM) --符文補給完畢
		ScriptMessage(npc,Player,0, "[SKWERL_PE_BBQ_05]", C_SYSTEM)
	
	end
	CloseSpeak(player)
end
function Lua_Z23_Ray_skwerl_PE01()--屍體隨機重生
	local x,y,z,dir=DW_Location(OwnerID());
	local CorpseList={120498,120675,120676,120677};
	local Corpse=CreateObj(CorpseList[DW_Rand(4)],x,y,z,dir,1);
	SetDefIdleMotion(Corpse,ruFUSION_MIME_IDLE_DEAD);
	AddToPartition(Corpse,0);
	local InvisibleObj=0;
	local IsReset,WaitSec=false,1;
	while true do
		if IsReset==true then	--屍體重生
			IsReset=false;
			sleep(WaitSec*10);
			Corpse=CreateObj(CorpseList[DW_Rand(4)],x,y,z,dir,1);
			SetDefIdleMotion(Corpse,ruFUSION_MIME_IDLE_DEAD);
			AddToPartition(Corpse,0);
		end
		if CheckID(Corpse)==false then
			if InvisibleObj~=0 then
				if ReadRoleValue(InvisibleObj,EM_RoleValue_Register+5)~=0 then--用來確認生出的三蟻是否全嗝屁
					DelObj(InvisibleObj);
					sleep(210+DW_Rand(180));
					IsReset=true;
					WaitSec=1;
				else
					sleep(30);
				end
			else
				IsReset=true;
				WaitSec=1;
			end
		else
			if ReadRoleValue(Corpse,EM_RoleValue_Register+6)~=0 then
				DelObj(Corpse);
				IsReset=true;
				WaitSec=30;
			end
			InvisibleObj=ReadRoleValue(Corpse,EM_RoleValue_Register+1);
			sleep(30);
		end
	end
end
function lua_skwerl_pe_01_corpse_command()
	local Player,Corpse = OwnerID(),TargetID();
	LoadQuestOption(Player);
	local IsSearched,DyQuestItem,AntOrgID=622208,241229,120676
--小橘撿殘骸
	if ReadRoleValue(Corpse,EM_RoleValue_OrgID)==AntOrgID then
		if CheckBuff(Corpse,IsSearched)==false then
			if DW_CheckQuestAccept("or",Player,425295,425300,425305)==true then
				if CountBodyItem(player,DyQuestItem)<5 then
					AddSpeakOption(Player,Player,"[SC_Q425295_00]","Dy_Z23_13_TAKE", 0 );
				end
			end
		end
	end
--麒均燒屍體
	local burn= CountBodyItem(OwnerID(), 241181);  --用成功燒掉屍體的次數來判斷是否可以再燒屍體
	if Checkflag(OwnerID(), 546272)==true  and burn <6 then
		AddSpeakOption( Player, Corpse, "[SKWERL_PE_BBQ_02]" , "lua_skwerl_pe_01_corpse_begin", 0 ) -- 燃燒屍體
	end
end

function lua_skwerl_pe_01_corpse_begin()
	local player= OwnerID()
	local corpse= TargetID()
	local RoomID = ReadRoleValue( corpse , EM_RoleValue_RoomID )
	local Obj = Role:new( corpse )  -- 取得corpse X.Y.Z.Dir值
	local BaseX = Obj :X()
 	local BaseY = Obj :Y()
 	local BaseZ = Obj :Z()
	local BaseDir = Obj:Dir()
	local registercount= ReadRoleValue( corpse , EM_RoleValue_Register+1  ) --如果有人在燒，register值為1
	local number
	number= CountBodyItem(player, 241144) --檢查火種量
	if number >0 then --如果有火種，開始燃燒
		if registercount>0 then --已經有人在燃燒屍體
			ScriptMessage(Player,Player,1, "[SC_425103_D]", C_SYSTEM) --通知玩家屍體已被燃燒
			ScriptMessage(Player,Player,0, "[SC_425103_D]", C_SYSTEM)
			CloseSpeak(Player);
		else
			Closespeak(Player);
			DelBodyItem(Player, 241144, 1)-- 用掉一顆火種
			local InvisibleObj = CreateObj( 120504 , BaseX , BaseY, BaseZ , BaseDir ,1 ) --生火
			WriteRoleValue(corpse , EM_RoleValue_Register+1, InvisibleObj)
			AddToPartition( InvisibleObj, RoomID )
			SetModeEx( InvisibleObj, EM_SetModeType_Mark , false )--標記
			CallPlot( InvisibleObj , "lua_skwerl_pe_01_corpsetest" , Player, corpse ) --生隱形物件給怪物打
		end
	else
			ScriptMessage(Player,Player,1, "[SKWERL_PE_BBQ_03]", C_SYSTEM)
			ScriptMessage(Player,Player,0, "[SKWERL_PE_BBQ_03]", C_SYSTEM)
	end

end


function lua_skwerl_pe_01_fire() --火焰外觀修改
	local fire= OwnerID()
	For i= 1, 60, 1 do
		if  i==20 then
	             	ChangeObjID(fire , 120500)
	             	SetModeEx( fire , EM_SetModeType_Mark , false )--標記 (小火變中火)
	             elseif i==40 then
	             	ChangeObjID(fire , 120501)
	             	SetModeEx( fire , EM_SetModeType_Mark , false )--標記(中火變大火)
		end
	sleep(10)
	end

end

function lua_skwerl_pe_01_corpsetest(player, corpse) --給怪物打的隱形物件
	local number
	local InvisibleObj= OwnerID()
	local RoomID = ReadRoleValue( InvisibleObj , EM_RoleValue_RoomID )
	local Obj = Role:new( InvisibleObj )  -- 取得InvisibleObj  X.Y.Z.Dir值
	local BaseX = Obj :X()
 	local BaseY = Obj :Y()
 	local BaseZ = Obj :Z()
	local BaseDir = Obj:Dir()
	local shieldlv
	local MaxHP = ReadRoleValue( InvisibleObj , EM_RoleValue_MaxHP )
	SetModeEx( corpse, EM_SetModeType_Mark, false )--不能再跟屍體對話
	SetModeEx( corpse, EM_SetModeType_HideName, true) --隱藏屍體名稱
	SetModeEx( InvisibleObj , EM_SetModeType_Fight , true )--可攻擊隱形物件
	SetModeEx( InvisibleObj, EM_SetModeType_HideName, true) --隱藏隱形物件名稱
	Addbuff(InvisibleObj, 622154, 1, -1)
	local fire = CreateObj( 120499 , BaseX , BaseY+10 , BaseZ , BaseDir , 1 ) --生火
	AddToPartition( fire, RoomID )
	SetModeEx( fire, EM_SetModeType_Mark , false )--標記

	--生怪物攻擊目標--
	local target = CreateObj( 106803 , BaseX , BaseY , BaseZ , BaseDir , 1 ) --生火
	AddToPartition( target, RoomID )
	SetModeEx( target, EM_SetModeType_Mark , false )--標記
	SetModeEx( target , EM_SetModeType_Strikback, false )--無法反擊
	Addbuff(target, 622154, 1, -1)
	


--	local number = {}
	local number = lua_skwerl_pe_01_corpseloop(player, RoomID, BaseX, BaseY, BaseZ, BaseDir, target) --開始燃燒回圈
	delobj(fire)
	delobj(target)
	if  number==60 then --如果成功燃燒，屍體會引爆
			SysCastSpellLv( InvisibleObj , InvisibleObj , 497005 , 0 )
	
		If CheckID(player)== true then
			DW_QietKillOne(player, 106712 ) --完成任務提示(任務目標:燃燒屍體，這是完成目標用的指令)

			local burn= CountBodyItem(player, 241181)  --灰燼數量，大於2代表任務完成
			if burn >2 then
				ScriptMessage(player,player,1, "[SKWERL_PE_BBQ_08]", C_SYSTEM) --灰燼袋已滿，無法蒐集更多的灰燼。
				ScriptMessage(player,player,0, "[SKWERL_PE_BBQ_08]", C_SYSTEM) --灰燼袋已滿，無法蒐集更多的灰燼。
			else
				GiveBodyItem(player, 241181, 1 )--給予燃燒灰燼
			end
		end
	
	end
	local ant1=ReadRoleValue( InvisibleObj , EM_RoleValue_Register+2 )
	local ant2=ReadRoleValue( InvisibleObj , EM_RoleValue_Register+3 )
	local ant3=ReadRoleValue( InvisibleObj , EM_RoleValue_Register+4 )

	SetModeEx( InvisibleObj , EM_SetModeType_Fight , false )--不可攻擊隱形物件
	DelObj(corpse);
	
	while true do ---迴圈--如果屍體生出的螞蟻不在戰鬥狀態時後才會再開啟任務。避免生出過多的螞蟻
		if checkID(ant1)==false and checkID(ant2)==false and checkID(ant3)==false then
			break		
		end	
		sleep(20)
	end
	sleep(300)
	WriteRoleValue(InvisibleObj , EM_RoleValue_Register+5, 1 );
end



function lua_skwerl_pe_01_corpseloop(player, RoomID, X, Y, Z, Dir, target)
local NPC=OwnerID()
local Distance
local number

	for  i= 1, 60, 1 do
		local registercount= ReadRoleValue(NPC , EM_RoleValue_Register+1  ) --如果屍體被吃掉，register count會變成 1
		if registercount==1 then
			ScriptMessage(Player,Player,1, "[SKWERL_PE_BBQ_01]", C_SYSTEM)
			ScriptMessage(Player,Player,0, "[SKWERL_PE_BBQ_01]", C_SYSTEM)
			break --離開迴圈
		end
		if i==15 then
			local ant1= CreateObj( 106774 , X +100 , Y , Z , Dir , 1 ) --生螞蟻1
			AddToPartition( ant1, RoomID )
			setattack(ant1, target)
			BeginPlot( ant1 , "luaS_skwerl_pe_01_hatetest" , 0 )
			WriteRoleValue( NPC , EM_RoleValue_Register+2 , ant1 )	-- 將ant1寫進屍體的 Reg+2 
		end
	
		if i==30 then
			local ant2= CreateObj( 106774 , X +100 , Y , Z , Dir , 1 ) --生螞蟻2
			AddToPartition( ant2, RoomID )
			setattack(ant2, target)
			BeginPlot( ant2 , "luaS_skwerl_pe_01_hatetest" , 0 )
			WriteRoleValue( NPC , EM_RoleValue_Register+3 , ant2 )	-- 將ant2寫進屍體的 Reg+3 
		end

		if i==45 then
			local ant3= CreateObj( 106774 , X +100 , Y , Z , Dir , 1 ) --生螞蟻3
			AddToPartition( ant3, RoomID )
			setattack(ant3, target)
			BeginPlot( ant3 , "luaS_skwerl_pe_01_hatetest" , 0 )
			WriteRoleValue( NPC , EM_RoleValue_Register+4 , ant3 )	-- 將ant3寫進屍體的 Reg+4 
		end


		number=i
		sleep(10)
		
	end

	return number


end

function luaS_skwerl_pe_01_hatetest() ---怪物如果沒有目標就消失(以仇恨表來判斷)
	local npc= OwnerID()
	local hatenumber
	while true do
		sleep(50)
		hatenumber= HateListCount( npc )
--		say (npc, hatenumber)
		if hatenumber==0 then
			DelObj(npc)
		end
		sleep(10)
	end
end

function lua_skwerl_corpse_eaten() --如果屍體被螞蟻吃掉的話，提早game over
--	say(OwnerID(), "dead")
	local NPC= Lua_Hao_NPC_Closest_Search( OwnerID() , 120504 ,5 )
	WriteRoleValue(NPC , EM_RoleValue_Register+1, 1 ) 
end