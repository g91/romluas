

---------------------

function EliteSkill_ArcanaMaker_0()
	local Obj = OwnerID();
	local Race = ReadRoleValue(Obj,EM_RoleValue_Race);
	if	Race >1	then
		SetSpeakDetail(Obj,"[SC_120515_A]");
		return;
	end
	local Part = 	{542712 , 542709 , 542710 , 542713 , 542711 } --代表各部位的旗標
	local Partobj = 	{204865 , 204863 , 204884 , 204875 , 204876 } --代表各部位的物品
	local JobObj = 	{[1] = 204858  ,[2] = 204859,[3] = 204856 ,[4] = 204857 , [5] = 204860, [6] = 204855 , [7] =206620 , [8] = 206626} --代表各部位的物品
	--各職業魂的旗標以及回收的物品
	local Soul ={
			[542717] = 204858 ,
			[542719] = 204859  ,
			[542718] = 204856  ,
			[542720] = 204857  ,
			[542721] = 204860  ,
			[542714] = 204855 ,
			[543611] = 206620 ,
			[543612] = 206626 
			}
	--各職業魂的旗標以及要給予的阿爾克納
	local Doll ={
			[542717] = 204908 ,
			[542719] = 204910 ,
			[542718] = 204909  ,
			[542720] = 204911  ,
			[542721] = 204912  ,
			[542714] = 204907 ,
			[543611] = 206627 ,
			[543612] = 206628 
		}
	--參數宣告--
	local Str = {}
	local Get = 0
	local GiveDoll = 0
	--檢查哪些部分已存入，哪些沒有--
	for pry , obj in pairs(Part) do
		if CheckFlag( OwnerID() , obj ) == true then
			Str[pry] = "[SC_LV50_ELITESKILL_GET]" 
			Get = Get + 1
		else

			Str[pry] = "[SC_LV50_ELITESKILL_NOGET]" 
		end
	end
	--以職業來決定預設為哪個魂--
	for pry , obj in pairs(JobObj ) do
		if ReadRoleValue( OwnerID() , EM_RoleValue_VOC ) == 0 then
			str[6] = "GM TEST"
			break
		end
		if pry == ReadRoleValue( OwnerID() , EM_RoleValue_VOC ) then
			str[6] = "["..obj.."]"
			break
		end
	end
	--檢查是否有魂--
	for pry , obj in pairs(Soul) do
		Str[7] = "[SC_LV50_ELITESKILL_NOGET]" 
		if CheckFlag( OwnerID() , pry ) == true then
			str[6] = "["..obj.."]"
			str[7] = "[SC_LV50_ELITESKILL_GET]" 
			Get = Get + 1
			GiveDoll = Doll[pry]
			break
		end	
	end
	--檢查是否已存放釋能之鏈--
	if CheckFlag( OwnerID() , 542715 ) ==true then
		str[8] = "[SC_LV50_ELITESKILL_GET]" 
		Get = Get + 1
	else
		str[8] = "[SC_LV50_ELITESKILL_NOGET]" 
	end
	--產生對話選項--
	if Get < 7 then --如果還沒收集完全的話
		local MsgList = "[SC_LV50_ELITESKILL_SHOWLIST][$SETVAR1="..str[1].."][$SETVAR2="..str[2].."][$SETVAR3="..str[3].."][$SETVAR4="..str[4].."][$SETVAR5="..str[5].."][$SETVAR6="..str[6].."][$SETVAR7="..str[7].."][$SETVAR8="..str[8].."]"
		SetSpeakDetail( OwnerID(), MsgList  ) 
		for pry , obj in pairs(Partobj) do
			if CountBodyItem( OwnerID() , obj ) > 0 then
				local LuaGo = ""
				local Name = "["..obj.."]"
				local GiveThing = "[SC_LV50_ELITESKILL_GIVE][$SETVAR1="..Name.."]"
				if CheckFlag( OwnerID() , Part[pry] ) == true then
					LuaGo = "EliteSkill_ArcanaMaker_FULL"
				else
					LuaGo = "EliteSkill_ArcanaMaker_"..obj
				end
				AddSpeakOption( OwnerID(), TargetID(), GiveThing ,  LuaGo , 0 )
			end
		end
		for pry , obj in pairs(Soul) do
			if CountBodyItem( OwnerID() , obj ) > 0 then
				local LuaGo = "EliteSkill_ArcanaMaker_"..obj
				local Name = "["..obj.."]"
				local GiveThing = "[SC_LV50_ELITESKILL_GIVE][$SETVAR1="..Name.."]"
				for flag , OrgID in pairs(Soul) do
					if CheckFlag( OwnerID() , flag ) == true then
						LuaGo = "EliteSkill_ArcanaMaker_FULL"
						break
					end
				end
				AddSpeakOption( OwnerID(), TargetID(), GiveThing ,  LuaGo , 0 )
			end
		end
		if CountBodyItem( OwnerID() , 204862 ) > 0 then
				local GiveThing = "[SC_LV50_ELITESKILL_GIVE][$SETVAR1=".."[204862]".."]"
				local LuaGo
				if CheckFlag( OwnerID() , 542715 ) ==true then
					LuaGo = "EliteSkill_ArcanaMaker_FULL"
				else
					LuaGo = "EliteSkill_ArcanaMaker_204862"
				end
				AddSpeakOption( OwnerID(), TargetID(), GiveThing , LuaGo , 0 )
		end
	else
		local name = "["..GiveDoll.."]"
		local Msg = "[SC_LV50_ELITESKILL_CHANGEOK][$SETVAR1="..name.."]"
		SetSpeakDetail( OwnerID(), Msg  ) 
		local LuaGo = "EliteSkill_ArcanaMaker_"..GiveDoll
		local GiveThing = "[SC_LV50_ELITESKILL_GETDOLL][$SETVAR1="..name.."]"
		AddSpeakOption( OwnerID(), TargetID(), GiveThing ,  LuaGo , 0 )
	end
	
