function LuaI_110671_0()
	
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 20000 ) 
	WriteRoleValue( OwnerID() , EM_RoleValue_IsWalk , 1 ) 


		local saymode = 1;

		while 1 do
			
			if ReadRoleValue( OwnerID() , EM_RoleValue_PID ) == 10000 then
				sleep(1)
			else
				if ( saymode == 1 ) then
					Say( OwnerID() , GetString("SAY_110671_1") ) --/* �ǹF���o�å�A����٤��^�ӡH�u�O�𦺧ڤF�I
					saymode = 2;
				else
					Say( OwnerID() , GetString("SAY_110671_2") ) --/*�o���^�Ӥ@�w�n�n�n�аV�L�I		
					saymode = 1;
				end
			end

			sleep( 150 )

		end

end

function LuaS_110671()

	LoadQuestOption( OwnerID() );
	
	if  CountBodyItem(OwnerID(),200710) > 0 then --�ˬd���W�����Ȫ��~

	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110671_1") , "LuaS_110671_1", 0 );--/*�o�O�A��l�s�ڵ��A���H�C
	
	end
end	
	
function LuaS_110671_1()
	
	
	SetSpeakDetail( OwnerID(), GetString("ST_110671_1")   );--/*�o�O�ǹF�����ڪ��H�H�L�H�b����a��H

	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110671_2") , "LuaS_110671_2", 0 );--/*�L���A�ݤF�H�N���D�F�C

end

function LuaS_110671_2()

	CloseSpeak( OwnerID() );	--������ܵ���
	DelBodyItem( OwnerID() , 200710 , 1 )--���������Դ����H200710
	WriteRoleValue( TargetID() , EM_RoleValue_PID , 10000 ) 
	DisableQuest( TargetID() , true )
	BeginPlot( TargetID() , "LuaS_110671_3" , 0 )
end

function LuaS_110671_3()

	MoveToFlagEnabled( OwnerID() , false )


	PlayMotion( OwnerID(), 131)--���Դ��}�H
	sleep( 40 )	

	ScriptMessage( TargetID(), TargetID(), 2, GetString("MSG_110671"), C_SYSTEM );--�e�������T���G���Դ����}�F�H��A���F�į������F�}�ӡC
	CastSpell( OwnerID(),OwnerID(),491004) -- ���r�S��
	sleep( 30 )
			
	Say( OwnerID() , GetString("ST_110671_2") )--���ܡG�u�_�ǡH�o�O������D...�v
	sleep( 30 )
--	PlayMotionEX( OwnerID(), 12,13)--���Դ�����
	PlayMotion( OwnerID(), 12)--���Դ�����
	ScriptMessage( TargetID(), TargetID(), 2, GetString("MSG_110671_1"), C_SYSTEM );--�e�������T���G���Դ��D����Fۣ�����A���˦b�a�K

	SetFlag( TargetID(), 540791, 1 );	--�����������ȭ��n���~540791


	--45���A���Դ��_��
	sleep( 450 )				
	MoveToFlagEnabled( OwnerID() , true )
	DisableQuest( TargetID() ,false)
	LuaFunc_ResetObj( OwnerID() )


end
