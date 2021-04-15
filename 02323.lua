

function DW_AirPortTicketServes()--���������
	--�إ߸�ưj��(�s�I�n�])
	local WorldCircle = {}
	WorldCircle[1] = {	{2,1}			--�ȯF����
							}
	WorldCircle[2] = {	{15,1}
							}
	WorldCircle[3] = {	{13,1},			--��������a
				{13,2},			--���ļw����
				{13,3},			--���լd��a
				{13,4},			--�Z�\�w�{�ɰ}�a
				{14,1},			--���լd��a
				{14,2},			--�~������
				{14,3}			--�M�ԥ��W
							}
	WorldCircle[4] = {	{22,1},			--�ը��N�w���}
				{23,1},
				{24,1},
				{25,1},
				{26,1}
							}
	WorldCircle[5] = {	{27,1},			--���s�q
				{28,1},
				{29,1},
				{30,1}
							}
	WorldCircle[6] = {		{32,1},			--�����x�a
				{33,1},
				{34,1},
							}

	local Obj = OwnerID()
	local Target = TargetID()
	local PID = ReadRoleValue(Target,EM_RoleValue_PID)			--(�s�I�n�],NPC��PID)
	local ZoneNum = math.floor(PID/1000)					--�d�ҡG14326
	local WDBNum = (math.floor(PID/100))%10				--wdb3 �� z14 ����2��, wdb3 ����6��
	local PointNum = (math.floor(PID/10))%10	
	local PointTurn = PID%10
	local Shortening = WorldCircle[WDBNum][PointTurn]			--�إ�²��N��
	local MaxNum = 0

	LoadQuestOption(Obj)

	for a,b in pairs(WorldCircle[WDBNum]) do
		MaxNum = MaxNum + 1
	end
	--DebugMsg( 0,0,"zone,test" )
	if(MaxNum~=1)then						--�ӥ@�ɦ��ƼƸ`�I
		if WDBNum==3 then
			for i=1,7,1 do
				local telePoint = WorldCircle[WDBNum][i]--�إ�²��N��NextPoint
				DebugMsg( 0,0,"zone,telepoint="..telepoint[1] )
				local ifTeleFlag = DW_AirLineMenu("AllowPass",WDBNum,telePoint[1],telePoint[2])--���o�ˬd�X��
				DebugMsg( 0,0,"zone,ifTeleFlag="..ifTeleFlag )
				if CheckFlag(Obj,ifTeleFlag)==true and PointTurn~=i then
AddSpeakOption(Obj,Target,"[SC_TRANSTO]"..DW_AirLineMenu("KeyString",WDBNum,telePoint[1],telePoint[2]),"DW_AirPortSleepShop("..DW_AirLineCodeTrans(WDBNum,telePoint[1],telePoint[2],i)..")",0)					end
			end
		else
			local LastPoint,NextPoint
			if(PointTurn==MaxNum)then				--�Y�Ӹ`�I���̤j�`�I
				LastPoint=PointTurn-1				--�U�@�I�n¶�L�`��
			elseif(PointTurn==1)then
				NextPoint=PointTurn+1
			else
				LastPoint=PointTurn-1
				NextPoint=PointTurn+1
			end
			if(NextPoint~=nil)then

				local Shortening_NextPoint=WorldCircle[WDBNum][NextPoint]--�إ�²��N��NextPoint
				local NextPointFlag = DW_AirLineMenu("AllowPass",WDBNum,Shortening_NextPoint[1],Shortening_NextPoint[2])--���o�ˬd�X��
				if	CheckFlag(Obj,NextPointFlag)==true	then
				AddSpeakOption(Obj,Target,"[SC_TRANSTO]"..DW_AirLineMenu("KeyString",WDBNum,Shortening_NextPoint[1],Shortening_NextPoint[2]),"DW_AirPortSleepShop("..DW_AirLineCodeTrans(WDBNum,Shortening_NextPoint[1],Shortening_NextPoint[2],NextPoint)..")",0)
				end
			end
			if(LastPoint~=nil)then		--�Y�W�@�I�D�`���_�I
				local Shortening_LastPoint=WorldCircle[WDBNum][LastPoint]--�إ�²��N��LastPoint
				local LastPointFlag = DW_AirLineMenu("AllowPass",WDBNum,Shortening_LastPoint[1],Shortening_LastPoint[2])--���o�ˬd�X��
				if	CheckFlag(Obj,LastPointFlag)==true	then
				AddSpeakOption(Obj,Target,"[SC_TRANSTO]"..DW_AirLineMenu("KeyString",WDBNum,Shortening_LastPoint[1],Shortening_LastPoint[2]),"DW_AirPortSleepShop("..DW_AirLineCodeTrans(WDBNum,Shortening_LastPoint[1],Shortening_LastPoint[2],LastPoint)..")",0)
				end
			end
		end

	end
	--�S��ǰe��(�s�j���n�])
	local SPAirLine = {}
	SPAirLine[1] = {
				}
	SPAirLine[2] = {
				}
	SPAirLine[3] = {
			[1]=	function ()					--��������a
					AddSpeakOption(Obj,Target,"[SC_TRANSTO]"..DW_AirLineMenu("KeyString",1,2,1),"DW_AirPortSleepShop(2111)",0 )
					AddSpeakOption( Obj, Target, "[SC_111256_Q]" , "DW_AirPortTicketServes_1", 0 ); --�ǰe�O����H
				end,
			[5]=	function ()					--���լd��a
					AddSpeakOption(Obj,Target,"[SC_TRANSTO]"..DW_AirLineMenu("KeyString",1,2,1),"DW_AirPortSleepShop(2111)",0 )
				end,
			[7]=	function ()					--���W��a
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
	AddSpeakOption(Obj,Target,"[SC_111256_S]","DW_SetAirLineHome", 0 )--�ﶵ�G�ڷQ��^�{�I�O���b��

	local LocalFlag = DW_AirLineMenu("AllowPass",WDBNum,ZoneNum,PointNum)	--���a�����\�q��X��
	if	CheckFlag(Obj,LocalFlag)==false	then
		SetFlag(Obj,LocalFlag,1)	--�}�Ҥ��\�q��X��
		ScriptMessage( Obj, Obj, 1, "[SC_111256_OT]", C_SYSTEM )		--�T���G�A���\�}�Ҧ��a���Ȫ̤���
	end
end


function DW_AirPortTicketServes_1()
	local Obj = OwnerID()
	local Target = TargetID()
	SetSpeakDetail( Obj, "[SC_111256_QD]");
	AddSpeakOption( Obj, Target, "[SO_BACKTALK]", "DW_AirPortTicketServes", 0 ); 	--�ڷQ�^���誺���
end

function LuaS_424087_Trans_X()
	local Obj = OwnerID()
	CloseSpeak(Obj)
	ChangeZone(Obj,7,0,16678,75,15809,288.3)
end