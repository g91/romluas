function lua_weave_kors_begain() --���Ц�AND�ɶ��j��
	BeginPlot(OwnerID(),"LuaN_miyon_action02",0)
	BeginPlot(OwnerID(),"lua_weave_kors_NPC",0)
end

function lua_weave_kors_NPC()--���ɶ��}���
	while true do
	local min = GetSystime(2) --��t�ήɶ�(����)
	local hr = GetSystime(1)-- ��p��
		if  hr == 13 or   hr == 16  or hr == 19 or  hr == 22  then
			if min < 59 then --0���ɰ���X�{�@��
			local p = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
				if p == 0 then	
				WriteRoleValue(OwnerID(),EM_RoleValue_PID,1)
				end				
			end
			if min == 59 then --�R���@��
				local p = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
				if p ~= 0 then
				WriteRoleValue(OwnerID(),EM_RoleValue_PID,0)
				end
			end
		end
	Sleep(600)
	end
end


function lua_weave_kors_NRmove()--������LNPC�è���
SetRandMove(OwnerID(),150,150,20) 
end		

function lua_weave_kors_Nother()--�C��NPC���
local name = ReadRoleValue(TargetID(),EM_RoleValue_OrgID)
SetSpeakDetail(OwnerID(),"[SC_COLORWEAVE_KORS_08][$SETVAR1=["..name.."]]")
end

function lua_weave_kors_00() --���ʥD��NPC��l�@��
DW_CancelTypeBuff( 68,  OwnerID() )-- �����M�����A
local key1 = CheckFlag(OwnerID(),545467)--�����ȻP�_�P�_
local key2 = CheckFlag(OwnerID(),545468)--���ȧ����P�_
local key3 = CheckFlag(OwnerID(),545469)--�������
local key4 = CheckFlag(OwnerID(),545470)--�Q���P���\KEY
local key5 = CheckFlag(OwnerID(),545471)--���P���y�w��
local p = ReadRoleValue(TargetID(),EM_RoleValue_PID)
	if p ~= 0 then --�}��ɶ�
		if key1 == FALSE and key3 == FALSE then --��饼���ӱ�
			SetSpeakDetail(OwnerID(),"[SC_COLORWEAVE_KORS_00]")
			AddSpeakOption(OwnerID(),TargetID(),"[SC_COLORWEAVE_KORS_01]","lua_weave_kors_01",0)
				if key4 == TRUE and key5 == FALSE then --��Q���P���y
				AddSpeakOption(OwnerID(),TargetID(),"[SC_COLORWEAVE_KORS_14]","lua_weave_kors_se",0)
				end
			AddSpeakOption(OwnerID(),TargetID(),"[SC_COLORWEAVE_01]","lua_weave_kors_det",0) --��´�`���Ѩ�
		elseif key1 == TRUE and key2 == FALSE then--���ʶi�椤
			SetSpeakDetail(OwnerID(),"[SC_COLORWEAVE_KORS_05]")
				if key4 == TRUE and key5 == FALSE then--��Q���P���y
				AddSpeakOption(OwnerID(),TargetID(),"[SC_COLORWEAVE_KORS_14]","lua_weave_kors_se",0)
				end	
		elseif key2 == TRUE and key3 == FALSE then--�������P�^��
			SetSpeakDetail(OwnerID(),"[SC_COLORWEAVE_KORS_05]")
			AddSpeakOption(OwnerID(),TargetID(),"[SC_COLORWEAVE_KORS_06]","lua_weave_kors_AW",0)
				if key4 == TRUE and key5 == FALSE then--��Q���P���y
				AddSpeakOption(OwnerID(),TargetID(),"[SC_COLORWEAVE_KORS_14]","lua_weave_kors_se",0)
				end	
		elseif key2 == TRUE and key3 == TRUE then--���w�����L
			SetSpeakDetail(OwnerID(),"[SC_COLORWEAVE_KORS_15]")
				if key4 == TRUE and key5 == FALSE then--��Q���P���y
				AddSpeakOption(OwnerID(),TargetID(),"[SC_COLORWEAVE_KORS_14]","lua_weave_kors_se",0)
				end			
		end
	elseif p == 0 then --�D�}��ɶ�
		SetSpeakDetail(OwnerID(),"[SC_COLORWEAVE_KORS_07]")
			if key4 == TRUE and key5 == FALSE then --��Q���P���y
			AddSpeakOption(OwnerID(),TargetID(),"[SC_COLORWEAVE_KORS_14]","lua_weave_kors_se",0)
			end
			if key2 == TRUE and key3 == FALSE then--�������P�^��
			AddSpeakOption(OwnerID(),TargetID(),"[SC_COLORWEAVE_KORS_06]"," lua_weave_kors_AW",0)
			end
			AddSpeakOption(OwnerID(),TargetID(),"[SC_COLORWEAVE_01]","lua_weave_kors_det",0) --��´�`���Ѩ�
	end
