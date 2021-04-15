function LuaI_422222()	--誘餌初始劇情
	SetPlot( OwnerID() , "touch" , "LuaI_422222_01" , 40 )
end

function LuaI_422222_01()
	if CheckAcceptQuest( OwnerID() , 422222 ) == true and    CountBodyItem( OwnerID() , 204410 ) <1 then    
		 ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_422222_1]" , 0 )---你似乎沒帶換取的誘餌！ 
		return
	end
               if CheckAcceptQuest( OwnerID() ,422222) ==FALSE  then

                        return
                 END


	local resultZ = "";
	if CountBodyItem( OwnerID() , 204410 ) >= 1  then  
		if BeginCastBar( OwnerID(), "[SC_422222_3]" , 30 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_END , 0 ) ~= 1 then
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
		DelBodyItem ( OwnerID() , 204410 , 1 )		--/* 刪除身上的東西
                                sleep(30)
		ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_422222_2]" , 0 )---你似乎聽見了某種騷動的聲音，由遠而近。
                                sleep(20)
                                		local Obj = Role:new( TargetID()  )
				local BaseX = Obj :X()		
			 	local BaseY = Obj :Y();		
			 	local BaseZ = Obj :Z();		
				local BaseDir = Obj:Dir();		
			 	local DD= CreateObj(101845, BaseX+80, BaseY, BaseZ+80, BaseDir, 1 )        
                                                	                AddToPartition( DD,0)     
                                          	                               SetAttack( DD , OwnerID()  )           
		                                              BeginPlot(DD,"LuaQ_421177_Sui",0)
		                                              sleep(60)
		                                             LuaFunc_Obj_Suicide(50)

	end
                end