----------------------------------------------------------
--�u�iĬ�D�����v��ܼ@��
----------------------------------------------------------
function NPC_110748_TALK()		--�I��NPC���
	SetSpeakDetail( OwnerID() , "[SC_NPC_110748_TALK]" )	--�w�]���
	AddSpeakOption( OwnerID() , TargetID() , "[SC_NPC_110748_OPTION_01]" , "NPC_110748_WantPreview" , 0 )	--�ڷQ�ݬݦ�����˳Ư�I��
	AddSpeakOption( OwnerID() , TargetID() , "[SC_NPC_110748_OPTION_02]" , "NPC_110748_How" , 0 )	--�n���I���H
	AddSpeakOption( OwnerID() , TargetID() , "[SC_NPC_110748_OPTION_03]" , "NPC_110748_WantExchange" , 0 )	--�ڭn�I���˳�
end

function NPC_110748_WantPreview()	--�w���ө�����
	SetSpeakDetail( OwnerID() , "[SC_NPC_110748_OPTION_11]" )	--�A�Q�ݭ��ظ˳ơH
	AddSpeakOption( OwnerID() , TargetID() , "[SC_ARMORCATEGORY_01][SYS_ARMORTYPE_00]" , "NPC_110748_Preview(1)" , 0 )	--�u�@
	AddSpeakOption( OwnerID() , TargetID() , "[SC_ARMORCATEGORY_02][SYS_ARMORTYPE_01]" , "NPC_110748_Preview(2)" , 0 )	--�ݱ�
	AddSpeakOption( OwnerID() , TargetID() , "[SC_ARMORCATEGORY_03][SYS_ARMORTYPE_02]" , "NPC_110748_Preview(3)" , 0 )	--����
	AddSpeakOption( OwnerID() , TargetID() , "[SC_ARMORCATEGORY_04][SYS_ARMORTYPE_03]" , "NPC_110748_Preview(4)" , 0 )	--�]��
	AddSpeakOption( OwnerID() , TargetID() , "[SC_ARMORCATEGORY_05][SYS_ARMORTYPE_03]" , "NPC_110748_Preview(5)" , 0 )	--¡�X
	AddSpeakOption( OwnerID() , TargetID() , "[SC_BUFFNPC_12]" , "NPC_110748_TALK" , 0 )	--��^�W�@��
end

function NPC_110748_Preview( ArmorType )	--�w���ө�
	if ArmorType == 1 then	--�u�@�Z��
		SetShop( TargetID() , 600226 , "" )
	elseif ArmorType == 2 then	--�ݱ����
		SetShop( TargetID() , 600398 , "" )
	elseif ArmorType == 3 then	--�����֥�
		SetShop( TargetID() , 600597 , "" )
	elseif ArmorType == 4 then	--�]�ɥ���
		SetShop( TargetID() , 600598 , "" )
	elseif ArmorType == 5 then	--¡�X����
		SetShop( TargetID() , 600599 , "" )
	end
	CloseSpeak( OwnerID() )	--������ܵ���
	OpenShop()
end

function NPC_110748_How()	--�I���˳ƻ���
	SetSpeakDetail( OwnerID() , "[SC_NPC_110748_OPTION_21]" )	--�n���I���H
	AddSpeakOption( OwnerID() , TargetID() , "[SC_BUFFNPC_12]" , "NPC_110748_TALK" , 0 )	--��^�W�@��
end

