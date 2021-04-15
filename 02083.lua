-- 702083 �w��S���[���d
------------------------------------------

--�ǯT�S���d�� (2010.11.09�w��ݨD)

function CheckSpSummonPet(MonsterID,Keyitem)  --�l���ID
	local Obj
	local Count = SetSearchRangeInfo( OwnerID(), 200 )
	for i = 1 , Count , 1 do --��PET
		local ID = GetSearchResult()
		Obj = Role:New( ID )
		if Obj:OrgID() == MonsterID and Obj:RoomID() == ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) and ReadRoleValue( ID , EM_RoleValue_OwnerDBID ) == ReadRoleValue( OwnerID() , EM_RoleValue_DBID ) then
			DelObj(ID)
		--	CancelBuff(OwnerID(), BuffID)
			local Name = Obj:OrgID()
			ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_RETRIEVEPET][$SETVAR1= ".."["..Name.."]".."]" , 0 )	--�A�^���F�d��
			ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_RETRIEVEPET][$SETVAR1= ".."["..Name.."]".."]" , 0 )	--�A�^���F�d��
			return false
		end
	end
	if CheckFlag( OwnerID() , Keyitem ) == true then  --���ѥl��L
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_PETSP_TODAY]", C_SYSTEM )
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_PETSP_TODAY]", C_SYSTEM )
		return false
	else  --�����٨S�l��
		SetFlag( OwnerID()  , Keyitem , 1 )
		return true
	end
end

--===========================
--		�w���d���J
--===========================
function Germany_PetCheck_208530_to_208537()
	if CheckFlag(OwnerID(),544684) == TRUE then
		return
	else
		SetFlag(OwnerID(),544684,1)
		AddBuff(OwnerID(),508449,0,7200)
	end
end

function German_PetBuff_20110210()	--2011/02/10�s�@��Buff�d��
	if CheckFlag(OwnerID(),544724) == FALSE then
		SetFlag(OwnerID(),544724,1)
		AddBuff(OwnerID(),508368,0,7200)
	end
end


