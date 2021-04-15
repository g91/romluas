--------------------------------------------------------------------------------------------------------------------------
-- �شӥ|��npc (6.0.4)  [�}�� �s���֮�, �ؤl, ���Ŷ}��81-100 ]
-- �|���ĤG���q �}��91�� �֮�, �ؤl, ��@���~  (�PZ30�@�P�}��)
-- �|���ĤT���q �}��97�� �֮�, �ؤl  (�PZ33�@�P�}��)

function luaN_plantnpc_level4_0() -- �|��NPC��l���
	local Player = OwnerID()
	local Lv = ReadRoleValue( Player , EM_RoleValue_Skill_Plant )   --���a�ثe�شӵ���
	local Key = CheckFlag( Player , 543535 )  -- �ˬd�O�_�w���ش�-�ǩ_���(���ŤW��100)
	local shopkey = CheckFlag(Player, 543610)  -- �ˬd�O�_��KEY - �}��شӧI���ө�

--	local PlantShop = 600353 	-- 6.0.4 �}�� - 85�� �֮�, �ؤl   ==================  600353	
	local PlantShop = 600354	 --Z30 - 91�� �֮�, �ؤl, ��@���~ 
--	local PlantShop =  600355 	-- Z33 -  97�� �֮�, �ؤl


	CloseShop( TargetID() )
	AdjustFaceDir( TargetID() , Player , 0 )

	if Key == true then	-- �w���o�شӶǩ_
		SetSpeakDetail( OwnerID() , "[SC_PLANT_LV4_4]" )  -- �A�n�A�ڪ��B�͡A���ѷQ�ح��ǴӪ��ڡH
		AddSpeakOption( OwnerID() , TargetID() , "[SC_PLANT_04]", "Planting_Shops_Settings("..PlantShop..")", 0 ) --�ʶR�ؤl
		if shopkey == true then
			AddSpeakOption( OwnerID() , TargetID() , "[SC_PLANT_LV4_7]", "luaN_plantnpc_level4_2", 0 ) --�ڭn�I�����~
		end
	else	-- �����o�شӶǩ_
		if Lv == 80 then
			SetSpeakDetail( OwnerID() , "[SC_PLANT_LV4_2]" )  -- �F80�Ź��
			AddSpeakOption( OwnerID() , TargetID() , "[SC_MARRY_15]", "luaN_plantnpc_level4_1", 0 ) -- �O���A���@�N�C
		else
			SetSpeakDetail( OwnerID() , "[SC_PLANT_LV4_1]" )  -- ���F�ش�80�Ů�
		end
		AddSpeakOption( OwnerID() , TargetID() , "[SC_PLANT_04]", "Planting_Shops_Settings("..PlantShop..")", 0 ) --�ʶR�ؤl
	end
end

-- �|��npc ���o���
function luaN_plantnpc_level4_1() 
	CloseSpeak( OwnerID())
	AdjustFaceDir( TargetID() , OwnerID() , 0 )

	Setflag(OwnerID() , 543535 , 1 )  --���� �ش�-�ǩ_���
	Setflag(OwnerID() , 543610 , 1 )  --����	�}��شӧI���ө�
	CastSpell( OwnerID() , OwnerID() , 491010 )
	PlayMotion( TargetID() , 102 )
	sleep(5)
	ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_PLANT_LV4_5]", C_SYSTEM ) --�A�w���o�شӶǩ_���C
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_PLANT_LV4_6]", C_SYSTEM ) --�T�������T���G�A�w���o�شӶǩ_���A�شӵ��ŤW�����ɬ�100�šC
	Tell(OwnerID(), TargetID(), "[SC_PLANT_LV4_3]")   -- ( ���ܪ�, �o�ܪ�)  npc�缾�a������
end

function luaN_plantnpc_level4_2()
	SetSpeakDetail( OwnerID() , "[SC_PLANT_LV4_8]" )  --  �I�����
	AddSpeakOption( OwnerID() , TargetID() , "[SC_PLANT_LV4_9]", "luaN_plantnpc_level4_3(1)", 0 ) --�ڭn�H[205084]�I���]�k��@�ľ��]
	AddSpeakOption( OwnerID() , TargetID() , "[SC_PLANT_LV4_10]", "luaN_plantnpc_level4_3(2)", 0 ) --�ڭn�H[205085]�I���]�k��@�ľ��]
	AddSpeakOption( OwnerID() , TargetID() , "[SC_PLANT_LV4_11]", "luaN_plantnpc_level4_3(3)", 0 ) --�ڭn�H[205086]�I���]�k��@�ľ��]
	AddSpeakOption( OwnerID() , TargetID() , "[SC_PLANT_LV4_12]", "luaN_plantnpc_level4_4", 0 ) -- �ڭn�I����N�٦��d���c
	AddSpeakOption( OwnerID() , TargetID() , "[SC_PLANT_LV4_13]", "luaN_plantnpc_level4_5", 0 ) --�ڭn�I�����ֺ��լ֮�c 
end

-- �ڭn�H[xxx]�I���]�k��@�ľ��]
function luaN_plantnpc_level4_3(number)
	local needitem ={205084, 205085, 205086}
	local itemcount = CountBodyItem(OwnerID(), needitem[number] )
	local needcount = 10

--	say(OwnerID(), "Needitemid ="..needitem[number].." , number = "..number)
	if itemcount <= needcount then 
		SetSpeakDetail( OwnerID() , "[SC_112502_NO]" )  -- �A���������~�ƶq������I
	else
		CloseSpeak(OwnerID())
		DelBodyItem(OwnerID(), needitem[number], needcount )
		GiveBodyItem(OwnerID(), 243036, 1)  -- �]�k��@�ľ��]
	end
