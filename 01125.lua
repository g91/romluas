function LuaI_VBOX( Option )
	local PlayerID = OwnerID()
	local PackageID = 203649		--��P�l������§��
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	local RAND = rand(100)

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then
		
		local BorG = ReadRoleValue( PlayerID , EM_RoleValue_SEX  )  
		sleep(10)
		If BorG == 0 then
			GiveBodyItem( PlayerID , 720301 , 1 )	
		elseif BorG == 1 then
			GiveBodyItem( PlayerID , 724171 , 1 )	
		end

	end
end

--�ȷ�

function LuaYU_112150_20()

	SetSpeakDetail( OwnerID(), "[SC_112150_YU_01]"   )--�C�~�ᯫ�`���ɭԡA�����`�O�}�o�S�O����B�A�R��b�o�ʤH�̪��`��̡A�A�O�_�@�N�I�X�A���u�ߡB�@�ߨӦu�@�A���R���O�H
	AddSpeakOption( OwnerID(), TargetID(), "[SC_112150_YU_02]" , "LuaYU_112150_21", 0 ) --�ᯫ�`���Ѩ�
	AddSpeakOption( OwnerID(), TargetID(), "[SC_VALENTINE_BLESSING_1]" , "Lua_Valentine_blessing_talk", 0 ) --��D�ᯫ������
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_K_09V_112151_6") , "LuaS_112151_20", 0 ) --�ڷQ�s�@�R�����J�O

end

function LuaYU_112150_21()

	SetSpeakDetail( OwnerID(), "[SC_112150_YU_05]"   )--�ᯫ�`���G��
	AddSpeakOption( OwnerID(), TargetID(), "[SC_202800_2]" , "LuaYU_112150_20", 0 ) --�T�{

end

--�M���ʧ@

function LuaYU_112150_30()

	AddBuff( OwnerID() ,502558 ,1 ,-1 ); --�M���W���~   		

end


--�ᯫ�`���� ���Ӫ������ʴ��ի��O

function Lua_flowerevent_every0()  --��Ѧ����k�s
	WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem1 , 0 )  
	time = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem1)  
	Say(OwnerID(), time) 
end

function Lua_flowerevent_every10() --�N��Ѧ���+10
	WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem1 , 10 )  
	time = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem1)  
	Say(OwnerID(), time) 
end

function Lua_flowerevent_everyshow() --show�X��Ѧ���
	time = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem1)  
	Say(OwnerID(), time) 
end

function Lua_flowerevent_total0()  --�N���ʴ����`�����k�s
	WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem2 , 0 )  
	time = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem2)  
	Say(OwnerID(), time) 
end

function Lua_flowerevent_total30() --�N���ʴ����`����+30
	WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem2 , 30 )  
	time = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem2)  
	Say(OwnerID(), time) 
end

function Lua_flowerevent_totalshow()  --show�X���ʴ����`����
	time = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem2)  
	Say(OwnerID(), time)
end
