function LuaInit_110346()
	--SetCursorType( OwnerID(), 1 );
	SetPlot( OwnerID() , "touch" , "LuaCollision_110346" , 150 );

end

function LuaCollision_110346()
--OwnerID���a
--TargetID�a�O
	BeginPlot( TargetID() , "LuaCollision_110346_2" , 0 )  

end

function LuaCollision_110346_2()
--OwnerID�a�O
--TargetID���a

       --int BeginCastBarEvent ( int iObjID, int iClickObjID, const char* pszString, int iTime, int iMotionID, int iMotionEndID, int iFlag, const char* pszLuaEvent )  �s��CastingBar
       --                                     �]  �}bar��  ,    �Q�}��           ,       Bar�W����r   ,        �һݮɶ�   ,  �}�l�ʧ@     ,  �����ʧ@             , ���_�Ҧ�  ,  �s���ƥ� �^
	if BeginCastBarEvent( TargetID(), OwnerID(),"TEST", 50, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "LuaCastCallBackHui" ) ~= 1 then
		ScriptMessage( TargetID(), TargetID(), 0,"[SAY_NPC_BUSY]", 0 );
		return
	end

	

end

function LuaCastCallBackHui( ObjID, CheckStatus )
--OwnerID���a
--TargetID�a�O

		if( CheckStatus ~= 0 ) then

			if( CheckStatus > 0 ) then
				-- ���\
				EndCastBar( OwnerID(), CheckStatus );
				Say( OwnerID(), "GOOD1" );
			else
				-- ����
				EndCastBar( OwnerID(), CheckStatus );
				Say( OwnerID(), "FAILD1" );
			end
		end

end