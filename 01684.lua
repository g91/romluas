
--=======================================================================
---------�}�Һ�������A�o��[206367]�֯Sù�����ý��B[206409]�}�Ҫ��������
--206366�������
--=======================================================================


function LuaI_422844_206366_ItemUse()	--���bitem206366�U��

	DelBodyItem( OwnerID() , 206366 , 1 )
	GiveBodyItem( OwnerID() , 206367 , 1 )
	GiveBodyItem( OwnerID() , 206409 , 1 )

end


--=======================================================================
-----422845�a����ˬW�A�o<�d�ݧc������543469>
--=======================================================================
---�����ȡG�̮R����	�٥��ȡG�c�Ժ�
---���Ȫ��~�G113963�æb�g���˪�����
---���n���~�G543469�d�ݧc������
---�F���G�����a�h�d�ݧc�����ˡA�A��c�Ժ��٥���


function LuaS_422845_113963()	--���b���ˬW113963����l�@��
	Setplot(OwnerID(),"range","LuaS_422845_113963_1",200)	
end

function LuaS_422845_113963_1()
	if 	(CheckAcceptQuest(OwnerID(),422845)==true ) 		and			
		(CheckCompleteQuest( OwnerID() , 422845) == false ) 	and
		Checkflag(OwnerID(),543469)== false			then
		Setflag(OwnerID(),543469,1)
		ScriptMessage( OwnerID()  , OwnerID()   , 1 , "[SC_422845_0]" , 0 )	--�w�����d�ݧc�����ˡC
		
	end
end



--=======================================================================
-------------422846�ϥλ����p�M�A�o��@�ɹ�
--=======================================================================

function LuaI_422846_206373_ItemUse_0()
	
	GiveBodyItem( OwnerID() , 206372 , 1 )
	ScriptMessage(  OwnerID()   , OwnerID()    , 0 , "[SC_422846_13]" , 0 )		--�A�o��@���A���Y�v�C
	UseItemDestroy()			--�����O�i�R���ϥΤ������~
end


--=======================================================================
function LuaI_422848_206376_ItemUse()
	
	Beginplot(TargetID(),"LuaI_422848_206376_ItemUse_1",0)
end

function LuaI_422848_206376_ItemUse_1()
	ClearBorder( TargetID() );		--�A���}�a�Ϭd�ݡA�o�{.....
	AddBorderPage( TargetID(), "[SC_422848_4]" )
	ShowBorder( TargetID(), 0, "[206376]", "ScriptBorder_Texture_Paper" )
end




--function LuaI_205883() --�H�󤺮e
--	ClearBorder( OwnerID() );
--	AddBorderPage( OwnerID(), "[SC_205883]");
--	ShowBorder( OwnerID(), 0, "[205883]", "ScriptBorder_Texture_Paper" );
--end


--=======================================================================
-------------
--=======================================================================

function LuaI_114025()	--�r�������g��
	if 	CountBodyItem( OwnerID(), 206366)>0	then
		return false
	end
	
	if 	CountBodyItem( OwnerID(), 206367)>0	and
	  	CountBodyItem( OwnerID(), 206409)>0	then
		return false
	end
	return true
end





--=======================================================================
--�ǰe
--=======================================================================

function LuaQ_422853_Accept()	 --422853:���b�������Ȥ���A�M�����ǰe���a
	BeginPlot( TargetID() , "LuaQ_422853_Accept_Do" , 0 )
end

function LuaQ_422853_Accept_Do()
	CastSpell( OwnerID() , OwnerID() , 491008 )
	sleep( 5 )
	ChangeZone( OwnerID() , 7 , 0 , 16020 , 3 , 21672 , 110 )
end
------------------------------------------------------------------------
--function LuaS_422854_5()		--���h�ǰe���a
--	CloseSpeak( OwnerID() )
--	BeginPlot(OwnerID()  , "LuaS_422854_6" , 0 )
--end

--function LuaS_422854_6()
--	CastSpell( OwnerID() , OwnerID() , 491008 )
--	sleep( 5 )
--	ChangeZone( OwnerID() , 8 , 0 , 4043, 261 , 21530 , 166 )
--end