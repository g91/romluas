function ic_Easter_npc_1()								
	local own = OwnerID()
	local tar = TargetID()
	if CheckScriptFlag(own, 546231 ) ==false and CheckScriptFlag(own, 546232 ) ==false  then---�����L����
		if ReadRoleValue(tar,EM_RoleValue_OrgID) ==120544 then		---�o�J									
			SetSpeakDetail(OwnerID(),"[SC_SPRING_IC_10]")
			AddSpeakOption(own,tar,"[SC_SPRING_IC_01]","ic_Easter_npc_2",0)					---������
		elseif	ReadRoleValue(tar,EM_RoleValue_OrgID) ==120545 	then---1��
			SetSpeakDetail(OwnerID(),"[SC_SPRING_IC_12]")
		elseif	ReadRoleValue(tar,EM_RoleValue_OrgID) ==120546	then---2��
			SetSpeakDetail(OwnerID(),"[SC_SPRING_IC_13]")
		elseif	ReadRoleValue(tar,EM_RoleValue_OrgID) ==120547	then---3��
			SetSpeakDetail(OwnerID(),"[SC_SPRING_IC_14]")
		end
	elseif	CheckScriptFlag(own, 546231 ) ==true and CheckScriptFlag(own, 546232 ) ==false then---�����Ȭ�����
		if ReadRoleValue(tar,EM_RoleValue_OrgID) ==120544 then---�o�J											
			SetSpeakDetail(OwnerID(),"[SC_SPRING_IC_10]")
			if CheckScriptFlag(own, 546239 ) ==false then									---�����L�C��
				AddSpeakOption(own,tar,"[SC_SPRING_IC_03]","ic_Easter_npc_2",0)				---���C��
				AddSpeakOption(own,tar,"[SC_SPRING_IC_28]","ic_Easter_flower_0_1",0)		---�ǰe����I
			elseif CheckScriptFlag(own, 546239 ) ==true then
				if	CountBodyItem(own,241174 )==0 and
					CountBodyItem(own,241175 )==0 and
					CountBodyItem(own,241176 )==0 and 
					CountBodyItem(own,241177 )==0 and
					CountBodyItem(own,241178 )==0 and
					CountBodyItem(own,241179 )==0 and
					CountBodyItem(own,241180 )==0 then
					AddSpeakOption(own,tar,"[SC_SPRING_IC_15]","ic_Easter_npc_6_1",0)			---�J�����F
				end
				AddSpeakOption(own,tar,"[SC_SPRING_IC_02]","ic_Easter_npc_5",0)				---�^����
			end
		elseif	ReadRoleValue(tar,EM_RoleValue_OrgID) ==120545 	then---1��
				SetSpeakDetail(OwnerID(),"[SC_SPRING_IC_12]")
				if CheckScriptFlag(own, 546239 ) ==true then
					if CheckScriptFlag(own, 546233 ) ==false then								---���e�L
						AddSpeakOption(own,tar,"[SC_SPRING_IC_05]","ic_Easter_npc_2",0)			---�e�J
					elseif CheckScriptFlag(own, 546233 ) ==true and CheckScriptFlag(own, 546234 ) ==false then							---�e�L1��
						AddSpeakOption(own,tar,"[SC_SPRING_IC_06]","ic_Easter_npc_2",0)			---�e�J
					elseif CheckScriptFlag(own, 546234 ) ==true then							---�e�L2��
						AddSpeakOption(own,tar,"[SC_SPRING_IC_07]","ic_Easter_npc_2_1_0",0)		---�e�J
					end
					AddSpeakOption(own,tar,"[SC_SPRING_IC_08]","ic_Easter_npc_3",0)				---�̤j����
					AddSpeakOption(own,tar,"[SC_SPRING_IC_09]","ic_Easter_npc_4",0)				---�̤j��100%
				end	
		elseif	ReadRoleValue(tar,EM_RoleValue_OrgID) ==120546	then---2��
				SetSpeakDetail(OwnerID(),"[SC_SPRING_IC_13]")
				if CheckScriptFlag(own, 546239 ) ==true then
					if CheckScriptFlag(own, 546235 ) ==false then									---���e�L
						AddSpeakOption(own,tar,"[SC_SPRING_IC_05]","ic_Easter_npc_2",0)			---�e�J
					elseif CheckScriptFlag(own, 546235 ) ==true and CheckScriptFlag(own, 546236 ) ==false then							---�e�L1��
						AddSpeakOption(own,tar,"[SC_SPRING_IC_06]","ic_Easter_npc_2",0)			---�e�J
					elseif CheckScriptFlag(own, 546236 ) ==true then							---�e�L2��
						AddSpeakOption(own,tar,"[SC_SPRING_IC_07]","ic_Easter_npc_2_2_0",0)		---�e�J
					end
					AddSpeakOption(own,tar,"[SC_SPRING_IC_08]","ic_Easter_npc_3",0)				---�̤j����
					AddSpeakOption(own,tar,"[SC_SPRING_IC_09]","ic_Easter_npc_4",0)				---�̤j��100%
				end	
		elseif	ReadRoleValue(tar,EM_RoleValue_OrgID) ==120547	then---3��
				SetSpeakDetail(OwnerID(),"[SC_SPRING_IC_14]")
				if CheckScriptFlag(own, 546239 ) ==true then
					if CheckScriptFlag(own, 546237 ) ==false then									---���e�L
						AddSpeakOption(own,tar,"[SC_SPRING_IC_05]","ic_Easter_npc_2",0)			---�e�J
					elseif CheckScriptFlag(own, 546237 ) ==true and CheckScriptFlag(own, 546238 ) ==false then							---�e�L1��
						AddSpeakOption(own,tar,"[SC_SPRING_IC_06]","ic_Easter_npc_2",0)			---�e�J
					elseif CheckScriptFlag(own, 546238 ) ==true then							---�e�L2��
						AddSpeakOption(own,tar,"[SC_SPRING_IC_07]","ic_Easter_npc_2_3_0",0)		---�e�J
					end
					AddSpeakOption(own,tar,"[SC_SPRING_IC_08]","ic_Easter_npc_3",0)				---�̤j����
					AddSpeakOption(own,tar,"[SC_SPRING_IC_09]","ic_Easter_npc_4",0)				---�̤j��100%
				end	
		end
	elseif CheckScriptFlag(own, 546232 ) ==true then										---��������
		if ReadRoleValue(tar,EM_RoleValue_OrgID) ==120544 then		---�o�J									
			SetSpeakDetail(OwnerID(),"[SC_SPRING_IC_11]")
		elseif	ReadRoleValue(tar,EM_RoleValue_OrgID) ==120545 	then---1��
			SetSpeakDetail(OwnerID(),"[SC_SPRING_IC_12]")
		elseif	ReadRoleValue(tar,EM_RoleValue_OrgID) ==120546	then---2��
			SetSpeakDetail(OwnerID(),"[SC_SPRING_IC_13]")
		elseif	ReadRoleValue(tar,EM_RoleValue_OrgID) ==120547	then---3��
			SetSpeakDetail(OwnerID(),"[SC_SPRING_IC_14]")
		end
	end
