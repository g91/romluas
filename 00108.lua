function Init_Actorstate_ENUM()
--function Init_Actorstate_ENUM()
-- �ʧ@��  �� PlayMotion �٦� PlayMotionEX�ϥΪ�

	ruFUSION_ACTORSTATE_NORMAL				= 0;
	ruFUSION_ACTORSTATE_JUMP				= 1;
	ruFUSION_ACTORSTATE_FALLING				= 2;
	ruFUSION_ACTORSTATE_SWIM_SURFACE		= 3;
	ruFUSION_ACTORSTATE_SWIM_DIVE			= 4;

	ruFUSION_ACTORSTATE_SIT_BEGIN			= 6;
	ruFUSION_ACTORSTATE_SIT_LOOP			= 7;
	ruFUSION_ACTORSTATE_SIT_END				= 8;

	ruFUSION_ACTORSTATE_SLEEP_BEGIN			= 9;
	ruFUSION_ACTORSTATE_SLEEP_LOOP			= 10;
	ruFUSION_ACTORSTATE_SLEEP_END			= 11;

	ruFUSION_ACTORSTATE_DYING				= 12;
	ruFUSION_ACTORSTATE_DEAD				= 13;
	ruFUSION_ACTORSTATE_REVIVING			= 14;

	ruFUSION_ACTORSTATE_SPAWN_BEGIN			= 15;
	ruFUSION_ACTORSTATE_SPAWN_END			= 16;

	ruFUSION_ACTORSTATE_DEAD_WATER			= 17;

	ruFUSION_ACTORSTATE_CROUCH_BEGIN		= 148;                                   --�ۤU/���U
	ruFUSION_ACTORSTATE_CROUCH_LOOP			= 149;
	ruFUSION_ACTORSTATE_CROUCH_END			= 150;

	ruFUSION_ACTORSTATE_CRAFTING_BEGIN		= 131;                                   --�ϥΪ��~/�V�X
	ruFUSION_ACTORSTATE_CRAFTING_LOOP		= 132;
	ruFUSION_ACTORSTATE_CRAFTING_END		= 133;

	ruFUSION_ACTORSTATE_MINING_BEGIN		= 134;                                   --���q�B���
	ruFUSION_ACTORSTATE_MINING_LOOP			= 135;
	ruFUSION_ACTORSTATE_MINING_END			= 136;
	ruFUSION_ACTORSTATE_MINING_END_HOLD		= 137;

	ruFUSION_ACTORSTATE_LUMBERJACK_BEGIN		= 201;
	ruFUSION_ACTORSTATE_LUMBERJACK_LOOP		= 202;
	ruFUSION_ACTORSTATE_LUMBERJACK_END			= 203;

	ruFUSION_ACTORSTATE_GATHER_BEGIN			= 204;
	ruFUSION_ACTORSTATE_GATHER_LOOP			= 205;
	ruFUSION_ACTORSTATE_GATHER_END			= 206;

	ruFUSION_ACTORSTATE_LOOT_BEGIN			= 207;
	ruFUSION_ACTORSTATE_LOOT_LOOP			= 208;
	ruFUSION_ACTORSTATE_LOOT_END			= 209;

	ruFUSION_ACTORSTATE_CARRY_BEGIN			= 216;
	ruFUSION_ACTORSTATE_CARRY_LOOP			= 217;
	ruFUSION_ACTORSTATE_CARRY_END			= 218;

	ruFUSION_ACTORSTATE_DAZED_BEGIN			= 138;                    --�w�t
	ruFUSION_ACTORSTATE_DAZED_LOOP			= 139;
	ruFUSION_ACTORSTATE_DAZED_END			= 140;

	ruFUSION_ACTORSTATE_SLUMBER_BEGIN		= 141;                                    --�ε�
	ruFUSION_ACTORSTATE_SLUMBER_LOOP		= 142;
	ruFUSION_ACTORSTATE_SLUMBER_END			= 143;

	ruFUSION_ACTORSTATE_ACTIVATE_BEGIN		= 145;                                     --���`
	ruFUSION_ACTORSTATE_ACTIVATE_LOOP		= 146;
	ruFUSION_ACTORSTATE_ACTIVATE_END		= 147;

	ruFUSION_ACTORSTATE_READING_BEGIN		= 155;                                    --�\Ū
	ruFUSION_ACTORSTATE_READING_LOOP		= 156;
	ruFUSION_ACTORSTATE_READING_END			= 157;

	ruFUSION_ACTORSTATE_SIT_CHAIR_BEGIN		= 158;                                    --���Ȥl
	ruFUSION_ACTORSTATE_SIT_CHAIR_LOOP		= 159;
	ruFUSION_ACTORSTATE_SIT_CHAIR_END		= 160;

	ruFUSION_ACTORSTATE_KNOCKDOWN_BEGIN		= 181;                    --��h��a/�L��
	ruFUSION_ACTORSTATE_KNOCKDOWN_LOOP		= 182;
	ruFUSION_ACTORSTATE_KNOCKDOWN_END		= 183;
	ruFUSION_ACTORSTATE_KNOCKDOWN_RECOVER	= 184;

	ruFUSION_ACTORSTATE_EMOTE_HANDSTAND		= 185;		--�˥�
	ruFUSION_ACTORSTATE_EMOTE_ROFL			= 186;		--���u
	ruFUSION_ACTORSTATE_EMOTE_SWEEP1			= 187;
	ruFUSION_ACTORSTATE_EMOTE_SWEEP2			= 188;
	ruFUSION_ACTORSTATE_EMOTE_SWEEP3			= 189;

	ruFUSION_ACTORSTATE_HOLDING				= 144;

	ruFUSION_ACTORSTATE_HURT_NORMAL			= 18;
	ruFUSION_ACTORSTATE_HURT_CRITICAL		= 19;
	ruFUSION_ACTORSTATE_DODGE				= 20;

	ruFUSION_ACTORSTATE_COMBAT_1H			= 21;	
	ruFUSION_ACTORSTATE_COMBAT_2H			= 22;	
	ruFUSION_ACTORSTATE_COMBAT_POLEARM		= 23;	
	ruFUSION_ACTORSTATE_COMBAT_UNARMED		= 24;	
	ruFUSION_ACTORSTATE_COMBAT_BOW			= 25;	
	ruFUSION_ACTORSTATE_COMBAT_GUN			= 26;	

	ruFUSION_ACTORSTATE_ATTACK_1H			= 31;	
	ruFUSION_ACTORSTATE_ATTACK_1H_SP		= 32;	
	ruFUSION_ACTORSTATE_ATTACK_1H_PIERCE	= 47;		
	ruFUSION_ACTORSTATE_ATTACK_2H			= 33;	
	ruFUSION_ACTORSTATE_ATTACK_2H_SP		= 34;	
	ruFUSION_ACTORSTATE_ATTACK_POLEARM		= 35;	
	ruFUSION_ACTORSTATE_ATTACK_POLEARM_SP	= 36;		
	ruFUSION_ACTORSTATE_ATTACK_UNARMED		= 37;	
	ruFUSION_ACTORSTATE_ATTACK_UNARMED_SP	= 38;		
	ruFUSION_ACTORSTATE_ATTACK_BOW_BEGIN	= 39;
	ruFUSION_ACTORSTATE_ATTACK_BOW_LOOP		= 40;
	ruFUSION_ACTORSTATE_ATTACK_BOW_END		= 41;
	ruFUSION_ACTORSTATE_ATTACK_GUN_BEGIN	= 42;
	ruFUSION_ACTORSTATE_ATTACK_GUN_LOOP		= 43;
	ruFUSION_ACTORSTATE_ATTACK_GUN_END		= 44;
	ruFUSION_ACTORSTATE_ATTACK_OH			= 45;	
	ruFUSION_ACTORSTATE_ATTACK_OH_PIERCE	= 46;		

	ruFUSION_ACTORSTATE_ATTACK_BOW_SP_BEGIN		= 48;
	ruFUSION_ACTORSTATE_ATTACK_BOW_SP_LOOP		= 49;
	ruFUSION_ACTORSTATE_ATTACK_BOW_SP_END		= 50;

	ruFUSION_ACTORSTATE_PARRY_1H			= 51;	
	ruFUSION_ACTORSTATE_PARRY_2H			= 52;	
	ruFUSION_ACTORSTATE_PARRY_BOW			= 53;
	ruFUSION_ACTORSTATE_PARRY_GUN			= 54;
	ruFUSION_ACTORSTATE_PARRY_POLEARM		= 55;
	ruFUSION_ACTORSTATE_PARRY_UNARMED		= 56;

	ruFUSION_ACTORSTATE_SHIELD_BASH			= 71;
	ruFUSION_ACTORSTATE_SHIELD_BLOCK		= 72;

	ruFUSION_ACTORSTATE_USE					= 75;
	ruFUSION_ACTORSTATE_THROW				= 76;

	ruFUSION_ACTORSTATE_BUFF_BEGIN			= 81;
	ruFUSION_ACTORSTATE_BUFF_LOOP			= 82;
	ruFUSION_ACTORSTATE_BUFF_END			= 83;
	ruFUSION_ACTORSTATE_BUFF_INSTANT		= 84;

	ruFUSION_ACTORSTATE_BUFF_SP01			= 161;
	ruFUSION_ACTORSTATE_BUFF_SP02			= 162;
	ruFUSION_ACTORSTATE_BUFF_SP03			= 163;

	ruFUSION_ACTORSTATE_CAST_BEGIN			= 85;
	ruFUSION_ACTORSTATE_CAST_LOOP			= 86;
	ruFUSION_ACTORSTATE_CAST_END			= 87;
	ruFUSION_ACTORSTATE_CAST_INSTANT		= 88;

	ruFUSION_ACTORSTATE_CAST_SP01			= 164;
	ruFUSION_ACTORSTATE_CAST_SP02			= 165;
	ruFUSION_ACTORSTATE_CAST_SP03			= 166;
	ruFUSION_ACTORSTATE_CAST_SP04			= 171;

	ruFUSION_ACTORSTATE_DEBUFF_INSTANT			= 167;

	ruFUSION_ACTORSTATE_FISHING_CAST			= 168;
	ruFUSION_ACTORSTATE_FISHING_IDLE			= 169;
	ruFUSION_ACTORSTATE_FISHING_REEL			= 170;

	ruFUSION_ACTORSTATE_CHANNEL_BEGIN		= 89;
	ruFUSION_ACTORSTATE_CHANNEL_LOOP		= 90;
	ruFUSION_ACTORSTATE_CHANNEL_END			= 91;
	ruFUSION_ACTORSTATE_CHANNEL_INSTANT		= 92;

	ruFUSION_ACTORSTATE_SP_SPINKICK			= 95;

	ruFUSION_ACTORSTATE_EMOTE_ANGRY			= 101;
	ruFUSION_ACTORSTATE_EMOTE_APPLAUSE			= 102;
	ruFUSION_ACTORSTATE_EMOTE_APPROVAL			= 103;
	ruFUSION_ACTORSTATE_EMOTE_BEG				= 104;
	ruFUSION_ACTORSTATE_EMOTE_CRY				= 105;
	ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD			= 106;
	ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE	= 107;
	ruFUSION_ACTORSTATE_EMOTE_LAUGH			= 108;
	ruFUSION_ACTORSTATE_EMOTE_POINT			= 109;
	ruFUSION_ACTORSTATE_EMOTE_PROVOKE			= 110;
	ruFUSION_ACTORSTATE_EMOTE_SALUTE			= 111;
	ruFUSION_ACTORSTATE_EMOTE_SPEAK			= 112;
	ruFUSION_ACTORSTATE_EMOTE_SURRENDER			= 113;
	ruFUSION_ACTORSTATE_EMOTE_THREATEN			= 114;
	ruFUSION_ACTORSTATE_EMOTE_VICTORY			= 115;
	ruFUSION_ACTORSTATE_EMOTE_WAVE			= 116;
	ruFUSION_ACTORSTATE_EMOTE_EAT				= 117;
	ruFUSION_ACTORSTATE_EMOTE_DRINK			= 118;
	ruFUSION_ACTORSTATE_EMOTE_IDLE				= 119;
	ruFUSION_ACTORSTATE_EMOTE_IDLE0				= 120;
	ruFUSION_ACTORSTATE_EMOTE_IDLE1				= 121;
	ruFUSION_ACTORSTATE_EMOTE_IDLE2				= 122;
	ruFUSION_ACTORSTATE_EMOTE_DANCE			= 123;
	ruFUSION_ACTORSTATE_EMOTE_PLAY_SAXOPHONE		= 124;
	ruFUSION_ACTORSTATE_EMOTE_PLAY_TAMBOURINE		= 125;
	ruFUSION_ACTORSTATE_EMOTE_PLAY_GUITAR		= 126;
	ruFUSION_ACTORSTATE_EMOTE_JUMP_INPLACE		= 127;
	ruFUSION_ACTORSTATE_EMOTE_BELLY				= 128;
	ruFUSION_ACTORSTATE_EMOTE_EMBRAASSED		= 129;
	ruFUSION_ACTORSTATE_EMOTE_EMBRACE			= 130;

	ruFUSION_ACTORSTATE_EMOTE_KISS				= 250;		--���k
	ruFUSION_ACTORSTATE_EMOTE_SALUTE2			= 251;		--�Ԥh�q§
	ruFUSION_ACTORSTATE_EMOTE_CUTE1			= 252;		--�����y1
	ruFUSION_ACTORSTATE_EMOTE_CUTE2			= 253;		--�k��/�ޮa�q§		--�D�w�]�����ʧ@
	ruFUSION_ACTORSTATE_EMOTE_STRETCH			= 254;		--���i�y
	ruFUSION_ACTORSTATE_EMOTE_ROCK				= 255;		--�q��		--�D�w�]�����ʧ@
	ruFUSION_ACTORSTATE_EMOTE_KAMEHAMEHA		= 256;		--�t����\
	ruFUSION_ACTORSTATE_EMOTE_KICK				= 257;		--��H
	ruFUSION_ACTORSTATE_EMOTE_BREAKDANCE		= 260;		--�y��R
	ruFUSION_ACTORSTATE_EMOTE_TAPDANCE			= 261;		--���R
	ruFUSION_ACTORSTATE_EMOTE_TIRED				= 262;
	ruFUSION_ACTORSTATE_EMOTE_FEAR				= 263;
	ruFUSION_ACTORSTATE_EMOTE_AMAZED			= 264;
	ruFUSION_ACTORSTATE_EMOTE_THINK				= 265;
	ruFUSION_ACTORSTATE_EMOTE_CUTE3				= 266;	
	
		
	ruFUSION_ACTORSTATE_EMOTE_PLAY_SAXOPHONE		= 124;
	ruFUSION_ACTORSTATE_EMOTE_PLAY_TAMBOURINE		= 125;
	ruFUSION_ACTORSTATE_EMOTE_PLAY_GUITAR		= 126;
 

	ruFUSION_ACTORSTATE_HOLSTER				= 151;
	ruFUSION_ACTORSTATE_UNHOLSTER			= 152;
	ruFUSION_ACTORSTATE_HOLSTER_2H			= 153;
	ruFUSION_ACTORSTATE_UNHOLSTER_2H		= 154;	

	ruFUSION_ACTORSTATE_SPIRAL_RIGHT				= 210;
	ruFUSION_ACTORSTATE_SPIRAL_LEFT					= 211;
	ruFUSION_ACTORSTATE_SPIRAL_LOOP					= 212;
	ruFUSION_ACTORSTATE_FLY_BEGIN					= 213;
	ruFUSION_ACTORSTATE_FLY_LOOP					= 214;
	ruFUSION_ACTORSTATE_FLY_END					= 215;

	

-- �w�]�ʧ@�C���P�W�����ۦP�u��Φb SetDefIdleMotion
	
	ruFUSION_MIME_NONE					= 0;

	ruFUSION_MIME_HURT_NORMAL				= 1;
	ruFUSION_MIME_HURT_CRITICAL				= 2;
	ruFUSION_MIME_DODGE					= 3;
	ruFUSION_MIME_SPAWN					= 4;

	ruFUSION_MIME_IDLE_STAND				= 11;
	ruFUSION_MIME_IDLE_STAND_02				= 12;
	ruFUSION_MIME_IDLE_STAND_03				= 19;
	ruFUSION_MIME_IDLE_COMBAT_1H			= 13;
	ruFUSION_MIME_IDLE_COMBAT_2H			= 14;
	ruFUSION_MIME_IDLE_COMBAT_BOW			= 15;
	ruFUSION_MIME_IDLE_COMBAT_GUN			= 16;
	ruFUSION_MIME_IDLE_COMBAT_POLEARM			= 17;
	ruFUSION_MIME_IDLE_COMBAT_UNARMED			= 18;

	ruFUSION_MIME_DEAD_WATER				= 20;

	ruFUSION_MIME_ATTACK_1H				= 21;
	ruFUSION_MIME_ATTACK_1H_SP				= 22;
	ruFUSION_MIME_ATTACK_1H_PIERCE			= 37;
	ruFUSION_MIME_ATTACK_2H				= 23;
	ruFUSION_MIME_ATTACK_2H_SP				= 24;
	ruFUSION_MIME_ATTACK_POLEARM			= 25;
	ruFUSION_MIME_ATTACK_POLEARM_SP			= 26;
	ruFUSION_MIME_ATTACK_UNARMED			= 27;
	ruFUSION_MIME_ATTACK_UNARMED_SP			= 28;
	ruFUSION_MIME_ATTACK_BOW_BEGIN			= 29;
	ruFUSION_MIME_ATTACK_BOW_LOOP			= 30;
	ruFUSION_MIME_ATTACK_BOW_END			= 31;
	ruFUSION_MIME_ATTACK_BOW_SP_BEGIN			= 38;
	ruFUSION_MIME_ATTACK_BOW_SP_LOOP			= 39;
	ruFUSION_MIME_ATTACK_BOW_SP_END			= 40;
	ruFUSION_MIME_ATTACK_GUN_BEGIN			= 32;
	ruFUSION_MIME_ATTACK_GUN_LOOP			= 33;
	ruFUSION_MIME_ATTACK_GUN_END			= 34;
	ruFUSION_MIME_ATTACK_OH				= 35;
	ruFUSION_MIME_ATTACK_OH_PIERCE			= 36;

	ruFUSION_MIME_PARRY_1H				= 41;
	ruFUSION_MIME_PARRY_2H				= 42;
	ruFUSION_MIME_PARRY_BOW				= 43;
	ruFUSION_MIME_PARRY_GUN				= 44;
	ruFUSION_MIME_PARRY_POLEARM				= 45;
	ruFUSION_MIME_PARRY_UNARMED			= 46;

	ruFUSION_MIME_SHIELD_BASH				= 61;
	ruFUSION_MIME_SHIELD_BLOCK				= 62;

	ruFUSION_MIME_USE					= 65;
	ruFUSION_MIME_THROW					= 66;

	ruFUSION_MIME_BUFF_BEGIN				= 71;
	ruFUSION_MIME_BUFF_LOOP				= 72;
	ruFUSION_MIME_BUFF_END				= 73;
	ruFUSION_MIME_BUFF_INSTANT				= 74;

	ruFUSION_MIME_BUFF_SP01				= 161;
	ruFUSION_MIME_BUFF_SP02				= 162;
	ruFUSION_MIME_BUFF_SP03				= 163;

	ruFUSION_MIME_CAST_BEGIN				= 75;
	ruFUSION_MIME_CAST_LOOP				= 76;
	ruFUSION_MIME_CAST_END				= 77;
	ruFUSION_MIME_CAST_INSTANT				= 78;

	ruFUSION_MIME_CAST_SP01				= 164;
	ruFUSION_MIME_CAST_SP02				= 165;
	ruFUSION_MIME_CAST_SP03				= 166;
	ruFUSION_MIME_CAST_SP04				= 171;

	ruFUSION_MIME_DEBUFF_INSTANT				= 167;

	ruFUSION_MIME_CHANNEL_BEGIN				= 79;
	ruFUSION_MIME_CHANNEL_LOOP				= 80;
	ruFUSION_MIME_CHANNEL_END				= 81;
	ruFUSION_MIME_CHANNEL_INSTANT			= 82;

	ruFUSION_MIME_SP_SPINKICK				= 91;
	ruFUSION_MIME_SP_SPINSLASH				= 92;

	ruFUSION_MIME_RUN_FORWARD				= 101;
	ruFUSION_MIME_RUN_CHARGE				= 102;
	ruFUSION_MIME_RUN_CHARGE2				= 110;
	ruFUSION_MIME_RUN_BACKWARD				= 103;
	ruFUSION_MIME_WALK_FORWARD				= 104;

	ruFUSION_MIME_SNEAK_FORWARD			= 118;
	ruFUSION_MIME_SNEAK_BACKWARD			= 119;

	ruFUSION_MIME_WALKSP_FORWARD			= 168;
	ruFUSION_MIME_RUNSP_FORWARD				= 169;
	ruFUSION_MIME_RUNSP_BACKWARD			= 170;

	ruFUSION_MIME_SWIM_FORWARD				= 105;
	ruFUSION_MIME_SWIM_BACKWARD			= 106;
	ruFUSION_MIME_SWIM_LEFT				= 107;
	ruFUSION_MIME_SWIM_RIGHT				= 108;
	ruFUSION_MIME_SWIM_IDLE				= 109;

	ruFUSION_MINE_HOLSTER					= 111;
	ruFUSION_MIME_UNHOLSTER				= 112;

	ruFUSION_MINE_HOLSTER_2H				= 113;
	ruFUSION_MIME_UNHOLSTER_2H				= 114;

	ruFUSION_MIME_SHUFFLE_LEFT				= 115;
	ruFUSION_MIME_SHUFFLE_RIGHT				= 116;

	ruFUSION_MIME_RIDE_IDLE				= 117;
	ruFUSION_MIME_RIDE_IDLE0				= 120;
	ruFUSION_MIME_RIDE_IDLE1				= 158;
	ruFUSION_MIME_RIDE_IDLE2				= 159;
	ruFUSION_MIME_RIDE_IDLE3				= 160;

	ruFUSION_MIME_KNOCKDOWN_BEGIN			= 181;
	ruFUSION_MIME_KNOCKDOWN_LOOP			= 182;
	ruFUSION_MIME_KNOCKDOWN_END			= 183;
	ruFUSION_MIME_KNOCKDOWN_RECOVER			= 184;
	ruFUSION_MIME_EMOTE_HANDSTAND			= 185;
	ruFUSION_MIME_EMOTE_ROFL				= 186;
	ruFUSION_MIME_EMOTE_SWEEP1				= 187;
	ruFUSION_MIME_EMOTE_SWEEP2				= 188;
	ruFUSION_MIME_EMOTE_SWEEP3				= 189;

	ruFUSION_MIME_JUMP_DOWN				= 121;
	ruFUSION_MIME_JUMP_LOOP				= 122;
	ruFUSION_MIME_JUMP_UP					= 123;
	ruFUSION_MIME_JUMP_DOWNANDRUN			= 147;
	ruFUSION_MIME_JUMP_DOWNANDRUN_2			= 148;
	ruFUSION_MIME_JUMP_DOWNANDBACK			= 150;
	ruFUSION_MIME_JUMP_DOWNANDBACK_2			= 151;
	ruFUSION_MIME_JUMP_INPLACE				= 149;

	ruFUSION_MIME_SLEEP_DOWN				= 124;
	ruFUSION_MIME_SLEEP_LOOP				= 125;
	ruFUSION_MIME_SLEEP_UP				= 126;

	ruFUSION_MIME_SIT_DOWN				= 127;
	ruFUSION_MIME_SIT_LOOP				= 128;
	ruFUSION_MIME_SIT_UP					= 129;

	ruFUSION_MIME_DEATH_DOWN				= 130;
	ruFUSION_MIME_DEATH_LOOP				= 131;
	ruFUSION_MIME_DEATH_UP				= 132;

	ruFUSION_MIME_CROUCH_BEGIN				= 133;
	ruFUSION_MIME_CROUCH_LOOP				= 134;
	ruFUSION_MIME_CROUCH_END				= 135;

	ruFUSION_MIME_CRAFTING_BEGIN				= 136;
	ruFUSION_MIME_CRAFTING_LOOP				= 137;
	ruFUSION_MIME_CRAFTING_END				= 138;

	ruFUSION_MIME_MINING_BEGIN				= 139;
	ruFUSION_MIME_MINING_LOOP				= 140;
	ruFUSION_MIME_MINING_END				= 141;

	ruFUSION_MIME_LUMBERJACK_BEGIN			= 251;
	ruFUSION_MIME_LUMBERJACK_LOOP			= 252;
	ruFUSION_MIME_LUMBERJACK_END			= 253;

	ruFUSION_MIME_GATHER_BEGIN				= 254;
	ruFUSION_MIME_GATHER_LOOP				= 255;
	ruFUSION_MIME_GATHER_END				= 256;

	ruFUSION_MIME_LOOT_BEGIN				= 257;
	ruFUSION_MIME_LOOT_LOOP				= 258;
	ruFUSION_MIME_LOOT_END				= 259;

	ruFUSION_MIME_CARRY_BEGIN				= 260;
	ruFUSION_MIME_CARRY_LOOP				= 261;
	ruFUSION_MIME_CARRY_END				= 262;

	ruFUSION_MIME_DAZED					= 142;
	ruFUSION_MIME_SLUMBER				= 143;

	ruFUSION_MIME_ACTIVATE_BEGIN				= 144;
	ruFUSION_MIME_ACTIVATE_LOOP				= 145;
	ruFUSION_MIME_ACTIVATE_END				= 146;

	ruFUSION_MIME_READING_BEGIN				= 152;
	ruFUSION_MIME_READING_LOOP				= 153;
	ruFUSION_MIME_READING_END				= 154;

	ruFUSION_MIME_SIT_CHAIR_BEGIN			= 155;
	ruFUSION_MIME_SIT_CHAIR_LOOP				= 156;
	ruFUSION_MIME_SIT_CHAIR_END				= 157;

	ruFUSION_MIME_EMOTE_ANGRY				= 201;
	ruFUSION_MIME_EMOTE_APPLAUSE			= 202;
	ruFUSION_MIME_EMOTE_APPROVAL			= 203;
	ruFUSION_MIME_EMOTE_BEG				= 204;
	ruFUSION_MIME_EMOTE_CRY				= 205;
	ruFUSION_MIME_EMOTE_HEAD_NOD			= 206;
	ruFUSION_MIME_EMOTE_HEAD_SHAKE			= 207;
	ruFUSION_MIME_EMOTE_LAUGH				= 208;
	ruFUSION_MIME_EMOTE_POINT				= 209;
	ruFUSION_MIME_EMOTE_PROVOKE				= 210;
	ruFUSION_MIME_EMOTE_SALUTE				= 211;
	ruFUSION_MIME_EMOTE_SPEAK				= 212;
	ruFUSION_MIME_EMOTE_SURRENDER			= 213;
	ruFUSION_MIME_EMOTE_THREATEN			= 214;
	ruFUSION_MIME_EMOTE_VICTORY				= 215;
	ruFUSION_MIME_EMOTE_WAVE				= 216;
	ruFUSION_MIME_EMOTE_EAT				= 217;
	ruFUSION_MIME_EMOTE_DRINK				= 218;
	ruFUSION_MIME_EMOTE_IDLE				= 219;
	ruFUSION_MIME_EMOTE_IDLE0				= 220;
	ruFUSION_MIME_EMOTE_IDLE1				= 221;
	ruFUSION_MIME_EMOTE_IDLE2				= 222;
	ruFUSION_MIME_EMOTE_DANCE				= 223;
	ruFUSION_MIME_EMOTE_PLAY_SAXOPHONE		= 224;
	ruFUSION_MIME_EMOTE_PLAY_TAMBOURINE		= 225;
	ruFUSION_MIME_EMOTE_PLAY_GUITAR			= 226;
	ruFUSION_MIME_EMOTE_JUMP_INPLACE			= 227;
	ruFUSION_MIME_EMOTE_BELLY				= 228;
	ruFUSION_MIME_EMOTE_EMBRAASSED			= 229;
	ruFUSION_MIME_EMOTE_EMBRACE			= 230;
	ruFUSION_MIME_EMOTE_KISS				= 350;
	ruFUSION_MIME_EMOTE_SALUTE2				= 351;
	ruFUSION_MIME_EMOTE_CUTE1				= 352;
	ruFUSION_MIME_EMOTE_CUTE2				= 353;
	ruFUSION_MIME_EMOTE_STRETCH				= 354;
	ruFUSION_MIME_EMOTE_ROCK				= 355;
	ruFUSION_MIME_EMOTE_KAMEHAMEHA			= 356;
	ruFUSION_MIME_EMOTE_KICK				= 357;
	ruFUSION_MIME_EMOTE_BREAKDANCE			= 360;
	ruFUSION_MIME_EMOTE_TAPDANCE			= 361;
	ruFUSION_MIME_EMOTE_TIRED				= 362;
	ruFUSION_MIME_EMOTE_FEAR				= 363;
	ruFUSION_MIME_EMOTE_AMAZED				= 364;
	ruFUSION_MIME_EMOTE_THINK				= 365;
	ruFUSION_MIME_EMOTE_CUTE3				= 366;



	ruFUSION_MIME_IDLE_CROUCH				= 241;
	ruFUSION_MIME_IDLE_DEAD				= 242;
	ruFUSION_MIME_IDLE_SIT					= 243;
	ruFUSION_MIME_IDLE_SLEEP				= 244;

	ruFUSION_MIME_SPIRAL_RIGHT				= 190;
	ruFUSION_MIME_SPIRAL_LEFT				= 191;
	ruFUSION_MIME_SPIRAL_LOOP				= 192;
	ruFUSION_MIME_FLY_BEGIN				= 193;
	ruFUSION_MIME_FLY_LOOP				= 194;
	ruFUSION_MIME_FLY_END					= 195;


-- �˳Ƴ���
EM_EQWearPos_Head       			= 0;
EM_EQWearPos_Gloves	    			= 1;
EM_EQWearPos_Shoes				= 2;
EM_EQWearPos_Clothes				= 3;
EM_EQWearPos_Pants				= 4;
EM_EQWearPos_Back				= 5;
EM_EQWearPos_Belt				= 6;
EM_EQWearPos_Shoulder				= 7;
EM_EQWearPos_Necklace   			= 8;
EM_EQWearPos_Ammo       			= 9;
EM_EQWearPos_Bow        			= 10;	
EM_EQWearPos_Ring1      			= 11;
EM_EQWearPos_Ring2      			= 12;
EM_EQWearPos_Earring1   			= 13;
EM_EQWearPos_Earring2   			= 14;
EM_EQWearPos_MainHand				= 15;
EM_EQWearPos_SecondHand 			= 16;
EM_EQWearPos_Manufactory			= 17;
--end
end