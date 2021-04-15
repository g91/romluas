--���Y�Ӫ����ˬd�@�w�d�򤺬O�_�������Ȫ����a
--ObjID ���󪺥N��
--QuestID ���Ƚs��
--Range �����d��
----------------------�����ˬd------------------------------
function Lua_Check_Drama_Extra( ObjID , QuestID , Range ) 
	if Range == nil or Type( Range ) ~= "number" then
		Range = 250
	end
	AddBuff( ObjID , 506345 , 0 , -1 )
	CallPlot( ObjID , "Lua_Check_Drama_Extra_Sub" ,  QuestID , Range )
end
--------------------�����@���ˬd----------------------------------
function Lua_Check_Drama_Extra_OneTime( ObjID , QuestID , Range ) 
	if Range == nil or Type( Range ) ~= "number" then
		Range = 250
	end
	local RoomID = ReadRoleValue( ObjID , EM_RoleValue_RoomID )
	local Players = SetSearchAllPlayer(RoomID )
	local Count = 0
	local Name = "[QuestID]"
	local Str = "[SC_QUEST_OVER_RANGE][$SETVAR1="..Name.."]"
	for i = 1 , Players , 1 do 
		local ID = GetSearchResult()
		if CheckID(ID) == true and CheckAcceptQuest(ID , QuestID ) == true then
			if GetDistance( ID , ObjID ) > Range then
				ScriptMessage( ID , ID , 0 , Str , 0 ) --�A�w�g���}���ȡG�u[$VAR1] �v���ˬd�d��
				ScriptMessage( ID , ID , 1 , Str , 0 ) --�A�w�g���}���ȡG�u[$VAR1] �v���ˬd�d��
			else
				Count = Count + 1
			end
		end
	end
	if Count == 0 then
		return false
	else
		return true
	end
end


function Lua_Check_Drama_Extra_Sub(QuestID , Range)
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Players = 0
	local Count = 0
	local Name = "[QuestID]"
	local Str = "[SC_QUEST_OVER_RANGE][$SETVAR1="..Name.."]"
	while 1 do
		Players = SetSearchAllPlayer(RoomID )
		Count = 0
		for i = 1 , Players , 1 do 
			local ID = GetSearchResult()
			if CheckID(ID) == true and CheckAcceptQuest(ID , QuestID ) == true then
				if GetDistance( ID , OwnerID() ) > Range then
					ScriptMessage( ID , ID , 0 , Str , 0 ) --�A�w�g���}���ȡG[$VAR1] ���ˬd�d��
					ScriptMessage( ID , ID , 1 , Str , 0 ) --�A�w�g���}���ȡG[$VAR1] ���ˬd�d��
				else
					Count = Count + 1
				end
			end
		end
		if Count == 0 then
			CancelBuff( OwnerID() , 506345 )
			break
		end
		sleep( 30 + Rand(20) )
	end
end
------------------------------------�ª��G���H���o�ˬI�k�|����Ӹ귽�A�ĪG�]����t�A�Ф��n�ϥΡA�����e�� script ���ΡA�ҥH�]�Ф��n�R-----------------
function Lua_Check_Drama_Statu( Obj) --�^�Ǧ��S�����a���b�i����ȡAfalse �N��S�����a���b�i����ȡAtrue �N���Aobj �O�ˬd�����ߪ���
	local Buff = 506345
	if CheckBuff( Obj , Buff ) == true then
		return true
	else
	--	Yell( obj , "NO Buff" , 3 )
		return false
	end
end

function Lua_Drama_Radar( Obj , QuestID , Range) --����H obj ���ˬd�I�A�ˬd range �d�򤺬O�_�����a���b���� questid ������(RANGE�i����^
	if Range == nil then
		Range = 250
	end
	AddBuff( Obj , 506345 , 0 , 10 )
	WriteRoleValue( Obj , EM_RoleValue_LuaValueFlag+999, QuestID )
	CallPlot( Obj , "Lua_Drama_Radar_Do" , Range )
end

function Lua_Drama_Radar_Do(Range) --�ƨ禡
	local Spell
	if Range <= 250 then
		Spell = 495356
	end
	AddBuff( OwnerID() , 506348 , 0 , -1 )
--	while 1 do
--		sleep( 30 + DW_Rand(50) )
--		if CheckBuff( OwnerID() , 506345 ) == false then
--			CancelBuff_NoEvent( OwnerID() , 506348 )
--			Yell( OwnerID() ,"break" , 3 )
--			break
--		end
--	end
end

function LuaM_506346_CHECK() ---�ƨ禡
	local QuestID = ReadRoleValue(OwnerID() , EM_RoleValue_LuaValueFlag+999 )
	if CheckAcceptQuest( TargetID() , QuestID ) == true then
--		Say( TargetID() , " I have Quest "..QuestID )
		return true
	end
--	Say( TargetID() , " I don't had Quest "..QuestID )
	return false
end

function LuaM_506346_USE() ---�ƨ禡
--	Say( TargetID() , " Check Me " )
	AddBuff( OwnerID() , 506345 , 0 , 10 )
end