end	
function ic_Easter_npc_2()	  							
	local own = OwnerID()
	local tar = TargetID()
	local Luck=0
	local Egg
	if	ReadRoleValue(tar,EM_RoleValue_OrgID) ==120544	then	---�Ϊ�
		if CheckScriptFlag(own, 546231 ) ==true and CheckScriptFlag(own, 546239 ) ==false then---���C��
			if 		CountBodyItem( own, 240511 )==6  then	
				DelBodyItem( own, 240511,6)
				GiveBodyItem(own, 241043,6)
				GiveBodyItem(own, 546239,1)
				GiveBodyItem(own, 241174,1)
				ScriptMessage( own, own, 0,"[SC_SPRING_IC_27]", 0 )
				ScriptMessage( own, own, 1,"[SC_SPRING_IC_27]", 0 )
			elseif	CountBodyItem( own, 240511 )<6 then
				ScriptMessage( own, own, 1,"[SC_SPRING_IC_26]", 0 )
				ScriptMessage( own, own, 0,"[SC_SPRING_IC_26]", 0 )
				--say(own,"240511<6")
			end
		elseif CheckScriptFlag(own, 546231 ) ==false then									---������
			Egg=ReadRoleValue(own, EM_LuaValueFlag_UseItem33)
			AddRoleValue(own , EM_LuaValueFlag_UseItem33,-Egg)		
			GiveBodyItem(own, 546231,1)
			ScriptMessage( own, own, 0,"[SC_SPRING_IC_29]", 0 )
			ScriptMessage( own, own, 1,"[SC_SPRING_IC_29]", 0 )
			BeginPlot( own , "ic_Easter_flower_0_2",0)
		end	
		CloseSpeak(own)
	elseif	ReadRoleValue(tar,EM_RoleValue_OrgID) ==120545	then	---1��1
		if CountBodyItem(own,241043 )>0 and CountBodyItem(own,241174 )==1 or
		   CountBodyItem(own,241043 )>0 and CountBodyItem(own,241175 )==1 or
		   CountBodyItem(own,241043 )>0 and CountBodyItem(own,241176 )==1 or
		   CountBodyItem(own,241043 )>0 and CountBodyItem(own,241177 )==1 or
		   CountBodyItem(own,241043 )>0 and CountBodyItem(own,241178 )==1 or
		   CountBodyItem(own,241043 )>0 and CountBodyItem(own,241179 )==1 or
		   CountBodyItem(own,241043 )>0 and CountBodyItem(own,241180 )==1 then
			Luck=RandRange(1,20)
			--say(own,"Luck="..Luck)
			if CheckScriptFlag(own, 546233 ) ==false  then										---���e�L
				AddRoleValue(own , EM_LuaValueFlag_UseItem33,Luck)
				GiveBodyItem(own, 546233,1)
				ic_Egg(tar,own,1)
			elseif CheckScriptFlag(own,546233) ==true and CheckScriptFlag(own, 546234 ) ==false then---�e�L1��
				AddRoleValue(own , EM_LuaValueFlag_UseItem33,Luck)
				GiveBodyItem(own, 546234,1)
				ic_Egg(tar,own,1)
			end
		elseif	CountBodyItem(own,241043 )<1  then
				ScriptMessage( own, own, 1,"[SC_SPRING_IC_33]", 0 )
				ScriptMessage( own, own, 0,"[SC_SPRING_IC_33]", 0 )
		elseif	CountBodyItem(own,241174 )==0 and
				CountBodyItem(own,241175 )==0 and
				CountBodyItem(own,241176 )==0 and 
				CountBodyItem(own,241177 )==0 and
				CountBodyItem(own,241178 )==0 and
				CountBodyItem(own,241179 )==0 and
				CountBodyItem(own,241180 )==0 then
				ScriptMessage( own, own, 1,"[SC_SPRING_IC_25]", 0 )
				ScriptMessage( own, own, 0,"[SC_SPRING_IC_25]", 0 )
				--say(own,"egg_no")	
		end
		CloseSpeak(own)
	elseif	ReadRoleValue(tar,EM_RoleValue_OrgID) ==120546	then	---2��2
		if CountBodyItem(own,241043 )>0 and CountBodyItem(own,241174 )==1 or
		   CountBodyItem(own,241043 )>0 and CountBodyItem(own,241175 )==1 or
		   CountBodyItem(own,241043 )>0 and CountBodyItem(own,241176 )==1 or
		   CountBodyItem(own,241043 )>0 and CountBodyItem(own,241177 )==1 or
		   CountBodyItem(own,241043 )>0 and CountBodyItem(own,241178 )==1 or
		   CountBodyItem(own,241043 )>0 and CountBodyItem(own,241179 )==1 or
		   CountBodyItem(own,241043 )>0 and CountBodyItem(own,241180 )==1 then
			Luck=RandRange(1,40)
			--say(own,"Luck="..Luck)
			if CheckScriptFlag(own, 546235 ) ==false then										---���e�L
				AddRoleValue(own , EM_LuaValueFlag_UseItem33,Luck)
				GiveBodyItem(own, 546235,1)
				ic_Egg(tar,own,1)
			elseif CheckScriptFlag(own, 546235 ) ==true and CheckScriptFlag(own, 546236 ) ==false then---�e�L1��
				AddRoleValue(own , EM_LuaValueFlag_UseItem33,Luck)
				GiveBodyItem(own, 546236,1)
				ic_Egg(tar,own,1)
			end
		elseif	CountBodyItem(own,241043 )<1  then
				ScriptMessage( own, own, 1,"[SC_SPRING_IC_33]", 0 )
				ScriptMessage( own, own, 0,"[SC_SPRING_IC_33]", 0 )
		elseif	CountBodyItem(own,241174 )==0 and
				CountBodyItem(own,241175 )==0 and
				CountBodyItem(own,241176 )==0 and 
				CountBodyItem(own,241177 )==0 and
				CountBodyItem(own,241178 )==0 and
				CountBodyItem(own,241179 )==0 and
				CountBodyItem(own,241180 )==0 then
				ScriptMessage( own, own, 1,"[SC_SPRING_IC_25]", 0 )
				ScriptMessage( own, own, 0,"[SC_SPRING_IC_25]", 0 )
				--say(own,"egg_no")
		end	
		CloseSpeak(own)
	elseif	ReadRoleValue(tar,EM_RoleValue_OrgID) ==120547	then	---3��3
		if CountBodyItem(own,241043 )>0 and CountBodyItem(own,241174 )==1 or
		   CountBodyItem(own,241043 )>0 and CountBodyItem(own,241175 )==1 or
		   CountBodyItem(own,241043 )>0 and CountBodyItem(own,241176 )==1 or
		   CountBodyItem(own,241043 )>0 and CountBodyItem(own,241177 )==1 or
		   CountBodyItem(own,241043 )>0 and CountBodyItem(own,241178 )==1 or
		   CountBodyItem(own,241043 )>0 and CountBodyItem(own,241179 )==1 or
		   CountBodyItem(own,241043 )>0 and CountBodyItem(own,241180 )==1 then
			Luck=RandRange(1,60)
			--say(own,"Luck="..Luck)
			if CheckScriptFlag(own, 546237 ) ==false then										---���e�L
				AddRoleValue(own , EM_LuaValueFlag_UseItem33,Luck)
				GiveBodyItem(own, 546237,1)
				ic_Egg(tar,own,1)
			elseif CheckScriptFlag(own, 546237 ) ==true and CheckScriptFlag(own, 546238 ) ==false then									---�e�L1��
				AddRoleValue(own , EM_LuaValueFlag_UseItem33,Luck)
				GiveBodyItem(own, 546238,1)
				ic_Egg(tar,own,1)
			end
		elseif	CountBodyItem(own,241043 )<1  then
				ScriptMessage( own, own, 1,"[SC_SPRING_IC_33]", 0 )
				ScriptMessage( own, own, 0,"[SC_SPRING_IC_33]", 0 )
		elseif	CountBodyItem(own,241174 )==0 and
				CountBodyItem(own,241175 )==0 and
				CountBodyItem(own,241176 )==0 and 
				CountBodyItem(own,241177 )==0 and
				CountBodyItem(own,241178 )==0 and
				CountBodyItem(own,241179 )==0 and
				CountBodyItem(own,241180 )==0 then
				ScriptMessage( own, own, 1,"[SC_SPRING_IC_25]", 0 )
				ScriptMessage( own, own, 0,"[SC_SPRING_IC_25]", 0 )
				--say(own,"egg_no")
		end		
		CloseSpeak(own)
		--say(own,"3=OK")
	end
end
function ic_Easter_npc_2_1_0()
	local own = OwnerID()
	local Egg
	Egg=ReadRoleValue(own, EM_LuaValueFlag_UseItem33)
	if	Egg<220 then
		BeginPlot( own , "ic_Easter_npc_2_1_1",0)
	elseif Egg>219 then
		ScriptMessage( own, own, 1,"[SC_SPRING_IC_34]", 0 )
		ScriptMessage( own, own, 0,"[SC_SPRING_IC_34]", 0 )
	end
	CloseSpeak(own)
