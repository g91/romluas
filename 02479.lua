------------------------------------------------------------------------
function Z21_Robbery_01()
	SetModeEx( OwnerID()  ,EM_SetModeType_HideName , true)
	SetModeEx( OwnerID()  ,EM_SetModeType_Show , true )
	SetModeEx( OwnerID()  ,EM_SetModeType_Searchenemy , false )
	SetModeEx( OwnerID()  ,EM_SetModeType_Mark , false )
	SetModeEx( OwnerID()  ,EM_SetModeType_Save , false )
	SetModeEx( OwnerID()  ,EM_SetModeType_Revive , false )
	SetModeEx( OwnerID()  ,EM_SetModeType_Strikback , false )
	SetModeEx( OwnerID()  ,EM_SetModeType_Fight , false )
	SetModeEx( OwnerID()  ,EM_SetModeType_Gravity , true )	
	SetModeEx( OwnerID()  ,EM_SetModeType_Move , false )
	SetModeEx( OwnerID()  ,EM_SetModeType_ShowRoleHead , false )
	--以上為物件自身的設定
	WriteRoleValue(OwnerID(),EM_RoleValue_Register1,5)
	WriteRoleValue(OwnerID(),EM_RoleValue_Register2,2)
	--以上為在自身2個欄位中各寫入1個可計算的值
	local x=ReadRoleValue(OwnerID(),EM_RoleValue_X)
	local y=ReadRoleValue(OwnerID(),EM_RoleValue_Y)
	local z=ReadRoleValue(OwnerID(),EM_RoleValue_Z)
	--以上為讀取中控自身的座標
	local xyz1={x+70,y,z}
	local xyz2={x-70,y,z}
	local xyz3={x,y,z+70}
	local xyz4={x,y,z-70}
	local xyz5={x+50,y,z+50}
	local xyz6={x+30,y,z+10}
	local xyz7={x-5,y,z+30}
	local xyz8={x+12,y,z+12}
	--以上為宣告將產生怪物的座標位置
	sleep(10)
	local npc1=Lua_DW_CreateObj( "xyz" , 119067, xyz6 , 1 , 1 , 1 ) --商人1
	WriteRoleValue(npc1,EM_RoleValue_Register3,OwnerID())
	local npc2=Lua_DW_CreateObj( "xyz" , 119068, xyz7 , 1 , 180 , 1 ) --商人2
	WriteRoleValue(npc2,EM_RoleValue_Register3,OwnerID())
	local npc3=Lua_DW_CreateObj( "xyz" , 119069, xyz8 , 1 , 1 , 1 ) --貨車
	--SetModeEx( npc3 ,EM_SetModeType_Obstruct , true )
	sleep(10)
	Say( npc1, "[SC_Z21ROBBERY_01]" ) --附近好像有什麼動靜呀！
	sleep(10)
	CallPlot( npc2,"Z21_Robbery_SC01",npc2) --商人感到不對勁
	sleep(10)
	local monster={}
	monster[1]=Lua_DW_CreateObj( "xyz" ,105790, xyz1 , 1 , 180 , 1 ) --哨探
	WriteRoleValue(monster[1],EM_RoleValue_Register4,OwnerID())
	CallPlot(monster[1] ,"Z21_Robbery_SC03",monster[1] ) --盜賊發號進攻
	sleep(10)
	monster[2]=Lua_DW_CreateObj( "xyz" ,105788, xyz2 , 1 , 0 , 1 ) --浪人
	WriteRoleValue(monster[2],EM_RoleValue_Register4,OwnerID())
	monster[3]=Lua_DW_CreateObj( "xyz" , 105793, xyz3 , 1 , 90 , 1 ) --打手
	WriteRoleValue(monster[3],EM_RoleValue_Register4,OwnerID())
	monster[4]=Lua_DW_CreateObj( "xyz" , 105797, xyz4 , 1 , 270 , 1 ) --雜工
	WriteRoleValue(monster[4],EM_RoleValue_Register4,OwnerID())
	monster[5]= Lua_DW_CreateObj( "xyz" , 105797, xyz5 , 1 , 125 , 1 ) --雜工
	WriteRoleValue(monster[5],EM_RoleValue_Register4,OwnerID())
	--以上為將怪物與任務npc產生於場景上
	sleep(10)
	SetAttack( monster[1] , npc1 )
	SetAttack( monster[2] , npc1 )
	SetAttack( monster[3] , npc2 )
	SetAttack( monster[4] , npc2 )
	SetAttack( monster[5] , npc3 )
	sleep(10)
	--AddBuff ( OwnerID(), 620874, 1,-1 )
	--以上為使怪物攻擊指定任務npc
