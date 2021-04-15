-----------------觸碰奇妙石塊

function LuaS_422742_0()----觸碰劇情
		SetPlot( OwnerID() , "touch" , "LuaS_422742_1" , 40 )
end
function LuaS_422742_1()----檢查有無任務 有無BUFF
         if (CheckAcceptQuest(OwnerID(),422742)==true )and    (CheckFlag(OwnerID(), 543334) == false)    and   (CheckBuff( OwnerID(),504706)==true  ) then
             BeginPlot( OwnerID(), "LuaS_422742_2", 0)
------ 	sleep(20)
	BeginPlot( TargetID(),  "LuaS_422742_kk", 0)
         else
         ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_422742_KK]", 0 )
         end
end

function LuaS_422742_Busy()
	ScriptMessage( OwnerID(),OwnerID(),0, "[SC_422742_KK]", 0 )---魔法柱充能中，無法開啟.......
	ScriptMessage( OwnerID(),OwnerID(),1, "[SC_422742_KK]", 0 )---	
end

function LuaS_422742_kk()----在奇妙石塊身上跑檢查劇情
 	SetPlot( OwnerID(), "touch", "LuaS_422742_Busy", 40)
	sleep(20)
	local FF = LuaFunc_SearchNPCbyOrgID( OwnerID() ,102673 ,500 )
	local TT = LuaFunc_SearchNPCbyOrgID( OwnerID() ,102674 ,500 )
	While 1 do
		if CheckID(FF) == false and CheckID(TT) == false then	--如果那兩隻不在場上	
			SetPlot( OwnerID() , "touch" , "LuaS_422742_1" , 40 )	--解除石柱的鎖定
			--LuaFunc_ResetObj( OwnerID() )
			break	--跳出迴圈
		end
		if CheckID(TargetID()) == false or ReadRoleValue(TargetID() , EM_RoleValue_IsDead) == 1 or ReadRoleValue(TargetID() , EM_RoleValue_IsNPC) == 1 then	--如果玩家不在場上
			SetPlot( OwnerID() , "touch" , "LuaS_422742_1" , 40 )	--解除石柱的鎖定
			--LuaFunc_ResetObj( OwnerID() )
			if CheckID(FF) == true then
				Delobj(FF)
			end
			if CheckID(TT) == true then
				Delobj(TT)
			end

			break	--跳出迴圈
		end
		sleep( 20 )	--迴圈檢查間隔時間
	end
End


