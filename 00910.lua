--���_����

function LuaS_421260() --���_����
	ClearBorder( OwnerID() )
	AddBorderPage( OwnerID(), GetQuestDetail( 421260, 1  ) )
	ShowBorder( OwnerID(), 421260, "[421260]", "ScriptBorder_Texture_Paper" )
end

------
function LuaS_421252_0()
	if CheckAcceptQuest( OwnerID() , 421252) == true then
		LoadQuestOption(OwnerID())
	else
		SetSpeakDetail ( OwnerID(), GetString ( "SC_421252_0" )   )--�Ӧ��A�ڪ��}�_�F�I�ڡI�A�F����H���n�ʥ��I
	end
end


function LuaS_421252_1()
	if CheckAcceptQuest( OwnerID() , 421252) == true then
		SetSpeakDetail ( OwnerID(), GetString ( "SC_421252_1" )   )--((�o�ӤH���G�覺�h���[�A�q�L����۬ݨ����ӬO���n���L�Ϊ��@���A�A�`�N��L����f�S�ۡu���J�v�K�K))
		SetFlag( OwnerID()  , 540959 , 1 )
	else
		LoadQuestOption(OwnerID())
	end
end

function LuaS_421252_2()
	if CheckAcceptQuest( OwnerID() , 421252) == true then
		SetSpeakDetail ( OwnerID(), GetString ( "SC_421252_2" )   )--�A�O�֡H�o�̫ܦM�I���I
		AddSpeakOption ( OwnerID(), TargetID( ), GetString("SC_421252_3") , "LuaS_421252_3", 0 ) --���a�ﶵ�G�O���n���ڨӱϧA��
	else
		LoadQuestOption(OwnerID())
	end
end

function LuaS_421252_3()
	SetFlag( OwnerID()  , 540958 , 1 )
	SetSpeakDetail ( OwnerID(), GetString ( "SC_421252_4" )   )--���I���u�O�Ӧn�F�I��n�A����񪺰[�T�H���ѨM�F�A�ڷ|�ۤv���^�h�����A�°աI
	BeginPlot( TargetID() , "LuaS_421252_4", 0 )	--�k�]
end

function LuaS_421252_4()--������
	local fx = GetMoveFlagValue( 780096 , 0 , EM_RoleValue_X )--�춥�q�X��x
	local fy = GetMoveFlagValue( 780096 , 0 , EM_RoleValue_Y )--�춥�q�X��y
	local fz = GetMoveFlagValue( 780096 , 0 , EM_RoleValue_Z )--�춥�q�X�� z

	MoveToFlagEnabled( OwnerID() , false )--�������޼@��
	Move ( OwnerID() , fx , fy , fz )--���X�l�]�h
	sleep(100)
	ReSetNPCInfo( OwnerID() )
end

function LuaS_421263_0() --�Q�������
	if CheckAcceptQuest( OwnerID() , 421263 ) then
		SetSpeakDetail ( OwnerID(), GetString ( "SC_421263_1" )   )
		--�A�ѨM�F�o�ǰ[�T�H!�O�s�w�n�A�Ӫ��ܡH�u�O�ӷP�§A�F�I�A�w�g�ѨM�F�j�������[�T�H�A���U�ӧڷ|�ۤv�k�^�h���I
		SetFlag( OwnerID()  , 540961 , 1 )
	else
		LoadQuestOption(OwnerID())
	end
end

