--�`�y���� 5��R�ָ`  ���Ŷ���
--�إ߮ɶ�: 2009/04/16
--�ק���: 2009/04/27
--�إߪ�  : ���ʥ��� ��ʨ�
------------------------------------------------------------------------------
--���b ����NPC   (6��  RA)  112776  CODE
------------------------------------------------------------------------------
function LuaN_musicfes_112776_range()  
		SetPlot( OwnerID(), "touch", "LuaN_musicfes_112776_sing", 50 );
end
------------------------------------------------------------------------------
function LuaN_musicfes_112776_sing()
	local Qeasy01= CheckFlag(OwnerID()  , 542542) -- ���U�D��²��Q1   �R���I: �����̫ᶥ�q��
	local Qeasy02= CheckFlag(OwnerID()  , 542543) -- ���U�D��²��Q2   �R���I: �����̫ᶥ�q��
	local Qeasy03= CheckFlag(OwnerID()  , 542544) -- ���U�D��²��Q3   �R���I: �����̫ᶥ�q��
	local Qhard01= CheckFlag(OwnerID()  , 542545) -- ���U�D�ԧx��Q1   �R���I: �����̫ᶥ�q��
	local Qhard02= CheckFlag(OwnerID()  , 542546) -- ���U�D�ԧx��Q2   �R���I: �����̫ᶥ�q��
	local Qhard03= CheckFlag(OwnerID()  , 542547) -- ���U�D�ԧx��Q3   �R���I: �����̫ᶥ�q��

	local Aeasy= CheckFlag(OwnerID()  , 542521) -- ���U�D��²��  �R���I:�����̫ᶥ�q��
	local Ahard= CheckFlag(OwnerID()  , 542522) -- ���U�D�ԧx��  �R���I: �����̫ᶥ�q��

	local Deasy= CheckFlag(OwnerID()  , 542523) -- �F���ؼ� ²�� Flag  �R���I:�^�����ʮ�
	local Dhard= CheckFlag(OwnerID()  , 542524) -- �F���ؼ� �x��Flag   �R���I:�^�����ʮ�

	local todayE= CheckFlag(OwnerID()  , 542525) -- ���ѹL��²��Flag
	local todayH= CheckFlag(OwnerID()  , 542526) --���ѹL���x��Flag

	local step00=  CheckFlag(OwnerID()  , 542530) -- ��0�ӭ��� 
	local step01=  CheckFlag(OwnerID()  , 542531) -- ��1�ӭ��� 
	local step02=  CheckFlag(OwnerID()  , 542532) -- ��2�ӭ��� 
	local step03=  CheckFlag(OwnerID()  , 542533) -- ��3�ӭ��� 
	local step04=  CheckFlag(OwnerID()  , 542534) -- ��4�ӭ��� 
	local step05=  CheckFlag(OwnerID()  , 542535) -- ��5�ӭ��� 
	local step06=  CheckFlag(OwnerID()  , 542536) -- ��6�ӭ��� 
	local step07=  CheckFlag(OwnerID()  , 542537) -- ��7�ӭ��� 
	local step08=  CheckFlag(OwnerID()  , 542538) -- ��8�ӭ��� 
	local step09=  CheckFlag(OwnerID()  , 542539) -- ��9�ӭ��� 
	local step10=  CheckFlag(OwnerID()  , 542540) -- ��10�ӭ��� 
	local step11=  CheckFlag(OwnerID()  , 542541) -- ��11�ӭ��� 

	PlaySoundToPlayer( OwnerID() , "sound/sound_new/skill/Music_Festival/scale/6.mp3", false )

		if Qhard01 == true then --Q�x��1  3
			if step11 == true or step10 == true or step09 == true or step08 == true or step07 == true or step06 == true or step05 == true or step04 == true or step03 == true or step01 == true or step00 == true then
				ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG06]", C_SYSTEM )--RA~
				Sleep(10) --2��
				ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG_WRONG]", C_SYSTEM )--�A�����o�I�Э��s�ӹL�a�I
				SetFlag( OwnerID()  , 542531 , 0 ) -- �R�X��1
				SetFlag( OwnerID()  , 542532 , 0 ) -- �R�X��2
				SetFlag( OwnerID()  , 542533 , 0 ) -- �R�X��3
				SetFlag( OwnerID()  , 542534 , 0 ) -- �R�X��4
				SetFlag( OwnerID()  , 542535 , 0 ) -- �R�X��5
				SetFlag( OwnerID()  , 542536 , 0 ) -- �R�X��6
				SetFlag( OwnerID()  , 542537 , 0 ) -- �R�X��7
				SetFlag( OwnerID()  , 542538 , 0 ) -- �R�X��8
				SetFlag( OwnerID()  , 542539 , 0 ) -- �R�X��9
				SetFlag( OwnerID()  , 542540 , 0 ) -- �R�X��10
				SetFlag( OwnerID()  , 542541 , 0 ) -- �R�X��11
				SetFlag( OwnerID()  , 542530 , 1 ) -- ���X��0
			else
				if step02 == true then -- �p�G��step 02
					ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG06]", C_SYSTEM )--RA~
					Sleep(10) --2��
					ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG_RIGHT]", C_SYSTEM )--�A�����o�A�~��O���U�h�a�I
					SetFlag( OwnerID()  , 542533 , 1 ) -- �� Flag Q03
					SetFlag( OwnerID()  , 542532 , 0 ) -- �R Flag Q02
				end
			end
		elseif Qhard02 == true then --Q�x��2  11
			if step11 == true or step09 == true or step08 == true or step07 == true or step06 == true or step05 == true or step04 == true or step03 == true or step02== true or step01== true or step00 == true then
				ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG06]", C_SYSTEM )--RA~
				Sleep(10) --2��
				ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG_WRONG]", C_SYSTEM )--�A�����o�I�Э��s�ӹL�a�I
				SetFlag( OwnerID()  , 542531 , 0 ) -- �R�X��1
				SetFlag( OwnerID()  , 542532 , 0 ) -- �R�X��2
				SetFlag( OwnerID()  , 542533 , 0 ) -- �R�X��3
				SetFlag( OwnerID()  , 542534 , 0 ) -- �R�X��4
				SetFlag( OwnerID()  , 542535 , 0 ) -- �R�X��5
				SetFlag( OwnerID()  , 542536 , 0 ) -- �R�X��6
				SetFlag( OwnerID()  , 542537 , 0 ) -- �R�X��7
				SetFlag( OwnerID()  , 542538 , 0 ) -- �R�X��8
				SetFlag( OwnerID()  , 542539 , 0 ) -- �R�X��9
				SetFlag( OwnerID()  , 542540 , 0 ) -- �R�X��10
				SetFlag( OwnerID()  , 542541 , 0 ) -- �R�X��11
				SetFlag( OwnerID()  , 542530 , 1 ) -- ���X��0
			else
				if step10 == true then -- �p�G��step 10
					ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG06]", C_SYSTEM )--RA~
					Sleep(10) --2��
					ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG_RIGHT]", C_SYSTEM )--�A�����o�A�~��O���U�h�a�I
					SetFlag( OwnerID()  , 542541 , 1 ) -- �� Flag Q11
					SetFlag( OwnerID()  , 542540 , 0 ) -- �R Flag Q10
				end
			end	
		elseif Qhard03 == true then --Q�x��3   12 , 11, 10
			if step08 == true or step07 == true or step06 == true or step05 == true or step04 == true or step03 == true or step02 == true or step01 == true or step00 == true then
				ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG06]", C_SYSTEM )--RA~
				Sleep(10) --2��
				ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG_WRONG]", C_SYSTEM )--�A�����o�I�Э��s�ӹL�a�I
				SetFlag( OwnerID()  , 542531 , 0 ) -- �R�X��1
				SetFlag( OwnerID()  , 542532 , 0 ) -- �R�X��2
				SetFlag( OwnerID()  , 542533 , 0 ) -- �R�X��3
				SetFlag( OwnerID()  , 542534 , 0 ) -- �R�X��4
				SetFlag( OwnerID()  , 542535 , 0 ) -- �R�X��5
				SetFlag( OwnerID()  , 542536 , 0 ) -- �R�X��6
				SetFlag( OwnerID()  , 542537 , 0 ) -- �R�X��7
				SetFlag( OwnerID()  , 542538 , 0 ) -- �R�X��8
				SetFlag( OwnerID()  , 542539 , 0 ) -- �R�X��9
				SetFlag( OwnerID()  , 542540 , 0 ) -- �R�X��10
				SetFlag( OwnerID()  , 542541 , 0 ) -- �R�X��11
				SetFlag( OwnerID()  , 542530 , 1 ) -- ���X��0
			else
				if step11 == true then -- �p�G��step 11
					ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG06]", C_SYSTEM )--RA~
					Sleep(10) --2��
					ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG_ALLRIGHT]", C_SYSTEM )--���ߧA�����D���o�A�Ц^�h��[112590]�a�I
					SetFlag( OwnerID()  , 542524 , 1 ) -- �� �F���ؼ� �x��Flag 
					SetFlag( OwnerID()  , 542547 , 0 ) -- �R ���U�D�ԧx��Q3 		
					SetFlag( OwnerID()  , 542541 , 0 ) -- �R �X��11
					SetFlag( OwnerID()  , 542522 , 0 ) -- �R �X�� ���U�D�ԧx��
				else
					if step10 == true then -- �p�G��step 10
						ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG06]", C_SYSTEM )--RA~
						Sleep(10) --2��
						ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG_RIGHT]", C_SYSTEM )--�A�����o�A�~��O���U�h�a�I
						SetFlag( OwnerID()  , 542541 , 1 ) -- �� Flag Q11
						SetFlag( OwnerID()  , 542540 , 0 ) -- �R Flag Q10
					else
						if step09 == true then -- �p�G��step 09
							ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG06]", C_SYSTEM )--RA~
							Sleep(10) --2��
							ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG_RIGHT]", C_SYSTEM )--�A�����o�A�~��O���U�h�a�I
							SetFlag( OwnerID()  , 542540 , 1 ) -- �� Flag Q10
							SetFlag( OwnerID()  , 542539 , 0 ) -- �R Flag Q09
						end
					end
				end
			end
		elseif Qeasy01 == true then  --Q²��1  x
			ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG06]", C_SYSTEM )--RA~
			Sleep(10) --2��
			ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG_WRONG]", C_SYSTEM )--�A�����o�I�Э��s�ӹL�a�I
			SetFlag( OwnerID()  , 542531 , 0 ) -- �R�X��1
			SetFlag( OwnerID()  , 542532 , 0 ) -- �R�X��2
			SetFlag( OwnerID()  , 542533 , 0 ) -- �R�X��3
			SetFlag( OwnerID()  , 542534 , 0 ) -- �R�X��4
			SetFlag( OwnerID()  , 542535 , 0 ) -- �R�X��5
			SetFlag( OwnerID()  , 542536 , 0 ) -- �R�X��6
			SetFlag( OwnerID()  , 542537 , 0 ) -- �R�X��7
			SetFlag( OwnerID()  , 542538 , 0 ) -- �R�X��8
			SetFlag( OwnerID()  , 542539 , 0 ) -- �R�X��9
			SetFlag( OwnerID()  , 542540 , 0 ) -- �R�X��10
			SetFlag( OwnerID()  , 542541 , 0 ) -- �R�X��11
			SetFlag( OwnerID()  , 542530 , 1 ) -- ���X��0
		elseif Qeasy02 == true then --Q²��2     6.5
			if step06 == true or step03 == true or step02 == true or step01 == true or step00 == true then
				ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG06]", C_SYSTEM )--RA~
				Sleep(10) --2��
				ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG_WRONG]", C_SYSTEM )--�A�����o�I�Э��s�ӹL�a�I
				SetFlag( OwnerID()  , 542531 , 0 ) -- �R�X��1
				SetFlag( OwnerID()  , 542532 , 0 ) -- �R�X��2
				SetFlag( OwnerID()  , 542533 , 0 ) -- �R�X��3
				SetFlag( OwnerID()  , 542534 , 0 ) -- �R�X��4
				SetFlag( OwnerID()  , 542535 , 0 ) -- �R�X��5
				SetFlag( OwnerID()  , 542536 , 0 ) -- �R�X��6
				SetFlag( OwnerID()  , 542537 , 0 ) -- �R�X��7
				SetFlag( OwnerID()  , 542538 , 0 ) -- �R�X��8
				SetFlag( OwnerID()  , 542539 , 0 ) -- �R�X��9
				SetFlag( OwnerID()  , 542540 , 0 ) -- �R�X��10
				SetFlag( OwnerID()  , 542541 , 0 ) -- �R�X��11
				SetFlag( OwnerID()  , 542530 , 1 ) -- ���X��0
			else
				if step05 == true then -- �p�G��step 05
					ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG06]", C_SYSTEM )--RA~
					Sleep(10) --2��
					ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG_RIGHT]", C_SYSTEM )--�A�����o�A�~��O���U�h�a�I
					SetFlag( OwnerID()  , 542536 , 1 ) -- �� Flag Q06
					SetFlag( OwnerID()  , 542535 , 0 ) -- �R Flag Q05
				else
					if step04 == true then -- �p�G��step 04
						ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG06]", C_SYSTEM )--RA~
						Sleep(10) --2��
						ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG_RIGHT02]", C_SYSTEM )--�A�t�@�I�N�L���F�A�[�o��I�I
						SetFlag( OwnerID()  , 542535 , 1 ) -- �� Flag Q05
						SetFlag( OwnerID()  , 542534 , 0 ) -- �R Flag Q04
					end
				end
			end
		elseif Qeasy03 == true then --Q²��2     7, 6
			if step04 == true or step03 == true or step02 == true or step01 == true or step00 == true then
				ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG06]", C_SYSTEM )--RA~
				Sleep(10) --2��
				ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG_WRONG]", C_SYSTEM )--�A�����o�I�Э��s�ӹL�a�I
				SetFlag( OwnerID()  , 542531 , 0 ) -- �R�X��1
				SetFlag( OwnerID()  , 542532 , 0 ) -- �R�X��2
				SetFlag( OwnerID()  , 542533 , 0 ) -- �R�X��3
				SetFlag( OwnerID()  , 542534 , 0 ) -- �R�X��4
				SetFlag( OwnerID()  , 542535 , 0 ) -- �R�X��5
				SetFlag( OwnerID()  , 542536 , 0 ) -- �R�X��6
				SetFlag( OwnerID()  , 542537 , 0 ) -- �R�X��7
				SetFlag( OwnerID()  , 542538 , 0 ) -- �R�X��8
				SetFlag( OwnerID()  , 542539 , 0 ) -- �R�X��9
				SetFlag( OwnerID()  , 542540 , 0 ) -- �R�X��10
				SetFlag( OwnerID()  , 542541 , 0 ) -- �R�X��11
				SetFlag( OwnerID()  , 542530 , 1 ) -- ���X��0
			else
				if step06 == true then -- �p�G��step 06
					ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG06]", C_SYSTEM )--RA~
					Sleep(10) --2��
					ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG_ALLRIGHT]", C_SYSTEM )--���ߧA�����D���o�A�Ц^�h��[112590]�a�I
					SetFlag( OwnerID()  , 542523 , 1 ) -- �� �F���ؼ� ²��Flag 
					SetFlag( OwnerID()  , 542544 , 0 ) -- �R ���U�D��²��Q3 		
					SetFlag( OwnerID()  , 542536 , 0 ) -- �R �X��06
					SetFlag( OwnerID()  , 542521 , 0 ) -- �R �X�� ���U�D��²��
				else
					if step05 == true then -- �p�G��step 05
						ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG06]", C_SYSTEM )--RA~
						Sleep(10) --2��
						ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG_RIGHT]", C_SYSTEM )--�A�����o�A�~��O���U�h�a�I
						SetFlag( OwnerID()  , 542536 , 1 ) -- �� Flag Q06
						SetFlag( OwnerID()  , 542535 , 0 ) -- �R Flag Q05
					end
				end
			end
		else
			ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG06]", C_SYSTEM )--RA~
		end
end		