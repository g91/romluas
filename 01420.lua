function LuaS_113030()
	LoadQuestOption( OwnerID() )
	if (CheckFlag( OwnerID() , 542741 )==false)then	
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_113030_1]" , "LuaS_113030_1", 0 ) -- �ڭn���ޯ��M�P�W�n��q
	else
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_113030_2]" , "LuaS_113030_0", 0 ) -- �ڭn����ޯ��M�P 
	end

	if (CheckFlag( OwnerID() , 542732 )==true)then	
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_113030_12]" , "LuaS_113030_6", 0 ) -- �ڷQ�d�ߧڪ��ޯ��M�P�w�g�W�n�h�֯�q�H
	end  
end

function LuaS_113030_0() -- �R��ú��d���X��

	GiveBodyItem( OwnerID(), 204896, 1 )
	CloseSpeak( OwnerID() )
	local Keyflag = { 542732, 542733, 542734, 542735, 542736, 542737, 542738, 542739, 542740, 542741 }
	for i = 1 , 10 , 1 do
		SetFlag(OwnerID(),Keyflag[i],0)
	end
end

function LuaS_113030_1() 

	SetSpeakDetail(OwnerID(),"[SC_113030_3]") -- �A�Qú���B���d���Ӭ��ޯ��M�P�W�n��q�H
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_113030_4]" , "LuaS_113030_2", 0 ) -- �ڭnú��ب����������d��
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_113030_5]" , "LuaS_113030_3", 0 ) -- �ڭnú�����_�K�]���d��
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_113030_6]" , "LuaS_113030_4", 0 ) -- �ڭnú��W���_�����d��
	if CountBodyItem( OwnerID() , 205642 ) >= 1 then	-- �� �ޯ��L�W�d��
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_113292_06]" , "LuaS_113030_EX", 0 ) -- �ڭn�H[205642]�ӻW�n��q
	end

end

function LuaS_113030_2() --�ب��������d���C

	SetSpeakDetail(OwnerID(),"[SC_113030_7]") 
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_113030_71]" , "LuaS_113030_2_1", 0 ) -- �ڭnú����K�Ť�äh770296
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_113030_72]" , "LuaS_113030_2_2", 0 ) -- �ڭnú�殦����770300
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_113030_73]" , "LuaS_113030_2_3", 0 ) -- �ڭnú�欥�d���H770298
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_113030_74]" , "LuaS_113030_2_4", 0 ) -- �ڭnú����Ĩ��w770297
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_113030_75]" , "LuaS_113030_2_5", 0 ) -- �ڭnú�����N���������q770299
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_113030_76]" , "LuaS_113030_2_6", 0 ) -- �ڭnú�滮�s770301
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , "LuaS_113030_1", 0 ) -- ��^�W�@��

end

function LuaS_113030_3() --���_�K�]�d���C

	SetSpeakDetail(OwnerID(),"[SC_113030_8]") 
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_113030_81]" , "LuaS_113030_3_1", 0 ) -- �ڭnú��º����A�G770323
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_113030_82]" , "LuaS_113030_3_2", 0 ) -- �ڭnú�橾�ߪ���۾�770324
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_113030_83]" , "LuaS_113030_3_3", 0 ) -- �ڭnú�楨���ƹF��770325
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_113030_84]" , "LuaS_113030_3_4", 0 ) -- �ڭnú���[������J770326
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_113030_85]" , "LuaS_113030_3_5", 0 ) -- �ڭnú�泷�i���p�J770327
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , "LuaS_113030_1", 0 ) -- ��^�W�@��
end

function LuaS_113030_4() --�W���_���d���C

	SetSpeakDetail(OwnerID(),"[SC_113030_9]")  
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_113030_91]" , "LuaS_113030_4_1", 0 ) -- �ڭnú����p���y��Ӫ�770317
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_113030_92]" , "LuaS_113030_4_2", 0 ) -- �ڭnú��i�F��770318
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_113030_93]" , "LuaS_113030_4_3", 0 ) -- �ڭnú�氨��770319
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_113030_94]" , "LuaS_113030_4_4", 0 ) -- �ڭnú��\��770320
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_113030_95]" , "LuaS_113030_4_5", 0 ) -- �ڭnú������}�[770321
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_113030_96]" , "LuaS_113030_4_6", 0 ) -- �ڭnú��a��F770322
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , "LuaS_113030_1", 0 ) -- ��^�W�@��
end

