--�`�y���� 5��R�ָ`  ���Ŷ���
--�إ߮ɶ�: 2009/04/16
--�ק���: 2009/04/27
--�إߪ�  : ���ʥ��� ��ʨ�
------------------------------------------------------------------------------
--���b ����NPC   (1��   DO)  112771  CODE
------------------------------------------------------------------------------
function LuaN_musicfes_112771_range()  
		SetPlot( OwnerID(), "touch", "LuaN_musicfes_112771_sing", 50 );
end
------------------------------------------------------------------------------
function LuaN_musicfes_112771_sing()
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

	PlaySoundToPlayer( OwnerID() , "sound/sound_new/skill/Music_Festival/scale/1.mp3", false )  --2011.04.11 NEW SOUND

		if Qhard01 == true then --Q�x��1  12
			if step10== true or step09== true or step08== true or step07== true or step06== true or step05== true or step04== true or step03== true or step02 == true or step01 == true or step00 == true then
				ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG01]", C_SYSTEM )--DO~
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
					ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG01]", C_SYSTEM )--DO~
					ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG_ALLRIGHT]", C_SYSTEM )--���ߧA�����D���o�A�Ц^�h��[112590]�a�I
					SetFlag( OwnerID()  , 542524 , 1 ) -- �� �F���ؼ� �x��Flag 
					SetFlag( OwnerID()  , 542545 , 0 ) -- �R ���U�D�ԧx��Q1 		
					SetFlag( OwnerID()  , 542541 , 0 ) -- �R �X��11
					SetFlag( OwnerID()  , 542522 , 0 ) -- �R �X�� ���U�D�ԧx��
				end
			end
		elseif Qhard02 == true then --Q�x��2  9
			if step11 == true or step10 == true or step09 == true or step07 == true or step06 == true or step05 == true or step04 == true or step03 == true or step02 == true or step01 == true or step00 == true then
				ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG01]", C_SYSTEM )--DO~
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
				if step08 == true then  -- �p�G��step 08
					ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG01]", C_SYSTEM )--DO~
					ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG_RIGHT02]", C_SYSTEM )--�A�t�@�I�N�L���F�A�[�o��I�I
					SetFlag( OwnerID()  , 542539 , 1 ) -- �� Flag Q9 
					SetFlag( OwnerID()  , 542538 , 0 ) -- �R Flag Q8 			
				end
			end
		elseif Qhard03 == true then --Q�x��3  9.8.1
			if step11== true or step10== true or step09== true or step06 == true or step05== true or step04== true or step03 == true or step02 == true or step01 == true then
				ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG01]", C_SYSTEM )--DO~
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
				if step08== true then
					ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG01]", C_SYSTEM )--DO~
					ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG_RIGHT02]", C_SYSTEM )--�A�t�@�I�N�L���F�A�[�o��I�I
					SetFlag( OwnerID()  , 542539 , 1 ) -- �� Flag Q9 
					SetFlag( OwnerID()  , 542538 , 0 ) -- �R Flag Q8 
				else
					if step07== true then
						ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG01]", C_SYSTEM )--DO~
						ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG_RIGHT]", C_SYSTEM )--�A�����o�A�~��O���U�h�a�I
						SetFlag( OwnerID()  , 542538 , 1 ) -- �� Flag Q8
						SetFlag( OwnerID()  , 542537 , 0 ) -- �R Flag Q7 
					else
						if step00== true then
							ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG01]", C_SYSTEM )--DO~
							ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG_RIGHT]", C_SYSTEM )--�A�����o�A�~��O���U�h�a�I
							SetFlag( OwnerID()  , 542531 , 1 ) -- �� Flag Q01
							SetFlag( OwnerID()  , 542530 , 0 ) -- �R Flag Q00 
						end
					end
				end
			end
		elseif Qeasy01 == true then  --Q²��1  6.4.1
			if step06 == true or step04 == true or step02 == true or step01 == true then
				ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG01]", C_SYSTEM )--DO~
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
				if step05== true then
					ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG01]", C_SYSTEM )--DO~
					ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG_RIGHT]", C_SYSTEM )--�A�����o�A�~��O���U�h�a�I
					SetFlag( OwnerID()  , 542536 , 1 ) -- �� Flag Q6
					SetFlag( OwnerID()  , 542535 , 0 ) -- �R Flag Q5
				else
					if step03== true then
						ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG01]", C_SYSTEM )--DO~
						ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG_RIGHT]", C_SYSTEM )--�A�����o�A�~��O���U�h�a�I
						SetFlag( OwnerID()  , 542534 , 1 ) -- �� Flag Q
						SetFlag( OwnerID()  , 542533 , 0 ) -- �R Flag Q3 
					else
						if step00== true then
							ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG01]", C_SYSTEM )--DO~
							ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG_RIGHT]", C_SYSTEM )--�A�����o�A�~��O���U�h�a�I
							SetFlag( OwnerID()  , 542531 , 1 ) -- �� Flag Q01
							SetFlag( OwnerID()  , 542530 , 0 ) -- �R Flag Q00 
						end
					end
				end
			end
		elseif Qeasy02 == true then  -- 2 , 1
			if step06 == true or step05 == true or step04 == true or step03 == true or step02 == true then
				ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG01]", C_SYSTEM )--DO~
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
				if step01 == true then
					ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG01]", C_SYSTEM )--DO~
					ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG_RIGHT]", C_SYSTEM )--�A�����o�A�~��O���U�h�a�I
					SetFlag( OwnerID()  , 542532 , 1 ) -- �� Flag Q2
					SetFlag( OwnerID()  , 542531 , 0 ) -- �R Flag Q1 
				else
					if step00== true then
						ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG01]", C_SYSTEM )--DO~
						ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG_RIGHT]", C_SYSTEM )--�A�����o�A�~��O���U�h�a�I
						SetFlag( OwnerID()  , 542531 , 1 ) -- �� Flag Q01
						SetFlag( OwnerID()  , 542530 , 0 ) -- �R Flag Q00 
					end
				end
			end
		elseif Qeasy03 == true then  -- 2 , 1	
			if step06 == true or step05 == true or step04 == true or step03 == true or step02 == true then
	 			ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG01]", C_SYSTEM )--DO~
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
				if step01 == true then
					ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG01]", C_SYSTEM )--DO~
					ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG_RIGHT]", C_SYSTEM )--�A�����o�A�~��O���U�h�a�I
					SetFlag( OwnerID()  , 542532 , 1 ) -- �� Flag Q2
					SetFlag( OwnerID()  , 542531 , 0 ) -- �R Flag Q1 
				else
					if step00== true then
						ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG01]", C_SYSTEM )--DO~
						ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG_RIGHT]", C_SYSTEM )--�A�����o�A�~��O���U�h�a�I
						SetFlag( OwnerID()  , 542531 , 1 ) -- �� Flag Q01
						SetFlag( OwnerID()  , 542530 , 0 ) -- �R Flag Q00 
					end
				end
			end		
		else
			ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_MUSICFES_SONG01]", C_SYSTEM )--DO~
		end
end
------------------------------------------------------------------------------