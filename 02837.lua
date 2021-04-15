-- 121912 阿不．燈不亮 任務NPC初始對話 
function nouGat_DE_4th_NPC_121912_DefaultSpeak()
	local ply = OwnerID();
	local npc = TargetID();
	local questID = 425998;
	local AcceptKey = 547594;	-- 任務中KEY
	local DailyKey = 547589; 	-- 每日任務KEY	

	if ( CheckFlag( ply, DailyKey ) == false ) then
		if ( CheckFlag( ply, AcceptKey ) == false ) then  
			SetSpeakDetail( ply, "[SC_DE_4TH_NPC_121912_03]" );  --  我得專心維修這些故障的星空球，你願意協助我嗎？
			AddSpeakOption( ply , Npc , "[SC_DE_4TH_NPC_121912_02]" , "nouGat_DE_4th_Quest_425998_PrepareToAcceptQuest", 0 )	-- 包在我身上！						
		else
			LoadQuestOption( ply );	
		end		
	else 
		SetSpeakDetail( ply, "[SC_DE_4TH_NPC_121912_01]" );  -- （專心維修的樣子）
	end
end

function nouGat_DE_4th_Quest_425998_PrepareToAcceptQuest()
	local ply = OwnerID();
	local AcceptKey = 547594;	-- 任務中KEY
	SetFlag( ply, AcceptKey, 1 );
	LoadQuestOption( ply );
end

function nouGat_DE_4th_Quest_425998_EndQuest()
	local ply = TargetID();
	local AcceptKey = 547594;	-- 任務中KEY
	local DailyKey = 547589; 	-- 每日任務KEY	

	SetFlag( ply, AcceptKey, 0 );
	SetFlag( ply, DailyKey, 1 );
	
	DesignLog( ply , 121912 , "DE_4th, Quest_RepairStarBall complete." );
	CloseSpeak( ply );
end

-- 121912 阿不．燈不亮 主要迴圈--
function nouGat_DE_4th_DefaultPlot()
	local center = OwnerID();
