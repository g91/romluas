-- Index: 
-- FA_MoveRandEx�G�h�Ҧ��ƼƦ��H������
-- FA_MoveToTheMiddle�G�����󲾰ʨ���I��������m
-- FA_Loafing�G�U�ιC��
-- FA_StopLoafing�G����C��
-- FA_HideDead�GHide and dead
-- FA_Border�G�h�����ѥ��T��
-- FA_TwoChoose�G�O�Χ_ or �G��@ �i�a�Ѽƥi�M�w�d��ɶ���
-- FA_Dialog_Choose�G�h���ܮ�
-- FA_Call�G�S�O����CallPlot�A���T�{�B�@�A�̦n�ť�
-- FA_LookAround�G�x�Υ|�B�i��
-- FA_TurnRound�G�������i�M�w����180�צ^�Y�]������180�׷|�]��client��server���P�B�A����@�q�^
-- FA_MoveToPathStop�G�f�tMoveToPathPoint�A�H������
-- FA_MoveToPathGo�G�f�tMoveToPathPoint�A�H����
-- FA_DelBodyItemEX�G�⨭�W���~����Ϊ̯d�U�X��
-- FA_SetPosByObj�G��§�w�s�b��������t�~�@�Ӫ��󪺦�l�W
-- FA_GetHeight�G�^��a���W�]��a���I���I�^
-- FA_MoveToFlag�G���ʦܫ��w�X�l
-- FA_WaitMoveTo�G���������ɶ�����
-- FA_MoveToFlagDirect�G���MoveDirect��DW_MoveToFlag
-- FA_FaceFlagEX�GFaceFlag�[�j��
-- FA_SyncDir�G���Ӫ��󪺤�V�P�B
-- FA_AdjustDirEX�GAdjustDir�W�ť[�j��
-- FA_FlagSwitch�G��b���ȼҪ��]�Ψ�L�a��^���A���������X�ж}��
-- FA_FlagChange�G��b���ȼҪ��]�Ψ�L�a��^���A���������X�Х��}�A�Ϊ̧⥴�}���X������
-- FA_Busy�G�uXXX���b���L���v���T����ܡA���ݫإߦr��A��NPC���W��
-- FA_Say_NoOverlap�G��npc�W��A���@�y�ܡB�@�@�Ӱʧ@�]���^�B���@�q�ɶ��]�קKnpc���_�QĲ�o�ӳs�o��ܩΰʧ@�^
-- FA_SayAndWait�GFA_Say_NoOverlap���S������W�ꪺ�����A���P��ۦP�CForNoOverLap���ݭn��g
-- FA_CheckPlayer�G�P�t���t�X�A�ڦۤv�Ϊ��C�ݤ������Ф��n��
-- FA_CheckPlayerDel�G�P�t���t�X�A�ڦۤv�Ϊ��C�ݤ������Ф��n��


--------------------------------- FA_MoveRandEx ---------------------------------
--------------------------------- �h�Ҧ��ƼƦ��H������ ---------------------------------
-- �ק�ۤp����DW_MoveRand�]�榸���ʡ^
--ObjID		�Q�i�沾�ʪ�����
--RandRange	�Q�H�����ʪ��d��(���|)
--Time		�i�H��J�n���X���C
		-- �p�G��J"Loop"�A�h�i�JLoop�Ҧ��]�аȥ��f�tBeginPlot�ϥΡA�q����A�Τ@��I�s�^�C
		-- �b�����������W��508897�A�p�G��Buff�����h����B�@�C�]��CancelBuff(ObjID, 508897)����^
		-- ����L�a�j�餧�w�����I�A�p�G�B�@�W�L100����buff�̵M�s�b�A
		-- �|��DebugMsg �� FA_MoveRandEx ERROR! Walk over 100 times and no stop commend! �o�ӰT���X��
		-- �p�G�w�n���L�u�������L�a�j��A�Ч��J"InfiniteLoop"�A�����D�A���D�A�b�F���B�u�������n�A�_�h�кɶq���n�ϥΡC
		-- "InfiniteLoop"�Ҧ��U�̵M�|�P�_Buff�����N����C
-- Delay 	�C�����ʪ����Ԯɶ��A�]�w��0�h����w�I���|���A�|���W���ܲ��ʤ�V�A���@���]�����ơ^�C���=1/10��
-- RandDelay	��Delay�W�[��Rand�ȡA���QRand�N�d0�A�p�GDelay�O0�|�L���o��C
-- IfEnable	�O�_�n����MoveToFlagEnabled �w�]�O���A��1�]�O���A���L���N����
-- V1 V2 V3	�̭�����k�|�v�T�ϥΦ���H�����ʤ覡�]�����ݸɡA�Х��ۦ�Ѿ\�禡Code�^

function FA_MoveRandEx (ObjID, RandRange, Time, Delay, RandDelay, IfEnable, V1, V2, V3)
	local Counter = 0
	if CheckBuff(ObjID, 508897) == true then
		DebugMsg(0,0,"ERROR: FA_MoveRandEx is runing on" .. ObjID)
		return false
	end
	if	IfEnable == nil	then
		MoveToFlagEnabled(ObjID, false)
	elseif	IfEnable == 1	then
		MoveToFlagEnabled(ObjID, false)
	end
	local x,y,z,TempX,TempY,TempZ,NowX,NowZ
	if Time == "Loop" or Time == "InfiniteLoop" then
		AddBuff(ObjID, 508897, 0, -1)
	elseif type(Time) ~= "number" or Time < 1 then
		return false
	end
	if	V1 == nil	then
--�H�ۤv���y�нd���H������
		TempX = ReadRoleValue(ObjID,EM_RoleValue_X)
		TempY = ReadRoleValue(ObjID,EM_RoleValue_Y)
		TempZ = ReadRoleValue(ObjID,EM_RoleValue_Z)
	elseif	V3~=nil	then
--�H��J��xyz�y�в���
		TempX = V1
		TempY = V2
		TempZ = V3
