-----------------------�I����������422648��H���q--------------------------

function LuaI_205758_0()
	local str = "["..GetUseItemGUID(OwnerID()).."]"
	ClearBorder( OwnerID())	--��l�ƥ۸O����
	AddBorderPage( OwnerID(), GetQuestDetail( 422648, 1 ) )
	ShowBorder( OwnerID(), 422648, str ,"ScriptBorder_Texture_Paper" )	
end

-------------------------------422649�L�쬥�j---------------------------------------

function LuaS_422649()  
	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),422649)==true )and( Checkflag( OwnerID() , 543004) == false)then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422649_0]","LuaS_422649_1",0) --�n�A�ڷQ�F�ѡC
	end
end


function LuaS_422649_1()  
	SetSpeakDetail(OwnerID(),"[SC_422649_1]")				--�A���D�ܡH�ǥX���˪L����......
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422649_2]","LuaS_422649_2",0)	--����˪L���̪��W�r�O�H
end

function LuaS_422649_2()  
	SetSpeakDetail(OwnerID(),"[SC_422649_3]")				--�@���u���B�a���M���Ϫ̤��N���W�r��˪L���̪��W�r�O�L�쬥�j��
	SetFlag(OwnerID() ,543004, 1 )
end

----------------------------422651�q�h�L��---------------------------------------

function LuaS_422651()  
	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),422651)==true )and( Checkflag( OwnerID() , 543003) == false)then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422651_0]","LuaS_422651_1",0) --��A�ڷ|ť�A���C
	end
end

function LuaS_422651_1()  
	SetSpeakDetail(OwnerID(),"[SC_422651_1]")				--�{�ѥL�̪���l�n�q�ܤ[�B�ܤ[���e���_�A���ɥL�̪��۳B����
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422651_2]","LuaS_422651_2",0)	--�L�̤@���b�����v���H
end


function LuaS_422651_2()  
	SetSpeakDetail(OwnerID(),"[SC_422651_3]")				--�O���A����L�̦A�׬��F�L�᪺�n�Ӥ߮i�}
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422651_4]","LuaS_422651_3",0)	--�ܦ��쪺�o�i�C
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422651_5]","LuaS_422651_3",0)	--����q���H�ܦ����Ͱڡ�
end


function LuaS_422651_3()  
	SetSpeakDetail(OwnerID(),"[SC_422651_6]")				--�S���A�Ҧ���H�N�ݥL�̨�Ӫ����Y�̯S�O
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422651_7]","LuaS_422651_4",0)	--......���A�ک��դF...
end

function LuaS_422651_4()  
	closespeak(OwnerID())
	SetFlag(OwnerID() ,543003, 1 )					
end

-------------------------422652��Ӫ��D�O---------------------------------------

function LuaS_422652()  
	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),422652)==true )and( Checkflag( OwnerID() , 543001) == false)then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422652_0]","LuaS_422652_1",0)	--�ЧN�R�U�ӡA�L�쬥�j�ЧڦV�A�̻��X�L�Ӥ��λ��X�f���D�O�C
	end
end

function LuaS_422652_1()
	SetSpeakDetail(OwnerID(),"[SC_422652_1]")					--���K��H�L�쬥�j�B�L�쬥�j�ЧA�ӡH
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422652_2]","LuaS_422652_2",0)		--�K���Ȥ���A�L�{�b�S������A�L��...�i��O�ڨ��W�����x�ݯd���𮧤~�ਣ��L�K
end

function LuaS_422652_2()  
	SetFlag(OwnerID() ,543001, 1 )
	CloseSpeak( OwnerID())
end

------------------------493830�ڪ����H---------------------------------------
	
function LuaM_493830_0()	--�ˬd
	if CheckAcceptQuest( OwnerID() , 422647 ) == false or CheckFlag( OwnerID() , 543000) == true then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422591_0]" , 0 ) --�A�ثe���ݭn�ϥΦ����~
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422591_0]" , 0 ) 
		return false
	end
	local Obj =  LuaFunc_SearchNPCbyOrgID( OwnerID() , 113392 , 100 )
	if Obj< 0 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422647_0]" , 0 ) --��������e�{�a���⪺�a��~��ϥ�
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422647_0]" , 0 ) 
		return false
	end
	return true
end

function LuaM_504229_0()
	if CheckAcceptQuest( OwnerID() , 422647 ) == true then
	--local soil=LuaFunc_CreateObjByObj ( 113393 , 113392 )
	ScriptMessage( OwnerID(), TargetID(), 0, "[SC_422647_1]", 0 )
		SetFlag( OwnerID() , 543000 , 1 )
	--sleep(50)
	--delobj(soil)
	end
