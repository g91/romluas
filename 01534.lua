function LuaS_422726_0()-----���b���~SERVER�ݼ@��...�̦̹L������
	if ReadRoleValue(TargetID(),EM_RoleValue_OrgID) ~= 102648	then -------
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422726_0]", 0 ); -----�o��[205871]���G�u���[113447]�ϥΡC
		return false
	end

	if GetDistance(TargetID(), OwnerID() ) > 120  then -------�Z��
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422726_4]", 0 ); -----�Z���ӹL�����A�L�k�ϥ�[205871]�C
		return false
	end

	if	ReadRoleValue(TargetID(),EM_RoleValue_HP)/ReadRoleValue(TargetID(),EM_RoleValue_MaxHP)	>0.5	then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422726_1]", 0 ); ----[113447]���O�ä㤤�A�A�L�k���Q�ϥ�[205871]�C
		return false
	end


	if	ReadRoleValue( TargetID(), EM_RoleValue_IsDead) == 1 then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204638_6]" , 0 ) --�e�w�g���F�C
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204638_6]" , 0 )
		return false
	end

--	if ReadRoleValue(TargetID(),EM_RoleValue_IsAttackMode) ~= 0 and then -------
	--	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422726_5]", 0 ); -----�o��[205871]���G�u���[113447]�ϥΡC
	--	return false
	--end
	return true
end

function LuaS_422726_1()
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422726_2]", 0 ); -------�A���[113447]�F�I
	DelBodyItem(OwnerID(),205871,1)
	GiveBodyItem(OwnerID(),205872,1)
	CallPlot(TargetID(),"LuaFunc_ResetObj",TargetID())
	UseItemDestroy() 
end
-------------------------------------------------------------------------
function LuaS_422727_0()----�M��p��
	if (CheckCompleteQuest(OwnerID(),422742)==true ) then
		if 	(CheckAcceptQuest(OwnerID(),422877)==false )  then
			SetSpeakDetail( OwnerID(), "[SC_422727_777]"  ) 
		end
		if 	(CheckAcceptQuest(OwnerID(),422877)==true )  then
			SetSpeakDetail( OwnerID(), "[SC_422877_1]"  ) 
		end
	elseif (CheckAcceptQuest(OwnerID(),422877)==true )  and (CheckCompleteQuest(OwnerID(),422727)==true ) then
		SetSpeakDetail( OwnerID(), "[SC_422877_1]"  ) 
	else
  		LoadQuestOption( OwnerID())
	end

	if (CheckAcceptQuest(OwnerID(),422877)==true )and(CheckFlag(OwnerID(),543509)==false )  then
		if  (CheckFlag(OwnerID(),543515)==true )  then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422877_4]","LuaS_422877_4",0) 
		end
		if  CountBodyItem( OwnerID() , 206454 ) > 0 	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422877_2]","LuaS_422877_3",0)
		end
	end

	if (CheckAcceptQuest(OwnerID(),422727)==true )and (CheckFlag(OwnerID(),543295)==false )and(ReadRoleValue( TargetID() , EM_RoleValue_PID )  == 0)then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422727_1]","LuaS_422727_1",0) --���O��M���I�ڷ|��[113447]�a�ۧڥh�I
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422727_2]","LuaS_422727_2",0) --���򯵱K��a�� �H�ڤ��Q�h�I
	end
	if (CheckAcceptQuest(OwnerID(),422727)==true ) and (CheckFlag(OwnerID(),543295)==false )and(ReadRoleValue( TargetID() , EM_RoleValue_PID ) >=1)then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422727_1]","LuaS_422727_7",0) --���O��M���I�ڷ|��[113447]�a�ۧڥh�I
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422727_2]","LuaS_422727_2",0) --���򯵱K��a�� �H�ڤ��Q�h�I
	end
end



function LuaS_422727_1()---�ϥκX��  780432  ���n���~ �p�ᱱ�
                CloseSpeak( OwnerID())
	BeginPlot( TargetID(), "LuaS_422727_3", 0)
                end
