

-------------------�C���@��--------------------------


------------------�᯻���t�C�@��------------------------
--�ᱼ�᯻��Ĳ�o���R���@��
function lua_nehelia_flowerPow()
	local Player=OwnerID() 
		if CheckFlag( Player , 546161 ) == true then --�P�w�X�Х��ȶi�椤C
			SetFlag ( Player , 546161 , 0 ) --�����X��C
			CancelBuff ( Player , 621944 ) --�R������
			CancelBuff ( Player , 621946 ) --2014/1/15 �`�`�s�W�R�����~�|�R�����a���W���������ޯ�
		 	ScriptMessage( Player , Player , 1 ,"[SC_VALENTINE_2012NE_31]" , 0 ) --�L�k�F����媺�ШD�A���ȥ��ѡC
		end
end

--�R���ؤl�@��
function lua_nehelia_flowerseed()
	local Player=OwnerID() 
	local NPC = TargetID()
		if CheckFlag( Player , 546161 ) == true then --�P�w�X�Х��ȶi�椤C
			SetSpeakDetail( Player,"[SC_VALENTINE_2012NE_35]") --�o�ͤ���Ʊ��F�ܡH�����w�g�����ڤF�K
			AddSpeakOption( Player , NPC , "[SC_VALENTINE_2012NE_36]" , "lua_nehelia_flowerseed01", 0 )
		end
end

--������
function lua_nehelia_flowerseed01()
	local Player=OwnerID() 
			SetFlag ( Player , 546161 , 0 ) --�����X��C
		 	ScriptMessage( Player , Player , 1 ,"[SC_VALENTINE_2012NE_31]" , 0 ) --�L�k�F����媺�ШD�A���ȥ��ѡC
			Closespeak( Player )			
end