--�H���w���󪺦�m�H������
	elseif	V2 ==nil	then
		TempX = ReadRoleValue(V1,EM_RoleValue_X)
		TempY = ReadRoleValue(V1,EM_RoleValue_Y)
		TempZ = ReadRoleValue(V1,EM_RoleValue_Z)
	else
--�H���J���X�Ц�m����
		TempX = GetMoveFlagValue(V1,V2,EM_RoleValue_X)
		TempY = GetMoveFlagValue(V1,V2,EM_RoleValue_Y)
		TempZ = GetMoveFlagValue(V1,V2,EM_RoleValue_Z)
	end
	if Time == "Loop" or Time == "InfiniteLoop" then
		while 1 do
			if Counter == 100  and CheckBuff(ObjID, 508897) == true and Time == "Loop" then
				DebugMsg(0,0,"FA_MoveRandEx ERROR! Walk over 100 times and no stop commend!")
				Counter = 0
				CancelBuff(ObjID, 508897)
				break
			end
			if CheckBuff(ObjID, 508897) == false then
				break
			elseif  Time == "Loop" then
				Counter = Counter + 1
			end
			for i=1,20,1 do
				NowX = ReadRoleValue(ObjID,EM_RoleValue_X)
				NowZ = ReadRoleValue(ObjID,EM_RoleValue_Z)
				x=TempX -(RandRange/2)+DW_Rand(RandRange)
				if x - NowX < 10 and x - NowX >=0 then
					x = NowX + 10
				elseif x - NowX > -10 and x - NowX  < 0 then
					x = NowX - 10
				end
				y=TempY
				z=TempZ -(RandRange/2)+DW_Rand(RandRange)
				if z - NowZ < 10 and z - NowZ >=0 then
					z = NowZ + 10
				elseif z - NowZ > -10 and z - NowZ  < 0 then
					z = NowZ - 10
				end
				y=GetHeight( x , y , z )
				if i == 20 then
					return false
				elseif	CheckLine( ObjID ,  x , y , z )==true or math.abs(y-TempY)<45 then
					break
				end
			end
			LuaFunc_WaitmoveTo( ObjID, x , y , z )
			if Delay ~= 0 and Delay ~= nil and Delay ~= -1 then
				If RandDelay ~= 0 and RandDelay ~= nil and RandDelay ~= -1 then
					Sleep(Delay + Rand(RandDelay) +10)
				else
					Sleep(Delay)
				end
			end
		end
	else
		for i = 1, Time do
			for i=1,10,1 do
				NowX = ReadRoleValue(ObjID,EM_RoleValue_X)
				NowZ = ReadRoleValue(ObjID,EM_RoleValue_Z)
				x=TempX -(RandRange/2)+DW_Rand(RandRange)
				if x - NowX < 10 and x - NowX >=0 then
					x = NowX + 10
				elseif x - NowX > -10 and x - NowX  < 0 then
					x = NowX - 10
				end
				y=TempY
				z=TempZ -(RandRange/2)+DW_Rand(RandRange)
				if z - NowZ < 10 and z - NowZ >=0 then
					z = NowZ + 10
				elseif z - NowZ > -10 and z - NowZ  < 0 then
					z = NowZ - 10
				end
				y=GetHeight( x , y , z )
				if i == 10 then
					return false
				elseif	CheckLine( ObjID ,  x , y , z )==true or math.abs(y-TempY)<45 then
					break
				end
			end
			LuaFunc_WaitmoveTo( ObjID, x , y , z )
		end
	end
	return true
end

--------------------------------- FA_MoveToTheMiddle ---------------------------------
--------------------------------- �����󲾰ʨ���I��������m ---------------------------------
-- ��ӰѦ��I�i�H�ۥѫ��w�y�СBFlag�Ϊ���C
-- ObjID	���沾�ʪ���H�C
-- ObjID1 / FlagNum1 / Z1 �� ObjID2 / FlagNum2 / Z2 ����k�G
	-- �e���@�լO A �I�A�᭱�@�լO B �I�A�ҿת����I�����Y����AB�I�������CAB�I�i���w���P�������Ѧ��I�C
	-- �Y�Ѧ��I������A�h�u�ݭn��J ObjID1 �� ObjID2
	-- �Y�Ѧ��I��Flag�A�h�g�J�X�l���s�ա]��Ʈw�s���^�� ObjID1 �� ObjID2 �ç�s���g�� FlagNum1 �� FlagNum2 ���C
	-- �Y�Ѧ��I���y�СA�h�g�JXYZ�ȹ�����J ObjID1 / FlagNum1 / Z1 �� ObjID2 / FlagNum2 / Z2  ��
	-- �A�S�Ψ쪺�ѼƴN��0
-- Range	�üƨM�w���ʨ�w�I���d��A���H���Яd�ũζ�s
-- Enable	0 �� ������MoveToFlag	1 �� ����MoveToFlag
-- CheckLine	�n���n�ˬd���I��m�O�_�P��Ѧ��I�����Z�q�L��

function FA_MoveToTheMiddle( ObjID , ObjID1 , FlagNum1 , Z1 , ObjID2 , FlagNum2, Z2 , Range , Enable )
	if Enable ~= nil	then
		if Enable == 1	then
			MoveToFlagEnabled( ObjID , false )
		end
	else
		MoveToFlagEnabled( ObjID , false )
	end
	return DW_WaitMoveTo( ObjID , FA_GotMiddle(ObjID1 , FlagNum1 , Z1 , ObjID2 , FlagNum2, Z2 , Range) )
end