function LuaS_422727_3()
               	local MM = Lua_DW_CreateObj("flag",113447,780432, 0 )
               	WriteRoleValue(OwnerID(),EM_RoleValue_PID,1)
                Yell(OwnerID(),"[SC_422727_4]",0)-----�n�A[113447]�n�Ĩıa��[$PLAYERNAME]��I
                Yell(MM,"[SC_422727_5]",1)--�L���  
               	DW_MoveToFlag( MM , 780432 , 1, 0 ,1 )
	DW_MoveToFlag( MM , 780432 , 2, 0 ,1 )
	Yell(MM,"[SC_422727_6]",0)--�L��......�L��......
	DW_MoveToFlag( MM , 780432 , 7, 0 ,1 )
                Yell(MM,"[SC_422727_6]",0)--�L��......�L��......
          	DW_MoveToFlag( MM , 780432 , 8, 0 ,1 )
	sleep(20)
	DW_MoveToFlag( MM , 780432 , 9, 0 ,1 )
          	DW_MoveToFlag( MM , 780432 , 10, 0 ,1 )
                Yell(MM,"[SC_422727_6]",0)--�L��......�L��......
	sleep(20)
             	DW_MoveToFlag( MM , 780432 , 3 , 0  ,1 )
                Yell(MM,"[SC_422727_7]",3)--�L���L���L�L�C
	sleep(20)
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422727_8]", 0 ); 
                sleep(20)             
              	local FF = Lua_DW_CreateObj("flag",113452 ,780432,4)
                DisableQuest(FF,true)
                DW_MoveToFlag( FF , 780432 , 5, 0 ,1 )
                Yell(FF,"[SC_422727_9]",2)----�����A�n����n�H
	sleep(20)
	Yell(MM,"[SC_422727_7]",0)
	DW_MoveToFlag( MM , 780432 , 6 , 0 ,1 )
	sleep(20)                
	Yell(FF,"[SC_422727_10]",3)--- �ޡA�A�O���������a�ӳo���ܡH
	sleep(20)
	if CheckID( TargetID() ) == true and CheckAcceptQuest(TargetID() , 422727) == true then
	                SetFlag(TargetID(),543294,1)   
	end
                sleep(25)
                DelObj(MM)
	WriteRoleValue(OwnerID(), EM_RoleValue_PID,0)
	sleep(25)
                DisableQuest(FF,false)
                DelObj(FF)
end

function LuaS_422727_7()
	SetSpeakDetail(OwnerID(),"[SC_422727_11]")---���[113445]�O�³J�A�X��[113445]���ܮɰ��Ȩ��C
end		

function LuaS_422727_2()
	SetSpeakDetail(OwnerID(),"[SC_422727_3]")---�A�u�����Q�h���K��a�ܡH���Y���n�h�n�h�M�A�@�˪��H���
end	

function LuaS_422727_8()
             	LoadQuestOption( OwnerID() )
                if (CheckAcceptQuest(OwnerID(),422727)==true )and ( CheckFlag(OwnerID(),543295)==false ) then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422727_12]","LuaS_422727_9",0)---�O���A�аݧA�O�p��ܡH
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422727_15]","LuaS_422727_10",0)---�аݳo�̦��ӥs�p�᪺�H�ܡH         

               end
end

function LuaS_422727_9()
             	SetSpeakDetail(OwnerID(),"[SC_422727_13]")---�O�֡H�֤��\�A�s�ڤp�᪺�H�S�O���Ӷ̧��a�Ӫ��H�H
	SetFlag(OwnerID(),543295,1)
end

function LuaS_422727_10()
             	SetSpeakDetail(OwnerID(),"[SC_422727_14]")---�p��H�o�̨S���o�ӤH�I
end

--------------------------------------------------------
---------------------------------------------------------------------------
function LuaS_422729()------���˪��h�L���
             	LoadQuestOption( OwnerID() )
                if (CheckAcceptQuest(OwnerID(),422729)==true )and  (CheckFlag(OwnerID(),543297)==false )then
                    AddSpeakOption(OwnerID(),TargetID(),"[SC_422729_1]","LuaS_422729_1",0)---1.	���F�ܡH

               end
end

function LuaS_422729_1()
             	SetSpeakDetail(OwnerID(),"[SC_422729_2]")---2.	�y�y��S����K�K
	SetFlag(OwnerID(),543297,1)
end

--------------------------------------------------------------

---------�����]  ���]���� ��2�� �A1.���Q���o�F��A�ܦ�SNPC(30���R��) 2.�S�����Q���U�A�����������a�C

function LuaI_205878_Check()----���~�ˬd�@��
	if CheckAcceptQuest( OwnerID() , 422732 ) == false or CountBodyItem( OwnerID() , 205875 ) >= 5 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204592_0]" , 0 ) --�ثe���ݭn�o�ӪF��
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204592_0]" , 0 )
		return false
	end
	local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	if OrgID ~= 102512 or ReadRoleValue( TargetID() , EM_RoleValue_IsDead) == 1 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_205878_3]" , 0 ) --�L�k��[102512]�H�~���ͪ��ϥΡC
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_205878_3]" , 0 )
		return false
	end
	if GetDistance( OwnerID() , TargetID() ) > 150 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_205878_4]" , 0 ) --�Z��[102512]�L���A[205878]�L�k�o���į�C
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_205878_4]" , 0 )
		return false
	end
	if ReadRoleValue( TargetID() , EM_RoleValue_IsAttackMode ) ~= 0 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204592_3]" , 0 ) --�ؼХ��b�԰���
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204592_3]" , 0 )
		return false
	end
	return true