-----------------------------------------------------------
--2011 �K�B�`�ӫ��S���d���J

--�F��Ԥ�
function Lua_208742_use()  
	Setflag(OwnerID(), 543905, 1 )   -- �F��Ԥ�  �����C��keyitem 
	AddBuff(OwnerID(), 508368, 0,7200)  -- ���ĪGbuff �F�ʤ��� 
--	Say(OwnerID(), "Give key ")
end

--�J������
function Lua_208743_use()  
	Setflag(OwnerID(), 543906, 1 )   -- �F��Ԥ�  �����C��keyitem 
	AddBuff(OwnerID(), 508368, 0,7200)  -- ���ĪGbuff �F�ʤ��� 
--	Say(OwnerID(), "Give key ")
end


-----------------------------------------------------------
--2011/06/07 �S���d���J  --


function Lua_240182_use()   --�c�F�_����
	if CheckFlag( OwnerID(), 545455 ) == true then
		return false
	else
		Setflag(OwnerID(), 545455, 1 )   --   �����C��keyitem 
		AddBuff(OwnerID(), 508368, 0,7200)  -- ���ĪGbuff �F�ʤ��� 
	end
end


function Lua_240183_use()   --���p��
	if CheckFlag( OwnerID(), 545456 ) == true then
		return false
	else
		Setflag(OwnerID(), 545456, 1 )   --   �����C��keyitem 
		AddBuff(OwnerID(), 508368, 0,7200)  -- ���ĪGbuff �F�ʤ��� 
	end
end


function Lua_240184_use()   --�k�G�H
	if CheckFlag( OwnerID(), 545457 ) == true then
		return false
	else
		Setflag(OwnerID(), 545457, 1 )   --   �����C��keyitem 
		AddBuff(OwnerID(), 508368, 0,7200)  -- ���ĪGbuff �F�ʤ��� 
	end
end


function Lua_240185_use()   --�k�G�H
	if CheckFlag( OwnerID(), 545458 ) == true then
		return false
	else
		Setflag(OwnerID(), 545458, 1 )   --   �����C��keyitem 
		AddBuff(OwnerID(), 508368, 0,7200)  -- ���ĪGbuff �F�ʤ��� 
	end
end

function Lua_240512_use()   --�p��
	if CheckFlag( OwnerID(), 545472 ) == true then
		return false
	else
		Setflag(OwnerID(), 545472, 1 )   --   �����C��keyitem 
		AddBuff(OwnerID(), 508368, 0,7200)  -- ���ĪGbuff �F�ʤ��� 
	end
end

function Lua_240513_use()   --�L��
	if CheckFlag( OwnerID(), 545473 ) == true then
		return false
	else
		Setflag(OwnerID(), 545473, 1 )   --   �����C��keyitem 
		AddBuff(OwnerID(), 508368, 0,7200)  -- ���ĪGbuff �F�ʤ��� 
	end
end

-------------2011/08/10 ?��GAMESCOM�d��------------
function Lua_240728_use()   --�d��Ĩۣ�H
	if CheckFlag( OwnerID(), 545750 ) == true then
		return false
	else
		Setflag(OwnerID(), 545750, 1 )   --   �����C��keyitem 
		AddBuff(OwnerID(), 508368, 0,7200)  -- ���ĪGbuff �F�ʤ��� 
	end
end

function LuaI_240729() -- �w�� �d���iۣ�H 2011/08/10

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 240728 , 1 } }
	-- 
	return BaseTressureProc(   itemset , 1 )
end

-------------2011/10/17 �i���]�p�d��-------------------
function Lua_209642_use()   --Darkmurmur�C��
	if CheckFlag( OwnerID(), 546081 ) == true then
		return false
	else
		Setflag(OwnerID(), 546081, 1 )   --   �����C��keyitem 
		AddBuff(OwnerID(), 508368, 0,7200)  -- ���ĪGbuff �F�ʤ��� 
	end
end

function Lua_209643_use()   --Darkmurmur_P�C��
	if CheckFlag( OwnerID(), 546082 ) == true then
		return false
	else
		Setflag(OwnerID(), 546082, 1 )   --   �����C��keyitem 
		AddBuff(OwnerID(), 508368, 0,7200)  -- ���ĪGbuff �F�ʤ��� 
	end
end

function Lua_209644_use()   --pizza Domino�C��
	if CheckFlag( OwnerID(), 546083 ) == true then
		return false
	else
		Setflag(OwnerID(), 546083, 1 )   --   �����C��keyitem 
		AddBuff(OwnerID(), 508368, 0,7200)  -- ���ĪGbuff �F�ʤ��� 
	end
end

------------2011/10/17 ?��U�t�d��----------------

function Lua_240913_use()   --��v�¿ߨC��
	if CheckFlag( OwnerID(), 546085 ) == true then
		return false
	else
		Setflag(OwnerID(), 546085, 1 )   --   �����C��keyitem 
		AddBuff(OwnerID(), 508368, 0,7200)  -- ���ĪGbuff �F�ʤ��� 
	end
end

function Lua_240914_use()	--�n�ʦ����C��
	if CheckFlag( OwnerID(), 546086 ) == true then
		return false
	else
		Setflag(OwnerID(), 546086, 1 )   --   �����C��keyitem 
		AddBuff(OwnerID(), 508368, 0,7200)  -- ���ĪGbuff �F�ʤ��� 
	end
end

function Lua_240915_use()	--�p�c�]�C��
	if CheckFlag( OwnerID(), 546087 ) == true then
		return false
	else
		Setflag(OwnerID(), 546087, 1 )   --   �����C��keyitem 
		AddBuff(OwnerID(), 508368, 0,7200)  -- ���ĪGbuff �F�ʤ��� 
	end
end

-----------2012/1/04 ----�T�P�~

--�g�A�ƿ�����d��

function Lua_241173_use()	--�g�A�ƿ����C��
	if CheckFlag( OwnerID(), 546208 ) == true then
		return false
	else
		Setflag(OwnerID(), 546208, 1 )   --   �����C��keyitem 
		AddBuff(OwnerID(), 508368, 0,7200)  -- ���ĪGbuff �F�ʤ��� 
	end
end


--�d������BUFF�@�μ@��-- 2012/05/07��s 4.0.11������XBUFF�d���Ц@�Φ��禡


function Lua_BuffPet_use()	--�ۻ�����BUFF
	if CheckFlag( OwnerID(), 544726 ) == true then
		return false
	else
		Setflag(OwnerID(), 544726, 1 )   --   �����C��keyitem 
		AddBuff(OwnerID(), 622851, 0,7200)  -- ���ĪGbuff �ۻ�����
	end
end