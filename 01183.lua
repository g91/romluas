---����ۤ����ɥ���

function LuaI_421696() --�����ȫ�WBUFF
	
	AddBuff(TargetID() , 502466 , 99 , 180 )  --�p��buff
	AddBuff(TargetID() , 502468 , 0 , 180 )  --�����ˬdbuff
end

function LuaI_421696_1() --�����ȮɧR������
	
	if (CheckAcceptQuest(OwnerID(),421696)==false)and(CheckCompleteQuest(OwnerID(),421696)==false) then
	
		SetFlag( OwnerID() , 542355, 0 )
		SetFlag( OwnerID() , 542358, 0 )
		CancelBuff( OwnerID() , 502468 )
		CancelBuff( OwnerID() , 502466 )
	end

	if CheckFlag( OwnerID() , 542355 )==true then

		CancelBuff( OwnerID() , 502466 )
	end
end

function LuaI_421696_2() --BUFF�����ɡA���ȥ��ѳq��
	
	if CheckCompleteQuest(OwnerID(),421696)==false then
		
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_421696]" , C_SYSTEM )	
		SetFlag( OwnerID() , 542355, 0 )
		SetFlag( OwnerID() , 542358, 0 )
	end
end

function LuaI_421696_3() --���ȧ�����A�R�����W���p��BUFF
	
	CancelBuff( TargetID() , 502468 )
	CancelBuff( TargetID() , 502466 )
end

function LuaI_421696_4() -- �I������ɡA�P�_���a���W��BUFF
	
	if CheckBuff( OwnerID() , 502466)== true then
	--	CancelBuff( OwnerID() , 502466 )
		return true
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_421696_1]" , C_SYSTEM ) -- �A�����W�èS���ۤ��I
		return false
	end
end

function LuaI_421696_5() --�P�_�O�_���b�ɭ����VNPC�^����

	LoadQuestOption( OwnerID() )
	if (CheckBuff( OwnerID() , 502468)== true)and( CheckFlag( OwnerID() , 542355 )==true) then
		SetFlag( OwnerID() , 542358, 1 )
	end

	if (CheckBuff( OwnerID() , 502468)== false)and( CheckAcceptQuest(OwnerID(),421696)==true) then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_421696_101]" , C_SYSTEM ) --�A�w�g�W�L3�����ɶ��A�Щ����ȭ��s�ӹL
	end

	if (CheckBuff( OwnerID() , 502476)== true)and( CountBodyItem( OwnerID(), 203685 )>7) then
		SetFlag( OwnerID() , 542350, 1 )
	end

	if (CheckBuff( OwnerID() , 502476)== false)and( CheckAcceptQuest(OwnerID(),421700)==true) then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_421696_101]" , C_SYSTEM ) --�A�w�g�W�L3�����ɶ��A�Щ����ȭ��s�ӹL
	end	

end

function LuaI_421696_6() -- �I������ɡA�P�_���a���W��BUFF
	
	CancelBuff( OwnerID() , 502466 )
	return true
end



------���s�e�F����

function LuaI_421698()
	
	AddBuff(TargetID() , 502471 , 0 , 600 )  --�p��buff
	SetFlag( TargetID() , 542353, 0 )

end

function LuaI_421698_1()
	
	if (CheckAcceptQuest(OwnerID(),421698)==false)and(CheckCompleteQuest(OwnerID(),421698)==false) then
		
		CancelBuff( OwnerID() , 502471 )
		DelBodyItem( OwnerID() , 203684 , 1 ) 
		SetFlag( OwnerID() , 542353, 0 )
	end
end


function LuaI_421698_3()
	
	LoadQuestOption( OwnerID() )
	if (CheckBuff( OwnerID() , 502471)== true)and(CheckFlag( OwnerID() , 542353 )==false)and(CountBodyItem( OwnerID(), 203684 )>0) then

		AddSpeakOption(OwnerID(),TargetID(),"[SC_112193]","LuaI_421698_4",0) --�ڧ�����˪��s�e�ӤF�A�е��ڰs���C
	end

	if (CheckBuff( OwnerID() , 502471)== false)and(CheckAcceptQuest(OwnerID(),421698)==true)and(CountBodyItem( OwnerID(), 203684 )>0) then

		AddSpeakOption(OwnerID(),TargetID(),"[SC_112193_2]","LuaI_421698_5",0) --���M�s�N���F�A�٬O�浹��Ĭ�[�w�C
	end		
end

function LuaI_421698_4()

	SetSpeakDetail(OwnerID(),"[SC_112193_1]") --�����I�u�O�n�ܪ��s�ڡI�o�󫰶�s�a�檺�s�G�M�W����ǡC���§A�]�o�@��A�o�O�s���C
	SetFlag( OwnerID() , 542353, 1 )
	CancelBuff( OwnerID() , 502471 )
	DelBodyItem( OwnerID() , 203684 , 1 ) 
	GiveBodyItem( OwnerID(), 203699, 1 )