--	DebugMsg( 0, 0, "121912 start" );	
	
	-- 初始動作&特效 --
	AddBuff( center, 503217, 1, -1 ) ;		
	SetDefIdleMotion( center, ruFUSION_MIME_CRAFTING_LOOP );
	local RedStarOrgID = 121937;	-- 場景用，不做client判斷
	local MachineOrgID = 121938;	-- 場景用，魔力灌注器

	local RoomID = ReadRoleValue( center, EM_RoleValue_RoomID);
	
	local x, y, z, dir = nouGat_DE_4th_Func_Coordinate( center, 15, 0 );
	local machine = CreateObj( MachineOrgID, x, y, z, dir, 1 );
	Hao_Germany_4th_Obj_Status( machine, RoomID, true );

	local star = CreateObj( RedStarOrgID, x, (y+10), z, dir, 1 );
	Hao_Germany_4th_Obj_Status( star, RoomID );

	Sleep(50);	
	
	-- 找到不消失的石板(紅星墜落用) --	
	local Hao_Slate = nouGat_DE_4th_GetHaoSlateInRange( center, 1000 );
	DebugMsg(0,0,"Hao_Slate"..#Hao_Slate);
	while ( #Hao_Slate == 0 ) do
		Hao_Slate = nouGat_DE_4th_GetHaoSlateInRange( center, 1000 );
	--	DebugMsg(0,0,"no slate")
		Sleep(10);
	end
	DebugMsg(0,0,"init success");
	
	local SlateRegs_Had_Star = EM_RoleValue_Register10;
	for i = 1, #Hao_Slate do						-- 石板，寫入紅星墜落初值為0
		WriteRoleValue( Hao_Slate[i], SlateRegs_Had_Star, 0 );	-- 0代表沒有紅星，999表示已有紅星
	end
			
	-- loop 紅星不足最大量，就再召喚 --
	local MAX_STAR_AMOUNT = 1;
	local currentStarCount = 0;	
	local All_redStar = {}; 	-- 記錄生出來的紅星
	local CenterRegs_Star_Count = EM_RoleValue_Register1;	
	WriteRoleValue( center, CenterRegs_Star_Count, 0 );		-- 中控，寫入場上紅星數量初值為0
	
	while true do
		Sleep(10);
		for i, slate in ipairs (Hao_Slate) do	-- 重制機制
			if CheckID(slate) == false then
				DebugMsg( 0, 0, "Error! ReStart" );
				Lua_Hao_NPCofAll_Clear(121798);
		     		
   		     		Hao_Slate = nouGat_DE_4th_GetHaoSlateInRange( center, 1000 );
   		     		DebugMsg(0,0,"ReStart! Hao_Slate"..#Hao_Slate);
   		     		while ( #Hao_Slate == 0 ) do
   		     			Hao_Slate = nouGat_DE_4th_GetHaoSlateInRange( center, 1000 );
   		     			DebugMsg(0,0,"ReStart! no slate");
   		     			
   		     			Sleep(10);
   		     		end
   		     		DebugMsg(0,0,"ReStart! success");
   		     		local SlateRegs_Had_Star = EM_RoleValue_Register10;
   		     		for i = 1, #Hao_Slate do						-- 石板，寫入紅星墜落初值為0
   		     			WriteRoleValue( Hao_Slate[i], SlateRegs_Had_Star, 0 );	-- 0代表沒有紅星，999表示已有紅星
   		     		end
   		     		
   		     		local CenterRegs_Star_Count = EM_RoleValue_Register1;	
   		     		WriteRoleValue( center, CenterRegs_Star_Count, 0 );		-- 中控，寫入場上紅星數量初值為0   
   		     		break;		     					
			end
		end
		
		currentStarCount = ReadRoleValue( center, CenterRegs_Star_Count );
		if ( currentStarCount < MAX_STAR_AMOUNT ) or (#All_redStar == 0) then			
			Hao_Slate, All_redStar = nouGat_DE_4th_CreateRedStar( center, Hao_Slate, All_redStar );
		end
			
		local removeList = {};	
		if #All_redStar > 0 then
     			for idx, star in ipairs(All_redStar) do
     				if CheckID(star) == false then
     					table.insert(removeList,idx);
     				end
     			end		
		end
		if removeList ~= nil then
	       		for i = #removeList, 1, -1 do
				table.remove( All_redStar, removeList[i] );			
	       		end				
		end
	end
	-- loop end --
end

function nouGat_DE_4th_Func_Coordinate( refObj, dis, angle ) -- 參照目標, 傳送後相距之距離, 傳送後出現的方位角
	local me = OwnerID();
	
	local x, y, z, dir;
	local refX, refY, refZ, refDir = nouGat_DE_4th_GetXYZDIR( refObj );
	
	local rad = math.rad( refDir );

	y = refY;	
	x = refX + dis * Math.Cos( rad );	
	z = refZ - dis * Math.Sin( rad );
	
	local newDir = function(x)
		x = x + 180;	-- 固定面向參照目標(可改)	
		if (x > 360 ) then
			return (x-360);
		else
			return x;
		end
	end	

	dir = newDir( refDir ) + angle;	
	return x, y, z, dir;
end

function nouGat_DE_4th_CreateRedStar( center, Hao_Slate, All_redStar )
	local RoomID= ReadRoleValue( center, EM_RoleValue_RoomID );
	local clone = Hao_Slate;
	local RedStarOrgID = 121798;
	
	local CenterRegs_Star_Count = EM_RoleValue_Register1;
	
	local StarRegs_Center_GUID = EM_RoleValue_Register1;
	local StarRegs_Slate_GUID = EM_RoleValue_Register2;
	
	local SlateRegs_Had_Star = EM_RoleValue_Register10;
	
	local isCreateOK = false;	
	repeat
		local randIdx = Rand( #clone ) + 1;
		local randSlate = clone[randIdx];	
		
		if CheckID( randSlate ) == true then	
			
			local hadStar = ReadRoleValue( randSlate, SlateRegs_Had_Star );
		
			if ( hadStar == 0 ) then		
				local x, y, z, dir = nouGat_DE_4th_GetXYZDIR( randSlate );
				local star = CreateObj( RedStarOrgID, x, y, z, dir, 1 );
				Hao_Germany_4th_Obj_Status( star, RoomID );
				
				WriteRoleValue( star, StarRegs_Center_GUID, center );			-- 紅星，寫入中控的GUID
				WriteRoleValue( star, StarRegs_Slate_GUID, randSlate );			-- 紅星，寫入墜落石板的GUID	

				WriteRoleValue( randSlate, SlateRegs_Had_Star, 999 );			-- 石板，寫入已有紅星墜落		

				local currentStarCount = ReadRoleValue( center, CenterRegs_Star_Count );	-- 中控，讀取場上有幾顆紅星	
				WriteRoleValue( center, CenterRegs_Star_Count, (currentStarCount+1) );	-- 中控，寫入現在紅星數量+1	
				Sleep(15);
				SetPlot( star, "range", "nouGat_DE_4th_SetCatchEvent", 10 );
			
				isCreateOK = true;
				DebugMsg( 0, 0, "CreateRedStar" );
				table.insert( All_redStar, star );
			end	
			Sleep(3);
		else 
			DebugMsg( 0, 0, "Create Error! Not Find Slate" );
			isCreateOK = true;
		end		
	until isCreateOK;
		
	return clone, All_redStar;
end

function nouGat_DE_4th_SetCatchEvent()
	local ply = OwnerID();
	local star = TargetID();
	
	SetPlot( star, "range", "", 0 );	
	local RedStarItemID = 242224;	-- 故障的星空球ID
	local Quest_Collect_Count = 6;
	local count = CountBodyItem( ply, RedStarItemID );
	
	if ( CheckAcceptQuest( ply, 425998 ) == true ) and ( count < Quest_Collect_Count ) then 	-- 有接任務，但滿足任務條件就不給了，謝謝
		-- 拾取動作 --
		local stopBuff = 624028;
		PlayMotion( ply, ruFUSION_ACTORSTATE_CROUCH_BEGIN );
		AddBuff( ply, stopBuff, 0, -1 );
		Sleep(10);
		CancelBuff( ply, stopBuff );
		PlayMotion( ply, ruFUSION_ACTORSTATE_NORMAL );
		-- 動作結束 --
		
		GiveBodyItem( ply, RedStarItemID, 1 );	-- 給予玩家故障的星空球*1
		
		-- 以下做變量修改不重要 -- 
		local CenterRegs_Star_Count = EM_RoleValue_Register1;
	
		local StarRegs_Center_GUID = EM_RoleValue_Register1;
		local StarRegs_Slate_GUID = EM_RoleValue_Register2;
	
		local SlateRegs_Had_Star = EM_RoleValue_Register10;	
	
		local slate =  ReadRoleValue( star, StarRegs_Slate_GUID );	
		WriteRoleValue( slate, SlateRegs_Had_Star, 0 );			-- 石板，寫入紅星已被拾取，可再墜落至此石板上
	
		local center = ReadRoleValue( star, StarRegs_Center_GUID );
		local starCount = ReadRoleValue( center, CenterRegs_Star_Count ); 
		WriteRoleValue( center, CenterRegs_Star_Count, (starCount-1) );	-- 中控，寫入現有紅星數量-1
		-- 以上做變量修改不重要 -- 	
		
		SetModeEx( star , EM_SetModeType_Show , false );	-- 不顯示，待刪除
		Sleep(5);
		DelObj( star );
	else
		sleep(3);
		SetPlot( star, "range", "nouGat_DE_4th_SetCatchEvent", 10 );
	end
end

function nouGat_DE_4th_GetXYZDIR( obj )
	local x = ReadRoleValue( obj, EM_RoleValue_X );
	local y = ReadRoleValue( obj, EM_RoleValue_Y );
	local z = ReadRoleValue( obj, EM_RoleValue_Z );
	local dir = ReadRoleValue( obj, EM_RoleValue_DIR );
	return x, y, z, dir;
end

function nouGat_DE_4th_GetHaoSlateInRange( center, range )
	local Hao_SlateOrgID  = 121443;
	local Hao_Slate = {};

	local roomID = ReadRoleValue( center , EM_RoleValue_RoomID );
	local resultCount = SetSearchRangeInfo( center, range );	-- 範圍內掃到的物件數量
		
	local Obj;
	local resultObj = {};	-- 範圍內掃到的GUID
	local matchCount = 1;
		
 	for i = 1, resultCount do
 		resultObj[i] = GetSearchResult();
 	end
 			
	for i = 1 , resultCount , 1 do
		local resultObjGUID = resultObj[i];
		Obj = Role:New( resultObjGUID );
		
		if  ( Obj:IsNPC() == true ) and ( Obj:RoomID() == roomID ) then								
			if ( Obj:OrgID() == Hao_SlateOrgID ) then
				local y1 = Obj:Y(); 
				Sleep(20);
				local y2 = Obj:Y(); 
				if ( (y2 - y1) < 5 ) then	-- 測試方便用，先不落在會消失的石板上

					Hao_Slate[ matchCount ] = resultObjGUID;
					matchCount = matchCount + 1;
				end					
			end
		end
	end
	
	return Hao_Slate;
end