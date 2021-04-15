--------------------------------------------------------------------------------------------------------------------------
function LuaQ_110030()
	DisableQuest( OwnerID() , true )
	local Armor5 = CreateObjByFlag( 100096 , 780025 , 4  , 1 )		-- 鞭尾穿山甲
	AddToPartition( Armor5 , 0 )
	BeginPlot( Armor5 , "LuaQ_110030_Sui" , 0)
	SetAttack( Armor5 , TargetID() )

	local Armor4 = CreateObjByFlag( 100096 , 780025 , 3  , 1 )		-- 鞭尾穿山甲
	AddToPartition( Armor4 , 0 )
	BeginPlot( Armor4 , "LuaQ_110030_Sui" , 0)
	SetAttack( Armor4 , TargetID() )

	local Armor3 = CreateObjByFlag( 100095 , 780025 , 2  , 1 )		-- 硬刺穿山甲
	AddToPartition( Armor3 , 0 )
	BeginPlot( Armor3 , "LuaQ_110030_Sui" , 0)
	SetAttack( Armor3 , TargetID() )

	local Armor2 = CreateObjByFlag( 100094 , 780025 , 1  , 1 )		-- 尖脊穿山甲
	AddToPartition( Armor2 , 0 )
	BeginPlot( Armor2 , "LuaQ_110030_Sui" , 0)
	SetAttack( Armor2 , TargetID() )

	local Armor1 = CreateObjByFlag( 100097 , 780025 , 0  , 1 )		-- 鐵甲‧克什米魯 (產生物件ID , 產生旗子ID , 旗子位置ID , 產生數量)
	AddToPartition( Armor1 , 0 )
	BeginPlot( Armor1 , "LuaQ_110030_Sui" , 0)
	SetAttack( Armor1 , TargetID() )

	while 1 do
		if (CheckID(Armor1) == false and CheckID(Armor2) == false and CheckID(Armor3) == false  and CheckID(Armor4) == false  and CheckID(Armor5) == false ) or (
		ReadRoleValue( Armor1 , EM_RoleValue_IsDead ) == 1 and ReadRoleValue( Armor2 , EM_RoleValue_IsDead ) == 1 
		and ReadRoleValue( Armor3 , EM_RoleValue_IsDead ) == 1 and ReadRoleValue( Armor4 , EM_RoleValue_IsDead ) == 1 
		and ReadRoleValue( Armor5 , EM_RoleValue_IsDead ) == 1
		) or (
		ReadRoleValue( Armor1 , EM_RoleValue_IsNPC) ~= 1 and ReadRoleValue( Armor2 , EM_RoleValue_IsNPC) ~= 1
		and ReadRoleValue( Armor3 , EM_RoleValue_IsNPC) ~= 1 and ReadRoleValue( Armor4 , EM_RoleValue_IsNPC) ~= 1
		and ReadRoleValue( Armor5 , EM_RoleValue_IsNPC) ~= 1
		)
		then
			break
		end 
		sleep( 60 )
	end
	DisableQuest( OwnerID() ,false)
end

function LuaQ_110030_Sui()
	LuaFunc_Obj_Suicide(100)
