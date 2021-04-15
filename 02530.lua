function Lua_na_119642_check() --沃夫．德蘭卡檢查玩家是否已經把杯子丟掉
local Q1 = CheckAcceptQuest( OwnerID() , 424794 ) --檢查身上是否有任務 薩奇的杯子
local Q2 = CheckAcceptQuest( OwnerID() , 424795 ) -- 檢查身上是否有任務 棚上的木杯
local KEY = CheckFlag (OwnerID() , 545767 ) 

local a = CheckCompleteQuest( OwnerID(), 424795 ) -- 棚上的木杯
local b = CheckCompleteQuest( OwnerID(), 424794 )  --薩旗的杯子
local cup = CountBodyItem ( OwnerID(), 240792 )

	if Q1 == true and Key == false then --玩家接了第一階段的任務，與沃夫對話取得下一階段的任務開啟資格 
		Setspeakdetail (OwnerID(), GetString("SC_119642_3") ) --薩奇的杯子…？薩奇的杯子……　啊…有…有……我是有去找他喝酒沒錯……
		GiveBodyItem( OwnerID() , 545767, 1 )

	else
		LoadQuestOption( OwnerID() )
		if a == true and b == false and cup < 1 then		--如果玩家將薩奇的杯子弄丟，重新給予任務用杯
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_119642_0"), "Lua_na_119642_give", 0 ) -- 我把薩奇的杯子弄丟了
		end
	end
end



function Lua_na_119642_give() --沃夫．德蘭卡
	local X=Countbodyitem( OwnerID(), 240792) -- 充滿歉意的木杯
	if  X< 1 then
		Setspeakdetail (OwnerID(), GetString("SC_119642_1") ) -- 哎呀！你怎麼這麼粗心呢！還好我在上面施了回歸法術，在[119641]順利收到杯子前，若是遺失了，它會自動回到我身邊。這次，可別再弄丟了呀！
		Givebodyitem ( OwnerID(), 240792, 1 )
	else
		Setspeakdetail (OwnerID(), GetString("SC_119642_2") ) --你該不會跟我一樣老迷糊了吧？　瞧！杯子不就在你身上嗎！
	end
end


function Lua_119877_say() --妮妮．灰印的對話
	local Owner = OwnerID()
	while true do
		local R = rand(10)
	--	Say( Owner , R )
		if R == 1 then
			NPCSAY( Owner , "[SC_119877_SPEAK1]" ) --我想跟頑固狗狗玩，可是守衛叔叔說話都兇巴巴的……
		elseif R == 3 then
			NPCSAY( Owner , "[SC_119877_SPEAK2]" ) --外面的蛇好可怕唷！他們會不會一口把我吃掉呀？
		elseif R ==5 then
			NPCSAY( Owner , "[SC_119877_SPEAK3]" ) --如果能快點長大，就可以到處冒險了！
		end
		sleep(100)
	end			
end
	