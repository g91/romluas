					
function LuaDan_111700_0()
	SetSpeakDetail(OwnerID(), "[SC_DAN_111700_1]" )--NPC對話   --.."[SC_DAN_111700_3]"
	AddSpeakOption(OwnerID(), TargetID(), "[SC_DAN_111700_2]", "LuaDan_111700_4", 0) --我想要更了解春雨節慶活動
	AddSpeakOption(OwnerID(), TargetID(), "[SC_DAN_111700_4]", "LuaDan_111700_1", 0) --關於被偷竊的彩蛋Stealed eggs
	AddSpeakOption(OwnerID(), TargetID(), "[SC_DAN_111700_5]", "LuaDan_111700_2", 0) --關於花瓣集集樂Petal collection
	AddSpeakOption(OwnerID(), TargetID(), "[SC_DAN_111700_6]", "LuaDan_111700_3", 0) --關於遊行挖挖樂Hide and Dig
	AddSpeakOption(OwnerID(), TargetID(), "[SC_SPRINGFES_NEW01]", "Lua_mika_spring_reward", 0) --兌換獎勵項目

	local Language = GetServerDataLanguage() 
--	if Language ~= "rw" then  -- 台版專屬沒有重置選項  測試用
	if Language ~= "tw" then  -- 台版專屬沒有重置選項  正式版
		AddSpeakOption(OwnerID(), TargetID(), "[SC_SPRINGFES_NEW09]", "Lua_mika_springfes_changeitem", 0) --兌換[206847]
	end

end
---------------------------------------------------------------------------------------------------
function LuaDan_111700_1()--關於被偷竊的彩蛋Stealed eggs
	SetSpeakDetail (OwnerID(), "[SC_DAN_111700_7]") --被偷竊彩蛋任務內文
	AddSpeakOption(OwnerID(), TargetID(), "[SC_DAN_111700_12]", "LuaDan_111700_5", 0) --如何取回被偷竊的彩蛋
	AddSpeakOption(OwnerID(), TargetID(), "[SC_DAN_111700_18]", "LuaDan_111700_8", 0) --用10顆被偷竊的彩蛋兌換結晶
end
------------------------------------------------------------------------------------------------------
function LuaDan_111700_2()
        SetSpeakDetail (OwnerID(), "[SC_DAN_111700_8]" ) --花瓣集集樂任務內文
        AddSpeakOption(OwnerID(), TargetID(), "[SC_DAN_111700_13]", "LuaDan_111700_6", 0) --如何收集虹花樹花辦
        AddSpeakOption(OwnerID(), TargetID(), "[SC_DAN_111700_25]", "LuaDan_111700_9", 0) --用20朵虹花花瓣兌換獎勵
end
---------------------------------------------------------------------------------------------------------
function LuaDan_111700_3()
	SetSpeakDetail (OwnerID(), "[SC_DAN_111700_9]" ) --遊行挖挖樂任務內文
	AddSpeakOption(OwnerID(), TargetID(), "[SC_DAN_111700_14]", "LuaDan_111700_7", 0) --如何進行遊行挖挖樂
end
-----------------------------------------------------------------------------------------------------------
function LuaDan_111700_4()
         SetSpeakDetail (OwnerID(), "[SC_DAN_111700_10]") --春雨節慶活動背景 
         AddSpeakOption (OwnerID(), TargetID(), "[SC_DAN_111700_29]", "LuaDan_111700_4_1", 0)  --春雨節慶活動背景2
         AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "LuaDan_111700_0", 0)--回到上一頁
end
-----------------------------------------------------------------------------------------------------------
function LuaDan_111700_4_1()
         SetSpeakDetail (OwnerID(), "[SC_DAN_111700_3]") --春雨節慶活動背景2 
         AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "LuaDan_111700_0", 0)--回到上一頁	
end
-----------------------------------------------------------------------------------------------------------
function lua_mika_springfes_changeitem()  --兌換重置券
	SetSpeakDetail(OwnerID(), "[SC_SPRINGFES_NEW07]" )
	AddSpeakOption(OwnerID(), TargetID(), "[SC_SPRINGFES_NEW08]", "lua_mika_springfes_changeitem1", 0) --我要兌換[206847]

end

