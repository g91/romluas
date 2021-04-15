--禮物的初始劇情
function LuaS_421669()
	SetPlot(OwnerID() , "touch" , "LuaI_421669_AfterClick" , 40 )
end

function LuaI_421669_AfterClick()
	SetPlot(TargetID() , "touch" , "" , 0 )
	BeginPlot( TargetID(), "LuaS_421669_Sleep", 5 )
	if ( CheckAcceptQuest(OwnerID() , 421669 ) == true )  then
		if CheckFlag(OwnerID(),542310) == false then
			local PlayerID = OwnerID()
			local Item = { 	200528,		-- 小魚
				        200473,		-- 蘋果
					200479,		-- 葡萄
					203418,		-- 青蛙肉
					203419	  	--獸肉
                                              			      }
			local probability = { 	10,		-- 小魚機率
				                	10,             	-- 蘋果機率
					                10,             	-- 葡萄機率
					                10,             	-- 青蛙肉機率
					                10,	     	-- 獸肉機率
					                25,             	--艾咪
					                25}		--空的
					                
			local RANDOWN = rand(100)
				if RANDOWN > (100 - probability[1]) then
					GiveBodyItem( PlayerID , Item[1],1  )
				elseif RANDOWN > (100 - probability[1] - probability[2]) then
					GiveBodyItem( PlayerID , Item[2],1  )	
				elseif RANDOWN > (100 - probability[1] - probability[2] - probability[3]) then
					GiveBodyItem( PlayerID , Item[3],1 )
				elseif RANDOWN > (100 - probability[1] - probability[2] - probability[3] - probability[4]) then
					GiveBodyItem( PlayerID , Item[4] ,1 )	
				elseIF RANDOWN > (100 - probability[1] - probability[2] - probability[3] - probability[4] - probability[5]) then
					GiveBodyItem( PlayerID , Item[5],1  )	
				elseif RANDOWN > (100 - probability[1] - probability[2] - probability[3] - probability[4]- probability[5] - probability[6]) then
                             				local Monster = LuaFunc_CreateObjByObj ( 112045 , ownerID())
					WriteRoleValue(Monster,EM_RoleValue_LiveTime,40)
					local Dest = Role:new(OwnerID())
					local NewX = Dest :X()
					local NewY = Dest :Y()
					local NewZ = Dest :Z()
					--AddToPartition(Monster,0)
					MoveDirect( Monster , NewX+50 , NewY , NewZ  )
					sleep (30)
					DelObj(Monster)
					ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_421669_1]", 0 )
					SetFlag( OwnerID(), 542310, 1)
				else
				   	 ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_421669]", 0 )
				end
		else
			ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_421669_3]", 0 )
		end
	else			
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_421669_2]", 0 )
	end
end
----------地穴入口阻擋
function Luan_112053()
	SetPlot(OwnerID() , "touch" , "LuaI_112053_AfterClick" , 40 )
end

function LuaI_112053_AfterClick()
	Hide(TargetID())
	Sleep(300)
	Show(TargetID(),0)
end

function LuaS_421669_Sleep()
	Hide(OwnerID())
	Sleep(300)
	SetPlot(OwnerID() , "touch" , "LuaI_421669_AfterClick" , 40 )
	Show(OwnerID(),0)
end