function LuaS_422742_2()----在旗子的地方 出生  437 兩隻113511  113512----if CheckBuff( OwnerID(),504706)==0-----判斷有沒有BUFF  有BUFF的話就繼續下一段SCRIPT 如果沒有BUFF的話就改變政營 攻擊玩家
	local EE = Lua_DW_CreateObj("flag",113568,780437, 0 )
	local FF = Lua_DW_CreateObj("flag",113568,780437, 1 )
	CastSpell( EE, EE,  491276)  
	CastSpell( FF,  FF,  491276)
	sleep(35)  
	local CC = Lua_DW_CreateObj("flag",102673,780437, 0 )
	local TT = Lua_DW_CreateObj("flag",102674,780437, 1 )
	DelObj(EE)
	DelObj(FF)
	--CastSpell( CC,CC,490100)  
	--CastSpell( TT,TT,490100)  
	DisableQuest( CC , true )
	DisableQuest( TT , true )                
        	if	CheckBuff(OwnerID(),504706)==false	then
		SAY(CC,"[SC_422742_17]")
		SAY(TT,"[SC_422742_17]")
		SetRoleCamp(CC,"Monster")
		SetRoleCamp(TT,"Monster")
		SetAttack(CC, OwnerID())
		SetAttack(TT, OwnerID())
		CallPlot(CC,"LuaFunc_Obj_Suicide",60)
		CallPlot(TT,"LuaFunc_Obj_Suicide",60)
		return
	end
 	BeginPlot(CC,"LuaS_422742_3",0)
 	BeginPlot(TT,"LuaS_422742_4",0)

	while	(ReadRoleValue(CC,EM_RoleValue_PID)==0) or (ReadRoleValue(TT,EM_RoleValue_PID)==0)	do
		sleep(10)
		if	CheckBuff(OwnerID(),504706)==false	then
			SAY(CC,"[SC_422742_17]")
		          	SAY(TT,"[SC_422742_17]")
			SetRoleCamp(CC,"Monster")
			SetRoleCamp(TT,"Monster")
			SetAttack(TT, OwnerID())
			SetAttack(CC, OwnerID())
			CallPlot(CC,"LuaFunc_Obj_Suicide",60)
			CallPlot(TT,"LuaFunc_Obj_Suicide",60)
					return
			end
		end


	Say(TT,"[SC_422742_2]")----[113442]，我的父親還好嗎？
		--PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
		for	i=1,3,1	do---
			sleep(10)
			if	CheckBuff(OwnerID(),504706)==false	then
				SAY(CC,"[SC_422742_17]")
		          		SAY(TT,"[SC_422742_17]")
				SetRoleCamp(CC,"Monster")
				SetRoleCamp(TT,"Monster")
				SetAttack(TT, OwnerID())
				SetAttack(CC, OwnerID())
				CallPlot(CC,"LuaFunc_Obj_Suicide",60)
				CallPlot(TT,"LuaFunc_Obj_Suicide",60)
				return
			end
		end
         	Say(TT,"[SC_422742_3]")----自從上次你說他病了，我就一直擔心著他……
		for  i=1,4,1	do
			sleep(10)
			if	CheckBuff(OwnerID(),504706)==false	then
				SAY(CC,"[SC_422742_17]")
		          		SAY(TT,"[SC_422742_17]")
				SetRoleCamp(CC,"Monster")
				SetRoleCamp(TT,"Monster")
				SetAttack(TT, OwnerID())
				SetAttack(CC, OwnerID())
				CallPlot(CC,"LuaFunc_Obj_Suicide",60)
				CallPlot(TT,"LuaFunc_Obj_Suicide",60)
				return
			end
		end
	PlayMotion( CC,ruFUSION_ACTORSTATE_BUFF_SP01)
	Say(CC,"[SC_422742_4]")----閉嘴，艾傑爾！我們可不是為了你的敘舊而來的！
		for  i=1,3,1	do
			sleep(10)
			if	CheckBuff(OwnerID(),504706)==false	then
				SAY(CC,"[SC_422742_17]")
		          		SAY(TT,"[SC_422742_17]")
				SetRoleCamp(CC,"Monster")
				SetRoleCamp(TT,"Monster")
				SetAttack(TT, OwnerID())
				SetAttack(CC, OwnerID())
				CallPlot(CC,"LuaFunc_Obj_Suicide",60)
				CallPlot(TT,"LuaFunc_Obj_Suicide",60)
				return
			end
		end
	PlayMotion( CC,ruFUSION_ACTORSTATE_EMOTE_APPROVAL)
	Say(CC,"[SC_422742_5]")---[113442]？事情都辦好了嗎? 
		for  i=1,4,1	do
			sleep(10)
			if	CheckBuff(OwnerID(),504706)==false	then
				SAY(CC,"[SC_422742_17]")
		          		SAY(TT,"[SC_422742_17]")
				SetRoleCamp(CC,"Monster")
				SetRoleCamp(TT,"Monster")
				SetAttack(TT, OwnerID())
				SetAttack(CC, OwnerID())
				CallPlot(CC,"LuaFunc_Obj_Suicide",60)
				CallPlot(TT,"LuaFunc_Obj_Suicide",60)
				return
			end
		end
	PlayMotion( TT,ruFUSION_ACTORSTATE_EMOTE_IDLE2)
	PlayMotion( CC,ruFUSION_ACTORSTATE_EMOTE_POINT)
	Say(CC,"[SC_422742_6]")----就是讓[ZONE_DIMARKA]的村民與那群不知死活的士兵起衝突的事呀！
		for  i=1,3,1	do
			sleep(10)
			if	CheckBuff(OwnerID(),504706)==false	then
				SAY(CC,"[SC_422742_17]")
		          		SAY(TT,"[SC_422742_17]")
				SetRoleCamp(CC,"Monster")
				SetRoleCamp(TT,"Monster")
				SetAttack(TT, OwnerID())
				SetAttack(CC, OwnerID())
				CallPlot(CC,"LuaFunc_Obj_Suicide",60)
				CallPlot(TT,"LuaFunc_Obj_Suicide",60)
				return
			end
		end
	PlayMotion( TT,ruFUSION_ACTORSTATE_EMOTE_IDLE)
	Say(CC,"[SC_422742_7]")----別和我裝蒜！否則你召喚我們過來要做什麼？
		for  i=1,3,1	do
				sleep(10)
			if	CheckBuff(OwnerID(),504706)==false	then
				SAY(CC,"[SC_422742_17]")
		          		SAY(TT,"[SC_422742_17]")
				SetRoleCamp(CC,"Monster")
				SetRoleCamp(TT,"Monster")
				SetAttack(TT, OwnerID())
				SetAttack(CC, OwnerID())
				CallPlot(CC,"LuaFunc_Obj_Suicide",60)
				CallPlot(TT,"LuaFunc_Obj_Suicide",60)
				return
			end
		end
	PlayMotion( TT,ruFUSION_ACTORSTATE_EMOTE_IDLE2)
	PlayMotion( CC,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Say(CC,"[SC_422742_8]")----上面的人可是很期待你這次拿回的[ZONE_DIMARKA]的人骨。
		for  i=1,4,1	do
				sleep(10)
			if	CheckBuff(OwnerID(),504706)==false	then
				SAY(CC,"[SC_422742_17]")
		          		SAY(TT,"[SC_422742_17]")
				SetRoleCamp(CC,"Monster")
				SetRoleCamp(TT,"Monster")
				SetAttack(TT, OwnerID())
				SetAttack(CC, OwnerID())
				CallPlot(CC,"LuaFunc_Obj_Suicide",60)
				CallPlot(TT,"LuaFunc_Obj_Suicide",60)
				return
			end
		end
	PlayMotion( CC,ruFUSION_ACTORSTATE_EMOTE_LAUGH)
	Say(CC,"[SC_422742_9]")----那些東西和[ZONE_DIMARKA]的村民，都是不錯的實驗體！你說對吧？艾傑爾？
		for  i=1,3,1	do
				sleep(10)
			if	CheckBuff(OwnerID(),504706)==false	then
				SAY(CC,"[SC_422742_17]")
		          		SAY(TT,"[SC_422742_17]")
				SetRoleCamp(CC,"Monster")
				SetRoleCamp(TT,"Monster")
				SetAttack(TT, OwnerID())
				SetAttack(CC, OwnerID())
				CallPlot(CC,"LuaFunc_Obj_Suicide",60)
				CallPlot(TT,"LuaFunc_Obj_Suicide",60)
				return
			end
		end
	PlayMotion( TT,ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)
	Say(TT,"[SC_422742_10]")----不，我.......
		for  i=1,3,1	do
			sleep(10)
			if	CheckBuff(OwnerID(),504706)==false	then
				SAY(CC,"[SC_422742_17]")
		          		SAY(TT,"[SC_422742_17]")
				SetRoleCamp(CC,"Monster")
				SetRoleCamp(TT,"Monster")
				SetAttack(TT, OwnerID())
				SetAttack(CC, OwnerID())
				CallPlot(CC,"LuaFunc_Obj_Suicide",60)
				CallPlot(TT,"LuaFunc_Obj_Suicide",60)
				return
			end
		end
	Say(CC,"[SC_422742_11]")----嘖！沒用的傢伙！竟然還在戀棧以往。
		for  i=1,3,1	do
			sleep(10)
			if	CheckBuff(OwnerID(),504706)==false	then
				SAY(CC,"[SC_422742_17]")
		          		SAY(TT,"[SC_422742_17]")
				SetRoleCamp(CC,"Monster")
				SetRoleCamp(TT,"Monster")
				SetAttack(TT, OwnerID())
				SetAttack(CC, OwnerID())
				CallPlot(CC,"LuaFunc_Obj_Suicide",60)
				CallPlot(TT,"LuaFunc_Obj_Suicide",60)
				return
			end
	PlayMotion( CC,ruFUSION_ACTORSTATE_BUFF_SP01)
	Say(CC,"[SC_422742_12]")---算了！不說這些了！[113442]，快把東西給我吧！
		for  i=1,4,1	do
			sleep(10)
			if	CheckBuff(OwnerID(),504706)==false	then
				SAY(CC,"[SC_422742_17]")
		          		SAY(TT,"[SC_422742_17]")
				SetRoleCamp(CC,"Monster")
				SetRoleCamp(TT,"Monster")
				SetAttack(TT, OwnerID())
				SetAttack(CC, OwnerID())
				CallPlot(CC,"LuaFunc_Obj_Suicide",60)
				CallPlot(TT,"LuaFunc_Obj_Suicide",60)
				return
			end
		end
	 Say(CC,"[SC_422742_13]")----趕快給我，我們可以儘早做出更多的瑪卡斯魔獸呀！
		for  i=1,3,1      do
			sleep(10)
			if	CheckBuff(OwnerID(),504706)==false	then
				SAY(CC,"[SC_422742_17]")
		          		SAY(TT,"[SC_422742_17]")
				SetRoleCamp(CC,"Monster")
				SetRoleCamp(TT,"Monster")
				SetAttack(TT, OwnerID())
				SetAttack(CC, OwnerID())
				CallPlot(CC,"LuaFunc_Obj_Suicide",60)
				CallPlot(TT,"LuaFunc_Obj_Suicide",60)
				return
			end
		end
	Say(CC,"[SC_422742_14]")----快點給我！我可是很期待挫挫那些蛇人的銳氣！
		for  i=1,3,1	do
			sleep(10)
			if	CheckBuff(OwnerID(),504706)==false	then
				SAY(CC,"[SC_422742_17]")
		          		SAY(TT,"[SC_422742_17]")
				SetRoleCamp(CC,"Monster")
				SetRoleCamp(TT,"Monster")
				SetAttack(TT, OwnerID())
				SetAttack(CC, OwnerID())
				CallPlot(CC,"LuaFunc_Obj_Suicide",60)
				CallPlot(TT,"LuaFunc_Obj_Suicide",60)
				return
			end
		end
	PlayMotion( TT,ruFUSION_ACTORSTATE_SHIELD_BASH)
	 Say(TT,"[SC_422742_15]")----不對！他不是[113442]！他的身上沒有傳來[113442]特有的味道！
		for  i=1,3,1	do
			sleep(10)
			if	CheckBuff(OwnerID(),504706)==false	then
				SAY(CC,"[SC_422742_17]")
		          		SAY(TT,"[SC_422742_17]")
				SetRoleCamp(CC,"Monster")
				SetRoleCamp(TT,"Monster")
				SetAttack(TT, OwnerID())
				SetAttack(CC, OwnerID())
				CallPlot(CC,"LuaFunc_Obj_Suicide",60)
				CallPlot(TT,"LuaFunc_Obj_Suicide",60)
				return
			end
		end
	Say(CC,"[SC_422742_16]")----你......你究竟是誰！
		for  i=1,3,1	do
			sleep(10)
			if	CheckBuff(OwnerID(),504706)==false	then
				SAY(CC,"[SC_422742_17]")
		          		SAY(TT,"[SC_422742_17]")
				SetRoleCamp(CC,"Monster")
				SetRoleCamp(TT,"Monster")
				SetAttack(TT, OwnerID())
				SetAttack(CC, OwnerID())
				CallPlot(CC,"LuaFunc_Obj_Suicide",60)
				CallPlot(TT,"LuaFunc_Obj_Suicide",60)
				return
			end
		end
	 Setflag(OwnerID(),543334,1)
	 CancelBuff(OwnerID(),504706)
		while	true	do
			sleep(10)
			if	CheckBuff(OwnerID(),504706)==false	then
				SAY(CC,"[SC_422742_17]")
		          		SAY(TT,"[SC_422742_17]")
				SetRoleCamp(CC,"Monster")
				SetRoleCamp(TT,"Monster")
				SetAttack(TT, OwnerID())
				SetAttack(CC, OwnerID())
				CallPlot(CC,"LuaFunc_Obj_Suicide",60)
				CallPlot(TT,"LuaFunc_Obj_Suicide",60)
				return
			end
		end
end
end





function LuaS_422742_3()--執行移動劇情(此劇情為迴圈 未達目的不會向下執行)

	DW_MoveToFlag( OwnerID(),780437,2,0 ,1 )
	--FaceObj( OwnerID(), TargetID() )
	AdjustFaceDir( OwnerID(), TargetID(), 0 )

	WriteRoleValue(OwnerID(),EM_RoleValue_PID,1)

end

function LuaS_422742_4()--執行移動劇情(此劇情為迴圈 未達目的不會向下執行)
	DW_MoveToFlag( OwnerID(),780437,3,0,1 )
	--FaceObj( OwnerID(), TargetID() )
	AdjustFaceDir( OwnerID(), TargetID(), 0 )
	WriteRoleValue(OwnerID(),EM_RoleValue_PID,1)

end

----------------------------------
function LuaI_422742_Check()----變身尤米多葛

	if CheckBuff( OwnerID() , 504706 ) == true then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422704_01]" , 0 ) --偽裝斗篷客中。小心！別敗露行跡。
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422704_01]" , 0 ) 
		return false
	end

	if ReadRoleValue( OwnerID() , EM_RoleValue_IsAttackMode ) ~= 0 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_205426_1]" , 0 ) --戰鬥中
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_205426_1]" , 0 ) 
		return false
	end

	if	Lua_ObjAreaCheck(OwnerID() , 715 ) ==false then-----715
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_422704_02]", 0 ) --你只能在[ZONE_DIMARKA]使用！
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422704_02]", 0 )
		return false
	end

	return true
end

function LuaM_422742_0() --變身斗篷客的偵測地點

	if	Lua_ObjAreaCheck(OwnerID() , 715) ==false then--------檢查限定某個區域---715
		CancelBuff( OwnerID() , 504706 )
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_422704_02]", 0 ) --你只能在[ZONE_DIMARKA]使用！
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422704_02]", 0 )
	end
end