end

function EliteSkill_ArcanaMaker_FULL()
	SetSpeakDetail( OwnerID(), "[SC_LV50_ELITESKILL_FULL]" ) 
	AddSpeakOption( OwnerID(), TargetID(),  "[SO_BACK]", "EliteSkill_ArcanaMaker_0",0 ); --回到上一頁
end

function EliteSkill_ArcanaMaker_204865()
	local Str = "[SC_LV50_ELITESKILL_SAVE][$SETVAR1=".."[204865]".."]" 
	SetSpeakDetail( OwnerID(), Str ) 
	if CountBodyItem( OwnerID() , 204865 ) > 0 and CheckFlag( OwnerID() , 542712 ) == false then
		DelBodyItem( OwnerID() , 204865 , 1 )
		SetFlag( OwnerID() , 542712 , 1 )
	end
	AddSpeakOption( OwnerID(), TargetID(),  "[SO_BACK]", "EliteSkill_ArcanaMaker_0",0 ); --回到上一頁
end

function EliteSkill_ArcanaMaker_204863()
	local Str = "[SC_LV50_ELITESKILL_SAVE][$SETVAR1=".."[204863]".."]" 
	SetSpeakDetail( OwnerID(), Str ) 
	if CountBodyItem( OwnerID() , 204863 ) > 0 and CheckFlag( OwnerID() , 542709 ) == false then
		DelBodyItem( OwnerID() , 204863 , 1 )
		SetFlag( OwnerID() , 542709 , 1 )
	end
	AddSpeakOption( OwnerID(), TargetID(),  "[SO_BACK]", "EliteSkill_ArcanaMaker_0",0 ); --回到上一頁
end

function EliteSkill_ArcanaMaker_204884()
	local Str = "[SC_LV50_ELITESKILL_SAVE][$SETVAR1=".."[204884]".."]" 
	SetSpeakDetail( OwnerID(), Str ) 
	if CountBodyItem( OwnerID() ,204884) > 0 and CheckFlag( OwnerID() , 542710 ) == false then
		DelBodyItem( OwnerID() , 204884 , 1 )
		SetFlag( OwnerID() , 542710 , 1 )
	end
	AddSpeakOption( OwnerID(), TargetID(),  "[SO_BACK]", "EliteSkill_ArcanaMaker_0",0 ); --回到上一頁
end

function EliteSkill_ArcanaMaker_204875()
	local Str = "[SC_LV50_ELITESKILL_SAVE][$SETVAR1=".."[204875]".."]" 
	SetSpeakDetail( OwnerID(), Str ) 
	if CountBodyItem( OwnerID() ,204875) > 0 and CheckFlag( OwnerID() , 542713 ) == false then
		DelBodyItem( OwnerID() , 204875 , 1 )
		SetFlag( OwnerID() , 542713 , 1 )
	end
	AddSpeakOption( OwnerID(), TargetID(),  "[SO_BACK]", "EliteSkill_ArcanaMaker_0",0 ); --回到上一頁
end

