function Lua_na_thanks_begin0()
	local O_ID = OwnerID()
	LoadQuestOption( O_ID)
	if checkflag(O_ID , 546091) == false then
		SetFlag( O_ID , 546084 , 1 )
	end
end


function Lua_na_thanks_test1end()
	SetFlag( O_ID , 546084 , 0 )
	SetFlag( O_ID , 546091 , 1 )
end

function lua_TEST_mobius_tp_stone(mode) --�p�ɼҦ���TP�۩��(amount=��������) mode=�Ҧ� 
--�b�ͦs�Ҧ����A�C���@���s��A�o��s��A�����v�O30%�A�s��B�����v�O70%�C--mode= 0
--�b�p�ɼҦ����A�C���@���s��A�o��s��A�����v�O70%�A�s��B�����v�O30%�C--mode=1
	local Owner = OwnerID()
	for i= 1, 3, 1 do
		local random=rand(10) --���
   		if random>2 then  --70%����
			if mode==0 then
				givebodyitem(Owner,  241648, 1)	--�b�ͦs�Ҧ����s��B�����v�O(70%)					
			elseif mode==1 then 
   				givebodyitem(Owner ,  241647, 1)  --�b�p�ɼҦ������s��A���v (70%)
			end
   		else --30%��
			if mode==0 then
				givebodyitem(Owner ,  241647, 1)  --�b�ͦs�Ҧ������s��A���v (30%)
			elseif mode==1 then 
   				givebodyitem(Owner ,  241648, 1) --�b�p�ɼҦ������s��B���v (30%)
			end
   		end
	end
end


function nana_shop()
	SetSpeakDetail( OwnerID() , "HELLO")
 	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	Setshop( OwnerID() , 600559 , "Test_Shop_Close")
end