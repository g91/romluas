function SongSong_Bag_LV0( WeaponGroup , ArmorGroup , AccessGroup , HPPotionGroup , MPPotionGroup , HuFuGroup , SpecBagGroup )

	local PlayerID = OwnerID()

	local job = ReadRoleValue( PlayerID , EM_RoleValue_VOC )

--	if ( job == 7) then
--		job = 1  
--	end
--	if ( job == 8 )  then
--		job = 4
--	end

	if ( job == 0 ) then	-- �޲z��
		ScriptMessage( PlayerID , PlayerID , 2 , "Please don't use GM to test this !!" , C_SYSTEM )	-- �e�������T��
		return WeaponGroup[1] , ArmorGroup[1] , AccessGroup[1] , HPPotionGroup[1] , MPPotionGroup[1] , HuFuGroup[1] , SpecBagGroup[1]
	else
		return WeaponGroup[job] , ArmorGroup[job] , AccessGroup[job] , HPPotionGroup[job] , MPPotionGroup[job] , HuFuGroup[job] , SpecBagGroup[job]	-- �Ԥh�B�C�L�B�v��B�k�v�B���q�B�M�h
	end

end

function Check_Bag_Space( PlayerID , NeedSpace )

	local QueueOfBag = QueuePacketCount( PlayerID )	--�p��Queue���X��
	local SpaceOfBag = EmptyPacketCount( PlayerID )	--�p��I�]���X�ӪŦ�
	--Say(PlayerID,"QueueOfBag = "..QueueOfBag.."SpaceOfBag = "..SpaceOfBag)
	if ( QueueOfBag <= 10 ) then
		if ( SpaceOfBag >= NeedSpace ) then
			--Say(PlayerID,"Q1")
			return true
		else
			ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("MSG_SONGSONGBAGWARN") , C_DEFAULT )	-- �I�]�Ů���줣���A�L�k��U§�]�������~�I
			--Say(PlayerID,"Q2")
			return false
		end
	else
		--Say(PlayerID,"Q3")
		return false
	end
end

function Check_Bag_Space2( PlayerID , NeedSpace )

	local QueueOfBag = QueuePacketCount( PlayerID )	--�p��Queue���X��
	local SpaceOfBag = EmptyPacketCount( PlayerID )	--�p��I�]���X�ӪŦ�
	--Say(PlayerID,"QueueOfBag = "..QueueOfBag.."SpaceOfBag = "..SpaceOfBag)
	if ( QueueOfBag <= 3 ) then
		if ( SpaceOfBag >= NeedSpace ) then
			--Say(PlayerID,"Q1")
			return true
		else
			ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("MSG_SONGSONGBAGWARN") , C_DEFAULT )	-- �I�]�Ů���줣���A�L�k��U§�]�������~�I
			--Say(PlayerID,"Q2")
			return false
		end
	else
		--Say(PlayerID,"Q3")
		return false
	end
end

function SongSong_Bag_Bomb()	-- ���ƶ}�]���g�@�z��
	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_SONGSONGBAGBOMB]" , C_DEFAULT )	-- �]���������O�q�v�T�A�z�ҨϥΪ����~���ͤF�z���I
	CastSpellLV( OwnerID() , OwnerID() , 492471, 4 )
end


-- �R���s��§�]�Ҧ�����key  1 - 50
function lua_mika_newbiebag_delkey()
	local OID = OwnerID()
	local keylist = {
			542321, 542322, 542323, 542324, 542325, 
			542326, 542327, 542328,542329, 542330, 
			542331, 542332, 542333, 542334, 542335, 
			542336, 542337, 542338, 542339, 542340, 
			542341, 542342, 542343, 542344, 542345, 
			542346
			}

	for i = 1, table.getn(keylist) do
		Setflag(OID, keylist[i], 0 )
	end
	Say(OID, "delete all key ok")

end