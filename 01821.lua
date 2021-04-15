function Lua_207183() --�߻y����ä
	BeginPlot( OwnerID(), "Lua_207183_do", 0 )
end

function Lua_207183_do() --�߻y����ä
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_207183_1]", C_SYSTEM );
	Sleep(80)
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_207183_2]", C_SYSTEM );
	GiveBodyItem( OwnerID(), 543909, 1)
end
------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_207160() --�{�䪺�㰩��
	BeginPlot( OwnerID(), "Lua_207160_do", 0)
end

function Lua_207160_do()
	local result
	if CountBodyItem ( OwnerID(), 207160 )  >9 then
		BeginCastBar( OwnerID(), "[SYS_GAMEMSGEVENT_163]", 50, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0 )
		while true do
			sleep( 2 )
			local CastBarStatus = CheckCastBar( OwnerID() )
			if  CastBarStatus > 0 then
				result = "OK"
				EndCastBar( OwnerID() , CastBarStatus )
				break
			elseif CastBarStatus < 0 then
				EndCastBar( OwnerID() , CastBarStatus )
				break
			end			
		end
	else
		ScriptMessage( OwnerID(),OwnerID(),1,"[SC_0908SEANSON_26]",0) --�A�ҫ������~�ƶq�����C
	end
	
	if ( result == "OK" ) then
		DelBodyItem( OwnerID(), 207160, 10)
		GiveBodyItem( OwnerID(), 207195, 1 )	
	end	
end
------------------------------------------------------------------------------------------------------------------------------------------------------

function Lua_207195() 
	BeginPlot( OwnerID(), "Lua_207195_1", 0)	
end

function Lua_207195_1()
	local target = LuaFunc_SearchNPCbyOrgID( OwnerID(), 115055, 200 , 0) --�j�M"200"�d�򤺪�����"100103"
	if target ~= -1 then		
		local meat = LuaFunc_CreateObjByObj ( 115025, target ) --�гy"��115025"�b"�ؼЦ�mtarget"
		AddToPartition( meat , 0 )
		DelBodyItem( OwnerID(), 207195, 1) --�R�����~
		ScriptMessage( TargetID(), TargetID(), 1, "[SC_207195]", 0 )--���ݬ��⪺�o����...
		CallPlot( OwnerID(), "Lua_207195_2", meat )
	else
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SYS_SUITSKILL_POS_ERROR]", 0 ) --��m���~!!
	end
end

function Lua_207195_2(meat)
	sleep(30)
	local Monster = LuaFunc_CreateObjByObj ( 103590, meat ) --�b���w��m���ͩǪ�"103590" 
	AddToPartition( Monster, 0 )
	sleep(20)
	DelObj( meat )
	BeginPlot(Monster,"LuaS_Discowood_CheckPeace",0) --8.5�����i�J�԰����A�N�|����
end
----------------------------------------------------------------------------------
function LuaS_423220()		--�h�W������
	LoadQuestOption( OwnerID() ) --Ū�����ȼҪ�	
	if	CheckAcceptQuest( OwnerID() ,423220 ) == true	then  --�ˬd����  		
		SetSpeakDetail(OwnerID(),"[ZONE16_K1]")  --��ܦr��]�w����
		if	 CheckFlag( OwnerID(), 543950 )==false	then --�ˬd���n�X��  
			AddSpeakOption( OwnerID(), TargetID( ), "[ZONE16_K2]" , "Lua_423220_1", 0 )		--���ӥu��H�C�ަۻ����çL��ڴ��_�p�C
		end
	elseif CheckAcceptQuest( OwnerID() ,423229 ) == true	then  --�ѻy��
		SetSpeakDetail(OwnerID(),"[ZONE16_K4]")
		if	CheckFlag( OwnerID(), 543966 ) ==false then --�ˬd���n�X��
			if	CountBodyItem ( OwnerID(), 207181 ) >0 then
				AddSpeakOption( OwnerID(), TargetID( ), "[ZONE16_K5]" , "Lua_423229_1", 0 )		--���O���A�ڥu�O�Q�аݳo���᪺�W�r�C
			end
		end
	elseif CheckAcceptQuest( OwnerID() ,423231 ) == true then --�쩵�ɶ�
		SetSpeakDetail(OwnerID(),"[ZONE16_K9]")
		if	CheckFlag( OwnerID(), 543967 ) ==false then --�ˬd���n�X��
			AddSpeakOption( OwnerID(), TargetID( ), "[ZONE16_K10]" , "Lua_423231_1", 0 )
		end
	end
end
----------------------------------------------------------------
function Lua_423229_1()--�U�@�q���
	SetSpeakDetail(OwnerID(),"[ZONE16_K6]")--���i���^�ܥ���
	AddSpeakOption( OwnerID(), TargetID( ), "[ZONE16_K7]" , "Lua_423229_2", 0 )		--�p�Q�������J�ܡH
end

function Lua_423229_2()--�U�@�q���
	SetSpeakDetail(OwnerID(),"[ZONE16_K8]")--���i���^�ܥ���
	SetFlag( OwnerID() , 543966 , 1 )--�����a�@�ӺX��
	DelBodyItem ( OwnerID(), 207181, 1 )
	GiveBodyItem ( OwnerID() , 207182, 1 )
