function Init_RoleData_Value()
	-- ¦ì¸m	
	function Role:X( )
		return ReadRoleValue( self.RoleID , EM_RoleValue_X )
	end
	function Role:Y( )
		return ReadRoleValue( self.RoleID , EM_RoleValue_Y )
	end
	function Role:Z( )
		return ReadRoleValue( self.RoleID , EM_RoleValue_Z )
	end
	function Role:Dir( )
		return ReadRoleValue( self.RoleID , EM_RoleValue_Dir )
	end
	function Role:RoomID( )
		return ReadRoleValue( self.RoleID , EM_RoleValue_RoomID )
	end
	function Role:ZoneID( )
		return ReadRoleValue( self.RoleID , EM_RoleValue_ZoneID )
	end
	function Role:HP()
		return ReadRoleValue( self.RoleID , EM_RoleValue_HP )
	end

	function Role:SetHP( value )
		return WriteRoleValue( self.RoleID , EM_RoleValue_HP , value )
	end	

	function Role:MP()
		return ReadRoleValue( self.RoleID , EM_RoleValue_MP )
	end

	function Role:SetMP( value )
		return WriteRoleValue( self.RoleID , EM_RoleValue_MP , value )
	end	

	function Role:SP()
		return ReadRoleValue( self.RoleID , EM_RoleValue_SP )
	end

	function Role:MaxHP()
		return ReadRoleValue( self.RoleID , EM_RoleValue_MaxHP )
	end

	function Role:MaxMP()
		return ReadRoleValue( self.RoleID , EM_RoleValue_MaxMP )
	end

	function Role:MaxSP()
		return ReadRoleValue( self.RoleID , EM_RoleValue_MaxSP )
	end

	function Role:Race()
		return ReadRoleValue( self.RoleID , EM_RoleValue_RACE )
	end

	function Role:Job()
		return ReadRoleValue( self.RoleID , EM_RoleValue_VOC )
	end

	function Role:SetJob( JobID )
		return WriteRoleValue( self.RoleID , EM_RoleValue_VOC , JobID  )
	end

	function Role:Sex()
		return ReadRoleValue( self.RoleID , EM_RoleValue_SEX)
	end

	function Role:Exp()
		return ReadRoleValue( self.RoleID , EM_RoleValue_EXP)
	end
	
	function Role:ThisLVExp()
		return ReadRoleValue( self.RoleID , EM_RoleValue_ThisLVExp)
	end

	function Role:Level()
		return ReadRoleValue( self.RoleID , EM_RoleValue_LV)
	end

	function Role:SetLevel( Lv)
		return WriteRoleValue( self.RoleID , EM_RoleValue_LV, Lv )
	end


	function Role:Level_Sub()
		return ReadRoleValue( self.RoleID , EM_RoleValue_LV_SUB)
	end

	function Role:Job_Sub()
		return ReadRoleValue( self.RoleID , EM_RoleValue_VOC_SUB )
	end
	
	function Role:SetJob_Sub( JobID )
		return WriteRoleValue( self.RoleID , EM_RoleValue_VOC_SUB , JobID )
	end

	function Role:Point()
		return ReadRoleValue( self.RoleID , EM_RoleValue_Point )
	end
	function Role:SkillPoint()
		return ReadRoleValue( self.RoleID , EM_RoleValue_SkillPoint )
	end
	function Role:Famous()
		return ReadRoleValue( self.RoleID , EM_RoleValue_Famous )
	end
	function Role:IsNPC()
		return ReadRoleValue( self.RoleID , EM_RoleValue_IsNPC ) ~= 0
	end
	function Role:IsPlayer()
		return ReadRoleValue( self.RoleID , EM_RoleValue_IsPlayer) ~= 0
	end
	function Role:IsDead()
		return ReadRoleValue( self.RoleID , EM_RoleValue_IsDead) ~= 0
	end
	
	function Role:OrgID()
		return ReadRoleValue( self.RoleID , EM_RoleValue_OrgID)
	end
	function Role:AttackTargetID()
		return ReadRoleValue( self.RoleID , EM_RoleValue_AttackTargetID )
	end
	function Role:PID()
		return ReadRoleValue( self.RoleID , EM_RoleValue_PID )
	end
	function Role:SetPID( Value )
		WriteRoleValue( self.RoleID , EM_RoleValue_PID , Value )
	end

	
	function Role:MaxHit()
		return ReadRoleValue( self.RoleID, EM_RoleValue_MaxHit );
	end
	
	function Role:SetEq( Pos , ItemID )
		return SetRoleEq_Player( self.RoleID , Pos , ItemID )
	end
	
	function Role:SetExp( Exp )
		return WriteRoleValue( self.RoleID , EM_RoleValue_EXP , Exp )
	end

	function Role:SetStr( Value )
		return WriteRoleValue( self.RoleID , EM_RoleValue_STR , Value )
	end
	function Role:SetSta( Value )
		return WriteRoleValue( self.RoleID , EM_RoleValue_STA , Value )
	end
	function Role:SetAgi( Value )
		return WriteRoleValue( self.RoleID , EM_RoleValue_AGI , Value )
	end
	function Role:SetInt( Value )
		return WriteRoleValue( self.RoleID , EM_RoleValue_INT , Value )
	end
	function Role:SetMnd( Value )
		return WriteRoleValue( self.RoleID , EM_RoleValue_MND, Value )
	end
	function Role:IsAttack( )
		if ReadRoleValue( self.RoleID , EM_RoleValue_AttackTargetID ) ~= 0 then 
			return true
		end
		return false;

	end
	function Role:GetDBID( )
		return ReadRoleValue( self.RoleID , EM_RoleValue_DBID ) 

	end
	function Role:ZoneID( )
		return ReadRoleValue( self.RoleID , EM_RoleValue_ZoneID ) 

	end
end