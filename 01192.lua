function LuaI_421723()	--魔力之源初始劇情
	SetPlot( OwnerID() , "touch" , "LuaI_421723_01" , 40 )
end

function LuaI_421723_01()
	if CountBodyItem( OwnerID() , 203637 ) >= 1 then  --/*
		 ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_421723_1]" , 0 )
		return
	end
               if CheckAcceptQuest( OwnerID() , 421723 ) ==FALSE  then
                        return
                 END


	local resultZ = "";
	if CountBodyItem( OwnerID() , 203638 ) >= 10  then  --/* 判斷是否有五顆封印野生拔忽的魔法晶球
		if BeginCastBar( OwnerID(), "[SC_421723_2]" , 30 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_END , 0 ) ~= 1 then
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SAY_NPC_BUSY]" , 0 )
			return
		end
		while 1 do
			sleep( 2 );
			local CastBarStatus = CheckCastBar( OwnerID() );

		if ( CastBarStatus ~= 0 ) then 
			if ( CastBarStatus > 0) then -- 成功
				resultZ = "OKOK"
				EndCastBar( OwnerID() , CastBarStatus )
				break;
			elseif ( CastBarStatus < 0 ) then -- 失敗
				resultZ = "DAME"
				EndCastBar( OwnerID() , CastBarStatus )
				break;
			end
		end
	end
   end
	if ( resultZ == "OKOK" ) then
		DelBodyItem ( OwnerID() , 203638 , 10 )		--/* 刪除五顆封印野生拔忽的魔法晶球-
---		local DD=CreateObjByObj ( 112203, 11036.2,32.6,7295.7,1 )   
                                local Obj = Role:new( TargetID()  )
				local BaseX = Obj :X()		
			 	local BaseY = Obj :Y();		
			 	local BaseZ = Obj :Z();		
				local BaseDir = Obj:Dir();		
			 	local DD= CreateObj(112203, BaseX, BaseY+25, BaseZ, BaseDir, 1 )        
                                                            AddToPartition( DD,0)      
	             sleep(40)
-----		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_421295_1]", 0 )
		DelObj ( DD )
		sleep(20)
------	     	local Goblin = LuaFunc_CreateObjByObj ( 101560, TargetID() ) --怪物編號
                                local Obj = Role:new( TargetID()  )
				local BaseX = Obj :X()		
			 	local BaseY = Obj :Y();		
			 	local BaseZ = Obj :Z();		
				local BaseDir = Obj:Dir();		
			 	local Goblin= CreateObj(101560, BaseX, BaseY, BaseZ+80, BaseDir, 1 )        
                                                 AddToPartition( Goblin,0) 
		                SetAttack( Goblin , OwnerID()  )           
		                BeginPlot(Goblin,"LuaQ_421177_Sui",0)
		                sleep(60)
		LuaFunc_Obj_Suicide(50)

	else
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_421723]" , 0 )	--無法召喚，你沒有足夠的召喚物品！
	end
                end
