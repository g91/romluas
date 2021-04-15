
function LuaS_422628_1()

	SetSpeakDetail(OwnerID(),"[SC_422628_1]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422628_2]","LuaS_422628_2",0)
end

function LuaS_422628_2()

	SetSpeakDetail(OwnerID(),"[SC_422628_3]")
	SetFlag(OwnerID(),543011,1)
	AddSpeakOption(OwnerID(),TargetID(),"[SC_111352_2]","LuaS_422628_1",0) --回上一頁
end

function LuaI_422630_0() 

	if CountBodyItem( OwnerID(), 205794 )>0  then
		return true
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422630]" , C_SYSTEM ) -- 你缺少生命之火！
		return false
	end
end

function LuaI_422630_1() 

	CastSpell( OwnerID() , TargetID() , 493190 )
	return true
end

