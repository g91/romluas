

function DW_AirPortTicketServes()--阿狗的對話
	--建立資料迴圈(新點要設)
	local WorldCircle = {}
	WorldCircle[1] = {	{2,1}			--銀涌之野
							}
	WorldCircle[2] = {	{15,1}
							}
	WorldCircle[3] = {	{13,1},			--海爾芬營地
				{13,2},			--蘭薩德部落
				{13,3},			--荒原調查營地
				{13,4},			--凡蓋德臨時陣地
				{14,1},			--遺跡調查營地
				{14,2},			--居尼爾斯
				{14,3}			--決戰先鋒
							}
	WorldCircle[4] = {	{22,1},			--諾里吉安國遺址
				{23,1},
				{24,1},
				{25,1},
				{26,1}
							}
	WorldCircle[5] = {	{27,1},			--海盜島
				{28,1},
				{29,1},
				{30,1}
							}
	WorldCircle[6] = {		{32,1},			--裂水台地
				{33,1},
				{34,1},
							}

	local Obj = OwnerID()
	local Target = TargetID()
	local PID = ReadRoleValue(Target,EM_RoleValue_PID)			--(新點要設,NPC的PID)
	local ZoneNum = math.floor(PID/1000)					--範例：14326
	local WDBNum = (math.floor(PID/100))%10				--wdb3 的 z14 的第2站, wdb3 的第6站
	local PointNum = (math.floor(PID/10))%10	
	local PointTurn = PID%10
	local Shortening = WorldCircle[WDBNum][PointTurn]			--建立簡單代稱
	local MaxNum = 0

	LoadQuestOption(Obj)

	for a,b in pairs(WorldCircle[WDBNum]) do
		MaxNum = MaxNum + 1
	end
	--DebugMsg( 0,0,"zone,test" )
	if(MaxNum~=1)then						--該世界有複數節點
		if WDBNum==3 then
			for i=1,7,1 do
				local telePoint = WorldCircle[WDBNum][i]--建立簡單代稱NextPoint
				DebugMsg( 0,0,"zone,telepoint="..telepoint[1] )
				local ifTeleFlag = DW_AirLineMenu("AllowPass",WDBNum,telePoint[1],telePoint[2])--取得檢查旗標
				DebugMsg( 0,0,"zone,ifTeleFlag="..ifTeleFlag )
				if CheckFlag(Obj,ifTeleFlag)==true and PointTurn~=i then
AddSpeakOption(Obj,Target,"[SC_TRANSTO]"..DW_AirLineMenu("KeyString",WDBNum,telePoint[1],telePoint[2]),"DW_AirPortSleepShop("..DW_AirLineCodeTrans(WDBNum,telePoint[1],telePoint[2],i)..")",0)					end
			end
		else
			local LastPoint,NextPoint
			if(PointTurn==MaxNum)then				--若該節點為最大節點
				LastPoint=PointTurn-1				--下一點要繞過循環
			elseif(PointTurn==1)then
				NextPoint=PointTurn+1
			else
				LastPoint=PointTurn-1
				NextPoint=PointTurn+1
			end
			if(NextPoint~=nil)then

				local Shortening_NextPoint=WorldCircle[WDBNum][NextPoint]--建立簡單代稱NextPoint
				local NextPointFlag = DW_AirLineMenu("AllowPass",WDBNum,Shortening_NextPoint[1],Shortening_NextPoint[2])--取得檢查旗標
				if	CheckFlag(Obj,NextPointFlag)==true	then
				AddSpeakOption(Obj,Target,"[SC_TRANSTO]"..DW_AirLineMenu("KeyString",WDBNum,Shortening_NextPoint[1],Shortening_NextPoint[2]),"DW_AirPortSleepShop("..DW_AirLineCodeTrans(WDBNum,Shortening_NextPoint[1],Shortening_NextPoint[2],NextPoint)..")",0)
				end
			end
			if(LastPoint~=nil)then		--若上一點非循環起點
				local Shortening_LastPoint=WorldCircle[WDBNum][LastPoint]--建立簡單代稱LastPoint
				local LastPointFlag = DW_AirLineMenu("AllowPass",WDBNum,Shortening_LastPoint[1],Shortening_LastPoint[2])--取得檢查旗標
				if	CheckFlag(Obj,LastPointFlag)==true	then
				AddSpeakOption(Obj,Target,"[SC_TRANSTO]"..DW_AirLineMenu("KeyString",WDBNum,Shortening_LastPoint[1],Shortening_LastPoint[2]),"DW_AirPortSleepShop("..DW_AirLineCodeTrans(WDBNum,Shortening_LastPoint[1],Shortening_LastPoint[2],LastPoint)..")",0)
				end
			end
		end

	end
	--特殊傳送表(新大陸要設)
	local SPAirLine = {}
	SPAirLine[1] = {
				}
	SPAirLine[2] = {
				}
	SPAirLine[3] = {
			[1]=	function ()					--海爾芬營地
					AddSpeakOption(Obj,Target,"[SC_TRANSTO]"..DW_AirLineMenu("KeyString",1,2,1),"DW_AirPortSleepShop(2111)",0 )
					AddSpeakOption( Obj, Target, "[SC_111256_Q]" , "DW_AirPortTicketServes_1", 0 ); --傳送是什麼？
				end,
			[5]=	function ()					--遺跡調查營地
					AddSpeakOption(Obj,Target,"[SC_TRANSTO]"..DW_AirLineMenu("KeyString",1,2,1),"DW_AirPortSleepShop(2111)",0 )
				end,
			[7]=	function ()					--先鋒營地
					if	CheckCompleteQuest(Obj,424087)==true	then
						AddSpeakOption(Obj,Obj,"[SC_TRANSTO]".."[ZONE_WEEPING COAST]","LuaS_424087_Trans_X", 0 )
					end
				end
				}
	SPAirLine[4] = {
			[1]=	function ()
					AddSpeakOption(Obj,Target,"[SC_TRANSTO]"..DW_AirLineMenu("KeyString",1,2,1),"DW_AirPortSleepShop(2111)",0 )
					AddSpeakOption(Obj,Target,"[SC_TRANSTO]"..DW_AirLineMenu("KeyString",2,15,1),"DW_AirPortSleepShop(15211)",0 )
				end
				}
	SPAirLine[5] = {
				}
	if(SPAirLine[WDBNum][PointTurn]~=nil)then
		SPAirLine[WDBNum][PointTurn]()
	end
	AddSpeakOption(Obj,Target,"[SC_111256_S]","DW_SetAirLineHome", 0 )--選項：我想把回程點記錄在此

	local LocalFlag = DW_AirLineMenu("AllowPass",WDBNum,ZoneNum,PointNum)	--此地的允許通行旗標
	if	CheckFlag(Obj,LocalFlag)==false	then
		SetFlag(Obj,LocalFlag,1)	--開啟允許通行旗標
		ScriptMessage( Obj, Obj, 1, "[SC_111256_OT]", C_SYSTEM )		--訊息：你成功開啟此地的旅者之門
	end
end


function DW_AirPortTicketServes_1()
	local Obj = OwnerID()
	local Target = TargetID()
	SetSpeakDetail( Obj, "[SC_111256_QD]");
	AddSpeakOption( Obj, Target, "[SO_BACKTALK]", "DW_AirPortTicketServes", 0 ); 	--我想回到剛剛的對話
end

function LuaS_424087_Trans_X()
	local Obj = OwnerID()
	CloseSpeak(Obj)
	ChangeZone(Obj,7,0,16678,75,15809,288.3)
end