function LuaS_113030_5() --�ˬdú��d���i��

	local Keyflag = { 542732, 542733, 542734, 542735, 542736, 542737, 542738, 542739, 542740, 542741 } 
	for i = 1 , 10 , 1 do
		if (CheckFlag( OwnerID() , Keyflag[i] )==false)then	
			SetFlag(OwnerID(),Keyflag[i],1)
			break
		end
	end 
end

function LuaS_113030_6() --�d�ߤwú��d���i��

	local Keyflag = { 542732, 542733, 542734, 542735, 542736, 542737, 542738, 542739, 542740, 542741 } 
	local Num = 0
	for i = 1 , 10 , 1 do
		if (CheckFlag( OwnerID() , Keyflag[i] )==true)then	
			Num = Num+1 
		else
			break
		end
	end
	if Num == 1 then
		SetSpeakDetail(OwnerID(),"[SC_113030_121]")
	end
	if Num == 2 then
		SetSpeakDetail(OwnerID(),"[SC_113030_122]")
	end
	if Num == 3 then
		SetSpeakDetail(OwnerID(),"[SC_113030_123]")
	end
	if Num == 4 then
		SetSpeakDetail(OwnerID(),"[SC_113030_124]")
	end
	if Num == 5 then
		SetSpeakDetail(OwnerID(),"[SC_113030_125]")
	end
	if Num == 6 then
		SetSpeakDetail(OwnerID(),"[SC_113030_126]")
	end
	if Num == 7 then
		SetSpeakDetail(OwnerID(),"[SC_113030_127]")
	end
	if Num == 8 then
		SetSpeakDetail(OwnerID(),"[SC_113030_128]")
	end
	if Num == 9 then
		SetSpeakDetail(OwnerID(),"[SC_113030_129]")
	end
	if Num == 10 then
		SetSpeakDetail(OwnerID(),"[SC_113030_1210]") -- �A���ޯ��M�P�w�g�R����q�A�O�_�n����A���ޯ��M�P�H
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_113030_2]" , "LuaS_113030_0", 0 )-- �ڭn����ޯ��M�P
	end
end

function LuaS_113030_EX() --�ޯ��L�W�d��
	if ( CountBodyItem( OwnerID(), 205642 )<1) then 
		SetSpeakDetail(OwnerID(),"[SC_113030_10]") -- �A�ʤ֦��i�d���I
	else 
		SetSpeakDetail(OwnerID(),"[SC_113030_11]") -- �ڤw�g�N���i�d������q�W�n�b�ޯ��M�P���I
		DelBodyItem( OwnerID(), 205642 , 1 )
		BeginPlot( OwnerID() , "LuaS_113030_5" , 0 ) 
	end 
end

-----------------------------------------------�ب��������d��
function LuaS_113030_2_1() 
	if ( CountBodyItem( OwnerID(), 770296 )<1) then 
		SetSpeakDetail(OwnerID(),"[SC_113030_10]") -- �A�ʤ֦��i�d���I
	else 
		SetSpeakDetail(OwnerID(),"[SC_113030_11]") -- �ڤw�g�N���i�d������q�W�n�b�ޯ��M�P���I
		DelBodyItem( OwnerID(), 770296 , 1 )
		BeginPlot( OwnerID() , "LuaS_113030_5" , 0 ) 
	end 
end

function LuaS_113030_2_2() 
	if ( CountBodyItem( OwnerID(), 770300 )<1) then 
		SetSpeakDetail(OwnerID(),"[SC_113030_10]") -- �A�ʤ֦��i�d���I
	else 
		SetSpeakDetail(OwnerID(),"[SC_113030_11]") -- �ڤw�g�N���i�d������q�W�n�b�ޯ��M�P���I
		DelBodyItem( OwnerID(), 770300 , 1 )
		BeginPlot( OwnerID() , "LuaS_113030_5" , 0 ) 
	end 
end

