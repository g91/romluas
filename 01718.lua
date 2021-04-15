--------------���ȼҦ��G���Q���a�o�{�����p�U�ֳt�����@���Ǫ�-------------
--Killer ��C����id �Y��0�h����OwnerID() ��1�h����TargetID()  
--DeaderID ��n��������Ʈw�s�� ����Ǫ�npc
function DW_QietKillOne(Killer,DeaderID)
	if	Killer ==nil	then	return false	end
	if	DeaderID==nil	then	return false	end
	if	Killer == 0	then
		local Die = Lua_DW_CreateObj("obj",DeaderID,OwnerID(),0)
		SetFlag(Die,544801,1)
		SetModeEx(Die,EM_SetModeType_Show,false) 
		Lua_ObjDontTouch(Die)
		WriteRoleValue(Die ,EM_RoleValue_LiveTime,1)
		AddToPartition(Die,ReadRoleValue(OwnerID(),EM_RoleValue_RoomID))
		KillID(OwnerID(),Die)
--		DelObj(Die)
		return
	end
	if	Killer == 1	then
		local Die = Lua_DW_CreateObj("obj",DeaderID,TargetID(),0)
		SetFlag(Die,544801,1)
		SetModeEx(Die,EM_SetModeType_Show,false) 
		Lua_ObjDontTouch(Die)
		WriteRoleValue(Die ,EM_RoleValue_LiveTime,1)
		AddToPartition(Die,ReadRoleValue(TargetID(),EM_RoleValue_RoomID))
		KillID(TargetID(),Die)
--		DelObj(Die)
		return
	else
		if	CheckID(Killer)==false	then
			return false
		end
		local Die = Lua_DW_CreateObj("obj",DeaderID,Killer,0)
		SetFlag(Die,544801,1)
		SetModeEx(Die,EM_SetModeType_Show,false) 
		Lua_ObjDontTouch(Die)
		WriteRoleValue(Die ,EM_RoleValue_LiveTime,1)
		AddToPartition(Die,ReadRoleValue(Killer,EM_RoleValue_RoomID))
		KillID(Killer,Die)
--		DelObj(Die)
		return
	end
end
------------------------------------------------------------------------------------------------------------------------
-----------------�}�ҩI�s�X�Ӫ����󪺦W�٥H���Y���ءB���
function Lua_ShowQuestObjName(Obj)
	SetModeEX( Obj ,EM_SetModeType_HideName , false )
	SetModeEX( Obj ,EM_SetModeType_NotShowHPMP , false )
	SetModeEX( Obj , EM_SetModeType_ShowRoleHead , true )	
end
------------------------------------------------------------------------------------------------------------------------
-----------------�ˬd���󨭤W�O�_���M��buff
-----------------�Y���^��true  �Y�_�h�^��false  �S�����w����h�ˬd�ۤv
function DW_CheckRide(ObjID)
	local Obj = ObjID
	local BuffID
	if	ObjID == nil	then
		Obj = OwnerID()
	else
		Obj = ObjID
	end
	local BuffAmount = BuffCount ( Obj)
	for i=0,BuffAmount,1 do
		BuffID = BuffInfo ( Obj , i , EM_BuffInfoType_BuffID )
		if	GameObjInfo_int ( BuffID , "AssistType" )==68	then
			return true
		end
	end
	return false
end
------------------------------------------------------------------------------------------------------------------------
----------------------�Ѱ����w������buff
--BuffTypeNum ��J�Q�Ѱ���buff ����
--68 �M��
--58 �ܨ�
--ObjID ��J�Q�Ѱ����ؼ�  �Y���� �w�]�� OwnerID()
--��1 �h�w�]�� TargetID()
function DW_CancelTypeBuff(BuffTypeNum,ObjID)
	if	ObjID == nil	then
		IDNum = OwnerID()
	else
		if	ObjID ==1	then
			IDNum = TargetID()
		else
			IDNum = ObjID
		end
	end
	local Count = BuffCount ( IDNum)
	for i = 1 , Count do
		local BuffID = BuffInfo ( IDNum , Count-i , EM_BuffInfoType_BuffID )
		if GameObjInfo_int ( BuffID , "AssistType" ) == BuffTypeNum then
			CancelBuff( IDNum , BuffID ) 
		end
	end
end
------------------------------------------------------------------------------------------------------------------------
--�Ѱ��y�M�A�P�ɤ]���������㪺�@�ΡA�åB�|�^�ǥ��L�ȡA�^��true�h�O���y�M�θ��㪬�A(�w�Q����)�A�^�ǧ_�h�O�B�檬�A�C
	
