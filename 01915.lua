-----�p�G�n�@�^�ª����Ф��n���Script���ƻs�A�u�ƻs�A�n�����q�N�n-----
------------------------------------------------  ����  ------------------------------------------------
function LuaI_207754(Option )
	local NeedSpace = 4
	local NeedSpaceStatus  = Check_Bag_Space( OwnerID() , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		end
	elseif ( Option == "USE" ) then
		local class = ReadRoleValue ( OwnerID(), EM_RoleValue_VOC)
		if class == 1 or class == 7 then
			GiveBodyItem(OwnerID(),212749,1)
		elseif class == 2 then
			GiveBodyItem(OwnerID(),212748,1)
		elseif class == 3 then
			GiveBodyItem(OwnerID(),212746,1)
		elseif class == 4 or class == 5 or class == 8 then
			GiveBodyItem(OwnerID(),212747,1)
		elseif class == 6 then
			GiveBodyItem(OwnerID(),212750,1)			
		end
		GiveBodyItem(OwnerID(),203047,3)
	end
end

Function LuaI_208793( Option ) --�L�v���ѥ�(1)�]
	local Num = 1
	if Option == "CHECK" then
		if Check_Bag_Space( OwnerID() , Num ) == false then
		return false
		end
	elseif Option == "USE" then
		GiveBodyItem( OwnerID(), 208302, 1)
	end
end

function LuaI_208541() --����CBT§�]���@

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 202902 , 30 , 208783 , 1 , 208786 , 1 , 205527 , 1 , 205541 , 1 , 208779 , 1} }	
	-- 
	return BaseTressureProc(   itemset , 6 )
end

function LuaI_208542() --����CBT§�]���G

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 202902 , 30 , 208783 , 1 , 208786 , 1 , 205525 , 1 , 205526 , 1 , 205527 , 1 , 205541 , 1 , 208779 , 1} }	
	-- 
	return BaseTressureProc(   itemset , 8 )
end

function LuaI_208794() --�׷��ǰe§�]

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 202903 , 99} }	
	-- 
	return BaseTressureProc(   itemset , 1 )
end

function LuaI_208962() --����Silver Pacakge

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 209491 , 1 , 208786 , 1 , 205526 , 1 , 208783 , 1 , 202902 , 30 , 202903 , 99 , 201445 , 999} }	
--	local itemset = { 100 , "" , { 201445 , 999 , 202902 , 30 , 202903 , 99 , 208786 , 1 , 205526 , 1 , 208783 , 203302 , 1 } }

	return BaseTressureProc(   itemset , 7 )
end

function LuaI_208963() --����Gold Package

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 209491 , 1 , 208777 , 1 , 208783 , 1 , 208786 , 1 , 205526 , 1 , 205527 , 1 , 208767 , 1 , 208772 , 1 , 202902 , 30 , 208794 , 2 , 201445 , 999} }	

--	local itemset = { 100 , "" , { 201445 , 999 , 202902 , 30 , 208783 , 1 , 208786 , 1 , 205526 , 1 , 205527 , 1 , 202903 , 99 , 202903 , 99 , 208767 , 1 , 208772 , 1 , 208777 , 1 , 203302 , 1 }}

 	return BaseTressureProc(   itemset , 11 )
--	return BaseTressureProc(   itemset , 12 )
end

function LuaI_208964() --����Pletinum  Package

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 209491 , 1 , 208777 , 1 , 202506 , 16 , 208783 , 1 , 208786 , 1 , 205525 , 1 , 205526 , 1 , 205527 , 1 , 205541 , 1 , 208779 , 1 , 208767 , 1 , 208772 , 1 , 202902 , 30 , 208794 , 3 , 201445 , 999} }	
	-- 
--	local itemset = { 100 , "" , { 201445 , 999 , 202902 , 30 , 208783 , 1 , 208786 , 1 , 205525 , 1 , 205526 , 1 , 205527 , 1 , 205541 , 1 , 208779 , 1 , 208767 , 1 , 202903 , 99 , 202903 , 99 , 202903 , 99 , 208772 , 1 , 202506 , 16 , 208777 , 1 , 203302 , 1 } }

	return BaseTressureProc(   itemset , 15 )
--	return BaseTressureProc(   itemset , 17 )
end

