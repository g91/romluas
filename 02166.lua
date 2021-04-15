function LuaS_MK_116818()
	LoadQuestOption( OwnerID() )
	AdjustFaceDir(TargetID(),OwnerID(),0)
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_116818_1]", 	"LuaS_MK_116818_1", 0 )		--(�߰�����o�ǻj��)
end

function LuaS_MK_116818_1()
	SetSpeakDetail(OwnerID(),"[SC_116818_2]")								--�A�n��o�ǻj��H�A�q�o�̩����䨫�A�b�ªh����N�i�H�ݨ�F�C
end														


function LuaS_MK_116824()
	LoadQuestOption( OwnerID() )
	AdjustFaceDir(TargetID(),OwnerID(),0)
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_116824_1]", 	"LuaS_MK_116824_1", 0 )		--(�߰����󯫼q)
end

function LuaS_MK_116824_1()

	SetSpeakDetail(OwnerID(),"[SC_116824_2]")								--�����O���q�A���]�u�O�ڭ̪��٩I�Ӥw�A��ڤW���y�ؿv�����\����¬O�g...
end

function LuaS_MK_116825()
	LoadQuestOption( OwnerID() )
	AdjustFaceDir(TargetID(),OwnerID(),0)
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_116825_1]", 	"LuaS_MK_116825_1", 0 )		--(�߰�������)
end

function LuaS_MK_116825_1()
	SetSpeakDetail(OwnerID(),"[SC_116825_2]")								--����H���D�A�墨��񦳿���H
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_116825_1]", 	"LuaS_MK_116825_2", 0 )		--(�߰�������)
end

function LuaS_MK_116825_2()
	if	CheckCompleteQuest(OwnerID(),423701) == true	or	CheckAcceptQuest(OwnerID(),423701) == true	then
		SetSpeakDetail(OwnerID(),"[SC_116825_know]")			
	else
		SetSpeakDetail(OwnerID(),"[SC_116825_3]")								--�j�N��񪺬�s�v�O�ڭ̦�O�J��s��
		if	CheckCompleteQuest(OwnerID(),423205) == true	then
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_116825_4]", 	"LuaS_MK_116825_3", 0 )		--(����ۤv��̨��ڡD�ƺ��O�B��)
		end
	end
end

function LuaS_MK_116825_3()
	SetSpeakDetail(OwnerID(),"[SC_116825_5]")								--
end

function LuaS_MK_116826()
	local talk = 0
	while	1	do
		PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_ROFL)
		sleep(55)
		if	talk == 0	then
			NPCSAY(OwnerID(),"[SC_116826_1]")
			talk = talk +1
		elseif	talk == 1	then
			NPCSAY(OwnerID(),"[SC_116826_2]")
			talk = talk +1
		elseif	talk == 2	then
			NPCSAY(OwnerID(),"[SC_116826_3]")
			talk = 0
		end
	end
end

function LuaS_MK_116827()
	local talk = 0
	while	1	do
		sleep(200)
		if	talk == 0	then
			NPCSAY(OwnerID(),"[SC_116827_1]")
			talk = talk +1
		elseif	talk == 1	then
			NPCSAY(OwnerID(),"[SC_116827_2]")
			talk = talk +1
		elseif	talk == 2	then
			NPCSAY(OwnerID(),"[SC_116827_3]")
			talk = 0
		end		
	end
end

function LuaS_MK_116828()
	AddBuff(OwnerID(),504935,0,-1)
	AddBuff(OwnerID(),504936,0,-1)
	SetDefIdleMotion( OwnerID() ,ruFUSION_MIME_CHANNEL_LOOP	)	
end

function LuaS_MK_116828_1()
	LoadQuestOption( OwnerID() )
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_116828_1]", 	"LuaS_MK_116828_2", 0 )		--�A�b������H
end

function LuaS_MK_116828_2()
	SetSpeakDetail(OwnerID(),"[SC_116828_2]")								--�ݤ��X�ӶܡH�ڦb���L�v���A�P��b�o��ê�ơA���p�h���L�ݭn�������H�a�I