end

function LuaI_205878_1()----�ϥΪ��~��C
	if ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 102512 then
		BeginPlot( TargetID() , "LuaI_205878_2" , 0 )
	end
end

function LuaI_205878_2()
	CastSpell( OwnerID() , OwnerID() , 491032)----�I��k�N�b���]���W
	sleep(20)
	Hide( OwnerID() )
    	local KK = LuaFunc_CreateObjByObj( 102669 , OwnerID() )
    	local QQ = DW_Rand(100)
    		if QQ > 60   then
    		  SetRoleCamp(KK , "SNPC" )
		if CheckID( TargetID()  ) == true then
	    		  ScriptMessage(  TargetID()  , TargetID() , 1 , "[SC_205878_1]" , 0 )
    			  Givebodyitem(TargetID(),205875,1)
		end
    		  sleep(50)
    		  CallPlot(KK,"LuaFunc_Obj_Suicide",70)
    		else
		if CheckID( TargetID()  ) == true then
	    		  ScriptMessage( OwnerID() , TargetID() , 1 , "[SC_205878_2]" , 0 )----�A�S���Ѷ}[102512]���W����C
		end
    		  sleep(350)
		if CheckID( TargetID()  ) == true then
	    		  SetAttack(KK,TargetID())
		end
    		  CallPlot(KK,"LuaFunc_Obj_Suicide",70)
    		  end
      			Sleep(50)
                                                 LuaFunc_ResetObj( OwnerID() )
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------
-----�R�����l
--function LuaS_422734_0()----Ĳ�I�@��
	--SetPlot( OwnerID() , "touch" , "LuaI_422734_01" , 40 )
--end

function LuaQ_422734_BeforClick()
	if CountBodyItem( OwnerID() ,205876) < 1 then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422734_1]" , 0 ) --�A�S������
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_422734_1]" , 0 ) --�A�w�g���@��[205424]�F
		return -1
	else
		return 1
	end
end

--function LuaS_422734_1()---�R�����~205876�A�����n�X��543328�C
	--if (CheckAcceptQuest(OwnerID(),422734)==true )and(CheckFlag(OwnerID(),543328)==false )and(CountBodyItem (OwnerID() ,205876)>0) then
	--DelBodyItem ( OwnerID() , 205876 , 1 )
	--Setflag(OwnerID(),543328)
   	--else
	--ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422734_1]", 0 )--�S��[205876]�A�L�k�t���}�a[113451]�C
--end
--end
--------------------------------------------------------
function Lua_205881_0()---���b�t�諸
	if Lua_ExGetZone( OwnerID())  == 9 	then
		if	DW_CheckDis(OwnerID(),780434,0,75)  and ( Checkflag( OwnerID() , 543326 ) ==true )	then
			Sleep(10)
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_205881_4]", 0)---�j�P���T���A �Ѫ���ǻ��X�A�^��[205881]���n�T�D�`��աA�ǻ��ܧA���������W�C
			SetFlag(OwnerID() , 543308,1) 
			return
		end
		if	DW_CheckDis(OwnerID(),780434,0,150)  and ( Checkflag( OwnerID() , 543326) ==true )	then
			Sleep(10)
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_205881_3]", 0) ---�M�����T���A�Ѫ���ǻ��X�A�^��[205881]���n�T�Q����P�A�ǻ��ܧA���������W�C
                                                SetFlag(OwnerID() , 543308,1)    
			return                                           
		end
		if	DW_CheckDis(OwnerID(),780434,0,300) and ( Checkflag( OwnerID() ,  543326 ) ==true )	then
			Sleep(10)
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_205881_2]", 0 )--���j���T���A��[ZONE_THE BOILING VALLEY]���ǻ��X�A�^��[205881]���n�T�v����P�A�ǻ��ܧA���������W�C
			return
		end        
		if             DW_CheckDis(205881,780434,0,500)  and ( Checkflag( OwnerID() ,  543326) ==true )	then
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_205881_1]", 0 )--�L�z���T���A��[ZONE_THE BOILING VALLEY]���ǻ��X�����M�����n�T�A�^���ܧA���������W�C
			Sleep(10)
			return
		end
		if             DW_CheckDis(OwnerID(),780434,0,800) and ( Checkflag( OwnerID() , 543326) ==true )	then
                                               Sleep(10)
                                               ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_205881_0]", 0 )--�T���L�z�A�_�_���򪺥�[ZONE_THE BOILING VALLEY]��V�ǨӡA�^����A���������W�C
			return
                                end
                	if	Lua_ObjAreaCheck(OwnerID() , 718) ==false then
                		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_205881_5]", 0 )    ---�������L�k�����o�Ӱϰ쪺�T���C
			return
		end
	else
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_205881_5]", 0 )    ---�������L�k�����o�Ӱϰ쪺�T���C

