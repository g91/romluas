function Lua_na_2013_Flower_hide() --���m���ɭԱN���󪺭ȼg��0
	local Owner = OwnerID() --���ê���
	Lua_na_2012_Flower_RESETNPC()
	LuaN_miyon_action02()
end

function Lua_na_2013_Flower_NPC() --121719 ��ܨ��ܼ@��
	local Owner = OwnerID() --���a
	local Target = TargetID() --��ܨ�

	if CountBodyItem( Owner, 242082 ) >=1 and CheckFlag( Owner , 547360) == false then  --�Y���a���W���᯻
		SetSpeakDetail( Owner , "[SC_2013_FLOWER_NPC9]" ) --	[$playername]�A�ڴN���D�A�ȱo�U�I�I
		DelBodyItem( Owner , 242082 , 1 )	
		GiveBodyItem( Owner , 209161, 2 ) 
		SetFlag( Owner , 547358 , 0 )
		SetFlag( Owner , 547359 , 0 )
		SetFlag( Owner , 547360 , 1 ) --���X��
		if CountBodyItem( Owner , 242083) > 0 or CountBodyItem( Owner , 242084) > 0 then
			DelBodyItem( Owner , 242083, 1 ) --�R�����a���W���b��
			DelBodyItem( Owner , 242084, 1 ) --�R�����a���W���t��
		end
		DesignLog( Owner , 121719 , "Complete" )
		Lua_Festival_02_All(Owner)

	elseif CheckFlag( Owner , 547359) == TRUE then --�p�G��������
		if CheckFlag( Owner , 547358 ) == false and CountBodyItem( Owner , 242083) <1 then
			SetSpeakDetail( Owner , "[SC_2013_FLOWER_NPC6]" ) --���o�򤣤p�ߧ���@�Ϊ��b���˥�F�O	
			GiveBodyItem( Owner , 242083,1)
		elseif CheckFlag( Owner , 547358 ) == true and CountBodyItem( Owner , 242084) < 1 then
			SetSpeakDetail( Owner , "[SC_2013_FLOWER_NPC6]" ) --���o�򤣤p�ߧ���@�Ϊ��b���˥�F�O�H
			GiveBodyItem( Owner , 242083,1)
			SetFlag( Owner , 547358 , 0 ) --�M����몺�X��
		elseif CountBodyItem( Owner , 242084) == 1 then --�p�G���a���t��
			SetSpeakDetail( Owner , "[SC_2013_FLOWER_NPC5]") --�x�H�᯻�O�H
			AddSpeakOption( Owner, Owner ,"[SO_110989_1]", "Lua_na_2013_Flower_Giveup", 0 ) --���t���A��������
		else
			SetSpeakDetail( Owner , "[SC_2013_FLOWER_NPC8]" )
		end

	elseif CheckFlag( Owner, 547360 ) == true then --���a�w��������
		SetSpeakDetail( Owner , "[SC_2013_FLOWER_NPC1]" )
	else
		SetSpeakDetail( Owner , "[SC_2013_FLOWER_NPC2]")
		AddSpeakOption( Owner , Owner , "[SC_423911_02]" , "Lua_na_2013_Flower_NPC2", 0 )
		DesignLog( Owner , 121719 , "ACCEPT" )
	end
end
		 

function Lua_na_2013_Flower_NPC2()  --��������
	local Owner = OwnerID()
	local Target = TargetID()
	SetSpeakDetail( Owner , "[SC_2013_FLOWER_NPC4]" ) --	[$playername]�A�ڴN���D�A�ȱo�U�I�I	
	GiveBodyItem( Owner , 242083, 1 )--���t��
	Setflag( Owner , 547359, 1 )
end


function Lua_na_2013_Flower_Giveup() --���a������������
	local Owner = OwnerID() --���a
	local Target = TargetID() --NPC
	SetSpeakDetail( Owner ,"[SC_2013_FLOWER_NPC3]")
	SetFlag( Owner , 547358 , 0 )
	SetFlag( Owner , 547359 , 0 )
	SetFlag( Owner , 547360 , 1 )
	CancelBuff(Owner , 623869)
	CancelBuff(Owner , 623870)
	GiveBodyItem( Owner , 724509 , 1) --���Ĥ�
	Lua_Festival_02_All(Owner)
end

function Lua_na_2013_Flower_Fairy() --��몺��ܼ@��
	local Owner = OwnerID() --���a
	local Target = TargetID() --NPC
	if CheckFlag( Owner , 547359) == true and CountBodyItem( Owner , 242083 ) >=1 then
		SetSpeakDetail( Owner ,"[SC_2013_FLOWER_NPC10]")