function LuaI_209519() --���� PC Cafe Coupon Package 2011/02/10

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 207809 , 2 , 207813 , 8 , 207817 , 4 } }	

	return BaseTressureProc(   itemset , 3 )
end

function LuaI_201349()	-- ����@�L�v�ǻ�§�] 2011/03/15

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 201350 , 50 } }
	-- �����L��§��50��(�����~�i�ϥ�50��)
	return BaseTressureProc( itemset , 1 )
end

function LuaI_201350()	-- ����@�����L��§�� 2011/03/15

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 201366 , 1 } }
	-- �L�庲�ѥ�1��
	return BaseTressureProc( itemset , 1 )
end

function LuaI_201520(Option) --���� �J����§�]
	local PlayerID = OwnerID()
	local ItemTable = {203323 , 205548 , 208788 , 208785 , 202903 , 201445}
	local ItemGiveTime = {1,1,1,1,50,500}
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , 6  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) or CheckFlag(PlayerID,540028) == TRUE then	--�P�_�w�g����L�]�����L�}
			return false
		end
	elseif ( Option == "USE" ) then
		for i=1,6 do
			GiveBodyItem( PlayerID , ItemTable[i] , ItemGiveTime[i] )	
		end
		SetFlag(PlayerID, 540028, 1)
	end
end
------------------------------------------------  �w��  ------------------------------------------------
function LuaI_208179() --�y���ͬ�§�] 2010/08/11 

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 201141 , 1 , 201139 , 1 , 205743 , 1 } }	-- �ᥧ�J������ū�B�j�ѨϪ��Į��B�ä[����S�_�_�d���J 

	return BaseTressureProc(   itemset , 3 )
end

function LuaI_208180() --Chapter III US Hero Package 2010/08/16

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 208181 , 1 , 206233 , 1 , 206477 , 1 , 208182 , 1 } }	-- ������§�]�BDungeon Survivor Bag�B�_�I�̪Z���j��§�]�B�y�v�C�L�M��§�]

	return BaseTressureProc(   itemset , 4 )
end

function LuaI_208181() --������§�] 2010/08/16

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 206936 , 1 , 205675 , 1 , 207421 , 1 , 207075 , 1 } }	-- �ä[�ɭ��N���~���M�B�ä[�զϦu���_�_�d���J�B���̤��|�����B100���p��

	return BaseTressureProc(   itemset , 4 )
end

function LuaI_208182() --�y�v�C�L�M��§�] 2010/08/16 

	local RoleName = GetName( OwnerID() ) 
	local Sex = ReadRoleValue( OwnerID() , EM_RoleValue_SEX )
	local itemSet = { }

	if Sex == 0 then
		itemset = { 100 , "" , { 226081 , 1 , 226082 , 1 , 226083 , 1 , 226084 , 1 , 226085 , 1 , 226086 , 1 } }
		-- �y�v�C�L�M��(�k)�B�y�v�C�L�ˤ�M(�k)�B�y�v�C�L�˪ӥ�(�k)�B�y�v�C�L�˩ܭ�(�k)�B�y�v�C�L�˪��u(�k)�B�y�v�C�L�˥ִU(�k)
	else
		itemset = { 100 , "" , { 226137 , 1 , 226138 , 1 , 226139 , 1 , 226140 , 1 , 226141 , 1 , 226142 , 1 } }
		-- �y�v�C�L�M��(�k)�B�y�v�C�L�ˤ�M(�k)�B�y�v�C�L�˪ӥ�(�k)�B�y�v�C�L�˩ܭ�(�k)�B�y�v�C�L�˪��u(�k)�B�y�v�C�L�˥ִU(�k)
	end
	return BaseTressureProc(   itemset , 6 )
end

function LuaI_208202() --Tukan-Package2010/08/30

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 207104 , 1 , 206221 , 5 , 206224 , 5 , 201619 , 5, 201610, 1, 201134, 1, 202800, 1 } }	
	-- �ä[���a���L���d���J�B�׳��w�ܨ��Ĥ��B�T�D�̤��v�ܨ��Ĥ� �B���B�ľ� �B�ޯ��ľ� �B�g���ľ��B�۩w�ٸ����O 
	return BaseTressureProc(   itemset , 7 )
end

function LuaI_208192() --Pet-Upgrade Package 2010/09/10

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 204460 , 1 , 204513 , 1 , 207582 , 1 , 204511 , 1 , 207575 , 1 , 207576 , 1 } }	
	-- �¦|���_�c1�ӡB���|��}�q��1�ӡB���_����(1��)1�ӡB�d�R���@�\1�ӡB�j���d��������1�ӡB��i�]��1�ӡC
	return BaseTressureProc(   itemset , 6 )