--����������
--------------------------------- FA_Loafing ---------------------------------
--------------------------------- �U�ιC�� ---------------------------------
-- �� BeginPlot �� CallPlot �I�s�A�L�|�b�Ӫ���W�� 509084 �A�Ѱ� 509084 ����|�۰ʵ����A�ȥ��n�O�o�Ѱ����M�|�L���j��I
-- �]CancelBuff(ObjID, 509084)�^
-- ObjID	���ާ@�C��������
-- RndRange	�C����U�ذѦ��I���H���d��
-- StartFlag �@ EndFlag �O�o�ݭn�[�W StartFlagNum �@ EndFlagNum
-- StartFlag �� EndFlag �����g�h�H�ۨ�������I�̨Ӯ̥h
-- ��J StartFlag ����JEndFlag �h�|���� StartFlag �åB�H�䬰����I�̨Ӯ̥h�A�p�G�sStartFlagNum���S�g�h�w�]���s��001
-- ��J StartFlag �P EndFlag �h�ݭn�t�X Mode �M�w�欰�Ҧ�
	-- Mode = 0�]�Τ���^
		-- ������ StartFlag �A�M��b StartFlag �@ EndFlag �����I�Ӧ^�C��
	-- Mode = 1
		-- ������ StartFlag �A�M��q StartFlag �� StartFlagNum �u�ۺX�нs���@�����̧Ǩ��� EndFlagNum�]����EndFlag�^
	-- Mode = 2
		--������ StartFlag �A�M���H���D StartFlag �� StartFlagNum �� EndFlagNum �����s�����X�жè��]����EndFlag�^


function FA_Loafing(ObjID,RndRange,Wait,StartFlag,StartFlagNum,EndFlag,EndFlagNum,Mode)
	AddBuff(ObjID, 509084, 0, -1)
	while CheckBuff(ObjID,509084) == true do
		if StartFlag == nil then
		elseif EndFlagNum ~= nil then
			if Mode == 0 or Mode == nil then
				FA_MoveToFlag(ObjID,StartFlag,StartFlagNum,RndRange,1,1)
				Sleep(Wait)
				if CheckBuff(ObjID,509084) == false then break end
				FA_MoveToFlag(ObjID,EndFlag,EndFlagNum,RndRange,1,1)
				Sleep(Wait)
			end
		end
	end
end


--------------------------------- FA_StopLoafing ---------------------------------
--------------------------------- ����C�� ---------------------------------
-- Mode = 1 ��NPC����í��V FaceWho ���w����H
function FA_StopLoafing(ObjID,Mode,FaceWho)
	CancelBuff(ObjID,509084)
	if Mode == 1 then
		StopMove(ObjID,true)
		AdjustFaceDir( ObjID, FaceWho, 0 )
	end
end

-- Hide and dead
-- WhoKill �w�]�P ObjID�A�i�t�~���w
function FA_HideDead(ObjID,WhoKill)
	WhoKill = WhoKill or ObjID
	Hide(ObjID)
	Sleep(10)
	NPCDead(ObjID,WhoKill)
end

--------------------------------- FA_Border ---------------------------------
--------------------------------- �h�����ѥ��T�� ---------------------------------
-- WHO �g�}�ѥ����H�A�p OwnerID()
-- �u�nPages�ΰ}�C�뺡�r���i�h�N�O�h���ѥ��C
-- �p�G�A�u�n�歶�A���N�ǳ�ª��r��i�h�N�n�C
-- Title �g�ѥ��]�۸O�����^�����D�Ϊ��r��A���g�N�O���~�W��
-- �p�G�ݭn��Flag�A�i�����ǤJFlagID

function FA_Border( WHO, Pages, Title, FlagID )

	WHO = WHO or OwnerID()

	Title = Title or "["..GetUseItemGUID(OwnerID()).."]"

	ClearBorder( WHO )	--��l�ƥ۸O����
	if Type(Title) ~= "string" or (Type(Pages) ~= "table" and Type(Pages) ~= "string")then
		DebugMsg(0,0,"FA_Border ERROR�G Wrong Arg.")
		return FALSE
	end
	if Type(Pages) == "table" then
		for i = 1 , table.getn(Pages)	do
			AddBorderPage( WHO , Pages[i])
		end
	else
		AddBorderPage( WHO , Pages )
	end
	ShowBorder( WHO , 0, Title, "ScriptBorder_Texture_Paper" )
	if FlagID ~= nil then SetFlag(WHO,FlagID,1) end
end

--------------------------------- FA_TwoChoose ---------------------------------
--------------------------------- �O�Χ_ or �G��@ �i�a�Ѽƥi�M�w�d��ɶ��� ---------------------------------
-- �ק�ۤp���� DW_ChooseOneFromTwo
-- �G�ܨt�μҪ���� ks_DialogRePort_TwoChoose
-- �[�J�F�i�H��Y/N�ǤJ�Ѽƪ������A�i�H�۩w�ǤJ�@�ӰѼơA��m�O�ؼШ�ƪ��Ĥ@�ӰѼơC
-- �p�G�A�ݭn�ǤJ�ܦh�ѼơA�Шϥ� Array
-- YesFuncArg	�� YesFunc ���ǤJ��
-- NoFuncArg	�� NoFunc ���ǤJ��
-- Range	���ʦh���N���ġA�w�]��100�X�]�i�]�w�d��G50��250�X�A�W�L���d��|�Q�]�w��50�^
-- Time		��m�Ӥ[�N���ġA�w�]��30��]�i�]�w�d��G5��60��A�W�L���d��|�Q�]�w��30�^
-- �쥻�������S�����쪺�G
-- �L�|��ChooserID ��i YesFunc �� NoFunc �̭��A�ڧ�o�ө�b�u�ĤG�ӶǤJ�ȡv
-- �p�G�A�ݭn�o�ӶǤJ�ȡA�Щ��ӶǤJ�Ѽƨӱ�
-- �U���O��l�禡 DW_ChooseOneFromTwo �쥻������
--
--�W�ֳt�t�ο�ܮز��ͼҪ��I�I ��ܬO�Χ_�i�U�۰���@�Ө禡
--ĵ�i�I��function��ChooserID�����񪱮a��ID
--MsgString �t�ΰT���ؤ��e
--YesFunc ��ܡu�O�v�bOwnerID()�W���檺
--NoFunc ��ܡu�_�v�bOwnerID()�W���檺
--YesOption �O���ﶵ�r��A�i���� �w�]���u�O�v
--NoOption �_���ﶵ�r��A�i����  �w�]���u�_�v


