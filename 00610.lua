

--節慶活動共用魔幻寶盒能量給予NPC
function lua_mika_fes_magicnpc_01()
	local OID = OwnerID()
	local TID = TargetID()

	SetSpeakDetail( OID , "[SC_MAGICBOX_EVENT_01]" )   -- 對話
	AddSpeakOption( OID , OID , "[SC_MAGICBOX_EVENT_06]" , "lua_mika_fes_magicnpc_03" , 0)   -- 關於節慶煙火
	AddSpeakOption( OID , OID , "[SC_MAGICBOX_EVENT_02]" , "lua_mika_fes_magicnpc_02" , 0)   -- 我想兌換本日獎勵

end

--我想兌換本日獎勵
function lua_mika_fes_magicnpc_02()
	local OID = OwnerID() -- player
	local TID = TargetID()   --npc

	-- 當天給過點數
	local keyid = 544302   -- 當天已領取禮物
	local checkkey = Checkflag(OID, keyid ) 

	local buffid = 621830 --魔幻寶盒能量兌換憑證
	local bufflv =  FN_CountBuffLevel(OID, buffid )  
	local Count1 = CountBodyItem(OID, 203292 )  --璀璨星空
	local Count2 = CountBodyItem(OID, 203293 )  --熱情仲夏
	local Count3 = CountBodyItem(OID, 203294 )  --金碧輝煌
	local Count4 = CountBodyItem(OID, 203295 )  --星雲瀰漫
	local Count5 = CountBodyItem(OID, 203291 )  --心心相印

	if checkkey == true then -- 當天領過
		SetSpeakDetail( OID , "[SC_MAGICBOX_EVENT_03]" )  -- 你今天已經兌換過了，請明天再來吧。
	else  -- 當天沒領過 (第1天)
	
		if Count1 > 0 or Count2 > 0 or Count3 > 0 or Count4 > 0 or Count5 > 0 then  --  如果任一種煙火一種以上
			CloseSpeak(OID)

			if Count1 > 0 then
				DelBodyItem(OID, 203292, 1  )
			elseif Count2 > 0 then
				DelBodyItem(OID, 203293, 1  )
			elseif Count3 > 0 then
				DelBodyItem(OID, 203294, 1  )
			elseif Count4 > 0 then
				DelBodyItem(OID, 203295, 1  )
			elseif Count5 > 0 then
				DelBodyItem(OID, 203291, 1  )
			end

		--	Say(OID, "Bufflv = "..bufflv )
			if CheckBuff(OID, 621830 ) == false then   -- 沒buff
				Addbuff(OID , buffid , 0 , 86400 )  -- 給24HR  歡慶獎勵兌換憑證
				GiveBodyItem(OID, 725654 , 1 )   -- 煙火包
			else  -- 有buff
				local R = Rand(100)+1
				if bufflv == 5 then     --  (第7天)
					CancelBuff(OID, buffid)

					local itemtable = {203487 , 725025 }
					local itemcount = { 7 , 1  }
					if  R >= 31 then 
						GiveBodyItem(OID, itemtable[1] , itemcount[1] )  
					else
						GiveBodyItem(OID, itemtable[2] , itemcount[2] ) 
					end	
				elseif bufflv == 4 then   --  (第6天)
					Addbuff(OID , buffid , 0 , 86400 )  -- 給24HR  歡慶獎勵兌換憑證

					local itemtable = {203487 , 725649  }
					local itemcount = { 6 , 1  }
					if  R >= 41 then 
						GiveBodyItem(OID, itemtable[1] , itemcount[1] )  
					else
						GiveBodyItem(OID, itemtable[2] , itemcount[2] ) 
					end
				elseif bufflv == 3 then   --  (第5天)
					Addbuff(OID , buffid , 0 , 86400 )  -- 給24HR  歡慶獎勵兌換憑證

					local itemtable = {203487 , 725449 }
					local itemcount = { 5, 1 }
					if  R >= 61 then 
						GiveBodyItem(OID, itemtable[1] , itemcount[1] )  
					else
						GiveBodyItem(OID, itemtable[2] , itemcount[2] ) 
					end
				elseif bufflv == 2 then   --  (第4天)
					Addbuff(OID , buffid , 0 , 86400 )  -- 給24HR  歡慶獎勵兌換憑證

					local itemtable = {  725649 , 720289 }
					local itemcount = { 1 , 1 }
					if  R >= 11 then 
						GiveBodyItem(OID, itemtable[1] , itemcount[1] )  
					else
						GiveBodyItem(OID, itemtable[2] , itemcount[2] ) 
					end
				elseif bufflv == 1 then   --  (第3天)
					Addbuff(OID , buffid , 0 , 86400 )  -- 給24HR  歡慶獎勵兌換憑證

					local itemtable = { 203487 , 725654 }
					local itemcount = { 3  , 1 }
					if  R >= 71 then 
						GiveBodyItem(OID, itemtable[1] , itemcount[1] )  
					else
						GiveBodyItem(OID, itemtable[2] , itemcount[2] ) 
					end
				elseif bufflv == 0 then   --  (第2天)
					Addbuff(OID , buffid , 0 , 86400 )  -- 給24HR  歡慶獎勵兌換憑證

					local itemtable = { 725449 , 724059 }
					local itemcount = { 1  , 1 }
					if  R >= 61 then 
						GiveBodyItem(OID, itemtable[1] , itemcount[1] )  
					else
						GiveBodyItem(OID, itemtable[2] , itemcount[2] ) 
					end
				end
			end

			Setflag(OID, 544302 , 1)
		else
			SetSpeakDetail( OID , "[SC_112502_NO]" )   -- 你持有的物品數量不足喔！
		end
	end


