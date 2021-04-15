function AC2_weaponCreator_1()
	local own = OwnerID()
	local Phase = GetWorldVar( "OneYear_AC_Type" ) 
	local NPCORGID = ReadRoleValue(TargetID(),EM_RoleValue_OrgID)
	local npcText = {[123644]="[SC_AC2_NPC_1]",[123645]="[SC_AC2_NPC_2]",[123646]="[SC_AC2_NPC_3]",[123647]="[SC_AC2_NPC_4]"}
		SetSpeakDetail( own , npcText[NPCORGID] )
		AddSpeakOption( own,TargetID( ),"[SC_AC2_WEAPON_SHOW]","AC2_weaponCreatorShow", 0 )--我想要見識圖樣
		if NPCORGID == 123647 then
			AddSpeakOption( own,TargetID( ),"[SC_ACMATERIAL4_1]","AC2_weaponCreatorTalk_1(2)", 0 )--我想要打造武器。
		else
			AddSpeakOption( own,TargetID( ),"[SC_AC2_BUILD_EQ_1]","AC2_weaponCreatorTalk_1(1)", 0 )--我想要打造裝備。			
		end
end

function AC2_weaponCreatorShow() --觀賞用
	local NPCORGID = ReadRoleValue(TargetID(),EM_RoleValue_OrgID)
	if NPCORGID == 123644 then
		SetShop( TargetID( ) , 600546 , "Test_Shop_Close" )
	elseif NPCORGID == 123645 then
		SetShop( TargetID( ) , 600547 , "Test_Shop_Close" )
	elseif NPCORGID == 123646 then
		SetShop( TargetID( ) , 600548 , "Test_Shop_Close" )
	elseif NPCORGID == 123647 then
		SetShop( TargetID( ) , 600549 , "Test_Shop_Close" )
	end
	CloseSpeak( OwnerID() );  --關閉對話視窗
	OpenShop()
end

function AC2_weaponCreatorTalk_1(Num)	--介紹與選項
	DebugMsg(0,0,"AC2_weaponCreatorTalk_1="..Num)
	local NPCORGID = ReadRoleValue(TargetID(),EM_RoleValue_OrgID)
	if Num == 1 then
		SetSpeakDetail(OwnerID(),"[SC_AC2_NPC_7]")
		for i=9,13,1 do
			AddSpeakOption(OwnerID(),TargetID(),"[SC_AC2_NPC_5][$SETVAR1=".."[".."SC_AC2_NPC_"..i.."]".."]","AC2_weaponCreatorTalk_2("..(i-8)..")",0)
		end
	elseif Num == 2 then
		SetSpeakDetail(OwnerID(),"[SC_AC2_NPC_7]")
		AddSpeakOption(OwnerID(),TargetID(),"[SC_DAN_112698_34]","AC2_weaponCreatorTalk_4",0)
	end
end

