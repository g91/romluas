--423295�w�U�J������--423301�w�溸�����D

function LuaS_423295_0()							--���b�N�سءE�ȻL�U
LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest( OwnerID() ,423295 ) == true then
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_423295_3]" , "LuaS_423295_01", 0 )
	end
	if  CheckAcceptQuest( OwnerID() ,423301 ) == true then
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_423301_3]" , "LuaS_423301_01", 0 )
	end
end

function LuaS_423295_01()
	SetSpeakDetail(OwnerID(),"[SC_423295_0]")	
	SetFlag(OwnerID(),544181,1)
	if CheckFlag( OwnerID(), 544181 ) and CheckFlag( OwnerID(), 544182 ) and CheckFlag( OwnerID(), 544183 ) then
		SetFlag(OwnerID(),544180,1)
	end
end

function LuaS_423301_01()
	SetSpeakDetail(OwnerID(),"[SC_423301_0]")	
	SetFlag(OwnerID(),544186,1)
	if CheckFlag( OwnerID(), 544186 ) and CheckFlag( OwnerID(), 544187 ) and CheckFlag( OwnerID(), 544188 ) then
		SetFlag(OwnerID(),544185,1)
	end
end

function LuaS_423295_1()							--�h�hù�E���
LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest( OwnerID() ,423295 ) == true then
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_423295_3]" , "LuaS_423295_02", 0 )
	end	
	if  CheckAcceptQuest( OwnerID() ,423301 ) == true then
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_423301_3]" , "LuaS_423301_02", 0 )
	end
end

function LuaS_423295_02()
	SetSpeakDetail(OwnerID(),"[SC_423295_1]")	
	SetFlag(OwnerID(),544182,1)
	if CheckFlag( OwnerID(), 544181 ) and CheckFlag( OwnerID(), 544182 ) and CheckFlag( OwnerID(), 544183 ) then
		SetFlag(OwnerID(),544180,1)
	end
end

function LuaS_423301_02()
	SetSpeakDetail(OwnerID(),"[SC_423301_1]")	
	SetFlag(OwnerID(),544187,1)
	if CheckFlag( OwnerID(), 544187 ) and CheckFlag( OwnerID(), 544187 ) and CheckFlag( OwnerID(), 544188 ) then
		SetFlag(OwnerID(),544185,1)
	end
end

function LuaS_423295_2()							--�����J�E���
LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest( OwnerID() ,423295 ) == true then
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_423295_3]" , "LuaS_423295_03", 0 )
	end	
	if  CheckAcceptQuest( OwnerID() ,423301 ) == true then
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_423301_3]" , "LuaS_423301_03", 0 )
	end
end
function LuaS_423295_03()
	SetSpeakDetail(OwnerID(),"[SC_423295_2]")	
	SetFlag(OwnerID(),544183,1)
	if CheckFlag( OwnerID(), 544181 ) and CheckFlag( OwnerID(), 544182 ) and CheckFlag( OwnerID(), 544183 ) then
		SetFlag(OwnerID(),544180,1)
	end
end
function LuaS_423301_03()
	SetSpeakDetail(OwnerID(),"[SC_423301_2]")	
	SetFlag(OwnerID(),544188,1)
	if CheckFlag( OwnerID(), 544188 ) and CheckFlag( OwnerID(), 544187 ) and CheckFlag( OwnerID(), 544188 ) then
		SetFlag(OwnerID(),544185,1)
	end
end
----------423304�j�y�⪺�i�|-----------
function LuaS_423304_5()		--���b����423304 �������ȫ���檺LUA��
	if CheckAcceptQuest( TargetID() ,423304 ) == true	then
		ScriptMessage( TargetID(), TargetID()  , 0 , "[SC_423304_0]" ,  "0xFFFFFF00" ) 	--�\�W�j�y�⤧�L
		ScriptMessage( TargetID()  , TargetID()  , 1 , "[SC_423304_0]" ,  "0xFFFFFF00" ) 
	end
