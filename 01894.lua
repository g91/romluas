----------------------------423314---------------------------
function LuaS_115584()
	LoadQuestOption( OwnerID() )					---Ū�����ȼҪO

	----423314
	if	CheckAcceptQuest( OwnerID() , 423314 ) == true	and	CheckFlag( OwnerID(),544203 ) == false  then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423314_1]","LuaS_423314_1",0)	--�W������o�򰵥u���F�l�D�O�q�A����O������n�l�D�O�q�O�H
	end	--<=423314��
	----423316
	if	CheckAcceptQuest( OwnerID() , 423316 ) == true	and	CheckFlag( OwnerID(),544205 ) == true	and	CheckFlag( OwnerID(),544206 ) == false	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423316_13]","LuaS_423316_3",0)		---��~���Pı�줰��H
	end	--<=423316��
	-------423317
	if CheckAcceptQuest( OwnerID() , 423317 ) == true  and	CheckFlag( OwnerID(),544207 ) == false	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423317_1]","LuaS_423317_1",0)	--�A�٦n�a�H�ڭ̷Q�n��A���ǸܡC
	end	--<=423317��
	-------423318
	if	CheckAcceptQuest( OwnerID() , 423318 ) == true	and	CheckFlag( OwnerID(),544208 ) == false	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423318_1]","LuaS_423318_1",0)		---���F�פ��ڪ��԰��A���@�ǰ��D�Q�n�ݧA�C
	end	--<=423318��	
	if	CheckAcceptQuest( OwnerID() , 423318 ) == true	and	CheckFlag( OwnerID(),544208 ) == true	and	CheckFlag( OwnerID(),544209 ) == false	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423318_4]","LuaS_423318_2",0)		---���F��ڪ��M���A�ڷQ���D�~���Ǻ��F�p��ާ@�۵M���O�C
	end	--<=423318��	
	if	CheckAcceptQuest( OwnerID() , 423318 ) == true	and	CheckFlag( OwnerID(),544209 ) == true	and	CheckFlag( OwnerID(),544210 ) == false	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423318_7]","LuaS_423318_3",0)		---�W������l���۵M���O�A�O�b���̧l���H�S�y�V��B�O�H
	end	--<=423318��	
	if	CheckAcceptQuest( OwnerID() , 423318 ) == true	and	CheckFlag( OwnerID(),544210 ) == true	and	CheckFlag( OwnerID(),544211 ) == false	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423318_10]","LuaS_423318_4",0)		---�W������l���۵M���O�O���F�����F�~��A�o�O�֪��R�O�H
	end	--<=423318��	
	-------423319
	if	CheckAcceptQuest( OwnerID() , 423319 ) == true	and	CheckFlag( OwnerID(),544212 ) == false	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423319_1]","LuaS_423319_1",0)		---�ڥi�H��t��g�J����ܶܡH
	end	--<=423318��	
	if	CheckAcceptQuest( OwnerID() , 423319 ) == true	and	CheckFlag( OwnerID(),544212 ) == true	and	CheckFlag( OwnerID(),544213 ) == false	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423319_4]","LuaS_423319_2",0)		---�W������t��g�J���i�H���q�A���ھ����O���|�ˤH�A�i�_�ѧA�a���O�H
	end	--<=423318��	
	if	CheckAcceptQuest( OwnerID() , 423319 ) == true	and	CheckFlag( OwnerID(),544213 ) == true	and	CheckFlag( OwnerID(),544214 ) == false	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423319_7]","LuaS_423319_3",0)		---�W���A���n�D�ڷQ�L�F�A�ګO�Ҥ��|�}�a�~���Ƕ�窺�@���C
	end	--<=423318��
	--------423320
	
end


function LuaS_423314_1()
	local Dis =  GetDistance( OwnerID() , TargetID() )					---�Z���W�L50����
	if	Dis > 50 then
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204592_2]" ,  "0xFFFFFF00" ) 	---
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204592_2]" ,  "0xFFFFFF00" )
		CloseSpeak( OwnerID() )
	else

		SetSpeakDetail(OwnerID(),"[SC_423314_2]")	---��...���M��...�O���٫ܼҽk...�u�����H�ҬO�p��...�ܩ��]...�L�H�����x�b...�]�L�H�����дo...�ت�...���M��...
		if  CheckFlag( OwnerID(),544200 ) == false  then                   ---
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423314_3]","LuaS_423314_2",0)	--�O���F�a��H
		end
		if  CheckFlag( OwnerID(),544201 ) == false  then                   ---
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423314_5]","LuaS_423314_3",0)	--�O���F�ڤH�H
		end
		if  CheckFlag( OwnerID(),544202 ) == false  then                   --
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423314_7]","LuaS_423314_4",0)	--�O���F�@�ɩM���H
		end
		if CheckFlag( OwnerID(),544200 ) == true	and	CheckFlag( OwnerID(),544201 ) == true and	CheckFlag( OwnerID(),544202 ) == true	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423314_9]","LuaS_423314_5",0)	--�٬O�Q���_�ӶܡH
		end
	end