--�ϥΪ᯻���@��---
function lua_nehelia_fPowUseing(intOBJ) 					--�᯻�x�b���Y�W���ͼ@���C�ݿ�J���~�s���C
local Player = OwnerID()							
local WOOD = TargetID()
local pollen = intOBJ								--�᯻��ID						
local CheckP = CheckBuff( Player , 621946)					--�ˬd���a���W���L�콹��
local Tid = ReadRoleValue(WOOD,EM_RoleValue_OrgID)			--�ؼбo��lID
local  lock = ReadRoleValue(WOOD,EM_RoleValue_Register10)
local  Range = GetDistance(Player,WOOD)            
		if pollen  == 241040 then
			WriteRoleValue(Player,EM_RoleValue_Register2,1)
		elseif pollen== 241041 then
			WriteRoleValue(Player,EM_RoleValue_Register2,2)
		elseif pollen == 241042 then
			WriteRoleValue(Player,EM_RoleValue_Register2,3)
		end   
	if CheckP == FALSE and lock == 0 then
		if Tid == 120325 and Range <= 25 then			--���a���W�S���콹���ޯ��ؼЬOWOOD���ɭԦ��\�ϥ�
			CastSpell(Player,WOOD,499117)
			AddBuff(Player,621946,1,-1)
			BeginPlot(WOOD,"lua_nehelia_fPowWood",0)
			WriteRoleValue(WOOD,EM_RoleValue_PID,Player)
		else
			ScriptMessage( Player , Player , 1 ,"[SC_VALENTINE_2012NE_32]" , 0 )--�ϥΥؼп��~�άI�k�Z���ӻ��C
			return FALSE
		end
	elseif CheckP == FALSE and lock~=0 then
		ScriptMessage(Player,Player,1,"[SC_VALENTINE_2012NE_37]",0)--��[120325]���Q��L�H�ϥΤ��C
		return FALSE
	elseif CheckP ==true then
		ScriptMessage(Player,Player,1,"[SC_VALENTINE_2012NE_38]",0)--�w�g�X�{[120321]�A������[120321]�a�C
		return FALSE
	else									--��L���p
		ScriptMessage( Player , Player , 1 ,"[EM_201167_3] " , 0 )		--�ؼп��~�C
		return FALSE
	end		
end


function lua_nehelia_fPowWood()						--�������ͥμ@���AOwner�����Y
local OID = OwnerID()
local fly = {}
local Player = ReadRoleValue(OID, EM_RoleValue_PID)
local create = 0									--�w���ͼ�
local num 
	if CountBodyItem(Player,241040) >=1 then
		num =1
	elseif CountBodyItem(Player,241041) >= 1 then
		num = 2
	elseif CountBodyItem(Player,241042) >=1 then
		num = 3
	end
--2014/1/15 �`�`�ק�U�C�@��
--		fly = Lua_CreateObjToRandownPos( OID, 120321 , 1 , 50 , true ) 	--�H�����ͽ���
--		SetModeEx( fly[1], EM_SetModeType_Show, true )			--���
--		SetModeEx( fly[1], EM_SetModeType_ShowRoleHead, true )		--�Y����
--		SetModeEx( fly[1], EM_SetModeType_Gravity , false )			--���O
--		SetModeEx( fly[1], EM_SetModeType_SearchenemyIgnore, false )	--�Q�j�M
--		SetModeEx( fly[1], EM_SetModeType_Obstruct, false )			--����
--		WriteRoleValue ( fly[1], EM_RoleValue_PID , Player ) 			--�O���a
--		MoveToFlagEnabled(fly[1],FALSE)
--		AddBuff( fly[1] , 507594 , 7 , -1 )
--		BeginPlot(fly[1],"lua_nehelia_flowerAT2",0)
--		WriteRoleValue(OID,EM_RoleValue_Register10,1)
--		Say( fly[1] , "Create ="..create.. "& num ="..num)
		Sleep(20)

	while create < num do
		if fly[1] == nil or CheckID( fly[1] ) == FALSE then
	--		if create <num then
			fly = Lua_CreateObjToRandownPos( OID, 120321 , 1 , 50 , true ) 	--�H�����ͽ���
			SetModeEx( fly[1], EM_SetModeType_Show, true )			--���
			SetModeEx( fly[1], EM_SetModeType_ShowRoleHead, true )		--�Y����
			SetModeEx( fly[1], EM_SetModeType_Gravity , false )			--���O
			SetModeEx( fly[1], EM_SetModeType_SearchenemyIgnore, false )	--�Q�j�M
			SetModeEx( fly[1], EM_SetModeType_Obstruct, false )			--����
			WriteRoleValue ( fly[1], EM_RoleValue_PID , Player ) 			--�O���a
			MoveToFlagEnabled(fly[1],FALSE)
			AddBuff( fly[1] , 507594 , 7 , -1 )
			BeginPlot(fly[1],"lua_nehelia_flowerAT2",0)
			create = create+1
	--	else
		end
	--	Say( fly[1] , "Create1 ="..create.. "& num1 ="..num)

		if create >= num and CheckID(fly[1]) == FALSE then
			WriteRoleValue(OID,EM_RoleValue_Register10,0)
			break
	 	end					--���ͨ���w���ƥH���_�}�j��

		Sleep(15)
	end
end

function lua_nehelia_flowerPow5() --��w�u��ｹ���������k�N�@��
	local Player=OwnerID() 
	local Target = TargetID()
	local Name = ReadRoleValue( Target , EM_RoleValue_OrgID )
	local Create = ReadRoleValue( Target, EM_RoleValue_PID)
		if Name == 120321 and Create == Player  then
			return true
		elseif Name == 120321 and Create~= Player then
			ScriptMessage(Player,Player,1,"[SC_VALENTINE_2012NE_33]",0)
			return FALSE
		else
			ScriptMessage( Player , Player , 1 ,"[EM_201167_3]" , 0 )--�ؼп��~�C
			return false
		end
end




