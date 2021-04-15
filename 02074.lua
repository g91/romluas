function Lua_xmas_na_peco_NPCspeak()	--NPC �K�i�D�f�d��l��SCRIPT
	local x = CheckFlag( OwnerID(), 543854 ) --���U�j���V���
	local y = CheckFlag( OwnerID(), 543855 ) --���U�j���ڱH�ͪG��
	local z = CheckFlag( OwnerID(), 543856 )	--���U�j���ղ��
	local w = CheckFlag(OwnerID(), 543858 )	--�������ȨC��X��
	local Lv = ReadRoleValue ( OwnerID(), EM_RoleValue_LV ) --�ˬd���a����
	LoadQuestOption( OwnerID())
--	SetSpeakDetail( OwnerID(), GetString("SC_XMAS_NA_PECO") )	--�@�~�@�ײ��j���x�V�`�S���{�F�I���L���~���ŧi�ۤ@�~�Y�N�����A�o�]�R���\�h�w�ֻP��_�A���ڭ̦@�P�w�׳o�Ӭ��n���`��a�I
	AddSpeakOption( OwnerID(), TargetID( ), GetString("K_2008xmss_1_s9") , "Lua_xmas_na_background", 0 ) --�ڷQ���D�x�V�`���Ѩ�
	if Lv < 53 then 	--���a���ŧC��53�A����ܥ��ȿﶵ
		return false
	elseif w == true then 	--�����C��X�СA����ܥ��ȿﶵ
		return false
	elseif x or y or z ==true then	--�w�����ȡA����ܿﶵ
		return false
	elseif CheckBuff( OwnerID() , 507897) ==TRUE and w == false then --�ˬd�W�@�����ȧ����X�СA36�p�ɤ������A������
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_XMAS_NA_PECO_01"), "Lua_xmas_na_raindeer_adopt_yes", 0 )	--���湥��
	else
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_XMAS_NA_PECO_02"), "Lua_xmas_na_raindeer_adopt", 0 )	--����{�i����
	end
end


function Lua_xmas_na_raindeer_adopt()	--�{�i����
	SetSpeakDetail( OwnerID(), GetString("SC_XMAS_NA_ADOPT") )	--���F����`�y�ǲΡA�����Űӷ|�ǳư��V�@��s�������A�H�K���ӥi�H�H�ɱ����L�k�u�@���ѹ����̡C�������ө����M�ũM�o�]�Q���x�p�A�ҥH�̭��n���O�إ߰_�����P�H�̤������H��A�A�O�_�@�N��U�{�i�@�������A�åB�Τ߷��U�e�O�H
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_XMAS_NA_ADOPT_1"), "Lua_xmas_na_raindeer_adopt_yes", 0 )	--��U�{�i����
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_XMAS_NA_ADOPT_2"), "Lua_xmas_na_raindeer_adopt_no", 0 )	--�ڦA�Ҽ{�@�U
end


function Lua_xmas_na_raindeer_adopt_yes()	--��U�{�i����
	SetSpeakDetail( OwnerID(), GetString("SC_XMAS_NA_ADOPT_YES") ) --�u�n�A�ΤߨC�ѳ��ӷ��U�e�̡A�۫H�A�@�w�|��o�N�Q���쪺�^�X���C
	local random = rand(100)
--	say( OwnerID(), random)
	if random >=55  then  -- 45% �ݨD�~���V���
		SetFlag( OwnerID(), 543854, 1)
	elseif random <=54 and random >=10  then --45%���ڱH�ͪG��
		SetFlag( OwnerID(), 543855, 1)
	elseif random <=9 then			--10%���ղ��
		SetFlag( OwnerID(), 543856, 1)  
	end
end


function Lua_xmas_na_background()--�ڷQ���D�x�V�`���Ѩ�
	SetSpeakDetail( OwnerID(), GetString("K_2008XMSS_1_S10")   )--�x�V�`
end


function Lua_xmas_na_raindeer_adopt_no()
	SetSpeakDetail( OwnerID(), GetString("SC_XMAS_NA_ADOPT_NO") ) --�Y�A���ܤ߷N�A�H���w��A�ӧ�ڡC
end


function Lua_xmas_na_dailycheck()	--�ˬdBUFF���ŵ������y
--Owner = NPC
--Target = player
	local Target = TargetID()
	local BuffID = 507897
	local BuffLv = FN_CountBuffLevel( Target, BuffID )  
	BeginPlot( Target , "Lua_xmas_na_delkeyitem",0) --�R��³��ݨD�X��
	SetFlag( Target , 543858,1 )
	local check = CheckBuff ( Target , 507897)
	if check == false then --�Ĥ@��
		AddBuff(  Target, BuffID , 0 , 129600 )	--�I���H, buff�s��, �k�N����, ���Įɶ�	
		GiveBodyItem(  Target, 720293, 1)	--�������Ĥ�
	--	say (TargetID(), "1" )
	else
--�ˬdBUFF����
--		say (TargetID(), BuffLv)
		if BuffLv == 5 then	--�ĤC��
			GiveBodyItem( Target, 720614, 1 )	--�y���x�V��a��
			CancelBuff(  Target, 507897)

		elseif BuffLv == 4 then	--�Ĥ���
			GiveBodyItem( Target , 208461 , 1 )	--7������H�d���J	
			AddBuff( Target, 507897 , 0 , 129600 )

		elseif BuffLv == 3 then	--�Ĥ���
			GiveBodyItem( Target, 207747 , 1 )	--7�ѻȦ�Ŷ��� - II	
			AddBuff( Target, 507897 , 0 , 129600 )

		elseif BuffLv == 2 then	--�ĥ|��
			GiveBodyItem( Target, 725519, 1 )	--7�ѹ������M
			AddBuff( Target, 507897 , 0 , 129600 )


		elseif BuffLv == 1 then	--�ĤT��
			GiveBodyItem( Target, 207961, 3 )	--�x�V�����ܨ��}X3
			AddBuff(  Target, 507897 , 0 , 129600 )

		elseif BuffLv == 0 then	--�ĤG��
			GiveBodyItem( Target, 720289, 1 )	--�Ϥ��]
			AddBuff(  Target, 507897 , 0 , 129600 )

		end
	end
end


function Lua_xmas_na_delkeyitem() --�R���X��
	SetFlag( OwnerID(), 543854,0)
	SetFlag( OwnerID(), 543855,0)
	SetFlag( OwnerID(), 543856,0)
end

--���ե�
function Lua_xmas_na_delbuff()
	CancelBuff(  TargetID(), 507897)
end

function Lua_xmas_na_deldaily()
	SetFlag( OwnerID(), 543858,0 )
end


function Lua_xmas_na_debug()
	SetFlag( OwnerID(), 543854,0)
	SetFlag( OwnerID(), 543855,0)
	SetFlag( OwnerID(), 543856,0)
	SetFlag( OwnerID(), 543858,0)
--	BeginPlot( OwnerID(), "Lua_DailyQuest_CLS",0 )
	say( OwnerID(), "CLEAR")
end