end

function LuaS_423304()		--���b115590���檺�w�溸�Ԥh
LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest( OwnerID() ,423304 ) == true	then 
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_423304_8]" , "LuaS_423304_0", 0 )	
	end
end

function LuaS_423304_0()
	SetSpeakDetail(OwnerID(),"[SC_423304_1]")
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_423304_2]" , "LuaS_423304_1", 0 )	
end

function LuaS_423304_1()
	SetSpeakDetail(OwnerID(),"[SC_423304_3]")		
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_423304_4]" , "LuaS_423304_2", 0 )	
end

function LuaS_423304_2()
	SetSpeakDetail(OwnerID(),"[SC_423304_5]")		
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_423304_6]" , "LuaS_423304_3", 0 )	
end

function LuaS_423304_3()
	SetSpeakDetail(OwnerID(),"[SC_423304_7]")		
	SetFlag(OwnerID() , 544191 , 1 )
end
---------423306�j�۵M���G�k-------------
function LuaS_423306()			--���b115597����NPC�����~�U
	SetPlot( OwnerID(), "range","LuaS_423306_1", 200 )
end

function LuaS_423306_1()--  OwnerID�O���a  �t�X�@�����i�b���a���W����
	if	CheckAcceptQuest( OwnerID() ,423306 ) == true	then
		--SetFlag(OwnerID() , 544192 , 1 )	--���a�ܦ�TargetID()
		BeginPlot( TargetID(), "LuaS_423306_2", 1 )
	end	
end

function LuaS_423306_2()
	SetFlag(TargetID() , 544192 , 1 )	--���a�ܦ�TargetID()
end


-----------423307�����P�j�y�⪺����------------

--780661-�ԮL�R�X�l  780662-�����X�l  780663-��Z�g�X�l

function LuaS_423307_1_1()	
	CloseSpeak(OwnerID())
	BeginPlot(TargetID(),"LuaS_423307",0)
