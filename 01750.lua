function Lua_Hao_DanceItem00() -- �����t�X
	BeginPlot( OwnerID() , "Lua_Hao_DanceItem01" , 0 )
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_DanceItem01() -- �i�J�԰��B�첾�B�M�����A�L�k�ϥΡC ��Buff���H�ױ��A�ܨ����ɭԡC���񤤤W���n�ױ�

	local Buff = { 506168 , 506169 , 505583 }
	local Count = BuffCount ( OwnerID())
	local BuffID , Fight , Check , Live , X , Y , Z , NewX , NewY , NewZ
	X = ReadRoleValue( OwnerID() , EM_RoleValue_X )
	Y = ReadRoleValue( OwnerID() , EM_RoleValue_Y )
	Z = ReadRoleValue( OwnerID() , EM_RoleValue_Z )	
	Fight = ReadRoleValue( OwnerID() , EM_RoleValue_IsAttackMode ) -- �P�O�O�_�԰���
					say( OwnerID() , "X "..X ) 
					say( OwnerID() , "Y "..Y )	
					say( OwnerID() , "Z "..Z )
	sleep(5)
	if Fight == 0 or CheckBuff( OwnerID() , Buff[1] ) == false then
		for i = 0 , Count , 1 do
			BuffID = BuffInfo( OwnerID() , i , EM_BuffInfoType_BuffID ) -- �P�O�ؼ�Buff
			Check = GameObjInfo_int( BuffID , "AssistType" ) -- �T�{  58 �ܨ��B68 ���M�B120 �D�ӫ��ܨ� --����k�N�����U����
			NewX = ReadRoleValue( OwnerID() , EM_RoleValue_X )
			NewY = ReadRoleValue( OwnerID() , EM_RoleValue_Y )
			NewZ = ReadRoleValue( OwnerID() , EM_RoleValue_Z )
--			say( OwnerID() , "Owner ="..Check )
			if Check == 58 or Check == 68 or Check == 120 or X ~= NewX or Y ~= NewY or Z ~= NewZ then
--			 	AttachCastMotionTool( OwnerID() , 212076 )  --�m���Z�����Ť�
--				PlaySoundToPlayer( OwnerID() , " ", false )  -- ����Ū�����
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_FUNNY_ITEM_00]" , C_SYSTEM ) -- �L�k�ϥθӪ��~�C
				break
			else
				BeginPlot( OwnerID() , "Lua_Hao_DanceItem03" , 0 )
			end
		end
	else
		say( OwnerID() , " Usewell " )-- �ϥΪ̥���
		return false
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_DanceItem02()

	local Player = SearchRangePlayer ( TargetID() , 100 ) --�N���񪱮a�����}�C
