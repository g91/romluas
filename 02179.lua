function kg_105039_05()	--小花出生時執行
--OwnerID 小花
--EM_RoleValue_Register1 小花"正在"被玩家綁定點選時為1
--EM_RoleValue_Register3  坦博莉的ID
--EM_RoleValue_Register8  玩家已經把小花點選完畢時為1
--EM_RoleValue_Register9 小花進入轉換的型態時為1
	local Flower = OwnerID()
	WriteRoleValue(Flower,EM_RoleValue_Register1,0)
	WriteRoleValue(Flower,EM_RoleValue_Register8,0)
	WriteRoleValue(Flower,EM_RoleValue_Register9,0)
	SetModeEx(Flower,EM_SetModeType_ShowRoleHead,TRUE)	--顯示頭像
	sleep(50)	--五秒後讓玩家可以點選
	SetPlot(Flower,"touch","kg_105039_06",30)
	BeginPlot(Flower,"kg_105039_08",0)
end

function kg_105039_06()	--小花被點選時執行
	local Flower = TargetID()
	local Player = OwnerID()
	if ReadRoleValue(Flower,EM_RoleValue_Register1)==0 then
		WriteRoleValue(Flower,EM_RoleValue_Register1, 1 )	--滑鼠點選後鎖定
		if BeginCastBarEvent( Player, Flower , "[SC_105039_02]", 15, ruFUSION_ACTORSTATE_CAST_BEGIN, ruFUSION_ACTORSTATE_CAST_END, 0 , "kg_105039_07")~=1 then
			ScriptMessage( Flower, Player, 0,"[SAY_NPC_BUSY]", 0 )
		end
	else
		ScriptMessage( Flower, Player, 0,"[SAY_NPC_BUSY]", 0 )
	end
end

function kg_105039_07(ObjID, CheckStatus)	--拾取施法條判定
--OwnerID 玩家
--TargetID 小花
	--DebugMsg(0,0,"Picking...")
	
	if CheckStatus >0  then	--施法條跑玩且小花沒有在形態轉換中就把小花刪除
		if  ReadRoleValue(TargetID(),EM_RoleValue_Register9)==0 then
	   		WriteRoleValue(TargetID(),EM_RoleValue_Register8,1)	--小花已被玩家拾取
	   		--DebugMsg(0,0,"Success!!")
	   		SysCastSpellLv(OwnerID(),TargetID(),492185,0)	--施放中斷技能
			EndCastBar(OwnerID(),CheckStatus)
			kg_105039_10(TargetID())
			DelObj(TargetID())
		else	--施法條跑完但是小花已經轉變了就提醒失敗
			--DebugMsg(0,0,"Fail....")
			WriteRoleValue(TargetID(),EM_RoleValue_Register1,0)
			EndCastBar(OwnerID(),CheckStatus)
		end
	elseif CheckStatus < 0 then	--拾取小花中被中斷
		--DebugMsg(0,0,"中斷....")
		WriteRoleValue(TargetID(),EM_RoleValue_Register1,0)
		EndCastBar(OwnerID(),CheckStatus)
	end
end

function kg_105039_08()	--小花AI
	local Flower = OwnerID()
	local ParentBoss = ReadRoleValue(Flower,EM_RoleValue_Register3)
	local badFlowerID = 105068	--腐敗的小花ID
	local badFlower
	local RoomID=ReadRoleValue(Flower,EM_RoleValue_RoomID)
	local timer = 0
	SysCastSpellLv(Flower,Flower,496643,0)	--在此為小花上亮光特效
	CastSpell(Flower,ParentBoss,496631)	--在此為Boss加上buff,5秒施法
	
	while 1 do
		AdjustFaceDir(Flower,ParentBoss,0)	--面對坦博莉
		if ReadRoleValue(ParentBoss,EM_RoleValue_IsDead)==1 or	--Boss死亡
		   CheckID(ParentBoss)==false 	--Boss不存在
		    or KS_InCombat(ParentBoss) ~= true then	--Boss離開戰鬥
			kg_105039_10()
			break
		elseif timer ==5 and ReadRoleValue(Flower,EM_RoleValue_Register8)==0 then	--假如玩家沒有把小花檢取
			WriteRoleValue(Flower,EM_RoleValue_Register9,1)	--小花進入轉換型態
			SysCastSpellLv(ParentBoss,ParentBoss,496702,0)	--施放子嗣之能
			badFlower= LuaFunc_CreateObjByObj(badFlowerID,Flower)	--產生腐敗的花
			SetModeEx( badFlower , EM_SetModeType_Strikback, false) ---反擊
			SetModeEx( badFlower , EM_SetModeType_Move, false) ---移動
			SetModeEx( badFlower , EM_SetModeType_Fight, false) ---可砍殺
			SetModeEx( badFlower , EM_SetModeType_Searchenemy, false)	--索敵
			SetModeEx( badFlower , EM_SetModeType_Revive, false)	--可重生
			WriteRoleValue(badFlower,EM_RoleValue_Register3,ParentBoss)	--將坦博莉ID放在壞小花的口袋3
			AddToPartition(badFlower,RoomID)
			SetPlot(badFlower,"dead","kg_105039_10",30)
			BeginPlot(badFlower,"kg_105039_09",0)
			DelObj(Flower)
			break
		end
		sleep(10)
		timer = timer+1
	end
	DelObj(Flower)
end

function kg_105039_09()	--腐敗的小花AI
--EM_RoleValue_Register3 坦博莉ID
	local badFlower = OwnerID()
	local ParentBoss = ReadRoleValue(badFlower,EM_RoleValue_Register3)
	local timer =0
	while 1 do
		if ReadRoleValue(ParentBoss,EM_RoleValue_IsDead)==1 or 
		   CheckID(ParentBoss)==false or
		   KS_InCombat(ParentBoss) ~= true then
			kg_105039_10()
			break
		elseif timer>2 then
			SetModeEx( badFlower , EM_SetModeType_Strikback, TRUE) ---反擊
			SetModeEx( badFlower , EM_SetModeType_Move, TRUE) ---移動
			SetModeEx( badFlower , EM_SetModeType_Fight, TRUE) ---可砍殺
			SetModeEx( badFlower , EM_SetModeType_Searchenemy, TRUE)	--索敵
		end
		sleep(10)
		timer = timer+1
	end
	DelObj(badFlower)
end


function kg_105039_10(FlowerGID)	--小花死亡時作的事情
	FlowerGID=FlowerGID or OwnerID()
	local ParentBoss = ReadRoleValue(FlowerGID,EM_RoleValue_Register3)	--讀取坦博莉ID
	local CurrectFlowerCount = ReadRoleValue(ParentBoss,EM_RoleValue_Register2)	--讀取當前小花數量
	CurrectFlowerCount = CurrectFlowerCount -1
	WriteRoleValue(ParentBoss,EM_RoleValue_Register2,CurrectFlowerCount)	--將小花數量減一並回存到坦博莉的第二個口袋
	DebugMsg(0,0,"There are "..CurrectFlowerCount.." flowers")
end