function EliteSkill_ArcanaMaker_204876()
	local Str = "[SC_LV50_ELITESKILL_SAVE][$SETVAR1=".."[204876]".."]" 
	SetSpeakDetail( OwnerID(), Str ) 
	if CountBodyItem( OwnerID() ,204876) > 0 and CheckFlag( OwnerID() , 542711 ) == false then
		DelBodyItem( OwnerID() , 204876 , 1 )
		SetFlag( OwnerID() , 542711 , 1 )
	end
	AddSpeakOption( OwnerID(), TargetID(),  "[SO_BACK]", "EliteSkill_ArcanaMaker_0",0 ); --回到上一頁
end

function EliteSkill_ArcanaMaker_204855()
	local Str = "[SC_LV50_ELITESKILL_SAVE][$SETVAR1=".."[204855]".."]" 
	SetSpeakDetail( OwnerID(), Str ) 
	if CountBodyItem( OwnerID() ,204855) > 0 and CheckFlag( OwnerID() , 542714 ) == false then
		DelBodyItem( OwnerID() , 204855 , 1 )
		SetFlag( OwnerID() , 542714 , 1 )
	end
	AddSpeakOption( OwnerID(), TargetID(),  "[SO_BACK]", "EliteSkill_ArcanaMaker_0",0 ); --回到上一頁
end

function EliteSkill_ArcanaMaker_204856()
	local Str = "[SC_LV50_ELITESKILL_SAVE][$SETVAR1=".."[204856]".."]" 
	SetSpeakDetail( OwnerID(), Str ) 
	if CountBodyItem( OwnerID() ,204856) > 0 and CheckFlag( OwnerID() , 542718 ) == false then
		DelBodyItem( OwnerID() , 204856 , 1 )
		SetFlag( OwnerID() , 542718 , 1 )
	end
	AddSpeakOption( OwnerID(), TargetID(),  "[SO_BACK]", "EliteSkill_ArcanaMaker_0",0 ); --回到上一頁
end

function EliteSkill_ArcanaMaker_204857()
	local Str = "[SC_LV50_ELITESKILL_SAVE][$SETVAR1=".."[204857]".."]" 
	SetSpeakDetail( OwnerID(), Str ) 
	if CountBodyItem( OwnerID() ,204857) > 0 and CheckFlag( OwnerID() , 542720) == false then
		DelBodyItem( OwnerID() , 204857 , 1 )
		SetFlag( OwnerID() , 542720 , 1 )
	end
	AddSpeakOption( OwnerID(), TargetID(),  "[SO_BACK]", "EliteSkill_ArcanaMaker_0",0 ); --回到上一頁
end

function EliteSkill_ArcanaMaker_204858()
	local Str = "[SC_LV50_ELITESKILL_SAVE][$SETVAR1=".."[204858]".."]" 
	SetSpeakDetail( OwnerID(), Str ) 
	if CountBodyItem( OwnerID() ,204858) > 0 and CheckFlag( OwnerID() , 542717 ) == false then
		DelBodyItem( OwnerID() , 204858 , 1 )
		SetFlag( OwnerID() , 542717 , 1 )
	end
	AddSpeakOption( OwnerID(), TargetID(),  "[SO_BACK]", "EliteSkill_ArcanaMaker_0",0 ); --回到上一頁
end

function EliteSkill_ArcanaMaker_204859()
	local Str = "[SC_LV50_ELITESKILL_SAVE][$SETVAR1=".."[204859]".."]" 
	SetSpeakDetail( OwnerID(), Str ) 
	if CountBodyItem( OwnerID() ,204859) > 0 and CheckFlag( OwnerID() , 542719 ) == false then
		DelBodyItem( OwnerID() , 204859 , 1 )
		SetFlag( OwnerID() , 542719 , 1 )
	end
	AddSpeakOption( OwnerID(), TargetID(),  "[SO_BACK]", "EliteSkill_ArcanaMaker_0",0 ); --回到上一頁
end

function EliteSkill_ArcanaMaker_204860()
	local Str = "[SC_LV50_ELITESKILL_SAVE][$SETVAR1=".."[204860]".."]" 
	SetSpeakDetail( OwnerID(), Str ) 
	if CountBodyItem( OwnerID() ,204860) > 0 and CheckFlag( OwnerID() , 542721) == false then
		DelBodyItem( OwnerID() , 204860 , 1 )
		SetFlag( OwnerID() , 542721 , 1 )
	end
	AddSpeakOption( OwnerID(), TargetID(),  "[SO_BACK]", "EliteSkill_ArcanaMaker_0",0 ); --回到上一頁
end