function DW_CancelMount(GUID)
	local Obj=GUID;
	Obj = Obj or OwnerID();
	local Count = BuffCount(Obj)
	for i = 1 , Count do
		local Buff = BuffInfo ( Obj , Count-i , EM_BuffInfoType_BuffID)
		if GameObjInfo_int ( Buff , "AssistType" ) == 68 then
			CancelBuff( Obj , Buff );
			return true;
		end
	end
--���H�ëD�r�p
	if ReadRoleValue(Obj,EM_RoleValue_AttachObjGUID)~=-1 then--�O����
		DetachObj(Obj);
		return true;
	else--���㦳�M�����A
		return false;
	end
end
------------------------------------------------------------------------------------------------------------------------
--�W�ֳt�t�ο�ܮز��ͼҪ��I�I ��ܬO�Χ_�i�U�۰���@�Ө禡
--ĵ�i�I��function��ChooserID�����񪱮a��ID
--MsgString �t�ΰT���ؤ��e
--YesFunc ��ܡu�O�v�bOwnerID()�W���檺
--YesFunc ��ܡu�_�v�bOwnerID()�W���檺
--YesOption �O���ﶵ�r��A�i���� �w�]���u�O�v
--NoOption �_���ﶵ�r��A�i����  �w�]���u�_�v


function DW_ChooseOneFromTwo(ChooserID,MsgString,YesFunc,NoFunc,YesOption,NoOption)
--���b�ˬd�G������
	if CheckBuff( ChooserID , 501570) == true then 
		ScriptMessage( ChooserID , ChooserID , 0, "[SC_WINDOW_OPENED]", 0 );--�����w�g���}�F
		return
	end
	if	type(MsgString)~="string"	then
DeBugMSG(0,0,"MsgString ~= string")
		return
	end
	DialogCreate( ChooserID,EM_LuaDialogType_YesNo,MsgString)
	AddBuff(ChooserID , 501570,0,-1);
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
DeBugMSG(0,0,"DW_ChooseOneFromTwo is Done")
--���ݭ˼�
	local result = LuaS_DialogRePort_TwoChoose(ChooserID)
	if	result == "Yes"	then
		CallPlot(OwnerID(),YesFunc,ChooserID)
	end
	if	result == "No"	then
		if	NoFunc == nil	then
DeBugMSG(0,0,"NoFunc == nil")
			return
		end
		CallPlot(OwnerID(),NoFunc,ChooserID)
	end
end
------------------------------------------------------------------------------------------------------------------------
--���ݫܰ��i �ҥH��X�ӧP�_�X�b�@�_
--1.�P�_�ȬO���Onil  2.�P�_�o��id�٦b���b 3.��o��id �R��
function DW_CheckThenDel(Obj)
	if	Obj == nil	then	return	end
	if	CheckID(Obj)	then	DelObj(Obj)	end
end
------------------------------------------------------------------------------------------------------------------------
--�ǰe��P�@��zone���X�l����
--ObjID �Q�i��ǰe������
--FlagGroup �X�l�s��
--FlagID �X�l�s��
--Rand �H��
function DW_ChangeWithFlag(ObjID,FlagGroup,FlagID,Rand)
	if	ObjID == nil	or
		FlagGroup == nil	or
		FlagID == nil	then
		return
	end
	local Coordinate = {}
	Coordinate[1] = GetMoveFlagValue(FlagGroup,FlagID,EM_RoleValue_X)
	Coordinate[2] = GetMoveFlagValue(FlagGroup,FlagID,EM_RoleValue_Y)
	Coordinate[3] = GetMoveFlagValue(FlagGroup,FlagID,EM_RoleValue_Z)
	Coordinate[4] = GetMoveFlagValue(FlagGroup,FlagID,EM_RoleValue_Dir)
	local NewCoordinate = {}
	if	Rand == nil	or
		Rand == 0	then
--�S���d��n�D�N�ӿ�
		ChangeZone(ObjID,ReadRoleValue(OwnerID(),EM_RoleValue_ZoneID),ReadRoleValue(OwnerID(),EM_RoleValue_RoomID),Coordinate[1],Coordinate[2],Coordinate[3],Coordinate[4])
	else
		NewCoordinate[1] = Coordinate[1]-DW_Rand(Rand)+DW_Rand(2*Rand)
		NewCoordinate[3] = Coordinate[3]-DW_Rand(Rand)+DW_Rand(2*Rand)
--�վ��X�A����
		NewCoordinate[2] = GetHeight(NewCoordinate[1],Coordinate[2],NewCoordinate[3])
		NewCoordinate[4] = Coordinate[4]

		ChangeZone(ObjID,ReadRoleValue(OwnerID(),EM_RoleValue_ZoneID),ReadRoleValue(OwnerID(),EM_RoleValue_RoomID),NewCoordinate[1],NewCoordinate[2],NewCoordinate[3],NewCoordinate[4])
	end
