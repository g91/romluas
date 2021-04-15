----------------------------------------------------------------------------
--���bYoYo��ΤW���}��
----------------------------------------------------------------------------
function YoYo_Test_Stakes()
	local Stakes = OwnerID() --��Φۤv
	local FallHP = 502957 --����N
	local CureBuff = 500998 --�^�_�L�O

	AddBuff( Stakes , FallHP , 1 , -1 ) --�X�ͥ��񺡦�
		
	while true do
		sleep( 10 )
		if Lua_PercentHP( Stakes ) < 50 then
			AddBuff( Stakes , CureBuff , 1 , 30 )
			Say( Stakes , "Yooooooooo ~~~~  !!!" )
		end
	end
end

----------------------------------------------------------------------------
--�f�����եΪ��ө�-��l�@��
----------------------------------------------------------------------------
function YoYo_Test_TokenShop()
	SetSpeakDetail( OwnerID() , "[SSF_TEST]" )
	AddSpeakOption( OwnerID() , TargetID() , "[SO_110039_STORE]" , "YoYo_Test_TokenShop_SetShop" , 5 )	--�Z��
end

function YoYo_Test_TokenShop_SetShop()
	SetShop( TargetID() , 600443 , "Test_Shop_Close" )
	CloseSpeak( OwnerID() )	--������ܵ���
	OpenShop()
end
----------------------------------------------------------------------------
--�����f�������ի��O
----------------------------------------------------------------------------
	-- TokenValue = 0		--�C����
	-- TokenValue = 1		--���p
	-- TokenValue = 2		--���p
	-- TokenValue = 3		--�����ťN��
	-- TokenValue = 4		--�Գ��a�A
	-- TokenValue = 5		--�v�޳��I��(Arena)
	-- TokenValue = 6		--���|�ԯ�q
	-- TokenValue = 7		--���|�Ծ��Z
	-- TokenValue = 8		--�շ�����
	-- TokenValue = 9		--�j�N��
	-- TokenValue = 10	--�ڹҥ����L�O
	-- TokenValue = 11	--�����Ŷꨩ
	-- TokenValue = 12	--���q��q
	-- TokenValue = 13	--�ǻ�����
	-- TokenValue = 14	--�i�h����
function Test_GameMoney( Value )
	local Oneself = OwnerID() --�ۤv
	local TokenValue = Value
	local TokenType = 0 --�C����
	AddSpeicalCoin( Oneself , 10 , TokenType , TokenValue )
end
function Test_AccountMoney( Value )
	local Oneself = OwnerID() --�ۤv
	local TokenValue = Value
	local TokenType = 1 --���p
	AddSpeicalCoin( Oneself , 10 , TokenType , TokenValue )
end
function Test_Phirius( Value )
	local Oneself = OwnerID() --�ۤv
	local TokenValue = Value
	local TokenType = 3 --�����ťN��
	AddSpeicalCoin( Oneself , 10 , TokenType , TokenValue )
end
function Test_GiveDreamland( Value )
	local Oneself = OwnerID() --�ۤv
	local TokenValue = Value
	local TokenType = 10 --�ڹҥ����L�O
	AddSpeicalCoin( Oneself , 10 , TokenType , TokenValue )
end
function Test_GivePhiriusShell( Value )
	local Oneself = OwnerID() --�ۤv
	local TokenValue = Value
	local TokenType = 11 --�����Ŷꨩ
	AddSpeicalCoin( Oneself , 10 , TokenType , TokenValue )
end
function Test_GiveEnergyJustice( Value )
	local Oneself = OwnerID() --�ۤv
	local TokenValue = Value
	local TokenType = 12 --���q��q
	AddSpeicalCoin( Oneself , 10 , TokenType , TokenValue )
end
function Test_GiveRelics( Value )
	local Oneself = OwnerID() --�ۤv
	local TokenValue = Value
	local TokenType = 9 --�j�N��
	AddSpeicalCoin( Oneself , 10 , TokenType , TokenValue )
end
function Test_GiveProofLegend( Value )
	local Oneself = OwnerID() --�ۤv
	local TokenValue = Value
	local TokenType = 13 --�ǩ_����
	AddSpeicalCoin( Oneself , 10 , TokenType , TokenValue )
end
function Test_GiveHonor( Value )
	local Oneself = OwnerID() --�ۤv
	local TokenValue = Value
	local TokenType = 4 --�a�A�I��
	AddSpeicalCoin( Oneself , 10 , TokenType , TokenValue )