end
function LuaS_423307_false()
	SetSpeakDetail(OwnerID(),"[SC_423307_8]")			---�R�Ԯ����A�����{�b���b�C
end
function LuaS_423307()					
	WriteRoleValue(OwnerID(),EM_RoleValue_Register +1,1)	
	AddBuff( TargetID()  , 503977 , 1 , 300 ) 	--�ɦ��a
	local ch = LuaFunc_CreateObjByObj ( 115681 , OwnerID() ) --�~�_�����H
	CallPlot(OwnerID(),"LuaS_Check_noquest_single",1,1,423307,503977,TargetID(),ch,100)--���h���ȫh���_�@���çR�����aBUFF
	DisableQuest( ch, true )		--�Ϻ~�_���L�k�}�Ҧ���
	local LCL = Lua_DW_CreateObj("flag" ,115593,780661,1)	--�N115593����b780661���Ĥ@�ںX�l�W�إX�� �ëŧi��LCL
	DisableQuest( LCL, true )		--��LCL�L�k�}�Ҧ���
	Sleep(20)
	WriteRoleValue(LCL, EM_RoleValue_IsWalk, 1)		--���ܨ���ƭ� �Ϩ�H�U���ʤ覡�Ҭ�����
	Sleep(10)
	if 	CheckID(TargetID()) == false	or	CheckBuff( TargetID() , 503977 ) == false	 then	--�T�{���a���b�ΨS��BUFF�h�R���t��
		delobj(ch)
		delobj(LCL)
		delobj(icl)
		delobj(tony)
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )			--�����~�_������
		return 
	end
	local tony = Lua_DW_CreateObj("flag" ,115679,780662,1)	--�N115679����b780662���Ĥ@�ںX�l�W�إX�� �ëŧi��tony
	DisableQuest( tony, true )		--��tony�L�k�}�Ҧ���
	local icl = Lua_DW_CreateObj("flag" ,115680,780663,1)	--�N115680����b780663���Ĥ@�ںX�l�W�إX�� �ëŧi��icl
	DisableQuest( icl, true )		--��icl�L�k�}�Ҧ���	
	if 	CheckID(TargetID()) == false	or	CheckBuff( TargetID() , 503977 ) == false	 then	--�T�{���a���b�ΨS��BUFF�h�R���t��
		delobj(ch)
		delobj(LCL)
		delobj(icl)
		delobj(tony)
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )			--�����~�_������
		return 
	end
	CallPlot( tony, "LuaS_423307_1", tony,LCL )		--�Ϻ~�_���I�sScript  LuaS_423307_1
	CallPlot( icl, "LuaS_423307_2", icl,LCL )			--�Ϻ~�_���I�sScript  LuaS_423307_2
	Sleep(10)
	DW_MoveToFlag(LCL,780661 , 2 ,0 ,1)		--��LCL����780600���ĤG�ںX�l
	Sleep(10)
	if 	CheckID(TargetID()) == false	or	CheckBuff( TargetID() , 503977 ) == false	 then	--�T�{���a���b�ΨS��BUFF�h�R���t��
		delobj(ch)
		delobj(LCL)
		delobj(icl)
		delobj(tony)
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )			--�����~�_������
		return 
	end
	AdjustFaceDir ( LCL, ch ,0 )		--�ϩԮL�R����~�_��
	Sleep(10)
	PlayMotion( LCL ,ruFUSION_ACTORSTATE_EMOTE_POINT)	--�ϩԮL�R���ۺ~�_��
	Say(LCL,"[SC_423307_0]")
	Sleep(30)
	ScriptMessage( TargetID(), TargetID()  , 0 , "[SC_423307_1]" ,  "0xFFFFFF00" ) 	
	ScriptMessage( TargetID()  , TargetID () , 1 , "[SC_423307_1]" ,  "0xFFFFFF00" ) 
	Sleep(30)
	if 	CheckID(TargetID()) == false	or	CheckBuff( TargetID() , 503977 ) == false	 then
		delobj(ch)
		delobj(LCL)
		delobj(icl)
		delobj(tony)
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )	
		return 
	end
	say(ch , "[SC_423307_2]" )		--�L�O�Q�襤���H
	Sleep(40)
	say(LCL , "[SC_423307_3]" )		--�A���ڦp��۫H�@�Ӯ��j�F?
	PlayMotion( LCL ,ruFUSION_ACTORSTATE_SHIELD_BLOCK)
	Sleep(30)
	say(LCL , "[SC_423307_3_1]" )		--�A���ڦp��۫H�@�Ӯ��j�F?
	Sleep(30)
	if 	CheckID(TargetID()) == false	or	CheckBuff( TargetID() , 503977 ) == false	 then	--�T�{���a���b�ΨS��BUFF�h�R���t��
		delobj(ch)
		delobj(LCL)
		delobj(icl)
		delobj(tony)
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )			--�����~�_������
		return 
	end
	say(ch ,"[SC_423307_4]" )			--�ڪ��D
	PlayMotion( ch ,ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)
	Sleep(50)
	say(LCL , "[SC_423307_5]" )		--�O���F
	PlayMotion( LCL ,ruFUSION_ACTORSTATE_ATTACK_OH)
	Sleep(20)
	if 	CheckID(TargetID()) == false	or	CheckBuff( TargetID() , 503977 ) == false	 then
			delobj(ch)
			delobj(LCL)
			delobj(icl)
			delobj(tony)
			WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )	
			return 
	end
	DW_MoveToFlag(LCL,780661 , 3 ,0 ,1)	--��LCL����780600����3�ںX�l
	delobj(LCL)
	Tell(TargetID(),tony,"[SC_423307_6]" )	--���������i�D���a
	CallPlot( tony, "LuaS_423307_3" )		--�Ϻ~�_���I�sScript  LuaS_423307_1
	CallPlot( icl, "LuaS_423307_4")			--�Ϻ~�_���I�sScript  LuaS_423307_2
	if 	CheckID(TargetID()) == false	or	CheckBuff( TargetID() , 503977 ) == false	 then	--�T�{���a���b�ΨS��BUFF�h�R���t��
		delobj(ch)
		delobj(LCL)
		delobj(icl)
		delobj(tony)
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )			--�����~�_������
		return 
	end
	Sleep(60)
	delobj(tony)
	delobj(icl)
	delobj(ch)
	SetFlag(TargetID() , 544193 , 1 )
	DisableQuest( OwnerID(), false )	--���~�_���i�H�A���}�ҵ���
	CancelBuff( TargetID()  , 503977  ) 	--�٪��a�ۥ�
	WriteRoleValue(OwnerID(),EM_RoleValue_Register +1,0)
