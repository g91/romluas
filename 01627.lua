
-- 2011.11.23 �ק�I��§���һݾ��Ҽƶq�A�令10�ӡC

function Lua_Dan_Xams2009_114039_0() --���ʩM�����s���ʪ�NPC

	SetSpeakDetail(OwnerID(), "[SC_2009_XAMS_ANDREAS_0]" )--[Sys111828_szquestnpctext]�A�b�x�V�`����^�U�A�O���ӿW�۴�L���A�B�ͳ��E�b�@�_�A�x�V�`�ӮɡA�u���ܦ���A��U���\�h[112015]�A....
	--AddSpeakOption(OwnerID(), TargetID(), "Do you know about Santa?", "Lua_Dan_Xams2009_114039_3", 0) --����t�ϦѤH���ǻ��b24, 25�|�X�{
	AddSpeakOption(OwnerID(), TargetID(), "[SC_2009_XAMS_ANDREAS_1]", "Lua_Dan_Xams2009_114039_1", 0) --��ť�������Ű����[114076]
	AddSpeakOption(OwnerID(), TargetID(), "[SC_0908SEANSON_03]", "Lua_Dan_Xams2009_114039_2", 0) --�ڷQ�I�����y 
	--AddSpeakOption(OwnerID(), TargetID(), "I've heard a activity in Logar city and zone 6 zone 10", "Lua_Dan_Xams2009_114039_2", 0) --�t�ϦѤH������§�~
	--AddSpeakOption(OwnerID(), TargetID(), "Do you know how to pant Christmas Tree?", "Lua_Dan_Xams2009_114039_4", 0) --�t�Ϭ��M�t�Ͼ𪺺ش�
end
------------------------------------------------------------------
function Lua_Dan_Xams2009_114039_1() --�t�ϦѤH����m�M�o�ͤ���ơA�ԭz�����a���D

	SetSpeakDetail(OwnerID(), "[SC_2009_XAMS_ANDREAS_2]" )--�o�U�V�F�A.........
	AddSpeakOption(OwnerID(), TargetID(), "[SC_2009_XAMS_ANDREAS_3]", "Lua_Dan_Xams2009_Collect_SliceofSledge", 0) --[114076]���аU - �`��[206399]
	AddSpeakOption(OwnerID(), TargetID(), "[SC_2009_XAMS_ANDREAS_4]", "Lua_Dan_Xams2009_LookforflyingStone", 0) --[114076]���аU�л`��[206324]	
	AddSpeakOption(OwnerID(), TargetID(), "[SC_2009_XAMS_ANDREAS_5]", "Lua_Dan_Xams2009_LookforReindeer", 0) --[114076]���аU - �M��[206441]
	AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "Lua_Dan_Xams2009_114039_0", 0)         --�^��W�@��

end
------------------------------------------------------------------
function Lua_Dan_Xams2009_Collect_SliceofSledge() --�t�ϦѤH���C��e�U�@�G���������H��

	SetSpeakDetail(OwnerID(), "[SC_2009_XAMS_ANDREAS_6]" )--[114076]��[114078]���G�ʤ֤F�ܦh�����A�ݭn��^�s�H��[206399]�A�γ\�A�i�H�����h�߰ݥL�A�i�H���D��h�����p...
	AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "Lua_Dan_Xams2009_114039_1", 0)         --�^��W�@��


end
------------------------------------------------------------------
function Lua_Dan_Xams2009_LookforflyingStone() --�t�ϦѤH���C��e�U�G�дM��B��

	SetSpeakDetail(OwnerID(), "[SC_2009_XAMS_ANDREAS_7]" )--[114076]��[114078]�]�����������Y�A���G�L�k���H���@�˯���B�ūe�i�F�A�ڰO�o���@�ب㦳�����O�q��[206324]�A�i��|�������U....
	AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "Lua_Dan_Xams2009_114039_1", 0)         --�^��W�@��

end
------------------------------------------------------------------
function Lua_Dan_Xams2009_LookforReindeer() --�t�ϦѤH���C��e�U�T�Ч�^����

	SetSpeakDetail(OwnerID(), "[SC_2009_XAMS_ANDREAS_8]" )--�u�r�r�A�ڭ�q[ZONE_HYBORA HIGHLANDS]��[ZONE_ASLAN]����Ȧ�^�ӡA����F�\�h[206441]�Ať���o��[206441]�ܳ߷R��ť�M�ܪ��ȹa�n�T...
	AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "Lua_Dan_Xams2009_114039_1", 0)         --�^��W�@��

end
------------------------------------------------------------------
function Lua_Dan_Xams2009_114039_2() --�ڷQ�I�����y 
	local needcount = 10  -- �ݭn���_�_�̵��ƶq
	local needcount2 = 2   -- �ݨD�ǰe���Ť�ƶq

	SetSpeakDetail(OwnerID(), "[SC_2009_XAMS_ANDREAS_9]" )--[Sys421558_szquest_complete_detail]�A�o�U�ڥi�H�~��ڪ��ȵ{�F�A�A�w�g�`���o��h��[206437]�A�A�G�M�O�ӨīĤl�A�o��[206464]�N�e���A�����y�a�I
	AddSpeakOption(OwnerID(), TargetID(), "[SC_2009_XAMS_ANDREAS_10][$SETVAR1="..needcount.."]", "Lua_Dan_Xams2009_114039_ConvertReward", 0) --�ڭn��X��[206437]�I�����y
	AddSpeakOption(OwnerID(), TargetID(), "[SC_2011_XAMS_NPCSPEAK][$SETVAR1="..needcount2.."]", "lua_mika_Xmas_ticketget", 0) --�ڭn��[$VAR1]��[202904]�I��[205944]
	AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "Lua_Dan_Xams2009_114039_0", 0)         --�^��W�@��

end

function lua_mika_Xmas_ticketget()
	local OID = OwnerID()
	local needitem = 202904  -- �I���ݨD���~ - �ǰe���Ť�
	local needcount = 2
	local count = CountBodyItem( OID , needitem )   -- ���a�������ݨD���~�ƶq
	local giveitem =  205944

	if count >= needcount then 
		SetSpeakDetail( OID, "[Sys111828_szquestnpctext]") --�x�V�`�ּ֧ڪ��B��
		DelBodyItem( OID , needitem , needcount ) --�R���I�]�����ƶq
		GiveBodyItem( OID , giveitem  , 1 ) --�x�V�`���ʭ��m��
	else
		SetSpeakDetail( OwnerID(), "[K_08MID_DIALOG7]") --�z�ҫ������ƶq�����A�٤���I����C 
		AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "Lua_Dan_Xams2009_114039_2", 0)--�^��W�@��
	end

end

------------------------------------------------------------------
function Lua_Dan_Xams2009_114039_ConvertReward() --�ڷQ�I�����y 206464	�w�w�|�v��§���@�� [206437]�I��
	local needcount = 10  -- �ݭn���_�_�̵��ƶq
	local Owner = OwnerID()
	local Target = TargetID()

	if EmptyPacketCount(Owner ) >= 1 and QueuePacketCount( Owner ) == 0 then 

		 if CountBodyItem( Owner , 206437) >= needcount then  --�p�⨭�W���h�֭Ө��_�_�̵�
			SetSpeakDetail( Owner , "[Sys111828_szquestnpctext]") --�x�V�`�ּ֧ڪ��B��
			ScriptMessage( Owner  , Target , 1 , "[Sys111828_szquestnpctext]" , C_SYSTEM )
			ScriptMessage( Owner , Target , 0 , "[Sys111828_szquestnpctext]" , C_SYSTEM )
			PlayMotion(Target, 128)		
			CastSpell( Target, Owner, 494690 ); --�x�V�Ѥ���������
			DelBodyItem( Owner  , 206437 , needcount ) --�R���I�]�����ƶq
			GiveBodyItem( Owner , 241481 , 15 ) --�P������ x 15
			if DW_Rand(100) >= 97 then  -- 3%���v�B�~��o�g����~����
				GiveBodyItem( Owner , 241462 , 1 )
			end
			 GiveBodyItem( Owner , 242094 , 1 ) --�w�w�|�v��§��
		   --	GiveBodyItem( Owner , 206464  , 1 ) --�w�w�|�v��§��  --2013�~�n�B��
			AddSpeakOption (Owner , Target, "[SO_BACK]", "Lua_Dan_Xams2009_114039_2", 0)--�^��W�@��
		else
			 SetSpeakDetail( Owner , "[K_08MID_DIALOG7]") --�z�ҫ������ƶq�����A�٤���I����C 
		    		 AddSpeakOption (Owner , Target, "[SO_BACK]", "Lua_Dan_Xams2009_114039_2", 0)--�^��W�@��
		end
	else

	       	     SetSpeakDetail( OwnerID(), "[SC_DAN_111700_22]") --�A���I�]�Ŷ�����
	   	      AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "Lua_Dan_Xams2009_114039_2", 0)--�^��W�@��

	end

