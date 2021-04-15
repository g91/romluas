
function DW_AirLineMenu(TYPE,WDBNum,ZoneNum,PointNum)--�d�ߤ���
	--�U���i��TYPE�C��
	--"InquiryCost"
	--�d�ߦ��O
	--"PointQuantity"
	--�`�I�ƶq
	--"ZoneQuantity"
	--�ϰ�ƶq
	--"KeyString"
	--�ϰ�W��
	--"AllowPass"
	--�O�_���\�q��
	
	if	TYPE == nil	then
		TYPE = "InquiryCost"--�w�]�O�d�ߦ��O
	end
	--�}�C���Y��(�s�I�n�])
	--WDBNum>ZoneNum>PointNum>��O���B
	local AirPointData = {}
	AirPointData[1] = {}
	AirPointData[1][2] = {20}							--�ȴ餧���`�I�ǰe�O��
	AirPointData[2] = {}
	AirPointData[2][15] = {2000}							--�p�ᤧ�C�`�I�ǰe�O��
	AirPointData[3] = {}
	AirPointData[3][13] = {250,400,1000,1800}						--���Q�F�����`�I�ǰe�O��
	AirPointData[3][14] = {2200,2200,2200}						--�����ȩԸ`�I�ǰe�O��
	AirPointData[4] = {}
	AirPointData[4][22] = {2200}							--�ը��N�w���}�ǰe�O��
	AirPointData[4][23] = {2200}
	AirPointData[4][24] = {2200}
	AirPointData[4][25] = {2200}
	AirPointData[4][26] = {2200}
	AirPointData[5] = {}							--���s�q�ǰe�O��
	AirPointData[5][27] = {3000}
	AirPointData[5][28] = {3000}
	AirPointData[5][29] = {3000}
	AirPointData[5][30] = {3000}
	AirPointData[6] = {}							--�J�|�}�Ȥj���ǰe�O��
	AirPointData[6][32] = {6000}
	AirPointData[6][33] = {6000}
	AirPointData[6][34] = {6000}


	--�r��d�ߪ�(�s�I�n�])
	local AirPointString = {}
	AirPointString[1] = {}
	AirPointString[1][2] = {	"[ZONE_SILVERSPRING]"					--�ȴ餧��
										}
	AirPointString[2] = {}
	AirPointString[2][15] = {	"[ZONE_THUNDERHOOF_MESA]"			--�p�ᤧ�C
										}
	AirPointString[3] = {}
	AirPointString[3][13] = {	"[ZONE_HARFEN_CAMP]",				--��������a
					"[ZONE_LANZERD_HORDE]",				--���ļw����
					"[ZONE_WILDERNESS_RESEARCH_CAMP]",		--���լd��a
					"[ZONE_TEMPORARY_FANGT_CAMP]"			--�Z�\�w�{��
										}
	AirPointString[3][14] = {	"[ZONE_RUINS_TESTING_CAMP]",			--���լd��a
					"[ZONE_JINNERS_CAMP]",				--�~������
					"[ZONE_FRONT_LINES_CAMP]"				--�M�ԥ��W��a
										}
	AirPointString[4] = {}
	AirPointString[4][22] = {	"[ZONE_Z22_OLD_ROJAN_KINGDOM]"			--�ը��N�w���}
										}
	AirPointString[4][23] = {	"[ZONE_Z23_QUESLANA]"				--�_���S�Ԧ㮦��
										}
	AirPointString[4][24] = {	"[ZONE_Z24_MERDIN_TUNDRA]"			--�����B���
										}
	AirPointString[4][25] = {	"[ZONE_Z25_SERBAYT_PASS]"				--�ƺ����S�i�f
										}
	AirPointString[4][26] = {	"[ZONE_Z26_ZHYRO]"					--�įQ��
										}
	AirPointString[5] = {}	
	AirPointString[5][27] = {	"[ZONE_Z27_WAILING_FJORD]"				--�s�z�l�W
										}
	AirPointString[5][28] = {	"[ZONE_Z28_HURTEKKE_JUNGLE]"				--���S�J�O�L
										}
	AirPointString[5][29] = {	"[ZONE_Z29_XADIA_BASIN]"				--��ǻp�a�Ȭ֦a
										}
	AirPointString[5][30] = {	"[ZONE_Z30_KATHALAN]"					--�d�F�R��
										}

	AirPointString[6] = {}
	AirPointString[6][32] = {	"[ZONE_Z32_SPLITWATER]"				--�����x�a
										}
	AirPointString[6][33] = {	"[ZONE_Z33_FAYTEAR_UPLANDS]"				--�O�����C��
										}
--	AirPointString[6][34] = {	"[ZONE_Z30_KATHALAN]"					--������a
--										}
	--�X�Ьd�ߪ�(�s�I�n�])
	local AirPointFlag = {}
	AirPointFlag[1] = {}
	AirPointFlag[1][2] = {	541314		--�ȯF����
					}
	AirPointFlag[2] = {}
	AirPointFlag[2][15] = {	543704		--�p�ᤧ�C
					}
	AirPointFlag[3] = {}
	AirPointFlag[3][13] = {
				544980,	--��������a
				544981,	--���ļw��a
				544982,	--��լd��a
				545042		--�Z�\�w�{��
					}
	AirPointFlag[3][14] = {
				544983,	--��}�լd��a
				545043,	--�~������
				545044		--�M�ԥ��W
					}
	AirPointFlag[4] = {}
	AirPointFlag[4][22] = {	546189		--�ը��N�w���}
					}
	AirPointFlag[4][23] = {	547002  	--�_���S�Ԧ㮦��
					}
	AirPointFlag[4][24] = {	547003  	--�����B���
					}
	AirPointFlag[4][25] = {	547004  	--�ƺ����S�i�f
					}
	AirPointFlag[4][26] = {	547005  	--�ƺ����S�i�f
					}
					
	AirPointFlag[5] = {}
	AirPointFlag[5][27] = {	548380	--�s�z�l�W
					}
	AirPointFlag[5][28] = {	548381  	--�}�һ��S�J�O�L
					}
	AirPointFlag[5][29] = {	548382  	--��ǻp�a�Ȭ֦a
					}
	AirPointFlag[5][30] = {	548383  	--�d�F�R��
					}

	AirPointFlag[6] = {}
	AirPointFlag[6][32] = {	548978	--�����x�a
					}
	AirPointFlag[6][33] = {	548979	--�O�����C��
					}
	AirPointFlag[6][34] = {	548980  	--������a
					}


	if	TYPE == "InquiryCost" then
		return AirPointData[WDBNum][ZoneNum][PointNum]				--�^�Ǹ`�I�ǰe���O
	elseif	TYPE == "PointQuantity" then
		local Num = 0
		for i , n in pairs(AirPointData[WDBNum][ZoneNum]) do
			Num = Num + 1
		end
		return Num 									--�^�Ǹ`�I�ƶq
	elseif	TYPE == "ZoneQuantity" then
		local Num = 0
		for i , n in pairs(AirPointData[WDBNum]) do
			Num = Num + 1
		end
		return Num 									--�^�ǰϰ�ƶq
	elseif	TYPE == "KeyString"	then
		return AirPointString[WDBNum][ZoneNum][PointNum]
	elseif	TYPE == "AllowPass"	then							--�^�ǺX��
		return AirPointFlag[WDBNum][ZoneNum][PointNum]
	else
		return nil
	end
end

function DW_AirPointGoing(Obj,WDBNum,ZoneNum,PointNum)--���椤��
	--�y�Щw���(�s�I�n�])
	local AirPointCoordinate = {}					--�إ߭���`�I���
	AirPointCoordinate[1] = {}
	AirPointCoordinate[1][2] = {	{2296.9,0,1160.9,60.8}		--�ȴ餧��
										}
	AirPointCoordinate[2] = {}
	AirPointCoordinate[2][15] = {	{ -4261 , 13 , 5050 , 250 }	--�p�ᤧ�C
										}
	AirPointCoordinate[3] = {}				
	AirPointCoordinate[3][13] = {	{-6321.8,161.2,-3908.4,189.2},	--��������a
					{41.7,140,-1154.7,298},		--���ļw����
					{-7413.9,620,1191.3,192.9},	--���լd��a
					{-2.5,687,5027.5,290.4}		--�Z�\�w�{��
										}
	AirPointCoordinate[3][14] = {	{982.6,326,13358.4,275.9},	--���լd��a
					{12874,55,1955.2,69.9},		--�~��������a
					{6777.6,95,6312.5,76.3}		--�M�ԥ��W��a
										}
	AirPointCoordinate[4] = {}
	AirPointCoordinate[4][22] = {	{-20732.1,570,-22756.7,321.3}	--�ը��N�w���}
										}
	AirPointCoordinate[4][23] = {	{-7794.4,718.8,-16589.3,169.9}	--�_���S�Ԧ㮦��
										}
	AirPointCoordinate[4][24] = {	{3847.4,444.8,-7769.3,180.9}	--�����B���
										}
	AirPointCoordinate[4][25] = {	{ -6557.7, 1452.4, -7719.4, 29 }	--�ƺ����S�i�f
										}
	AirPointCoordinate[4][26] = {	{ -17896.6, 801.9, -3340.5, 335.9 }	--�ƺ����S�i�f
										}
	AirPointCoordinate[5] = {}
	AirPointCoordinate[5][27] = {	{-9171.8, 20, 3055, 283.7}	
										}
	AirPointCoordinate[5][28] = {	{ 2587.7, 146.9, 24619, 210}	
										}
	AirPointCoordinate[5][29] = {	{ 7054, 11, 22695, 272} 
										}
	AirPointCoordinate[5][30] = {	{19298.9,45.8,34932.7,134.6 }	
										}

	AirPointCoordinate[6] = {}
	AirPointCoordinate[6][32] = {	{-12978.9, 180.8, 14154.6, 280.5}	
										}
	AirPointCoordinate[6][33] = {	{-4248.7,839.1,5134.2,116.5 }	
										}
	AirPointCoordinate[6][34] = {	{0,0,0,0 }	 
										}

			
	local Shortening = AirPointCoordinate[WDBNum][ZoneNum][PointNum]			--���w�N��
	ChangeZone(Obj,ZoneNum,0,Shortening[1],Shortening[2],Shortening[3],Shortening[4])	--�i��ǰe
