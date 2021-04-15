function UN_NORMALchiaAI_zone17()                        --BOSS AI
	bk_hacker_17_130_02()
    WriteRoleValue(OwnerID(),EM_RoleValue_register2,2)--BOSS要招喚圖騰的數量
	WriteRoleValue(OwnerID(),EM_RoleValue_register6,0)--打三跟圖騰BOSS隨機放一個玩家圖騰BUFF
	WriteRoleValue(OwnerID(),EM_RoleValue_register1,OwnerID())
    local AllTime = 0                              --主時間
	local locoTime = 0								--次技能時間
	local Check_pet = 0
	local Fightskill = {495545,495591}             --技能table.普攻技黑火+虛無之火
	local Ran
	local GameStart = 0                            --判斷戰鬥開始
	local TotemGroup = {}							--裝招喚圖騰的table
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local door = {104201,104202}					--前後門
	local totandie                                  --判斷圖騰是不是被打掉2根了
	local doorchick1								--前門
	local doorchick2								--後門
	local TargetPlayer = {}                    		--當前隨機目標
	local newboss									--重製的新BOSS
	local dim 
	local Sktalk = {"[SC_104140_01]","[SC_104140_02]","[SC_104140_03]","[SC_104140_04]","[SC_104140_05]","[SC_104140_06]",} 
																  --對話： 普攻:入侵者，嚐嚐我的憤怒之火。
                                                                  --吸取祭壇:
																  --狂爆:
																  --圖騰 
																  --死亡:
																  --人物滅團:
	doorchick2 = CreateObjByFlag( door[1] , 780714 , 1 , 1 )
	SetModeEx(doorchick2,EM_SetModeType_Mark, false)
	SetModeEx(doorchick2,EM_SetModeType_HideName, false)
	SetModeEx(doorchick2,EM_SetModeType_NotShowHPMP, false)
	SetModeEx(doorchick2,EM_SetModeType_Strikback, false)
	SetModeEx(doorchick2,EM_SetModeType_Move, false)
	SetModeEx(doorchick2,EM_SetModeType_Fight, false)
	SetModeEx(doorchick2,EM_SetModeType_Searchenemy, false)
	SetModeEx(doorchick2,EM_SetModeType_Obstruct, true)
	AddToPartition( doorchick2, RoomID)
	WriteRoleValue(doorchick2,EM_RoleValue_register1,doorchick2)
	WriteRoleValue(OwnerID(),EM_RoleValue_register5,doorchick2)
	SetPlot( OwnerID(),"dead","UN_NORMALchiaDead_zone17",0 )
	while true do
		sleep(10)
		if HateListCount(OwnerID()) ~=0 then
			GameStart = 1 
			AllTime = AllTime + 1	
			locoTime = locoTime +1 
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
			if ReadRoleValue(AttackTarget,EM_RoleValue_IsPlayer) ~= 1 and Check_pet == 0 then ---如果是非玩家進入戰鬥
				local Pet_owner = ReadRoleValue( AttackTarget ,EM_RoleValue_OwnerGUID )
				SetPosByFlag( Pet_owner , 780714, 3 )
				Check_pet = 1
			end
			if AllTime == 1 then
			----	BeginPlot( OwnerID() ,"bk_hacker_17_130_01",0)--------------------------------防駭客機制
				doorchick1 = CreateObjByFlag( door[2] , 780714 , 2 , 1 )
				SetModeEx(doorchick1,EM_SetModeType_Mark, false)
				SetModeEx(doorchick1,EM_SetModeType_HideName, false)
				SetModeEx(doorchick1,EM_SetModeType_NotShowHPMP, false)
				SetModeEx(doorchick1,EM_SetModeType_Strikback, false)
				SetModeEx(doorchick1,EM_SetModeType_Move, false)
				SetModeEx(doorchick1,EM_SetModeType_Fight, false)
				SetModeEx(doorchick1,EM_SetModeType_Searchenemy, false)
				SetModeEx(doorchick1,EM_SetModeType_Obstruct, true)
				AddToPartition( doorchick1, RoomID)
				WriteRoleValue(doorchick1,EM_RoleValue_register1,OwnerID())
			end
			totandie = ReadRoleValue(OwnerID(),EM_RoleValue_register6)
			if totandie ==2 then
				TargetPlayer = Lua_RandomPlayerFromHateList(OwnerID(),1)
				Addbuff(TargetPlayer[1],507241,0,30)
				WriteRoleValue(OwnerID(),EM_RoleValue_register6,0)
			end
			if locoTime%21==0 then
				--BeginPlot(OwnerID(),"UN_weapen1_zone17",0)            --招換圖騰
				ScriptMessage( OwnerID(), -1 , 2 , Sktalk[4] , 2 )
				TotemGroup = UN_NORMALweapen1_zone17(OwnerID(),TotemGroup) 
				WriteRoleValue(OwnerID(),EM_RoleValue_register6,0)
				sleep(10)
			elseif Alltime%7  == 0 then
				Ran = DW_rand(2)
				ScriptMessage( OwnerID(), -1 , 2 , Sktalk[1] , 2 )
				CastSpellLv(OwnerID(),OwnerID(),Fightskill[Ran],17) --隨機放普攻招式2選1
				sleep(20)
			elseif Alltime >=480 then	
				ScriptMessage( OwnerID(), -1 , 2 , Sktalk[3] , 2 )
				AddBuff( OwnerID(),507364,0 ,-1 )                   --狂爆
			end
			if locoTime%31 == 0 then
				BeginPlot(OwnerID(),"UN_NORMALjeten_zone17",0)           --吸取祭壇
				sleep(10)
				locoTime = 0
			end
		elseif  HateListCount(OwnerID()) == 0 and GameStart == 1 then  --玩家滅團把該歸零的歸0
			if ReadRoleValue( OwnerID(), EM_RoleValue_IsDead)==0 then
				GameStart = 0
				AllTime = 0 
				locoTime = 0
				dim = ReadRoleValue(OwnerID(),EM_RoleValue_register8)
					if CheckID(dim) == true then
						DelObj(dim)
					end
				WriteRoleValue(OwnerID(),EM_RoleValue_register2,3)
				WriteRoleValue(OwnerID(),EM_RoleValue_register6,0)
				CancelBuff(OwnerID(),507430)
				ScriptMessage( OwnerID(), -1 , 2 , Sktalk[6] , 2 )
				for i = 1 ,table.getn(TotemGroup) do                   --刪除圖騰用
					if CheckID(TotemGroup[i]) == true then
						DelObj(TotemGroup[i])
					end	
				end
				if CheckID(doorchick1) == true then
						DelObj(doorchick1)
				end
				Delobj(doorchick2)
				newboss= CreateObjByFlag( 103946 , 780704 , 0 , 1 )
				AddToPartition(newboss, RoomID)
				delobj(OwnerID())
			elseif ReadRoleValue(OwnerID(), EM_RoleValue_IsDead)==1 then  --kill掉不重生
					if CheckID(dim) == true then
						DelObj(dim)
					end
				break	   
			end	 
		end
    end