end

function LuaI_208193() --Wings of glory Package 2010/09/10

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 206289 , 1 , 224986 , 1 , 207495 , 1 , 207489 , 1 , 207490 , 1 , 202506 , 1 , 201610 , 1 , 201134 , 1 } }	
	-- �ä[�¤Ѱ����M1�ӡB�������l1�ӡB��¦�˹��~���վ�1�ӡB�˹��~�����1�ӡB�i���˹��~�����1�ӡB�����ײz��1�ӡB�ޯ��ľ�1�ӡB�g���ľ�1�ӡC
	return BaseTressureProc(   itemset , 8 )
end

function LuaI_208194() --Ice Beast Package 2010/09/10

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 203289 , 1 , 203592 , 1 , 205525 , 1 , 201141 , 1 , 201610 , 1 , 201134 , 1 , 201445 , 5 } }	
	-- �ä[���s���B�~���M1�ӡB30�Ѥp���r���ľ�1�ӡB30�ѭI�]�Ŷ��� - III1�ӡB�ᥧ�J������ū1�ӡB�ޯ��ľ�1�ӡB�g���ľ�1�ӡB�@���W�D�۸ܻ�5�ӡC
	return BaseTressureProc(   itemset , 7 )
end

function LuaI_208195() --Home Sweet Home Package 2010/09/10

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 206130 , 1 , 201292 , 1 , 202322 , 1 , 201381 , 1 , 201610 , 1 , 201134 , 1 , 206221 , 5 } }	
	-- �a�x�����h��Ϋ���1�ӡB�ާΪZ���[1�ӡB���ĩ��B�ľ�1�ӡB�Ť��_�c1�ӡB�ޯ��ľ�1�ӡB�g���ľ�1�ӡB�׳��w�ܨ��Ĥ�5�ӡC
	return BaseTressureProc(   itemset , 7 )
end

function LuaI_208315() --Special Online Package 2010/09/23

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 206944 , 1 , 207101 , 1 , 202322 , 1 , 203591 , 1 , 222926 , 1 , 222925 , 1 , 201610 , 1 , 201134 , 1 } }	
	-- 7�Ѳů���L���M�B�ä[���൳�_�_�d���J�B���ĩ��B�ľ��B7�Ѥp���r���ľ��B��ŧޯ��@�šB��Ÿg���@�šB�ޯ��ľ��B�g���ľ��C
	return BaseTressureProc(   itemset , 8 )
end

function LuaI_208322() -- Chapter III Package 2010/09/29

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 207088 , 1 , 203057 , 1 , 206209 , 1 , 222928 , 1 , 222927 , 1 , 202506 , 1 , 201087 , 1 , 201139 , 1 , 205547 , 1 , 201610 , 1 , 201134 , 1 , 201459 , 1 } }	
	-- �j�O�i�d�d���c1�ӡB�����t��������1�ӡB7�Ѩg�b�r�����M�]1�ӡB���ŧޯ��@��1�ӡB���Ÿg���@��1�ӡB
	-- �����ײz��1�ӡB��¦�Z�����վ�1�ӡB�j�ѨϪ��Į�1�ӡB7�ѭI�]�Ŷ��� - III1�ӡB�ޯ��ľ�1�ӡB�g���ľ�1�ӡB�t���˳ƥ�1�ӡC
	return BaseTressureProc(   itemset , 12 )
end

function LuaI_207585()	-- �����_���J§�] 2010/10/07

	local RoleName = GetName( OwnerID() )
	local Job = ReadRoleValue( OwnerID() , EM_RoleValue_VOC )
	local DD = { 0 , 1 , 2 , 3 , 6 }--GM�B�Ԥh�B�C�L�B�v��̡B�M�h
	local MD= { 4 , 5 , 7 , 8 }-- �k�v�B���q�B�˪L���̡B�۵M���x
	local GM = 0
	local Step = 0

	for i = 1 , table.getn(DD) , 1 do
		if Job == DD[i] then
			local itemset = { 100 , "" , { 207583 , 1 } }
			Step = 1
			return BaseTressureProc( itemset , 1 )
		end
		if Step == 1 then
			break
		end
	end
	for i = 1 , table.getn(MD) , 1 do
		if Job == MD[i] then
			local itemset = { 100 , "" , { 207584 , 1 } }
			Step = 1
			return BaseTressureProc( itemset , 1 )
		end
		if Step == 1 then
			break
		end
	end
