--702772 �s�����B�t��_�ǰe���~

-- ���~�ϥ��ˬd �O�_�b�U�ƥ���
function lua_mika_weddingtrans_check()
	local OID = OwnerID()
	local ZoneID =  ReadRoleValue( OID , EM_RoleValue_ZoneID ) 
	local Zone = ZoneID -1000*math.floor( ZoneID / 1000 )

	if Zone > 100 then 
		ScriptMessage( OID , OID , 1 , "[SC_2012MARRY_ITEM02]" , 0 )	-- �ƥ��ϰ줺�L�k�ϥΦ����~
		return false
	else
		return true
	end
end


function lua_mika_weddingtrans_item01()
	local OID = OwnerID()
	local itemid = GetUseItemGUID(OID)  -- �ϥΤ������~id
--	say(OID, "idtest ="..itemid )
	Callplot( OID ,"lua_mika_weddingtrans_item02", itemid )
end

function lua_mika_weddingtrans_item02(itemid)
	local OID = OwnerID()
	if CheckBuff( OID , 501570) == false then  --�W�[�ˬd�P�_
		DialogCreate( OID , EM_LuaDialogType_YesNo ,"[SC_2012MARRY_ITEM03]") -- �T�w�n�e���ܽЪ̥ӽЪ��B§�|���H
		DialogSelectStr( OID , "[SC_GETTITLE_1]" );
		DialogSelectStr( OID , "[SC_CANCEL]" );
		AddBuff(OID , 501570,0,-1);--�M�ᵹ��BUFF

		if( DialogSendOpen( OID ) == false ) then 
			ScriptMessage( OID , OID , 1 , GetString("SYS_FIXEQ_DATA_ERROR") , 0 )	--��ưe�X�����D
			return 0
		end

		local n = 0
		local DialogResult = ""
		while true do
			Sleep( 10 )
			local DialogStatus = DialogGetResult( OID )
			n = n + 1
		--	Say(OwnerID(), n)
			if n >= 10 then -- ���L�a�j��A10sec
				--ScriptMessage( Player , Player , 0, "Infinity Loop", 0 )
				DialogClose( OID )
				CancelBuff( OID, 501570 );--�̫�M��BUFF

				break
			else
				--ScriptMessage( Player , Player , 0, "OK", 0 )
			end

			if ( DialogStatus >-2 ) then
				if ( DialogStatus == 0 ) then
					DialogResult = "Yes"
					Callplot( OID ,"lua_mika_weddingtrans_item03", itemid )
					DialogClose( OID )
					CancelBuff( OID, 501570 );--�̫�M��BUFF
					break
				elseif ( DialogStatus == 1 ) or ( DialogStatus ==-1 ) then
					DialogResult = "No"
					DialogClose( OID )
					CancelBuff( OID, 501570 );--�̫�M��BUFF
					break
				else
					DialogResult = "Etc"
				end
			end
		end
	else
		ScriptMessage( OID , OID , 0, "[SC_WINDOW_OPENED]", 0 );
	end
end

function lua_mika_weddingtrans_item03(itemid)
	local Player = OwnerID()
	local EnterKey =  545671-- keyitem �ǤJ�ϰ�ɵ���
	local itemlist = { 
			241977, 241978 , 241979 ,
 			241980, 241981 , 241982 ,
 			241983, 241984 , 241985 
			}  -- �ǰe�۪�id

	local pos = {
		[1] =  { 305 ,  -3578, 226, 3371, 256 }, 
		[2] =  { 306 ,  -3578, 226, 3371, 256 }, 
		[3] =  { 307 ,  -3578, 226, 3371, 256 }, 
		[4] =  { 305 ,  -3554, 225, -498, 262 }, 
		[5] =  { 306 ,  -3554, 225, -498, 262 }, 
		[6] =  { 307 ,  -3554, 225, -498, 262 }, 
		[7] =  { 305 ,  -3563, 340, -4176, 96 }, 
		[8] =  { 306 ,  -3563, 340, -4176, 96 }, 
		[9] =  { 307 ,  -3563, 340, -4176, 96 }
		}


	for i = 1, #itemlist do
	--	say(Player, "i ="..i)
		if itemid == itemlist[i] then
			Setflag(Player, EnterKey, 0 ) --�M�����ê���d��Ĳ�o�@��Key
			WriteRoleValue(Player, EM_LuaValueFlag_UseItem43, i )
			local SN = ReadRoleValue(Player, EM_LuaValueFlag_UseItem43)
		--	say(Player, "SN ="..SN )
		--	say(Player, "pos1 ="..pos[SN][1]..", pos2 ="..pos[SN][2]..", pos3 ="..pos[SN][3]..", pos4 ="..pos[SN][4]..", pos5 ="..pos[SN][5]  )
			ChangeZone( Player , pos[SN][1] , 0, pos[SN][2] , pos[SN][3], pos[SN][4], pos[SN][5] ) 
			DelBodyItem(Player, itemid, 1 )
			break
		end
	end

end