end

function LuaS_423314_2()
	local Dis =  GetDistance( OwnerID() , TargetID() )					---�Z���W�L50����
	if	Dis > 50 then
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204592_2]" ,  "0xFFFFFF00" ) 	---
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204592_2]" ,  "0xFFFFFF00" )
		CloseSpeak( OwnerID() )
	else
	if	CheckAcceptQuest ( OwnerID()   , 423314 )	 == true	then
		SetFlag(OwnerID(),544200,1)
	end
		SetSpeakDetail(OwnerID(),"[SC_423314_4]")			---��...�~���Ƕ��˪L�����R���۵M���O...���ݭn...���O���F�a��C
		if  CheckFlag( OwnerID(),544201 ) == false  then                   --
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423314_5]","LuaS_423314_3",0)	--�O���F�ڤH�H
		end
		if  CheckFlag( OwnerID(),544202 ) == false  then                   --
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423314_7]","LuaS_423314_4",0)	--�O���F�@�ɩM���H
		end
		if CheckFlag( OwnerID(),544200 ) == true	and	CheckFlag( OwnerID(),544201 ) == true and	CheckFlag( OwnerID(),544202 ) == true	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423314_9]","LuaS_423314_5",0)	--�٬O�Q���_�ӶܡH
		end
	end
end

function LuaS_423314_3()
	local Dis =  GetDistance( OwnerID() , TargetID() )					---�Z���W�L50����
	if	Dis > 50 then
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204592_2]" ,  "0xFFFFFF00" ) 	---
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204592_2]" ,  "0xFFFFFF00" )
		CloseSpeak( OwnerID() )
	else
	if	CheckAcceptQuest ( OwnerID()   , 423314 )	 == true	then
		SetFlag(OwnerID(),544201,1)
	end
		SetSpeakDetail(OwnerID(),"[SC_423314_6]")			---��...���F�ڦۥj��q�۵M�k�h...���P�۵M����...�M���@�B...���O���F�ڤH�C
	
		if  CheckFlag( OwnerID(),544200 ) == false  then                   --
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423314_3]","LuaS_423314_2",0)	--�O���F�a��H
		end
		if  CheckFlag( OwnerID(),544202 ) == false  then                   --
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423314_7]","LuaS_423314_4",0)	--�O���F�@�ɩM���H
		end
		if CheckFlag( OwnerID(),544200 ) == true	and	CheckFlag( OwnerID(),544201 ) == true and	CheckFlag( OwnerID(),544202 ) == true	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423314_9]","LuaS_423314_5",0)	--�٬O�Q���_�ӶܡH
		end
	end
end

function LuaS_423314_4()
	local Dis =  GetDistance( OwnerID() , TargetID() )					---�Z���W�L50����
	if	Dis > 50 then
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204592_2]" ,  "0xFFFFFF00" ) 	---
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204592_2]" ,  "0xFFFFFF00" )
		CloseSpeak( OwnerID() )
	else
	if	CheckAcceptQuest ( OwnerID()   , 423314 )	 == true	then
		SetFlag(OwnerID(),544202,1)
	end
		SetSpeakDetail(OwnerID(),"[SC_423314_8]")			---��...�P�d�~�ۤ�...���D�å@...���O���F�M���C
	
		if  CheckFlag( OwnerID(),544200 ) == false  then                   --
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423314_3]","LuaS_423314_2",0)	--�O���F�a��H
		end
		if  CheckFlag( OwnerID(),544201 ) == false  then                   --
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423314_5]","LuaS_423314_3",0)	--�O���F�ڤH�H
		end
		if CheckFlag( OwnerID(),544200 ) == true	and	CheckFlag( OwnerID(),544201 ) == true and	CheckFlag( OwnerID(),544202 ) == true	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423314_9]","LuaS_423314_5",0)	--�٬O�Q���_�ӶܡH
		end
	end
end

