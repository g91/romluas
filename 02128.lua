function Lua_Un_116886()	--���b���Ȫ��~����l�@�����U
	SetPlot( OwnerID(),"touch","Lua_116886_do",30 )--Ĳ�I�@��
end

function Lua_116886_do()
	BeginPlot( TargetID(), "Lua_116886_Get", 0 )--�����˨��@��
end


function Lua_116886_Get()	
	local O_ID = OwnerID()	--�I������
	local T_ID = TargetID()	--���a
	--local QuestID = 422080 			--##�һݪ����Ƚs��
	local item = 208309 			--##��o���~
	local num = 1 					--##��o�ƶq
	local time = 0 --���󭫥ͮɶ�  �@��ة� �ݭn�񭫥ͮɶ�  script���Ƕ�0
	--if CheckQuest( T_ID, QuestID , 0 ) == true then
		CallPlot( O_ID, "ks_SquatGetItem", T_ID, item, num, time ) -- �ؼ�(target���a) ��o���~(item) �ƶq(num) �ɶ�(time)					
	--else
		--ScriptMessage( O_ID, T_ID, 1, "[SC_Z16_REQUIRE]" , 0 ) --�S���ŦX���e�U����
	--end
end

--(2)
function Lua_116886_create()	----���b���Ϊ��󪺪�l�@�����U�Afor�ͪ��� 
	local FlagObjID = 780806  --�X�m����s�� 
	local FlagNum = GetMoveFlagCount( FlagObjID ) --�X�m�ƶq
	local Obj = 116886 --�شӪ���s��
	local ObjNum = math.floor( FlagNum / 2 )   --�شӪ���ƶq
	local resetTime = 10 --���s�ɶ�(��) 
	local Range = 20	--���󲣥ͦb�X�m���d��
	local Gravity = true --���L���O
	
	ks_CreateObj( FlagObjID, FlagNum, Obj, ObjNum, resetTime, Range, Gravity )
end	