end

function lua_weave_kors_det()	--��´�`�`�y�I���C
	SetSpeakDetail(OwnerID(),"[SC_COLORWEAVE_02]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_GUILDGIRL_BACK_01]","lua_weave_kors_00",0)
end

function lua_weave_kors_01() --���ʻ����[�ӱ�
	SetSpeakDetail(OwnerID(),"[SC_COLORWEAVE_KORS_02]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_COLORWEAVE_KORS_03]","lua_weave_kors_star",0)
end

function lua_weave_kors_star() -- ���ʶ}�l�������~
	SetSpeakDetail(OwnerID(),"[SC_COLORWEAVE_KORS_04]")

	local itemR = Rand(99)
		if itemR <= 25 then 
			GiveBodyItem(OwnerID(),240516,1)
		elseif itemR > 25 and itemR <=50 then
			GiveBodyItem(OwnerID(),240517,1)
		elseif itemR >50 and itemR <= 75 then
			GiveBodyItem(OwnerID(),240517,1)
		elseif itemR >75 then
			GiveBodyItem(OwnerID(),240517,1)
		end
	SetFlag(OwnerID(),545467,1)
end

function lua_weave_kors_CH()
local bufT = {620604,620605,620606,620607}
local T = TargetID()
local U = OwnerID()
	if T ~= U then
		for i = 1 ,4 do
			if CheckBuff(TargetID(),bufT[i]) == TRUE then
				ScriptMessage(OwnerID(),OwnerID(),1,"[SC_0908SEANSON_MAG14]",C_SYSTEM)
				return FALSE
			end
		end
	return TRUE
	elseIF T == U then
	ScriptMessage(OwnerID(),OwnerID(),1,"[SC_COLORWEAVE_KORS_21]",C_SYSTEM)
	return FALSE
	end
end
function lua_weave_kors_itemU() --USEITEM
local ItemT = {240516,240517,240518,240519}
local Bbuf =FN_CountBuffLevel(TargetID(),620608) --�P�_���A���\�_
	if Bbuf >= 8 then--���A���\
	local t = Rand(99)
	local sex = ReadRoleValue(TargetID(),EM_RoleValue_SEX)
		ScriptMessage(OwnerID(),OwnerID(),0,"[SC_COLORWEAVE_KORS_11]",C_SYSTEM)--�i�D�ۤv���A���\
		CancelBuff(TargetID(),620608)
		SetFlag(TargetID(),545470,1)--�����Q���P���\�X��
		if sex == 0 then	--�k��
			if t < 50 then
			AddBuff(TargetID(),620604,1,300)
			ScriptMessage(OwnerID(),TargetID(),0,"[SC_COLORWEAVE_KORS_17]",C_SYSTEM)--�i�D���Q���A�ܨ��F
			elseif t >=50 then
			AddBuff(TargetID(),620605,1,300)
			ScriptMessage(OwnerID(),TargetID(),0,"[SC_COLORWEAVE_KORS_17]",C_SYSTEM)
			end
		elseif sex == 1 then --�k��
			if t < 50 then
			AddBuff(TargetID(),620606,1,300)
			ScriptMessage(OwnerID(),TargetID(),0,"[SC_COLORWEAVE_KORS_17]",C_SYSTEM)
			elseif t >=50 then
			AddBuff(TargetID(),620607,1,300)
			ScriptMessage(OwnerID(),TargetID(),0,"[SC_COLORWEAVE_KORS_17]",C_SYSTEM)
			end
		end
	local Sbuf = FN_CountBuffLevel(OwnerID(),620610) --���a���\���Ƶ���
		CancelBuff(OwnerID(),620610)
		AddBuff(OwnerID(),620610,Sbuf+1,-1)
	elseif Bbuf < 8 then
		ScriptMessage(OwnerID(),OwnerID(),0,"[SC_COLORWEAVE_KORS_10]",C_SYSTEM)
	end
	BeginPlot(OwnerID(),"lua_weave_kors_AWCH",0)
