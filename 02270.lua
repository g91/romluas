--======================================================================================================
--�P�ڪ���ܡA���bLuaAS_423809_05(�p�Ǫ�)���U
--======================================================================================================
--(1)
--AddSpeakOption(OwnerID(),TargetID(),"[SC_423894_0]","LuaZ13WS_117328_0",0)
--xx�ڪ��A�z�n�A�ܺa����{�����ļwŻ�i���B�̡ͭC
function LuaZ13WS_117328_0()
	SetSpeakDetail(OwnerID(),"[SC_423894_1]")
	--�w��A�Ө����ļw��ڡA�~�����_�I�̡C
	SetFlag(OwnerID(),544744,1)
end 

--(2)
--if CheckAcceptQuest(OwnerID(),423830)==true	then
--AddSpeakOption(OwnerID(),TargetID(),"[SC_423830_0]","LuaZ13WS_117328_1",0)
--���@�N�[�J���d��ʡA�аݸӱq��B�ۤ�H
--end 
function LuaZ13WS_117328_1()
	SetSpeakDetail(OwnerID(),"[SC_423830_1]")
	--���l�e�観�Ӥ���A���O�D�s���_�ޡA�A�����q������d�_�C�A�q���f�X�h����A�L�����e���A�N��ݨ�椺���T�覺�쪺����A�D�_���J�f�b�����C
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423830_2]","LuaZ13WS_117328_2",0)
	--�n���A�ڱN�e�h���d�D�s���`���ʪ���]�C
end 

function LuaZ13WS_117328_2()
	CloseSpeak(OwnerID())
end 
---------------
function LuaZ13WS_423830_0()
	SetPlot(OwnerID(),"range","LuaZ13WS_423830_1",200 )
end 

function LuaZ13WS_423830_1()
	Beginplot(TargetID(),"LuaZ13WS_423830_2",0)
end 

function LuaZ13WS_423830_2()
	SetPlot(TargetID(),"range","LuaZ13WS_423830_0",0 )
	Local X = ReadRoleValue(TargetID(),EM_RoleValue_X)
	Local Y = ReadRoleValue(TargetID(),EM_RoleValue_Y)
	Local Z = ReadRoleValue(TargetID(),EM_RoleValue_Z)
	if	CheckAcceptQuest(TargetID(),423830)==true		and
		CheckCompleteQuest(TargetID(),423830)==false	and
		Checkflag(TargetID(),544735)== false		then
		Local Snake1  = CreateObj ( 105162 , X+100 , Y , Z+100 , 0 , 1) 
		Local Snake2  = CreateObj ( 105157 , X+150 , Y , Z+50 , 0 , 1)   
		Local Snake3  = LuaFunc_CreateObjByObj( 105348, OwnerID() )
		Local Snake4  = CreateObj ( 105157 , X+100 , Y , Z , 0 , 1)  
		ks_ActSetMode( Snake1)
		ks_ActSetMode( Snake2)
		ks_ActSetMode( Snake3)
		ks_ActSetMode( Snake4)
		BeginPlot(Snake1,"LuaZ13WS_423830_3",0)
		BeginPlot(Snake2,"LuaZ13WS_423830_3",0)
		BeginPlot(Snake3,"LuaZ13WS_423830_3",0)
		BeginPlot(Snake4,"LuaZ13WS_423830_3",0)
		ScriptMessage(TargetID(),TargetID(),2,"[SC_423830_3]",0)
		ScriptMessage(TargetID(),TargetID(),0,"[SC_423830_3]",0)
		-- �D�s�����q�A���e�g�L�A�Ъ`�N�D�Ӫ���V�C
		Sleep(200)
		Delobj(Snake1)
		Delobj(Snake2)
		Delobj(Snake3)
		Delobj(Snake4)
		BeginPlot(OwnerID(),"LuaZ13WS_423830_5",0)
	end 
end

function LuaZ13WS_423830_3()
	DW_MoveToFlag(OwnerID(),780878,1,0,1)
end 

function LuaZ13WS_423830_5()
	Sleep(60)
	SetPlot(OwnerID(),"range","LuaZ13WS_423830_1",200 )
end 


--���D�}
function  LuaZ13WS_423830_flag0()
	SetPlot(OwnerID(),"range","LuaZ13WS_423830_flag1",80 )
end 