end
------------------------------------------------------------------------
function Z21_Robbery_npcdead01()
	local Center=ReadRoleValue(OwnerID(),EM_RoleValue_Register3)
	if Center~=0 then
		local num=ReadRoleValue(center,EM_RoleValue_Register2)
		num=num-1
		WriteRoleValue(center,EM_RoleValue_Register2,num)
		if num==0 then
			CallPlot(Center,"Z21_Robbery_npcdead02",Center )
		end
	end
end
------------------------------------------------------------------------
function Z21_Robbery_npcdead02()
	local x={}
	x=SearchRangeNPC ( OwnerID() , 200 ) 
	local y=table.getn(x)
	sleep(30)
		for i=0,y,1 do
			if ReadRoleValue(x[i],EM_RoleValue_OrgID) ==105788 or
			   ReadRoleValue(x[i],EM_RoleValue_OrgID) ==105790 or
		   	   ReadRoleValue(x[i],EM_RoleValue_OrgID) ==105793 or
			   ReadRoleValue(x[i],EM_RoleValue_OrgID) ==105797 or
			   ReadRoleValue(x[i],EM_RoleValue_OrgID) ==119069 then
			   DelObj (x[i])
			end
		end
	CancelBuff( OwnerID(), 620874 ) 
	sleep(300)
	CallPlot(OwnerID(),"LuaFunc_ResetObj",OwnerID())
end
------------------------------------------------------------------------
function Z21monsterdead_01()
	local x={}
	x=SearchRangeNPC ( OwnerID() , 200 ) 
	local y=table.getn(x)
	sleep(30)
		for i=0,y,1 do
			if ReadRoleValue(x[i],EM_RoleValue_OrgID) ==119067 or
		   	   ReadRoleValue(x[i],EM_RoleValue_OrgID) ==119068 or
		   	   ReadRoleValue(x[i],EM_RoleValue_OrgID) ==119069 then
			   CallPlot(x[i] ,"Z21_Robbery_SC02",x[i] ) --商人感謝
			   DelObj (x[i])
			end
		end
	CancelBuff( OwnerID(), 620874 ) 
	sleep(300)
	CallPlot(OwnerID(),"LuaFunc_ResetObj",OwnerID())
end
------------------------------------------------------------------------
function Z21_Robbery_skill()
	SetModeEx( OwnerID()  ,EM_SetModeType_Show , true )
	SetModeEx( OwnerID()  ,EM_SetModeType_Mark , false )
	SetModeEx( OwnerID()  ,EM_SetModeType_Save , false )
	SetModeEx( OwnerID()  ,EM_SetModeType_Revive , false )
	SetModeEx( OwnerID()  ,EM_SetModeType_Gravity , true )	
	SetModeEx( OwnerID()  ,EM_SetModeType_Move , true )
	SetModeEx( OwnerID()  ,EM_SetModeType_ShowRoleHead , false )
	local x={}
	SetModeEx( OwnerID()  ,EM_SetModeType_Searchenemy , true )
	SetModeEx( OwnerID()  ,EM_SetModeType_Strikback , true )
	SetModeEx( OwnerID()  ,EM_SetModeType_Fight , true )
	SetPlot( OwnerID(),"dead","Z21_Robbery_npcdead01",0 ) 
	sleep(50)
	while 1 do
		x=SearchRangeNPC ( OwnerID() , 200 ) 	
		local y=table.getn(x)	
			for i=0,y,1 do
				if y~=nil then
					if ReadRoleValue(x[i],EM_RoleValue_OrgID) ==105788 or
				   	   ReadRoleValue(x[i],EM_RoleValue_OrgID) ==105790 or
				   	   ReadRoleValue(x[i],EM_RoleValue_OrgID) ==105793 or
				   	   ReadRoleValue(x[i],EM_RoleValue_OrgID) ==105797 then
				   	   sysCastSpellLv (OwnerID() , x[i] , 496758 , 0 )
					end
				end
			end
	sleep(150)
	CallPlot(OwnerID() ,"Z21_Robbery_SC02",OwnerID() ) --商人求救
	end