end

function LuaS_MK_116837()
	local cookie = LuaFunc_SearchNPCbyOrgID( OwnerID() ,116835  , 1000 , 0)	--�HOwnerID�����߷j�M�d��RANGE���ؼ�NPC�ҪOID
	local cookie2 = LuaFunc_SearchNPCbyOrgID( OwnerID() ,116836  , 1000 , 0)	--�HOwnerID�����߷j�M�d��RANGE���ؼ�NPC�ҪOID
	--�ŧicookie��LuaFunc_SearchNPCbyOrgID(�]�N�O�n�Ψӷ�j�M���ߪ�NPC)
	WriteRoleValue( OwnerID(), EM_RoleValue_Register+1, cookie )
	WriteRoleValue( OwnerID(), EM_RoleValue_Register+2, cookie2 )
	setplot(OwnerID(),"range","LuaS_MK_116837_2",60) --�]�w�d��@��
end

function LuaS_MK_116837_2()
	local cookie1 = ReadRoleValue( TargetID(), EM_RoleValue_Register+1)
	local cookie2 = ReadRoleValue( TargetID(), EM_RoleValue_Register+2)
	if	ReadRoleValue( TargetID() , EM_RoleValue_Register+3 ) == 0	then
		WriteRoleValue( TargetID(), EM_RoleValue_Register+3, 1 )
		AdjustFaceDir( TargetID() ,OwnerID(),0 ) --��cookie����OWNERID
		PlayMotion(TargetID() , ruFUSION_ACTORSTATE_EMOTE_POINT)	--��cookie����
		sleep(5)
		NPCSAY(TargetID(),"[SC_423582_1]")
		sleep(25)
		WriteRoleValue( TargetID(), EM_RoleValue_Register+3, 0 )
	end
	SetPosByFlag( OwnerID(), 780799 , 1 )		--�NOwnerID�ǰe�ܺX�Ц�m
	AddBuff(OwnerID(),503977,0,-1)
	if	ReadRoleValue( cookie1 , EM_RoleValue_Register+1 ) == 0	then
		WriteRoleValue( cookie1, EM_RoleValue_Register+1, 1 )
		AdjustFaceDir( cookie1 ,OwnerID(),0 ) --��cookie����OWNERID	
		AdjustFaceDir( cookie2 ,OwnerID(),0 ) --��cookie����OWNERID	
		PlayMotion(cookie1 , ruFUSION_ACTORSTATE_EMOTE_POINT)	--��cookie����
		NPCSAY(cookie1,"[SC_116837_1]")		
		sleep(30)
		PlayMotion( cookie2,ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )
		NPCSAY(cookie2 ,"[SC_116837_2]")
		sleep(30)		
		WriteRoleValue( cookie1, EM_RoleValue_Register+1, 0 )
	end
	CancelBuff(OwnerID(),503977)
end

function LuaS_MK_117057()
	while	1	do
		PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_STRETCH)
		sleep(140)
	end
end

function LuaS_MK_117060()
	while	1	do
		sleep(50)
		NPCSAY(OwnerID(),"[SC_117060_1]")
		PlayMotion(OwnerID(),	ruFUSION_ACTORSTATE_EMOTE_SPEAK)


		sleep(150)
	end
end

function LuaS_MK_117062()
	local temp = 0
	while	1	do
		PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_BEG)
		if	temp == 0	then
			NPCSAY(OwnerID(),"[SC_117062_1]")
			temp = temp +1
		else
			NPCSAY(OwnerID(),"[SC_117062_2]")
			temp = temp -1			
		end
		sleep(100)
	end
end

function LuaS_MK_117064()
	PlayMotionEX( OwnerID(),ruFUSION_ACTORSTATE_COMBAT_UNARMED, ruFUSION_ACTORSTATE_COMBAT_UNARMED)
	while	1	do
		NPCSAY(OwnerID(),"[SC_117064_1]")
		PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_ATTACK_UNARMED)
		sleep(20)
		PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_ATTACK_UNARMED_SP)		
		sleep(180)	
	end
