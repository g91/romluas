function LuaI_209536() -- �w�� �Ȧ�§�]��
	
	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 208571 , 1 , 203592 , 1  } }
	-- 30�ѧֻL���r�s���M�B30�Ѥp���r���ľ�
	return BaseTressureProc(   itemset , 2 )
end


function LuaI_240900() -- Christmas-New Year Package
	
	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 203568 , 1 , 207735 , 1 , 206129 , 1 , 201609 , 1 , 201617 , 1 , 206410 , 1 , 201087 , 1 , 202903 , 2 , 202435 , 2 , 222925 , 1 , 207765 ,1 , 207762 , 1 , 203861 , 2 , 203859 , 2 , 200085 , 2 , 206271 , 1 , 209535 , 1   } }
	-- Royal Reindeer Mount in a bag (30 Days)�BGreywolf�BLuxurious Two-Story Wooden House with Basement Contract�BPowerful Experience Potion�BExpert Skill Potion�BNice Surprise Orb�BBasic Weapon Driller�BTransport Rune�BHome-sweet-home�BBasic Experience Charm�BAdvanced Moon Jewel - Revelation�BMoon Jewel - Revelation�BCheese Cake�BWine�BRoasted Salty Fish�BVegetable Salad�BBigos
	return BaseTressureProc(   itemset , 17 )
end

function LuaI_240899() -- German Little Death Bundle
	
	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 208537 , 1 , 203091 , 10 , 204460 , 1 , 203525 , 1 , 201139 , 1 , 201141 , 1 }}
	-- little death bundle: loyal little death pet egg x1, transformation potion - little death x10, black sail treasure chest x1, God's redemption ticket x 1, Big Angel's Sigh x1 , Phoenix's Redemption x 1
	return BaseTressureProc(   itemset , 15 )
end


Function LuaI_209537(Option) --�W�Ū��� �ٸ�
--OwnerID = Player	
	if ( Option == "CHECK" ) then
		if ( CountBodyItem( OwnerID(), 530861 )) ==1 then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_0908SEANSON_34]", 0 ) --���� �w�g�֦����ٸ�
		return false
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( OwnerID() , 530861 , 1 )
	end
end

----------------------SCORE 4 MORE---------------------------
function LuaI_241067() -- Aerial Garments of the Fire Demo
	
	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 230170 , 1 ,230171 , 1 , 230172 , 1 , 230173 , 1 , 230174 , 1 , 230175 , 1 , 230176 , 1 , 230163 , 1 } }
			
	return BaseTressureProc(   itemset , 8 )
end

function LuaI_241068() -- Aerial Garments of the Fire Demo
	
	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 230177 , 1 ,230178 , 1 , 230179 , 1 , 230180 , 1 , 230181 , 1 , 230182 , 1 , 230183 , 1 , 230163 , 1 } }
			
	return BaseTressureProc(   itemset , 8 )
end

function LuaI_241069() -- Garments of the Fire Demon
	
	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 230170 , 1 ,230171 , 1 , 230172 , 1 , 230173 , 1 , 230174 , 1 , 230175 , 1 , 230176 , 1 } }
			
	return BaseTressureProc(   itemset , 7 )
end

function LuaI_241070() -- Garments of the Fire Demon
	
	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 230177 , 1 ,230178 , 1 , 230179 , 1 , 230180 , 1 , 230181 , 1 , 230182 , 1 , 230183 , 1 } }
			
	return BaseTressureProc(   itemset , 7 )
end

function LuaI_241071() -- Conflicting Garments of the Fire Demon
local player =OwnerID()
local sex = ReadRoleValue(player,EM_RoleValue_SEX)
	if  sex == 0 then
	
	local RoleName = GetName( player ) 
	local itemset = { 100 , "" , { 230170 , 1 ,230171 , 1 , 230172 , 1 , 230173 , 1 , 230174 , 1 , 230175 , 1 , 230176 , 1 , 230163 , 1 } }
			
	return BaseTressureProc(   itemset , 8 )

	elseif sex ==1 then

	local RoleName = GetName( player ) 
	local itemset = { 100 , "" , { 230177 , 1 ,230178 , 1 , 230179 , 1 , 230180 , 1 , 230181 , 1 , 230182 , 1 , 230183 , 1 , 230163 , 1 } }
			
	return BaseTressureProc(   itemset , 8 )
	end
end

-- 4.0.8 2012.01.31 �s�@ �ЫΨt�θ��v§�] (��2012.02.29 �ק鷺�e���~)
function LuaI_241185() -- Silver Package
	
	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 207801 , 6 , 207802 , 6 , 207800 , 6 , 201381 , 1 , 222925 , 1 , 222926 , 1  } }
			
	return BaseTressureProc(   itemset , 6 )
end


function LuaI_241186() -- Gold Package
	
	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 207801 , 6 , 207802 , 6 , 207800 , 6 , 201386 , 1 , 222927 , 1 , 222928 , 1  } }
			
	return BaseTressureProc(   itemset , 6 )
end


function LuaI_241187() -- Platin Package
	
	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 207801 , 6 , 207802 , 6 , 207800 , 6  , 201385 , 1 , 225216 , 1 , 225217 , 1  } }
			
	return BaseTressureProc(   itemset , 6 )
end


--4.0.9 2012.03.29 �s�WPV��§�]
function LuaI_241388() -- Package of Revelation
	
	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 201014 , 1 , 203060 , 1 , 207763 , 10  , 207766 , 1 , 201618 , 1 , 201294 , 1  } }
			
	return BaseTressureProc(   itemset , 6 )
end

-- 4.0.11 2012.05.09  �s�W§�]
function LuaI_209479()
	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 240188 , 1 ,  207575, 1, 207576, 1 } }
			
	return BaseTressureProc(   itemset , 3 )
end


-- 5.0.0  2012.05.15  �s�W§�]
function LuaI_241625()
	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , {241320, 1, 241219, 1, 202320, 1,  202264, 1, 208652, 1, 201307, 1, 205547, 1, 201139, 1, 207788, 1,  207787, 1 } }
			
	return BaseTressureProc(   itemset , 10 )
end


function LuaI_241628() -- �i���v����§�] 2012/06/01

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 207771 , 5 , 207772 , 5 , 207773 , 5 , 201088 , 1 , 201238 , 1 , 203054 , 1 , 202506 , 10 } }
	-- �H���Z���� 5�ӡB�H���˳ƥ� 5�ӡB�H�������� 5�ӡB�i���Z�����վ�*1�B�i�����㥴�վ�*1�B�i���������վ�*1�B�����ײz��*10�C
	return BaseTressureProc(   itemset , 7 )
end

function LuaI_241629() -- ���i������§�] 2012/06/01

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 202822 , 5 , 202823 , 5 ,  207771 , 5 , 207772 , 5 , 207773 , 5, 202506 , 5 } }
	-- �˳ƫʦL�� 5�ӡB�˳Ƹѫʾ� 5�ӡB�H���Z���� 5�ӡB�H���˳ƥ� 5�ӡB�H�������� 5�ӡB�����ײz�� 5�ӡC
	return BaseTressureProc(   itemset , 6 )
end
-- 5.0.1
function LuaI_241695() -- Spinel Chimera Mount Package 2012/07/10

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 240036 , 1 , 203591 , 1 , 203574  , 1 , 201618 , 1 } }
	-- 7�Ѿ����l���~���M 1�ӡB7�Ѥp���r���ľ�  1�ӡB���Ÿg���ľ� 1�ӡB�j�v�ޯ��ľ� 1�ӡC
	return BaseTressureProc( itemset , 4 )
end