--�Ŧ�B����
function LuaQ_420283_Complete()
	SetPlot( OwnerID() , "Touch" , "LuaFunc_Obj_Nothing" , 40 )	
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_CRY )
	sleep( 30 )
	SetPlot( OwnerID() , "Touch" , "" , 0 )
end
--------------------------------------------------------------------------------------------------------
--�x��
function LuaI_110263()
	SetPlot( OwnerID() ,"touch" , "LuaI_110263_Open",40)
end
function LuaI_110263_Open()
	if CountBodyItem( OwnerID() , 200909 ) > 0 then
		SetPlot( TargetID() ,"touch" , "LuaFunc_Obj_Nothing",40)
		--�o�̱��}�����禡
		Say(OwnerID(),"�o�������}�F")
		DelBodyItem( OwnerID() , 200909 , 1 )
		BeginPlot(TargetID() , "LuaI_110263_Close" , 0 )
	else
		Say(OwnerID(),"�o�������F")
	end
end
function LuaI_110263_Close()
	sleep( 100 )
	--�o�̱��������禡
	SetPlot( OwnerID() ,"touch" , "LuaI_110263_Open",40)
	Say(TargetID(),"�o�������W�F")		
end
-----------------------------------------------------------------------------------------------------------
--��ī���U�l
function LuaQ_420297_Accept()
	Hide( OwnerID() )
	sleep( 300 )
	Show( OwnerID() , 0 )
end
-----------------------------------------------------------------------------------------------------------
--�_�c�_��
--�o�̩��_�c�_�Ͷ}�ҥ��Ȫ��@��
--------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------
--�U�ҺN���j��
function LuaQ_420590_Complete()
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_CRAFTING_BEGIN )
	sleep( 100 )
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_CRAFTING_END)
	sleep( 50 )
	say(OwnerID(), GetString("SAY_420590_0"))
end
------------------------------------------------------------------------------------------------------
function LuaQ_420593_Complete()
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_CRAFTING_BEGIN )
	sleep( 100 )
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_CRAFTING_END)
	sleep( 50 )
	say(OwnerID(), GetString("SAY_420593_0"))
end
-----------------------------------------------------------------------------------------------------