end
function ic_Easter_npc_2_1_1()
local own = OwnerID()
	local Egg
	local Egg1
	local Luck=0
	if CountBodyItem( own, 202903 )<1 then
		ScriptMessage( own, own, 1,"[SC_SPRING_IC_20]", 0 )
		ScriptMessage( own, own, 0,"[SC_SPRING_IC_20]", 0 )
	elseif 		CountBodyItem( own, 202903 )>0 then	
		if CheckBuff(own, 501570) == true then  --�W�[�ˬd�P�_
			ScriptMessage(own,own, 0, "[SC_WINDOW_OPENED]", 0 );
		else	
			AddBuff(own, 501570,0,-1);--�M�ᵹ��BUFF
		end
		DialogCreate(own, EM_LuaDialogType_YesNo ,"[SC_SPRING_IC_19]")
		DialogSelectStr(own, "[SC_GETTITLE_1]" )
		DialogSelectStr(own, "[SC_CANCEL]" )
		if( DialogSendOpen(own) == false ) then 
			ScriptMessage(own,own,1,"[SYS_FIXEQ_DATA_ERROR]",0)	
			return
		end
		for i = 0 , 300 , 1 do
			Sleep( 1 );
			SelectID = DialogGetResult(own);
			if ( SelectID ~= -2 ) and ( SelectID ~= -1 ) and i < 300 then
				if ( SelectID == 0 ) then
					if 		CountBodyItem( own, 202903 )>0 then
						Luck=RandRange(1,20)
						--say(own,"Luck="..Luck)
						AddRoleValue(own , EM_LuaValueFlag_UseItem33,Luck)
						DelBodyItem(own,202903,1)
						lua_star_BossKilledCount(120545)
						ic_Egg(own,own,0)
						--say(own,"3")
					elseif CountBodyItem( own, 202903 )<1 then
						ScriptMessage( own, own, 1,"[SC_SPRING_IC_20]", 0 )
						ScriptMessage( own, own, 0,"[SC_SPRING_IC_20]", 0 )
						--say(own,"202903<1")
					end	
						CancelBuff(own, 501570 );--�̫�M��BUFF
					break
				elseif ( SelectID == 1 ) then
					-- ��_
					CancelBuff(own, 501570 );--�̫�M��BUFF
					DialogClose(own)	
					break
				end
			elseif i == 300 then
				CancelBuff(own, 501570 );--�̫�M��BUFF
				DialogClose(own)	
				break
			end
		end
	end	
end
function ic_Easter_npc_2_2_0()
	local own = OwnerID()
	local Egg
	Egg=ReadRoleValue(own, EM_LuaValueFlag_UseItem33)
	if	Egg<220 then
		BeginPlot( own , "ic_Easter_npc_2_2_1",0)
	elseif Egg>219 then
		ScriptMessage( own, own, 1,"[SC_SPRING_IC_34]", 0 )
		ScriptMessage( own, own, 0,"[SC_SPRING_IC_34]", 0 )
	end
	CloseSpeak(own)
end
function ic_Easter_npc_2_2_1()
local own = OwnerID()
	local Egg
	local Egg1
	local Luck=0
	if CountBodyItem( own, 202903 )<1 then
		ScriptMessage( own, own, 1,"[SC_SPRING_IC_20]", 0 )
		ScriptMessage( own, own, 0,"[SC_SPRING_IC_20]", 0 )
	elseif 		CountBodyItem( own, 202903 )>0 then	
		if CheckBuff(own, 501570) == true then  --�W�[�ˬd�P�_
			ScriptMessage(own,own, 0, "[SC_WINDOW_OPENED]", 0 );
		else	
			AddBuff(own, 501570,0,-1);--�M�ᵹ��BUFF
		end
		DialogCreate(own, EM_LuaDialogType_YesNo ,"[SC_SPRING_IC_19]")
		DialogSelectStr(own, "[SC_GETTITLE_1]" )
		DialogSelectStr(own, "[SC_CANCEL]" )
		if( DialogSendOpen(own) == false ) then 
			ScriptMessage(own,own,1,"[SYS_FIXEQ_DATA_ERROR]",0)	
			return
		end
		for i = 0 , 300 , 1 do
			Sleep( 1 );
			SelectID = DialogGetResult(own);
			if ( SelectID ~= -2 ) and ( SelectID ~= -1 ) and i < 300 then
				if ( SelectID == 0 ) then
					if 		CountBodyItem( own, 202903 )>0 then
						Luck=RandRange(1,40)
						--say(own,"Luck="..Luck)
						AddRoleValue(own , EM_LuaValueFlag_UseItem33,Luck)
						DelBodyItem(own,202903,1)
						lua_star_BossKilledCount(120545)
						ic_Egg(own,own,0)
						--say(own,"3")
					elseif CountBodyItem( own, 202903 )<1 then
						ScriptMessage( own, own, 1,"[SC_SPRING_IC_20]", 0 )
						ScriptMessage( own, own, 0,"[SC_SPRING_IC_20]", 0 )
						--say(own,"202903<1")
					end	
						CancelBuff(own, 501570 );--�̫�M��BUFF
					break
				elseif ( SelectID == 1 ) then
					-- ��_
					CancelBuff(own, 501570 );--�̫�M��BUFF
					DialogClose(own)	
					break
				end
			elseif i == 300 then
				CancelBuff(own, 501570 );--�̫�M��BUFF
				DialogClose(own)	
				break
			end
		end
	end	
end
function ic_Easter_npc_2_3_0()
	local own = OwnerID()
	local Egg
	Egg=ReadRoleValue(own, EM_LuaValueFlag_UseItem33)
	if	Egg<220 then
		BeginPlot( own , "ic_Easter_npc_2_3_1",0)
	elseif Egg>219 then
		ScriptMessage( own, own, 1,"[SC_SPRING_IC_34]", 0 )
		ScriptMessage( own, own, 0,"[SC_SPRING_IC_34]", 0 )
	end
	CloseSpeak(own)
end
function ic_Easter_npc_2_3_1()
local own = OwnerID()
	local Egg
	local Egg1
	local Luck=0
	if CountBodyItem( own, 202903 )<1 then
		ScriptMessage( own, own, 1,"[SC_SPRING_IC_20]", 0 )
		ScriptMessage( own, own, 0,"[SC_SPRING_IC_20]", 0 )
	elseif 		CountBodyItem( own, 202903 )>0 then	
		if CheckBuff(own, 501570) == true then  --�W�[�ˬd�P�_
			ScriptMessage(own,own, 0, "[SC_WINDOW_OPENED]", 0 );
		else	
			AddBuff(own, 501570,0,-1);--�M�ᵹ��BUFF
		end
		DialogCreate(own, EM_LuaDialogType_YesNo ,"[SC_SPRING_IC_19]")
		DialogSelectStr(own, "[SC_GETTITLE_1]" )
		DialogSelectStr(own, "[SC_CANCEL]" )
		if( DialogSendOpen(own) == false ) then 
			ScriptMessage(own,own,1,"[SYS_FIXEQ_DATA_ERROR]",0)	
			return
		end
		for i = 0 , 300 , 1 do
			Sleep( 1 );
			SelectID = DialogGetResult(own);
			if ( SelectID ~= -2 ) and ( SelectID ~= -1 ) and i < 300 then
				if ( SelectID == 0 ) then
					if 		CountBodyItem( own, 202903 )>0 then
						Luck=RandRange(1,60)
						--say(own,"Luck="..Luck)
						AddRoleValue(own , EM_LuaValueFlag_UseItem33,Luck)
						DelBodyItem(own,202903,1)
						lua_star_BossKilledCount(120545)
						ic_Egg(own,own,0)
						--say(own,"3")
					elseif CountBodyItem( own, 202903 )<1 then
						ScriptMessage( own, own, 1,"[SC_SPRING_IC_20]", 0 )
						--say(own,"202903<1")
					end	
						CancelBuff(own, 501570 );--�̫�M��BUFF
					break
				elseif ( SelectID == 1 ) then
					-- ��_
					CancelBuff(own, 501570 );--�̫�M��BUFF
					DialogClose(own)	
					break
				end
			elseif i == 300 then
				CancelBuff(own, 501570 );--�̫�M��BUFF
				DialogClose(own)	
				break
			end
		end
	end	
end
function ic_Easter_npc_3()	  																---�̤j����					
	local own = OwnerID()
	local tar = TargetID()
	local Egg
	Egg=ReadRoleValue(own, EM_LuaValueFlag_UseItem33)
	if	Egg<220 then
		if 		CountBodyItem( own, 202903 )>1 then
			if	ReadRoleValue(tar,EM_RoleValue_OrgID) ==120545	then	---1��1
				BeginPlot( own , "ic_Easter_npc_3_20",0)
			elseif	ReadRoleValue(tar,EM_RoleValue_OrgID) ==120546	then	---2��2
				BeginPlot( own , "ic_Easter_npc_3_40",0)
			elseif	ReadRoleValue(tar,EM_RoleValue_OrgID) ==120547	then	---3��3
				BeginPlot( own , "ic_Easter_npc_3_60",0)
			end
		elseif CountBodyItem( own, 202903 )<2 then
			ScriptMessage( own, own, 0,"[SC_SPRING_IC_21]", 0 )
			ScriptMessage( own, own, 1,"[SC_SPRING_IC_21]", 0 )
			--say(own,"202903<2")
		end	
	elseif Egg>219 then
		ScriptMessage( own, own, 1,"[SC_SPRING_IC_34]", 0 )
		ScriptMessage( own, own, 0,"[SC_SPRING_IC_34]", 0 )
	end
	CloseSpeak(own)
end	
function ic_Easter_npc_3_20()
	local own = OwnerID()
	local Egg
	local Egg1
	if CheckBuff(own, 501570) == true then  --�W�[�ˬd�P�_
		ScriptMessage(own,own, 0, "[SC_WINDOW_OPENED]", 0 );
	else	
		AddBuff(own, 501570,0,-1);--�M�ᵹ��BUFF
	end
	DialogCreate(own, EM_LuaDialogType_YesNo ,"[SC_SPRING_IC_17]")							
	DialogSelectStr(own, "[SC_GETTITLE_1]" )
	DialogSelectStr(own, "[SC_CANCEL]" )
	if( DialogSendOpen(own) == false ) then 
		ScriptMessage(own,own,1,"[SYS_FIXEQ_DATA_ERROR]",0)	
		return
	end
	for i = 0 , 300 , 1 do
		Sleep( 1 );
		SelectID = DialogGetResult(own);
		if ( SelectID ~= -2 ) and ( SelectID ~= -1 ) and i < 300 then
			if ( SelectID == 0 ) then
				if 	CountBodyItem( own, 202903 )>1 then
					AddRoleValue(own , EM_LuaValueFlag_UseItem33,20)
					ic_Egg(own,own,0)
					DelBodyItem(own,202903,2)
					lua_star_BossKilledCount(120546)
					CancelBuff(own, 501570 );--�̫�M��BUFF
					break
				elseif CountBodyItem( own, 202903 )<2 then
					ScriptMessage( own, own, 0,"[SC_SPRING_IC_21]", 0 )
					ScriptMessage( own, own, 1,"[SC_SPRING_IC_21]", 0 )
					CancelBuff(own, 501570 );--�̫�M��BUFF
					break
				end	
			elseif ( SelectID == 1 ) then
				-- ��_
				CancelBuff(own, 501570 );--�̫�M��BUFF
				DialogClose(own)	
				break
			end
		elseif i == 300 then
			CancelBuff(own, 501570 );--�̫�M��BUFF
			DialogClose(own)	
			break
		end
	end
end
function ic_Easter_npc_3_40()
	local own = OwnerID()
	local Egg
	local Egg1
	if CheckBuff(own, 501570) == true then  --�W�[�ˬd�P�_
		ScriptMessage(own,own, 0, "[SC_WINDOW_OPENED]", 0 );
	else	
		AddBuff(own, 501570,0,-1);--�M�ᵹ��BUFF
	end
	DialogCreate(own, EM_LuaDialogType_YesNo ,"[SC_SPRING_IC_17]")
	DialogSelectStr(own, "[SC_GETTITLE_1]" )
	DialogSelectStr(own, "[SC_CANCEL]" )
	if( DialogSendOpen(own) == false ) then 
		ScriptMessage(own,own,1,"[SYS_FIXEQ_DATA_ERROR]",0)	
		return
	end
	for i = 0 , 300 , 1 do
		Sleep( 1 );
		SelectID = DialogGetResult(own);
		if ( SelectID ~= -2 ) and ( SelectID ~= -1 ) and i < 300 then
			if ( SelectID == 0 ) then
				if 	CountBodyItem( own, 202903 )>1 then
					AddRoleValue(own , EM_LuaValueFlag_UseItem33,40)
					ic_Egg(own,own,0)
					DelBodyItem(own,202903,2)
					lua_star_BossKilledCount(120546)
					CancelBuff(own, 501570 );--�̫�M��BUFF
					break
				elseif CountBodyItem( own, 202903 )<2 then
					ScriptMessage( own, own, 0,"[SC_SPRING_IC_21]", 0 )
					ScriptMessage( own, own, 1,"[SC_SPRING_IC_21]", 0 )
					CancelBuff(own, 501570 );--�̫�M��BUFF
					break
				end	
			elseif ( SelectID == 1 ) then
				-- ��_
				CancelBuff(own, 501570 );--�̫�M��BUFF
				DialogClose(own)	
				break
			end
		elseif i == 300 then
			CancelBuff(own, 501570 );--�̫�M��BUFF
			DialogClose(own)	
			break
		end
	end
end
function ic_Easter_npc_3_60()
	local own = OwnerID()
	local Egg
	local Egg1
	if CheckBuff(own, 501570) == true then  --�W�[�ˬd�P�_
		ScriptMessage(own,own, 0, "[SC_WINDOW_OPENED]", 0 );
	else	
		AddBuff(own, 501570,0,-1);--�M�ᵹ��BUFF
	end
	DialogCreate(own, EM_LuaDialogType_YesNo ,"[SC_SPRING_IC_17]")
	DialogSelectStr(own, "[SC_GETTITLE_1]" )
	DialogSelectStr(own, "[SC_CANCEL]" )
	if( DialogSendOpen(own) == false ) then 
		ScriptMessage(own,own,1,"[SYS_FIXEQ_DATA_ERROR]",0)	
		return
	end
	for i = 0 , 300 , 1 do
		Sleep( 1 );
		SelectID = DialogGetResult(own);
		if ( SelectID ~= -2 ) and ( SelectID ~= -1 ) and i < 300 then
			if ( SelectID == 0 ) then
				if 	CountBodyItem( own, 202903 )>1 then
					AddRoleValue(own , EM_LuaValueFlag_UseItem33,60)
					ic_Egg(own,own,0)
					DelBodyItem(own,202903,2)
					lua_star_BossKilledCount(120546)
					CancelBuff(own, 501570 );--�̫�M��BUFF
					break
				elseif CountBodyItem( own, 202903 )<2 then
					ScriptMessage( own, own, 0,"[SC_SPRING_IC_21]", 0 )
					ScriptMessage( own, own, 1,"[SC_SPRING_IC_21]", 0 )
					CancelBuff(own, 501570 );--�̫�M��BUFF
					break
				end	
			elseif ( SelectID == 1 ) then
				-- ��_
				CancelBuff(own, 501570 );--�̫�M��BUFF
				DialogClose(own)	
				break
			end
		elseif i == 300 then
			CancelBuff(own, 501570 );--�̫�M��BUFF
			DialogClose(own)	
			break
		end
	end
end
function ic_Easter_npc_4()	  																---100%						
	local own = OwnerID()
	local tar = TargetID()
	local Luck=0
	local Egg
	Egg=ReadRoleValue(own, EM_LuaValueFlag_UseItem33)
		if	Egg<220 and Egg~=100 then
			if 		CountBodyItem( own, 202903 )>5 then
				if	ReadRoleValue(tar,EM_RoleValue_OrgID) ==120545	then	---1��1
					BeginPlot( own , "ic_Easter_npc_4_1_20",0)
				elseif	ReadRoleValue(tar,EM_RoleValue_OrgID) ==120546	then	---2��2
					BeginPlot( own , "ic_Easter_npc_4_1_20",0)
				elseif	ReadRoleValue(tar,EM_RoleValue_OrgID) ==120547	then	---3��3
					BeginPlot( own , "ic_Easter_npc_4_1_20",0)
				end
			elseif CountBodyItem( own, 202903 )<6 then
				ScriptMessage( own, own, 1,"[SC_SPRING_IC_22]", 0 )
				ScriptMessage( own, own, 0,"[SC_SPRING_IC_22]", 0 )
				--say(own,"202903<5")
			end	
	elseif Egg==100 then
		ScriptMessage( own, own, 1,"[SC_SPRING_IC_35]", 0 )
		ScriptMessage( own, own, 0,"[SC_SPRING_IC_35]", 0 )
	elseif Egg>219 then
		ScriptMessage( own, own, 1,"[SC_SPRING_IC_34]", 0 )
		ScriptMessage( own, own, 0,"[SC_SPRING_IC_34]", 0 )
	end
	CloseSpeak(own)
end	
function ic_Easter_npc_4_1_20()
	local own = OwnerID()
		local Egg
		local Egg1
		if CheckBuff(own, 501570) == true then  --�W�[�ˬd�P�_
			ScriptMessage(own,own, 0, "[SC_WINDOW_OPENED]", 0 );
		else	
			AddBuff(own, 501570,0,-1);--�M�ᵹ��BUFF
		end
		DialogCreate(own, EM_LuaDialogType_YesNo ,"[SC_SPRING_IC_18]")
		DialogSelectStr(own, "[SC_GETTITLE_1]" )
		DialogSelectStr(own, "[SC_CANCEL]" )
		if( DialogSendOpen(own) == false ) then 
			ScriptMessage(own,own,1,"[SYS_FIXEQ_DATA_ERROR]",0)	
			return
		end
		for i = 0 , 300 , 1 do
			Sleep( 1 );
			SelectID = DialogGetResult(own);
			if ( SelectID ~= -2 ) and ( SelectID ~= -1 ) and i < 300 then
				if ( SelectID == 0 ) then
					if 		CountBodyItem( own, 202903 )>5 then
							Egg=ReadRoleValue(own, EM_LuaValueFlag_UseItem33)
							if Egg<220 then
								AddRoleValue(own , EM_LuaValueFlag_UseItem33,-Egg)
								AddRoleValue(own , EM_LuaValueFlag_UseItem33,100)
								ic_Egg(own,own,0)
							end	
							DelBodyItem(own,202903,6)
							lua_star_BossKilledCount(120547)
							CancelBuff(own, 501570 );--�̫�M��BUFF
							break
					elseif CountBodyItem( own, 202903 )<6 then
						ScriptMessage( own, own, 1,"[SC_SPRING_IC_22]", 0 )
						ScriptMessage( own, own, 0,"[SC_SPRING_IC_22]", 0 )	
						CancelBuff(own, 501570 );--�̫�M��BUFF
						break
					end	
				elseif ( SelectID == 1 ) then
					-- ��_
					CancelBuff(own, 501570 );--�̫�M��BUFF
					DialogClose(own)	
					break
				end
			elseif i == 300 then
				CancelBuff(own, 501570 );--�̫�M��BUFF
				DialogClose(own)	
				break
			end
		end
end
function ic_Easter_npc_4_1_40()
	local own = OwnerID()
		local Egg
		local Egg1
		if CheckBuff(own, 501570) == true then  --�W�[�ˬd�P�_
			ScriptMessage(own,own, 0, "[SC_WINDOW_OPENED]", 0 );
		else	
			AddBuff(own, 501570,0,-1);--�M�ᵹ��BUFF
		end
		DialogCreate(own, EM_LuaDialogType_YesNo ,"[SC_SPRING_IC_18]")
		DialogSelectStr(own, "[SC_GETTITLE_1]" )
		DialogSelectStr(own, "[SC_CANCEL]" )
		if( DialogSendOpen(own) == false ) then 
			ScriptMessage(own,own,1,"[SYS_FIXEQ_DATA_ERROR]",0)	
			return
		end
		for i = 0 , 300 , 1 do
			Sleep( 1 );
			SelectID = DialogGetResult(own);
			if ( SelectID ~= -2 ) and ( SelectID ~= -1 ) and i < 300 then
				if ( SelectID == 0 ) then
					if 		CountBodyItem( own, 202903 )>4 then
						Egg=ReadRoleValue(own, EM_LuaValueFlag_UseItem33)
						if Egg<60 then
						AddRoleValue(own , EM_LuaValueFlag_UseItem33,40)
						ic_Egg(own,own,0)
						elseif Egg>=60 and Egg<100  then
							Luck=100-Egg
							AddRoleValue(own , EM_LuaValueFlag_UseItem33,Luck)
							ic_Egg(own,own,0)
						end
						DelBodyItem(own,202903,5)
						lua_star_BossKilledCount(120547)
						CancelBuff(own, 501570 );--�̫�M��BUFF
						break
					elseif CountBodyItem( own, 202903 )<5 then
						ScriptMessage( own, own, 1,"[SC_SPRING_IC_22]", 0 )
						ScriptMessage( own, own, 0,"[SC_SPRING_IC_22]", 0 )	
						CancelBuff(own, 501570 );--�̫�M��BUFF
						break
					end	
				elseif ( SelectID == 1 ) then
					-- ��_
					CancelBuff(own, 501570 );--�̫�M��BUFF
					DialogClose(own)	
					break
				end
			elseif i == 300 then
				CancelBuff(own, 501570 );--�̫�M��BUFF
				DialogClose(own)	
				break
			end
		end
end	
function ic_Easter_npc_4_1_60()
	local own = OwnerID()
	local Egg
	local Egg1
	if CheckBuff(own, 501570) == true then  --�W�[�ˬd�P�_
		ScriptMessage(own,own, 0, "[SC_WINDOW_OPENED]", 0 );
	else	
		AddBuff(own, 501570,0,-1);--�M�ᵹ��BUFF
	end
	DialogCreate(own, EM_LuaDialogType_YesNo ,"[SC_SPRING_IC_18]")
	DialogSelectStr(own, "[SC_GETTITLE_1]" )
	DialogSelectStr(own, "[SC_CANCEL]" )
	if( DialogSendOpen(own) == false ) then 
		ScriptMessage(own,own,1,"[SYS_FIXEQ_DATA_ERROR]",0)	
		return
	end
	for i = 0 , 300 , 1 do
		Sleep( 1 );
		SelectID = DialogGetResult(own);
		if ( SelectID ~= -2 ) and ( SelectID ~= -1 ) and i < 300 then
			if ( SelectID == 0 ) then
				if 		CountBodyItem( own, 202903 )>4 then
					Egg=ReadRoleValue(own, EM_LuaValueFlag_UseItem33)
					if Egg<40 then
						AddRoleValue(own , EM_LuaValueFlag_UseItem33,60)
						ic_Egg(own,own,0)
					elseif Egg>=40 and Egg<100  then
						Luck=100-Egg
						AddRoleValue(own , EM_LuaValueFlag_UseItem33,Luck)
						ic_Egg(own,own,0)
					end
					DelBodyItem(own,202903,5)
					lua_star_BossKilledCount(120547)
					CancelBuff(own, 501570 );--�̫�M��BUFF
					break
				elseif CountBodyItem( own, 202903 )<5 then
					ScriptMessage( own, own, 1,"[SC_SPRING_IC_22]", 0 )
					ScriptMessage( own, own, 0,"[SC_SPRING_IC_22]", 0 )	
					CancelBuff(own, 501570 );--�̫�M��BUFF
					break
				end	
			elseif ( SelectID == 1 ) then
				-- ��_
				CancelBuff(own, 501570 );--�̫�M��BUFF
				DialogClose(own)	
				break
			end
		elseif i == 300 then
			CancelBuff(own, 501570 );--�̫�M��BUFF
			DialogClose(own)	
			break
		end
	end
end	
function ic_Easter_npc_5()	  																---�^����						
	local own = OwnerID()
	local tar = TargetID()
	local Egg
	local Egg1
	local Egg2
	local Egg3
	local Egg4
	local Egg5
	local Egg6
	local Egg7
	local Egg8
	local Egg9
	local Egg100
	local Egg220
	if CountBodyItem(own,241174 )==1 then
		ScriptMessage( own, own, 0,"[SC_SPRING_IC_27]", 0 )
		ScriptMessage( own, own, 1,"[SC_SPRING_IC_27]", 0 )
	end
	if	CountBodyItem(own,241174 )==0 and
		CountBodyItem(own,241175 )==0 and
		CountBodyItem(own,241176 )==0 and 
		CountBodyItem(own,241177 )==0 and
		CountBodyItem(own,241178 )==0 and
		CountBodyItem(own,241179 )==0 and
		CountBodyItem(own,241180 )==0 then
		ScriptMessage( own, own, 0,"[SC_SPRING_IC_25]", 0 )
		ScriptMessage( own, own, 1,"[SC_SPRING_IC_25]", 0 )
	elseif	CountBodyItem(own,241174 )==0 and
			CountBodyItem(own,241175 )~=0 or
			CountBodyItem(own,241176 )~=0 or 
			CountBodyItem(own,241177 )~=0 or
			CountBodyItem(own,241178 )~=0 or
			CountBodyItem(own,241179 )~=0 or
			CountBodyItem(own,241180 )~=0 then
			Egg1=CountBodyItem( own, 240511 )
			DelBodyItem(own,240511,Egg1)
			Egg2=CountBodyItem( own, 241043 )
			DelBodyItem(own,241043,Egg2)
			Egg3=CountBodyItem( own, 241174 )
			DelBodyItem(own,241174,Egg3)
			Egg4=CountBodyItem( own, 241175 )
			DelBodyItem(own,241175,Egg4)
			Egg5=CountBodyItem( own, 241176 )
			DelBodyItem(own,241176,Egg5)
			Egg6=CountBodyItem( own, 241177 )
			DelBodyItem(own,241177,Egg6)
			Egg7=CountBodyItem( own, 241178 )
			DelBodyItem(own,241178,Egg7)
			Egg8=CountBodyItem( own, 241179 )
			DelBodyItem(own,241179,Egg8)
			Egg9=CountBodyItem( own, 241180 )
			DelBodyItem(own,241180,Egg9)
			Egg=ReadRoleValue(own, EM_LuaValueFlag_UseItem33)
			--say(own,"Egg="..Egg)
			if	Egg<81 then
				GiveBodyItem(own, 204218,1)
			elseif	Egg>80 and Egg<100 then
				GiveBodyItem(own, 204218,2)
			elseif	Egg>100 and Egg<220 then
				GiveBodyItem(own, 204218,2)
			elseif	Egg==100 then
				GiveBodyItem(own, 204218,3)
				AddRoleValue(own , EM_LuaValueFlag_UseItem35,1)
				local PlayerName = GetName(own)
				local MessageString = "[SC_SPRING_IC_31][$SETVAR1="..PlayerName.."]" 	
				ic_say_all_world(MessageString,2,3) 
			elseif	Egg>219 then
				GiveBodyItem(own, 204218,3)
				AddRoleValue(own , EM_LuaValueFlag_UseItem36,1)	
				local PlayerName = GetName(own)
				local MessageString = "[SC_SPRING_IC_32][$SETVAR1="..PlayerName.."]" 	
				ic_say_all_world(MessageString,2,3) 
			end 
			AddRoleValue(own , EM_LuaValueFlag_UseItem33,-Egg)
			Egg100=ReadRoleValue(own, EM_LuaValueFlag_UseItem35)
			Egg200=ReadRoleValue(own, EM_LuaValueFlag_UseItem36)
			--say(own,"Egg100="..Egg100)
			--say(own,"Egg200="..Egg200)
			if  Egg100>=10 and CountBodyItem(own,530879)==0 then
				GiveBodyItem(own,530879,1)
				lua_star_BossKilledCount(120414)
			end	
			if  Egg200>=10 and CountBodyItem(own,530881)==0 then
				GiveBodyItem(own,530881,1)
				lua_star_BossKilledCount(120415)
			end	
			lua_star_BossKilledCount(120544)
			GiveBodyItem(own, 546232,1)
			local OID = OwnerID()  
			--< OID���нж�J�Ӭ��ʤ��O���a���ܼ�,  �Ҧp Local OID = player
			local allcount = 4  -- �Ҧ��s���ʼƶq
			local count = 0
			local keylist =  {
					546288,	--�Ԥ�ߨ��þ�
					546257,	--�Ԥ�l�r�O
					546264,	--�ڤ۱m��
					546232		--�m�J��~
					}
			for i =  1 , table.getn(keylist) do
				if Checkflag(OID , keylist[i] )  == true then
					count = count +1
				end
				if i == table.getn(keylist) then
					if count == allcount then -- �p�G��������
						lua_mika_festivalbuffgive(OID, 0 )  -- 2012. 4��K�B�`���� ������0
					end
				end
			end
			--say(own,"playOK")
	end	
	CloseSpeak(own)	
end	
function ic_Egg(TargetID,OwnerID,X)
	local own =OwnerID
	local tar =TargetID
	local Egg
	if X==1 then
		DelBodyItem(own,241043,1)
	end	
	DelBodyItem(own,241174,1)
	DelBodyItem(own,241175,1)
	DelBodyItem(own,241176,1)
	DelBodyItem(own,241177,1)
	DelBodyItem(own,241178,1)
	DelBodyItem(own,241179,1)
	DelBodyItem(own,241180,1)
	Egg=ReadRoleValue(own, EM_LuaValueFlag_UseItem33)
	if 		Egg>0 and Egg<51 then
		GiveBodyItem(own, 241175,1)
	elseif	Egg>50 and Egg<81 then
		GiveBodyItem(own, 241176,1)
	elseif	Egg>80 and Egg<100 then
		GiveBodyItem(own, 241177,1)
	elseif	Egg==100 then
		GiveBodyItem(own, 241179,1)
	elseif	Egg>100 and Egg<220 then
		GiveBodyItem(own, 241178,1)
	elseif	Egg>219 then
		GiveBodyItem(own, 241180,1)
	end
	ScriptMessage(tar,own,2, "[SC_SPRING_IC_04]"..Egg.."%",0)
	ScriptMessage(tar,own,0, "[SC_SPRING_IC_04]"..Egg.."%",0)
end
function ic_Easter_npc_6_1()																---���s�b�Ӥ@��
	local own = OwnerID()
	if 	CountBodyItem( own, 202903 )>0 then
		CloseSpeak(own)
		BeginPlot( own , "ic_Easter_npc_6",0)
	elseif CountBodyItem( own, 202903 )<1 then
		ScriptMessage( own, own, 0,"[SC_SPRING_IC_20]", 0 )
		ScriptMessage( own, own, 1,"[SC_SPRING_IC_20]", 0 )
		CloseSpeak(own)
		--say(own,"202903<1")
	end	
end
function ic_Easter_npc_6()	  																---�b�Ӥ@��						
	local own = OwnerID()
	local Egg
	local Egg1
	local Egg2
	local Egg3
	local Egg4
	local Egg5
	local Egg6
	local Egg7
	local Egg8
	local Egg9
	if CheckBuff(own, 501570) == true then  --�W�[�ˬd�P�_
		ScriptMessage(own,own, 0, "[SC_WINDOW_OPENED]", 0 );
	else	
		AddBuff(own, 501570,0,-1);--�M�ᵹ��BUFF
	end
	DialogCreate(own, EM_LuaDialogType_YesNo ,"[SC_SPRING_IC_16]")
	DialogSelectStr(own, "[SC_GETTITLE_1]" )
	DialogSelectStr(own, "[SC_CANCEL]" )
	if( DialogSendOpen(own) == false ) then 
		ScriptMessage(own,own,1,"[SYS_FIXEQ_DATA_ERROR]",0)	
		return
	end
	for i = 0 , 300 , 1 do
		Sleep( 1 );
		SelectID = DialogGetResult(own);
		if ( SelectID ~= -2 ) and ( SelectID ~= -1 ) and i < 300 then
			if ( SelectID == 0 ) then
				if 	CountBodyItem( own, 202903 )>0 then
					Egg=ReadRoleValue(own, EM_LuaValueFlag_UseItem33)
					AddRoleValue(own , EM_LuaValueFlag_UseItem33,-Egg)		
						DelBodyItem(own, 546231, 1 )
						DelBodyItem(own, 546232, 1 )
						DelBodyItem(own, 546233, 1 )
						DelBodyItem(own, 546234, 1 )
						DelBodyItem(own, 546235, 1 )
						DelBodyItem(own, 546236, 1 )
						DelBodyItem(own, 546237, 1 )
						DelBodyItem(own, 546238, 1 )
						DelBodyItem(own, 546239, 1 )
						Egg1=CountBodyItem( own, 240511 )
						DelBodyItem(own,240511,Egg1)
						Egg2=CountBodyItem( own, 241043 )
						DelBodyItem(own,241043,Egg2)
						Egg3=CountBodyItem( own, 241174 )
						DelBodyItem(own,241174,Egg3)
						Egg4=CountBodyItem( own, 241175 )
						DelBodyItem(own,241175,Egg4)
						Egg5=CountBodyItem( own, 241176 )
						DelBodyItem(own,241176,Egg5)
						Egg6=CountBodyItem( own, 241177 )
						DelBodyItem(own,241177,Egg6)
						Egg7=CountBodyItem( own, 241178 )
						DelBodyItem(own,241178,Egg7)
						Egg8=CountBodyItem( own, 241179 )
						DelBodyItem(own,241179,Egg8)
						Egg9=CountBodyItem( own, 241180 )
						DelBodyItem(own,241180,Egg9)
						DelBodyItem(own,202903,1)
						lua_star_BossKilledCount(120545)
						CancelBuff(own, 501570 );--�̫�M��BUFF
						break
				elseif CountBodyItem( own, 202903 )<1 then
					ScriptMessage( own, own, 0,"[SC_SPRING_IC_20]", 0 )
					ScriptMessage( own, own, 1,"[SC_SPRING_IC_20]", 0 )
					CancelBuff(own, 501570 );--�̫�M��BUFF
					--say(own,"202903<1")
					break
				end	
			elseif ( SelectID == 1 ) then
				-- ��_
				CancelBuff(own, 501570 );--�̫�M��BUFF
				DialogClose(own)	
				break
			end
		elseif i == 300 then
			CancelBuff(own, 501570 );--�̫�M��BUFF
			DialogClose(own)	
			break
		end
	end
end
function ic_Easter_flower_0_1()
local player = OwnerID() 	-- ���a
	BeginPlot( player , "ic_Easter_flower_0_2",0)
	CloseSpeak(player)
end
function ic_Easter_flower_0_2()
	if CheckBuff( OwnerID() , 501570) == true then  --�W�[�ˬd�P�_
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	else	
		AddBuff(OwnerID() , 501570,0,-1);--�M�ᵹ��BUFF
	end
	DialogCreate( OwnerID() , EM_LuaDialogType_YesNo ,"[SC_SPRING_IC_28]")
	DialogSelectStr( OwnerID() , "[SC_GETTITLE_1]" )
	DialogSelectStr( OwnerID() , "[SC_CANCEL]" )
	if( DialogSendOpen( OwnerID() ) == false ) then 
		ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_FIXEQ_DATA_ERROR]",0)	
		--��ưe�X�����Ds
		return
	end
	for i = 0 , 300 , 1 do
		Sleep( 1 );
		SelectID = DialogGetResult( OwnerID() );
		if ( SelectID ~= -2 ) and ( SelectID ~= -1 ) and i < 300 then
			if ( SelectID == 0 ) then
				-- ��O�A����@��
				ChangeZone( OwnerID(),2,0,1136,37,6896,3)
				--ChangeZone( OwnerID(),31,0,2256,1558,-414,22)
				CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
				break;
			elseif ( SelectID == 1 ) then
				-- ��_
				CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
				DialogClose( OwnerID() )	
				break
			end
		elseif i == 300 then
			-- 3���A�۰���������
			CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
			DialogClose( OwnerID() )	
			break
		end
	end
end
function ic_Easter_flower_1()
	SetPlot(OwnerID(),"touch","ic_Easter_flower_2",10)
end
function ic_Easter_flower_2()
local player = OwnerID() 	-- ���a
local npc = TargetID()  	-- NPC
DW_CancelTypeBuff(68,player)
	if CheckScriptFlag(player, 546231 ) ==true and 
	   CheckScriptFlag(player, 546232 ) ==false and 
	   CheckScriptFlag(player, 546239 ) ==false and 
	   CountBodyItem(player,240511)<6  then
			WriteRoleValue(npc,EM_RoleValue_Register9,9)
		if 	BeginCastBarEvent( player, npc,"[SC_GERMANY2_CONCERTO_05]", 15, 148, 150, 0, "ic_Easter_flower_3" ) ~= 1 then
				ScriptMessage( player, player, 0,"[SAY_NPC_BUSY]", 0 );		--�ؼЦ��L��
				ScriptMessage( player, player, 2,"[SAY_NPC_BUSY]", 0 );		--�ؼЦ��L��
		end
	elseif	CheckScriptFlag(player, 546231 ) ==false or
			CheckScriptFlag(player, 546232 ) ==true  then
			ScriptMessage( player, player, 0,"[SC_SPRING_IC_23]", 0 )
			ScriptMessage( player, player, 1,"[SC_SPRING_IC_23]", 0 )
	elseif  CheckScriptFlag(player, 546239 ) ==true or 
			CountBodyItem(player,240511)==6  then
			ScriptMessage( player, player, 0,"[SC_SPRING_IC_24]", 0 )
			ScriptMessage( player, player, 1,"[SC_SPRING_IC_24]", 0 )
	end	
end
function ic_Easter_flower_3(ObjID, CheckStatus)
	local player = OwnerID() 	-- ���a
	local NPC = TargetID()  	-- NPC
	local mob1=0
	local mob2=0
		Sleep(10)
	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			mob1=CountBodyItem(player,240511)
			if mob1<3 then
				GiveBodyItem(player,240511,2)
			elseif	mob1>2 then
				mob2=6-mob1
			end
			GiveBodyItem(player,240511,mob2)
			WriteRoleValue(NPC,EM_RoleValue_Register9,0)
			SetModeEx(NPC,EM_SetModeType_Mark, true) 
			EndCastBar( player, CheckStatus )
		else
			EndCastBar( player, CheckStatus )
		end
	end
end
function ic_Easter_NPC_play1()
	local own = OwnerID()
	local Luck=0
	while true do	
		Luck=DW_Rand(5)
		--say(own,"Luck="..Luck)
		if Luck==1 then
			PlayMotion(own,ruFUSION_ACTORSTATE_EMOTE_CRY)									---��
			sleep(20)
		elseif Luck==2 then
			PlayMotion(own,ruFUSION_ACTORSTATE_EMOTE_LAUGH)									---��
			sleep(20)
		elseif Luck==3 then
			PlayMotion(own, ruFUSION_ACTORSTATE_EMOTE_ROFL)									---���u
			sleep(60)
		elseif Luck==4 then
			PlayMotion(own, ruFUSION_ACTORSTATE_EMOTE_BREAKDANCE)							---���R
			sleep(60)
		elseif Luck==5 then
			PlayMotion(own, ruFUSION_ACTORSTATE_EMOTE_HANDSTAND)							---�˥�
			sleep(60)
		end
	end
end
function ic_Easter_NPC_play2()---850065  68  800264
	local own=OwnerID()
	local RoomID=ic_ReadRoleValue(own,11)
	local BaseX=ReadRoleValue(own,EM_RoleValue_X)
	local BaseY=ReadRoleValue(own,EM_RoleValue_Y)
	local BaseZ=ReadRoleValue(own,EM_RoleValue_Z)
	local BaseDir=ReadRoleValue(own,EM_RoleValue_Dir)
	local mob=CreateObj(120582,BaseX+15,BaseY,BaseZ,BaseDir,1)	
	local Luck=0
	ic_All_door(mob)
	AddToPartition(mob,RoomID )	
	while true do
		Luck=DW_Rand(4)
		CastSpellLV(own,mob,850064+Luck,0)
		ic_magic_ing(own,10)
	end
end

function ic_Easter_play(x)---? pcall ic_Easter_play(x)---
	local own = OwnerID()
	local Egg1
	local Egg2
	local Egg3
	local Egg4
	local Egg5
	local Egg6
	local Egg7
	local Egg8
	local Egg9
	local Egg100
	local Egg220
	if 	x==0 then--�����R��
		DelBodyItem(own, 546231, 1 )
		DelBodyItem(own, 546232, 1 )
		DelBodyItem(own, 546233, 1 )
		DelBodyItem(own, 546234, 1 )
		DelBodyItem(own, 546235, 1 )
		DelBodyItem(own, 546236, 1 )
		DelBodyItem(own, 546237, 1 )
		DelBodyItem(own, 546238, 1 )
		DelBodyItem(own, 546239, 1 )
		Egg1=CountBodyItem( own, 240511 )
		DelBodyItem(own,240511,Egg1)
		Egg2=CountBodyItem( own, 241043 )
		DelBodyItem(own,241043,Egg2)
		Egg3=CountBodyItem( own, 241174 )
		DelBodyItem(own,241174,Egg3)
		Egg4=CountBodyItem( own, 241175 )
		DelBodyItem(own,241175,Egg4)
		Egg5=CountBodyItem( own, 241176 )
		DelBodyItem(own,241176,Egg5)
		Egg6=CountBodyItem( own, 241177 )
		DelBodyItem(own,241177,Egg6)
		Egg7=CountBodyItem( own, 241178 )
		DelBodyItem(own,241178,Egg7)
		Egg8=CountBodyItem( own, 241179 )
		DelBodyItem(own,241179,Egg8)
		Egg9=CountBodyItem( own, 241180 )
		DelBodyItem(own,241180,Egg9)
	elseif	x==1 then--�R�����L����
		DelBodyItem(own, 546232, 1 )
	elseif	x==2 then--�R�����L�C��
		DelBodyItem(own, 546239, 1 )
	elseif	x==3 then--�R��1���e�L1-2��
		DelBodyItem(own, 546233, 1 )
		DelBodyItem(own, 546234, 1 )
	elseif	x==4 then--�R��2���e�L1-2��
		DelBodyItem(own, 546235, 1 )
		DelBodyItem(own, 546236, 1 )
	elseif	x==5 then--�R��3���e�L1-2��	
		DelBodyItem(own, 546237, 1 )
		DelBodyItem(own, 546238, 1 )
	elseif	x==6 then--�m�J+1
		AddRoleValue(own , EM_LuaValueFlag_UseItem35,1)
		Egg100=ReadRoleValue(own, EM_LuaValueFlag_UseItem35)
		say(own,"Egg100="..Egg100)
		if  Egg100>=10 and CountBodyItem(own,530879)==0 then
			GiveBodyItem(own,530879,1)
		end	
		local PlayerName = GetName(own)
		local MessageString = "[SC_SPRING_IC_31][$SETVAR1="..PlayerName.."]" 	
		ic_say_all_world(MessageString,2,3) 
	elseif	x==7 then--�m�J+5
		AddRoleValue(own , EM_LuaValueFlag_UseItem35,5)
		Egg100=ReadRoleValue(own, EM_LuaValueFlag_UseItem35)
		say(own,"Egg100="..Egg100)
		if  Egg100>=10 and CountBodyItem(own,530879)==0 then
			GiveBodyItem(own,530879,1)
		end	
		local PlayerName = GetName(own)
		local MessageString = "[SC_SPRING_IC_31][$SETVAR1="..PlayerName.."]" 	
		ic_say_all_world(MessageString,2,3) 
	elseif	x==8 then--�³J+1
		AddRoleValue(own , EM_LuaValueFlag_UseItem36,1)
		Egg200=ReadRoleValue(own, EM_LuaValueFlag_UseItem36)
		say(own,"Egg200="..Egg200)
		if  Egg200>=10 and CountBodyItem(own,530881)==0 then
			GiveBodyItem(own,530881,1)
		end	
		local PlayerName = GetName(own)
		local MessageString = "[SC_SPRING_IC_32][$SETVAR1="..PlayerName.."]" 	
		ic_say_all_world(MessageString,2,3) 
	elseif	x==9 then--�R���ٸ�
		Egg200=ReadRoleValue(own, EM_LuaValueFlag_UseItem36)
		Egg100=ReadRoleValue(own, EM_LuaValueFlag_UseItem35)
		AddRoleValue(own , EM_LuaValueFlag_UseItem35,-Egg100)
		AddRoleValue(own , EM_LuaValueFlag_UseItem36,-Egg200)
		Egg200=ReadRoleValue(own, EM_LuaValueFlag_UseItem36)
		Egg100=ReadRoleValue(own, EM_LuaValueFlag_UseItem35)
		say(own,"Egg100="..Egg100)
		say(own,"Egg200="..Egg200)
		DelBodyItem(own, 530878, 1 )
		DelBodyItem(own, 530879, 1 )
		DelBodyItem(own, 530880, 1 )
		DelBodyItem(own, 530881, 1 )
	elseif	x==10 then--�R���ٸ�
		AddRoleValue(own , EM_LuaValueFlag_UseItem36,5)
		Egg200=ReadRoleValue(own, EM_LuaValueFlag_UseItem36)
		say(own,"Egg200="..Egg200)
		if  Egg200>=10 and CountBodyItem(own,530881)==0 then
			GiveBodyItem(own,530881,1)
		end	
		local PlayerName = GetName(own)
		local MessageString = "[SC_SPRING_IC_32][$SETVAR1="..PlayerName.."]" 	
		ic_say_all_world(MessageString,2,3) 
	end	
end
--lua_star_BossKilledCount(120544)---�ݳQ��������
--lua_star_BossKilledCount(120545)---��1�ӲŤ妸��
--lua_star_BossKilledCount(120546)---��2�ӲŤ妸��
--lua_star_BossKilledCount(120547)---��5�ӲŤ妸��
--lua_star_BossKilledCount(120414)---100%�ٸ����o�ƶq
--lua_star_BossKilledCount(120415)---220%�ٸ����o�ƶq
--EM_LuaValueFlag_UseItem33--������
--EM_LuaValueFlag_UseItem35--100%
--EM_LuaValueFlag_UseItem36--220%�H�W
--SC_SPRING_IC_01--������
--SC_SPRING_IC_02--�^����
--SC_SPRING_IC_03--���C��
--SC_SPRING_IC_04--�m�J������
--SC_SPRING_IC_05--�e�J
--SC_SPRING_IC_06--�b�Ӥ@��
--SC_SPRING_IC_07--�W�L2��
--SC_SPRING_IC_08--�̤j
--SC_SPRING_IC_09--�̤j��100
--SC_SPRING_IC_10--����������--�o�J��
--SC_SPRING_IC_11--��������--�o�J��
--SC_SPRING_IC_12--1�����
--SC_SPRING_IC_13--2�����
--SC_SPRING_IC_14--3�����
--SC_SPRING_IC_15--  [$VAR1]