end

function UN_NORMALchiaDead_zone17()    --BOSS死亡劇情
	local x = ReadRoleValue(OwnerID(),EM_RoleValue_register5)
	ScriptMessage( OwnerID(), -1 , 2 ,"[SC_104140_05]", 2 )
	DelObj(x)                                                      --刪除門
end
-----------------------------------------------------------------------------------------------------****
                                            --招換圖騰
-----------------------------------------------------------------------------------------------------****
function UN_NORMALweapen1_zone17(Boss,TotemGroup)                                 --招喚圖騰+收圖騰
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local person = ReadRoleValue(Boss,EM_RoleValue_register2)  --招喚圖騰數量
	local TargetPlayer = {} --= Lua_RandomPlayerFromHateList(person)    --取得仇恨列表隨機玩家?人-TargetPlayer陣列
	local weapen = {103950,104347,104348}                        --三種圖騰陣列-*-*-*---*-*-*-*-*-*-*-*-*填新編號
	local skill1 = {}    	--產生出來的圖騰用的陣列
	local Skill2 = {}
	local X
	local rany
	local y = person - 1 
	Skill2 = SearchRangeNPC ( OwnerID() , 500 )	
	for i=0 , table.getn(skill2) do
		for j=1,table.getn(TotemGroup) do
			if	skill2[i] == TotemGroup[j] then
				DelObj(TotemGroup[j])
				SysCastSpellLv(OwnerID(),OwnerID(),495996,0) --全體-10%HP
			end	
		end		
	end
	
	sleep(20)
	AddBuff(OwnerID(),507430,y ,-1)
    for i = 1 ,person do                   --table.getn(TargetPlayer)取得TargetPlayer最大值
		--TargetPlayer = Lua_RandomPlayerFromHateList(OwnerID(),1)
		--LuaFunc_CreateObjByObj ( weapen[i] , TargetPlayer[i])	 --讀取TargetPlayer位子產生圖騰
		X = dw_rand(3)
		rany = dw_rand(34)
		skill1[i] = CreateObjByFlag(weapen[X] , 780715 , rany , 1 )
		--skill1[i] = LuaFunc_CreateObjByObj ( weapen[X] , TargetPlayer[1])
		WriteRoleValue(skill1[i],EM_RoleValue_register1,Boss)
		WriteRoleValue(skill1[i],EM_RoleValue_register6,Boss)
		SetModeEx(skill1[i], EM_SetModeType_Move, false)         --圖騰不移動
		AddToPartition(skill1[i], RoomID)
	end
	return skill1
end
---------------------------------------------------------------------------------------------------****
                                                       --圖騰&祭壇
---------------------------------------------------------------------------------------------------****
function UN_NORMALjeten_zone17()                                 --吸收祭壇
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local TempX
	local TempY =ReadRoleValue(OwnerID(),EM_RoleValue_register2)
	local rany
	local BossHP = ReadRoleValue(OwnerID(),EM_RoleValue_HP)
    --TempX = CreateObjByFlag( 104153 , 780704 , 1 , 1 )  --產生祭壇，FlagObjID=旗子代號
	rany = dw_rand(34)
	TempX = CreateObjByFlag(104153 , 780715 , rany , 1 )
	SetModeEx(TempX,EM_SetModeType_Fight,false)
	SetModeEx(TempX,EM_SetModeType_Move, false)
	WriteRoleValue(OwnerID(),EM_RoleValue_register8,TempX)
	AddToPartition(TempX,RoomID)
	Addbuff(TempX,507247,0,-1)
	WriteRoleValue(TempX,EM_RoleValue_register2, 0)
	sleep(60)                                              --等待5秒
	local jetenhp = ReadRoleValue(TempX, EM_RoleValue_IsDead)

	if jetenhp == 0 then
		if TempY < 7 then
			WriteRoleValue(OwnerID(),EM_RoleValue_register2, TempY + 1)   --register2+1 = 招換圖騰數量+1
		end
		ScriptMessage( OwnerID(), -1 , 2 ,"[SC_104140_02]" , 2 )
		DelObj( TempX )                                                               --刪除祭壇
	elseif 	BossHP>=260000 then
		SysCastSpellLv(OwnerID(),OwnerID(),496112,1)
	end
end