end


function LuaS_423307_1(tony,LCL)                      
	Sleep(20)
	WriteRoleValue(tony, EM_RoleValue_IsWalk, 1)		--���ܨ���ƭ� �Ϩ�H�U���ʤ覡�Ҭ�����
	Sleep(20)
	DW_MoveToFlag(tony,780662 , 2 ,0 ,1)		--��tony����780600���ĤG�ںX�l
	Sleep(20)
	AdjustFaceDir ( tony, LCL ,0 )			--�ϴ�������ԮL�R	
end

function LuaS_423307_2(icl,LCL)
Sleep(20)
	WriteRoleValue(icl, EM_RoleValue_IsWalk, 1)			--���ܨ���ƭ� �Ϩ�H�U���ʤ覡�Ҭ�����
	Sleep(20)
	DW_MoveToFlag(icl,780663 , 2 ,0 ,1)		--��ich����780600���ĤG�ںX�l
	Sleep(20)
	AdjustFaceDir ( icl, LCL ,0 )			--�Ϩ̱Z�g����ԮL�R	
end
function LuaS_423307_3()    
	--Sleep(20)                  
	WriteRoleValue(OwnerID(), EM_RoleValue_IsWalk, 1)		--���ܨ���ƭ� �Ϩ�H�U���ʤ覡�Ҭ�����
	Sleep(20)
	DW_MoveToFlag(OwnerID(),780662 , 3 ,0 ,1)		--��tony����780600���ĤG�ںX�l
end

function LuaS_423307_4()
	--Sleep(20)
	WriteRoleValue(OwnerID(), EM_RoleValue_IsWalk, 1)			--���ܨ���ƭ� �Ϩ�H�U���ʤ覡�Ҭ�����
	Sleep(20)
	DW_MoveToFlag(OwnerID(),780663 , 3 ,0 ,1)		--��ich����780600���ĤG�ںX�l
end

