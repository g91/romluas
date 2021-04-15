---------NPC���--------------

function LuaS_111338_0()
	if 	CheckAcceptQuest( OwnerID() , 421427 ) and
		CountBodyItem( OwnerID() , 202560 ) < 4 then

		LoadQuestOption(OwnerID())
		AddSpeakOption ( OwnerID(), TargetID( ), GetString("SC_111338_0") , "LuaS_111338_1", 0 ) --���a�ﶵ�G�ڷǳƦn�A���M�j�a���^�б�Ĳ

	elseif 	CheckAcceptQuest( OwnerID() , 421428 ) and
		CheckFlag(OwnerID() , 541592 ) == false then

		LoadQuestOption(OwnerID())
		AddSpeakOption ( OwnerID(), TargetID( ), GetString("SC_111338_0") , "LuaS_111338_1", 0 ) --���a�ﶵ�G�ڷǳƦn�A���M�j�a���^�б�Ĳ

	elseif 	CheckAcceptQuest( OwnerID() , 421429 ) and
		CheckFlag(OwnerID() , 541793 ) == false then

		LoadQuestOption(OwnerID())
		AddSpeakOption ( OwnerID(), TargetID( ), GetString("SC_111338_0") , "LuaS_111338_1", 0 ) --���a�ﶵ�G�ڷǳƦn�A���M�j�a���^�б�Ĳ
	else
		LoadQuestOption(OwnerID())
	end
end

function LuaS_111338_1()
	if CheckAcceptQuest( OwnerID() , 421427 ) then

		CloseSpeak(OwnerID())
		BeginPlot( TargetID() , "LuaS_421427_0" , 0 )

	elseif CheckAcceptQuest( OwnerID() , 421428 ) then

		CloseSpeak(OwnerID())
		BeginPlot( TargetID() , "LuaS_421428_0" , 0 )

	elseif CheckAcceptQuest( OwnerID() , 421429 ) then

		CloseSpeak(OwnerID())
		BeginPlot( TargetID() , "LuaS_421429_0" , 0 )

	end
end-----------�Ф򵧥۸O����
function LuaS_421426_0()

	ClearBorder( OwnerID() )
	AddBorderPage( OwnerID(), GetQuestDetail( 421426, 1  ) )
	ShowBorder( OwnerID(), 421426, "[421426]", "ScriptBorder_Texture_Paper" )

end

--------���{�j�Գ�







function LuaS_421427_0()

	DisableQuest( OwnerID() , true )--����������

	CastSpell( OwnerID() , OwnerID() , 491276  )
	sleep(40)

	local Monster1 = LuaS_Discowood_FlagShowMonster( 100884 , TargetID() , 780089 , 1 , "LuaS_421427_1" )
	local Monster2 = LuaS_Discowood_FlagShowMonster( 100884 , TargetID() , 780090 , 2 , "LuaS_421427_2" )
	local Monster3 = LuaS_Discowood_FlagShowMonster( 100884 , TargetID() , 780091 , 1 , "LuaS_421427_3" )
	local Monster4 = LuaS_Discowood_FlagShowMonster( 100884 , TargetID() , 780092 , 1 , "LuaS_421427_4" )

	while CheckID( Monster1 ) or CheckID( Monster2 ) or CheckID( Monster3 ) or CheckID( Monster4 )  do
		sleep(30)
	end

	DisableQuest( OwnerID() , false )--�}�񱵥���

end

function LuaS_421427_1()
	Say(OwnerID() , GetString("SC_421427_1") ) -- ���`�۪����I�O���L�k�]�F�I
	SetPlot( OwnerID() , "dead" , "LuaS_421427_5" , 30)
	LuaS_Discowood_CheckPeace()
end

function LuaS_421427_2()
	Say(OwnerID() , GetString("SC_421427_2") ) --���F�L�I
	SetPlot( OwnerID() , "dead" , "LuaS_421427_5" , 30)
	LuaS_Discowood_CheckPeace()
end

function LuaS_421427_3()
	Say(OwnerID() , GetString("SC_421427_3") ) -- ���L�̪��D�S�������l���|������U���I
	SetPlot( OwnerID() , "dead" , "LuaS_421427_5" , 30)
	LuaS_Discowood_CheckPeace()
end

function LuaS_421427_4()
	Say(OwnerID() , GetString("SC_421427_4") ) -- ��ߡA�@���N�n�����F�I
	SetPlot( OwnerID() , "dead" , "LuaS_421427_5" , 30)
	LuaS_Discowood_CheckPeace()
end

function LuaS_421427_5()
	GiveBodyItem( TargetID() , 202560 , 1 )
	DelObj(OwnerID())
	return false
end