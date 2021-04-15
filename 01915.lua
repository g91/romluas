-----如果要作回舊版本請不要整個Script全複製，只複製你要的那段就好-----
------------------------------------------------  韓國  ------------------------------------------------
function LuaI_207754(Option )
	local NeedSpace = 4
	local NeedSpaceStatus  = Check_Bag_Space( OwnerID() , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		end
	elseif ( Option == "USE" ) then
		local class = ReadRoleValue ( OwnerID(), EM_RoleValue_VOC)
		if class == 1 or class == 7 then
			GiveBodyItem(OwnerID(),212749,1)
		elseif class == 2 then
			GiveBodyItem(OwnerID(),212748,1)
		elseif class == 3 then
			GiveBodyItem(OwnerID(),212746,1)
		elseif class == 4 or class == 5 or class == 8 then
			GiveBodyItem(OwnerID(),212747,1)
		elseif class == 6 then
			GiveBodyItem(OwnerID(),212750,1)			
		end
		GiveBodyItem(OwnerID(),203047,3)
	end
end

Function LuaI_208793( Option ) --無暇熔解石(1)包
	local Num = 1
	if Option == "CHECK" then
		if Check_Bag_Space( OwnerID() , Num ) == false then
		return false
		end
	elseif Option == "USE" then
		GiveBodyItem( OwnerID(), 208302, 1)
	end
end

function LuaI_208541() --韓國CBT禮包之一

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 202902 , 30 , 208783 , 1 , 208786 , 1 , 205527 , 1 , 205541 , 1 , 208779 , 1} }	
	-- 
	return BaseTressureProc(   itemset , 6 )
end

function LuaI_208542() --韓國CBT禮包之二

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 202902 , 30 , 208783 , 1 , 208786 , 1 , 205525 , 1 , 205526 , 1 , 205527 , 1 , 205541 , 1 , 208779 , 1} }	
	-- 
	return BaseTressureProc(   itemset , 8 )
end

function LuaI_208794() --終極傳送禮包

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 202903 , 99} }	
	-- 
	return BaseTressureProc(   itemset , 1 )
end

function LuaI_208962() --韓國Silver Pacakge

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 209491 , 1 , 208786 , 1 , 205526 , 1 , 208783 , 1 , 202902 , 30 , 202903 , 99 , 201445 , 999} }	
--	local itemset = { 100 , "" , { 201445 , 999 , 202902 , 30 , 202903 , 99 , 208786 , 1 , 205526 , 1 , 208783 , 203302 , 1 } }

	return BaseTressureProc(   itemset , 7 )
end

function LuaI_208963() --韓國Gold Package

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 209491 , 1 , 208777 , 1 , 208783 , 1 , 208786 , 1 , 205526 , 1 , 205527 , 1 , 208767 , 1 , 208772 , 1 , 202902 , 30 , 208794 , 2 , 201445 , 999} }	

--	local itemset = { 100 , "" , { 201445 , 999 , 202902 , 30 , 208783 , 1 , 208786 , 1 , 205526 , 1 , 205527 , 1 , 202903 , 99 , 202903 , 99 , 208767 , 1 , 208772 , 1 , 208777 , 1 , 203302 , 1 }}

 	return BaseTressureProc(   itemset , 11 )
--	return BaseTressureProc(   itemset , 12 )
end

function LuaI_208964() --韓國Pletinum  Package

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 209491 , 1 , 208777 , 1 , 202506 , 16 , 208783 , 1 , 208786 , 1 , 205525 , 1 , 205526 , 1 , 205527 , 1 , 205541 , 1 , 208779 , 1 , 208767 , 1 , 208772 , 1 , 202902 , 30 , 208794 , 3 , 201445 , 999} }	
	-- 
--	local itemset = { 100 , "" , { 201445 , 999 , 202902 , 30 , 208783 , 1 , 208786 , 1 , 205525 , 1 , 205526 , 1 , 205527 , 1 , 205541 , 1 , 208779 , 1 , 208767 , 1 , 202903 , 99 , 202903 , 99 , 202903 , 99 , 208772 , 1 , 202506 , 16 , 208777 , 1 , 203302 , 1 } }

	return BaseTressureProc(   itemset , 15 )
