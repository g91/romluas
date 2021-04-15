--���g(11/9)Lua�D�ءG
--�Q�ΰ}�C�A�Ыؤ@�ӿ��i�H�H���X�{5�Ӯy�M�A�����a��ܡA
--��ܫ᪱�a�|�����W�y�M�A�`�H���y�M�ƶq20�A�X�{���y�M���n��W����ܪ��@��

function YOYO_Task1()
	local TaskNumber = 5
	local MountsTable = {};
	MountsTable[1] = 501417; --�M�����I
	MountsTable[2] = 501418; --�M���հ�
	MountsTable[3] = 501440; --�M���b�k
	MountsTable[4] = 501441; --�M�������ީ�
	MountsTable[5] = 501444; --�M���ᴳ��
	MountsTable[6] = 501445; --�M���İ�
	MountsTable[7] = 501446; --�M���°�
	MountsTable[8] = 501649; --�M����v���I
	MountsTable[9] = 501651; --�M�����b�k
	MountsTable[10] = 501652; --�M�����b�k
	MountsTable[11] = 501653; --�M�������b�k
	MountsTable[12] = 501654; --�M���ɥҩީ�
	MountsTable[13] = 501655; --�M���C�ҩީ�
	MountsTable[14] = 501656; --�M�����ҩީ�
	MountsTable[15] = 501657; --�M�������ީ�
	MountsTable[16] = 501699; --�M������Ĩۣ�H
	MountsTable[17] = 501700; --�M������Ĩۣ�H
	MountsTable[18] = 502215; --�M������s���B�~
	MountsTable[19] = 502216; --�M�����s���B�~
	MountsTable[20] = 502554; --�M���Ӯa�������M

	--local Seed = math.randomseed(os.time()); --�]�@���üƪ�
	--local Rand1 = math.random(1,20); --�Ĥ@�����w��
	
	for Count = 1 , 100 do --�H���洫�}�C��������100��
		local ValueA = RandRange(1,20);
		local ValueB = RandRange(1,20);
		local ValueC = MountsTable[ValueB];
		MountsTable[ValueB] = MountsTable[ValueA];
		MountsTable[ValueA] = ValueC;
	end

	local Player = OwnerID();
	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID )
	
	DialogCreate( Player , EM_LuaDialogType_Select , "Please select mounts" )

	for Count = 1 , TaskNumber do
		DialogSelectStr( Player , "["..MountsTable[Count].."]" )
	end

	if( DialogSendOpen( Player ) == false ) then
		ScriptMessage( Player , Player , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 )	--��ưe�X�����D
		return 0
	end

	local SelectID = Hsiang_GetDialogResoult( Player );--�����]�_�Ӫ����ݦ^�Х�function

	if SelectID == 0 then
		--�ﶵ0�n�����Ʊ�
		AddBuff( Player , MountsTable[1] , 1 , -1)
	elseif SelectID > 0 then
		--�ﶵ1����n�����Ʊ�
		AddBuff( Player , MountsTable[SelectID + 1] , 1 , -1)
	end

	DialogClose( Player )
end