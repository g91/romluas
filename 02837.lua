-- 121912 �����D�O���G ����NPC��l��� 
function nouGat_DE_4th_NPC_121912_DefaultSpeak()
	local ply = OwnerID();
	local npc = TargetID();
	local questID = 425998;
	local AcceptKey = 547594;	-- ���Ȥ�KEY
	local DailyKey = 547589; 	-- �C�����KEY	

	if ( CheckFlag( ply, DailyKey ) == false ) then
		if ( CheckFlag( ply, AcceptKey ) == false ) then  
			SetSpeakDetail( ply, "[SC_DE_4TH_NPC_121912_03]" );  --  �ڱo�M�ߺ��׳o�ǬG�٪��P�Ųy�A�A�@�N��U�ڶܡH
			AddSpeakOption( ply , Npc , "[SC_DE_4TH_NPC_121912_02]" , "nouGat_DE_4th_Quest_425998_PrepareToAcceptQuest", 0 )	-- �]�b�ڨ��W�I						
		else
			LoadQuestOption( ply );	
		end		
	else 
		SetSpeakDetail( ply, "[SC_DE_4TH_NPC_121912_01]" );  -- �]�M�ߺ��ת��ˤl�^
	end
end

function nouGat_DE_4th_Quest_425998_PrepareToAcceptQuest()
	local ply = OwnerID();
	local AcceptKey = 547594;	-- ���Ȥ�KEY
	SetFlag( ply, AcceptKey, 1 );
	LoadQuestOption( ply );
end

function nouGat_DE_4th_Quest_425998_EndQuest()
	local ply = TargetID();
	local AcceptKey = 547594;	-- ���Ȥ�KEY
	local DailyKey = 547589; 	-- �C�����KEY	

	SetFlag( ply, AcceptKey, 0 );
	SetFlag( ply, DailyKey, 1 );
	
	DesignLog( ply , 121912 , "DE_4th, Quest_RepairStarBall complete." );
	CloseSpeak( ply );
end

-- 121912 �����D�O���G �D�n�j��--
function nouGat_DE_4th_DefaultPlot()
	local center = OwnerID();
