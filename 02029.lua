function LuaS_kk_tt()------�S��
	AddBuff(OwnerID(),507555,1,-1)
	AddBuff(OwnerID(),507556,1,-1)
	AddBuff(OwnerID(),507579,1,-1)
END
-----------------------------------------
function LuaS_423508_0()
	local KK = Lua_DW_CreateObj("flag" ,116195,780751,0,0 )---�إX����J�j�]��
	Lua_ObjDontTouch( KK )
	DisableQuest( KK ,true )
	AddToPartition(KK , 0 )
	Tell(TargetID(),KK , "[SC_423508_1]")----����N�ӥL�һ������a�I�A���o[<S>208147]�N���N�F��e�ܦ�O�J��s����a��[116326]���e�A�ݧڨ��^�F�����t�餺�����]��A�N�|�����L�h�C
	sleep(10)
	delobj(KK)
end
----------------------------------------------------------
function LuaS_423509_0()----
	LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest( OwnerID() , 423509) == true  and  (CheckFlag(OwnerID(),544358)==false) then
				AddSpeakOption(OwnerID(),TargetID()," [SC_423509_0]","LuaS_423509_1",0)--(�A�Q�_�ӤF�S�H)
	end
end
function LuaS_423509_1()----
   	SetSpeakDetail(OwnerID(),"[SC_423509_2]")---
	SetFlag(OwnerID() ,544358, 1 )
 end

function LuaS_423509_2()
	local KK = Lua_DW_CreateObj("flag" ,116346,780432,22,0)---�إX����J�j�]��
	Lua_ObjDontTouch( KK )
	DisableQuest( KK ,true )
	AddToPartition(KK , 0 )
	Tell(TargetID(),KK , "[SC_423509_3]")----����N�ӥL�һ������a�I�A���o[<S>208147]�N���N�F��e�ܦ�O�J��s����a��[116326]���e�A�ݧڨ��^�F�����t�餺�����]��A�N�|�����L�h�C
	sleep(10)
	delobj(KK)
end

