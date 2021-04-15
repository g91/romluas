function LuaI_110169()
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 20000 ) 
end
--------------------------------------------------------------------------------------------------------------
function LuaI_110179()
	SetPlot( OwnerID() ,"Touch","LuaQ_420214_Item",40)
end
--------------------------------------------------------------------------------------------------------------
function LuaQ_420214_Item()
	if  CountBodyItem(OwnerID(),200667) > 0 then
		local Father = LuaFunc_SearchNPCbyOrgID( TargetID() , 110169 , 50 )
		if CheckAcceptQuest( OwnerID() ,420214 ) == true then
			if ReadRoleValue( Father , EM_RoleValue_PID ) == 10000 then
			--	ScriptMessage( OwnerID(), 0 , 0, GetString("EM_420214_0"), 0 ); --/*�L�w�g�εۤF�C
				Say( OwnerID() , GetString("EM_420214_0") )
			else
				WriteRoleValue( Father , EM_RoleValue_PID , 10000 ) 
				DelBodyItem( OwnerID() , 200667 , 1 )	
				BeginPlot( Father, "LuaQ_420214_0", 0 )
			end
		else
			--ScriptMessage( OwnerID(), 0 , 0, GetString("EM_420214_1"), 0 ); --/*�A�@�ӥ���A�I�έ��x�b�a�O�W�F�C
			Say( OwnerID() ,  GetString("EM_420214_1") )		
			DelBodyItem( OwnerID() , 200667 , 1 )		
		end
	end
end
---------------------------------------------------------------------------------------------------
function LuaQ_420214_0()
	
	SetPlot( OwnerID(),"touch","LuaFunc_Obj_BUSY",40)
	sleep( 10 )
	Say( OwnerID() , GetString("SAY_110169_0") ) --/*�x...�H
	sleep( 10 )
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_Dazed_BEGIN )
	sleep( 20 )
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_Dazed_END )
	sleep( 20 )
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_DYING )
	sleep( 20 )
	Say( OwnerID() , GetString("SAY_110169_1") ) --/*Zzz...
	sleep( 20 )
	Say( OwnerID() , GetString("SAY_110169_1") ) --/*Zzz...
	local Gurofu = CreateObjByFlag( 110165 , 780024 , 0 ,1 )
	AddToPartition( Gurofu , 0 )
	SetPlot( Gurofu ,"touch","LuaFunc_Obj_BUSY",40)
	MoveToFlagEnabled( Gurofu , false );
	LuaFunc_MoveToFlag( Gurofu , 780024 , 1 ,0 )
	sleep( 20 )
	Say( Gurofu , GetString("SAY_110165_0") ) --/*���p�W�ѦA���ڤ@�����|�A�ڹ��@�û����n�����b�@�_�A�]���@�o�N�o�˦��h�K�K
	sleep( 10 )
	PlayMotion( Gurofu,ruFUSION_ACTORSTATE_EMOTE_BEG )
	sleep( 30 )
	Say( Gurofu , GetString("SAY_110165_1") ) --/*����K�ڳ̷R������K�K
	sleep( 10 )
	SetPlot( Gurofu ,"touch","",0)
	SetFlag( TargetID() , 540759 , 1 ) --���}�������Ȫ��X��
	sleep( 300 )
	SetPlot( Gurofu ,"touch","LuaFunc_Obj_BUSY",40)
	Say( Gurofu , GetString("SAY_110165_2") ) --/*�׺������ͦ��G�ֿ��F�A�ڤ�������......�çO�F�A����C
	sleep( 20 )
	LuaFunc_MoveToFlag( Gurofu , 780024 , 0 ,0 )	
	DelObj( Gurofu )
	sleep( 20 )
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_SLEEP_END )	
	sleep( 20 )
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 20000 )
	SetPlot( OwnerID(),"touch","",0)	
		
end
-------------------------------------------------------------------------------------------