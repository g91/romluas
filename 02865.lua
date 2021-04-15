--�x�T�y����ܥ�
--World 1 �ϰ�x�T�y����ܿﶵ
--�R�W�Glua_�@�ɴX�H_MTSnoopSZ()	MT=�D�� SNOOP=���� SZ=��ܼ@��
function lua_World1_MTSnoopSZ()
	local Player = OwnerID()
	local PlayerRace = ReadRoleValue(Player,EM_RoleValue_Race);
	local ZoneID = ReadRoleValue( Player , EM_RoleValue_ZoneID )
	local item = 0						--�ΨӰO���C�X�����ضq
	local Flag = lua_Transport_FlagSet( ZoneID )		--�^�ǰϰ�����X�� �C
	local tmpPoint = lua_Transport_LocalSet( ZoneID )	--�i�ǰe���Ȧs��m�I�A�禡�^�Ǥ@�Ӱ}�C�A�����Ӱϰ�i�ǰe���a�I�C
	local Str = ""
	local Detail = ""
		Detail = lua_Snoopy_SpeakDetail()
		SetSpeakDetail( Player , Detail )--�I��p�l�A�A�Q������ֻ��F�ڡA�i�O�ܨS�@�ߪ��C
		AddSpeakOption( Player, Player, GetString ( "SC_111256_S") , "LuaS_111256_S", 0 ); --�ڭn�N�^�{�N�a�I�n�O��
			--�}�Ҷǰe�N
			if CheckFlag( Player,540001 ) == false then
				AddSpeakOption( Player, Player, GetString ( "SC_111256_Q") , "LuaS_111256_Q", 0 ); --�ǰe�O����H
				SetFlag( Player,540001,1 )
			end
			--�}�Ҧ��a�ǰe��
			if CheckFlag( Player , Flag ) == false then
				SetFlag( Player , Flag , 1)
				ScriptMessage( Player, Player, 1, GetString("SC_111256_OT"), C_SYSTEM );	--�A���\�}�ҤF���a���Ȫ̤����C
			end
			--�C�X�ǰe�ﶵ(501638=�M�{�T��)
			if CheckBuff( Player , 501638 ) == false then
				for i=1,#tmpPoint do
					local loc = tmpPoint[i]	--loc =�i�ǰe���ϰ�
					local tmpFlag = lua_Transport_FlagSet( loc )
						if CheckFlag( Player , tmpFlag ) == true then
							if item < 6 then
								local PointName = lua_Transport_LocalName( loc )
									Str = "[SC_TRANSFER_OPTION_MEG][$SETVAR1="..PointName.."]" --�ǰe��[$VAR1]
								--	if ( loc ==31 and PlayerRace~=2 ) or ( loc==12 and PlayerRace~=1 ) then
									if loc==12 and PlayerRace~=1 then
										--2013/10/23 �ץ����u�����F�q�T�~�H�C
									else
										AddSpeakOption( Player, TargetID(), Str , "lua_World1_Transport("..loc..")", 0 ); 	
										item = item +1
									end
							else
								if CheckFlag( Player , 540191 ) == true then
									AddSpeakOption( Player, TargetID(),  "[SC_111256_10_1]"  , "LuaS_111256_10_1", 0 ); --�ǰe��祱�S��a
								end
									AddSpeakOption( Player, TargetID(),  "[SC_205764_2]" ,"lua_MTSnoopSZ_NEXT("..i..")", 0 ); --�U�@��
									return
							end
						end
				end
				if CheckFlag( OwnerID() , 540191 ) == true then
					AddSpeakOption( OwnerID(), TargetID(),  "[SC_111256_10_1]"  , "LuaS_111256_10_1", 0 ); --�o�ӬO�ҥ~�A�ҥH�S�O�C�A�ǰe��祱�S��a
				end
			end
end
function lua_MTSnoopSZ_NEXT( k )
	local Player = OwnerID()
	local PlayerRace = ReadRoleValue(Player,EM_RoleValue_Race);
	local ZoneID = ReadRoleValue( Player , EM_RoleValue_ZoneID )
	local tmpPoint = lua_Transport_LocalSet( ZoneID )		--�^�Ǥ@�Ӱ}�C�A�����Ӱϰ�i�ǰe���a�I�C
	local Str = ""
		for i=k,#tmpPoint do
			local loc = tmpPoint[i]	--loc =�i�ǰe���ϰ�
			local tmpFlag = lua_Transport_FlagSet( loc )
				if CheckFlag( Player , tmpFlag ) == true then
					local PointName = lua_Transport_LocalName( loc )
						Str = "[SC_TRANSFER_OPTION_MEG][$SETVAR1="..PointName.."]" --�ǰe��[$VAR1]
						--if ( loc ==31 and PlayerRace~=2 ) or ( loc==12 and PlayerRace~=1 ) then
						if loc==12 and PlayerRace~=1 then
							--2013/10/23 �ץ����u�����F�q�T�~�H�C
						else
							AddSpeakOption( Player, TargetID(), Str , "lua_World1_Transport("..loc..")", 0 ); 
						end
				end
		end
		AddSpeakOption( Player, TargetID(),  "[SO_BACK]" ,"lua_World1_MTSnoopSZ", 0 ); --��^�W�@��	
