function ic_ZONE17_1_1()	---鎧甲獎勵包
local RoleName = GetName( OwnerID() ) 
local itemset = { 100 , "" , { 240342 , 1 ,240343,1} }
return BaseTressureProc(   itemset , 2 ) -- 1  是需求背包空?
end
function ic_ZONE17_1_2()	---鎧甲武器包
local RoleName = GetName( OwnerID() ) 
local itemset = { 100 , "" , { 213406,1,213407,1,213409,1,213410,1,213411,1,213412,1,213413,1,229238,1 } }
return BaseTressureProc(   itemset , 8 ) -- 1  是需求背包空?
end
function ic_ZONE17_1_3()	---鎧甲防具包
local RoleName = GetName( OwnerID() ) 
local itemset = { 100 , "" , { 229206,1,229207,1,229208,1,229209,1,229210,1,229211,1,229212,1,229234,1,229240,1,229244,1,229248,1 } }
return BaseTressureProc(   itemset , 11 ) -- 1  是需求背包空?
end

function ic_ZONE17_2_1()	---鎖甲獎勵包
local RoleName = GetName( OwnerID() ) 
local itemset = { 100 , "" , { 240345 , 1 ,240346,1} }
return BaseTressureProc(   itemset , 2 ) -- 1  是需求背包空?
end
function ic_ZONE17_2_2()	---鎖甲武器包
local RoleName = GetName( OwnerID() ) 
local itemset = { 100 , "" , { 213406,1,213407,1,213408,1,213409,1,213410,1,213411,1,213412,1,213413,1} }
return BaseTressureProc(   itemset , 8 ) -- 1  是需求背包空?
end
function ic_ZONE17_2_3()	---鎖甲防具包
local RoleName = GetName( OwnerID() ) 
local itemset = { 100 , "" , { 229213,1,229214,1,229215,1,229216,1,229217,1,229218,1,229219,1,229235,1,229241,1,229245,1,229249,1 } }
return BaseTressureProc(   itemset , 11 ) -- 1  是需求背包空?
end

function ic_ZONE17_3_1()	---皮甲獎勵包
local RoleName = GetName( OwnerID() ) 
local itemset = { 100 , "" , { 240348 , 1 ,240349,1} }
return BaseTressureProc(   itemset , 2 ) -- 1  是需求背包空?
end
function ic_ZONE17_3_2()	---皮甲武器包
local RoleName = GetName( OwnerID() ) 
local itemset = { 100 , "" , { 213407,1,213409,1,213412,1,213413,1,213414,1} }
return BaseTressureProc(   itemset , 5 ) -- 1  是需求背包空?
end
function ic_ZONE17_3_3()	---皮甲防具包
local RoleName = GetName( OwnerID() ) 
local itemset = { 100 , "" , { 229220,1,229221,1,229222,1,229223,1,229224,1,229225,1,229226,1,229236,1,229242,1,229246,1,229250,1 } }
return BaseTressureProc(   itemset , 11 ) -- 1  是需求背包空?
end

function ic_ZONE17_4_1()	---布衣獎勵包
local RoleName = GetName( OwnerID() ) 
local itemset = { 100 , "" , { 240351 , 1 ,240352,1} }
return BaseTressureProc(   itemset , 2 ) -- 1  是需求背包空?
end
function ic_ZONE17_4_2()	---布衣武器包
local RoleName = GetName( OwnerID() ) 
local itemset = { 100 , "" , { 213414,1,213415,1,213416,1,229239,1 } }
return BaseTressureProc(   itemset , 4 ) -- 1  是需求背包空?
end
function ic_ZONE17_4_3()	---布衣防具包
local RoleName = GetName( OwnerID() ) 
local itemset = { 100 , "" , { 229227,1,229228,1,229229,1,229230,1,229231,1,229232,1,229233,1,229237,1,229243,1,229247,1,229251,1 } }
return BaseTressureProc(   itemset , 11 ) -- 1  是需求背包空?
end