--	return BaseTressureProc(   itemset , 17 )
end

function LuaI_209519() --韓國 PC Cafe Coupon Package 2011/02/10

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 207809 , 2 , 207813 , 8 , 207817 , 4 } }	

	return BaseTressureProc(   itemset , 3 )
end

function LuaI_201349()	-- 韓國　無暇傳說禮包 2011/03/15

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 201350 , 50 } }
	-- 完美無瑕禮盒50個(此物品可使用50次)
	return BaseTressureProc( itemset , 1 )
end

function LuaI_201350()	-- 韓國　完美無瑕禮盒 2011/03/15

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 201366 , 1 } }
	-- 無瑕熔解石1個
	return BaseTressureProc( itemset , 1 )
end

function LuaI_201520(Option) --韓國 入門者禮包
	local PlayerID = OwnerID()
	local ItemTable = {203323 , 205548 , 208788 , 208785 , 202903 , 201445}
	local ItemGiveTime = {1,1,1,1,50,500}
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , 6  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) or CheckFlag(PlayerID,540028) == TRUE then	--判斷已經領取過也不讓他開
			return false
		end
	elseif ( Option == "USE" ) then
		for i=1,6 do
			GiveBodyItem( PlayerID , ItemTable[i] , ItemGiveTime[i] )	
		end
		SetFlag(PlayerID, 540028, 1)
	end
end
------------------------------------------------  德國  ------------------------------------------------
function LuaI_208179() --悠閒生活禮包 2010/08/11 

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 201141 , 1 , 201139 , 1 , 205743 , 1 } }	-- 菲尼克斯的救贖、大天使的嘆息、永久邱比特寶寶寵物蛋 

	return BaseTressureProc(   itemset , 3 )
end

function LuaI_208180() --Chapter III US Hero Package 2010/08/16

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 208181 , 1 , 206233 , 1 , 206477 , 1 , 208182 , 1 } }	-- 精選典藏禮包、Dungeon Survivor Bag、冒險者武器強化禮包、流影遊俠套裝禮包

	return BaseTressureProc(   itemset , 4 )
end

function LuaI_208181() --精選典藏禮包 2010/08/16

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 206936 , 1 , 205675 , 1 , 207421 , 1 , 207075 , 1 } }	-- 永久暴風鷹馬獸坐騎、永久白羊守衛寶寶寵物蛋、王者公會成員、100晶鑽石

	return BaseTressureProc(   itemset , 4 )
end

function LuaI_208182() --流影遊俠套裝禮包 2010/08/16 

	local RoleName = GetName( OwnerID() ) 
	local Sex = ReadRoleValue( OwnerID() , EM_RoleValue_SEX )
	local itemSet = { }

	if Sex == 0 then
		itemset = { 100 , "" , { 226081 , 1 , 226082 , 1 , 226083 , 1 , 226084 , 1 , 226085 , 1 , 226086 , 1 } }
		-- 流影遊俠套裝(男)、流影遊俠裝手套(男)、流影遊俠裝肩甲(男)、流影遊俠裝披風(男)、流影遊俠裝長靴(男)、流影遊俠裝皮帽(男)
	else
		itemset = { 100 , "" , { 226137 , 1 , 226138 , 1 , 226139 , 1 , 226140 , 1 , 226141 , 1 , 226142 , 1 } }
		-- 流影遊俠套裝(女)、流影遊俠裝手套(女)、流影遊俠裝肩甲(女)、流影遊俠裝披風(女)、流影遊俠裝長靴(女)、流影遊俠裝皮帽(女)
	end
	return BaseTressureProc(   itemset , 6 )
end

function LuaI_208202() --Tukan-Package2010/08/30

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 207104 , 1 , 206221 , 5 , 206224 , 5 , 201619 , 5, 201610, 1, 201134, 1, 202800, 1 } }	
	-- 永久熱帶巨嘴鳥寵物蛋、肉傀儡變身藥水、禁錮者之影變身藥水 、幸運藥劑 、技能藥劑 、經驗藥劑、自定稱號筆記 
	return BaseTressureProc(   itemset , 7 )
