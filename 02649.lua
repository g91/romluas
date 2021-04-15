------------------------------------------------------------------------------
--2012�K�B�` �۷Q���m��
------------------------------------------------------------------------------

--------�ܼƳ]�w��----------------------------------------------------------
KORS_FES_SRain_Global = KORS_FES_SRain_Global or { 	   	--�ܼƸs
			["playCount"] = 0,				--�������Ʋέp
			["Power"] = {					--��q�A���B���B���B�a�C
					[1] ={type ="fire", 	CID = 622332 ,Pow = 622336 ,Pec = 622328, key = 546260,ItemID =241213,Egg = 241217},
					[2] ={type ="wind",	CID = 622333 ,Pow = 622337 ,Pec = 622329, key = 546261,ItemID =241210,Egg = 241214},
					[3] ={type ="water" ,	CID = 622334 ,Pow = 622338 ,Pec = 622330, key = 546262,ItemID =241211,Egg = 241215} ,
					[4] ={type ="earth" ,	CID = 622335 ,Pow = 622339 ,Pec = 622331, key = 546263,ItemID =241212,Egg = 241216}	}}

------------����--------------------------------------------------------------


function lua_kors_SprinRain_2012_Chicken()						--�����W�۱a
local chicken = OwnerID()
local room = ReadRoleValue(chicken,EM_RoleValue_RoomID)
local Global = KORS_FES_SRain_Global[room]
local Power = KORS_FES_SRain_Global["Power"]
local time = 0
local flag = 781126
local N = Rand(3)+1
local flagcount = GetMoveFlagCount(flag) 						--�X�`��
			SetModeEx(chicken,EM_SetModeType_ShowRoleHead, TRUE )
			AddBuff(chicken,Power[N].Pow,1,-1)
--			MoveToFlagEnabled(chicken,FALSE)
	while TRUE do
		if time%240 == 0 then							--�T�w�ɶ�����(2min)
		local R = Rand(flagcount)
			LuaFunc_MoveToFlag(chicken,flag,R,0)
		end

		if time%60 == 0 then
			local R = RandRange(1,4)
			AddBuff(chicken,Power[R].Pow,1,-1)
		end
	
		if time%10 == 0 then							--�߬d�P�򦳨S�����a���ܨ�(10SEC)
		BeginPlot(chicken,"lua_kors_SprinRain_2012_ChickenDo",0)
		end
	time = time +1 
	Sleep(10)
	end
end

function lua_kors_SprinRain_2012_ChickenDo()						--���y
local chicken = OwnerID()
local room = ReadRoleValue(chicken,EM_RoleValue_RoomID)
local Power = KORS_FES_SRain_Global["Power"]
local search = KORS_SetSearch(chicken,120,"player")

	for i = 1,#search do								--�P��120���a�߬d 
		if CheckBuff(search[i],622342) == FALSE  and ReadRoleValue(chicken,EM_RoleValue_Register1) == 0  then						--���H�S�ܨ�
		ScriptMessage(chicken,0,2,"[SC_KORS_SPRIAN_12_08]",c_system)
		WriteRoleValue(chicken,EM_RoleValue_Register1,1)
		BeginPlot(chicken,"lua_kors_SprinRain_2012_Run",0)		--�]���e�d�U��q�H���C
		break
		end			
	end		
end

function lua_kors_SprinRain_2012_Run()						--��¶�]�d�U��q�H���C	
local  chicken = OwnerID()
local room = ReadRoleValue(chicken,EM_RoleValue_RoomID)
local Global = KORS_FES_SRain_Global
local Power = KORS_FES_SRain_Global["Power"]
local flagcount = GetMoveFlagCount(781126) 
local PowerPeace = KORS_CreateObjPosition(120666,chicken,20,"back")
local R = RandRange(1,4)
	WriteRoleValue(PowerPeace,EM_RoleValue_PID,chicken)
	AddBuff(PowerPeace,Power[R].Pec,1,-1)
	SetPlot(PowerPeace,"touch","lua_kors_SprinRain_2012_Touch",55)
	AddToPartition(PowerPeace,room)
	AddBuff(chicken,Power[R].Pow,1,-1)
