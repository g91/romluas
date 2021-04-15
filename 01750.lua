function Lua_Hao_DanceItem00() -- 完美演出
	BeginPlot( OwnerID() , "Lua_Hao_DanceItem01" , 0 )
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_DanceItem01() -- 進入戰鬥、位移、騎乘狀態無法使用。 有Buff的人擋掉，變身的時候。播放中上馬要擋掉

	local Buff = { 506168 , 506169 , 505583 }
	local Count = BuffCount ( OwnerID())
	local BuffID , Fight , Check , Live , X , Y , Z , NewX , NewY , NewZ
	X = ReadRoleValue( OwnerID() , EM_RoleValue_X )
	Y = ReadRoleValue( OwnerID() , EM_RoleValue_Y )
	Z = ReadRoleValue( OwnerID() , EM_RoleValue_Z )	
	Fight = ReadRoleValue( OwnerID() , EM_RoleValue_IsAttackMode ) -- 判別是否戰鬥中
					say( OwnerID() , "X "..X ) 
					say( OwnerID() , "Y "..Y )	
					say( OwnerID() , "Z "..Z )
	sleep(5)
	if Fight == 0 or CheckBuff( OwnerID() , Buff[1] ) == false then
		for i = 0 , Count , 1 do
			BuffID = BuffInfo( OwnerID() , i , EM_BuffInfoType_BuffID ) -- 判別目標Buff
			Check = GameObjInfo_int( BuffID , "AssistType" ) -- 確認  58 變身、68 坐騎、120 非商城變身 --抓取法術的輔助類型
			NewX = ReadRoleValue( OwnerID() , EM_RoleValue_X )
			NewY = ReadRoleValue( OwnerID() , EM_RoleValue_Y )
			NewZ = ReadRoleValue( OwnerID() , EM_RoleValue_Z )
--			say( OwnerID() , "Owner ="..Check )
			if Check == 58 or Check == 68 or Check == 120 or X ~= NewX or Y ~= NewY or Z ~= NewZ then
--			 	AttachCastMotionTool( OwnerID() , 212076 )  --置換武器為空手
--				PlaySoundToPlayer( OwnerID() , " ", false )  -- 播放空的音效
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_FUNNY_ITEM_00]" , C_SYSTEM ) -- 無法使用該物品。
				break
			else
				BeginPlot( OwnerID() , "Lua_Hao_DanceItem03" , 0 )
			end
		end
	else
		say( OwnerID() , " Usewell " )-- 使用者本身
		return false
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_DanceItem02()

	local Player = SearchRangePlayer ( TargetID() , 100 ) --將附近玩家取成陣列
--	say( OwnerID() , "OwnerID = 1" )-- 使用者本身
--	say( TargetID() , "TargetID = 2 " ) -- 使用者本身

	for i=0 , table.getn(Player) , 1 do
		local BuffID = BuffInfo ( Player[i] , i , EM_BuffInfoType_BuffID )
		local Check = GameObjInfo_int ( BuffID , "AssistType" ) -- 確認  58 變身、68 坐騎、120 非商城變身 --抓取法術的輔助類型
		local Spell = ReadRoleValue( Player[i] , EM_RoleValue_SpellMagicID )
		local UseItem = ReadRoleValue( Player[i] , EM_RoleValue_CastingType )	-- -1 為初始值、0為有施法條狀態
		local Fight = ReadRoleValue( Player[i] , EM_RoleValue_IsAttackMode )
		local Live = ReadRoleValue( Player[i] , EM_RoleValue_IsDead)
--		say( Player[i] , "Loop ="..Check )	
		say( Player[i] , "Spell ="..Spell )	
		if Check == 58 or Check == 68 or Check == 120 or Fight ==1 or Live ==1 or Spell ~= 0 or UseItem == 0 then
--			 AttachCastMotionTool( Player[i] , 212076 )  --置換武器為空手
--			PlaySoundToPlayer( Player[i] , " ", false )  -- 播放空的音效
			break
		else
			sleep(50)
--		 	AttachCastMotionTool( Player[i] , 212076 )  --置換武器為空手
--			Say( Player[i] , "-" )
			BeginPlot( OwnerID() , "Lua_Hao_DanceItem01" , 0 ) 
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_DanceItem03()

	local Weapon = { [0]=211822 , [3]=211826 , [2]=211823 , [4]=211825 , [1]=211824 } -- [0]吉他、[3]烏德琴、[2]沙鈴、[4]鈴鼓、[1]薩克斯風
	local Motion = { [0]=ruFUSION_ACTORSTATE_EMOTE_PLAY_GUITAR ,  			--	吉他、烏德
			[3]=ruFUSION_ACTORSTATE_EMOTE_PLAY_GUITAR ,			--
			[2]=ruFUSION_ACTORSTATE_EMOTE_PLAY_TAMBOURINE ,		--	鈴鼓、沙鈴
			[4]=ruFUSION_ACTORSTATE_EMOTE_PLAY_TAMBOURINE , 		--
			[1]=ruFUSION_ACTORSTATE_EMOTE_PLAY_SAXOPHONE 	}	--	薩克斯風

	local Buff = { 506168 , 506169 , 505583 }
	local Random = Rand(5)
	local BuffID , Fight , Check , Live , odds

