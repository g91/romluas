--歡舞節測試
function lua_mika_dancefes_trans()
	while true do 
		CastSpell( OwnerID() , OwnerID() , 495125 ) --變身為原來模樣
		sleep(60)
		CastSpell( OwnerID() , OwnerID() , 491934 ) --變身為蘑菇
		local P = 100
		local X = Rand( P )    
		if X >= 0 and X <= 30  then  
	--		Say(OwnerID(), X)
			sleep(150)
		elseif X >= 31 and X <=60  then  
	--		Say(OwnerID(), X)
			sleep(180)
		elseif X >= 61 and X <=80  then  
	--		Say(OwnerID(), X)
			sleep(200)
		elseif X >= 81 and X <=100  then  
	--		Say(OwnerID(), X)
			sleep(220)
		end
	end
end


--------------------------------------------------------------------
function lua_mika_dancefes_PID1() --寫入對方pid值為1
	WriteRoleValue(OwnerID() , EM_RoleValue_PID, 1)  
	Addbuff(OwnerID(), 502132 , 0 , -1 )
	SetRandMove(OwnerID(), 70, 60, 20 )	--亂數範圍內移動  (範圍, 每x秒移動 , 每次移動距離)
end

function lua_mika_dancefes_PID2() --寫入對方pid值為2
	WriteRoleValue(OwnerID() , EM_RoleValue_PID, 2)  
	Addbuff(OwnerID(), 502132 , 0 , -1 )
	SetRandMove(OwnerID(), 70, 60, 20 )	--亂數範圍內移動  (範圍, 每x秒移動 , 每次移動距離)
end

function lua_mika_dancefes_PID3() --寫入對方pid值為3
	WriteRoleValue(OwnerID() , EM_RoleValue_PID, 3)  
	Addbuff(OwnerID(), 502132 , 0 , -1 )
	SetRandMove(OwnerID(), 70, 60, 20 )	--亂數範圍內移動  (範圍, 每x秒移動 , 每次移動距離)
end

function lua_mika_dancefes_PID4() --寫入對方pid值為4
	WriteRoleValue(OwnerID() , EM_RoleValue_PID, 4)  
	Addbuff(OwnerID(), 502132 , 0 , -1 )
	SetRandMove(OwnerID(), 70, 60, 20 )	--亂數範圍內移動  (範圍, 每x秒移動 , 每次移動距離)
end

function lua_mika_dancefes_PID5() --寫入對方pid值為5
	WriteRoleValue(OwnerID() , EM_RoleValue_PID, 5)  
	Addbuff(OwnerID(), 502132 , 0 , -1 )
	SetRandMove(OwnerID(), 70, 60, 20 )	--亂數範圍內移動  (範圍, 每x秒移動 , 每次移動距離)
end

function lua_mika_dancefes_PID6() --寫入對方pid值為6
	WriteRoleValue(OwnerID() , EM_RoleValue_PID, 6)  
	Addbuff(OwnerID(), 502132 , 0 , -1 )
	SetRandMove(OwnerID(), 70, 60, 20 )	--亂數範圍內移動  (範圍, 每x秒移動 , 每次移動距離)
end

function lua_mika_dancefes_PID7() --寫入對方pid值為7
	WriteRoleValue(OwnerID() , EM_RoleValue_PID, 7)  
	Addbuff(OwnerID(), 502132 , 0 , -1 )
	SetRandMove(OwnerID(), 70, 60, 20 )	--亂數範圍內移動  (範圍, 每x秒移動 , 每次移動距離)
end

function lua_mika_dancefes_PID8() --寫入對方pid值為8
	WriteRoleValue(OwnerID() , EM_RoleValue_PID, 8)  
	Addbuff(OwnerID(), 502132 , 0 , -1 )
	SetRandMove(OwnerID(), 70, 60, 20 )	--亂數範圍內移動  (範圍, 每x秒移動 , 每次移動距離)
end

function lua_mika_dancefes_pidshow() --show對方pid
	local PID = ReadRoleValue(TargetID() , EM_RoleValue_PID) 
	Say(OwnerID(), PID)
end

--可愛蘑菇變身藥水 502184
--蘑菇人變身藥水  502132