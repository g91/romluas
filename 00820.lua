function Lua_202800_Use()
	-- 2012.10.22 �s�ءA�ץ� Lua_202800_Effect �]�{���ܰʼg�k�A�ӵL�k�ϥΪ����D�C
	local Player = OwnerID()
	CallPlot( Player , "Lua_202800_New_Effect" , Player )
	--
--	BeginPlot( OwnerID() , "Lua_202800_Effect" , 0 )
end
function Lua_202800_Effect()
	if CheckBuff( OwnerID() , 501570) == false then  --�W�[�ˬd�P�_
		DialogCreate( OwnerID() , EM_LuaDialogType_Input  , GetString("SC_202800_1")); -- �п�J�A�Q�۩w���W�١C
		DialogSelectStr( OwnerID() , GetString("SC_202800_2") );	-- �T�w
		DialogSelectStr( OwnerID() , GetString("SC_202800_3") );	-- ����
		AddBuff(OwnerID() , 501570,0,-1);--�M�ᵹ��BUFF

		if( DialogSendOpen( OwnerID() ) == false ) then 
			ScriptMessage( OwnerID(),OwnerID(),1,GetString("SYS_FIXEQ_DATA_ERROR"),0)	-- ��Ʀ����D
			--��ưe�X�����D
			return;
		end

		local SelectID = -2;
		local inputstring = ""
		DialogClose( OwnerID() )
		CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF

		for i = 0 , 600 , 1 do
			Sleep( 1 );
			SelectID = DialogGetResult( OwnerID() );
			if ( SelectID ~= -2 ) and ( SelectID ~= -1 ) and i < 600 then
				inputstring = DialogGetInputResult( OwnerID() );

				TargetName = DialogGetInputResult( OwnerID() );

				if string.len(TargetName) <= 32 then
					if( SelectID == 0 ) then
						if CountBodyItem( OwnerID() , 202800 ) >= 1 then
							if SetCustomTitleString( OwnerID(), inputstring ) == true then
								ScriptMessage( OwnerID(),OwnerID(),1,GetString("SC_202800_4"),C_SYSTEM)	-- �۩w�ٸ����\�I
								DelBodyItem( OwnerID() , 202800 , 1 )
							else
								ScriptMessage( OwnerID(),OwnerID(),1,"[SC_VALENTINE_RUNMESSAGE7]",0)	--�A��J����r�t��������r�C
							end
						else
							ScriptMessage( OwnerID(),OwnerID(),1,GetString("SYS_FIXEQ_DATA_ERROR"),0)	-- ��Ʀ����D
						end
						break
					end
				else
					ScriptMessage( OwnerID(),OwnerID(),1,"[SC_202800_5]",0)	--�A��J���r�ƹL�h�A�L�k�w�q�ٸ��C
				end
					
				break

			elseif i == 600 then
				ScriptMessage( OwnerID(),OwnerID(),1,GetString("SC_OVERTIME_MSG"),0)	-- ���ݮɶ��L�[�C		
				break
			end
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );	-- �w�g�}�Ҥ@�ӹ�ܿﶵ
	end

end

function Lua_202800_New_Effect( Player )	-- 2012.10.22 �s�ءA�ץ� Lua_202800_Effect �]�{���ܰʼg�k�A�ӵL�k�ϥΪ����D�C

	local Buff = 501570
	
	if CheckBuff( Player , Buff ) == true then 
		ScriptMessage( Player , Player , 0 , "[SC_WINDOW_OPENED]", 0 )	--�����w�g���}�F
		return
	end
	
	AddBuff( Player , Buff , 0 , -1 )
	DialogCreate( Player , EM_LuaDialogType_Input , "[SC_202800_1]" )	-- �п�J�A�Q�۩w���W�١C
	DialogSelectStr( Player , "[SC_202800_2]" )	-- �T�w
	DialogSelectStr( Player , "[SC_202800_3]" )	-- ����
	
	if ( DialogSendOpen( Player ) == false )  then  --���ϥο��~�A�^�ǿ��~�T��
		ScriptMessage( Player , Player , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 )
		return
	end

	local Time = 0
	local DialogStatus
	local inputstring = ""
	local Item = 202800	-- �ۭq�ٸ����O
	
	while true do
		if Time > 600 then  -- 60��L�ʧ@�A������ܵ���
			ScriptMessage( Player , Player , 0 , "[SC_BUFFNPC_07]" , 0 ) -- ���ݮɶ��L�[
			break
		end
		DialogStatus = DialogGetResult( Player )  --�ˬd�ϥΪ̿��������
	--	DebugMsg( Player , 0 , "Dialog = "..DialogStatus )
		if DialogStatus ~= -2 and DialogStatus ~= -1 then -- ��l�ơB���_
			inputstring = DialogGetInputResult( Player )
			if String.len(inputstring) <= 32 then	-- ��J�r��<= 32�r����
				if DialogStatus == 0 then  -- ����J�r��
					if CountBodyItem( Player , Item ) >= 1 then
						if SetCustomTitleString( Player , inputstring ) == true then
							ScriptMessage( Player , Player , 1 ,"[SC_202800_4]" ,C_SYSTEM )	-- �۩w�ٸ����\�I
							DelBodyItem( Player , Item , 1 )
						else
							ScriptMessage( Player , Player , 1 , "[SC_VALENTINE_RUNMESSAGE7]" , 0 )	--�A��J����r�t��������r�C
						end
					else
						ScriptMessage( Player , Player , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 )	-- ��Ʀ����D
					end
				end
				break
			else
				ScriptMessage( Player , Player , 1 , "[SC_202800_5]" , 0 )	--�A��J���r�ƹL�h�A�L�k�w�q�ٸ��C
			end
			break
		end
		sleep(1)
		Time = Time+1
	end
	CancelBuff( Player , Buff )
	DialogClose( Player )
end