function LuaZ13WS_423830_flag1()
	if	CheckAcceptQuest(OwnerID(),423830)==true		and
		CheckCompleteQuest(OwnerID(),423830)==false	and
		Checkflag(OwnerID(),544735)== false		then
		SetFlag(OwnerID(),544735,1)
		ScriptMessage(TargetID(),TargetID(),2,"[SC_423830_4]",0)
		ScriptMessage(TargetID(),TargetID(),0,"[SC_423830_4]",0)
		--�A�o�{�e�観�ө_�Ǫ��۬W�A�o�X�O�H������ê������C
	end
end 


--======================================================================================================
--���D�I��
--======================================================================================================

function LuaZ13WS_423832_0()	
	--���b�@�Ϊ��~���Ҫ��U>���~�ϥ�>�ϥήĪG�����GServer�ݼ@��>�ϥήĪG
	Beginplot(TargetID(),"LuaZ13WS_423832_1",0)
end

function LuaZ13WS_423832_1()
	if	CountBodyItem(TargetID(),209021)>0	and
		CountBodyItem(TargetID(),209022)>0	then
		GiveBodyItem( TargetID() ,209023 , 1 )
		UseItemDestroy()	
		--�Ҫ������n�Ŀ�_�i����_�A�����O�i�R���ϥΤ������~�A�̦n��b���F�s���~����A�o�ˤ~���|���ª��α��A�s���o���J�U���~�p�C
		DelBodyItem(TargetID(),209021,1)
		DelBodyItem(TargetID(),209022,1)
	else
		if	CountBodyItem(TargetID(),209021)<1	then
			ScriptMessage( TargetID(), TargetID(), 2,"[SC_423832_0]", 0 )	
			ScriptMessage( TargetID(), TargetID(), 0,"[SC_423832_0]", 0 )
			--�A�ʤ�[209021],�L�k�s�@[209023]�C
		end
		if	CountBodyItem(TargetID(),209022)<1	then
			ScriptMessage( TargetID(), TargetID(), 2,"[SC_423832_1]", 0 )	
			ScriptMessage( TargetID(), TargetID(), 0,"[SC_423832_1]", 0 )
			--�A�ʤ�[209022],�L�k�s�@[209023]�C
		end
	end
end	
	

--======================================================================================================
--�M�I����
--======================================================================================================

function LuaZ13WS_423834_accept_0()
	DisableQuest(OwnerID(), true )
	AddBuff(TargetID(),508928,1,600)
	local Sapans= LuaFunc_CreateObjByObj( 117355 , OwnerID() )
	local Waysli=Lua_DW_CreateObj("flag" ,115400,780810,2)
	DisableQuest(Sapans, true )
	DisableQuest(Waysli, true )
	Hide(Sapans)
	Hide(Waysli)
	Show(Sapans,0)
	Show(Waysli,0)
	if	CheckBuff(TargetID(),508932)==true	then
		Cancelbuff(TargetID(),508932)
	end
	if	CheckBuff(TargetID(),508933)==true	then	
		Cancelbuff(TargetID(),508933)
	end
	DisableQuest(Sapans, true )
	BeginPlot(Sapans,"LuaZ13WS_423834_accept_1",0)
	Sleep(15)
	BeginPlot(Waysli,"LuaZ13WS_423834_accept_1",0)
	Sleep(80)
	Delobj(Sapans)
	Delobj(Waysli)
	Cancelbuff(TargetID(),508928)
	DisableQuest(OwnerID(), false )
end

function LuaZ13WS_423834_accept_1()
	WriteRoleValue(OwnerID(), EM_RoleValue_IsWalk, 1)
	DW_MoveToFlag(OwnerID(),780810,1,0,1)
end 

--======================================================================================================
--���j���ǰe�N
--======================================================================================================
function LuaZ13WS_423835_0()
	LoadQuestOption(OwnerID())
--	say(OwnerID(),"OO")
	if	CheckAcceptQuest(OwnerID(),423835)==true		and
		CheckCompleteQuest(OwnerID(),423835)==false	and
		CountBodyItem(OwnerID(),209148)==0		then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423835_0]","LuaZ13WS_423835_1",0)
		--�A�n�A�ǰe�v[117357]�n�ڹL�ӦV�A���@�Ө��ߡC
	
	end
end 

