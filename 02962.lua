
--[[

�Q�������ۤU�t�ˡA
�H�᯸�_�l���D���A
��F�w�]���I���ɭԡA�b����԰����աC

]]--

function angryDinaya()

	local Is_once = false
	local x = ReadRoleValue(OwnerID(), EM_RoleValue_X ); 
	local y = ReadRoleValue(OwnerID(), EM_RoleValue_Y); 
	local z =ReadRoleValue(OwnerID(), EM_RoleValue_Z ); 





	say( TargetID(), "Hey!!YOU ANGRY ME" );


	local Add_X,Add_Y,Add_Z,Add_DIR = DW_Location(TargetID());		--�ھڪ����m �ͦ�����
	ReadRoleValue(TargetID(),EM_RoleValue_Dir) 
	local Obj=CreateObj(122622,Add_X,Add_Y,Add_Z,Add_DIR,1);
	AddToPartition(Obj,0); 


	move(TargetID(), x ,y ,z)


		say( TargetID(), "DONE!!001" );



	CallPlot(TargetID(), "gotoAndPlay",x, z,TargetID())			--������P�_ (�B��CallPlot)
	--CallPlot(TargetID(), "gotoAndPlayEX",10)				--������P�_ (�B��BegingPlot) (NOT WORK!!!)
	
	--[[

	while Is_once == false do

		if ReadRoleValue(TargetID(), EM_RoleValue_Z ) == z and ReadRoleValue(TargetID(), EM_RoleValue_X) == x then

			say( TargetID(), "DONE!!002" );
			PlayMotionEX(TargetID(),ruFUSION_ACTORSTATE_CROUCH_BEGIN,ruFUSION_ACTORSTATE_CROUCH_LOOP	) 

			Is_once = true
		end

	end

	]]--





--[[
		SetDefIdleMotion(TargetID(),ruFUSION_ACTORSTATE_CROUCH_BEGIN) 

		Sleep( 30); 

		SetDefIdleMotion(TargetID(),ruFUSION_ACTORSTATE_DEAD) 

		Sleep( 30); 

		SetDefIdleMotion(TargetID(),ruFUSION_ACTORSTATE_REVIVING) 
--]]

		

	moveToFlagEnabled( OwnerID(), false );

end

	--LuaFunc_WaitMoveTo( OwnerID(), x , y , z ) 
	--PlayMotion( Target(),ruFUSION_ACTORSTATE_DYING)
	--SetDefIdleMotion(OwnerID(),ruFUSION_ACTORSTATE_DEAD) 
	--SetDefIdleMotion(OwnerID(),ruFUSION_ACTORSTATE_DYING) 
 	--PlayMotionEX(TargetID(),ruFUSION_ACTORSTATE_CROUCH_BEGIN) 