end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110030_0()
	if CheckFlag( OwnerID(),540746) == true then
		LoadQuestOption( OwnerID() )
	else
		SetSpeakDetail( OwnerID(), GetString("ST_110030_0")   );
		--/*天啊！你是跟我一樣被困在這裡的獵人嗎？
		if CheckAcceptQuest( OwnerID(), 420222 ) then
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110030_1") , "LuaS_110030_1", 0 ); --/*我是受託來救你的。
		end
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110030_0") , "LuaS_110030_EXIT", 0 ); --/*結束對話
	end


end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110030_1()

	CloseSpeak( OwnerID() );	--關閉對話視窗
	SetPlot( TargetID() , "Touch" , " LuaFunc_Obj_BUSY " , 40 )
	Say( TargetID(),GetString("SAY_110030_1") ) --/*是布雷登找你來救我的嗎？
	sleep(20)
	Say( TargetID(),GetString("SAY_110030_2") ) --/*真是太好了～我們趕快離開這裡！
	sleep(20)
	Say( TargetID(),GetString("SAY_110030_3") ) --/*外面也許還有些野獸，千萬要小心！！
	MoveToFlagEnabled( TargetID(), false );
	SetRoleCamp( TargetID , "SNPC" ) --設定NPC的陣營為可被怪物攻擊
	BeginPlot( TargetID() , "LuaP_110030_0" , 30 ) 
	-- 每 6 秒搜尋一次NPC是否還存在
	while 1 do
		sleep(60)
		if CheckID( TargetID() ) then
			if CheckFlag( OwnerID(),540746) == true then 
				break
			end
		else
			LuaFunc_ResetObj( TargetID() )
			break
		end
	end 


end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110030_EXIT()

	CloseSpeak( OwnerID() );	--關閉對話視窗
end
--------------------------------------------------------------------------------------------------------------------------
function LuaP_110030_0()

	local FlagID	= 780025;	-- FlagID	路徑旗子群組代瑪
	local FlagCount = GetMoveFlagCount ( FlagID ) - 1;
	local Flag	= 0;	-- Flag		路徑旗子代瑪
	local Owner	= Role:new( OwnerID() ) 	-- OwnerID()	保護的 NPC	
	local DBID	= ReadRoleValue( TargetID() , EM_RoleValue_DBID ) 	

	Say( OwnerID(), "旗子總數：" .. FlagCount );

	while 1 do		
		-- DEBUG 用
		Say( OwnerID(), " X: " .. Owner:X() .. ", Y:" .. Owner:Z()   );
		if( LuaFunc_MoveToFlag( OwnerID(), FlagID , Flag ,0 ) == true and LuaFunc_PlayerCheck( TargetID() , DBID) == true ) then
			-- 測試用
			Say( OwnerID(), "Everbody say " .. Flag );
			-- 到達事件點 1			
			if( Flag == 0 ) then
			
				Say(OwnerID(),GetString("SAY_110030_4")) --/*這個洞穴是鐵甲‧克什米魯的巢穴，我們得在那傢伙回來前逃出去。
				sleep( 30 )				
			end
			
			-- 到達事件點 2
			
			if( Flag == 1 ) then
			
				Say(OwnerID(),GetString("SAY_110030_5")) --/*小心點，那隻大穿山甲不知道什麼時候會出現。
				sleep( 30 )				
			end
	
			-- 到達事件點 3
			
			if( Flag == 2 ) then
				PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_HURT_NORMAL)	
				Say(OwnerID(),GetString("SAY_110030_6")) --/*哇！原來是兔子......嚇死我了！
				sleep( 30 )			
			END
			
			--到達事件點4
			
			if( Flag == 3 ) then 
			
				Say(OwnerID(),GetString("SAY_110030_7")) --/*我想我們應該快逃出鐵甲‧克什米魯的勢力範圍了。
				sleep( 30 )					
			end
				
			--到達事件點5
			if( Flag == 4 ) then 

				Say(OwnerID(),GetString("SAY_110030_8")) --/*噓～你有沒有聽到什麼聲音
			
				sleep(50)

				local IronArmor = CreateObjByFlag ( 100204 , FlagID , 6 , 1 )
				local Guard1 = CreateObjByFlag ( 100056 , FlagID , 7 , 1 )
				local Guard2 = CreateObjByFlag ( 100056 , FlagID , 8 , 1 )
				AddToPartition( IronArmor,0 )
				AddToPartition( Guard1 ,0 )
				AddToPartition( Guard2 ,0 )
				BeginPlot(IronArmor,"LuaQ_100097_Sui",0)
				BeginPlot(Guard1 ,"LuaQ_100097_Sui",0)
				BeginPlot(Guard2 ,"LuaQ_100097_Sui",0)
				Say(OwnerID(),GetString("SAY_110030_9")) --/*是鐵甲‧克什米魯！！快保護我～快快！
				SetAttack( IronArmor , TargetID() )
				SetAttack( Guard1 , OwnerID() )
				SetAttack( Guard2 , OwnerID() )
				sleep(10)
				while 1 do
					if CheckID(IronArmor) == false and Owner:IsAttack() == false then
						break
					else 
						sleep(30)
					end
					sleep( 30 )
				end
					
			end	
			-- 檢查是不是到終點了
			if( Flag == 5 ) then
				
				Say(OwnerID(),GetString("SAY_110030_10")) --/*呼～終於逃出來了。
				--結束迴圈	
				break;
				
			end		
			--進行到下一個FLAG
			Flag = Flag+1;		
		end
	
		-- 釋放記憶體 	
		sleep( 1 );
	end
	SetRoleCamp( OwnerID() , "Visitor" )  --設定NPC的陣營回到不會被攻擊
	SetPlot( OwnerID() , "Touch" , "" , 0 )
	SetFlag( TargetID() ,540746,1)
	sleep( 600 )
	Say( OwnerID(),GetString("SAY_110030_11")) --/*那我回去囉！再見！
	LuaFunc_ResetObj( OwnerID() )
end
----------------------------------------------------------------------
function LuaQ_100097_Sui() 
	LuaFunc_Obj_Suicide(30)
end	
---------------------------------------------------------------------