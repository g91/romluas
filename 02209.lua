function UN_buffinin() --Ãdª«BUFF
local skilltable = {503463,503464,503465,503466,503467,503468,503469,503470,508329,508332}
	for i=1 ,table.getn(skilltable) do
		addbuff(OwnerID(),skilltable[i],4,-1)
	end
end
function un_GMattack_Check()
	if ReadRoleValue(TargetID(),EM_RoleValue_VOC)~=0 and ReadRoleValue(TargetID(),EM_RoleValue_IsDead)~=1 and ReadRoleValue(TargetID(),EM_SetModeType_Fight) ~=true then
		return true
	else
		return false
	end
end