function LuaS_423314_5()
	local Dis =  GetDistance( OwnerID() , TargetID() )					---�Z���W�L50����
	if	Dis > 50 then
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204592_2]" ,  "0xFFFFFF00" ) 	---
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204592_2]" ,  "0xFFFFFF00" )
		CloseSpeak( OwnerID() )
	else
	if	CheckAcceptQuest ( OwnerID()   , 423314 )	 == true	then
		SetFlag(OwnerID(),544203,1)
	end	
		SetSpeakDetail(OwnerID(),"[SC_423314_10]")			---�O��...�u���Q���_��...���...�Q��ê...�O�q...����...�^�h...�^�~���Ƕ��˪L�C
	end
end

---------------------------------------423315--------------------------------------------------

function LuaS_423315()
	SetPlot(OwnerID(),"range","LuaS_423315_1",100)
end

function LuaS_423315_1()						---�d��@��,�D�a�I�᮳��X��
	if 	CheckAcceptQuest( OwnerID() , 423315 ) == true	and	
		CheckFlag( OwnerID() , 544204) == false	then
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_423315_1]" ,  "0xFFFFFF00" ) 	---�A�o�{�w�溸�i�h�P�ᮦ�����w�g�b���f���A�C
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_423315_1]" ,  "0xFFFFFF00" )	
		SetFlag(OwnerID(),544204,1)			
	end	
end

-------------------------------------423316-----------------------------------------

function LuaS_115648()
	LoadQuestOption( OwnerID() )					---Ū�����ȼҪO
	if	CheckAcceptQuest( OwnerID() , 423316 ) == true	and	CheckFlag( OwnerID(),544205 ) == false	then	---��423316���ȥB�L544205�X��
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423316_1]","LuaS_423316_1",0)	--���ڭ̥X�o�F�C
	end	
end

function LuaS_423316_1()
	if	ReadRoleValue(TargetID(),EM_RoleValue_Register +1) == 0	then		---���F����
		WriteRoleValue(TargetID(),EM_RoleValue_Register +1,1)			---���F�ܦ�	
		CloseSpeak(OwnerID())
		BeginPlot(TargetID(),"LuaS_423316_2",0)
	else
		SetSpeakDetail(OwnerID(),"[SC_423316_2]")	
	end
	
end

function LuaS_423316_2()		---Target=>���a,Owner=>NPC

	AddBuff(TargetID(),506969,1,-1)						---����BUFF
	local dischecker = LuaFunc_SearchNPCbyOrgID( OwnerID() ,115653  , 1000 , 0)	
	local fen = Lua_DW_CreateObj("obj",115651,OwnerID())   --fen���H	---�ᮦ�������H
	local NPC = LuaFunc_SearchNPCbyOrgID( OwnerID() ,115649  , 1000 , 0)
	local fighter = Lua_DW_CreateObj("obj",115652,NPC)   --baden���H	---�i�h���H
	MoveToFlagEnabled(fen,false)
	MoveToFlagEnabled(fighter,false)
	DisableQuest( fen , true )	
	DisableQuest( fighter , true )	
	CallPlot(fen,"LuaS_423316_in",fighter,OwnerID(),NPC,dischecker,TargetID())	---�V���]�h����
	CallPlot(fen,"LuaS_423316_longtime",fighter, OwnerID() ,NPC,dischecker,TargetID())	---���ɶ��ݦb�d�򤺫h���ȥ���
	CallPlot(fen,"LuaS_423316_start",fighter,OwnerID(),NPC,dischecker,TargetID())		---�]�W�L400�h�@���}�l
	CallPlot(OwnerID(),"LuaS_Check_noquest_single",1,1,423316,506969,TargetID(),fen,300)		---�����ȴN���hBUFF
	CallPlot(OwnerID(),"LuaS_423316_nobuff",fen,fighter,TargetID())				---�S��BUFF�N���m
	SetPlot(OwnerID(),"range","LuaS_423316_return",100)					---���s�^��Z��100�h�������a���~�]
	SetFollow( fen, TargetID() )						---���H���a
	SetFollow( fighter, fen )						---���Hfen
end