function LuaS_113030_2_3() 
	if ( CountBodyItem( OwnerID(), 770298 )<1) then 
		SetSpeakDetail(OwnerID(),"[SC_113030_10]") -- �A�ʤ֦��i�d���I
	else 
		SetSpeakDetail(OwnerID(),"[SC_113030_11]") -- �ڤw�g�N���i�d������q�W�n�b�ޯ��M�P���I
		DelBodyItem( OwnerID(), 770298 , 1 )
		BeginPlot( OwnerID() , "LuaS_113030_5" , 0 ) 
	end 
end

function LuaS_113030_2_4() 
	if ( CountBodyItem( OwnerID(), 770297 )<1) then 
		SetSpeakDetail(OwnerID(),"[SC_113030_10]") -- �A�ʤ֦��i�d���I
	else 
		SetSpeakDetail(OwnerID(),"[SC_113030_11]") -- �ڤw�g�N���i�d������q�W�n�b�ޯ��M�P���I
		DelBodyItem( OwnerID(), 770297 , 1 )
		BeginPlot( OwnerID() , "LuaS_113030_5" , 0 ) 
	end 
end

function LuaS_113030_2_5() 
	if ( CountBodyItem( OwnerID(), 770299 )<1) then 
		SetSpeakDetail(OwnerID(),"[SC_113030_10]") -- �A�ʤ֦��i�d���I
	else 
		SetSpeakDetail(OwnerID(),"[SC_113030_11]") -- �ڤw�g�N���i�d������q�W�n�b�ޯ��M�P���I
		DelBodyItem( OwnerID(), 770299 , 1 )
		BeginPlot( OwnerID() , "LuaS_113030_5" , 0 ) 
	end 
end

function LuaS_113030_2_6() 
	if ( CountBodyItem( OwnerID(), 770301 )<1) then 
		SetSpeakDetail(OwnerID(),"[SC_113030_10]") -- �A�ʤ֦��i�d���I
	else 
		SetSpeakDetail(OwnerID(),"[SC_113030_11]") -- �ڤw�g�N���i�d������q�W�n�b�ޯ��M�P���I
		DelBodyItem( OwnerID(), 770301 , 1 )
		BeginPlot( OwnerID() , "LuaS_113030_5" , 0 ) 
	end 
end

-----------------------------------------------���_�K�]�d��
function LuaS_113030_3_1() 
	if ( CountBodyItem( OwnerID(), 770323 )<1) then 
		SetSpeakDetail(OwnerID(),"[SC_113030_10]") -- �A�ʤ֦��i�d���I
	else 
		SetSpeakDetail(OwnerID(),"[SC_113030_11]") -- �ڤw�g�N���i�d������q�W�n�b�ޯ��M�P���I
		DelBodyItem( OwnerID(), 770323 , 1 )
		BeginPlot( OwnerID() , "LuaS_113030_5" , 0 ) 
	end 
end

function LuaS_113030_3_2() 
	if ( CountBodyItem( OwnerID(), 770324 )<1) then 
		SetSpeakDetail(OwnerID(),"[SC_113030_10]") -- �A�ʤ֦��i�d���I
	else 
		SetSpeakDetail(OwnerID(),"[SC_113030_11]") -- �ڤw�g�N���i�d������q�W�n�b�ޯ��M�P���I
		DelBodyItem( OwnerID(), 770324 , 1 )
		BeginPlot( OwnerID() , "LuaS_113030_5" , 0 ) 
	end 
end

function LuaS_113030_3_3() 
	if ( CountBodyItem( OwnerID(), 770325 )<1) then 
		SetSpeakDetail(OwnerID(),"[SC_113030_10]") -- �A�ʤ֦��i�d���I
	else 
		SetSpeakDetail(OwnerID(),"[SC_113030_11]") -- �ڤw�g�N���i�d������q�W�n�b�ޯ��M�P���I
		DelBodyItem( OwnerID(), 770325 , 1 )
		BeginPlot( OwnerID() , "LuaS_113030_5" , 0 ) 
	end 
end

function LuaS_113030_3_4() 
	if ( CountBodyItem( OwnerID(), 770326 )<1) then 
		SetSpeakDetail(OwnerID(),"[SC_113030_10]") -- �A�ʤ֦��i�d���I
	else 
		SetSpeakDetail(OwnerID(),"[SC_113030_11]") -- �ڤw�g�N���i�d������q�W�n�b�ޯ��M�P���I
		DelBodyItem( OwnerID(), 770326 , 1 )
		BeginPlot( OwnerID() , "LuaS_113030_5" , 0 ) 
	end 
