
function LuaS_420743_delete( ItemID , ItemNum  )
	if ( DelBodyItem ( OwnerID() , ItemID , ItemNum ) ) then				
		CastSpell( TargetID(), OwnerID(), 493155)
		return true
	else
		return false
	end
end


function LuaS_420744_start()
	DisableQuest( OwnerID() , true )--鎖隊長任務
	local captain = OwnerID()--記下隊長id
	local player = TargetID()--記下玩家id
	local npc = CreateObj(110914 , -13997 , -159 , 8388 , 0 , 1)--創造黑曜石使者
	AddToPartition( npc ,    0 ) 
	MoveToFlagEnabled( npc  , false )--關閉巡邏劇情
	local s = 0--讓黑曜石走到隊長那邊
	local f = 0
	local fc = GetMoveFlagCount( 780077)-1--黑曜石旗標
	while 1 do
		local fx = GetMoveFlagValue( 780077, f , EM_RoleValue_X)
		local fy = GetMoveFlagValue( 780077, f , EM_RoleValue_Y)
		local fz = GetMoveFlagValue( 780077, f , EM_RoleValue_Z)

		local gx = ReadRoleValue( npc , EM_RoleValue_X)
		local gy = ReadRoleValue( npc , EM_RoleValue_Y)
		local gz = ReadRoleValue( npc , EM_RoleValue_Z)

		if s > 60000 then
			break
		else
			s=s+1
		end

		if fx/10 == gx/10 and fz/10 == gz/10 then
			if fc == f then
				break
			else
				f = f + 1
			end
		else	
			Move ( npc , fx , fy , fz  )
			WriteRoleValue( npc  ,EM_RoleValue_IsWalk , 0  )
		end
		Sleep(7)
	end
	AdjustFaceDir( captain , npc , 0 )
	Say( captain , GetString("SAY_420774_0" ))--你好，黑曜石的使者，很高興見到你
	Sleep(20)
	Say( npc ,GetString("SAY_420774_1"))--我也是，英勇的隊長。
	Sleep(20)
	Say( captain ,GetString("SAY_420774_2"))--那就讓...嗯？
	
	local archer = CreateObj( 110916 , -14353 , -172 ,  8555 , 0 , 1 )--種出斥候
	AddToPartition( archer ,    0 ) 
	MoveToFlagEnabled( archer , false )--關閉巡邏劇情
	local s = 0--讓斥候跑向隊長
	local f = 0
	local fc = GetMoveFlagCount( 780078)-1
	while 1 do
		local fx = GetMoveFlagValue( 780078, f , EM_RoleValue_X)
		local fy = GetMoveFlagValue( 780078, f , EM_RoleValue_Y)
		local fz = GetMoveFlagValue( 780078, f , EM_RoleValue_Z)

		local gx = ReadRoleValue( archer , EM_RoleValue_X)
		local gy = ReadRoleValue( archer , EM_RoleValue_Y)
		local gz = ReadRoleValue( archer , EM_RoleValue_Z)

		if s > 60000 then
			break
		else
			s=s+1
		end

		if fx/10 == gx/10 and fz/10 == gz/10 then
			if fc == f then
				break
			else
				f = f + 1
			end
		else
			WriteRoleValue( archer  ,EM_RoleValue_IsWalk , 0  )--用跑的	
			Move ( archer ,  fx , fy , fz  )
		end
		Sleep(2)
	end
	AdjustFaceDir( captain , archer , 0 )
	Say ( archer , GetString("SAY_420774_3"))	--隊長！巡視者往這裡來了！
	Sleep(13)
	Say(  captain  , GetString("SAY_420774_4"))--什麼！糟了，使者麻煩你先躺著裝死，而你就先躲在箱子裡。
	AdjustFaceDir( captain , npc  , 0 )

	PlayMotionEX( npc, ruFUSION_ACTORSTATE_SLEEP_BEGIN,ruFUSION_ACTORSTATE_SLEEP_LOOP)--讓黑曜石使者躺下
	CastSpell( captain, player , 491202 )--改變玩家成箱子
	Sleep(10)
	local fong = CreateObj ( 110920 , -14353 , -172 ,  8555 , 0  ,  1)	--種出風野巡視者
	AddToPartition( fong ,    0 ) 
	MoveToFlagEnabled( fong , false )--關閉巡邏劇情
	local s = 0--讓巡視者跑向玩家
	local f = 0
	local fc = GetMoveFlagCount( 780078)-2
	while 1 do
		local fx = GetMoveFlagValue( 780078, f , EM_RoleValue_X)
		local fy = GetMoveFlagValue( 780078, f , EM_RoleValue_Y)
		local fz = GetMoveFlagValue( 780078, f , EM_RoleValue_Z)

		local gx = ReadRoleValue( fong , EM_RoleValue_X)
		local gy = ReadRoleValue( fong , EM_RoleValue_Y)
		local gz = ReadRoleValue( fong , EM_RoleValue_Z)

		if s > 60000 then
			break
		else
			s=s+1
		end

		if fx/10 == gx/10 and fz/10 == gz/10 then
			if fc == f then
				break
			else
				f = f + 1
			end
		else
			WriteRoleValue( fong  ,EM_RoleValue_IsWalk , 0  )--用跑的	
			Move ( fong ,  fx , fy , fz  )
		end
		Sleep(2)
	end
	AdjustFaceDir( captain , fong , 0 )
	Say( fong , GetString("SAY_420774_5"))--黑曜石的混帳在哪裡？
	Sleep(13)
	Say( captain ,GetString("SAY_420774_6"))--可惜！你來晚了一步，這個黑曜石狗是我殺的！希望你不要向酋長亂報搶我功勞啊。
	Sleep(20)
	Say( fong ,GetString("SAY_420774_7"))--你...？奇怪！剛剛那個人明明說你們私自與黑曜...
	Sleep(13)
	Say( captain ,GetString("SAY_420774_8"))--你胡說什麼！你污辱我的榮譽是要和我決鬥嗎？！
	Sleep(20)
	Say( fong , GetString("SAY_420774_10"))--可惡！那個胡亂報告的人就不要被我抓到...
	local s = 0--讓巡視者跑回去
	local fc = GetMoveFlagCount( 780078)-1
	while 1 do
		local fx = GetMoveFlagValue( 780078, f , EM_RoleValue_X)
		local fy = GetMoveFlagValue( 780078, f , EM_RoleValue_Y)
		local fz = GetMoveFlagValue( 780078, f , EM_RoleValue_Z)

		local gx = ReadRoleValue( fong , EM_RoleValue_X)
		local gy = ReadRoleValue( fong , EM_RoleValue_Y)
		local gz = ReadRoleValue( fong , EM_RoleValue_Z)

		if s > 60000 then
			break
		else
			s=s+1
		end

		if fx/10 == gx/10 and fz/10 == gz/10 then			
			if f == 0 then
				break
			else
				f = f - 1
			end
		else
			WriteRoleValue( fong  ,EM_RoleValue_IsWalk , 0  )--用跑的	
			Move ( fong ,  fx , fy , fz  )
		end
		Sleep(2)
	end
	DelObj(fong )
	AdjustFaceDir( captain , npc  , 0 )
	Say( captain ,GetString("SAY_420774_11"))--沒事了，使者先生起來吧
	Sleep(20)
	PlayMotion( npc , ruFUSION_ACTORSTATE_SLEEP_END)
	Sleep(20)
	Say( captain  ,GetString("SAY_420774_12"))--那麼就讓我手下的斥候領你去卡沙喀吧
	Sleep(20)
	Say( archer  ,GetString("SAY_420774_13"))--遵命。使者大人請隨我來。
	Sleep (15)
	Say ( npc , GetString("SAY_420774_14"))--我們後會有期，英勇的隊長。
	Sleep(10)
	DelObj(archer)
	DelObj(npc)
	AdjustFaceDir( captain , player  , 0 )
	Sleep(20)

	Say ( captain , GetString("SAY_420774_15"))--你也可以出來了，已經不用躲了！
	CancelBuff( player , 501599 )--把玩家變回來
	SetFlag( player , 540859 , 1 )--給玩家重要物品
	DisableQuest( captain  , false )
end