function EliteSkill_ArcanaMaker_206620()
	local Str = "[SC_LV50_ELITESKILL_SAVE][$SETVAR1=".."[206620]".."]" 
	SetSpeakDetail( OwnerID(), Str ) 
	if CountBodyItem( OwnerID() ,206620) > 0 and CheckFlag( OwnerID() , 543611 ) == false then
		DelBodyItem( OwnerID() , 206620 , 1 )
		SetFlag( OwnerID() , 543611 , 1 )
	end
	AddSpeakOption( OwnerID(), TargetID(),  "[SO_BACK]", "EliteSkill_ArcanaMaker_0",0 ); --回到上一頁
end

function EliteSkill_ArcanaMaker_206626()
	local Str = "[SC_LV50_ELITESKILL_SAVE][$SETVAR1=".."[206626]".."]" 
	SetSpeakDetail( OwnerID(), Str ) 
	if CountBodyItem( OwnerID() ,206626) > 0 and CheckFlag( OwnerID() , 543612 ) == false then
		DelBodyItem( OwnerID() , 206626 , 1 )
		SetFlag( OwnerID() , 543612 , 1 )
	end
	AddSpeakOption( OwnerID(), TargetID(),  "[SO_BACK]", "EliteSkill_ArcanaMaker_0",0 ); --回到上一頁
end

function EliteSkill_ArcanaMaker_204862()
	local Str = "[SC_LV50_ELITESKILL_SAVE][$SETVAR1=".."[204862]".."]" 
	SetSpeakDetail( OwnerID(), Str ) 
	if CountBodyItem( OwnerID() ,204862) > 0 and CheckFlag( OwnerID() , 542715) == false then
		DelBodyItem( OwnerID() , 204862 , 1 )
		SetFlag( OwnerID() , 542715 , 1 )
	end
	AddSpeakOption( OwnerID(), TargetID(),  "[SO_BACK]", "EliteSkill_ArcanaMaker_0",0 ); --回到上一頁
end

function EliteSkill_ArcanaMaker_204907()
	local Str = "[SC_LV50_ELITESKILL_GIVEDOLL][$SETVAR1=".."[204907]".."]" 
	SetSpeakDetail( OwnerID(), Str  ) 
	if CountItem( OwnerID() ,204907) == 0 then
		GiveBodyItem( OwnerID() , 204907 , 1 )
		SetFlag( OwnerID() , 542709 , 0 )
		SetFlag( OwnerID() , 542710 , 0 )
		SetFlag( OwnerID() , 542711 , 0 )
		SetFlag( OwnerID() , 542712 , 0 )
		SetFlag( OwnerID() , 542713 , 0 )
		SetFlag( OwnerID() , 542714 , 0 )
		SetFlag( OwnerID() , 542715 , 0 )
	end
	AddSpeakOption( OwnerID(), TargetID(),  "[SO_BACK]", "EliteSkill_ArcanaMaker_0",0 ); --回到上一頁
end

function EliteSkill_ArcanaMaker_204908()
	local Str = "[SC_LV50_ELITESKILL_GIVEDOLL][$SETVAR1=".."[204908]".."]" 
	SetSpeakDetail( OwnerID(), Str  ) 
	if CountItem( OwnerID() ,204908) == 0 then
		GiveBodyItem( OwnerID() , 204908 , 1 )
		SetFlag( OwnerID() , 542709 , 0 )
		SetFlag( OwnerID() , 542710 , 0 )
		SetFlag( OwnerID() , 542711 , 0 )
		SetFlag( OwnerID() , 542712 , 0 )
		SetFlag( OwnerID() , 542713 , 0 )
		SetFlag( OwnerID() , 542717 , 0 )
		SetFlag( OwnerID() , 542715 , 0 )
	end
	AddSpeakOption( OwnerID(), TargetID(),  "[SO_BACK]", "EliteSkill_ArcanaMaker_0",0 ); --回到上一頁
end

function EliteSkill_ArcanaMaker_204909()
	local Str = "[SC_LV50_ELITESKILL_GIVEDOLL][$SETVAR1=".."[204909]".."]" 
	SetSpeakDetail( OwnerID(), Str  ) 
	if CountItem( OwnerID() ,204909) == 0 then
		GiveBodyItem( OwnerID() , 204909 , 1 )
		SetFlag( OwnerID() , 542709 , 0 )
		SetFlag( OwnerID() , 542710 , 0 )
		SetFlag( OwnerID() , 542711 , 0 )
		SetFlag( OwnerID() , 542712 , 0 )
		SetFlag( OwnerID() , 542713 , 0 )
		SetFlag( OwnerID() , 542718 , 0 )
		SetFlag( OwnerID() , 542715 , 0 )
	end
	AddSpeakOption( OwnerID(), TargetID(),  "[SO_BACK]", "EliteSkill_ArcanaMaker_0",0 ); --回到上一頁
end

