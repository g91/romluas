function LuaS_423338_0()---115640(�g�J��)����ܼ@��
	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),423338)==true )and  (CheckFlag(OwnerID(),544247)==false )then
		AddSpeakOption(OwnerID(),TargetID()," [SC_423338_1]","LuaS_423338_1",0)--- �o�O����N��H
	end
end

function LuaS_423338_1()
	SetSpeakDetail(OwnerID(),"[SC_423338_2]")---
	if (CheckAcceptQuest(OwnerID(),423338)==true )and  (CheckFlag(OwnerID(),544247)==false ) then
		AddSpeakOption(OwnerID(),TargetID()," [SC_423338_3]","LuaS_423338_2",0)---����¼v�H
	end
end
function LuaS_423338_2()
	if (CheckAcceptQuest(OwnerID(),423338)==true )and  (CheckFlag(OwnerID(),544247)==false ) then
		SetSpeakDetail(OwnerID(),"[SC_423338_4]")---
		SetFlag( OwnerID(), 544247, 1 )
	end
end
-----------------------------------------------------------------
---(1)�����P���a�T��
---(2)�Q��CLIENT �����a �ݤ��ݱo���B�ΨU�g�[
function LuaS_423339_0()--�F�誺�d��@��
 	SetPlot( OwnerID() , "Range" , "LuaS_423339_1" , 150 )
end
function LuaS_423339_1()
	if	 CheckAcceptQuest( OwnerID() , 423339) == true  and CheckFlag( OwnerID(), 544248 )==false then
			ScriptMessage( OwnerID(),OwnerID(), 0, "[SC_423339_1]" , 0 )---�o�����ӴN�O�F�䪺�˪L��ɳB�C
			ScriptMessage( OwnerID(),OwnerID(), 1, "[SC_423339_1]" , 0 )---
	end
end

function LuaS_423339_EAST1()
	SetPlot( OwnerID() , "Touch" , "LuaS_423339_EAST2", 40)
end

function LuaS_423339_EAST2()
		if  CheckFlag( OwnerID(), 544248 )==true and CheckAcceptQuest(OwnerID() , 423339 ) == true and CountBodyItem( OwnerID(), 207706 )<1 then
		 	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423339_3]", 0 )		--�A�w�g�b���شӹL[207706]�C
		 	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423339_3]", 0 )		
		end
		if	 CheckFlag( OwnerID(), 544248 )==false and CheckAcceptQuest(OwnerID() , 423339 ) == true and CountBodyItem( OwnerID(), 207706 )<1 then
			 ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423339_2]", 0 )		--�S��[207706]�A�L�k�شӡC
		 	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423339_2]", 0 )
		end
		if 	 CheckFlag( OwnerID(), 544248 )==false and CheckAcceptQuest(OwnerID() , 423339 ) == true and CountBodyItem( OwnerID(), 207706 )>=1 then
				BeginPlot(  OwnerID(),  "LuaS_423339_EAST3" , 0 )
		end
		if	CheckAcceptQuest(OwnerID() , 423339 ) == false then 
				ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423339_6]", 0 )		--�S��[207706]�A�L�k�شӡC
		 		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423339_6]", 0 )
		end
end
function LuaS_423339_EAST3()---�F��
	DelBodyItem(  OwnerID(),  207706 , 1 )
	sleep(10)
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423339_4]", 0 )--�ؤl���Q���ͪ��X[115639]�C
	ScriptMessage(   OwnerID(),   OwnerID(), 1, "[SC_423339_4]", 0 )--�ؤl���Q���ͪ��X[115639]�C
	SetFlag(  OwnerID(),  544248, 1 )
end
-------------------------------------------------------------------------------
function LuaS_423339_WEST1()
		SetPlot( OwnerID() , "Touch" , "LuaS_423339_WEST2", 40)
end
function LuaS_423339_WEST2()
		if  CheckFlag( OwnerID(), 544249 )==true and CheckAcceptQuest(OwnerID() , 423339 ) == true then
			 ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423339_3]", 0 )		--�A�w�g�b���شӹL[207706]�C
		 	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423339_3]", 0 )
		end
		if	 CheckFlag( OwnerID(), 544249 )==false and CountBodyItem( OwnerID(), 207706 )<1 and CheckAcceptQuest(OwnerID() , 423339 ) == true then
			 ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423339_2]", 0 )		--�S��[207706]�A�L�k�شӡC
		 	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423339_2]", 0 )
		end
		if CheckFlag( OwnerID(),544249)==false and CheckAcceptQuest(OwnerID() , 423339 ) == true and CountBodyItem( OwnerID(), 207706 )>=1 then
			BeginPlot( OwnerID() , "LuaS_423339_WEST3" , 0 )
		end
		if	CheckAcceptQuest(OwnerID() , 423339 ) == false then 
				ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423339_6]", 0 )		--�S��[207706]�A�L�k�شӡC
		 		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423339_6]", 0 )
		end
