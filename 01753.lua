-------------------
-------------------


function LuaS_422050_114459()
--���b�ѥֺ����U
	WriteRoleValue (OwnerID(), EM_RoleValue_IsWalk, 1)
	SetIdleMotion( OwnerID() ,ruFUSION_ACTORSTATE_CROUCH_LOOP)
	Sleep(100)
	while 1 do
		WriteRoleValue (OwnerID(), EM_RoleValue_IsWalk, 1)
		PlayMotion( OwnerID() ,  ruFUSION_ACTORSTATE_EMOTE_CRY )--
		Sleep(30)
		PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SURRENDER)
		Yell(OwnerID(),"[SC_422050_1]",3)		--�ҤH�A���g�@�ڧa���
		Sleep(30)
		--PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_CROUCH_BEGIN)
		--PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_CROUCH_LOOP)
		--Sleep(20)
		PlayMotion( OwnerID() ,  ruFUSION_ACTORSTATE_EMOTE_CRY )	--���_
		Sleep(30)
		PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SURRENDER)
		Sleep(20)
		DW_MoveToFlag(OwnerID(),780568,2,0,1)
		PlayMotion( OwnerID() ,  ruFUSION_ACTORSTATE_EMOTE_CRY )	--���_
		DW_MoveToFlag(OwnerID(),780568,3,0,1)
		PlayMotion( OwnerID() ,  ruFUSION_ACTORSTATE_EMOTE_CRY )	--���_
		DW_MoveToFlag(OwnerID(),780568,4,0,1)
		PlayMotion( OwnerID() ,  ruFUSION_ACTORSTATE_EMOTE_CRY )	--���_
		Say(OwnerID(),"[SC_422050_0]")	--�p�D�H�A�ѥֺ��S�O�@�n�A�A�ѥֺ��藍�_�A�ڡI
		Sleep(40)
		PlayMotion( OwnerID() ,  ruFUSION_ACTORSTATE_EMOTE_CRY )	--���_
		Sleep(30)
		DW_MoveToFlag(OwnerID(),780568,1,0,1)
		PlayMotion( OwnerID() ,  ruFUSION_ACTORSTATE_EMOTE_CRY )	--���_
		Sleep(30)
		PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_CROUCH_BEGIN)
		PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_CROUCH_LOOP)
		Sleep(3000)
	end
end

function LuaS_422050_114761()
--���b�ѥֺ����U
	SetDefIdleMotion( OwnerID() ,ruFUSION_ACTORSTATE_CROUCH_LOOP)
end



-------------------
-------------------
function LuaS_422050_114458()
--���b��Ѥ��U
	while 1 do
		Sleep(30)
		PlayMotion( OwnerID() ,  ruFUSION_ACTORSTATE_EMOTE_CUTE2)
		Yell(OwnerID(),"[SC_422050_2]",3)	--
		Sleep(20)
		PlayMotion( OwnerID() ,  ruFUSION_ACTORSTATE_EMOTE_CRY )
		Sleep(30)
		PlayMotion( OwnerID() ,  ruFUSION_ACTORSTATE_EMOTE_CRY )
	
		Sleep(1800)
		PlayMotion( OwnerID() ,  ruFUSION_ACTORSTATE_EMOTE_CRY   )
		Sleep(20)
		Say(OwnerID(),"[SC_422050_3]")
		PlayMotion( OwnerID() ,  ruFUSION_ACTORSTATE_EMOTE_CUTE2 )
		Sleep(1800)
	end
end



-------------------
-------------------
function LuaS_422077_114422()
--���b114422�J�R�_���ܼ@�����U	

	SetDefIdleMotion( OwnerID() ,ruFUSION_ACTORSTATE_SLUMBER_LOOP)

end


function LuaS_422077_0()
--���b�ѧ�����422077����AOwner�ONPC


		DisableQuest( OwnerID() , true )					--���npc
