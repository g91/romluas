
function LuaI_202364_0() --神秘精華
	local str = "["..GetUseItemGUID(OwnerID()).."]"
	ClearBorder( OwnerID() );
	AddBorderPage( OwnerID(), GetQuestDetail( 421186, 1  ) );

	ShowBorder( OwnerID(), 421186, str , "ScriptBorder_Texture_Paper" );	

end

----------------------------------------------------------------------------------------------鹿角精華

function luaI_202382_0()
	local Target = ReadRoleValue( TargetID() , EM_RoleValue_OrgID)
	if CheckAcceptQuest( OwnerID() , 421183 ) == false or CheckCompleteQuest( OwnerID() , 421183 ) == true then
		ScriptMessage( OwnerID(), OwnerID(), 1 , GetString("SC_421183_0") , 1 ) --#任務不符合(參數1是讓訊息SHOW在螢幕中央)。
		ScriptMessage( OwnerID(), OwnerID(), 0 , GetString("SC_421183_0") , 1 ) --#任務不符合
		return false
	elseif CountBodyItem( OwnerID() , 202363) >= 20 then
		ScriptMessage( OwnerID(), OwnerID(), 1 , GetString("SC_421183_1") , 1 ) --#已經有20個鹿角精華。
		ScriptMessage( OwnerID(), OwnerID(), 0 , GetString("SC_421183_1") , 1 ) --#已經有20個鹿角精華。
		return false
	elseif CountBodyItem( OwnerID() , 201463) == 0 then
		ScriptMessage( OwnerID(), OwnerID(), 1 , GetString("SC_421183_4") , 1 ) --#你沒有任何優質鹿角。
		ScriptMessage( OwnerID(), OwnerID(), 0 , GetString("SC_421183_4") , 1 ) --#你沒有任何優質鹿角。
		return false
                else
                               return true
                end     
end             

function luaI_202382_1()
        local RND =  Rand( 99 ) + 1
	if ( RND <= 70 ) then
                        ScriptMessage( OwnerID(), OwnerID(), 1 , GetString("SC_421183_2") , 1 ) --#鹿角發出一道強光     
	         ScriptMessage( OwnerID(), OwnerID(), 0 , GetString("SC_421183_2") , 1 ) --#鹿角發出一道強光     	
                        BeginPlot( OwnerID() , "luaI_202382_self" , 0 )		                   
	        GiveBodyItem(OwnerID() , 202363 , 1 )
                else
	       ScriptMessage( OwnerID(), OwnerID(), 1 , GetString("SC_421183_3") , 1) --#汲取精華失敗     
	       ScriptMessage( OwnerID(), OwnerID(), 0 , GetString("SC_421183_3") , 1) --#汲取精華失敗     	
	       BeginPlot( OwnerID() , "luaI_202382_self" , 0 )	                   
	end
end

function luaI_202382_self()	
	DelBodyItem ( OwnerID() , 201463 , 1 )
end
------------------------------------------------------------------------------------------神秘水晶球

function luaI_202381_Effect()
             	ScriptMessage( OwnerID(), OwnerID(), 1 , GetString("SC_421199_0") , 1) --#水晶球發出一道強光
	ScriptMessage( OwnerID(), OwnerID(), 0 , GetString("SC_421199_0") , 1) --#水晶球發出一道強光
	local Obj = Role:new( OwnerID() ) 
	local BaseX = Obj :X()
	local BaseY = Obj :Y();
	local BaseZ = Obj :Z();
	local BaseDir = Obj:Dir();
	local ghost  = CreateObj(100738, BaseX, BaseY, BaseZ, BaseDir -180, 1 )	
	AddToPartition( ghost , 0 )
	SetAttack( ghost , TargetID())      
	BeginPlot( ghost , "LuaN_100738_say" , 0 )
	Setplot( ghost , "dead" , "star_100738_Dead" , 30)	
end
function LuaN_100738_say()
	sleep(20)	
	Say( OwnerID(),  GetString("SC_100738_0")) 
end
function star_100738_Dead()
	Yell(OwnerID() , "[SC_100738_1]" , 5)
end