end
end



function Lua_113448_0()---���   �X�СG780434  [��������2]---���X�Ы᪺��t
 	SetPlot( OwnerID() , "Range" , "LuaI_113448_1" , 100 )
end
function LuaI_113448_1()
                if(CheckAcceptQuest( OwnerID() , 422731 ) == true ) and ( Checkflag( OwnerID() , 543308 ) ==false ) and ( CountBodyItem( OwnerID() , 205881 ) >=1 ) then
               		 SetFlag(OwnerID() , 543308,1)
                      return
                end 
	if(CheckAcceptQuest( OwnerID() , 422731 ) == true ) and ( Checkflag( OwnerID() , 543308 ) ==true ) and ( CountBodyItem( OwnerID() , 205881 ) >=1 ) and ReadRoleValue( TargetID() , EM_RoleValue_PID ) == 0 then 
		WriteRoleValue( TargetID() , EM_RoleValue_PID , 1 )
                	BeginPlot(TargetID() , "LuaI_113348_2" , 0 )

	end
end
function LuaI_113348_2()
	local CC = Lua_DW_CreateObj("flag" ,113437,780434,1 )                
	local KK = Lua_DW_CreateObj("flag" ,113438,780434,2 )                
	local FF  = Lua_DW_CreateObj("flag" ,113439,780434, 3)
                DisableQuest( KK , true )
	DisableQuest( CC , true )
	DisableQuest( FF , true )
                DW_MoveToFlag( KK , 780434 , 4 , 0  ,1 )
	if CheckID(TargetID()) then
		AdjustFaceDir( KK, TargetID() , 0 )
	end
	PlayMotion( KK, ruFUSION_ACTORSTATE_EMOTE_WAVE)
                SAY(KK, "[SC_113348_1]")----�N~���C�n���A�L�ӳo��I
                SLEEP(30)
	PlayMotion( CC, ruFUSION_ACTORSTATE_EMOTE_POINT)
	if CheckID(TargetID()) then
		AdjustFaceDir( CC, TargetID() , 0 )
	end
                SAY(CC,"[SC_113348_2]")---�_�I�̡A�ϥ�[205881]���H�N�O�A��a�H
	SLEEP(20)
	SAY(CC,"[SC_113348_3]")--�i�D�ڡA������[113444]���F��|�b�A��W�H
	if CheckID( TargetID() ) == true and CheckAcceptQuest(TargetID() , 422731) == true then
         	       Setflag(TargetID() , 543309,1)
	end
                DisableQuest( KK , false )
	DisableQuest( CC , false )
	DisableQuest( FF , false)
	SLEEP(30)
                DelObj(KK)
	DelObj(CC)    
	DelObj(FF)    
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 )
END

---------------------------------------------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------
function LuaI_205883() --�H�󤺮e
	ClearBorder( OwnerID() );
	AddBorderPage( OwnerID(), "[SC_205883]");
	ShowBorder( OwnerID(), 0, "[205883]", "ScriptBorder_Texture_Paper" );
end


-----------------------------------------
function LuaI_422731_0()
	if (CheckAcceptQuest(OwnerID(),422731)==true ) and (CountItem(OwnerID() ,205882)<= 0) then
		GiveBodyItem(OwnerID(),205882,2)
		GiveBodyItem(OwnerID(),205881,1)
	else
		GiveBodyItem(OwnerID(),205881,1)
	end
end

function LuaM_422568_11() --��b�򥻪k�N 503966 ��½������W��Ĳ�o�@��
	if	Lua_ObjAreaCheck(OwnerID() , 718) ==false	then
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422568_1]" , 0)-----���u�ޫH�����A�ϥεL�ġC
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422568_1]" , 0)-----���u�ޫH�����A�ϥεL�ġC
		UseItemDestroy()
		return false
            	else
		return true
end
end

