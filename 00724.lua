-------------------------------------------------��w��
function LuaI_202432_Check()
	local Target = ReadRoleValue( TargetID() , EM_RoleValue_OrgID)
	if  CheckAcceptQuest( OwnerID() , 421184 ) == false or CheckCompleteQuest( OwnerID() , 421184 ) == true then
                            ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_421184_0") , 0 ) --/*���Ȥ��ŦX�C	
	            ScriptMessage( OwnerID(), OwnerID(), 1,  GetString("SC_421184_0") , 0 )--/*���Ȥ��ŦX�C		
                            return false
	 end

	if TargetID() == OwnerID() or CheckID( TargetID() ) == false then
		ScriptMessage( OwnerID(), OwnerID(), 1 , GetString("SC_421184_1") ,  0 ) --/*�A�S���ؼСC
		ScriptMessage( OwnerID(), OwnerID(), 0 , GetString("SC_421184_1") ,  0 ) --/*�A�S���ؼСC
		return false
	elseif Target ~= 111230  then 	
		ScriptMessage( OwnerID(), OwnerID(), 1 , GetString("SC_421184_2") , 0 )   --/*�o�ӤH�ݤF�ݫ����S���������
		ScriptMessage( OwnerID(), OwnerID(), 0 ,  GetString("SC_421184_2") , 0 )   --/*
		return false
	else
		return true
	end         
end

function LuaI_202432_Effect()  	
	BeginPlot( TargetID() , "LuaN_111230_0" , 0 )
end

function LuaN_111230_0()
	local Anna = LuaFunc_CreateObjByObj ( 111154, OwnerID() )
                Hide( OwnerID() )		
                sleep( 300 )
                Delobj( Anna)
                Show( OwnerID() , 0 )
end

------------------------------------------------------��ã��
function LuaI_202433_Check()
	if  CheckAcceptQuest( OwnerID() , 421189 ) == false or CheckCompleteQuest( OwnerID() , 421189 ) == true then
                            ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_421189_0") , 0 ) --/*���Ȥ��ŦX�C	
	            ScriptMessage( OwnerID(), OwnerID(), 1,  GetString("SC_421189_0") , 0 )--/*���Ȥ��ŦX�C	
	            return false	
	 end
	local Target = ReadRoleValue( TargetID() , EM_RoleValue_OrgID)
	if CheckID( TargetID() ) == false or TargetID() == OwnerID() then
		ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_421189_1") ,  0 ) --/*�A�S���ؼСC
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_421189_1") ,  0 ) --/*
		return false 
	elseif Target ~= 111155 then 	
		ScriptMessage( OwnerID(), OwnerID(), 0,  GetString("SC_421189_2") , 0 )   --/*�o�ӤH�ݤF�ݫ����S���������
		ScriptMessage( OwnerID(), OwnerID(), 1,  GetString("SC_421189_2") , 0 )   --/*
		return false	
                else		
                                return true
	end
        
end

function LuaI_202433_Effect()  
	BeginPlot( TargetID() , "LuaN_111155_0" , 0 )	
end

function LuaN_111155_0()
	local Jones = LuaFunc_CreateObjByObj ( 111237, OwnerID() )
                Hide( OwnerID() )		
                sleep( 300 )
                Delobj( Jones)
                Show( OwnerID() , 0 )
end


------------------------------------------------------ã�����}
function LuaI_202368_Check()
	local Target = ReadRoleValue( TargetID() , EM_RoleValue_OrgID)
	if CheckAcceptQuest( OwnerID() , 421192 ) == false or CheckCompleteQuest( OwnerID() , 421192 ) == true then
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_421192_0")  , 0 ); --/*���Ȥ��ŦX�C
		ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_421192_0")  , 0 ); --/*���Ȥ��ŦX�C
		return false

	elseif CheckID( TargetID() ) == false then
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_421192_1") ,  0 ) --/*�A�S���ؼСC
		ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_421192_1") ,  0 ) --/*�A�S���ؼСC

		return false 
	elseif Target ~= 100737  or TargetID() == OwnerID() then 	
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_421192_2") , 0 )   --/*�}���O�q�u���w�f���ϥ�
		ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_421192_2") , 0 )   --/*
		return false
                else
                               return true
	end
        
end

function LuaI_202368_Effect()
		BeginPlot(TargetID() , "LuaI_202368_Reset" , 0 )
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_421192_3"), 0 ); --/*�A�g�X���b���H�F�w�f��������I
		ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_421192_3"), 0 ); --/*�A�g�X���b���H�F�w�f��������I
             		GiveBodyItem(OwnerID() , 541307 , 1 )	
end

function LuaI_202368_Reset()
	LuaFunc_ResetObj( OwnerID() )	
end

-----------------------------��w

Function LuaN_111157()
	while 1 do
		--PlayMotionEX( OwnerID(),ruFUSION_ACTORSTATE_CHANNEL_BEGIN, ruFUSION_ACTORSTATE_CHANNEL_LOOP )
		CastSpell( OwnerID(), OwnerID(), 491264 )
		sleep(250)
	end
end

function LuaN_111157_Quest()
           	Say( OwnerID() , GetString("SC_111157_0") )
	CastSpell( OwnerID(), OwnerID(), 490112 )
                sleep(30)
                Hide( OwnerID() )
	sleep(200)
                Show( OwnerID() , 0 )
end

------------------------- anna
function LuaN_111230_motion()
	while 1 do
		sleep(20)
		PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_CROUCH_BEGIN)
		sleep(50)
		PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_CROUCH_END)
		sleep(30)
		PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_CRAFTING_BEGIN)
		sleep(100)
		PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_CRAFTING_END)
		sleep(300)
	end
end