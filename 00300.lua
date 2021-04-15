----------------------------------------------------------------------------------------------------------
--奧古達之墓
function LuaI_110252()
	SetPlot( OwnerID() , "touch" , "LuaI_110252_1" , 100 )
end

function LuaI_110252_1()
	if CountBodyItem( OwnerID() , 200735 ) > 0 and CheckAcceptQuest( OwnerID() , 420281) == true then
		ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("EM_420296_0") , C_SYSTEM )
		DelBodyItem( OwnerID() , 200735 , 1)
		SetPlot(TargetID(),"touch","",0)
		BeginPlot( TargetID() , "LuaI_110252_2" , 0 )
	elseif CountBodyItem( OwnerID() , 200744 ) > 0 and CheckAcceptQuest( OwnerID() , 420296) == true then
		ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("EM_420296_1") , C_SYSTEM )
		DelBodyItem( OwnerID() , 200744 , 1)
		SetPlot(TargetID(),"touch","",0)
		BeginPlot( TargetID() , "LuaI_110252_3" , 0 )
	end
			
end
function LuaI_110252_2()
	local RFG = CreateObjByFlag( 110702 , 780036 , 0 , 1 )
	AddToPartition( RFG , 0 )
	DisableQuest(RFG, true )
	MoveToFlagEnabled( RFG, false );
	WriteRoleValue( RFG ,EM_RoleValue_IsWalk , 1  )
	LuaFunc_MoveToFlag( RFG, 780036 , 1 ,0 )
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_COMBAT_UNARMED)
	sleep( 30 )
	local OGD = CreateObjByFlag( 110253 , 780036 , 2 , 1 )
	DisableQuest(OGD, true )	
	AddToPartition( OGD , 0 )
	CastSpell( OGD,OGD, 490102 );-- 命令巨石陣施展一個法術產生新特效
	sleep(50)--休息3秒
	DelObj( RFG )
	CancelBuff( OGD, 500902 );--清掉新特效BUFF

	AdjustFaceDir( OGD, TargetID(), 0 )
	DisableQuest(OGD, false )
	BeginPlot( OGD , "LuaI_110253" , 0 )
			
end

function LuaI_110252_3()

	local OGD = CreateObjByFlag( 110734 , 780036 , 2 , 1 )
	DisableQuest(OGD, true )
	AddToPartition( OGD , 0 )
	CastSpell( OGD, OGD, 490102 );-- 命令巨石陣施展一個法術產生新特效
	sleep(50)--休息3秒
	CancelBuff( OGD, 500902 );--清掉新特效BUFF
	AdjustFaceDir( OGD, TargetID(), 0 )
	DisableQuest(OGD, false )
	BeginPlot( OGD , "LuaI_110253" , 0 )
			
end
	
function LuaI_110253()

	sleep( 600 )
	SetPlot( TargetID() , "touch" , "LuaI_110252_1" , 40 )
	DelObj( OwnerID() )

end