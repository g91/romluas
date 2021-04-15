function FN_FairyTale_check()
	local StoryElement = {507289,507290,507291,507292,507293,507294,507295,507296,507297,507298,507299,507300,507301,507302,507303,507304,507305}
	local StoryPackA = {	[1]={507289,507290,507290};
				[2]={507291,507292,507293};
				[3]={507294,507295,507296};
				[4]={507293,507297,507298};
				[5]={507289,507293,507299};
				[6]={507289,507294,507302};	
				[7]={507293,507298,507304}	}
	local StoryPackB = {	[1]={507291,507291,507294,507300};
				[2]={507290,507297,507301,507302};
				[3]={507301,507304,507305,507305};
				[4]={507290,507299,507302,507305};
				[5]={507298,507301,507304,507304};
				[6]={507289,507289,507299,507305}	}
	local StoryPackC = {	[1]={507292,507292,507292,507295,507298};
				[2]={507294,507300,507300,507300,507301};
				[3]={507292,507293,507297,507297,507304};
				[4]={507290,507294,507296,507299,507302}	}
	local StoryPackD = {	[1]={507291,507303,507303,507303,507303,507303};
				[2]={507295,507295,507298,507300,507301,507302};
				[3]={507291,507296,507296,507296,507297,507299}	}
	local StoryTitleA = { 530756,530757,530758,530759,530760,530761,530762 }
	local StoryTitleB = { 530763,530764,530765,530766,530767,530768 }
	local StoryTitleC = { 530769,530770,530771,530772 }
	local StoryTitleD = { 530773,530774,530775 }
	--����Ƴ]�w
	local TempPack = {}
	local RunPack = {}
	local RunTitle = {}

	local PartyNum = GetPartyID(OwnerID() , -1)	--Ū�����a����H��
	local PlayerGroup = {}
--	Say(OwnerID(),"PartyNum="..PartyNum)
	for i= 1, PartyNum do
		local player = GetPartyID(OwnerID() , i)
		for j= 1, table.getn( StoryElement) do
			if CheckBuff( player, StoryElement[j]) == TRUE then
--				Say(player,"Buff=".."["..StoryElement[j].."]")
				table.insert( TempPack, StoryElement[j] )
				table.insert( PlayerGroup, player )
				break
			end
		end
	end
	--
--	Say(OwnerID(),"TempPack Num="..table.getn(TempPack))
--	for f=1,table.getn(TempPack) do
--		Say(OwnerID(),"Check TempPack "..f.." = ".."["..TempPack[f].."]")
--	end
	for j=1,table.getn(TempPack) do
--		Say(OwnerID(),"ReGroup "..j.." time")
		for z= table.getn(TempPack),2, -1 do
--			Say(OwnerID(),"Run TempPack "..z.." = ".."["..TempPack[z].."]".."("..TempPack[z]..")")
--			Say(OwnerID(),"Run TempPack "..(z-1).." = ".."["..TempPack[z-1].."]".."("..TempPack[z-1]..")")
			if TempPack[z] < TempPack[z-1] then
				local X = TempPack[z-1]
				TempPack[z-1] = TempPack[z]
				TempPack[z] = X
--				Say(OwnerID(),"change!")
			end
		end
	end
--	for r=1,table.getn(TempPack) do
--		Say(OwnerID(),"Final Check TempPack "..r.." = ".."["..TempPack[r].."]")
--	end
	--
	if table.getn(TempPack) == 3 then
		RunPack = StoryPackA
		RunTitle = StoryTitleA
	elseif table.getn(TempPack) == 4 then
		RunPack = StoryPackB
		RunTitle = StoryTitleB
	elseif table.getn(TempPack) == 5 then
		RunPack = StoryPackC
		RunTitle = StoryTitleC
	elseif table.getn(TempPack) == 6 then
		RunPack = StoryPackD
		RunTitle = StoryTitleD
	end
	--
	for i=1,table.getn(RunPack) do	--�˴��C�@�ӲզX
		local check = TRUE
		for j=1,table.getn(RunPack[i]) do	--��զX���e�@���
			if RunPack[i][j] ~= TempPack[j] then
				check = FALSE
				break
			end
		end
		if check == TRUE then
			for h=1,table.getn(PlayerGroup) do
				GiveBodyItem( PlayerGroup[h], RunTitle[i], 1 )
			end
		end
	end
end

--===================NPC 119137===================
function FN_FairyTale_NPC119137()
	SetSpeakDetail(OwnerID(),"[FN_FAIRYTALE_2011_01]")
	AddSpeakOption(OwnerID(),TargetID(),"[FN_FAIRYTALE_2011_02]","FN_FairyTale_NPC119137_teach",0)
	AddSpeakOption(OwnerID(),TargetID(),"[FN_FAIRYTALE_2011_03]","FN_FairyTale_NPC119137_GiveBuff",0)
	if CountBodyItem(OwnerID(),530752) == 0 then
		AddSpeakOption(OwnerID(),TargetID(),"[FN_FAIRYTALE_2011_06]","FN_FairyTale_NPC119137_final",0)
	end
end

function FN_FairyTale_NPC119137_teach()
	SetSpeakDetail(OwnerID(),"[FN_FAIRYTALE_2011_02_2]")
end

