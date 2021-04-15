--OwnerID_EM_RoleValue_Register0~4  �D�إ�
--OwnerID_EM_RoleValue_Register6  ����
--OwnerID_EM_RoleValue_Register7 ���Ƨ_
--OwnerID_EM_RoleValue_Register+8 �P�_�����l
--OwnerID_EM_RoleValue_Register+9 =0�i�I�k�A1����I�k
--EM_RoleValue_OrgID



function lua_dancefes_suki_makenpc()
DW_CancelTypeBuff( 68,  OwnerID() )
	if Lua_Mounts_Copilot( OwnerID() ) == TRUE then
		SetSpeakDetail( OwnerID(), GetString("SC_DANCEFES_SUKI_MAKE01") ) 
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_112311_011") , " LuaN_112311_1", 0 ) --�Ѩ�
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_DANCEFES_SUKI_MAKE02") , "lua_dancefes_suki_makerule", 0 ) --�W�h
--		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_DANCEFES_SUKI_MAKE24") , " lua_dancefes_2011change", 0 ) --�I��
		--AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_DANCEFES2011_02") , " lua_dancefes_changegame", 0 ) --���m��I��
		if CheckFlag(OwnerID(), 544853) == FALSE and CheckFlag(OwnerID(), 544851 )== FALSE  then--�C��+�Ѩ���
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_DANCEFES_SUKI_MAKE03") , "lua_dancefes_suki_makestart", 0 ) --Start
		elseif CheckFlag (OwnerID(), 544852 ) ==TRUE then
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_DANCEFES_SUKI_MAKE20") , "lua_dancefes_suki_makeend", 0 ) --���
		end
	else
			ScriptMessage(OwnerID(),OwnerID(),1,"[SC_DANCEFES_KORS_ARR_13]",C_SYSTEM)
	end
end

function lua_dancefes_suki_makerule()
	SetSpeakDetail( OwnerID(), GetString("SC_DANCEFES_SUKI_MAKE16") ) 
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_DANCEFES_SUKI_MAKE05") , "lua_dancefes_suki_makenpc", 0 ) --back
end

function lua_dancefes_suki_makeend()
	local score = ReadRoleValue (OwnerID(), EM_RoleValue_Register+6)
	if score ==0 then
		SetSpeakDetail( OwnerID(), GetString("SC_DANCEFES_SUKI_MAKE08") ) 
		SetFlag(OwnerID(), 544852, 0)
	else
		if EmptyPacketCount( OwnerID() ) >=1 and QueuePacketCount( OwnerID() ) == 0 then
			if score ==40 and EmptyPacketCount( OwnerID() ) >=2 and QueuePacketCount( OwnerID() ) == 0 then
				SetSpeakDetail( OwnerID(), GetString("SC_DANCEFES_SUKI_MAKE21") ) 
				GiveBodyItem(OwnerID(), 209270, 5)
				GiveBodyItem(OwnerID(), 203862, 1) --�����
				SetFlag(OwnerID(), 544852, 0)
			else
				SetSpeakDetail( OwnerID(), GetString("SC_111490_DIALOG10")   )--�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
			end
			if score ==20 or score ==30 then
				SetSpeakDetail( OwnerID(), GetString("SC_DANCEFES_SUKI_MAKE22") ) 
				GiveBodyItem(OwnerID(), 209270, 3)
				SetFlag(OwnerID(), 544852, 0)
			elseif score ==10 then
				SetSpeakDetail( OwnerID(), GetString("SC_DANCEFES_SUKI_MAKE23") ) 
				GiveBodyItem(OwnerID(), 209270, 1)
				SetFlag(OwnerID(), 544852, 0)
			end
		else
			SetSpeakDetail( OwnerID(), GetString("SC_111490_DIALOG10")   )--�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
		end
	end
end

function lua_dancefes_suki_makestart() --���ޯ�B�p���O�B�p�ɾ��K
	CloseSpeak( OwnerID() )
	SetFlag(OwnerID(), 544851 , 1)
	ScriptMessage(OwnerID(),OwnerID(),0,"[SC_KORS_DANCEFES_CL]",C_SYSTEM)	
	ScriptMessage(OwnerID(), OwnerID(), 0, GetString("SC_DANCEFES_SUKI_MAKE03"),  C_SYSTEM )
	ScriptMessage(OwnerID(), OwnerID(), 1, GetString("SC_DANCEFES_SUKI_MAKE03"),  C_SYSTEM )
	AddBuff(OwnerID(), 509322 , 0 , -1) 
	AddBuff(OwnerID(), 509232 , 0 , -1) --blue
	AddBuff(OwnerID(), 509233 , 0 , -1) --red
	AddBuff(OwnerID(), 509234 , 0 , -1) --green
	AddBuff(OwnerID(), 509235 , 0 , -1) --pruple

	BeginPlot(OwnerID(), "lua_dancefes_suki_makequestion", 0)