function EliteSkill_ArcanaMaker_204910()
	local Str = "[SC_LV50_ELITESKILL_GIVEDOLL][$SETVAR1=".."[204910]".."]" 
	SetSpeakDetail( OwnerID(), Str  ) 
	if CountItem( OwnerID() ,204910) == 0 then
		GiveBodyItem( OwnerID() , 204910 , 1 )
		SetFlag( OwnerID() , 542709 , 0 )
		SetFlag( OwnerID() , 542710 , 0 )
		SetFlag( OwnerID() , 542711 , 0 )
		SetFlag( OwnerID() , 542712 , 0 )
		SetFlag( OwnerID() , 542713 , 0 )
		SetFlag( OwnerID() , 542719 , 0 )
		SetFlag( OwnerID() , 542715 , 0 )
	end
	AddSpeakOption( OwnerID(), TargetID(),  "[SO_BACK]", "EliteSkill_ArcanaMaker_0",0 ); --回到上一頁
end

function EliteSkill_ArcanaMaker_204911()
	local Str = "[SC_LV50_ELITESKILL_GIVEDOLL][$SETVAR1=".."[204911]".."]" 
	SetSpeakDetail( OwnerID(), Str  ) 
	if CountItem( OwnerID() ,204911) == 0 then
		GiveBodyItem( OwnerID() , 204911 , 1 )
		SetFlag( OwnerID() , 542709 , 0 )
		SetFlag( OwnerID() , 542710 , 0 )
		SetFlag( OwnerID() , 542711 , 0 )
		SetFlag( OwnerID() , 542712 , 0 )
		SetFlag( OwnerID() , 542713 , 0 )
		SetFlag( OwnerID() , 542720 , 0 )
		SetFlag( OwnerID() , 542715 , 0 )
	end
	AddSpeakOption( OwnerID(), TargetID(),  "[SO_BACK]", "EliteSkill_ArcanaMaker_0",0 ); --回到上一頁
end

function EliteSkill_ArcanaMaker_204912()
	local Str = "[SC_LV50_ELITESKILL_GIVEDOLL][$SETVAR1=".."[204912]".."]" 
	SetSpeakDetail( OwnerID(), Str  ) 
	if CountItem( OwnerID() ,204912) == 0 then
		GiveBodyItem( OwnerID() , 204912 , 1 )
		SetFlag( OwnerID() , 542709 , 0 )
		SetFlag( OwnerID() , 542710 , 0 )
		SetFlag( OwnerID() , 542711 , 0 )
		SetFlag( OwnerID() , 542712 , 0 )
		SetFlag( OwnerID() , 542713 , 0 )
		SetFlag( OwnerID() , 542721 , 0 )
		SetFlag( OwnerID() , 542715 , 0 )
	end
	AddSpeakOption( OwnerID(), TargetID(),  "[SO_BACK]", "EliteSkill_ArcanaMaker_0",0 ); --回到上一頁
end

function EliteSkill_ArcanaMaker_206627()
	local Str = "[SC_LV50_ELITESKILL_GIVEDOLL][$SETVAR1=".."[206627]".."]" 
	SetSpeakDetail( OwnerID(), Str  ) 
	if CountItem( OwnerID() ,206627) == 0 then
		GiveBodyItem( OwnerID() , 206627 , 1 )
		SetFlag( OwnerID() , 542709 , 0 )
		SetFlag( OwnerID() , 542710 , 0 )
		SetFlag( OwnerID() , 542711 , 0 )
		SetFlag( OwnerID() , 542712 , 0 )
		SetFlag( OwnerID() , 542713 , 0 )
		SetFlag( OwnerID() , 543611 , 0 )
		SetFlag( OwnerID() , 542715 , 0 )
	end
	AddSpeakOption( OwnerID(), TargetID(),  "[SO_BACK]", "EliteSkill_ArcanaMaker_0",0 ); --回到上一頁
end

function EliteSkill_ArcanaMaker_206628()
	local Str = "[SC_LV50_ELITESKILL_GIVEDOLL][$SETVAR1=".."[206628]".."]" 
	SetSpeakDetail( OwnerID(), Str  ) 
	if CountItem( OwnerID() ,206628) == 0 then
		GiveBodyItem( OwnerID() ,206628, 1 )
		SetFlag( OwnerID() , 542709 , 0 )
		SetFlag( OwnerID() , 542710 , 0 )
		SetFlag( OwnerID() , 542711 , 0 )
		SetFlag( OwnerID() , 542712 , 0 )
		SetFlag( OwnerID() , 542713 , 0 )
		SetFlag( OwnerID() , 543612 , 0 )
		SetFlag( OwnerID() , 542715 , 0 )
	end
	AddSpeakOption( OwnerID(), TargetID(),  "[SO_BACK]", "EliteSkill_ArcanaMaker_0",0 ); --回到上一頁