end

------------------------------------------------------------------------------------------------------------------------
--�L���|���ʦܫ��w�X�l
--ObjID �Q�i�沾�ʪ�����
--FlagGroup �X�l�s��
--FlagID �X�l�s��
--Enable �O�_���� MoveToFlagEnabled �i����A�w�]�O�����A��0�h�O������
function DW_MoveDirectToFlag( ObjID , FlagObjID , FlagID , Enable  )
	if	Enable == nil	then
		MoveToFlagEnabled(ObjID, false)
	elseif	Enable == 1	then
		MoveToFlagEnabled(ObjID, false)
	end
	local Coordinate = {}
	Coordinate[1] = GetMoveFlagValue(FlagObjID,FlagID,EM_RoleValue_X)
	Coordinate[2] = GetMoveFlagValue(FlagObjID,FlagID,EM_RoleValue_Y)
	Coordinate[3] = GetMoveFlagValue(FlagObjID,FlagID,EM_RoleValue_Z)
	
	MoveDirect( ObjID, Coordinate[1] , Coordinate[2] , Coordinate[3] )
end
------------------------------------------------------------------------------------------------------------------------
--�榸�H������(�u�|���ʤ@��)
--ObjID �Q�i�沾�ʪ�����
--RandRange �Q�H�����ʪ��d��(���|)
-- IfEnable �O�_�n����MoveToFlagEnabled �w�]�O���A��1�]�O���A���L���N����
--V1 V2 V3 ����k�v�T�ϥΦ���H�����ʤ覡


function DW_MoveRand(ObjID,RandRange,IfEnable,V1,V2,V3)
	if	IfEnable == nil	then
		MoveToFlagEnabled(ObjID, false)
	elseif	IfEnable == 1	then
		MoveToFlagEnabled(ObjID, false)
	end
	local x,y,z,TempX,TempY,TempZ
	if	V1 == nil	then
--�H�ۤv���y�нd���H������
		TempX = ReadRoleValue(ObjID,EM_RoleValue_X)
		TempY = ReadRoleValue(ObjID,EM_RoleValue_Y)
		TempZ = ReadRoleValue(ObjID,EM_RoleValue_Z)
		for i=1,10,1 do
			x = TempX -(RandRange/2)+DW_Rand(RandRange)
			y = TempY 
			z = TempZ -(RandRange/2)+DW_Rand(RandRange)
			y = GetHeight(x,y,z)
			if i == 10	then
				return false
			end
			if	CheckLine( ObjID ,  x , y , z )==true	then
				break
			end
			if	math.abs(y-TempY)<45	then
				break
			end
		end
	elseif	V3~=nil	then
--�H��J��xyz�y�в���
		for i=1,10,1 do
			x=V1-(RandRange/2)+DW_Rand(RandRange)
			y=V2
			z=V3-(RandRange/2)+DW_Rand(RandRange)
			y=GetHeight( x , y , z )
			if i == 10	then
				return false
			end
			if	CheckLine( ObjID ,  x , y , z )==true	then
				break
			end
			if	math.abs(y-TempY)<45	then
				break
			end
		end
--�H���w���󪺦�m�H������
	elseif	V2 ==nil	then
		TempX = ReadRoleValue(V1,EM_RoleValue_X)
		TempY = ReadRoleValue(V1,EM_RoleValue_Y)
		TempZ = ReadRoleValue(V1,EM_RoleValue_Z)
		for i=1,10,1 do
			x = TempX-(RandRange/2)+DW_Rand(RandRange)
			y = TempY
			z = TempZ-(RandRange/2)+DW_Rand(RandRange)
			y=GetHeight( x , y , z )
			if i == 10	then
				return false
			end
			if	CheckLine( ObjID ,  x , y , z )==true	then
				break
			end
			if	math.abs(y-TempY)<45	then
				break
			end
		end
	else
--�H���J���X�Ц�m����
		TempX = GetMoveFlagValue(V1,V2,EM_RoleValue_X)
		TempY = GetMoveFlagValue(V1,V2,EM_RoleValue_Y)
		TempZ = GetMoveFlagValue(V1,V2,EM_RoleValue_Z)
		for i=1,10,1 do
			x=TempX -(RandRange/2)+DW_Rand(RandRange)
			y=TempY
			z=TempZ -(RandRange/2)+DW_Rand(RandRange)
			y=GetHeight( x , y , z )
			if i == 10	then
				return false
			end
			if	CheckLine( ObjID ,  x , y , z )==true	then
				break
			end
			if	math.abs(y-TempY)<45	then
				break
			end
		end
	end
	MoveDirect( ObjID, x , y , z )
	return true
