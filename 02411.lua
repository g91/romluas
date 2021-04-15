
------------------------PE的兌換對話劇情---------------------------------------------------------

function LuaS_118800_Conversation()
	local Obj = OwnerID()
	LoadQuestOption(Obj)
	AddSpeakOption(Obj,Obj,"[SC_118800_0]","LuaS_118800_ShopList", 0 )
end

function LuaS_118800_ShopList()
	local Obj = OwnerID()
	local NPC = TargetID()
	SetSpeakDetail( Obj,"[SC_118800_1]")
	for i=1,4,1 do
		local x = "LuaS_118800_Qualification("..Obj..","..NPC..","..i..")"
		AddSpeakOption(Obj,Obj,"[SC_118800_"..1+i.."]",x, 0  )
	end
end

function LuaS_118800_Qualification(Obj,NPC,Level)
	local ShopArray = {
						[1] = {{600344,"[SC_118800_9]"},{600334,"[SC_118800_8]"}},
						[2] = {{600341,"[SC_118800_10]"},{600342,"[SC_118800_11]"}},
						[3]	= {{600335,"[SC_118800_9]"},{600336,"[SC_118800_8]"}},
						[4] = 600337
							}
	if	LuaS_118800_CheckLevel(Obj)<Level	then
		SetSpeakDetail( Obj,"[SC_118800_6]")
		for i=1,4,1 do
			if	i<Level	then
				local x = "LuaS_118800_Qualification("..Obj..","..NPC..","..i..")"
				AddSpeakOption(Obj,Obj,"[SC_118800_"..1+i.."]",x, 0  )
			end
		end
	else
		if	type(ShopArray[Level])=="number"	then
			LuaS_118800_ShopSwitch(NPC,ShopArray[Level],Obj)
		else
			if	Level == 2	then
				SetSpeakDetail( Obj,"[SC_118800_12]")
			else
				SetSpeakDetail( Obj,"[SC_118800_7]")
			end
			local a,b = "LuaS_118800_ShopSwitch("..NPC..[[,]]..ShopArray[Level][1][1]..[[,]]..Obj..")","LuaS_118800_ShopSwitch("..NPC..[[,]]..ShopArray[Level][2][1]..[[,]]..Obj..")"
			AddSpeakOption(Obj,Obj,ShopArray[Level][1][2],a, 0 )
			AddSpeakOption(Obj,Obj,ShopArray[Level][2][2],b, 0 )
		end
	end

end


function LuaS_118800_ShopSwitch(NPC,ShopID,Obj)
	SetShop( NPC , ShopID , "Test_Shop_Close" )
	if	Obj~=nil	then
		CloseSpeak(Obj)
		OpenShop()
	end
end

function LuaS_118800_CheckLevel(Obj)
	local FinalLevel = 0
	local LevelCheck = {
							[1] = 	function ()
											return true
									end,
							[2] = 	function ()
											return true
									end,
							[3] = 	function ()
											
											return CheckBuff(Obj,620023)
									end,
							[4] = 	function ()
											if	CheckBuff(Obj,620023)	and
												ZONE20_PE01_Var["BarricadesDead"]==0	then
												return true
											else
												return false
											end
									end
							}
	for i=1,table.getn(LevelCheck),1 do
		if	LevelCheck[i]()==true	then
			FinalLevel = i;
		else
			break;
		end
	end
	return FinalLevel;
end

----------------------------------PE物品刪除指令---------------------------