function LuaSpeak_110600()

	LoadQuestOption( OwnerID() );  -- 任務

	if CheckFlag( OwnerID() , 540002 )==false then
		AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_110600_4") , "LuaS_110600_4", 0 );--#我想學習分解術
		AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_110600_1") , "LuaS_110600_1", 0 );--#我要如何使用「分解術」？
--		AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_110600_2") , "LuaS_110600_2", 0 );--#我想知道更多關於「激發」的事情。
		--AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_110600_3") , "LuaFunc_110600_STORE", 0 );--#我購買一些基礎的激發寶石。
	else
		AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_110600_1") , "LuaS_110600_1", 0 );--#我要如何使用「分解術」？
--		AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_110600_2") , "LuaS_110600_2", 0 );--#我想知道更多關於「激發」的事情。
		--AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_110600_3") , "LuaFunc_110600_STORE", 0 );--#我購買一些基礎的激發寶石。
	end

end

-------------------------------------------------------------------------------------------------------------------------

function LuaS_110600_1()

   	SetSpeakDetail( OwnerID(), GetString ( "SD_110600_1" )   );--如果你已經學到分解術了，你可以在技能中的「一般技能」分頁找到這項法術。使用分解術後，再點選到想分解的武器、裝備或物品上，就能將該物件分解。

                                                                   --物品分解後，有機率可以得到該物品的構成材料，若分解的是武器或裝備，還有可能會到激發用的寶石，但生產用的符文是無法被分解出來的。

                                                                   --只有具有靈性的東西才能被分解，所以像商店所賣的商品、任務所給的特殊物品等等都無法被分解。


	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_BACK") , "LuaSpeak_110600", 0 );--#返回上一頁
		
end

-------------------------------------------------------------------------------------------------------------------------

function LuaS_110600_2()

   	SetSpeakDetail( OwnerID(), GetString ( "SD_110600_2" )   );--分解出來的寶石，經由右鍵點選使用後，再點在武器或裝備上就能進行激發，若激發成功，就能提高武器或裝備的威力一次。

								   --目前最多可以提高六次威力，但只有前三次比較穩定，即使沒有激發成功，也不會有任何的負面影響。但激發成功超過三次後，再下來的激發就可能反讓武器或裝備的威力降低，甚至最壞的情況，會讓武器或裝備消失！所以必須謹慎行事。


	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_BACK") , "LuaSpeak_110600", 0 );--#返回上一頁
		
end

-------------------------------------------------------------------------------------------------------------------------

function LuaFunc_110600_STORE()

	openshop();
	CloseSpeak( OwnerID() );

end

-------------------------------------------------------------------------------------------------------------------------

function LuaS_110600_4()

   	SetSpeakDetail( OwnerID(), GetString ( "SD_110600_4" )   );--
	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_IKNOW") , "LuaS_110600_5", 0 );--
		
end

-------------------------------------------------------------------------------------------------------------------------
function LuaS_110600_5()

   	CloseSpeak( OwnerID())	
	Beginplot( OwnerID() ,"LuaFunc_DISSOLUTION_Dialog", 0 )
		
end

-------------------------------------------------------------------------------------------------------------------------