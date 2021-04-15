function LuaS_113292()
	if CheckAcceptQuest( OwnerID() , 422458 ) == true or CheckAcceptQuest( OwnerID() , 422459 ) == true or CheckAcceptQuest( OwnerID() , 422460 ) == true or CheckAcceptQuest( OwnerID() , 422461 ) == true or CheckAcceptQuest( OwnerID() , 422462 ) or CheckAcceptQuest( OwnerID() , 422463 ) == true or CheckAcceptQuest( OwnerID() , 422864 ) or CheckAcceptQuest( OwnerID() , 422926 ) then
		LoadQuestOption( OwnerID() )  --���J���ȼҪO
		for i = 1, 5 do
			local DrawCard_No = ReadRoleValue( TargetID() , EM_RoleValue_Register+i );
			if	DrawCard_No~=999999	then
				AddSpeakOption( OwnerID() , OwnerID() , "[SC_113292_02][$SETVAR1=["..DrawCard_No.."]]" , "LuaS_113292_CardExchange_"..i , 0 )	-- �ڦ��A��ʪ�[$VAR1]�A�ڷQ��A�洫[205642]�C
				DebugMsg( 0 , 0 , "Card_No = "..DrawCard_No )
			end
		end
	else
		SetSpeakDetail( OwnerID() , "[SC_113292_01]" )	-- �ڳ��w�Ǫ��d���I�ڥ��b�����Ǫ��d���I�ӥB�u�n�ݨ�d����Ų�W�٦��ݸ��A�ڴN�|�D�`���D�`�������F�I�I�I
	end


end

function LuaS_113292_CardExchange_1()
	local DrawCard_No = ReadRoleValue( TargetID() , EM_RoleValue_Register+1 )
	--local CardName = GetObjNameByGUID(DrawCard_No)
	local CardName = "["..DrawCard_No.."]"

	if DelBodyItem( OwnerID() , DrawCard_No , 1 ) then
		SetSpeakDetail( OwnerID() , "[SC_113292_03][$SETVAR1="..CardName.."]" )	-- [$VAR1]�I�ڪ��T�٨S���o�i�d���I����Ц��U�A�洫��[205642]�C�K�K�A�ڪ��d����Ų�W�S�s�W�F�@�i��
		GiveBodyItem( OwnerID() , 205642 , 1 )
	else
		SetSpeakDetail( OwnerID() , "[SC_113292_04][$SETVAR1="..CardName.."]" )	-- �c...�p�G�A�u�O��°O���d���W�٪��ܡA�ڥi�H��̧A�C�_�h�Ф��n���F�ڪ��P���A�A�ڥ��S��[$VAR1]�ڡI
	end
end

function LuaS_113292_CardExchange_2()
	local DrawCard_No = ReadRoleValue( TargetID() , EM_RoleValue_Register+2 )
	local CardName = "["..DrawCard_No.."]"

	if DelBodyItem( OwnerID() , DrawCard_No , 1 ) then
		SetSpeakDetail( OwnerID() , "[SC_113292_03][$SETVAR1="..CardName.."]" )	-- [$VAR1]�I�ڪ��T�٨S���o�i�d���I����Ц��U�A�洫��[205642]�C�K�K�A�ڪ��d����Ų�W�S�s�W�F�@�i��
		GiveBodyItem( OwnerID() , 205642 , 1 )
	else
		SetSpeakDetail( OwnerID() , "[SC_113292_04][$SETVAR1="..CardName.."]" )	-- �c...�p�G�A�u�O��°O���d���W�٪��ܡA�ڥi�H��̧A�C�_�h�Ф��n���F�ڪ��P���A�A�ڥ��S��[$VAR1]�ڡI
	end
end

function LuaS_113292_CardExchange_3()
	local DrawCard_No = ReadRoleValue( TargetID() , EM_RoleValue_Register+3 )
	local CardName = "["..DrawCard_No.."]"

	if DelBodyItem( OwnerID() , DrawCard_No , 1 ) then
		SetSpeakDetail( OwnerID() , "[SC_113292_03][$SETVAR1="..CardName.."]" )	-- [$VAR1]�I�ڪ��T�٨S���o�i�d���I����Ц��U�A�洫��[205642]�C�K�K�A�ڪ��d����Ų�W�S�s�W�F�@�i��
		GiveBodyItem( OwnerID() , 205642 , 1 )
	else
		SetSpeakDetail( OwnerID() , "[SC_113292_04][$SETVAR1="..CardName.."]" )	-- �c...�p�G�A�u�O��°O���d���W�٪��ܡA�ڥi�H��̧A�C�_�h�Ф��n���F�ڪ��P���A�A�ڥ��S��[$VAR1]�ڡI
	end