end

function DW_DialogStringChange(WDBNum,ZoneNum,PointNum)--�r���ഫ����
	local String = ""
	if  DW_AirLineMenu("InquiryCost",WDBNum,ZoneNum,PointNum)== nil then
		return -1 
	else
		local TransZone_Cost = DW_AirLineMenu("InquiryCost",WDBNum,ZoneNum,PointNum)
		local ZONE_KeyStirng = DW_AirLineMenu("KeyString",WDBNum,ZoneNum,PointNum)
		String = "[SC_111256_DIALOG_0][$SETVAR1="..ZONE_KeyStirng.."][$SETVAR2="..TransZone_Cost.."]" 			--�ǰe��X�ݭn�I�OX��
	end 
	return String
end

function DW_AirPortSleepShop(PID)--��ť𮧯�
	local Obj = OwnerID()
	CloseSpeak(Obj)
	CallPlot(Obj,"DW_TransnerDialog",PID)
end

function DW_TransnerDialog(PID)--�ȪA����
	local Obj = OwnerID()
	local ZoneNum = math.floor(PID/1000)								--�d�ҡG14326 => 14 3 2 6
	local WDBNum = (math.floor(PID/100))%10							--wdb3 �� z14 ����2��, wdb3 ����6��
	local PointNum = (math.floor(PID/10))%10	
	local PointTurn = PID%10
	local DialogString = DW_DialogStringChange(WDBNum,ZoneNum,PointNum)			--���o��ܦr��
	if	DialogString==-1	then
		ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_FIXEQ_DATA_ERROR]",0)			--��ưe�X�����D
		return 0
	end
	DialogCreate(Obj,EM_LuaDialogType_YesNo,DialogString)
	DialogSelectStr( Obj,"[SO_YES]")
	DialogSelectStr( Obj,"[SO_NO]")
	local Ans = LuaS_DialogRePort_TwoChoose(Obj)
	if	Ans == "Yes"	then
		local Money = DW_AirLineMenu("InquiryCost",WDBNum,ZoneNum,PointNum)
		if ReadRoleValue( Obj,EM_RoleValue_Money ) < Money then
			ScriptMessage( Obj, Obj, 1, "[SAY_MOUTH_ERROR_A]", 0 ); 			--�A���W���������C
		else
			if AddRoleValue( Obj , EM_RoleValue_Money , -(Money) ) then			--���
					CastSpell( Obj , Obj , 491008 )					--��t
					sleep( 5 )
					DW_AirPointGoing(Obj,WDBNum,ZoneNum,PointNum)	--�����w�y��
			end
		end
	else
		return false 										--�S����ܩο�ܥ���
	end