end

--��J������o����xyz�y��==>�^�ǰ}�C
--Index �i����
function DW_GetObjXYZ(Obj,Index)
	if	Index==nil	then
		return {
			ReadRoleValue(Obj,EM_RoleValue_X),
			ReadRoleValue(Obj,EM_RoleValue_Y),
			ReadRoleValue(Obj,EM_RoleValue_Z)
			}
	elseif	Index ==1	then
		return ReadRoleValue(Obj,EM_RoleValue_X)
	elseif	Index ==2	then
		return ReadRoleValue(Obj,EM_RoleValue_Y)
	elseif	Index ==3	then
		return ReadRoleValue(Obj,EM_RoleValue_Z)
	end
end
--��J�X�l�s�����o�X�lxyz�y��&���V==>�^�ǰ}�C
--Index �i����
function DW_GetFlagXYZ(FlagID,Num,Index)
	if	(FlagID==nil)or(Num==nil)then
		return 0
	end
	local Temp = {}
	if	Index==nil	then
		Temp = {
				GetMoveFlagValue(FlagID,Num,EM_RoleValue_X),
				GetMoveFlagValue(FlagID,Num,EM_RoleValue_Y),
				GetMoveFlagValue(FlagID,Num,EM_RoleValue_Z),
				GetMoveFlagValue(FlagID,Num,EM_RoleValue_Dir),
				}
		return Temp
	elseif	Index==1	then
		return GetMoveFlagValue(FlagID,Num,EM_RoleValue_X)
	elseif	Index==2	then
		return GetMoveFlagValue(FlagID,Num,EM_RoleValue_Y)
	elseif	Index==3	then
		return GetMoveFlagValue(FlagID,Num,EM_RoleValue_Z)
	elseif	Index==4	then
		return GetMoveFlagValue(FlagID,Num,EM_RoleValue_Dir)
	else
		return 0
	end
end

--�p���Ӯy�Ъ��Z��
--��Jxyz
function DW_XYZCheckDis(X1,Y1,Z1,X2,Y2,Z2)
	if	Y1==nil	then
		return math.floor(((X1-X2)^2+(Z1+Z2)^2)^0.5)
	else
		local Total = math.floor((X1-X2)^2+(Y1-Y2)^2+(Z1-Z2)^2)
		local Final=math.floor(Total^0.5);
		return Final;
	end
end

--���obuff���ֿn����
--Obj   �Q�d������
--BuffID  �Q�d��buff�s��
function DW_GetBuffPowerLv(Obj,BuffID)
	if	BuffID == nil	or	Obj ==nil	then
		return false
	end
	if	CheckBuff(Obj,BuffID)==false	then
		return 0
	end
	local Pos = Lua_BuffPosSearch( Obj , BuffID )
	return	BuffInfo(Obj,Pos,EM_BuffInfoType_Power)
end



--�T�{�O�_�����͸�Obj�b�P�@��zone  Obj�i���� ���N�����ϥ�OwnerID()
--���ն��^��false
function DW_CheckPartyInSameZone(Obj)
	local Player
	if	Obj ==nil	then
		Player = OwnerID()
	else
		Player = Obj
	end
	local Result = false
	local PartyNum = GetPartyID( Player, -1 )
	local PartyID
	if	PartyNum ~= 0	then--���ն����A
		for i=0,PartyNum,1 do
			PartyID = GetPartyID( Player, i ) --�v�@�N������ƨ��X
			if	PartyID~=nil	and CheckID(PartyID)==true	and ReadRoleValue(PartyID,EM_RoleValue_IsPlayer)	and PartyID~=Player	then
			 --���춤�ͪ�ID �ӥB �ݩ󪱮a
				Result = true
				break--���X
			end
		end
	end
	return Result
end

--��Ҧ�����C�������a�o�e�T���æ^�Ǥ���C��(�u�]�A���a)
--mType���T�������G�������r(�w�])�Bĵ�i���r�B���U���T����
--String���T������
--mColor���T���C��G�񤰻�N�O�����C��A�w�]�����X
function DW_HateListMessage(Obj,mType,String,mColor)
	local AllObjCount = HateListCount(Obj)
	local AllObj = {}
	local Temp
	local Color = mColor
	local msg_Type = mType
	if	msg_Type==nil	then
		msg_Type=2--�w�]���������r
	end
	if	Color==nil	then
		Color=0--�w�]�����X
	end
	for i=0,AllObjCount,1 do
		Temp = HateListInfo(Obj,i , EM_HateListInfoType_GItemID)
		if	Temp~=nil	then
			if	ReadRoleValue(Temp,EM_RoleValue_IsDead)==0	then
				if	ReadRoleValue(Obj,EM_RoleValue_IsPlayer)==1	then
					ScriptMessage( Obj, Temp, msg_Type, String, Color )
					table.insert(AllObj,Temp)
				end
			end
		end
	end
	return AllObj