end

--DE �S����§�] 2010.11.16
Function LuaI_207962(Option)
	local PlayerID = OwnerID()
	local PackageID = 207962
	local NeedSpace = 8
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , 201095 , 5 )
		GiveBodyItem( PlayerID , 201097 , 5 )
		GiveBodyItem( PlayerID , 203040 , 5 )
		GiveBodyItem( PlayerID , 201087 , 1 )
		GiveBodyItem( PlayerID , 201237 , 1 )
		GiveBodyItem( PlayerID , 203053 , 1 )
		GiveBodyItem( PlayerID , 202506 , 5 )
		GiveBodyItem( PlayerID , 206360 , 1 )
	end
end

function LuaI_208527() --Kalin's Phantom Set 2010/11/25

	local RoleName = GetName( OwnerID() ) 
	local itemSet = { }

	itemset = { 100 , "" , { 223621 , 1 , 223622 , 1 , 223623 , 1 , 223624 , 1 , 223625 , 1 } }
	-- �����i�̤W��B�����i�̤�M�B�����i�̪��u�B�����i���@�L�B�����i���Y��
	
	return BaseTressureProc(   itemset , 5 )
end

function LuaI_208528() --Muse Set 2010/11/25

	local RoleName = GetName( OwnerID() ) 
	local itemSet = { }

	itemset = { 100 , "" , { 223626 , 1 , 223627 , 1 , 223628 , 1 , 223629 , 1 , 223630 , 1 } }
	-- �A��i�̤W��B�A��i�̤�M�B�A��i�̪��u�B�A��i���@�L�B�A��i���Y��
	
	return BaseTressureProc(   itemset , 5 )
end

function LuaI_208529() --Muse Set 2010/11/25

	local RoleName = GetName( OwnerID() ) 
	local itemSet = { }

	itemset = { 100 , "" , { 223631 , 1 , 223632 , 1 , 223633 , 1 , 223634 , 1 , 223646 , 1 } }
	-- �����i�̤W��B�����i�̤�M�B�����i�̪��u�B�����i���@�L�B�����i���Y��
	
	return BaseTressureProc(   itemset , 5 )
end

function LuaI_208538() -- �v����§�] 2010/12/06

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 207761 , 10 , 207762 , 10 , 207763 , 10 , 201088 , 1 , 201238 , 1 , 203054 , 1 , 202506 , 10 } }
	-- �O��Z����*10�B�O��˳ƥ�*10�B�O�䭺����*10�B�i���Z�����վ�*1�B�i�����㥴�վ�*1�B�i���������վ�*1�B�����ײz��*10�C
	return BaseTressureProc(   itemset , 7 )
end

function LuaI_208539() -- ��ﰪ��§�] 2010/12/06

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 202822 , 5 , 202823 , 5 , 207761 , 5 , 207762 , 5 , 207763 , 5 , 202506 , 5 } }
	-- �˳ƫʦL��*5�B�˳Ƹѫʾ�*5�B�O��Z����*5�B�O��˳ƥ�*5�B�O�䭺����*5�B�����ײz��*5�C
	return BaseTressureProc(   itemset , 6 )
end

function LuaI_208923() -- �촵�먺�Ȧ�] 2011/01/06	
	
	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 208691 , 1 , 203591 , 1 , 202903 , 5 , 202435 , 5 , 222925 , 1 , 222926 , 1 } }
	-- 7�Ѧ岪�]�s���M*1�B7�Ѥp���r���ľ�*1�B�ǰe�̲Ť�*5�B�a������*5�B��Ÿg���@��*1�B��ŧޯ��@��*1
	return BaseTressureProc(   itemset , 6 )
end	

function LuaI_209520() -- ���ũO��§�]	
	
	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 207761 , 10 , 207762 , 10 , 207763 , 10 , 201088 , 1 , 201238 , 1 , 203054 , 1 , 202506 , 10} }
	--
	return BaseTressureProc(   itemset , 7 )