-----------423308�P�����`��-----------
function LuaS_423308()		--���b115682����
	LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest( OwnerID() ,423308 ) == true	then 
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_423308_0]" , "LuaS_423308_1", 0 )
	end
end

function LuaS_423308_1()
	SetSpeakDetail(OwnerID(),"[SC_423308_1]")		
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_423308_2]" , "LuaS_423308_2", 0 )	
end

function LuaS_423308_2()
	SetSpeakDetail(OwnerID(),"[SC_423308_3]")		
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_423308_4]" , "LuaS_423308_3", 0 )	
end

function LuaS_423308_3()
	SetSpeakDetail(OwnerID(),"[SC_423308_5]")		
	SetFlag(OwnerID() , 544194 , 1 )
end
------------423309�j�[�~���Ǻ��F------------
--204046�O����Ϊ��D��A�i�H����������ק�ϥ�
--103992�~���Ǻ��F�k�v
--207464���M��
--207459�˵ۼZ�����F�����U

function LuaS_423309_0()-----���b���~207464"���M��"�ϥΤU��<�ˬdlua>���U�C103992"�~���Ǻ��F�k�v"�O�i�H�Q���쪺�Ǫ��s��
	local OrgID = 0
	if CheckAcceptQuest( OwnerID() , 423309 ) == false or CountBodyItem( OwnerID() ,207459) == 1 then	--207459"�˵ۼZ�����F�����U"���ϥιD�㤧��o�쪺�D��
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_207464_0]" , 0 ) --�A����A�ϥΦ����~
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_207464_0]" , 0 )
		return false
	end			--��S�����ȩΨ��W�������D��� ���"����ϥΪ��~"������
	
	if CheckID( TargetID() ) == true then
		OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	end
	
	if  	ReadRoleValue( TargetID(), EM_RoleValue_Register10 ) > 0  then		--���L��
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SAY_NPC_BUSY]" )--���L
		return false
	end
	
	if   OrgID ~= 103992 then		--�D�㪺�ϥι�H�s��
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_207464_2]", 0 ); -----[207464]�u���[103992]�ϥ�
		return false
	end

	if GetDistance(TargetID(), OwnerID() ) > 120  then -------�Z��
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_207464_3]", 0 ); -----�Z���ӹL����
		return false
	end

	if	ReadRoleValue(TargetID(),EM_RoleValue_HP)/ReadRoleValue(TargetID(),EM_RoleValue_MaxHP)	>0.5	then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_207464_4]", 0 ); ----�ؼоĤO�ä㤤�A�A�L�k���Q����A���ؼСI
		return false
	end


	if	ReadRoleValue( TargetID(), EM_RoleValue_IsDead) == 1 or  CheckBuff( TargetID() , 504004 ) == true  then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_207464_5]" , 0 ) --�ؼФw�g���F�C
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_207464_5]" , 0 )
		return false
	end
	WriteRoleValue( TargetID(), EM_RoleValue_Register10, 1 )
	return true
end

function LuaS_423309_1()	--���b<�ϥήĪG����:server�ݼ@��>�U���ϥήĪG�U �d�ҥ���422113=
	UseItemDestroy( OwnerID() )---���b�ϥΪ����~
	WriteRoleValue( TargetID(), EM_RoleValue_Register10, 0 )
	--hide(TargetID())
	CallPlot(TargetID(),"LuaFunc_ResetObj",TargetID())
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_207464_6]", 0 ); -------�A���[103301]�F
	GiveBodyItem( OwnerID() , 207459 , 1 )
end

----------423312�ɾ��M��k---------

function LuaS_423312()		--���b115582�j�y�⤧�U
	LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest( OwnerID() ,423312 ) == true	and CheckFlag( OwnerID(),544196 ) == false  then 
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_423312_0]" , "LuaS_423312_1", 0 )
	end

	if CheckAcceptQuest( OwnerID() , 423307 ) == true  and CheckFlag( OwnerID(), 544193 ) ==false  then
		if  ReadRoleValue( TargetID(), EM_RoleValue_Register +1) == 0  then                   --�j�y�⤣��
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423307_7]","LuaS_423307_1_1",0)	--�ڷǳƦn�F�C
		else
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423307_7]","LuaS_423307_false",0)	--�ڷǳƦn�F�C
		end
	end	--<=423307��
	
end
function LuaS_423312_1()
	SetSpeakDetail(OwnerID(),"[SC_423312_1]")		
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_423312_2]" , "LuaS_423312_2", 0 )	
end

function LuaS_423312_2()
	SetSpeakDetail(OwnerID(),"[SC_423312_3]")		
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_423312_4]" , "LuaS_423312_3", 0 )
end

function LuaS_423312_3()	
	SetFlag(OwnerID() , 544196 , 1 )
	CloseSpeak(OwnerID())	----����client�ݥ��ȵ���
end



------------------���b115763��z���~���Ǻ��F����ܼ@��------
function LuaS_115763()
	LoadQuestOption( OwnerID() )					---Ū�����ȼҪO
	--423310
	if	CheckAcceptQuest( OwnerID() ,423310 ) == true and CheckFlag( OwnerID(),544195 ) == false	then 
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_423310_0]" , "LuaS_423310_1", 0 )	
	end

	--423313
	if	CheckAcceptQuest( OwnerID() ,423313 ) == true and CheckFlag( OwnerID(),544197 ) == false	and  CountBodyItem ( OwnerID(), 207460 )  then 
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_423313_0]" , "LuaS_423313_1", 0 )	
	end
end
----------423310�P�Z�����F�����q---------

function LuaS_423310_1()
	SetSpeakDetail(OwnerID(),"[SC_423310_1]")		
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_423310_2]" , "LuaS_423310_2", 0 )	
end

function LuaS_423310_2()
	SetSpeakDetail(OwnerID(),"[SC_423310_1]")		
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_423310_3]" , "LuaS_423310_3", 0 )	
end

function LuaS_423310_3()
	SetSpeakDetail(OwnerID(),"[SC_423310_4]")		
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_423310_5]" , "LuaS_423310_4", 0 )
end

function LuaS_423310_4()
	SetSpeakDetail(OwnerID(),"[SC_423310_6]")		
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_423310_7]" , "LuaS_423310_5", 0 )
end

function LuaS_423310_5()
	SetSpeakDetail(OwnerID(),"[SC_423310_8]")		
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_423310_9]" , "LuaS_423310_6", 0 )
end	

function LuaS_423310_6()
	SetSpeakDetail(OwnerID(),"[SC_423310_10]")		
	SetFlag(OwnerID() , 544195 , 1 )
end



----------423313���q�O�̦n������---------

function LuaS_423313_1()
	SetSpeakDetail(OwnerID(),"[SC_423313_1]")		
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_423313_2]" , "LuaS_423313_2", 0 )	
end

function LuaS_423313_2()
	SetSpeakDetail(OwnerID(),"[SC_423313_3]")		
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_423313_4]" , "LuaS_423313_3", 0 )	
end

function LuaS_423313_3()
	SetSpeakDetail(OwnerID(),"[SC_423313_5]")		
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_423313_6]" , "LuaS_423313_4", 0 )
end	

function LuaS_423313_4()
	SetSpeakDetail(OwnerID(),"[SC_423313_7]")		
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_423313_8]" , "LuaS_423313_5", 0 )
end

function LuaS_423313_5()
	SetSpeakDetail(OwnerID(),"[SC_423313_9]")		
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_423313_10]" , "LuaS_423313_6", 0 )
end	

function LuaS_423313_6()
	SetSpeakDetail(OwnerID(),"[SC_423313_11]")		
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_423313_12]" , "LuaS_423313_7", 0 )
end	

function LuaS_423313_7()
	SetSpeakDetail(OwnerID(),"[SC_423313_13]")		
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_423313_14]" , "LuaS_423313_8", 0 )
end	

function LuaS_423313_8()	
	SetFlag(OwnerID() , 544197 , 1 )
	CloseSpeak(OwnerID())	--����client�ݥ��ȵ���
end

--------423312�ɾ��M��k--------
function LuaS_423312_complete()
	ScriptMessage( OwnerID() , TargetID() , 1 , "[SC_423312_5]" , 0 ) 
	ScriptMessage( OwnerID() , TargetID() , 0 , "[SC_423312_5]" , 0 )
end

----���R�ľ������F----
function LuaS_115591()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() ,423313 ) == true  and  CountBodyItem ( OwnerID(), 207460 ) == 0 then 
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_207460_1]" , "LuaS_115591_1", 0 )
	end
end

function LuaS_115591_1()
	SetSpeakDetail(OwnerID(),"[SC_207460_0]")
	GiveBodyItem ( OwnerID(), 207460, 1 )
end