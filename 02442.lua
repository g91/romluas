function Lua_Z25_GEM(num)
	addrolevalue(OwnerID(),EM_RoleValue_EnergyJusticeCoin,num)	
end

function Lua_An_Drama_Test()
	local player = OwnerID()
	local Npc = TargetID()
	AddSpeakOption(player , Npc, "[SC_425421_0]", "Lua_An_Speak_Test", 0)
	callplot( Npc,"Lua_An_SOUND_Test",Npc,player)
	--PlaySound(OwnerID(),"sound/sound_new/skill/Music_Festival/instruments/sax.mp3",FALSE)
	PlaySoundToPlayer(OwnerID(),"music/character selection_03-02.mp3", false )
end

function Lua_An_Speak_Test()

	local player = OwnerID()
	local Npc = TargetID()

	AddBuff(player,622080,0,-1)
	local XRoomID = ReadRoleValue(npc,EM_RoleValue_RoomID)
	local FlagNum = 780874
	local ActorPool = {}
	local ActorNum = {}
	ActorNum[120813]	=0
	ActorNum[120814]	=1
	ActorNum[120815]	=2
	ActorNum[120816]	=3
	ActorNum[120817]	=4
	ActorNum[120818]	=5
	ActorNum[120819]	=6
	for i=0,6 do
		ActorPool[i]=CreateObjByFlag( 120813+i,FlagNum,i,1 )
		--table.insert(Globle_An_TempPlayerPool[425421].npc,ActorPool[i])
	end
	for i=1,5 do
		AddToPartition(ActorPool[i],XRoomID)
	end

--	CallPlot(ActorPool[1],"LuaQ_425421_Show",player,Npc,ActorPool)
end

function Lua_An_SOUND_Test()
	PlaySoundToPlayer(OwnerID(),"music/character selection_03-02.mp3", false )
end

function Lua_An_CancelBuff(NUM)
	if NUM~=nil then
		CancelBuff(OwnerID(),NUM)
	else
		return
	end
end

function LuaQ_an_cancelbuff(num)
	CancelBuff(OwnerID(),num)
end

function LuaQ_Scroll_Use()
	DebugMsg(0,0,"1")
	if ReadRoleValue(OwnerID(),EM_RoleValue_VOC) == 11 then
		DebugMsg(0,0,"2")
		return true
	else
		DebugMsg(0,0,"3")
		say(OwnerID(),"Not my job!")
		return
	end
end

function AN_TEST_AA()
	local player = OwnerID()
	local X = ReadRoleValue(player,EM_RoleValue_DuelistReward)
	X = X+50
	say(player,X)
end

function Lua_Gem_AA_KeyGive()
	local Player = OwnerID()
	local SkillKey =	{	547050	,	547051	,	547052	,	547053	,
				547054	,	547055	,	547056	,	547057	,
				547058	,	547059	,	547060	,	547061	,
				547062	,	547063	,	547064	,	547065	,
				547066	,	547067	,	547068	,	547069	,
				547070	,	547071	,	547072	,	547073	,
				547074	,	547075	,	547076	,	547077	,
				547078	,	547079	,	547097	,	547098	,
				547099	,	547100	,	547101	,	547102	,
				547103	,	547104	,	547105	,	547106	,
				547107	,	547108	,	547109	,	547110	,
				547111	,	547112	,	547113	,	547114	,
				547115	,	547116	,	547117	,	547118	,
				547119	,	547120	,	547121	,	547122	,
				547123	,	547124	,	547125	,	547126	}
	for giveitem=1,table.getn(SkillKey) do
		SetFlag(Player , SkillKey[giveitem], 1 )
	end
end

function Lua_Gem_AA_KeyDel()
	local Player = OwnerID()
	local SkillKey =	{	547050	,	547051	,	547052	,	547053	,
				547054	,	547055	,	547056	,	547057	,
				547058	,	547059	,	547060	,	547061	,
				547062	,	547063	,	547064	,	547065	,
				547066	,	547067	,	547068	,	547069	,
				547070	,	547071	,	547072	,	547073	,
				547074	,	547075	,	547076	,	547077	,
				547078	,	547079	,	547097	,	547098	,
				547099	,	547100	,	547101	,	547102	,
				547103	,	547104	,	547105	,	547106	,
				547107	,	547108	,	547109	,	547110	,
				547111	,	547112	,	547113	,	547114	,
				547115	,	547116	,	547117	,	547118	,
				547119	,	547120	,	547121	,	547122	,
				547123	,	547124	,	547125	,	547126	}
	for giveitem=1,table.getn(SkillKey) do
		SetFlag(Player , SkillKey[giveitem] ,0 )
	end	
end