end

function LuaS_423339_WEST3()--���� 115642
			DelBodyItem(   OwnerID() , 207706 , 1 )
			ScriptMessage(  OwnerID() ,  OwnerID(), 0, "[SC_423339_5]", 0 )---�ؤl�o�ͤF���ܡA���X�F[115642]�C
			ScriptMessage(  OwnerID() ,  OwnerID(), 1, "[SC_423339_5]", 0 )---�ؤl�o�ͤF���ܡA���X�F[115642]�C
			SetFlag( OwnerID(), 544249, 1 )
end

function LuaS_423339_4()--��誺�d��@��
 	SetPlot( OwnerID() , "Range" , "LuaS_423339_5" , 150 )
end
function LuaS_423339_5()
	if 	CheckAcceptQuest( OwnerID() , 423339) == true  and CheckFlag( OwnerID(), 544249 )==false then
		ScriptMessage( OwnerID(),OwnerID(), 0, "[SC_423339_7]" , 0 )---�o�����ӴN�O���䪺�˪L��ɳB�C
		ScriptMessage( OwnerID(),OwnerID(), 1, "[SC_423339_7]" , 0 )---
	end
end


function LuaS_423339_EAST_1()--�S��---���G���S�� (�٥��D��A�X�x)
	while true do
		sleep(20)
		CastSpell( OwnerID(), OwnerID(), 495917)
	end
end


function LuaS_423339_WEST_1()--�S��---�·t���S�� (�٥��D��A�X�x)
	while true do
		sleep(20)
		CastSpell( OwnerID(), OwnerID(), 495916)
	end
end
-----------------------------------------
function LuaS_423341_0()---
	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),423341)==true )and  (CheckFlag(OwnerID(),544250)==false )then
		AddSpeakOption(OwnerID(),TargetID()," [SC_423279_20]","LuaS_423341_1",0)--- ������H---���ΧO�H���r��C
	end
end

function LuaS_423341_1()
	if (CheckAcceptQuest(OwnerID(),423341)==true )and  (CheckFlag(OwnerID(),544250)==false )then
		SetSpeakDetail(OwnerID(),"[SC_423341_1]")---
		SetFlag( OwnerID(), 544250, 1 )
	end
end
---------------------
function LuaS_423342_USECHECK()
	if	CountBodyItem( OwnerID(), 207692 )>=5	then
		return -1
	else	
		return 1
	end
end
function LuaS_423342_After()
	WriteRoleValue ( TargetID() , EM_RoleValue_Register6 , OwnerID() )
	BeginPlot(TargetID(), "LuaS_423342_1" , 0 )
	return	true							
end

function LuaS_423342_1()
	local Player = ReadRoleValue(OwnerID(),EM_RoleValue_Register6 )
	local KK = LuaFunc_CreateObjByOBj( 104079, OwnerID() )
	SetAttack( KK , Player )
	AddToPartition( KK , 0 )
	BeginPlot(KK, "LuaQ_423342_sui" , 0 )						
end
function LuaQ_423342_sui() 
	LuaFunc_Obj_Suicide(6)
end

function LuaQ_423342_complete()
	DisableQuest(OwnerID() ,true)
	Say( OwnerID(), "[SC_423342_1]" );---���F�t���A�ЧȦ��A���l���C
	sleep(30)
	CastSpell( OwnerID(), OwnerID(), 495919 )----�|���M��A�X��
	sleep(20)
	Say( OwnerID(), "[SC_423342_2]" );--�a��ڭ̻����·t�C
	DisableQuest(OwnerID() ,flase)
end
--------------------------------------------------------
-------------423343
function LuaI_207693_0()
	if	ReadRoleValue(OwnerID(), EM_RoleValue_IsDead)==1	then
		return false
	end
	if CheckAcceptQuest( OwnerID() , 423343) == false or CountBodyItem( OwnerID() , 207694 ) >= 5 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204592_0]" , 0 ) --�ثe���ݭn�ϥγo�Ӫ��~
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204592_0]" , 0 )
		return false
	end
	local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	if OrgID ~= 103993  or ReadRoleValue( TargetID() , EM_RoleValue_IsDead) == 1 or ReadRoleValue( TargetID() , EM_RoleValue_Register) >0  or   CheckBuff(TargetID(),507173) ==true    then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204592_1]" , 0 ) --�ؼФ����T
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204592_1]" , 0 )
		return false
	end
