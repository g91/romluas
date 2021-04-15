
--=======================================================================
---------開啟精美妝盒，得到[206367]肯特羅恩的腕輪、[206409]開啟的精美妝盒
--206366精美妝盒
--=======================================================================


function LuaI_422844_206366_ItemUse()	--掛在item206366下面

	DelBodyItem( OwnerID() , 206366 , 1 )
	GiveBodyItem( OwnerID() , 206367 , 1 )
	GiveBodyItem( OwnerID() , 206409 , 1 )

end


--=======================================================================
-----422845靠近圖騰柱，得<查看呃杜圖騰543469>
--=======================================================================
---接任務：米娜薇絲	還任務：呃拉滿
---任務物品：113963藏在土圖騰的隱形
---重要物品：543469查看呃杜圖騰
---達成：讓玩家去查看呃杜圖騰，再找呃拉滿還任務


function LuaS_422845_113963()	--掛在圖騰柱113963的初始劇情
	Setplot(OwnerID(),"range","LuaS_422845_113963_1",200)	
end

function LuaS_422845_113963_1()
	if 	(CheckAcceptQuest(OwnerID(),422845)==true ) 		and			
		(CheckCompleteQuest( OwnerID() , 422845) == false ) 	and
		Checkflag(OwnerID(),543469)== false			then
		Setflag(OwnerID(),543469,1)
		ScriptMessage( OwnerID()  , OwnerID()   , 1 , "[SC_422845_0]" , 0 )	--已完成查看呃杜圖騰。
		
	end
end



--=======================================================================
-------------422846使用儀式小刀，得到世界塵
--=======================================================================

function LuaI_422846_206373_ItemUse_0()
	
	GiveBodyItem( OwnerID() , 206372 , 1 )
	ScriptMessage(  OwnerID()   , OwnerID()    , 0 , "[SC_422846_13]" , 0 )		--你得到一束你的頭髮。
	UseItemDestroy()			--此指令可刪除使用中的物品
end


--=======================================================================
function LuaI_422848_206376_ItemUse()
	
	Beginplot(TargetID(),"LuaI_422848_206376_ItemUse_1",0)
end

function LuaI_422848_206376_ItemUse_1()
	ClearBorder( TargetID() );		--你打開地圖查看，發現.....
	AddBorderPage( TargetID(), "[SC_422848_4]" )
	ShowBorder( TargetID(), 0, "[206376]", "ScriptBorder_Texture_Paper" )
end




--function LuaI_205883() --信件內容
--	ClearBorder( OwnerID() );
--	AddBorderPage( OwnerID(), "[SC_205883]");
--	ShowBorder( OwnerID(), 0, "[205883]", "ScriptBorder_Texture_Paper" );
--end


--=======================================================================
-------------
--=======================================================================

function LuaI_114025()	--瀑布底的土堆
	if 	CountBodyItem( OwnerID(), 206366)>0	then
		return false
	end
	
	if 	CountBodyItem( OwnerID(), 206367)>0	and
	  	CountBodyItem( OwnerID(), 206409)>0	then
		return false
	end
	return true
end





--=======================================================================
--傳送
--=======================================================================

function LuaQ_422853_Accept()	 --422853:掛在接受任務之後，嘩里雅傳送玩家
	BeginPlot( TargetID() , "LuaQ_422853_Accept_Do" , 0 )
end

function LuaQ_422853_Accept_Do()
	CastSpell( OwnerID() , OwnerID() , 491008 )
	sleep( 5 )
	ChangeZone( OwnerID() , 7 , 0 , 16020 , 3 , 21672 , 110 )
end
------------------------------------------------------------------------
--function LuaS_422854_5()		--隱士傳送玩家
--	CloseSpeak( OwnerID() )
--	BeginPlot(OwnerID()  , "LuaS_422854_6" , 0 )
--end

--function LuaS_422854_6()
--	CastSpell( OwnerID() , OwnerID() , 491008 )
--	sleep( 5 )
--	ChangeZone( OwnerID() , 8 , 0 , 4043, 261 , 21530 , 166 )
--end