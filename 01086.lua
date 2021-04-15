function NewYearPop2009() ---原型6- 2次
	sleep(10)
		local Owner = Role:new( OwnerID() )
		local BaseX = Owner:X()
 		local BaseY = Owner:Y()
 		local BaseZ = Owner:Z()
		local BaseDir =Owner:Dir()
		local Mos = 111821
		local pop1 = 492188
		local pop2 = 492189
		local aaa = 2
		local bbb = 2
		local mmck0 = CreateObj( Mos,BaseX+(40*aaa), BaseY-10, BaseZ+(70*bbb), BaseDir , 1 )
		local mmck1 = CreateObj( Mos,BaseX+(90*aaa), BaseY, BaseZ, BaseDir-30 , 1 )
		local mmck2 = CreateObj( Mos,BaseX+(40*aaa), BaseY+30, BaseZ-(70*bbb), BaseDir-60 , 1 )
		local mmck3 = CreateObj( Mos,BaseX-(40*aaa), BaseY, BaseZ-(70*bbb), BaseDir-90 , 1 )
		local mmck4 = CreateObj( Mos,BaseX-(90*aaa), BaseY+20, BaseZ, BaseDir-120 , 1 )
		local mmck5 = CreateObj( Mos,BaseX-(40*aaa), BaseY+10, BaseZ+(70*bbb), BaseDir-150 , 1 )
		AddToPartition(mmck0, 0 )
		AddToPartition(mmck1, 0 )
		AddToPartition(mmck2, 0 )
		AddToPartition(mmck3, 0 )
		AddToPartition(mmck4, 0 )
		AddToPartition(mmck5, 0 )



		while 1 do
			sleep( 20 )
			if GetSystime(1) == 23 and  GetSystime(2) == 59 and  GetSystime(3) == 11 and  GetSystime(4) == 31   then  
			--if GetSystime(1) >= 0   and GetSystime(2) <= 30  then  --------------testline
				sleep(580)
				for i = 1 , 10 do --約施放5分鐘
					CastSpell(mmck0, mmck0 ,pop2 )
					sleep( 20 )
					CastSpell(mmck1, mmck1,pop2 )
					sleep( 20 )
					CastSpell(mmck2, mmck2,pop2 )
					sleep( 20 )
					CastSpell(mmck3, mmck3,pop2)
					sleep( 20 )
					CastSpell(mmck4, mmck4,pop2 )
					sleep( 20 )
					CastSpell(mmck5, mmck5,pop2)
					sleep( 130 )
					CastSpell(mmck0, mmck0 ,pop1 )
					sleep( 50 )
					CastSpell(mmck1, mmck1,pop1 )
					sleep( 30 )
					CastSpell(mmck2, mmck2,pop1 )
					sleep( 15 )
					CastSpell(mmck3, mmck3,pop1)
					sleep( 10 )
					CastSpell(mmck4, mmck4,pop1 )
					sleep( 15 )
					CastSpell(mmck5, mmck5,pop1)
					sleep( 5 )
				end
			end
			sleep( 100 )

	end
end