end

function LuaS_113292_CardExchange_4()
	local DrawCard_No = ReadRoleValue( TargetID() , EM_RoleValue_Register+4 )
	local CardName = "["..DrawCard_No.."]"

	if DelBodyItem( OwnerID() , DrawCard_No , 1 ) then
		SetSpeakDetail( OwnerID() , "[SC_113292_03][$SETVAR1="..CardName.."]" )	-- [$VAR1]�I�ڪ��T�٨S���o�i�d���I����Ц��U�A�洫��[205642]�C�K�K�A�ڪ��d����Ų�W�S�s�W�F�@�i��
		GiveBodyItem( OwnerID() , 205642 , 1 )
	else
		SetSpeakDetail( OwnerID() , "[SC_113292_04][$SETVAR1="..CardName.."]" )	-- �c...�p�G�A�u�O��°O���d���W�٪��ܡA�ڥi�H��̧A�C�_�h�Ф��n���F�ڪ��P���A�A�ڥ��S��[$VAR1]�ڡI
	end
end

function LuaS_113292_CardExchange_5()
	local DrawCard_No = ReadRoleValue( TargetID() , EM_RoleValue_Register+5 )
	local CardName = "["..DrawCard_No.."]"

	if DelBodyItem( OwnerID() , DrawCard_No , 1 ) then
		SetSpeakDetail( OwnerID() , "[SC_113292_03][$SETVAR1="..CardName.."]" )	-- [$VAR1]�I�ڪ��T�٨S���o�i�d���I����Ц��U�A�洫��[205642]�C�K�K�A�ڪ��d����Ų�W�S�s�W�F�@�i��
		GiveBodyItem( OwnerID() , 205642 , 1 )
	else
		SetSpeakDetail( OwnerID() , "[SC_113292_04][$SETVAR1="..CardName.."]" )	-- �c...�p�G�A�u�O��°O���d���W�٪��ܡA�ڥi�H��̧A�C�_�h�Ф��n���F�ڪ��P���A�A�ڥ��S��[$VAR1]�ڡI
	end
end

