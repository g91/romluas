function LuaS_BuyLotteryNPC_0()

	LoadQuestOption( OwnerID() );	--���J����

	AddSpeakOption( OwnerID(), TargetID( ), GetString("EM_BUY_LOTTERY"), "LuaS_BuyLotteryNPC_1", 0 ) 


end

function LuaS_ExchangeLotteryNPC_0()

	LoadQuestOption( OwnerID() );	--���J����

	AddSpeakOption( OwnerID(), TargetID( ), GetString("EM_BUY_LOTTERY"), "LuaS_BuyLotteryNPC_1", 0 ) 
	AddSpeakOption( OwnerID(), TargetID( ), GetString("EM_EXCHANGE_LOTTERY"),"LuaS_BuyLotteryNPC_2", 0 ) 

end

function LuaS_BuyLotteryNPC_1()

	CloseSpeak( OwnerID() );
	Sys_BuyLottery_Open();

end

function LuaS_BuyLotteryNPC_2()

	CloseSpeak( OwnerID() );
	Sys_ExchangeLottery_Open();

end