end

-- �ڭn�I����N�٦��d���c
function luaN_plantnpc_level4_4()
	local needitem ={205084, 205085, 205086}
	local itemcount1 = CountBodyItem(OwnerID(), needitem[1] )
	local itemcount2 = CountBodyItem(OwnerID(), needitem[2] )
	local itemcount3 = CountBodyItem(OwnerID(), needitem[3] )
	local needcount = 5

--	say(OwnerID(), "itemcount 1 ="..itemcount1.." , itemcount 2 = "..itemcount2..", itemcount 3 = "..itemcount3 )
	if itemcount1 <= needcount or itemcount2 <= needcount or itemcount3 <= needcount then 
		SetSpeakDetail( OwnerID() , "[SC_112502_NO]" )  -- �A���������~�ƶq������I
	else
		CloseSpeak(OwnerID())
		DelBodyItem(OwnerID(), needitem[1], needcount )
		DelBodyItem(OwnerID(), needitem[2], needcount )
		DelBodyItem(OwnerID(), needitem[3], needcount )
		GiveBodyItem(OwnerID(), 243038, 1)  -- ��N�٦��d���c
	end
end

-- �ڭn�I�����ֺ��լ֮�c
function luaN_plantnpc_level4_5()
	local needitem ={205084, 205085, 205086}
	local itemcount1 = CountBodyItem(OwnerID(), needitem[1] )
	local itemcount2 = CountBodyItem(OwnerID(), needitem[2] )
	local itemcount3 = CountBodyItem(OwnerID(), needitem[3] )
	local needcount = 10

--	say(OwnerID(), "itemcount 1 ="..itemcount1.." , itemcount 2 = "..itemcount2..", itemcount 3 = "..itemcount3 )
	if itemcount1 <= needcount or itemcount2 <= needcount or itemcount3 <= needcount then 
		SetSpeakDetail( OwnerID() , "[SC_112502_NO]" )  -- �A���������~�ƶq������I
	else
		CloseSpeak(OwnerID())
		DelBodyItem(OwnerID(), needitem[1], needcount )
		DelBodyItem(OwnerID(), needitem[2], needcount )
		DelBodyItem(OwnerID(), needitem[3], needcount )
		GiveBodyItem(OwnerID(), 243037, 1)  -- ���ֺ��լ֮�c
	end
end
					
--------- �I�����~���e ------

-- �]�k��@�ľ��] 243036
function LuaI_243036()
	local itemset  = {  4 ,"" , { 203881 , 1 },	
			  14, ""	, { 203884 , 1 },
			  20 ,""	, { 243017 , 1 },
			  25 ,""	, { 203881 , 2 },
			  32 ,""	, { 203884 , 2 },
			  35 ,""	, { 243017 , 2 },
			  36 ,""	, { 203881 , 3 },
			  39 ,""	, { 203884 , 3 },
			  40 ,""	, { 243017 , 3 },
			  55 ,""	, { 208623 , 15 },
			  70 ,""	, { 208622 , 15 },
			  80 ,""	, { 208623 , 20 },
			  90 ,""	, { 208622 , 20 },
			  95 ,""	, { 208623 , 30 },
			  100 ,"", { 208622 , 30 },
			}

	return BaseTressureProc(   itemset , 1  )
end						

-- ���ֺ��լ֮�c 243037
function LuaI_243037()
	local itemset  = {  14 ,"" , { 203901 , 1 },	
			  28 ,""	, { 204241 , 1 },
			  42 ,""	, { 204244 , 1 },
			  56 ,""	, { 203903 , 1 },
			  70 ,""	, { 204245 , 1 },
			  84 ,""	, { 203907 , 1 },
			  88 ,""	, { 203910 , 1 },
			  92 ,""	, { 204257 , 1 },
			  96 ,""	, { 203893 , 1 },
			  100 ,"" , { 206181 , 1 }	
			}

	return BaseTressureProc(   itemset , 1  )
end

-- ��N�٦��d���c 243038
function LuaI_243038()
	local itemset  = {  8 ,"" , { 243034 , 1 },	
			  16 ,""	, { 243035 , 1 },
			  40 ,""	, { 203210 , 1 },
			  64 ,""	, { 203211 , 1 },
			  82 ,""	, { 243032 , 1 },
			  100 ,"", { 243033 , 1 }
			}

	return BaseTressureProc(   itemset , 1  )
end

-- ���ի��O

-- ��o1~80�� �شӭ��n���~
function mika_PlantSkill_test1()
	local key = {542886, 542887, 542888, 542889 }
	for i = 1, #key do 
		Setflag(OwnerID(), key[i], 1)
	end
	say(OwnerID(), "1 -80 keyget ok ")
end

-- ��o1~100�� �شӭ��n���~ & �ө��}����
function mika_PlantSkill_test2()
	local key = {542886, 542887, 542888, 542889, 543535 , 543610}
	for i = 1, #key do 
		Setflag(OwnerID(), key[i], 1)
	end
	say(OwnerID(), "1 -100 keyget ok ")
end

-- �M�� 1~100�� �شӭ��n���~ & �ө��}����
function mika_PlantSkill_test3()
	local key = {542886, 542887, 542888, 542889, 543535 , 543610}
	for i = 1, #key do 
		Setflag(OwnerID(), key[i], 0)
	end
	say(OwnerID(), "delete ok")
end