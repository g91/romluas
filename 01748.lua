--���䪺�����ѥ~�e�] �ĪG

function LuaI_207064( Option ) 
	if ( Option == "CHECK" ) then
		if ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) == 1 then --�I�k��H�O���a
			return true
		else
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MAG08]" , C_SYSTEM )	--�ϥι�H�����T�A�й缾�a�ϥΡC
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_0908SEANSON_MAG08]"  , C_SYSTEM )	--�ϥι�H�����T�A�й缾�a�ϥΡC
			return false
		end
	elseif ( Option == "USE" ) then
		local X = Rand( 100 )    
		if X >= 0 and X <=30  then  
			ScriptMessage( OwnerID() , TargetID() , 1 , "[SC_KR_BLACKVALENTINE_EFFECT01]"  , C_SYSTEM ) --�A��o�F[506338]�ĪG�C
			ScriptMessage( OwnerID() , TargetID() , 0 , "[SC_KR_BLACKVALENTINE_EFFECT01]"  , C_SYSTEM ) --�A��o�F[506338]�ĪG�C
			CastSpell( TargetID(),TargetID(), 494999) --Motion
			AddBuff( TargetID() ,506338,0 ,3600) --�Ѿl��������(60m)  --���M���ʳt�׼W�[(Buff0)%�C
		elseif X >= 31 and X <=60 then
			ScriptMessage( OwnerID() , TargetID() , 1 , "[SC_KR_BLACKVALENTINE_EFFECT02]"  , C_SYSTEM ) --�A��o�F[506337]�ĪG�C
			ScriptMessage( OwnerID() , TargetID() , 0 , "[SC_KR_BLACKVALENTINE_EFFECT02]"  , C_SYSTEM ) --�A��o�F[506337]�ĪG�C
			CastSpell( TargetID(),TargetID(), 494999) --Motion
			AddBuff( TargetID() ,506337,0 ,1800) --�ܦn�Y�������� (30m) --HP�PMP�W���W�[(Buff0)%�C
		elseif X >= 61 and X <= 90 then
			ScriptMessage( OwnerID() , TargetID() , 1 , "[SC_KR_BLACKVALENTINE_EFFECT03]"  , C_SYSTEM ) --�A��o�F���n�Y�������ѮĪG�C
			ScriptMessage( OwnerID() , TargetID() , 0 , "[SC_KR_BLACKVALENTINE_EFFECT03]"  , C_SYSTEM ) --�A��o�F���n�Y�������ѮĪG�C
			CastSpell( TargetID(),TargetID(), 495127) --10%���ͩR��_ 10%���]�O��_
		elseif X >= 91  then
			ScriptMessage( OwnerID() , TargetID() , 1 , "[SC_KR_BLACKVALENTINE_EFFECT04]"  , C_SYSTEM ) --�A��o�F[506339]�ĪG�C
			ScriptMessage( OwnerID() , TargetID() , 0 , "[SC_KR_BLACKVALENTINE_EFFECT04]"  , C_SYSTEM ) --�A��o�F[506339]�ĪG�C
			CastSpell( TargetID(),TargetID(), 494999) --Motion
			AddBuff( TargetID() ,506339,0 ,300) --�Q�R�X�Ӫ�������(5m)  --���ʳt�פU��(Buff0)%�C
		end
	end
end


--�¦�A���ܨ��ĪG �ĪG

function LuaI_207048( Option ) 
	if ( Option == "CHECK" ) then
		if ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) == 1 then --�I�k��H�O���a
			return true
		else
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MAG08]" , C_SYSTEM )	--�ϥι�H�����T�A�й缾�a�ϥΡC
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_0908SEANSON_MAG08]"  , C_SYSTEM )	--�ϥι�H�����T�A�й缾�a�ϥΡC
			return false
		end
	elseif ( Option == "USE" ) then
		local BorG = ReadRoleValue( TargetID() , EM_RoleValue_SEX  )  
		If BorG == 0 then
			CastSpell( TargetID(),TargetID(), 494779) --Motion
			sleep(20)
			AddBuff(TargetID(), 506341  ,0 ,3600) 
		elseif BorG == 1 then
			CastSpell( TargetID(),TargetID(), 494779) --Motion
			sleep(20)
			AddBuff(TargetID(), 506342  ,0 ,3600) 
		end
	end
end