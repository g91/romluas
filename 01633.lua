function Lua_Dan_114076_Talking() --�ϥΰj�����t�ϦѤ����ʧ@�M����
	AddBuff(  OwnerID(),  503217, 1, -1) 
	local String = { "[Sys110241_szquestnpctext]", "[Sys422084_szquest_uncomplete_detail]",  "[Sys421300_szquest_uncomplete_detail]"}
	------------------------------------------------
	while true do
	----------------------------------------------�ɶ��B�z
	Sleep(300)

		PlayMotion ( OwnerID() , 122 ); --�x�Z
		Sleep(20)
		PlayMotion ( OwnerID() , 112 );
		NPCSay(OwnerID(), String[1])
--����
		sleep(10)
		PlayMotion ( OwnerID() , 112 );
		NPCSay(OwnerID(), String[2])
		sleep(10)
		PlayMotion ( OwnerID() , ruFUSION_ACTORSTATE_CROUCH_BEGIN ) --�ۤU
		NPCSay(OwnerID(), String[3])  --Random
		--Say(OwnerID(), "")
		sleep(10)
		PlayMotion ( OwnerID() , 75 ) --�ۤU
		sleep(10)
		PlayMotion ( OwnerID() , 112 );
		NPCSay(OwnerID(), "[SC_2009_XAMS_SANTA_0]") --�p�G���H�������״_�����A�ڴN���~��ڪ��ȵ{�ήɱN�x�V�`§���e���@�ɤW�C�@����_�_�F�O... 
		--sleep(10)
	end


end
---------------------------------------------------------------------------------------------------------------
function Lua_Dan_114076_Main() --�Ĥ@�h
	
	SetSpeakDetail( OwnerID(), "[SC_2009_XAMS_SANTA_1]" )--������...�x�V�`�ּ֡C�A�ݬݧڡA���p�ߥX�F�@�I�p�N�~�A���ȳ������a�F�A�s�S���������F�A�A�i�H�����ڭײz�����M��^�S���ܡH�Ĥl���٦b���ۧکO�C
	AddSpeakOption( OwnerID(), TargetID(), "[SC_2009_XAMS_SANTA_2]", "Lua_Dan_114076_Quest_1", 0) --�ײz���� - ��^ 20 ��[206399]
	AddSpeakOption( OwnerID(), TargetID(), "[SC_2009_XAMS_SANTA_3]", "Lua_Dan_114076_Quest_2", 0) --���ʳ��� - ��^10��[206324]
	AddSpeakOption( OwnerID(), TargetID(), "[SC_2009_XAMS_SANTA_4]", "Lua_Dan_114076_Quest_3", 0) --�M�乥�� - �a�^����[114095]

end
---------------------------------------------------------------------------------------------------------------
function Lua_Dan_114076_Quest_1() --20�ӳ����s����W�λ���
	
	SetSpeakDetail(OwnerID(), "[SC_2009_XAMS_SANTA_5]" )--[Sys110241_szquestnpctext]�A�A�ݬݳo��[114078]�ʤ֦n�h�����A�ܦ��s�s�������ˤl�A�ڧکҪ��A[206399]�Q�\�h�Ǫ������F�A�ЧA�����ڦ����^�ӡA���ڥi�H�ײz�o��[114089]�C
	AddSpeakOption(OwnerID(), TargetID(), "[SC_2009_XAMS_SANTA_6]", "Lua_Dan_114076_Quest_1_SignUP", 0) --[SCRIPT_BORDER_ACCEPTQUEST] - �`��20��[206399]
	AddSpeakOption(OwnerID(), TargetID(), "[SC_2009_XAMS_SANTA_7]", "Lua_Dan_114076_Quest_1_ConvertReward", 0) --��20��[206399][SC_CLICKFUNGO24]
	AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "Lua_Dan_114076_Main", 0)         --�^��W�@��

end
---------------------------------------------------------------------------------------------------------------
function Lua_Dan_114076_Quest_1_SignUP()  --�����s����W

	local Signed_Flag = CheckFlag(OwnerID()  , 543292) --�T�{���ѬO�_���W�����s�����
	if Signed_Flag == false then
			PlayMotion ( OwnerID() , 112 );
			SetSpeakDetail (OwnerID(), "[SC_2009_XAMS_SANTA_8]") --[Sys113420_szquestnpctext]�A[Sys420426_szquest_complete_detail]
			ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_2009_XAMS_SANTA_8]" , C_SYSTEM )
			ScriptMessage( TargetID() , OwnerID() , 0 , "[SC_2009_XAMS_SANTA_8]" , C_SYSTEM )
			Sleep(10)
			PlayMotion ( TargetID() , 121 );
			PlayMotion ( OwnerID() , 103 );
			 SetFlag( OwnerID()  , 543292 , 1 ) --�����w�I�����y�X�СA�@�ѸѤ@��
	else 
			SetSpeakDetail (OwnerID(), "[SC_MUSICFES_CODE16]") --�A�w�g���W�L�F
		 	AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "Lua_Dan_114076_Quest_1", 0)--�^��W�@��
	end

end
---------------------------------------------------------------------------------------------------------------
function Lua_Dan_114076_Quest_1_ConvertReward() --�����s�󴫼��y

	local Signed_Flag = CheckFlag(OwnerID()  ,    543292)    --�T�{���ѬO�_���W�����s�����
	local Finished_Flag = CheckFlag(OwnerID()  , 543289) --�T�{���ѬO�_�ѹL�����s�����

		if Finished_Flag == false then
		         if Signed_Flag == True then
		     	 if EmptyPacketCount( OwnerID() ) >= 1 and QueuePacketCount( OwnerID() ) == 0 then --���}�G�M�̵�
				 if CountBodyItem( OwnerID() , 206399) >= 10 then  --�p�⨭�W���h�֭ӸH��(20�ӥH�W)

					--�M�䳷���@���A�M�����ʺA
					------------------------------------------------------------------------------------------------
						local Sledge = SearchRangeNPC ( TargetID() , 500 )
						--local PID
							for i=0 , table.getn(Sledge) do	
							local  ID = ReadRoleValue( Sledge[i], EM_RoleValue_OrgID)
								if  ID == 114089 then
										--�[�J�@�Ӳ��ʨ�Ӧa�誺�X�аʧ@
										--Playmotion(TargetID(), 75) --�t�ϦѤ����}�l�ײz�Ause item				 	
									BeginPlot( Sledge[i] , "LuaDan_showingmotion" , 20 )										
									--Playmotion( Sledge[i], ruFUSION_ACTORSTATE_ACTIVATE_BEGIN)	
									--sleep(20)							
									--Playmotion( Sledge[i], ruFUSION_ACTORSTATE_ACTIVATE_END)        --�����^�_����
									--sleep(10)									
									BeginPlot( Sledge[i] , "LuaI_114076_Reset" , 50)

								end
							end	
					------------------------------------------------------------------------------------------------
					--�t�ϦѤH��t�@��
					--�����}�G�M�̵�
					SetSpeakDetail( OwnerID(), "[SC_111584_YU_27]") --���§A�������I�Ц��U�o��§���a�I 
					ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_111584_YU_27]" , C_SYSTEM )
					ScriptMessage( TargetID() , OwnerID() , 0 , "[SC_111584_YU_27]" , C_SYSTEM )					
					DelBodyItem( OwnerID() , 206399 , 10) --�R���I�]�����ƶq
					SetFlag( OwnerID()  , 543289 , 1 ) --�����w�I�����y�X�СA�@�ѸѤ@��
				                --GiveBodyItem( OwnerID() , 203524  , 1) --�x�V�δο} * 1
					if CheckBuff(OwnerID(), 505325)  == false and CheckBuff(OwnerID(), 505326)  == false  and CheckBuff(OwnerID(), 505328)  == false then
					CastSpell( TargetID(), OwnerID(), 494691 ); --�x�V�Ѥ���������
					end
	        				GiveBodyItem( OwnerID() , 206437  , 1 ) --�ڬO���_�_�̵�
					AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "Lua_Dan_114076_Quest_1", 0)--�^��W�@��

				else
					
					 SetSpeakDetail( OwnerID(), "[K_08MID_DIALOG7]") --�z�ҫ������ƶq�����A�٤���I����C 
		     		                 AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "Lua_Dan_114076_Quest_1", 0)--�^��W�@��

				end

			else
	         		      	 SetSpeakDetail( OwnerID(), "[SC_DAN_111700_22]") --�A���I�]�Ŷ�����
	     		                 AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "Lua_Dan_114076_Quest_1", 0)--�^��W�@��
			end
		else

		SetSpeakDetail (OwnerID(), "[SC_112502_NOSTART]") --�A�٨S�ѥ[�o�Ӭ��ʳ��I 
	 	 AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "Lua_Dan_114076_Quest_1", 0)--�^��W�@��

		end
	else
		SetSpeakDetail (OwnerID(), "[SC_112312_TODAY]") --���ѯu�O���W�A�F�C�����쪺�ܡA���ѦA�~��ЧA������I 
	 	 AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "Lua_Dan_114076_Quest_1", 0)--�^��W�@��
	end
end
---------------------------------------------------------------------------------------------------------------
function LuaDan_showingmotion()

	Playmotion( OwnerID(), ruFUSION_ACTORSTATE_ACTIVATE_BEGIN)
	sleep(30)
	Playmotion( OwnerID(), ruFUSION_ACTORSTATE_ACTIVATE_END)
	sleep(30)
end
---------------------------------------------------------------------------------------------------------------
function Lua_Dan_114076_Quest_2() --�����ӯB�ۥ���
	
	SetSpeakDetail(OwnerID(), "[SC_2009_XAMS_SANTA_9]" )--�Ӧn�F�A�ײz�n[114078]����A���ٻݭn�@�ب㦳�ƯB��O��[206324]�A���ڻs�@��[206398]�A�x�b[114078]�W�N�|�B�_�ӡA�~��a�ګe���U�a...�Ыe��[ZONE_CAIRN HILL]�M��[206324]�a�I
	AddSpeakOption(OwnerID(), TargetID(), "[SC_2009_XAMS_SANTA_10]", "Lua_Dan_114076_Quest_2_SignUP", 0) --[SCRIPT_BORDER_ACCEPTQUEST] - �`��10��[206324]
	AddSpeakOption(OwnerID(), TargetID(), "[SC_2009_XAMS_SANTA_11]", "Lua_Dan_114076_Quest_2_Convertthereward", 0) --��10��[206324][SC_CLICKFUNGO24]
	AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "Lua_Dan_114076_Main", 0)         --�^��W�@��

end
---------------------------------------------------------------------------------------------------------------
function Lua_Dan_114076_Quest_2_SignUP() --���W�B�ۥ���

	local Signed_Flag = CheckFlag(OwnerID()  , 543532) --�T�{���ѬO�_���W�����s�����
	if Signed_Flag == false then
			PlayMotion ( OwnerID() , 112 );
			SetSpeakDetail (OwnerID(), "[SC_2009_XAMS_SANTA_12]") --[SC_112311_9]�A[SC_111584_YU_36]
			ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_2009_XAMS_SANTA_12]" , C_SYSTEM )
			ScriptMessage( TargetID() , OwnerID() , 0 , "[SC_2009_XAMS_SANTA_12]" , C_SYSTEM )
			Sleep(10)
			PlayMotion ( TargetID() , 121 );
			PlayMotion ( OwnerID() , 103 );
			 SetFlag( OwnerID()  , 543532 , 1 ) --�����w�I�����y�X�СA�@�ѸѤ@��
	else 
			SetSpeakDetail (OwnerID(), "[SC_MUSICFES_CODE16]") --�A�w�g���W�L�F
		 	AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "Lua_Dan_114076_Quest_2", 0)--�^��W�@��
	end


end
---------------------------------------------------------------------------------------------------------------
function Lua_Dan_114076_Quest_2_Convertthereward() --�B�۫�_����

	local Signed_Flag = CheckFlag(OwnerID()  , 543532) --�T�{���ѬO�_���W�����s�����
	local Finished_Flag = CheckFlag(OwnerID()  , 543290) --�T�{���ѬO�_�ѹL�����s�����

		if Finished_Flag == false then
		if Signed_Flag == True then
		     	 if EmptyPacketCount( OwnerID() ) >= 1 and QueuePacketCount( OwnerID() ) == 0 then --���@�ӷx�V���߿}�M�̵�
				 if CountBodyItem( OwnerID() , 206324) >= 5 then  --�p�⨭�W���h�֭��]�k����(20�ӥH�W)

					--�M�䳷���@���A�M�����ʺA
					------------------------------------------------------------------------------------------------
						local Sledge = SearchRangeNPC ( OwnerID() , 500 )
						local PID
							for i=0 , table.getn(Sledge) do	
							local  ID = ReadRoleValue( Sledge[i] , EM_RoleValue_OrgID)
								if  ID == 114089 then
										--�[�J�@�Ӳ��ʨ�Ӧa�誺�X�аʧ@
										--Playmotion(TargetID(), 75) --�t�ϦѤ����}�l�ײz�Ause item
									 	--Playmotion(Sledge[i], 119)	--�����}�l�^�_																									
										--sleep(300) --���m�ɶ�
										--Playmotion(Sledge[i], ruFUSION_ACTORSTATE_ACTIVATE_END)        --�����^�_����
										--BeginPlot( Sledge[i] , "LuaDan_Sledge_Reset" , 0 )
										ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_2009_XAMS_SANTA_24]" , C_SYSTEM )
										ScriptMessage( TargetID() , OwnerID() , 0 , "[SC_2009_XAMS_SANTA_24]" , C_SYSTEM )

										CastSpell( Sledge[i], Sledge[i], 494660 ); --�I�񯻥�
										--sleep(10)
										BeginPlot( Sledge[i] , "LuaI_114076_Reset" , 50 ) --���m
										BeginPlot( Sledge[i] , "LuaDan_114076_Newsledge" , 40 ) --���m
										--local New_Sledge = LuaFunc_CreateObjByObj( 114078 , Sledge[i])
										PlayMotion(TargetID(), 128)
								end
							end	
					------------------------------------------------------------------------------------------------
					--�t�ϦѤH��t�@��
					--�����}�G�M�̵�
					--ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_2009_XAMS_SANTA_23]" , C_SYSTEM )
					--ScriptMessage( TargetID() , OwnerID() , 0 , "[SC_2009_XAMS_SANTA_23]" , C_SYSTEM )

					SetSpeakDetail( OwnerID(), "[Sys420355_szquest_complete_detail]") --�Ӧn�F�A�o�N�O�ڭn��...�o�N�O�ڤѤѴ��߱o�쪺�F��...�ڦb�o�̪���l�`��S���նO...
					ScriptMessage( OwnerID() , TargetID() , 1 , "[Sys420355_szquest_complete_detail]" , C_SYSTEM )
					ScriptMessage( OwnerID() , TargetID() , 0 , "[Sys420355_szquest_complete_detail]" , C_SYSTEM )					
					DelBodyItem( OwnerID() , 206324 , 5 ) --�R���I�]�����ƶq
					SetFlag( OwnerID()  , 543290 , 1 ) --�����w�I�����y�X�СA�@�ѸѤ@��
				                --GiveBodyItem( OwnerID() , 203521  , 1) --�x�V�δο} * 1
					if CheckBuff(OwnerID(), 505325)  == false and CheckBuff(OwnerID(), 505326)  == false  and CheckBuff(OwnerID(), 505328)  == false then
					CastSpell( TargetID(), OwnerID(), 494688 ); --�x�V�Ѥ���������
					end
	        				GiveBodyItem( OwnerID() , 206437  , 1 ) --�ڬO���_�_�̵�
					AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "Lua_Dan_114076_Quest_2", 0)--�^��W�@��

				else
					
					 SetSpeakDetail( OwnerID(), "[K_08MID_DIALOG7]") --�z�ҫ������ƶq�����A�٤���I����C 
		     		                 AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "Lua_Dan_114076_Quest_2", 0)--�^��W�@��

				end

			else
	         		      	 SetSpeakDetail( OwnerID(), "[SC_DAN_111700_22]") --�A���I�]�Ŷ�����
	     		                 AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "Lua_Dan_114076_Quest_2", 0)--�^��W�@��
			end
		else

		SetSpeakDetail (OwnerID(), "[SC_112502_NOSTART]") --�A�w�g���W�L�F
	 	 AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "Lua_Dan_114076_Quest_2", 0)--�^��W�@��

		end
	else
		SetSpeakDetail (OwnerID(), "[SC_112312_TODAY]") --���ѯu�O���W�A�F�C�����쪺�ܡA���ѦA�~��ЧA������I 
	 	 AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "Lua_Dan_114076_Quest_2", 0)--�^��W�@��
	end
end
---------------------------------------------------------------------------------------------------------------
function LuaDan_New_Sledge_Reset() --��s�إX�Ӫ������屼
	Sleep(100)
	Delobj(OwnerID())
end
---------------------------------------------------------------------------------------------------------------
function LuaDan_114076_Newsledge()
	
	local New_Sledge = LuaFunc_CreateObjByObj( 114078 , OwnerID())
	Playmotion(New_Sledge, 119)
	BeginPlot( New_Sledge , "LuaDan_New_Sledge_Reset" , 10 ) --���m
end
---------------------------------------------------------------------------------------------------------------
function Lua_Dan_114076_Quest_3() --10���S���M�����

	SetSpeakDetail(OwnerID(), "[SC_2009_XAMS_SANTA_13]" )--[SC_110053_0]�A�ڨ��ǬöQ���٦�A���M�M�ڨ����F�A�бz�����ڴM�^ 3 ��[206441]�B3 ��[206442]�M 2 ��[206443]...�ЧA�e��[ZONE_HYBORA HIGHLANDS]��[ZONE_ASLAN]�A�ڷQ���ӷ|���L�̡C
	AddSpeakOption(OwnerID(), TargetID(), "[SC_2009_XAMS_SANTA_14]", "Lua_Dan_114076_Quest_3_SignUP", 0) --[SCRIPT_BORDER_ACCEPTQUEST] - �M��[206441]
	AddSpeakOption(OwnerID(), TargetID(), "[SC_2009_XAMS_SANTA_15]", "Lua_Dan_114076_Quest_3_Convertthereward", 0) --[SC_CLICKFUNGO24] - �ڤw�a�^[206441]�C
	AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "Lua_Dan_114076_Main", 0)         --�^��W�@��

end
---------------------------------------------------------------------------------------------------------------
function Lua_Dan_114076_Quest_3_SignUP() --���W�S������
--
	local Signed_Flag = CheckFlag(OwnerID()  , 543531) --�T�{���ѬO�_���W�S������
	if Signed_Flag == false then
			PlayMotion ( TargetID() , 112 );
			SetSpeakDetail (OwnerID(), "[SC_2009_XAMS_SANTA_12]") --�ӷP�§A�F�A���N�·ЧA�F�C
			ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_2009_XAMS_SANTA_12]" , C_SYSTEM )
			ScriptMessage( TargetID() , OwnerID() , 0 , "[SC_2009_XAMS_SANTA_12]" , C_SYSTEM )
			Sleep(10)
			PlayMotion ( TargetID() , 121 );
			PlayMotion ( TargetID() , 103 );
			GiveBodyItem( OwnerID() , 206435  , 8) --��8�ӻȹa
			GiveBodyItem( OwnerID() , 206485  , 1) --��m��T
			 SetFlag( OwnerID()  , 543531, 1 ) --�����w�I�����y�X�СA�@�ѸѤ@��
	else 
			SetSpeakDetail (OwnerID(), "[SC_MUSICFES_CODE16]") --�A�w�g���W�L�F
		 	AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "Lua_Dan_114076_Quest_3", 0)--�^��W�@��
	end
end
---------------------------------------------------------------------------------------------------------------
function Lua_Dan_114076_Quest_3_Convertthereward() --�S�������y 206443 * 2 ,206442 *3, 206441*3

	local Signed_Flag = CheckFlag(OwnerID()  ,    543531)    --�T�{���ѬO�_���W�S������
	local Finished_Flag = CheckFlag(OwnerID()  , 543291) --�T�{���ѬO�_�ѹL�S������

		if Finished_Flag == false then
		         if Signed_Flag == True then
		     	 if EmptyPacketCount( OwnerID() ) >= 1 and QueuePacketCount( OwnerID() ) == 0 then --���@�ӷx�V���ųn�}�M�̵�
				 if CountBodyItem( OwnerID() , 206441) >= 3 and CountBodyItem( OwnerID() , 206442) >= 3 and CountBodyItem( OwnerID() , 206443) >= 2 then  --�p�⨭�W���h�֭��S��(20�ӥH�W) 203523

					--�M���S���@���A�M�S���ʺA --�κX�l�ͥX��
					------------------------------------------------------------------------------------------------
						local Sledge = SearchRangeNPC ( TargetID() , 500 )
						--local PID
							for i=0 , table.getn(Sledge) do	
							local  ID = ReadRoleValue( Sledge[i], EM_RoleValue_OrgID)
								if  ID == 114089 then
										--�[�J�@�Ӳ��ʨ�Ӧa�誺�X�аʧ@
										--Playmotion( Sledge[i], ruFUSION_ACTORSTATE_ACTIVATE_END)        --�����^�_����										
										BeginPlot( Sledge[i] , "LuaDan_Reindeers_SqwanPoint" , 10 )
										--BeginPlot( Sledge[i] , "LuaDan_showingmotion" , 20 )
										CastSpell( Sledge[i], Sledge[i], 494660 ); --�I�񯻥�
										BeginPlot( Sledge[i] , "LuaI_114076_Reset_2" , 50)
								end
							end	
					------------------------------------------------------------------------------------------------
					--�t�ϦѤH��t�@��
					--�����}�G�M�̵�
					SetSpeakDetail( OwnerID(), "[SC_2009_XAMS_SANTA_16]") --[SC_422535_0]�A[SC_0908SEANSON_12]
					ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_2009_XAMS_SANTA_16]" , C_SYSTEM )
					ScriptMessage( TargetID() , OwnerID() , 0 , "[SC_2009_XAMS_SANTA_16]" , C_SYSTEM )					
					DelBodyItem( OwnerID() , 206441 , 3) --�R���I�]�����ƶq
					DelBodyItem( OwnerID() , 206442 , 3) --�R���I�]�����ƶq
					DelBodyItem( OwnerID() , 206443 , 2) --�R���I�]�����ƶq
					DelBodyItem( OwnerID() , 206485 , 1) --�R����m��T
					SetFlag( OwnerID()  , 543291 , 1 ) --�����w�I�����y�X�СA�@�ѸѤ@��
				               -- GiveBodyItem( OwnerID() , 203523  , 1) --�x�V�δο} * 1
					if CheckBuff(OwnerID(), 505325)  == false and CheckBuff(OwnerID(), 505326)  == false  and CheckBuff(OwnerID(), 505328)  == false then
					CastSpell( TargetID(), OwnerID(), 494689 ); --�x�V�Ѥ���������
					end
	        				GiveBodyItem( OwnerID() , 206437  , 1 ) --�ڬO���_�_�̵�
					AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "Lua_Dan_114076_Quest_3", 0)--�^��W�@��

				else
					
					 SetSpeakDetail( OwnerID(), "[K_08MID_DIALOG7]") --�z�ҫ������ƶq�����A�٤���I����C 
		     		                 AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "Lua_Dan_114076_Quest_3", 0)--�^��W�@��

				end

			else
	         		      	 SetSpeakDetail( OwnerID(), "[SC_DAN_111700_22]") --�A���I�]�Ŷ�����
	     		                 AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "Lua_Dan_114076_Quest_3", 0)--�^��W�@��
			end
		else

		SetSpeakDetail (OwnerID(), "[SC_112502_NOSTART]") --�A�٨S���W
	 	 AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "Lua_Dan_114076_Quest_3", 0)--�^��W�@��

		end
	else
		SetSpeakDetail (OwnerID(), "[SC_112312_TODAY]") --���ѯu�O���W�A�F�C�����쪺�ܡA���ѦA�~��ЧA������I 
	 	 AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "Lua_Dan_114076_Quest_3", 0)--�^��W�@��
	end
end
---------------------------------------------------------------------------------------------------------------
function LuaI_114076_Reset_2()
	Hide(OwnerID() )
	local New_Sledge = CreateObjByFlag( 114078, 780324, 17 , 1)
	AddToPartition( New_Sledge , 0 )
--	Playmotion(New_Sledge, 119)
	BeginPlot( New_Sledge , "LuaDan_New_Sledge_Reset" , 60 ) --���m
	--SetModeEx( OwnerID()   , EM_SetModeType_Show , false ) --�����
	sleep(150)
	LuaFunc_ResetObj( OwnerID() )	

										
end
---------------------------------------------------------------------------------------------------------------
function LuaDan_Reindeers_SqwanPoint() --���S���@�� + ��������
	
	local flag = 780324
	local Reindeer = {}

			for i = 0, 1 do 

				Reindeer[i] = CreateObjByFlag( 102933 , flag, i  , 1)		-- �Ӯa�S��
				Sleep(10)
				AddToPartition( Reindeer[i] , 0 ) --149
				PlayMotion ( Reindeer[i] , 149 );				
				BeginPlot( Reindeer[i] , "LuaDan_Reindeer_Del" , 50) --���m���� --�R�������A��17��ͥX�@�ӷs��
			end

			for j = 2, 5 do 

				Reindeer[j] = CreateObjByFlag( 102931 , flag , j  , 1)		--�x�V�S��
					Sleep(10)
				AddToPartition( Reindeer[j] , 0 )
				PlayMotion ( Reindeer[j] , 149 );	
				BeginPlot( Reindeer[j] , "LuaDan_Reindeer_Del" ,50) --���m���� --�R�������A��17��ͥX�@�ӷs��			
			end

			for k = 6, 7 do 

				Reindeer[k] = CreateObjByFlag( 102932 , flag , k , 1)		--�S��
					Sleep(10)
				AddToPartition( Reindeer[k] , 0 )
				PlayMotion ( Reindeer[k] , 149 );
				BeginPlot( Reindeer[k] , "LuaDan_Reindeer_Del" , 50) --���m���� --�R�������A��17��ͥX�@�ӷs��
			end

			--for n = 0, 7 do 
			--	for l = 8, 15 do 
			--	WriteRoleValue( Reindeer[n] , EM_RoleValue_IsWalk, 0 ) 			--�]�a�I�S���C
	                --		LuaFunc_MoveToFlag( Reindeer[n], flag, l, 0)        			--���ʨ�U�@��X�l��m
			--	Sleep(40)
			--	BeginPlot( Reindeer[n] , "LuaDan_Reindeer_Del" , 30) --�R��
			--	end
			--end

	--WriteRoleValue( OwnerID() , EM_RoleValue_IsWalk, 0 ) 			--�]�a�I�����C
	--LuaFunc_MoveToFlag( OwnerID(), flag, 16, 0)        			--���ʨ�U�@��X�l��m
	ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_2009_XAMS_SANTA_17]" , C_SYSTEM ) --[SC_422488_0]!
	ScriptMessage( TargetID() , OwnerID() , 0 , "[SC_2009_XAMS_SANTA_17]" , C_SYSTEM )
	--BeginPlot( OwnerID() , "LuaI_114076_Reset" , 10) --���m���� --�R�������A��17��ͥX�@�ӷs��

end
---------------------------------------------------------------------------------------------------------------
function LuaDan_Reindeer_Del()
	Sleep(50)
	DelObj(OwnerID())
end
---------------------------------------------------------------------------------------------------------------
function LuaDan_Sledge_Reset() --�B�ۥ�
	CastSpell( OwnerID(), OwnerID(), 494660 );
	sleep(10)
	Playmotion( OwnerID(), ruFUSION_ACTORSTATE_ACTIVATE_BEGIN)	
	sleep(20)							
	Playmotion( OwnerID(), ruFUSION_ACTORSTATE_ACTIVATE_END)        --�����^�_����
	sleep(10)
	Playmotion( OwnerID(), ruFUSION_ACTORSTATE_ACTIVATE_BEGIN)
	BeginPlot( OwnerID() , "LuaI_114076_Reset" , 10)
	--Playmotion(OwnerID(), 119)	--������_�쪬	
end
 -- �D��t�ϦѤ������a�L           
------------------------------------------------------------------------------
--�ϥιD�� ���\�ṥ���|�ܦ��D��"����"  �k�N�A�M�ܪ��ȹa�n
------------------------------------------------------------------------------
function LuaI_114076_Check()  --�ˬd�����~�O�_�b�S�wNPC���W
	local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	local x = CountBodyItem( OwnerID(), 206441) -- * 3 ����
	local y = CountBodyItem( OwnerID(), 206442) -- * 3 �x�V����
	local z = CountBodyItem( OwnerID(), 206443) -- * 2 �Ӯa����
	local MonsterID = { 114095,  114096, 114094 }  --�����B�x�V�����B�Ӯa����

	if ( CheckID( TargetID() ) == false ) or ( TargetID() == OwnerID() ) or (( OrgID ~= MonsterID[1] ) and  ( OrgID ~= MonsterID[2] ) and  ( OrgID ~= MonsterID[3] )) then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422507_1]" , C_SYSTEM )	--�o���O�A�n�a�^�h����H 
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422507_1]" , C_SYSTEM )	--�o���O�A�n�a�^�h����H 
		return false	
	elseif OrgID == MonsterID[1] and x >=3 then	--����
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422507_EXTRA][$SETVAR1=[206441]]" , C_SYSTEM )	--�A�w�g�a�^�������Ӯa�����F
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422507_EXTRA][$SETVAR1=[206441]]" , C_SYSTEM )	--�A�w�g�a�^�������Ӯa�����F
		return false
	elseif OrgID == MonsterID[2] and y >=3 then	--�x�V����
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422507_EXTRA][$SETVAR1=[206442]]" , C_SYSTEM )	--�A�w�g�a�^�����������F
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422507_EXTRA][$SETVAR1=[206442]]" , C_SYSTEM )	--�A�w�g�a�^�����������F
		return false
	elseif OrgID == MonsterID[3] and z >=2 then	--�Ӯa����
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422507_EXTRA][$SETVAR1=[206443]]" , C_SYSTEM )	--�A�w�g�a�^�������x�V�����F
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422507_EXTRA][$SETVAR1=[206443]]" , C_SYSTEM )	--�A�w�g�a�^�������x�V�����F	
		return false	
	end
end
------------------------------------------------------------------------------
function LuaI_114076_Effect()   --���v�P�w 
--TargetID ��
--OwnerID players
	local Player = OwnerID()
	local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	local RANDOWN = rand(100)
	local Reindeer = TargetID()
	local MonsterID = { 114094,  --����
			      114095,
                                                      114096}      
	PlaySoundToPlayer( Player , "sound\\event\\BELL3.mp3", false )	-- false = ������
	if RANDOWN >65 then  -- ���ߤl ���v��65%
		for i = 1, 3 do  --20������
			if OrgID == MonsterID[i] then  				
				return true				
			end
		end
	else --�ߤl�{��  35%
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_2009_XAMS_SANTA_18]" , C_SYSTEM )	--�u�r�A�������G�S��ť���a�L�n�A�n�۫H�x�V�`���_�ݡA�~��ϥθt�ϦѤH���ȹa�@�C
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_2009_XAMS_SANTA_18]" , C_SYSTEM )	--�u�r�A�������G�S��ť���a�L�n�A�n�۫H�x�V�`���_�ݡA�~��ϥθt�ϦѤH���ȹa�@�C
		return false
	end