end

function lua_weave_kors_AWCH()
local count = FN_CountBuffLevel(OwnerID(),620610) --�ӤH���\���ƧP�_
	if count >2 then
	SetFlag(OwnerID(),545468,1)
	ScriptMessage(OwnerID(),OwnerID(),0,"[SC_COLORWEAVE_KORS_12]",C_SYSTEM)
	end
end	

function lua_weave_kors_AW() --����M��
	SetSpeakDetail(OwnerID(),"[SC_COLORWEAVE_KORS_09]")
local ItemT = {240516,240517,240518,240519}
	for i = 1,4 do
		local it = CountBodyItem(OwnerID(),ItemT[i])
		if it ~= 0 then
			DelBodyItem(OwnerID(),ItemT[i],it)
		end
	end
	CancelBuff(OwnerID(),620610)
	GiveBodyItem(OwnerID(),725650,1)
	SetFlag(OwnerID(),545469,1)
end

function lua_weave_kors_se() --�Q���P���y
	SetSpeakDetail(OwnerID(),"[SC_COLORWEAVE_KORS_13]")
	GiveBodyItem(OwnerID(),725650,1)
	SetFlag(OwnerID(),545471,1)
end

function lua_weave_kors_giftUse(gift)--���y���㪺SCRIPT
local bufT = {620604,620605,620606,620607}
local sex = ReadRoleValue(TargetID(),EM_RoleValue_SEX)
	local Name = GetName( OwnerID())
	local Name2 = GetName( TargetID())
			ScriptMessage( OwnerID(), OwnerID(),  0,  "[SC_COLORWEAVE_KORS_18][$SETVAR1="..Name2.."]", 0 ) --�A��[$VAR1]�I�i�F[204214]�I[VAR1]��o�F[204214]�ĪG�I
			ScriptMessage( OwnerID(), TargetID(), 0,  "[SC_COLORWEAVE_KORS_19][$SETVAR2="..Name.."]", 0 ) --[$VAR1]��A�I�i�F[204214]�I�A��o�F[204214]�ĪG�I
			local H = Rand(99)+1
				if H <=95 then	
					if sex == 0 then	--�k��
						local RR = Rand(50)
						if RR < 24 then
						AddBuff(TargetID(),620604,1,600)
						elseif RR >=24 then
						AddBuff(TargetID(),620605,1,600)
						end
					elseif sex == 1 then --�k��
						local RR = Rand(50)
						if RR < 24 then
						AddBuff(TargetID(),620606,1,600)
						elseif RR >=24 then
						AddBuff(TargetID(),620607,1,600)
						end
					end
				elseif H > 95 then
					if sex == 0 then
						AddBuff(TargetID(),620632,1,600)	
					elseif sex == 1 then
						AddBuff(TargetID(),620631,1,600)
					end	
				end
end
		
function lua_weave_kors_re() --redo���O
local ItemT = {240516,240517,240518,240519}
local bufT =  {498173,498174,498175,498176}
	for I = 1,4 do
		local CNT = CountBodyItem(OwnerID(),ItemT[I])
		if CNT ~= 0 then
		DelBodyItem(OwnerID(),ItemT[I],cnt)
		end
		CancelBuff_NoEvent(OwnerID(),bufT[I])
	end
local keyT = {545467,545468,545469,545470,545471}
	for K = 1,5 do
		SetFlag(OwnerID(),keyT[K],0)
	end
end

function lua_weave_kors_TEST()
local npcm=SetSearchRangeInfo( OwnerID() , 250 )
		for i=1 , npcm, 1 do 											 
			local npcde = GetSearchResult()	
				if ReadRoleValue(npcde,EM_RoleValue_OrgID) == 118982 then
				WriteRoleValue(npcde,EM_RoleValue_PID,1)
				end
		end
end

function lua_weave_kors_TESTEND()
local npcm=SetSearchRangeInfo( OwnerID() , 250 )
		for i=1 , npcm, 1 do 											 
			local npcde = GetSearchResult()	
				if ReadRoleValue(npcde,EM_RoleValue_OrgID) == 118982 then
				WriteRoleValue(npcde,EM_RoleValue_PID,0)
				end
		end
end