end

function LuaS_MK_117065()
	while	1	do
		PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_ANGRY)
		sleep(70)
	end
end

function LuaS_MK_117065_C()
	LoadQuestOption( OwnerID() )
	setflag(OwnerID(),544645,1)	
end

function LuaS_MK_117066()
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_DYING,ruFUSION_ACTORSTATE_DEAD)
	while	1	do
		NPCSAY(OwnerID(),"[SC_117066_1]")
		sleep(rand(70)+140)
	end
end

function LuaS_MK_117066_C()
	LoadQuestOption( OwnerID() )
	if	CheckFlag(OwnerID(),544645) == true	then
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_117066_2]", 	"LuaS_MK_117066_C_2", 0 )		--�A�ѱC�b��A		
	end
end

function LuaS_MK_117066_C_2()
	SetSpeakDetail(OwnerID(),"[SC_117066_3]")								--�ڦѱC?
end

function LuaS_MK_117067()
	while	1	do
		sleep(70)
		PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_VICTORY)
		NPCSAY(OwnerID(),"[SC_117067_1]")
		sleep(rand(50)+50)
		PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_LAUGH)
	end	
end



function LuaS_MK_117071()
	if	CheckCompleteQuest(OwnerID(),423578) == true	then
		SetSpeakDetail(OwnerID(),"[SC_117071_1]")	
	else
		LoadQuestOption( OwnerID() )								--	
	end
end

function LuaS_MK_117100()
	AddBuff( OwnerID() ,502280,1 ,-1)
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_CROUCH_BEGIN,ruFUSION_ACTORSTATE_CROUCH_LOOP)	
end

function LuaS_MK_117045()
	while	1	do
		 PlayMotion( OwnerID(),   ruFUSION_ACTORSTATE_EMOTE_DANCE)
		sleep(57)
	end
end

function LuaS_MK_116970()
	sleep(10)
	local snake = {}
	for i = 1 , 4 , 1 do
		snake[i] = Lua_DW_CreateObj("flag" , 116490 ,780803,i)
		SetDefIdleMotion( snake[i] , ruFUSION_MIME_IDLE_STAND_02 )	
		Lua_ObjDontTouch( snake[i] )
--		say(snake[i-1],"i am "..i)
	end
--	say(OwnerID(),snakeNum)	
	while	1	do
		for i = 1 , 4 , 1 do
			PlayMotion( snake[i] ,   ruFUSION_ACTORSTATE_ATTACK_UNARMED)
			sleep(10)	
		end
		for i = 1 , 4 , 1 do
			PlayMotion( snake[i] ,   ruFUSION_ACTORSTATE_BUFF_SP01)
			sleep(10)	
		end
		for i = 1 , 4 , 1 do
			DW_MoveToFlag( snake[i]  , 780803, 4+i , 0,0  )
		end
		for i = 1 , 4 , 1 do
			DW_MoveToFlag( snake[i]  , 780803, i , 0,0)
		end
	end
	
end