function LuaS_423316_false()
	SetSpeakDetail(OwnerID(),"[SC_423316_2]")			---��...��q...�۵M���O...���Ԫ���q...�Ӧh�F��q�ڸ�����{�A�ЧA�A�h���ڤ@�U�C
									---(�����ᮦ�����C�Y���y...)
end

function LuaS_423316_start(fighter,boss,NPC,dischecker,player)
	while	true	do
		sleep(10)
		if	GetDistance( OwnerID() , boss ) > 400	then
			WriteRoleValue(OwnerID(),EM_RoleValue_Register +1,1)
			yell(OwnerID(),"[SC_423316_6]",3)		---�ܷL��...���T��@�I�@�I�b�y��...
			sleep(30)
			yell(OwnerID(),"[SC_423316_7]",3)		---���L...�o�ۤ��ߪ��s��...
			sleep(30)
			yell(OwnerID(),"[SC_423316_8]",3)		---�o��...���D�O�ڭ̿ˤ�y�����ܡH
			sleep(30)
			yell(OwnerID(),"[SC_423316_9]",3)		---�γ\...�u�����F...
			sleep(30)
			yell(OwnerID(),"[SC_423316_10]",3)		---�쩳...������l�D�O�q�O...
			sleep(30)
			yell(fighter,"[SC_423316_11]",3)		---�Ӧ^�h�F�I
			SetFollow( OwnerID(), 0 )			---������H
			SetFollow( fighter, 0 )
			sleep(20)
			yell(OwnerID(),"[SC_423316_12]",3)		---��...
			WriteRoleValue(OwnerID() , EM_RoleValue_IsWalk, 1 )	---����
			WriteRoleValue(fighter , EM_RoleValue_IsWalk, 1 )	
			sleep(20)

			local x = ReadRoleValue ( boss, EM_RoleValue_X)
			local y = ReadRoleValue ( boss, EM_RoleValue_Y)
			local z = ReadRoleValue ( boss, EM_RoleValue_Z)
			local x1 = ReadRoleValue ( NPC, EM_RoleValue_X)
			local y1 = ReadRoleValue ( NPC, EM_RoleValue_Y)
			local z1 = ReadRoleValue ( NPC, EM_RoleValue_Z)
			move(OwnerID(),x,y,z)				---�^���l�I
			move(fighter,x1,y1,z1)
			sleep(20)
			delobj(fighter)					---�R���t��
			Hide(OwnerID())
			sleep(20)
			WriteRoleValue(boss,EM_RoleValue_Register +1,0)	---���F����		
			CancelBuff( player  , 506969  )			---�R��BUFF
			if	CheckAcceptQuest ( player   , 423316 )	 == true	then
				SetFlag( player ,544205,1)
			end
			delobj(OwnerID())

		end
	end	
end

function LuaS_423316_return(fighter,boss,NPC,dischecker,player)				---�X�h��S���^�],�X�{ĵ�i
	local fighter = LuaFunc_SearchNPCbyOrgID( TargetID() ,115652  , 500 , 0)
	local fen = LuaFunc_SearchNPCbyOrgID( TargetID() ,115651  , 500 , 0)
	if	ReadRoleValue(fen,EM_RoleValue_Register +1) == 0	then
		yell(fighter,"[SC_423316_5]",3)						---�F�����^�]�A����`�J�˪L�ܡH
	end
end

function LuaS_423316_in(fighter,boss,NPC,dischecker,player)				---���^�]�h�����@��
	while	true	do
		sleep(10)

		if	GetDistance( OwnerID() , boss ) > GetDistance( OwnerID() , dischecker )	and	ReadRoleValue(OwnerID(),EM_RoleValue_Register +1) == 0	then
			WriteRoleValue(OwnerID(),EM_RoleValue_Register +1,1)
			yell(fighter,"[SC_423316_3]",3)				---�d����A���O���n�X���ܡH�O���O�ڮɶ��C
			SetFollow( OwnerID(), 0 )				---������H
			SetFollow( fighter, 0 )
			sleep(20)
			WriteRoleValue(OwnerID() , EM_RoleValue_IsWalk, 1 )	---����
			WriteRoleValue(fighter , EM_RoleValue_IsWalk, 1 )	
			local x = ReadRoleValue ( boss, EM_RoleValue_X)
			local y = ReadRoleValue ( boss, EM_RoleValue_Y)
			local z = ReadRoleValue ( boss, EM_RoleValue_Z)
			local x1 = ReadRoleValue ( NPC, EM_RoleValue_X)
			local y1 = ReadRoleValue ( NPC, EM_RoleValue_Y)
			local z1 = ReadRoleValue ( NPC, EM_RoleValue_Z)
			move(OwnerID(),x,y,z)					---�^����I
			move(fighter,x1,y1,z1)
			sleep(20)
			delobj(fighter)						---�R���t��
			Hide(OwnerID())
			sleep(20)
			WriteRoleValue(boss,EM_RoleValue_Register +1,0)		---���F����		
			CancelBuff( player  , 506969  )				---�R��BUFF
			delobj(OwnerID())
		end
	end				---
end
function LuaS_423316_longtime(fighter,boss,NPC,dischecker,player)				---��ɶ����SĲ�o�@���h����
	local time = 0
	while	true	do
		sleep(10)			
		time = time +1			---10��ᤴ�����}���Xĵ�i
		if	time == 10	and	GetDistance( OwnerID() , boss ) < 400	and	ReadRoleValue(OwnerID(),EM_RoleValue_Register +1) == 0	then
			yell(fighter,"[SC_423316_4]",3)		---�F���ݦb�o�A����`�J�˪L�ܡH
		end				---�ɶ���30��,�Z���_�l��m�p��200,�B���Ұʼ@��,�����@��
		if	time == 30	and	GetDistance( OwnerID() , boss ) < 400	and	ReadRoleValue(OwnerID(),EM_RoleValue_Register +1) == 0	then
			WriteRoleValue(OwnerID(),EM_RoleValue_Register +1,1)
			yell(fighter,"[SC_423316_3]",3)		---�d����A���O���n�X���ܡH�O���O�ڮɶ��C
			SetFollow( OwnerID(), 0 )		---������H
			SetFollow( fighter, 0 )
			sleep(20)
			WriteRoleValue(OwnerID() , EM_RoleValue_IsWalk, 1 )	---����
			WriteRoleValue(fighter , EM_RoleValue_IsWalk, 1 )	
			local x = ReadRoleValue ( boss, EM_RoleValue_X)
			local y = ReadRoleValue ( boss, EM_RoleValue_Y)
			local z = ReadRoleValue ( boss, EM_RoleValue_Z)
			local x1 = ReadRoleValue ( NPC, EM_RoleValue_X)
			local y1 = ReadRoleValue ( NPC, EM_RoleValue_Y)
			local z1 = ReadRoleValue ( NPC, EM_RoleValue_Z)
			move(OwnerID(),x,y,z)					---�^����I
			move(fighter,x1,y1,z1)
			sleep(20)
			delobj(fighter)						---�R���t��
			Hide(OwnerID())
			sleep(20)
			WriteRoleValue(boss,EM_RoleValue_Register +1,0)		---���F����		
			CancelBuff( player  , 506969  )				---�R��BUFF
			delobj(OwnerID())
		end
	end	
