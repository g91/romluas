function LuaI_100459()
	Say( OwnerID() , GetString("SAY_100459_1") ) --/* �J���Ҩ��Ӳ³J�K����٤��ӡH --��STRING1
end

	

function LuaI_100459_0() --��100459
			Say( OwnerID() , GetString("SAY_100459_2") ) --/* �p�G�Z��R����ĵ�ƶ����H�L�Ӫ��ܡA�N�·ФF�K --��STRING2	
end

function LuaS_100459_0()

	SetSpeakDetail( OwnerID(), GetString("ST_100459_0")   );
	--/*�A�Q�F����H�֨��}�I�I
	if CheckAcceptQuest( OwnerID() ,420464 ) == true then
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_100459_1") , "LuaS_100459_1", 0 ); --/*�N�O�A�j�����ۤҤHñ�����ܡH
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_100459_3") , "LuaS_100459_EXIT", 0 ); --/*�]�٨S�ǳƦn�A�٬O�����}�a�I�^
	else
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_100459_0") , "LuaS_100459_EXIT", 0 ); --/*�]�o�ӤH�n��...�^
	end
end

function LuaS_100459_1()
	SetSpeakDetail( OwnerID(), GetString("ST_100459_1")   );
	--/*�Q���쨺�ѤӱC��o��Ƨi�D�A�F�A��ĵ�i�A���n�h�޶��ưڡI
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_100459_2") , "LuaS_100459_2", 0 ); --/*�֧⫴���ٵ����ۤҤH�A�o���O���@���I
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_100459_3") , "LuaS_100459_EXIT", 0 ); --/*�]�٨S�ǳƦn�A�٬O�����}�a�I�^
end

function LuaS_100459_2()
	CloseSpeak(OwnerID())
	Say( TargetID() , GetString("ST_100459_2") ) --/*�A�n�j���x�l�A�ݧګ��аV�A�I�I --��STRING3
	BeginPlot(TargetID() , "LuaFunc_420464_Reset" , 0 )
end

function LuaS_100459_EXIT()
	CloseSpeak(OwnerID())
end

Function LuaFunc_420464_Reset()
	MoveToFlagEnabled( OwnerID() , False )
	local Obj = Role:new( OwnerID() ) 

	local BaseX = Obj :X()
 	local BaseY = Obj :Y();
 	local BaseZ = Obj :Z();
	local BaseDir = Obj:Dir();

	Hide( OwnerID() )
	local Farmer = CreateObj(100459, BaseX, BaseY, BaseZ, BaseDir, 1 )		
	AddToPartition( Farmer, 0 )
	SetAttack( Farmer , TargetID())
	sleep(60)
	while 1 do
		if ReadRoleValue( Farmer , EM_RoleValue_AttackTargetID ) ~= 0 and CheckID(Farmer) == true then  --�ˬd�O�_���}�԰�
			sleep(60)	-- �����ˬd�@��	
		else
			if CheckID( Farmer) == true and ReadRoleValue(Farmer,EM_RoleValue_IsDead) == 0 then
				DelObj( Farmer )
			end 
			sleep( 300 )
			Show( OwnerID() , 0 )
			MoveToFlagEnabled( OwnerID() , True )
			break		
		end
	sleep(1)
	end
end