end

function LuaI_208192() --Pet-Upgrade Package 2010/09/10

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 204460 , 1 , 204513 , 1 , 207582 , 1 , 204511 , 1 , 207575 , 1 , 207576 , 1 } }	
	-- 黑帆藏寶箱1個、培育欄開通券1個、帕奇香水(1天)1個、寵愛的一餐1個、強效寵物成長劑1個、精進魔藥1個。
	return BaseTressureProc(   itemset , 6 )
end

function LuaI_208193() --Wings of glory Package 2010/09/10

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 206289 , 1 , 224986 , 1 , 207495 , 1 , 207489 , 1 , 207490 , 1 , 202506 , 1 , 201610 , 1 , 201134 , 1 } }	
	-- 永久黑天馬坐騎1個、紫紋羽翼1個、基礎裝飾品打孔器1個、裝飾品精鍊石1個、進階裝飾品精鍊石1個、黃金修理鎚1個、技能藥劑1個、經驗藥劑1個。
	return BaseTressureProc(   itemset , 8 )
end

function LuaI_208194() --Ice Beast Package 2010/09/10

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 203289 , 1 , 203592 , 1 , 205525 , 1 , 201141 , 1 , 201610 , 1 , 201134 , 1 , 201445 , 5 } }	
	-- 永久綠龍牙冰獸坐騎1個、30天小型駕馭藥劑1個、30天背包空間卷 - III1個、菲尼克斯的救贖1個、技能藥劑1個、經驗藥劑1個、世界頻道喊話儀5個。
	return BaseTressureProc(   itemset , 7 )
end

function LuaI_208195() --Home Sweet Home Package 2010/09/10

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 206130 , 1 , 201292 , 1 , 202322 , 1 , 201381 , 1 , 201610 , 1 , 201134 , 1 , 206221 , 5 } }	
	-- 家庭式雙層木屋契約1個、盾形武器架1個、高效幸運藥劑1個、褐木寶箱1個、技能藥劑1個、經驗藥劑1個、肉傀儡變身藥水5個。
	return BaseTressureProc(   itemset , 7 )
end

function LuaI_208315() --Special Online Package 2010/09/23

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 206944 , 1 , 207101 , 1 , 202322 , 1 , 203591 , 1 , 222926 , 1 , 222925 , 1 , 201610 , 1 , 201134 , 1 } }	
	-- 7天符能輪盤坐騎、永久金獅絨寶寶寵物蛋、高效幸運藥劑、7天小型駕馭藥劑、初級技能護符、初級經驗護符、技能藥劑、經驗藥劑。
	return BaseTressureProc(   itemset , 8 )
end

function LuaI_208322() -- Chapter III Package 2010/09/29

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 207088 , 1 , 203057 , 1 , 206209 , 1 , 222928 , 1 , 222927 , 1 , 202506 , 1 , 201087 , 1 , 201139 , 1 , 205547 , 1 , 201610 , 1 , 201134 , 1 , 201459 , 1 } }	
	-- 強力波卡寵物箱1個、完美聖光首飾石1個、7天狂奔猛瑪坐騎包1個、高級技能護符1個、高級經驗護符1個、
	-- 黃金修理鎚1個、基礎武器打孔器1個、大天使的嘆息1個、7天背包空間卷 - III1個、技能藥劑1個、經驗藥劑1個、聖光裝備石1個。
	return BaseTressureProc(   itemset , 12 )
end

function LuaI_207585()	-- 極光寶貝蛋禮包 2010/10/07

	local RoleName = GetName( OwnerID() )
	local Job = ReadRoleValue( OwnerID() , EM_RoleValue_VOC )
	local DD = { 0 , 1 , 2 , 3 , 6 }--GM、戰士、遊俠、影行者、騎士
	local MD= { 4 , 5 , 7 , 8 }-- 法師、祭司、森林牧者、自然神官
	local GM = 0
	local Step = 0

	for i = 1 , table.getn(DD) , 1 do
		if Job == DD[i] then
			local itemset = { 100 , "" , { 207583 , 1 } }
			Step = 1
			return BaseTressureProc( itemset , 1 )
		end
		if Step == 1 then
			break
		end
	end
	for i = 1 , table.getn(MD) , 1 do
		if Job == MD[i] then
			local itemset = { 100 , "" , { 207584 , 1 } }
			Step = 1
			return BaseTressureProc( itemset , 1 )
		end
		if Step == 1 then
			break
		end
	end