end

function LuaS_423316_nobuff(fen,fighter,player)				---�X�h��S���^�],�X�{ĵ�i
	while	ReadRoleValue(OwnerID(),EM_RoleValue_Register +1) == 1	do
		sleep(10)			
		if	CheckID(player) == false	or	CheckBuff(player,506969) == false	then
			WriteRoleValue(OwnerID(),EM_RoleValue_Register +1,0)
			delobj(fighter)
			delobj(fen)
			break
		end
	end
end

function LuaS_423316_3()
	local Dis =  GetDistance( OwnerID() , TargetID() )					---�Z���W�L50����
	if	Dis > 50 then
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204592_2]" ,  "0xFFFFFF00" ) 	---
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204592_2]" ,  "0xFFFFFF00" )
		CloseSpeak( OwnerID() )
	else
		SetSpeakDetail(OwnerID(),"[SC_423316_14]")			---���M�Q���ӷL�A���w�溸�˪L���۵M���O�T�ꤣ�_�b�y���A�H�ۦb�˪L�����ʡA�߸̪��]�V�ӶV���R�A���v���Q�s�˨��N�A�ڤ����D������...�Ӧۤ��ߪ��s�ˡA�L�k�����C
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423316_15]","LuaS_423316_4",0)	--�o�O���F���ѩʡA�p���|ı�o�s�˥��O�����_�ǯ�q���x���C
	end
end