--------------------------------------------------------------------
	local i=ReadRoleValue(OwnerID(), EM_RoleValue_Register+6)
	SetSmallGameMenuType(  OwnerID() , 12 , 1 ) --�O���O�A��1���гy�A��2�������]2011�w�R�^
	SetSmallGameMenuStr( OwnerID() , 12 , 1 , "[SC_DANCEFES_SUKI_MAKE14]"  ) --�����U���u��
	SetSmallGameMenuStr( OwnerID() , 12 , 2 , "[SC_DANCEFES_SUKI_MAKE06][$SETVAR1="..i.."]"  ) 
	ClockOpen( OwnerID() ,EM_ClockCheckValue_21, 60, 60, 0,"lua_dancefes_suki_makezone", "lua_dancefes_suki_maketimeover") --�˼ƭp�ɾ�  (�᭱����өI�s�禡�G "���Ϯ���"�A"�ɶ���ɩI�s�禡")
end

function lua_dancefes_suki_makequestion() --�X�D
	local numberB={1, 2, 3, 4}
	local numberC={}

--	WriteRoleValue(OwnerID(), EM_RoleValue_Register+6, 0)
------------  2013.03.14 ���ʶ}�l�e���M�Ū��a�Ҧ�Register�� ------
	WriteRoleValue(OwnerID(), EM_RoleValue_Register, 0)
	WriteRoleValue(OwnerID(), EM_RoleValue_Register+1,0)
	WriteRoleValue(OwnerID(), EM_RoleValue_Register+2,0)
	WriteRoleValue(OwnerID(), EM_RoleValue_Register+3,0)
	WriteRoleValue(OwnerID(), EM_RoleValue_Register+4,0)
	WriteRoleValue(OwnerID(), EM_RoleValue_Register+5,0)
	WriteRoleValue(OwnerID(), EM_RoleValue_Register+6,0)
	WriteRoleValue(OwnerID(), EM_RoleValue_Register+7,0)
	WriteRoleValue(OwnerID(), EM_RoleValue_Register+8,0)
	WriteRoleValue(OwnerID(), EM_RoleValue_Register+9,0)

	for x = 1, 4 do
		local i=table.getn ( numberB ) 
		--Say(OwnerID(), "numberB="..i)
		local Wnumber=Rand(i)+1
	--	Say( OwnerID(), "Wnumber="..numberB[Wnumber] )
		table.insert ( numberC, numberB[Wnumber])
		table.remove( numberB, Wnumber )
	end
	WriteRoleValue (OwnerID(), EM_RoleValue_Register, numberC[1]..numberC[2]..numberC[3]..numberC[4])
end

