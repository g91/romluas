function LuaQ_422183_AfterClick()
                BeginPlot( TargetID(), "LuaS_422183_Sleep", 0 )
           	if  CountBodyItem (OwnerID(),542310) < 5 then
       	 local PlayerID = OwnerID()
	local Item = { 	204345,		-- �ѥ�
			204344,		-- �į�
           			101847,		-- �]����
                                              			      }
	local probability = { 	20,		-- �ѥ����v
				 25,     -- �į���v
                			55,     -- �]�������v
					               }		
					                
	local RANDOWN = rand(100)
            		if RANDOWN > (100 - probability[1]) then
					GiveBodyItem( PlayerID , Item[1],1  )
	                  elseif RANDOWN > (100 - probability[1] - probability[2]) then
					GiveBodyItem( PlayerID , Item[2],1  )	
		  elseif RANDOWN > (100 - probability[1] - probability[2] - probability[3]) then
					ScriptMessage( OwnerID(), OwnerID(), 2 , "[SC_422183_1]",10 )---�o�{�]����
		local Monster = LuaFunc_CreateObjByObj ( 101847 , TargetID())
	                SetAttack( Monster , OwnerID() )
	                BeginPlot(Monster,"LuaQ_422183_Sui",0)
		

		end
	
	end
	return 1
end
	


function LuaQ_422183_Sui() 
	LuaFunc_Obj_Suicide(10)
end

function LuaS_422183_Sleep()
	Hide(OwnerID())
	Sleep(900)
	SetPlot(OwnerID() , "touch" , "LuaI_422183_AfterClick" , 0 )
	Show(OwnerID(),0)
end