function LuaS_423316_4()
	local Dis =  GetDistance( OwnerID() , TargetID() )					---�Z���W�L50����
	if	Dis > 50 then
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204592_2]" ,  "0xFFFFFF00" ) 	---
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204592_2]" ,  "0xFFFFFF00" )
		CloseSpeak( OwnerID() )
	else
		SetSpeakDetail(OwnerID(),"[SC_423316_16]")			---���ڤ��M�i�H�P���쨭��̨��ѷQ�^�~���Ƕ��˪L���İʡA���ȭn�����\�樺�د�q�ٻݭn�@�q�ɶ��A�p�G�ڦ����󥢱`���欰�A�Ʊ�A�i�H����ڡC
	if	CheckAcceptQuest ( OwnerID()   , 423316 )	 == true	then
		SetFlag(OwnerID(),544206,1)
	end				---�o��X��
	end
end
---------------------------------423317----------------------------------------

function LuaS_423317_1()
	if  ReadRoleValue( TargetID(), EM_RoleValue_Register +1) == 0  then                   --���F����
		WriteRoleValue ( TargetID() , EM_RoleValue_Register +1,1 )			---���F�ܦ�
		CloseSpeak(OwnerID())
		BeginPlot(TargetID(),"LuaS_423317_2",0)
	else
		SetSpeakDetail(OwnerID(),"[SC_423317_2]")			---�A�̡H���F�A�H�~�٦���L�H�ܡH
									---������q�٦b�v�T�ڪ������A�ڤ��O�ҷ|���|�v�T��ۤv���Q�k�A�е��ڮɶ���z����C
									---(�����ᮦ�����C�Y���y)
	end
end

function LuaS_423317_false()
	SetSpeakDetail(OwnerID(),"[SC_423317_2]")			---�A�̡H���F�A�H�~�٦���L�H�ܡH
									---������q�٦b�v�T�ڪ������A�ڤ��O�ҷ|���|�v�T��ۤv���Q�k�A�е��ڮɶ���z����C
									---(�����ᮦ�����C�Y���y)
end

function LuaS_423317_2()

	AddBuff( TargetID()  , 506970 , 1 , -1 ) 	
	local fen = Lua_DW_CreateObj("obj",115654,OwnerID())   --fen���H	
	local tony = Lua_DW_CreateObj("flag" ,115655,780677,1)		---tony���H
	CallPlot(OwnerID(),"LuaS_Check_noquest_single",1,1,423317,506970,TargetID(),OwnerID(),100)	---���h���ȧY���hBUFF
	CallPlot(OwnerID(),"LuaS_423317_nobuff",fen,tony,TargetID())			---�LBUFF�h�屼�t��
	DisableQuest( fen , true )							---�t�����i���
	DisableQuest( tony , true )	
	sleep(20)
	WriteRoleValue(tony , EM_RoleValue_IsWalk, 1 )		---�Ψ���
	MoveToFlagEnabled(fen,false)							
	MoveToFlagEnabled(tony,false)
	sleep(20)
	local tony2 = LuaFunc_SearchNPCbyOrgID( OwnerID() ,115656  , 200 , 0)		---��������w��
	local X = ReadRoleValue ( tony2, EM_RoleValue_X)
	local Y = ReadRoleValue ( tony2, EM_RoleValue_Y)
	local Z = ReadRoleValue ( tony2, EM_RoleValue_Z)
	DW_WaitMoveTo( tony , X , Y, Z)
	sleep(10)
	AdjustFaceDir( tony ,fen, 0 )	
	AdjustFaceDir( fen ,tony, 0 )		
	PlayMotion(tony,ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	Yell(tony,"[SC_423317_3]",3)		---�A�n�A�ڬO�d�Ժ�?�d�ĩi�C
	sleep(30)
	Yell(fen,"[SC_423317_4]",3)		---�d�ĩi...�H����N�ܡH
	sleep(30)
	Yell(tony,"[SC_423317_5]",3)		---�O���A�ݨӤ�����q�èS���v�T�z���O�СC
	sleep(30)
	if 	CheckBuff( TargetID() , 506970 ) == false	 then
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )	
		return 
	end
	Yell(fen,"[SC_423317_6]",3)		---�T��S���A�ƹ�W���]���v�T�ڭ̪���һP�޿�A�d�Ժ�?�d�ĩi���U�C
	sleep(15)
	PlayMotion( fen ,ruFUSION_ACTORSTATE_CROUCH_BEGIN)	   --�U��
	sleep(20)
	Yell(tony,"[SC_423317_7]",3)		---���Φh§�A�b�o�y�˪L���ڤ]�u�O�@�Ӵ��p���s�b�A�J�M�w�g���ۤ��йL�F�A����N�����i�J���D�a�C
	sleep(10)
	PlayMotion( fen ,ruFUSION_ACTORSTATE_CROUCH_END)	   --�U��
	sleep(30)
	Yell(fen,"[SC_423317_8]",3)		---....
	sleep(20)
	Yell(tony,"[SC_423317_9]",3)		---�A���D�w�溸�H������n��~���Ǻ��F�԰��ܡH
	sleep(30)
	if 	CheckBuff( TargetID() , 506970 ) == false	 then
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )	
		return 
	end
	Yell(fen,"[SC_423317_10]",3)		---�H�e�����D�A�{�b�F�ѤF�C
	sleep(30)
	Yell(tony,"[SC_423317_11]",3)		---�O��...�~���Ǻ��F�̤��_���w�溸�j�L���۵M���O�y���A�v�T�ͺA���ҡA�w�溸�H�N�O�����P���F��ԡC
	sleep(50)
	Yell(fen,"[SC_423317_8]",3)		---....
	sleep(20)
	if 	CheckBuff( TargetID() , 506970 ) == false	 then
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )	
		return 
	end
	Yell(tony,"[SC_423317_12]",3)		---�۫H�A�]�P����Ӧۦw�溸�˪L���T���A����b�o�̥ͬ��d�~���[���w�溸�H�|��A�̪��欰�P�켫��]���O�L�k�z�ѡC
	sleep(50)
	Yell(fen,"[SC_423317_13]",3)		---�O��...
	sleep(25)
	PlayMotion( tony,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Yell(tony,"[SC_423317_14]",3)		---���F���]�O���@�۵M�P�M�����رڡA�۫H�v�T�w�溸�j�L���۵M���O�]���O�A�̪����N�C
	sleep(50)
	if 	CheckBuff( TargetID() , 506970 ) == false	 then
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )	
		return 
	end
	Yell(tony,"[SC_423317_15]",3)		---�γ\�}�l�ɤ@�w���A�̪���]�A���i���H�ۮɶ��y�u���H�C�C����ѤF�C
	sleep(40)
	Yell(tony,"[SC_423317_16]",3)		---�p���o���欰�o�����w�溸�~�H�P���F�԰����z�ѡA�O�_�w�P�A�̪��ت����Ұ��t�O�H�ڬ۫H�޵o�Ԫ���}�a�۵M�����O���F�����N�C
	sleep(50)
	Yell(fen,"[SC_423317_17]",3)		---���F�����D�ʬD�_�Ԫ��C
	sleep(30)
	if 	CheckBuff( TargetID() , 506970 ) == false	 then
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )	
		return 
	end
	Yell(tony,"[SC_423317_18]",3)		---�S���A���p�������o�]���Ӱ_�A����O�_�ݭn���s�^�Q�@�}�l����]�A�ɥi���קK����ڶ����Ĭ�A�۫H�i�H������誺�ˤ`�A����F�ڨӻ��]���O�a�ơC
	sleep(50)
	Yell(fen,"[SC_423317_19]",3)		---���U���ܪ���...
	sleep(30)
	PlayMotion(tony,ruFUSION_ACTORSTATE_EMOTE_POINT)
	sleep(5)
	Yell(tony,"[SC_423317_20]",3)		---�ڭn�פ����誺�����A���������F�ѩ~���Ǻ��F����v�T�w�溸�j�L���۵M���O�A�ڻݭn�A����U�A�ᮦ�����C
	sleep(50)
	if 	CheckBuff( TargetID() , 506970 ) == false	 then
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )	
		return 
	end
	Yell(fen,"[SC_423317_21]",3)		---�@�ɴ������O�A���F�פ��...
	sleep(30)	
	delobj(fen)				---�R���t��
	delobj(tony)
	
	if	CheckAcceptQuest ( TargetID()   , 423317 )	 == true	and	CheckBuff( TargetID() , 506970 ) == true	then
		SetFlag(TargetID(),544207,1)
	end
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )			--- ���F����
	CancelBuff( TargetID()  , 506970 )	