function LuaZ13WS_423835_1()
	SetSpeakDetail(OwnerID(),"[SC_423835_1]")	
	--��A�A�O�즸�ϥζǰe�}���_�I�̡A�O���Oı�o�ǰe�}�ܯ��_�ڡH�H��A�@�w�|�ߺD���A�o�ӥ@�ɬO�ܤj���A���F�ǰe�}����A
	--�A�n�h���̳��ܤ�K�A���L�A�p�G�����ɶ����ܡA���٬O������w�ڰʦۤv���}���h�ت��a�A�ǰe�}�i�S��k���ڲD���B����M�᭻�o
	GiveBodyItem(OwnerID(),209148,1)
end 


--======================================================================================================
--�L��
--======================================================================================================
function LuaZ13WS_423836_0()

	if 	CheckBuff(TargetID(),509020)==true	then
		CancelBuff(TargetID(),509020)
		AddBuff(TargetID(),509020,1,120)
	else
		AddBuff(TargetID(),509020,1,120)
	end 
	sleep(20)
	ScriptMessage( TargetID(), TargetID(), 2,"[SC_423836_1]", 0 )	
	ScriptMessage( TargetID(), TargetID(), 0,"[SC_423836_1]", 0 )
			--�ɶ������H�A�A�̦n���֦�ʡA�O���L�ײD�F�I�I
	sleep(20)
	ScriptMessage( TargetID(), TargetID(), 2,"[SC_423836_2]", 0 )	
	ScriptMessage( TargetID(), TargetID(), 0,"[SC_423836_2]", 0 )
			--(���ɥ��ȡA�w�}�l�˼ƭp��)
end

function LuaZ13WS_423836_R0()
	SetPlot(OwnerID(),"range","LuaZ13WS_423836_R1",80 )
end

function LuaZ13WS_423836_R1()
	if	CheckAcceptQuest(OwnerID(),423836)==true		and
		CheckCompleteQuest(OwnerID(),423836)==false	and
		CheckFlag(OwnerID(),544774)==false		and
		CountBodyItem(OwnerID(),209149)>0		then
			if	CheckBuff(OwnerID(),509020)==true	then
				SetFlag(OwnerID(),544774,1)
			else
				ScriptMessage( OwnerID(), OwnerID(), 2,"[SC_423836_0]", 0 )	
				ScriptMessage( OwnerID(), OwnerID(), 0,"[SC_423836_0]", 0 )
				--��@�A�L�ײD�F�A�Щ����ȦA���դ@���C
			end
	end
end  

function LuaZ13WS_423836_R2()
	local Obj = OwnerID()	
	local Target = TargetID()		
	CancelBuff(Target,509020)		--�������ȴN���ݭnbuff
end

--======================================================================================================
--�H�� 
--======================================================================================================
function LuaZ13WS_423837_209150_ItemUse()	
	--���b�@�Ϊ��~���Ҫ��U>���~�ϥ�>�ϥήĪG�����GServer�ݼ@��>�ϥήĪG
	Beginplot(TargetID(),"LuaZ13WS_423837_209150_ItemUse_1",0)
end

function LuaZ13WS_423837_209150_ItemUse_1()
	ClearBorder( TargetID() );		
	AddBorderPage( TargetID(), "[SC_423837]" )
	--�˷R���B�͡A�ڱo���A�A�u�O�ӭn�o���_�I�̡A���ߧU�H�A�����}���A���G�������D�J��A�N�����F�A���ļw�ڪ��]�`�V�ڴ��_�A�A��A�g�����f�C
	--���u���A�A���ڷQ�_�ڦ~�����ɭԡC
	--�o�઺�D�a���D�w�����j�w�A���A�o�˪��H�~�����~�򩹫e���A�ﱵ��L���D�ԡC
	--���֧A�A�e�~���j���~���H�I
	--��宪�[117303] 
	ShowBorder( TargetID(), 0, "[209150]", "ScriptBorder_Texture_Paper" )
	if	CountBodyItem(TargetID(),209150)>0	then
		GiveBodyItem( TargetID() ,209151 , 1 )
		GiveBodyItem( TargetID() ,209152 , 1 )
		UseItemDestroy()	
		--�Ҫ������n�Ŀ�_�i����_�A�����O�i�R���ϥΤ������~�A�̦n��b���F�s���~����A�o�ˤ~���|���ª��α��A�s���o���J�U���~�p�C
		DelBodyItem(TargetID(),209150,1)
	end
end
function LuaZ13WS_423837_209152_ItemUse()
	ClearBorder( OwnerID() );		
	AddBorderPage( OwnerID(), "[SC_423837]" )
	ShowBorder( OwnerID(), 0, "[209150]", "ScriptBorder_Texture_Paper" )
end







		
