end

function LuaI_421698_5()

	SetSpeakDetail(OwnerID(),"[SC_112193_3]") --�u�O�ӹL���F�I�o�����ܪ��s�A�A���M�ٴ������ڡC�֥h���ڦA�e�@�������˪��s�ӡC
	DelBodyItem( OwnerID() , 203684 , 1 ) 
	SetFlag( OwnerID() , 542362, 1 )

end

function LuaI_421698_6()

	if CheckFlag( OwnerID() , 542353 )==false then
		
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_421696]" , C_SYSTEM )	
	end	

end

function LuaI_421698_7() -- �R���s��
	
	DelBodyItem( TargetID() , 203699 , 1 ) 
end

---���s�]��O�n�y�H

function LuaI_421700()
	
	AddBuff(TargetID() , 502476 , 0 , 1200 )  --�p��buff

end

function LuaI_421700_1()

	if (CheckAcceptQuest(OwnerID(),421700)==false)and(CheckCompleteQuest(OwnerID(),421700)==false) then
		local Count = CountBodyItem( OwnerID() , 203685 )
		SetFlag( OwnerID() , 542350, 0 )
		DelBodyItem( OwnerID() , 203685 ,   Count ) 
		CancelBuff( OwnerID() , 502476 )
	end

end

function LuaI_421700_2()
	
	CancelBuff( TargetID() , 502476 )
end

function LuaI_421700_3()
	
	if CheckCompleteQuest(OwnerID(),421700)==false then
		
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_421696]" , C_SYSTEM )	
		SetFlag( OwnerID() , 542350, 0 )
		DelBodyItem( OwnerID() , 203685 , 1 ) 
		DelBodyItem( OwnerID() , 203685 , 1 ) 
		DelBodyItem( OwnerID() , 203685 , 1 ) 
		DelBodyItem( OwnerID() , 203685 , 1 ) 
		DelBodyItem( OwnerID() , 203685 , 1 ) 
		DelBodyItem( OwnerID() , 203685 , 1 ) 
		DelBodyItem( OwnerID() , 203685 , 1 ) 
		DelBodyItem( OwnerID() , 203685 , 1 ) 
	end
end

---��ϰ���

function LuaI_421701()

	LoadQuestOption( OwnerID() )	
	if (CheckAcceptQuest(OwnerID(),421701)==true)and(CountBodyItem( OwnerID(), 203686 )<1)and(CheckFlag( OwnerID() , 542362 )==false)and(CheckFlag( OwnerID() , 542363 )==false)and(CheckFlag( OwnerID() , 542364 )==false)and(CheckFlag( OwnerID() , 542365 )==false)and(CheckFlag( OwnerID() , 542368 )==false)and(CheckFlag( OwnerID() , 542369 )==false)  then

		AddSpeakOption(OwnerID(),TargetID(),"[SC_421701]","LuaI_421701_1",0) --�n�ߪ���͡A�бz�V�m�ڪ���ϯ�O�C	
	end

	if (CheckFlag( OwnerID() , 542368 )==true)and(CountBodyItem( OwnerID(), 203686 )<1)and(CheckCompleteQuest(OwnerID(),421701)==false) then

		AddSpeakOption(OwnerID(),TargetID(),"[SC_421701_13]","LuaI_421701_3",0) --��͡A�ڤw�g���\���˱w��ϡC
	end

	if (CheckFlag( OwnerID() , 542369 )==true)and(CountBodyItem( OwnerID(), 203686 )<1) then

		AddSpeakOption(OwnerID(),TargetID(),"[SC_421701_14]","LuaI_421701_4",0) --��͡A�ګܩ�p�A�Ӥ������˱w��ϡC
	end

	if (CheckCompleteQuest(OwnerID(),421701)==false)and(CheckFlag( OwnerID() , 542370 )==true)and(CountBodyItem( OwnerID(), 203686 )<1) then

		AddSpeakOption(OwnerID(),TargetID(),"[SC_421701_16]","LuaI_421701_5",0) --��͡A�ڤ��p�ߧ����ҧ˥�F�A�ЦA���ڤ@�i�C
	end

end

function LuaI_421701_1()

	SetSpeakDetail(OwnerID(),"[SC_421701_2]") 
	SetFlag( OwnerID() , 542366, 1 )
end

function LuaI_421701_3()

	SetSpeakDetail(OwnerID(),"[SC_421701_15]") 
	SetFlag( OwnerID() , 542370, 1 )
	GiveBodyItem( OwnerID(), 203686, 1 )
end