end

function LuaI_209521() -- �O��PVP§�]	
	
	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 202822 , 5 , 202823 , 5 , 207761 , 5 , 207762 , 5 , 207763 , 5 , 202506 , 5} }
	--
	return BaseTressureProc(   itemset , 6 )
end

function LuaI_209522() -- �w�� ���Ȧ�§�] 2011/02/11
	
	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 206936 , 1 , 208530 , 1 , 207421 , 1 , 207075 , 1 } }
	-- �ä[�ɭ��N���~���M�B���۪��զϦu���_�_�d���J�B���̤��|�����B100���p��
	return BaseTressureProc(   itemset , 4 )
end

function LuaI_209523() -- �w�� ���سí�§�] 2011/02/11

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 204682 , 1 , 201472 , 1 , 201510 , 1 , 201345 , 1 , 201410 , 1 , 204701 , 1 , 201382 , 1 , 205585 , 1 } }
	-- ���R�a��F�o�B�J�ᰪ���d�B�_�űy���ȡB���ĶQ�ڧɡB�Q���J����l�B�ɩ|�Ů�´��B���Y���_�c�B�j�W�ƻ��اO�֫���
	return BaseTressureProc(   itemset , 8 )
end

function LuaI_209524() --�w�� �W�a����§�] 2011/02/11

	local RoleName = GetName( OwnerID() ) 
	local Sex = ReadRoleValue( OwnerID() , EM_RoleValue_SEX )
	local itemset = { }
	if Sex == 0 then
		itemset = { 100 , "" , { 209522 , 1 , 206233 , 1 , 206477 ,  1 , 208182 , 1 , 202027 , 1 , 209523 , 1 } }
		-- ���Ȧ�§�]�BDungeon Survivor Bag�B�_�I�̪Z���j��§�]�B�y�v�C�L�M��§�]�B���v���V�M�˥]�B���سí�§�]
	elseif Sex == 1 then
		itemset = { 100 , "" , { 209522 , 1 , 206233 , 1 , 206477 ,  1 , 208182 , 1 , 202023 , 1 , 209523 , 1 } }
		-- ���Ȧ�§�]�BDungeon Survivor Bag�B�_�I�̪Z���j��§�]�B�y�v�C�L�M��§�]�B�����]�ۮM�˥]�B���سí�§�]
	end
	return BaseTressureProc(   itemset , 6 )
end

function LuaI_209463() --�ɦ�X�w�M��§�] 2011/05/11

	local Sex = ReadRoleValue( OwnerID() , EM_RoleValue_SEX )
	local itemSet = { }

	if Sex == 0 then  --�k
		itemset = { 100 , "" , { 228694 , 1 , 228693 , 1 , 228697 , 1  } }
	else -- �k
		itemset = { 100 , "" , { 228696 , 1 , 228695 , 1 , 228697 , 1  } }
	end
	return BaseTressureProc(   itemset , 3 )
end

function LuaI_240595() -- �w�� �ξA�a�~§�] 2011/06/29

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 206129 , 1 , 201601 , 1 , 204763 , 1 , 201504 , 1 , 201512 , 1 , 201410 , 1 } }
	--���ؤG�h��Ϊ��a�U�ǫ����B�ج����ǴȡB�����J���_���B�I�����B�j���J���d�B�Q���J����l
	return BaseTressureProc(   itemset , 6 )
end

function LuaI_240922() -- �w�� Skeletal Siren Costume Bundle

	local Sex = ReadRoleValue( OwnerID() , EM_RoleValue_SEX )
	local itemSet = { }

	if Sex == 0 then  --�k
		itemset = { 100 , "" , { 227540, 1, --skeletal siren gloves
				         227541, 1, -- Skeletal siren vest
				         227542 , 1 , -- Skeletal siren cape
				         227543 , 1 , -- skeletal siren leggings
				         227544, 1, -- skeletal siren headdress
				         227545, 1  } } -- skeletal siren magic boots
	else -- �k
	
	                 itemset = { 100 , "" , { 227552, 1, --skeletal siren gloves
				         227553, 1, -- Skeletal siren vest
				         227554 , 1 , -- Skeletal siren cape
				         227555 , 1 , -- skeletal siren leggings
				         227556, 1, -- skeletal siren headdress
				         228674, 1  } } -- skeletal siren magic boots
	end
	return BaseTressureProc(   itemset , 6 )