--	odds = (Random)%5
--	AddBuff( OwnerID() , Buff[1] , 0 , 5 ) --特效 變身會將裝備指令遮蔽，故無法變身。
--	AttachCastMotionTool( OwnerID() , Weapon[odds] )  --置換武器為Weapon
--	PlayMotion( OwnerID() , Motion[odds] )

	local Player = SearchRangePlayer ( OwnerID() , 50 ) --將附近玩家取成陣列

		for i=0 , table.getn(Player) , 1 do -- i=1 忽略掉自己， 0 為自己。
			odds = (Random+i)%5
			Fight = ReadRoleValue( Player[i] , EM_RoleValue_IsAttackMode )
			local Count = BuffCount ( Player[i])
			local Spell = ReadRoleValue( Player[i] , EM_RoleValue_SpellMagicID )
			local UseItem = ReadRoleValue( Player[i] , EM_RoleValue_CastingType )	-- -1 為初始值、0為有施法條狀態
			Live = ReadRoleValue( Player[i] , EM_RoleValue_IsDead )
		--	local Trutly
		--	for j = 490000 , 499999 , 1 do 
			--	Trutly = CastSpell( Player[i] , Player[i] , j )
		--	end
			for j = 0 , Count do
				BuffID = BuffInfo( Player[i] , j , EM_BuffInfoType_BuffID )
				Check = GameObjInfo_int( BuffID , "AssistType" ) -- 確認  58 變身、68 坐騎、120 非商城變身  --抓取法術的輔助類型
--				Say( Player[i] , Check )
				if Check == 58 or Check == 68 or Check == 120 or Fight == 1 or Live == 1 or Spell ~= 0 or UseItem == 0 then
						Say( Player[i] , "Check = "..Check )
						Say( Player[i] , "Fight = "..Fight )
						Say( Player[i] , "Live = "..Live )
						Say( Player[i] , "Spell ="..Spell )	
						Say( Player[i] , "UseItem ="..UseItem )	
--				 		AttachCastMotionTool( Player[i] , 212076 )  --置換武器為空手
--						PlaySoundToPlayer( Player[i] , " ", false )  -- 播放空的音效
						Say( Player[i] , "Buffing already" )	-- 你已經處於樂團狀態，請等待狀態解除，方能使用。
						break				
				else
						PlaySoundToPlayer( Player[i] , "sound\\fx\\Lvup\\PC_SkillLvup.mp3", false ) -- 播放音效
--						if CheckBuff( Player[i] , Buff[3] ) == false then
--							PlaySoundToPlayer( Player[i] , "sound\\fx\\Lvup\\PC_SkillLvup.mp3", false ) -- 播放音效
--							PlaySoundToPlayer( Player[i] , "sound\\018.mp3", false ) -- 播放音效
--							AddBuff( Player[i] , Buff[3] , 0 , 45 ) -- 讓單首音樂持續播放多久
--						end
						AddBuff( Player[i] , Buff[1] , 0 , 5 ) --特效 變身會將裝備指令遮蔽，故無法變身。
						AttachCastMotionTool( Player[i] , Weapon[odds] )  --置換武器為Weapon
						PlayMotion( Player[i] , Motion[odds] )
--						Say( Player[i] , Weapon[odds] )
--						Say( Player[i] , Motion[odds] )
--						BeginPlot( OwnerID() , "Lua_Hao_DanceItem02" , 0 )
				end
			end
		end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_DanceItem_Cancel() -- 當法術結束時，置換武器為空手，並清除特效。

	local Buff = { 506168 , 506169 , 505583 }
		PlayMotion( OwnerID() , 0 ) 
--		Say( OwnerID() , " Cancel Buff " )
		for i = 1 , 3 , 1 do
			CancelBuff( OwnerID() , Buff[i] )
		end
 		AttachCastMotionTool( OwnerID() , 212076 )  --置換武器為空手
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------
Function Lua_Hao_Test_ENEU00()
	CancelBuff( OwnerID() , 504665 )
end
Function Lua_Hao_Test_ENEU01()
	Addbuff( OwnerID() , 504665 , 0 , -1 )
end