end
--�ǰe�ɥΪ�Detail���
function lua_Snoopy_SpeakDetail()
	--�ȥΡA�Q�s�W�Φ��ϥα��󳣥i
	local num=Rand(6)+1
	local SP = {}
		SP ={
			[1] = "[SC_111256_0]" ,		--�I��p�l�A�A�Q������ֻ��F�ڡA�i�O�ܨS�@�ߪ��C
			[2] = "[SC_SNOOPYSAY_01]" , 	--���u���A�~�M���n�����A�A�ȡH���n�ӹL���F�ڧA�I
			[3] = "[SC_SNOOPYSAY_02]" ,	--���ڤ]�Q���F�A�L�`��K��F�A��A���]�S�ΡC
			[4] = "[SC_SNOOPYSAY_03]" ,	--�A�̳o�Ǥ��ȥ��~���å�O�ѧ�ڳ·СA�|�`�ڪ��u�ɤ��_�W�[�I
			[5] = "[SC_SNOOPYSAY_04]" ,
			[6] = "[SC_114353_0]"
				}
		return SP[num]
end
--�i�ǰe�ϰ쪺�W��
function lua_Transport_LocalName( loc )
	local PointName = {}
	local Str = ""
		PointName = {
				[1] = "[ZONE_ROGSHIRE]" , 		--ù����
				[2] = "[ZONE_VARANAS]" , 		--�Z��R����
				[3] = "[ZONE_DUST HOLD]", 		--�o�󫰹�
				[4] = "[ZONE_ARGENFALL]" , 		--���r��
				[5] = "[ZONE_HAROLFE TRADING POST]" , --�����ҥ����
				[6] = "[OBSIDIAN BASTION]" , 		--���`�ۭn��
				[7] = "[ZONE_BOULDERWIND]" , 		--������
				[8] = "[ZONE_THE GREEN TOWER]" ,	--�񤧶�
				[9] = "[ZONE_DIMARKA]" , 		--�F���\��
				[10] = "[ZONE_AYEN CARAVAN]" ,	--�㺸���Ӷ�
				[11] = "[ZONE_LAGO]"  ,			--�p�J��
				[12] = "[ZONE_STONES FURLOUGH]" ,	--���椧�I
				[13] = "[ZONE_HARFEN_CAMP]" ,		--��������a
				[15] = "[ZONE_THUNDERHOOF_MESA]" ,	--�p�ᤧ�C
				[16] = "[ZONE_SOUTH_JENOTAR_FOREST]" ,--�n�ǿմ���˪L
				[17] = "[ZONE_NORTHERN_JANOST_FOREST]" ,--�_�ǿմ���˪L
				[18] = "[ZONE_LYMUN_KINGDOM]" ,	--�ܼ}������
				[19] = "[ZONE_CAMPBELL_TOWNSHIP]" ,	--�������p��
				[20] = "[ZONE_FIREBOOT_DWARF_FORTRESS]",--���u���S
				[21] = "[ZONE_TORAGG_CARAVAN]",	--�Sù��Ӷ�
				[22] = "[ZONE_Z22_OLD_ROJAN_KINGDOM]",--�ը��N�w���§}
				[23] = "[ZONE_Z23_QUESLANA]",		--�_���S�Ԧ㮦��
				[24] = "[ZONE_Z24_MERDIN_TUNDRA]",	--�����B���
				[25] = "[ZONE_Z25_SERBAYT_PASS]",	--�ƺ����S�i�f
				[26] = "[ZONE_Z26_ZHYRO]",		--�įQ��
				[27] = "[ZONE_Z27_WAILING_FJORD]",	--�s�z�l�W
				[28] = "[ZONE_Z28_HURTEKKE_JUNGLE]",	--���S�J�O�L
				[29] = "[ZONE_Z29_XADIA_BASIN]",		--��ǻp�a�Ȭ֦a
				[30] = "[ZONE_Z30_KATHALAN]",		--�d�F����
				[31] = "[ZONE_Z31_IFANTRISH_CRYPT]", 	--��Z�Z�Ʀa��
				[32] = "[ZONE_Z32_SPLITWATER]",  		--�����x�a
				[33] = "[ZONE_Z33_FAYTEAR_UPLANDS]" 	--�O�����C��
						}
			return PointName[ loc]
end
function lua_Transport_LocalSet( ZoneID,loc )
	local tmp = 1;
 		if loc ==nil then
 			local TelLoc ={
 				[2] = { 6,22,27,1,13,4,5,3,7,8,9,10,11,12,31,32 },
 				[6] = { 2,22,27,1,13,10,11,4,5,3,7,8,9,12,31,32 },
				[15] = { 22, 27,16, 17, 18, 19, 20, 21,32 },
				[22] = { 2, 6, 15, 27, 23, 24 ,25 , 26,32 },
				[27] = { 2, 6, 15, 22, 28, 29, 30,32 },
				[32] = { 2, 6, 15, 22, 27, 33, 34 }
 						}
 			return TelLoc[ZoneID]
 		else
 			local TelMoney = {
 				[2] = { [1]=10, [3]=750, [4]=250 , [5]=750 , [6]=50, [7]=1750, [8]=3000, [9]=4500, [10]=60, [11]=300, [12]=10 , [13]=10, [22]=2200, [27]=5000, [31]=10, [32]=10000 } ,
 				[6] = { [1]=60, [2]=50, [3]=800, [4]=300 , [5]=750, [7]=1800, [8]=3050, [9]=4550, [10]=10, [11]=250, [12]=60 , [13]=60,  [22]=2200, [27]=5000, [31]=60, [32]=10000 } ,
				[15] = { [22]=2200, [27]=5000, [32]=10000,  [16]=1500, [17]=3000, [18]=4500, [19]=6000, [20]=7500, [21]=9000 } ,
				[22] = { [2]=2200 ,[6]=2200, [15]=2200 , [32]=10000,  [23]=2200 , [24]=4400 , [25]=6600 , [26]=8800 ,[27]=5000 } ,
				[27] = { [2]=5000,[6]=5000, [15]=5000 , [22]=5000, [32]=10000,   [28]=3000 ,[29]=6000 ,[30]=9000 },
				[32] = { [2]=10000,[6]=10000, [15]=10000 , [22]=10000, [27]=10000 ,[33]=6000 ,[34]=9000 }
						 }
 			return TelMoney[ ZoneID ][loc]
 		end
end

function lua_Transport_FlagSet( loc )
	loc = loc or 1	--�N���a���]�|�H���Où����
	--�s�W�ϰ�[ZoneID]=�i����Zone���X�ЧP�w�C
	local Flag = {
			--World I
		 	[1] = 541313 ,
			[2] = 541314 ,	--�D��
			[3] = 542297 ,
			[4] = 541315 ,
			[5] = 541316 ,
			[6] = 541317 ,	--�D��
			[7] = 542498 ,
			[8] = 542744 ,
			[9] = 542997 ,
			[10] = 541318 ,
			[11] = 541319 ,
			[12] = 542557 ,
			[13] = 540193 ,
			--World II
			[15] = 543704 ,	--�D��
			[16] = 543705 ,
			[17] = 544327 , 
			[18] = 544624 ,
			[19] = 544680 ,
			[20] = 545465 ,
			[21] = 545618 ,
			--World III
			[22] = 546189 ,	--�D��
			[23] = 547002 ,
			[24] = 547003 ,
			[25] = 547004 ,
			[26] = 547005 ,
			[31] = 546255 ,
			--World IV
			[27] = 548380,
			[28] = 548381,
			[29] = 548382,
			[30] = 548383,
			--World V
			[32] = 548978,
			[33] = 548979,
			[34] = 548980
					}
			return Flag[ loc ]
end
--���o�ǰe�I��m
function lua_GetTransportPoint( loc ) 
	local TP = {}
		for i=1,40 do
			TP[i] = {}
		end
		TP = {
			[1] = { -1155, 37, -5548, 100 }  , 		--�}���E��
			[2] = { 2298, 0, 1153, 39 }  , 		--�Z��R����
			[3] = { 13855, 27 , 6748, 175 } , 		--�o�󫰹�
			[4] = { -5917, 593, 2886, 280 } , 		--���r��
			[5] = { -14466, 756, -170, 2 } , 		--�����ҥ����
			[6] = { -20460, -190, 6507, 132 } , 		--���`�ۭn��
			[7] = { 19672, 12, 21907, 340 } , 		--������
			[8] = { 5924 , 189 , 20751 , 210 } ,		--�񤧶�
			[9] = { -11207 , 973 , 26316 , 70 } , 	--�F���\��
			[10] = { -38730, -2, 1543, 14 } ,		--�㺸���Ӷ�	-- -29480, -540, 1193, 8.6
			[11] = { -29454, 254 , -17630, 180 } , 	--�p�J��
			[12] = { 28502, 312, 3465 , 180 } ,		--���椧�I
			[13] = { -6324.4, 165, -3914.3 , 166.2 } ,	--��������a
			[15] = { -4261, 13, 5050, 250 } ,		--�p�ᤧ�C
			[16] = { -5982 , -148 , 21609 , 300 } ,
			[17] = { 3571.6 , 113.5 , 31635.7 , 300 } ,
			[18] = { 3085.2 , 85.0 , 47603.9 , 90 } ,
			[19] = { -2893.9 , 119.0 , 49658.0 , 251.4 } ,
			[20] = { -16445.3 , 613 , 41033.7 , 174.4 } ,
			[21] = { -26338.5 , -100 , 29778.7 , 174.4 } ,
			[22] = { -20732.1,570,-22756.7,321.3 } , 	--�ը��N�w���§}
			[23] = { -7794.4,718.8,-16589.3,169.9 } ,
			[24] = { 3847.4,444.8,-7769.3,180.9 } ,
			[25] = { -6557.7, 1452.4, -7719.4, 29 } ,
			[26] = { -17896.6, 801.9, -3340.5, 335.9 } ,
			[27] = { -9171.8, 20, 3055, 283.7 } ,
			[28] = {2587.7,146.9,24619,210},
			[29] = { 7054, 11, 22695, 272},
			[30] = {19298.9,45.8,34932.7,134.6},
			[31] = { 2300, 1546, -414, 300 },		--��Z�Z�Ʀa��
			[32] = { -12986, 180, -14194, 200 },		--�����x�a
			[33] = {-4248.7,839.1,5134.2,116.5},
			[34] = {0,0,0,0}
					}
		if TP[1]==nil then
			ScriptMessage( OwnerID(),OwnerID(),1,GetString("SYS_FIXEQ_DATA_ERROR"),0)	--��ưe�X�����D
		else
			return TP[loc][1],TP[loc][2],TP[loc][3],TP[loc][4]
		end