function LuaM_422568_0() --��b�򥻪k�N 503966 ��½������W��Ĳ�o�@��
	if	Lua_ObjAreaCheck(OwnerID() , 718) ==false	then
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422568_1]" , 0)-----���u�ޫH�����A�ϥεL�ġC
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422568_1]" , 0)-----���u�ޫH�����A�ϥεL�ġC
		return
              else
		BeginPlot( TargetID() , "LuaM_422568_1" , 0 )
end
end
function LuaM_422568_1() ----�p�G���u�����O102515 102516 10213--1/3     102518 ~20  1/2      102512 102517---1/15 ��             
	local OrgID = ReadRoleValue( OwnerID() , EM_RoleValue_OrgID )
	local MaxHP = ReadRoleValue(OwnerID() , EM_RoleValue_MaxHP )
		if  OrgID == 102515 or OrgID == 102516 or   OrgID == 102513  then
			sleep(10)
			if 	ReadRoleValue(  OwnerID() , EM_RoleValue_HP ) <= MaxHP/10	then
				BeginPlot(OwnerID() , "LuaM_503966_2" , 0 )
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422568_2]" , 0 ) --���u���~�A�Q�Ǫ����������}�C
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422568_2]" , 0 )
				return
			end
			if 	ReadRoleValue(  OwnerID()  , EM_RoleValue_HP ) <= MaxHP/3 then
				WriteRoleValue( OwnerID() , EM_RoleValue_HP , 10 )
				AddBuff( OwnerID() , 503605 , 1 , 5 )
				PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_HURT_NORMAL )
				SetAttack( OwnerID() , TargetID() )
				return
			end
			if 	ReadRoleValue(  OwnerID()  , EM_RoleValue_HP ) > MaxHP/3 then
				AddRoleValue(  OwnerID() , EM_RoleValue_HP , -MaxHP/3 )	
				AddBuff( OwnerID() , 503605 , 1 , 5 )
				PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_HURT_NORMAL )
				SetAttack( OwnerID() , TargetID() )
				return		
			end 
		end
		if  OrgID == 102518  or  OrgID == 102519   or   OrgID == 102520     then
			sleep(10)
			if 	ReadRoleValue(  OwnerID()   , EM_RoleValue_HP ) < MaxHP/2	then
				BeginPlot( OwnerID() , "LuaM_503966_2" , 0 )
				WriteRoleValue( OwnerID() , EM_RoleValue_HP , 10 )
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422568_2]" , 0 ) --���u���~�A�Q�Ǫ��������}�C
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422568_2]" , 0 )
				return
			end
			if 	ReadRoleValue(  OwnerID()  , EM_RoleValue_HP ) == MaxHP/2 and ReadRoleValue(  OwnerID()  , EM_RoleValue_HP ) > MaxHP/100 then
				WriteRoleValue( OwnerID() , EM_RoleValue_HP , MaxHP/100)
				AddBuff( OwnerID() , 503605 , 1 , 5 )
				PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_HURT_NORMAL )
				SetAttack( OwnerID() , TargetID() )
				return
			end
			if 	ReadRoleValue(  OwnerID()  , EM_RoleValue_HP )> MaxHP/2 then
				AddRoleValue(  OwnerID() , EM_RoleValue_HP , -MaxHP/2 )
				AddBuff( OwnerID() , 503605 , 1 , 5 )
				PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_HURT_NORMAL )
				SetAttack( OwnerID() , TargetID() )
				return
			end 

		end	
		if  OrgID == 102517  or   OrgID == 102512   then
			sleep(10)
			if 	ReadRoleValue(  OwnerID() , EM_RoleValue_HP ) <= MaxHP/40	then
				BeginPlot( OwnerID() , "LuaM_503966_2" , 0 )	
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422568_2]" , 0 ) --���u���~�A�Q�Ǫ��������}�C
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422568_2]" , 0 )
				return
			end
			if 	ReadRoleValue(  OwnerID()  , EM_RoleValue_HP ) <= MaxHP/15 then
				WriteRoleValue( OwnerID() , EM_RoleValue_HP , 10 )
				AddBuff( OwnerID() , 503605 , 1 , 5 )
				PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_HURT_NORMAL )
				SetAttack( OwnerID() , TargetID() )
				return
			end
			if 	ReadRoleValue(  OwnerID()  , EM_RoleValue_HP ) >MaxHP/15 then
				AddRoleValue(  OwnerID() , EM_RoleValue_HP , -MaxHP/15 )
				AddBuff( OwnerID() , 503605 , 1 , 5 )
				PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_HURT_NORMAL )
				SetAttack( OwnerID() , TargetID() )
				return
			end 
	end
end