end

function LuaS_113030_3_5() 
	if ( CountBodyItem( OwnerID(), 770327 )<1) then 
		SetSpeakDetail(OwnerID(),"[SC_113030_10]") -- �A�ʤ֦��i�d���I
	else 
		SetSpeakDetail(OwnerID(),"[SC_113030_11]") -- �ڤw�g�N���i�d������q�W�n�b�ޯ��M�P���I
		DelBodyItem( OwnerID(), 770327 , 1 )
		BeginPlot( OwnerID() , "LuaS_113030_5" , 0 ) 
	end 
end

-----------------------------------------------�W���_���d��
function LuaS_113030_4_1() 
	if ( CountBodyItem( OwnerID(), 770317 )<1) then 
		SetSpeakDetail(OwnerID(),"[SC_113030_10]") -- �A�ʤ֦��i�d���I
	else 
		SetSpeakDetail(OwnerID(),"[SC_113030_11]") -- �ڤw�g�N���i�d������q�W�n�b�ޯ��M�P���I
		DelBodyItem( OwnerID(), 770317 , 1 )
		BeginPlot( OwnerID() , "LuaS_113030_5" , 0 ) 
	end 
end

function LuaS_113030_4_2() 
	if ( CountBodyItem( OwnerID(), 770318 )<1) then 
		SetSpeakDetail(OwnerID(),"[SC_113030_10]") -- �A�ʤ֦��i�d���I
	else 
		SetSpeakDetail(OwnerID(),"[SC_113030_11]") -- �ڤw�g�N���i�d������q�W�n�b�ޯ��M�P���I
		DelBodyItem( OwnerID(), 770318 , 1 )
		BeginPlot( OwnerID() , "LuaS_113030_5" , 0 ) 
	end 
end

function LuaS_113030_4_3() 
	if ( CountBodyItem( OwnerID(), 770319 )<1) then 
		SetSpeakDetail(OwnerID(),"[SC_113030_10]") -- �A�ʤ֦��i�d���I
	else 
		SetSpeakDetail(OwnerID(),"[SC_113030_11]") -- �ڤw�g�N���i�d������q�W�n�b�ޯ��M�P���I
		DelBodyItem( OwnerID(), 770319 , 1 )
		BeginPlot( OwnerID() , "LuaS_113030_5" , 0 ) 
	end 
end

function LuaS_113030_4_4() 
	if ( CountBodyItem( OwnerID(), 770320 )<1) then 
		SetSpeakDetail(OwnerID(),"[SC_113030_10]") -- �A�ʤ֦��i�d���I
	else 
		SetSpeakDetail(OwnerID(),"[SC_113030_11]") -- �ڤw�g�N���i�d������q�W�n�b�ޯ��M�P���I
		DelBodyItem( OwnerID(), 770320 , 1 )
		BeginPlot( OwnerID() , "LuaS_113030_5" , 0 ) 
	end 
end

function LuaS_113030_4_5() 
	if ( CountBodyItem( OwnerID(), 770321 )<1) then 
		SetSpeakDetail(OwnerID(),"[SC_113030_10]") -- �A�ʤ֦��i�d���I
	else 
		SetSpeakDetail(OwnerID(),"[SC_113030_11]") -- �ڤw�g�N���i�d������q�W�n�b�ޯ��M�P���I
		DelBodyItem( OwnerID(), 770321 , 1 )
		BeginPlot( OwnerID() , "LuaS_113030_5" , 0 ) 
	end 
end

function LuaS_113030_4_6() 
	if ( CountBodyItem( OwnerID(), 770322 )<1) then 
		SetSpeakDetail(OwnerID(),"[SC_113030_10]") -- �A�ʤ֦��i�d���I
	else 
		SetSpeakDetail(OwnerID(),"[SC_113030_11]") -- �ڤw�g�N���i�d������q�W�n�b�ޯ��M�P���I
		DelBodyItem( OwnerID(), 770322 , 1 )
		BeginPlot( OwnerID() , "LuaS_113030_5" , 0 ) 
	end 
end









