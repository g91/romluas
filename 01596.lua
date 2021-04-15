-- 701596 

function lua_mika_bossft_delkey01()
	local keylist =  {
		546942, 546943, 546944, 546945, 546946, 546947, 546948, 546949, 546950, 546951, 
		546952, 546953, 546954, 546955, 546956, 546957, 546958, 546959, 546960, 546961, 
		546962, 546963, 546964, 546965, 546966, 546967, 546968, 546969, 546970, 546971, 
		546972, 546973, 546974, 546975, 546976, 546977 
			}
	for i = 1, table.getn(keylist) do
		Setflag(OwnerID(),keylist[i], 0  )
	end
	say(OwnerID(), "del all guildbox key.")
end

function lua_mika_bossft_delkey02()
	local keylist =  {
		546932, 546933, 546934, 546935, 546936,
		546937, 546938, 546939, 546940, 546941
			}
	
	for i = 1, table.getn(keylist) do
		Setflag(OwnerID(),keylist[i], 0  )
	end
	say(OwnerID(), "del all guild boss ft key.")

end

-- 5.0.4 小屋BOSS家具配方KEYITEM
function lua_mika_bossft_delkey03()
	local keylist =  {
		547028, 547029, 547030, 547031, 547032, 
		547033, 547034, 547035, 547036, 547037, 
		547038, 547039, 547040
			}
	
	for i = 1, table.getn(keylist) do
		Setflag(OwnerID(),keylist[i], 0  )
	end
	say(OwnerID(), "delete all house boss ft key ok ")
end

-- 獲得5.0.4推出家具製造所需所有材料各50個, 及關鍵材料各5個
function lua_mika_bossft_GetMaterial_01()
	local item =  {
		201782, 208243, 208237, 240317, 208249, 
		201822, 201744, 201745, 201821, 240332, 
		240326, 201781, 207401, 208260, 208257, 
		240415, 208263, 207407, 205796, 207398, 
		205802, 240424, 241471, 202580, 202616, 
		202615, 202581, 205817, 241747, 241748, 
		241818, 241819, 241752, 241820, 241821, 
		241822, 241823, 241824, 241825, 241826, 
		241827
			}

	for i = 1, table.getn(item) do
		GiveBodyItem(OwnerID(),item[i], 50  )
	end
	say(OwnerID(), "get all bossft produce Material .")

end

--  獲得所有製造技能80等資格
function lua_mika_lifeskill_keyget()
	local keylist =  {
		540268, 540343, 540352, 540361,
		540334, 540344, 540353, 540362,
		540365, 540345, 540354, 540363,
		540366, 540346, 540355, 540364,
		540337, 540347, 540356, 540365,
		540338, 540348, 540357, 540366
			}
	
	for i = 1, table.getn(keylist) do
		Setflag(OwnerID(),keylist[i], 1  )
	end
	say(OwnerID(), "get all lifeskill key .")
end

