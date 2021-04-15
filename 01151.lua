function LuaS_421671_0()
	Hide( OwnerID() )
	local OBJ= Role:new( TargetID() ) 
	local BaseX = Obj :X()
	local BaseY = Obj :Y();
	local BaseZ = Obj :Z();
	local BaseDir = Obj:Dir();
	local kk = CreateObj( 101522, BaseX, BaseY, BaseZ, BaseDir -180, 1)
	AddToPartition( kk , 0)
	SetAttack( KK, TargetID() )
                BeginPlot(KK ,"LuaQ_421177_Sui" , 0 )  
                while true do
                            sleep(20)
		 IF  CheckID( kk ) == FALSE  then  -- 檢查是否離開戰鬥
	              		Show(OwnerID() , 0)
			return true
  		end
	end
End


Function LuaI_203585_Quest()---靈魂聚集體
	local str = "["..GetUseItemGUID(OwnerID()).."]"
	ClearBorder( OwnerID());	--初始化石碑介面
	AddBorderPage( OwnerID(), "[SC_421670]")
                      ShowBorder( OwnerID(), 421670,str , "ScriptBorder_Texture_Paper" )	

end