end

--DE 特殊精煉禮包 2010.11.16
Function LuaI_207962(Option)
	local PlayerID = OwnerID()
	local PackageID = 207962
	local NeedSpace = 8
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , 201095 , 5 )
		GiveBodyItem( PlayerID , 201097 , 5 )
		GiveBodyItem( PlayerID , 203040 , 5 )
		GiveBodyItem( PlayerID , 201087 , 1 )
		GiveBodyItem( PlayerID , 201237 , 1 )
		GiveBodyItem( PlayerID , 203053 , 1 )
		GiveBodyItem( PlayerID , 202506 , 5 )
		GiveBodyItem( PlayerID , 206360 , 1 )
	end
end

function LuaI_208527() --Kalin's Phantom Set 2010/11/25

	local RoleName = GetName( OwnerID() ) 
	local itemSet = { }

	itemset = { 100 , "" , { 223621 , 1 , 223622 , 1 , 223623 , 1 , 223624 , 1 , 223625 , 1 } }
	-- 黃金勇者上衣、黃金勇者手套、黃金勇者長靴、黃金勇者護腿、黃金勇者頭環
	
	return BaseTressureProc(   itemset , 5 )
end

function LuaI_208528() --Muse Set 2010/11/25

	local RoleName = GetName( OwnerID() ) 
	local itemSet = { }

	itemset = { 100 , "" , { 223626 , 1 , 223627 , 1 , 223628 , 1 , 223629 , 1 , 223630 , 1 } }
	-- 翠綠勇者上衣、翠綠勇者手套、翠綠勇者長靴、翠綠勇者護腿、翠綠勇者頭環
	
	return BaseTressureProc(   itemset , 5 )
end

function LuaI_208529() --Muse Set 2010/11/25

	local RoleName = GetName( OwnerID() ) 
	local itemSet = { }

	itemset = { 100 , "" , { 223631 , 1 , 223632 , 1 , 223633 , 1 , 223634 , 1 , 223646 , 1 } }
	-- 赤紅勇者上衣、赤紅勇者手套、赤紅勇者長靴、赤紅勇者護腿、赤紅勇者頭環
	
	return BaseTressureProc(   itemset , 5 )
end

function LuaI_208538() -- 競爭者禮包 2010/12/06

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 207761 , 10 , 207762 , 10 , 207763 , 10 , 201088 , 1 , 201238 , 1 , 203054 , 1 , 202506 , 10 } }
	-- 呢喃武器石*10、呢喃裝備石*10、呢喃首飾石*10、進階武器打孔器*1、進階防具打孔器*1、進階首飾打孔器*1、黃金修理鎚*10。
	return BaseTressureProc(   itemset , 7 )
end

function LuaI_208539() -- 精選高級禮包 2010/12/06

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 202822 , 5 , 202823 , 5 , 207761 , 5 , 207762 , 5 , 207763 , 5 , 202506 , 5 } }
	-- 裝備封印器*5、裝備解封器*5、呢喃武器石*5、呢喃裝備石*5、呢喃首飾石*5、黃金修理鎚*5。
	return BaseTressureProc(   itemset , 6 )
end

function LuaI_208923() -- 伊斯般那旅行包 2011/01/06	
	
	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 208691 , 1 , 203591 , 1 , 202903 , 5 , 202435 , 5 , 222925 , 1 , 222926 , 1 } }
	-- 7天血痕魔駒坐騎*1、7天小型駕馭藥劑*1、傳送者符文*5、家的羈絆*5、初級經驗護符*1、初級技能護符*1
	return BaseTressureProc(   itemset , 6 )
end	

function LuaI_209520() -- 高級呢喃禮包	
	
	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 207761 , 10 , 207762 , 10 , 207763 , 10 , 201088 , 1 , 201238 , 1 , 203054 , 1 , 202506 , 10} }
	--
	return BaseTressureProc(   itemset , 7 )