function lua_dancefes_suki_makewoman02() --Ū�D��
	-- TargetID = NPC
	-- OwnerID = ���a
	if CheckFlag( OwnerID() , 544851 )==TRUE then
		local womanPID = ReadRoleValue ( TargetID(), EM_RoleValue_PID )	 	-- Ū��NPC�� PID ��
		local womannumber=ReadRoleValue( OwnerID(), EM_RoleValue_Register )	-- Ū�����a���W�� Reg ��
	--	local success=ReadRoleValue(OwnerID(), EM_RoleValue_Register+9)		-- ���ޯ�@�p�G����1 �ޯ�N����� 0 �N�i�H��
		WriteRoleValue(OwnerID(), EM_RoleValue_Register+5, TargetID() )		-- �����a�O�o NPC
		--Say(OwnerID(), womannumber )
		if womanPID ==1 then
			IF ReadRoleValue(OwnerID(), EM_RoleValue_Register+womanPID) ~= 6 THEN --�t�令�\	
				IF ReadRoleValue( OwnerID(), EM_RoleValue_Register+womanPID)==0 then
					womannumber = math.floor( womannumber/1000 )
					WriteRoleValue( OwnerID(), EM_RoleValue_Register+womanPID, womannumber)
					--Say(OwnerID(), "A="..womannumber)
					SetSpeakDetail(OwnerID(), "[SC_DANCEFES_SUKI_MAKE11][$SETVAR1="..womannumber.."][$SETVAR2=".."[".."497413".."]".."]" ) 	--blue	-- �ڬO�X���A�H���O�����H
					local a2=ReadRoleValue(OwnerID(), EM_RoleValue_Register+1)	
					AddBuff(OwnerID(), 509232 , a2-1 , -1)
					lua_suki_dancefes_makedobule()
				else	-- �D�ؤw�g�X�ӤF
					local a= ReadRoleValue( OwnerID(), EM_RoleValue_Register+womanPID)
					SetSpeakDetail(OwnerID(), "[SC_DANCEFES_SUKI_MAKE12][$SETVAR1="..a.."]") 	-- �ڬO[VAR]���A�A���D�ڪ��t�@�b�O�ֶܡH
				end
			else
				SetSpeakDetail(OwnerID(), "[SC_DANCEFES_SUKI_MAKE18]") --�t�令�\
			End 
		elseif womanPID ==2 then
			IF ReadRoleValue(OwnerID(), EM_RoleValue_Register+womanPID) ~= 6 THEN
				IF ReadRoleValue( OwnerID(), EM_RoleValue_Register+womanPID)==0 then
					womannumber = math.floor( womannumber/100 )%10
					WriteRoleValue( OwnerID(), EM_RoleValue_Register+womanPID, womannumber)
					SetSpeakDetail(OwnerID(), "[SC_DANCEFES_SUKI_MAKE11][$SETVAR1="..womannumber.."][$SETVAR2=".."[".."497414".."]".."]") --red
					local b2=ReadRoleValue(OwnerID(), EM_RoleValue_Register+2)
					AddBuff(OwnerID(), 509233 , b2-1 , -1)
					lua_suki_dancefes_makedobule()
				else
					local b= ReadRoleValue( OwnerID(), EM_RoleValue_Register+womanPID)
					SetSpeakDetail(OwnerID(), "[SC_DANCEFES_SUKI_MAKE12][$SETVAR1="..b.."]") 
				end
			else
				SetSpeakDetail(OwnerID(), "[SC_DANCEFES_SUKI_MAKE18]") --�t�令�\
			End 
		elseif womanPID ==3 then
			IF ReadRoleValue(OwnerID(), EM_RoleValue_Register+womanPID) ~= 6 THEN
				IF ReadRoleValue( OwnerID(), EM_RoleValue_Register+womanPID)==0 then
					womannumber = math.floor (womannumber/10) %10
					WriteRoleValue( OwnerID(), EM_RoleValue_Register+womanPID, womannumber)
					SetSpeakDetail(OwnerID(), "[SC_DANCEFES_SUKI_MAKE11][$SETVAR1="..womannumber.."][$SETVAR2=".."[".."497415".."]".."]" ) --green
					local c2=ReadRoleValue(OwnerID(), EM_RoleValue_Register+3)
					AddBuff(OwnerID(), 509234 , c2-1 , -1)
					lua_suki_dancefes_makedobule()
				else
					local c= ReadRoleValue( OwnerID(), EM_RoleValue_Register+womanPID)
					SetSpeakDetail(OwnerID(), "[SC_DANCEFES_SUKI_MAKE12][$SETVAR1="..c.."]") 
				end
			else
				SetSpeakDetail(OwnerID(), "[SC_DANCEFES_SUKI_MAKE18]") --�t�令�\
			End 
		elseif womanPID ==4 then
			IF ReadRoleValue(OwnerID(), EM_RoleValue_Register+womanPID) ~= 6 THEN
				IF ReadRoleValue( OwnerID(), EM_RoleValue_Register+womanPID)==0 then
					womannumber = womannumber%10
					WriteRoleValue( OwnerID(), EM_RoleValue_Register+womanPID, womannumber)
					SetSpeakDetail(OwnerID(), "[SC_DANCEFES_SUKI_MAKE11][$SETVAR1="..womannumber.."][$SETVAR2=".."[".."497416".."]".."]") --pruple
					local d2=ReadRoleValue(OwnerID(), EM_RoleValue_Register+4)
					AddBuff(OwnerID(), 509235 , d2-1 , -1)
					lua_suki_dancefes_makedobule()
				else
					local d= ReadRoleValue( OwnerID(), EM_RoleValue_Register+womanPID)
					SetSpeakDetail(OwnerID(), "[SC_DANCEFES_SUKI_MAKE12][$SETVAR1="..d.."]") 
				end
			else
				SetSpeakDetail(OwnerID(), "[SC_DANCEFES_SUKI_MAKE18]") --�t�令�\
			End 
		end
	else
		SetSpeakDetail(OwnerID(), "[SC_DANCEFES_SUKI_MAKE13]" )--�������Ƨ�A�C
	end