end

function LuaS_423317_nobuff(fen,tony,player)				---�X�h��S���^�],�X�{ĵ�i
	while	ReadRoleValue(OwnerID(),EM_RoleValue_Register +1) == 1	do
		sleep(10)			---�ɶ���30��,�Z���_�l��m�p��200,�B���Ұʼ@��
		if	CheckID(player) == false	or	CheckBuff(player,506970) == false	then
			delobj(tony)
			delobj(fen)
			break
		end
	end
end

----------------------423318------------------------------
function LuaS_423318_1()
	local Dis =  GetDistance( OwnerID() , TargetID() )					---�Z���W�L50����
	if	Dis > 50 then
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204592_2]" ,  "0xFFFFFF00" ) 	---
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204592_2]" ,  "0xFFFFFF00" )
		CloseSpeak( OwnerID() )
	else
		SetSpeakDetail(OwnerID(),"[SC_423318_2]")			---�O���A���F��ڪ��M���A�P�w�溸�j�L���۵M�C
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423318_3]","LuaS_423318_2",0)	--�~���Ǻ��F�p��ާ@�۵M���O�H
		if	CheckAcceptQuest ( OwnerID()   , 423318 )	 == true	then
			SetFlag(OwnerID(),544208,1)
		end	
	end
end

function LuaS_423318_2()
	local Dis =  GetDistance( OwnerID() , TargetID() )					---�Z���W�L50����
	if	Dis > 50 then
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204592_2]" ,  "0xFFFFFF00" ) 	---
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204592_2]" ,  "0xFFFFFF00" )
		CloseSpeak( OwnerID() )
	else
		SetSpeakDetail(OwnerID(),"[SC_423318_5]")			---�ڭ̳z�L�t��g�J���ӧl���۵M���O...
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423318_6]","LuaS_423318_3",0)	--�L�b���̧l���۵M���O�H�ҧl�����۵M���O�S�N�y�V���̡H
		if	CheckAcceptQuest ( OwnerID()   , 423318 )	 == true	then
			SetFlag(OwnerID(),544209,1)
		end
	end