function AC2_weaponCreatorTalk_2(Num)	--NPC兌換選項
	DebugMsg(0,0,"AC2_weaponCreatorTalk_2="..Num)
	local NPCORGID = ReadRoleValue(TargetID(),EM_RoleValue_OrgID)
	local S1 = {	[1]={[0]=234018,[1]=234019,[2]=234020,[3]=234021},
			[2]={[0]=234029,[1]=234030,[2]=234031,[3]=234032},
			[3]={[0]=234040,[1]=234041,[2]=234042,[3]=234043},
			[4]={[0]=234051,[1]=234052,[2]=234053,[3]=234054},
			[5]={[0]=234062,[1]=234063,[2]=234064,[3]=234065}
		}
	local S2 = {	[1]={[0]=234013,[1]=234014,[2]=234015,[3]=234016},
			[2]={[0]=234024,[1]=234025,[2]=234026,[3]=234027},
			[3]={[0]=234035,[1]=234036,[2]=234037,[3]=234038},
			[4]={[0]=234046,[1]=234047,[2]=234048,[3]=234049},
			[5]={[0]=234057,[1]=234058,[2]=234059,[3]=234060}
		}
	if NPCORGID==123644 then
		SetSpeakDetail(OwnerID(),"[SC_AC2_NPC_8][$SETVAR1=".."5".."][$SETVAR2=".."[".."243227".."]".."][$SETVAR3=".."[".."243255".."]".."][$SETVAR4=".."[".."243259".."]".."][$SETVAR5=".."[".."243264".."]".."]")
		if Num==1 then			
			for i=0,3 do
				AddSpeakOption(OwnerID(),TargetID(),"[SC_AC2_NPC_6][$SETVAR1=".."["..S1[1][i].."]".."]","AC2_weaponCreatorTalk_3("..S1[1][i]..")",0)	
			end
		elseif Num == 2 then
			for i=0,3 do
				AddSpeakOption(OwnerID(),TargetID(),"[SC_AC2_NPC_6][$SETVAR1=".."["..S1[2][i].."]".."]","AC2_weaponCreatorTalk_3("..S1[2][i]..")",0)	
			end
		elseif Num == 3 then
			for i=0,3 do
				AddSpeakOption(OwnerID(),TargetID(),"[SC_AC2_NPC_6][$SETVAR1=".."["..S1[3][i].."]".."]","AC2_weaponCreatorTalk_3("..S1[3][i]..")",0)	
			end
		elseif Num == 4 then
			for i=0,3 do
				AddSpeakOption(OwnerID(),TargetID(),"[SC_AC2_NPC_6][$SETVAR1=".."["..S1[4][i].."]".."]","AC2_weaponCreatorTalk_3("..S1[4][i]..")",0)	
			end
		elseif Num == 5 then
			for i=0,3 do
				AddSpeakOption(OwnerID(),TargetID(),"[SC_AC2_NPC_6][$SETVAR1=".."["..S1[5][i].."]".."]","AC2_weaponCreatorTalk_3("..S1[5][i]..")",0)	
			end				
		end 
	elseif NPCORGID==123645 then
		SetSpeakDetail(OwnerID(),"[SC_AC2_NPC_8][$SETVAR1=".."5".."][$SETVAR2=".."[".."243228".."]".."][$SETVAR3=".."[".."243256".."]".."][$SETVAR4=".."[".."243260".."]".."][$SETVAR5=".."[".."243264".."]".."]")
		if Num==1 then
						
			for i=0,3 do
				AddSpeakOption(OwnerID(),TargetID(),"[SC_AC2_NPC_6][$SETVAR1=".."["..S2[1][i].."]".."]","AC2_weaponCreatorTalk_3("..S2[1][i]..")",0)	
			end	
		elseif Num == 2 then
			for i=0,3 do
				AddSpeakOption(OwnerID(),TargetID(),"[SC_AC2_NPC_6][$SETVAR1=".."["..S2[2][i].."]".."]","AC2_weaponCreatorTalk_3("..S2[2][i]..")",0)	
			end
		elseif Num == 3 then
			for i=0,3 do
				AddSpeakOption(OwnerID(),TargetID(),"[SC_AC2_NPC_6][$SETVAR1=".."["..S2[3][i].."]".."]","AC2_weaponCreatorTalk_3("..S2[3][i]..")",0)	
			end
		elseif Num == 4 then
			for i=0,3 do
				AddSpeakOption(OwnerID(),TargetID(),"[SC_AC2_NPC_6][$SETVAR1=".."["..S2[4][i].."]".."]","AC2_weaponCreatorTalk_3("..S2[4][i]..")",0)	
			end
		elseif Num == 5 then
			for i=0,3 do
				AddSpeakOption(OwnerID(),TargetID(),"[SC_AC2_NPC_6][$SETVAR1=".."["..S2[5][i].."]".."]","AC2_weaponCreatorTalk_3("..S2[5][i]..")",0)	
			end				
		end 
	elseif NPCORGID==123646 then
		SetSpeakDetail(OwnerID(),"[SC_AC2_NPC_8][$SETVAR1=".."4".."][$SETVAR2=".."[".."243229".."]".."][$SETVAR3=".."[".."243257".."]".."][$SETVAR4=".."[".."243261".."]".."][$SETVAR5=".."[".."243264".."]".."]")
		if Num==1 then			
				AddSpeakOption(OwnerID(),TargetID(),"[SC_AC2_NPC_6][$SETVAR1=".."[".."234011".."]".."]","AC2_weaponCreatorTalk_3(234011)",0)		
				AddSpeakOption(OwnerID(),TargetID(),"[SC_AC2_NPC_6][$SETVAR1=".."[".."234012".."]".."]","AC2_weaponCreatorTalk_3(".."234012"..")",0)
				AddSpeakOption(OwnerID(),TargetID(),"[SC_AC2_NPC_6][$SETVAR1=".."[".."234017".."]".."]","AC2_weaponCreatorTalk_3(".."234017"..")",0)
				AddSpeakOption(OwnerID(),TargetID(),"[SC_AC2_NPC_6][$SETVAR1=".."[".."234066".."]".."]","AC2_weaponCreatorTalk_3(".."234066"..")",0)		
		elseif Num == 2 then
				AddSpeakOption(OwnerID(),TargetID(),"[SC_AC2_NPC_6][$SETVAR1=".."[".."234022".."]".."]","AC2_weaponCreatorTalk_3(".."234022"..")",0)		
				AddSpeakOption(OwnerID(),TargetID(),"[SC_AC2_NPC_6][$SETVAR1=".."[".."234023".."]".."]","AC2_weaponCreatorTalk_3(".."234023"..")",0)
				AddSpeakOption(OwnerID(),TargetID(),"[SC_AC2_NPC_6][$SETVAR1=".."[".."234028".."]".."]","AC2_weaponCreatorTalk_3(".."234028"..")",0)
				AddSpeakOption(OwnerID(),TargetID(),"[SC_AC2_NPC_6][$SETVAR1=".."[".."234067".."]".."]","AC2_weaponCreatorTalk_3(".."234067"..")",0)
		elseif Num == 3 then
				AddSpeakOption(OwnerID(),TargetID(),"[SC_AC2_NPC_6][$SETVAR1=".."[".."234033".."]".."]","AC2_weaponCreatorTalk_3(".."234033"..")",0)		
				AddSpeakOption(OwnerID(),TargetID(),"[SC_AC2_NPC_6][$SETVAR1=".."[".."234034".."]".."]","AC2_weaponCreatorTalk_3(".."234034"..")",0)
				AddSpeakOption(OwnerID(),TargetID(),"[SC_AC2_NPC_6][$SETVAR1=".."[".."234039".."]".."]","AC2_weaponCreatorTalk_3(".."234039"..")",0)

		elseif Num == 4 then
				AddSpeakOption(OwnerID(),TargetID(),"[SC_AC2_NPC_6][$SETVAR1=".."[".."234044".."]".."]","AC2_weaponCreatorTalk_3(".."234044"..")",0)		
				AddSpeakOption(OwnerID(),TargetID(),"[SC_AC2_NPC_6][$SETVAR1=".."[".."234045".."]".."]","AC2_weaponCreatorTalk_3(".."234045"..")",0)
				AddSpeakOption(OwnerID(),TargetID(),"[SC_AC2_NPC_6][$SETVAR1=".."[".."234050".."]".."]","AC2_weaponCreatorTalk_3(".."234050"..")",0)
				AddSpeakOption(OwnerID(),TargetID(),"[SC_AC2_NPC_6][$SETVAR1=".."[".."234068".."]".."]","AC2_weaponCreatorTalk_3(".."234068"..")",0)
		elseif Num == 5 then
				AddSpeakOption(OwnerID(),TargetID(),"[SC_AC2_NPC_6][$SETVAR1=".."[".."234055".."]".."]","AC2_weaponCreatorTalk_3(".."234055"..")",0)		
				AddSpeakOption(OwnerID(),TargetID(),"[SC_AC2_NPC_6][$SETVAR1=".."[".."234056".."]".."]","AC2_weaponCreatorTalk_3(".."234056"..")",0)
				AddSpeakOption(OwnerID(),TargetID(),"[SC_AC2_NPC_6][$SETVAR1=".."[".."234061".."]".."]","AC2_weaponCreatorTalk_3(".."234061"..")",0)
				AddSpeakOption(OwnerID(),TargetID(),"[SC_AC2_NPC_6][$SETVAR1=".."[".."234069".."]".."]","AC2_weaponCreatorTalk_3(".."234069"..")",0)				
		end 
	end	