end

function lua_suki_dancefes_makedobule() --�T�{�ޯ��_�ϥ�----------------------------------------------------------------------------------------
--	say(OwnerID(), "OwnerID")--p
--	say(TargetID(),"npc")--p
	local NPC=ReadRoleValue(OwnerID(), EM_RoleValue_Register+5 )
	local double=ReadRoleValue(OwnerID(), EM_RoleValue_Register+7) --0	-- �P�_�O�_����
	local  place=ReadRoleValue(OwnerID(), EM_RoleValue_Register+8) --�P�_�Ӵ���X��
	local idlarge =117763
	local npcID=ReadRoleValue( NPC,  EM_RoleValue_OrgID)
	local npcID2, p1, p2, p3, p4

	if place==0 then --��l
		npcID2=(idlarge-npcID)*1000 --2000
		WriteRoleValue(OwnerID(), EM_RoleValue_Register+7, npcID2) -- 2000
	--	say (OwnerID(),"place0="..npcID2)
		WriteRoleValue(OwnerID(),EM_RoleValue_Register+8, place+1 )
-------------------------------------------------------------------------
	elseif place==1 then --����Ū��
		p1=math.floor(double/1000)--6
		npcID2=idlarge-npcID --7
		p2=math.floor(double/100)%10--7
		if p2==0 then
			if p1~=npcID2 then		
			--	Say(OwnerID(),"place2_id="..npcID2)
			--	say(OwnerID(),"place2_p1="..p1)
			--	say(OwnerID(),"place2_p2="..p2)
				npcID2=npcID2*100+double--9*1000+40000
				WriteRoleValue(OwnerID(), EM_RoleValue_Register+7, npcID2) --49000
			--	say (OwnerID(),"place2="..npcID2)
				WriteRoleValue(OwnerID(),EM_RoleValue_Register+8, place+1 )
			end
		else
		--	say(OwnerID(),"place2_p2="..p2)
		--	WriteRoleValue(OwnerID(),EM_RoleValue_Register+9, 0)
		end
	elseif place==2 then
		p1=math.floor(double/1000)--4
		p2=math.floor(double/100)-(p1*10) --9
		npcID2=idlarge-npcID --1
		p3=math.floor ((double%100)/10)--1
		if p3==0 then
			if p1~=npcID2 and p2~=npcID2 then		
			--	Say(OwnerID(),"place3_id="..npcID2)
			--	say(OwnerID(),"place3_p1="..p1)
			--	say(OwnerID(),"place3_p2="..p2)
			--	say(OwnerID(),"place3_p2="..p3)
				npcID2=npcID2*10+double--1*100+49000
				WriteRoleValue(OwnerID(), EM_RoleValue_Register+7, npcID2) --49100
			--	say (OwnerID(),"place3="..npcID2)
				WriteRoleValue(OwnerID(),EM_RoleValue_Register+8, place+1 )
			end
		else
		--	say(OwnerID(),"place3_p3="..p3)
		--	WriteRoleValue(OwnerID(),EM_RoleValue_Register+9, 0)
		end
	elseif place==3 then
		p1=math.floor(double/1000)--4
		p2=math.floor(double/100)-(p1*10)--9
		p3=math.floor(double/10)-(p1*100+p2*10) --1
		npcID2=idlarge-npcID --3
		p4=double%10--3
		if p4==0 then
			if p1~=npcID2 and p2~=npcID2 and p3~=npcID2 then		
				npcID2=npcID2+double--3*10+49100
				WriteRoleValue(OwnerID(), EM_RoleValue_Register+7, npcID2) --49130
			--	say (OwnerID(),"place4="..npcID2)
				WriteRoleValue(OwnerID(),EM_RoleValue_Register+8, place+1 )
			end
		else
		--	say(OwnerID(),"place4_p4="..p4)
		--	WriteRoleValue(OwnerID(),EM_RoleValue_Register+9, 0)
		end
	end
----------------------------------------------------------------------------------------
end

function lua_dancefes_suki_makecheck() --�ޯ��H��O�P�ֹ�-------------------------------------------------------------------------------------------------------------------------
--	Say(OwnerID(), "checkplayer")--player
--	say(TargetID(), "checkNPC") --npc
	local npcPID=ReadRoleValue ( TargetID(), EM_RoleValue_PID )
	CloseSpeak( OwnerID() )
	if CheckID( TargetID() ) == false then --�S���ؼ�
		return FALSE
	else
		if ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) == 1 then --���a
			ScriptMessage(OwnerID(), OwnerID(), 1, "[EM_BAHU_3]" , C_SYSTEM)--�ؼп��~
			return FALSE
		else
			if npcPID ~=0 then
				return TRUE
			else
				ScriptMessage(OwnerID(), OwnerID(), 1, "[EM_BAHU_3]" , C_SYSTEM)--�ؼп��~
				return FALSE
			end
		end
	end
