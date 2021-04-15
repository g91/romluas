--======================================
--			���
--======================================
function FN_JPSummer_111450()
	SetSpeakDetail(OwnerID(),"[FN_JPSUMMER_01]")
	AddSpeakOption(OwnerID(),TargetID(), "[FN_JPSUMMER_OP_03]" , "FN_JPSummer_111450_op03" , 0 )	--�ڭn�I���L��§��
	AddSpeakOption(OwnerID(),TargetID(), "[FN_JPSUMMER_OP_01]" , "FN_JPSummer_111450_op01" , 0 )	--�ڭn�I���ܲ������
	AddSpeakOption(OwnerID(),TargetID(), "[FN_JPSUMMER_OP_02]" , "FN_JPSummer_111450_op02" , 0 )	--�ڭn�������
end

function FN_JPSummer_111450_op01()
	SetSpeakDetail(OwnerID(),"[FN_JPSUMMER_02]")
	AddSpeakOption(OwnerID(),TargetID(), "[FN_JPSUMMER_OP_YES]" , "FN_JPSummer_exchange1" , 0 )
end

function FN_JPSummer_111450_op02()
	SetSpeakDetail(OwnerID(),"[FN_JPSUMMER_03]")
	AddSpeakOption(OwnerID(),TargetID(), "[FN_JPSUMMER_OP_YES]" , "FN_JPSummer_exchange2" , 0 )
end

function FN_JPSummer_111450_op03()
	SetSpeakDetail(OwnerID(),"[FN_JPSUMMER_04]")
	AddSpeakOption(OwnerID(),TargetID(), "[FN_JPSUMMER_OP_04]" , "FN_JPSummer_exchange3" , 0 )	--���� �L�����§��
	if CountBodyItem(OwnerID(),530722) == 0 then
		AddSpeakOption(OwnerID(),TargetID(), "[FN_JPSUMMER_OP_05]" , "FN_JPSummer_exchange4" , 0 )	--���� �Y��
	end
end

function FN_JPSummer_exchange1()
	local Count = CountBodyItem(OwnerID(),209764)
	if Count >= 5 then
		DelBodyItem(OwnerID(),209764,5)
		GiveBodyItem(OwnerID(),209765,5)	--�����ܲ��]�k���
	else
		ScriptMessage(OwnerID(),OwnerID(),1,"[FN_JPSUMMER_NOTENOUGH][$SETVAR1=".."["..(209764).."]".."]", 0 )
	end
	CloseSpeak(OwnerID())
end

function FN_JPSummer_exchange2()
	local Count = CountBodyItem(OwnerID(),209764)
	if Count >= 10 then
		DelBodyItem(OwnerID(),209764,10)
		GiveBodyItem(OwnerID(),209766,1)	--�����P�ª�
	else
		ScriptMessage(OwnerID(),OwnerID(),1,"[FN_JPSUMMER_NOTENOUGH][$SETVAR1=".."["..(209764).."]".."]", 0 )
	end
	CloseSpeak(OwnerID())
end

function FN_JPSummer_exchange3()
	local Count = CountBodyItem(OwnerID(),209766)
	if Count >= 2 then
		DelBodyItem(OwnerID(),209766,2)
		GiveBodyItem(OwnerID(),209767,1)	--�����P�ª�
	else
		ScriptMessage(OwnerID(),OwnerID(),1,"[FN_JPSUMMER_NOTENOUGH][$SETVAR1=".."["..(209766).."]".."]", 0 )
	end
	CloseSpeak(OwnerID())
end

function FN_JPSummer_exchange4()
	local Count = CountBodyItem(OwnerID(),209766)
	if Count >= 14 then
		DelBodyItem(OwnerID(),209766,14)
		GiveBodyItem(OwnerID(),530722,1)	--�����ٸ�
	else
		ScriptMessage(OwnerID(),OwnerID(),1,"[FN_JPSUMMER_NOTENOUGH][$SETVAR1=".."["..(209766).."]".."]", 0 )
	end
	CloseSpeak(OwnerID())
end

function FN_JPSummer_I209765()	--�ܲ��]�k���
	local RanX = DW_Rand(3)
	local Buff = {509687,509688,509689}
	PlayMotion ( OwnerID(),117)
	--
	for i=1,3 do
		CancelBuff(OwnerID(),Buff[i])
	end
	AddBuff( OwnerID() ,Buff[RanX],0 ,7200)
end

function FN_JPSummer_I209767( Option ) --�L�����§��
	local PlayerID = OwnerID()
	local PackageID = 209767		
	local NeedSpace = 3
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end

	elseif ( Option == "USE" ) then
		local RanX = DW_Rand(5)	--�Ϥ�5��1
		local GiftX = {203291,203292,203293,203294,203295}
		local RanY = DW_Rand(2)	--�S�B2��1
		local GiftY = {209768,209769}
		local RanZ = DW_Rand(3)	--�ӫ��ľ�3��1
		local GiftZ = {207582,201134,201610}
		GiveBodyItem( PlayerID , GiftX[RanX] , 5 )
		GiveBodyItem( PlayerID , GiftY[RanY] , 5 )
		GiveBodyItem( PlayerID , GiftZ[RanZ] , 1 )
	end
end
--======================================
--			���A
--======================================
function FN_JPSummer_SeaFood_Go()
	ScriptMessage(TargetID(),TargetID(),1,"[FN_JPSUMMER_SEA_Q01]", C_SYSTEM  )
	AddBuff( TargetID() ,509692,0 ,2)
	Sleep(30)
	ChangeZone( TargetID(), 7 , 0 , 24707, 7, 18862, 232)
end

function FN_JPSummer_I209770()	--���A�N�N���L �ϥ�
	local RanX = DW_Rand(5)
	PlayMotion ( OwnerID(),117)
	--
	CancelBuff(OwnerID(),509690)
	CancelBuff(OwnerID(),509691)
	if RanX == 5 then
		AddBuff( OwnerID() ,509690,0 ,7200)
	else
		AddBuff( OwnerID() ,509691,0 ,7200)
	end
end

function FN_JPSummer_SeaFood_hide()	--�I�磌���⪫��hide
	BeginPlot(TargetID(),"FN_JPSummer_SeaFood_show",0)
	if CountBodyItem(OwnerID(),209771) >= 9 then
		BeginPlot(OwnerID(),"FN_JPSummer_SeaFood_back",0)
	end
	return TRUE
end

function FN_JPSummer_SeaFood_show()	--�C�j�@�q�ɶ��⪫��show
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	Hide(OwnerID())
	Sleep(50)
	Show(OwnerID(),RoomID)
end

function FN_JPSummer_SeaFood_back()
	Sleep(15)
	AddBuff( TargetID() ,509692,0 ,2)
	ScriptMessage(TargetID(),TargetID(),1,"[FN_JPSUMMER_SEA_Q01]", C_SYSTEM  )
	Sleep(30)
	ChangeZone( TargetID(), 2 , 0 , 4980, 103, -1799, 322)
end