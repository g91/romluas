function k_2009xmas_5()------------------------------掛這個
	BeginPlot( OwnerID() , "k_2009xmas_6" , 0 )
end


function k_2009xmas_6()		--放Monster 待側---第三次測應該好了

--	Say( OwnerID(), "begin" )
	local Owner = Role:new( OwnerID() )
	local BaseX = Owner:X()
 	local BaseY = Owner:Y();
 	local BaseZ = Owner:Z();
	local BaseDir =Owner:Dir();
	local RDir = rand(20)
	local mos = 100054	-------Main Monster

	local sting1 = CreateObj( mos,BaseX, BaseY, BaseZ+30+RDir, BaseDir+180 , 1)
	local sting2 = CreateObj( mos,BaseX-30, BaseY, BaseZ, BaseDir+180+RDir , 1 )
	local sting3 = CreateObj( mos,BaseX+30+RDir, BaseY, BaseZ, BaseDir+180 , 1 )
	local sting4 = CreateObj( mos,BaseX+50, BaseY, BaseZ, BaseDir+180+RDir , 1 )
	local sting5 = CreateObj( mos,BaseX-50, BaseY, BaseZ, BaseDir+180+RDir , 1 )
	local sting6 = CreateObj( mos,BaseX, BaseY, BaseZ+30+RDir, BaseDir+180 , 1)
	local sting7 = CreateObj( mos,BaseX, BaseY, BaseZ+30+RDir, BaseDir+180 , 1)
	local sting8 = CreateObj( mos,BaseX-30, BaseY, BaseZ, BaseDir+180+RDir , 1 )
	local sting9 = CreateObj( mos,BaseX+30+RDir, BaseY, BaseZ, BaseDir+180 , 1 )
	local sting10 = CreateObj( mos,BaseX+50, BaseY, BaseZ, BaseDir+180+RDir , 1 )
	local sting11= CreateObj( mos,BaseX-50, BaseY, BaseZ, BaseDir+180+RDir , 1 )
	local sting12= CreateObj( mos,BaseX, BaseY, BaseZ+30+RDir, BaseDir+180 , 1)

	while true do
		if GetSystime(1) >= 0  and  GetSystime(2) <= 30 then   ---剛好12點 -跑30分鐘
			AddToPartition(sting1, 0 )
			AddToPartition(sting2, 0 )
			AddToPartition(sting3, 0 )
			AddToPartition(sting4, 0 )
			AddToPartition(sting5, 0 )
			AddToPartition(sting6, 0 )
			AddToPartition(sting7, 0 )
			AddToPartition(sting8, 0 )
			AddToPartition(sting9, 0 )
			AddToPartition(sting10, 0 )
			AddToPartition(sting11, 0 )
			AddToPartition(sting12, 0 )
--		Say( OwnerID(), "ownerRun1" )
			if CheckID(sting1) ~= true  then	
--Say( OwnerID(), "10" )
				sting1 = CreateObj( mos,BaseX, BaseY, BaseZ+30+RDir, BaseDir+180 , 1)
				AddToPartition(sting1, 0 )	
			end
			
			if CheckID(sting2) ~= true  then
--Say( OwnerID(), "20" )
				sting2 = CreateObj( mos,BaseX, BaseY, BaseZ+40+RDir, BaseDir+180 , 1)
				AddToPartition(sting2, 0 )	
			end
			if CheckID(sting3) ~= true  then
--Say( OwnerID(), "30" )
				sting3 = CreateObj( mos,BaseX+30, BaseY, BaseZ+30+RDir, BaseDir+180 , 1)
				AddToPartition(sting3, 0 )
			end
			if CheckID(sting4) ~= true  then
--Say( OwnerID(), "40" )
				sting4 = CreateObj( mos,BaseX+50, BaseY, BaseZ+30+RDir, BaseDir+180 , 1)
				AddToPartition(sting4, 0 )	
			end
			if CheckID(sting5) ~= true  then
--Say( OwnerID(), "50" )
				sting5 = CreateObj( mos,BaseX+70, BaseY, BaseZ+30+RDir, BaseDir+180 , 1)
				AddToPartition(sting5, 0 )	
			end
			if CheckID(sting6) ~= true  then
--Say( OwnerID(), "60" )
				sting6 = CreateObj( mos,BaseX-50, BaseY, BaseZ+30+RDir, BaseDir+180 , 1)
				AddToPartition(sting6, 0 )	
			end
			if CheckID(sting7) ~= true  then
--Say( OwnerID(), "70" )
				sting7 = CreateObj( mos,BaseX-80, BaseY, BaseZ+30+RDir, BaseDir+180 , 1)
				AddToPartition(sting7, 0 )	
			end
			if CheckID(sting8) ~= true  then
--Say( OwnerID(), "80" )
				sting8 = CreateObj( mos,BaseX-40, BaseY, BaseZ+30+RDir, BaseDir+180 , 1)
				AddToPartition(sting8, 0 )	
			end
			if CheckID(sting9) ~= true  then
--Say( OwnerID(), "90" )
				sting9 = CreateObj( mos,BaseX-50, BaseY, BaseZ+30+RDir, BaseDir+180 , 1)
				AddToPartition(sting9, 0 )	
			end
			if CheckID(sting10) ~= true  then
--Say( OwnerID(), "100" )
				sting10 = CreateObj( mos,BaseX-120, BaseY, BaseZ+30+RDir, BaseDir+180 , 1)
				AddToPartition(sting10, 0 )	
			end
			if CheckID(sting11) ~= true  then
--Say( OwnerID(), "110" )
				sting11 = CreateObj( mos,BaseX-50, BaseY, BaseZ+80+RDir, BaseDir+180 , 1)
				AddToPartition(sting11, 0 )	
			end
			if CheckID(sting12) ~= true  then
--Say( OwnerID(), "120" )
				sting12 = CreateObj( mos,BaseX+90, BaseY, BaseZ+30+RDir, BaseDir+180 , 1)
				AddToPartition(sting12, 0 )	
			end
			Sleep( 300 )--30秒重生


		end
		Sleep( 60 )	-- 六秒檢查一次	
	end
end


