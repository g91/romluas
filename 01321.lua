function LuaDan_112756_0()
	
	SetSpeakDetail(OwnerID(), "[SC_DAN_112756_1]" )					  --�I������ܤ��e
	AddSpeakOption(OwnerID(), TargetID(), "[SC_DAN_112756_2]", "Lua_Dan_112756_1", 0) --�ڭn�e�^���ֲ� --����
	AddSpeakOption(OwnerID(), TargetID(), "[SC_DAN_112756_3]", "Lua_Dan_112756_2", 0) --�ڭn�I���ζ����y --����
end

---------------------------------------------------------------------------------------------------
function Lua_Dan_112756_1() --�������y
	
	local Flag1 =	 CheckFlag(OwnerID()  , 542520)                                         --�Ĥ@��������
	local Flag2 =	 CheckFlag(OwnerID()  , 542527)                                         --�ĤG��������
	local Flag3 =	 CheckFlag(OwnerID()  , 542528)                                         --�ĤT��������
	local Signflag1 = CheckFlag(OwnerID()  , 542529)
	local Signflag2 = CheckFlag(OwnerID()  , 542548)
	local Signflag3 = CheckFlag(OwnerID()  , 542549)
	local FinishMission = CheckFlag(OwnerID()  , 542550)    				--�w�g�������ְ��N����
	local Musicbox  = CountBodyItem( OwnerID() , 204426)
	local locationpapaer =  CountBodyItem( OwnerID() , 204604 ) --�a�z��T
	
	if FinishMission == false then
		
		if Flag1 == true then           --���L����
				
				if Musicbox ~= 0 and Signflag1 == true and Signflag2 == true and Signflag3 == true then  --���W�����ֲ�
					SetSpeakDetail(OwnerID(), "[SC_DAN_112756_4]")   --�z�I�A�̥��w��F���I�F�I���§A�e�^���ֲ��I�N���A�o�Ӱ����^���a�I 
					GiveBodyItem( OwnerID() , 204457, 5 ) 	 --������ 
					SetFlag(OwnerID(), 542552, 0) --����г��W
					SetFlag( OwnerID()  , 542529 , 0 ) --�Ĥ@��ñ���I
					SetFlag( OwnerID()  , 542548 , 0 ) --�ĤG��ñ���I
					SetFlag( OwnerID()  , 542549 , 0 ) --�ĤT��ñ���I
					SetFlag( OwnerID()  , 542448 , 0 ) --����_���X�ǩ�ñ���   
					SetFlag( OwnerID()  , 542630 , 0 ) --�A�ץͩ� 
					SetFlag(OwnerID()  , 542520  , 0) --�����X��
					SetFlag(OwnerID()  , 542550  , 1) --���Ѥw��������
				--	CastSpelllv  (TargetID(), OwnerID() , 493096, 0)  --�I��@�ӽd��k�N
					ClockClose( OwnerID() )	
					CancelBuff( OwnerID(), 501635 )
					CancelBuff( OwnerID(), 503212)	
					DelBodyItem(OwnerID() , 204426 , MusicBox) --�������a���W���ֲ�
					DelBodyItem(OwnerID() , 204604 , locationpapaer) --�������a���W�D��
					AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "LuaDan_112756_0", 0)				
				else
				
					SetSpeakDetail (OwnerID(), "[SC_DAN_112698_18]")  --�A���W�S�����ֲ����I�Ч�����D�ګ������I�����ֲ��H�нT�{ 3 ��ñ���I��ñ��L�F�I
					AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "LuaDan_112756_0", 0)
				end


		else 
			SetSpeakDetail (OwnerID(), "[SC_DAN_112756_5]")  --�A���h������D�ګ����W���ְ��N���ɶܡH���֥h�T�{�ݬݳ�I
			AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "LuaDan_112756_0", 0)
		end
	else 
		SetSpeakDetail (OwnerID(), "[SC_DAN_112756_6]")  --�A���Ѥw�g�ѥ[�L
		AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "LuaDan_112756_0", 0)
	
	end
end
---------------------------------------------------------------------------------------------------
function Lua_Dan_112756_2() --�������y

--say(OwnerID(), "1") --���a
--say(TargetID(), "2") --NPC
	local Guardflag = CheckFlag(OwnerID()  , 542551) 
	local Signflag1 = CheckFlag(OwnerID()  , 542529)
	local Signflag2 = CheckFlag(OwnerID()  , 542548)
	local Signflag3 = CheckFlag(OwnerID()  , 542549)
	local locationpapaer =  CountBodyItem( OwnerID() , 204604 ) --�a�z��T	
		if Guardflag == true and Signflag1 == true and Signflag2 == true and Signflag3 == true then --���Ҧ�ñ���I��flag

			SetSpeakDetail(OwnerID(), "[SC_DAN_112756_7]")   --�A�u�O�@�W�ȱo�H�઺�n���͡A�o�O�P�§A�N���ֲ��e�^���ڪ����y��I
			GiveBodyItem( OwnerID() , 204457, 3 ) 	 --������ 
		--	CastSpelllv  (TargetID(), OwnerID() , 492964, 0)  --�I��@�ӽd��k�N
			DelBodyItem(OwnerID() , 204604 , locationpapaer) --�������a���W���ֲ�
			CancelBuff( OwnerID(), 501635 )
			CancelBuff( OwnerID(), 503215)
			SetFlag(OwnerID(), 542551, 0) --�@�úX��
			SetFlag(OwnerID() ,542527, 1) --���Ѥw��������
			SetFlag(OwnerID(), 542552, 0) --����г��W
			SetFlag( OwnerID()  , 542529 , 0 ) --�Ĥ@��ñ���I
			SetFlag( OwnerID()  , 542548 , 0 ) --�ĤG��ñ���I
			SetFlag( OwnerID()  , 542549 , 0 ) --�ĤT��ñ���I
			SetFlag( OwnerID()  , 542448 , 0 ) --����_���X�ǩ�ñ���   
			SetFlag( OwnerID()  , 542630 , 0 ) --�A�ץͩ� 
			ClockClose( OwnerID() )
			AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "LuaDan_112756_0", 0)
		else 
			SetSpeakDetail (OwnerID(), "[SC_DAN_112756_8]")  --�A���V�����D�ګ����W�ѥ[���ְ��N���ɶܡH�O�o�T�{�ۤv���S����ñ���ñ���I
			AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "LuaDan_112756_0", 0)
		end	
end
---------------------------------------------------------------------------------------------------