end
--==============================================================================================================================--------
function EliteSkill_SkillTeacher_0()
	local Obj = OwnerID();
	local Race = ReadRoleValue(Obj,EM_RoleValue_Race);
	if	Race >1	then
		SetSpeakDetail(Obj,"[SC_120515_A]");
		return;
	end
	local Check = "YES"
	local Skill45 = {
			[1]=	{	0 	,	542066	,	542067	,	542068	,	542069	,	542070	,	543064	,	543065	}	,
			[2]=	{	542071	,	0	,	542072	,	542073	,	542074	,	542075	,	543066	,	543067	}	,
			[3]=	{	542076	,	542077	,	0	,	542078	,	542079	,	542080	,	543068	,	543069	}	,
			[4]=	{	542081	,	542082	,	542083	,	0	,	542084	,	542085	,	543070	,	543071	}	,
			[5]=	{	542086	,	542087	,	542088	,	542089	,	0	,	542090	,	0	,	0	}	,
			[6]=	{	542091	,	542092	,	542093	,	542094	,	542095	,	0	,	0	,	0	}	,	
			[7]=	{	543140	,	543141	,	543142	,	543143	,	0	,	0	,	0	,	543144	}	,
			[8]=	{	543145	,	543146	,	543147	,	543148	,	0	,	0	,	543149	,	0	}	,										
			}
	local Job = ReadRoleValue( OwnerID() , EM_RoleValue_VOC )
	local Job2 = ReadRoleValue( OwnerID() , EM_RoleValue_VOC_SUB )
	local ErrorMsg
	if Job2 ~= nil and Job > 0 and Job2 > 0  then
		if CheckFlag( OwnerID() , Skill45[Job][Job2] ) == false or CheckFlag( OwnerID() , Skill45[Job2][Job] ) == false then
			ErrorMsg = "[SC_LV50_ELITESKILL_ERROR2]"
			Check = "NO"
		end
		if ReadRoleValue(OwnerID() , EM_RoleValue_LV ) < 50 or ReadRoleValue(OwnerID() , EM_RoleValue_LV_SUB ) < 50 then
			
			ErrorMsg = "[SC_LV50_ELITESKILL_ERROR1]"
			Check = "NO"
		end
	else
			ErrorMsg = "[SC_LV50_ELITESKILL_ERROR3]"
			Check = "NO"
	end
	if Check == "YES" then
		LoadQuestOption( OwnerID() )
		if CheckCompleteQuest( OwnerID() , 422361 ) == true then
			AddSpeakOption( OwnerID(), TargetID(),  "[SC_LV50_ELITESKILL_CHAGE]", "EliteSkill_SkillTeacher_1",0 )
		end
	else
		if Job == 0 or Job2 == 0 then
			SetSpeakDetail( OwnerID(), "Oh!You are a GM!" ) 
		else
			local TempMsg = "[SC_LV50_ELITESKILL_CANTDO][$SETVAR1="..ErrorMsg.."]"
			SetSpeakDetail( OwnerID(), TempMsg) 
		end
	end
	if Job > 0 and Job2 ~= nil and Job2 > 0 then
		AddSpeakOption ( OwnerID(), TargetID( ), "[SC_111454_13_50]" , "EliteSkill_SkillTeacher_3", 0 )
	end
end

