
function LuaS_MOUTH_SHOP_A2()
	if CheckBuff( OwnerID() , 501570) == false then  --�W�[�ˬd�P�_
		DialogCreate( OwnerID() , EM_LuaDialogType_YesNo  , GetString("SAY_MOUTH_SHOP_A")); --/*���ɴİ��ݭn 9 �ȡA�T�w���ɶܡH
		DialogSelectStr( OwnerID() , GetString("SO_YES") );
		DialogSelectStr( OwnerID() , GetString("SO_NO") );
		AddBuff(OwnerID() , 501570,0,-1);--�M�ᵹ��BUFF
		if( DialogSendOpen( OwnerID() ) == false ) then 
			ScriptMessage( OwnerID(),OwnerID(),1,GetString("SYS_FIXEQ_DATA_ERROR"),0)	
			--��ưe�X�����D
			return;
		end
		local SelectID = Hsiang_GetDialogResoult( OwnerID() );
		DialogClose( OwnerID() )
		CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
		if SelectID == 0  then
	--		local Mount = {[1]=501417,[2]=501418,[3]=501440,[4]=501441,[5]=501444,[6]=501445,[7]=501446}
			local Mount = {[1]=201482,[2]=201488,[3]=201489,[4]=201490,[5]=201468,[6]=201469,[7]=201470,[8]=200876,[9]=200877,[10]=200878,[11]=200879}
			local Check = 0
			for i = 1 , table.getn(Mount),1 do
	--			if CheckBuff( OwnerID() , Mount[i] ) == true then
				if CountBodyItem( OwnerID() , Mount[i] ) > 0 then
					Check = 1
				end
			end 
			if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) < 300 then
				ScriptMessage( OwnerID(), TargetID(), 1, GetString("SAY_MOUTH_ERROR_A"), 0 ); --/*�A���W���������C
			elseif Check == 1 then
				ScriptMessage( OwnerID(), TargetID(), 1, GetString("SAY_MOUTH_ERROR_B"), 0 ); 
			else
				if AddRoleValue( OwnerID() , EM_RoleValue_Money , -300 ) then
	--				CastSpell( OwnerID() , TargetID() , 491075 )
					GiveBodyItem( OwnerID() , 201489 , 1 )
				end
			end
			return 
		elseif SelectID == 1  then
			return 
		else 
			return
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	end
end

function LuaS_MOUTH_SHOP_B2()
	if CheckBuff( OwnerID() , 501570) == false then  --�W�[�ˬd�P�_
		DialogCreate( OwnerID() , EM_LuaDialogType_YesNo  , GetString("SAY_MOUTH_SHOP_B")); --/*���ɥհ��ݭn 9 �ȡA�T�w���ɶܡH
		DialogSelectStr( OwnerID() , GetString("SO_YES") );
		DialogSelectStr( OwnerID() , GetString("SO_NO") );
		AddBuff(OwnerID() , 501570,0,-1);--�M�ᵹ��BUFF
		if( DialogSendOpen( OwnerID() ) == false ) then 
			ScriptMessage( OwnerID(),OwnerID(),1,GetString("SYS_FIXEQ_DATA_ERROR"),0)	
			--��ưe�X�����D
			return;
		end
		local SelectID = Hsiang_GetDialogResoult( OwnerID() );
		DialogClose( OwnerID() )
		CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF

		if SelectID == 0  then
	--		local Mount = {[1]=501417,[2]=501418,[3]=501440,[4]=501441,[5]=501444,[6]=501445,[7]=501446}
			local Mount = {[1]=201482,[2]=201488,[3]=201489,[4]=201490,[5]=201468,[6]=201469,[7]=201470,[8]=200876,[9]=200877,[10]=200878,[11]=200879}
			local Check = 0
			for i = 1 , table.getn(Mount),1 do
	--			if CheckBuff( OwnerID() , Mount[i] ) == true then
				if CountBodyItem( OwnerID() , Mount[i] ) > 0 then
					Check = 1
				end
			end 
			if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) < 300 then
				ScriptMessage( OwnerID(), TargetID(), 1, GetString("SAY_MOUTH_ERROR_A"), 0 ); --/*�A���W���������C
			elseif Check == 1 then
				ScriptMessage( OwnerID(), TargetID(), 1, GetString("SAY_MOUTH_ERROR_B"), 0 ); 
			else
				if AddRoleValue( OwnerID() , EM_RoleValue_Money , -300 ) then
	--				CastSpell( OwnerID() , TargetID() , 491035 )
					GiveBodyItem( OwnerID() , 201482 , 1 )
				end
			end
			return 
		elseif SelectID == 1  then
			return 
		else 
			return
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	end
end

function LuaS_MOUTH_SHOP_C2()
	if CheckBuff( OwnerID() , 501570) == false then  --�W�[�ˬd�P�_
		DialogCreate( OwnerID() , EM_LuaDialogType_YesNo  , GetString("SAY_MOUTH_SHOP_C")); --/*���ɪᴳ���ݭn 9 �ȡA�T�w���ɶܡH
		DialogSelectStr( OwnerID() , GetString("SO_YES") );
		DialogSelectStr( OwnerID() , GetString("SO_NO") );
		AddBuff(OwnerID() , 501570,0,-1);--�M�ᵹ��BUFF
		if( DialogSendOpen( OwnerID() ) == false ) then 
			ScriptMessage( OwnerID(),OwnerID(),1,GetString("SYS_FIXEQ_DATA_ERROR"),0)	
			--��ưe�X�����D
			return;
		end
		local SelectID = Hsiang_GetDialogResoult( OwnerID() );
		DialogClose( OwnerID() )
		CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF

		if SelectID == 0  then
	--		local Mount = {[1]=501417,[2]=501418,[3]=501440,[4]=501441,[5]=501444,[6]=501445,[7]=501446}
			local Mount = {[1]=201482,[2]=201488,[3]=201489,[4]=201490,[5]=201468,[6]=201469,[7]=201470,[8]=200876,[9]=200877,[10]=200878,[11]=200879}
			local Check = 0
			for i = 1 , table.getn(Mount),1 do
	--			if CheckBuff( OwnerID() , Mount[i] ) == true then
				if CountBodyItem( OwnerID() , Mount[i] ) > 0 then
					Check = 1
				end
			end 
			if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) < 300 then
				ScriptMessage( OwnerID(), TargetID(), 1, GetString("SAY_MOUTH_ERROR_A"), 0 ); --/*�A���W���������C
			elseif Check == 1 then
				ScriptMessage( OwnerID(), TargetID(), 1, GetString("SAY_MOUTH_ERROR_B"), 0 ); 
			else
				if AddRoleValue( OwnerID() , EM_RoleValue_Money , -300 ) then
	--				CastSpell( OwnerID() , TargetID() , 491074 )
					GiveBodyItem( OwnerID() , 201488 , 1 )
				end
			end
			return 
		elseif SelectID == 1  then
			return 
		else 
			return
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	end
end

function LuaS_MOUTH_SHOP_D2()
	if CheckBuff( OwnerID() , 501570) == false then  --�W�[�ˬd�P�_
		DialogCreate( OwnerID() , EM_LuaDialogType_YesNo  , GetString("SAY_MOUTH_SHOP_D")); --/*���ɶ°��ݭn 9 �ȡA�T�w���ɶܡH
		DialogSelectStr( OwnerID() , GetString("SO_YES") );
		DialogSelectStr( OwnerID() , GetString("SO_NO") );
		AddBuff(OwnerID() , 501570,0,-1);--�M�ᵹ��BUFF
		if( DialogSendOpen( OwnerID() ) == false ) then 
			ScriptMessage( OwnerID(),OwnerID(),1,GetString("SYS_FIXEQ_DATA_ERROR"),0)	
			--��ưe�X�����D
			return;
		end
		local SelectID = Hsiang_GetDialogResoult( OwnerID() );
		DialogClose( OwnerID() )
		CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF

		if SelectID == 0  then
	--		local Mount = {[1]=501417,[2]=501418,[3]=501440,[4]=501441,[5]=501444,[6]=501445,[7]=501446}
			local Mount = {[1]=201482,[2]=201488,[3]=201489,[4]=201490,[5]=201468,[6]=201469,[7]=201470,[8]=200876,[9]=200877,[10]=200878,[11]=200879}
			local Check = 0
			for i = 1 , table.getn(Mount),1 do
	--			if CheckBuff( OwnerID() , Mount[i] ) == true then
				if CountBodyItem( OwnerID() , Mount[i] ) > 0 then
					Check = 1
				end
			end 
			if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) < 300 then
				ScriptMessage( OwnerID(), TargetID(), 1, GetString("SAY_MOUTH_ERROR_A"), 0 ); --/*�A���W���������C
			elseif Check == 1 then
				ScriptMessage( OwnerID(), TargetID(), 1, GetString("SAY_MOUTH_ERROR_B"), 0 ); 
			else
				if AddRoleValue( OwnerID() , EM_RoleValue_Money , -300 ) then
	--				CastSpell( OwnerID() , TargetID() , 491076 )
					GiveBodyItem( OwnerID() , 201490 , 1 )
				end
			end
			return 
		elseif SelectID == 1  then
			return 
		else 
			return
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	end
end


function LuaS_MOUTH_SHOP_A3()
	if CheckBuff( OwnerID() , 501570) == false then  --�W�[�ˬd�P�_
		DialogCreate( OwnerID() , EM_LuaDialogType_YesNo  , GetString("SAY_MOUTH_SHOP_AA")); --/*���ɴİ��ݭn 9 �ȡA�T�w���ɶܡH
		DialogSelectStr( OwnerID() , GetString("SO_YES") );
		DialogSelectStr( OwnerID() , GetString("SO_NO") );
		AddBuff(OwnerID() , 501570,0,-1);--�M�ᵹ��BUFF
		if( DialogSendOpen( OwnerID() ) == false ) then 
			ScriptMessage( OwnerID(),OwnerID(),1,GetString("SYS_FIXEQ_DATA_ERROR"),0)	
			--��ưe�X�����D
			return;
		end
		local SelectID = Hsiang_GetDialogResoult( OwnerID() );
		DialogClose( OwnerID() )
		CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF

		if SelectID == 0  then
	--		local Mount = {[1]=501417,[2]=501418,[3]=501440,[4]=501441,[5]=501444,[6]=501445,[7]=501446}
			local Mount = {[1]=201482,[2]=201488,[3]=201489,[4]=201490,[5]=201468,[6]=201469,[7]=201470,[8]=200876,[9]=200877,[10]=200878,[11]=200879}
			local Check = 0
			for i = 1 , table.getn(Mount),1 do
	--			if CheckBuff( OwnerID() , Mount[i] ) == true then
				if CountBodyItem( OwnerID() , Mount[i] ) > 0 then
					Check = 1
				end
			end 
			if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) < 3000 then
				ScriptMessage( OwnerID(), TargetID(), 1, GetString("SAY_MOUTH_ERROR_A"), 0 ); --/*�A���W���������C
			elseif Check == 1 then
				ScriptMessage( OwnerID(), TargetID(), 1, GetString("SAY_MOUTH_ERROR_B"), 0 ); 
			else
				if AddRoleValue( OwnerID() , EM_RoleValue_Money , -3000 ) then
	--				CastSpell( OwnerID() , TargetID() , 492039)
					GiveBodyItem( OwnerID() , 200878 , 1 )
				end
			end
			return 
		elseif SelectID == 1  then
			return 
		else 
			return
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	end
end

function LuaS_MOUTH_SHOP_B3()
	if CheckBuff( OwnerID() , 501570) == false then  --�W�[�ˬd�P�_
		DialogCreate( OwnerID() , EM_LuaDialogType_YesNo  , GetString("SAY_MOUTH_SHOP_BB")); --/*���ɥհ��ݭn 9 �ȡA�T�w���ɶܡH
		DialogSelectStr( OwnerID() , GetString("SO_YES") );
		DialogSelectStr( OwnerID() , GetString("SO_NO") );
		AddBuff(OwnerID() , 501570,0,-1);--�M�ᵹ��BUFF
		if( DialogSendOpen( OwnerID() ) == false ) then 
			ScriptMessage( OwnerID(),OwnerID(),1,GetString("SYS_FIXEQ_DATA_ERROR"),0)	
			--��ưe�X�����D
			return;
		end
		local SelectID = Hsiang_GetDialogResoult( OwnerID() );
		DialogClose( OwnerID() )
		CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF

		if SelectID == 0  then
	--		local Mount = {[1]=501417,[2]=501418,[3]=501440,[4]=501441,[5]=501444,[6]=501445,[7]=501446}
			local Mount = {[1]=201482,[2]=201488,[3]=201489,[4]=201490,[5]=201468,[6]=201469,[7]=201470,[8]=200876,[9]=200877,[10]=200878,[11]=200879}
			local Check = 0
			for i = 1 , table.getn(Mount),1 do
	--			if CheckBuff( OwnerID() , Mount[i] ) == true then
				if CountBodyItem( OwnerID() , Mount[i] ) > 0 then
					Check = 1
				end
			end 
			if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) < 3000 then
				ScriptMessage( OwnerID(), TargetID(), 1, GetString("SAY_MOUTH_ERROR_A"), 0 ); --/*�A���W���������C
			elseif Check == 1 then
				ScriptMessage( OwnerID(), TargetID(), 1, GetString("SAY_MOUTH_ERROR_B"), 0 ); 
			else
				if AddRoleValue( OwnerID() , EM_RoleValue_Money , -3000 ) then
	--				CastSpell( OwnerID() , TargetID() , 492040 )
					GiveBodyItem( OwnerID() , 200876 , 1 )
				end
			end
			return 
		elseif SelectID == 1  then
			return 
		else 
			return
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	end
end

function LuaS_MOUTH_SHOP_C3()
	if CheckBuff( OwnerID() , 501570) == false then  --�W�[�ˬd�P�_
		DialogCreate( OwnerID() , EM_LuaDialogType_YesNo  , GetString("SAY_MOUTH_SHOP_CC")); --/*���ɪᴳ���ݭn 9 �ȡA�T�w���ɶܡH
		DialogSelectStr( OwnerID() , GetString("SO_YES") );
		DialogSelectStr( OwnerID() , GetString("SO_NO") );
		AddBuff(OwnerID() , 501570,0,-1);--�M�ᵹ��BUFF
		if( DialogSendOpen( OwnerID() ) == false ) then 
			ScriptMessage( OwnerID(),OwnerID(),1,GetString("SYS_FIXEQ_DATA_ERROR"),0)	
			--��ưe�X�����D
			return;
		end
		local SelectID = Hsiang_GetDialogResoult( OwnerID() );
		DialogClose( OwnerID() )
		CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF

		if SelectID == 0  then
	--		local Mount = {[1]=501417,[2]=501418,[3]=501440,[4]=501441,[5]=501444,[6]=501445,[7]=501446}
			local Mount = {[1]=201482,[2]=201488,[3]=201489,[4]=201490,[5]=201468,[6]=201469,[7]=201470,[8]=200876,[9]=200877,[10]=200878,[11]=200879}
			local Check = 0
			for i = 1 , table.getn(Mount),1 do
	--			if CheckBuff( OwnerID() , Mount[i] ) == true then
				if CountBodyItem( OwnerID() , Mount[i] ) > 0 then
					Check = 1
				end
			end 
			if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) < 3000 then
				ScriptMessage( OwnerID(), TargetID(), 1, GetString("SAY_MOUTH_ERROR_A"), 0 ); --/*�A���W���������C
			elseif Check == 1 then
				ScriptMessage( OwnerID(), TargetID(), 1, GetString("SAY_MOUTH_ERROR_B"), 0 ); 
			else
				if AddRoleValue( OwnerID() , EM_RoleValue_Money , -3000 ) then
	--				CastSpell( OwnerID() , TargetID() , 492041)
					GiveBodyItem( OwnerID() , 200877 , 1 )
				end
			end
			return 
		elseif SelectID == 1  then
			return 
		else 
			return
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	end
end

function LuaS_MOUTH_SHOP_D3()
	if CheckBuff( OwnerID() , 501570) == false then  --�W�[�ˬd�P�_
		DialogCreate( OwnerID() , EM_LuaDialogType_YesNo  , GetString("SAY_MOUTH_SHOP_DD")); --/*���ɶ°��ݭn 9 �ȡA�T�w���ɶܡH
		DialogSelectStr( OwnerID() , GetString("SO_YES") );
		DialogSelectStr( OwnerID() , GetString("SO_NO") );
		AddBuff(OwnerID() , 501570,0,-1);--�M�ᵹ��BUFF
		if( DialogSendOpen( OwnerID() ) == false ) then 
			ScriptMessage( OwnerID(),OwnerID(),1,GetString("SYS_FIXEQ_DATA_ERROR"),0)	
			--��ưe�X�����D
			return;
		end
		local SelectID = Hsiang_GetDialogResoult( OwnerID() );
		DialogClose( OwnerID() )
		CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF

		if SelectID == 0  then
	--		local Mount = {[1]=501417,[2]=501418,[3]=501440,[4]=501441,[5]=501444,[6]=501445,[7]=501446}
			local Mount = {[1]=201482,[2]=201488,[3]=201489,[4]=201490,[5]=201468,[6]=201469,[7]=201470,[8]=200876,[9]=200877,[10]=200878,[11]=200879}
			local Check = 0
			for i = 1 , table.getn(Mount),1 do
	--			if CheckBuff( OwnerID() , Mount[i] ) == true then
				if CountBodyItem( OwnerID() , Mount[i] ) > 0 then
					Check = 1
				end
			end 
			if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) < 3000 then
				ScriptMessage( OwnerID(), TargetID(), 1, GetString("SAY_MOUTH_ERROR_A"), 0 ); --/*�A���W���������C
			elseif Check == 1 then
				ScriptMessage( OwnerID(), TargetID(), 1, GetString("SAY_MOUTH_ERROR_B"), 0 ); 
			else
				if AddRoleValue( OwnerID() , EM_RoleValue_Money , -3000 ) then
	--				CastSpell( OwnerID() , TargetID() , 492042 )
					GiveBodyItem( OwnerID() , 200879 , 1 )
				end
			end
			return 
		elseif SelectID == 1  then
			return 
		else 
			return
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	end
end