function LuaS_113292_DrawCard()
	local card = {}

	card[1] = 770000      -- Ĩۣ�H�d��
	card[2] = 770001      -- Ĩۣ�H�çL�d��
	card[3] = 770004      -- ���T�d��
	card[4] = 770005      -- �p���d��
	card[5] = 770006      -- ���Υd��
	card[6] = 770007      -- �\�������d��
	card[7] = 770008      -- ������d��
	card[8] = 770009      -- ���d��
	card[9] = 770010      -- �s�ޥd��
	card[10] = 770011      -- �T�d��
	card[11] = 770013      -- �\���]��d��
	card[12] = 770014      -- �·t�����d��
	card[13] = 770015      -- �w�f�����u�d��
	card[14] = 770016      -- �w�fŧ���̥d��
	card[15] = 770018      -- �w�f����L�d��
	card[16] = 770019      -- �t�v���`�d��
	card[17] = 770020      -- ���`�d��
	card[18] = 770021      -- ���ɥd��
	card[19] = 770022      -- ���X���ɥd��
	card[20] = 770023      -- �����L�q�u�d��
	card[21] = 770024      -- �����L����̥d��
	card[22] = 770025      -- �¦�Ӷ������d��
	card[23] = 770026      -- �ť��Υd��
	card[24] = 770027      -- ���g�T�d��
	card[25] = 770028      -- �¥ֽޥd��
	card[26] = 770030      -- �w�f��ŧ�L�d��
	card[27] = 770031      -- ��ͻf���d��
	card[28] = 770032      -- ���彿���d��
	card[29] = 770033      -- �s��d��
	card[30] = 770034      -- ���O�y���d��
	card[31] = 770035      -- �մƻj��d��
	card[32] = 770036      -- ���ս����d��
	card[33] = 770037      -- �G���j��d��
	card[34] = 770038      -- ������v�d��
	card[35] = 770041      -- ������c�A�d��
	card[36] = 770042      -- ������c���d��
	card[37] = 770044      -- ��g�f�ޥd��
	card[38] = 770045      -- ���ܼɯT�d��
	card[39] = 770046      -- ���Ǳr�ު̥d��
	card[40] = 770047      -- ���ǹC���̥d��
	card[41] = 770052      -- �����b�k�d��
	card[42] = 770053      -- �ɴߥ��Υd��
	card[43] = 770054      -- �b�k���V�d��
	card[44] = 770055      -- �׽\�B��̥d��
	card[45] = 770056      -- �׽\���ܪ̥d��
	card[46] = 770057      -- ��Ĩۣ�H�d��
	card[47] = 770058      -- �y���s�ҥd��
	card[48] = 770059      -- �w���s�ҥd��
	card[49] = 770060      -- �@����s�ҥd��
	card[50] = 770061      -- �y�����ޥd��
	card[51] = 770062      -- �]�O���ޥd��
	card[52] = 770063      -- �R�Q���H���d��
	card[53] = 770064      -- �R�Q�_�����d��
	card[54] = 770065      -- ��������d��
	card[55] = 770068      -- ����ʤu�d��
	card[56] = 770069      -- ����پx�̥d��
	card[57] = 770070      -- ����ާ@���d��
	card[58] = 770071      -- ����c�ҥd��
	card[59] = 770072      -- ������̥d��
	card[60] = 770073      -- ����çL�d��
	card[61] = 770075      -- �i�����g�d��
	card[62] = 770076      -- �R�Q�U�����d��
	card[63] = 770079      -- �F�׾�ǥd��
	card[64] = 770080      -- �k���ǥd��
	card[65] = 770081      -- �C����ǥd��
	card[66] = 770082      -- �p�ֻ캵�d��
	card[67] = 770083      -- �Q���캵�d��
	card[68] = 770085      -- �븭���ê�d��
	card[69] = 770086      -- �ݦ姯�ê�d��
	card[70] = 770087      -- ��v��s���d��
	card[71] = 770088      -- ���������d��
	card[72] = 770089      -- ���w�k�v�d��
	card[73] = 770090      -- �׳��w�d��
	card[74] = 770091      -- �����d��
	card[75] = 770094      -- �H�ǥd��
	card[76] = 770095      -- �f�]�����d��
	card[77] = 770099      -- ���i�ԥ��I�d��
	card[78] = 770100      -- �����W�����H�d��
	card[79] = 999999      -- �ީ��d��
	card[80] = 770102      -- �Ԥ��������d��
	card[81] = 770103      -- ���ѹ����d��
	card[82] = 770104      -- ���ͩީ��d��
	card[83] = 770106      -- ���i�Գ��I�d��
	card[84] = 770108      -- ���i�ԴH��d��
	card[85] = 770109      -- �������I�d��
	card[86] = 770110      -- ���i�Գ���d��
	card[87] = 770111      -- �p�O�����d��
	card[88] = 770112      -- ���i�ԦB�ɥd��
	card[89] = 770113      -- ���O���d��
	card[90] = 770114      -- �H�]�B��d��
	card[91] = 770115      -- �H�]�B���d��
	card[92] = 770116      -- �j�N���T�d��
	card[93] = 770117      -- ���짯��d��
	card[94] = 770119      -- �ۤ��s�~�d��
	card[95] = 770120      -- �y�S�۹����d��
	card[96] = 770121      -- �o�J�۹����d��
	card[97] = 770122      -- �B�Żh�@�d��
	card[98] = 770123      -- �Ԥ�����d��
	card[99] = 770124      -- �Ԥ���L�d��
	card[100] = 770125      -- �Ԥ����q�d��
	card[101] = 770132      -- �l�H�̥d��
	card[102] = 770133      -- �e�v�d��
	card[103] = 770135      -- �԰����ҥd��
	card[104] = 770136      -- �]�ƪk�T�d��
	card[105] = 770137      -- �d�E�����d��
	card[106] = 770138      -- ���뵲���d��
	card[107] = 770145      -- ���ߵ����d��
	card[108] = 770151      -- �����]���d��
	card[109] = 770152      -- �B�@���F�d��
	card[110] = 770153      -- �]���@���d��
	card[111] = 770154      -- �U�X�����ȥd��
	card[112] = 770156      -- �t���Υd��
	card[113] = 770162      -- ���P�H�x�d��
	card[114] = 770163      -- �G�G�P�H�x�d��
	card[115] = 770164      -- �w�w�P�H�x�d��
	card[116] = 770165      -- ���P�f���d��
	card[117] = 770166      -- ����b���ȥd��
	card[118] = 770167      -- ����r�ȥd��
	card[119] = 770168      -- �����c�h�d��
	card[120] = 770169      -- �{���c�h�d��
	card[121] = 770170      -- �����y��d��
	card[122] = 770171      -- ��������d��
	card[123] = 770172      -- �����i�h�d��
	card[124] = 770173      -- ���\�y���d��
	card[125] = 770176      -- �����V�~�v�d��
	card[126] = 770177      -- �����N���h�d��
	card[127] = 770179      -- �l�������ȥd��
	card[128] = 770180      -- �K���h�i�d��
	card[129] = 770183      -- �d���ԧJ���ƥd��
	card[130] = 770184      -- �d���ԧJ�u�ƥd��
	card[131] = 770185      -- �d���ԧJ�L�ƥd��
	card[132] = 770186      -- �d���ԧJ���ƥd��
	card[133] = 770187      -- ���ܪ��Υd��
	card[134] = 770190      -- ��װ��\�k�d��
	card[135] = 770191      -- �F��U�k�d��
	card[136] = 770192      -- �C�F����d��
	card[137] = 770193      -- �Q�~�d��
	card[138] = 770195      -- ���X���q�ȥd��
	card[139] = 770196      -- ���q�h�i�d��
	card[140] = 999999      -- �_�c�u�@�̥d��
	card[141] = 770198      -- �P���Ч��d��
	card[142] = 770199      -- �K���Ч��d��
	card[143] = 770200      -- �m�l�Ч��d��
	card[144] = 770202      -- ���t�j���d��
	card[145] = 770203      -- ��װ��\�k�d��
	card[146] = 770204      -- �F��U�k�d��
	card[147] = 770205      -- ��g���d��
	card[148] = 770206      -- ����ȥd��
	card[149] = 770208      -- ���󽿽��d��
	card[150] = 770209      -- �w�f�k�v�d��
	card[151] = 770211      -- �Ť峷��d��
	card[152] = 770212      -- ����\���d��
	card[153] = 770213      -- �`��r�k�d��
	card[154] = 770214      -- ��ŧ�]�v�d��
	card[155] = 770215      -- �~�{�]���d��
	card[156] = 770222      -- �Jù�����ȥd��
	card[157] = 770227      -- ���F�d��
	card[158] = 770228      -- �w�f��ŧ�L�����d��
	card[159] = 770229      -- �w�f����d��
	card[160] = 770230      -- �򴶶��d��
	card[161] = 770231      -- �w�f�ɵ��L�d��
	card[162] = 770232      -- �ۭ����Υd��
	card[163] = 770236      -- ����z�T�d��
	card[164] = 770237      -- �r�ĳ��ޥd��
	card[165] = 770238      -- �r�ͻf���d��
	card[166] = 770239      -- �׽\�廽�̥d��
	card[167] = 770240      -- �׽\�c��̥d��
	card[168] = 770241      -- ����s�ҥd��
	card[169] = 770242      -- �U�f��s�ҥd��
	card[170] = 770243      -- �K����s�ҥd��
	card[171] = 770244      -- �y�����ޥd��
	card[172] = 770245      -- ���O���ޥd��
	card[173] = 770246      -- ����������d��
	card[174] = 770247      -- �����W�����H�d��
	card[175] = 770248      -- �����ީ��d��
	card[176] = 770249      -- ���魷���ȥd��
	card[177] = 770250      -- �j�N�O�h�d��
	card[178] = 770251      -- �ȥ��r�ȥd��
	card[179] = 770252      -- �¦�Ӷ�����d��
	card[180] = 770253      -- �a�ެ��Υd��
	card[181] = 770254      -- �a�����ȥd��
	card[182] = 770255      -- �w�f�u�@�̥d��
	card[183] = 770256      -- �w�f�����M�a�d��
	card[184] = 770257      -- �w�f���̥d��
	card[185] = 770258      -- �w�f���̥d��
	card[186] = 770260      -- ���ߤƨ��d��
	card[187] = 770261      -- �H�B�ۼv�d��
	card[188] = 770262      -- �T�D�̤��v�d��
	card[189] = 770263      -- ���c�ۼv�d��
	card[190] = 770264      -- �ݦ�̤��v�d��
	card[191] = 770265      -- �L�Y�Ԥh�d��
	card[192] = 770266      -- �����j�M�̥d��
	card[193] = 770267      -- �s�_�̿��e�d��
	card[194] = 770268      -- �·t�֤ߦu�@�̥d��
	card[195] = 770269      -- �g���෽�u�@�̥d��
	card[196] = 770270      -- �B���෽�u�@�̥d��
	card[197] = 770271      -- ���t�Ť岽�q�d��
	card[198] = 770272      -- ���K�Ť�C�h�d��
	card[199] = 770273      -- �B���Ť�äh�d��
	card[200] = 770274      -- ���r������d��
	card[201] = 770275      -- �@�r������d��
	card[202] = 770277      -- �����@�ê̥d��
	card[203] = 770278      -- �H�K�@�ê̥d��
	card[204] = 770279      -- �p���@�ê̥d��
	card[205] = 770280      -- �a�̭��{�Ϫ̥d��
	card[206] = 770284      -- ���e�@�ê̥d��
	card[207] = 770285      -- �����@�ê̥d��
	card[208] = 770286      -- ��Ĭ�����`�d��
	card[209] = 770287      -- ��Ĭ�Ǭr��d��
	card[210] = 770288      -- ���v���ի�k�ͥd��
	card[211] = 770289      -- �o�g���ի�k�ͥd��
	card[212] = 770290      -- �d�G���ի�k�ͥd��
	card[213] = 770291      -- �Ť�ĵ�٪̥d��
	card[214] = 770292      -- �Ť�u�ê̥d��
	card[215] = 770293      -- �Ť巴���̥d��
	card[216] = 770294      -- �Ť娵�ު̥d��
	card[217] = 770294      -- �Ť��@�ê��d�� �令 �Ť娵�ު̥d��
	card[218] = 770302      -- �X�j�O���i�h�d��
	card[219] = 770303      -- �X�j�O���N�x�d��
	card[220] = 770304      -- ���}���Z�L�d��
	card[221] = 770305      -- �X�j�O�����h�d��
	card[222] = 770306      -- �X�j�O���𫰧L�d��
	card[223] = 770307      -- �X�j�O�������̥d��
	card[224] = 770308      -- �X�j�O���ľW�̥d��
	card[225] = 770309      -- �X�j�O���T�M�L�d��
	card[226] = 770310      -- �g�ɥ��T�d��
	card[227] = 770311      -- �Ѥ��l��̥d��
	card[228] = 770312      -- �X�j�O�����m�̥d��
	card[229] = 770313      -- �X�j�O���v���̥d��
	card[230] = 770313      -- ���j�����̥d�� �令 �X�j�O���v���̥d��
	card[231] = 770328      -- �¦|����d��
	card[232] = 770329      -- �¦|���d��
	card[233] = 770330      -- �¦|�ݦ�̥d��
	card[234] = 770331      -- ���i�l�H�̥d��
	card[235] = 770332      -- �¦|�}���̥d��
	card[236] = 770333      -- �G�p�J���ϥd��
	card[237] = 770334      -- �¦|�r���̥d��
	card[238] = 770335      -- �G�p�J�����̥d��
	card[239] = 770336      -- �`���A�G�d��
	card[240] = 770337      -- �`�����L�d��
	card[241] = 770338      -- �Q�A�G���¦|����d��
	card[242] = 770339      -- �Q�A�G���¦|���s�d��
	card[243] = 770340      -- �F�z�����d��
	card[244] = 770342      -- ��ؤ��𳾥d��
	card[245] = 770343      -- �a�J���R�d��
	card[246] = 770344      -- �g�ɶ��R�d��
	card[247] = 770345      -- �ťۦu�@�C�h�d��
	card[248] = 770346      -- �n�Ԫ����C�h�d��
	card[249] = 770347      -- �ťۦu�@�äh�d��
	card[250] = 770348      -- �n�������äh�d��
	card[251] = 770349      -- �ťۦu�@���F�d��
	card[252] = 770350      -- ���j�l�����@�d��
	card[253] = 770351      -- ���j�C�l���J�d��
	card[254] = 770352      -- ���j�����i�l�d��
	card[255] = 770353      -- ��񭹯󳽥d��
	card[256] = 770354      -- �{�����`�d��
	card[257] = 770355      -- �BĦ���ɥd��
	card[258] = 770356      -- ����y���d��
	card[259] = 770357      -- ���C���̥d��
	card[260] = 770358      -- ��챰�ܪ̥d��
	card[261] = 770360      -- �����j�M�̥d��
	card[262] = 770361      -- �����g�k�̥d��
	card[263] = 770362      -- �������ê̥d��
	card[264] = 770364      -- �¦Ϩ��ާL�d��
	card[265] = 770365      -- �¦Ͻäh�d��
	card[266] = 770366      -- �¦ϥ��J�d��
	card[267] = 770367      -- �¦϶����d��
	card[268] = 770368      -- �׭^�¦Ϧu�åd��
	card[269] = 770369      -- �b�y���ɥd��
	card[270] = 770370      -- �a��ֽޥd��
	card[271] = 770371      -- ���r���󳽥d��
	card[272] = 770372      -- ���w�f���d��
	card[273] = 770373      -- �����b�k�d��
	card[274] = 770374      -- �W�����H�u�L�d��
	card[275] = 770378      -- �۩��~�d��
	card[276] = 770379      -- �W�����H�Z�L�d��
	card[277] = 770380      -- �W�����H�x�x�d��
	card[278] = 770381      -- ����ܥd��
	card[279] = 770382      -- �g�b�޲ܥd��
	card[280] = 770383      -- ����T�d��
	card[281] = 770384      -- ��b���d��
	card[282] = 770385      -- �l�����@�d��
	card[283] = 770386      -- �C�l���J�d��
	card[284] = 770387      -- �����i�l�d��
	card[285] = 770388      -- ����Ŧг��d��
	card[286] = 770389      -- ���𸭲y�d��
	card[287] = 770390      -- �·t���Υd��
	card[288] = 770394      -- �w�f���֪̥d��
	card[289] = 770395      -- �w�f�v�˪̥d��
	card[290] = 770396      -- �w�f�����̥d��
	card[291] = 770397      -- ��a�r��d��
	card[292] = 770398      -- ��d���`�d��
	card[293] = 770399      -- ����󳽥d��
	card[294] = 770400      -- �����¬е�d��
	card[295] = 770401      -- �T�u���ޥd��
	card[296] = 770402      -- �ƯB���y�d��
	card[297] = 770403      -- ���I�޲ܥd��
	card[298] = 770404      -- ������d��
	card[299] = 770405      -- ���~���ܥd��
	card[300] = 770406      -- �����ļ��̥d��
	card[301] = 770407      -- �������D�̥d��
	card[302] = 770409      -- ���y�ؤl�d��
	card[303] = 770410      -- ���a�h�i�d��
	card[304] = 770411      -- ���ṥ���d��
	card[305] = 770413      -- �B��C����d��
	card[306] = 999999      -- �B��h�i���d��
	card[307] = 770415      -- �r�����|�̥d��
	card[308] = 770416      -- �r�����~�d��
	card[309] = 770417      -- �����B��r���d��
	card[310] = 770418      -- ���ɦB��r���d��
	card[311] = 770420      -- �B���G�H�h�L�d��
	card[312] = 770421      -- �B���G�H�@�ö����d��
	card[313] = 770422      -- �B���G�H���q�d��
	card[314] = 770423      -- �B���G�H�����h�d��
	card[315] = 770424      -- �B���G�H�Ұʪ̥d��
	card[316] = 999999     -- �B���G�H�T�ö����d��
	card[317] = 999999     -- �B���G�H�����̥d��
	card[318] = 770427      -- �B�쥨���d��
	card[319] = 770428      -- ���a�����d��
	card[320] = 770429      -- ���e�l�s�d��
	card[321] = 770430      -- �B���l�s�d��
	card[322] = 770431      -- �H���l�s�d��
	card[323] = 770432      -- �����d��
	card[324] = 770433      -- �p�����d��
	card[325] = 999999      -- �B�����k���H�d��
	card[326] = 770435      -- �s���s���ޥd��
	card[327] = 770436      -- �s���s���T�d��
	card[328] = 770437      -- �s���s�Ǻ��d��
	card[329] = 770441      -- �ӾU���T�d��
	card[330] = 770442      -- �԰����ޥd��
	card[331] = 999999      -- �԰����T�d��
	card[332] = 770444      -- �X�j�O���ݦu�̥d��
	card[333] = 770445      -- �X�j�O�����u�̥d��
	card[334] = 770446      -- �X�j�O���j���̥d��
	card[335] = 770447      -- �X�j�O���z�ާL�d��
	card[336] = 770448      -- �X�j�O���j�p�d��
	card[337] = 770449      -- �X�j�O�����˽çL�d��
	card[338] = 770450      -- �X�j�O���b�L�d��
	card[339] = 770451      -- �X�j�O���ʤu�d��
	card[340] = 770455      -- ��ҥd��
	card[341] = 770459      -- �X�j�O������d��
	card[342] = 770460      -- ���a�C����d��
	card[343] = 770461      -- �s���B�~�d��
	card[344] = 770462      -- �������ܪ̥d��
	card[345] = 770463      -- �����j�s�d��
	card[346] = 770464      -- �������ު̥d��
	card[347] = 770465      -- ��������̥d��
	card[348] = 770466      -- �����O���̥d��
	card[349] = 770467      -- �������d�̥d��
	card[350] = 770468      -- ������r�̥d��
	card[351] = 770469      -- �����j���̥d��
	card[352] = 770470      -- �������٤�d��
	card[353] = 770471      -- �������m�̥d��
	card[354] = 770474      -- �����}��d��
	card[355] = 770475      -- �����l�L�d��
	card[356] = 770476      -- �������d��
	card[357] = 770477      -- ���O�u�åd��
	card[358] = 770478      -- ���O�ݦu�̥d��
	card[359] = 770479      -- ���O���L�d��
	card[360] = 770481      -- ���O�g��d��
	card[361] = 770482      -- ���O�R�H�̥d��
	card[362] = 770483      -- ���O��ŧ�̥d��
	card[363] = 770485      -- �p�򹥳��d��
	card[364] = 770486      -- �y�T�C����d��
	card[365] = 770487      -- ���O���T�d��
	card[366] = 770489      -- �|�l�r�N�d��
	card[367] = 770490      -- �\���]��d��
	card[368] = 770491      -- �¯ͱ��~�d��
	card[369] = 770492      -- ����c���d��
	card[370] = 770493      -- ��쭸�ͥd��
	card[371] = 770494      -- �������d��
	card[372] = 770495      -- �����ɥd��
	card[373] = 770496      -- ������d��
	card[374] = 770497      -- ���ܳ��ǥd��
	card[375] = 770498      -- ���ܳ��ǥd��
	card[376] = 770499      -- �g���ɥd��
	card[377] = 770500      -- �p�����d��
	card[378] = 770501      -- �¥��ɥd��
	card[379] = 770503      -- ��f�j�s�d��
	card[380] = 770504      -- ��f�L��d��
	card[381] = 770505      -- �v��O���̥d��
	card[382] = 770506      -- �v��T���̥d��
	card[383] = 770507      -- �v��C���̥d��
	card[384] = 770511      -- ���a�F�ȥd��
	card[385] = 770512      -- �ܲ��F�ȥd��
	card[386] = 770513      -- ���a�h�i�d��
	card[387] = 770515      -- ���a�F�ȸ��d��
	card[388] = 770516      -- ���F�ȥ��Υd��
	card[389] = 770517      -- ���F�ȥ��Υd��
	card[390] = 770518      -- �Z�Ǧu�@�̥d��
	card[391] = 770519      -- �L�y�t�H�d��
	card[392] = 770520      -- �L�y�@�ê̥d��
	card[393] = 770521      -- �C���¦|����d��
	card[394] = 770522      -- �r�޶¦|���d��
	card[395] = 770523      -- ����~���`��d��
	card[396] = 770524      -- ���c���s�`��d��
	card[397] = 770525      -- ��f�T��d��
	card[398] = 770526      -- ��f����d��
	card[399] = 770527      -- ��f�C���d��
	card[400] = 770528      -- �X�j�O�������L�d��
	card[401] = 770529      -- �X�j�O�������ԯT�d��
	card[402] = 770536      -- ���������d��
	card[403] = 770537      -- �򴹩����d��
	card[404] = 770538      -- �g�������H�h�L�d��
	card[405] = 770539      -- �԰�����~�d��
	card[406] = 770540      -- �ԥҦ���~�d��
	card[407] = 770541      -- �B�����̥d��
	card[408] = 770542      -- �B���ݱ��̥d��
	card[409] = 770543      -- �B���ݧL�d��
	card[410] = 770544      -- �B���F��ϥd��
	card[411] = 770545      -- �B�������ϥd��
	card[412] = 770546      -- �B���L�Ȫ̥d��
	card[413] = 770547      -- �B���O���̥d��
	card[414] = 770550      -- �B���G�H���ߤh�L�d��
	card[415] = 770551      -- �B���Ұʪ̥d��
	card[416] = 770552      -- �B���h�B�u�d��
	card[417] = 770553      -- �m�l���N�d��
	card[418] = 770554      -- ���C���ͥd��
	card[419] = 770555      -- ��J��d�~�d��
	card[420] = 770556      -- �u�d�I�P�~�d��
	card[421] = 770557      -- �d��I�P�~�d��
	card[422] = 770558      -- �񩥩Ԧ��~�d��
	card[423] = 770559      -- ������d�~�d��
	card[424] = 770560      -- �������r�w���d��
	card[425] = 770562      -- ���c����d��
	card[426] = 770563      -- �ѽm�����s�d��
	card[427] = 770564      -- �����k�C�ȥd��
	card[428] = 770565      -- ���s���u�d��
	card[429] = 770566      -- ���ƶ��u�d��
	card[430] = 770567      -- �w�Ȭ��Ԥh�d��
	card[431] = 770568      -- �w�Ȭ����q�d��
	card[432] = 770570      -- �w�ȥd�y�`�̥d��
	card[433] = 770571      -- �w�ȩZ���q�d��
	card[434] = 770572      -- �w�ȩZ�~���d��
	card[435] = 770574      -- �w�ȩZ�y��d��
	card[436] = 770575      -- �w�ȩi�~���d��
	card[437] = 770576      -- �w�ȩi�y��d��
	card[438] = 770577      -- �w�ȩi���q�d��
	card[439] = 770579      -- ���L���ɥd��
	card[440] = 770580      -- ��F���͡@�d��
	card[441] = 770581      -- ��F�����ɥd��
	card[442] = 770582      -- ��F�Ԧ��~�d��
	card[443] = 770583      -- �w�ȥd�Ʀs�̥d��
	card[444] = 770585      -- �������d��
	card[445] = 770586      -- �����������H�d��
	card[446] = 770587      -- �˪L�����d��
	card[447] = 770588      -- �\�K�r��d��
	card[448] = 770589      -- �˪L��\�d��
	card[449] = 770591      -- �C�����]�d�� �����U�@�i
	card[450] = 770591      -- �������L�~�d��
	card[451] = 770592      -- ���C���ͥd��
	card[452] = 770593      -- �w����L�~�d��
	card[453] = 770594      -- ���[���~�d��
	card[454] = 770595      -- ���[�ۥ��~�d��
	card[455] = 770596      -- ���[�����~�d��
	card[456] = 770598      -- �h�A���T�d��
	card[457] = 770599      -- �h�A����d��
	card[458] = 770600      -- �w�`�y�\�d��
	card[459] = 770601      -- �w�`�y��d��
	card[460] = 770602      -- �w�`�Ԥh�d��
	card[461] = 770603      -- �w�`�ĺ��d��
	card[462] = 770605      -- ����b�T�d��
	card[463] = 770606      -- ����y��d��
	card[464] = 770607      -- ����Ԥh�d��
	card[465] = 770608      -- ����ĺ��d��
	card[466] = 770610      -- �A���r��d��
	card[467] = 770611      -- ���D���ԥd��
	card[468] = 770612      -- ���D�i�h�d��
	card[469] = 770613      -- ���D�����d��
	card[470] = 770617      -- �w�ȥd���Y�̥d��
	card[471] = 770618      -- ��õJ�o�d��
	card[472] = 770619      -- �������`�d��
	card[473] = 770620      -- �w�Ȭ��������q�d��
	card[474] = 770621      -- �w�Ȭ����ԥd��
	card[475] = 770622      -- ���p���`�d��
	card[476] = 770623      -- �ɭ������d��
	card[477] = 999999      -- �j��k���d��
	card[478] = 770625      -- �����r��d��
	card[479] = 770626      -- �K�L���̥d��
	card[480] = 770627      -- �ͯf����H�d��
	card[481] = 770628      -- �m�l���ͥd��
	card[482] = 770629      -- �դ�ިߥd��
	card[483] = 770630      -- ���ͥ��Υd��
	card[484] = 770631      -- ���вr�V�d��
	card[485] = 770632      -- ���⪺��H�d��
	card[486] = 770633      -- ���d����H�d��
	card[487] = 770634      -- �L�y�Ԧ��~�d��
	card[488] = 770635      -- ����T�d��
	card[489] = 770636      -- �v�i�çL�d��
	card[490] = 770637      -- �v�i�k�v�d��
	card[491] = 770638      -- �i�ԹF�L�d��
	card[492] = 770639      -- ���o��d��
	card[493] = 770640      -- ����ɥd��
	card[494] = 770641      -- ��z����H�d��
	card[495] = 770642      -- �����b�k�d��
	card[496] = 770643      -- �C�������d��
	card[497] = 770645      -- �ɻ����Ԥh�d��
	card[498] = 770646      -- �ɻ�������d��
	card[499] = 770647      -- ���޹��d��

	-- �Ĥ@���X�ͪ���d
	local CardSet = {}
	math.randomseed(math.random(10000, 99999))
	local CardSeed = math.random(1,499)
	for i = 1, 5 do
		CardSet[i] = math.fmod( CardSeed + math.random(1,100) , 500 )
		CardSeed = CardSet[i]
		if CardSet[i] ~= nil then
			local DrawCard_No = 770000
			if CardSet[i] ~= 0 then
				DrawCard_No = card[CardSet[i]]
			end
			WriteRoleValue( OwnerID() , EM_RoleValue_Register+i , DrawCard_No )	-- �g�i�����ѹ�ܿﶵ��
			Say( OwnerID(), "[SC_113292_05][$SETVAR1=["..DrawCard_No.."]]" )	-- ��...��ӧ��٤��[$VAR1]�I
		end
	end
	while true do
		local min = GetSystime(2)	-- �{�b�q���ɶ��O�X��
		if min == 0 then
			local CardSet = {}
			math.randomseed(math.random(10000, 99999))
			local CardSeed = math.random(1,499)
			for i = 1, 5 do
				CardSet[i] = math.fmod( CardSeed + math.random(1,100) , 500 )
				CardSeed = CardSet[i]
				if CardSet[i] ~= nil then
					local DrawCard_No = 770000
					if CardSet[i] ~= 0 then
						DrawCard_No = card[CardSet[i]]
					end
					WriteRoleValue( OwnerID() , EM_RoleValue_Register+i , DrawCard_No )	-- �g�i�����ѹ�ܿﶵ��
					Say( OwnerID(), "[SC_113292_05][$SETVAR1=["..DrawCard_No.."]]" )	-- ��...��ӧ��٤��[$VAR1]�I
				end
			end
		end
		--Say( OwnerID(), "Second = "..min )
		Sleep( 600 )
	end
end