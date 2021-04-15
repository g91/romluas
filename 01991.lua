function Lua_Az_GM_Check()
	if ReadRoleValue(TargetID(),EM_RoleValue_VOC)~=0 and ReadRoleValue(TargetID(),EM_RoleValue_IsDead)~=1 then
		return true
	else
		return false
	end
end

--�qup��down���Ʀr���H���������ƪ�num�ӼƦr,�^�Ǥ@�Ӫ��׬�num���}�C,���������ƪ��H���ƭ�
--�Y������X�X�Ӽ�,�w�]����1��
function Az_RND_Ary(up,down,num)					
	local Ary={}
	local ins=up
	local Rnd
	local RndAry={}
	local leng
	if up or down~=nil then
		if num==nil then							--���X�Ӽƥ���w�]����1��
			num=1
		end
		if up>down then							--�ƦC�ݬ��ɾ�
			return nil
		end
		if num>down-up+1 then						--�L�k���X�j��ƦC���H����
			return nil
		end
		for j=up,down,1 do
			table.insert(Ary,j)
		end
		for i=1,num,1 do
			leng=table.getn(Ary)
			Rnd=DW_Rand(leng)
			table.insert(RndAry,Ary[Rnd])
			table.remove(Ary,Rnd)
		end
	else
		return false
	end
	return RndAry
end

function Lua_Az_Motion_Crouch_i()
	while true do
		sleep(10)
		if HateListCount(OwnerID())==0 then
			SetDefIdleMotion(OwnerID(),ruFUSION_MIME_CROUCH_LOOP)
		else
			SetDefIdleMotion(OwnerID(),ruFUSION_MIME_IDLE_STAND)
			return
		end
	end
end

function Lua_Az_Motion_Daze_i()
	while true do
		sleep(10)
		if HateListCount(OwnerID())==0 then
			SetDefIdleMotion(OwnerID(),ruFUSION_MIME_DAZED)
		else
			SetDefIdleMotion(OwnerID(),ruFUSION_MIME_IDLE_STAND)
			return
		end
	end
end

function Lua_Az_Motion_Dead_i()
	while true do
		sleep(10)
		if HateListCount(OwnerID())==0 then
			SetDefIdleMotion(OwnerID(),ruFUSION_MIME_DEATH_LOOP)
		else
			SetDefIdleMotion(OwnerID(),ruFUSION_MIME_IDLE_STAND)
			return
		end
	end
end

function Lua_Az_Motion_KnockDown_i()
	while true do
		sleep(10)
		if HateListCount(OwnerID())==0 then
			SetDefIdleMotion(OwnerID(),ruFUSION_ACTORSTATE_KNOCKDOWN_BEGIN)
		else
			SetDefIdleMotion(OwnerID(),ruFUSION_MIME_IDLE_STAND)
			return
		end
	end
end

function Lua_Az_Motion_Angry()
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_ANGRY)
end


function Lua_Az_Motion_Think()
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_THINK)
end

function Lua_Az_Motion_Idle()
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_IDLE2)
end

function Lua_Az_Motion_Point()
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_POINT)
end

function Lua_Az_Motion_Applause()
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_APPLAUSE	)
end

function Lua_Az_Motion_speak()
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_SPEAK)
end