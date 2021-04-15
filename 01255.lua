-- ###########################################################################
--- Ū���Y�d�������
function ReadPetValue( GItemID , PetPos , ValueType )
	return ReadRoleValue( GItemID , EM_RoleValue_CultivatePet_Value + 100 * PetPos + ValueType )
end
-- ###########################################################################
--�g�J�d���ƭ�
function WritePetValue( GItemID , PetPos , ValueType , Value )
	return WriteRoleValue( GItemID , EM_RoleValue_CultivatePet_Value + 100 * PetPos + ValueType , Value )
end
-- ###########################################################################
--�W�[�d���ƭ�
function AddPetValue( GItemID , PetPos , ValueType , Value )
	return AddRoleValue( GItemID , EM_RoleValue_CultivatePet_Value + 100 * PetPos + ValueType , Value )
end
-- ###########################################################################
function Test_GivePetItem( )
	GiveItem_Pet( OwnerID() , 200006 , 100001 , 0 , 0 , 0 , 0 ,  0 , 0 )



--bool	GiveItem_Pet( int GItemID , int ItemOrgID , int Lv )

end
-- ###########################################################################

function Init_PetEnvironment( )
	local MaxPetType = 4
	PetEvent = {}	-- PetEvent[ PetType ][ Loyal/25  ][ Hunger/25 ]
	
	for i = 0 , 4 do
		PetEvent[i] = {}	
		for j = 0 , 4  do
			PetEvent[i][j] = {}
		end
	end

	PetEvent[ 0 ][ 0 ][  0 ] = " PetType = 0 , Loyal = 0-25  Hunger = 0-25";
	PetEvent[ 0 ][ 0 ][  1 ] = " PetType = 0 , Loyal = 0-25  Hunger = 26-50";
	PetEvent[ 0 ][ 0 ][  2 ] = " PetType = 0 , Loyal = 0-25  Hunger = 51-75";
	PetEvent[ 0 ][ 0 ][  3 ] = " PetType = 0 , Loyal = 0-25  Hunger = 76 -100";

	PetEvent[ 0 ][ 1 ][  0 ] = " PetType = 0 , Loyal = 26-50  Hunger = 0-25";
	PetEvent[ 0 ][ 1 ][  1 ] = " PetType = 0 , Loyal = 26-50  Hunger = 26-50";
	PetEvent[ 0 ][ 1 ][  2 ] = " PetType = 0 , Loyal = 26-50  Hunger = 51-75";
	PetEvent[ 0 ][ 1 ][  3 ] = " PetType = 0 , Loyal = 26-50  Hunger = 76 -100";

	PetEvent[ 0 ][ 2 ][  0 ] = " PetType = 0 , Loyal = 51-75  Hunger = 0-25";
	PetEvent[ 0 ][ 2 ][  1 ] = " PetType = 0 , Loyal = 51-75  Hunger = 26-50";
	PetEvent[ 0 ][ 2 ][  2 ] = " PetType = 0 , Loyal = 51-75  Hunger = 51-75";
	PetEvent[ 0 ][ 2 ][  3 ] = " PetType = 0 , Loyal = 51-75  Hunger = 76 -100";

	PetEvent[ 0 ][ 3 ][  0 ] = " PetType = 0 , Loyal = 76 -100  Hunger = 0-25";
	PetEvent[ 0 ][ 3 ][  1 ] = " PetType = 0 , Loyal = 76 -100  Hunger = 26-50";
	PetEvent[ 0 ][ 3 ][  2 ] = " PetType = 0 , Loyal = 76 -100  Hunger = 51-75";
	PetEvent[ 0 ][ 3 ][  3 ] = " PetType = 0 , Loyal = 76 -100  Hunger = 76 -100";

	PetProperty = {}   --PetProperty[ Str ][Property ] ;
	PetProperty[ 1] = { 3,3,3,3,3,3,3}; -- STR
	PetProperty[ 2 ] = { 3,3,3,3,3,3,3}; -- STA
	PetProperty[ 3 ] = { 3,3,3,3,3,3,3}; -- INT
	PetProperty[ 4 ] = { 3,3,3,3,3,3,3}; -- MND
	PetProperty[ 5 ] = { 3,3,3,3,3,3,3}; -- AGI
	

end

--�T�w�C10�q�����ƥ�
function PetCallBack_OnTime(  PetPos , PetOrgID , PetType , Property )
	local Loyal 	= ReadPetValue( OwnerID() , PetPos , EM_CultivatePetStructValueType_Loyal     )
	local Hunger	= ReadPetValue( OwnerID() , PetPos , EM_CultivatePetStructValueType_Hunger )
	Loyal = Math.floor( (Loyal-1)/25 )
	Hunger= Math.floor( (Hunger-1)/25 )
	Say( OwnerID() , PetEvent[ PetType ][Loyal  ][Hunger] );
end

--�B�z�Ȧ� 
function PetCallBack_Travel_Begin(  PetPos , PetOrgID , PetType , Property )
	--�Ȧ�60��
	return 60;
end

function PetCallBack_Travel_End(  PetPos , PetOrgID , PetType , Property )
	--�Ȧ�60��
	Say( OwnerID() , "Pet Travel End")
end

--�S�V
function PetCallBack_Train(  PetPos , PetOrgID , PetType , Property )
	local TrainCount 	= ReadPetValue( OwnerID() , PetPos , EM_CultivatePetStructValueType_TrainCount     )
	local TrainCheckCount  = 3;
	local TrainPoint = 5;

	if( TrainCount == 0 ) then
		return;
	end

	TrainCount = TrainCount-1;

	WritePetValue( OwnerID() , PetPos , EM_CultivatePetStructValueType_TrainCount   ,  TrainCount  );
	WritePetValue( OwnerID() , PetPos , EM_CultivatePetStructValueType_TrainPoint    ,  TrainPoint );
	WritePetValue( OwnerID() , PetPos , EM_CultivatePetStructValueType_TrainCheckCount     ,  TrainCheckCount  );
end

--�禬 or �ưV(�ϥΪ��~)
-- �����~  �P ���禬����  �{���|�B�z
function PetCallBack_TrainCheck(  PetPos , PetOrgID , PetType , Property )
	local TrainPoint = ReadPetValue( OwnerID() , PetPos , EM_CultivatePetStructValueType_TrainPoint    ) ;
	local TrainValue = { 0, 0,0,0,0 }

	for i = 1 , TrainPoint  do
		local R = Random( 5 ) + 1
		TrainValue [R] = TrainValue [R] + 1;
	end

	local TrainStr = TrainValue [1] + PetProperty[1][Property ] ;
	local TrainSta = TrainValue [2]+ PetProperty[2][Property ] ;
	local TrainInt = TrainValue [3]+ PetProperty[3][Property ] ;
	local TrainMnd = TrainValue [4]+ PetProperty[4][Property ] ;
	local TrainAgi = TrainValue [5]+ PetProperty[5][Property ] ;

	WritePetValue( OwnerID() , PetPos , EM_CultivatePetStructValueType_LastTran_Str ,  TrainStr  );
	WritePetValue( OwnerID() , PetPos , EM_CultivatePetStructValueType_LastTran_Sta ,  TrainSta  );
	WritePetValue( OwnerID() , PetPos , EM_CultivatePetStructValueType_LastTran_Int ,  TrainInt  );
	WritePetValue( OwnerID() , PetPos , EM_CultivatePetStructValueType_LastTran_Mnd ,  TrainMnd  );
	WritePetValue( OwnerID() , PetPos , EM_CultivatePetStructValueType_LastTran_Agi ,  TrainAgi  );

end

--�d���ɯ�
function PetCallBack_LevelUp(  PetPos , PetOrgID , PetType , Property )
end
