function LuaI_422222()	--�����l�@��
	SetPlot( OwnerID() , "touch" , "LuaI_422222_01" , 40 )
end

function LuaI_422222_01()
	if CheckAcceptQuest( OwnerID() , 422222 ) == true and    CountBodyItem( OwnerID() , 204410 ) <1 then    
		 ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_422222_1]" , 0 )---�A���G�S�a����������I 
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
			if ( CastBarStatus > 0) then -- ���\
				resultZ = "OKOK"
				EndCastBar( OwnerID() , CastBarStatus )
				break;
			elseif ( CastBarStatus < 0 ) then -- ����
				resultZ = "DAME"
				EndCastBar( OwnerID() , CastBarStatus )
				break;
			end
		end
	end
   end
	if ( resultZ == "OKOK" ) then
		DelBodyItem ( OwnerID() , 204410 , 1 )		--/* �R�����W���F��
                                sleep(30)
		ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_422222_2]" , 0 )---�A���Gť���F�Y���̰ʪ��n���A�ѻ��Ӫ�C
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