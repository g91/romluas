-------------------------------------------------------------------------------------------------------------
--�s�������g�[110219
function LuaI_110219()
--	SetPlot( OwnerID() , "touch" , "LuaS_110219_1" , 40 );
end
-------------------------------------------------------------------------------------------------------------
function LuaS_110219_1()
	if CheckAcceptQuest( OwnerID() ,420191 ) == true  and CountBodyItem( OwnerID(), 200675 ) < 8 then
		Hide( TargetID() );   --���æìV�g��
		GiveBodyItem( OwnerID() , 200675 , 1 )	-- �s�������g�[
		Sleep( 100 );
		Show( TargetID() ,0);    --��ܦìV�g��
	elseif CheckAcceptQuest( OwnerID() ,420193 ) == true  and CountBodyItem( OwnerID(), 201031 ) < 6 then
		if  CountBodyItem( OwnerID(), 200652 ) >=1 then    --�ˬd�O�_�֦����d�w�S
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_110219_1") , 0)	--�ϥά��d�w�S�A�b�ƤF�g�[�I
			Hide( TargetID() );   --���æìV�g��
			Local Obj3  =  Createobjbyobj( 110422, TargetID(), 1  );   --���ͬs���������b�Ƥg��
			Sleep( 100 );
			Delobj( Obj3 );    --�R���b�Ƥg��
			Show( TargetID() ,0);    --��ܦìV�g��
		else
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_110219_2") , 0)	--�A�S�����d�w�S�A�L�k�b�Ƥg�[�I
		end
	end
end
-------------------------------------------------------------------------------------------------------------
--���Q�w�g�[110220
function LuaI_110220()
--	SetPlot( OwnerID() , "touch" , "LuaS_110220_1" , 40 );
end
-------------------------------------------------------------------------------------------------------------
function LuaS_110220_1()
	if CheckAcceptQuest( OwnerID() ,420191 ) == true and CountBodyItem( OwnerID(), 200673 ) < 8 then
		Hide( TargetID() );   --���æìV�g��
		GiveBodyItem( OwnerID() , 200673 , 1 )	-- ���Q�w�g�[
		Sleep( 100 );
		Show( TargetID() ,0);    --��ܦìV�g��
	elseif CheckAcceptQuest( OwnerID() ,420193 ) == true and CountBodyItem( OwnerID(), 201032 ) < 6 then
		if  CountBodyItem( OwnerID(), 200652 ) >=1 then    --�ˬd�O�_�֦����d�w�S
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_110219_1") , 0)	--�ϥά��d�w�S�A�b�ƤF�g�[�I
			Hide( TargetID() );   --���æìV�g��
			Local Obj2  =  Createobjbyobj( 110423, TargetID(), 1  );   --���ͦ��Q�w���b�Ƥg��
			Sleep( 100 );
			Delobj( Obj2 );    --�R���b�Ƥg��
			Show( TargetID() ,0);    --��ܦìV�g��
		else
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_110219_2") , 0)	--�A�S�����d�w�S�A�L�k�b�Ƥg�[�I
		end
	end
end
-------------------------------------------------------------------------------------------------------------
--������g�[110221
function LuaI_110221()
--	SetPlot( OwnerID() , "touch" , "LuaS_110221_1" , 40 );
end
-------------------------------------------------------------------------------------------------------------
function LuaS_110221_1()
	if CheckAcceptQuest( OwnerID() ,420191 ) == true  and CountBodyItem( OwnerID(), 200674 ) < 8 then
		Hide( TargetID() );   --���æìV�g��
		GiveBodyItem( OwnerID() , 200674 , 1 )	-- ������g�[
		Sleep( 100 );
		Show( TargetID() ,0);    --��ܦìV�g��
	end
end
-------------------------------------------------------------------------------------------------------------