function NPC_110748_WantExchange()	--�ڭn�I���˳�
	SetSpeakDetail( OwnerID() , "[SC_NPC_110748_OPTION_31]" )	--�A�n�I�����ظ˳ơH
	AddSpeakOption( OwnerID() , TargetID() , "[SC_ARMORCATEGORY_01][SYS_ARMORTYPE_00]" , "NPC_110748_Exchange_Step1(1)" , 0 )	--�u�@�Z��
	AddSpeakOption( OwnerID() , TargetID() , "[SC_ARMORCATEGORY_02][SYS_ARMORTYPE_01]" , "NPC_110748_Exchange_Step1(2)" , 0 )	--�ݱ����
	AddSpeakOption( OwnerID() , TargetID() , "[SC_ARMORCATEGORY_03][SYS_ARMORTYPE_02]" , "NPC_110748_Exchange_Step1(3)" , 0 )	--�����֥�
	AddSpeakOption( OwnerID() , TargetID() , "[SC_ARMORCATEGORY_04][SYS_ARMORTYPE_03]" , "NPC_110748_Exchange_Step1(4)" , 0 )	--�]�ɥ���
	AddSpeakOption( OwnerID() , TargetID() , "[SC_ARMORCATEGORY_05][SYS_ARMORTYPE_03]" , "NPC_110748_Exchange_Step1(5)" , 0 )	--¡�X����
	AddSpeakOption( OwnerID() , TargetID() , "[SC_BUFFNPC_12]" , "NPC_110748_TALK" , 0 )	--��^�W�@��
end

function NPC_110748_Exchange_Step1( ArmorType )	--��ܳ���
	local ArmorCategoryName = {
		"[SC_ARMORCATEGORY_01]" , 	--�u�@
		"[SC_ARMORCATEGORY_02]" , 	--�ݱ�
		"[SC_ARMORCATEGORY_03]" , 	--����
		"[SC_ARMORCATEGORY_04]" , 	--�]��
		"[SC_ARMORCATEGORY_05]" }	--¡�X
	local ArmorTypeName = { 
	"[SYS_ARMORTYPE_00]" , 	--�Z��
	"[SYS_ARMORTYPE_01]" , 	--���
	"[SYS_ARMORTYPE_02]" , 	--�֥�
	"[SYS_ARMORTYPE_03]" , 	--����
	"[SYS_ARMORTYPE_03]" } 	--����
	
	SetSpeakDetail( OwnerID() , "[SC_NPC_110748_OPTION_32][$SETVAR1=" .. ArmorCategoryName[ ArmorType ] .. "][$SETVAR2=" .. ArmorTypeName[ ArmorType ] .."]" )	--�I������
	AddSpeakOption( OwnerID() , TargetID() , "[SYS_ARMORPOS_00]" , "NPC_110748_Exchange_Step2( " .. ArmorType .. " , 1 )" , 0 )	--�Y��
	AddSpeakOption( OwnerID() , TargetID() , "[SYS_ARMORPOS_03]" , "NPC_110748_Exchange_Step2( " .. ArmorType .. " , 2 )" , 0 )	--�W��
	AddSpeakOption( OwnerID() , TargetID() , "[SYS_ARMORPOS_07]" , "NPC_110748_Exchange_Step2( " .. ArmorType .. " , 3 )" , 0 )	--�ӥ�
	AddSpeakOption( OwnerID() , TargetID() , "[SYS_ARMORPOS_02]" , "NPC_110748_Exchange_Step2( " .. ArmorType .. " , 4 )" , 0 )	--�c�l
	AddSpeakOption( OwnerID() , TargetID() , "[SYS_ARMORPOS_01]" , "NPC_110748_Exchange_Step2( " .. ArmorType .. " , 5 )" , 0 )	--��M
	AddSpeakOption( OwnerID() , TargetID() , "[SYS_ARMORPOS_06]" , "NPC_110748_Exchange_Step2( " .. ArmorType .. " , 6 )" , 0 )	--�y�a
	AddSpeakOption( OwnerID() , TargetID() , "[SYS_ARMORPOS_04]" , "NPC_110748_Exchange_Step2( " .. ArmorType .. " , 7 )" , 0 )	--�U��
	AddSpeakOption( OwnerID() , TargetID() , "[SYS_ARMORPOS_05]" , "NPC_110748_Exchange_Step2( " .. ArmorType .. " , 8 )" , 0 )	--�ܭ�
	AddSpeakOption( OwnerID() , TargetID() , "[SC_BUFFNPC_12]" , "NPC_110748_WantExchange" , 0 )	--��^�W�@��
