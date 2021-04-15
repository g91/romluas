function Lua_na_thanks_begin0()
	local O_ID = OwnerID()
	LoadQuestOption( O_ID)
	if checkflag(O_ID , 546091) == false then
		SetFlag( O_ID , 546084 , 1 )
	end
end


function Lua_na_thanks_test1end()
	SetFlag( O_ID , 546084 , 0 )
	SetFlag( O_ID , 546091 , 1 )
end

function lua_TEST_mobius_tp_stone(mode) --計時模式的TP石抽獎(amount=給的次數) mode=模式 
--在生存模式中，每給一次零件，得到零件A的機率是30%，零件B的機率是70%。--mode= 0
--在計時模式中，每給一次零件，得到零件A的機率是70%，零件B的機率是30%。--mode=1
	local Owner = OwnerID()
	for i= 1, 3, 1 do
		local random=rand(10) --抽獎
   		if random>2 then  --70%的獎
			if mode==0 then
				givebodyitem(Owner,  241648, 1)	--在生存模式中零件B的機率是(70%)					
			elseif mode==1 then 
   				givebodyitem(Owner ,  241647, 1)  --在計時模式中給零件A機率 (70%)
			end
   		else --30%獎
			if mode==0 then
				givebodyitem(Owner ,  241647, 1)  --在生存模式中給零件A機率 (30%)
			elseif mode==1 then 
   				givebodyitem(Owner ,  241648, 1) --在計時模式中給零件B機率 (30%)
			end
   		end
	end
end


function nana_shop()
	SetSpeakDetail( OwnerID() , "HELLO")
 	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	Setshop( OwnerID() , 600559 , "Test_Shop_Close")
end