local rp = RandRange(1,4)
	AddBuff(chicken,Power[rp].Pow,1,-1)
local point = Rand(flagcount)
	LuaFunc_MoveToFlag(chicken,781126,point,20)
	Sleep(50)
	WriteRoleValue(chicken,EM_RoleValue_Register1,0)
end

function lua_kors_SprinRain_2012_Touch()						--�H����Ĳ�I�E��
local player = OwnerID()
local peace = TargetID()
local item = CountBodyItem(player,241209)
local Power = KORS_FES_SRain_Global["Power"]
	if item ~= 0 then
		SetPlot(peace,"touch","",0)
		for i = 1,4 do
			if CheckBuff(peace,Power[i].Pec) == TRUE then
				GiveBodyItem(player,Power[i].ItemID,1)
				DelBodyItem(player,241209,1)
				DelObj(peace)
			end
		end
	else
		CastSpell(peace,player,850132)
	ScriptMessage(player,player,1,"[SC_KORS_SPRIAN_12_18]",c_system)
	end
end



function lua_kors_SprinRain_2012_Peace()						--�H���ͦs�ɶ�1����
local peace = OwnerID()
local time = 0
	while TRUE do
		time = time +1
		if time >= 61 then
			DelObj(peace)
		end
	Sleep(10)
	end
end

function lua_kors_SprinRain_2012_Skill()						--�ޯ�ϥ�
local player = OwnerID()
local chicken = TargetID()
local Power = KORS_FES_SRain_Global["Power"]
local Rnd = Rand(100)


	for i = 1,4 do
		if CheckBuff(player,Power[i].CID) == TRUE and CheckBuff(chicken,Power[i].Pow) == TRUE then
			if Rnd <= 60 then
				local HR = RandRange(1,100)
			GiveBodyItem(player,Power[i].Egg,1)
				if hr> 99 and CountBodyItem(player,530898) ~= 0 then
					GiveBodyItem(player,241218,1)
				end
				IF CountBodyItem(player,203477) ~= 0 then
					GiveBodyItem(player,241218,1)
				end
			CancelBuff(player,Power[i].CID)
			CancelBuff(player,622342)
			SetFlag(player,Power[i].key,1)
			SetFlag(player,546259,1)
			return
			else
			ScriptMessage(player,player,2,"[SC_KORS_SPRIAN_12_10]",c_system)
			return
			end
		end
	end
	CastSpell(chicken,player,850132)
	ScriptMessage(player,player,1,"[SC_KORS_SPRIAN_12_12]",c_system)

end
---------------------------------------------NPC
function lua_kors_SprinRain_2012_buff()
local player =  OwnerID()
local room = ReadRoleValue(player,EM_RoleValue_RoomID)
local Pow= KORS_FES_SRain_Global["Power"]
	for i = 1 ,4 do
		if CountBodyItem(player,Pow[i].Egg) == TRUE then
			return
		end
	end
	SetFlag(player,546264,1)
end





function lua_kors_SprinRain_2012_Npc()						--NPC���K����
local NPC = OwnerID()
	BeginPlot(NPC,"LuaN_miyon_action02",0)
	BeginPlot(NPC,"lua_kors_SprinRain_2012_Central",0)
end

function lua_kors_SprinRain_2012_SAY()
local player = OwnerID()
local NPC = TargetID()
local keyDay = 546264
local setGet = 546258
local EggGet = 546259
	if CheckFlag(player,keyDay) == FALSE and CheckFlag(player,setGet) == FALSE then
		SetSpeakDetail(player,"[SC_KORS_SPRIAN_12_00]")
		AddSpeakOption(player,NPC,"[SC_KORS_SPRIAN_12_01]","lua_kors_SprinRain_2012_GetSet",0)
	elseif  CheckFlag(player,keyDay) == FALSE and CheckFlag(player,setGet) == TRUE then
		SetSpeakDetail(player,"[SC_KORS_SPRIAN_12_17]")
		if CheckFlag(player,EggGet) == TRUE then
		AddSpeakOption(player,NPC,"[SC_KORS_SPRIAN_12_05]","lua_kors_SprinRain_2012_EChang",0)
		end
	elseif CheckFlag(player,keyDay) == TRUE then
		SetSpeakDetail(player,"[SC_KORS_SPRIAN_12_07]")
	end
