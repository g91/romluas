

function LuaS_111284_1() --解完任務的時候
	if CountBodyItem (TargetID() , 200391 ) == 0 then
		GiveBodyItem ( TargetID() , 200391 , 1 )
	end
end


function LuaS_200391_0()  --右鍵點火種接任務
	local Quest = {	
			[541574] = 	{ [541579] = 420868 , [541580] = 420869 , [541581] = 420870 },
			[541575] = 	{ [541579] = 420871 , [541580] = 420872 , [541581] = 420873 },
			[541576] = 	{ [541579] = 420874 , [541580] = 420875 , [541581] = 420876 },
			[541577] = 	{ [541579] = 420877 , [541580] = 420878 , [541581] = 420879 },
			[541578] = 	{ [541579] = 420880 , [541580] = 420881 , [541581] = 420882 }
			}

-----------------
	local NowZone = {	
				[1]=541566 , [2]=541567 , 
				[3]=541568 , [4]=541569 , [5]=541570 
			}
	local NowNPC = { [1]=541571 , [2]=541572 , [3]=541573 }

------------------------------
	local LogZone  = { 
				[1]=541574 , [2]=541575 , 
				[3]=541576 , [4]=541577 , [5]=541578 
			}
	local LogNPC  = { [1]=541579 , [2]=541580 , [3]=541581 }

-----------------------------
	local NowZ = 0
	local NowN = 0
	local TempZone = {}
	local TempNPC = {}
	local QuestID = 0
	local str

	if CheckFlag( OwnerID() , 541579 ) and CheckFlag( OwnerID() , 541580 ) and CheckFlag( OwnerID() , 541581 ) then --是不是完成三次傳遞
		ClearBorder( OwnerID() )
		AddBorderPage( OwnerID(), GetQuestDetail( 420883, 1  ) )
		ShowBorder( OwnerID(), 420883, "[420883]", "ScriptBorder_Texture_Paper" )
		return
	end

	--先檢查是不是已經有接過任務了
	for i=1,table.getn(NowZone) do
		if CheckFlag( OwnerID() ,NowZone[i] ) then
			NowZ = i
		end
	end
	for j = 1 ,table.getn(NowNPC) do
		if CheckFlag ( OwnerID() ,NowNPC[j] ) then
			NowN = j
		end
	end
		

	if NowZ~=0 and NowN ~=0 then
		QuestID = Quest[LogZone[NowZ]][LogNPC[NowN]]
		str = "["..QuestID.."]"
		ClearBorder( OwnerID() )
		AddBorderPage( OwnerID(), GetQuestDetail( QuestID , 1  ) )
		ShowBorder( OwnerID(), QuestID, str , "ScriptBorder_Texture_Paper" )
		return
	end
	--直接用rand的去洗出未接過的
	while true do
		local rand_value = Rand( table.getn(LogZone) ) +1
		if CheckFlag ( OwnerID() , LogZone[rand_value] ) == false then
			NowZ = rand_value
			break
		end
	end
	while true do
		local rand_value = Rand( table.getn(LogNPC) ) +1
		if CheckFlag ( OwnerID() , LogNPC[rand_value] ) == false then
			NowN = rand_value
			break
		end
	end
--記下任務
	SetFlag( OwnerID(), NowZone[NowZ], 1 )
	SetFlag( OwnerID(), NowNPC[NowN], 1 )

	--show石碑介面
	QuestID = Quest[LogZone[NowZ]][LogNPC[NowN]]
	str = "["..QuestID.."]"
	ClearBorder( OwnerID() )
	AddBorderPage( OwnerID(), GetQuestDetail( QuestID , 1  ) )
	ShowBorder( OwnerID(), QuestID ,str , "ScriptBorder_Texture_Paper" )
		
end



function LuaS_200391_1() --完成傳遞任務時執行的srcipt


	local NowZone = {	
				[1]=541566 , [2]=541567 , 
				[3]=541568 , [4]=541569 , [5]=541570 
			}
	local NowNPC = { [1]=541571 , [2]=541572 , [3]=541573 }

------------------------------
	local LogZone  = { 
				[1]=541574 , [2]=541575 , 
				[3]=541576 , [4]=541577 , [5]=541578 
			}
	local LogNPC  = { [1]=541579 , [2]=541580 , [3]=541581 }

-----------------------------


	for i=1, table.getn(NowZone) do
		if CheckFlag(TargetID() , NowZone[i]) then
			SetFlag(TargetID() , LogZone[i] , 1 )
			SetFlag(TargetID() , NowZone[i] , 0 )
		end
	end

	for i=1,table.getn(NowNPC) do
		if CheckFlag(TargetID() , NowNPC[i]) then
			SetFlag(TargetID() , LogNPC[i] , 1 )
			SetFlag(TargetID() , NowNPC[i] , 0 )
		end
	end


end



function LuaS_200391_2()--最後任務完成的時候



	local NowZone = {	
				[1]=541566 , [2]=541567 , 
				[3]=541568 , [4]=541569 , [5]=541570 
			}
	local NowNPC = { [1]=541571 , [2]=541572 , [3]=541573 }

------------------------------
	local LogZone  = { 
				[1]=541574 , [2]=541575 , 
				[3]=541576 , [4]=541577 , [5]=541578 
			}
	local LogNPC  = { [1]=541579 , [2]=541580 , [3]=541581 }

-----------------------------

	for i=1,table.getn(LogZone) do
		SetFlag(TargetID() , LogZone[i] , 0 )
	end

	for i=1,table.getn(LogNPC) do
		SetFlag(TargetID() , LogNPC[i] , 0 )
	end
end