function lua_mika_springfes_changeitem1()
	local item = CountBodyItem(OwnerID(), 202435) --家
	if item >= 1 then
		SetSpeakDetail( OwnerID(), "[SC_112502_OK]") --祝你春雨節快樂！ 
		GiveBodyItem(OwnerID(), 206847, 1)
		DelBodyItem(OwnerID(), 202435, 1)
	else
		SetSpeakDetail( OwnerID(), "[SC_0908SEANSON_26]") --你所持的物品數量不足
		 AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "lua_mika_springfes_changeitem", 0)--回到上一頁
	end
end
-----------------------------------------------------------------------------------------------------------
function LuaDan_111700_5()
         SetSpeakDetail (OwnerID(), "[SC_DAN_111700_15]" ) --取回彩蛋任務教學
         AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "LuaDan_111700_1", 0)--回到上一頁
end
-----------------------------------------------------------------------------------------------------------
function LuaDan_111700_6()
	 SetSpeakDetail (OwnerID(), "[SC_DAN_111700_16]" ) --收集虹花樹花瓣教學 
      	 AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "LuaDan_111700_2", 0)--回到上一頁
end
-----------------------------------------------------------------------------------------------------------
function LuaDan_111700_7()
	 SetSpeakDetail (OwnerID(), "[SC_DAN_111700_17]" ) --進行遊行挖挖樂辦法 
   	 AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "LuaDan_111700_3", 0)--回到上一頁
end

------------------------------------------------------------------------------------------------------------
function LuaDan_111700_8()  --彩蛋任務回報
	local Coloureggs = CheckFlag(OwnerID()  , 542427) --確認今天是否解過任務  
	if Coloureggs == false then
		if EmptyPacketCount( OwnerID() ) >= 2 and QueuePacketCount( OwnerID() ) == 0 then
			if CountBodyItem( OwnerID() , 204215) >= 10 then  --彩蛋 > 10
       				 	 DelBodyItem( OwnerID() , 204215 , 10 ) --刪除彩蛋10個
       					 SetSpeakDetail (OwnerID(), "[SC_DAN_111700_19]" ) --兌換物品對話
		           			  GiveBodyItem( OwnerID() , 204218  , 3 )   -- 資源
                       				 GiveBodyItem( OwnerID() , 204216  , 1 ) --扁掉的魔法袋
                         				 SetFlag( OwnerID()  , 542427 , 1 ) --給予已兌換獎勵旗標，一天解一次
                         			 	AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "LuaDan_111700_1", 0)--回到上一頁
			else
				                SetSpeakDetail( OwnerID(), "[SC_DAN_111700_21]") --你的數量不夠兌換對話
                			                AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "LuaDan_111700_1", 0)--回到上一頁
			end
		else
			SetSpeakDetail( OwnerID(), "[SC_DAN_111700_22]")  --您的背包空間不足，請清理一下再來吧。	
			 AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , "LuaDan_111700_1", 0 ) --回到上一頁    
		end
                else
		SetSpeakDetail (OwnerID(), "[SC_DAN_111700_20]") --已經兌換過獎勵對話(身上有flag)
		AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "LuaDan_111700_1", 0)--回到上一頁                		
        	end 
end
-----------------------------------------------------------------------------------------------------------------
function LuaDan_111700_9()  --花瓣任務回報
      	  local Coloureggs = CheckFlag(OwnerID()  , 542428) --確認今天是否解過任務  
	if Coloureggs == false then
		if EmptyPacketCount( OwnerID() ) >= 2 and QueuePacketCount( OwnerID() ) == 0 then
			if CountBodyItem( OwnerID() , 204217) >= 1 then  
       			                 SetSpeakDetail (OwnerID(), "[SC_DAN_111700_23]" ) --兌換物品對話
		           		  GiveBodyItem( OwnerID() , 204218  , 3 )   -- 資源                     
				  DelBodyItem( OwnerID() , 204217 , 1 ) --刪除魔法袋
				local X = Rand( 100 )    
				if X >= 0 and X <=25  then  
					--Say(OwnerID(), X)
					AddBuff( OwnerID() ,503112,0 ,3600) --櫻花夢境 
				elseif X >= 26 and X <= 50 then
					--Say(OwnerID(), X)
					AddBuff( OwnerID() ,503113,0 ,3600) --風鈴木夢境 
				elseif X >= 51 and X <= 75 then
					--Say(OwnerID(), X)
					AddBuff( OwnerID() ,502946,0 ,3600) --勿忘我夢境 
				elseif X >= 76  then
					--Say(OwnerID(), X)
					AddBuff( OwnerID() ,502929,0 ,3600) --杜鵑花夢境 
				end		     					
                    			  SetFlag( OwnerID()  , 542428 , 1 ) --給予已兌換獎勵旗標，一天解一次
                       			  AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "LuaDan_111700_2", 0)--回到上一頁
			else
				  SetSpeakDetail( OwnerID(), "[SC_0908SEANSON_26]") --你所持的物品數量不足。 
              			  AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "LuaDan_111700_2", 0)--回到上一頁
			end
		else
			SetSpeakDetail( OwnerID(), "[SC_DAN_111700_22]")  --您的背包空間不足，請清理一下再來吧。	
			 AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , "LuaDan_111700_2", 0 ) --回到上一頁    
		end
               else
		SetSpeakDetail (OwnerID(), "[SC_DAN_111700_20]") --已經兌換過獎勵對話(身上有flag)
		AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "LuaDan_111700_2", 0)--回到上一頁                		
        	end 
