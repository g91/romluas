function Lua_Hao_KR_New_Semester_00()

--	Say( OwnerID() , "1" )	--���a
--	Say( TargetID() , "2" )	--NPC
	AdjustFaceDir( TargetID(), OwnerID() , 0 ) --���V

	SetSpeakDetail(  OwnerID(), "[SC_KR_NEW_SEMESTER_00]"  ) --[$PLAYERNAME]�A�̪�A<CB>���F��[112854]</CB>���F���i�j�a����ǯ���A�o�_�F�����g��O�����ʡA�u�n�A�C�ѫ���s���O�A���O�����ƹF���<CY>9</CY>���P��<CY>13</CY>���ɡA�N���ڧI�����y�ڡC

	AddSpeakOption( OwnerID(), TargetID( ), "[SC_KR_NEW_SEMESTER_01]"  , "Lua_Hao_KR_New_Semester_01", 0 )-- �ڭn�s���O
end

function Lua_Hao_KR_New_Semester_01()

--	Say( OwnerID() , "3" )	-- ���a
--	Say( TargetID() , "4" ) 	-- NPC
	if CheckFlag( OwnerID() , 543634 ) == false then
		SetFlag( OwnerID() , 543634 , 1 )
		AddBuff( OwnerID() , 505887 , 0 , -1 )
		CastSpell( OwnerID() , OwnerID() , 491010 )
		AdjustFaceDir( TargetID(), OwnerID() , 0 ) --���V
		PlayMotion( TargetID() , 106 )
		CloseSpeak( OwnerID() )
		local Count = BuffCount ( OwnerID())
		for i = 0 , Count do
			local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
			if BuffID == 505887 then
				local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )
				local BuffLvv = BuffLv + 1
				if BuffLv == 8 then -- ��Buff���Ųֿn��9�A�������a�I�]2��
					if CheckFlag( OwnerID() , 543637 ) == false then
						GiveBodyItem( OwnerID() , 206900 , 1  )
						SetFlag( OwnerID() , 543637 , 1 )
						CloseSpeak( OwnerID() )
						AdjustFaceDir( TargetID(), OwnerID() , 0 ) --���V
						PlayMotion( TargetID() , 102 )
					end
				elseif BuffLv == 12 then -- ��Buff���Ųֿn��13�A�������a�I�]1��
					if CheckFlag( OwnerID() , 543636 ) == false then
						GiveBodyItem( OwnerID() , 206899 , 1 )
						SetFlag( OwnerID() , 543636 , 1 )
						CloseSpeak( OwnerID() )
						AdjustFaceDir( TargetID(), OwnerID() , 0 ) --���V
						PlayMotion( TargetID() , 111 )
					end
				end
			end
		end
	else -- ���пﶵ�ɹ��
		local Count = BuffCount ( OwnerID())
		for i = 0 , Count do
			local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
			if BuffID == 505887 then
				local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )
				local BuffLvv = BuffLv + 1
				if BuffLv == 8 then -- ��Buff���Ųֿn��9�����
					SetSpeakDetail(  OwnerID(), "[SC_KR_NEW_SEMESTER_04][$SETVAR1="..BuffLvv.."]"  ) -- �j�ƧA���Z���A�b�԰����~�|����n����{�C
					AdjustFaceDir( TargetID(), OwnerID() , 0 ) --���V
					PlayMotion( TargetID() , 102 )
				elseif BuffLv == 12 then -- ��Buff���Ųֿn��13�����
					SetSpeakDetail(  OwnerID(), "[SC_KR_NEW_SEMESTER_05]"  ) -- ���ߧA�A�����F13�Ѫ���O���O���A�Ʊ�A�|���w�o��§���C
					AdjustFaceDir( TargetID(), OwnerID() , 0 ) --���V
					PlayMotion( TargetID() , 111 )
				elseif BuffLv < 12 then -- ���aBuff����F�ֿn���ƮɡC
					SetSpeakDetail(  OwnerID(), "[SC_KR_NEW_SEMESTER_02][$SETVAR1="..BuffLvv.."]"  ) -- �A�w�g�g�L���Ѫ���O�ơA�ثe��O�������Ƭ��G<CS>[$VAR1]</CS>
					AdjustFaceDir( TargetID(), OwnerID() , 0 ) --���V
					PlayMotion( TargetID() , 106 )
				end
			elseif CheckFlag( OwnerID() , 543634 ) == true and CheckBuff( OwnerID() , 505887 ) == false then
				SetSpeakDetail(  OwnerID(), "You must use the correct way to test this activity , Something wrong  , Please try again ."  ) -- �A�����ϥΥ��T���覡���ճo�Ӭ��ʡC���ǿ��~�A�Э��s����
				AdjustFaceDir( TargetID(), OwnerID() , 0 ) --���V
				PlayMotion( TargetID() , 107 )
			end
		end    
	end
end

function Lua_Hao_KR_Semester_Reset0()
	SetFlag( OwnerID() , 543634 , 0 )
end
function Lua_Hao_KR_Semester_Reset1()
	SetFlag( OwnerID() , 543636 , 0 )
	SetFlag( OwnerID() , 543637 , 0 )
end

--===========================================
--	2011�~
--===========================================
function FN_KR_NewSemester_NPC114944()
	SetSpeakDetail(OwnerID(),"[SC_KR_NEW_SEMESTER_07]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_KR_NEW_SEMESTER_08]", "FN_KR_NewSemester_give", 0 )
end

function FN_KR_NewSemester_give()
	--Say(OwnerID(),"OwnerID") --Player
	--Say(TargetID(),"TargetID") --NPC
	if CheckBuff(OwnerID(),505889) == TRUE then
		SetSpeakDetail(OwnerID(),"[SC_KR_NEW_SEMESTER_10]")
	else
		GiveBodyItem(OwnerID(),209566,1)
		AddBuff(OwnerID(),505889,0,-1)
		CancelBuff(OwnerID(),506955)
		AddBuff(OwnerID(),506955,0,3600)
		CloseSpeak(OwnerID())
	end
end

function FN_KR_NewSemester_Item209566(Type,ItemID)
	if Type == "check" then
		if CheckBuff(OwnerID(),506955) == FALSE then
			return TRUE
		else
			ScriptMessage(OwnerID(),OwnerID(),0,"[SC_KR_NEW_SEMESTER_06]",0)	--�A���W�w�g�֦��ĪG
			ScriptMessage(OwnerID(),OwnerID(),1,"[SC_KR_NEW_SEMESTER_06]",0)	--�A���W�w�g�֦��ĪG
			return FALSE
		end
	elseif Type == "use" then
		local ItemTable = {209566,209567,209568,209569}
		local BuffLV = FN_CountBuffLevel(OwnerID(),505889)
		--�����a�Ҩϥέ������Ť�ӵ����h�j��Buff
		AddBuff(OwnerID(),506955,ItemID-1,3600)
		-- �έp���a���W��Buff�ӱo�����a�ϥβĴX��
		if BuffLV == -1 then
			AddBuff(OwnerID(),505889,0,-1)
		else
			CancelBuff(OwnerID(),505889)
			AddBuff(OwnerID(),505889,BuffLV+1,-1)
			BuffLV = FN_CountBuffLevel(OwnerID(),505889)
			if BuffLV == 3 then	--��ܪ��a�w�g�ְO�ϥ�3��
				if ItemID == 4 then	--�ˬd���a�O���O�w�g�ϥγ̰������Ť� �Y�O�h����§�]
					CancelBuff(OwnerID(),505889)
					--DelBodyItem(OwnerID(),209569)
					--GiveBodyItem(OwnerID(),209570,1)
					BeginPlot(OwnerID(),"FN_KR_NewSemester_Item209566_end",0)
				else
					--�R���{����Buff ���s�p��ϥΦ���
					CancelBuff(OwnerID(),505889)
					AddBuff(OwnerID(),505889,0,-1)
					--�R���{�����Ť嵹���U�@�����Ť�
					BeginPlot(OwnerID(),"FN_KR_NewSemester_Item209566_end",0)
				end
			end
		end
	end
end

function FN_KR_NewSemester_Item209566_end()
	local ItemTable = {209566,209567,209568,209569,209570}
	for i = 1,4 do
		if CountBodyItem(OwnerID(),ItemTable[i]) >= 1 then
			DelBodyItem(OwnerID(),ItemTable[i],1)
			GiveBodyItem(OwnerID(),ItemTable[i+1],1)
			if i ~= 4 then 
				AddBuff(OwnerID(),505889,0,-1)
				--
				ScriptMessage(OwnerID(),OwnerID(),0,"[SC_KR_NEW_SEMESTER_09][$SETVAR1=".."["..ItemTable[i].."]".."][$SETVAR2=".."["..ItemTable[i+1].."]".."]",C_SYSTEM) --�o�X���~�i�ƤF
				ScriptMessage(OwnerID(),OwnerID(),1,"[SC_KR_NEW_SEMESTER_09][$SETVAR1=".."["..ItemTable[i].."]".."][$SETVAR2=".."["..ItemTable[i+1].."]".."]",C_SYSTEM) --�o�X���~�i�ƤF
			end
			return
		end
	end

end

function FN_KR_NewSemester_Item209566_Del()	--�R���s�Ǵ��Ť媺�ƥ�
	CancelBuff(OwnerID(),505889)
end


Function LuaI_209570()  --2011�s�Ǵ��I�]
	local itemset  = {	3 ,"" 	, { 203298 , 1 }	
				, 13 ,""	, { 203321 , 1 }	
				, 23 ,""	, { 202506 , 10 } 
				, 40 ,""	, { 203038 , 100 }	
				, 60 ,""	, { 203091 , 5 }
				, 80 ,""	, { 201134 , 5 }	
				, 100 ,"" , { 201610 , 5 }	
							}

	return BaseTressureProc(   itemset , 1  )
end

function FN_KR_NewSemester_test()
	CancelBuff(OwnerID(),506955)
end