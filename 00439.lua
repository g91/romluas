--�}�Ҽֳz�m�I��
function Sys_ExchangeLottery_Auto()
  SetPlot( OwnerID() , "Touch" , "Sys_ExchangeLottery_Open" , 50 );
end

function Sys_ExchangeLottery_Open()
  OpenExchangeLottery();
end

--�}���ʶR�ֳz�m
function Sys_BuyLottery_Auto()
  SetPlot( OwnerID() , "Touch" , "Sys_BuyLottery_Open" , 50 );
end

function Sys_BuyLottery_Open()
  OpenBuyLottery();
end
