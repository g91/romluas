function Lua_na_119642_check() --�U�ҡD�w���d�ˬd���a�O�_�w�g��M�l�ᱼ
local Q1 = CheckAcceptQuest( OwnerID() , 424794 ) --�ˬd���W�O�_������ �ĩ_���M�l
local Q2 = CheckAcceptQuest( OwnerID() , 424795 ) -- �ˬd���W�O�_������ �פW����M
local KEY = CheckFlag (OwnerID() , 545767 ) 

local a = CheckCompleteQuest( OwnerID(), 424795 ) -- �פW����M
local b = CheckCompleteQuest( OwnerID(), 424794 )  --�ĺX���M�l
local cup = CountBodyItem ( OwnerID(), 240792 )

	if Q1 == true and Key == false then --���a���F�Ĥ@���q�����ȡA�P�U�ҹ�ܨ��o�U�@���q�����ȶ}�Ҹ�� 
		Setspeakdetail (OwnerID(), GetString("SC_119642_3") ) --�ĩ_���M�l�K�H�ĩ_���M�l�K�K�@�ڡK���K���K�K�ڬO���h��L�ܰs�S���K�K
		GiveBodyItem( OwnerID() , 545767, 1 )

	else
		LoadQuestOption( OwnerID() )
		if a == true and b == false and cup < 1 then		--�p�G���a�N�ĩ_���M�l�˥�A���s�������ȥΪM
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_119642_0"), "Lua_na_119642_give", 0 ) -- �ڧ��ĩ_���M�l�˥�F
		end
	end
end



function Lua_na_119642_give() --�U�ҡD�w���d
	local X=Countbodyitem( OwnerID(), 240792) -- �R���p�N����M
	if  X< 1 then
		Setspeakdetail (OwnerID(), GetString("SC_119642_1") ) -- �u�r�I�A���o��ʤߩO�I�٦n�ڦb�W���I�F�^�k�k�N�A�b[119641]���Q����M�l�e�A�Y�O�򥢤F�A���|�۰ʦ^��ڨ���C�o���A�i�O�A�˥�F�r�I
		Givebodyitem ( OwnerID(), 240792, 1 )
	else
		Setspeakdetail (OwnerID(), GetString("SC_119642_2") ) --�A�Ӥ��|��ڤ@�˦Ѱg�k�F�a�H�@�@�I�M�l���N�b�A���W�ܡI
	end
end


function Lua_119877_say() --�g�g�D�ǦL�����
	local Owner = OwnerID()
	while true do
		local R = rand(10)
	--	Say( Owner , R )
		if R == 1 then
			NPCSAY( Owner , "[SC_119877_SPEAK1]" ) --�ڷQ��x�T�������A�i�O�u�è������ܳ����ڤڪ��K�K
		elseif R == 3 then
			NPCSAY( Owner , "[SC_119877_SPEAK2]" ) --�~�����D�n�i�ȭ�I�L�̷|���|�@�f��ڦY���r�H
		elseif R ==5 then
			NPCSAY( Owner , "[SC_119877_SPEAK3]" ) --�p�G����I���j�A�N�i�H��B�_�I�F�I
		end
		sleep(100)
	end			
end
	