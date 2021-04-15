-------------------------------------------------------------------
function FSM_Debug(inst)
 	for k,v in pairs(inst.states) do
		 DeBugMSG(0,0,"FSM_Debug: K = "..k.."&  v = "..type(v))

	end
end
-------------------------------------------------------------------
function FSM_Initial(id,state_tab)
	local ai_tab={}
	ai_tab.MonID=id
	ai_tab.states=state_tab
	ai_tab.nowState=nil
	-- 2013/3/18 蝌蚪修改：預設bUpdate屬性為false。
	-- update loop在bUpdate == false才會啟動，避免重複起動update loop。
	-- ai_tab.bUpdate = false
	--FSM_Debug(ai_tab)
	return ai_tab;
end
------------------------------------------
function FSM_GetState(fsm_inst,state)
             


	return fsm_inst.states[state];
end
------------------------------------------
function FSM_DoTransion(fsm_inst,state)

	--DeBugMSG(0,0,"FSM_DoTransion: state = "..state)

	local nowstate=FSM_GetState(fsm_inst,fsm_inst.nowState);
	if (nowstate~=nil) then
		if (nowstate.leave~=nil) then
			nowstate.leave(fsm_inst);
		end
	end
	local newstate=FSM_GetState(fsm_inst,state);
	if (newstate~=nil) then
		fsm_inst.nowState=state;
		--DeBugMSG(0,0,"FSM_DoTransion}}fsm_inst.nowState ="..fsm_inst.nowState)

		if (newstate.enter~=nil) then
			newstate.enter(fsm_inst);
		end
		
	end
end
------------------------------------------
function FSM_Update(fsm_inst)

	local nowstate=FSM_GetState(fsm_inst,fsm_inst.nowState);
	if (nowstate~=nil) then
 		if (nowstate.update~=nil) then

			local newState=nowstate.update(fsm_inst);
			if (newState~=nil) then
				FSM_DoTransion(fsm_inst,newState);
			end
		end
	else
	end

end