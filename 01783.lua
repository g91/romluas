function Lua_Dan_112698_5() 								        --�ڭn���W���ְ��N�v�ɬ���
	local Flag1 =	 CheckFlag(OwnerID()  , 542550)                                         --���Ѥw��������
--	local Flag2 =	 CheckFlag(OwnerID()  , 542527)                                         --�ĤG��������
--	local Flag3 =	 CheckFlag(OwnerID()  , 542528)                                         --�ĤT��������
	local SignFlag = CheckFlag(OwnerID()  , 542552)                                         --����г��W
	local Protect  = CheckFlag(OwnerID()  , 542551)                                         --�@�úX��
	local Name = GetName( OwnerID() )
	local Name2 = GetName( TargetID())
	local clock = ClockRead( OwnerID() , EM_ClockValueType_NowTime )                        --�˼Ƭ��
	local JohnPID = ReadRoleValue( TargetID() , EM_RoleValue_PID  ) 
		if Flag1 == false then --�����٨S���W�L
			if JohnPID == 5 then   --�p�GPID��5
				local A = ReadRoleValue(TargetID() , EM_RoleValue_Register+9)   
				CloseSpeak( OwnerID() ) 
				ScriptMessage( TargetID() , 0 , 1 , "[SC_DAN_112698_24]" , C_SYSTEM )
				ScriptMessage( TargetID() , 0 , 0 , "[SC_DAN_112698_24]" , C_SYSTEM )
				Sleep(10)
				ScriptMessage( TargetID() , 0 , 1 , "[SC_MUSICFES_RICING_TIME][$SETVAR1="..A.."]" , C_SYSTEM ) --�Z���A�����W�ɶ��٦�[$VAR1]��C
				ScriptMessage( TargetID() , 0 , 0 , "[SC_MUSICFES_RICING_TIME][$SETVAR1="..A.."]" , C_SYSTEM ) --�Z���A�����W�ɶ��٦�[$VAR1]��C
			elseif JohnPID == 0 then 
				if Protect == false then                                                                --���W�@�ê̤�����W����
					if SignFlag == false then 
							CloseSpeak( OwnerID() ) 
							WriteRoleValue( TargetID() , EM_RoleValue_PID , 5)
							BeginPlot(TargetID() , "Lua_mika_musicfes_PID5" , 0 )  --�Nnpc pid�]��5
							BeginPlot(TargetID() , "Lua_mika_musicfes_count" , 0 )  --�˼�5����
							ScriptMessage( TargetID(), 0, 1,  "[SC_DAN_112698_31][$SETVAR1="..Name.."]", C_SYSTEM ) -- 0 �d�򤺪��a���iť�� ,  1 �e�������T���C
							ScriptMessage( TargetID(), 0, 0,  "[SC_DAN_112698_31][$SETVAR1="..Name.."]", C_SYSTEM ) -- 0 �d�򤺪��a���iť�� ,  0 �T����C
							Sleep(10)
						--	ScriptMessage( TargetID(), 0, 1,  "[SC_DAN_112698_31]", C_SYSTEM ) -- �ثe�w��������W�A�еy�ԦA�i����W��C
						--	ScriptMessage( TargetID(), 0, 0,  "[SC_DAN_112698_31]", C_SYSTEM ) -- 		   
							AddBuff(OwnerID(), 503212, 0, 900 )  --��������Buff�аO�֦����ֽc���H
							GiveBodyItem( OwnerID() , 204426  , 1 ) 	  				   --�����ֲ� 
							GiveBodyItem( OwnerID() , 204604  , 1 ) 	  				   --���a�z��T
							SetFlag( OwnerID()  , 542552 , 1 )   						   --����г��Wflag
							SetFlag( OwnerID()  , 542520 , 1 )   --�����X��
							ClockOpen( OwnerID(), EM_ClockCheckValue_3 , 900, 900 , 0  , "LuaDan_112698_offline" , "LuaDan_112698_clock_close" ) --�]�w�p�ɾ��}�l,15����
							ScriptMessage( OwnerID(), OwnerID(), 1,"[SC_MUSICFES_CHECKPOINT01]", C_SYSTEM) -- �Ĥ@��ñ���I����m��[ZONE_ALL_INSTANCE]���f�A�ֲն��e��ñ��a�I
							ScriptMessage( OwnerID(), OwnerID(), 0,"[SC_MUSICFES_CHECKPOINT01]", C_SYSTEM ) 
					else 
						CloseSpeak( OwnerID() ) 
						ScriptMessage( OwnerID(), OwnerID(), 1,"[SC_DAN_112698_20]", C_SYSTEM) --���ֱN���ֲ��e�����B�D���w�a�I
						ScriptMessage( OwnerID(), OwnerID(), 0,"[SC_DAN_112698_20]", C_SYSTEM ) 
					end		
				else 
					CloseSpeak( OwnerID() ) 
					ScriptMessage( OwnerID(), OwnerID(), 1,"[SC_DAN_112698_23]", C_SYSTEM) --�A�w�g���W��U�����F��I
					ScriptMessage( OwnerID(), OwnerID(), 0,"[SC_DAN_112698_23]", C_SYSTEM ) 
				end
			end
		else 
			CloseSpeak( OwnerID() ) 
			ScriptMessage( OwnerID(), OwnerID(), 1,"[SC_DAN_112756_6]", C_SYSTEM) --�A���Ѥw�g���������ʡA�Щ��ѦA�~����W�a�C
			ScriptMessage( OwnerID(), OwnerID(), 0,"[SC_DAN_112756_6]", C_SYSTEM ) 
		end

