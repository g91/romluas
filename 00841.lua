
function Check_Relation( Player , RelationType )

	local RelationPosTotal = 20

	for i = 0 , RelationPosTotal - 1 do
		if ( GetRelation_Relation( Player , i ) == RelationType ) then 
			return true
		end
	end

	return false

end

function Get_RelationPos( Player , RelationType )

	local RelationPosTotal = 20
	
	for i = 0 , RelationPosTotal - 1 do
		if ( GetRelation_Relation( Player , i ) == RelationType ) then
			return i
		end
	end
end


function lua_mika_zoneidtest1()  --���ҥΪ� 
	local selfdbid = ReadRoleValue(OwnerID(), EM_RoleValue_DBID ) 
	local targetdbid = GetRelation_DBID( OwnerID() , Get_RelationPos( OwnerID() , EM_RelationType_Wife ) )  --��誺DBID
	local MyZoneID =  ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )  -- �ۤv��zone id
	local MyZone = MyZoneID -1000*math.floor( MyZoneID / 1000 )
	local targetzoneID = GetZoneID( targetdbid ) 
	local targetzone = targetzoneID -1000*math.floor( targetzoneID / 1000 ) 
	Say(OwnerID(), selfdbid )
	Say(OwnerID(), targetdbid )
	Say(OwnerID(), MyZone)
	Say(OwnerID(), targetzoneID)
end

function lua_mika_zoneidtest2()  --���d�Ϊ� 
	local selfdbid = ReadRoleValue(OwnerID(), EM_RoleValue_DBID ) 
	local targetdbid = GetRelation_DBID( OwnerID() , Get_RelationPos( OwnerID() , EM_RelationType_Husband ) )  --��誺DBID
	local MyZoneID =  ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )  -- �ۤv��zone id
	local MyZone = MyZoneID -1000*math.floor( MyZoneID / 1000 )
	local targetzoneID = GetZoneID( targetdbid ) 
	local targetzone = targetzoneID -1000*math.floor( targetzoneID / 1000 ) 
	Say(OwnerID(), selfdbid )
	Say(OwnerID(), targetdbid )
	Say(OwnerID(), MyZone)
	Say(OwnerID(), targetzoneID)
end

