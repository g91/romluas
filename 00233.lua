Function LuaI_110424()

	SetPlot( OwnerID(), "touch", "LuaQ_110424_1", 40)

end
---------------------------------------------------------------------------------------------------------------
Function LuaQ_110424_1()

	 if CountBodyItem( OwnerID(), 200968) >=1 then
		DelBodyItem( OwnerID(), 200968, 1);  --檢查並刪除勇氣之水
		BeginPlot( TargetID(), "LuaQ_110424_2",0); 
	end

End
-----------------------------------------------------------------------------------------------------------------
Function LuaQ_110424_2()

	--CastSpell( OwnerID(), OwnerID(), "特效編號");
	 --sleep(300)
	--Hide( OwnerID() );  --隱藏試煉之碑
	Local Obj01 = CreateObjbyObj( 100282, OwnerID(), 1);  --產生試煉獸
	
	For i=1,200,1 do
		if checkID( TargetID() ) == False then
			break  --檢查不到玩家，離開
		end
		if ReadRoleValue( TargetID(), EM_RoleValue_IsDead)==1 then
			Break; --玩家已死亡，離開
		end
		sleep(60); --共(1200),20mins
	end

	Delobj( Obj01);  --刪除試煉獸
	--if CheckID( TargetID() ) ==ture then (將玩家傳送出獨立zone)
		
End