end
------------------------------------------------------------------------
function Z21_Robbery_skillforcar()
	local x={}
	SetModeEx( OwnerID()  ,EM_SetModeType_Mark , false )
	SetModeEx( OwnerID()  ,EM_SetModeType_Searchenemy , false )
	SetModeEx( OwnerID()  ,EM_SetModeType_Strikback , false )
	SetModeEx( OwnerID()  ,EM_SetModeType_Fight , false )
	SetModeEx( OwnerID()  ,EM_SetModeType_Move , false )
	SetModeEx( OwnerID()  ,EM_SetModeType_ShowRoleHead , false )
	SetModeEx( OwnerID()  ,EM_SetModeType_NotShowHPMP , true )
	SetModeEx( OwnerID()  ,EM_SetModeType_SearchenemyIgnore , true )
	sleep(30)
	while 1 do
		x=SearchRangeNPC ( OwnerID() , 200 ) 	
		local y=table.getn(x)	
			for i=0,y,1 do
				if y~=nil then
					if ReadRoleValue(x[i],EM_RoleValue_OrgID) ==105788 or
				   	   ReadRoleValue(x[i],EM_RoleValue_OrgID) ==105790 or
				   	   ReadRoleValue(x[i],EM_RoleValue_OrgID) ==105793 or
				   	   ReadRoleValue(x[i],EM_RoleValue_OrgID) ==105797 then
				   	   sysCastSpellLv (OwnerID() , x[i] , 496758 , 0 )
					end
				end
			end
	sleep(100)
	end
end
------------------------------------------------------------------------
function Z21_Robbery_SC01()
	local num=dw_rand(3)
		if num==1 then 
			Say( OwnerID(), "[SC_Z21ROBBERY_02]" ) --該不會是....強盜！？
		elseif num==2 then 
			Say( OwnerID(), "[SC_Z21ROBBERY_03]" ) --我有種不祥的預感呀....！
		else  
			Say( OwnerID(), "[SC_Z21ROBBERY_04]" ) --希望不是強盜啊....！
		end
end
------------------------------------------------------------------
function Z21_Robbery_SC02()
	local x=dw_rand(2)
	local num=dw_rand(3)
		if x==1 then
			if num==1 then 
				Say( OwnerID(), "[SC_Z21ROBBERY_05]" ) --誰來幫幫我們呀！
			elseif num==2 then
				sleep(10)
				Say( OwnerID(), "[SC_Z21ROBBERY_06]" ) --你們這群可惡的盜賊....！
			else
				sleep(10)  
				Say( OwnerID(), "[SC_Z21ROBBERY_07]" ) --搶劫啊～救命啊....！
			end
		end
end
------------------------------------------------------------------
function Z21_Robbery_SC03()
	local num=dw_rand(3)
		if num==1 then 
			Say( OwnerID(), "[SC_Z21ROBBERY_08]" ) --兄弟們～上啊！
		elseif num==2 then 
			Say( OwnerID(), "[SC_Z21ROBBERY_09]" ) --哈哈～獵物又上門囉！
		else  
			Say( OwnerID(), "[SC_Z21ROBBERY_10]" ) --兄弟們～來熱鬧一下吧！
		end
end
------------------------------------------------------------------
function Z21_Robbery_SC04()
	local num=dw_rand(2)
		if num==1 then 
			Say( OwnerID(), "[SC_Z21ROBBERY_11]" ) --呼～終於獲救了呀！
		else
			Say( OwnerID(), "[SC_Z21ROBBERY_12]" ) --感謝你們的幫助....！
		end
end
------------------------------------------------------------------