--		AddBuff( Owner , 623870 , 0 , 600 ) 
		DelBodyItem( Owner , 242083 , 1 )
		GiveBodyItem( Owner , 242084, 1 )
	elseif CountBodyItem( Owner, 242084) >=1 then --���W���t��
		SetSpeakDetail( Owner, "[SC_2013_FLOWER_NPC12]") --�h�a�I�ΧA�⤤���t���P�@�۪��ߡA�V�Ū�����D���֧a�I
	else
		SetSpeakDetail( Owner ,"[SC_2013_FLOWER_NPC11]")	 -- �K�K�K�K�K�K�K�K�K�K�C
	end
end


function Lua_na_2013_Flower_stair1() --���誺��l�@��
	local Owner = OwnerID() --����
	local Target = TargetID()
	local Time = 0
	local OrgID = ReadRoleValue( Owner , EM_RoleValue_OrgID)
	local PID = ReadRoleValue( Owner , EM_RoleValue_PID)
--	local Sec = { 80 , 80 , 50 }

	if OrgID == 121703 then
		for i = 0 , 9 do  --10��
			Time = Time + 1
			if ReadRoleValue( Owner , EM_RoleValue_PID) == 0 then
				ChangeObjID( Owner , 121703) 				
			end
			sleep(10)
		end
		ChangeObjID( Owner , 121716) --���ܬ����Ϊ���
		WriteRoleValue( Owner , EM_RoleValue_PID , 1)

	elseif OrgID == 121704 then
		if PID == 0 then
			ChangeObjID( Owner , 121716) --���ܬ����Ϊ���
			WriteRoleValue( Owner , EM_RoleValue_PID , 2)
		elseif PID == 3 then
			for i = 0 , 10 do  --11��
				Time = Time + 1
				if ReadRoleValue( Owner , EM_RoleValue_PID) == 0 then
					ChangeObjID( Owner , 121704)				
				end
			sleep(10)
			end	
			ChangeObjID( Owner , 121716) --���ܬ����Ϊ���
			WriteRoleValue( Owner , EM_RoleValue_PID , 3)
		end					
	else
		if PID ~= 5 then --���O����F�Ҧb������
			if PID == 0 then
				Sleep(10)
				ChangeObjID( Owner , 121716) --���ܬ����Ϊ���
				WriteRoleValue( Owner , EM_RoleValue_PID , 4)
			else
				for i = 0 , 9 do  --10��
					Time = Time + 1
					if ReadRoleValue( Owner , EM_RoleValue_PID) == 0 then
						ChangeObjID( Owner , 121705) 			
					end
					sleep(10)
				end		
				ChangeObjID( Owner , 121716) --���ܬ����Ϊ���
				WriteRoleValue( Owner , EM_RoleValue_PID , 4)
			end	
		end
	end	
end



function Lua_na_2013_Flower_stair2() --���ö��誺��l�@��
	local Owner = OwnerID()
	local PID = ReadRoleValue( Owner , EM_RoleValue_PID)
	local Time = 0
	SetModeEx( Owner , EM_SetModeType_Obstruct, false )			--����	
	SysCastSpelllv( Owner , Owner , 850529 , 0)

	if PID == 1 then
		for i = 0 , 13 do  --14��
			Time = Time + 1
			if ReadRoleValue( Owner , EM_RoleValue_PID) == 0 then
				break
			end
			sleep(10)
		end
		SetModeEx( Owner , EM_SetModeType_Obstruct, true )
		ChangeObjID( Owner , 121703)
		WriteRoleValue( Owner , EM_RoleValue_PID , 1)
	elseif PID == 2 then		
		for i = 0 , 6 do  --7��
			Time = Time + 1
			if ReadRoleValue( Owner , EM_RoleValue_PID) == 0 then
				break
			end
			sleep(10)
		end
		SetModeEx( Owner , EM_SetModeType_Obstruct, true )
		ChangeObjID( Owner , 121704)
		WriteRoleValue( Owner , EM_RoleValue_PID , 3)
	elseif PID == 3 then
		for i = 0 , 12 do  --13��
			Time = Time + 1
			if ReadRoleValue( Owner , EM_RoleValue_PID) == 0 then
				break
			end
			sleep(10)
		end
		SetModeEx( Owner , EM_SetModeType_Obstruct, true )
		ChangeObjID( Owner , 121704)
		WriteRoleValue( Owner , EM_RoleValue_PID , 3)	
	elseif PID == 4 then
		for i = 0 , 13 do  --14��
			Time = Time + 1
			if ReadRoleValue( Owner , EM_RoleValue_PID) == 0 then
				break
			end
			sleep(10)
		end
		SetModeEx( Owner , EM_SetModeType_Obstruct, true )
		ChangeObjID( Owner , 121705)
		WriteRoleValue( Owner , EM_RoleValue_PID , 4)		
	end		