--	say( OwnerID() , "OwnerID = 1" )-- �ϥΪ̥���
--	say( TargetID() , "TargetID = 2 " ) -- �ϥΪ̥���

	for i=0 , table.getn(Player) , 1 do
		local BuffID = BuffInfo ( Player[i] , i , EM_BuffInfoType_BuffID )
		local Check = GameObjInfo_int ( BuffID , "AssistType" ) -- �T�{  58 �ܨ��B68 ���M�B120 �D�ӫ��ܨ� --����k�N�����U����
		local Spell = ReadRoleValue( Player[i] , EM_RoleValue_SpellMagicID )
		local UseItem = ReadRoleValue( Player[i] , EM_RoleValue_CastingType )	-- -1 ����l�ȡB0�����I�k�����A
		local Fight = ReadRoleValue( Player[i] , EM_RoleValue_IsAttackMode )
		local Live = ReadRoleValue( Player[i] , EM_RoleValue_IsDead)
--		say( Player[i] , "Loop ="..Check )	
		say( Player[i] , "Spell ="..Spell )	
		if Check == 58 or Check == 68 or Check == 120 or Fight ==1 or Live ==1 or Spell ~= 0 or UseItem == 0 then
--			 AttachCastMotionTool( Player[i] , 212076 )  --�m���Z�����Ť�
--			PlaySoundToPlayer( Player[i] , " ", false )  -- ����Ū�����
			break
		else
			sleep(50)
--		 	AttachCastMotionTool( Player[i] , 212076 )  --�m���Z�����Ť�
--			Say( Player[i] , "-" )
			BeginPlot( OwnerID() , "Lua_Hao_DanceItem01" , 0 ) 
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_DanceItem03()

	local Weapon = { [0]=211822 , [3]=211826 , [2]=211823 , [4]=211825 , [1]=211824 } -- [0]�N�L�B[3]�Q�w�^�B[2]�F�a�B[4]�a���B[1]�ħJ����
	local Motion = { [0]=ruFUSION_ACTORSTATE_EMOTE_PLAY_GUITAR ,  			--	�N�L�B�Q�w
			[3]=ruFUSION_ACTORSTATE_EMOTE_PLAY_GUITAR ,			--
			[2]=ruFUSION_ACTORSTATE_EMOTE_PLAY_TAMBOURINE ,		--	�a���B�F�a
			[4]=ruFUSION_ACTORSTATE_EMOTE_PLAY_TAMBOURINE , 		--
			[1]=ruFUSION_ACTORSTATE_EMOTE_PLAY_SAXOPHONE 	}	--	�ħJ����

	local Buff = { 506168 , 506169 , 505583 }
	local Random = Rand(5)
	local BuffID , Fight , Check , Live , odds

--	odds = (Random)%5
--	AddBuff( OwnerID() , Buff[1] , 0 , 5 ) --�S�� �ܨ��|�N�˳ƫ��O�B���A�G�L�k�ܨ��C
--	AttachCastMotionTool( OwnerID() , Weapon[odds] )  --�m���Z����Weapon
--	PlayMotion( OwnerID() , Motion[odds] )

	local Player = SearchRangePlayer ( OwnerID() , 50 ) --�N���񪱮a�����}�C

		for i=0 , table.getn(Player) , 1 do -- i=1 �������ۤv�A 0 ���ۤv�C
			odds = (Random+i)%5
			Fight = ReadRoleValue( Player[i] , EM_RoleValue_IsAttackMode )
			local Count = BuffCount ( Player[i])
			local Spell = ReadRoleValue( Player[i] , EM_RoleValue_SpellMagicID )
			local UseItem = ReadRoleValue( Player[i] , EM_RoleValue_CastingType )	-- -1 ����l�ȡB0�����I�k�����A
			Live = ReadRoleValue( Player[i] , EM_RoleValue_IsDead )
		--	local Trutly
		--	for j = 490000 , 499999 , 1 do 
			--	Trutly = CastSpell( Player[i] , Player[i] , j )
		--	end
			for j = 0 , Count do
				BuffID = BuffInfo( Player[i] , j , EM_BuffInfoType_BuffID )
				Check = GameObjInfo_int( BuffID , "AssistType" ) -- �T�{  58 �ܨ��B68 ���M�B120 �D�ӫ��ܨ�  --����k�N�����U����
--				Say( Player[i] , Check )
				if Check == 58 or Check == 68 or Check == 120 or Fight == 1 or Live == 1 or Spell ~= 0 or UseItem == 0 then
						Say( Player[i] , "Check = "..Check )
						Say( Player[i] , "Fight = "..Fight )
						Say( Player[i] , "Live = "..Live )
						Say( Player[i] , "Spell ="..Spell )	
						Say( Player[i] , "UseItem ="..UseItem )	
--				 		AttachCastMotionTool( Player[i] , 212076 )  --�m���Z�����Ť�
--						PlaySoundToPlayer( Player[i] , " ", false )  -- ����Ū�����
						Say( Player[i] , "Buffing already" )	-- �A�w�g�B��ֹΪ��A�A�е��ݪ��A�Ѱ��A���ϥΡC
						break				
				else
						PlaySoundToPlayer( Player[i] , "sound\\fx\\Lvup\\PC_SkillLvup.mp3", false ) -- ���񭵮�
--						if CheckBuff( Player[i] , Buff[3] ) == false then
--							PlaySoundToPlayer( Player[i] , "sound\\fx\\Lvup\\PC_SkillLvup.mp3", false ) -- ���񭵮�
--							PlaySoundToPlayer( Player[i] , "sound\\018.mp3", false ) -- ���񭵮�
--							AddBuff( Player[i] , Buff[3] , 0 , 45 ) -- ���歺���֫��򼽩�h�[
--						end
						AddBuff( Player[i] , Buff[1] , 0 , 5 ) --�S�� �ܨ��|�N�˳ƫ��O�B���A�G�L�k�ܨ��C
						AttachCastMotionTool( Player[i] , Weapon[odds] )  --�m���Z����Weapon
						PlayMotion( Player[i] , Motion[odds] )
--						Say( Player[i] , Weapon[odds] )
--						Say( Player[i] , Motion[odds] )
--						BeginPlot( OwnerID() , "Lua_Hao_DanceItem02" , 0 )
				end
			end
		end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_DanceItem_Cancel() -- ��k�N�����ɡA�m���Z�����Ť�A�òM���S�ġC

	local Buff = { 506168 , 506169 , 505583 }
		PlayMotion( OwnerID() , 0 ) 
--		Say( OwnerID() , " Cancel Buff " )
		for i = 1 , 3 , 1 do
			CancelBuff( OwnerID() , Buff[i] )
		end
 		AttachCastMotionTool( OwnerID() , 212076 )  --�m���Z�����Ť�
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------
Function Lua_Hao_Test_ENEU00()
	CancelBuff( OwnerID() , 504665 )
end
Function Lua_Hao_Test_ENEU01()
	Addbuff( OwnerID() , 504665 , 0 , -1 )
end