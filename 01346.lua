function LuaDan_112757_0()
	local captialflag = CheckFlag(OwnerID(), 542520)
	local guardflag = CheckFlag(OwnerID(), 542551)
	local Musicbox  = CountBodyItem( OwnerID() , 204426)		 --���ֲ�
	local Passticket = CountBodyItem( OwnerID() , 204526)                       --ñ���
	local Signflag1 = CheckFlag(OwnerID(), 542529)

	if captialflag == true or guardflag == true then
			if  Signflag1 == false then
				if Passticket  >0 then
					if guardflag == true then 
						SetSpeakDetail(OwnerID(), "[SC_DAN_112757_1]" )                                   --ñ�����ܡG�u�r�r��o�̬O�Ĥ@��ñ���I�I���֨�ñ��a�I�Х��T�{���W���S��ñ����άO���ֲ���I
						AddSpeakOption(OwnerID(), TargetID(), "[SC_DAN_112757_3]", "Lua_Dan_112757_2", 0) --�ڬO�����A�ڭnñ��I
					elseif captialflag == true then
						if Musicbox >0  then
							SetSpeakDetail(OwnerID(), "[SC_DAN_112757_1]" )                                   --ñ�����ܡG�u�r�r��o�̬O�Ĥ@��ñ���I�I���֨�ñ��a�I�Х��T�{���W���S��ñ����άO���ֲ���I
							AddSpeakOption(OwnerID(), TargetID(), "[SC_DAN_112757_2]", "Lua_Dan_112757_1", 0) --�ڬO�����A�ڭnñ��I
						else
							SetSpeakDetail(OwnerID(), "[SC_MUSICFES_RICING_03]")      --�нT�{�A���W�O�_��[204426]�Cmusicbox
						end
					end
				else
					SetSpeakDetail(OwnerID(), "[SC_MUSICFES_RICING_01]")      --�нT�{�A���W�O�_��[204526]�Cñ���
				end
			else
				SetSpeakDetail(OwnerID(), "[SC_DAN_112757_8]" )        		--�A�w�gñ��L�F��!  
			end 
	else
		SetSpeakDetail(OwnerID(), "[SC_DAN_112757_7]")        		--�A�����W���ְ��N���ɶܡH�нT�{�A�O�_����ñ�����I    
	end
end
---------------------------------------------------------------------------------------------------
function Lua_Dan_112757_1() --����ñ�� ñ���I1
	local captialflag = CheckFlag(OwnerID(), 542520)
	local guardflag = CheckFlag(OwnerID(), 542551)
	local Musicbox  = CountBodyItem( OwnerID() , 204426)				  --���ֲ�
	local Passticket = CountBodyItem( OwnerID() , 204526)                             --ñ���
	local Signflag1 = CheckFlag(OwnerID()  , 542529)
	local Signflag2 = CheckFlag(OwnerID()  , 542548)
	local Signflag3 = CheckFlag(OwnerID()  , 542549)

	CloseSpeak(OwnerID())
	SetFlag( OwnerID()  , 542529 , 1 )  
	SetFlag( OwnerID()  , 542448 , 0 )
	SetFlag( OwnerID()  , 542630 , 0 )
	DelBodyItem( OwnerID() , 204526 , Passticket)		
	ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_DAN_112757_4]" , C_SYSTEM ) --�o�O�Ĥ@��ñ���I�A�A�w�gñ��F�I
	ScriptMessage( TargetID() , OwnerID() , 0 , "[SC_DAN_112757_4]" , C_SYSTEM ) --�o�O�Ĥ@��ñ���I�A�A�w�gñ��F�I
	sleep(50)
	ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_CHECKPOINT02]" , C_SYSTEM ) --�ĤG��ñ���I����m��[ZONE_MAC DOUGAL FARMSTEAD]��������A�Чⴤ�ɶ��ֳt��F�C
	ScriptMessage( TargetID() , OwnerID() , 0 , "[SC_MUSICFES_CHECKPOINT02]" , C_SYSTEM ) --�ĤG��ñ���I����m��[ZONE_MAC DOUGAL FARMSTEAD]��������A�Чⴤ�ɶ��ֳt��F�C

end
---------------------------------------------------------------------------------------------------
function Lua_Dan_112757_2() --����ñ�� ñ���I1
	local Protect  = CheckFlag(OwnerID()  , 542551)                                   --�@�úX��
	local Passticket = CountBodyItem( OwnerID() , 204526)                             --ñ���
	local Signflag1 = CheckFlag(OwnerID()  , 542529)
	local Signflag2 = CheckFlag(OwnerID()  , 542548)
	local Signflag3 = CheckFlag(OwnerID()  , 542549)

	CloseSpeak(OwnerID())   --������ܵ��� 
	SetFlag( OwnerID()  , 542529 , 1 )  
	DelBodyItem( OwnerID() , 204526 , Passticket)
	ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_DAN_112757_4]" , C_SYSTEM ) --�o�O�Ĥ@��ñ���I�A�A�w�gñ��F�I
	ScriptMessage( TargetID() , OwnerID() , 0 , "[SC_DAN_112757_4]" , C_SYSTEM ) --�o�O�Ĥ@��ñ���I�A�A�w�gñ��F�I
	sleep(50)
	ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_CHECKPOINT02]" , C_SYSTEM ) --�ĤG��ñ���I����m��[ZONE_MAC DOUGAL FARMSTEAD]��������A�Чⴤ�ɶ��ֳt��F�C
	ScriptMessage( TargetID() , OwnerID() , 0 , "[SC_MUSICFES_CHECKPOINT02]" , C_SYSTEM ) --�ĤG��ñ���I����m��[ZONE_MAC DOUGAL FARMSTEAD]��������A�Чⴤ�ɶ��ֳt��F�C
end
---------------------------------------------------------------------------------------------------
function LuaDan_112881_0()

	local captialflag = CheckFlag(OwnerID(), 542520)
	local guardflag = CheckFlag(OwnerID(), 542551)
	local Musicbox  = CountBodyItem( OwnerID() , 204426)		 --���ֲ�
	local Passticket = CountBodyItem( OwnerID() , 204526)                       --ñ���
	local Signflag1 = CheckFlag(OwnerID()  , 542529)
	local Signflag2 = CheckFlag(OwnerID()  , 542548)

	if captialflag == true or guardflag == true then
			if Signflag1 == true then
				if  Signflag2 == false then
					if Passticket  >0 then
						if guardflag == true then 
							SetSpeakDetail(OwnerID(), "[SC_DAN_112757_1]" )                                   --ñ�����ܡG�u�r�r��o�̬O�Ĥ@��ñ���I�I���֨�ñ��a�I�Х��T�{���W���S��ñ����άO���ֲ���I
							AddSpeakOption(OwnerID(), TargetID(), "[SC_DAN_112757_3]", "LuaDan_112881_2", 0) --�ڬO�����A�ڭnñ��I
						elseif captialflag == true then
							if Musicbox >0  then
								SetSpeakDetail(OwnerID(), "[SC_DAN_112757_1]" )                                   --ñ�����ܡG�u�r�r��o�̬O�Ĥ@��ñ���I�I���֨�ñ��a�I�Х��T�{���W���S��ñ����άO���ֲ���I
								AddSpeakOption(OwnerID(), TargetID(), "[SC_DAN_112757_2]", "LuaDan_112881_1", 0) --�ڬO�����A�ڭnñ��I
							else
								SetSpeakDetail(OwnerID(), "[SC_MUSICFES_RICING_03]")      --�нT�{�A���W�O�_��[204426]�Cmusicbox
							end
						end
					else
						SetSpeakDetail(OwnerID(), "[SC_MUSICFES_RICING_01]")      --�нT�{�A���W�O�_��[204526]�Cñ���
					end
				else
					SetSpeakDetail(OwnerID(), "[SC_DAN_112757_8]" )        		--�A�w�gñ��L�F��!  
				end 
			else
				SetSpeakDetail(OwnerID(), "[SC_MUSICFES_RICING_02]")      --�A�W�@��ñ���I�|��ñ���I
			end
	else
		SetSpeakDetail(OwnerID(), "[SC_DAN_112757_7]")        		--�A�����W���ְ��N���ɶܡH�нT�{�A�O�_����ñ�����I    
	end
end
---------------------------------------------------------------------------------------------------
function LuaDan_112881_1() --����ñ�� ñ���I2

	local Musicbox  = CountBodyItem( OwnerID() , 204426)				  --���ֲ�
	local Passticket = CountBodyItem( OwnerID() , 204526)                             --ñ���
	local Signflag1 = CheckFlag(OwnerID()  , 542529)
	local Signflag2 = CheckFlag(OwnerID()  , 542548)
	local Signflag3 = CheckFlag(OwnerID()  , 542549)

	CloseSpeak(OwnerID())
	SetFlag( OwnerID()  , 542548 , 1 ) 
	SetFlag( OwnerID()  , 542448 , 0 )
	SetFlag( OwnerID()  , 542630 , 0 )
	DelBodyItem( OwnerID() , 204526 , Passticket)     	
	ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_DAN_112757_5]" , C_SYSTEM ) --�o�O�ĤG��ñ���I�A�A�w�gñ��F�I
	ScriptMessage( TargetID() , OwnerID() , 0 , "[SC_DAN_112757_5]" , C_SYSTEM ) --�o�O�ĤG��ñ���I�A�A�w�gñ��F�I
	sleep(50)
	ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_CHECKPOINT03]" , C_SYSTEM ) --�ĤT��ñ���I����m��[ZONE_DORIANS FARM]�������A���I�N�b���e�F�C
	ScriptMessage( TargetID() , OwnerID() , 0 , "[SC_MUSICFES_CHECKPOINT03]" , C_SYSTEM ) --�ĤT��ñ���I����m��[ZONE_DORIANS FARM]�������A���I�N�b���e�F�C

end

---------------------------------------------------------------------------------------------------
function LuaDan_112881_2()  --����ñ�� ñ���I2

	local Protect  = CheckFlag(OwnerID()  , 542551)                                   --�@�úX��
	local Passticket = CountBodyItem( OwnerID() , 204526)                             --ñ���
	local Signflag1 = CheckFlag(OwnerID()  , 542529)
	local Signflag2 = CheckFlag(OwnerID()  , 542548)
	local Signflag3 = CheckFlag(OwnerID()  , 542549)

	CloseSpeak(OwnerID())   --������ܵ��� 
	SetFlag( OwnerID()  , 542548 , 1 ) 
	DelBodyItem( OwnerID() , 204526 , Passticket)        	
	ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_DAN_112757_5]" , C_SYSTEM ) --�o�O�ĤG��ñ���I�A�A�w�gñ��F�I
	ScriptMessage( TargetID() , OwnerID() , 0 , "[SC_DAN_112757_5]" , C_SYSTEM ) --�o�O�ĤG��ñ���I�A�A�w�gñ��F�I
	sleep(50)
	ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_CHECKPOINT03]" , C_SYSTEM ) --�ĤT��ñ���I����m��[ZONE_DORIANS FARM]�������A���I�N�b���e�F�C
	ScriptMessage( TargetID() , OwnerID() , 0 , "[SC_MUSICFES_CHECKPOINT03]" , C_SYSTEM ) --�ĤT��ñ���I����m��[ZONE_DORIANS FARM]�������A���I�N�b���e�F�C

end
---------------------------------------------------------------------------------------------------
function LuaDan_112882_0()
	local captialflag = CheckFlag(OwnerID(), 542520)
	local guardflag = CheckFlag(OwnerID(), 542551)
	local Musicbox  = CountBodyItem( OwnerID() , 204426)		 --���ֲ�
	local Passticket = CountBodyItem( OwnerID() , 204526)                       --ñ���
	local Signflag1 = CheckFlag(OwnerID()  , 542529)
	local Signflag2 = CheckFlag(OwnerID()  , 542548)
	local Signflag3 = CheckFlag(OwnerID()  , 542549)

	if captialflag == true or guardflag == true then
			if Signflag2 == true then
				if  Signflag3 == false then
					if Passticket  >0 then
						if guardflag == true then 
							SetSpeakDetail(OwnerID(), "[SC_DAN_112757_1]" )                                   --ñ�����ܡG�u�r�r��o�̬O�Ĥ@��ñ���I�I���֨�ñ��a�I�Х��T�{���W���S��ñ����άO���ֲ���I
							AddSpeakOption(OwnerID(), TargetID(), "[SC_DAN_112757_3]", "LuaDan_112882_2", 0) --�ڬO�����A�ڭnñ��I
						elseif captialflag == true then
							if Musicbox >0  then
								SetSpeakDetail(OwnerID(), "[SC_DAN_112757_1]" )                                   --ñ�����ܡG�u�r�r��o�̬O�Ĥ@��ñ���I�I���֨�ñ��a�I�Х��T�{���W���S��ñ����άO���ֲ���I
								AddSpeakOption(OwnerID(), TargetID(), "[SC_DAN_112757_2]", "LuaDan_112882_1", 0) --�ڬO�����A�ڭnñ��I
							else
								SetSpeakDetail(OwnerID(), "[SC_MUSICFES_RICING_03]")      --�нT�{�A���W�O�_��[204426]�Cmusicbox
							end
						end
					else
						SetSpeakDetail(OwnerID(), "[SC_MUSICFES_RICING_01]")      --�нT�{�A���W�O�_��[204526]�Cñ���
					end
				else
					SetSpeakDetail(OwnerID(), "[SC_DAN_112757_8]" )        		--�A�w�gñ��L�F��!  
				end 
			else
				SetSpeakDetail(OwnerID(), "[SC_MUSICFES_RICING_02]")      --�A�W�@��ñ���I�|��ñ���I
			end
	else
		SetSpeakDetail(OwnerID(), "[SC_DAN_112757_7]")        		--�A�����W���ְ��N���ɶܡH�нT�{�A�O�_����ñ�����I    
	end
end
---------------------------------------------------------------------------------------------------
function LuaDan_112882_1() --����ñ�� ñ���I3

	local Musicbox  = CountBodyItem( OwnerID() , 204426)				  --���ֲ�
	local Passticket = CountBodyItem( OwnerID() , 204526)                             --ñ���
	local Signflag1 = CheckFlag(OwnerID()  , 542529)
	local Signflag2 = CheckFlag(OwnerID()  , 542548)
	local Signflag3 = CheckFlag(OwnerID()  , 542549)

	CloseSpeak(OwnerID())   --������ܵ���
	SetFlag( OwnerID()  , 542549 , 1 )
	SetFlag( OwnerID()  , 542448 , 0 ) 
	SetFlag( OwnerID()  , 542630 , 0 )
	DelBodyItem( OwnerID() , 204526 , Passticket)     		
	ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_DAN_112757_6]" , C_SYSTEM )       --�o�O�ĤT��ñ���I�A�A�w�gñ��F�I
	ScriptMessage( TargetID() , OwnerID() , 0 , "[SC_DAN_112757_6]" , C_SYSTEM )       --�o�O�ĤT��ñ���I�A�A�w�gñ��F�I
	sleep(50)
	ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_CHECKPOINT04]" , C_SYSTEM ) --���ߧA�w�������ʡA�Ш�[ZONE_DORIANS FARM]�_�誺���ǧ�[112756]�I�����y�C
	ScriptMessage( TargetID() , OwnerID() , 0 , "[SC_MUSICFES_CHECKPOINT04]" , C_SYSTEM ) --���ߧA�w�������ʡA�Ш�[ZONE_DORIANS FARM]�_�誺���ǧ�[112756]�I�����y�C	
end 
---------------------------------------------------------------------------------------------------
function LuaDan_112882_2() --����ñ��
	local Protect  = CheckFlag(OwnerID()  , 542551)                                   --�@�úX��
	local Passticket = CountBodyItem( OwnerID() , 204526)                             --ñ���
	local Signflag1 = CheckFlag(OwnerID()  , 542529)
	local Signflag2 = CheckFlag(OwnerID()  , 542548)
	local Signflag3 = CheckFlag(OwnerID()  , 542549)
		
	CloseSpeak(OwnerID())   --������ܵ��� 
	SetFlag( OwnerID()  , 542549 , 1 ) 
	DelBodyItem( OwnerID() , 204526 , Passticket)       		
	ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_DAN_112757_6]" , C_SYSTEM )       --�o�O�ĤT��ñ���I�A�A�w�gñ��F�I
	ScriptMessage( TargetID() , OwnerID() , 0 , "[SC_DAN_112757_6]" , C_SYSTEM )       --�o�O�ĤT��ñ���I�A�A�w�gñ��F�I
	sleep(50)
	ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_CHECKPOINT04]" , C_SYSTEM ) --���ߧA�w�������ʡA�Ш�[ZONE_DORIANS FARM]�_�誺���ǧ�[112756]�I�����y�C
	ScriptMessage( TargetID() , OwnerID() , 0 , "[SC_MUSICFES_CHECKPOINT04]" , C_SYSTEM ) --���ߧA�w�������ʡA�Ш�[ZONE_DORIANS FARM]�_�誺���ǧ�[112756]�I�����y�C
end
---------------------------------------------------------------------------------------------------
function LuaDan_112757_Signer_01()
	SetPlot( OwnerID() ,"range",  "LuaDan_112757_Signer_02" , 100 )
end

function LuaDan_112757_Signer_02() 
	 local MusicBox =  CountBodyItem( TargetID() , 204426 ) 
	 local LeadFlag = CheckFlag(TargetID()  , 542520)   --�����X��        
	local Flag1 =   CheckFlag(TargetID()  , 542529)  --�Ĥ@ñ���I
	local Flag2 =   CheckFlag(TargetID()  , 542548)  --�ĤGñ���I
	local Flag3 =   CheckFlag(TargetID()  , 542549 ) --�ĤTñ���I                
	if MusicBox ~= 0 and LeadFlag == true and Flag1 == false  then 
		ScriptMessage( OwnerID(), 0 , 1 , "[SC_DAN_SR_112757_3]" , C_SYSTEM ) --�u�O��²��A�i�H��F�o�̡A���L�S��ñ����V��ñ��]�����I
	end 
end
----------------------------------------------------------------------------------------------------------------
function LuaDan_112881_Signer_01()
	SetPlot( OwnerID() ,"range",  "LuaDan_112881_Signer_02" , 100 )
end

function LuaDan_112881_Signer_02() 
	 local MusicBox =  CountBodyItem( TargetID() , 204426 ) 		
	 local LeadFlag = CheckFlag(TargetID()  , 542520)   --�����X��        
	local Flag1 =   CheckFlag(TargetID()  , 542529)  --�Ĥ@ñ���I
	local Flag2 =   CheckFlag(TargetID()  , 542548)  --�ĤGñ���I
	local Flag3 =   CheckFlag(TargetID()  , 542549 ) --�ĤTñ���I                
	if MusicBox ~= 0 and LeadFlag == true and Flag2== false  then 
		ScriptMessage( OwnerID(), 0 , 1 , "[SC_DAN_SR_112757_3]" , C_SYSTEM ) --�u�O��²��A�i�H��F�o�̡A���L�S��ñ����V��ñ��]�����I
	end 
end
----------------------------------------------------------------------------------------------------------------
function LuaDan_112882_Signer_01()
	SetPlot( OwnerID() ,"range",  "LuaDan_112882_Signer_02" , 100 )
end

function LuaDan_112882_Signer_02() 
	 local MusicBox =  CountBodyItem( TargetID() , 204426 ) 		
	 local LeadFlag = CheckFlag(TargetID()  , 542520)   --�����X��        
	local Flag1 =   CheckFlag(TargetID()  , 542529)  --�Ĥ@ñ���I
	local Flag2 =   CheckFlag(TargetID()  , 542548)  --�ĤGñ���I
	local Flag3 =   CheckFlag(TargetID()  , 542549 ) --�ĤTñ���I                
	if MusicBox ~= 0 and LeadFlag == true and Flag3 == false then 
		ScriptMessage( OwnerID(), 0 , 1 , "[SC_DAN_SR_112757_3]" , C_SYSTEM ) --�u�O��²��A�i�H��F�o�̡A���L�S��ñ����V��ñ��]�����I
	end
end