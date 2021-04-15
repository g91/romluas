

function LuaS_420826()
	SetPlot( OwnerID(),"touch","LuaS_420826_0",35 )
end

function LuaS_420826_0()
	if CountBodyItem( OwnerID(), 201440)>4 and CountBodyItem( OwnerID(), 201441)>0 then
		BeginPlot(OwnerID(),"LuaS_420826_1",0)--�b���a���W��@�q�{��
	else
		ScriptMessage( OwnerID(), OwnerID(), 1, GetString("EM_420826_0"), 0 )--�A�٨S�ǳƦn!
	end
end


function LuaS_420826_1()

	local CheckFood = SearchRangeNPC ( OwnerID() , 150 , 1 ) --�N����NPC��i��
	local CheckEnd = false
	for i=0,table.getn(CheckFood) do
		if 	ReadRoleValue( CheckFood[i] , EM_RoleValue_OrgID)==110967 or
			ReadRoleValue( CheckFood[i] , EM_RoleValue_OrgID)==100674 then
			ScriptMessage( OwnerID(), OwnerID(), 1, GetString("EM_420826_1"), 0 )--�ݨӧA�o���@�}�l...
			CheckEnd = true
			break
		end
	end

	if CheckEnd == false then
		local Food=CreateObj( 110967 , 1387 , -22 , 3561.6 , 0 , 1)--�T�w�a�I
		AddToPartition( Food ,    0 ) --��J����
		BeginPlot( Food , "LuaS_420826_5" , 0 )--�b�����W��@�q�˼ƾP�����{��
		BeginPlot( Food , "LuaS_420826_2" , 0 )--�b�����W��@�q�ˬd�{��

		local r = ""
		if BeginCastBar( OwnerID(), GetString("EM_420826_1_1") , 40 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_END , 0 ) ~= 1 then
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SAY_NPC_BUSY]" , 0 )
			return
		end-- �N��
		while true do
			sleep( 2 );
			local c = CheckCastBar( OwnerID() )
			if ( c ~= 0 ) then 
				if ( c > 0) then -- ���\�A�ȷ|�O1
					r = "ok"
					EndCastBar( OwnerID() , c )
					break
				else
					if ( c < 0 ) then -- ���ѡA�ȷ|�O-1
						r = "dame"
						DelObj(food)
						EndCastBar( OwnerID() , c )
						break;
					end
				end
			end
		end

		if ( r == "ok" ) then
			DelBodyItem( OwnerID(), 201440, 5 )
			DelBodyItem( OwnerID(), 201441, 1 )
			ScriptMessage( OwnerID(), OwnerID(), 2, GetString("EM_420826_1_2") , 0 )		--�A���\���ިӤF�������էJ!
			BeginPlot(OwnerID(),"LuaS_420826_3",0)
			DelObj(food)
		end
	end
end

function LuaS_420826_2()
	local sec = 0
	local PlayerGroup = {}
	local PlayerCheck = false
	while true do
		if sec > 300 then
			break
		end

		PlayerGroup = SearchRangePlayer( OwnerID() , 150 )

		for i = 0 , table.getn(PlayerGroup) do
			if PlayerGroup[i] == TargetID() then
				PlayerCheck = true
				break
			end
		end

		if PlayerCheck == false then
			DelObj( OwnerID() )
			break
		else
			sec = sec + 1
		end

		sleep(10)
		PlayerCheck = false
	end
end


function LuaS_420826_3()
	local Bunok = CreateObj(100674,1164.6,19,3554.2,0,1)--p1�s�X���էJ
	AddToPartition( Bunok ,    0 ) --��J����
	SetAttack( Bunok , OwnerID())
	BeginPlot( Bunok ,"LuaS_420826_4", 0)

	local mm2=CreateObj(100456 ,1586.9,-40,3425.5,0,1)--p2
	AddToPartition( mm2 ,    0 ) --��J����
	SetAttack( mm2 , OwnerID())
	BeginPlot( mm2 ,"LuaS_420826_4", 0)

	local mm3=CreateObj(100456 ,1520.2,-48,3743.0,0,1)--p3
	AddToPartition( mm3 ,    0 ) --��J����
	SetAttack( mm3 , OwnerID())
	BeginPlot( mm3 ,"LuaS_420826_4", 0)

end


function LuaS_420826_4()
	LuaFunc_Obj_Suicide(60)
end

function LuaS_420826_5()
	for i =1,15 do
		sleep(10)
	end
	DelObj(OwnerID())
end