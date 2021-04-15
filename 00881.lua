--���}����
function LuaS_Discowood_InstanceOutWay()
	LoadQuestOption(OwnerID())
	AddSpeakOption ( OwnerID(), TargetID( ), GetString("SC_111284_8") , "LuaS_Discowood_InstanceOutOption", 0 ) --���a�ﶵ�G( ��i�o�����~�A�^��Z��R�����K�K )
end


function LuaS_Discowood_InstanceOutOption()
	CloseSpeak(OwnerID())
	BeginPlot(OwnerID(),"LuaS_Discowood_InstanceOut",0)
end

--���ҨϪ̪�l�@��

function LuaS_Discowood_InstanceManShop()
	SetShop( OwnerID() , 600121 , "Test_Shop_Close" )
end
--���ҨϪ�
function LuaS_Discowood_InstanceTalk()
	LoadQuestOption(OwnerID())
	AddSpeakOption ( OwnerID(), TargetID( ), GetString("SC_111284_1") , "LuaS_Discowood_InstanceTalk_1", 0 ) --���a�ﶵ�G�ڭn��򭫸m����
	AddSpeakOption ( OwnerID(), TargetID( ), GetString("SC_111284_2") , "LuaS_Discowood_InstanceTalk_2", 0 ) --���a�ﶵ�G�ڷQ�i�J����
	AddSpeakOption ( OwnerID(), TargetID( ), GetString("SO_110439_0") , "LuaS_110490_OpenShop", 0 ) --���a�ﶵ�G�ڷQ�i�J����
end

function LuaS_Discowood_InstanceTalk_1()
	SetSpeakDetail ( OwnerID(), GetString ("SC_111284_3")   )--���m���Ҫ���k�M�����ƥ��ۦP�A��ӨS���ƥ��i�ת��s�����A�ХL�ܽЧA�[�J����A���L�i�J���Ҥ���A�i�J�ƥ��N�i�H�F�C�p�G�A�̷Q��������A�N����Ѵ���A�зs�������s�ն��Y�i�A�������i�P���e�ۦP�C�άO�A�T�w����S������H�d�b���ҷ��A���������᯵�Ҥ]�|���m�C
end

function LuaS_Discowood_InstanceTalk_2()
	if CountBodyItem(OwnerID() , 200392) > 0 then
		CloseSpeak(OwnerID())
		BeginPlot(OwnerID(),"LuaS_Discowood_InstanceTalk_3",0)
	else
		SetSpeakDetail ( OwnerID(), GetString ( "SC_111284_4" )   )--���Ҥ��O���i�h�N��i�h���n�ܡH�A�n���J����~��I
	end
end

function LuaS_Discowood_InstanceTalk_3()
	if CheckBuff( OwnerID() , 501570) == false then  --�W�[�ˬd�P�_
	DialogCreate( OwnerID() , EM_LuaDialogType_YesNo , GetString("SC_111284_5") )	-- �A�T�w�n�i�J���ҶܡH�A�w�g��n����ýT�w���Ұƥ����i�פF�ܡH
	DialogSelectStr( OwnerID() , GetString("SC_111284_6") )			-- �O���A�ڽT�w�I
	DialogSelectStr( OwnerID() , GetString("SC_111284_7") )			-- �ڦA�Q�Q�K�K
	AddBuff(OwnerID() , 501570,0,-1);--�M�ᵹ��BUFF
	local DoubleCheck = EnterInstance_Ask( OwnerID() )
	if DoubleCheck == "Yes" then
		if ChangeZone( OwnerID(), 200 , -1, 522 , 455 , 1087 , 3) then
		else
			ScriptMessage( OwnerID(), OwnerID(), 0, "[WARRING_ZONE_NOT_OPEN]", 0 );
		end
	end
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	end
end

function EnterInstance_Ask( Player )

	if ( DialogSendOpen( Player ) == false ) then 
		ScriptMessage( Player , Player , 1 , GetString("SYS_FIXEQ_DATA_ERROR") , 0 )	--��ưe�X�����D
		return 0
	end

	local HalfSec = 0
	local DialogResult = ""

	while true do
		Sleep( 5 )
		local DialogStatus = DialogGetResult( Player )
		HalfSec = HalfSec + 1
		if HalfSec > 120 then -- ���L�a�j��A120 = �@����
			--ScriptMessage( Player , Player , 0, "Infinity Loop", 0 )
			DialogClose( Player )
			CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
			break
		else
			--ScriptMessage( Player , Player , 0, "OK", 0 )
		end

		if ( DialogStatus >-2 ) then
			if ( DialogStatus == 0 ) then
				DialogResult = "Yes"
				DialogClose( Player )
				CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
				break
			elseif ( DialogStatus == 1 ) then
				DialogResult = "No"
				DialogClose( Player )
				CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
				break
			else
				DialogResult = "Etc"
				DialogClose( Player )
				CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
			end
		end
	end

	return DialogResult

end













