function LuaInside_RACEGAME()
	LoadQuestOption( OwnerID() )
	SetCrystalID( TargetID(), 350 ); 	
	--AddSpeakOption( OwnerID(), TargetID( ), "[SC_RACEGAMEINSIDE_1]" , "Lua_RACEGAME_GetGuildBidInfo", 0 ) --�ڷQ���W�ɰ���������
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_RACEGAMEINSIDE_2]" , "Lua_RACEGAME_Teach", 0 ) --�ڷQ�F���ɰ������W�h
end

function Lua_RACEGAME_GetGuildBidInfo()
	CloseSpeak( OwnerID() )
	BeginPlot(OwnerID(),"Lua_RACEGAME_GetGuildBidInfo1",0)
end
function Lua_RACEGAME_GetGuildBidInfo1()
	if (CheckZone(350) == false) then
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_RACEGAME_ZONEERROR]" , 0 )	--�ɰ����٦A�ǳƤ�
	else
		if (CheckBuff( OwnerID() , 503080 ) == false) then
			if CheckBuff( OwnerID() , 501570) == false then  --�W�[�ˬd�P�_
				AddBuff(OwnerID() , 501570,0,-1);--�M�ᵹ��BUFF
				
				DialogCreate( OwnerID() , EM_LuaDialogType_YesNo ,"[SC_RACEGAME_GETTACKT]")
				DialogSelectStr( OwnerID() , "[SC_GETTITLE_1]" );
				DialogSelectStr( OwnerID() , "[SC_CANCEL]" );
				if( DialogSendOpen( OwnerID() ) == false ) then 
					ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_FIXEQ_DATA_ERROR]",0)	
					--��ưe�X�����D
					return
				end
				
				for i = 0 , 100 , 1 do
					Sleep( 1 );
					SelectID = DialogGetResult( OwnerID() );
					if ( SelectID ~= -2 ) and ( SelectID ~= -1 ) and i < 100 then
						if ( SelectID == 0 ) then
							if (CountBodyitem(OwnerID(),203038) >= 15 )then
								AddBuff(OwnerID(), 503080, 0, -1)		--���o����
								DelBodyitem(OwnerID(),203038,15)
								CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
								DialogClose( OwnerID() )
								--�n�D�}�Ҥ��|���v�Ф���, ��T�ǵ� DC, DC �b�N��T�൹ Client
								SendBGInfoToClient( 350, OwnerID() )
								break;
							else
								ScriptMessage( OwnerID(),OwnerID(),1,"[SC_111813_YU_36]",0)	
								CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
								DialogClose( OwnerID() )
								-- 2012.07.16 �ץ����a����W����A���v�� - �����j�D(Zone 441)�ɡA�b�����ťN��(203038)�������������p�U�A�����I���T�w���W��A�|���ܵ�����ܡu�w�g�}�Ҥ@�ӹ�ܿﶵ�v�����D�C
								break;
							end
						elseif ( SelectID == 1 ) then
							CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
							DialogClose( OwnerID() )
							break
						end
					elseif i == 100 then
						CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
						DialogClose( OwnerID() )		
						break
					end
				end
			else
				ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
			end
		else
			-- �n�D�}�Ҥ��|���v�Ф���, ��T�ǵ� DC, DC �b�N��T�൹ Client
			SetCrystalID( TargetID(), 350 ); 	
			SendBGInfoToClient( 350, OwnerID() )
		end

	end