--		AddBuff( TargetID()  , 503977 , 1 , 300 ) 				--����a
		Sleep(30)
		local Jari = Lua_DW_CreateObj("flag" ,114689,780568,10) 	--�إX�ǭY��
		
		
		Say(Jari ,"[SC_422077_0]")			
		--�ǭY�̥X�{�G�����A����.......
		Sleep(20)
		AdjustFaceDir( OwnerID() , Jari ,0 )
		Say(Jari,"[SC_422077_1]")			
		--�ǭY�̡G�����A�藍�_�A�ڨS���������ǵs��A�ϦӳQ�L�̢w�w
		Sleep(30)
		
		Say(OwnerID(),"[SC_422077_2]")	
		--�J�R�_��G�ǭY�̡A�S���Y�A�u�n�A�^�ӴN�n�F�I

		Sleep(30)

		PlayMotionEX( Jari ,ruFUSION_ACTORSTATE_CROUCH_BEGIN,ruFUSION_ACTORSTATE_CROUCH_LOOP)
		Say(Jari,"[SC_422077_3]")			
		--�ǭY�̡G���A�M���˪��Ĥl�A�٦��w�R���o�ӥi�R���f�f�A�ګܩ��֡C
	Sleep(30)
	PlayMotion( OwnerID() ,  ruFUSION_ACTORSTATE_SLUMBER_END)

	Yell(OwnerID(),"[SC_422077_4]",3)	
	--�J�R�_��G���I�ګ��N����A�H
	Sleep(20)	
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_CRY)
	Sleep(40)

	
		Yell(Jari,"[SC_422077_5]",3)			
		--�ǭY�̡G�����A�w�R���ȱI��A�A�M�����A���ڭ̲K�ӧ̧̩Ωf�f�A���ڳ���o�C	
		Sleep(20)
		Yell(Jari,"[SC_422077_6]",3)	
		--�ǭY�̡G�ڷ|�û��b�A�̨���......
		PlayMotion( Jari ,ruFUSION_ACTORSTATE_CROUCH_END)
		Sleep(20)
		Yell(OwnerID(),"[SC_422077_7]",3)
		--�J�R�_��G�ǭY�̡B�ǭY��......
		CastSpell(Jari,Jari,494840)
		PlayMotion( OwnerID() ,  ruFUSION_ACTORSTATE_SLUMBER_END)
		Sleep(20)
		CastSpell(Jari,Jari,490101)
		Hide(Jari)

		Sleep(30)
		PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_CRY  )
		Sleep(30)
		PlayMotionEX( OwnerID() ,ruFUSION_ACTORSTATE_DAZED_BEGIN,ruFUSION_ACTORSTATE_DAZED_LOOP)

		
		Sleep(20)
	
		PlayMotionEX( OwnerID() ,ruFUSION_ACTORSTATE_SLUMBER_BEGIN,ruFUSION_ACTORSTATE_SLUMBER_LOOP)
--		CancelBuff( TargetID()  , 503977  ) 	--�٪��a�ۥ�
		DisableQuest( OwnerID() ,false )
		SetFlag(TargetID(),543800,1)		--���X�СA���h�J�R�_��114422�A�{�X114949
		Delobj(Jari)
		
end


---------------------------------------
---------------------------------------
function LuaS_422078_0() --���b����NPC��Ƿ窺��ܼ@��
	LoadQuestOption(OwnerID())
	if	Checkflag(OwnerID(),543721)== true		then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422078_0]","LuaS_422078_1",0)		--�u�ڨ̬��ӳX.......�v
	end
end

function LuaS_422078_1()
	SetSpeakDetail(OwnerID(),"[SC_422078_1]")	--
	SetFlag(OwnerID(),543722,1)	--���X�ХH��������
end



