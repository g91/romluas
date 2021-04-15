function i_wanna_running()
	CallPlot(OwnerID(), "i_wanna_running_loop")
end

function i_wanna_running_loop()
	local me = AddyPlayer:new(OwnerID())
	me.track = {}
	me.vector = {}
	me.vector_dot_product = {}

	DebugMsg(0, 0, "me.is_walk = " .. me.is_walk)

	local delta_x, delta_y, delta
	local running_counter = 0
	while me.is_walk == 0 do

		-- 追蹤移動
		table.insert(me.track, 1, {me.x, me.z})

		-- 沒有移動就重置
		if #me.track > 1 and me.track[1][1] == me.track[2][1] and me.track[1][2] == me.track[2][2] then
			me.track = {}
			me.vector = {}
			me.vector_dot_product = {}
			me:cancelBuff(624218)
			running_counter = 0
		end

		-- 有移動計算向量
		if #me.track > 1 then
			delta_x = me.track[1][1] - me.track[2][1]
			delta_y = me.track[1][2] - me.track[2][2]
			delta = ((delta_x ^ 2) + (delta_y ^ 2)) ^ 0.5
			table.insert(me.vector, 1, {delta_x / delta, delta_y / delta})
		end

		-- 有向量計算內積
		if #me.vector > 1 then
			table.insert(me.vector_dot_product, 1, me.vector[1][1] * me.vector[2][1] + me.vector[1][2] * me.vector[2][2])
		end

		-- 有內積判斷移動路線
		if #me.vector_dot_product > 1 then
			if me.vector_dot_product[1] <= 0.5 and me.buff[624218] then
				me:cancelBuff(624218)
			elseif me.vector_dot_product[1] <= 0.75 and me.buff[624218] then
				local _buff_power = me.buff[624218].power - 5
				me:cancelBuff(624218)
				me:addBuff(624218, _buff_power)
			elseif me.vector_dot_product[1] > 0.95 then
				running_counter = running_counter + 1
				if running_counter > 3 then
					me:addBuff(624218, 4)
				end
			end
		end

		if #me.track >= 10 then
			table.remove(me.track, 10)
		end

		if #me.vector >= 10 then
			table.remove(me.vector, 10)
		end

		if #me.vector_dot_product >= 10 then
			table.remove(me.vector_dot_product, 10)
		end

		-- 輸出資訊
		if #me.vector ~= 0 and #me.vector_dot_product ~= 0 then
			DebugMsg(0, 0, "vector = {" .. table.concat(me.vector[1], ", ") .. "}, dot_product = " .. me.vector_dot_product[1])
		end

		Sleep(5)
	end
end