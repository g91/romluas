---------------------------------------------------------------------------
--424131  �Q�d���O��
---------------------------------------------------------------------------
function LuaPG_424131_01() 
	local MIMIR = TargetID() --�ŧiMIMIR��TargetID
	local O_ID = OwnerID() --���a

--SAY(TargetID() ,"00")	

	if CheckAcceptQuest( O_ID, 424131 ) == true and CheckFlag( O_ID , 544947) == false then
		--�_�h�i��ĤG�P�_  ������ �S���X��
		SetSpeakDetail(OwnerID(),"[SC_424131_001]")
		AddSpeakOption( O_ID, MIMIR , "[SC_424131_002]", "LuaPG_424131_02",0) --�ڷǳƦn�F�C
	else
		LoadQuestOption( O_ID )	--�p�G�����o�ӡA��NPC��L���ȱN���|�Q���a�ݨ�
	end
end

function LuaPG_424131_02()
	local MIMIR = TargetID() --MIMIR
	local O_ID = OwnerID() --���a
	if	ReadRoleValue( MIMIR, EM_RoleValue_Register1 ) > 0	then
		SetSpeakDetail( O_ID, "[SC_424131_003]" ) --�еy���ڤ@�U�C
	else
		CloseSpeak( OwnerID() )	--�����Ҧ���ܵ���
		WriteRoleValue( MIMIR, EM_RoleValue_Register1, 1 )	--��NPC�ܦ��L
		CallPlot( MIMIR, "LuaPG_424131_03", O_ID )	--�I�s�U�@�q�禡
	end
end


function LuaPG_424131_03(O_ID)

	local MIMIR = OwnerID()----Ū�������	
	SetFlag(O_ID,544956,1)----���t��flag�A�o�ɬݤ����ª�mimir

			local NEW_MIMIR = DW_CreateObjEX("obj",117969,MIMIR)----�ͦ��t��������

			DW_MoveToFlag( NEW_MIMIR , 780916 ,1,0 ,1)----�����੹�e��(780916)

			PlayMotion(NEW_MIMIR,ruFUSION_ACTORSTATE_CROUCH_LOOP)     ----�������ۤU
			Sleep(10)

	if CheckAcceptQuest( O_ID, 424131 ) == true and CheckFlag( O_ID , 544947) == false then
			ScriptMessage( NEW_MIMIR, O_ID, 1, "[SC_424131_PUT]",  "0xffbf0b2b"  )
			ScriptMessage( NEW_MIMIR, O_ID, 0, "[SC_424131_PUT]",  "0xffbf0b2b"  )  ----scriptm�G�������U�Ť�
	end
			Sleep(10)

			DW_MoveToFlag( NEW_MIMIR , 780916 ,2,0 ,1)----�����ਫ�^���

			FA_FaceFlagEX(NEW_MIMIR, 780916 , 1)----�����ୱ��Ť��m
			Sleep(20)
	
	if CheckAcceptQuest( O_ID, 424131 ) == true and CheckFlag( O_ID , 544947) == false then		
			ScriptMessage( NEW_MIMIR, O_ID, 1, "[SC_424131_SHOW]",  "0xffbf0b2b"  )
			ScriptMessage( NEW_MIMIR, O_ID, 0, "[SC_424131_SHOW]",  "0xffbf0b2b"  )----�ͦ��Ť�Ǫ�:�O�вŤ���{�X�v��
	end

			local scholar=Lua_DW_CreateObj("flag",117943,780916,1)
			FA_FaceFlagEX(scholar, 780916 , 2)----�Ť�Ǫ̭���������m	

			Sleep(15)
			Say(scholar,"[SC_424131_SAY_01]")
			Sleep(30)

			Say(scholar,"[SC_424131_SAY_02]")
			Sleep(25)

			Say(scholar,"[SC_424131_SAY_03]")
			Sleep(25)

			Say(scholar,"[SC_424131_SAY_04]")
			Sleep(10)

	if CheckAcceptQuest( O_ID, 424131 ) == true and CheckFlag( O_ID , 544947) == false then	
			ScriptMessage( NEW_MIMIR, O_ID, 1, "[SC_424131_DISARREAR]",  "0xffbf0b2b" )
			ScriptMessage( NEW_MIMIR, O_ID, 0, "[SC_424131_DISARREAR]",  "0xffbf0b2b" )----scriptm�G�v���@�}�n�̡A�Ť�Ǫ̪����v���������C
	end
		
			DelObj(scholar)
			DelObj(NEW_MIMIR)
			SetFlag(O_ID,544956,0)	

	WriteRoleValue( MIMIR, EM_RoleValue_Register1, 0 )
	CallPlot(MIMIR,"LuaPG_424131_04",O_ID)