function FA_TwoChoose(ChooserID,MsgString,YesFunc,NoFunc,YesFuncArg,NoFuncArg,YesOption,NoOption,Range,Time)
	Range = Range or 100
--���b�ˬd�G������
--	if	NoFunc == nil	then
--DeBugMSG(0,0,"FA_TwoChoose Error: NoFunc == nil")
--		return
--	end
	if	type(MsgString)~="string"	then
DeBugMSG(0,0,"FA_TwoChoose Error: MsgString ~= string")
		return
	end
	DialogCreate( ChooserID,EM_LuaDialogType_YesNo,MsgString)
--�i�ٲ�
	if	YesOption == nil	then
		DialogSelectStr( ChooserID , "[SO_YES]" )
	else
		DialogSelectStr( ChooserID , YesOption );
	end
	if	NoOption == nil	then
		DialogSelectStr( ChooserID , "[SO_NO]" );
	else
		DialogSelectStr( ChooserID , NoOption );
	end
	DeBugMSG(0,0,"FA_TwoChoose is Done")
--���ݭ˼�
	local result = ks_DialogRePort_TwoChoose(ChooserID,Range,Time)
	if	result == "Yes" and YesFunc ~= "" and YesFunc ~= nil then
		CallPlot(OwnerID(),YesFunc,YesFuncArg,ChooserID)
	end
	if	result == "No" and NoFunc ~= "" and NoFunc ~= nil then
		CallPlot(OwnerID(),NoFunc,NoFuncArg,ChooserID)
	end
end


--------------------------------- FA_Dialog_Choose ---------------------------------
--------------------------------- �h���ܮ� ---------------------------------
-- Who			�}��ܮت����a�s���A�����D�n�gԣ�N OwnerID() �� TargetID() �ոաC
--			�w�] OwnerID()
-- Text			���}����r���e
-- Option		�ﶵ�A�е��@�ӤG��Table�g�J�ﶵ��r�PFunc�A�d�ҡG
--
--	local Option = {	{ "[SC_OPTION_01]",	function ()
--								Say(OwnerID(), 1 )
--							end				},
--
--				{ "[SC_OPTION_02]",	function ()
--								Say(OwnerID(), 2 )
--							end				},
--
--				{ "[SC_OPTION_03]",	function ()
--								Say(OwnerID(), 3 )
--							end				}	}
--
--			�e���O�ﶵ���r�A�᭱�O�I�ﶵ�|�]��Script�C
--			�o�˷Pı�g�A�M���ŧi���j���i�o��N�n�C
--			�ݤ������c���u�n�⤤��02�����Ӥ��_�ƻs���A�n���q���b�����A��r���function���e�A�N�i�H�ΤF�C
--
-- TimeLimit		�ɶ�����A���a�h�[�S�����N�۰ʶK�ߦa���L�����C�w�]600��C
--			�g -1 �� 0 �� FALSE �̵L�ɶ�����]���A���t��j�A�V�Ρ^
-- IfExit		�K�ߦa���z�[�W���}�ﶵ�A�w�]���S���A���w 1 �� TRUE �N���C
-- TimeOutMsg		�O�ɦ۰������ت��t�ΰT��
-- TimeOutMsgColor	�W�����t�ΰT�����C��A�w�]������
-- TimeOutMsgPos	0 = ���U��ܮ���ܡ]�w�]�A�S�g�ζüg���o�ӡ^
--			1 = ����ĵ�i�T�����
--			2 = �G�̬����
-- WhenEsc		�Y�O���X��ܮئӫD��ܿﶵ�]�]�A�u���}�v�ﶵ�^�h���榹�B�C
--			�ǤJFunction�W�]String�^�Ϊ����Ǥ@��Function�C
-- WhenEscArg		�i�H��@�ӶǤJ�ȵ��W����Function�]����String�A�A�p�G�n��Func���ܦۤv�g�N�n�F�^

function FA_Dialog_Choose( Who, Text, Option, TimeLimit, IfExit, NotLevelOne, TimeOutMsg, TimeOutMsgColor, TimeOutMsgPos, WhenEsc, WhenEscArg)

	TimeOutMsgColor = TimeOutMsgColor or C_Red
	TimeLimit = TimeLimit or 600
	Who = Who or OwnerID()

	local Exit =	{function ()
				DialogClose( Who )
				if Type(WhenEsc) == "string" then
					CallPlot( Who, WhenEsc, WhenEscArg)
				elseif Type(WhenEsc) == "function" then
					WhenEsc()
				end
				return FALSE
			end}

	if Type(Option) == "function" then
		Option = {Option}
	elseif	Option == nil or Option == 0 then
		Option = {}
	elseif Type(Option) ~= "table" then
		DebugMsg ( 0, 0, "FA_Dialog_Choose ERROR: Arg = Option got a wrong value!" )
		DebugMsg ( 0, 0, "FA_Dialog_Choose ERROR: Arg Type = "..Type(Option) )
		return FALSE
	end

	if IfExit == 1 or IfExit == TRUE then
		table.insert( Option, { "[SO_EXIT]", Exit[1] } )
	end

	local Time = 0
	local Step = 0
	local DialogStatus = 0
	local OptionNum = table.getn(Option)

	if NotLevelOne ~= 1 then
		DialogClose( Who )
	end
