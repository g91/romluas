function andrus_searchnpc()
	local ttable = {}  --創出一個table裝要search的npc
 	ttable = SearchRangeNPC ( OwnerID() , 30 )  --search週圍30內的所有npc
		for i=0 , table.getn(ttable) do
			if ReadRoleValue(ttable[i],EM_RoleValue_OrgID) == 117786 then
			GiveBodyItem(OwnerID(),209238 ,1 )
			else
			Say(OwnerID(),"[SC_424046_01]")
			return
		end
	end

end

function Archeology_searchnpc_00()
	local X=0
	local Y=0
	local own=OwnerID()
	local Atable={}
	Atable=SearchRangeNPC ( own , 30 )
	local Box=table.getn(Atable)
		for i=0 ,Box  do
			local Z = ReadRoleValue(Atable[i],EM_RoleValue_OrgID)
			if Z == 117786 and CheckAcceptQuest( Own, 424046 ) then
				X=X+1
			elseif Z == 117787 and CheckAcceptQuest( Own, 424047 ) then
				Y=Y+1
			end
		end
		if  X~=0 or Y~=0 then
				return true
			else 
				ScriptMessage( own,  own , 2 ,"[SC_424046_01]" , 2 )
				return false
		end
end


function Archeology_searchnpc_02()	
	local ttable = {}  --創出一個table裝要search的npc
 	ttable = SearchRangeNPC ( OwnerID() , 30 )  --search週圍30內的所有npc
	local NUM=table.getn(ttable)
		for i=0 , NUM-1 do
			local X =ReadRoleValue(ttable[i],EM_RoleValue_OrgID) 
			if X == 117786 and CountbodyItem( OwnerID(), 209238 )==0 then
			SetModeEx(ttable[i],EM_SetModeType_Mark,TRUE)
			elseif X == 117787 and CountbodyItem( OwnerID(), 209236 )==0 then
			SetModeEx(ttable[i],EM_SetModeType_Mark,TRUE)
			elseif
			X == 117786 and CountbodyItem( OwnerID(), 209238 )==1 then
			SetModeEx(X,EM_SetModeType_Mark,false)
			elseif
			X == 117787 and CountbodyItem( OwnerID(), 209238 )==1 then
			SetModeEx(X,EM_SetModeType_Mark,false)
			--Say(OwnerID(),"[SC_424046_01]")
		end
	end
end

function dr_setnodemaekclose_01()
	--SetModeEx(TargetID(),EM_SetModeType_Mark,TRUE)
	Say(OwnerID(),TargetID())
	return 1
end


function dr_border_01()
	local Str = "["..GetUseItemGUID(OwnerID()).."]"		--傑瑞米的文件
	ClearBorder( OwnerID());	--初始化石碑介面
	AddBorderPage( OwnerID(), "[SC_117742_01]")
	AddBorderPage( OwnerID(), "[SC_117742_02]")
	AddBorderPage( OwnerID(), "[SC_117742_03]")
	ShowBorder( OwnerID(),0, str,"ScriptBorder_Texture_Paper" )	
end

function dr_border_02()
	local Str = "["..GetUseItemGUID(OwnerID()).."]"		--漢森的文件>莉莉安
	ClearBorder( OwnerID());	--初始化石碑介面
	AddBorderPage( OwnerID(), "[SC_117792_01]")
	ShowBorder( OwnerID(), 0, str,"ScriptBorder_Texture_Paper" )	
end


function dr_border_03()
	local Str = "["..GetUseItemGUID(OwnerID()).."]"		--奧克拉夫>艾薩克
	ClearBorder( OwnerID());	--初始化石碑介面
	AddBorderPage( OwnerID(), "[SC_117823_01]")
	ShowBorder( OwnerID(), 0, str,"ScriptBorder_Texture_Paper" )	
end


function dr_border_04()
	local Str = "["..GetUseItemGUID(OwnerID()).."]"		--達奇尼斯>莎潘思
	ClearBorder( OwnerID());	--初始化石碑介面
	AddBorderPage( OwnerID(), "[SC_117817_01]")
	ShowBorder( OwnerID(), 0, str,"ScriptBorder_Texture_Paper" )	
end

function Luas_dr_117742_01()				--傑瑞米的文件
	local Pages = {"[SC_117742_01]", "[SC_117742_02]", "[SC_117742_03]" }
	FA_Border( OwnerID(),  Pages)

end 