end

function LuaPG_424131_04(O_ID)
	if CheckAcceptQuest( O_ID, 424131 ) == true and CheckFlag( O_ID , 544947) == false then
		SetFlag(O_ID,544947,1)
	end
end

---------------------------------------------------------------------------
--424135  �������ǤU�h
---------------------------------------------------------------------------
function LuaS_PG_424135_01()
	if CheckAcceptQuest( OwnerID(), 424135 ) == true and CountBodyItem( OwnerID() , 209415 ) <1  then
		--�_�h�i��ĤG�P�_  ������ �S���X��
		SetSpeakDetail(OwnerID(),"[SC_424135_01]")
		AddSpeakOption( OwnerID(), TargetID() , "[SC_424135_001]", "LuaS_PG_424135_02",0) --�ڷǳƦn�F�C
	else
		LoadQuestOption( OwnerID() )	--�p�G�����o�ӡA��NPC��L���ȱN���|�Q���a�ݨ�
	end

end


function LuaS_PG_424135_02()
		SetSpeakDetail(OwnerID(),"[SC_424135_02]")
		AddSpeakOption( OwnerID(), TargetID() , "[SC_424135_002]", "LuaS_PG_424135_03",0) --�ڷǳƦn�F�C
end

function LuaS_PG_424135_03()
		CloseSpeak(OwnerID())
		GiveBodyitem( OwnerID(), 209415, 1 )
end