end
---------------------------------------------------------------------------------------------------
function Lua_Dan_112698_8()--�ڭn���W��U�N���ֲ��e�F���I

	local SignFlag = CheckFlag(OwnerID()  , 542552)                                         --����г��W
	local Protect  = CheckFlag(OwnerID()  , 542551)                                         --�@�úX��
	local finish = CheckFlag(OwnerID()  , 542527 )                                         --���ѧ����L�@��
	local Name = GetName( OwnerID() )
	local Name2 = GetName( TargetID())
--	local JohnPID = ReadRoleValue( TargetID() ,  EM_RoleValue_Register+7) 
	local count = 0
		if finish == false then
			if SignFlag == false then 
				if Protect == false  then 
					CloseSpeak( OwnerID() ) 
					ScriptMessage( TargetID(), 0, 2,  "[SC_DAN_112698_32][$SETVAR1="..Name.."]", 0 ) 
					ScriptMessage( TargetID(),0, 0, "[SC_DAN_112698_32][$SETVAR1="..Name.."]", 0 )
					AddBuff(OwnerID(), 503215, 0, 900 )  --��������Buff�аO�@�ê�
					SetFlag( OwnerID()  , 542552 , 1 ) --����г��W
					SetFlag( OwnerID()  , 542551 , 1 ) --�@�úX��
					GiveBodyItem( OwnerID() , 204604  , 1 ) 	   --���a�z��T
					ClockOpen( OwnerID(), EM_ClockCheckValue_3 , 900, 900 , 0  , "LuaDan_112698_offline" , "LuaDan_112698_clock_close" ) --�]�w�p�ɾ��}�l,15����
					ScriptMessage( OwnerID(), OwnerID(), 1,"[SC_MUSICFES_CHECKPOINT01]", C_SYSTEM) -- �Ĥ@��ñ���I����m��[ZONE_ALL_INSTANCE]���f�A�ֲն��e��ñ��a�I
					ScriptMessage( OwnerID(), OwnerID(), 0,"[SC_MUSICFES_CHECKPOINT01]", C_SYSTEM ) 
				else
					CloseSpeak( OwnerID() ) 
					ScriptMessage( OwnerID(), OwnerID(), 1,"[QUEST_MSG_ALREADYDONE]", C_SYSTEM) -- �A�w�g����������
					ScriptMessage( OwnerID(), OwnerID(), 0,"[QUEST_MSG_ALREADYDONE]", C_SYSTEM ) 
				end
			else 
				CloseSpeak( OwnerID() ) 
				ScriptMessage( OwnerID(), OwnerID(), 1,"[SC_DAN_112698_29]", C_SYSTEM) -- �A�w�g���W�L�F
				ScriptMessage( OwnerID(), OwnerID(), 0,"[SC_DAN_112698_29]", C_SYSTEM ) 
			end
		else 
			CloseSpeak( OwnerID() ) 
			ScriptMessage( OwnerID(), OwnerID(), 1,"[SC_DAN_112756_6]", C_SYSTEM) --�A���Ѥw�g���������ʡA�Щ��ѦA�~����W�a�C
			ScriptMessage( OwnerID(), OwnerID(), 0,"[SC_DAN_112756_6]", C_SYSTEM ) 
		end