----------�콹���@��
function lua_nehelia_flowerA()
	local Player = OwnerID()
	local NPC=TargetID()
	local Random = Rand(100)+1 --local Random = DW_Rand(100)
	local CheckPoint = CheckBuff( Player , 621944)
	local lv = 0
	local num = ReadRoleValue(Player,EM_RoleValue_Register2)
		if CheckPoint == TRUE then
			local pos = Lua_BuffPosSearch( Player, 621944 )
			lv = BuffInfo( Player, pos , EM_BuffInfoType_Power )+1
		end
		if  lv <= 4 then
			if Random <= 30 then 
			WriteRoleValue(Player,EM_RoleValue_Register2,num-1)
 			AddBuff( Player , 621945 , 0 , -1 )
 			ScriptMessage( Player , Player , 1 ,"[SC_VALENTINE_2012NE_27]" , C_SYSTEM ) --�@�Ӥ��p�ߡA�l���쯻�w�t�F�C
			BeginPlot (Npc ,  "lua_nehelia_flowerAT1" , 0)
				if ReadRoleValue(Player,EM_RoleValue_Register2)<= 0 then
					CancelBuff(Player,621946)
				end
			elseif Random> 30 then
				KORS_buffUpDown( Player , 621944 , 0 , 1 )
				WriteRoleValue(Player,EM_RoleValue_Register2,num-1)
 				if CheckPoint == false then
 				ScriptMessage( Player , Player , 1 ,"[SC_VALENTINE_2012NE_29]".."1/5" , C_SYSTEM ) --�F����n�D�������ƶqX/5 (���r)
 				else
 				ScriptMessage( Player , Player , 1 ,"[SC_VALENTINE_2012NE_29]".. lv+1 .."/5" , C_SYSTEM ) --�F����n�D�������ƶq X/5 (���r)
 				end
				BeginPlot (Npc ,  "lua_nehelia_flowerAT1" , 0)	
				if ReadRoleValue(Player,EM_RoleValue_Register2)<= 0 then
					CancelBuff(Player,621946)
				end
			end

		elseif lv>4 then	
 			ScriptMessage( Player , Player , 1 ,"[SC_VALENTINE_2012NE_30]" , C_SYSTEM ) --�ƶq�w�����A�֦V���D��ܵY�^���a�I
			BeginPlot (Npc ,  "lua_nehelia_flowerAT1" , 0)
			CancelBuff(Player,621946)
		end

end

function lua_nehelia_flowerA1() --���F�w�t���������Ʊ�
	local Player=OwnerID() --���a
	local CheckA=CheckBuff( Player , 621945 )
		if CheckA == true then			
			return false
		end
end


function lua_nehelia_flowerAT1() --�R�������@��
	local NPC=OwnerID() --����
	local OrgID = ReadRoleValue( NPC ,EM_RoleValue_OrgID )
		if OrgID == 120321 then			
			DelObj(NPC)
		end
end


--function lua_nehelia_flowerAT2(WOOD)--���b�������W�����Q��mPLAY���@��

function lua_nehelia_flowerAT2()--���b�������W�����Q��mPLAY���@��
	local OID = OwnerID()
	local time = 0
	local Player = ReadRoleValue(OID,EM_RoleValue_PID)
	while time < 61 do
		time =time +1
		Sleep(10)
	end
	CancelBuff( Player , 621946 )
	DelObj(OID)
end




--------------------���y�@��--------------------------
--�콹�����y
function lua_nehelia_flowerB() 
	local Player = OwnerID()
	local NPC = TargetID()
	local CheckA = CheckFlag ( Player , 546159 ) --�ˬd�X��A
	local CheckB = CheckFlag ( Player , 546160 ) --�ˬd�X��B
	local Point = FA_BuffInfo( Player , 621944 , 3 ) --�ˬd�������� (3���n�z�L�]���n��)

		if CheckA==true and CheckB==false then --��A�SB�ĤG���������a
			SetSpeakDetail( Player,"[SC_VALENTINE_2012NE_11]".."[SC_VALENTINE_2012NE_12]") --��������+�]�L��ܼ@��
			AddSpeakOption( Player , NPC , "[SC_VALENTINE_2012NE_13]" , "lua_nehelia_flowerS01", 0 ) --��ť���D��ܵY���ߨ�

			SetFlag ( Player , 546160 , 1 ) --�}�ҺX��B
			SetFlag ( Player , 546161 , 0 ) --�����X��C
			CancelBuff ( Player , 621944 ) --�R������
			DelBodyItem( Player, 241040, 1 ) --�屼���q�᯻
			DelBodyItem( Player, 241041, 1 ) --�屼���Ū᯻
			DelBodyItem( Player, 241042, 1 ) --�屼�����᯻
			GiveBodyItem( Player , 209161 , 1 ) --�������y
		else
			SetSpeakDetail( Player,"[SC_VALENTINE_2012NE_11]" ) --�������Ȫ���ܼ@��
			SetFlag ( Player , 546159 , 1 ) --�}�ҺX��A
			SetFlag ( Player , 546161 , 0 ) --�����X��C
			CancelBuff ( Player , 621944 ) --�R������
			DelBodyItem( Player, 241040, 1 ) --�屼���q�᯻
			DelBodyItem( Player, 241041, 1 ) --�屼���Ū᯻
			DelBodyItem( Player, 241042, 1 ) --�屼�����᯻
			GiveBodyItem( Player , 209161 , 1 ) --�������y
		end