---------------------------------------------------------------------------
--424132  ���H���[�I
---------------------------------------------------------------------------
--�ݰ��������i
function LuaS_PG_424132_fake_Tim()
	if CheckAcceptQuest( OwnerID(), 424132 ) == true and CheckCompleteQuest( OwnerID() , 424132) == false  then
		SetSpeakDetail(OwnerID(),"[SC_424132_02]")
	else
		LoadQuestOption( OwnerID() )	--�p�G�����o�ӡA��NPC��L���ȱN���|�Q���a�ݨ�
	end
	BeginPlot(OwnerID(),"LuaS_PG_424132_fake_Tim_01",0)
end

function LuaS_PG_424132_fake_Tim_01()
	SetFlag( OwnerID(),544967,1)
end


--�ݦN���J����
function LuaS_PG_424132_GILL()
	if CheckAcceptQuest( OwnerID(), 424132 ) == true and CheckCompleteQuest( OwnerID() , 424132) == false  then
		SetSpeakDetail(OwnerID(),"[SC_424132_01]")

	elseif
	CheckAcceptQuest( OwnerID(), 424134 ) == true and CheckCompleteQuest( OwnerID() , 424134) == false then
		SetSpeakDetail(OwnerID(),"[SC_424134_01]")
		AddSpeakOption(  OwnerID(), TargetID() , "[SC_424134_001]", "LuaS_PG_424134_GILL_02",0) --�������i�ݭn�����J����i�H

	else
		LoadQuestOption( OwnerID() )	--�p�G�����o�ӡA��NPC��L���ȱN���|�Q���a�ݨ�
	end
	BeginPlot(OwnerID(),"LuaS_PG_424132_GILL_01",0)
end


function LuaS_PG_424132_GILL_01()
	SetFlag( OwnerID(),544968,1)
end


function LuaQ_PG_424132_COMPLETE_01()
	local MIMIR = OwnerID()
	local player = TargetID()
	if	ReadRoleValue(MIMIR , EM_RoleValue_Register1)==0	then
		CallPlot(MIMIR , "LuaQ_PG_424132_COMPLETE_02" , player)
	else
		LoadQuestOption(player)
		SetFlag(player,544978,1)
	end
end

function LuaQ_PG_424132_COMPLETE_02(player)   ----������@���A�]��OwnerID��npc�ATargetID�����a
	local MIMIR = OwnerID()    ----MIMIR

	WriteRoleValue(MIMIR,EM_RoleValue_Register1,999) ----�}�l�t�X���аO
	CloseSpeak(player) ----���O����

	local NEW_MIMIR = DW_CreateObjEX("obj",117971,MIMIR)----���ͦ��z���B424132�t����mimir117971

	Say(NEW_MIMIR,"[SC_424132_04]")  ----�������A�J�M�Ƥp���������n�����{���F......
	Sleep(15)
	ScriptMessage( NEW_MIMIR, player, 1, "[SC_424132_03]",  "0xffbf0b2b" )
	ScriptMessage( NEW_MIMIR, player, 0, "[SC_424132_03]",  "0xffbf0b2b" )----scriptm:�@�}ĵ�i�n�ǤF�L��

	local STAR = Lua_DW_CreateObj("flag",118016,780916,3)----�ͦ�424132�t����STAR��780916��3
	local MECELL = Lua_DW_CreateObj("flag",118019,780916,4)----�ͦ�424132�t�����O�Ю֤ߩ�780916��4
	Sleep(15)
	Say(MECELL,"[SC_424132_05]")   ----ĵ�i�I�o�{�]�ڡI�P�O���M�I�ؼСI
	Sleep(15)
	DW_MoveDirectToFlag(STAR ,780916,5,0 ,1) 
	DW_MoveToFlag(MECELL ,780916,6,0 ,1)    

	Say(NEW_MIMIR,"[SC_424132_06]")   ----��K�K�Ʊ��ܱo����F�C
	Sleep(20)

	DelObj(STAR)
	DelObj(MECELL)
	DelObj(NEW_MIMIR)
	
	SetFlag(player,544978,1)

	WriteRoleValue(MIMIR,EM_RoleValue_Register1,0) 
end


---------------------------------------------------------------------------
--424134  ��T�צX
---------------------------------------------------------------------------
function LuaS_PG_424134_GILL_02()
	SetSpeakDetail(OwnerID(),"[SC_424134_02]")
	AddSpeakOption(  OwnerID(), TargetID() , "[SC_424134_002]", "LuaS_PG_424134_GILL_03",0) --�������i�ݭn�����J����i�H
end

function LuaS_PG_424134_GILL_03()
	CloseSpeak(OwnerID())
	GiveBodyItem(OwnerID() ,209416,1)
end

function LuaPG_REPORT()   -------�ԯ����ȳ��i��
	FA_Border( OwnerID(), "[SC_424134_REPROT]" )
end