end


-- NPC兌換裝備  2014/10/13 修正缺少任一需求材料時，仍會扣除其他材料，但不會給予裝備的問題(奈)
function AC2_weaponCreatorTalk_3(Num)
	DebugMsg(0,0,"AC2_weaponCreatorTalk_3="..Num)
	local Owner = OwnerID()
	local Playermoney = ReadRoleValue( Owner , EM_RoleValue_Money ) 
	if Num == 234018 or Num == 234019 or Num == 234020 or Num == 234021 or Num == 234029 or Num == 234030 or Num == 234031 or Num == 234032 or Num == 234040 or Num == 234041 or Num == 234042 or Num == 234043 or Num == 234051 or Num == 234052 or Num == 234053 or Num == 234054 or Num == 234062 or Num == 234063 or Num == 234064 or Num == 234065 then
	--	if Playermoney>= 50000  and  DelBodyItem(Owner,243227,5) and DelBodyItem(Owner,243255,3) and DelBodyItem(Owner,243259,1) and DelBodyItem(Owner,243264,10) then
		local group =	 {	[1] = { 243227 , 5 },
					[2] = { 243255 , 3 },
					[3] = { 243259 , 1 },
					[4] = { 243264 , 10 }	}
		if Playermoney >=  50000 then
			for i = 1 , #group , 1 do
				if CountBodyItem( Owner, group[i][1] ) < group[i][2] then
					ScriptMessage(Owner, Owner, 1,"[SC_WEAVE_REWARD_06]", 0 )
					return false
				end	
			end
			for i = 1 , #group, 1 do
				DelBodyItem( Owner , group[i][1] , group[i][2] )	
			end
			AddRoleValue( Owner , EM_RoleValue_Money , -50000 )
			GiveBodyItem(Owner,Num,1)
		else
			ScriptMessage(Owner, Owner, 1,"[SC_WEAVE_REWARD_06]", 0 );		
		end
	elseif Num == 234013 or Num == 234014 or Num == 234015 or Num == 234016 or Num == 234024 or Num == 234025 or Num == 234026 or Num == 234027 or Num == 234035 or Num == 234036 or Num == 234037 or Num == 234038 or Num == 234046 or Num == 234047 or Num == 234048 or Num == 234049 or Num == 234057 or Num == 234058 or Num == 234059 or Num == 234060 then
		local group =	 {	[1] = { 243228 , 5 },
					[2] = { 243256 , 3 },
					[3] = { 243260 , 1 },
					[4] = { 243264 , 10 }	}
		if Playermoney>= 50000  then
			for i = 1 , #group, 1 do
				if CountBodyItem( Owner, group[i][1] ) < group[i][2] then
					ScriptMessage(Owner, Owner, 1,"[SC_WEAVE_REWARD_06]", 0 )
					return false
				end	
			end
			for i = 1 , #group, 1 do
				DelBodyItem( Owner , group[i][1] , group[i][2] )	
			end
			 AddRoleValue( Owner , EM_RoleValue_Money , -50000 )
			GiveBodyItem(Owner,Num,1)		
		else
			ScriptMessage(Owner, Owner, 1,"[SC_WEAVE_REWARD_06]", 0 );			
		end    
	elseif Num == 234011 or Num == 234012 or Num == 234017 or Num == 234066 or Num == 234022 or Num == 234023 or Num == 234028 or Num == 234067 or Num == 234033 or Num == 234034 or Num == 234039 or Num == 234044 or Num == 234045 or Num == 234050 or Num == 234068 or Num == 234055 or Num == 234056 or Num == 234061 or Num == 234069  then
		local group =	 {	[1] = { 243229 , 4 },
					[2] = { 243257 , 3 },
					[3] = { 243261 , 1 },
					[4] = { 243264 , 10 }	}
		if Playermoney>= 50000  then
			for i = 1 , #group, 1 do
				if CountBodyItem( Owner, group[i][1] ) < group[i][2] then
					ScriptMessage(Owner, Owner, 1,"[SC_WEAVE_REWARD_06]", 0 )
					return false
				end	
			end
			for i = 1 , #group, 1 do
				DelBodyItem( Owner ,  group[i][1] , group[i][2] )	
			end
			 AddRoleValue( Owner , EM_RoleValue_Money , -50000 )
			GiveBodyItem(Owner,Num,1)		
		else
			ScriptMessage(Owner, Owner, 1,"[SC_WEAVE_REWARD_06]", 0 );				
		end          
	elseif Num == 214630 or Num == 214631 or Num == 214632 or Num == 214633 or Num == 214634 or Num == 214635 or Num == 214636 or Num == 214637 or Num == 214638 or Num == 214639 or Num == 214640 or Num == 214641 or Num == 214642 then
		local group =	 {	[1] = { 243230 , 3 },
					[2] = { 243258 , 3 },
					[3] = { 243262 , 1 },
					[4] = { 243264 , 10 }	}

		if Playermoney>= 50000  then
			for i = 1 , #group, 1 do
				if CountBodyItem( Owner, group[i][1] ) < group[i][2] then
					ScriptMessage(Owner, Owner, 1,"[SC_WEAVE_REWARD_06]", 0 )
					return false
				end	
			end
			for i = 1 , #group, 1 do
				DelBodyItem( Owner  , group[i][1] , group[i][2] )	
			end
			 AddRoleValue( Owner , EM_RoleValue_Money , -50000 )
			GiveBodyItem(Owner,Num,1)		
		else
			ScriptMessage(Owner, Owner, 1,"[SC_WEAVE_REWARD_06]", 0 );		
		end     
	else
			ScriptMessage(Owner, Owner, 1,"[SC_WEAVE_REWARD_06]", 0 );	
	end
	CloseSpeak( Owner );  --關閉對話視窗
