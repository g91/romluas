function LuaQ_420237_Complet()
	Hide( OwnerID())
	CastSpell( OwnerID(),OwnerID(),490101)
	sleep( 50 )
	local DarkKnight = CreateObjbyObj( 100136, OwnerID() , 1 )
--	AddToPartition( DarkKnight ,0)
	SetRoleCamp( DarkKnight , NPC )  --先不攻擊玩家
	Say( DarkKnight , GetString("YELL_100265_0") )
	 --/*我再次獲得力量……復仇！將所有的恐懼以及屈辱還給這個世界！
	sleep ( 50 )
	CancelBuff( OwnerID(), 500900 )
	SetRoleCamp( DarkKnight , MONSTER )  --開始攻擊玩家
	SetPlot( DarkKnight , "Dead" , "LuaI_100265_Dead" , 40 ) 
	SetAttack( DarkKnight , TargetID() )
	DelObj( OwnerID() )
end
-----------------------------------------------------------------------------------------------------
function LuaI_100265_Dead()

	SAY( OwnerID() , GetString("YELL_100265_1") )
	 --/*無知的人類！你們愚蠢的行為只能讓安多利爾沉睡，但永遠無法將安多利爾的存在抹滅！	

end