---------------------------------------------------------------------------
--424133  �ԩҴ��Ȫ���v
---------------------------------------------------------------------------
function LuaQ_PG_424133_ACCEPT(player)
	
	local MIMIR = ReadRoleValue(Zone14_424133_ContCenter,EM_RoleValue_Register1)		--������
	local GILL = ReadRoleValue(Zone14_424133_ContCenter,EM_RoleValue_Register2)			--�N���J����
	local Star = ReadRoleValue(Zone14_424133_ContCenter,EM_RoleValue_Register3)			--���F�D�k��
	local MECELL = ReadRoleValue(Zone14_424133_ContCenter,EM_RoleValue_Register4)		--�O�Ю֤�
	local FAKE_TIM = ReadRoleValue(Zone14_424133_ContCenter,EM_RoleValue_Register5)		--�������i
	DisableQuest(MIMIR,true)
	DisableQuest(MECELL,true)
	CloseSpeak(player)


	local NEW_MIMIR = DW_CreateObjEX("obj",118021,MIMIR)----�ͦ��t�����z��������
	local NEW_MECELL= DW_CreateObjEX("obj",118023,MECELL)----�ͦ��t�����z���O�Ю֤�
	local NEW_FAKE_TIM= DW_CreateObjEX("obj",118027,FAKE_TIM)----�ͦ��t�����z��������
	local NEW_Star= DW_CreateObjEX("obj",118022,Star)----�ͦ��t�����z�����F
	local NEW_GILL= DW_CreateObjEX("obj",118026,GILL)----�ͦ��t�����z���N��

	Sleep(25)
	Say(NEW_GILL,"[SC_424133_GILL]")
	Sleep(25)
	ScriptMessage( NEW_MIMIR, 0, 1, "[SC_424133_WARN]",  "0xffbf0b2b" )
	ScriptMessage( NEW_MIMIR, 0, 0, "[SC_424133_WARN]",  "0xffbf0b2b" )    ----scriptm:�O�Ю֤߫��۴������i�o�Xĵ�i
	Sleep(15)
	Say(NEW_MECELL,"[SC_424133_MECELL_01]")
	Sleep(20)
	Say(NEW_FAKE_TIM,"[SC_424133_FAKE_01]")
	Sleep(15)
	

	DelObj(NEW_FAKE_TIM)    ----�R���z��������	
	local FAKE_TIM_2= DW_CreateObjEX("obj",117970,FAKE_TIM)    ----�ͦ�������2
	Hide(FAKE_TIM)	 ----hide������


	SetDefIdleMotion(FAKE_TIM_2, ruFUSION_MIME_IDLE_STAND)
	DW_MoveDirectToFlag(FAKE_TIM_2 ,780916,7,0 ,1)    ----������2����780916��7


	local TIM_FIGHT= Lua_DW_CreateObj("flag",105572,780916,8)    ----�ͦ�NPC  TIM��780916��8
	--say(TIM_FIGHT,"00")
	DW_UnFight(TIM_FIGHT,true)----�԰��Ъ�off
	local TIM_CANT_SEE = DW_CreateObjEX("obj",118027,TIM_FIGHT)    ----�ͦ�����TIM

	Say(TIM_CANT_SEE,"[SC_424133_TIM_01]")
	Sleep(20)
	DW_MoveToFlag(TIM_FIGHT ,780916,9,0 ,1)     ----TIM����780916��9
	Sleep(15)


	DelObj(TIM_CANT_SEE)


	Say(NEW_Star,"[SC_424133_SHOCK]")    ----star
	Say(NEW_MIMIR,"[SC_424133_SHOCK]")    ----mimir
	Say(NEW_GILL,"[SC_424133_SHOCK]")    ----GILL
	Sleep(10)


	Say(FAKE_TIM_2,"[SC_424133_FAKE_02]")   ----������2
	local ADU_FIGHT = Lua_DW_CreateObj("flag",105571,780916,7)  ----�ͦ�NPC�ȫץ���
	DW_UnFight(ADU_FIGHT,true)				----�԰��Ъ�off
	DelObj(FAKE_TIM_2) 					 ----�R��������2
	Sleep(20)

	
	local GILL_FIGHT = DW_CreateObjEX("obj",105573,GILL)----�ͦ�NPC�N��
	Hide(GILL)  ----Hide�N��
	
	DW_UnFight(GILL_FIGHT,true)				----�԰��Ъ�off
	DelObj(NEW_GILL)  					----DEL  NPC  �z���N��


	DelObj(NEW_MECELL)					----DEL  NPC  �z���O�Ю֤�
	DelObj(NEW_Star)					----DEL  NPC  �z�����F
	DelObj(NEW_MIMIR)					----DEL  NPC  �z��������


----�i�J�԰��A�԰��Ъ�on
	DW_UnFight(GILL_FIGHT,false)
	DW_UnFight(ADU_FIGHT,false)
	DW_UnFight(TIM_FIGHT,false)
	
	Sleep(20)
	SysCastSpellLv(player,ADU_FIGHT,496266,0)		--�N�O�u�Q�������a
	CallPlot( MIMIR, "LuaQ_PG_424133_ACCEPT_02", player,FAKE_TIM,GILL,Star,MECELL,TIM_FIGHT,ADU_FIGHT,GILL_FIGHT)
