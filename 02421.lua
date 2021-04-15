function ic_ZONE8_1_1()	---鎧甲獎勵包
local RoleName = GetName( OwnerID() ) 
local itemset = { 100 , "" , { 240354 , 1 ,240355,1} }
return BaseTressureProc(   itemset , 2 ) -- 1  是需求背包空?
end
function ic_ZONE8_1_2()	---鎧甲武器包
local RoleName = GetName( OwnerID() ) 
local itemset = { 100 , "" , { 213417,1,213418,1,213420,1,213421,1,213422,1,213423,1,213424,1,229284,1 } }
return BaseTressureProc(   itemset , 8 ) -- 1  是需求背包空?
end
function ic_ZONE8_1_3()	---鎧甲防具包
local RoleName = GetName( OwnerID() ) 
local itemset = { 100 , "" , { 229252,1,229253,1,229254,1,229255,1,229256,1,229257,1,229258,1,229280,1,229286,1,229290,1,229294,1 } }
return BaseTressureProc(   itemset , 11 ) -- 1  是需求背包空?
end

function ic_ZONE8_2_1()	---鎖甲獎勵包
local RoleName = GetName( OwnerID() ) 
local itemset = { 100 , "" , { 240357 , 1 ,240358,1} }
return BaseTressureProc(   itemset , 2 ) -- 1  是需求背包空?
end
function ic_ZONE8_2_2()	---鎖甲武器包
local RoleName = GetName( OwnerID() ) 
local itemset = { 100 , "" , { 213417,1,213418,1,213419,1,213420,1,213421,1,213422,1,213423,1,213424,1} }
return BaseTressureProc(   itemset , 8 ) -- 1  是需求背包空?
end
function ic_ZONE8_2_3()	---鎖甲防具包
local RoleName = GetName( OwnerID() ) 
local itemset = { 100 , "" , { 229259,1,229260,1,229261,1,229262,1,229263,1,229264,1,229265,1,229281,1,229287,1,229291,1,229295,1 } }
return BaseTressureProc(   itemset , 11 ) -- 1  是需求背包空?
end

function ic_ZONE8_3_1()	---皮甲獎勵包
local RoleName = GetName( OwnerID() ) 
local itemset = { 100 , "" , { 240360 , 1 ,240361,1} }
return BaseTressureProc(   itemset , 2 ) -- 1  是需求背包空?
end
function ic_ZONE8_3_2()	---皮甲武器包
local RoleName = GetName( OwnerID() ) 
local itemset = { 100 , "" , { 213418,1,213420,1,213423,1,213424,1,213425,1} }
return BaseTressureProc(   itemset , 5 ) -- 1  是需求背包空?
end
function ic_ZONE8_3_3()	---皮甲防具包
local RoleName = GetName( OwnerID() ) 
local itemset = { 100 , "" , { 229266,1,229267,1,229268,1,229269,1,229270,1,229271,1,229272,1,229282,1,229288,1,229292,1,229296,1 } }
return BaseTressureProc(   itemset , 11 ) -- 1  是需求背包空?
end

function ic_ZONE8_4_1()	---布衣獎勵包
local RoleName = GetName( OwnerID() ) 
local itemset = { 100 , "" , { 240363 , 1 ,240364,1} }
return BaseTressureProc(   itemset , 2 ) -- 1  是需求背包空?
end
function ic_ZONE8_4_2()	---布衣武器包
local RoleName = GetName( OwnerID() ) 
local itemset = { 100 , "" , { 213425,1,213426,1,213427,1,229285,1 } }
return BaseTressureProc(   itemset , 4 ) -- 1  是需求背包空?
end
function ic_ZONE8_4_3()	---布衣防具包
local RoleName = GetName( OwnerID() ) 
local itemset = { 100 , "" , { 229273,1,229274,1,229275,1,229276,1,229277,1,229278,1,229279,1,229283,1,229289,1,229293,1,229297,1 } }
return BaseTressureProc(   itemset , 11 ) -- 1  是需求背包空?
end