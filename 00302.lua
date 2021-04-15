function LuaQ_420291_Accept()
	SetPlot( OwnerID() , "touch" , "LuaFunc_Obj_BUSY" , 40)
	Say( OwnerID() ,GetString("SAY_110268_0") ) --/*我這個朋友所在的地方很隱密，我叫一個響導帶你過去。
	sleep( 20 )
	--這裡插伊凡轉身的動作
	Say( OwnerID() ,GetString("SAY_110268_1") ) --/*哈伯特～
	local DOG = CreateObjByFlag( 100143 , 780037 , 0 , 1)
	SetRoleCamp( DOG , "SNPC" )
	SetPlot( DOG , "touch" , "LuaFunc_Obj_BUSY" , 40)
	AddToPartition( DOG , 0 )
	FaceObj( DOG , OwnerID())
	sleep( 50 )
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_BEG )--這裡插伊凡蹲下的動作
	Say( OwnerID() ,GetString("SAY_110268_2") ) --/*哈伯特，帶這位朋友去我們的秘密洞穴。
	sleep( 10 )
	Say( DOG ,GetString("SAY_110268_3") ) --/*汪！汪！
	BeginPlot( TargetID() , "LuaQ_420291_LeadA" , 0 )
	--這裡插伊凡轉身回到原位的動作
	SetPlot( OwnerID() , "touch" , "" , 0)
end
-------------------------------------------------------------------------------------------------------------
function LuaQ_420291_LeadA()
	local DOG = LuaFunc_SearchNPCbyOrgID( TargetID() , 100143 , 100 )
	BeginPlot( DOG , "LuaQ_420291_LeadB" , 0 )
end
-------------------------------------------------------------------------------------------------------------
function LuaQ_420291_LeadB()

	local FlagID	= 780037;	-- FlagID	路徑旗子群組代瑪
	local Flag	= 0;	-- Flag		路徑旗子代瑪
	local Owner	= Role:new( OwnerID() ) 	-- OwnerID()	保護的 NPC	
	local DBID	= ReadRoleValue( TargetID() , EM_RoleValue_DBID ) 	

	while 1 do
		if( LuaFunc_MoveToFlag( OwnerID(), FlagID , Flag ,0 ) == true and LuaFunc_PlayerCheck( TargetID() , DBID) == true ) then
			-- 到達事件點 1			
			if( Flag == 0 ) then
			
				Say(OwnerID(),GetString("SAY_110268_3")) --/*汪！汪！
				sleep( 30 )	
			end
			

			-- 檢查是不是到終點了
			if( Flag == 10 ) then
				
				Say(OwnerID(),GetString("SAY_110268_3")) --/*汪！汪！
				local Check = LuaFunc_SearchNPCbyOrgID( OwnerID() , 110270 , 150, 1 ) 
				local Check2 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 100040 , 150, 1 ) 
				if Check[0] == -1 and Check2[0] == -1 then
					local Bull = CreateObjByFlag( 110270 , FlagID , 11 , 1)
					AddToPartition( Bull , 0 )
					SetPlot( Bull , "touch" , "LuaFunc_Obj_BUSY" , 40)
					BeginPlot( Bull , "LuaQ_420291_Friend" , 0 )
					sleep( 30 )
				 	LuaFunc_MoveToFlag( OwnerID(), FlagID , 9 ,0 )
				end
				--結束迴圈	
				break;
				
			end		
			--進行到下一個FLAG
			Flag = Flag+1;
		else
			break
		end
	
		-- 釋放記憶體 	
		sleep( 1 );
	end
	DelObj( OwnerID() )
end
-----------------------------------------------------------------------------------------------------------
function LuaQ_420291_Friend()
	MoveToFlagEnabled( OwnerID(), false );
	WriteRoleValue( OwnerID() ,EM_RoleValue_IsWalk , 1  )
 	LuaFunc_MoveToFlag( OwnerID(), 780037 , 10 ,0 )
	Sleep( 20 )
	SetPlot( OwnerID() , "touch" , "" , 0)
	sleep( 300 )
	SetPlot( OwnerID() , "touch" , "LuaFunc_Obj_BUSY" , 40)
 	LuaFunc_MoveToFlag( OwnerID(), 780037 , 11 ,0 )
	sleep( 20 )
	DelObj( OwnerID() )	
end
-----------------------------------------------------------------------------------------------------------
function LuaS_110270_0()

	if CheckFlag( OwnerID() , 540213 ) == false and CheckFlag( OwnerID() , 540796 ) == false and CheckCompleteQuest( OwnerID() , 420291 ) == true then
		SetSpeakDetail( OwnerID(), GetString("ST_110270_0") );		--/*你把伊凡特製的傷藥拿給了這個受傷的牛頭人，他對你的警戒也放鬆了下來，在你仔細觀察了之後，你發現他的傷勢比你想像的嚴重許多，這個藥你很確定對他的傷勢並沒有任何效用。
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110270_0") , "LuaS_110270_2" , 0 )		--/*相信他的生命力。
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110270_1") , "LuaS_110270_1" , 0 )		--/*殺了這個牛頭人，結束他的痛苦。
	else		
		LoadQuestOption( OwnerID() )
	end
	
end
------------------------------------------------------------------------------------------------------------
function LuaS_110270_EXIT()
	CloseSpeak(OwnerID())
end
------------------------------------------------------------------------------------------------------------
function LuaS_110270_1()
	CloseSpeak(OwnerID())
	BeginPlot(TargetID() , "LuaS_110270_Fight" , 0 )
end
------------------------------------------------------------------------------------------------------------
function LuaS_110270_2()
	CloseSpeak(OwnerID())
	SetFlag( OwnerID() , 540796, 1 )
end
-------------------------------------------------------------------------------------------------------------
function LuaS_110270_Fight()
	local n =0
	local O = OwnerID() 
	local T = TargetID() 

	Hide( O )
	local Bull = LuaFunc_CreateObjByObj ( 100633 , O )
	SetPlot( Bull ,"Dead" , "LuaS_110270_Dead" , 40 )
	SetAttack( Bull , TargetID() )
	sleep(60)
	while 1 do
		n = n + 1
		if n > 600 then -- 防無窮迴圈
			ScriptMessage( TargetID(), TargetID(), 0, "無窮迴圈", 0 )
			break
		else
			--ScriptMessage( TargetID(), TargetID(), 0, "合法迴圈", 0 )
		end
		if ReadRoleValue( Bull , EM_RoleValue_AttackTargetID ) ~= 0 and CheckID(Bull ) == true then  --檢查是否離開戰鬥
			sleep(60)	-- 六秒檢查一次	
		else
			if CheckID( Bull ) == true then
				DelObj( Bull )
			end 
			sleep( 60 )
			break
		end
	sleep(1)
	end

	sleep( 300 )
	Show( O , 0 )

end
-------------------------------------------------------------------------------------------------------------
function LuaS_110270_Dead()
	if CheckFlag(TargetID(),540213) == false and CheckFlag( OwnerID() , 540796 ) == false and CheckCompleteQuest(TargetID(),420291) == true then
		SetFlag( TargetID() , 540213 , 1 )
	end
end
-------------------------------------------------------------------------------------------------------------