end



function Lua_na_2013_Flower_pos()
	local Owner = OwnerID()
	local Target = TargetID()
	local X, Y, Z , Dir =  Lua_Hao_Return_Coordinate( Target )
	SetPos ( Target , X , Y- 1 , Z , Dir )
end



--623869 �ݨ������P�ĤG�q���誺buff
function Lua_na_2013_Flower() --�Ū������ͼ@��
	local Owner = OwnerID()
	AddBuff( Owner , 623868 , 0 , -1) --���������S��
	SetPlot( Owner , "touch" , "Lua_na_2013_Flower_1" , 30 ) --�]�w������Ĳ�I�@��
end


function Lua_na_2013_Flower_1() --Ĳ�I�@��
	local Owner = OwnerID() --���a
	local Target = TargetID() --����

	if CountBodyItem( Owner , 242084 ) >= 1 then --�p�G���a���W���t���A�ӥB�T����W����
		if CheckFlag( Owner , 547359) == true then --�ˬd���a�O�_�����W
			ScriptMessage( Owner , Owner, 3 , "[SC_2013_FLOWER_NPC13]" , 0 ) --�ֱN�᯻�浹��ܨ�a�I
			DelBodyItem( Owner , 242084, 1 )
			GiveBodyItem( Owner , 242082 , 1 )
		else
			ScriptMessage( Owner , Owner, 3 , "[SC_2013_FLOWER_NPC15]" , 0 ) --�A��ѤF[121719]�ҩe�U���Ʊ��A�֦V[121719]�A���T�{�I
		end
	else
		ScriptMessage( Owner , Owner, 1 , "[SC_2013_FLOWER_NPC14]" , 0 ) --���W�S���t���A�L�k���o�᯻�C
	end
end



----------------------------------------
--���աA�R��NPC
----------------------------------------

function Lua_test_delNPC()
	local Owner = OwnerID()
	local NPC = SearchRangeNPC( Owner , 300)
	local RoomID = ReadRoleValue( Owner , EM_RoleValue_RoomID )
	local Count = SetSearchAllNPC( RoomID )
	local Obj
	local Stairs = {  121703, 121704, 121705 , 121708, 121709, 121710, 121716 }  --�R���Ҧ�����

	if  Count ~= 0 then
		for i=1 , Count , 1 do
		local ID = GetSearchResult()
			Obj=Role:New(ID)
			if Obj:IsNPC() == true then
				local Name = ReadRoleValue( ID , EM_RoleValue_OrgID )--�T�{�Ҧ�NPC���s��
				for j = 1 , table.getn( Stairs) , 1 do
					if Name == Stairs[j] then  --�Y���}�C������
						Delobj( ID) --������
					end
				end
			end
		end
	end
	Say( Owner , "Clear!" )
end



function Lua_na_2013_Flower_reset() --���m���O
	local Owner = OwnerID()
	local Flag = { 547358 , 547359 , 547360}
	for i = 1 , #Flag do
		SetFlag( Owner , Flag[i] , 0 )		
	end 
end



function Lua_na_2012_Flower_RESETNPC() --���m���誺�@��
	local Owner = OwnerID()
	local NPC = SearchRangeNPC( Owner , 300)
	local RoomID = ReadRoleValue( Owner , EM_RoleValue_RoomID )
	local Count = SetSearchAllNPC( RoomID )
	local Obj
	local Stairs = {  121703, 121704, 121705 , 121716 }  --���m����@��

	if  Count ~= 0 then
		for i=1 , Count , 1 do
		local ID = GetSearchResult()
			Obj=Role:New(ID)
			if Obj:IsNPC() == true then
				local Name = ReadRoleValue( ID , EM_RoleValue_OrgID )--�T�{�Ҧ�NPC���s��
				for j = 1 , table.getn( Stairs) , 1 do
					if Name == Stairs[j] then  --�Y���}�C������
						if ReadRoleValue( ID , EM_RoleValue_PID) ~= 5 then
							WriteRoleValue( ID , EM_RoleValue_PID , 0 ) 
						end
					end
				end
			end
		end
	end
--	Say( Owner , "Reset!" )
end