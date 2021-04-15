
--直接看基本法術--

function sasa_addbufftest(BuffID)
	AddBuff( OwnerID() , BuffID , 0 , -1 )
end

--測試用--掛貓滿血--

function sasa_CatFullBlood()
	SysCastSpellLv( OwnerID() , OwnerID() , 491064 , 0 )--貓咪上身
	sleep(1)
	SysCastSpellLv( OwnerID() , OwnerID() , 492744 , 0 )--滿血術
end

--測試用--無限復活回血魔與熊--

function sasa_ReturnTheBear()
	SysCastSpellLv( OwnerID() , OwnerID() , 497461 , 0 )--無限復活術
	sleep(1)
	SysCastSpellLv( OwnerID() , OwnerID() , 498390 , 0 )--HP與MP100%奉還
	sleep(1)
	SysCastSpellLv( OwnerID() , OwnerID() , 498392 , 0 )--回精力專注戰意
	sleep(1)
	addbuff( OwnerID() , 624769 , 0 , -1 )--熊熊變身
end

--測試用--寵物關係BUFF--

function sasa_RelationshipBuff()
	GiveBodyItem( OwnerID() , 203576 , 100 )--大師黃金修理鎚
	sleep(1)
	SysCastSpellLv( OwnerID() , OwnerID() , 499873 , 0 )--犀牛戰爭儀式愛戀
	sleep(1)
	SysCastSpellLv( OwnerID() , OwnerID() , 498388 , 0 )--英雄獨角獸草原
	sleep(1)
	SysCastSpellLv( OwnerID() , OwnerID() , 496730 , 0 )--手足情深
	sleep(1)
	SysCastSpellLv( OwnerID() , OwnerID() , 496731 , 0 )--兩情相悅
	sleep(1)
	SysCastSpellLv( OwnerID() , OwnerID() , 496732 , 0 )--情定終身
	sleep(1)
	star_PetBuff()
end

function star_PetBuff()
	local buff  = 503463
	for i =1 , 8 do
		addbuff( OwnerID() , buff+i-1 , 4 , -1 )
		sleep(1)
	end
end