end
 
--�ᯫ�`�Ѩ�
function lua_nehelia_flowerC() 
	local Player = OwnerID()
	SetSpeakDetail( Player,"[SC_112150_YU_05]") 
end


--�]�L���ȼ��y
function lua_nehelia_flowerD() --��ܧi�D�o�D�B�Ʊ������y
	local Player = OwnerID()
	SetSpeakDetail( Player,"[SC_VALENTINE_2012NE_24]".."[SC_VALENTINE_2012NE_26]" ) --�D�B!�O�u����!
	SetFlag ( Player , 546182 , 0 ) --�����]�L�X��Z
	SetFlag ( Player , 546169 , 1 ) --�}�Ҷ]�L�X��D
	GiveBodyItem( Player , 209161 , 1 ) --�������y
	GiveBodyItem( Player , 530873 , 1 ) --�������y
	DelBodyItem( Player, 241056, 1 ) --�屼�^�H
end


function lua_nehelia_flowerE() --������f�D�B�Ʊ������y
	local Player = OwnerID()
	SetSpeakDetail( Player,"[SC_VALENTINE_2012NE_25]".."[SC_VALENTINE_2012NE_26]" ) --�@�K�L�{�b�]�O�@�ӤH��ܡA���Ӧn�F�K�C�@�A���I�ڬO���n���W�ڡC
	SetFlag ( Player , 546182 , 0 ) --�����]�L�X��Z
	SetFlag ( Player , 546169 , 1 ) --�}�Ҷ]�L�X��D
	GiveBodyItem( Player , 209161 , 1 ) --�������y
	GiveBodyItem( Player , 530874 , 1 ) --�������y
	DelBodyItem( Player, 241056, 1 ) --�屼�^�H
end



------------------------------------------NPC��ܼ@�� ---------------------------------------------------

--�kNPC��ܼ@�� 
function lua_nehelia_flower01() --�_�l���
	local Player = OwnerID()
	local NPC = TargetID()
	local CheckB = CheckFlag ( Player , 546160 ) --�ˬd�X��B
	local CheckC = CheckFlag ( Player , 546161 ) --�ˬd�X��C
	local CheckD = CheckFlag ( Player , 546169 ) --�ˬd�X��D
	local CheckX = CheckFlag ( Player , 546180 ) --�ˬd�C��X��X
	local CheckY = CheckFlag ( Player , 546181 ) --�ˬd�]�L�X��Y
	local CheckZ = CheckFlag ( Player , 546182 ) --�ˬd�]�L�X��Z
	local Point = FA_BuffInfo( Player , 621944 , 3 ) --�ˬd��������
	local CheckPoint = CheckBuff( Player , 621944) --�ˬd����
	local Powder1 = CountBodyItem( Player , 241040 )
	local Powder2 = CountBodyItem( Player , 241041 )
	local Powder3 = CountBodyItem( Player , 241042 )
	local Letter = CountBodyItem( Player , 241056 )
	local CountSeed=CountItem( Player , 241039 )
	local CountPowder0=CountItem( Player , 241040 )
	local CountPowder1=CountItem( Player , 241041 )
	local CountPowder2=CountItem( Player , 241042 )

	AdjustFaceDir( NPC , Player , 0 ) --NPC���V���a


		if CheckY==true then
			SetSpeakDetail( Player,"[SC_VALENTINE_2012NE_16]")  --�ЧA�N�o����浹�ǩi�N�D�Ẹ
				if CountBodyItem( Player , 241055 )==0 then
					GiveBodyItem ( Player , 241055 , 1 )
				end
		elseif CheckZ==true and Letter==1 then --�T�{�O�_���]�L���^�H
			SetSpeakDetail( Player,"[SC_VALENTINE_2012NE_21] ") --���§A���ڤj�ѻ��a�]�@��C		
			AddSpeakOption( Player , NPC , "[SC_VALENTINE_2012NE_22]" , "lua_nehelia_flowerD", 0 ) --��H�浹NPC.�çi�D�LOO�Q�D�B���Ʊ�
			AddSpeakOption( Player , NPC , "[SC_VALENTINE_2012NE_23]" , "lua_nehelia_flowerE", 0 ) --��H�浹NPC.���i�D�LOO�Q�D�B���Ʊ�

		elseif CheckC==true then --�ˬd�X��C,�T�{���ȬO�_�i�椤
			SetSpeakDetail( Player,"[SC_VALENTINE_2012NE_08]") --�A�n��[$playername]�A�I�줰��x���F�ܡH�٬O���A���ڱa��5���¯����F�H		

				if Point==4  then
					if  Powder1==1 or Powder2==1 or Powder3==1 then
						AddSpeakOption( Player , NPC , "[SC_VALENTINE_2012NE_10]" , "lua_nehelia_flowerB", 0 ) --�O���A�ڱa�ӤF--������y�@��
					end
				else 
					AddSpeakOption( Player , NPC , "[SC_VALENTINE_2012NE_09]" , "lua_nehelia_flower04", 0 ) --�Q�A��ť������
					if CountSeed==0 and CountPowder0==0 and CountPowder1==0 and CountPowder2==0 then
						AddSpeakOption( Player , NPC , "[SC_VALENTINE_2012NE_34]" , "lua_nehelia_flowerseed", 0 )
					end
				end

		elseif CheckX==true then --�T�{�O�_������X��
			if CheckB==true and CheckD==false then--��B
					if CheckY==true then
						SetSpeakDetail( Player,"[SC_VALENTINE_2012NE_16]") --�]�L���Ȼ���
					else
						SetSpeakDetail( Player,"[SC_VALENTINE_2012NE_11]".."[SC_VALENTINE_2012NE_12]") --����w������ܼ@��+��F�K�Z�ջ�
						AddSpeakOption( Player , NPC , "[SC_VALENTINE_2012NE_13]" , "lua_nehelia_flowerS01", 0 ) --��ť���D��ܵY���ߨ�
					end
			else
				SetSpeakDetail( Player,"[SC_VALENTINE_2012NE_11]") --����w������ܼ@��
				AddSpeakOption( Player , NPC , "[SC_112150_YU_02]" , "lua_nehelia_flowerC", 0 ) --�ᯫ�`���Ѩ�
			end

		else	--�������~���|�i�檺����
			SetSpeakDetail( Player,"[SC_VALENTINE_2012NE_01]")  --NPC���H�H��
			AddSpeakOption( Player , NPC , "[SC_VALENTINE_2012NE_02]" , "lua_nehelia_flower02", 0 ) 
				if CheckB==true and CheckD==false then
					AddSpeakOption( Player , NPC , "[SC_VALENTINE_2012NE_15]" , "lua_nehelia_flowerS01", 0 ) --����W�����Ϊ��Ʊ�
				end
		end