end

function LuaI_241003() -- �w��Grinning Rogue Costume Bundle

	local Sex = ReadRoleValue( OwnerID() , EM_RoleValue_SEX )
	local itemSet = { }

	if Sex == 0 then  --�k
		itemset = { 100 , "" , { 228681, 1, --Grinning Rogue Coat
				        228682, 1, -- Grinning Rogue Gloves
				         228683 , 1 , -- Grinning Rogue Shoulder Armor
				          228684, 1, -- Grinning Rogue Boots
				          228685, 1, -- Grinning Rogue Trousers
				         228686, 1  } } -- Grinning Rogue Helmet
	else -- �k
	
		itemset = { 100 , "" , { 228687, 1, --Grinning Rogue Coat
				        228688, 1, -- Grinning Rogue Gloves
				         228689 , 1 , -- Grinning Rogue Shoulder Armor
				          228690, 1, -- Grinning Rogue Boots
				          228691, 1, -- Grinning Rogue Trousers
				         228692, 1  } } -- Grinning Rogue Helmet
	end
	return BaseTressureProc(   itemset , 6 )
end

function LuaI_241002()  --�w�� Advanced Adventurer Package

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 202506 , 1 , --Golden Repair  Hammer 
				   201238 , 1 , -- Advanced Armor Driller
				   207762 , 10 ,-- Moon Jewel- Revelation 
				   207765 , 1 ,--Advanced Moon Jewel Revelation 
			                202322 , 1 , -- Potent luck potion
				201293 , 1 } }-- Cross weapon rack

	return BaseTressureProc(   itemset , 15 )
end

function LuaI_240813() --�D�w �W�a���§�] 2011/09/13

	local RoleName = GetName( OwnerID() ) 
	local Sex = ReadRoleValue( OwnerID() , EM_RoleValue_SEX )
	local itemset = { }
	if Sex == 0 then --�k
		itemset = { 100 , "" , { 207075 , 1 , 206177 , 1 , 240088 ,  1 , 240814 , 1 , 206233 , 1 , 206477 , 1 , 240187 , 1 , 240811 , 1 } }
		-- 100���p�ۡB�ä[��F�Ԧ��~�d���J�B�ä[�P�V�ܯS�����M�B���j���_�I�̡BDungeon Survivor Bag�B�_�I�̪Z���j��§�]�B���p������]�ġB����]���k��§�]
	elseif Sex == 1 then --�k
		itemset = { 100 , "" , { 207075 , 1 , 206177 , 1 , 240088 ,  1 , 240814 , 1 , 206233 , 1 , 206477 , 1 , 240187 , 1 , 240812 , 1 } }
		-- 100���p�ۡB�ä[��F�Ԧ��~�d���J�B�ä[�P�V�ܯS�����M�B���j���_�I�̡BDungeon Survivor Bag�B�_�I�̪Z���j��§�]�B���p������]�ġB����]���k��§�]
	end
	return BaseTressureProc(   itemset , 8 )
end

function LuaI_240811() --����]���k��§�] 2011/09/13

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 227546 , 1 , 227547 , 1 , 227548 , 1 , 227549 , 1 , 227550 , 1 , 227551 , 1 } }
	--����]����M(�k)�B����]������(�k)�B����]���@��(�k)�B����]������(�k)�B����]������(�k)�B����]�����u(�k)
	return BaseTressureProc(   itemset , 6 )
end

function LuaI_240812() --����]���k��§�] 2011/09/13

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 228675 , 1 , 228676 , 1 , 228677 , 1 , 228678 , 1 , 228679 , 1 , 228680 , 1 } }
	--����]���@��(�k)�B����]������(�k)�B����]���@��(�k)�B����]���žc(�k)�B����]���u��(�k)�B����]������(�k)
	return BaseTressureProc(   itemset , 6 )
end

function LuaI_209538()   --LOGO Package2011/12/09

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 226803, 1, 208703, 1,  207710, 1,   209527,  1,  206129,   1,  201134,  1,  201610,   1, 201237,  1,  202903,  2,  202435 ,2 , 222925, 1,  207762,   1, 206410 , 1 , 201087, 1 } }
	return BaseTressureProc(   itemset , 14 )

