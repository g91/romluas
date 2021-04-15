function LuaS_110539()

	LoadQuestOption( OwnerID() );  --載入任務模板
	if CheckAcceptQuest( OwnerID() ,420192 ) == true and CountBodyItem( OwnerID() , 200651 ) < 1 then
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110539_1") , "LuaS_110539_1", 0 ); --/* 你就是莫里辛，快把配方交出來！
--		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_POINT") , "LuaS_110539_EXIT", 0 ); --/*（……）
	else
--		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_POINT") , "LuaS_110539_EXIT", 0 ); --/*（……）
	end
end

function LuaS_110539_1()
	CloseSpeak(OwnerID())
	Say( TargetID() , GetString("ST_110539_1") ) --/* 要我交出配方？那是不可能的！！！
	BeginPlot(TargetID() , "LuaFunc_110539_Reset" , 0 )
end

function LuaS_110539_EXIT()
	CloseSpeak(OwnerID())
end

Function LuaFunc_110539_Reset()
	MoveToFlagEnabled( OwnerID() , False )
	local Obj = Role:new( OwnerID() ) 

	local BaseX = Obj :X()
 	local BaseY = Obj :Y();
 	local BaseZ = Obj :Z();
	local BaseDir = Obj:Dir();

	Hide( OwnerID() )
	local Farmer = CreateObj(100081, BaseX, BaseY, BaseZ, BaseDir, 1 )
	SetPlot( Farmer , "dead" , "LuaFunc_110539_Dead" , 40 )	
	AddToPartition( Farmer, 0 )
	SetAttack( Farmer , TargetID())
	sleep(60)
	while 1 do
		if ReadRoleValue( Farmer , EM_RoleValue_AttackTargetID ) ~= 0 and CheckID(Farmer) == true then  --檢查是否離開戰鬥
			sleep(60)	-- 六秒檢查一次	
		else
			if CheckID( Farmer) == true then
				if ReadRoleValue( Farmer , EM_RoleValue_IsDead ) == 0 then
					DelObj( Farmer )
				end
			end 
			sleep( 300 )
			Show( OwnerID() , 0 )
			MoveToFlagEnabled( OwnerID() , True )
			break		
		end
	sleep(1)
	end
end

function LuaFunc_110539_Dead()
	local AA = CreateObjByFlag( 100078 , 780020 , 4 , 1 )
	BeginPlot( AA , "LuaFunc_110539_Drama" , 0 )
	return true
end

function LuaFunc_110539_Drama()
	local AA = CreateObjByFlag( 100078 , 780020 , 5 , 1 )
	SetFightMode ( OwnerID(),0, 0, 0,0 )
	SetFightMode ( AA,0, 0, 0,0 )
	sleep(20)
	AddToPartition( OwnerID() , 0 )
	AddToPartition( AA , 0 )
	sleep(20)
	Say( OwnerID() , GetString("SC_110539_1") )
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	sleep(30)	
	Say( AA , GetString("SC_110539_2") )
	PlayMotion( AA ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	sleep(30)	
	Say( OwnerID() , GetString("SC_110539_3") )
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SPEAK)
--	AdjustFaceDir( OwnerID(), AA , 0 ) 
	sleep(30)	
	Say( AA , GetString("SC_110539_4") )
	PlayMotion(AA,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	sleep(30)	
--	AdjustDir(AA , 180 )
	DelObj( AA )
	Say( OwnerID() , GetString("SC_110539_5") )
	sleep(30)	
	DelObj( OwnerID() )
end
function LuaS_421456() --可疑的信件

	ClearBorder( OwnerID() );
	AddBorderPage( OwnerID(), GetQuestDetail(421456, 1  ) );

	ShowBorder( OwnerID(), 421456, "[202888]", "ScriptBorder_Texture_Paper" );	

end