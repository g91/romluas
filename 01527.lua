

--------------------------------------------------------------
function LuaS_422715_0() -- ���b 422715 �������Ȱ���@��
--------------------------------------------------------------
--�ꦺNPC����
	DisableQuest(OwnerID(),true)
--�I�k
	CastSpell(OwnerID(),TargetID(),494221)
--����ǰe�ʧ@
	sleep(20)
	
	if 	ChangeZone(TargetID(),118,-1,563,676.3,-137,270)	 then
		local PlayerLV = ReadRoleValue( TargetID() , EM_RoleValue_LV )					-- ���o���a����
		local PlayerSUBLV = ReadRoleValue( TargetID() , EM_RoleValue_LV_SUB )				-- ���o���a��¾����
		DesignLog( TargetID() , 117 , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )		-- �����i�J�H��	
	else
		ScriptMessage( TargetID() , TargetID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
	end
--�Ѷ}
	DisableQuest(OwnerID(),false)
end
--------------------------------------------------------------
function LuaS_422725_0() -- ���b 422725 �������Ȱ���@��
--------------------------------------------------------------
--�ꦺNPC����
	DisableQuest(OwnerID(),true)
	sleep(10)
	Say(OwnerID(),"[SC_422725_0]")
	sleep(25)
	Say(OwnerID(),"[SC_422725_1]")
	sleep(15)
--�}��NPC����
	DisableQuest(OwnerID(),false)
end

--------------------------------------------------------------
function LuaS_422716_0() --���b422717 ���������Ȱ���@��
--------------------------------------------------------------
	AddBuff(TargetID(),504308,1,180)
end

--------------------------------------------------------------
function LuaS_422717_6() -- ���b 422718 & 422725�������Ȱ���@��
--------------------------------------------------------------
--buff�������ɭ�
--����k�N494225
--�|�]scirpt LuaS_422717_7 �P�_���ȧ������i��
	AddBuff(TargetID(),504729,1,180)
end

--------------------------------------------------------------
function LuaS_422717_7() --buff����������@��
--------------------------------------------------------------
	if	CheckCompleteQuest(OwnerID(),422718)	and
		CheckCompleteQuest(OwnerID(),422725)	then
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_422717_6]", 0 )
		SetFlag(OwnerID(),543283,1)
	end
end




---------------------------------------
function LuaS_422724_0() --���b���~(�i�ê��H��)���ϥμ@��
---------------------------------------
	DW_Border(422724)
end


---------------------------------------
function LuaS_422724_1() --���b102261 �D�H�k���q���X�ͼ@��
---------------------------------------
	SetPlot(OwnerID(),"dead","LuaS_422724_2",0)
end


---------------------------------------
function LuaS_422724_2() --�D�H�k���q�����`�@��
---------------------------------------
	local Temp = 0
	for i=0,HateListCount( OwnerID())-1,1	do
		Temp = HateListInfo(OwnerID(),i, EM_HateListInfoType_GItemID)
		if	not CheckCompleteQuest(Temp,422723)	then
			if	not CheckAcceptQuest(Temp,422724)	then
				GiveBodyItem(Temp,205843,1)
			end
		end
	end
end