--	Sleep(1)	-- ��������ߧY����
	DialogCreate( Who , EM_LuaDialogType_Select , Text )   -- �A�Q�h����?

	if Option ~= {} then
		for i = 1 , OptionNum do

	 		DialogSelectStr( Who , Option[i][1] )

		end
	end

	if ( DialogSendOpen( Who ) == false )  then  --���ϥο��~�A�^�ǿ��~�T��

		ScriptMessage ( Who , Who , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 ) 

		return FALSE
	end

	if Option == nil and (IfExit == 1 or IfExit == TRUE) then return TRUE end

	while 1 do

		DialogStatus = DialogGetResult( Who )  --�ˬd�ϥΪ̿��������

	 	if Time > TimeLimit and TimeLimit ~= -1 and TimeLimit ~= 0 then  -- Timeout�A������ܵ���
			Time = Time + 1

			if TimeOutMsg ~= nil and TimeOutMsg ~= 0 then
				if TimeOutMsgPos == 1 then
					ScriptMessage( Who , Who , 1 , TimeOutMsg , TimeOutMsgColor )	-- �O�ɮɵ����a���T��
				elseif TimeOutMsgPos == 2 then
					ScriptMessage( Who , Who , 0 , TimeOutMsg , TimeOutMsgColor )
					ScriptMessage( Who , Who , 1 , TimeOutMsg , TimeOutMsgColor )
				else
					ScriptMessage( Who , Who , 0 , TimeOutMsg , TimeOutMsgColor )
				end
			end

			return Exit[1]()
		end

		if DialogStatus == -1
		or ( (IfExit == 1 or IfExit == TRUE) and DialogStatus == OptionNum - 1 ) then -- �Q�� x ���������_

			return Exit[1]()
		end



		if DialogStatus ~= -2 then	-- -2 = ��l��

			if NotLevelOne ~= 1 then
				DialogClose( Who )
			end
			Option[DialogStatus+1][2]()
			Step = 1
		end

		if Step == 1 then
			break
		end

		sleep(1)

	end
	return DialogStatus
end


-- FA_Call
-- �S�O����CallPlot�A���T�{�B�@�A�̦n�ť�

function FA_Call(GitemID,Func,ArgArray,Timer)
	Timer = Timer or 1
	local RandTemp
	if G_FA_Call == nil then G_FA_Call = {} end
	repeat
		RandTemp = FA_Rand("10")
	until G_FA_Call[RandTemp] == nil
	G_FA_Call[RandTemp] = TRUE
	callplot(GitemID,Func,RandTemp,ArgArray)
	repeat
		sleep(Timer)
	until G_FA_Call[RandTemp] == nil
end


--------------------------------- FA_LookAround ---------------------------------
--------------------------------- �x�Υ|�B�i�� ---------------------------------
-- Who =	�֭n���k�i��
-- Mode = 0	���k�i��]�������k�H���^�]�w�]�^
-- Mode = 1	���k�ᥪ�i��
-- Mode = 2	������k�i��
-- WaitLR :	���k�i�涡������ɶ��A�w�]1.5��C
-- Back = 1	�M��|�ݭI��C���g�ζüg�N���|�C
-- Back = 2	��ݭI�᪺�ʧ@����̫e���A�̦��O���k�i��A�M����^�ӡ]Reset=2,3���]�w�|���ġA�^�Y��V�|�Q�T�w�����V�^
-- WaitB :	���I��e������ɶ��A�w�]1.5��C
-- Reset = 1	�̫�|��^�����A���g�ζüg���ܥL�N���|��^�����]��^��������V�H���^
-- Reset = 2	��������^����
-- Reset = 3	�f������^����
-- WaitR :	��^�����e������ɶ��A�w�]1.5��C
function FA_LookAround(Who,Mode,WaitLR,Back,WaitB,Reset,WaitR)
	local LR = {1,-1}
	local ResetYN = {[0]=0,[1]=1,[2]=1,[3]=1,}
	WaitLR = WaitLR or 15
	WaitB = WaitB or 15
	WaitR = WaitR or 15
	if Back == 2 then
		Sleep(WaitB)
		FA_TurnRound(Who)
		FA_LookAround(Who,Mode,WaitLR,ResetYN[Reset],WaitR)
		return
	end
	if Mode ~= 1 and Mode ~= 2 then
		Mode = RandRange(1,2)
	end
	AdjustDir(Who, 90 * LR[Mode] )
	Sleep(WaitLR)
	FA_TurnRound(Who, LR[Mode] * -1)
	if Back == 1 then
		Sleep(WaitB)
		AdjustDir(Who, -90 * LR[Mode] )
	end
	if Reset == 1 then
		Sleep(WaitR)
		FA_TurnRound(Who)
	elseif Reset == 2 or Reset == 3 then
		Sleep(WaitR)
		FA_TurnRound(Who, LR[Reset - 1] )
	end
end

-- �������i�M�w����180�צ^�Y�]������180�׷|�]��client��server���P�B�A����@�q�^
function FA_TurnRound(Who,LR)
	local SetLR = {1,-1, [-1] = -1 }
	Who = Who or OwnerID()
	LR = LR or RandRange(1,2)
	AdjustDir(Who, 90 * SetLR[LR] )
	Sleep(1)
	AdjustDir(Who, 90 * SetLR[LR] )
end


-- �� �P ��
-- �f�tMoveToPathPoint
-- StopMove�p�G�S�g���T��boolen�Ϊ̳��S�g�A�w�]false
function FA_MoveToPathStop(ObjID,StopMoveArg)
	StopMoveArg = StopMoveArg or false
	MoveToFlagEnabled(ObjID,false)
	StopMove(ObjID,StopMoveArg)
end

function FA_MoveToPathGo(ObjID)
	MoveToFlagEnabled(ObjID,true)
end