end
------------------------------------------------------------------------------
function LuaI_114076_Reset()
	Hide(OwnerID() )
	--SetModeEx( OwnerID()   , EM_SetModeType_Show , false ) --�����
	sleep(300)
	LuaFunc_ResetObj( OwnerID() )	
end
------------------------------------------------------------------------------
function LuaI_114076_Delgoods()   --���\��^ --�P�_��쪺�O���@�� 

	local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	local Target = {         114094,  --�Ӯa����
			      114095,   --����	
                                                      114096}   --�x�V����

	local Item = {206443, --�Ӯa����
		         206441, --����
		          206442} --�x�V����

	ScriptMessage( OwnerID() , OwnerID() , 1 ,"[SC_2009_XAMS_SANTA_19]" , C_SYSTEM )	--[114095]���Gť��[206435]���n���A�}�l���H�A�A�A���\�a�^�@��[114095]�I
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_2009_XAMS_SANTA_19]" , C_SYSTEM )	--[114095]���Gť��[206435]���n���A�}�l���H�A�A�A���\�a�^�@��[114095]�I
	for i = 1, 3 do  --20������
		if Target[i] == OrgID then
		GiveBodyItem(OwnerID() , Item[i], 1 )
		UseItemDestroy() 		--�R���ϥΤ������~
		end
	end
	BeginPlot( TargetID() , "LuaI_114076_Reset" , 0 )
