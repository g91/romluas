function Lua_VocJobDellist_0( Option )

	local PlayerID = OwnerID()
	local PackageID = 203283	
	local Subjobget =  CheckFlag( OwnerID()  , 540820 ) --���o�s¾�~

	-- 2012.07.23 �s�W�A�ץ����~ - ��Ѥ��G(203283)�A���a�ϥο�Ѥ��G�ɡA�Y��¾���Ť�u�K���F��̡A�T�{�����X�{��¾�~���ܷ|�� 0 �����D
	-- �H�ξǲ߲ĤT¾�~��A�Y�R�����@��¾�|�o�͵L�k�R���䥦��¾�����D�C
	local Owner = OwnerID() 
	local SubLv = ReadRoleValue( Owner , EM_RoleValue_LV_SUB )	-- ��¾����
	--
	if ( Option == "CHECK" ) then
		if ( CountBodyItem( PlayerID , PackageID ) >= 1 ) and Subjobget == true then
			-- 2012.07.23 �s�W
			if SubLv == 0 then
				ScriptMessage( Owner , Owner , 0 , "[SC_VOCJOBDELLIST05]" , 0 ) -- ���˳ư�¾
				ScriptMessage( Owner , Owner , 1 , "[SC_VOCJOBDELLIST05]" , 0 )
				return false
			end	
			--
			return true
		elseif Subjobget == false then
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_VOCJOBDELLIST02]", 0 )--�����o�s¾�~
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_VOCJOBDELLIST02]", 0 )
			return false
		end
	elseif ( Option == "USE" ) then
		Beginplot( OwnerID() ,"Lua_VocJobDellist_1", 0 )
	end
end
--�H�U�O KEY���
function Lua_VocJobDellist_1()
	DebugMsg( 0 , 0 , "Enter" )
	local SubJobID = ReadRoleValue( OwnerID() , EM_RoleValue_VOC_SUB )  -- ��¾
	local VOC_STRING = 0 --�r��

--	Say( OwnerID()  ,  SubJobID)

	local SubJob = {	0,
				1,
				2,
				3,
				4,
				5,
				6,
				7,
				8,	
				9,
				10	}

	local JobName= {	"GM",
				"[SYS_CLASSNAME_WARRIOR]",
				"[SYS_CLASSNAME_RANGER]",
				"[SYS_CLASSNAME_THIEF]",
				"[SYS_CLASSNAME_MAGE]",
				"[SYS_CLASSNAME_AUGUR]",
				"[SYS_CLASSNAME_KNIGHT]",
				"[SYS_CLASSNAME_WARDEN]",
				"[SYS_CLASSNAME_DRUID]",
				"[SYS_CLASSNAME_HARPSYN]",
				"[SYS_CLASSNAME_PSYRON]"	}


	local VocJob = 0

	for i= 1 , table.getn(SubJob) do
		if SubJob[i]  ==  SubJobID then 
				VocJob = JobName[i]
		elseif SubJobID == -1 then
				VocJob = 1
		end

	end

	if VocJob == 1 then
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_VOCJOBDELLIST02]", 0 )--�����o�s¾�~
		ScriptMessage( OwnerID() , OwnerID() , 1, "[SC_VOCJOBDELLIST02]", 0 )	
	else
		if CheckBuff( OwnerID() , 501570) == false then  --�W�[�ˬd�P�_
			AddBuff(OwnerID() , 501570,0,-1);--�M�ᵹ��BUFF
		
			DialogCreate( OwnerID() , EM_LuaDialogType_YesNo ,"[SC_VOCJOBDELLIST01]".."|cffff00ff" ..VocJob.. "|r".."  ".."[SO_110266_5]") --�N��Ѱ�¾�T�{��?
			DialogSelectStr( OwnerID() , "[SC_GETTITLE_1]" );
			DialogSelectStr( OwnerID() , "[SC_CANCEL]" );
			if( DialogSendOpen( OwnerID() ) == false ) then 
				ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_FIXEQ_DATA_ERROR]",0)	
				--��ưe�X�����D
				return
			end
			
			for i = 0 , 1000 , 1 do
				Sleep( 1 );
				SelectID = DialogGetResult( OwnerID() );
				if ( SelectID ~= -2 ) and ( SelectID ~= -1 ) and i < 100 then
					if ( SelectID == 0 ) then--�T�{
						Beginplot( OwnerID() ,"Lua_VocJobDellist_2", 0 )
						CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
						DialogClose( OwnerID() )
						break;
					elseif ( SelectID == 1 ) then
						CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
						DialogClose( OwnerID() )		
						break
					end
				elseif i == 1000 then
					CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
					DialogClose( OwnerID() )		
					break
				elseif ( SelectID == -1 ) then
					CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
					DialogClose( OwnerID() )	
					break
				end
			end
		else
			ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
		end
	end

end

function Lua_VocJobDellist_2()	--�T�{��ܮ�
	local SubJobID = ReadRoleValue( OwnerID() , EM_RoleValue_VOC_SUB )  -- ��¾
	local VOC_STRING = 0 --�r��
--	Say( OwnerID()  ,  SubJobID)
	local SubJob = {	0,
				1,
				2,
				3,
				4,
				5,
				6,
				7,
				8,	
				9,
				10	}

	local JobName= {	"GM",
				"[SYS_CLASSNAME_WARRIOR]",
				"[SYS_CLASSNAME_RANGER]",
				"[SYS_CLASSNAME_THIEF]",
				"[SYS_CLASSNAME_MAGE]",
				"[SYS_CLASSNAME_AUGUR]",
				"[SYS_CLASSNAME_KNIGHT]",
				"[SYS_CLASSNAME_WARDEN]",
				"[SYS_CLASSNAME_DRUID]",
				"[SYS_CLASSNAME_HARPSYN]",
				"[SYS_CLASSNAME_PSYRON]"	}


	local VocJob = 0
	for i= 1 , table.getn(SubJob) do
		if SubJob[i]  ==  SubJobID then 
				VocJob = JobName[i]
		elseif SubJobID == -1 then
				VocJob = 1
		end
	end

	if VocJob == 1 then
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_VOCJOBDELLIST02]", 0 )--�����o�s¾�~
		ScriptMessage( OwnerID() , OwnerID() , 1, "[SC_VOCJOBDELLIST02]", 0 )	
	else
		if CheckBuff( OwnerID() , 501570) == false then  --�W�[�ˬd�P�_
			AddBuff(OwnerID() , 501570,0,-1);--�M�ᵹ��BUFF

			DialogCreate( OwnerID() , EM_LuaDialogType_YesNo ,"[SC_VOCJOBDELLIST03]" ) --�N��� ��¾ �u���T�{��?
			DialogSelectStr( OwnerID() , "[SC_GETTITLE_1]" );
			DialogSelectStr( OwnerID() , "[SC_CANCEL]" );
			if( DialogSendOpen( OwnerID() ) == false ) then 
				ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_FIXEQ_DATA_ERROR]",0)	
				--��ưe�X�����D
				return
			end
			
			for i = 0 , 1000 , 1 do
				Sleep( 1 );
				SelectID = DialogGetResult( OwnerID() );
				if ( SelectID ~= -2 ) and ( SelectID ~= -1 ) and i < 100 then
					if ( SelectID == 0 ) then--�T�{
						Beginplot( OwnerID() ,"Lua_VocJobDellist_3", 0 )
						CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
						DialogClose( OwnerID() )
						break;
					elseif ( SelectID == 1 ) then
						CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
						DialogClose( OwnerID() )		
						break
					end
				elseif i == 1000 then
					CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
					DialogClose( OwnerID() )		
					break
				elseif ( SelectID == -1 ) then
					CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
					DialogClose( OwnerID() )	
					break
				end
			end
		else
			ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
		end
	end

end

function Lua_VocJobDellist_3()
	local SubJobID = ReadRoleValue( OwnerID() , EM_RoleValue_VOC_SUB )  -- ��¾
	local VOC_STRING = 0 --�r��
--	Say( OwnerID()  ,  SubJobID)
	local SubJob = {	0,
				1,
				2,
				3,
				4,
				5,
				6,
				7,
				8,	
				9,
				10	}

	local JobName= {	"GM",
				"[SYS_CLASSNAME_WARRIOR]",
				"[SYS_CLASSNAME_RANGER]",
				"[SYS_CLASSNAME_THIEF]",
				"[SYS_CLASSNAME_MAGE]",
				"[SYS_CLASSNAME_AUGUR]",
				"[SYS_CLASSNAME_KNIGHT]",
				"[SYS_CLASSNAME_WARDEN]",
				"[SYS_CLASSNAME_DRUID]",
				"[SYS_CLASSNAME_HARPSYN]",
				"[SYS_CLASSNAME_PSYRON]"	}

	local VocJob = 0
	for i= 1 , table.getn(SubJob) do
		if SubJob[i]  ==  SubJobID then 
				VocJob = JobName[i]
		elseif SubJobID == -1 then
				VocJob = 1
		end
	end

	if VocJob == 1 then
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_VOCJOBDELLIST02]", 0 )--�����o�s¾�~
		ScriptMessage( OwnerID() , OwnerID() , 1, "[SC_VOCJOBDELLIST02]", 0 )
	else
		DelJob( OwnerID() , SubJobID )
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_VOCJOBDELLIST04]", 0 )
		ScriptMessage( OwnerID() , OwnerID() , 1, "[SC_VOCJOBDELLIST04]", 0 )	
		DelBodyItem( OwnerID() , 203283 , 1 )
	-- 2012.07.23 �s�W�A�ץ����~ - ��Ѥ��G(203283)�A���a�ϥο�Ѥ��G�ɡA�Y��¾���Ť�u�K���F��̡A�T�{�����X�{��¾�~���ܷ|�� 0 �����D
	-- �H�ξǲ߲ĤT¾�~��A�Y�R�����@��¾�|�o�͵L�k�R���䥦��¾�����D�C
		local Job , Total = { } , 0
		local Owner = OwnerID() 
		Job[1] = ReadRoleValue( Owner , EM_RoleValue_VOCLV_Warrior )		-- �Ԥh
		Job[2] = ReadRoleValue( Owner , EM_RoleValue_VOCLV_Ranger )		-- �C�L
		Job[3] = ReadRoleValue( Owner , EM_RoleValue_VOCLV_Rogue )		-- �v���
		Job[4] = ReadRoleValue( Owner , EM_RoleValue_VOCLV_Wizard )		-- �k�v
		Job[5] = ReadRoleValue( Owner , EM_RoleValue_VOCLV_Priest )		-- ���q
		Job[6] = ReadRoleValue( Owner , EM_RoleValue_VOCLV_Knight )		-- �M�h
		Job[7] = ReadRoleValue( Owner , EM_RoleValue_VOCLV_RuneDancer )	-- �˪L����
		Job[8] = ReadRoleValue( Owner , EM_RoleValue_VOCLV_Druid )		-- �۵M���x
		Job[9] = ReadRoleValue( Owner , EM_RoleValue_VOCLV_HARPSYN )	-- �F���
		job[10] = ReadRoleValue( Owner , EM_RoleValue_VOCLV_PSYRON )	-- �Ť�u�K
	
		for i = 1 , #job , 1 do
			if Job[i] > 0 then
				Total = Total + 1
				DebugMsg( Owner , 0 , "Job"..i.." = "..Job[i].." Total = "..Total )
			end
		end
		if Total == 1 then
			SetFlag( OwnerID()  , 540820 , 0 ) -- �R���s¾�~�X��
		end
	end
	--
end