--�ˬd�O�_���`
	if	ReadRoleValue(TargetID(),EM_RoleValue_IsDead)==1	then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422565_2]", 0 ); 
		return false
	end
	if GetDistance( OwnerID() , TargetID() ) > 110 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204592_2]" , 0 ) --�ؼжZ���L��
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204592_2]" , 0 )
		return false
	end
	if ReadRoleValue( TargetID() , EM_RoleValue_IsAttackMode ) ~= 0 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204592_3]" , 0 ) --�ؼХ��b�԰���
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204592_3]" , 0 )
		return false
	end
	return true
end

function LuaI_207693_1()
	UseItemDestroy()
	WriteRoleValue( TargetID() ,EM_RoleValue_Register , 1 )
	BeginPlot( TargetID() , "LuaI_207693_2" , 0 )
	GiveBodyItem( OwnerID() ,207694 , 1 )
end

function LuaI_207693_2()
	CastSpell( OwnerID() , OwnerID() , 491032)----�|�����k�N
	sleep(10)
	Hide( OwnerID() )
    	local QQ = DW_Rand(100)
    		if QQ > 50   then
			local KK = LuaFunc_CreateObjByObj( 103993 , OwnerID() )
			AddBuff(KK,507173,1,60)
	  		SetRoleCamp(KK , "Visitor" )
			Say( KK, "[SC_207693_1]" )---��...�n���x���n���b�j�T...�O�j�a�����_...
	PlayMotion( KK ,     ruFUSION_ACTORSTATE_EMOTE_STRETCH )
			sleep(20)
			Say( KK, "[SC_207693_2]" )---�����F�O�q�B���F�c�P��u�C
	PlayMotion( KK ,    ruFUSION_ACTORSTATE_SHIELD_BASH  )
			sleep(20)
			Say( KK, "[SC_207693_3]" )--�o�ǳ��O�i�H�Q�˱�...
	PlayMotion( KK ,    ruFUSION_ACTORSTATE_BUFF_BEGIN )
			--- ruFUSION_MIME_BUFF_SP01
			sleep(20)
			Say( KK, "[SC_207693_4]" )--���Ӭ����P��d�ˤ~��C
			local Dest = Role:new(OwnerID())
			local NewX = Dest :X()
			local NewY = Dest :Y()
			local NewZ = Dest :Z()
			MoveDirect( KK , NewX+50 , NewY , NewZ  )
			sleep(10)
			CallPlot(KK,"LuaFunc_Obj_Suicide",30)
		elseif QQ <= 50 and QQ > 20 then
			local KK = LuaFunc_CreateObjByObj( 103993 , OwnerID() )
			AddBuff(KK,507173,1,60)
			SetRoleCamp(KK , "Visitor")
			Say( KK, "[SC_207693_5]" )----�_�Ǫ��n���A�b�ߤ��j�T��...
	PlayMotion( KK ,     ruFUSION_ACTORSTATE_EMOTE_STRETCH )
			sleep(20)
			Say( KK, "[SC_207693_6]" )--���X��ɡA�S�����U�}�B�A�P���X�u�A����P�~�H
			sleep(20)
			Say( KK, "[SC_207693_7]" )--�۵M������...���w�Q���...
			sleep(20)
			Say( KK, "[SC_207693_8]" )--���F�O�q...�·t�N�b�ڭ̭��e�C
	PlayMotion( KK ,    ruFUSION_ACTORSTATE_SHIELD_BASH  )
			sleep(20)
			SetRoleCamp(KK ,"Monster")
			CallPlot(KK,"LuaFunc_Obj_Suicide",60)
		elseif QQ > 50 and QQ  <= 75 then
			local KK = LuaFunc_CreateObjByObj( 103993 , OwnerID() )
			AddBuff(KK,507173,1,60)
	PlayMotion( KK ,    ruFUSION_ACTORSTATE_SHIELD_BASH  )
			Say( KK, "[SC_207693_9]" )---�Y�n�h...�_�Ǫ��n����J�F�����A�A��ڰ��F����H
			if CheckID( TargetID()  ) == true then
				SetAttack(KK,TargetID())
			end
    		  	CallPlot(KK,"LuaFunc_Obj_Suicide",60)
    		else
			local KK = LuaFunc_CreateObjByObj( 103993 , OwnerID() )
			AddBuff(KK,507173,1,60)
			if CheckID( TargetID()) == true then
	    			ScriptMessage( OwnerID() , TargetID() , 1 , "[SC_207693_10]" , 0 )----[103993]���G�S������Ӥj���v�T�A�H�Y���V�A�ӨӡC
	    		  	SetAttack(KK,TargetID())
			end
    		  	CallPlot(KK,"LuaFunc_Obj_Suicide",60)
    		  end
     	Sleep(30)
	WriteRoleValue( OwnerID()  ,EM_RoleValue_Register , 0 )
     	Sleep(150)
        	LuaFunc_ResetObj( OwnerID() )
end
----------------------------------------------------------
---------(1)����BUFF(507166)==>�ΨӽT�{�i���i�H�ѻP�t��(�Q��CASESPELL495913) �אּ��H��(2)�إX���p���b���P��H (3)�ϥ�780565�X�l�C

function LuaS_423344_0()---115829(�ĤG�����p��)����ܼ@��
	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),423344)==true )and  (CheckFlag(OwnerID(),544251)==false )then
 		if	ReadRoleValue( TargetID() , EM_RoleValue_Register+1  ) == 0 then
			AddSpeakOption(OwnerID(),TargetID()," [SC_423344_1]","LuaS_423344_2",0)--- ���F�ܡH
		end
		if	ReadRoleValue( TargetID() , EM_RoleValue_Register+1  ) == 1 then
			AddSpeakOption(OwnerID(),TargetID()," [SC_423344_1]","LuaS_423344_1",0)--- ���F�ܡH
		end
	end
end
function LuaS_423344_1()---���H�b�t���ɡA�ҥX�{����ܡC
	SetSpeakDetail(OwnerID(),"[SC_423344_2]")---
end

function LuaS_423344_2()---�S���H�t���A�n�}�t�C
	CloseSpeak( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),423344)==true )and  (CheckFlag(OwnerID(),544251)==false )then
		WriteRoleValue( TargetID(), EM_RoleValue_Register+1 ,1) 
		BeginPlot( TargetID() , "LuaS_423344_3" , 0 )
	end
end
function LuaS_423344_3()---�إX�Ⱖ�t���C �]�wMM�O�g�J��  KK�O���p��
	AddBuff(TargetID(),507166,1,60)
	local KK = Lua_DW_CreateObj("flag" ,115831,780565,0,1 )---
	local MM = Lua_DW_CreateObj("flag" ,115830,780565,1,1 )---
	DisableQuest( KK ,true )
	DisableQuest( MM ,true )
	AdjustFaceDir( KK , MM, 0 )
	AdjustFaceDir(MM ,KK, 0 )
	SAY(KK,"[SC_423344_3]")---[115830]�A�o�Ǧ~�O�ӵL�~�H�ڥi�O�q���ѫo�p���ڤH���J�Z���o�Өƹ�C
	PlayMotion( KK ,  ruFUSION_ACTORSTATE_EMOTE_POINT)	
	sleep(30)
		if 	CheckID( TargetID() )== false  or (CheckAcceptQuest(TargetID(),423344)==false) or GetDistance( TargetID() , OwnerID() ) >250 then
					if     CheckID( TargetID() )== true and  (CheckAcceptQuest(TargetID(),423344)==true) and 	GetDistance( TargetID() , OwnerID() ) >250 and  CheckID( KK )== true 	 then
						ScriptMessage( TargetID() , TargetID() , 1 , "[SC_423349_11]" , 0 ) --�W�X�Z���A�z�S���������ȡC
						ScriptMessage( TargetID()  , TargetID() , 0 , "[SC_423191_11]" , 0 ) --�W�X�Z���A�z�S���������ȡC
					end		
			CancelBuff( TargetID() , 507166)
			delobj(KK)
			delobj(MM)
			WriteRoleValue( OwnerID(), EM_RoleValue_Register+1 ,0)
		end

	SAY(MM,"[SC_423344_4]")---�A�i�H�d�ƧڡA�����ण��A���ڤH���X����C
	sleep(20)
		if 	CheckID( TargetID() )== false  or (CheckAcceptQuest(TargetID(),423344)==false) or GetDistance( TargetID() , OwnerID() ) >250 then
					if     CheckID( TargetID() )== true and (CheckAcceptQuest(TargetID(),423344)==true) and 	GetDistance( TargetID() , OwnerID() ) >250 and  CheckID( KK )== true 	 then
						ScriptMessage( TargetID() , TargetID() , 1 , "[SC_423349_11]" , 0 ) --�W�X�Z���A�z�S���������ȡC
						ScriptMessage( TargetID()  , TargetID() , 0 , "[SC_423191_11]" , 0 ) --�W�X�Z���A�z�S���������ȡC
					end		
			CancelBuff( TargetID() , 507166)
			delobj(KK)
			delobj(MM)
			WriteRoleValue( OwnerID(), EM_RoleValue_Register+1 ,0)
		end

	SAY(KK,"[SC_423344_5]")--�ڦ����L�n�p����l���۵M���O�A�p�P��Q�����ѫo�F���F�t���ұоɪ��@���A���G�B���F���F���aģ�C
	PlayMotion( KK ,    ruFUSION_ACTORSTATE_SHIELD_BASH  )
	sleep(30)
		if 	CheckID( TargetID() )== false  or (CheckAcceptQuest(TargetID(),423344)==false) or GetDistance( TargetID() , OwnerID() ) >250 then
					if      CheckID( TargetID() )== true and  (CheckAcceptQuest(TargetID(),423344)==true) and 	GetDistance( TargetID() , OwnerID() ) >250 and  CheckID( KK )== true 	 then
						ScriptMessage( TargetID() , TargetID() , 1 , "[SC_423349_11]" , 0 ) --�W�X�Z���A�z�S���������ȡC
						ScriptMessage( TargetID()  , TargetID() , 0 , "[SC_423191_11]" , 0 ) --�W�X�Z���A�z�S���������ȡC
					end		
			CancelBuff( TargetID() , 507166)
			delobj(KK)
			delobj(MM)
			WriteRoleValue( OwnerID(), EM_RoleValue_Register+1 ,0)
		end

	SAY(MM,"[SC_423344_6]")--�ҥH�ڻ��ڿ��F...
	sleep(20)
	SAY(KK,"[SC_423344_7]")---�@�y���F�A������ܤ���C
	PlayMotion( KK ,  ruFUSION_ACTORSTATE_EMOTE_POINT)			
		if 	CheckID( TargetID() )== false  or (CheckAcceptQuest(TargetID(),423344)==false) or GetDistance( TargetID() , OwnerID() ) >250 then
					if     	 CheckID( TargetID() )== true and  (CheckAcceptQuest(TargetID(),423344)==true) and  GetDistance( TargetID() , OwnerID() ) >250 and  CheckID( KK )== true 	 then
						ScriptMessage( TargetID() , TargetID() , 1 , "[SC_423349_11]" , 0 ) --�W�X�Z���A�z�S���������ȡC
						ScriptMessage( TargetID()  , TargetID() , 0 , "[SC_423191_11]" , 0 ) --�W�X�Z���A�z�S���������ȡC
					end		
			CancelBuff( TargetID() , 507166)
			delobj(KK)
			delobj(MM)
			WriteRoleValue( OwnerID(), EM_RoleValue_Register+1 ,0)
		end

	sleep(20)
	SAY(MM,"[SC_423344_8]")---�ҥH�ڧ�A�ӡA�Q�n���ɧڪ��L���C
		if 	CheckID( TargetID() )== false  or (CheckAcceptQuest(TargetID(),423344)==false) or GetDistance( TargetID() , OwnerID() ) >250 then
					if      CheckID( TargetID() )== true and  (CheckAcceptQuest(TargetID(),423344)==true) and 	GetDistance( TargetID() , OwnerID() ) >250 and  CheckID( KK )== true 	 then
						ScriptMessage( TargetID() , TargetID() , 1 , "[SC_423349_11]" , 0 ) --�W�X�Z���A�z�S���������ȡC
						ScriptMessage( TargetID()  , TargetID() , 0 , "[SC_423191_11]" , 0 ) --�W�X�Z���A�z�S���������ȡC
					end		
			CancelBuff( TargetID() , 507166)
			delobj(KK)
			delobj(MM)
			WriteRoleValue( OwnerID(), EM_RoleValue_Register+1 ,0)
		end

	sleep(30)
	SAY(KK,"[SC_423344_9]")---���ǳ������n�A�ڭn���D�p�S��ڪ��ڤH���F����H���L�̦p���ԷĦb�۵M���O���C
	PlayMotion( KK ,   ruFUSION_ACTORSTATE_EMOTE_SPEAK)	
		if 	CheckID( TargetID() )== false  or (CheckAcceptQuest(TargetID(),423344)==false) or GetDistance( TargetID() , OwnerID() ) >250 then
					if     	 CheckID( TargetID() )== true and  (CheckAcceptQuest(TargetID(),423344)==true) and GetDistance( TargetID() , OwnerID() ) >250 and  CheckID( KK )== true 	 then
						ScriptMessage( TargetID() , TargetID() , 1 , "[SC_423349_11]" , 0 ) --�W�X�Z���A�z�S���������ȡC
						ScriptMessage( TargetID()  , TargetID() , 0 , "[SC_423191_11]" , 0 ) --�W�X�Z���A�z�S���������ȡC
					end		
			CancelBuff( TargetID() , 507166)
			delobj(KK)
			delobj(MM)
			WriteRoleValue( OwnerID(), EM_RoleValue_Register+1 ,0)
		end

	sleep(30)
	SAY(MM,"[SC_423344_10]")--�O�¼v...�b������A�¼v�Ʀ���ŧ���A�����F�v���Y�Z�A�]��[115636]�v���ӷP�C
	sleep(30)
		if 	CheckID( TargetID() )== false  or (CheckAcceptQuest(TargetID(),423344)==false) or GetDistance( TargetID() , OwnerID() ) >250 then
					if     	 CheckID( TargetID() )== true and (CheckAcceptQuest(TargetID(),423344)==true) and GetDistance( TargetID() , OwnerID() ) >250 and  CheckID( KK )== true 	 then
						ScriptMessage( TargetID() , TargetID() , 1 , "[SC_423349_11]" , 0 ) --�W�X�Z���A�z�S���������ȡC
						ScriptMessage( TargetID()  , TargetID() , 0 , "[SC_423191_11]" , 0 ) --�W�X�Z���A�z�S���������ȡC
					end		
			CancelBuff( TargetID() , 507166)
			delobj(KK)
			delobj(MM)
			WriteRoleValue( OwnerID(), EM_RoleValue_Register+1 ,0)
		end
				
	SAY(MM,"[SC_423344_11]")--�P�ɦ��ѩ_�Ǫ��O�q�b�v�T�ۥL�̡A�y���L�̪�����C
	sleep(30)
		if 	CheckID( TargetID() )== false  or (CheckAcceptQuest(TargetID(),423344)==false) or GetDistance( TargetID() , OwnerID() ) >250 then
					if      CheckID( TargetID() )== true and 	 (CheckAcceptQuest(TargetID(),423344)==true) and  GetDistance( TargetID() , OwnerID() ) >250 and  CheckID( KK )== true 	 then
						ScriptMessage( TargetID() , TargetID() , 1 , "[SC_423349_11]" , 0 ) --�W�X�Z���A�z�S���������ȡC
						ScriptMessage( TargetID()  , TargetID() , 0 , "[SC_423191_11]" , 0 ) --�W�X�Z���A�z�S���������ȡC
					end		
			CancelBuff( TargetID() , 507166)
			delobj(KK)
			delobj(MM)
			WriteRoleValue( OwnerID(), EM_RoleValue_Register+1 ,0)
		end

	SAY(KK,"[SC_423344_12]")---�_�Ǫ��O�q...��_��L�A�ڧ��h�ép�I
	PlayMotion( KK ,   ruFUSION_ACTORSTATE_EMOTE_SPEAK)	
	local LL = Lua_DW_CreateObj("flag" ,115832,780565,2,1 )---�㬥
	DisableQuest(LL ,true )
	BeginPlot(LL, "LuaS_423344_4" , 0 )
	sleep(20)
		if 	CheckID( TargetID() )== false  or (CheckAcceptQuest(TargetID(),423344)==false) or GetDistance( TargetID() , OwnerID() ) >250 then
					if      CheckID( TargetID() )== true and 	 (CheckAcceptQuest(TargetID(),423344)==true) and  GetDistance( TargetID() , OwnerID() ) >250	and  CheckID( KK )== true  then
						ScriptMessage( TargetID() , TargetID() , 1 , "[SC_423349_11]" , 0 ) --�W�X�Z���A�z�S���������ȡC
						ScriptMessage( TargetID()  , TargetID() , 0 , "[SC_423191_11]" , 0 ) --�W�X�Z���A�z�S���������ȡC
					end		
			CancelBuff( TargetID() , 507166)
			delobj(KK)
			delobj(MM)
			delobj(LL)
			WriteRoleValue( OwnerID(), EM_RoleValue_Register+1 ,0)
		end

	SAY(MM,"[SC_423344_13]")---�ڥi�H�H��H���q���}...
	sleep(30)
		if 	CheckID( TargetID() )== false  or (CheckAcceptQuest(TargetID(),423344)==false) or GetDistance( TargetID() , OwnerID() ) >250 then
					if     	 CheckID( TargetID() )== true and  (CheckAcceptQuest(TargetID(),423344)==true) and  GetDistance( TargetID() , OwnerID() ) >250 and  CheckID( KK )== true 	 then
						ScriptMessage( TargetID() , TargetID() , 1 , "[SC_423349_11]" , 0 ) --�W�X�Z���A�z�S���������ȡC
						ScriptMessage( TargetID()  , TargetID() , 0 , "[SC_423191_11]" , 0 ) --�W�X�Z���A�z�S���������ȡC
					end		
			CancelBuff( TargetID() , 507166)
			delobj(KK)
			delobj(MM)
			delobj(LL)
			WriteRoleValue( OwnerID(), EM_RoleValue_Register+1 ,0)
		end

	SAY(KK,"[SC_423344_14]")---�p�H��...
	PlayMotion( KK ,   ruFUSION_ACTORSTATE_EMOTE_SPEAK)	
	sleep(30)
	SAY(KK,"[SC_423344_15]")---�o�O...
	
	if 	CheckID( TargetID() )== true and (CheckAcceptQuest(TargetID(),423344)==true) and  	CheckBuff( TargetID() , 507166) ==true	  and GetDistance( TargetID() , OwnerID() ) <250 and  CheckID( KK )== true  then
		SetFlag( TargetID(), 544251, 1 )
	end
	sleep(10)
	CancelBuff( TargetID() , 507166)
	delobj(KK)
	delobj(MM)
	delobj(LL)
	WriteRoleValue(OwnerID(), EM_RoleValue_Register+1 ,0)
end

function LuaS_423344_4()---LL���ʡC---�㬥����������m  �����b�W����115834�B115833
	SAY(OwnerID(),"[SC_423344_LL_1]")
	sleep(10)
	DW_MoveToFlag(OwnerID() ,780565,3, 0,1)-----�w�I---�w��,�˦a�C
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_DYING,ruFUSION_ACTORSTATE_DEAD)

end

function LuaS_423344_LL()--�S��---�t�⪺�S�� (�٥��D��A�X�x)
	while true do
		sleep(20)
		CastSpell( OwnerID(), OwnerID(),  492667)
	end
end

-------------423345--------------
function LuaI_207695_0()---�ˬd�� 
	local OrgID = 0
	if	ReadRoleValue(OwnerID(), EM_RoleValue_IsDead)==1	then
		return false
	end
	if CheckAcceptQuest( OwnerID() , 423345) == false or CountBodyItem( OwnerID() , 207696 ) >= 3 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204592_0]" , 0 ) --�ثe���ݭn�ϥγo�Ӫ��~
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204592_0]" , 0 )
		return false
	end
	if CheckID( TargetID() ) == true then
		OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	end
	if  CheckBuff( TargetID() , 504004 ) == true  then
		return false
	end
	if OrgID ~= 104002   then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_207695_1]" , 0 ) ---[207696]���G�u��w��[104002]�ϥΡC
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_207695_1]" , 0 )
			return false
	end
	if	ReadRoleValue(TargetID(),EM_RoleValue_IsDead)==1	then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422565_2]", 0 ); 
		return false
	end
	if GetDistance( OwnerID() , TargetID() ) > 130 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204592_2]" , 0 ) --�ؼжZ���L��
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204592_2]" , 0 )
		return false
	end
	if	ReadRoleValue(TargetID(),EM_RoleValue_HP)/ReadRoleValue(TargetID(),EM_RoleValue_MaxHP)	>0.5	then
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_207695_2]", 0 ); ----[104002]���O�ä㤤�A�A�L�k���Q�ϥ�[207696]�C
			return false
	end
	return true
end
function LuaS_207695_1()
	if GiveBodyItem( OwnerID() ,  207696 , 1 )  then
		AddBuff( TargetID() , 504004 , 0 , 30 )
		UseItemDestroy( OwnerID() )---���b�ϥΪ����~
	end
	Hide(TargetID())
	BeginPlot( TargetID() , "LuaS_207695_2" , 0 )
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_207695_3]", 0 ); -------�A���[104002]�F�I
end

function LuaS_207695_2()
	sleep(100)
	LuaFunc_ResetObj( OwnerID() )
end

function LuaS_423345_complete()---�Q�γo�ӺX�l780545  �̫ᵹ���n�X�� 544252 KK�O�g�J�� MM�O�㬥
	local MM = Lua_DW_CreateObj("flag" ,115836,780565,3,0)--- �n���L�ʧ@ 
	AddBuff(TargetID(),507167,1,30)
	DisableQuest( OwnerID() ,true )
	SetPlot( OwnerID() , "touch" , "LuaFunc_Obj_BUSY" , 50 )
	local KK = Lua_DW_CreateObj("flag" ,115835,780565,1,1 )---
	SetDefIdleMotion(MM,ruFUSION_MIME_SLEEP_LOOP)
	AddToPartition( MM,0 )
	DisableQuest( KK ,true )
	DisableQuest( MM ,true )
	SAY(KK,"[SC_423345_0]")---�h���G�ѡA�˲��~��¡�X...
	sleep(30)
	CastSpell( KK  , KK , 495235) ----�|���D�S��
	local MON = {}---�Ǫ��}�C
	for i=1,3,1 do
		MON[i]= Lua_DW_CreateObj("flag",115837,780545,3+i)
		BeginPlot(MON[i] , "LuaS_423345_MON" , 0 )
		DisableQuest( MON[i] ,true )
	end
	sleep(30)
	SAY(MM,"[SC_423345_1]")
	sleep(20)
	SAY(KK,"[SC_423345_2]")
	sleep(10)
	delobj(KK)
	delobj(MM)
	CancelBuff( TargetID() , 507167)
	DisableQuest( OwnerID() ,false )
	SetPlot( OwnerID() , "touch" , "" , 0 )
end
function LuaS_423345_MON()
	DW_MoveToFlag(OwnerID() ,780545,2, 0,1)--�n�b�[�ʧ@
	local Player = SearchRangePlayer ( OwnerID() , 300 )
	for i=0,table.getn(Player)-1 do
		if (CheckCompleteQuest( player[i], 423345 )==true) and	(CheckAcceptQuest( player[i] , 423347 ) == false ) and CheckFlag( player[i],542415)==false and CheckBuff(player[i] , 507167 )== true  then
			SetFlag(player[i],542415,1)
		end
	end
	sleep(30)
	DW_MoveToFlag(OwnerID() ,780545,1, 0,1)
	delobj(OwnerID())
end
-------423346
function LuaS_423346_complete()
	AddBuff(TargetID(),507168,1,20)
	DisableQuest( OwnerID() ,true )
	SetPlot( OwnerID() , "touch" , "LuaFunc_Obj_BUSY" , 50 )
	local MM = LuaFunc_SearchNPCbyOrgID( OwnerID() , 115833 , 200 )
	local KK = Lua_DW_CreateObj("flag" ,115969,780565,0,1 )---
	DisableQuest( MM ,true )
	DisableQuest( KK ,true )
	SAY(KK,"[SC_423346_0]")---�o�ަo�ܤU[207697]...
	DW_MoveToFlag(KK ,780545,3, 0,1)
	PlayMotionEX( KK  , ruFUSION_ACTORSTATE_CROUCH_BEGIN,ruFUSION_ACTORSTATE_CROUCH_LOOP)
	sleep(20)
	SAY(MM,"[SC_423346_1]")--�y�y�y...
	sleep(10)
	AdjustFaceDir( MM , KK, 0 )
	PlayMotion( KK  , ruFUSION_ACTORSTATE_CROUCH_END)
	SAY(KK,"[SC_423346_2]")--���U�ӡA�N�O���ݤF�C
	DW_MoveToFlag(KK ,780565,0, 0,1)
	delobj(KK)
	if 	CheckID( TargetID() ) == true  then
		CancelBuff( TargetID() , 507168)
	end
	DisableQuest( OwnerID() ,flase )
	SetPlot( OwnerID() , "touch" , "" , 50 )
	DisableQuest( MM ,flase )
end
--------------------
function LuaS_423347_0()---115850(�㨩)����ܼ@��
	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),423347)==true )and  (CheckFlag(OwnerID(),544252)==false )then
		AddSpeakOption(OwnerID(),TargetID()," [SC_423180_1]","LuaS_423347_1",0)--- 
	end
end
function LuaS_423347_1()
	SetSpeakDetail(OwnerID(),"[SC_423347_1]")---
	if (CheckAcceptQuest(OwnerID(),423347)==true )and  (CheckFlag(OwnerID(),544252)==false )then
		AddSpeakOption(OwnerID(),TargetID()," [SC_423347_2]","LuaS_423347_2",0)---����¼v�H
	end
end
function LuaS_423347_2()
	SetSpeakDetail(OwnerID(),"[SC_423347_3]")---
	if (CheckAcceptQuest(OwnerID(),423347)==true )and  (CheckFlag(OwnerID(),544252)==false )then
		AddSpeakOption(OwnerID(),TargetID()," [SC_423347_4]","LuaS_423347_3",0)---����¼v�H
	end
end
function LuaS_423347_3()
	SetSpeakDetail(OwnerID(),"[SC_423347_5]")---
	SetFlag( OwnerID(), 544252, 1 )
end
----------
function LuaS_423347_4()---���~207698
	ClearBorder( OwnerID())
	AddBorderPage( OwnerID(), "[SC_423347_6]");
	AddBorderPage( OwnerID(), "[SC_423347_7]");
	AddBorderPage( OwnerID(), "[SC_423347_8]");
	AddBorderPage( OwnerID(), "[SC_423347_9]");
	ShowBorder( OwnerID(), 0, "[207698]", "ScriptBorder_Texture_Paper" )	
end