end
--���Υ���NPC ��������HNPC�����߲��X  
-----------------------------------------------------------------------------------------------------
function LuaDan_114076_Parade() --����
	local Reindeers={}
	local MonsterID = { 114094,  --����
			      114095,
                                                      114096}      
	local Rand_time = rand(300)
	for i = 0,19 do  --20������
		local move_type = { 0, 1} --0�] 1 ��
		local move_typeRand = rand(1)
		local  Rand_Range =  rand( 3 )
		Reindeers[i] = CreateObjByFlag( MonsterID[Rand_Range+1], 780326, i , 1) --�ϥκX�l���ͤT�ع��� npc �X�l�s�� �ƶq
		SetModeEx( Reindeers[i]   , EM_SetModeType_Strikback, false )--����
		SetModeEx( Reindeers[i]   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
		SetModeEx( Reindeers[i]   , EM_SetModeType_Obstruct, false )--����
		SetModeEx( Reindeers[i]   , EM_SetModeType_Mark, true )--�аO
		SetModeEx( Reindeers[i]   , EM_SetModeType_Move, true )--����
		SetModeEx( Reindeers[i]   , EM_SetModeType_Searchenemy, false )--����
		SetModeEx( Reindeers[i]   , EM_SetModeType_HideName, false )--�W��
		SetModeEx( Reindeers[i]   , EM_SetModeType_ShowRoleHead, true )--�Y����
		SetModeEx( Reindeers[i]   , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( Reindeers[i]   , EM_SetModeType_Show , true ) --�����
 
		AddToPartition( Reindeers[i],0 )	--���ߤl����
		SetRandMove(Reindeers[i], 300, 100, 50 )	--�ߤl�üƽd�򤺲���  (150=�d��, 100=10�� , 20=�C�����ʶZ��)
		--SetFightMode( Reindeers[i] , 0, 1, 0, 0 )               --���ġB���ʡB�k�]�B�Q���� 1 true.
		--WriteRoleValue( Reindeers[i], EM_RoleValue_IsWalk, move_type[move_typeRand]) 
	end

end
-----------------------------------------------------------------------------------------------------
function LuaDan_114076_ReindeerSay() --���bNPC ���ͼ@��

	While true do 
		local Rand_time = rand(300)
		Sleep(Rand_time)
		PlayMotion( OwnerID(), 1)
		NPCSay(  OwnerID() , "[SC_2009_XAMS_SANTA_20]" )--[114076][Sys110064_szquestnpctext]	
	end	
end
-----------------------------------------------------------------------------------------------------
--�B��Ĳ�I�@���A�I����A�����v�X�{��H�������a--���b���~���W
------------------------------------------------------------------------------------------------------
function LuaDan_114091_TouchScript()

	local Finished_Flag = CheckFlag(TargetID()  , 543290) --�T�{���ѬO�_�ѹL�B�ۥ���

	if Finished_Flag == false then

		setplot( OwnerID()  , "touch" , "LuaDan_114091_TouchScript_1", 50 )
	end
end
-----------------------------------------------------------------------------------------------------
function LuaDan_114091_TouchScript_1()

	BeginPlot( TargetID() , "LuaDan_114091_TouchScript_2" , 0 )

end
-----------------------------------------------------------------------------------------------------
function LuaDan_114091_TouchScript_2()
--Say(OwnerID(),"1")
--Say(OwnerID(),"2")
	local result
	local Signed_Flag = CheckFlag(TargetID()  , 543532) --�T�{���ѬO�_���W�B�ۥ���
	if Signed_Flag == true then 
		--local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
--			if  ( CheckID( TargetID() ) == true ) or ( TargetID() ~= OwnerID() ) or (OrgID == 114091) then --
	if ReadRoleValue( OwnerID() , EM_RoleValue_PID) == 1 then

		ScriptMessage( TargetID(),TargetID(),1,"[SYS_AUCTION_WAIT_NEXT]",0)	--���L���A�еy�ԦA�աC
		return
	end
				if EmptyPacketCount( TargetID() ) >= 1 and QueuePacketCount( TargetID() ) == 0 then
					if BeginCastBar( TargetID(), "[SC_2009_XAMS_SANTA_21]", 50 , ruFUSION_ACTORSTATE_MINING_BEGIN , ruFUSION_ACTORSTATE_MINING_END, 0 ) == 1 then
						AttachCastMotionTool( TargetID(), 210508)
							WriteRoleValue( OwnerID() , EM_RoleValue_PID, 1 )	

							while true do
								sleep( 2 )
							
								if CheckID(TargetID() ) == false or ReadRoleValue(TargetID(), EM_RoleValue_IsDead) == 1 then
									WriteRoleValue( OwnerID() , EM_RoleValue_PID, 0 )
--Say(OwnerID(),result)
--Say(OwnerID(),result)
									result = "DAME"
									EndCastBar( TargetID() , CastBarStatus )
--Say(OwnerID(),result)
--Say(OwnerID(),result)
									break
								else

									local CastBarStatus = CheckCastBar( TargetID() )
										if ( CastBarStatus ~= 0 ) then 
											if ( CastBarStatus > 0) then
--Say(OwnerID(),"result is OKOK")

												result = "OKOK"

												EndCastBar( TargetID() , CastBarStatus )
												break
											elseif ( CastBarStatus < 0 ) then 
--Say(OwnerID(),"result is DAME")
												result = "DAME"
												EndCastBar( TargetID() , CastBarStatus )
												break
											end
										end
								end
	 						end
			  		  end
				end

				if ( result == "OKOK" ) then
					SetPlot( OwnerID(),"touch","",0 )
					local Random = Rand(100)  
			--		local probability = { 15, 15, 20, 25, 25}
			--		if Random > (100 - probability[1] )  then  -- > 85
					if Random >= 85  then  -- > 85
						ScriptMessage( OwnerID() , TargetID() , 1 , "[SC_2009_XAMS_SANTA_22]" , C_SYSTEM ) --�A�o��F[206324]�C
						GiveBodyItem( TargetID() , 206324, 1 )
						BeginPlot( OwnerID() , "LuaDan_114091_TouchScript_reset" , 0 )
			--		elseif Random > (100 - probability[1] - probability[2])  then  -- >70								
					elseif Random <85 and Random >= 70  then  -- > 70
						ScriptMessage( OwnerID() , TargetID() , 1 , "[Sys112465_szquestnpctext]" , C_SYSTEM )	--�O�H���ڷ|���A�n�L����A�n���e�����H�L�ӡA��M�n�A���ڦh���@�U�A���o�I						
						local Monster1 = LuaFunc_CreateObjByObj( 102956 , OwnerID())
						FaceObj( Monster1 , TargetID() );
						SetModeEx( Monster1   , EM_SetModeType_Searchenemy, false )--����
						--BeginPlot (Monster1 , "Lua_Dan_112563_Monster_Delete", 10)  						
						BeginPlot( OwnerID() , "LuaDan_114091_TouchScript_reset" , 0 ) 
						Castspell( Monster1, TargetID() , 494692 ) --����
						Sleep(40)
						DelObj(Monster1)
			--		elseif Random > (100 - probability[1] - probability[2]- probability[3])  then  -->50
					elseif Random <70 and Random >= 50  then  -- > 50
						ScriptMessage( OwnerID() , TargetID() , 1 , "[Sys112465_szquestnpctext]" , C_SYSTEM )	--�O�H���ڷ|���A�n�L����A�n���e�����H�L�ӡA��M�n�A���ڦh���@�U�A���o�I						
						local Monster2 = LuaFunc_CreateObjByObj( 102957 , OwnerID())
						FaceObj( Monster2 , TargetID() );
						SetModeEx( Monster2   , EM_SetModeType_Searchenemy, false )--����
						--BeginPlot (Monster2 , "Lua_Dan_112563_Monster_Delete", 10)   
						BeginPlot( OwnerID() , "LuaDan_114091_TouchScript_reset" , 0 ) 
						Castspell(Monster2 , TargetID() , 494693 ) --�z��
						Sleep(40)
						DelObj(Monster2)
			--		elseif Random > (100 - probability[1] - probability[2]- probability[3]- probability[4])  then  -->25
					elseif Random <50 and Random >= 25  then  -- > 85
						ScriptMessage( OwnerID() , TargetID() , 1 , "[Sys112465_szquestnpctext]" , C_SYSTEM )	--�O�H���ڷ|���A�n�L����A�n���e�����H�L�ӡA��M�n�A���ڦh���@�U�A���o�I							
						local Monster3 = LuaFunc_CreateObjByObj( 102958 , OwnerID())
						FaceObj( Monster3 , TargetID() );
						SetModeEx( Monster3   , EM_SetModeType_Searchenemy, false )--����
						--BeginPlot (Monster3 , "Lua_Dan_112563_Monster_Delete", 10)   
						BeginPlot( OwnerID() , "LuaDan_114091_TouchScript_reset" , 0 ) 
						Castspell( Monster3, TargetID() , 494694 ) --����	
						Sleep(40)
						DelObj(Monster3)				
			--		elseif Random > (100 - probability[1] - probability[2]- probability[3]- probability[4]- probability[5])  then  --80%
					elseif Random <25  then  -- < 25
						ScriptMessage( OwnerID() , TargetID() , 1 , "[SC_421343_0]" , C_SYSTEM )	--�ש�X�{�F�O�q���H���ѧڪ��H�A�ڵ��o�@�ѵ��F�n�[ �I							
						local Monster = LuaFunc_CreateObjByObj( 102937 , OwnerID())
						SetAttack( Monster , TargetID()  )
						BeginPlot (Monster , "Lua_Dan_112563_Monster_Delete", 10)   
						BeginPlot( OwnerID() , "LuaDan_114091_TouchScript_reset" , 0 )  	 
					end
				elseif ( result == "DAME" ) then
						WriteRoleValue( OwnerID() , EM_RoleValue_PID, 0 )
				end
				
		--	else
				
		--		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204119_01]" , C_SYSTEM )	--�ݧ��r��C
		--		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204119_01]" , C_SYSTEM )	--�u��ϥΩ�t�ϦѤ����������C
		--	end
	else
		ScriptMessage( OwnerID() , TargetID() , 1 , "[SC_112502_NOSTART]" , C_SYSTEM )
		ScriptMessage( OwnerID() , TargetID() , 0 , "[SC_112502_NOSTART]" , C_SYSTEM )	
	end
end
-----------------------------------------------------------------------------------------------------
function LuaDan_114091_TouchScript_reset()
--Say(OwnerID(),"3")
--Say(OwnerID(),"4")
	Hide(TargetID() )
	--SetModeEx( OwnerID()   , EM_SetModeType_Show , false ) --�����
	sleep(1200)
	WriteRoleValue( TargetID() , EM_RoleValue_PID, 0 )
	LuaFunc_ResetObj( TargetID() )	
end
--���Υ���NPC �B�۪���HNPC�����߲��X  
-----------------------------------------------------------------------------------------------------
function LuaDan_114091_Sqwan() --�B��
	local Stones={}
	local MonsterID = 114091
	--local Rand_time = rand(300)
	for i = 0, 14 do  --15���B��
		--local move_type = { 0, 1} --0�] 1 ��
		--local move_typeRand = rand(1)
		--local  Rand_Range =  rand( 3 )
		Stones[i] = CreateObjByFlag( MonsterID, 780325, i , 1) --�ϥκX�l���ͤT�ع��� npc �X�l�s�� �ƶq
		SetModeEx( Stones[i]   , EM_SetModeType_Strikback, false )--����
		SetModeEx( Stones[i]   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
		SetModeEx( Stones[i]   , EM_SetModeType_Obstruct, true )--����
		SetModeEx( Stones[i]   , EM_SetModeType_Mark, true )--�аO
		SetModeEx( Stones[i]   , EM_SetModeType_Move, false )--����
		SetModeEx( Stones[i]   , EM_SetModeType_Searchenemy, false )--����
		SetModeEx( Stones[i]   , EM_SetModeType_HideName, true )--�W��
		SetModeEx( Stones[i]   , EM_SetModeType_ShowRoleHead, false )--�Y����
		SetModeEx( Stones[i]   , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( Stones[i]   , EM_SetModeType_Show , true ) --�����
 
		AddToPartition( Stones[i],0 )	--���ߤl����
		--SetRandMove(Stones[i], 1000, 100, 20 )	--�ߤl�üƽd�򤺲���  (150=�d��, 100=10�� , 20=�C�����ʶZ��)
		--SetFightMode( Reindeers[i] , 0, 1, 0, 0 )               --���ġB���ʡB�k�]�B�Q���� 1 true.
		--WriteRoleValue( Reindeers[i], EM_RoleValue_IsWalk, move_type[move_typeRand]) 
	end

end
-----------------------------------------------------------------------------------------------------
function Lua_Dan_Instance_Cantuseitem()
	local Obj = Role:new(OwnerID())
	local ZoneID = Obj:ZoneID() - 1000*math.floor(Obj:ZoneID() / 1000 )
	local attack     = ReadRoleValue( TargetID(),  EM_RoleValue_IsAttackMode )  
	
	if attack ~= 1 then     --�S���԰���
		local BuffType = 0
		local Count = BuffCount ( TargetID())
		for i = 0 , Count do
			local BuffID = BuffInfo ( TargetID() , i , EM_BuffInfoType_BuffID )
			if GameObjInfo_int ( BuffID , "AssistType" ) == 68 then
				BuffType = GameObjInfo_int ( BuffID , "AssistType" )
				break
			end
		end
		if BuffType == 68 then				       	    --/*���M�����A
			ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_0908SEANSON_MAG15]" , 0 )  --�ϥι�H���M���ĪG�A�L�k�ϥΡC
			return false
		elseif Checkbuff( TargetID() , 502398 ) == false and Checkbuff( TargetID() , 502401 ) == false then
			if OwnerID() ~= TargetID() then
				 		
						if ZoneID > 0 and  ZoneID < 100 and Obj:RoomID() == 0 then  
							return true
				
						elseif ZoneID > 100 or Obj:RoomID() ~= 0 then
							ScriptMessage( OwnerID(), OwnerID() ,  1 , "[SC_DAN_111700_37]" , C_SYSTEM )
							ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_DAN_111700_37]" , 0 )	
							return false		
						else
							ScriptMessage( OwnerID(), OwnerID() ,  1 , "System Error" , C_SYSTEM )
							ScriptMessage( OwnerID(), OwnerID(), 0, "System Error" , 0 )	
							return false
						end
			else
				ScriptMessage( OwnerID(), OwnerID() ,  1 , "[SC_0908SEANSON_MAG01]" , C_SYSTEM )
				ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_0908SEANSON_MAG01]" , 0 )	
				return false     
			end
		else
				ScriptMessage( OwnerID(), OwnerID() ,  1 , "[SC_BEERDAY_MAGIC05]" , C_SYSTEM )
				ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_BEERDAY_MAGIC05]" , 0 )	
				return false     
		end
	else
		ScriptMessage( OwnerID(), OwnerID() ,  1 , "[SC_USECHECK_BATTLE_0]" , C_SYSTEM )
		return false --�԰����L�k�ϥ�
	end
end
-----------------------------------------------------------------------------------------------------
function Lua_Dan_Instance_Cantuseitem_1()
	local Obj = Role:new(OwnerID())
	local ZoneID = Obj:ZoneID() - 1000*math.floor(Obj:ZoneID() / 1000 )
--	if OwnerID() ~= TargetID() then
		 		
				if ZoneID > 0 and  ZoneID < 100 and Obj:RoomID() == 0 then  
					return true
		
				elseif ZoneID > 100 or Obj:RoomID() ~= 0 then
					ScriptMessage( OwnerID(), OwnerID() ,  1 , "[SC_DAN_111700_37]" , C_SYSTEM )
					ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_DAN_111700_37]" , 0 )	
					return false		
				else
					ScriptMessage( OwnerID(), OwnerID() ,  1 , "System Error" , C_SYSTEM )
					ScriptMessage( OwnerID(), OwnerID(), 0, "System Error" , 0 )	
					return false
				end
--	else
--		ScriptMessage( OwnerID(), OwnerID() ,  1 , "[SC_0908SEANSON_MAG01]" , C_SYSTEM )
--		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_0908SEANSON_MAG01]" , 0 )	
--		return false     
--	end
end

-----------------------------------------------------------------------------------------------------
function LuaDan_Xams2009_List()
	ClearBorder( OwnerID() );
	AddBorderPage( OwnerID(), "[SC_2009_XAMS_SANTA_13]" );
	ShowBorder( OwnerID(), 0, "[SC_2009_XAMS_ANDREAS_5]" , "ScriptBorder_Texture_Paper" )
end