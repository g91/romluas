----------------��Ẹ�D��������
function LuaS_111575_Sweets0()
LoadQuestOption( OwnerID() )
local BuffType = 0
local Count = BuffCount ( OwnerID())
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
		if GameObjInfo_int ( BuffID , "AssistType" ) == 58 then
			BuffType = GameObjInfo_int ( BuffID , "AssistType" )
			break
		end
	end
	if BuffType == 58 then		--/*���ܨ��X�{��ܿﶵ
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_TRICK_OR_TREAT") , "LuaS_111575_Sweets0_1", 0 ) --�����}�A�N�o�J�I
	end
end

function LuaS_111575_Sweets0_1()

	if CheckFlag( OwnerID()  , 542148 ) == false then --/*�ˬd�O�_���L
		SetFlag( OwnerID()  , 542148 , 1 )	--/*���L���X��


		local P = 100
		local XX = Rand( P )      
			if XX >= 50 and XX < 100 then   --50%	
				GiveBodyItem( OwnerID() , 203140 , 1 )	--/*���_�Ǫ��n�}

			elseif XX >= 5 and XX < 50 then --45%
				GiveBodyItem( OwnerID() , 203139 , 1 )	--/*�����q���n�}
	
			elseif XX >= 0 and XX < 5 then --5%	
				GiveBodyItem( OwnerID() , 203138 , 1 )	--/*�����ųn�}
			end


		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_DIALOG")   )--�~���ڤF�I���ꪺ�u�����A�o�ӿ}�G���A�I
	else
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_TOMORROW")   )--�A���Ѥw�g���L�}�G�F�I���ѦA�ӧa�I
	end		
end

----------------���e�S�D��������
function LuaS_111575_Sweets1()
LoadQuestOption( OwnerID() )
local BuffType = 0
local Count = BuffCount ( OwnerID())
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
		if GameObjInfo_int ( BuffID , "AssistType" ) == 58 then
			BuffType = GameObjInfo_int ( BuffID , "AssistType" )
			break
		end
	end
	if BuffType == 58 then		--/*���ܨ��X�{��ܿﶵ
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_TRICK_OR_TREAT") , "LuaS_111575_Sweets1_1", 0 ) --�����}�A�N�o�J�I
	end
end

function LuaS_111575_Sweets1_1()

	if CheckFlag( OwnerID()  , 542149 ) == false then --/*�ˬd�O�_���L
		SetFlag( OwnerID()  , 542149 , 1 )	--/*���L���X��


		local P = 100
		local XX = Rand( P )      
			if XX >= 30 and XX < 100 then   --70%	
				GiveBodyItem( OwnerID() , 203139 , 1 )	--/*�����q���n�}

			elseif XX >= 20 and XX < 30 then --10%
				GiveBodyItem( OwnerID() , 203138 , 1 )	--/*�����ųn�}
	
			elseif XX >= 0 and XX < 20 then --20%	
				GiveBodyItem( OwnerID() , 203140 , 1 )	--/*���_�Ǫ��n�}
			end


		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_DIALOG")   )--�~���ڤF�I���ꪺ�u�����A�o�ӿ}�G���A�I
	else
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_TOMORROW")   )--�A���Ѥw�g���L�}�G�F�I���ѦA�ӧa�I
	end		
end

----------------���m�D��������
function LuaS_111575_Sweets2()
LoadQuestOption( OwnerID() )
local BuffType = 0
local Count = BuffCount ( OwnerID())
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
		if GameObjInfo_int ( BuffID , "AssistType" ) == 58 then
			BuffType = GameObjInfo_int ( BuffID , "AssistType" )
			break
		end
	end
	if BuffType == 58 then		--/*���ܨ��X�{��ܿﶵ
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_TRICK_OR_TREAT") , "LuaS_111575_Sweets2_1", 0 ) --�����}�A�N�o�J�I
	end
end

function LuaS_111575_Sweets2_1()

	if CheckFlag( OwnerID()  , 542150 ) == false then --/*�ˬd�O�_���L
		SetFlag( OwnerID()  , 542150 , 1 )	--/*���L���X��


		local P = 100
		local XX = Rand( P )      
			if XX >= 50 and XX < 100 then   --50%	
				GiveBodyItem( OwnerID() , 203139 , 1 )	--/*�����q���n�}

			elseif XX >= 5 and XX < 50 then --45%
				GiveBodyItem( OwnerID() , 203140 , 1 )	--/*���_�Ǫ��n�}
	
			elseif XX >= 0 and XX < 5 then --5%	
				GiveBodyItem( OwnerID() , 203138 , 1 )	--/*�����ųn�}
			end


		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_DIALOG")   )--�~���ڤF�I���ꪺ�u�����A�o�ӿ}�G���A�I
	else
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_TOMORROW")   )--�A���Ѥw�g���L�}�G�F�I���ѦA�ӧa�I
	end		
end

----------------�w�R�D��������
function LuaS_111575_Sweets3()
LoadQuestOption( OwnerID() )
local BuffType = 0
local Count = BuffCount ( OwnerID())
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
		if GameObjInfo_int ( BuffID , "AssistType" ) == 58 then
			BuffType = GameObjInfo_int ( BuffID , "AssistType" )
			break
		end
	end
	if BuffType == 58 then		--/*���ܨ��X�{��ܿﶵ
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_TRICK_OR_TREAT") , "LuaS_111575_Sweets3_1", 0 ) --�����}�A�N�o�J�I
	end
end

function LuaS_111575_Sweets3_1()

	if CheckFlag( OwnerID()  , 542151 ) == false then --/*�ˬd�O�_���L
		SetFlag( OwnerID()  , 542151 , 1 )	--/*���L���X��


		local P = 100
		local XX = Rand( P )      
			if XX >= 55 and XX < 100 then   --45%	
				GiveBodyItem( OwnerID() , 203139 , 1 )	--/*�����q���n�}

			elseif XX >= 5 and XX < 55 then --50%
				GiveBodyItem( OwnerID() , 203140 , 1 )	--/*���_�Ǫ��n�}
	
			elseif XX >= 0 and XX < 5 then --5 %	
				GiveBodyItem( OwnerID() , 203138 , 1 )	--/*�����ųn�}
			end


		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_DIALOG")   )--�~���ڤF�I���ꪺ�u�����A�o�ӿ}�G���A�I
	else
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_TOMORROW")   )--�A���Ѥw�g���L�}�G�F�I���ѦA�ӧa�I
	end		
end

----------------�v�үS�D��������
function LuaS_111575_Sweets4()
LoadQuestOption( OwnerID() )
local BuffType = 0
local Count = BuffCount ( OwnerID())
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
		if GameObjInfo_int ( BuffID , "AssistType" ) == 58 then
			BuffType = GameObjInfo_int ( BuffID , "AssistType" )
			break
		end
	end
	if BuffType == 58 then		--/*���ܨ��X�{��ܿﶵ
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_TRICK_OR_TREAT") , "LuaS_111575_Sweets4_1", 0 ) --�����}�A�N�o�J�I
	end
end

function LuaS_111575_Sweets4_1()

	if CheckFlag( OwnerID()  , 542152 ) == false then --/*�ˬd�O�_���L
		SetFlag( OwnerID()  , 542152 , 1 )	--/*���L���X��


		local P = 100
		local XX = Rand( P )      
			if XX >= 35 and XX < 100 then   --65%	
				GiveBodyItem( OwnerID() , 203139 , 1 )	--/*�����q���n�}

			elseif XX >= 5 and XX < 35 then --30%
				GiveBodyItem( OwnerID() , 203140 , 1 )	--/*���_�Ǫ��n�}
	
			elseif XX >= 0 and XX < 5 then --5 %	
				GiveBodyItem( OwnerID() , 203138 , 1 )	--/*�����ųn�}
			end


		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_DIALOG")   )--�~���ڤF�I���ꪺ�u�����A�o�ӿ}�G���A�I
	else
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_TOMORROW")   )--�A���Ѥw�g���L�}�G�F�I���ѦA�ӧa�I
	end		
end