function Lua_Gem_Test()
	local MountKey = { 		501417, 501418, 501440, 501441,
				501444, 501445, 501446, 501619, 
				501620, 501621, 501622, 501623, 
				501624, 501625, 501626, 501627, 
				501634, 501635, 501638,601649	}
	local MountPick = {}
	local PickTimes = 0
	local TimesCount = 0
	local PickMount = 0
	local Player = OwnerID();
	DialogCreate( Player , EM_LuaDialogType_Select , "Mount Menu" )

	for pick=0,4,1 do
		MountPick[pick] = MountKey[DW_RAND(20-pick)] 

		table.remove(MountKey,MountPick[pick])

		DialogSelectStr( Player , "I want to choose".."["..MountPick[pick] .."]" )
	end
	
	if( DialogSendOpen( Player ) == false ) then
		ScriptMessage( Player , Player , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 )	--資料送出有問題
		return 0
	end

	local SelectID = Hsiang_GetDialogResoult( Player );--企劃包起來的等待回覆用function

		AddBuff(Player,MountPick[SelectID+1],0,-1)

	DialogClose( Player )	
end


function GEM_XMAS2012_Q1_STONE()--觸碰劇情	硫磺礦
	SetCursorType( OwnerID() , 13)
	SetPlot( OwnerID(),"touch","GEM_XMAS2012_Q1_STONE_1",35 )
end

function GEM_XMAS2012_Q1_STONE_2(ObjID, CheckStatus)
	local player = OwnerID()   -- 玩家
	local NPC = TargetID()  	-- NPC
	local NpcPid = ReadRoleValue(npc,EM_RoleValue_PID)
	local Randrate = 0

	if( CheckStatus ~= 0 ) then

		if( CheckStatus > 0 ) then
			Randrate = DW_RAND(100)
			if NpcPid==1 then
				if Randrate%10 <=3 then
					CallPlot(NPC,"GEM_XMAS2012_Q1_SUCCESS",player,npc)
				else
					CallPlot(NPC,"GEM_XMAS2012_Q1_FAIL",player,npc)
				end
			elseif NpcPid==2 then
				if Randrate%10 <=5 then
					CallPlot(NPC,"GEM_XMAS2012_Q1_SUCCESS",player,npc)
				else
					CallPlot(NPC,"GEM_XMAS2012_Q1_FAIL",player,npc)
				end			
			elseif NpcPid==3 then
				if Randrate%10 <=7 then
					CallPlot(NPC,"GEM_XMAS2012_Q1_SUCCESS",player,npc)
				else
					CallPlot(NPC,"GEM_XMAS2012_Q1_FAIL",player,npc)
				end	
			end
			EndCastBar( player, CheckStatus )
		else
			EndCastBar( player, CheckStatus )
		end

	end
	--SetModeEx(npc,EM_SetModeType_Mark,true)
end

function GEM_XMAS2012_Q1_SUCCESS(player,npc)--挖掘判斷成功
	local WaterPool
	local hotspring = 121620  --溫泉編號
	Hide(npc)
	CallPlot(npc,"GEM_XMAS2012_Q1_STONE_SHOW",npc)
	SetFlag(player,547286,1)	
	CastSpell(npc,npc,850490)
	ScriptMessage(player,player,2,"[GEM_XMAS2012_Q1_1]",0)
	Sleep(10)
	WaterPool = Lua_DW_CreateObj("obj",hotspring,NPC)
	CallPlot(WaterPool,"GEM_XMAS2012_Q1_POOL",WaterPool)
end
function GEM_XMAS2012_Q1_FAIL(player,npc)	--挖掘判斷失敗
	ScriptMessage(player,player,1,"[GEM_XMAS2012_COLDWIND]",0)
	ScriptMessage(player,player,0,"[GEM_XMAS2012_COLDWIND]",0)
	CastSpell(npc,player,850491)
	AddBuff(player,504458,1,-1)
	Hide(npc)
	CallPlot(npc,"GEM_XMAS2012_Q1_STONE_SHOW",npc)
end

function Gem_Q2_test()
	local Npc = {102331, 102332, 102333, 102334, 102546, 102548, 102549, 102550, 102754, 102815}
	local NpcPool = {}
	local BoxPool = {}
	local  box = 110987
	local dis = 50
	local Player = OwnerID()
	local RoomID = ReadRoleValue(Player,EM_RoleValue_RoomID)
	local NumCount = 10
	BoxPool[0] = Lua_CreateObjByDir( Player , box , dis , 0)
	AddToPartition( BoxPool[0],RoomID)
	for Num=1,NumCount-1,1 do
		BoxPool[Num] = Lua_CreateObjByDir( BoxPool[Num-1] , box , dis+dis , 0)
		AddToPartition( BoxPool[Num],RoomID)
	end

--	for i=0,Num-1,1 do
--		NpcPool = table.remove(Npc,math.random(#Npc))
--		
--	end	
	sleep(20)
	for i=0,NumCount -1,1 do
		DelObj(BoxPool[i])
	end
end

function Lua_Qlada_a()
	AddBuff(OwnerID(),624222,0,-1)
end

function Lua_Qlada_b()
	AddBuff(OwnerID(),624223,0,-1)

end


function Lua_buff_test_and_A()
	AddBuff(OwnerID(),624223,0,-1)
	DebugMsg(0,0,"TRUE2")
	say(OwnerID(),"789")
end


function Lua_buff_test_and_b()
	say(OwnerID(),"456")
	DebugMsg(0,0,"TRUE")
	return true 
end


function Lua_buff_test_and_c()
	AddBuff(OwnerID(),623309,0,-1)
	say(OwnerID(),"123")
end