end


--���ۤv����ܮ�
--���ο�J������
function DW_CloseSpeak()
	local Obj = OwnerID()
	CloseSpeak(Obj)
end

--�ө����ͦ@�Ψ禡
function DW_InitialShopPlotSOP()
	--�ϥΤ覡�p�U�G
	--1.�bNPC��PID��J�ӫ~�s��+�p�a��ICON(�G���)�A�Y����ܤp�a�ϫh��00
	--2.�N��function ��bNPC����l�@��
	local Obj = OwnerID()						--�`�ŧi
	local PID = ReadRoleValue(Obj,EM_RoleValue_PID)			--���XPID
	if	PID ==0	then						--�S��N�����L
		return false
	end
	local ShopNum,MapNum
	ShopNum = math.floor(PID/100)					--����X�ө��s��
	SetShop(Obj,ShopNum,"")						--�]�w�ө�
	local IconList = 	{					--�]�w�p�ϥܦC��
				[0]=EM_MapIconType_Unknow        ,
				[1]=EM_MapIconType_NewQuest      ,	-- �s����
				[2]=EM_MapIconType_UnfinishQuest ,	-- ����������
				[3]=EM_MapIconType_FinishedQuest ,	-- ��������
				[4]=EM_MapIconType_TrustQuest    ,	-- �e�U����
				[5]=EM_MapIconType_Bank          ,	-- �Ȧ�
				[6]=EM_MapIconType_MailBox       ,	-- �l��
				[7]=EM_MapIconType_FlightPoint   ,	-- �����I
				[8]=EM_MapIconType_AuctionHouse  ,	-- ����
				[9]=EM_MapIconType_Mine          ,	-- �Ķ��I-�q
				[10]=EM_MapIconType_Wood          ,	-- �Ķ��I-��
				[11]=EM_MapIconType_Herb          ,	-- �Ķ��I-�į�
				[12]=EM_MapIconType_Inn           ,	-- �ȩ�
				[13]=EM_MapIconType_GuildMan      ,	-- ���|�إߪ�
				[14]=EM_MapIconType_HouseMan      ,	-- �Ыκ޲z��
				[15]=EM_MapIconType_Weapon        ,	-- �Z����
				[16]=EM_MapIconType_Armor         ,	-- �����
				[17]=EM_MapIconType_Potion        ,	-- �Ĥ���
				[18]=EM_MapIconType_Food          ,	-- ������
				[19]=EM_MapIconType_Magic         ,	-- �]�k�ө�
				[20]=EM_MapIconType_Mat           ,	-- ���Ʀ�
				[21]=EM_MapIconType_Shop          ,	-- ���f��
				[22]=EM_MapIconType_Fish          ,	-- ���㩱
				[23]=EM_MapIconType_Recipe        ,	-- �t��
				[24]=EM_MapIconType_Warrior       ,	
				[25]=EM_MapIconType_Ranger        ,	
				[26]=EM_MapIconType_Rogue         ,	
				[27]=EM_MapIconType_Wizard        ,	
				[28]=EM_MapIconType_Priest        ,	
				[29]=EM_MapIconType_Knight        ,	
				[31]=EM_MapIconType_Flag          ,	
				[32]=EM_MapIconType_NPC           ,	
				[33]=EM_MapIconType_Player        ,	
				[34]=EM_MapIconType_TrackArrow    ,	
				[35]=EM_MapIconType_LotteryMan    ,	-- �m��
				[36]=EM_MapIconType_VocationMan   	-- ¾�~�޲z��
				}
	if	PID%100~=0	then					--��00�N����
		MapNum = IconList[PID%100]
		SetMinimapIcon ( Obj, MapNum )				--��F�N�]������ �Ч�W�誺��Ӫ�
	end
end

--�N�@�Ӫ���e��t�@�Ӫ������
function DW_ChangePosToObj(Obj,Target)
	if	Obj==nil	or
		Target==nil	then
		return false
	end
	local XYZ = DW_GetObjXYZ(Target)
	local ZoneID = LuaS_111256_ZoneID(ReadRoleValue(Target,EM_RoleValue_ZoneID))
	local RoomID = ReadRoleValue(Obj,EM_RoleValue_RoomID)
	ChangeZone(Obj,ZoneID,RoomID,XYZ[1],XYZ[2],XYZ[3],0)
end

--�`�ΧP�_;����O�_�������Ȫ����a;�^�ǰ}�C
function DW_SearchPlayerHaveQuest(Obj,Range,QuestID)
	--�H�֬����߷j�M
	--�j�M�h�j�d��
	--�P�_������ID
	local TempPlayer = {}								--�μȦs�Ҧ����a�C��
	TempPlayer = SearchRangePlayer ( Obj , Range )		--�j�M�d�򤺪��Ҧ����a
	local ReturnPlayer = {}
	for index,value in pairs(TempPlayer) do				--�v�@�ˬd
		if	CheckAcceptQuest(value,QuestID)==true	then		--�Y�������Ȫ����a
			table.insert(ReturnPlayer,value)					--��i�N�n�^�Ǫ�table
		end
	end
	return ReturnPlayer