end

function LuaQ_422647_Complete()
	BeginPlot( TargetID() , "LuaQ_422647_Complete_2" , 0 )
end

function LuaQ_422647_Complete_2()
	local Count = CountBodyItem( OwnerID() , 205756 )
	if Count > 0 then
		DelBodyItem( OwnerID() , 205756 , Count )
	end
end

-----------------------�L�k���ê�����

function LuaS_205757()
	CastSpell( OwnerID(),TargetID(), 493887 )
end

function LuaS_205757_0()
	if CheckAcceptQuest( OwnerID() , 422644 ) == true then
		if CheckFlag( OwnerID() , 542999 ) == true then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_205757_1]" , 0 ) --�A�w�g���D���p�F�A���ֱa���x������^�h��[113378]���x���i�C
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_205757_1]" , 0 ) 
			return 
		end
		local foe =  LuaFunc_SearchNPCbyOrgID( OwnerID() , 102170 , 70 )
		if foe< 0 then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_205757_2]" , 0 ) --�A����������[102170]�~��ϥ�[205757]
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_205757_2]" , 0 ) 
			return 
		else
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_205757_3]" , 0 ) --�@�}�_�_���򪺸ܻy�q���e�����p���y�J�I�̶ǥX�K
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_205757_3]" , 0 ) 
			BeginPlot( foe , "LuaS_205757_1" , 20 )
			
			return 
		end
	end
end



function LuaS_205757_1()
	tell(TargetID(),OwnerID(),"[SC_422644_0]")	--�K��u�ͩR�����v�O�ަA�Y�K�A���s�S�Ϊ���H�M���F�]�@�w�Q����ڭ̥γo�ؤ覡�ѱo�۵M���O��	
	sleep(20)	
	tell(TargetID(),OwnerID(),"[SC_422644_1]")	--�ͩR�s���̤��\�O�̷s��}���]�~��l���۵M���O��̫�A�u�ͩR�����v�Q�ڭ̥����a���]�O�𦭪��ơC
	sleep(20)
	tell(TargetID(),OwnerID(),"[SC_422644_2]")	--�����Τ��h�z�Z����ê���Ѿ𪺤�k�u�O����F�A�o�����f���M���S�o�{����l��
	sleep(20)
	tell(TargetID(),OwnerID(),"[SC_422644_3]")
	sleep(10)
	SetFlag( TargetID() , 542999 , 1 )
end

-----------------------------422650 �@���Ʊ�

function LuaI_205759_0()
	if CheckAcceptQuest( OwnerID() , 422650 ) == false or Checkflag( OwnerID() , 543002 ) == true then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204637_0]" , 0 ) --�ثe���ݭn�ϥγo�Ӫ��~
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204637_0]" , 0 )
		return false
	end
	local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	if OrgID ~= 102192 or ReadRoleValue( TargetID() , EM_RoleValue_IsDead) == 1 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204637_1]" , 0 ) --�ؼФ����T
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204637_1]" , 0 )
		return false
	end

	if GetDistance( OwnerID() , TargetID() ) > 100 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204637_2]" , 0 ) --�ؼжZ���L��
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204637_2]" , 0 )
		return false
	end

	return true
end


function LuaI_205759_1()	--�I�����~Ĳ�o
	BeginPlot( TargetID() , "LuaI_205759_2" , 0 )
end

function LuaI_205759_2()
	AddBuff( OwnerID() , 504306 , 1 , 10 )
	Hide( OwnerID() )
	local Obj = Role:new( OwnerID() )
	local Room = ReadRoleValue( TargetID() , EM_RoleValue_RoomID )
	local Forg = CreateObj( 113395 , Obj:X() , Obj:Y() , Obj:Z() ,Obj:Dir() , 1 )
	WriteRoleValue( Forg , EM_RoleValue_LiveTime , 30 )
	SetModeEx( Forg , EM_SetModeType_Strikback , false )
	SetModeEx( Forg , EM_SetModeType_Move , false )
	SetModeEx( Forg , EM_SetModeType_Searchenemy , false )
	SetModeEx( Forg , EM_SetModeType_Fight , false )
	WriteRoleValue( Forg , EM_RoleValue_PID , OwnerID() )
	AddToPartition( Forg , Room )
	say(Forg,"[SC_422650_0]")
	sleep(30)
	say(Forg,"[SC_422650_1]")
	sleep(30)
	say(Forg,"[SC_422650_2]")
	setflag(TargetID(),543002,1)
	sleep( 10 )
	delobj(Forg)
	CancelBuff( OwnerID(), 504306 )
	Show( OwnerID() , Room )
end

