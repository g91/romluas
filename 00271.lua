--�����

-------------------------------------------------------------------------------------------------------------
--�j������110148
function LuaI_110148()
	SetPlot( OwnerID() , "touch" , "LuaS_110148_1" , 50 );
end
-------------------------------------------------------------------------------------------------------------
function LuaS_110148_1()
	local result = "";
	if CheckAcceptQuest( OwnerID() ,420165 ) == true and CheckFlag( OwnerID()  , 540789 ) == false then
		if CountBodyItem( OwnerID(), 200696 ) >= 1 then
			if BeginCastBar( OwnerID(), GetString("CASTBAR_NAME_04") , 20 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_END , 0 ) ~= 1 then
				ScriptMessage( OwnerID(), OwnerID(), 0,"[SAY_NPC_BUSY]", 0 );
				return
			end	-- �������B�@
			SetPlot(TargetID() , "touch" , "" , 0 ); --Suez���A2009.1.12�A�@�ӤH�I��L�H�����I
			while 1 do
				sleep( 2 );
				local CastBarStatus = CheckCastBar( OwnerID() );

				if ( CastBarStatus ~= 0 ) then 
					if ( CastBarStatus > 0) then -- ���\
						result = "OKOK"
						EndCastBar( OwnerID() , CastBarStatus )
						break;
					elseif ( CastBarStatus < 0 ) then -- ����
						result = "DAME"
						EndCastBar( OwnerID() , CastBarStatus )
						break;
					end
				end
			end

			if ( result == "OKOK" ) then
				ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_110148_1") , 0 );	-- �A�ϥά��į����A����F�j�����񪺹B�@�I
				SetFlag( OwnerID()  , 540789 , 1 );
				DelBodyItem ( OwnerID() , 200696, 1 )	;
				BeginPlot( TargetID() , "LuaS_110148_2" , 0 )
			else
				SetPlot(TargetID() , "touch" , "LuaS_110148_1" , 50 );--Suez���A2009.1.12�A���Ѫ��ܡA�^�_���i�H�I�����A
			end
			
		else
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_110148_2") , 0 );	-- �A�S���i�H�������B�@�����~�I
		end
	end
	if CheckFlag( OwnerID()  , 540789 ) == true then
		say( OwnerID() , GetString("ST_110148_3") )	-- �w�g�i�H�^�h�y�H��a�V�줺�Q�Q���^���F�C
	end 
end
function LuaS_110148_2() --Suez���A2009.1.12�A�N�t�����쪫��W�i��
	CastSpell( OwnerID() , OwnerID(), 491002 )	-- �j�z��
	Hide( OwnerID());   --���äj������
	Sleep( 10 )
	local Destory_Machine = Createobjbyobj( 110670 , OwnerID() , 1  ); 
	sleep( 300 );
	Delobj( Destory_Machine );
	Sleep( 10 )
	Show( OwnerID() ,0);    --��ܤj������
	SetPlot( OwnerID() , "touch" , "LuaS_110148_1" , 50 ); --Suez���A2009.1.12�A�^�_Ĳ�I�@��
end
-------------------------------------------------------------------------------------------------------------
--Function LuaI_110148()
--	SetPlot( OwnerID(), "touch", "LuaQ_110148_0",40 );    --�]�w�j������Ĳ�I�@��
--end
-------------------------------------------------------------------------------------------------------------
--Function LuaQ_110148_0()

--	if CheckAcceptQuest( OwnerID(), 420165 ) ==true and CountBodyItem( OwnerID(), 200696) >= 1 then
--		BeginPlot( TargetID(), "LuaQ_110148_1", 0 );    --�ˬd���ȻP���Ȫ��~����
--	end

--end

--------------------------------------------------------------------------------------------------------------
--Function LuaQ_110148_1()

--	--CastSpell( OwnerID(), OwnerID(), X�z���k�N�S��);
--	Hide( OwnerID() );   --���ùB�@��������
--	Local machine =  Createobjbyobj( 110422, OwnerID(), 1  );   --���ͳQ�R��������
--	Sleep( 600 );
--	Delobj( machine );    --�R���Q�R��������
--	Show( OwnerID() ,0);    --��ܹB�@�������� 

--end