end

-- 關於節慶煙火
function lua_mika_fes_magicnpc_03()
	local OID = OwnerID() -- player
	SetSpeakDetail( OID , "[SC_MAGICBOX_EVENT_05]" )   -- 對話
end


-- 測試用指令

function lua_mika_fes_magicnpc_test2()
	local OID = OwnerID() -- player

	local Count1 = CountBodyItem(OID, 203292 )  --璀璨星空
	local Count2 = CountBodyItem(OID, 203293 )  --熱情仲夏
	local Count3 = CountBodyItem(OID, 203294 )  --金碧輝煌
	local Count4 = CountBodyItem(OID, 203295 )  --星雲瀰漫
	local Count5 = CountBodyItem(OID, 203291 )  --心心相印

	Say(OID, "count1 = "..Count1 ) 
	Say(OID, "count2 = "..Count2 ) 
	Say(OID, "count3 = "..Count3 ) 
	Say(OID, "count4 = "..Count4 ) 
	Say(OID, "count5 = "..Count5 ) 
end


function lua_mika_fes_magicnpc_test(day)
	local OID = OwnerID() -- player
	local R = Rand(100)+1

	if day == 1 then
		GiveBodyItem(OID, 725654 , 1 )   
	elseif day == 2 then
		local itemtable = { 725449 , 724059 }
		local itemcount = { 1  , 1 }
		if  R >= 61 then 
			GiveBodyItem(OID, itemtable[1] , itemcount[1] )  
		else
			GiveBodyItem(OID, itemtable[2] , itemcount[2] ) 
		end
	elseif day == 3 then
		local itemtable = { 203487 , 725654 }
		local itemcount = { 3  , 1 }
		if  R >= 71 then 
			GiveBodyItem(OID, itemtable[1] , itemcount[1] )  
		else
			GiveBodyItem(OID, itemtable[2] , itemcount[2] ) 
		end
	elseif day == 4 then
		local itemtable = {  725649 , 720289 }
		local itemcount = { 1 , 1 }
		if  R >= 11 then 
			GiveBodyItem(OID, itemtable[1] , itemcount[1] )  
		else
			GiveBodyItem(OID, itemtable[2] , itemcount[2] ) 
		end
	elseif day == 5 then
		local itemtable = {203487 , 725449 }
		local itemcount = { 5, 1 }
		if  R >= 61 then 
			GiveBodyItem(OID, itemtable[1] , itemcount[1] )  
		else
			GiveBodyItem(OID, itemtable[2] , itemcount[2] ) 
		end
	elseif day == 6 then
		local itemtable = {203487 , 725649  }
		local itemcount = { 6 , 1  }
		if  R >= 41 then 
			GiveBodyItem(OID, itemtable[1] , itemcount[1] )  
		else
			GiveBodyItem(OID, itemtable[2] , itemcount[2] ) 
		end
	elseif day == 7 then
		local itemtable = {203487 , 725025 }
		local itemcount = { 7 , 1  }
		if  R >= 31 then 
			GiveBodyItem(OID, itemtable[1] , itemcount[1] )  
		else
			GiveBodyItem(OID, itemtable[2] , itemcount[2] ) 
		end	
	end

end