function FN_FairyTale_NPC119137_GiveBuff()
	CloseSpeak(OwnerID())
	if CountBodyItem(OwnerID(),240607) <= 0 then
		GiveBodyItem(OwnerID(),240607,1)
	end
	--
	if CheckFlag(OwnerID(),545537) == TRUE then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[FN_FAIRYTALE_2011_05]", 0  )
		return
	end
	--
	local StoryElement = {507289,507290,507291,507292,507293,507294,507295,507296,507297,507298,507299,507300,507301,507302,507303,507304,507305}
	local RanStory = DW_Rand(table.getn(StoryElement))

	for i=1,table.getn(StoryElement) do
		if CheckBuff(OwnerID(),StoryElement[i]) == TRUE then
			CancelBuff(OwnerID(),StoryElement[i])
		end
	end
	AddBuff(OwnerID(),StoryElement[RanStory],0,86400)
	ScriptMessage( OwnerID(), OwnerID(), 1, "[FN_FAIRYTALE_2011_04][$SETVAR1=".."["..StoryElement[RanStory].."]".."]", C_SYSTEM  )
	ScriptMessage( OwnerID(), OwnerID(), 0, "[FN_FAIRYTALE_2011_04][$SETVAR1=".."["..StoryElement[RanStory].."]".."]", C_SYSTEM  )
	SetFlag(OwnerID(),545537,1)
end

function FN_FairyTale_NPC119137_final()
	local TitleTable = { 530756,530757,530758,530759,530760,530761,530762,530763,530764,530765,530766,530767,530768,530769,530770,530771,530772,530773,530774,530775 }
	local TitleCheck = TRUE

	for i=1,table.getn(TitleTable) do
		if countBodyItem( OwnerID(), TitleTable[i] ) == 0 then
			TitleCheck = FALSE
			break
		end
	end

	if TitleCheck == TRUE then
		GiveBodyItem( OwnerID(), 530752, 1 )
	else
		ScriptMessage( OwnerID(), OwnerID(), 1, "[FN_FAIRYTALE_2011_07]", 0  )
	end
	CloseSpeak(OwnerID())
end
--===================NPC 119137���y===================
function FN_FairyTale_NPC119138()
	local Language = GetServerDataLanguage() 
--	if Language ~= "rw" then  -- �x���M�ݨS�����m�ﶵ  ���ե�
	if Language ~= "tw" then  -- �x���M�ݨS�����m�ﶵ  ������
		SetSpeakDetail(OwnerID(),"[FN_FAIRYTALE_NPC119138_1]")  -- �@����  ��L��a�y�t���
	else
		SetSpeakDetail(OwnerID(),"[FN_FAIRYTALE_NPC119138_1_TW]")  -- �@���� tw�����
	end

	-- 2013. 07.23 6.0.1 �����_ �s�W�x���ݨD - �B�����m��I���ﶵ -----------

	AddSpeakOption(OwnerID(),TargetID(),"[FN_FAIRYTALE_NPC119138_2]","FN_FairyTale_NPC119138_give1",0) --�I��§�]
--	if Language ~= "rw" then  -- �x���M�ݨS�����m�ﶵ  ���ե�
	if Language ~= "tw" then  -- �x���M�ݨS�����m�ﶵ  ������
		AddSpeakOption(OwnerID(),TargetID(),"[FN_FAIRYTALE_NPC119138_3]","FN_FairyTale_NPC119138_give2",0) --�I�����m��
	end
	---------------------------------------------------------------------------------
end

function FN_FairyTale_NPC119138_give1()	--�I��§�]
	local Owner = OwnerID()
	if CountBodyItem(Owner,240059) >= 15 then
		local R = DW_Rand(100)
		DelBodyItem(Owner,240059,15)
		GiveBodyItem(Owner,242790,1)
		if R >= 80 then  --20%���v���o������, (�`) 2014/08/29 �s�W6.1.1
			GiveBodyItem( Owner , 240617 , 1 )
		end
		if R >=98 then
			GiveBodyItem( Owner , 241458 , 1)  --3%���v������l���~����, (�`) 2014/08/29 �s�W6.1.1
		end
	else
		ScriptMessage( OwnerID(), OwnerID(), 1, "[FN_JPSUMMER_NOTENOUGH][$SETVAR1=".."["..(240059).."]".."]", 0  )
	end
	CloseSpeak(OwnerID())
end

function FN_FairyTale_NPC119138_give2()	--�I�����m��
	if CountBodyItem(OwnerID(),203784) >= 3 then
		DelBodyItem(OwnerID(),203784,3)
		GiveBodyItem(OwnerID(),240043,1)
	else
		ScriptMessage( OwnerID(), OwnerID(), 1, "[FN_JPSUMMER_NOTENOUGH][$SETVAR1=".."["..(203784).."]".."]", 0  )
	end
	CloseSpeak(OwnerID())
end

function FN_FairyTale_Item203651()
	local GiftNum = DW_Rand(100)
	if GiftNum<= 10 then
	--	GiveBodyItem(OwnerID(),725747,1)
		GiveBodyItem(OwnerID(),241458,1)	-- 6.0.3 ����קאּ�����|�B�~3%���v���o ��l���~����
	end

--	GiveBodyItem(OwnerID(),725649,1)
	GiveBodyItem(OwnerID(),725742,1)
	GiveBodyItem(OwnerID(),241481,15)
end

function FN_FairyTale_Item240617_Check()
	if CountBodyItem(OwnerID(),530723) >= 1 then
		return FALSE
	end
	return TRUE
end

function FN_FairyTale_Item240617()
	GiveBodyItem(OwnerID(),530723,1)
end
--===================���ե�===================
function FN_story(num)
	local StoryElement = {507289,507290,507291,507292,507293,507294,507295,507296,507297,507298,507299,507300,507301,507302,507303,507304,507305}
	for i=1,table.getn(StoryElement) do
		CancelBuff(OwnerID(),StoryElement[i])
	end
	for i=1,table.getn(StoryElement) do
		if num == StoryElement[i] then AddBuff(OwnerID(),StoryElement[i],0,-1) end
	end
end