end

function LuaI_209521() -- 呢喃PVP禮包	
	
	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 202822 , 5 , 202823 , 5 , 207761 , 5 , 207762 , 5 , 207763 , 5 , 202506 , 5} }
	--
	return BaseTressureProc(   itemset , 6 )
end

function LuaI_209522() -- 德國 精選旅行禮包 2011/02/11
	
	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 206936 , 1 , 208530 , 1 , 207421 , 1 , 207075 , 1 } }
	-- 永久暴風鷹馬獸坐騎、忠誠的白羊守衛寶寶寵物蛋、王者公會成員、100晶鑽石
	return BaseTressureProc(   itemset , 4 )
end

function LuaI_209523() -- 德國 豪華傢俱禮包 2011/02/11

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 204682 , 1 , 201472 , 1 , 201510 , 1 , 201345 , 1 , 201410 , 1 , 204701 , 1 , 201382 , 1 , 205585 , 1 } }
	-- 華麗地毯沙發、雕花高木櫃、寶藍悠閒椅、凱薩貴族床、貴族雕花壁爐、時尚藍格織毯、獅頭鎖寶箱、大坪數豪華別墅契約
	return BaseTressureProc(   itemset , 8 )
end

function LuaI_209524() --德國 獨家典藏禮包 2011/02/11

	local RoleName = GetName( OwnerID() ) 
	local Sex = ReadRoleValue( OwnerID() , EM_RoleValue_SEX )
	local itemset = { }
	if Sex == 0 then
		itemset = { 100 , "" , { 209522 , 1 , 206233 , 1 , 206477 ,  1 , 208182 , 1 , 202027 , 1 , 209523 , 1 } }
		-- 精選旅行禮包、Dungeon Survivor Bag、冒險者武器強化禮包、流影遊俠套裝禮包、紫影火燄套裝包、豪華傢俱禮包
	elseif Sex == 1 then
		itemset = { 100 , "" , { 209522 , 1 , 206233 , 1 , 206477 ,  1 , 208182 , 1 , 202023 , 1 , 209523 , 1 } }
		-- 精選旅行禮包、Dungeon Survivor Bag、冒險者武器強化禮包、流影遊俠套裝禮包、紫色魔幻套裝包、豪華傢俱禮包
	end
	return BaseTressureProc(   itemset , 6 )
end

function LuaI_209463() --賽西蒙德套裝禮包 2011/05/11

	local Sex = ReadRoleValue( OwnerID() , EM_RoleValue_SEX )
	local itemSet = { }

	if Sex == 0 then  --男
		itemset = { 100 , "" , { 228694 , 1 , 228693 , 1 , 228697 , 1  } }
	else -- 女
		itemset = { 100 , "" , { 228696 , 1 , 228695 , 1 , 228697 , 1  } }
	end
	return BaseTressureProc(   itemset , 3 )
end

function LuaI_240595() -- 德國 舒適家居禮包 2011/06/29

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 206129 , 1 , 201601 , 1 , 204763 , 1 , 201504 , 1 , 201512 , 1 , 201410 , 1 } }
	--豪華二層木屋附地下室契約、華美收納椅、黃晶雕飾寶盒、點心邊桌、古典雕花櫃、貴族雕花壁爐
	return BaseTressureProc(   itemset , 6 )
end

function LuaI_240922() -- 德國 Skeletal Siren Costume Bundle

	local Sex = ReadRoleValue( OwnerID() , EM_RoleValue_SEX )
	local itemSet = { }

	if Sex == 0 then  --男
		itemset = { 100 , "" , { 227540, 1, --skeletal siren gloves
				         227541, 1, -- Skeletal siren vest
				         227542 , 1 , -- Skeletal siren cape
				         227543 , 1 , -- skeletal siren leggings
				         227544, 1, -- skeletal siren headdress
				         227545, 1  } } -- skeletal siren magic boots
	else -- 女
	
	                 itemset = { 100 , "" , { 227552, 1, --skeletal siren gloves
				         227553, 1, -- Skeletal siren vest
				         227554 , 1 , -- Skeletal siren cape
				         227555 , 1 , -- skeletal siren leggings
				         227556, 1, -- skeletal siren headdress
				         228674, 1  } } -- skeletal siren magic boots
	end
	return BaseTressureProc(   itemset , 6 )
