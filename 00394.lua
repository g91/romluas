function LuaS_110055_0()
	LoadQuestOption(OwnerID())
	AddSpeakOption( OwnerID(), TargetID( ),GetString( "SO_110055_1") , "LuaS_110055_1", 0 ) --/*�z�s�s�P��̤���
	if CheckCompleteQuest( OwnerID() , 420087 ) == true then
		AddSpeakOption( OwnerID(), TargetID( ),GetString( "SO_110055_2") , "LuaS_110055_2", 0 ) --/*ù����Pù��
	end
	if CheckCompleteQuest( OwnerID() , 420083 ) == true then
		AddSpeakOption( OwnerID(), TargetID( ),GetString( "SO_110055_3") , "LuaS_110055_3", 0 ) --/*�ֺ��ԿէJ�Pù�椧��
	end
end

function LuaS_110055_1()
	SetSpeakDetail( OwnerID(), GetString("ST_110055_1")   );
	AddSpeakOption( OwnerID(), TargetID( ),GetString( "SO_110055_0") , "LuaS_110055_0", 0 ) --/*�^�W�@��	
end

function LuaS_110055_2()
	SetSpeakDetail( OwnerID(), GetString("ST_110055_2")   );
	AddSpeakOption( OwnerID(), TargetID( ),GetString( "SO_110055_0") , "LuaS_110055_0", 0 ) --/*�^�W�@��	
end

function LuaS_110055_3()
	SetSpeakDetail( OwnerID(), GetString("ST_110055_3")   );
	AddSpeakOption( OwnerID(), TargetID( ),GetString( "SO_110055_0") , "LuaS_110055_0", 0 ) --/*�^�W�@��	
end

function LuaI_420067_0()--�]�O�E���B��l�@��
	SetPlot( OwnerID() , "Range" , "LuaI_420067_A" , 50 )
	CastSpell( OwnerID(),OwnerID(), 490101 )  -- �X�ͫ����ۤv�W�S���]�k
end

function LuaI_420067_1()
	SetPlot( OwnerID() , "Range" , "LuaI_420067_B" , 200 )
end

function LuaI_420067_2()
	SetPlot( OwnerID() , "Range" , "LuaI_420067_C" , 200 )
end

function LuaI_420067_A()
	if CountBodyItem( OwnerID() , 200184 ) > 0 then
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_420067_0"), 0 ); --/*�����@�P�����ʵۡA�o����@�w���j�j���]�O���C
	end
end

function LuaI_420067_B()
	if CountBodyItem( OwnerID() , 200184 ) > 0 then
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_420067_1"), 0 ); --/*�����o�X�@�諸����n�A�ݨӳo�̥R�����]�O�C
	end
end

function LuaI_420067_C()
	if CountBodyItem( OwnerID() , 200184 ) > 0 then
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_420067_2"), 0 ); --/*�������L��Ÿ�ݵۡA���ӬO�w�g������@���]�O�F�C
	end
end
function LuaI_200184()
	local MagicPlot = LuaFunc_SearchNPCbyOrgID( OwnerID() , 110092 , 50 , 0)
	if MagicPlot ~= -1 then
		return true
	else
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_420067_4"), 0 ); --/*�ݭn�]�O�E���B�C
		return False		
	end
end

function LuaI_200184_Use()
	ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_420067_3"), 0 ); --/*�����l���F�����]�O�A�C��C�C���ܡA�ð���F���ʡC
	GiveBodyItem( OwnerID() , 200185 , 1 )
end

function LuaI_201075()
	if CountBodyItem( OwnerID() , 200169 ) > 0 then
		return true
	else
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SAY_201075_1"), 0 ); --/*�ݭnù�椧�١C
		return false
	end
end

function LuaI_201075_Use()
	DelBodyItem( OwnerID() , 200169 , 1 )
	ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SAY_201075_0"), 0 ); --/*�Ť�q�A�⤤�����A�Ƭ��@�D���~��¶��ù�椧�١C
	GiveBodyItem( OwnerID() , 200190 , 1 )
end
--------------------------420088_�˸��]�O�E��_�]�O�E���B-------------------------------------------------------
Function LuaQ_420088_ClickObj() 
	if CheckFlag( OwnerID() , 540210) == true then
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_420088_1"), 0 ); --/*�A�w�˸ѤF�]�O�E���C		
		return -1
	elseif CountBodyItem( OwnerID() , 200190 ) < 1  then
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_420088_0"), 0 ); --/*�ݭn�o����ù�椧�١C
		return -1
	else
		return 1
	end
end
---------------------------------------------------------------------------------------------------------------
Function LuaQ_420088_AfterClickObj() --�I����Ĳ�o���@��--�����ʧ@�A���i�Τw�����N��
	
	local Count = CountBodyItem( OwnerID(), 200190);

	if( Count >= 1) then
		DelBodyItem( OwnerID() , 200190 , 1 )
		BeginPlot( TargetID(),"LuaFunc_420088_Clear",0)
  		return 1;
	end

	return -1;
END
---------------------------------------------------------------------------------------------------------------
Function LuaFunc_420088_Clear() --�u�n�����즳�S�ħY�i�A�ҥH�ٲ��b�ƪ��]�k�H�ΰʧ@
	SetPlot(OwnerID(),"touch","LuaFunc_Obj_BUSY",40)
--	DisableQuest( OwnerID() , true )
	local Spider = {}
	local PlayerTeam = LuaFunc_PartyData(TargetID())
	for i = 1 , PlayerTeam[0] , 1 do
		if CheckAcceptQuest( PlayerTeam[i] ,420088 ) == true then
			SetFlag( PlayerTeam[i] , 540210 , 1 )
		end
	end 
	for i = 1 , 3 , 1 do
		Spider[i] = CreateObjByFlag ( 100030 , 780044, i ,1 )
		BeginPlot( Spider[i] , "LuaQ_420088_Sui" , 0 )
		AddToPartition( Spider[i] , 0 )
		SetAttack(Spider[i] , TargetID() )
	end
	SetPlot( Spider[1] , "dead" , "LuaQ_420088_Play" , 40 )
	while 1 do
		if CheckID(Spider[1]) == false and CheckID(Spider[2]) == false and CheckID(Spider[3]) == false then
			break
		else 
			sleep( 30 )
		end
	end
	
	sleep(300)--��30��A���ݨt�Φ^�_��i�A���Q�I�������A
	local Spear = LuaFunc_SearchNPCbyOrgID( OwnerID() , 110492 , 50 , 0)

	if CheckID(Spear) then
		DelObj( Spear)
	end
	SetPlot(OwnerID(),"touch","",0)
--	DisableQuest( OwnerID() , false )
	CastSpell( OwnerID(),OwnerID(), 490101 ) --���s�W�즳���S���]�k
END

--------------------------------------------------------------------------------------------------------------
function LuaQ_420088_Sui() 
	LuaFunc_Obj_Suicide(50)
end	
---------------------------------------------------------------------
function LuaQ_420088_Play()
	local PlayerTeam = HateListCount( OwnerID() )
	for i = 1 , PlayerTeam, 1 do
		local ID = HateListInfo(OwnerID() ,i-1 , EM_HateListInfoType_GItemID );
		if CheckCompleteQuest(ID ,420083) == false and CountBodyItem(ID, 200191 ) == 0 then
			GiveBodyItem( ID , 200191 , 1 )
		end
	end 
	local Rog = CreateObjByFlag ( 110501 , 780044, 0 ,1 )
--	SetPlot( Rog , "touch" , "LuaFunc_Obj_Nothing" ,0 )
	DisableQuest( Rog , true )
	AddToPartition( Rog , 0 )
	BeginPlot( Rog , "LuaQ_420088_Play_0" , 0)
	return 1
end	
---------------------------------------------------------------------
function LuaQ_420088_Play_0()
	local MagicPlot = LuaFunc_SearchNPCbyOrgID( OwnerID() , 110092 , 150 , 0)
	local Obj = Role:new(MagicPlot)
	local Spear = 0
	MoveToFlagEnabled( OwnerID() , False )
	WriteROleValue( OwnerID() , EM_RoleValue_IsWalk , 0 )
	LuaFunc_WaitMoveTo( OwnerID(), Obj:X() , Obj:Y() , Obj:Z() )
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_ATTACK_OH_PIERCE )
	sleep( 30 )
	Spear = LuaFunc_CreateObjByObj ( 110492 , MagicPlot )
	if CheckID( Spear ) == true then
		SetModeEx( Spear , EM_SetModeType_Mark, false) 
		SetModeEx( Spear, EM_SetModeType_HideName, false) 
		SetModeEx( Spear, EM_SetModeType_ShowRoleHead, false) 
	end
	CancelBuff( MagicPlot, 500900 );--�M���즳���S��BUFF
	DelObj(OwnerID() )
end
---------------------------------------------------------------------
function LuaS_200191_0() --ù�檺���e

	ClearBorder( OwnerID() );
	AddBorderPage( OwnerID(), GetQuestDetail( 420083, 1  ) );

	ShowBorder( OwnerID(), 420083, "[200191]", "ScriptBorder_Texture_Paper" );	

end
