function Lua_na_wedding_pet_love() --���B�t���d���P�_
	local Owner = OwnerID() --�R������
	local Pet_Owner = ReadRoleValue(Owner , EM_RoleValue_OwnerGUID) --Ū���d�����D�H
		--���ե�
		WriteRoleValue( Pet_Owner , EM_RoleValue_PID , Owner ) --���D�H�O���d���A���ի��O��
--	local BuffID = {	501760, 501761, 501762, 501763, 501764, 501765, 501766, 501767, 501768, 501769,  --�Ҫ�BUFF
--			501830, 501831, 501832, 501833, 501834, 501835, 501836, 501837, 501838, 501839 } --�d��BUFF
	local BuffID = {	501764, 501765, 501766, 501767, 501768, 501769,  --�Ҫ�BUFF 5~10
			501834, 501835, 501836, 501837, 501838, 501839 } --�d��BUFF 5~10
	local Time = 0  --�ҩd���YBUFF�ɶ��p��
	local Time2 = 0 --���h�ҩd���YBuff�ɶ��p��(5����)
	local Check = 0 --Time2�ˬd��
	local Pet = ReadRoleValue( Owner , EM_RoleValue_OrgID)
	Hao_Pet_SetModeEx()
	WriteRoleValue( Owner , EM_RoleValue_Register1, 0)  
	WriteRoleValue( Owner , EM_RoleValue_Register2, 0)  --���ի��O�ΡA�M�ŭ˼ƥ�
	while true do
		local PetCount = ReadRoleValue( Owner, EM_RoleValue_Register1)
		local CountClear = ReadRoleValue( Owner, EM_RoleValue_Register2) --���ի��O��
		for i = 1 , #BuffID do--�ˬd�D�H���W�O�_�����Y�ޯ઺BUFF
			if CheckBuff( Pet_Owner , BuffID[i] ) == true then
				Time = PetCount +1
			--	DebugMsg( 0,0, "time1 = "..Time)
				WriteRoleValue( Owner, EM_RoleValue_Register1 , Time )
				Check = 1
				Time2 = 0
				WriteRoleValue( Owner, EM_RoleValue_Register2 , Time2 )	--���ի��O��			
				break
			else
				Check = 0
			end
		end
	--	DebugMsg( Pet_Owner , 0 , "Time = "..Time.." , Time2 = "..Time2 )
		if Check == 0 then
			if PetCount ~= 0 then
				Time2 = CountClear +1
				WriteRoleValue( Owner, EM_RoleValue_Register2 , Time2 )	
			--	DebugMsg( 0,0, "time2 = "..Time2)
			end	
		end
		if Time2 == 300 and PetCount ~= 0 then --�ҩd�����L���A����������M���d�����O��
		--	Say( Owner , PetCount)
		--	Say( Owner , Time2)
			WriteRoleValue( Owner, EM_RoleValue_Register1 , 0) 
			Time2 = 0
			WriteRoleValue( Owner, EM_RoleValue_Register2 , Time2 )	--���ի��O��
			BeginPlot( Owner , "Lua_na_wdpet0_love" , 0 )-- ���m�d����Ĳ�I�@��
			Lua_na_lovepet_DelBuff()
			ScriptMessage( Owner , Pet_Owner , 1 , "[SC_LOVEPET_SPEAK6]"  ,0)
			ScriptMessage( Owner , Pet_Owner , 0 , "[SC_LOVEPET_SPEAK6]"  ,0)

		elseif Time2 == 0 and Time == 1800 then --�ҩd���Y�޶W�L30����
			ScriptMessage( Owner , Pet_Owner , 3,"["..Pet.."]".."[SC_LOVEPET_SPEAK3]"  ,0)
			AddBuff( Owner , 623811 , 0 , -1 )
			BeginPlot( Owner , "Lua_na_wdpet1_love" , 0 )-- �d����Ĳ�I�@���A�������y

		elseif Time2 == 0 and Time == 3600 then --�ҩd���Y�޶W�L60����
			AddBuff( Owner , 623812 , 0 , -1 )
			ScriptMessage( Owner , Pet_Owner , 3,"["..Pet.."]".."[SC_LOVEPET_SPEAK4]"  ,0)
			BeginPlot( Owner , "Lua_na_wdpet2_love" , 0 )-- �d����Ĳ�I�@���A�������y	

		elseif Time2 == 0 and Time == 7200 then --�ҩd���Y�޶W�L120����
			AddBuff( Owner , 623813 , 0 , -1 )
			ScriptMessage( Owner , Pet_Owner , 3,"["..Pet.."]".."[SC_LOVEPET_SPEAK5]"  ,0)
			BeginPlot( Owner , "Lua_na_wdpet3_love" , 0 )-- �d����Ĳ�I�@���A�������y		
		end

		sleep(10)
	end
end



function Lua_na_wdpet0_love() --���mĲ�I�@��
	local Owner = OwnerID()
	SetPlot( Owner, "touch", "", 40) 