end

function LuaI_241003() -- 德國Grinning Rogue Costume Bundle

	local Sex = ReadRoleValue( OwnerID() , EM_RoleValue_SEX )
	local itemSet = { }

	if Sex == 0 then  --男
		itemset = { 100 , "" , { 228681, 1, --Grinning Rogue Coat
				        228682, 1, -- Grinning Rogue Gloves
				         228683 , 1 , -- Grinning Rogue Shoulder Armor
				          228684, 1, -- Grinning Rogue Boots
				          228685, 1, -- Grinning Rogue Trousers
				         228686, 1  } } -- Grinning Rogue Helmet
	else -- 女
	
		itemset = { 100 , "" , { 228687, 1, --Grinning Rogue Coat
				        228688, 1, -- Grinning Rogue Gloves
				         228689 , 1 , -- Grinning Rogue Shoulder Armor
				          228690, 1, -- Grinning Rogue Boots
				          228691, 1, -- Grinning Rogue Trousers
				         228692, 1  } } -- Grinning Rogue Helmet
	end
	return BaseTressureProc(   itemset , 6 )
end

function LuaI_241002()  --德國 Advanced Adventurer Package

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 202506 , 1 , --Golden Repair  Hammer 
				   201238 , 1 , -- Advanced Armor Driller
				   207762 , 10 ,-- Moon Jewel- Revelation 
				   207765 , 1 ,--Advanced Moon Jewel Revelation 
			                202322 , 1 , -- Potent luck potion
				201293 , 1 } }-- Cross weapon rack

	return BaseTressureProc(   itemset , 15 )
end

function LuaI_240813() --澳洲 獨家精選禮包 2011/09/13

	local RoleName = GetName( OwnerID() ) 
	local Sex = ReadRoleValue( OwnerID() , EM_RoleValue_SEX )
	local itemset = { }
	if Sex == 0 then --男
		itemset = { 100 , "" , { 207075 , 1 , 206177 , 1 , 240088 ,  1 , 240814 , 1 , 206233 , 1 , 206477 , 1 , 240187 , 1 , 240811 , 1 } }
		-- 100晶鑽石、永久鳴沙拉扣獸寵物蛋、永久烈燄萊特恩坐騎、偉大的冒險者、Dungeon Survivor Bag、冒險者武器強化禮包、攝魂小丑轉化魔藥、攝魂魔丑男裝禮包
	elseif Sex == 1 then --女
		itemset = { 100 , "" , { 207075 , 1 , 206177 , 1 , 240088 ,  1 , 240814 , 1 , 206233 , 1 , 206477 , 1 , 240187 , 1 , 240812 , 1 } }
		-- 100晶鑽石、永久鳴沙拉扣獸寵物蛋、永久烈燄萊特恩坐騎、偉大的冒險者、Dungeon Survivor Bag、冒險者武器強化禮包、攝魂小丑轉化魔藥、攝魂魔丑女裝禮包
	end
	return BaseTressureProc(   itemset , 8 )
end

function LuaI_240811() --攝魂魔丑男裝禮包 2011/09/13

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 227546 , 1 , 227547 , 1 , 227548 , 1 , 227549 , 1 , 227550 , 1 , 227551 , 1 } }
	--攝魂魔丑手套(男)、攝魂魔丑正裝(男)、攝魂魔丑護肩(男)、攝魂魔丑長褲(男)、攝魂魔丑面具(男)、攝魂魔丑長靴(男)
	return BaseTressureProc(   itemset , 6 )
end

function LuaI_240812() --攝魂魔丑女裝禮包 2011/09/13

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 228675 , 1 , 228676 , 1 , 228677 , 1 , 228678 , 1 , 228679 , 1 , 228680 , 1 } }
	--攝魂魔丑護手(女)、攝魂魔丑正裝(女)、攝魂魔丑護肩(女)、攝魂魔丑巫鞋(女)、攝魂魔丑短褲(女)、攝魂魔丑面具(女)
	return BaseTressureProc(   itemset , 6 )
