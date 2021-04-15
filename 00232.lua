-------------------------------------------------------------------------------------------------------------
--毗爾斯敦土壤110219
function LuaI_110219()
--	SetPlot( OwnerID() , "touch" , "LuaS_110219_1" , 40 );
end
-------------------------------------------------------------------------------------------------------------
function LuaS_110219_1()
	if CheckAcceptQuest( OwnerID() ,420191 ) == true  and CountBodyItem( OwnerID(), 200675 ) < 8 then
		Hide( TargetID() );   --隱藏污染土堆
		GiveBodyItem( OwnerID() , 200675 , 1 )	-- 毗爾斯敦土壤
		Sleep( 100 );
		Show( TargetID() ,0);    --顯示污染土堆
	elseif CheckAcceptQuest( OwnerID() ,420193 ) == true  and CountBodyItem( OwnerID(), 201031 ) < 6 then
		if  CountBodyItem( OwnerID(), 200652 ) >=1 then    --檢查是否擁有活甦滴露
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_110219_1") , 0)	--使用活甦滴露，淨化了土壤！
			Hide( TargetID() );   --隱藏污染土堆
			Local Obj3  =  Createobjbyobj( 110422, TargetID(), 1  );   --產生毗爾斯敦的淨化土堆
			Sleep( 100 );
			Delobj( Obj3 );    --刪除淨化土堆
			Show( TargetID() ,0);    --顯示污染土堆
		else
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_110219_2") , 0)	--你沒有活甦滴露，無法淨化土壤！
		end
	end
end
-------------------------------------------------------------------------------------------------------------
--朵利安土壤110220
function LuaI_110220()
--	SetPlot( OwnerID() , "touch" , "LuaS_110220_1" , 40 );
end
-------------------------------------------------------------------------------------------------------------
function LuaS_110220_1()
	if CheckAcceptQuest( OwnerID() ,420191 ) == true and CountBodyItem( OwnerID(), 200673 ) < 8 then
		Hide( TargetID() );   --隱藏污染土堆
		GiveBodyItem( OwnerID() , 200673 , 1 )	-- 朵利安土壤
		Sleep( 100 );
		Show( TargetID() ,0);    --顯示污染土堆
	elseif CheckAcceptQuest( OwnerID() ,420193 ) == true and CountBodyItem( OwnerID(), 201032 ) < 6 then
		if  CountBodyItem( OwnerID(), 200652 ) >=1 then    --檢查是否擁有活甦滴露
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_110219_1") , 0)	--使用活甦滴露，淨化了土壤！
			Hide( TargetID() );   --隱藏污染土堆
			Local Obj2  =  Createobjbyobj( 110423, TargetID(), 1  );   --產生朵利安的淨化土堆
			Sleep( 100 );
			Delobj( Obj2 );    --刪除淨化土堆
			Show( TargetID() ,0);    --顯示污染土堆
		else
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_110219_2") , 0)	--你沒有活甦滴露，無法淨化土壤！
		end
	end
end
-------------------------------------------------------------------------------------------------------------
--麥督格土壤110221
function LuaI_110221()
--	SetPlot( OwnerID() , "touch" , "LuaS_110221_1" , 40 );
end
-------------------------------------------------------------------------------------------------------------
function LuaS_110221_1()
	if CheckAcceptQuest( OwnerID() ,420191 ) == true  and CountBodyItem( OwnerID(), 200674 ) < 8 then
		Hide( TargetID() );   --隱藏污染土堆
		GiveBodyItem( OwnerID() , 200674 , 1 )	-- 麥督格土壤
		Sleep( 100 );
		Show( TargetID() ,0);    --顯示污染土堆
	end
end
-------------------------------------------------------------------------------------------------------------