end




function lua_nehelia_flower02() --�¯����Ʊ�
	local Player = OwnerID()
	local NPC = TargetID()
	SetSpeakDetail( Player,"[SC_VALENTINE_2012NE_03]") 
	AddSpeakOption( Player , NPC , "[SC_VALENTINE_2012NE_04]" , "lua_nehelia_flower03", 0 ) --�߰ݬO�_�������
end


function lua_nehelia_flower03() --�������e
	local Player = OwnerID()
	local NPC = TargetID()
	SetSpeakDetail( Player,"[SC_VALENTINE_2012NE_05]") 
	AddSpeakOption( Player , NPC , "[SC_VALENTINE_2012NE_06]" , "lua_nehelia_flower05", 0 ) --�S���D�A�浹�ڧa�I
end


function lua_nehelia_flower04() --�A�����@�������W�h
	local Player = OwnerID()
	local NPC = TargetID()
	SetSpeakDetail( Player,"[SC_VALENTINE_2012NE_05]") 
end


function lua_nehelia_flower05() --�S���D�A�浹�ڧa�I
	local Player = OwnerID()
	local CheckA = CheckFlag ( Player , 546159 ) --�ˬd�X��A
	local CheckB = CheckFlag ( Player , 546160 ) --�ˬd�X��B
	SetSpeakDetail( Player,"[SC_VALENTINE_2012NE_07]") 
	SetFlag ( Player , 546161 , 1 ) --�}�ҺX��C
	SetFlag ( Player , 546180 , 1 ) --�}�ҨC��X��X
	GiveBodyItem( Player , 241039 , 1 ) --�����ؤl
end