--�C���c��B��
function LuaQ_202817_MarryTransfer( Option )		-- �k�B�٨ϥ�
	local IamH = Check_Relation( OwnerID() , EM_RelationType_Husband )  --
	local IamW = Check_Relation( OwnerID() , EM_RelationType_Wife  )  
	local YouH = Check_Relation( OwnerID() , EM_RelationType_Husband )  --
	local YouW = Check_Relation( OwnerID() , EM_RelationType_Wife  )  --

	if ( Option == "CHECK" ) then
		if  IamW  == true then   --�ڦ��S�ѱC
			local selfdbid = ReadRoleValue(OwnerID(), EM_RoleValue_DBID ) 
			local targetdbid = GetRelation_DBID( OwnerID() , Get_RelationPos( OwnerID() , EM_RelationType_Wife ) )  --��誺DBID
			local online =  CheckOnlinePlayer(GetRelation_DBID( OwnerID() , Get_RelationPos( OwnerID() , EM_RelationType_Wife ) ) )  -- ���b���b�u�W
			local MyZoneID =  ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )  -- �ۤv��zone id
			local MyZone = MyZoneID -1000*math.floor( MyZoneID / 1000 )
			local targetzoneID = GetZoneID( targetdbid ) 
			local targetzone = targetzoneID -1000*math.floor( targetzoneID / 1000 ) 

	--		Say(OwnerID(), selfdbid )
	--		Say(OwnerID(), targetdbid )
	--		Say(OwnerID(), MyZone)
	--		Say(OwnerID(), targetzoneID)
			--�P�_�ۤv�b���b�Գ�
			if MyZone == 402 or MyZone == 440 or MyZone == 441 or MyZone == 442 or MyZone == 443 or MyZone == 444 or MyZone == 445 or MyZone == 446 or MyZone == 354 then  --�p�G�ۤv�b�Գ�
				ScriptMessage(OwnerID(),OwnerID(),1, "[SC_MARRY_RING_01]" , 0 ) --�A�L�k�b���ϰ�L�k�i��ǰe�I
				return false
			elseif targetzone == -1 then --�p�G���b�Գ�
				ScriptMessage(OwnerID(),OwnerID(),1, "[SC_MARRY_RING_02]" , 0 ) --���ثe�Ҧb��m�L�k�i��ǰe�I
				return false
			else
			--	Say(OwnerID(), targetdbid)
				if online == TRUE then  
					--�b�u�W
				--	say(OwnerID(), "online")
				--	Say(OwnerID(), MyZoneID)
				--	Say(OwnerID(), MyZone)
					if MyZoneID >= 1000 then  --�����y���@��ZONE 
				--		Say(OwnerID(), "YOU CAN GO 1 !") --�L���y���@��ZONE 
						if targetzoneID >= 1000 then  --�����y���@��ZONE(���)
							return true
						else
							if targetzoneID >= 100 then --�p�G�Ҧb�ϰ�W�L100 (�Y�D�@��zone)(���)
							--	Say(OwnerID(), targetzone)
								ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MARRY_RING_02]" , 0 )		-- �L�k�ǰe�A���ثe�Ҧb��m�L�k�i��ǰe�C
								return FALSE
							end
						end
					else  
						if MyZoneID >= 100 then --�p�G�کҦb�ϰ�W�L100 (�Y�D�@��zone)
								ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MARRY_RING_01]" , 0 )		-- �L�k�ǰe�A�A�L�k�b���ϰ�L�k�i��ǰe�C
								return FALSE
						else  
					--		Say(OwnerID(), "YOU CAN GO 2 ") --�L���y���@��ZONE 
						--	Say(OwnerID(), targetdbid)
						--	Say(OwnerID(), targetzoneID)

							if targetzoneID >= 1000 then  --�����y���@��ZONE(���)
								return true
							else
								if targetzone >= 100 then --�p�G�Ҧb�ϰ�W�L100 (�Y�D�@��zone)(���)
								--	Say(OwnerID(), targetzone)
									ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MARRY_RING_02]" , 0 )		-- �L�k�ǰe�A���ثe�Ҧb��m�L�k�i��ǰe�C
									return FALSE
								else
									return true
								end
							end
						end
					end
				else
					--���b�u�W
				--	say(OwnerID(), "offline")
					ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("SC_MARRY_33") , 0 )		-- �L�k�ǰe�A�A���t���ثe���b�u�W�άO���b�ƥ����I�I
					return false
				end

			end
		else
			--�S�ѱC
			ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("SC_MARRY_32") , 0 )		-- �L�k�ǰe�A�A�|���إ߱B�����Y�I�I
			return false
		end
	elseif ( Option == "USE" ) then
		GotoPlayer_DBID( OwnerID(), GetRelation_DBID( OwnerID() , Get_RelationPos( OwnerID() , EM_RelationType_Wife ) ) )  --�h�ѱC����m
	end
end