end
------------------------------------------------------------------
function Lua_423220_1()--�U�@�q���
	SetSpeakDetail(OwnerID(),"[ZONE16_K3]")--���i���^�ܥ���
	SetFlag( OwnerID(), 543950 , 1 )--�����a�@�ӺX��
end
----------------------------------------------------------
function Lua_423231_1()--�U�@�q���
	SetSpeakDetail(OwnerID(),"[ZONE16_K11]")--���i���^�ܥ���
	SetFlag( OwnerID(), 543967 , 1 )--�����a�@�ӺX��
end

---------------------------------------------------------------------------

function Lua_115026() --���u�Y
	LoadQuestOption( OwnerID() ) --Ū�����ȼҪ�	
	if CheckAcceptQuest( OwnerID() ,423240 ) == true and CountBodyItem( OwnerID(), 207196) == 0 then
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_115026_0]" , "Lua_115026_1", 0 ) --���o��]
	end
end

function Lua_115026_1() 
	SetSpeakDetail( OwnerID() , "[SC_115026_1]" ) --�ݨӤ�Q�������٭n����ءC
	GiveBodyItem( OwnerID(), 207196, 5 )	
end


function Lua_423240(item,count) --�ͥͤ���
	if count > 0 and CheckFlag( OwnerID(), 543969 ) ~= true then
		if CountBodyItem( OwnerID() , Item) >= count  then
			DelBodyItem( OwnerID() , Item , count )
			CallPlot( OwnerID(), "Lua_423240_do", TargetID() )
			return 1
		else
			return -1
		end
	else
		return -1
	end	
end

function Lua_423240_do( target )
	if rand(5)+1 == 1 then
		ScriptMessage( OwnerID(),OwnerID(),1,"[SC_423240_1]", 0 ) --�شӦ��\
		SetFlag(OwnerID(), 543969, 1 )	--�o��ӧQ�X��
		local tree = LuaFunc_CreateObjByObj ( 115190, target ) --�b���w��m"target"���ͪ��� 
		AddToPartition( tree, 0 )
		WriteRoleValue( tree, EM_RoleValue_LiveTime, 10 )
	else
		ScriptMessage( OwnerID(),OwnerID(),1,"[SC_423240_2]", 0 ) --�شӥ���			
	end
	--CallPlot(OwnerID(), "LuaFunc_ResetObj", target)
	--WriteRoleValue( target , EM_RoleValue_PID, 0 )
end

--��e�ǳƤ@�s���������--
function LuaS_423232()	--���b���F���������Y���W
LoadQuestOption ( OwnerID() )
	if	CheckAcceptQuest	( OwnerID(), 423231 ) == true and	--���W��423231�B
		CheckCompleteQuest	( OwnerID(), 423232 ) == true  and	--�����L423232�B
		CountBodyItem ( OwnerID(), 207280 ) == 0 then --���W�S��207280 ����
		AddSpeakOption( OwnerID(), TargetID(), "[SC_423231_1]", "LuaS_423232_1",0) --�u�ڧ�F��˥�F......�v
	end
end

function LuaS_423232_1()
	SetSpeakDetail( OwnerID() , "[SC_423231_2]")	--���٥H���O�A���n�F�O�A���h�a�A�O�A�˥�F
	GiveBodyItem ( OwnerID(), 207280 , 1 )
end


function LuaS_423233()	--���b���ۭt���p�Q�ڨ��W
LoadQuestOption ( OwnerID() )
	if	CheckAcceptQuest	( OwnerID(), 423231 ) == true and	--���W��423231�B
		CheckCompleteQuest	( OwnerID(), 423233 ) == true  and	--�����L423232�B
		CountBodyItem ( OwnerID(), 207281 ) == 0 then --���W�S��207280 ����
		AddSpeakOption( OwnerID(), TargetID(), "[SC_423231_1]", "LuaS_423233_1",0) --�u�ڧ�F��˥�F......�v
	end
end

function LuaS_423233_1()
	SetSpeakDetail( OwnerID() , "[SC_423231_3]")	--���٥H���O�A���n�F�O�A���h�a�A�O�A�˥�F
	GiveBodyItem ( OwnerID(), 207281 , 1 )
end


function LuaS_423234()	--���b�������v���̨��W
LoadQuestOption ( OwnerID() )
	if	CheckAcceptQuest	( OwnerID(), 423231 ) == true and	--���W��423231�B
		CheckCompleteQuest	( OwnerID(), 423234 ) == true  and	--�����L423232�B
		CountBodyItem ( OwnerID(), 207282 ) == 0 and CountBodyItem ( OwnerID(), 207283 ) == 0  then --���W�S��207280 ����
		AddSpeakOption( OwnerID(), TargetID(), "[SC_423231_1]", "LuaS_423234_1",0) --�u�ڧ�F��˥�F......�v
	end
end

function LuaS_423234_1()
	SetSpeakDetail( OwnerID() , "[SC_423231_4]")	--���٥H���O�A���n�F�O�A���h�a�A�O�A�˥�F
	GiveBodyItem ( OwnerID(), 207282 , 1 )
	GiveBodyItem ( OwnerID(), 207283 , 1 )
end