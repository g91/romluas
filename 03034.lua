
function BY_28_Initial( )
	DebugMsg(0,0,"Start");
	local _BossID=108117;--105898;108117
	
	local _X,_Y,_Z,_Dir=DW_Location( OwnerID( ) );
	
	local _CtrlBox=CreateObj(110987,_X,_Y,_Z,_Dir,1);
	SetModeEx(_CtrlBox,EM_SetModeType_ShowRoleHead,true);--記得拿掉
	AddToPartition(_CtrlBox,0);
	
	local _X,_Y,_Z,_Dir=DW_Location(_CtrlBox);
	local _Boss=CreateObj(_BossID,_X,_Y,_Z,_Dir,1);
	AddToPartition(_Boss,0);

	local _Monster={ };
	for i=1,6,1 do
		_Monster[ i ]=0;
	end
	
	BY_28_BossCtrl( _CtrlBox,_Boss,_Monster);
end

function BY_28_CreateInitial( )
	DebugMsg(0,0,"Start");
	--入口阻擋門
	local _X,_Y,_Z,_Dir=1335.8,3544.5,917.3,74;--74
	local _CtrlDoor_Entrance=CreateObj(106247,_X,_Y,_Z,_Dir,1);--106249
--	SetModeEx(_CtrlDoor_Entrance,EM_SetModeType_ShowRoleHead,true);
--	SetModeEx(_CtrlDoor_Entrance,EM_SetModeType_Obstruct,true);--會阻擋(阻擋其他的物件)
	SetModeEx( _CtrlDoor_Entrance, EM_SetModeType_Searchenemy , false );
	SetModeEx(_CtrlDoor_Entrance, EM_SetModeType_Fight , false );
	SetModeEx( _CtrlDoor_Entrance, EM_SetModeType_Strikback , false );
	AddToPartition(_CtrlDoor_Entrance,0);
	--出口阻擋門
	local _X,_Y,_Z,_Dir=1143.6,3545,1640.8,258.7;
	local _CtrlDoor_Exit=CreateObj(106247,_X,_Y,_Z,_Dir,1);
--	SetModeEx(_CtrlDoor_Exit,EM_SetModeType_ShowRoleHead,true);
	SetModeEx(_CtrlDoor_Exit,EM_SetModeType_Obstruct,true);--會阻擋(阻擋其他的物件)
	SetModeEx( _CtrlDoor_Exit, EM_SetModeType_Searchenemy , false );
	SetModeEx(_CtrlDoor_Exit, EM_SetModeType_Fight , false );
	SetModeEx( _CtrlDoor_Exit, EM_SetModeType_Strikback , false );
	AddToPartition(_CtrlDoor_Exit,0);
	--中央控制物件
	local _X,_Y,_Z,_Dir=1247.2,3541.5,1256.1,74;
	local _CtrlBox=CreateObj(110987,_X,_Y,_Z,_Dir,1);
	SetModeEx(_CtrlBox,EM_SetModeType_ShowRoleHead,true);--記得拿掉
	AddToPartition(_CtrlBox,0);
	--Boss
	local _X,_Y,_Z,_Dir=DW_Location(_CtrlBox);
	local _BossID=108117;--105898;108117
	local _Boss=CreateObj(_BossID,_X,_Y,_Z,_Dir,1);
	AddToPartition(_Boss,0);
	--小怪
	local _Monster={ };
	for i=1,6,1 do
		_Monster[ i ]=0;
	end
	--執行控制動作
	BY_28_BossCtrl( _CtrlBox,_Boss,_Monster,_CtrlDoor_Entrance,_CtrlDoor_Exit);
--	CallPlot(_Boss,"BY_28_BossCtrl",_CtrlBox,_Boss,_Monster,_CtrlDoor_Entrance,_CtrlDoor_Exit);
end