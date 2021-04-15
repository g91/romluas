function Lua_Valentine_RunMessage_talk()
	SetSpeakDetail( OwnerID(), "[SC_VALENTINE_RUNMESSAGE0]"   )--�A�Q�n�ǻ����ֶܡH����5�ӱ��H�`���J�O�A�����A�N�T���ǹF���Ҧ����a�I
	AddSpeakOption( OwnerID(), OwnerID(), "[SC_VALENTINE_RUNMESSAGE1]" , "Lua_Valentine_RunMessage_talk2", 0 ) --�ڷQ�n�ǻ����֡I
end
function Lua_Valentine_RunMessage_talk2()
	if CountBodyItem( OwnerID() , 203023 ) >= 5 then
		BeginPlot(OwnerID(),"Lua_Valentine_RunMessage",0)
		CloseSpeak( OwnerID())
	else
		ScriptMessage( OwnerID(),OwnerID(),1,"[SC_VALENTINE_RUNMESSAGE4]",0)
		CloseSpeak( OwnerID())
	end
end


function Lua_Valentine_RunMessage()
	local Setp = 0
	local TargetName = "";
	if CheckBuff( OwnerID() , 501570) == false then  --�W�[�ˬd�P�_
		AddBuff(OwnerID() , 501570,0,-1);--�M�ᵹ��BUFF	
		
		DialogCreate( OwnerID() , EM_LuaDialogType_Input  , "[SC_VALENTINE_RUNMESSAGE_NAME]"); --�п�J�Q�n�ǻ��T������H�H�H
		DialogSelectStr( OwnerID() , "[SC_202800_2]" );
		DialogSelectStr( OwnerID() , "[SC_202800_3]" );

		if( DialogSendOpen( OwnerID() ) == false ) then 		
			ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_FIXEQ_DATA_ERROR]",0)	
			--��ưe�X�����D
			return;
		end

		local SelectID = -2;

		for i = 0 , 600 , 1 do
			Sleep( 1 );
			SelectID = DialogGetResult( OwnerID() );
			if ( SelectID ~= -2 ) and ( SelectID ~= -1 ) and i < 600 then
				local CheckResult = DialogGetInputCheckResult( OwnerID() );
				if( CheckResult == 0 )then 
					-- ����, ��ż��
					ScriptMessage( OwnerID(),OwnerID(),1,"[SC_VALENTINE_RUNMESSAGE7]",0)	--�A��J����r�t��������r�C
					CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
					DialogClose( OwnerID() )
					break
				elseif( CheckResult == 1 ) then
					-- ���\
					TargetName = DialogGetInputResult( OwnerID() );
					if string.len(TargetName) <= 32 then
						if( SelectID == 0 ) then
							CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
							DialogClose( OwnerID() )
							Setp = 1
							break
						end
					else
						ScriptMessage( OwnerID(),OwnerID(),1,"[SC_VALENTINE_RUNMESSAGE5]",0)	--�A��J���r�ƹL�h�A�L�k���A�ǻ��T���C
					end
					CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
					DialogClose( OwnerID() )
					break
				end
			elseif i == 600 then
				ScriptMessage( OwnerID(),OwnerID(),1,"[SC_OVERTIME_MSG]",0)	
				CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
				DialogClose( OwnerID() )		
				break
			end
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	end




	if Setp == 1 and CheckBuff( OwnerID() , 501570) == false then  --�W�[�ˬd�P�_
		AddBuff(OwnerID() , 501570,0,-1);--�M�ᵹ��BUFF
		
		DialogCreate( OwnerID() , EM_LuaDialogType_Input  , "[SC_VALENTINE_RUNMESSAGE2]"); --�п�J�A�Q�n�ǹF���T���H
		DialogSelectStr( OwnerID() , "[SC_202800_2]" );
		DialogSelectStr( OwnerID() , "[SC_202800_3]" );

		if( DialogSendOpen( OwnerID() ) == false ) then 			
			ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_FIXEQ_DATA_ERROR]",0)	
			--��ưe�X�����D
			return;
		end

		local SelectID = -2;
		local inputstring = "";
		local Name = GetName(OwnerID())
		for i = 0 , 600 , 1 do
			Sleep( 1 );
			SelectID = DialogGetResult( OwnerID() );
			if ( SelectID ~= -2 ) and ( SelectID ~= -1 ) and i < 600 then
				local CheckResult = DialogGetInputCheckResult( OwnerID() );
				if( CheckResult == 0 )then 
					-- ����, ��ż��
					ScriptMessage( OwnerID(),OwnerID(),1,"[SC_VALENTINE_RUNMESSAGE7]",0)	--�A��J����r�t��������r�C
					CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
					DialogClose( OwnerID() )
					break
				elseif( CheckResult == 1 ) then
					-- ���\
					inputstring = DialogGetInputResult( OwnerID() );
					if string.len(inputstring) <= 72 then
						if( SelectID == 0 ) then
							if CountBodyItem( OwnerID() , 203023 ) >= 5 then
								local SayString = "[SC_VALENTINE_WANTTOSAY][$SETVAR1 = "..Name.." ][$SETVAR2 = "..TargetName.." ][$SETVAR3 = "..inputstring.." ]"
								local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
								local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --�|Ū��u�ꪺ���y�ϰ�
								if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
									--RunningMsg( OwnerID(), 2 ,SayString );
								end
								ScriptMessage( OwnerID(),-2,1,SayString,0)	--�N�ܼs���X�h�I
								ScriptMessage( OwnerID(),-2,0,SayString,0)	--�N�ܼs���X�h�I
								ScriptMessage( OwnerID(),OwnerID(),1,"[SC_VALENTINE_RUNMESSAGE3]",C_SYSTEM)--�A�n�ǻ����T���w�g�ǹF���Ҧ����a�F�I
								DelBodyItem( OwnerID() , 203023 , 5 )
							else
								ScriptMessage( OwnerID(),OwnerID(),1,"[SC_VALENTINE_RUNMESSAGE4]",0)	
							end
						end
					else
						ScriptMessage( OwnerID(),OwnerID(),1,"[SC_VALENTINE_RUNMESSAGE5]",0)	--�r�ƤӦh
					end
					CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
					DialogClose( OwnerID() )
					break
				end
			elseif i == 600 then
				ScriptMessage( OwnerID(),OwnerID(),1,"[SC_OVERTIME_MSG]",0)
				CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
				DialogClose( OwnerID() )		
				break
			end
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	end
end

function Lua_Valentine_RunMessage_Motion()
	MoveToFlagEnabled( OwnerID(), false );
	AddBuff(OwnerID(),502704,1,-1)
	while 1 do
	local RandBox = Rand(2)
		if RandBox == 0 then
			Say(OwnerID(),"[SC_VALENTINE_IDLESAY_1]")
			PlayMotion( OwnerID(),165 )
		else
			Say(OwnerID(),"[SC_VALENTINE_IDLESAY_2]")
			PlayMotion( OwnerID(),166 )
		end
	Sleep(Rand(100))
	Sleep(300)
	end
end