end

function AC2_weaponCreatorTalk_4()	--下一頁
	local S4 = {[0]=214630,[1]=214631,[2]=214632,[3]=214633,[4]=214634,[5]=214635,[6]=214636}
		SetSpeakDetail(OwnerID(),"[SC_AC2_NPC_8][$SETVAR1=".."3".."][$SETVAR2=".."[".."243230".."]".."][$SETVAR3=".."[".."243258".."]".."][$SETVAR4=".."[".."243262".."]".."][$SETVAR5=".."[".."243264".."]".."]")
		for i=0,6 do
			AddSpeakOption(OwnerID(),TargetID(),"[SC_AC2_NPC_6][$SETVAR1=".."["..S4[i].."]".."]","AC2_weaponCreatorTalk_3("..S4[i]..")",0)
		end
			AddSpeakOption(OwnerID(),TargetID(),"[SC_205764_2]","AC2_weaponCreatorTalk_5",0)
end
function AC2_weaponCreatorTalk_5()
	local S4 = {[0]=214637,[1]=214638,[2]=214639,[3]=214640,[4]=214641,[5]=214642}
		for i=0,5 do
			AddSpeakOption(OwnerID(),TargetID(),"[SC_AC2_NPC_6][$SETVAR1=".."["..S4[i].."]".."]","AC2_weaponCreatorTalk_3("..S4[i]..")",0)
		end
			AddSpeakOption(OwnerID(),TargetID(),"[SO_110068_2]","AC2_weaponCreatorTalk_4",0)
end