--------------------------------------------
--------------------------------------------
function LuaS_422078_114610()
--���b���`����Ƿ�Ұ����U
	while 1 do
		Sleep(30)
		PlayMotion( OwnerID() ,  ruFUSION_ACTORSTATE_EMOTE_SPEAK	)
		Sleep(70)
		PlayMotion( OwnerID() ,  ruFUSION_ACTORSTATE_EMOTE_SPEAK	)
		Sleep(70)
		PlayMotion( OwnerID() ,  ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
		Sleep(50)
		PlayMotion( OwnerID() ,  ruFUSION_ACTORSTATE_EMOTE_SPEAK	)
		Sleep(1800)
	end
end


--------------------------------------------
--------------------------------------------

--============================================================================================================	
--�s���O
--============================================================================================================		
	
--�Ѿm�l114841

function LuaS_421598_0() --���b����NPC�Ѿm�l����ܼ@��
	LoadQuestOption(OwnerID())
		if 	CheckAcceptQuest(OwnerID(),421598)==true 	and
			CountBodyItem( OwnerID() , 207030 )<1	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_421598_1]","LuaS_421598_1",0)	--�A�N�O�Ѿm�l�����i�H
		end
end

function LuaS_421598_1()
	SetSpeakDetail(OwnerID(),"[SC_421598_2]")	--�A�{�ѦѾm�l�����i�H�i�O�Ѿm�l�����i���{�ѧA�o��������ڷQ�R���p�V�J�I
	AddSpeakOption(OwnerID(),TargetID(),"[SC_421598_3]","LuaS_421598_2",0)	--ͺ�g���|�ӤF�A�o�w�g���D�A�����ƤF�C
end

function LuaS_421598_2()
	CloseSpeak(OwnerID())
	ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_421598_4]" , 0 )	
	ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_421598_4]" , 0 )	
	Beginplot(TargetID(),"LuaS_421598_3",0)
end

function LuaS_421598_3()
	DisableQuest( OwnerID() , true )
--	LockObj( OwnerID(), 1, TargetID() )	
	local ugly = Lua_DW_CreateObj("flag" ,103130,780571,1) 
	Hide(OwnerID())
    local player="here"
	local ugly1 = Lua_DW_CreateObj("flag" ,103311,780571,2) 
	local ugly2 =Lua_DW_CreateObj("flag" ,103311,780571,3) 
	SetAttack(ugly , TargetID())
	SetAttack(ugly1 , TargetID())
	SetAttack(ugly2, TargetID())
	Sleep(50)
	
	
	for i=1,60000,1 do
		if 	GetDistance( TargetID(), OwnerID()) >500   or
			ReadRoleValue(TargetID() , EM_RoleValue_IsDead)==1 	or
			CheckID(TargetID()) == false	then
			player="Nothere"
			break	
		end
		
		if 	CheckID(ugly) == false	then
			break
		end
		Sleep(10)
	end
	
	if player=="Nothere" then
		--Sleep(30)
		DW_MoveToFlag(ugly,780571,1,0,1)
		DW_MoveToFlag(OwnerID(),780571,1,0,1)
		Hide(ugly)
		DelObj(ugly)
--		LockObj( OwnerID(), 0, 0 )
		Show(OwnerID(),0)
		DisableQuest( OwnerID() , false )
--		LuaFunc_ResetObj( OwnerID())
		Sleep(30)
		Delobj(ugly1)
		Delobj(ugly2)
	end
	
	Sleep(30)
	
	if 	CheckID(ugly) == true 	then
		Yell(ugly,"[SC_421598_7]",3)
		SetStopAttack(ugly)
		SetStopAttack(ugly1)
		SetStopAttack(ugly2)
		DW_MoveToFlag(ugly,780571,1,0,1)
		DW_MoveToFlag(OwnerID(),780571,1,0,1)
		BeginPlot(ugly1,"LuaS_421598_4",1)
		BeginPlot(ugly2,"LuaS_421598_5",1)
		Hide(ugly)
		DelObj(ugly)
		Show(OwnerID(),0)
		Sleep(30)
		Delobj(ugly1)
		Delobj(ugly2)
		DisableQuest( OwnerID() , false )
	else
	
		Yell(ugly1, "[SC_421598_5]", 3 )
		Yell(ugly2, "[SC_421598_6]", 3 )
		SetStopAttack(ugly1)
		SetStopAttack(ugly2)
		BeginPlot(ugly1,"LuaS_421598_4",1)
		BeginPlot(ugly2,"LuaS_421598_5",1)

		Sleep(50)
		Show(OwnerID(),0)
		DisableQuest( OwnerID() , false )
--		LockObj( OwnerID(), 0, 0 )
--		 LuaFunc_ResetObj( OwnerID())
	end
			
end

	
function LuaS_421598_4()
	DW_MoveToFlag(OwnerID(),780571,4,0,1)
	Delobj(OwnerID())
end

function LuaS_421598_5()
	DW_MoveToFlag(OwnerID(),780571,5,0,1)
	Delobj(OwnerID())
end




-------------------------------
function Lua_421591_0()
	SetPlot(OwnerID(), "touch","Lua_421591_1", 20 )
end

Function Lua_421591_1()
	if	CheckAcceptQuest(OwnerID(),421594)==false then
		SetFlag(OwnerID(),543799,1)

		DW_Border(421594) 
	end
end




		