--------�⦸����~�|�}�Ҫ��]�L����------
function lua_nehelia_flowerS01()--���ᮺ�@��
	local Player = OwnerID()
	local NPC = TargetID()
	SetSpeakDetail( Player,"[SC_VALENTINE_2012NE_14]") 
	AddSpeakOption( Player , NPC , "[SC_VALENTINE_2012NE_06]" , "lua_nehelia_flowerS02", 0 ) --�S���D�A�浹�ڧa�I
end


function lua_nehelia_flowerS02()--��廡��+������
	local Player = OwnerID()
	SetSpeakDetail( Player,"[SC_VALENTINE_2012NE_16]") --�]�L���Ȼ���
	SetFlag ( Player , 546181 , 1 ) --�}�Ҷ]�L�X��Y
	GiveBodyItem( Player , 241055 , 1 ) --������
end


--�kNPC���@�����
function lua_nehelia_flowerS03()
	local Player = OwnerID()
	local NPC = TargetID()
	local CheckY = CheckFlag ( Player , 546181 ) --�ˬd�]�L�X��Y
	local CheckZ = CheckFlag ( Player , 546182 ) --�ˬd�]�L�X��Z
	local Flower = CountBodyItem( Player , 241055 )--��쪱�a���W��媺��

		if CheckY==true and Flower==1 then
			SetSpeakDetail( Player,"[SC_VALENTINE_2012NE_17]")-- �̪�u�@�V�ӶV�c���F�A�s�𮧳�ı�o�O�ذ��סK
			AddSpeakOption( Player , NPC , "[SC_VALENTINE_2012NE_18]" , "lua_nehelia_flowerS05", 0 ) --���h�J�����~
		elseif CheckZ==true then
			SetSpeakDetail( Player,"[SC_VALENTINE_2012NE_20]")-- ���§A�F�A���ާڪ��u�@�ä����ˡA���٬O��R���u�@�Q�s�h�@�I���C
				if CountBodyItem( Player , 241056 )==0 then
					GiveBodyItem ( Player , 241056 , 1 )
				end
		else
			SetSpeakDetail( Player,"[SC_VALENTINE_2012NE_17]")-- �̪�u�@�V�ӶV�c���F�A�s�𮧳�ı�o�O�ذ��סK
		end
end


function lua_nehelia_flowerS04()--�����^�H
	local Player = OwnerID()
	SetSpeakDetail( Player,"[SC_VALENTINE_2012NE_20]")-- ���§A�F�A���ާڪ��u�@�ä����ˡA���٬O��R���u�@�Q�s�h�@�I���C
	SetFlag ( Player , 546181 , 0 ) --�����]�L�X��Y
	SetFlag ( Player , 546182 , 1 ) --�}�Ҷ]�L�X��Z
	DelBodyItem( Player, 241055, 1 ) --�屼��
	GiveBodyItem( Player , 241056 , 1 ) --�����^�H
end


function lua_nehelia_flowerS05()
	local Player = OwnerID()
	local NPC = TargetID()
	SetSpeakDetail( Player,"[SC_VALENTINE_2012NE_19]")-- �o�O�K�I��Ӧo�ٰO�o�ڡA�L�{�b�@�ӤH�L�o�ܦn�ܡH
	AddSpeakOption( Player , NPC , "[SC_VALENTINE_2012NE_06]" , "lua_nehelia_flowerS04", 0 ) --�S���D!
end



function lua_nehelia_redo() --�������m
	local player = OwnerID()
	local KeyTable ={ 546159,546160,546161,546169,546180,546181,546182}
	local ItemTable = {241039,241040,241041,241042,241055,241056}
		for i = 1, table.getn(KeyTable) do
			SetFlag(player,KeyTable[i],0)
		end
		
		for x = 1,table.getn(ItemTable) do
			local count = CountBodyItem(player,ItemTable[x])
			if count ~= 0 then
				DelBodyItem(player,ItemTable[x],count)
			end
		end
end

function lua_nehelia_redo01() --�]�L���ʭ��m
	local player = OwnerID()
	local KeyTable ={ 546169,546181,546182}
	local ItemTable = {241055,241056}
		for i = 1, table.getn(KeyTable) do
			SetFlag(player,KeyTable[i],0)
		end
		
		for x = 1,table.getn(ItemTable) do
			local count = CountBodyItem(player,ItemTable[x])
			if count ~= 0 then
				DelBodyItem(player,ItemTable[x],count)
			end
		end
end