end


------------------------------------------------  ����  ------------------------------------------------
function LuaI_208183() --��������§�] 2010/08/19

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 201445 , 20 , 205975 , 1 , 205977 , 1 , 206358 , 1 , 205525 , 1 , 207743 , 1 , 203044 , 5 , 203045 , 10 } }
	-- �@���W�D�۸ܻ��B30�Ѷi���g���ľ��B30�Ѷi���ޯ��ľ��B30�ѷ����԰����M�B30�ѭI�]�Ŷ��� - III�B30�ѻȦ�Ŷ��� - II�B�������֪Z���ۡB�������ָ˳ƥ�
	return BaseTressureProc(   itemset , 8 )
end
------------------------------------------------  ��߻�  ----------------------------------------------
function LuaI_208316() --��l�̤u��§�� 2010/09/27

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 202452 , 1 , 203044 , 12 , 203045 , 50 , 203046 , 30 , 203574 , 6 , 201618 , 12 } }
	-- 30�Ѷ¦�԰����M�B�������֪Z����12�ӡB�������ָ˳ƥ�50�ӡB�������֭�����30�ӡB���Ÿg���ľ�6�ӡB�j�v�ޯ��ľ�12�ӡC
	return BaseTressureProc(   itemset , 6 )
end
------------------------------------------------���F----------------------------------------------------
function LuaI_208957() --���F�] 2010/12/14

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 205857 , 1 , 222926 , 1 , 222925 , 1 , 201139 , 1 , 204682 , 1 , 202461 , 1 , 205525 , 1 , 206199 , 1 } }
	-- �Q�C���s�~�d���J�B��ŧޯ��@��1�ӡB��Ÿg���@��1�ӡB�j�ѨϪ��Į�1�ӡB���R�a��F�o�B30�Ѩ��K�Ԫꧤ�M�B30�ѭI�]�Ŷ��� - III�B�ä[���r�����M�C
	return BaseTressureProc(   itemset , 8 )
end
------------------------------------------------  �饻  ------------------------------------------------
--�饻�ݨD 1,000���p§��  2010/12/07
function LuaI_208540() 
	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 202881 , 1 , 202928 , 1 } }
	-- �L�庲�ѥ� . �]���_����q10�I
	return BaseTressureProc(   itemset , 2 )
end

function LuaI_209477()	-- �饻�@���ҫ_�I§�] 2011/02/01

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 202846 , 1 , 202846 , 1 , 202846 , 1 } }
	-- 7���]��3��
	return BaseTressureProc(   itemset , 3 )
end

function LuaI_209478()	-- �饻�@�P�жǻ�§�] 2011/02/01

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 202847 , 1 , 202847 , 1 , 202847 , 1 } }
	-- 8���]��3��
	return BaseTressureProc(   itemset , 3 )
end
-------2012 1��---�饻
function LuaI_241147()          --�饻 �C���]��§�]�]���ӡ^2012/01/12

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 202846 , 1 } }
	-- 7���]��1��
	return BaseTressureProc(   itemset , 1 )
end

function LuaI_241148()          --�饻 �C���]��§�] �]���ӡ^�]�]�ˡ^2012/01/12
	givebodyitem(OwnerID(), 241147, 6)
end


function LuaI_241149()          --�饻 �K���]��§�]�]���ӡ^2012/01/12

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 202847 , 1 } }
	-- �K���]��1��
	return BaseTressureProc(   itemset , 1 )
end

function LuaI_241150()          --�饻 �K���]��§�]�]���ӡ^�]�]�ˡ^2012/01/12
	givebodyitem(OwnerID(), 241149, 6)
end

function LuaI_241151()          --�饻 �E���]��§�]�]�T�ӡ^2012/01/12
	
	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 202848 , 1 } }
	-- �E���]��1��
	return BaseTressureProc(   itemset , 1 )

end

function LuaI_241152()          --�饻 �E���]��§�]�]�T�ӡ^�]�]�ˡ^2012/01/12
	givebodyitem(OwnerID(), 241151, 3)
end

function LuaI_241153()          --�饻 �E���]��§�]�]���ӡ^2012/01/12
	
	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 202848 , 1 } }
	-- �E���]��1��
	return BaseTressureProc(   itemset , 1 )
