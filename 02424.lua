function LuaS_118868()
	local Fidelina = OwnerID()
	local Lorde = LuaFunc_SearchNPCbyOrgID( Fidelina , 114794 , 15 )

	SetDefIdleMotion( Fidelina, ruFUSION_MIME_EMOTE_SWEEP2 )

	npcsay( Lorde , "[SC_243_CHATTING_00]" )		-- �j�j���ڪ��աA�ڦn�L��I�I
	sleep(30)

	npcsay( Fidelina , "[SC_243_CHATTING_01]" )		-- ù�w�A�h��p��w���աA�j�j�n����o�ǪF��M���b�C
	sleep(40)

	npcsay( Lorde , "[SC_243_CHATTING_02]" )		-- �ڤ~���n���w���A�L�C�����|�A��I�I
	sleep(40)


end


function LuaS_118877()
	local Godoy = OwnerID()
	local Bella = LuaFunc_SearchNPCbyOrgID( Godoy , 116493 , 40 )
	local Diana = LuaFunc_SearchNPCbyOrgID( Godoy , 118867 , 40 )

	PlayMotion( Godoy , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	npcsay( Godoy , "[SC_243_CHATTING_03]" )		-- �ѰڡA[118840]���S�}�l���L���j�D�z�F�C
	sleep(30)

	PlayMotion( Diana , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	npcsay( Diana , "[SC_243_CHATTING_04]" )		-- �Ѫ��D�L�O���U���Ӧa��X���D�C
	sleep(30)

	PlayMotion( Diana , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	npcsay( Diana , "[SC_243_CHATTING_05]" )		-- �ڭ̥��O�n�U�n�ۤv�����e���F�A�٥h�z���Ƕ˧L�F���H
	sleep(40)

	PlayMotion( Bella , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	npcsay( Bella , "[SC_243_CHATTING_06]" )		-- �N�O���ڡA�ӥB�d���n�ĺ��h������|�ӧ�H�C
	sleep(40)

	PlayMotion( Godoy , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	npcsay( Godoy , "[SC_243_CHATTING_07]" )		-- �p�n�I�A�p�G�L�u���Q�쨫�F�d���n�|�Ǩ�ڭ̨��W�I
	sleep(40)

	PlayMotion( Bella , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	npcsay( Bella , "[SC_243_CHATTING_08]" )		-- ���L�A���[118840]�o�ˤl���Z�Ӫ��C......
	sleep(40)

	npcsay( Diana , "[SC_243_CHATTING_09]" )		-- �c......
	npcsay( Godoy , "[SC_243_CHATTING_09]" )
	sleep(30)


end

function LuaS_118875()
	local Cabarrus = OwnerID()
	local Fiallos =  LuaFunc_SearchNPCbyOrgID( Cabarrus , 118876 , 50 )

	PlayMotion( Cabarrus , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	npcsay( Cabarrus , "[SC_243_CHATTING_10]" )		-- �̪�A���䪺�e�ܦ��_�Ǫ��C��F�C
	sleep(40)

	PlayMotion( Fiallos , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	npcsay( Fiallos , "[SC_243_CHATTING_11]" )		-- �O�ڡA�٬y�U�@��U���C
	sleep(40)

	PlayMotion( Cabarrus , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	npcsay( Cabarrus , "[SC_243_CHATTING_12]" )		-- �p�G�A�o�ˤU�h���ܮڥ�����ѥФF......
	sleep(40)

	PlayMotion( Fiallos , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	npcsay( Fiallos , "[SC_243_CHATTING_13]" )		-- ���t�ܡA�إЪ��O�ڤS���O�A�C
	sleep(40)

	PlayMotion( Cabarrus , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	npcsay( Cabarrus , "[SC_243_CHATTING_14]" )		-- ��M���t�ڡA���M�ڭn�Y���F��n�q���ӡI
	sleep(40)

	PlayMotion( Fiallos , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	npcsay( Fiallos , "[SC_243_CHATTING_15]" )		-- ...�ڤS���O�M�{�ص��A�Y��...
	sleep(40)

end