--------------------------------- FA_DelBodyItemEX ---------------------------------
--------------------------------- �⨭�W���~����Ϊ̯d�U�X�� ---------------------------------
-- Who : �q�֨��W��
-- ItemID : �夰��F��
-- LastNum : �d�X��
-- �`�N�G�p�G��ofunction���b���~�ۤv�A�Ҧp�����~200000�U�����ϥμ@���A�M���ۤv200000���ܡA�|�L�ġC
-- �]�����~�ϥήɵL�kCount��ۤv���q�C
function FA_DelBodyItemEX(Who,ItemID,LastNum)
	LastNum = LastNum or 0
	if LastNum >= CountBodyItem(Who,ItemID) then return end
	DelBodyItem(Who,ItemID, (CountBodyItem(Who,ItemID) - LastNum))
end

--------------------------------- FA_SetPosByObj ---------------------------------
--------------------------------- ��§�w�s�b��������t�~�@�Ӫ��󪺦�l�W ---------------------------------
-- ObjID	= �n�Q���s�w�쪺����
-- TargetID	= ���s�w���I���ѦҪ���
-- �]�N�O��ObjID�o�F��|�Q���TargetID���}�U�C
-- �S�g�Ȯɪ��w�]�ȡG
--	ObjID = TargetID()	�]��n�Q���s�w�쪺����]�w������ؼС^
--	TargetID = OwnerID()	�]��w��ؼг]�w������Plot���H�^
-- �C������������Pcall�i�ΡA�i�H��F��Ԩ�ۤv�}�U�C�ϥΤ�k�G
-- /gm ? pcall FA_SetPosByObj( �n�Ԩ�ۤv�}�U���F�誺GUID )
-- �]�`�N���O��Ʈw�s���A�OGUID�^
function FA_SetPosByObj(ObjID, TargetID)
	ObjID = ObjID or TargetID()
	TargetID = TargetID or OwnerID()
	if ObjID == nil or TargetID == nil then
		DebugMsg(0,0,"FA_SetPosByObj ERROR! Cant get ObjID")
	end
	SetPos(ObjID,kg_GetPos(TargetID))
end

-- �^��a���W�]��a���I���I�^

function FA_GetHeight (ObjID)
	ObjID = ObjID or OwnerID()
	local Pos = {kg_GetPos(ObjID)}
	Pos[2] = GetHeight(Pos[1],Pos[2],Pos[3])
	setpos( ObjID , Pos[1],Pos[2],Pos[3],Pos[4] )
end

--------------------���ʦܫ��w�X�l----------------------------------
--ObjID ���沾�ʪ���H
--FlagObjID �X�l����Ʈw�s��
--FlagID �X�l�s��
--Range �üƨM�w���ʨ�w�I���d��
--Enable  0�A������movotoflag   1�A����movetoflag�A����J�F��w�]��1
function FA_MoveToFlag( ObjID , FlagObjID , FlagID,Range , Enable ,IfLoafing)
	if Enable == nil or Enable == 1 then
		MoveToFlagEnabled( ObjID , false )
	end
 	local X , Y , Z
	X = GetMoveFlagValue( FlagObjID , FlagID , EM_RoleValue_X )
	Y = GetMoveFlagValue( FlagObjID , FlagID , EM_RoleValue_Y )
	Z = GetMoveFlagValue( FlagObjID , FlagID , EM_RoleValue_Z )

	X = X + Rand( Range) * 2 - Range + 1
	Z = Z + Rand( Range) * 2 - Range + 1

	if IfLoafing == 1 then
		return FA_WaitMoveTo( ObjID , X , Y  , Z , 1)
	end
	return FA_WaitMoveTo( ObjID , X , Y  , Z )
end

function FA_WaitMoveTo( ObjID, X, Y, Z, IfLoafing )
	local Obj = Role:new( ObjID )
	local LastX = 0
	local LastZ = 0
	local NowX,NowZ
	local DW = 0
	if X == 0 and Z == 0 then
		DeBugLog( 6 , ObjID.." Will Move To 0 , Y , 0 ")
	end
	local Time = Obj:Move(  X , Y ,Z  )
	if	Time ==nil	then
		Time = 1200
	else
		Time = (Time +600*5)/10
	end
	local Count = 0
	while 1 do
		for i = 0 , 60 , 1 do
			if IfLoafing == 1 and CheckBuff(ObjID,509084) == false then
				return true
			end
			NowX = Obj:X()
			NowZ = Obj:Z()

			if Abs( NowX - X ) < 10 and Abs( NowZ - Z ) < 10 then
				return true
			end

			if	(LastX == NowX 	and LastZ == NowZ) and
				ReadRoleValue(ObjID,EM_RoleValue_IsAttackMode)==0	then
				DW = DW + 1
				Obj:Move(  X , Y ,Z  )
			else
				DW = 0
			end

			if	DW >100	then
				return true
			end

			LastX = NowX
			LastZ = NowZ
			Sleep( 10 )
			Count = Count + 1
			if	Count > Time	then
				DeBugLog( 6 , ObjID.." Long Time to Move ! ")
				SetPos(ObjID ,X,Y,Z,Obj:Dir())
				return true
			end
		end
	end
	return false
end




--------------------------------- FA_MoveToFlagDirect ---------------------------------
--------------------------------- ���MoveDirect��DW_MoveToFlag ---------------------------------
-- ��DW_MoveToFlag �令��MoveDirect �]���F�i�H�ϥ�StopMove�^
--ObjID ���沾�ʪ���H
--FlagObjID �X�l����Ʈw�s��
--FlagID �X�l�s��
--Range �üƨM�w���ʨ�w�I���d��
--Enable  0�A������movotoflag   1�A����movetoflag

function FA_MoveToFlagDirect( ObjID , FlagObjID , FlagID,Range , Enable  )
	if	Enable ~= nil	then
		if	Enable == 1	then
			MoveToFlagEnabled( ObjID , false )
		end
	else
		MoveToFlagEnabled( ObjID , false )
	end
 	local X , Y , Z
	X = GetMoveFlagValue( FlagObjID , FlagID , EM_RoleValue_X )
	Y = GetMoveFlagValue( FlagObjID , FlagID , EM_RoleValue_Y )
	Z = GetMoveFlagValue( FlagObjID , FlagID , EM_RoleValue_Z )

	X = X + Rand( Range) * 2 - Range + 1
	Z = Z + Rand( Range) * 2 - Range + 1

	return MoveDirect( ObjID , X , Y  , Z )
end