--	DebugMsg( 0, 0, "121912 start" );	
	
	-- ��l�ʧ@&�S�� --
	AddBuff( center, 503217, 1, -1 ) ;		
	SetDefIdleMotion( center, ruFUSION_MIME_CRAFTING_LOOP );
	local RedStarOrgID = 121937;	-- �����ΡA����client�P�_
	local MachineOrgID = 121938;	-- �����ΡA�]�O��`��

	local RoomID = ReadRoleValue( center, EM_RoleValue_RoomID);
	
	local x, y, z, dir = nouGat_DE_4th_Func_Coordinate( center, 15, 0 );
	local machine = CreateObj( MachineOrgID, x, y, z, dir, 1 );
	Hao_Germany_4th_Obj_Status( machine, RoomID, true );

	local star = CreateObj( RedStarOrgID, x, (y+10), z, dir, 1 );
	Hao_Germany_4th_Obj_Status( star, RoomID );

	Sleep(50);	
	
	-- ��줣�������۪O(���P�Y����) --	
	local Hao_Slate = nouGat_DE_4th_GetHaoSlateInRange( center, 1000 );
	DebugMsg(0,0,"Hao_Slate"..#Hao_Slate);
	while ( #Hao_Slate == 0 ) do
		Hao_Slate = nouGat_DE_4th_GetHaoSlateInRange( center, 1000 );
	--	DebugMsg(0,0,"no slate")
		Sleep(10);
	end
	DebugMsg(0,0,"init success");
	
	local SlateRegs_Had_Star = EM_RoleValue_Register10;
	for i = 1, #Hao_Slate do						-- �۪O�A�g�J���P�Y����Ȭ�0
		WriteRoleValue( Hao_Slate[i], SlateRegs_Had_Star, 0 );	-- 0�N��S�����P�A999��ܤw�����P
	end
			
	-- loop ���P�����̤j�q�A�N�A�l�� --
	local MAX_STAR_AMOUNT = 1;
	local currentStarCount = 0;	
	local All_redStar = {}; 	-- �O���ͥX�Ӫ����P
	local CenterRegs_Star_Count = EM_RoleValue_Register1;	
	WriteRoleValue( center, CenterRegs_Star_Count, 0 );		-- �����A�g�J���W���P�ƶq��Ȭ�0
	
	while true do
		Sleep(10);
		for i, slate in ipairs (Hao_Slate) do	-- �������
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
   		     		for i = 1, #Hao_Slate do						-- �۪O�A�g�J���P�Y����Ȭ�0
   		     			WriteRoleValue( Hao_Slate[i], SlateRegs_Had_Star, 0 );	-- 0�N��S�����P�A999��ܤw�����P
   		     		end
   		     		
   		     		local CenterRegs_Star_Count = EM_RoleValue_Register1;	
   		     		WriteRoleValue( center, CenterRegs_Star_Count, 0 );		-- �����A�g�J���W���P�ƶq��Ȭ�0   
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

function nouGat_DE_4th_Func_Coordinate( refObj, dis, angle ) -- �ѷӥؼ�, �ǰe��۶Z���Z��, �ǰe��X�{����쨤
	local me = OwnerID();
	
	local x, y, z, dir;
	local refX, refY, refZ, refDir = nouGat_DE_4th_GetXYZDIR( refObj );
	
	local rad = math.rad( refDir );

	y = refY;	
	x = refX + dis * Math.Cos( rad );	
	z = refZ - dis * Math.Sin( rad );
	
	local newDir = function(x)
		x = x + 180;	-- �T�w���V�ѷӥؼ�(�i��)	
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
				
				WriteRoleValue( star, StarRegs_Center_GUID, center );			-- ���P�A�g�J������GUID
				WriteRoleValue( star, StarRegs_Slate_GUID, randSlate );			-- ���P�A�g�J�Y���۪O��GUID	

				WriteRoleValue( randSlate, SlateRegs_Had_Star, 999 );			-- �۪O�A�g�J�w�����P�Y��		

				local currentStarCount = ReadRoleValue( center, CenterRegs_Star_Count );	-- �����AŪ�����W���X�����P	
				WriteRoleValue( center, CenterRegs_Star_Count, (currentStarCount+1) );	-- �����A�g�J�{�b���P�ƶq+1	
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
	local RedStarItemID = 242224;	-- �G�٪��P�ŲyID
	local Quest_Collect_Count = 6;
	local count = CountBodyItem( ply, RedStarItemID );
	
	if ( CheckAcceptQuest( ply, 425998 ) == true ) and ( count < Quest_Collect_Count ) then 	-- �������ȡA���������ȱ���N�����F�A����
		-- �B���ʧ@ --
		local stopBuff = 624028;
		PlayMotion( ply, ruFUSION_ACTORSTATE_CROUCH_BEGIN );
		AddBuff( ply, stopBuff, 0, -1 );
		Sleep(10);
		CancelBuff( ply, stopBuff );
		PlayMotion( ply, ruFUSION_ACTORSTATE_NORMAL );
		-- �ʧ@���� --
		
		GiveBodyItem( ply, RedStarItemID, 1 );	-- �������a�G�٪��P�Ųy*1
		
		-- �H�U���ܶq�ק藍���n -- 
		local CenterRegs_Star_Count = EM_RoleValue_Register1;
	
		local StarRegs_Center_GUID = EM_RoleValue_Register1;
		local StarRegs_Slate_GUID = EM_RoleValue_Register2;
	
		local SlateRegs_Had_Star = EM_RoleValue_Register10;	
	
		local slate =  ReadRoleValue( star, StarRegs_Slate_GUID );	
		WriteRoleValue( slate, SlateRegs_Had_Star, 0 );			-- �۪O�A�g�J���P�w�Q�B���A�i�A�Y���ܦ��۪O�W
	
		local center = ReadRoleValue( star, StarRegs_Center_GUID );
		local starCount = ReadRoleValue( center, CenterRegs_Star_Count ); 
		WriteRoleValue( center, CenterRegs_Star_Count, (starCount-1) );	-- �����A�g�J�{�����P�ƶq-1
		-- �H�W���ܶq�ק藍���n -- 	
		
		SetModeEx( star , EM_SetModeType_Show , false );	-- ����ܡA�ݧR��
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
	local resultCount = SetSearchRangeInfo( center, range );	-- �d�򤺱��쪺����ƶq
		
	local Obj;
	local resultObj = {};	-- �d�򤺱��쪺GUID
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
				if ( (y2 - y1) < 5 ) then	-- ���դ�K�ΡA�������b�|�������۪O�W

					Hao_Slate[ matchCount ] = resultObjGUID;
					matchCount = matchCount + 1;
				end					
			end
		end
	end
	
	return Hao_Slate;
end