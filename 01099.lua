
------------------------------------薩倫德

function LuaI_421549()

	Say( OwnerID() , "[SC_421549]" )
end

function LuaS_111700_Quest()
	LoadQuestOption( OwnerID() )
	if (CountBodyItem( OwnerID(), 203389 ) > 0 )and(CountBodyItem( OwnerID(), 203390 ) > 0 )and(CheckFlag( OwnerID() , 542282 )==false)then	--製作解藥任務
		AddSpeakOption(OwnerID(),TargetID(),"[SC_421561]","LuaS_111700_1",0)
	end
end

function LuaS_111700_1()
	SetFlag(OwnerID() , 542282 , 1 )
	CloseSpeak( OwnerID() )
	BeginPlot( TargetID() , "LuaS_111700_2" , 0 )

end

function LuaS_111700_2()
	Say( OwnerID() , "[SC_421561_1]" )				-- 我的聲音！！…呱…呱…呱…
end

----------------------------判斷是否達到18級

function LuaI_421558_Quest()
	LoadQuestOption( OwnerID() )
	local PLAYERLV = ReadRoleValue( OwnerID() , EM_RoleValue_Lv )
	if (PLAYERLV > 17 )and(CheckFlag( OwnerID() , 542283 )==false)then
		SetFlag(OwnerID() , 542283 , 1 )
	end
end