end
------------------------------------------------------------------
--function Lua_Dan_Xams2009_114039_2() --�M�����l�A�t�ϦѤH������§�~�]�T�Ӯɬq�A��������15�����C�^

--	SetSpeakDetail ( OwnerID(), "Ho...Ho...Ho... Lots socks... Do you know what it is??? heee" )--�򥻹�ܡC
--	AddSpeakOption ( OwnerID(), TargetID(), "Game Rules, Where, When", "Lua_Dan_Xams2009_Ruleoflookingforsocks", 0) --�����C���W�h
--	AddSpeakOption ( OwnerID(), TargetID(), "I would like to go there by NPC", "Lua_Dan_Xams2009_Transport_LogarCity", 0) --�ڥi�H��A�ǥh���ʦa�I�@
	--AddSpeakOption ( OwnerID(), TargetID(), "I would like to know about the clue", "", 0) --�ڷQ�n�F�Ѫ������l�i��X�{���u���]�ӫ��I�^
	--AddSpeakOption ( OwnerID(), TargetID(), "I'm good baby, i would like to play this game with good of item shop", "", 0) --�ڬO���_�_�A�ڭn�b���@���o�Ӭ���(�ӫ����m�^
--	AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "Lua_Dan_Xams2009_114039_0", 0)         --�^��W�@��

--end
------------------------------------------------------------------
--function Lua_Dan_Xams2009_Ruleoflookingforsocks() --�����C���W�h

--	SetSpeakDetail ( OwnerID(), "How to play this game..." )--�򥻹�ܡC
--	AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "Lua_Dan_Xams2009_114039_2", 0)         --�^��W�@��

--end
------------------------------------------------------------------
--function Lua_Dan_Xams2009_Transport_LogarCity() --�ڥi�H��A�ǥh���ʦa�I�@(��10�������^�h�[Dialog�C�����a�I

--		CloseSpeak( OwnerID())
--		BeginPlot(OwnerID(),"Lua_Dan_Xams2009_Transport_LogarCity_1",0)
	
--end
------------------------------------------------------------------
--function Lua_Dan_Xams2009_Transport_LogarCity_1()
		
--		DialogCreate( OwnerID() , EM_LuaDialogType_YesNo ,"Would you like to pay 10 gold to transport?")
--		DialogSelectStr( OwnerID() , "[SC_GETTITLE_1]" );
--		DialogSelectStr( OwnerID() , "[SC_CANCEL]" );
--		if( DialogSendOpen( OwnerID() ) == false ) then 
--			ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_FIXEQ_DATA_ERROR]",0)	
			--��ưe�X�����D
--			return
--		end
--		for i = 0 , 100 , 1 do
--			Sleep( 1 );
--			SelectID = DialogGetResult( TargetID() );
--			if ( SelectID ~= -2 ) and ( SelectID ~= -1 ) and i < 100 then
--				if ( SelectID == 0 ) then
----					
--					if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) >= 10 then
--						ScriptMessage( OwnerID(),OwnerID(), 1, "Merry Christmas",0)
--						AddRoleValue( OwnerID() , EM_RoleValue_Money , -10 )
--						ChangeZone( OwnerID() , 1 , 0, 6372, 61, -3106, 50) --�u�Ǩ�ù����
--					else
--						SetSpeakDetail( OwnerID(), "[ST_110989_3_2]"   ) --�z����������
--					end				
--					DialogClose( OwnerID() )
--					break;
--				elseif ( SelectID == 1 ) then
--					ScriptMessage( OwnerID(),OwnerID(), 1, "OH NO... okay... just go by yourself, alright?",0)
--					DialogClose( OwnerID() )		
--					break
--				end
--			elseif i == 100 then
--				DialogClose( OwnerID() )		
--				break
--			end
--		end
--end
------------------------------------------------------------------
--function Lua_Dan_Xams2009_114039_3() --����t�ϦѤH���ǻ�

--	SetSpeakDetail ( OwnerID(), "About the Santa......?" )--�t�ϦѤH���|�b24, 25�X�S........�C
--	AddSpeakOption ( OwnerID(), TargetID(), "I wanna know where santa is... right now... ?", "Lua_Dan_Xams2009_SantaLocation", 0) --�t�ϦѤH�ثe������
--	AddSpeakOption ( OwnerID(), TargetID(), "I wanna mail to Santa...?", "Lua_Dan_Xams2009_MailtoSanta", 0) --�H�H���t�ϦѤH (�C�ѥi�o�@�ӿ}�G) ���h���H�c��A�i�o�X�СC
--	AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "Lua_Dan_Xams2009_114039_0", 0)         --�^��W�@��
--end
------------------------------------------------------------------
--function Lua_Dan_Xams2009_SantaLocation() --�t�ϦѤH�ثe������

--	SetSpeakDetail ( OwnerID(), "Santa is in zone 2 or 3 or 4........?" )--��Random�r��A���i�C�Ѹt�ϦѤH�j���]�h��
--	AddSpeakOption ( OwnerID(), TargetID(), "I wanna know where santa is by good of item shop", "", 0) --�P�_����A�çi�����a�t�ϦѤH�i��X�{���a�I
--	AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "Lua_Dan_Xams2009_114039_3", 0)         --�^��W�@��

--end
------------------------------------------------------------------
--function Lua_Dan_Xams2009_MailtoSanta() --�H�H���t�ϦѤH (�C�ѥi�o�@�ӿ}�G) ���h���H�c��A�i�o�C��X�СC

--	SetSpeakDetail ( OwnerID(), "Take this mail to mailbox for santa.....?" )--��H���H�c��A�W����socks�|�o�G�A�õ������a�}�G�C
--	Sleep(10)
	--Givebodyitem(TargetID(),530185 ,1 ) --���}�G
	--Setflag( TargetID(), 540764, 1) -- �C���
	--DelBodyItem( TargetID() , 200167 , 1 ) --�R���H
	--AddSpeakOption ( OwnerID(), TargetID(), "I wanna know where santa is... right now... ?", "", 0) --�t�ϦѤH�ثe������
--	AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "Lua_Dan_Xams2009_114039_3", 0)         --�^��W�@��

--end

------------------------------------------------------------------
--function Lua_Dan_Xams2009_114039_4() --�p��شӸt�Ϭ��M��о�

--	SetSpeakDetail ( OwnerID(), "About the Christmas Tree and  Common poinsettia,......?" )--�򥻹�ܡC
--	AddSpeakOption ( OwnerID(), TargetID(), "How to plant Christmas Tree and Common poinsettia?", "Lua_Dan_Xams2009_HowtoPlant", 0) --�p��شӸt�Ͼ�M�t�Ϭ�
--	AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "Lua_Dan_Xams2009_114039_0", 0)         --�^��W�@��

--end
------------------------------------------------------------------
--function Lua_Dan_Xams2009_HowtoPlant() --�p��شӸt�Ͼ�M�t�Ϭ�

--	SetSpeakDetail ( OwnerID(), "About the Christmas Tree and  Common poinsettia, ......" )--�򥻹�ܡC
--	AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "Lua_Dan_Xams2009_114039_4", 0)         --�^��W�@��

--end