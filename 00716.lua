
function LuaS_421237_0()
	if CountBodyItem( OwnerID() , 202400) > 0 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("SC_421237_1") , 0 )	--�A���}�g����I�U���ءK�K
		return true
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("SC_421237_0") , 0 )	--�A�w�g�S�����ؤF�I
		return false
	end
end

function LuaS_421237_1()
	DelBodyItem(OwnerID(),202400,1)
	ScriptMessage( OwnerID() , OwnerID() , 2 , GetString("SC_421237_2") , 0 )	--�A�N�I�U�����ة�i���}���g��K�K
	local Target = LuaFunc_CreateObjByObj ( 111229 , TargetID() )
	AddToPartition( Target , 0 )
	BeginPlot(TargetID() , "LuaS_421237_3" , 0 )
	BeginPlot(Target , "LuaS_421237_2" , 0)--�C���A�����бN�|�۰ʾP���C
	return 1
end

function LuaS_421237_2()
	sleep(70)
	DelObj(OwnerID())
end

function LuaS_421237_3()
	ReSetNPCInfo( OwnerID() )
end