end

--�HX.Y.Z.������I�@Dis�d�򤺪��H������--����@�����@��(�LSleep)
function lua_DavisRandMove(ItemID,X,Y,Z,Dis)
	if Dis <= 0 then Dis = 0 end
	if Dis >= 1000 then Dis = 1000 end 
	--ItemID ����ID
	--Dis �è����d��
	local X1,Y1,Z1
	if CheckID(ItemID) then
		local Cal =(math.pi/180)*(Rand(360) ) 
		X1 = X +(Dis*math.cos(Cal))
		Z1 = Z - (Dis*math.sin(Cal))
		Y1 = GetHeight( X1 , Y , Z1 );
		--Say(OwnerID(),"X = "..X1.."Z = "..Z1.."Y = "..Y1)
		for i = 1 , 9 , 1 do
			if CheckLine( OwnerID() , X1 , Y1 , Z1 ) == false then
				X1 = X +(Dis*math.cos(Cal))*(10-i)/10
				Z1 = Z -(Dis*math.sin(Cal))*(10-i)/10
				Y1 = GetHeight( X1 ,  Y , Z1 )
			else
				break
			end
		end
		--Say(OwnerID(),"X = "..X1.."Z = "..Z1.."Y = "..Y1)
		Move(  ItemID  , X1 , Y1  , Z1 )--��MOVE�O�]����m���񪺪�ê�����@�w�A�קK�]�������m�ӳy�����_
	else
		return Say(OwnerID(),"Error")
	end
end

