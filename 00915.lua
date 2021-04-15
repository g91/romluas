function LuaI_yuyu9_0()

                SetPlot( OwnerID(),"range", "LuaI_yuyu9_1" , 100 )                                      --設定劇情
                
end

function LuaI_yuyu9_1()

	BeginPlot( TargetID() , "LuaI_yuyu9_2" , 0 )                                                   --命令指定角色呼叫 Script
end

function LuaI_yuyu9_2()
	local WA = LuaFunc_SearchNPCbyOrgID(OwnerID(), 101037, 200 , 1) 
	tell(TargetID() , TargetID() , WA[0])
end