end

function LuaI_241154()          --�饻 �E���]��§�]�]���ӡ^�]�]�ˡ^2012/01/12
	givebodyitem(OwnerID(), 241153, 6)
end

function LuaI_241155()          --�Q���]��§�]�]�T�ӡ^2012/01/12
	
	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 202849 , 1 } }
	-- �Q���]��1��
	return BaseTressureProc(   itemset , 1 )

end

function LuaI_241156()          --�Q���]��§�]�]�T�ӡ^�]�]�ˡ^2012/01/12
	givebodyitem(OwnerID(), 241155, 3)
end

function LuaI_241157()          --�Q���]��§�]�]���ӡ^2012/01/12
	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 202849 , 1 } }
	-- �Q���]��1��
	return BaseTressureProc(   itemset , 1 )
end

function LuaI_241158()          --�Q���]��§�]�]���ӡ^�]�]�ˡ^2012/01/12
	givebodyitem(OwnerID(), 241157, 6)
end

function LuaI_241159()          --�Q�@���]��§�]�]�T�ӡ^2012/01/12
	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 202850 , 1 } }
	-- �Q�@���]��1��
	return BaseTressureProc(   itemset , 1 )

end

function LuaI_241160()          --�Q�@���]��§�]�]�T�ӡ^�]�]�ˡ^2012/01/12
	givebodyitem(OwnerID(), 241159, 3)
end

function LuaI_241161()          --�Q�@���]��§�]�]���ӡ^2012/01/12
	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 202850 , 1 } }
	-- �Q�@���]��1��
	return BaseTressureProc(   itemset , 1 )
end

function LuaI_241162()          --�Q�@���]��§�]�]���ӡ^�]�]�ˡ^2012/01/12
	givebodyitem(OwnerID(), 241161, 6)
end

function LuaI_241163()   --������ 2012/01/12
	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 201445 , 5 , 203503 , 40 , 203498 , 40 , 203878 , 2 } }
	--�@���W�D�۸ܻ��B�����ůS���]�ġB�����ůS���Ĥ� �B���ĲM���t�Ũ� 
	return BaseTressureProc(   itemset , 4 )
end

function LuaI_241164()   --�S�j�m�U2012/01/12
	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 201445 , 10 , 203525 , 3 , 203493 , 30 , 203576, 1 } }
	--�@���W�D�۸ܻ��B����ū�o�� �B�����ůS�ů��_�� �B�j�v�����ײz�� 
	return BaseTressureProc(   itemset , 4 )
end



function LuaI_241165()          --�L�庲�ѥۡ]10�ӡ^2012/01/12
	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 202881 , 1 } }
	-- �L�庲�ѥ�1��
	return BaseTressureProc(   itemset , 1 )
end

function LuaI_241166()          --�L�庲�ѥۡ]10�ӡ^�]�]�ˡ^2012/01/12
	givebodyitem(OwnerID(), 241165, 10)
end

function LuaI_241167()          --�L�庲�ѥۡ]12�ӡ^2012/01/12
	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 202881 , 1 } }
	-- �L�庲�ѥ�1��
	return BaseTressureProc(   itemset , 1 )
end

function LuaI_241168()          --�L�庲�ѥۡ]12�ӡ^�]�]�ˡ^2012/01/12
	givebodyitem(OwnerID(), 241167, 12)
end

function LuaI_241169()   --�̰��ŹD��§�]2012/01/12
	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 207761 , 5 , 207762 , 5 , 207763 , 5 , 201088, 1, 201238, 1, 203054, 1, 202506, 3 } }
	--�O��Z���ۡB�O��˳ƥ� �B�O�䭺���� �B�i���Z�����վ� �B �i�����㥴�վ� �B�i���������վ�  �B�����ײz��
	return BaseTressureProc(   itemset , 7 )
end

function LuaI_241170()   --Welcome§�]2012/01/12
	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 205525 , 1 , 206623 ,1 , 201608 , 1 , 201617, 3, 206715, 1, 202322, 2 } }
	--30�ѭI�]�Ŷ��� - III �B1�Ѿr���ľ��B���[�g���ľ�  �B�M�a�ޯ��ľ�  �B 7�Ѥۼv���I���M�B���ĩ��B�ľ�  
	return BaseTressureProc(   itemset , 6 )
end