--------------------------------- FA_FaceFlagEX ---------------------------------
--------------------------------- FaceFlag�[�j�� ---------------------------------
-- �쥻��FaceFlag�ݭn�h�[�@��AdjustDir�A���ʥ]�_�ӡA�J�M�n�]�N�h�[�W�@�I�\��C
-- FlagID�G	Flag�s�ժ��N���]��Ʈw�s���^
-- FlagNum�G	Flag�Ӱ����s��
-- Angle�G	�h�઺��V�A�p�A���V�Ѧ�Npc���k���������30�״N�b�o��J30�A�f����40�N-40�C�d��-180~-180�^
-- RandAdd�G	�b�h�઺��V�W�h�@��RandAdd�A�е����ơA���M�|�Q�ܦ����ơC
-- Angle �� Rand �ѼƨS�Ψ�i�H���n�g�C
-- �|�Ǧ^��V����Dir�ȡC

function FA_FaceFlagEX(ObjID, FlagID , FlagNum ,Angle ,RandAdd)
	RandAdd = RandAdd or 0
	RandAdd = math.abs(RandAdd)
	Angle = Angle or 0
--	if math.abs(Angle + RandAdd) > 180 then
--		DebugMsg(0,0,"FA_FaceFlagEX ERROR: Angel + Rand > 180 or < -180!")
--	end
	FaceFlag ( ObjID, FlagID , FlagNum )
	if RandRange(0,1) == 0 then
		AdjustDir(ObjID,Angle+RandRange(0,RandAdd))
	else
		AdjustDir(ObjID,Angle-RandRange(0,RandAdd))
	end
	return ReadRoleValue(ObjID,EM_RoleValue_Dir)
end


-- FA_SyncDir
-- ���Ӫ��󪺤�V�P�B

function FA_SyncDir( ObjID, TargetID, Angle )

	ObjID = ObjID or OwnerID()
	TargetID = TargetID or TargetID()
	Angle = Angle or 0

	SetDir( ObjID, ReadRoleValue( TargetID , EM_RoleValue_Dir ) + Angle )

end

--------------------------------- FA_AdjustDirEX ---------------------------------
--------------------------------- AdjustDir�W�ť[�j�� ---------------------------------
-- Mode�G	���檺�Ҧ��A���U���T�ؼҦ��A�ϥΥN�X�p�U�G
--		 ---- �j�p�g�L�ҿ� ----
--		 "xyz"�� "X" �� "0"	���w�����V�y��
--		"Obj" �� "O" �� "1"	���w�����V����
--		 "Flag" �� "F" �� "2"	���w�����V�X��
-- ���V�y�СG	�b Var1 �� Var2 �̧Ǽg�W x �� z�]���� y �^�C
--		Var3�i�H��J�n�h�઺��V�A�p�A���V�Ѧ�Npc���k���������30�״N�b�o��J30�A�f����40�N-40�C�d��-180~-180�C
-- 		Var4�i�H�b�h�઺��V�W�h�@��Rand�A�е����ơA���M�|�Q�ܦ����ơCAngle+Rand������Ȥ��i�W�L180�C
--		�Ҧp�AAngle = 30�ARand = 5���ܡA�|�ܦ�25~35�������H�����סC
-- ���V����G	�b Var1 �g�W����ID�AVar2�i�H��J�n�h�઺��V�AVar3�i�H���@��Rand�ȡA�Ϊk�p�W�C
-- ���V�X�СG	�b Var1 �� Var2 �̧Ǽg�W�X�иs�N���]��Ʈw�s���^�P�X�нs���CVar3��Var4�p�W�C
-- �᭱���ѼƨS�Ψ�i�H���n�g�C
-- �|�Ǧ^��V����Dir�ȡC

function FA_AdjustDirEX(ObjID,Mode,Var1,Var2,Var3,Var4)
	if Type(Mode) ~= "string" then
		DebugMsg(0,0,"FA_AdjustDirEX ERROR: Please input point's type!")
		return false
	else
		Mode = string.lower(Mode)
	end
	if Var2 == nil then
		Var2 = 0
	end
	if Var3 == nil then
		Var3 = 0
	end
	if Var4 == nil then
		Var4 = 0
	end
	if Mode == "xyz" or "x" or "0" then
		if math.abs(Var3 + Var4) > 180 then
			DebugMsg(0,0,"FA_AdjustDirEX ERROR: Angel + Rand > 180 or < -180!")
		end
		if RandRange(0,1) == 0 then
			AdjustDir(ObjID,CalDir(ReadRoleValue(ObjID,EM_RoleValue_X)-Var1,ReadRoleValue(ObjID,EM_RoleValue_Z)-Var2)+Var3+RandRange(0,Var4))
		else
			AdjustDir(ObjID,CalDir(ReadRoleValue(ObjID,EM_RoleValue_X)-Var1,ReadRoleValue(ObjID,EM_RoleValue_Z)-Var2)+Var3-RandRange(0,Var4))
		end
	elseif Mode == "obj" or "o" or "1" then
		if math.abs(Var2 + Var3) > 180 then
			DebugMsg(0,0,"FA_AdjustDirEX ERROR: Angel + Rand > 180 or < -180!")
		end
		if RandRange(0,1) == 0 then
			AdjustFaceDir(ObjID,Var1,Var2+RandRange(0,Var3))
		else
			AdjustFaceDir(ObjID,Var1,Var2-RandRange(0,Var3))
		end
		
	elseif Mode == "flag" or "f" or "2" then
		if math.abs(Var3 + Var4) > 180 then
			DebugMsg(0,0,"FA_AdjustDirEX ERROR: Angel + Rand > 180 or < -180!")
		end
		FA_FaceFlagEX(ObjID, Var1 , Var2 ,Var3 ,Var4)
	end
	return ReadRoleValue(ObjID,EM_RoleValue_Dir)
end

function FA_FlagSwitch(FlagID, TF, IsOwner)
	local Player
	if IsOwner == 1 or true then
		Player = OwnerID()
	else
		Player = TargetID()
	end
	if TF == 0 or TF == 1 then
		SetFlag ( Player , FlagID , TF)
	else
		DebugMsg (0,0,"FA_FlagSwitch ERROR: T/F arg is wrong! Check your func!")
	end
