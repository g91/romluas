function LuaAS_test_01()
	local X = 2
	local Y = 2
		while X < 10 do
			while Y < 10 do
				Say(OwnerID(),X.."x"..Y.."="..X*Y)
				Sleep(10)
				Y = Y+1
			end
			if 	X == 4	 	and
				Y == 10 		then
			break
			end
			X = X+1
			Y = 2
		end
end

	

function LuaAS_test_02()
	local AS_StringTable = {"1","2","3","4","5"}
	for Y =1,5 	do
		local X = Rand(4)
		X = X+1
		Say(OwnerID(),AS_StringTable[X])
		sleep(10)
	end
end


Function LuaAS_test_03() 

local Player = {1,5,7,10,30,40}
-- �|�����Ӫ��a�g�L��A���W���o���Ӥ��P���Ū��H�C
local MonsterTable = {100015,100017,100055}
-- �ڦ��T�ةǪ���A�W���o�T�ءC
local monster = {}
-- �ڵ����n��X�{�L���ǩǪ��A�@�������O�bmonster�o��table�̭���C
local BornCount = {0,0,0}
-- �M��ڦ��T�ةǪ��A�ڭn�ӧO�p��L�̥X�{�L�X���C
local PC_LV
-- �����{����ڻ��g�L���a�X���Ū��ɭԧڭn��i�h���

PC_LV = player[rand(5)+1]
-- �H�K�q���Ӫ��a�̭���@���X�ӡI

say (OwnerID() , "��" .. PC_LV .. "�ų�I")
-- ���i�ۤv�����šI

if PC_LV < 11 then
-- �ҥH���a�O���O�Q�ťH���H
	table.insert(monster, monstertable[1])
	-- ��monstertable�̭���1�檺�Ǫ��A���imonster���̫᭱�A�O���_�ӡC
	BornCount[1] = BornCount[1] +1
	-- �bBornCount����1��A�O���ڡ]�S�^��F�@����1�ةǪ��C
elseif PCLV < 31 then
-- �ҥH���a�O���O�T�Q�ťH���H
	table.insert(monster, monstertable[2])
	-- ��monstertable�̭���2�檺�Ǫ��A���imonster���̫᭱�A�O���_�ӡC
	BornCount[2] = BornCount[2] +1
	-- �bBornCount����2��A�O���ڡ]�S�^��F�@����2�ةǪ��C
else
-- �����O��H
	table.insert(monster, monstertable[3])
	-- ��monstertable�̭���3�檺�Ǫ��A���imonster���̫᭱�A�O���_�ӡC
	BornCount[3] = BornCount[3] +1
	-- �bBornCount����3��A�O���ڡ]�S�^��F�@����3�ةǪ��C
end

end


function LUAfafa_test_01()

local Player = {800011,800012,800013,800014,800015,800016}
local Kill = {10,5,9,2,1,4}
-- �D�ش��ܤ��e�C
local resort_kill = {0}
local resort_id = {1}
local PCnum = gottable.getn (Player)
local KLnum = gottable.getn (Kill)
local RSnum
local check_a = 0
local i = 2
local j
local k
local l = 1


	resort_kill[1] = Kill[1]
	resort_kill[1] = Kill[1]
	while i < (PCnum+1)	do
		j = 1
		while j < (PCnum+1)	do
			if Kill[i] > resort_kill[j] 	then
				table.insert(resort_kill, 0)
				table.insert(resort_id, 0)
				RSnum = gottable.getn (resort_kill)
				k = 1
				while k < (RSnum-j+1)	do
					resort_kill[RSnum-k+1] = resort_kill[RSnum-k]
					resort_id[RSnum-k+1] = resort_id[RSnum-k]
					k = k + 1
				end
				resort_kill[j] = kill[i]
				resort_id[j] = i
				check_a = 1
			end 
			j = j + 1
		end
		if check_a == 0	 then
			table.insert(resort_kill, Kill[i])
			table.insert(resort_id, i)
		end
		check_a = 0
		i = i + 1
	end
	say (OwnerID() , gottable.getn (resort_id) .. " player(s), The place is:")
	while l < (gottable.getn (resort_id)+1)	do
		say (OwnerID() , "ID:" .. Player[resort_id[l]])
		l = l + 1
	end


end

function LuaAS_addbuff_01()
	AddBuff ( OwnerID(), 509276, 0, -1 )
end