end



function Lua_na_wdpet1_love() --�֭p30����������檺Ĳ�I�@��
	local Owner = OwnerID()
	DebugMsg( 0 , 0 , "SetPlot Begin" )
	SetPlot( Owner, "touch", "Lua_na_wdpet_love1", 40) 
end

function Lua_na_wdpet2_love() --�֭p60����������檺Ĳ�I�@��
	local Owner = OwnerID()
	SetPlot( Owner, "touch", "Lua_na_wdpet_love2", 40) 
end


function Lua_na_wdpet3_love() --�֭p120����������檺Ĳ�I�@��
	local Owner = OwnerID()
	SetPlot( Owner, "touch", "Lua_na_wdpet_love3", 40) 
end


-------------------------------------------------------------------------------
--�T���d��������§�]�A��ܼ@��
-------------------------------------------------------------------------------

--30����
function Lua_na_wdpet_love1() 
	local Owner = OwnerID() --���a
	local Target = TargetID() --�d��
	local Pet_Owner = ReadRoleValue(Target , EM_RoleValue_OwnerGUID) 
	local Time = ReadRoleValue( Target, EM_RoleValue_Register1) --�֭p���ɶ�
	DebugMsg( Owner , 0 , "Pet_Owner = "..Pet_Owner.." , Owner = "..Owner )
	if Owner == Pet_Owner then
		CallPlot( Owner , "Lua_na_wdpet_love1_1", Owner , Target) 
	end
end

function Lua_na_wdpet_love1_1( Owner , Target)
	local Time = ReadRoleValue( Target, EM_RoleValue_Register1) --�֭p���ɶ�
	local CountTime = math.floor( Time / 60 )
	local Pet = ReadRoleValue( Target , EM_RoleValue_OrgID)
	local Gift = {	[107479] = { 241991 };
			[107480] = { 241988 }	}
	local R = DW_Rand(100) --��o�d���ɶ����~

	DialogCreate( Owner , EM_LuaDialogType_Select , "[SC_LOVEPET_SPEAK1][$SETVAR1="..CountTime.."]" ) --�˷R���D�H�A�ثe�z�P��Q�@�P�_�I���ֿn�ɶ���[$VAR1]�A���F��D�D�H���R���ܤ[�����A�S�O���D�H�ǳƤF§���I�аݥD�H�O�_�ǳƭn����F�O�H
	DialogSelectStr( Owner, "[SC_LOVEPET_SPEAK2]".."["..Gift[Pet][1].."]" ) --�ڭn���

	if( DialogSendOpen( Owner ) == false ) then
		ScriptMessage( Owner , Owner , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 ) --��ưe�X�����D
		return 0
	end
	local SelectID = Hsiang_GetDialogResoult( Owner );--�����]�_�Ӫ����ݦ^�Х�function
	if SelectID == 0 then
		GiveBodyItem( Owner , Gift[Pet][1] , 1 )
		if R <= 45 then
			GiveBodyItem( Owner , 241968 , 1 )
		end
		WriteRoleValue( Target, EM_RoleValue_Register1, 0)
		BeginPlot( Target, "Lua_na_lovepet_DelBuff" , 0 )
		SetPlot( Target, "touch", "", 40) 
	end
	DialogClose( Owner )
end


--60����

function Lua_na_wdpet_love2() 
	local Owner = OwnerID() --���a
	local Target = TargetID() --�d��
	local Time = ReadRoleValue( Target, EM_RoleValue_Register1) --�֭p���ɶ�
	local Pet_Owner = ReadRoleValue(Target , EM_RoleValue_OwnerGUID) 
	if Owner == Pet_Owner then
		CallPlot( Owner , "Lua_na_wdpet_love2_1", Owner , Target) 
	end
end

function Lua_na_wdpet_love2_1( Owner , Target)
	local Time = ReadRoleValue( Target, EM_RoleValue_Register1) --�֭p���ɶ�
	local CountTime = math.floor( Time / 60 )
	local Pet = ReadRoleValue( Target , EM_RoleValue_OrgID)
	local Gift = {	[107479] = { 241992 };
			[107480] = { 241989}	}
	local R = DW_Rand(100) --��o�d���ɶ����~

	DialogCreate( Owner , EM_LuaDialogType_Select , "[SC_LOVEPET_SPEAK1][$SETVAR1="..CountTime.."]" ) --�˷R���D�H�A�ثe�z�P��Q�@�P�_�I���ֿn�ɶ���[$VAR1]�A���F��D�D�H���R���ܤ[�����A�S�O���D�H�ǳƤF§���I�аݥD�H�O�_�ǳƭn����F�O�H
	DialogSelectStr( Owner, "[SC_LOVEPET_SPEAK2]".."["..Gift[Pet][1].."]" ) --�ڭn���

	if( DialogSendOpen( Owner ) == false ) then
		ScriptMessage( Owner , Owner , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 ) --��ưe�X�����D
		return 0
	end
	local SelectID = Hsiang_GetDialogResoult( Owner );--�����]�_�Ӫ����ݦ^�Х�function
	if SelectID == 0 then
		GiveBodyItem( Owner , Gift[Pet][1] , 1 )
		if R <= 50 then
			GiveBodyItem( Owner , 241968 , 2 )
		end
		WriteRoleValue( Target, EM_RoleValue_Register1, 0)
		BeginPlot( Target, "Lua_na_lovepet_DelBuff" , 0 )
		SetPlot( Target, "touch", "", 40) 
	end
	DialogClose( Owner )