end

function FA_FlagChange(FlagID, IsOwner)
	local Player
	if IsOwner == 1 or true then
		Player = OwnerID()
	else
		Player = TargetID()
	end
	if CheckFlag(Player, FlagID) then
		SetFlag ( Player , FlagID , 0)
	else
		SetFlag ( Player , FlagID , 1)
	end
end

-- ���Ϋإߦr�ꪺnpc���L�T��
-- �|��ܦ��uXXX���b���L��...�v�AXXX��NPC���W�r
-- Player ���ǰT�ؼ� �gnil���ܦ۰��ܦ�OwnerID()
-- NPCOrgID �� ��NPC����Ʈw�s���A����
-- Mode = 1 
function FA_Busy(Player, NPCOrgID, Mode, Str, Color )
	if Player ~= nil and NPCOrgID == nil then
		Player, NPCOrgID = NPCOrgID, Player
	end

	Player = Player or OwnerID()
	Mode = Mode or -1
	Str = Str or "[SAY_NPC_BUSY_02]"
	Color = Color or C_Red

	if Mode == 0 or Mode == -1 then
		ScriptMessage(Player,Player,0,Str.."[$SETVAR1="..NPCOrgID.."]", Color)
	end
	if Mode == 1 or Mode == -1 then
		ScriptMessage(Player,Player,1,Str.."[$SETVAR1="..NPCOrgID.."]", Color)
	end
end

-- ��npc�W��A���@�y�ܡB�@�@�Ӱʧ@�]���^�B���@�q�ɶ��]�קKnpc���_�QĲ�o�ӳs�o��ܩΰʧ@�^
-- �o�q�ɶ����|�Q����Ĳ�o�A�M�ᵥ�쵥�Ԯɶ��L�~����
-- Dialog Npc������
-- Time �����ɶ�
-- IsNpcSay ����O���O��NPCSay�A���O���ܽЯd�ũμgnil
-- Motion �i�H�g�ʧ@�A�|�b���ܪ��P�ɧ@�ʧ@�A���n�N�d��
function FA_Say_NoOverlap(ObjID, Dialog, Time, IsNpcsay, Motion )
	if not CheckBuff(ObjID, 620264) then
		CallPlot(ObjID, "FA_SayAndWait", ObjID, Dialog, Time, IsNpcsay, Motion, true)
	end
end

-- FA_Say_NoOverlap���S������W�ꪺ�����A���P��ۦP�CForNoOverLap���ݭn��g
function FA_SayAndWait(ObjID, Dialog, Time, IsNpcsay, Motion, ForNoOverLap)
	if Motion ~= nil then PlayMotion(ObjID, Motion) end
	if IsNpcsay == nil then
		Say(ObjID, Dialog)
	else
		NpcSay(ObjID, Dialog)
	end
	Sleep(Time)
	if ForNoOverLap ~= nil or ForNoOverLap ~= false then CancelBuff(ObjID, 620264) end
end


-- �P�t���t�X�A�ڦۤv�Ϊ��C�ݤ������Ф��n��
function FA_CheckPlayer( Player, QuestID, FinishFlag, ResetNPC, ResetNPCColumn, Buff, CheckPoint, FlagNum, Range, CancelFunc )
	local Controller = OwnerID()
	local CheckDis = true

	Range = nil or 150

	repeat
		if 	CheckID(Player)==false	 then
			CallPlot(Controller, CancelFunc, Player, 1, QuestID,  ResetNPC, ResetNPCColumn)
		end
		if CheckPoint ~= nil then
			if FlagNum == nil then
				CheckDis = CheckDistance(CheckPoint, Player, Range)
			else
				CheckDis = DW_CheckDis(Player, MoveFlag, FlagNum, Range)
			end
		end
		if 	CheckBuff(Player, Buff)==false or
			CheckAcceptQuest(Player, QuestID)==false or
			CheckDis==false then
			CallPlot(Controller, CancelFunc, Player, 2, ResetNPC, ResetNPCColumn)
			return
		end
		Sleep(20)
	until CheckFlag(Player, FinishFlag)
end

-- �P�t���t�X�A�ڦۤv�Ϊ��C�ݤ������Ф��n��
function FA_CheckPlayerDel( Player, Mode, ResetNPC, ResetNPCColumn, DelFlag, DelObjs, DelBuff, DelItem)
	local Controller = OwnerID()
	local DelObjList

	if	Type(DelFlag) ~= "table" 	then
		DelFlag = {DelFlag}
	end
	if	Type(DelObjs) ~= "table" 	then
		DelObjs = {DelObjs}
	end
	if	Type(DelBuff) ~= "table" 	then
		DelBuff = {DelBuff}
	end
	if	Type(DelItem) ~= "table" 	then
		DelItem = {DelItem}
	end

	if ResetNPC ~= nil	then
		WriteRoleValue(ResetNPC, ResetNPCColumn, 0)
	end
	if Mode == 2 then
		if DelFlag[1] ~= nil 	then
			for i = 1, table.getn(DelFlag) do
				SetFlag(Player, DelFlag[i], 0)
			end
		end
		if DelBuff[1] ~= nil	then
			for i = 1, table.getn(DelBuff) do
				CancelBuff(Player, DelBuff[i])
			end
		end
		if DelItem[1] ~= nil	 then
			for i = 1, table.getn(DelItem) do
				DelBodyItem(Player, DelItem[i], CountBodyItem(Player, DelItem[i])) 
			end 
		end
	end
	if DelObjs[1] ~= nil then
		for i = 1, table.getn(DelObjs) do
			DelObjList = FA_SearchNPC( Controller, nil, DelObjs[i])
			if Type(DelObjList) == "table" then
				for j = 1, table.getn(DelObjList) do
					DelObj(DelObjList[j])
				end
			elseif DelObjList ~= nil then
				DelObj(DelObjList)
			end
		end
	end
end