function LuaQ_202818_MarryTransfer( Option )		-- �k�B�٨ϥ�
	local IamH = Check_Relation( OwnerID() , EM_RelationType_Husband )  --
	local IamW = Check_Relation( OwnerID() , EM_RelationType_Wife  )  
	local YouH = Check_Relation( OwnerID() , EM_RelationType_Husband )  --
	local YouW = Check_Relation( OwnerID() , EM_RelationType_Wife  )  --
	if ( Option == "CHECK" ) then
		if  IamH  == true then   --�ڦ��S�Ѥ�
			local selfdbid = ReadRoleValue(OwnerID(), EM_RoleValue_DBID ) 
			local targetdbid = GetRelation_DBID( OwnerID() , Get_RelationPos( OwnerID() , EM_RelationType_Husband ) )  --��誺DBID
			local online =  CheckOnlinePlayer(GetRelation_DBID( OwnerID() , Get_RelationPos( OwnerID() , EM_RelationType_Husband ) ) )  -- ���b���b�u�W
			local MyZoneID =  ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )  -- �ۤv��zone id
			local MyZone = MyZoneID -1000*math.floor( MyZoneID / 1000 )
			local targetzoneID = GetZoneID( targetdbid ) 
			local targetzone = targetzoneID -1000*math.floor( targetzoneID / 1000 ) 

	--		Say(OwnerID(), selfdbid )
	--		Say(OwnerID(), targetdbid )
	--		Say(OwnerID(), MyZone)
	--		Say(OwnerID(), targetzoneID)
			--�P�_�ۤv�b���b�Գ�
			if MyZone == 402 or MyZone == 440 or MyZone == 441 or MyZone == 442 or MyZone == 443 or MyZone == 444 or MyZone == 445 or MyZone == 446 or MyZone == 354 then  --�p�G�ۤv�b�Գ�
				ScriptMessage(OwnerID(),OwnerID(),1, "[SC_MARRY_RING_01]" , 0 ) --�A�L�k�b���ϰ�L�k�i��ǰe�I
				return false
			elseif targetzone == -1 then --�p�G���b�Գ�
				ScriptMessage(OwnerID(),OwnerID(),1, "[SC_MARRY_RING_02]" , 0 ) --���ثe�Ҧb��m�L�k�i��ǰe�I
				return false
			else
				if online == TRUE then
					--�b�u�W
				--	say(OwnerID(), "online")
					if MyZoneID >= 1000 then  --�����y���@��ZONE 
				--		Say(OwnerID(), "YOU CAN GO 1 !") --�L���y���@��ZONE 
						if targetzoneID >= 1000 then  --�����y���@��ZONE(���)
							return true
						else
							if targetzoneID >= 100 then --�p�G�Ҧb�ϰ�W�L100 (�Y�D�@��zone)(���)
							--	Say(OwnerID(), targetzone)
								ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MARRY_RING_02]" , 0 )		-- �L�k�ǰe�A���ثe�Ҧb��m�L�k�i��ǰe�C
								return FALSE
							end
						end
					else  
						if MyZoneID >= 100 then --�p�G�کҦb�ϰ�W�L100 (�Y�D�@��zone)
								ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MARRY_RING_01]" , 0 )		-- �L�k�ǰe�A�A�L�k�b���ϰ�L�k�i��ǰe�C
								return FALSE
						else  
					--		Say(OwnerID(), "YOU CAN GO 2 ") --�L���y���@��ZONE 
						--	Say(OwnerID(), targetdbid)
						--	Say(OwnerID(), targetzoneID)

							if targetzoneID >= 1000 then  --�����y���@��ZONE(���)
								return true
							else
								if targetzone >= 100 then --�p�G�Ҧb�ϰ�W�L100 (�Y�D�@��zone)(���)
								--	Say(OwnerID(), targetzone)
									ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MARRY_RING_02]" , 0 )		-- �L�k�ǰe�A���ثe�Ҧb��m�L�k�i��ǰe�C
									return FALSE
								else
									return true
								end
							end
						end
					end
				else
					--���b�u�W
				--	say(OwnerID(), "offline")
					ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("SC_MARRY_33") , 0 )		-- �L�k�ǰe�A�A���t���ثe���b�u�W�άO���b�ƥ����I�I
					return false
				end
			end
		else
			--�S�Ѥ�
			ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("SC_MARRY_32") , 0 )		-- �L�k�ǰe�A�A�|���إ߱B�����Y�I�I
			return false
		end
	elseif ( Option == "USE" ) then
		GotoPlayer_DBID( OwnerID() , GetRelation_DBID( OwnerID(), Get_RelationPos( OwnerID() , EM_RelationType_Husband ) ) )  --�h�Ѥ�����m
	end
end