end

function DW_AirLineCodeTrans(WDBNum,ZoneNum,PointNum,PointTurn)--���I�N�X��Ķ��
	return (ZoneNum*1000)+(WDBNum*100)+(PointNum*10)+PointTurn
end

function DW_SetAirLineHome()--�^�{�N�O��
	local Obj = OwnerID()
	local Target = TargetID()
	local Area = LuaS_111256_ZoneID( ReadRoleValue( Obj , EM_RoleValue_ZoneID ) )
	CloseSpeak(Obj)										--�������
	if Area > 99 or Area < 1 then
		ScriptMessage( Obj , Obj , 1 , "[SYS_TOUCH_TARGET_TOFAR]" , 0 )
		return
	end
	if	GetDistance(Obj,Target)>50	then
		ScriptMessage( Obj , Obj , 1 , "[SYS_TOUCH_TARGET_TOFAR]" , 0 )
		return
	end
	local IfSuccessSet = SaveHomePoint(Obj)
	if	IfSuccessSet==true	then
		CastSpell(Obj,Obj,491008)
		ScriptMessage( Obj, Obj, 2, "[SC_SETRECORDPOINT]", C_SYSTEM )
		ScriptMessage( Obj, Obj, 0, "[SC_SETRECORDPOINT]", 0 )
	else
		ScriptMessage( Obj, Obj, 2, "[ST_TRANSFER_FAIL]", C_SYSTEM )
		ScriptMessage( Obj, Obj, 0, "[ST_TRANSFER_FAIL]", 0 )
	end
end

function DW_AirPointInitSet()--���I��l�@���]�w
	local Obj = OwnerID()
	SetMinimapIcon ( Obj, 7 )				--�]�w�ǰe�I�p�a�Ϲϥ�
end