end
--�ǰe�N
function lua_World1_Transport( loc )	--loc =���a���w�ǰe����m
	local Player = OwnerID()
	CloseSpeak( Player )
	DebugMsg(0,0,"Player_Select_a_location="..loc)
	CallPlot( Player , "lua_World1_TransportSpell" , TargetID() , Player , loc )
end
function lua_World1_TransportSpell( Obj , Player , loc ) --loc =���a���w�ǰe����m
	local ZoneID = ReadRoleValue( Player , EM_RoleValue_ZoneID )
	local Areaname = lua_Transport_LocalName( loc )	-- function�^�Ǧa�Ϧr��
	local CastMoney = lua_Transport_LocalSet( ZoneID,loc )
	local String = ""
		String = "[SC_111256_DIALOG_0][$SETVAR1="..Areaname.."][$SETVAR2="..CastMoney.."]" --�ǰe��ù����ݭn�I�O XX ��
		if String == -1 then
			ScriptMessage( Player,Player,1,GetString("SYS_FIXEQ_DATA_ERROR"),0)	
			--��ưe�X�����D
			return 0
		end
		if CheckBuff( Player , 501570) == false then  --�W�[�ˬd�P�_

			DialogCreate( Player , EM_LuaDialogType_YesNo  , String);
			DialogSelectStr( Player , GetString("SO_YES") );
			DialogSelectStr( Player , GetString("SO_NO") );
			AddBuff( Player , 501570,0,-1);--�M�ᵹ��BUFF
				if( DialogSendOpen( Player ) == false ) then 
					ScriptMessage( Player,Player,1,GetString("SYS_FIXEQ_DATA_ERROR"),0)	
					--��ưe�X�����D
					return 0
				end
			--�q�Ψ��oDIALOG�P�_( ���o������ID�B�s�b����ơB�Z������B�Z������ѦҪ��ؼ� )
			local SelectID = EX_GetDialogResoult( Player, 30 , 75 , Obj )
				DialogClose( Player )
				CancelBuff( Player, 501570 );--�̫�M��BUFF
				if SelectID == 0  then
					if ReadRoleValue( Player , EM_RoleValue_Money ) < CastMoney then
						ScriptMessage( Player, Player, 1, GetString("SAY_MOUTH_ERROR_A"), 0 ); --/*�A���W���������C
					else
						if AddRoleValue( Player , EM_RoleValue_Money , -(CastMoney) ) then
							local tx,ty,tz,tdir = lua_GetTransportPoint( loc )
								CastSpell( Player , Player , 491008 )
								sleep( 5 )
								ChangeZone( Player , loc , 0 , tx , ty , tz, tdir )
						end
					end
					return 1
				elseif SelectID == 1  then
					return 0
				else 
					return 0
				end
		else
			ScriptMessage( Player , Player , 0, "[SC_WINDOW_OPENED]", 0 );
		end
end