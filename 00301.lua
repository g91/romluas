function LuaQ_420583_Complete()
	DisableQuest( OwnerID() , true )
	if ReadRoleValue( OwnerID() , EM_RoleValue_PID) == 0 then
		WriteRoleValue( OwnerID() , EM_RoleValue_PID , 50 )
		PlayMotion(OwnerID() , ruFUSION_ACTORSTATE_SIT_END ) --讓NPC站起來
		sleep( 30 )
	end
	Say( OwnerID() , GetString("SAY_110254_0") ) --/*我要開動囉！
	PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_EAT)
	sleep( 30 )
	Say( OwnerID() , GetString("SAY_110254_1") ) --/*啊～真是滿足！
	DisableQuest( OwnerID() , false )
end
------------------------------------------------------------------------------------------------------------
function LuaS_110255_0()
	if CheckCompleteQuest( OwnerID(),420282) == true then
		SetSpeakDetail( OwnerID(), GetString("ST_110255_0")   );
		--/*居然又被你看到我昏倒在路邊了，真丟臉......
	elseif CheckCompleteQuest( OwnerID(),420583) == true then
		SetSpeakDetail( OwnerID(), GetString("ST_110255_1")   );
		--/*真是感謝你幫我把便當拿過來！
	else
		SetSpeakDetail( OwnerID(), GetString("ST_110255_2")   );
		--/*......我不行了......我好餓喔......
	end

	LoadQuestOption( OwnerID() )

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110255_1()

	local FlagID	= 780034;	-- FlagID	路徑旗子群組代瑪
	local Flag	= 0;	-- Flag		路徑旗子代瑪
	local Owner	= Role:new( OwnerID() ) 	-- OwnerID()	保護的 NPC	
	local DBID	= ReadRoleValue( TargetID() , EM_RoleValue_DBID ) 

	DisableQuest( OwnerID() , true ) --關閉NPC讓她不能讓其他人接任務
	MoveToFlagEnabled( OwnerID(), false );
	WriteRoleValue( OwnerID() ,EM_RoleValue_IsWalk , 1  )

	if ReadRoleValue( OwnerID() , EM_RoleVAlue_PID) == 0 then
		PlayMotion(OwnerID() , ruFUSION_ACTORSTATE_SIT_END ) --讓NPC站起來
		sleep( 30 )
	end
	while 1 do
		if Luafunc_Player_Alive( TargetID(),DBID,100 ) == false or ReadRoleValue( TargetID(), EM_RoleValue_IsDead) == 1 then
			break
		end		
		if( LuaFunc_MoveToFlag( OwnerID(), FlagID , Flag ,0 ) == true and LuaFunc_PlayerCheck( TargetID() , DBID) == true ) then
			-- 到達事件點 1			
			if( Flag == 0 ) then
				AdjustDir( OwnerID(), -100 )--接轉身的動作
				Say(OwnerID(),GetString("SAY_110255_0")) 
				--/*你看那個森林，那就是霜木谷的森林，裡面有很多野生的動物。
				PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_POINT)
				sleep( 30 )
				AdjustFaceDir( OwnerID(), TargetID(), 0 )
				Say(OwnerID(),GetString("SAY_110255_1"))
				--/*當然也有像獨眼巨人啦～牛頭人啦～等等的怪物，聽說森林最深處有一個牛頭人的城市，很多冒險者都想去那裡冒險，不過我可不想去當牛頭人的晚餐啊！哈哈～
				PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
				sleep( 30 )
			end
			
			-- 到達事件點 2
			
			if( Flag == 4 ) then
				AdjustFaceDir( OwnerID(), TargetID(), 0 )
				Say(OwnerID(),GetString("SAY_110255_2")) 
				--/*你知道嗎？這條柴左爾山道是黑曜騎士團在改名之前的時候開鑿的，聽說那個時候出錢的貴族柴佐爾在這裡意外喪生，所以就用他的名字來命名。
				PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)			
				sleep( 30 )
				Say(OwnerID(),GetString("SAY_110255_3")) 
				--/*其實我們出發的柴佐爾觀測哨塔附近本來有他的紀念碑呢！只是之前好像被迷路的獨眼巨人破壞掉了，現在正在維修。
				PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
				sleep( 30 )					
			end
	
			-- 到達事件點 3
			
			if( Flag == 6 ) then
				AdjustFaceDir( OwnerID(), TargetID(), 0 )
				Say(OwnerID(),GetString("SAY_110255_4")) 
				--/*你知道我們要去的哈洛夫交易站是怎麼樣的地方嗎？有個笑話說這個怪名字是第一個交易站站長來到這裡時打噴嚏的聲音，結果大家就把這個地方取叫哈洛夫。
				PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)				
				sleep( 30 )
				Say(OwnerID(),GetString("SAY_110255_5")) 
				--/*哈哈！哪有人打噴嚏的聲音那麼奇怪？不過哈洛夫的確是個有趣的地方，本來以為飛船貿易會讓這個小交易站沒落，沒想到反而帶來一堆冒險家和學者，使它變得更繁榮呢！
				PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_LAUGH)				
				sleep( 30 )		
			END
			
			--到達事件點4
			
			if( Flag == 8 ) then 
				AdjustDir( OwnerID(), -110 )--接轉身的動作			
				Say(OwnerID(),GetString("SAY_110255_6")) --/*看到了嗎？那片白色的懸崖！在那下面就是哈洛夫交易站囉！
				PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_POINT)				
				sleep( 30 )
				AdjustFaceDir( OwnerID(), TargetID(), 0 )
				Say(OwnerID(),GetString("SAY_110255_7")) --/*聽說那片白色的懸崖全是雪堆成的，所以叫做雪海。上面有一具很巨大的骨骸，深處是冰雪妖精與女王所居住的地方，我曾經送補給品到雪海去過，那真不是人住的地方啊！
				PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)				
				sleep( 30 )				
			end
				
			--到達事件點5
			if( Flag == 11 ) then 
				--接轉身的動作
				AdjustFaceDir( OwnerID(), TargetID(), 0 )
				Say(OwnerID(),GetString("SAY_110255_8")) --/*終於到了，那我先去忙囉！你趕快去找我哥哥吧！
				PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_SALUTE)				
				sleep( 30 )
				WriteRoleValue( OwnerID() ,EM_RoleValue_IsWalk , 1  )
				if CountBodyItem( TargetID() , 200736 ) == 0 then
					GiveBodyItem( TargetID() , 200736 , 1 )
				end					
			end	
			-- 檢查是不是到終點了
			if( Flag == 12 ) then

				--結束迴圈	
				break;
				
			end		
			--進行到下一個FLAG
			Flag = Flag+1;		
		end
	
		-- 釋放記憶體 	
		sleep( 1 );
	end

	DisableQuest( OwnerID() , false )
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 )
	LuaFunc_ResetObj( OwnerID() )
end
-------------------------------------------------------------