function LuaI_421701_4()

	SetSpeakDetail(OwnerID(),"[SC_421701_17]") 
	SetFlag( OwnerID() , 542369, 0 ) --���ȥ���
	SetFlag( OwnerID() , 542362, 0 ) --�Y������
	SetFlag( OwnerID() , 542363, 0 ) --�}������
	SetFlag( OwnerID() , 542364, 0 ) --�ⳡ����
	SetFlag( OwnerID() , 542365, 0 ) --��������
	DelBodyItem( OwnerID() , 203740 , 1 ) 
	DelBodyItem( OwnerID() , 203741 , 1 )
	DelBodyItem( OwnerID() , 203742 , 1 )
	DelBodyItem( OwnerID() , 203743 , 1 )  
end

function LuaI_421701_5()

	GiveBodyItem( OwnerID(), 203686, 1 )
	CloseSpeak( OwnerID() )
end

function LuaI_421701_6()

	if CheckFlag( OwnerID() , 542368 )==false then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_421696]" , C_SYSTEM )--���ȥ���
		SetFlag( OwnerID() , 542369, 1 ) --���ȥ���
		SetFlag( OwnerID() , 542362, 0 ) --�Y������
		SetFlag( OwnerID() , 542363, 0 ) --�}������
		SetFlag( OwnerID() , 542364, 0 ) --�ⳡ����
		SetFlag( OwnerID() , 542365, 0 ) --��������
		SetFlag( OwnerID() , 542366, 0 ) --��ϰV�m
		DelBodyItem( OwnerID() , 203740 , 1 ) 
		DelBodyItem( OwnerID() , 203741 , 1 )
		DelBodyItem( OwnerID() , 203742 , 1 )
		DelBodyItem( OwnerID() , 203743 , 1 )  
	end
end

function LuaI_421701_7()

	if (CheckAcceptQuest(OwnerID(),421701)==false)and(CheckCompleteQuest(OwnerID(),421701)==false) then

		CancelBuff( OwnerID() , 502480 )
		SetFlag( OwnerID() , 542369, 0 ) --���ȥ���
		SetFlag( OwnerID() , 542362, 0 ) --�Y������
		SetFlag( OwnerID() , 542363, 0 ) --�}������
		SetFlag( OwnerID() , 542364, 0 ) --�ⳡ����
		SetFlag( OwnerID() , 542365, 0 ) --��������
		SetFlag( OwnerID() , 542366, 0 ) --��ϰV�m
		SetFlag( OwnerID() , 542368, 0 ) --���Ȧ��\
		DelBodyItem( OwnerID() , 203686 , 1 ) 
		DelBodyItem( OwnerID() , 203740 , 1 ) 
		DelBodyItem( OwnerID() , 203741 , 1 )
		DelBodyItem( OwnerID() , 203742 , 1 )
		DelBodyItem( OwnerID() , 203743 , 1 )  
	end
end



