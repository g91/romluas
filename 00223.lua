function LuaQ_420072_Onclick()
	if CountBodyItem(OwnerID(),200037) == 0 then
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_420072_0"), 0 ); --/*�ݭn�ڹҵ����C
		return -1
	else
		return 1
	end
end
--------------------------------------------------------------------------------------------------------
function LuaQ_420072_AfterClick()
	BeginPlot( TargetID(),"LuaQ_420072_2",0)
	SetPlot( TargetID(),"touch","LuaFunc_Obj_BUSY",40)
	return 1
end
-------------------------------------------------
Function LuaQ_420072_2() --�l��Ǫ��������@��

	local m
	local b
	local time
	local check = "YES"
	CastSpell( OwnerID(),OwnerID(),490100)--�b�����W����@�q�S��
	--�x�s�Ǫ�ID���}�C
	local GuardList = {}
	for i = 1 , 12 , 1 do
		GuardList[i] = 0
	end
	local DBID = ReadRoleValue( TargetID(), EM_RoleValue_DBID ) 
	local HP

	for i = 0 , 11 , 1  do 
		if  Luafunc_Player_Alive( TargetID(),DBID,100 ) == false or ReadRoleValue( TargetID(), EM_RoleValue_IsDead) == 1 then 
			--�ˬd���a�O�_�s���άO���}
--			Say( OwnerID(),"���ȥ���")
			ScriptMessage( TargetID(), TargetID(), 0, GetString("EM_420072_1"), 0 ); --/*�������_�A��ƥ��ѤF�C
			CancelBuff( OwnerID(), 500899 );--�M���즳���S��BUFF
			Check = "NO"
			break
		else
			if i == 0 or i == 3 or i == 6 or i == 9 then --���ͥ|�i�Ǫ��A�C�i3��
				for j = 1 , 3 , 1 do
					m = i + j
					b = 600 - i*50
					GuardList[m] = CreateObjByFlag ( 100064 , 780021, j ,1 )
					AddToPartition(GuardList[m] , 0)
					WriteRoleValue( GuardList[m] , EM_RoleValue_PID,b)
--					Say(  GuardList[m] ," m = "..m.." i = "..i.." j = "..j.." b = "..b.." DBID = "..DBID)
					BeginPlot(GuardList[m],"LuaQ_420072_4",0)
					SetAttack( GuardList[m] , TargetID() );
					if ReadRoleValue( GuardList[m] ,EM_RoleValue_IsNPC ) ~= 0 then
						HP = ReadRoleValue( GuardList[m] ,EM_RoleValue_HP )
						WriteRoleValue( GuardList[m] ,EM_RoleValue_HP ,  HP/2 )
					end
				end
			end
			time = (600 - i*50)/10
--			if time > 0 then
--				Say( TargetID(),"�٦�"..time.."��")
--			end
		end
		sleep(50)
	end

	--�M���ݾl�Ǫ�
	for i = 1 , 12 , 1 do
		if CheckID( GuardList[i] ) == true then
			Delobj( GuardList [i])
		end
	end
	CancelBuff( OwnerID(), 500899 );--�M���즳���S��BUFF
	if  Luafunc_Player_Alive( TargetID(),DBID,100 ) == true and CountBodyItem(TargetID() , 200037 ) > 0 and Check == "YES" then
--		Say( OwnerID(),"�A���\���s�y�F���F�������C")
		ScriptMessage( TargetID(), TargetID(), 0, GetString("EM_420072_2"), 0 ); --/*�A���\�a��ƤF�ڹҵ����C
		DelBodyItem( TargetID() , 200037 , 1 )
		GiveBodyItem( TargetID(), 200060 , 1)	
	end 	
--	SetPlot( OwnerID(),"touch","LuaQ_420072_1",40)	
	SetPlot( OwnerID(),"touch","",0)		
end
---------------------------------------------------------------------------------------------
function LuaQ_420072_4()
	local t = ReadRoleValue( OwnerID() , EM_RoleValue_PID)
--	Say( OwnerID()," t = "..t.." LiveTime = "..ReadRoleValue( OwnerID() , EM_RoleValue_LiveTime ))
	SetPlot( OwnerID() , "dead" , "LuaQ_420072_dead" , 0 )
	LuaFunc_Obj_Suicide(t)
end
-----------------------------------------------------------------------------------------------	
function LuaQ_420072_dead()
	Beginplot( OwnerID() , "LuaFunc_DeadPlay" , 0 )
	return false
end