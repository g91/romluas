--�`�y���� 5��R�ָ`  ���Ŷ���
--�إ߮ɶ�: 2009/04/16
--�ק���: 2009/04/30
--�إߪ�  : ���ʥ��� ��ʨ�
------------------------------------------------------------------------------
--4/30 �ק� ����x3
------------------------------------------------------------------------------
--��l�@�� ����NPC 112591 �~�J�D�֭Cù Z2�Z��ǵ����~  Z6 ���`�ۭn��_�� �]�k�}��
------------------------------------------------------------------------------
function LuaN_musicfes_magicintro()
	SetSpeakDetail(OwnerID(), "[SC_MUSICFES_CODE23]" )--ť���̪�o�̨C�Ѥ@��<CS>14�G00</CS>(��)
end
------------------------------------------------------------------------------
--���b ����NPC 112590 ���Ǵ��D�p�S  �Z��R����   CODE
------------------------------------------------------------------------------
function LuaN_musicfes_code00() --NPC ���Ǵ�
	SetSpeakDetail(OwnerID(), "[SC_MUSICFES_CODE00]" )--NPC��� �Ӭݬݤ��~���R�ָ`�����Ǭ��ʧa��I
	AddSpeakOption(OwnerID(), TargetID(), "[SC_MUSICFES_CODE01]", "LuaN_musicfes_code01", 0) --���󭵲Ŷ��謡��
	AddSpeakOption(OwnerID(), TargetID(), "[SC_MUSICFES_CODE02]", "LuaN_musicfes_code02", 0) --�����]�k�}�@�ì���
end
------------------------------------------------------------------------------
function LuaN_musicfes_code01() --���󭵲Ŷ��謡��
	local Aeasy= CheckFlag(OwnerID()  , 542521) -- ���U�D��²��  
	local Ahard= CheckFlag(OwnerID()  , 542522) -- ���U�D�ԧx��  
	local todayH= CheckFlag(OwnerID()  , 542526) -- ���ѹL���x��Flag 
	local todayE= CheckFlag(OwnerID()  , 542525) -- ���ѹL��²��Flag 
	local Dhard  = CheckFlag(OwnerID()  , 542524) -- �F���ؼ� �x��Flag 
	local Deasy= CheckFlag(OwnerID()  , 542523) -- �F���ؼ� ²�� Flag  
	if todayH == false or todayE == false then
		if Aeasy == false and Ahard == false then
			SetSpeakDetail(OwnerID(), "[SC_MUSICFES_CODE06]" )--NPC��� ���Ŷ��謡�ʤ���
			if Dhard == false and Deasy == false then --
				AddSpeakOption(OwnerID(), TargetID(), "[SC_MUSICFES_CODE03]", "LuaN_musicfes_code03", 0) --���W���Ŷ��謡��
			end
		end
	else
			SetSpeakDetail(OwnerID(), "[SC_MUSICFES_CODE06]" )--NPC��� ���Ŷ��謡�ʤ���
	end
	if  Dhard == true or Deasy == true then --
		SetSpeakDetail(OwnerID(), "[SC_MUSICFES_CODE31]" )--�A�w�g�����t���F�ܡH
		AddSpeakOption(OwnerID(), TargetID(), "[SC_MUSICFES_CODE04]", "LuaN_musicfes_code04", 0) --�^�����Ŷ��謡��
	end
	if Aeasy == true or Ahard == true then
			SetSpeakDetail(OwnerID(), "[SC_MUSICFES_CODE31]" )--�A�w�g�����t���F�ܡH
			AddSpeakOption(OwnerID(), TargetID(), "[SC_MUSICFES_CODE05]", "LuaN_musicfes_code07", 0) --�ڷQ�A�ݤ@���D��
			AddSpeakOption(OwnerID(), TargetID(), "[SC_MUSICFES_CODE26]", "LuaN_musicfes_code08", 0) --�ڷQ���o���D��
	end
	AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_musicfes_code00", 0 ) --�^��W�@�� 