end	


function LuaQ_PG_424133_ACCEPT_02(player,FAKE_TIM,GILL,Star,MECELL,TIM_FIGHT,ADU_FIGHT,GILL_FIGHT)
	local MIMIR = OwnerID()
	local Num=0

	local playingmode="here"
	local ADU="NotDead"
	local ADUID="true"
	local quest="in"
	local TIME="SHORT"

	local IfBreak=false				--�ΨӧP�_���X�C��P�_�ɡA�O�_����j��
	while 1 do
		for i=1,3,1 do																									--���F�����򥻧P�_���W�v�A�N�C��P�_�������W�ߥX��
                                                                            						
			if	ReadRoleValue(player , EM_RoleValue_IsDead)==1 	or    													--�P�_��2�G���a���`
				CheckID(player) == false	or                                                   						
				GetDistance( ADU_FIGHT, player) >500 	then                                     						
				playingmode="Nothere"  
				IfBreak=true                                                        						
				break	                                                                         						
			end                                                                                  						
			if 	ReadRoleValue(Zone14_424133_ContCenter,EM_RoleValue_Register6)==7766	 then								--�P�_��3�G�@���Ǧ�q
				ADU="IsDead"
				IfBreak=true
				break
			end
			if	ReadRoleValue(ADU_FIGHT,EM_RoleValue_HP)/ReadRoleValue(ADU_FIGHT,EM_RoleValue_MaxHP)<0.5	then
				for i=0,HateListCount(ADU_FIGHT),1 do																	--��for�j��v���ˬd�ȫץ����������
					local Temp = HateListInfo(ADU_FIGHT,i, EM_HateListInfoType_GItemID)									--�קK���ƩI�s�A�N���b�ˬd��id�O�i�y�Ȧs�ܼơz
					if	ReadRoleValue(Temp,EM_RoleValue_IsPlayer)==1	then											--�T�w���������H�O���a
						if	CheckAcceptQuest(Temp,424133)== true			and											--�P�_�O�_�������ȡH
							CheckFlag(Temp,544977)==false					then										--�������o�X�СH
							IfOrdinaryOver=true																			--���H���o�����X�СA���X�t��
							SetFlag(Temp, 544977, 1 )																	--���q�L�ˬd�A�h�����ȧ����X�� 
						end
					end
				end
				ADU="IsDead"
				IfBreak=true
				break
			end
			if	CheckID(ADU_FIGHT)== false  then																		--�P�_��4�G�P�_�L�k���ȫץ���
				ADU="false"
				IfBreak=true
				break
			end
			sleep(10)                                                                            						
		end                                                                                      						
		                                                                                         						
		if	IfBreak==true	then																						--�ΨӧP�_���X�C��P�_�ɡA�O�_����j��
			break
		end
		local NearPlayers = DW_SearchPlayerHaveQuest(ADU_FIGHT,270,424133)
		IfBreak = true									--���w�]���|���X�����A
		for index,value in pairs(NearPlayers) do
			IfBreak = false								--�u�n�٦����a�b�N��^�~��P�_�����A
			break										--�`�ٮɶ�
		end
		if	IfBreak==true	then																						--�ΨӧP�_���X�C��P�_�ɡA�O�_����j��
			playingmode="Nothere"						--�S�����a�b
			break
		end
		Num=Num+1
	end
DeBugMSG(0,0,"1111111")

	if playingmode=="Nothere" or TIME=="TOOLONG" then