end



 --120����

function Lua_na_wdpet_love3()
	local Owner = OwnerID() --���a
	local Target = TargetID() --�d��
	local Time = ReadRoleValue( Target, EM_RoleValue_Register1) --�֭p���ɶ�
	local Pet_Owner = ReadRoleValue(Target , EM_RoleValue_OwnerGUID) 
	if Owner == Pet_Owner then
		CallPlot( Owner , "Lua_na_wdpet_love3_1", Owner , Target) 
	end
end


function Lua_na_wdpet_love3_1( Owner , Target)
	local Time = ReadRoleValue( Target, EM_RoleValue_Register1) --�֭p���ɶ�
	local CountTime = math.floor( Time / 60 )
	local Pet = ReadRoleValue( Target , EM_RoleValue_OrgID)
	local Gift = {	[107479] = {241993 };
			[107480] = {241990 }	}
	local R = DW_Rand(100) --��o�d���ɶ����~

	DialogCreate( Owner , EM_LuaDialogType_Select , "[SC_LOVEPET_SPEAK1][$SETVAR1="..CountTime.."]" ) --�˷R���D�H�A�ثe�z�P��Q�@�P�_�I���ֿn�ɶ���[$VAR1]�A���F��D�D�H���R���ܤ[�����A�S�O���D�H�ǳƤF§���I�аݥD�H�O�_�ǳƭn����F�O�H
	DialogSelectStr( Owner, "[SC_LOVEPET_SPEAK2]".."["..Gift[Pet][1].."]" ) --�ڭn���

	if( DialogSendOpen( Owner ) == false ) then
		ScriptMessage( Owner , Owner , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 ) --��ưe�X�����D
		return 0
	end
	local SelectID = Hsiang_GetDialogResoult( Owner );--�����]�_�Ӫ����ݦ^�Х�function
	if SelectID == 0 then
		GiveBodyItem( Owner , Gift[Pet][1] , 1 )
		if R <= 70 then
			GiveBodyItem( Owner , 241968 , 3 )
		end
		WriteRoleValue( Target, EM_RoleValue_Register1, 0)
		BeginPlot( Target, "Lua_na_lovepet_DelBuff" , 0 )
		SetPlot( Target, "touch", "", 40) 
	end
	DialogClose( Owner )
end


function Lua_na_lovepet_DelBuff()
	local Owner = OwnerID()
	local Buff = { 623811, 623812 , 623813 }
	for i = 1 , #Buff do
		CancelBuff( Owner , Buff[i])
	end
end


-------------------------------------------------------------------------------
--���}§�]
-------------------------------------------------------------------------------

function Lua_na_love_gift(BoxID, Gift1) --������y
	local Owner = OwnerID()
	GiveBodyItem( Owner , Gift1 , 1)
--	DelBodyItem( Owner , BoxID, 1 ) 
end


-------------------------------------------------------------------------
--���ի��O
-------------------------------------------------------------------------
function Lua_na_wdpet_Count(Time)
	local Owner = OwnerID()
	local Pet = ReadRoleValue( Owner , EM_RoleValue_PID )
	WriteRoleValue( Pet , EM_RoleValue_Register1 , Time )
	local New = ReadRoleValue(Pet , EM_RoleValue_Register1)
	Say( Pet ,"Count = "..New)
end

function Lua_na_wdpet_CountClear(Time)
	local Owner = OwnerID()
	local Pet = ReadRoleValue( Owner , EM_RoleValue_PID )
	WriteRoleValue( Pet , EM_RoleValue_Register2 , Time )
	local New = ReadRoleValue( Pet , EM_RoleValue_Register2)
	Say( Pet ,"Clear Value = "..New)
end

function Lua_na_wdpet_CountCheck()
	local Owner = OwnerID()
	local Pet = ReadRoleValue( Owner , EM_RoleValue_PID )
	local Count = ReadRoleValue( Pet , EM_RoleValue_Register1)
	local CountTime1 = math.floor( Count / 60 )
	local CountClear = ReadRoleValue( Pet , EM_RoleValue_Register2)
	local CountTime2 = math.floor( CountClear / 60 )
	Say( Owner, "Love Value ="..CountTime1.."min")
	Say( Owner, "Cancel Love Value ="..CountTime2.."min")
end