end

------------------------------------------------------------------------------
function Lua_mika_spring_reward() --兌換獎勵項目
	SetSpeakDetail(OwnerID(), "[SC_SPRINGFES_NEW02]" )-- 兌換物品如下： (略)
	AddSpeakOption(OwnerID(), TargetID(), "[SC_SPRINGFES_NEW03]", "Lua_mika_spring_reward01", 0) --我要兌換[204094]
	AddSpeakOption(OwnerID(), TargetID(), "[SC_SPRINGFES_NEW04]", "Lua_mika_spring_reward02", 0) --我要兌換[204379]
end
------------------------------------------------------------------------------
function Lua_mika_spring_reward01() --我要兌換[204094] 嘉斯汀禮盒
	local Owner = OwnerID()
	local Target = TargetID()
	local item = CountBodyItem( Owner , 204218 ) --地靈結晶
	local random = rand(100)

	if item >= 12 then --如果數量夠
		SetSpeakDetail(Owner , "[SC_DAN_111700_31]" )--太棒了，蒐集這麼多不同類型的資源，那就給你這些獎勵囉！
		GiveBodyItem( Owner , 204094  , 1 ) --給 嘉斯汀禮盒X1
		GiveBodyItem( Owner , 241481 , 15 ) --給予烈火元素X15
		if random <20 then
			GiveBodyItem( Owner , 725449 , 1 )  --公會資源包
		end
		DelBodyItem( Owner , 204218 , 12 ) --刪 地靈結晶
	else --如果數量不夠
		SetSpeakDetail(Owner, "[SC_DAN_111700_32]" )--你沒有足夠數量的結晶，不能兌換獎勵，請再加加油吧。	
		AddSpeakOption( Owner, Target, "[SO_BACK]" , "Lua_mika_spring_reward", 0 ) --回到上一頁 
	end	
end
------------------------------------------------------------------------------
function Lua_mika_spring_reward02() --我要兌換[204379] 彩蛋禮盒
	local Owner = OwnerID()
	local Target = TargetID()
	local item = CountBodyItem( Owner , 204218 ) --地靈結晶

	if item >= 12 then --如果數量夠
		SetSpeakDetail(Owner, "[SC_DAN_111700_31]" )--太棒了，蒐集這麼多不同類型的資源，那就給你這些獎勵囉！
		GiveBodyItem( Owner , 204379  , 1 ) --給 彩蛋禮盒X1
		GiveBodyItem( Owner , 241481 , 15 ) --給予烈火元素X15
		DelBodyItem( Owner , 204218 , 12 ) --刪 地靈結晶
	else --如果數量不夠
		SetSpeakDetail( Owner , "[SC_DAN_111700_32]" )--你沒有足夠數量的結晶，不能兌換獎勵，請再加加油吧。	
		AddSpeakOption( Owner , Target , "[SO_BACK]" , "Lua_mika_spring_reward", 0 ) --回到上一頁 
	end	
end


function Lua_mika_spring_flowertest()
	local X = Rand( 100 )    
	if X >= 0 and X <=25  then  
		Say(OwnerID(), X)
		AddBuff( OwnerID() ,503112,0 ,3600) --櫻花夢境 
	elseif X >= 26 and X <= 50 then
		Say(OwnerID(), X)
		AddBuff( OwnerID() ,503113,0 ,3600) --風鈴木夢境 
	elseif X >= 51 and X <= 75 then
		Say(OwnerID(), X)
		AddBuff( OwnerID() ,502946,0 ,3600) --勿忘我夢境 
	elseif X >= 76  then
		Say(OwnerID(), X)
		AddBuff( OwnerID() ,502929,0 ,3600) --杜鵑花夢境 
	end
end