function LuaQ_202543_MarryTransfer( Option )		-- �k�B�٨ϥ�
	local IamH = Check_Relation( OwnerID() , EM_RelationType_Husband )  --
	local IamW = Check_Relation( OwnerID() , EM_RelationType_Wife  )  
	local YouH = Check_Relation( OwnerID() , EM_RelationType_Husband )  --
	local YouW = Check_Relation( OwnerID() , EM_RelationType_Wife  )  --
	local Player = OwnerID()
	if ( Option == "CHECK" ) then
		if  IamW  == true then   --�ڦ��S�ѱC
			local selfdbid = ReadRoleValue(OwnerID(), EM_RoleValue_DBID ) 
			local targetdbid = GetRelation_DBID( OwnerID() , Get_RelationPos( OwnerID() , EM_RelationType_Wife ) )  --��誺DBID
			local online =  CheckOnlinePlayer(GetRelation_DBID( OwnerID() , Get_RelationPos( OwnerID() , EM_RelationType_Wife ) ) )  -- ���b���b�u�W
			local MyZoneID =  ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )  -- �ۤv��zone id
			local MyZone = MyZoneID -1000*math.floor( MyZoneID / 1000 )
			local targetzoneID = GetZoneID( targetdbid ) 
			local targetzone = targetzoneID -1000*math.floor( targetzoneID / 1000 ) 
	--		Say(OwnerID(), selfdbid )
	--		Say(OwnerID(), targetdbid )
	--		Say(OwnerID(), MyZone)
	--		Say(OwnerID(), targetzoneID)
			--�P�_�ۤv�b���b�Գ�
			if MyZone == 402 or MyZone == 440 or MyZone == 441 or MyZone == 442 or MyZone == 443 or MyZone == 444 or MyZone == 445 or MyZone == 446 or MyZone == 354 then  --�p�G�ۤv�b�Գ�
				ScriptMessage(OwnerID(),OwnerID(),1, "[SC_MARRY_RING_01]" , 0 ) --�A�L�k�b���ϰ�L�k�i��ǰe�I
				return false
			elseif targetzone == -1 then --�p�G���b�Գ�
				ScriptMessage(OwnerID(),OwnerID(),1, "[SC_MARRY_RING_02]" , 0 ) --���ثe�Ҧb��m�L�k�i��ǰe�I
				return false
			else	
				if online == TRUE then
					--�b�u�W
				--	say(OwnerID(), "online")
					if CountBodyItem( Player , 202545 ) >= 1 then
					--	Say(OwnerID(), MyZoneID)
					--	Say(OwnerID(), MyZone)
						if MyZoneID >= 1000 then  --�����y���@��ZONE 
					--		Say(OwnerID(), "YOU CAN GO 1 !") --�L���y���@��ZONE 
							if targetzoneID >= 1000 then  --�����y���@��ZONE(���)
								return true
							else
								if targetzoneID >= 100 then --�p�G�Ҧb�ϰ�W�L100 (�Y�D�@��zone)(���)
								--	Say(OwnerID(), targetzone)
									ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MARRY_RING_02]" , 0 )		-- �L�k�ǰe�A���ثe�Ҧb��m�L�k�i��ǰe�C
									return FALSE
								end
							end
						else  
							if MyZoneID >= 100 then --�p�G�کҦb�ϰ�W�L100 (�Y�D�@��zone)
									ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MARRY_RING_01]" , 0 )		-- �L�k�ǰe�A�A�L�k�b���ϰ�L�k�i��ǰe�C
									return FALSE
							else  
						--		Say(OwnerID(), "YOU CAN GO 2 ") --�L���y���@��ZONE 
							--	Say(OwnerID(), targetdbid)
							--	Say(OwnerID(), targetzoneID)

								if targetzoneID >= 1000 then  --�����y���@��ZONE(���)
									return true
								else
									if targetzone >= 100 then --�p�G�Ҧb�ϰ�W�L100 (�Y�D�@��zone)(���)
									--	Say(OwnerID(), targetzone)
										ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MARRY_RING_02]" , 0 )		-- �L�k�ǰe�A���ثe�Ҧb��m�L�k�i��ǰe�C
										return FALSE
									else
										return true
									end
								end
							end
						end
					else
						ScriptMessage( Player , Player , 1 , GetString("SC_MARRY_31") , 0 )		-- �L�k�ǰe�A�A�ݭn�@�ӷR�R�G��I�I
						return false
					end
				else
					--���b�u�W
			--		say(OwnerID(), "offline")
					ScriptMessage( Player , Player , 1 , GetString("SC_MARRY_33") , 0 )		-- �L�k�ǰe�A�A���t���ثe���b�u�W�άO���b�ƥ����I�I
					return false
				end
			end
		else
			--�S�ѱC
			ScriptMessage( Player , Player , 1 , GetString("SC_MARRY_32") , 0 )		-- �L�k�ǰe�A�A�|���إ߱B�����Y�I�I
			return false
		end
	elseif ( Option == "USE" ) then
		GotoPlayer_DBID( Player , GetRelation_DBID( Player , Get_RelationPos( Player , EM_RelationType_Wife ) ) )  --�h�ѱC����m
	end
end