end

function LuaDan_112698_offline()   --���u�ɰ���@��
	local MusicBox =  CountBodyItem( OwnerID() , 204426 ) --���ֲ�
	local Signpaper =  CountBodyItem( OwnerID() , 204526) --ñ���
	local locationpapaer =  CountBodyItem( OwnerID() , 204604 ) --�a�z��T
	local Player   = OwnerID()
	ClockClose( OwnerID() ) 	
	DelBodyItem(Player , 204426 , MusicBox) --�������a���W���ֲ�
	DelBodyItem(Player , 204604 , locationpapaer) --�������a���W�a�z��T
	DelBodyItem(Player , 204526, Signpaper ) --�������a���Wñ���
	SetFlag( Player  , 542529 , 0 ) --�Ĥ@��ñ���I
	SetFlag( Player  , 542548 , 0 )	--�ĤG��ñ���I
	SetFlag( Player  , 542549 , 0 ) --�ĤT��ñ���I
	SetFlag( Player  , 542448 , 0 ) --����_���X�ǩ�ñ���   
	SetFlag( Player  , 542630 , 0 ) --�A�ץͩ�
	SetFlag( Player  , 542552 , 0 ) --����г��W
	SetFlag( Player  , 542551,  0) --�@�úX��
	SetFlag( Player  , 542520,  0) --�����X��
	CancelBuff( OwnerID(), 501635)
	CancelBuff( OwnerID(), 503215)
	CancelBuff( OwnerID(), 503212)
end

function LuaDan_112698_clock_close()   --�p�ɾ��ɶ���ɰ���@��
	local MusicBox =  CountBodyItem( OwnerID() , 204426 ) --���ֲ�
	local Signpaper =  CountBodyItem( OwnerID() , 204526) --ñ���
	local locationpapaer =  CountBodyItem( OwnerID() , 204604 ) --�a�z��T
	local Player   = OwnerID()
	ClockClose( OwnerID() ) 	
	DelBodyItem(Player , 204426 , MusicBox) --�������a���W���ֲ�
	DelBodyItem(Player , 204604 , locationpapaer) --�������a���W�a�z��T
	DelBodyItem(Player , 204526, Signpaper ) --�������a���Wñ���
	SetFlag( Player  , 542529 , 0 ) --�Ĥ@��ñ���I
	SetFlag( Player  , 542548 , 0 )	--�ĤG��ñ���I
	SetFlag( Player  , 542549 , 0 ) --�ĤT��ñ���I
	SetFlag( Player  , 542448 , 0 ) --����_���X�ǩ�ñ���   
	SetFlag( Player  , 542630 , 0 ) --�A�ץͩ�
	SetFlag( Player  , 542552 , 0 ) --����г��W
	SetFlag( Player  , 542551,  0) --�@�úX��
	SetFlag( Player  , 542520,  0) --�����X��
	CancelBuff( OwnerID(), 501635)
	CancelBuff( OwnerID(), 503215)
	CancelBuff( OwnerID(), 503212)
	ScriptMessage( Player,  Player, 2, "[SC_DAN_112698_19]" , 0 )	--�ɶ���I�i�h�̵y�y�ݤf��a�I
end
---------------------------------------------------------------------------------------------------
function Lua_mika_musicfes_PID5()
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 5)
	PID = ReadRoleValue( OwnerID() , EM_RoleValue_PID  ) 
--	Say(OwnerID(), PID)
end

function Lua_mika_musicfes_count() --�ɶ��˼�5���� �ɶ����k�s
	WriteRoleValue(OwnerID() , EM_RoleValue_Register+9,  300 )   -- TIME�˼� 
	while true do
		AddRoleValue(OwnerID() , EM_RoleValue_Register+9,  -1 )    
		local A = ReadRoleValue(OwnerID() , EM_RoleValue_Register+9)   
--		Say(OwnerID(),A)
		if A == 0  then
			WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0)
--			Say(OwnerID(), "pid is 0")
			PID = ReadRoleValue( OwnerID() , EM_RoleValue_PID  ) 
	--		Say(OwnerID(), PID)
			break
		end
		sleep(10)
	end
end