end

function LuaI_209538()   --LOGO Package2011/12/09

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 226803, 1, 208703, 1,  207710, 1,   209527,  1,  206129,   1,  201134,  1,  201610,   1, 201237,  1,  202903,  2,  202435 ,2 , 222925, 1,  207762,   1, 206410 , 1 , 201087, 1 } }
	return BaseTressureProc(   itemset , 14 )

end


------------------------------------------------  泰國  ------------------------------------------------
function LuaI_208183() --完美體驗禮包 2010/08/19

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 201445 , 20 , 205975 , 1 , 205977 , 1 , 206358 , 1 , 205525 , 1 , 207743 , 1 , 203044 , 5 , 203045 , 10 } }
	-- 世界頻道喊話儀、30天進階經驗藥劑、30天進階技能藥劑、30天毀滅戰馬坐騎、30天背包空間券 - III、30天銀行空間券 - II、完美祝福武器石、完美祝福裝備石
	return BaseTressureProc(   itemset , 8 )
end
------------------------------------------------  菲律賓  ----------------------------------------------
function LuaI_208316() --初始者工具禮盒 2010/09/27

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 202452 , 1 , 203044 , 12 , 203045 , 50 , 203046 , 30 , 203574 , 6 , 201618 , 12 } }
	-- 30天黑色戰馬坐騎、完美祝福武器石12個、完美祝福裝備石50個、完美祝福首飾石30個、高級經驗藥劑6個、大師技能藥劑12個。
	return BaseTressureProc(   itemset , 6 )
end
------------------------------------------------中東----------------------------------------------------
function LuaI_208957() --中東包 2010/12/14

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 205857 , 1 , 222926 , 1 , 222925 , 1 , 201139 , 1 , 204682 , 1 , 202461 , 1 , 205525 , 1 , 206199 , 1 } }
	-- 靛青獅龍獸寵物蛋、初級技能護符1個、初級經驗護符1個、大天使的嘆息1個、華麗地毯沙發、30天赤焰戰虎坐騎、30天背包空間卷 - III、永久荒原猛瑪坐騎。
	return BaseTressureProc(   itemset , 8 )
end
------------------------------------------------  日本  ------------------------------------------------
--日本需求 1,000晶鑽禮盒  2010/12/07
function LuaI_208540() 
	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 202881 , 1 , 202928 , 1 } }
	-- 無瑕熔解石 . 魔幻寶盒能量10點
	return BaseTressureProc(   itemset , 2 )
end

function LuaI_209477()	-- 日本　秘境冒險禮包 2011/02/01

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 202846 , 1 , 202846 , 1 , 202846 , 1 } }
	-- 7階魔石3個
	return BaseTressureProc(   itemset , 3 )
end

function LuaI_209478()	-- 日本　星塵傳說禮包 2011/02/01

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 202847 , 1 , 202847 , 1 , 202847 , 1 } }
	-- 8階魔石3個
	return BaseTressureProc(   itemset , 3 )
end
-------2012 1月---日本
function LuaI_241147()          --日本 七階魔石禮包（六個）2012/01/12

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 202846 , 1 } }
	-- 7階魔石1個
	return BaseTressureProc(   itemset , 1 )
end

function LuaI_241148()          --日本 七階魔石禮包 （六個）（包裝）2012/01/12
	givebodyitem(OwnerID(), 241147, 6)
end


function LuaI_241149()          --日本 八階魔石禮包（六個）2012/01/12

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 202847 , 1 } }
	-- 八階魔石1個
	return BaseTressureProc(   itemset , 1 )
end

function LuaI_241150()          --日本 八階魔石禮包（六個）（包裝）2012/01/12
	givebodyitem(OwnerID(), 241149, 6)
end

function LuaI_241151()          --日本 九階魔石禮包（三個）2012/01/12
	
	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 202848 , 1 } }
	-- 九階魔石1個
	return BaseTressureProc(   itemset , 1 )

end

function LuaI_241152()          --日本 九階魔石禮包（三個）（包裝）2012/01/12
	givebodyitem(OwnerID(), 241151, 3)
