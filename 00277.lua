-------------------------------------------------------------------------------------------------------------
--風嚎岩塔古文物-1
-------------------------------------------------------------------------------------------------------------
Function LuaI_110440()

	Setplot( OwnerID(), "touch", "LuaI_110440_1", 40);	--設定物件觸碰劇情

End
-------------------------------------------------------------------------------------------------------------
Function LuaI_110440_1()

	if CheckAcceptQuest( OwnerID(), 420318) == true And CountBodyItem( OwnerID(), 200897) >= 1 And Checkflag( OwnerID(), 540761) == false then	
	--玩家擁有任務、魔晶粉、尚未對此古文物做記號
	Setflag( OwnerID(), 540761, 1);		--開啟記號Flag
	DelBodyItem( OwnerID(), 200897, 1);	--刪除魔晶粉*1
	end
End


-------------------------------------------------------------------------------------------------------------
--風嚎岩塔古文物-2
-------------------------------------------------------------------------------------------------------------
Function LuaI_110441()

	Setplot( OwnerID(), "touch", "LuaI_110441_1", 40);	--設定物件觸碰劇情

End
-------------------------------------------------------------------------------------------------------------
Function LuaI_110441_1()

	if CheckAcceptQuest( OwnerID(), 420318) == true And CountBodyItem( OwnerID(), 200897) >= 1 And Checkflag( OwnerID(), 540762) == false then	
	--玩家擁有任務、魔晶粉、尚未對此古文物做記號
	Setflag( OwnerID(), 540762, 1);		--開啟記號Flag
	DelBodyItem( OwnerID(), 200897, 1);	--刪除魔晶粉*1
	end
End


-------------------------------------------------------------------------------------------------------------
--風嚎岩塔古文物-3
-------------------------------------------------------------------------------------------------------------
Function LuaI_110442()

	Setplot( OwnerID(), "touch", "LuaI_110442_1", 40);	--設定物件觸碰劇情

End
-------------------------------------------------------------------------------------------------------------
Function LuaI_110442_1()

	if CheckAcceptQuest( OwnerID(), 420318) == true And CountBodyItem( OwnerID(), 200897) >= 1 And Checkflag( OwnerID(), 540763) == false then
	--玩家擁有任務、魔晶粉、尚未對此古文物做記號
	Setflag( OwnerID(), 540763, 1);		--開啟記號Flag
	DelBodyItem( OwnerID(), 200897, 1);	--刪除魔晶粉*1
	end
End


-------------------------------------------------------------------------------------------------------------
--風嚎岩塔古文物-4
-------------------------------------------------------------------------------------------------------------
Function LuaI_110443()

	Setplot( OwnerID(), "touch", "LuaI_110443_1", 40);	--設定物件觸碰劇情

End
-------------------------------------------------------------------------------------------------------------
Function LuaI_110443_1()

	if CheckAcceptQuest( OwnerID(), 420318) == true And CountBodyItem( OwnerID(), 200897) >= 1 And Checkflag( OwnerID(), 540764) == false then	
	--玩家擁有任務、魔晶粉、尚未對此古文物做記號
	Setflag( OwnerID(), 540764, 1);		--開啟記號Flag
	DelBodyItem( OwnerID(), 200897, 1);	--刪除魔晶粉*1
	end
End


-------------------------------------------------------------------------------------------------------------
--風嚎岩塔古文物-5
-------------------------------------------------------------------------------------------------------------
Function LuaI_110444()

	Setplot( OwnerID(), "touch", "LuaI_110444_1", 40);	--設定物件觸碰劇情

End
-------------------------------------------------------------------------------------------------------------
Function LuaI_110444_1()

	if CheckAcceptQuest( OwnerID(), 420318) == true And CountBodyItem( OwnerID(), 200897) >= 1 And Checkflag( OwnerID(), 540765) == false then	
	--玩家擁有任務、魔晶粉、尚未對此古文物做記號
	Setflag( OwnerID(), 540765, 1);		--開啟記號Flag
	DelBodyItem( OwnerID(), 200897, 1);	--刪除魔晶粉*1
	end
End
-------------------------------------------------------------------------------------------------------------


-------------------------------------------------------------------------------------------------------------
--祝福之蝶冰雪蝶
-------------------------------------------------------------------------------------------------------------
Function LuaI_110081()

	Setplot( OwnerID(), "touch", "LuaI_110081_1", 40)	--設定物件觸碰劇情
End
------------------------------------------------------------------------------------------------------------
Function LuaI_110081_1()
	if CheckAcceptQuest (OwnerID(), 420326) ==true And CountBodyItem( OwnerID(), 200907) >=1 then
	GiveBodyItem( OwnerID(), 200908, 1);	--給予冰雪蝶之瓶
	DelBodyItem( OwnerID(), 200907, 1);	--刪除冰製瓶
	end
End
------------------------------------------------------------------------------------------------------------