function EliteSkill_SkillTeacher_1()
	local Arcana = {[1] = 204908 , [2] = 204910 , [3] = 204909 , [4] = 204911 , [5] = 204912 , [6] = 204907 , [7] = 206627 , [8] = 206628}
	local Job = ReadRoleValue( OwnerID() , EM_RoleValue_VOC )
	local Sub_Job = ReadRoleValue( OwnerID() , EM_RoleValue_VOC_SUB )
	local JobTable = {
			[1]=	{	0 	,	542096	,	542097	,	542098	,	542099	,	542100	,	543072	,	543073	}	,
			[2]=	{	542101	,	0	,	542102	,	542103	,	542104	,	542105	,	543074	,	543075	}	,
			[3]=	{	542106	,	542107	,	0	,	542108	,	542109	,	542110	,	543076	,	543077	}	,
			[4]=	{	542111	,	542112	,	542113	,	0	,	542114	,	542115	,	543078	,	543079	}	,
			[5]=	{	542116	,	542117	,	542118	,	542119	,	0	,	542120	,	0	,	0	}	,
			[6]=	{	542121	,	542122	,	542123	,	542124	,	542125	,	0	,	0	,	0	}	,	
			[7]=	{	543150	,	543151	,	543152	,	543153	,	0	,	0	,	0	,	543154	}	,
			[8]=	{	543155	,	543156	,	543157	,	543158	,	0	,	0	,	543159	,	0	}	
			} 

	if Sub_Job == nil or Job <= 0 or Sub_Job <=0 or CountBodyItem( OwnerID() , Arcana[Job] ) == 0 or  CountBodyItem( OwnerID() , Arcana[Sub_Job] ) == 0 then
		if CheckFlag( OwnerID() , JobTable[Job][Sub_Job] ) == true and CheckFlag( OwnerID() , JobTable[Sub_Job][Job] ) == true then
			SetSpeakDetail( OwnerID(), "[SC_LV50_ELITESKILL_GOT]" ) 
			AddSpeakOption( OwnerID(), TargetID(),  "[SO_BACK]", "EliteSkill_SkillTeacher_0",0 ); --回到上一頁
		else
			SetSpeakDetail( OwnerID(), "[SC_LV50_ELITESKILL_NOT_READY]" ) 
			AddSpeakOption( OwnerID(), TargetID(),  "[SO_BACK]", "EliteSkill_SkillTeacher_0",0 ); --回到上一頁
		end
	else
		if CheckFlag( OwnerID() , JobTable[Job][Sub_Job] ) == true and CheckFlag( OwnerID() , JobTable[Sub_Job][Job] ) == true then
			SetSpeakDetail( OwnerID(), "[SC_LV50_ELITESKILL_GOT]" ) 
			AddSpeakOption( OwnerID(), TargetID(),  "[SO_BACK]", "EliteSkill_SkillTeacher_0",0 ); --回到上一頁
		else
			local name = ""
			if Job < Sub_Job then
				name= "SC_SKILL_"..Sub_Job..Job.."50"
			elseif Job > Sub_Job then
				name = "SC_SKILL_"..Job..Sub_Job.."50"
			end
			local str = "["..name.."]"
			SetSpeakDetail( OwnerID(), str ) 
			AddSpeakOption( OwnerID(), TargetID(),  "[SO_YES]", "EliteSkill_SkillTeacher_2",0 ); --是
			AddSpeakOption( OwnerID(), TargetID(),  "[SO_NO]", "EliteSkill_SkillTeacher_0",0 ); --否
		end
	end
end

function EliteSkill_SkillTeacher_2()
	CloseSpeak(OwnerID())
	local Arcana = {[1] = 204908 , [2] = 204910 , [3] = 204909 , [4] = 204911 , [5] = 204912 , [6] = 204907 , [7] = 206627 , [8] = 206628}
	local Learned = {[0] = 0 , [1] = 542723, [2] = 542724 , [3] = 542725 , [4] = 542726 , [5] = 542727 , [6] =542728, [7] = 542729 , [8] = 542730 }
	local Job = ReadRoleValue( OwnerID() , EM_RoleValue_VOC )
	local Sub_Job = ReadRoleValue( OwnerID() , EM_RoleValue_VOC_SUB )

	if  Job == 0 or Sub_Job == 0 then
		Tell( OwnerID() ,OwnerID()  , "Hmm.......I am a GM , Maybe I Can Use Some Special Magic ......" )
		return
	end

	local JobTable = {
			[1]=	{	0 	,	542096	,	542097	,	542098	,	542099	,	542100	,	543072	,	543073	}	,
			[2]=	{	542101	,	0	,	542102	,	542103	,	542104	,	542105	,	543074	,	543075	}	,
			[3]=	{	542106	,	542107	,	0	,	542108	,	542109	,	542110	,	543076	,	543077	}	,
			[4]=	{	542111	,	542112	,	542113	,	0	,	542114	,	542115	,	543078	,	543079	}	,
			[5]=	{	542116	,	542117	,	542118	,	542119	,	0	,	542120	,	0	,	0	}	,
			[6]=	{	542121	,	542122	,	542123	,	542124	,	542125	,	0	,	0	,	0	}	,	
			[7]=	{	543150	,	543151	,	543152	,	543153	,	0	,	0	,	0	,	543154	}	,
			[8]=	{	543155	,	543156	,	543157	,	543158	,	0	,	0	,	543159	,	0	}		
			} 

	if  CountBodyItem( OwnerID() , Arcana[Job] ) > 0 and CountBodyItem( OwnerID() , Arcana[Sub_Job] ) >0 and ( JobTable[Job][Sub_Job] ~= 0 or JobTable[Job][Sub_Job] ~= nil) and  ( JobTable[Sub_Job][Job] ~= 0 or JobTable[Sub_Job][Job] ~= nil)  then
		CastSpell(OwnerID() , OwnerID() , 491010 )
		local Str = "[SC_LV50_ELITESKILL_GETSKILL]"
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_LV50_ELITESKILL_GETSKILL]" , 0 ) 
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_LV50_ELITESKILL_GETSKILL]" , 0 ) 
		Tell( OwnerID() , TargetID() , "[SC_LV50_ELITESKILL_GETHELP]" )
		DelBodyItem( OwnerID() , Arcana[Job] , 1 )
		DelBodyItem( OwnerID() , Arcana[Sub_Job]  , 1 )
		SetFlag( OwnerID() , JobTable[Job][Sub_Job] , 1 )
		SetFlag( OwnerID() , JobTable[Sub_Job][Job] , 1 )
		SetFlag( OwnerID() , Learned[Job] , 1 )
		SetFlag( OwnerID() , Learned[Sub_Job] , 1 )
	else
		Tell( OwnerID() ,OwnerID()  , "[SD_SCRIPT_DEBUG]")
	end