end


function lua_dancefes_suki_makecheck02 ( buffID ) --�t��}�l
--	say(OwnerID(), "check02="..01)--p
--	say(TargetID(), "check02="..02)--n
	local checkPID=ReadRoleValue( TargetID(), EM_RoleValue_PID )
	local anwserA=ReadRoleValue(OwnerID(), EM_RoleValue_Register+checkPID )
	local n=ReadRoleValue ( OwnerID(), EM_RoleValue_Register+6 ) --����
	local r=FN_CountBuffLevel( OwnerID(), buffID ) 
--	say(OwnerID(), "pid="..checkPID)
--	say(OwnerID(), "colorbuff="..r)

	local double=ReadRoleValue(OwnerID() , EM_RoleValue_Register+7 )	-- �P�_�O�_����
	local place=ReadRoleValue(OwnerID() , EM_RoleValue_Register+8 ) --�P�_�Ӵ���X��
	local idlarge =117763
	local npcID=ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	local Step
	local Count = { }
		Count[1]=math.floor(double/1000)	-- 4
		Count[2]=math.floor(double/100)-(Count[1]*10)	-- 43 - 40 = 3
		Count[3]=math.floor(double/10)-(Count[1]*100+Count[2]*10)	-- 432 - 400 + 30 = 2
		Count[4]=double%10	-- 1
	--	Say( OwnerID() , "double ="..double )
		
	for i = 1 , table.getn(Count) , 1 do
		if idlarge-npcID == Count[i] then
			ScriptMessage(OwnerID(), OwnerID(), 1, "[EM_BAHU_3]" , C_SYSTEM)
			return false
		end
	end

	if anwserA ~= 7 then
		if anwserA < 6 then 
			if anwserA~= r or anwserA==0 then
				ScriptMessage( OwnerID() , OwnerID(), 1, "[EM_BAHU_3]" , C_SYSTEM ) --�ؼп��~
			else
			--	say(OwnerID(), "anwser="..anwserA)
			--	say(OwnerID(), "checkbuff="..r)
				ScriptMessage( OwnerID() , OwnerID(), 1, "[SC_DANCEFES_SUKI_MAKE17]" , C_SYSTEM ) --�[��	
				n = n+10
				WriteRoleValue(OwnerID(), EM_RoleValue_Register+6, n)
				local n3=ReadRoleValue ( OwnerID(), EM_RoleValue_Register+6)
			--	say (OwnerID(), "n3="..n3)
				WriteRoleValue ( OwnerID(), EM_RoleValue_Register+checkPID, 6)--�t�令�\
				SetSmallGameMenuStr( OwnerID() , 12 , 2 , "[SC_DANCEFES_SUKI_MAKE06][$SETVAR1="..n3.."]"  ) 	
			end
		else
			ScriptMessage (OwnerID(), OwnerID(), 1,  "[SC_DANCEFES_SUKI_MAKE19]", C_SYSTEM) --�t�粒��
		end
	else
		SetSpeakDetail (OwnerID(), TargetID(), "[SC_DANCEFES_SUKI_MAKE07]" ) --�֥h��~
	end
end

------------------------------------------------------------------------------------------------------------------------------------------------

function lua_dancefes_suki_maketimeover()
--	Say(OwnerID(), "tmieover")
	ScriptMessage(OwnerID(), OwnerID(), 0, "[SC_DANCEFES_SUKI_MAKE15]",  C_SYSTEM )
	ScriptMessage(OwnerID(), OwnerID(), 1, "[SC_DANCEFES_SUKI_MAKE15]",  C_SYSTEM )
	SetFlag(OwnerID(), 544851, 0)--Start
	SetFlag(OwnerID(), 544852, 1)--end
	SetFlag(OwnerID(), 544853, 1)
	ClockClose( OwnerID() )
	CancelBuff(OwnerID(), 509322 )
	CancelBuff(OwnerID(), 509232 )
	CancelBuff(OwnerID(), 509233 )
	CancelBuff(OwnerID(), 509234 )
	CancelBuff(OwnerID(), 509235 )
	CancelBuff(OwnerID(), 509236 )
	SetSmallGameMenuType( OwnerID() , 12 ,2 ) -- �������� (2������
	WriteRoleValue(OwnerID(), EM_RoleValue_Register, 0)
	WriteRoleValue(OwnerID(), EM_RoleValue_Register+1,0)
	WriteRoleValue(OwnerID(), EM_RoleValue_Register+2,0)
	WriteRoleValue(OwnerID(), EM_RoleValue_Register+3,0)
	WriteRoleValue(OwnerID(), EM_RoleValue_Register+4,0)
	WriteRoleValue(OwnerID(), EM_RoleValue_Register+5,0)
	WriteRoleValue(OwnerID(), EM_RoleValue_Register+7,0)
	WriteRoleValue(OwnerID(), EM_RoleValue_Register+8,0)
	WriteRoleValue(OwnerID(), EM_RoleValue_Register+9,0)
end

function lua_dancefes_suki_makezone()
	ScriptMessage( OwnerID() , OwnerID(), 1, "[SC_DANCEFES_SUKI_MAKE09]" , C_SYSTEM )  
	ScriptMessage( OwnerID() ,  OwnerID(), 0, "[SC_DANCEFES_SUKI_MAKE09]" , C_SYSTEM )  
	SetFlag(OwnerID(), 544851, 0)
	SetFlag(OwnerID(), 544853, 1)
	ClockClose( OwnerID() )
	CancelBuff(OwnerID(), 509322 )
	CancelBuff(OwnerID(), 509232 )
	CancelBuff(OwnerID(), 509233 )
	CancelBuff(OwnerID(), 509234 )
	CancelBuff(OwnerID(), 509235 )
	CancelBuff(OwnerID(), 509236 )
	SetSmallGameMenuType( OwnerID() , 12 ,2 ) -- �������� (2������
	WriteRoleValue(OwnerID(), EM_RoleValue_Register, 0)
	WriteRoleValue(OwnerID(), EM_RoleValue_Register+1,0)
	WriteRoleValue(OwnerID(), EM_RoleValue_Register+2,0)
	WriteRoleValue(OwnerID(), EM_RoleValue_Register+3,0)
	WriteRoleValue(OwnerID(), EM_RoleValue_Register+4,0)
	WriteRoleValue(OwnerID(), EM_RoleValue_Register+5,0)
	WriteRoleValue(OwnerID(), EM_RoleValue_Register+6,0)
	WriteRoleValue(OwnerID(), EM_RoleValue_Register+7,0)
	WriteRoleValue(OwnerID(), EM_RoleValue_Register+8,0)
	WriteRoleValue(OwnerID(), EM_RoleValue_Register+9,0)
end


------------------------------------

function lua_mika_dancefes_marktest01()
	local Player = OwnerID()
	local R0 = ReadRoleValue(player, EM_RoleValue_Register )
	local R1 = ReadRoleValue(player, EM_RoleValue_Register+1 )
	local R2 = ReadRoleValue(player, EM_RoleValue_Register+2 )
	local R3 = ReadRoleValue(player, EM_RoleValue_Register+3 )
	local R4 = ReadRoleValue(player, EM_RoleValue_Register+4 )
	local R5 = ReadRoleValue(player, EM_RoleValue_Register+5 )
	local R6 = ReadRoleValue(player, EM_RoleValue_Register+6 )
	local R7 = ReadRoleValue(player, EM_RoleValue_Register+7 )
	local R8 = ReadRoleValue(player, EM_RoleValue_Register+8 )
	local R9 = ReadRoleValue(player, EM_RoleValue_Register+9 )

	Say(player, "R0 = "..R0)
	Say(player, "R1 = "..R1)
	Say(player, "R2 = "..R2)
	Say(player, "R3 = "..R3)
	Say(player, "R4 = "..R4)
	Say(player, "R5 = "..R5)
	Say(player, "R6 = "..R6)
	Say(player, "R7 = "..R7)
	Say(player, "R8 = "..R8)
	Say(player, "R9 = "..R9)
end