function Rare3EqExchangeProc( type , eqLv1 , eqLv2 , eqLv3 , eqLv4 , eqLv5 , eqLv6 )
	local Equip = { eqLv1 , eqLv2 , eqLv3 , eqLv4 , eqLv5 , eqLv6 }
	local Rune = {}
	Rune[ "IV" ] = { 520874 , 520894 , 520914 , 520934 , 520954 , 520974 , 520994 , 521014 , 521034 , 521054 , 521074 }	--�Ť�IV
	Rune[ "V" ] = { 520875 , 520895 , 520915 , 520935 , 520955 , 520975 , 520995 , 521015 , 521035 , 521055 , 521075 }	--�Ť�V
	Rune[ "VI" ] = { 520876 , 520896 , 520916 , 520936 , 520956 , 520976 , 520996 , 521016 , 521036 , 521056 , 521076 }	--�Ť�VI
	local RuneBag = {}
	RuneBag[ "IV" ] = 208343 --��ŲŤ�U
	RuneBag[ "V" ] = 208344	--���ŲŤ�U
	RuneBag[ "VI" ] = 208345	--���ŲŤ�U
	
	local Number = 0	--�˳Ƽƶq
	for i = 1 , #Equip  do
		if Equip[ i ] ~= -1 then Number = Number + 1
		end
	end
	
	local RuneLV	--�˳ƹ����Ť嶥��
	if eqLv1 > 30 and eqLv1 <= 50 then RuneLV = "IV"
	elseif eqLv1 > 50 and eqLv1 <= 80 then RuneLV = "V"
	elseif eqLv1 > 80 and eqLv1 <= 100 then RuneLV = "VI"
	else return false
	end
	
	if Number == 6 then	--��J6��˳Ʈ�
		if Check_Bag_Space( OwnerID() , 2  ) == true then
			GiveBodyItem( OwnerID() , Rune[ RuneLV ][ type + 1 ] , 2 )	--�����Ť� * 2
			GiveBodyItem( OwnerID() , RuneBag[ RuneLV ] , 1 )	--�����Ť�U
		else return false
		end	
		
	elseif Number == 5 then	--��J5��˳Ʈ�
		if Check_Bag_Space( OwnerID() , 2  ) == true then
			GiveBodyItem( OwnerID() , Rune[ RuneLV ][ type + 1 ] , 1 )	--�����Ť�
			GiveBodyItem( OwnerID() , RuneBag[ RuneLV ] , 2 )	--�����Ť�U * 2
		else return false
		end	
		
	elseif Number == 4 then	--��J4��˳Ʈ�
		if Check_Bag_Space( OwnerID() , 2  ) == true then
			GiveBodyItem( OwnerID() , Rune[ RuneLV ][ type + 1 ] , 1 )	--�����Ť�
			GiveBodyItem( OwnerID() , RuneBag[ RuneLV ] , 1 )	--�����Ť�U
		else return false
		end	
		
	elseif Number == 3 then	--��J3��˳Ʈ�
		if Check_Bag_Space( OwnerID() , 1  ) == true then
			GiveBodyItem( OwnerID() , Rune[ RuneLV ][ type + 1 ] , 1 )	--�����Ť�
		else return false
		end	
		
	else return false
	end
end