end

function LuaS_423318_3()
	local Dis =  GetDistance( OwnerID() , TargetID() )					---�Z���W�L50����
	if	Dis > 50 then
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204592_2]" ,  "0xFFFFFF00" ) 	---
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204592_2]" ,  "0xFFFFFF00" )
		CloseSpeak( OwnerID() )
	else
		SetSpeakDetail(OwnerID(),"[SC_423318_8]")			---�t��g�J���O�ӷ|���ʪ��ͩR��...
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423318_9]","LuaS_423318_4",0)	--�O�֩R�O�t��g�J���l���۵M���O�H
		if	CheckAcceptQuest ( OwnerID()   , 423318 )	 == true	then
			SetFlag(OwnerID(),544210,1)
		end	
	end
end

function LuaS_423318_4()
	local Dis =  GetDistance( OwnerID() , TargetID() )					---�Z���W�L50����
	if	Dis > 50 then
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204592_2]" ,  "0xFFFFFF00" ) 	---
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204592_2]" ,  "0xFFFFFF00" )
		CloseSpeak( OwnerID() )
	else
		SetSpeakDetail(OwnerID(),"[SC_423318_11]")			---�t��g�J���O���F�I�����F�Ӧs�b���ͩR...
		if	CheckAcceptQuest ( OwnerID()   , 423318 )	 == true	then
			SetFlag(OwnerID(),544211,1)
		end
	end
end

-------------------------423319------------------------------
function LuaS_423319_0()
	AddBuff( TargetID()  , 506971 , 1 , 300 ) 
	DisableQuest(OwnerID(),true)
	local tony = Lua_DW_CreateObj("obj",115657,OwnerID())   --tony���H		
	DisableQuest( tony , true )	
	sleep(20)	
	MoveToFlagEnabled(tony,false)
	WriteRoleValue(tony , EM_RoleValue_IsWalk, 1 )		---�Ψ���
	sleep(10)
	DW_MoveToFlag(tony,780677 , 1,0 ,1)	
	delobj(tony)
	Sleep(20)
	DisableQuest(OwnerID(),false)
	CancelBuff( TargetID()  , 506971  ) 	--
end
function LuaS_423319_1()
	local Dis =  GetDistance( OwnerID() , TargetID() )					---�Z���W�L50����
	if	Dis > 50 then
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204592_2]" ,  "0xFFFFFF00" ) 	---
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204592_2]" ,  "0xFFFFFF00" )
		CloseSpeak( OwnerID() )
	else
		SetSpeakDetail(OwnerID(),"[SC_423319_2]")			---�t��g�J���㦳�ۧڷN�ѡA�]�㦳�P�H��ܪ���O�C
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423319_3]","LuaS_423319_2",0)	--�ھզ����J�ե��|�ˤF�A���ڤH�A�i�_�ѧA�a���O�H
		SetFlag(OwnerID(),544212,1)		
	end
end

function LuaS_423319_2()
	local Dis =  GetDistance( OwnerID() , TargetID() )					---�Z���W�L50����
	if	Dis > 50 then
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204592_2]" ,  "0xFFFFFF00" ) 	---
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204592_2]" ,  "0xFFFFFF00" )
		CloseSpeak( OwnerID() )
	else
		SetSpeakDetail(OwnerID(),"[SC_423319_5]")			---�]�n�A�קK�L�ת�����...
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423319_6]","LuaS_423319_3",0)	--�n�A�ګO�ҡA���F�۵M�P�M���C
		SetFlag(OwnerID(),544213,1)	
	end
end

function LuaS_423319_3()
	local Dis =  GetDistance( OwnerID() , TargetID() )					---�Z���W�L50����
	if	Dis > 50 then
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204592_2]" ,  "0xFFFFFF00" ) 	---
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204592_2]" ,  "0xFFFFFF00" )
		CloseSpeak( OwnerID() )
	else
		SetSpeakDetail(OwnerID(),"[SC_423319_8]")			---�ڤ]�O�ҡA�N�|���Ѩ�U�A�����_�۵M�P�M���C
		SetFlag(OwnerID(),544214,1)	
	end
end

