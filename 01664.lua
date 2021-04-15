-------------------特別手段(422877)---
function LuaS_422877_0()-----掛在物品SERVER端劇情...捕抓蝕腐獸過場任務
	if ReadRoleValue(TargetID(),EM_RoleValue_OrgID) ~= 102496	then -------
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422877_1_0]", 0 ); -----這個[206444]似乎只能對[102496]使用。
		return false
	end

	if GetDistance(TargetID(), OwnerID() ) > 120  then -------距離
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422877_1_1]", 0 ); -----距離太過遙遠，無法使用[206444]。
		return false
	end

	if	ReadRoleValue(TargetID(),EM_RoleValue_HP)/ReadRoleValue(TargetID(),EM_RoleValue_MaxHP)	>=0.9	then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422877_8]", 0 ); ----你沒有使用力量，讓[206444]捕抓到[102496]。
		return false
	end

	if	ReadRoleValue(TargetID(),EM_RoleValue_HP)/ReadRoleValue(TargetID(),EM_RoleValue_MaxHP)	>0.5	then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422877_1_2]", 0 ); ----[102496]極力掙扎中，你無法順利使用[206444]。
		return false
	end


	if	ReadRoleValue( TargetID(), EM_RoleValue_IsDead) == 1 then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204638_6]" , 0 ) --牠已經死了。
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204638_6]" , 0 )
		return false
	end

	return true
end

function LuaS_422877_1()
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422877_1_3]", 0 ); -------你抓到[102496]了！
	DelBodyItem(OwnerID(),206444,1)
	GiveBodyItem(OwnerID(),206454,1)
	CallPlot(TargetID(),"LuaFunc_ResetObj",TargetID())
	UseItemDestroy() 
end
function LuaS_422877_3()----
	if 	CountBodyItem( OwnerID() , 206454 ) > 0 	then
		SetSpeakDetail ( OwnerID(),"[SC_422877_3]" )
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422877_4]","LuaS_422877_4",0) 
	end
end
function LuaS_422877_4()
	DelBodyItem(OwnerID(),206454,1)
	GiveBodyItem(OwnerID(),543515,1)----防止玩家按掉後，不能繼續往下對話。
	SetSpeakDetail ( OwnerID(),"[SC_422877_5]" )
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422877_6]","LuaS_422877_5",0) 
end
function LuaS_422877_5()
	SetSpeakDetail ( OwnerID(),"[SC_422877_7]" )
	SetFlag(OwnerID() ,543509, 1 )
	AddSpeakOption(OwnerID(),TargetID(),"[SO_BACK]","LuaS_422727_0",0)
end 



---------------------------------------------------------------------
function LuaI_206452() --遺志內容
	ClearBorder( OwnerID() );
	AddBorderPage( OwnerID(), "[SC_206452]");
	ShowBorder( OwnerID(), 0, "[206452]", "ScriptBorder_Texture_Paper" );
end