DeBugMSG(0,0,"playingmode==Nothere or TIME==TOOLONG")
		SetStopAttack(ADU_FIGHT)
		Sleep(30)
		Delobj(ADU_FIGHT)
		CallPlot(MIMIR,"LuaQ_PG_424133_ACCEPT_03",player,FAKE_TIM,GILL,Star,MECELL,TIM_FIGHT,ADU_FIGHT,GILL_FIGHT)			----�D���`�԰����}
	end
	if	ADU=="IsDead"  then
DeBugMSG(0,0,"ADU==IsDead")
		CallPlot(MIMIR,"LuaQ_PG_424133_ACCEPT_04",player,FAKE_TIM,GILL,Star,MECELL,TIM_FIGHT,ADU_FIGHT,GILL_FIGHT)		--������k��
	end
	if	ADUID=="false"	then
DeBugMSG(0,0,"false")
	end
end




function LuaQ_PG_424133_ACCEPT_03(player,FAKE_TIM,GILL,Star,MECELL,TIM_FIGHT,ADU_FIGHT,GILL_FIGHT)
DeBugMSG(0,0,"2222222")
----�D���`�԰����}
	local MIMIR = OwnerID()

	local NeedDelTwoNPC = {TIM_FIGHT,GILL_FIGHT}		--�԰��Ϊ��Ⱖ
	for index,value in pairs(NeedDelTwoNPC) do
		DelObj(value)
	end

	local HideTwoNPC = {FAKE_TIM,GILL}					--�������B�N��
	for index,value in pairs(HideTwoNPC) do
		Show(value,0)
	end
	
	WriteRoleValue(Zone14_424133_ContCenter,EM_RoleValue_Register6,0)
	DisableQuest(MIMIR,false)
	DisableQuest(MECELL,false)

end



function LuaQ_PG_424133_ACCEPT_04(player,FAKE_TIM,GILL,Star,MECELL,TIM_FIGHT,ADU_FIGHT,GILL_FIGHT)
DeBugMSG(0,0,"3333333")
----���`��Ĺ�԰���X�{���@��
	local MIMIR = OwnerID()

	local FightThreeNPC = {GILL_FIGHT,ADU_FIGHT,TIM_FIGHT}		--�ȫץ����B�N��....�B�Ƥp����
	for index,value in pairs(FightThreeNPC) do
		DW_UnFight(value,true)		--�԰�����
		SetStopAttack(value)		--�������
	end
	SysCastSpellLv( ADU_FIGHT, ADU_FIGHT , 490592 ,0 )----ADU��X����
	CastSpell(ADU_FIGHT,ADU_FIGHT,490592)
	Sleep(20)
	local AcceptQuestPlayers = DW_SearchPlayerHaveQuest(ADU_FIGHT,200,424133)
	for index,value in pairs(AcceptQuestPlayers) do
		ScriptMessage( ADU_FIGHT, value, 1, "[SC_424133_RUN]",  "0xffbf0b2b" )
		ScriptMessage( ADU_FIGHT, value, 0, "[SC_424133_RUN]",  "0xffbf0b2b" )    ----scriptm:������y���V�îɡA�ȫץ����X���k��	
	end
	DelObj(ADU_FIGHT)----ADU_FIGHT����
	Sleep(25)
	CallPlot(MIMIR,"LuaQ_PG_424133_ACCEPT_05",player,FAKE_TIM,GILL,Star,MECELL,TIM_FIGHT,ADU_FIGHT,GILL_FIGHT)
end


function LuaQ_PG_424133_ACCEPT_05(player,FAKE_TIM,GILL,Star,MECELL,TIM_FIGHT,ADU_FIGHT,GILL_FIGHT)
----���`��Ĺ�԰��᪺�����ݩ�
DeBugMSG(0,0,"4444444")
	local MIMIR = OwnerID()

	local NeedDelTwoNPC = {TIM_FIGHT,GILL_FIGHT}		--�԰��Ϊ��Ⱖ
	for index,value in pairs(NeedDelTwoNPC) do
		DelObj(value)
	end

	local HideTwoNPC = {FAKE_TIM,GILL}					--�������B�N��
	for index,value in pairs(HideTwoNPC) do
		Show(value,0)
	end
	
	local AcceptQuestPlayers = DW_SearchPlayerHaveQuest(MIMIR,200,424133)
	for index,value in pairs(AcceptQuestPlayers) do
		if	CheckFlag(value,544977)==true	then			--�����ȥB�w����
			SetFlag(value,544975,1)							--�~�|�ݨ�u�D����(�Ƥp����)
		end
	end
	WriteRoleValue(Zone14_424133_ContCenter,EM_RoleValue_Register6,0)
	DisableQuest(MIMIR,false)
	DisableQuest(MECELL,false)