end

function YoYo_TestSay()
	Say( OwnerID() , table.concat( { "[SYS_ARMORPOS_00]" , "[SYS_ARMORPOS_01]" } ) )
end

function NPC_110748_Exchange_Step2( ArmorType , ArmorPos )	--�I���T�{
	local Armor = {}
	Armor[ 1 ] = {
		234970	,	--�����u�@�Y��
		234971	,	--�����u�@����
		234972	,	--�����u�@�ӥ�
		234973	,	--�����u�@���u
		234974	,	--�����u�@��M
		234975	,	--�����u�@�y�a
		234976	,	--�����u�@����
		234977	}	--�����u�@�ܭ�
	Armor[ 2 ] = {
		234978	,	--�����ݱ��Y��
		234979	,	--�����ݱ��@��
		234980	,	--�����ݱ��ӥ�
		234981	,	--�����ݱ����u
		234982	,	--�����ݱ��@��
		234983	,	--�����ݱ��y�a
		234984	,	--�����ݱ��@�L
		234985	}	--�����ݱ��ܭ�
	Armor[ 3 ] = {
		234986	,	--���������@�B
		234987	,	--���������֦�
		234988	,	--���������֪�
		234989	,	--�����������u
		234990	,	--����������M
		234991	,	--���������y�a
		234992	,	--���������ֿ�
		234993	}	--���������ܭ�
	Armor[ 4 ] = {
		234994	,	--�����]���@�B
		234995	,	--�����]�ɤj��
		234996	,	--�����]�ɪӹ�
		234997	,	--�����]�ɪ��u
		234998	,	--�����]�ɤ�M
		234999	,	--�����]�ɸy�a
		235000	,	--�����]�ɪ���
		235001	}	--�����]�ɩܭ�
	Armor[ 5 ] = {
		235002	,	--����¡�X�@�B
		235003	,	--����¡�X�~��
		235004	,	--����¡�X�ӥ�
		235005	,	--����¡�X���c
		235006	,	--����¡�X��M
		235007	,	--����¡�X�y�a
		235008	,	--����¡�X����
		235009	}	--����¡�X�ܭ�
		
	local Material = {  
	208346 ,	--�����u�@����
	208347 ,	--�����ݱ��H�b
	208348 ,	--���������~��
	208349 ,	--�����]�ɥ���
	208350 }	--����¡�X����
	
	local ArmorName = "[" .. Armor[ ArmorType ][ ArmorPos ] .."]"
	local MaterialName = "[" .. Material[ ArmorType ] .."]"
	
	SetSpeakDetail( OwnerID() , "[SC_NPC_110748_OPTION_33][$SETVAR1=" .. ArmorName .. "][$SETVAR2=" .. MaterialName .. "]" )	--�I���T�{����
	AddSpeakOption( OwnerID() , TargetID() , "[SC_NPC_110748_OPTION_34]" , "NPC_110748_Exchange_Step3(" .. Armor[ ArmorType ][ ArmorPos ] .. "," .. Material[ ArmorType ] .. ")" , 0 )	--�O���A�ڭn�I��
	AddSpeakOption( OwnerID() , TargetID() , "[SC_NPC_110748_OPTION_35]" , "NPC_110748_TALK" , 0 )	--�ڭn�A�Ҽ{�@�U
end

function NPC_110748_Exchange_Step3( Armor , Material )
	if CountBodyItem( OwnerID() , Material ) >= 20 then
		GiveBodyItem( OwnerID() , Armor,1)
		DelBodyItem( OwnerID()  , Material , 20 )
		CloseSpeak( OwnerID() )	--������ܵ���
	else
		SetSpeakDetail( OwnerID() , "[SC_NPC_110748_OPTION_36]" )	--�A�ҷǳƪ����Ƽƶq�����A�L�k�I����I
	end
end
