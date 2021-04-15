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
			--	ScriptMessage( OwnerID(), 0 , 0, GetString("EM_420214_0"), 0 ); --/*他已經睡著了。
				Say( OwnerID() , GetString("EM_420214_0") )
			else
				WriteRoleValue( Father , EM_RoleValue_PID , 10000 ) 
				DelBodyItem( OwnerID() , 200667 , 1 )	
				BeginPlot( Father, "LuaQ_420214_0", 0 )
			end
		else
			--ScriptMessage( OwnerID(), 0 , 0, GetString("EM_420214_1"), 0 ); --/*你一個失手，沉睡香灑在地板上了。
			Say( OwnerID() ,  GetString("EM_420214_1") )		
			DelBodyItem( OwnerID() , 200667 , 1 )		
		end
	end
end
---------------------------------------------------------------------------------------------------
function LuaQ_420214_0()
	
	SetPlot( OwnerID(),"touch","LuaFunc_Obj_BUSY",40)
	sleep( 10 )
	Say( OwnerID() , GetString("SAY_110169_0") ) --/*咦...？
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
	Say( Gurofu , GetString("SAY_110165_0") ) --/*假如上天再給我一次機會，我寧願永遠不要跟茵莎在一起，也不願她就這樣死去……
	sleep( 10 )
	PlayMotion( Gurofu,ruFUSION_ACTORSTATE_EMOTE_BEG )
	sleep( 30 )
	Say( Gurofu , GetString("SAY_110165_1") ) --/*茵莎…我最愛的茵莎……
	sleep( 10 )
	SetPlot( Gurofu ,"touch","",0)
	SetFlag( TargetID() , 540759 , 1 ) --打開完成任務的旗標
	sleep( 300 )
	SetPlot( Gurofu ,"touch","LuaFunc_Obj_BUSY",40)
	Say( Gurofu , GetString("SAY_110165_2") ) --/*度爾金先生似乎快醒了，我不走不行......永別了，茵莎。
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