end


function LuaQ_PG_424133_complete()
	SetFlag(TargetID(),544975,1)
end


function LuaPG_105571_01()
	SetPlot(OwnerID(),"dead","LuaPG_105571_02",0)
end

function LuaPG_105571_02()
	local Obj = OwnerID()
	WriteRoleValue(Obj,EM_RoleValue_HP,ReadRoleValue(Obj,EM_RoleValue_MaxHP))
	WriteRoleValue(Zone14_424133_ContCenter,EM_RoleValue_Register6,7766)
	for i=0,HateListCount(Obj),1 do																			--��for�j��v���ˬd�ȫץ����������
		local Temp = HateListInfo(Obj,i, EM_HateListInfoType_GItemID)											--�קK���ƩI�s�A�N���b�ˬd��id�O�i�y�Ȧs�ܼơz
		if	ReadRoleValue(Temp,EM_RoleValue_IsPlayer)==1	then													--�T�w���������H�O���a
			if	CheckAcceptQuest(Temp,424133)== true			and													--�P�_�O�_�������ȡH
				CheckFlag(Temp,544977)==false					then												--�������o�X�СH
				IfOrdinaryOver=true																					--���H���o�����X�СA���X�t��
				SetFlag(Temp, 544977, 1 )																			--���q�L�ˬd�A�h�����ȧ����X�� 
			end
		end
	end
	return false
end

function LuaS_424133_AccecptPlot()
	local Obj = TargetID()
	--------------------------
	--�������إ߰�(����@���o�i)
	--------------------------
	if	Zone14_424133_ContCenter == nil	then					--�u�إߤ@��������
		Zone14_424133_ContCenter=DW_CreateObjEX("obj",110987,Obj)--�إX��������N���i�൥��nil
		local TempGlobal = Zone14_424133_ContCenter
		SetModeEx(TempGlobal,EM_SetModeType_Mark,false) 				--�����аO
		SetModeEx(TempGlobal,EM_SetModeType_Show,false) 				--�����
		SetModeEx(TempGlobal,EM_SetModeType_ShowRoleHead,false) 		--���q���
		local SureSaver = {}
		SureSaver[1] = LuaFunc_SearchNPCbyOrgID( Obj , 117972 , 300 )		--������
		SureSaver[2] = LuaFunc_SearchNPCbyOrgID( Obj , 117944 , 300 ) 		--�N���J����
		SureSaver[3] = LuaFunc_SearchNPCbyOrgID( Obj , 118017 , 300 )		--���F�D�k��
		SureSaver[4] = Obj													--�O�Ю֤�
		SureSaver[5] = LuaFunc_SearchNPCbyOrgID( Obj , 117973 , 300 )		--�������i
		----------------------------
		--�N�T�w�Z���O�JZone14_424133_ContCenter���Ȧs��  register
		----------------------------
		
		for i=1,5,1 do			--�@5�H
			WriteRoleValue(TempGlobal,(EM_RoleValue_Register-1)+i,SureSaver[i])
		end
		
		----------------------------
		--���u;�q��;�u�nŪZone14_424133_ContCenter���Ȧs�ȴN�i�H��X�T�w�Z��
		----------------------------
	end
end

function LuaS_424133_TalkPlot()
	local Obj = OwnerID()
	LuaS_424133_AccecptPlot()
	LoadQuestOption(Obj)
	if	CheckAcceptQuest(Obj,424133)==true	and
		CheckFlag(Obj,544977)==false		then
		AddSpeakOption(Obj,Obj,"[SC_424133_SPEAKOPTION]","LuaS_424133_TalkPlot_1", 0 )
	end
end

function LuaS_424133_TalkPlot_1()
	local player = OwnerID()				--���a
	local Target = TargetID()			--�O�Ю֤�
	CallPlot(Target,"LuaQ_PG_424133_ACCEPT",player)
end