function LuaQ_202544_MarryTransfer( Option )		-- �k�B�٨ϥ�
	local IamH = Check_Relation( OwnerID() , EM_RelationType_Husband )  --
	local IamW = Check_Relation( OwnerID() , EM_RelationType_Wife  )  
	local YouH = Check_Relation( OwnerID() , EM_RelationType_Husband )  --
	local YouW = Check_Relation( OwnerID() , EM_RelationType_Wife  )  --
	local Player = OwnerID()
	if ( Option == "CHECK" ) then
		if  IamH  == true then   --�ڦ��S�Ѥ�
			local selfdbid = ReadRoleValue(OwnerID(), EM_RoleValue_DBID ) 
			local targetdbid = GetRelation_DBID( OwnerID() , Get_RelationPos( OwnerID() , EM_RelationType_Husband ) )  --��誺DBID
			local online =  CheckOnlinePlayer(GetRelation_DBID( OwnerID() , Get_RelationPos( OwnerID() , EM_RelationType_Husband ) ) )  -- ���b���b�u�W
			local MyZoneID =  ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )  -- �ۤv��zone id
			local MyZone = MyZoneID -1000*math.floor( MyZoneID / 1000 )
			local targetzoneID = GetZoneID( targetdbid ) 
			local targetzone = targetzoneID -1000*math.floor( targetzoneID / 1000 ) 

	--		Say(OwnerID(), selfdbid )
	--		Say(OwnerID(), targetdbid )
	--		Say(OwnerID(), MyZone)
	--		Say(OwnerID(), targetzoneID)
			--�P�_�ۤv�b���b�Գ�
			if MyZone == 402 or MyZone == 440 or MyZone == 441 or MyZone == 442 or MyZone == 443 or MyZone == 444 or MyZone == 445 or MyZone == 446 or MyZone == 354 then  --�p�G�ۤv�b�Գ�
				ScriptMessage(OwnerID(),OwnerID(),1, "[SC_MARRY_RING_01]" , 0 ) --�A�L�k�b���ϰ�L�k�i��ǰe�I
				return false
			elseif targetzone == -1 then --�p�G���b�Գ�
				ScriptMessage(OwnerID(),OwnerID(),1, "[SC_MARRY_RING_02]" , 0 ) --���ثe�Ҧb��m�L�k�i��ǰe�I
				return false
			else
			--	Say(OwnerID(), targetdbid)
				if online == TRUE then
					--�b�u�W
				--	say(OwnerID(), "online")
					if CountBodyItem( Player , 202545 ) >= 1 then
						if MyZoneID >= 1000 then  --�����y���@��ZONE 
					--		Say(OwnerID(), "YOU CAN GO 1 !") --�L���y���@��ZONE 
							if targetzoneID >= 1000 then  --�����y���@��ZONE(���)
								return true
							else
								if targetzoneID >= 100 then --�p�G�Ҧb�ϰ�W�L100 (�Y�D�@��zone)(���)
								--	Say(OwnerID(), targetzone)
									ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MARRY_RING_02]" , 0 )		-- �L�k�ǰe�A���ثe�Ҧb��m�L�k�i��ǰe�C
									return FALSE
								end
							end
						else  
							if MyZoneID >= 100 then --�p�G�کҦb�ϰ�W�L100 (�Y�D�@��zone)
									ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MARRY_RING_01]" , 0 )		-- �L�k�ǰe�A�A�L�k�b���ϰ�L�k�i��ǰe�C
									return FALSE
							else  
						--		Say(OwnerID(), "YOU CAN GO 2 ") --�L���y���@��ZONE 
							--	Say(OwnerID(), targetdbid)
							--	Say(OwnerID(), targetzoneID)

								if targetzoneID >= 1000 then  --�����y���@��ZONE(���)
									return true
								else
									if targetzone >= 100 then --�p�G�Ҧb�ϰ�W�L100 (�Y�D�@��zone)(���)
									--	Say(OwnerID(), targetzone)
										ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MARRY_RING_02]" , 0 )		-- �L�k�ǰe�A���ثe�Ҧb��m�L�k�i��ǰe�C
										return FALSE
									else
										return true
									end
								end
							end
						end
					else
						ScriptMessage( Player , Player , 1 , GetString("SC_MARRY_31") , 0 )		-- �L�k�ǰe�A�A�ݭn�@�ӷR�R�G��I�I
						return false
					end
				else
					--���b�u�W
			--		say(OwnerID(), "offline")
					ScriptMessage( Player , Player , 1 , GetString("SC_MARRY_33") , 0 )		-- �L�k�ǰe�A�A���t���ثe���b�u�W�άO���b�ƥ����I�I
					return false
				end
			end
		else
			--�S�Ѥ�
			ScriptMessage( Player , Player , 1 , GetString("SC_MARRY_32") , 0 )		-- �L�k�ǰe�A�A�|���إ߱B�����Y�I�I
			return false
		end
	elseif ( Option == "USE" ) then
		GotoPlayer_DBID( Player , GetRelation_DBID( Player , Get_RelationPos( Player , EM_RelationType_Husband ) ) )  --�h�Ѥ�����m
	end
end



function Get_MAXLV( Player )
	if ( Player == nil ) then
		Player = OwnerID()
	end

	local LV_Warrior = ReadRoleValue( Player , EM_RoleValue_VOCLV_Warrior )
	local LV_Ranger = ReadRoleValue( Player , EM_RoleValue_VOCLV_Ranger )
	local LV_Rogue = ReadRoleValue( Player , EM_RoleValue_VOCLV_Rogue )
	local LV_Wizard = ReadRoleValue( Player , EM_RoleValue_VOCLV_Wizard )
	local LV_Priest = ReadRoleValue( Player , EM_RoleValue_VOCLV_Priest )
	local LV_Knight = ReadRoleValue( Player , EM_RoleValue_VOCLV_Knight )

	local MAXLV = math.max( LV_Warrior , LV_Ranger , LV_Rogue , LV_Wizard , LV_Priest , LV_Knight )

	--Say( Player , MAXLV )

	return MAXLV
end