---------------------------------------------------
function LuaS_423510()----116186   116301����J  116184   116300�d����  BUFF 507503  780751(11)
	DisableQuest( OwnerID() ,true )
	AddBuff(TargetID(),507503,1,30)---
	SetPlot( OwnerID() , "touch" , "LuaFunc_Obj_BUSY" , 50 )
	local MORK = Lua_DW_CreateObj("flag" ,116345,780751,11,1)---
	local CK = Lua_DW_CreateObj("flag" ,116184,780751,12,1)---
	DisableQuest( CK ,true )
	DisableQuest( MORK ,true )
	DW_MoveToFlag( CK ,780751,13, 0,1)
	AdjustFaceDir( CK , MORK, 0 )
	Say(CK,"[SC_423510_1]")---[116328]...�A�b�ݨǤ���H
	PlayMotion(CK,  ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	AdjustFaceDir(  MORK,CK, 0 )
	Say(MORK,"[SC_423510_2]")-------���b[208148]���A�o�{�F�@�ʸp�W��[104332]���H��C
	PlayMotion(MORK,  ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	Say(MORK,"[SC_423510_3]")---���b�H���A�\�F�@�ӥs���y[116268]�z�j�r���j�L�A�Aı�o�o�O����N��H
	PlayMotion(MORK,  ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(20)
	ScriptMessage( TargetID(), TargetID(), 0, "[SC_423510_4]", 0 )--[116186]�P[116184]�C�n��͵�...�A�X�Gť�����L�̪��n���C
	ScriptMessage( TargetID(), TargetID(), 1, "[SC_423510_4]", 0 )
	sleep(30)
	Say(MORK,"[SC_423510_5]")---���N�o�˧a...
	PlayMotion(MORK,  ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(20)
	Say(CK,"[SC_423510_6]")---�n...
	PlayMotion(CK,  ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
	DW_MoveToFlag( CK ,780751,12, 0,1)
	if 	CheckID( TargetID() ) == true  then
			CancelBuff( TargetID() , 507503)
	end
	DELOBJ(CK)
	DELOBJ(MORK)
	SetPlot( OwnerID() , "touch" , "" , 50 )
	DisableQuest( OwnerID() ,false )
end
-------------------------------------------------------
function LuaS_423513()------423551
	if (CheckAcceptQuest(OwnerID(),423513)==true )and (CheckFlag(OwnerID() , 544359) == false or CheckFlag(OwnerID() , 544395) == false ) then
		LoadQuestOption( OwnerID() )
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423513_1]","LuaS_423513_1",0) ----(�а�...)
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423513_2]","LuaS_423513_2",0)		
	elseif  CheckCompleteQuest(OwnerID(),423568)==true and    CheckCompleteQuest(OwnerID(),423513)==true  then
		if  CheckFlag(OwnerID() , 544397) == true  then  
			SetFlag(OwnerID() ,544397, 0 ) 
		end

	elseif (CheckAcceptQuest(OwnerID(), 423514 )==true ) then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_421955_1]","LuaS_423513_5",0) 

	else  LoadQuestOption( OwnerID() )
	
	end	 

end


function LuaS_423513_1()------
	SetSpeakDetail( OwnerID(), "[SC_423513_3]"  )---
	SetFlag(OwnerID() ,544359, 1 ) 
	AddSpeakOption(OwnerID(),TargetID(),"[SO_BACK]","LuaS_423513",0) 
end
function LuaS_423513_2()------
	SetSpeakDetail( OwnerID(), "[SC_423513_4]"  )---
	SetFlag(OwnerID() ,544395, 1 ) 
	AddSpeakOption(OwnerID(),TargetID(),"[SO_BACK]","LuaS_423513",0) 
end
function LuaS_423513_4()------
	if CheckCompleteQuest(TargetID() ,423569)==false then
		SetFlag(TargetID()  ,544397, 1 ) 
	end
end

function LuaS_423513_5()------
	CastSpell( OwnerID() , OwnerID() , 491008 )
	sleep(20)
	ChangeZone( OwnerID() , 15 , 0 , -4063.7 , 154.6 , 8220.5 , 271.3 )
end

function LuaS_423513_6()
	SetPlot( OwnerID() , "Range" , "LuaS_423513_7" , 350 )
end
function LuaS_423513_7()
	if	CheckCompleteQuest(OwnerID(),423569)==true and    CheckCompleteQuest(OwnerID(),423513)==true  then
		if  CheckFlag(OwnerID() , 544397) == true  then  
			SetFlag(OwnerID() ,544397, 0 ) 
		end
	end	
end





------------------------------------------------------------------------------
---------------------------------780752
function LuaS_423515_0()----�N��116341 ��P116343 �d���� 116342 BUFF 507512
	DisableQuest( OwnerID() ,true )
	AddBuff(TargetID(),507512,1,35)---
	SetPlot( OwnerID() , "touch" , "LuaFunc_Obj_BUSY" , 50 )
	local GILL = Lua_DW_CreateObj("flag" ,116341,780752,1,1)---
	local STAR = Lua_DW_CreateObj("flag" ,116343,780752,2,1)---
	local CK = Lua_DW_CreateObj("flag" ,116342,780752,3,1)---
	DisableQuest( STAR ,true )
	DisableQuest( CK ,true )
	DisableQuest( GILL ,true )
	DW_MoveToFlag( GILL ,780752,4, 0,1)
	Say(GILL,"[SC_423515_1]")---�p�G�A���V�ϳo�ǧ��ƪ��ܡA�A�|���D����s���ͤ��p���C
PlayMotion(GILL,  ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	Say(CK,"[SC_423515_2]")-------�k�Ĥl�A���i�H�ʤ��ʴN���o�إi�Ȫ��ܡH
	sleep(30)
	Say(CK,"[SC_423515_3]")---�Τ��۾�ߡA�p���۬ݦn�F�C
PlayMotion(CK,  ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(20)
CastSpell( CK, CK, 495918 )
	sleep(30)
	Say(CK,"[SC_423515_4]")---�o���N�n�F�H
	sleep(20)
	DW_MoveToFlag( STAR ,780752,5, 0,1)
	Say(STAR,"[SC_423515_5]")---�@�����ǳƦn�F�ܡH����ګݷ|��N�X�o�C
AdjustFaceDir( CK , STAR, 0 )
AdjustFaceDir( GILL , STAR, 0 )
---�I�Y�ʧ@
PlayMotion(STAR,  ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
	sleep(30)
---��P�V�d�����q§
PlayMotion(STAR ,  ruFUSION_ACTORSTATE_EMOTE_SALUTE2     )
	Say(STAR,"[SC_423515_6]")--�b�P�P�����ޤU�A���ܡA�|�ϬP�~��[���G�A
	sleep(30)	
	DW_MoveToFlag( STAR ,780752,6, 0,1)
	if 	CheckID( TargetID() ) == true  then
			CancelBuff( TargetID() , 507512)
	end
	DELOBJ(GILL)
	DELOBJ(STAR)
	DELOBJ(CK)
	SetPlot( OwnerID() , "touch" , "" , 50 )
	DisableQuest( OwnerID() ,false )
end




