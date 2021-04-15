--開啟樂透彩兌獎
function Sys_ExchangeLottery_Auto()
  SetPlot( OwnerID() , "Touch" , "Sys_ExchangeLottery_Open" , 50 );
end

function Sys_ExchangeLottery_Open()
  OpenExchangeLottery();
end

--開啟購買樂透彩
function Sys_BuyLottery_Auto()
  SetPlot( OwnerID() , "Touch" , "Sys_BuyLottery_Open" , 50 );
end

function Sys_BuyLottery_Open()
  OpenBuyLottery();
end