end
function Lua_RACEGAME_Teach()
	SetSpeakDetail( OwnerID(), "[SC_RACEGAMEINSIDE_3]"   )	--�o�O�@�Ӧ���r���ޥ��A�H�ӤH�[�J��C�A���C���F��8�H�ɡA�N�|�H�ӤH������覡�i�J���ɡA�ܦ��K�Ӷ�����ɡC 
								--���a���@�������ɶ��i�H��ܬO�_�i�J�ɰ����A�p�G�@�������Ҧ��i�J��C�����a�֩󤭦�A�h�����ɰ����A�Ӧ��Գ��S����Ӫ̡C 
								--�H��F���I�����ᶶ�Ǭ��W���C
								--�ѥ[�O�ά�30�T�����ťN���C
								--�Ĥ@�W��o100�T�����ťN���B�ĤG�W��o50�T�����ťN���B�ĤT�W��o30�T�����ťN���C
								--���ɶi��ɡA�ɹD�W�|���\�h�S�ޥi�H���ΡA�C�ӤH�̦h�u����a�@�ӯS�ޡC 
end
function Lua_RACE_INTORide()
	--CastSpell(OwnerID(),OwnerID(),491233)
	AddBuff(OwnerID(), 501634, 0, -1)		--�޲z���M�԰�
	local dis = 30
	local hindrance = {}
	local RoomID = ReadRoleValue(  OwnerID() , EM_RoleValue_RoomID)
	local OldX = ReadRoleValue(  OwnerID() , EM_RoleValue_X )
	local OldY = ReadRoleValue(  OwnerID() , EM_RoleValue_Y )
	local OldZ = ReadRoleValue(  OwnerID() , EM_RoleValue_Z )
	local OldDir = ReadRoleValue(  OwnerID() , EM_RoleValue_Dir )
	local Cal = (math.pi/180)*(OldDir) 
	dis = 10
	hindrance[1] = CreateObj( 112586, OldX+dis*math.sin(Cal) ,OldY ,OldZ +dis*math.cos(Cal),OldDir , 1 )
	hindrance[2] = CreateObj( 112587, OldX-dis*math.sin(Cal) ,OldY ,OldZ -dis*math.cos(Cal),OldDir , 1 )
	hindrance[3] = CreateObj( 110224, OldX- 30*math.cos(Cal)+dis*math.sin(Cal) ,OldY ,OldZ +30*math.sin(Cal) +dis*math.cos(Cal),OldDir , 1 )
	hindrance[4] = CreateObj( 110224, OldX- 30*math.cos(Cal)-dis*math.sin(Cal) ,OldY ,OldZ +30*math.sin(Cal) -dis*math.cos(Cal),OldDir , 1 )
	for i=1,table.getn(hindrance) do
		SetModeEx( hindrance[i], EM_SetModeType_Fight , false )--�i�������
		SetModeEx( hindrance[i], EM_SetModeType_Strikback, false )--����
		SetModeEx( hindrance[i], EM_SetModeType_Mark, false )--�аO
		SetModeEx( hindrance[i], EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
		SetModeEx( hindrance[i], EM_SetModeType_Obstruct, false )--����
		SetModeEx( hindrance[i], EM_SetModeType_Gravity, true )--���O
		SetModeEx( hindrance[i], EM_SetModeType_Move, false )--����
		SetModeEx( hindrance[i], EM_SetModeType_ShowRoleHead, false )--�Y����
		SetModeEx( hindrance[i], EM_SetModeType_Searchenemy, false )--����
		AddToPartition( hindrance[i] ,  RoomID  )
	end
	BeginPlot( hindrance[1] , "Lua_RACE_sidemessger1" , 0 )
	BeginPlot( hindrance[2] , "Lua_RACE_sidemessger2" , 0 )
end
function Lua_RACE_sidemessger1()
	local RR = rand(100)
	while 1 do
		PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_WAVE )
		Sleep(10)
		PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_SPEAK )
		Say(OwnerID(),"[SC_RACE_SIDEMESSAGE1]")
		Sleep(1800+RR)
	end
end
function Lua_RACE_sidemessger2()
	local RR = rand(100)
	while 1 do
		PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_WAVE )
		Sleep(10)
		PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_SPEAK )
		Say(OwnerID(),"[SC_RACE_SIDEMESSAGE2]")
		Sleep(1800+RR)
	end
end