end

function EliteSkill_SkillTeacher_3()
	local Job = ReadRoleValue (OwnerID() , EM_RoleValue_VOC )
	local Sub_Job = ReadRoleValue(OwnerID() , EM_RoleValue_VOC_SUB )
	local name = ""
	if Job < Sub_Job then
		name= "SC_SKILL_"..Sub_Job..Job.."50"
	elseif Job > Sub_Job then
		name = "SC_SKILL_"..Job..Sub_Job.."50"
	end
	local str = "["..name.."]"
	SetSpeakDetail( OwnerID(), str ) 
	AddSpeakOption( OwnerID(), TargetID(),  "[SO_BACK]", "EliteSkill_SkillTeacher_0",0 ); --回到上一頁
end
--=============================================================================---
function LuaS_113013_0()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 422362 ) == true or CheckCompleteQuest( OwnerID() , 422362 ) == true then
		AddSpeakOption( OwnerID(), TargetID(),  "[SC_113013_0]", "LuaS_113013_1",0 ); --打聽[204870]
	end 
end
function LuaS_113013_1()
	local Pay = 499
	if CountItem( OwnerID() , 204861 ) > 0 or CountItem( OwnerID() , 204870 ) > 0 then	-- 符文汲能鍊、必爾汀符文汲能鍊
		SetSpeakDetail( OwnerID(),"[SC_113013_1]")	-- 避免重複買
--	elseif CountItem( OwnerID() , 204862 ) > 0 then	-- 2013.06.17 阿浩:避免玩家領取到符文釋能鍊[204862]時，依然可以購買符文汲能鍊
--		SetSpeakDetail( OwnerID() , "[SC_113015_1]" )	-- 怎麼不把符文釋能鍊[204862]交出去呢？
	elseif CountBodyItem( OwnerID() , 203038 ) >= Pay then
		local Str = "[SC_113013_2][$SETVAR1="..Pay.."]"	-- 選擇以必爾汀代幣購買時，需求數量足
		SetSpeakDetail( OwnerID(), Str) 
		AddSpeakOption( OwnerID(), TargetID(),  "[SC_113013_3]", "LuaS_113013_2",0 );
	else
		local Str = "[SC_113013_4][$SETVAR1="..Pay.."]"	-- 選擇以必爾汀代幣購買時，需求數量不足
		SetSpeakDetail( OwnerID(), Str) 
	end
	AddSpeakOption( OwnerID(), TargetID(),  "[SO_BACK]", "LuaS_113013_0",0 ); --回到上一頁
end
function LuaS_113013_2()
	CloseSpeak( OwnerID() )
	local Pay = 499
	if CountBodyItem( OwnerID() , 203038 ) >= Pay then
		if  DelBodyItem( OwnerID() , 203038 , Pay ) == true then
			CancelBuff_NoEvent( OwnerID() , 503614 )
			CancelBuff_NoEvent( OwnerID() , 503615 )
			CancelBuff_NoEvent( OwnerID() , 504225 )
			CancelBuff_NoEvent( OwnerID() , 504226 )
			GiveBodyItem( OwnerID() , 204870 , 1 )
			AddBuff( OwnerID() , 504226 , 0 , 828000 )	-- 2013.06.17 阿浩：調整基本法術持續時間至-1，並調整lua控制的Buff時間。
		--	AddBuff( OwnerID() , 504226 , 0 , 863400 )
		end
	else
		Tell( OwnerID() , TargetID() , "[SC_113013_5]" )
	end
end