--�����קﵽ�c��(1000~-1000����
function Lua_Change_GoodEvil(Value)
	if Value > 1000 then
		Value = 1000
	elseif Value < -1000 then
		Value = -1000 
	end
	WriteRoleValue( OwnerID() , EM_RoleValue_GoodEvil , Value )
end
function Lua_MovePosByXYZ( X,Y,Z, Dir, Dis,angle) --�Ѧ�X,Y,Z,Dir�A�^�ǶZ��Dis(�����e�A�t����)���y�СA���V����(���^�Ǫ����V�����X�סA������)
	local Pos = {}
	local NewRole
	local Cal = (math.pi/180)*(Dir ) 
	Pos["X"] = X +(Dis*math.cos(Cal))
	Pos["Z"] = Z - (Dis*math.sin(Cal))
	Pos["Y"] = GetHeight( Pos["X"] , Y , Pos["Z"] );
	for i = 1 , 9 , 1 do
		if CheckLine( OwnerID() , Pos["X"] , Pos["Y"] , Pos["Z"] ) == false then
			Pos["X"] = X  +(Dis*math.cos(Cal))*(10-i)/10
			Pos["Z"] = Z -(Dis*math.sin(Cal))*(10-i)/10
			Pos["Y"] = GetHeight( Pos["X"] ,  Y , Pos["Z"] )
		else
			break
		end
	end
	Dir = Dir+angle
	if Dir >360 then
		Dir = Dir - 360
	end
	return Pos["X"]  , Pos["Y"] , Pos["Z"] , Dir
end

--�վ�setmodeex�����A(���վ㪺����,���L��,�Q�վ㪺����...)
function DW_Modesetting(Obj,Boolin_In,...)
	for i=1,select("#",...)  do
		SetModeEx(Obj,select(i,...),Boolin_In);
	end
end


--�s������²��ʫ��O(�j��)

function DW_Move(SType,Obj,Var1,Var2,Var3,Var4,Var5,Var6)
--�^�ǼƦr=���\��F,�Ʀr��Psleep(),
--"Stinking"�O�d��
--"Fighting"�O�i�J�԰�
--"Dead"�O���`
--�o�O�L�a�j��function
--�b���a���W�S�Ϊ���!
--���F�����T�~�����ǡGRange==>IsSetMoveFlag==>IsLoadPath==>IsUpdateY
	if	SType==nil	then		return nil;	end
	if	Obj==nil	then		return nil;	end
	if	type(SType)~="string"	then	return nil;	end
	local FlagID,FlagSort,ReferObj,Range,IsSetMoveFlag,IsLoadPath,IsUpdateY
	local x,y,z
	if	SType=="xyz"	then
		if	type(Var1)~="table"	then
			return nil;
		end
		x=Var1[1];
		y=Var1[2];
		z=Var1[3];
		Range,IsSetMoveFlag,IsLoadPath,IsUpdateY = Var2,Var3,Var4,Var5;
	elseif	SType=="obj"	then
		ReferObj = Var1;
		x=ReadRoleValue(ReferObj,EM_RoleValue_X);
		y=ReadRoleValue(ReferObj,EM_RoleValue_Y);
		z=ReadRoleValue(ReferObj,EM_RoleValue_Z);
		Range,IsSetMoveFlag,IsLoadPath,IsUpdateY = Var2,Var3,Var4,Var5;
	elseif	SType=="flag"	then
		FlagID,FlagSort=Var1,Var2
		x=GetMoveFlagValue(FlagID,FlagSort,EM_RoleValue_X);
		y=GetMoveFlagValue(FlagID,FlagSort,EM_RoleValue_Y);
		z=GetMoveFlagValue(FlagID,FlagSort,EM_RoleValue_Z);
		Range,IsSetMoveFlag,IsLoadPath,IsUpdateY = Var3,Var4,Var5,Var6;
	else
		return nil;
	end
	if	Range~=nil and Range~=0	then
		x=x+DW_Rand(Range/2);
		z=z+DW_Rand(Range/2);
	end
	if	IsSetMoveFlag==true	then
		MoveToFlagEnabled(Obj, false);
	end

	local IsFighting,IsStink,IsArrived,IsDead = false,false,false,false;
	local TimeCount = 0
	local NX,NY,NZ,PX,PY,PZ=0,0,0,0,0,0;
	if	IsUpdateY==true	then
		y=GetHeight( x,y,z);
	end
	ReCalculate(Obj);
	if	IsLoadPath==true	then
		Move(Obj,x,y,z);
	else
		MoveDirect(Obj,x,y,z);
	end
	while	true	do
		NX = ReadRoleValue(Obj,EM_RoleValue_X);
		NY = ReadRoleValue(Obj,EM_RoleValue_Y);
		NZ = ReadRoleValue(Obj,EM_RoleValue_Z);
		sleep(5);
		TimeCount = TimeCount+5;
		IsArrived = (((NX-x)^2+(NY-y)^2+(NZ-z)^2)<144);
		if	IsArrived==true	then
			return TimeCount;
		end
		IsStink = (((NX-PX)^2+(NY-PY)^2+(NZ-PZ)^2)==0);
		if	IsStink==true	then
			return "Stinking";
		end
		PX,PY,PZ = NX,NY,NZ;
		IsDead = (ReadRoleValue(Obj,EM_RoleValue_IsDead)==1);
		if	IsDead==true	then
			return "Dead";
		end
		IsFighting = (ReadRoleValue(Obj,EM_RoleValue_IsAttackMode)==1) or (HateListCount(Obj)~=0);
		if	IsFighting==true	then
			return "Fighting";
		end
	end
end


-----------------------------���ʦܩM�ؼЪ����w�Z��( Range) �ᰱ�U��(�j��)------------------------
function DW_GetClose_EX(Obj,Target,Range)
--�^�ǼƦr=���\��F,�Ʀr��Obj�MTarget���Z��
--"Stinking"�O�d��
--"Fighting"�O�i�J�԰�
--"Dead"�O���`
--�o�O�L�a�j��function
--�b���a���W�S�Ϊ���!
	if	Obj==nil	then		return nil;	end
	MoveToFlagEnabled(Obj, false);
	local x,y,z
	x=ReadRoleValue(Target,EM_RoleValue_X);
	y=ReadRoleValue(Target,EM_RoleValue_Y);
	z=ReadRoleValue(Target,EM_RoleValue_Z);

	local IsFighting,IsStink,IsArrived,IsDead = false,false,false,false;
	local NX,NY,NZ,PX,PY,PZ=0,0,0,0,0,0;
	Move(Obj,x,y,z);
	while	true	do
		NX = ReadRoleValue(Obj,EM_RoleValue_X);
		NY = ReadRoleValue(Obj,EM_RoleValue_Y);
		NZ = ReadRoleValue(Obj,EM_RoleValue_Z);
		sleep(5);
		IsArrived = (((NX-x)^2+(NY-y)^2+(NZ-z)^2)<Range^2);
		if	IsArrived==true	then
			return GetDistance(Obj,Target);
		end
		IsStink = (((NX-PX)^2+(NY-PY)^2+(NZ-PZ)^2)==0);
		if	IsStink==true	then
			return "Stinking";
		end
		PX,PY,PZ = NX,NY,NZ;
		IsDead = (ReadRoleValue(Obj,EM_RoleValue_IsDead)==1);
		if	IsDead==true	then
			return "Dead";
		end
		IsFighting = (ReadRoleValue(Obj,EM_RoleValue_IsAttackMode)==1) or (HateListCount(Obj)~=0);
		if	IsFighting==true	then
			return "Fighting";
		end
	end
end

--------------------------------Buff���]��T--------------------------------------------------------
function DW_ResetBuff(Obj,Buff,Lv,Time,IsOccur)
--�`�N�I�o�O�Ψӧ�sbuff��T��
--Lv �n�]�w��Buff����
--Time �n�]�w���Ѿl�ɶ�
--IsOccur �O�_�n��buffĲ�o�����ɪ��ƥ�(�i����)
	local IsOwnBuff = CheckBuff(Obj,Buff);
	if	IsOwnBuff==false	then
		return false;
	end
	if	IsOccur==nil or IsOccur==false	then
		CancelBuff_NoEvent(Obj,Buff);
	else
		CancelBuff(Obj,Buff);
	end
	Addbuff(Obj,Buff,Lv,Time);
	return true;
end



--------------------------------------------�榸�H������(�u�|���ʤ@��)-------------------------------------
--ObjID �Q�i�沾�ʪ�����
--RandRange �Q�H�����ʪ��d��(���|)
-- IfEnable �O�_�n����MoveToFlagEnabled �w�]�O���A��1�]�O���A���L���N����
--V1 V2 V3 ����k�v�T�ϥΦ���H�����ʤ覡


function DW_MoveRandPath(ObjID,RandRange,IfEnable,V1,V2,V3)
	if	IfEnable == nil	then
		MoveToFlagEnabled(ObjID, false)
	elseif	IfEnable == 1	then
		MoveToFlagEnabled(ObjID, false)
	end
	local x,y,z,TempX,TempY,TempZ
	if	V1 == nil	then
--�H�ۤv���y�нd���H������
		TempX = ReadRoleValue(ObjID,EM_RoleValue_X)
		TempY = ReadRoleValue(ObjID,EM_RoleValue_Y)
		TempZ = ReadRoleValue(ObjID,EM_RoleValue_Z)
		for i=1,10,1 do
			x = TempX -(RandRange/2)+DW_Rand(RandRange)
			y = TempY 
			z = TempZ -(RandRange/2)+DW_Rand(RandRange)
			y = GetHeight(x,y,z)
			if i == 10	then
				return false
			end
			if	CheckLine( ObjID ,  x , y , z )==true	then
				break
			end
			if	math.abs(y-TempY)<45	then
				break
			end
		end
	elseif	V3~=nil	then
--�H��J��xyz�y�в���
		for i=1,10,1 do
			x=V1-(RandRange/2)+DW_Rand(RandRange)
			y=V2
			z=V3-(RandRange/2)+DW_Rand(RandRange)
			y=GetHeight( x , y , z )
			if i == 10	then
				return false
			end
			if	CheckLine( ObjID ,  x , y , z )==true	then
				break
			end
			if	math.abs(y-TempY)<45	then
				break
			end
		end
--�H���w���󪺦�m�H������
	elseif	V2 ==nil	then
		TempX = ReadRoleValue(V1,EM_RoleValue_X)
		TempY = ReadRoleValue(V1,EM_RoleValue_Y)
		TempZ = ReadRoleValue(V1,EM_RoleValue_Z)
		for i=1,10,1 do
			x = TempX-(RandRange/2)+DW_Rand(RandRange)
			y = TempY
			z = TempZ-(RandRange/2)+DW_Rand(RandRange)
			y=GetHeight( x , y , z )
			if i == 10	then
				return false
			end
			if	CheckLine( ObjID ,  x , y , z )==true	then
				break
			end
			if	math.abs(y-TempY)<45	then
				break
			end
		end
	else
--�H���J���X�Ц�m����
		TempX = GetMoveFlagValue(V1,V2,EM_RoleValue_X)
		TempY = GetMoveFlagValue(V1,V2,EM_RoleValue_Y)
		TempZ = GetMoveFlagValue(V1,V2,EM_RoleValue_Z)
		for i=1,10,1 do
			x=TempX -(RandRange/2)+DW_Rand(RandRange)
			y=TempY
			z=TempZ -(RandRange/2)+DW_Rand(RandRange)
			y=GetHeight( x , y , z )
			if i == 10	then
				return false
			end
			if	CheckLine( ObjID ,  x , y , z )==true	then
				break
			end
			if	math.abs(y-TempY)<45	then
				break
			end
		end
	end
	ReCalculate(ObjID);
	Move( ObjID, x , y , z )
	return true
end