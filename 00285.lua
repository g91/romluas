function LuaS_110159_0()
	LoadQuestOption( OwnerID() );
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110439_0") , "LuaS_110159_SHOP", 0 );
	--/*�R�檫�~ 
	if CheckAcceptQuest( OwnerID() , 420304 ) == true and CountBodyItem(OwnerID(),200880)==0 then
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110159_1") , "LuaS_110159_1", 0 ); 
		--/*�ڬO�𥧬��Ҭ��Ӫ��H�A�Ʊ���L�q���s���^�h�C
	end
end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110159_SHOP()

	CloseSpeak( OwnerID() ); 
	OpenShop()

end
-------------------------------------------------------------------------------------------------------------
function LuaS_110159_1()

	CloseSpeak( OwnerID() );	--������ܵ���
	SetPlot( TargetID() , "touch","LuaFunc_Obj_Nothing",40)
	Say( TargetID() , GetString("SAY_110159_0") ) --/*�A�O�𥧬��Ҭ��Ӫ��H�ڡI�u�O��p�A�@���S���s�e�L�h�C
	sleep( 20 )
	local Obj = Role:new( TargetID() )
	local Cask = LuaFunc_SearchNPCbyOrgID( TargetID(),110283 , 50 , 1)
	Say( TargetID() , GetString("SAY_110159_1") ) --/*�q���a�m�W�r�o��s�N�·ЧA�o�I���I���A�Фp�߮��C
	if Cask[0] == -1 then
		Cask[0] = CreateObj( 110283 , Obj:X()+10 , Obj:Y() , Obj:Z() , 0 , 1 )
		AddToPartition( Cask[0] , 0 )
		SetPlot( Cask[0] , "touch" ,"LuaI_110283" , 40 )
		BeginPlot( Cask[0] ,"LuaI_110283_B",0)
	else
		SetPlot( TargetID() , "touch","",0)
		return
	end
	SetPlot( TargetID() , "touch","",0)	

end
-------------------------------------------------------------------------------------------------------------
function LuaI_110283() --���s�����
	if CheckAcceptQuest( OwnerID() , 420304 ) == true and CountBodyItem(OwnerID(),200880)==0 then
		GiveBodyItem( OwnerID() , 200880 , 1 )
	end
	DelObj( TargetID() )
end

function LuaI_110283_B()
	sleep( 100 )
	DelObj( OwnerID() )
end