function LuaS_MK_117020()
	while	1	do
		PlayMotion( OwnerID() ,   ruFUSION_ACTORSTATE_EMOTE_SPEAK)
		sleep(40)
		PlayMotion( OwnerID() ,   ruFUSION_ACTORSTATE_EMOTE_PLAY_GUITAR	)
		sleep(50)
		PlayMotion( OwnerID() ,   ruFUSION_ACTORSTATE_EMOTE_APPLAUSE)
		sleep(50)
		PlayMotion( OwnerID() ,   ruFUSION_ACTORSTATE_EMOTE_ANGRY)
		sleep(50)		
		PlayMotion( OwnerID() ,   ruFUSION_ACTORSTATE_EMOTE_APPROVAL)
		sleep(50)	
		PlayMotion( OwnerID() ,   ruFUSION_ACTORSTATE_EMOTE_BEG)
		sleep(50)			
		PlayMotion( OwnerID() ,   ruFUSION_ACTORSTATE_EMOTE_CRY)
		sleep(50)		
		PlayMotion( OwnerID() ,   ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
		sleep(50)	
		PlayMotion( OwnerID() ,   ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)
		sleep(50)
		PlayMotion( OwnerID() ,   ruFUSION_ACTORSTATE_EMOTE_LAUGH)
		sleep(50)		
		PlayMotion( OwnerID() ,   ruFUSION_ACTORSTATE_EMOTE_POINT)
		sleep(50)	
		PlayMotion( OwnerID() ,   ruFUSION_ACTORSTATE_EMOTE_PROVOKE)
		sleep(50)
		PlayMotion( OwnerID() ,   ruFUSION_ACTORSTATE_EMOTE_SALUTE)
		sleep(50)
		PlayMotion( OwnerID() ,   ruFUSION_ACTORSTATE_EMOTE_SURRENDER)
		sleep(50)
		PlayMotion( OwnerID() ,   ruFUSION_ACTORSTATE_EMOTE_THREATEN)
		sleep(50)
		PlayMotion( OwnerID() ,   ruFUSION_ACTORSTATE_EMOTE_VICTORY)
		sleep(50)
		PlayMotion( OwnerID() ,   ruFUSION_ACTORSTATE_EMOTE_WAVE)
		sleep(50)
	end
end

function LuaS_MK_116984()
	local fal = LuaFunc_SearchNPCbyOrgID( OwnerID() , 117132 , 200 , 0)
	while	1	do
		CastSpell(OwnerID(),fal,496674)
		sleep(20+rand(20))
	end	
end

function LuaS_MK_Show117049()
	local shower1 = Lua_DW_CreateObj("flag" , 117047 ,780828,1)
	local shower2 = Lua_DW_CreateObj("flag" , 117049 ,780828,3)
	while	1	do
		CallPlot( Shower1 ,"DW_MoveToFlag" , Shower1 , 780828, 2 ,0)
		DW_MoveToFlag( Shower2 , 780828, 4 ,0 )
		sleep(5)
		AdjustFaceDir(shower1,shower2,0)
		AdjustFaceDir(shower2,shower1,0)
		sleep(5)
		PlayMotion( shower1 ,   ruFUSION_ACTORSTATE_EMOTE_SALUTE2)
		PlayMotion( shower2 ,   ruFUSION_ACTORSTATE_EMOTE_SALUTE2)
		sleep(25)
		CallPlot( Shower1 ,"DW_MoveToFlag" , Shower1 , 780828, 3 ,0)
		DW_MoveToFlag( Shower2 , 780828, 1 ,0 )
		sleep(5)
		AdjustFaceDir(shower1,shower2,0)
		AdjustFaceDir(shower2,shower1,0)
		sleep(5)
		PlayMotion( shower1 ,   ruFUSION_ACTORSTATE_EMOTE_BREAKDANCE)
		PlayMotion( shower2 ,   ruFUSION_ACTORSTATE_EMOTE_BREAKDANCE)
		sleep(45)
		CallPlot( Shower1 ,"DW_MoveToFlag" , Shower1 , 780828, 5 ,0)
		DW_MoveToFlag( Shower2 , 780828, 6 ,0 )
		sleep(5)
		AdjustFaceDir(shower1,OwnerID(),0)
		AdjustFaceDir(shower2,OwnerID(),0)
		sleep(5)
		PlayMotion( shower1 ,   ruFUSION_ACTORSTATE_EMOTE_TAPDANCE)
		PlayMotion( shower2 ,   ruFUSION_ACTORSTATE_EMOTE_TAPDANCE)
		sleep(40)
		CallPlot( Shower1 ,"DW_MoveToFlag" , Shower1 , 780828, 1 ,0)
		DW_MoveToFlag( Shower2 , 780828, 3 ,0 )
		sleep(5)	
		AdjustFaceDir(shower1,OwnerID(),0)
		AdjustFaceDir(shower2,OwnerID(),0)
		sleep(5)
		PlayMotion( shower1 ,   ruFUSION_ACTORSTATE_EMOTE_WAVE)	
		PlayMotion( shower2 ,   ruFUSION_ACTORSTATE_EMOTE_WAVE)	
		sleep(20)
		PlayMotion( shower1 ,   ruFUSION_ACTORSTATE_EMOTE_WAVE)	
		PlayMotion( shower2 ,   ruFUSION_ACTORSTATE_EMOTE_WAVE)	
		sleep(40)				
	end
end

function LuaS_423587()
	SetFlag(TargetID(),544665,1)
end


function LuaS_208713_book_0()	--208281��z�L�������ɮ�
	local Str = "["..GetUseItemGUID(OwnerID()).."]"
	ClearBorder( OwnerID() )
	AddBorderPage( OwnerID(), "[SC_208713_BOOK_1]" )	--�U�@���A�r�ꬰ�ѭ�����
	AddBorderPage( OwnerID(), "[SC_208713_BOOK_2]" )	--�U�@���A�r�ꬰ�ѭ�����
	ShowBorder( OwnerID(), 0, str,"ScriptBorder_Texture_Paper" )
end

function LuaS_208748_book_0()	--208281��z�L�������ɮ�
	local Str = "["..GetUseItemGUID(OwnerID()).."]"
	if	CheckFlag( OwnerID(), 544669 ) == false	and	CheckFlag( OwnerID(), 544673 ) == false	then
		setflag(OwnerID(),544669,1)
	end
	if	CheckFlag( OwnerID(), 544669 ) == true	and	CheckFlag( OwnerID(), 544670 ) == true	and	CheckFlag( OwnerID(), 544671 ) == true	and	CheckFlag( OwnerID(), 544672 ) == true	then
		setflag(OwnerID(),544673,1)
		setflag(OwnerID(),544669,0)
		setflag(OwnerID(),544670,0)
		setflag(OwnerID(),544671,0)
		setflag(OwnerID(),544672,0)		
	end
	ClearBorder( OwnerID() )
	AddBorderPage( OwnerID(), "[SC_208748_BOOK_1]" )	--�U�@���A�r�ꬰ�ѭ�����
	AddBorderPage( OwnerID(), "[SC_208748_BOOK_2]" )	--�U�@���A�r�ꬰ�ѭ�����
	AddBorderPage( OwnerID(), "[SC_208748_BOOK_3]" )	--�U�@���A�r�ꬰ�ѭ�����
	AddBorderPage( OwnerID(), "[SC_208748_BOOK_4]" )	--�U�@���A�r�ꬰ�ѭ�����
	ShowBorder( OwnerID(), 0, str,"ScriptBorder_Texture_Paper" )
end

function LuaS_208749_book_0()	--208281��z�L�������ɮ�
	local Str = "["..GetUseItemGUID(OwnerID()).."]"
	if	CheckFlag( OwnerID(), 544670 ) == false	and	CheckFlag( OwnerID(), 544673 ) == false	then
		setflag(OwnerID(),544670,1)
	end
	if	CheckFlag( OwnerID(), 544669 ) == true	and	CheckFlag( OwnerID(), 544670 ) == true	and	CheckFlag( OwnerID(), 544671 ) == true	and	CheckFlag( OwnerID(), 544672 ) == true	then
		setflag(OwnerID(),544673,1)
		setflag(OwnerID(),544669,0)
		setflag(OwnerID(),544670,0)
		setflag(OwnerID(),544671,0)
		setflag(OwnerID(),544672,0)		
	end
	ClearBorder( OwnerID() )
	AddBorderPage( OwnerID(), "[SC_208749_BOOK_1]" )	--�U�@���A�r�ꬰ�ѭ�����
	AddBorderPage( OwnerID(), "[SC_208749_BOOK_2]" )	--�U�@���A�r�ꬰ�ѭ�����
	ShowBorder( OwnerID(), 0, str,"ScriptBorder_Texture_Paper" )
end

function LuaS_208750_book_0()	--208281��z�L�������ɮ�
	local Str = "["..GetUseItemGUID(OwnerID()).."]"
	if	CheckFlag( OwnerID(), 544671 ) == false	and	CheckFlag( OwnerID(), 544673 ) == false	then
		setflag(OwnerID(),544671,1)
	end
	if	CheckFlag( OwnerID(), 544669 ) == true	and	CheckFlag( OwnerID(), 544670 ) == true	and	CheckFlag( OwnerID(), 544671 ) == true	and	CheckFlag( OwnerID(), 544672 ) == true	then
		setflag(OwnerID(),544673,1)
		setflag(OwnerID(),544669,0)
		setflag(OwnerID(),544670,0)
		setflag(OwnerID(),544671,0)
		setflag(OwnerID(),544672,0)		
	end
	ClearBorder( OwnerID() )
	AddBorderPage( OwnerID(), "[SC_208750_BOOK_1]" )	--�U�@���A�r�ꬰ�ѭ�����
	AddBorderPage( OwnerID(), "[SC_208750_BOOK_2]" )	--�U�@���A�r�ꬰ�ѭ�����
	AddBorderPage( OwnerID(), "[SC_208750_BOOK_3]" )	--�U�@���A�r�ꬰ�ѭ�����
	ShowBorder( OwnerID(), 0, str,"ScriptBorder_Texture_Paper" )
end

function LuaS_208751_book_0()	--208281��z�L�������ɮ�
	local Str = "["..GetUseItemGUID(OwnerID()).."]"
	if	CheckFlag( OwnerID(), 544672 ) == false	and	CheckFlag( OwnerID(), 544673 ) == false	then
		setflag(OwnerID(),544672,1)
	end
	if	CheckFlag( OwnerID(), 544669 ) == true	and	CheckFlag( OwnerID(), 544670 ) == true	and	CheckFlag( OwnerID(), 544671 ) == true	and	CheckFlag( OwnerID(), 544672 ) == true	then
		setflag(OwnerID(),544673,1)
		setflag(OwnerID(),544669,0)
		setflag(OwnerID(),544670,0)
		setflag(OwnerID(),544671,0)
		setflag(OwnerID(),544672,0)		
	end
	ClearBorder( OwnerID() )
	AddBorderPage( OwnerID(), "[SC_208751_BOOK_1]" )	--�U�@���A�r�ꬰ�ѭ�����
	AddBorderPage( OwnerID(), "[SC_208751_BOOK_2]" )	--�U�@���A�r�ꬰ�ѭ�����
	AddBorderPage( OwnerID(), "[SC_208751_BOOK_3]" )	--�U�@���A�r�ꬰ�ѭ�����
	ShowBorder( OwnerID(), 0, str,"ScriptBorder_Texture_Paper" )
end

function LuaS_MK_117213()
	LoadQuestOption( OwnerID() )
	AddSpeakOption( OwnerID(), TargetID(), "[SC_117213_1]" , "LuaS_MK_117213_1",0 )
	MoveToFlagEnabled(OwnerID(),false)
end

function LuaS_MK_117213_1()
	AdjustFaceDir(TargetID(),OwnerID(),180)
	SetSpeakDetail(OwnerID(),"[SC_117213_2]")
	AddSpeakOption( OwnerID(), TargetID(), "[SC_117213_3]" , "LuaS_MK_117213_2",0 )	
end

function LuaS_MK_117213_2()
	AdjustFaceDir(TargetID(),OwnerID(),0)
	SetSpeakDetail(OwnerID(),"[SC_117213_4]")
	AddSpeakOption( OwnerID(), TargetID(), "[SC_117213_1]" , "LuaS_MK_117213_1",0 )	
end

function Lua_Zone19_MK_CheckNotBoss()
	local a = ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) 
	if	a == 104705	or	a == 104916	or	a == 116392	or	a==107187	or a==107189	or a==104989 or a==107188 then
		return	false
	else
		return	true
	end
end

