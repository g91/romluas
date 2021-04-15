Function LuaQ_420240_Accept()

	SetPlot( OwnerID(), "touch", "LuaFunc_Obj_BUSY", 40);	--鎖定珊嘉娜
	
	local Parlas
	sleep( 30);
	Parlas = CreateObj( 100217, -4288,  233, -8085 , 0, 1);		--產生帕拉斯
	AddToPartition( Parlas, 0  );	--顯示帕拉斯
	SetAttack( Parlas, TargetID() );	--設定攻擊開啟任務者
	BeginPlot(Parlas, "LuaQ_420240_Suicide",0);	--檢查、消失設定
	sleep( 10);

	While 1 do
		if CheckID(Parlas) == false then	--若是帕拉斯已消失
			SetPlot( OwnerID(), "touch","",0);	--重新開啟珊嘉娜觸碰劇情
			break	--跳出迴圈
		end
		sleep( 20 )	--迴圈檢查間隔時間
	end
End
---------------------------------------------------------------------------------------
Function LuaQ_420240_Suicide()
	LuaFunc_Obj_Suicide( 300 );
end