end	

function lua_kors_SprinRain_2012_GetSet()
local player = OwnerID()
local NPC = TargetID()
	SetSpeakDetail(player,"[SC_KORS_SPRIAN_12_02]")
	AddSpeakOption(player,player,"[SC_KORS_SPRIAN_12_03]","lua_kors_SprinRain_2012_Get",0)
end

function lua_kors_SprinRain_2012_Get()
local player = OwnerID()
	CloseSpeak(player)
	ScriptMessage(player,player,2,"[SC_KORS_SPRIAN_12_04]",c_system)
	GiveBodyItem(player,241209,1)
	SetFlag(player,546258,1)
end


function lua_kors_SprinRain_2012_EChang()
local player = OwnerID()
local NPC = TargetID()
local Power = KORS_FES_SRain_Global["Power"]
local gift = 0
local title = 0
local count = 0
local allcount = 4  -- �Ҧ��s���ʼƶq
local keylist =  {
			546288,	--�Ԥ�ߨ��þ�
			546257,	--�Ԥ�l�r�O
			546264,	--�ڤ۱m��
			546232		--�m�J��~
			}
	SetSpeakDetail(player,"[SC_KORS_SPRIAN_12_06]")
	for i = 1,4 do
		if CountBodyItem(player,Power[i].Egg) ~= 0 then
		DelBodyItem(player,Power[i].Egg,1)
		GiveBodyItem(player,204218,3)
		SetFlag(player,546264,1)
		break
		end
	end
	for j = 1,4 do
		if CheckFlag(player,Power[j].key) ==  TRUE then
			title = title +1
		end
	end	
	if CountBodyItem(player,241218) ~= 0 then
		AddSpeakOption(player,NPC,"[SC_KORS_SPRIAN_12_13]","lua_kors_SprinRain_2012_holyEgg",0)
	end
	if title >=4 and CountBodyItem(player,530898) == 0 then
		AddSpeakOption(player,NPC,"[SC_KORS_SPRIAN_12_14]","lua_kors_SprinRain_2012_Title",0)
	end	
	for i =  1 , table.getn(keylist) do
		if Checkflag(player , keylist[i] )  == true then
			count = count +1
		end
		if i == table.getn(keylist) then
			if count == allcount then -- �p�G��������
			--	Say(OID, "GIVE Buff")
				lua_mika_festivalbuffgive(player, 0 )  -- 2012. 4��K�B�`���� ������0
			end
		end
	end
end

function lua_kors_SprinRain_2012_holyEgg()
local player = OwnerID()
local NPC = TargetID()
local HOLY =CountBodyItem(player,241218)
	SetSpeakDetail(player,"[SC_KORS_SPRIAN_12_15]")
	DelBodyItem(player,241218,HOLY)
	GiveBodyItem(player,530899,1)
	GiveBodyItem(player,204218,3)
end

function lua_kors_SprinRain_2012_Title()
local player = OwnerID()
local NPC = TargetID()
	SetSpeakDetail(player,"[SC_KORS_SPRIAN_12_16]")
	GiveBodyItem(player,530898,1)
	SetFlag(player,546265,1)
end

function lua_kors_SprinRain_2012_SKCK()
local player = OwnerID()
local TAG = TargetID()
	if ReadRoleValue(TAG,EM_RoleValue_OrgID) == 120665 then
		return TRUE
	end
	return FALSE	
end
------------------------------------------------------------------------------------------------------------------FORTEST ���O�s
function lua_kors_SprinRain_2012_ReDo()
local player = OwnerID()
local DEL = {546264,546258,546259,241217,241216,241215,241214,241211,241212,241213,241210,622332,622333,622334,622335,622342,241209}
	return	KORS_DelItemAllEx(DEL)
end