end
function Test_GiveTrialBadge( Value )
	local Oneself = OwnerID() --�ۤv
	local TokenValue = Value
	local TokenType = 8 --�շ�����
	AddSpeicalCoin( Oneself , 10 , TokenType , TokenValue )
end
function Test_GiveDuelistReward( Value )
	local Oneself = OwnerID() --�ۤv
	local TokenValue = Value
	local TokenType = 14 --�i�h����
	AddSpeicalCoin( Oneself , 10 , TokenType , TokenValue )
end
----------------------------------------------------------------------------
--�f���������O���ե�
----------------------------------------------------------------------------
function YOYO_Test_CheckToken( Value )
	local Oneself = OwnerID() --�ۤv
		if CheckSpeicalCoin( Oneself , 13 , 100 )  == true then
			DebugMsg( 0 , 0 , "> 100 true")
		else
			DebugMsg( 0 , 0 , "< 100 false")
		end
end
----------------------------------------------------------------------------
--���ͪ��׽u
----------------------------------------------------------------------------
--[[
�M�������ئn�����׽u
void ClearLineBlock( int roomID )
�W�[���׽u
void AddLineBlock( int roomID , int id , float x1 , float z1 , float x2 , float z2 )
�R�����׽u
bool DelLineBlock( int roomID , int id )
�T�{���׽u
bool CheckLineBlock( int roomID , float x1 , float y1 , float x2 , float y2 )
--]]

function YoYo_BlockingLine()
	local Player = OwnerID() --�ۤv
	local BoxID = 110987
	local ZoneID = ReadRoleValue( Player , EM_RoleValue_ZoneID)
	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID)
	local PlayerX , PlayerY , PlayerZ , PlayerDir = DW_Location( Player ) --���X�ۤv�ثe���y�лP���V
	
	
	Box = Lua_CreateObjByDir( Player , BoxID , 100 , PlayerDir ) --�гy�Ĥ@�ӽc�l
	SetModeEx( Box , EM_SetModeType_Gravity , false) --�L���O
	SetModeEx( Box , EM_SetModeType_Move , false) --���i����
	SetModeEx( Box , EM_SetModeType_Obstruct , true) --�����׮ĪG
	AdjustFaceDir( Box , Player , 180 ) --�]�w�c�l�I��ۤv
	AddtoPartition( Box , RoomID )
	local BoxX , BoxY , BoxZ , BoxDir = DW_Location( Box ) --���o�c�l����m�P���V
	
	local FlagObjID1 = 102331 --�ߤl�X�СA�h�{�樫���|��
	local FlagObjID2 = 100186 --�߫}�X�СA�^�{�樫���|��
	
	AdjustFaceDir( Box , Player , 90) --�c�l���V-90��
	local Robit = Lua_CreateObjByDir( Box , FlagObjID1 , 50 , BoxDir ) --���ͨߤl�X�Щ�c�l�����e��
	AddtoPartition( Robit , RoomID )
	local RobitX , RobitY , RobitZ , RobitDir = DW_Location( Robit ) --���o�ߤl�X�Ъ���m�P���V
		
	AdjustFaceDir( Box , Player , -90 ) --�c�l���V+90��
	local Cat = Lua_CreateObjByDir( Box , FlagObjID2 , 50 , BoxDir ) --���Ϳ߫}�X�Щ�c�l�����e��
	AddtoPartition( Cat , RoomID )
	local CatX , CatY , CatZ , CatDir = DW_Location( Cat ) --���o�߫}�X�Ъ���m�P���V
	
	local LineBlock01 = 100
	AddLineBlock( RoomID , LineBlock01 , RobitX , RobitZ , CatX , CatZ )
	Say( Player , "BlockLine = " .. LineBlock01)
	
end

function YoYo_DelBlockingLine()
	local Player = OwnerID() --�ۤv
	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID)
	ClearLineBlock( RoomID )
end

----------------------------------------------------------------------------
--����99999���D��
----------------------------------------------------------------------------
function YoYo_GiveItem99999( ItemID )
	local Player = OwnerID() --�ۤv
	GiveBodyItem( Player , ItemID , 99999 )
	
end

----------------------------------------------------------------------------
--�@�ɤJ�I�ӤH�n������
----------------------------------------------------------------------------
function YoYo_Test_IncursivePoint( Value )
	local IncursivePoint = ReadRoleValue( OwnerID() , EM_RoleValue_IncursivePoint )
	Say( OwnerID() , "Before IncursivePoint = "..IncursivePoint )
	if Value > 0 then
		WriteRoleValue( OwnerID() , EM_RoleValue_IncursivePoint , Value )
		Say( OwnerID() , "After IncursivePoint = "..IncursivePoint )
	end
end