function LuaI_421701_2() --�P���˯f�w�����
	
	SetSpeakDetail(OwnerID(),"[SC_421701_19]") 		
	if (CheckFlag( OwnerID() , 542366 )==true)and(CheckBuff( OwnerID() , 502480)== false)and(CheckFlag( OwnerID() , 542368 )==false)and(CheckFlag( OwnerID() , 542369 )==false) then
		SetSpeakDetail(OwnerID(),"[SC_421701_19]") 
		AddSpeakOption(OwnerID(),TargetID(),"[SC_421701_18]","LuaI_421701_8",0) 	
	end
	
	if CheckBuff( OwnerID() , 502480)== true then
		if CheckFlag( OwnerID() , 542362 )==true then
			if CountBodyItem( OwnerID(), 203740 )>0 then
				SetSpeakDetail(OwnerID(),"[SC_421701_7]") 
				SetFlag( OwnerID() , 542368, 1 )
				CancelBuff( OwnerID() , 502480 )
				DelBodyItem( OwnerID() , 203740 , 1 ) 
				DelBodyItem( OwnerID() , 203741 , 1 )
				DelBodyItem( OwnerID() , 203742 , 1 )
				DelBodyItem( OwnerID() , 203743 , 1 )   
			else
				SetSpeakDetail(OwnerID(),"[SC_421701_8]")
			end

		elseif CheckFlag( OwnerID() , 542363 )==true then
			if CountBodyItem( OwnerID(), 203741 )>0 then
				SetSpeakDetail(OwnerID(),"[SC_421701_7]") 
				SetFlag( OwnerID() , 542368, 1 )
				CancelBuff( OwnerID() , 502480 )
				DelBodyItem( OwnerID() , 203740 , 1 ) 
				DelBodyItem( OwnerID() , 203741 , 1 )
				DelBodyItem( OwnerID() , 203742 , 1 )
				DelBodyItem( OwnerID() , 203743 , 1 )   
			else
				SetSpeakDetail(OwnerID(),"[SC_421701_9]")
			end

		elseif CheckFlag( OwnerID() , 542364 )==true then
			if CountBodyItem( OwnerID(), 203742 )>0 then
				SetSpeakDetail(OwnerID(),"[SC_421701_7]") 
				SetFlag( OwnerID() , 542368, 1 )
				CancelBuff( OwnerID() , 502480 )
				DelBodyItem( OwnerID() , 203740 , 1 ) 
				DelBodyItem( OwnerID() , 203741 , 1 )
				DelBodyItem( OwnerID() , 203742 , 1 )
				DelBodyItem( OwnerID() , 203743 , 1 )   
			else
				SetSpeakDetail(OwnerID(),"[SC_421701_10]")
			end

		elseif CheckFlag( OwnerID() , 542365 )==true then
			if CountBodyItem( OwnerID(), 203743 )>0 then
				SetSpeakDetail(OwnerID(),"[SC_421701_7]") 
				SetFlag( OwnerID() , 542368, 1 )
				CancelBuff( OwnerID() , 502480 )
				DelBodyItem( OwnerID() , 203740 , 1 ) 
				DelBodyItem( OwnerID() , 203741 , 1 )
				DelBodyItem( OwnerID() , 203742 , 1 )
				DelBodyItem( OwnerID() , 203743 , 1 )   
			else
				SetSpeakDetail(OwnerID(),"[SC_421701_11]")
			end
		end 

	end

	if (CheckBuff( OwnerID() , 502480)== false)and(CheckFlag( OwnerID() , 542368 )==false) then
		if (CheckFlag( OwnerID() , 542362 )==true)or(CheckFlag( OwnerID() , 542363 )==true)or(CheckFlag( OwnerID() , 542364 )==true)or(CheckFlag( OwnerID() , 542365 )==true) then
			SetSpeakDetail(OwnerID(),"[SC_421701_12]")
			SetFlag( OwnerID() , 542369, 1 )	
		end
	end

end

function LuaI_421701_8()

	local R = Rand( 100 ) + 1
		if R >= 0 and R < 25 then
			SetSpeakDetail(OwnerID(),"[SC_421701_3]") --�Y������
			AddBuff(OwnerID() , 502480 , 0 , 60 ) 
			SetFlag( OwnerID() , 542362, 1 )

		elseif R >= 25 and R < 50 then
			SetSpeakDetail(OwnerID(),"[SC_421701_4]") --�}������
			AddBuff(OwnerID() , 502480 , 0 , 60 ) 
			SetFlag( OwnerID() , 542363, 1 )

		elseif R >= 50 and R < 75 then
			SetSpeakDetail(OwnerID(),"[SC_421701_5]") --�ⳡ����
			AddBuff(OwnerID() , 502480 , 0 , 60 ) 
			SetFlag( OwnerID() , 542364, 1 )

		else
			SetSpeakDetail(OwnerID(),"[SC_421701_6]") --��������
			AddBuff(OwnerID() , 502480 , 0 , 60 ) 
			SetFlag( OwnerID() , 542365, 1 )
		end
end




---�I���ľ����ˬdbuff

function LuaI_203740()

	if CheckBuff( OwnerID() , 502480)== false then

		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_203740]" , C_SYSTEM ) --�A�S���ݭn��Ϫ��˱w�I
		return false
	else
		return true
	end
end

---�������H

function LuaI_421702()

	BeginPlot( OwnerID() , "LuaI_421702_1" , 0 )
	return true
end

function LuaI_421702_1()

	local MonA = LuaFunc_CreateObjByObj ( 112253 , TargetID() )
	AddToPartition( MonA ,    0 )
	SetFollow( MonA , OwnerID() )
	BeginPlot( MonA , "LuaI_421702_2" , 0 )
end

function LuaI_421702_2()
	Sleep(600)
	Delobj( OwnerID() )
end

function LuaI_203687()
	
	AddBuff(OwnerID() , 502744 , 0 , 600 ) 
end

function LuaS_203687_1()

	local X = ReadRoleValue(OwnerID() , EM_RoleValue_X)
	local Z = ReadRoleValue(OwnerID() , EM_RoleValue_Z)

	if X > 19459 and X < 22275 then
		if Z > 7838 and Z < 11810 then
			return true
		else
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_203687]" , C_SYSTEM ) -- �]�k��q�y�u��b�v��l�W���ϥΡA�A�w�g�W�X�ϰ�I
			return false
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_203687]" , C_SYSTEM ) -- �]�k��q�y�u��b�v��l�W���ϥΡA�A�w�g�W�X�ϰ�I
		return false
	end
end