end
------------------------------------------------------------------------------
function LuaN_musicfes_code02() --�����]�k�}�@�ì���
	SetSpeakDetail( OwnerID(), "[SC_MUSICFES_CODE07]" )--NPC��� �]�k�}�@�ì��ʤ���
	AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_musicfes_code00", 0 ) --�^��W�@�� 
end
------------------------------------------------------------------------------
function LuaN_musicfes_code03() --���W���Ŷ��謡��
	local todayH= CheckFlag(OwnerID()  , 542526) -- ���ѹL���x��Flag 
	local todayE= CheckFlag(OwnerID()  , 542525) -- ���ѹL��²��Flag 
	SetSpeakDetail( OwnerID(), "[SC_MUSICFES_CODE08]" )--�A�Q�D�ԭ������שO�H
	if todayE == false then
		AddSpeakOption( OwnerID(), TargetID(), "[SC_MUSICFES_CODE09]", "LuaN_musicfes_code05", 0) --²��۫�
	end
	if todayH == false then
		AddSpeakOption( OwnerID(), TargetID(), "[SC_MUSICFES_CODE10]", "LuaN_musicfes_code06", 0) --�x���۫�
	end
	AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_musicfes_code01", 0 ) --�^��W�@�� 
end
------------------------------------------------------------------------------
function LuaN_musicfes_code04() --�^�����Ŷ��謡��
	local Deasy= CheckFlag(OwnerID()  , 542523) -- �F���ؼ� ²�� Flag  �R���I:�^�����ʮ�
	local Dhard  = CheckFlag(OwnerID()  , 542524) -- �F���ؼ� �x��Flag   �R���I:�^�����ʮ�
	if Deasy == true then	
		SetSpeakDetail(OwnerID(), "[SC_MUSICFES_CODE12]" )--�o�u�O�@�q�������۫߰ڡI����ܧڪ��P�¡A�ЧA���U�o�ǭ��ŧa��I
		GiveBodyItem(OwnerID(), 204428 , 1 ) --����x1
		SetFlag(OwnerID()  , 542525 , 1 ) -- �����a ���Ѥw�����L���ʺX��-²��
		SetFlag( OwnerID()  , 542523 , 0 ) -- �R �F���ؼ� ²��Flag 
		SetFlag( OwnerID()  , 542521 , 0 ) -- �R ���U�D��²��
		SetFlag( OwnerID()  , 542542 , 0 ) -- �R ²��Q1
		SetFlag( OwnerID()  , 542543 , 0 ) -- �R ²��Q2
		SetFlag( OwnerID()  , 542544 , 0 ) -- �R ²��Q3
	elseif Dhard == true then
		SetSpeakDetail(OwnerID(), "[SC_MUSICFES_CODE13]" )-- �n�[�S��ť��o��X�⪺�t���ڡI����ܧڪ��P�¡A�ЧA���U�o�ǭ��ŧa��I
		GiveBodyItem(OwnerID(), 204428 , 3 ) --����x3
		SetFlag(OwnerID()  , 542526 , 1 ) -- �����a ���Ѥw�����L���ʺX��-�x��
		SetFlag( OwnerID()  , 542522 , 0 ) -- �R ���U�D�ԧx��
		SetFlag( OwnerID()  , 542524 , 0 ) -- �R �F���ؼ� �x��Flag
		SetFlag( OwnerID()  , 542545 , 0 ) -- �R �x��Q1
		SetFlag( OwnerID()  , 542546 , 0 ) -- �R �x��Q2
		SetFlag( OwnerID()  , 542547 , 0 ) -- �R �x��Q3
	end
end

------------------------------------------------------------------------------
function LuaN_musicfes_code05() --���W²��۫�
	local Aeasy= CheckFlag(OwnerID() , 542521) -- ���U�D��²��  �R���I:�����̫ᶥ�q��
	local Ahard= CheckFlag(OwnerID() , 542522) -- ���U�D�ԧx��  �R���I: �����̫ᶥ�q��
	local todayE= CheckFlag(OwnerID() , 542525) -- ���ѹL��²��Flag  �R���I: �����̫ᶥ�q��
	local Deasy= CheckFlag(OwnerID()  , 542523) -- �F���ؼ� ²�� Flag  �R���I:�^�����ʮ�

	if todayE == true then
		SetSpeakDetail(OwnerID(), "[SC_MUSICFES_CODE15]" )--�A���Ѥw�g�D�ԹL�o��I
		AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_musicfes_code00", 0 ) --�^��W�@�� 
	else
		if Aeasy == true then
			SetSpeakDetail(OwnerID(), "[SC_MUSICFES_CODE16]" )--�A�w�g���W�L�o��I
			AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_musicfes_code00", 0 ) --�^��W�@�� 
		else
			if Ahard == true then
				SetSpeakDetail(OwnerID(), "[SC_MUSICFES_CODE20]" )--�A���b�i���L���ת������o�A�е�����A�ӬD�ԡC
				AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_musicfes_code00", 0 ) --�^��W�@�� 
			else
				if Deasy == true then
					SetSpeakDetail(OwnerID(), "[SC_MUSICFES_CODE16]" )--�A�w�g���W�L�o��I
					AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_musicfes_code00", 0 ) --�^��W�@�� 
				else

					local RANDOWN = rand(100)
					if RANDOWN >= 0 and  RANDOWN <=30  then  -- easy 1
						SetSpeakDetail(OwnerID(), "[SC_MUSICFES_CODE17_1]" )-- ²�檩�D��1  " DO��RE MI DO��MI DO MI��� "
						SetFlag(OwnerID()  , 542542 , 1 ) -- ���U�D��²��Q1 
						SetFlag(OwnerID()  , 542521 , 1 ) -- ���U�D��²�� 
						SetFlag(OwnerID()  , 542530 , 1 ) -- step 00 
						BeginPlot(OwnerID() , "LuaN_musicfes_close1" , 100 )   
					elseif RANDOWN >= 31 and  RANDOWN <=60 then  --easy 2
						SetSpeakDetail(OwnerID(), "[SC_MUSICFES_CODE17_2]" )--  ²�檩�D��2  " DO DO SO SO RA RA SO��� "
						SetFlag(OwnerID()  , 542543 , 1 ) -- ���U�D��²��Q2
						SetFlag(OwnerID()  , 542521 , 1 ) -- ���U�D��²��
						SetFlag(OwnerID()  , 542530 , 1 ) -- step 00 
						BeginPlot(OwnerID() , "LuaN_musicfes_close1" , 100 )   
					elseif RANDOWN >= 61 and  RANDOWN <=100 then  --easy 3
						SetSpeakDetail(OwnerID(), "[SC_MUSICFES_CODE17_3]" )--  ²�檩�D��3  " DO��DO MI SO SHI RA RA��� "
						SetFlag( OwnerID()  , 542544 , 1 ) -- ���U�D��²��Q3
						SetFlag( OwnerID()  , 542521 , 1 ) -- ���U�D��²�� 
						SetFlag( OwnerID()  , 542530 , 1 ) -- step 00 
						BeginPlot(OwnerID() , "LuaN_musicfes_close1" , 100 )   
					end
				end

			end
		end
	end
end
------------------------------------------------------------------------------
function LuaN_musicfes_code06() --���W�x���۫�  
	local Aeasy= CheckFlag(OwnerID()  , 542521) -- ���U�D��²��  �R���I:�����̫ᶥ�q��
	local Ahard= CheckFlag(OwnerID()  , 542522) -- ���U�D�ԧx��  
	local todayH= CheckFlag(OwnerID()  , 542526) -- ���ѹL���x��Flag 
	local Dhard  = CheckFlag(OwnerID()  , 542524) -- �F���ؼ� �x��Flag   �R���I:�^�����ʮ�

	if todayH == true then
		SetSpeakDetail(OwnerID(), "[SC_MUSICFES_CODE15]" )--�A���Ѥw�g�D�ԹL�o��I
		AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_musicfes_code00", 0 ) --�^��W�@�� 
	else
		if Ahard == true then
			SetSpeakDetail(OwnerID(), "[SC_MUSICFES_CODE16]" )--�A�w�g���W�L�o��I
			AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_musicfes_code00", 0 ) --�^��W�@�� 
		else
			if Aeasy == true then
				SetSpeakDetail(OwnerID(), "[SC_MUSICFES_CODE20]" )--�A���b�i���L���ת������o�A�е�����A�ӬD�ԡC
				AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_musicfes_code00", 0 ) --�^��W�@�� 
			else
				if Dhard == true then
					SetSpeakDetail(OwnerID(), "[SC_MUSICFES_CODE16]" )--�A�w�g���W�L�o��I
					AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_musicfes_code00", 0 ) --�^��W�@�� 
				else
					local RANDOWN = rand(100)
					if RANDOWN >= 0 and  RANDOWN <=30  then  -- �x��Q1
						SetSpeakDetail(OwnerID(), "[SC_MUSICFES_CODE18_1]" )-- �x�����D��1  " SO��SO RA SO FA MI���MI��MI FA MI RE DO��� "
						SetFlag( OwnerID()  , 542545 , 1 ) -- ���U�D�ԧx��Q1 
						SetFlag( OwnerID()  , 542522 , 1 ) -- ���U�D�ԧx�� 
						SetFlag( OwnerID()  , 542530 , 1 ) -- step 00 
						BeginPlot(OwnerID() , "LuaN_musicfes_close1" , 100 )   
					elseif RANDOWN >= 31 and  RANDOWN <=60 then  --�x��2
						SetSpeakDetail(OwnerID(), "[SC_MUSICFES_CODE18_2]" )--  �x�����D��2  " MI MI SO��MI MI SO��MI SO DO SHI RA SO��� "
						SetFlag( OwnerID()  , 542546 , 1 ) -- ���U�D�ԧx��Q2
						SetFlag( OwnerID()  , 542522 , 1 ) -- ���U�D�ԧx��
						SetFlag( OwnerID()  , 542530 , 1 ) -- step 00 
						BeginPlot(OwnerID() , "LuaN_musicfes_close1" , 100 )   
					elseif RANDOWN >= 61 and  RANDOWN <=100 then  --�x��3
						SetSpeakDetail(OwnerID(), "[SC_MUSICFES_CODE18_3]" )--  �x�����D��3  " DO SO SO SO FA MI RE DO��DO RA RA RA��� "
						SetFlag( OwnerID()  , 542547 , 1 ) -- ���U�D�ԧx��Q3
						SetFlag( OwnerID()  , 542522 , 1 ) -- ���U�D�ԧx�� 
						SetFlag( OwnerID()  , 542530 , 1 ) -- step 00 
						BeginPlot(OwnerID() , "LuaN_musicfes_close1" , 100 )   
					end
				end

			end
		end
	end
end
------------------------------------------------------------------------------
function LuaN_musicfes_code07() --�ڷQ�A�ݤ@���D��
	local Qhard01= CheckFlag(OwnerID()  , 542545) -- ���U�D�ԧx��Q1   �R���I: �����̫ᶥ�q��
	local Qhard02= CheckFlag(OwnerID()  , 542546) -- ���U�D�ԧx��Q2  
	local Qhard03= CheckFlag(OwnerID()  , 542547) -- ���U�D�ԧx��Q3   
	local Qeasy01= CheckFlag(OwnerID()  , 542542) -- ���U�D��²��Q1   
	local Qeasy02= CheckFlag(OwnerID()  , 542543) -- ���U�D��²��Q2   
	local Qeasy03= CheckFlag(OwnerID()  , 542544) -- ���U�D��²��Q3  
	local Aeasy= CheckFlag(OwnerID()  , 542521) -- ���U�D��²��  �R���I:�����̫ᶥ�q��
	local Ahard= CheckFlag(OwnerID()  , 542522) -- ���U�D�ԧx��  
	local todayH= CheckFlag(OwnerID()  , 542526) -- ���ѹL���x��Flag 
	local Aeasy= CheckFlag(OwnerID()  , 542521) -- ���U�D��²��  
	local Ahard= CheckFlag(OwnerID()  , 542522) -- ���U�D�ԧx��  
	local todayE= CheckFlag(OwnerID()  , 542525) -- ���ѹL��²��Flag  
	local hard2= CheckFlag(OwnerID()  , 542558) -- ���ѬݹL�ĤG���x�����D��
	local hard3= CheckFlag(OwnerID()  , 542559) -- ���ѬݹL�ĤT���x�����D��


	if todayH == true and todayE == true then
		SetSpeakDetail(OwnerID(), "[SC_MUSICFES_CODE15]" )--�A���Ѥw�g�D�ԹL�o��I
		AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_musicfes_code01", 0 ) --�^��W�@�� 
	elseif Ahard == true then --�p�G���W���x�����X��
		if hard3 == true then --���ѬݹL�ĤT���x�����D��
			SetSpeakDetail(OwnerID(), "[SC_MUSICFES_CODE19]" )--��p�A�A�����[���D�ت����Ƥw�g�Χ��F��I
			AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_musicfes_code01", 0 ) --�^��W�@�� 
		elseif hard2 == true then --���ѬݹL�ĤG���x�����D��
			if  Qhard01 == true then
				SetSpeakDetail(OwnerID(), "[SC_MUSICFES_CODE18_1]" )-- �x�����D��1  " SO��SO RA SO FA MI���MI��MI FA MI RE DO��� "
				SetFlag(OwnerID()  , 542559 , 1 ) -- �� ���ѬݹL�ĤT���x�����D��
				BeginPlot(OwnerID() , "LuaN_musicfes_close1" , 100 )   
			elseif Qhard02 == true then
				SetSpeakDetail(OwnerID(), "[SC_MUSICFES_CODE18_2]" )-- �x�����D��2  " MI MI SO��MI MI SO��MI SO DO SHI RA SO��� "
				SetFlag(OwnerID()  , 542559 , 1 ) -- �� ���ѬݹL�ĤT���x�����D��
				BeginPlot(OwnerID() , "LuaN_musicfes_close1" , 100 )   
			elseif Qhard03 == true then
				SetSpeakDetail(OwnerID(), "[SC_MUSICFES_CODE18_3]" )-- �x�����D��3  " DO SO SO SO FA MI RE DO��DO RA RA RA��� "
				SetFlag(OwnerID()  , 542559 , 1 ) -- �� ���ѬݹL�ĤT���x�����D��
				BeginPlot(OwnerID() , "LuaN_musicfes_close1" , 100 )   
			end
		else
			if  Qhard01 == true then
				SetSpeakDetail(OwnerID(), "[SC_MUSICFES_CODE18_1]" )-- �x�����D��1  " SO��SO RA SO FA MI���MI��MI FA MI RE DO��� "
				SetFlag(OwnerID()  , 542558 , 1 ) -- �� ���ѬݹL�ĤG���x�����D��
				BeginPlot(OwnerID() , "LuaN_musicfes_close1" , 100 )   
			elseif Qhard02 == true then
				SetSpeakDetail(OwnerID(), "[SC_MUSICFES_CODE18_2]" )-- �x�����D��2  " MI MI SO��MI MI SO��MI SO DO SHI RA SO��� "
				SetFlag(OwnerID()  , 542558 , 1 ) -- �� ���ѬݹL�ĤG���x�����D��
				BeginPlot(OwnerID() , "LuaN_musicfes_close1" , 100 )   
			elseif Qhard03 == true then
				SetSpeakDetail(OwnerID(), "[SC_MUSICFES_CODE18_3]" )-- �x�����D��3  " DO SO SO SO FA MI RE DO��DO RA RA RA��� "
				SetFlag(OwnerID()  , 542558 , 1 ) -- �� ���ѬݹL�ĤG���x�����D��
				BeginPlot(OwnerID() , "LuaN_musicfes_close1" , 100 )   
			end
		end
	elseif Aeasy == true then --�p�G���W��²�檩�X��
		if Qeasy01 == true then		
			SetSpeakDetail(OwnerID(), "[SC_MUSICFES_CODE17_1]" )-- ²�檩�D��1  " DO��RE MI DO��MI DO MI��� "
			BeginPlot(OwnerID() , "LuaN_musicfes_close1" , 100 )   
		elseif Qeasy02 == true then
			SetSpeakDetail(OwnerID(), "[SC_MUSICFES_CODE17_2]" )--  ²�檩�D��2  " DO DO SO SO RA RA SO��� "
			BeginPlot(OwnerID() , "LuaN_musicfes_close1" , 100 )   
		elseif Qeasy03 == true then
			SetSpeakDetail(OwnerID(), "[SC_MUSICFES_CODE17_3]" )--  ²�檩�D��3  " DO��DO MI SO SHI RA RA��� 
			BeginPlot(OwnerID() , "LuaN_musicfes_close1" , 100 )    				
		end
	else
		SetSpeakDetail(OwnerID(), "[SC_MUSICFES_CODE21]" )--�A�٨S�ѥ[�o�Ӭ��ʳ�I
		AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]" , "LuaN_musicfes_code01", 0 ) --�^��W�@�� 

	end
end
------------------------------------------------------------------------------
function LuaN_musicfes_close1() --��������
	CloseSpeak(OwnerID())   --������ܵ���
end
------------------------------------------------------------------------------
function LuaN_musicfes_code08() --�ڷQ���o���D��
	local Qhard01= CheckFlag(OwnerID()  , 542545) -- ���U�D�ԧx��Q1   �R���I: �����̫ᶥ�q��
	local Qhard02= CheckFlag(OwnerID()  , 542546) -- ���U�D�ԧx��Q2  
	local Qhard03= CheckFlag(OwnerID()  , 542547) -- ���U�D�ԧx��Q3  
 
	local Qeasy01= CheckFlag(OwnerID()  , 542542) -- ���U�D��²��Q1   
	local Qeasy02= CheckFlag(OwnerID()  , 542543) -- ���U�D��²��Q2   
	local Qeasy03= CheckFlag(OwnerID()  , 542544) -- ���U�D��²��Q3  

	local Aeasy= CheckFlag(OwnerID()  , 542521) -- ���U�D��²��  �R���I:�����̫ᶥ�q��
	local Ahard= CheckFlag(OwnerID()  , 542522) -- ���U�D�ԧx��  

	local hard2= CheckFlag(OwnerID()  , 542558) -- ���ѬݹL�ĤG���x�����D��
	local hard3= CheckFlag(OwnerID()  , 542559) -- ���ѬݹL�ĤT���x�����D��

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

	if Aeasy == false and Ahard == false then --�Sflag
		SetSpeakDetail(OwnerID(), "[SC_MUSICFES_CODE24]" )--�A�S���ѥ[����@�����ת����ʳ�I
	elseif Ahard == true then --���x����flag
		SetSpeakDetail(OwnerID(), "[SC_MUSICFES_CODE25]" )--�A�w�g���o�����ת������o�I
		SetFlag(OwnerID()  , 542545 , 0 ) -- �R���a �x��Q1 Flag 
		SetFlag(OwnerID()  , 542546 , 0 ) -- �R���a �x��Q2 Flag 
		SetFlag(OwnerID()  , 542547 , 0 ) -- �R���a �x��Q3 Flag 
		SetFlag(OwnerID()  , 542522 , 0 ) -- �R���a �x�� Flag
		SetFlag(OwnerID()  , 542530 , 0 ) -- �R���a �D��00 Flag
		SetFlag(OwnerID()  , 542531 , 0 ) -- �R���a �D��01 Flag
		SetFlag(OwnerID()  , 542532 , 0 ) -- �R���a �D��02 Flag
		SetFlag(OwnerID()  , 542533 , 0 ) -- �R���a �D��03 Flag
		SetFlag(OwnerID()  , 542534 , 0 ) -- �R���a �D��04 Flag
		SetFlag(OwnerID()  , 542535 , 0 ) -- �R���a �D��05 Flag
		SetFlag(OwnerID()  , 542536 , 0 ) -- �R���a �D��06 Flag
		SetFlag(OwnerID()  , 542537 , 0 ) -- �R���a �D��07 Flag
		SetFlag(OwnerID()  , 542538 , 0 ) -- �R���a �D��08 Flag
		SetFlag(OwnerID()  , 542539 , 0 ) -- �R���a �D��09 Flag
		SetFlag(OwnerID()  , 542540 , 0 ) -- �R���a �D��10 Flag
		SetFlag(OwnerID()  , 542541 , 0 ) -- �R���a �D��11 Flag
		SetFlag(OwnerID()  , 542558 , 0 ) -- ���ѬݹL�ĤG���x�����D��
		SetFlag(OwnerID()  , 542559 , 0 ) -- ���ѬݹL�ĤT���x�����D��
		SetFlag(OwnerID()  , 542524 , 0 ) -- �R���a �F���ؼ� �x��Flag
	elseif Aeasy == true then --��²�檩flag
		SetSpeakDetail(OwnerID(), "[SC_MUSICFES_CODE25]" )--�A�w�g���o�����ת������o�I
		SetFlag(OwnerID()  , 542542 , 0 ) -- �R���a ²��Q1 Flag 
		SetFlag(OwnerID()  , 542543 , 0 ) -- �R���a ²��Q2 Fla 
		SetFlag(OwnerID()  , 542544 , 0 ) -- �R���a ²��Q3 Fla
		SetFlag(OwnerID()  , 542521 , 0 ) -- �R���a ²�� Flag
		SetFlag(OwnerID()  , 542530 , 0 ) -- �R���a �D��00 Flag
		SetFlag(OwnerID()  , 542531 , 0 ) -- �R���a �D��01 Flag
		SetFlag(OwnerID()  , 542532 , 0 ) -- �R���a �D��02 Flag
		SetFlag(OwnerID()  , 542533 , 0 ) -- �R���a �D��03 Flag
		SetFlag(OwnerID()  , 542534 , 0 ) -- �R���a �D��04 Flag
		SetFlag(OwnerID()  , 542535 , 0 ) -- �R���a �D��05 Flag
		SetFlag(OwnerID()  , 542536 , 0 ) -- �R���a �D��06 Flag
		SetFlag(OwnerID()  , 542537 , 0 ) -- �R���a �D��07 Flag
		SetFlag(OwnerID()  , 542538 , 0 ) -- �R���a �D��08 Flag
		SetFlag(OwnerID()  , 542539 , 0 ) -- �R���a �D��09 Flag
		SetFlag(OwnerID()  , 542540 , 0 ) -- �R���a �D��10 Flag
		SetFlag(OwnerID()  , 542541 , 0 ) -- �R���a �D��11 Flag
		SetFlag(OwnerID()  , 542523 , 0 ) -- �R���a �F���ؼ� ²��Flag
	end		
end
------------------------------------------------------------------------------