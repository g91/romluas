--�¾�
function LuaI_110233()
	CastSpell( OwnerID(), OwnerID(), 570868)	--��l�S��
End
------------------------------------------------------------------------------------------------------------------------------------
--�]�ƥj�����Ħ��`�@��
function LuaI_100264()
	SetPlot(OwnerID(),"dead","LuaI_100264_dead",40)
end
function LuaI_100264_dead()
	SAY( OwnerID(), GetString("YELL_100264") ); 
	local Player = LuaFunc_PartyData(ObjID)
	for i = 1 , Player[0] , 1 do
		if CheckAcceptQuest( Player[i] , 420230 ) == true and CountBodyItem( Player[i] , 200679) == 0 then
			GiveBodyItem( Player[i] , 200679 , 1 )
		end 
	end
	return true
end
------------------------------------------------------------------------------------------------------------------------------------
--���R����
Function LuaI_110438()

	SetPlot( OwnerID(), "touch", "LuaQ_110438_1", 40);	--�]�w���R������BĲ�I�@��

End
------------------------------------------------------------------------------------------------------------------------------------
Function LuaQ_110438_1()

	if CheckAcceptQuest( OwnerID(), 420246) == true And CountBodyItem( OwnerID(),200723 ) >=1 then	--�w�����ȥB�֦��V�����
	GiveBodyItem( OwnerID(),200724, 1);	--�������R�򤧤�
	DelBodyItem( OwnerID(), 200723, 1);	--�R���V�����
	end
End
------------------------------------------------------------------------------------------------------------------------------------
--�}�a�Ҫ��]��
function LuaI_110098()
	SetPlot( OwnerID() , "touch","LuaI_110098_1",40)
end
function LuaI_110098_1()
	if CheckAcceptQuest(OwnerID(),420228) then
		SetPlot( OwnerID() , "touch","LuaFunc_Obj_Nothing",40)
		BeginPlot(TargetID(),"LuaI_110098_2",0)
	end
end
function LuaI_110098_2()
	SetFlag( TargetID() , 540225 , 1 )
	PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_DYING)
	sleep(100)
	Hide( OwnerID() )
	sleep( 300)
	Show( OwnerID() , 0)
	SetPlot( OwnerID() , "touch","LuaI_110098_1",40)	
	
end