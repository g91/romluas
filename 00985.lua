--南瓜王script
function E2008HELLDAY_1()
	SetPlot( OwnerID() , "Range" , "E2008HELLDAY_3" ,150)
end
function E2008HELLDAY_2()
	sleep(10)
	--MoveToFlagEnabled( OwnerID() , False )
	
		local Owner = Role:new( OwnerID() )
		local BaseX = Owner:X()
 		local BaseY = Owner:Y()
 		local BaseZ = Owner:Z()
		local BaseDir =Owner:Dir()
		local RDir = rand(20)
		local Mos = 101281

		local a=3
		
		local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
		local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
		
		while 1 do
		if GetSystime(1) >= 20  and  GetSystime(2) == 0 then
			if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
				RunningMsg( OwnerID() , 2 ,  GetString("E2008HELL_K_1") ) --凡瑞娜絲城附近的南瓜田似乎有不尋常的跡象
			end
		sleep( 250 )
		end
		if GetSystime(1) >= 10 then
--		Say( OwnerID(), "Run1" )
		mmck0 = CreateObj( Mos,BaseX, BaseY, BaseZ, BaseDir , 1 )
		mmck1 = CreateObj( Mos,BaseX, BaseY, BaseZ, BaseDir-30 , 1 )
		mmck2 = CreateObj( Mos,BaseX, BaseY, BaseZ, BaseDir-60 , 1 )
		mmck3 = CreateObj( Mos,BaseX, BaseY, BaseZ, BaseDir-90 , 1 )
		mmck4 = CreateObj( Mos,BaseX, BaseY, BaseZ, BaseDir-120 , 1 )
		mmck5 = CreateObj( Mos,BaseX, BaseY, BaseZ, BaseDir-150 , 1 )
		mmck6 = CreateObj( Mos,BaseX, BaseY, BaseZ, BaseDir -180, 1 )
		mmck7 = CreateObj( Mos,BaseX, BaseY, BaseZ, BaseDir-210 , 1 )
		mmck8 = CreateObj( Mos,BaseX, BaseY, BaseZ, BaseDir -240, 1 )
		mmck9 = CreateObj( Mos,BaseX, BaseY, BaseZ, BaseDir-270 , 1 )
		mmck10 = CreateObj( Mos,BaseX, BaseY, BaseZ, BaseDir-300 , 1 )
		mmck11 = CreateObj( Mos,BaseX, BaseY, BaseZ, BaseDir-330 , 1 )


			if CheckID(mmck0) == 0  then
			AddToPartition(mmck0, 0 )
			Move( mmck0, BaseX, BaseY, BaseZ+(100/a) )
				sleep( 10 )
			end

			if CheckID(mmck1) ~= true  then
			AddToPartition(mmck1, 0 )
			Move( mmck1, BaseX+(33/a), BaseY, BaseZ+(67/a) )
				sleep( 10 )
			end
			if CheckID(mmck2) ~= true  then
			AddToPartition(mmck2, 0 )
			Move( mmck2, BaseX+(67/a), BaseY, BaseZ +(33/a))
				sleep( 10 )
			end
			if CheckID(mmck3) ~= true  then
			AddToPartition(mmck3, 0 )
			Move( mmck3, BaseX+(100/a), BaseY, BaseZ )
				sleep( 10 )
			end
			if CheckID(mmck4) ~= true  then
			AddToPartition(mmck4, 0 )
			Move( mmck4, BaseX+(67/a), BaseY, BaseZ -(33/a))
				sleep( 10 )
			end
			if CheckID(mmck5) ~= true  then
			AddToPartition(mmck5, 0 )
			Move( mmck5, BaseX+(33/a), BaseY, BaseZ -(67/a))
				sleep( 10 )
			end
			if CheckID(mmck6) ~= true  then
			AddToPartition(mmck6, 0 )
			Move( mmck6, BaseX, BaseY, BaseZ -(100/a))
				sleep( 10 )
			end
			if CheckID(mmck7) ~= true  then
			AddToPartition(mmck7, 0 )
			Move( mmck7, BaseX-(33/a), BaseY, BaseZ -(67/a))
				sleep( 10 )
			end
			if CheckID(mmck8) ~= true  then
			AddToPartition(mmck8, 0 )
			Move( mmck8, BaseX-(67/a), BaseY, BaseZ-(33/a) )
				sleep( 10 )
			end
			if CheckID(mmck9) ~= true  then
			AddToPartition(mmck9, 0 )
			Move( mmck9, BaseX-(100/a), BaseY, BaseZ )
				sleep( 10 )
			end
			if CheckID(mmck10) ~= true  then
			AddToPartition(mmck10, 0 )
			Move( mmck10, BaseX-(67/a), BaseY, BaseZ +(33/a))
				sleep( 10 )
			end
			if CheckID(mmck11) ~= true  then
			AddToPartition(mmck11, 0 )
			Move( mmck11, BaseX-(33/a), BaseY, BaseZ +(67/a))
				sleep( 10 )
			end 
		end
--			Say( OwnerID(), "Done" )

			sleep( 100 )

		if GetSystime(1) == 12 then	--and  GetSystime(2) == 50 then
--			Say( OwnerID(), "Run2" )
			if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
				RunningMsg( OwnerID() , 2 ,  GetString("E2008HELL_K_3") ) 
			end
			if CheckID(mmck0) == true  then DelObj(mmck0) end
			if CheckID(mmck1) == true  then DelObj(mmck1) end
			if CheckID(mmck2) == true  then DelObj(mmck2) end
			if CheckID(mmck3) == true  then DelObj(mmck3) end
			if CheckID(mmck4) == true  then DelObj(mmck4) end
			if CheckID(mmck5) == true  then DelObj(mmck5) end
			if CheckID(mmck6) == true  then DelObj(mmck6) end
			if CheckID(mmck7) == true  then DelObj(mmck7) end
			if CheckID(mmck8) == true  then DelObj(mmck8) end
			if CheckID(mmck9) == true  then DelObj(mmck9) end
			if CheckID(mmck10) == true  then DelObj(mmck10) end
			if CheckID(mmck11) == true  then DelObj(mmck11) end
--			Say( OwnerID(), "killed" )
		end 
		sleep( 100 )
	
	end
end

function E2008HELLDAY_4()

	local TimeCheck = "CLOSE"

	if GetSystime( 1 ) >= 0  then   -------------------------------time check 十間控制開關
		TimeCheck = "OPEN"
	else
		TimeCheck = "OVERTIME"
	end
	
------------------------------------------------------------------------------------------------
	if TimeCheck == "OPEN" then --符合報名時間的敘述
		LoadQuestOption( OwnerID())
	elseif TimeCheck == "OVERTIME" then --超過報名時間的敘述
		SetSpeakDetail( OwnerID(), GetString("E2008HELL_K_7")   ) 
	else --不在報名時間的敘述
		SetSpeakDetail( OwnerID(), GetString("E2008HELL_K_7")   ) 
	end
		if TimeCheck == "OPEN" then		
			AddSpeakOption( OwnerID(), TargetID( ), GetString("E2008HELL_K_6") , "E2008HELLDAY_6", 0 ); --/* 我要砸南瓜
		else
			SetSpeakDetail( OwnerID(), GetString("E2008HELL_K_7")   ) --不在報名時間的敘述
		end



end