end

function LuaI_241153()          --日本 九階魔石禮包（六個）2012/01/12
	
	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 202848 , 1 } }
	-- 九階魔石1個
	return BaseTressureProc(   itemset , 1 )
end

function LuaI_241154()          --日本 九階魔石禮包（六個）（包裝）2012/01/12
	givebodyitem(OwnerID(), 241153, 6)
end

function LuaI_241155()          --十階魔石禮包（三個）2012/01/12
	
	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 202849 , 1 } }
	-- 十階魔石1個
	return BaseTressureProc(   itemset , 1 )

end

function LuaI_241156()          --十階魔石禮包（三個）（包裝）2012/01/12
	givebodyitem(OwnerID(), 241155, 3)
end

function LuaI_241157()          --十階魔石禮包（六個）2012/01/12
	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 202849 , 1 } }
	-- 十階魔石1個
	return BaseTressureProc(   itemset , 1 )
end

function LuaI_241158()          --十階魔石禮包（六個）（包裝）2012/01/12
	givebodyitem(OwnerID(), 241157, 6)
end

function LuaI_241159()          --十一階魔石禮包（三個）2012/01/12
	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 202850 , 1 } }
	-- 十一階魔石1個
	return BaseTressureProc(   itemset , 1 )

end

function LuaI_241160()          --十一階魔石禮包（三個）（包裝）2012/01/12
	givebodyitem(OwnerID(), 241159, 3)
end

function LuaI_241161()          --十一階魔石禮包（六個）2012/01/12
	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 202850 , 1 } }
	-- 十一階魔石1個
	return BaseTressureProc(   itemset , 1 )
end

function LuaI_241162()          --十一階魔石禮包（六個）（包裝）2012/01/12
	givebodyitem(OwnerID(), 241161, 6)
end

function LuaI_241163()   --壓歲錢 2012/01/12
	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 201445 , 5 , 203503 , 40 , 203498 , 40 , 203878 , 2 } }
	--世界頻道喊話儀、必爾汀特級魔藥、必爾汀特級藥水 、極效清除負債券 
	return BaseTressureProc(   itemset , 4 )
end

function LuaI_241164()   --特大彩袋2012/01/12
	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 201445 , 10 , 203525 , 3 , 203493 , 30 , 203576, 1 } }
	--世界頻道喊話儀、神賜贖罪券 、必爾汀特級神奇水 、大師黃金修理鎚 
	return BaseTressureProc(   itemset , 4 )
end



function LuaI_241165()          --無瑕熔解石（10個）2012/01/12
	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 202881 , 1 } }
	-- 無瑕熔解石1個
	return BaseTressureProc(   itemset , 1 )
end

function LuaI_241166()          --無瑕熔解石（10個）（包裝）2012/01/12
	givebodyitem(OwnerID(), 241165, 10)
end

function LuaI_241167()          --無瑕熔解石（12個）2012/01/12
	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 202881 , 1 } }
	-- 無瑕熔解石1個
	return BaseTressureProc(   itemset , 1 )
end

function LuaI_241168()          --無瑕熔解石（12個）（包裝）2012/01/12
	givebodyitem(OwnerID(), 241167, 12)
end

function LuaI_241169()   --最高級道具禮包2012/01/12
	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 207761 , 5 , 207762 , 5 , 207763 , 5 , 201088, 1, 201238, 1, 203054, 1, 202506, 3 } }
	--呢喃武器石、呢喃裝備石 、呢喃首飾石 、進階武器打孔器 、 進階防具打孔器 、進階首飾打孔器  、黃金修理鎚
	return BaseTressureProc(   itemset , 7 )
end

function LuaI_241170()   --Welcome禮包2012/01/12
	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 205525 , 1 , 206623 ,1 , 201608 , 1 , 201617, 3, 206715, 1, 202322, 2 } }
	--30天背包空間卷 - III 、1天駕馭藥劑、持久經驗藥劑  、專家技能藥劑  、 7天幻影雪貂坐騎、高效幸運藥劑  
	return BaseTressureProc(   itemset , 6 )
end