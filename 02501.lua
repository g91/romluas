--================================================================--
--			一般商店
--================================================================--

--對話劇情統一掛 LuaS_ComShop
--初始劇情掛以下

function Zone21_Arrow()	--投擲
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() ,600361, "Test_Shop_Close" );
end

function Zone21_items()	--雜貨
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() ,600362, "Test_Shop_Close" );
end



--================================================================--
--			配方商店
--================================================================--

function LuaS_ZONE21_Formula()
	local Obj = OwnerID()
	local Target = TargetID()
	LoadQuestOption(Obj)
	AddSpeakOption( Obj, Target, "[SO_FORMULA_STORE]" , "DW_OpenRecipeList", 0 )--我想看看你賣的配方。
end

--Lua_119286_RecipeList_Init --製甲
--Lua_119201_RecipeList_Init --裁縫
--Lua_119200_RecipeList_Init --鐵具
--Lua_119082_RecipeList_Init --木工

--上面4個   PID值填1為白裝、填2為綠裝、填3為藍裝



--Lua_119288_RecipeList_Init --採草
--Lua_119289_RecipeList_Init --採礦
--Lua_119290_RecipeList_Init --伐木
--Lua_119087_RecipeList_Init --煉金
--Lua_119088_RecipeList_Init --烹飪



--================================================================--
function Lua_119286_RecipeList_Init()--製甲
	local XPID = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	if XPID == 1 or  XPID == 0 then
		beginplot(OwnerID(),"Lua_119286_01_RecipeList_Init",0) 
	elseif XPID == 2 then
		beginplot(OwnerID(),"Lua_119286_02_RecipeList_Init",0) 
	elseif XPID == 3 then
		beginplot(OwnerID(),"Lua_119286_03_RecipeList_Init",0) 
	end
end

function Lua_119201_RecipeList_Init() --裁縫
	local XPID = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	if XPID == 1 or  XPID == 0 then
		beginplot(OwnerID(),"Lua_119201_01_RecipeList_Init",0) 
	elseif XPID == 2 then
		beginplot(OwnerID(),"Lua_119201_02_RecipeList_Init",0) 
	elseif XPID == 3 then
		beginplot(OwnerID(),"Lua_119201_03_RecipeList_Init",0) 
	end
end

function Lua_119200_RecipeList_Init()--鐵具
	local XPID = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	if XPID == 1 or  XPID == 0 then
		beginplot(OwnerID(),"Lua_119200_01_RecipeList_Init",0) 
	elseif XPID == 2 then
		beginplot(OwnerID(),"Lua_119200_02_RecipeList_Init",0) 
	elseif XPID == 3 then
		beginplot(OwnerID(),"Lua_119200_03_RecipeList_Init",0) 
	end
end

function Lua_119082_RecipeList_Init() --木工
	local XPID = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	if XPID == 1 or  XPID == 0 then
		beginplot(OwnerID(),"Lua_119082_01_RecipeList_Init",0) 
	elseif XPID == 2 then
		beginplot(OwnerID(),"Lua_119082_02_RecipeList_Init",0) 
	elseif XPID == 3 then
		beginplot(OwnerID(),"Lua_119082_03_RecipeList_Init",0) 
	end
end
--================================================================--

--Lua_119286_01_RecipeList_Init --製甲白裝
--Lua_119201_01_RecipeList_Init --裁縫白裝
--Lua_119200_01_RecipeList_Init --鐵具白裝
--Lua_119082_01_RecipeList_Init --木工白裝

--Lua_119286_02_RecipeList_Init --製甲綠裝
--Lua_119201_02_RecipeList_Init --裁縫綠裝
--Lua_119200_02_RecipeList_Init --鐵具綠裝
--Lua_119082_02_RecipeList_Init --木工綠裝

--Lua_119286_03_RecipeList_Init --製甲藍裝
--Lua_119201_03_RecipeList_Init --裁縫藍裝
--Lua_119200_03_RecipeList_Init --鐵具藍裝
--Lua_119082_03_RecipeList_Init --木工藍裝

--Lua_119288_RecipeList_Init --採草
--Lua_119289_RecipeList_Init --採礦
--Lua_119290_RecipeList_Init --伐木
--Lua_119087_RecipeList_Init --煉金
--Lua_119088_RecipeList_Init --烹飪

--================================================================--
function Lua_119286_01_RecipeList_Init()
	AddRecipe( OwnerID(), 551754 ); --簡易完美專家製甲箱,
	AddRecipe( OwnerID(), 551755 ); --實用完美專家製甲箱,
	AddRecipe( OwnerID(), 551756 ); --精緻完美專家製甲箱
	AddRecipe( OwnerID(), 551773 ); --丘陵鎧盔
	AddRecipe( OwnerID(), 551774 ); --丘陵鎧甲
	AddRecipe( OwnerID(), 551775 ); --丘陵護腿
	AddRecipe( OwnerID(), 551776 ); --喀洛族頭盔
	AddRecipe( OwnerID(), 551777 ); --喀洛族戰甲
	AddRecipe( OwnerID(), 551778 ); --喀洛族褲子
	AddRecipe( OwnerID(), 551779 ); --礦坑皮帽
	AddRecipe( OwnerID(), 551780 ); --礦坑皮衣
	AddRecipe( OwnerID(), 551781 ); --礦坑皮褲
end

function Lua_119286_02_RecipeList_Init()
	AddRecipe( OwnerID(), 551799 ); --強化丘陵鎧盔
	AddRecipe( OwnerID(), 551800 ); --強化丘陵鎧甲
	AddRecipe( OwnerID(), 551801 ); --強化丘陵護腿
	AddRecipe( OwnerID(), 551802 ); --強化喀洛族頭盔
	AddRecipe( OwnerID(), 551803 ); --強化喀洛族戰甲
	AddRecipe( OwnerID(), 551804 ); --強化喀洛族褲子
	AddRecipe( OwnerID(), 551805 ); --強化礦坑皮帽
	AddRecipe( OwnerID(), 551806 ); --強化礦坑皮衣
	AddRecipe( OwnerID(), 551807 ); --強化礦坑皮褲
end

function Lua_119286_03_RecipeList_Init()
	AddRecipe( OwnerID(), 551754 ); --簡易完美專家製甲箱,
	AddRecipe( OwnerID(), 551755 ); --實用完美專家製甲箱,
	AddRecipe( OwnerID(), 551756 ); --精緻完美專家製甲箱
	AddRecipe( OwnerID(), 551773 ); --丘陵鎧盔
	AddRecipe( OwnerID(), 551774 ); --丘陵鎧甲
	AddRecipe( OwnerID(), 551775 ); --丘陵護腿
	AddRecipe( OwnerID(), 551776 ); --喀洛族頭盔
	AddRecipe( OwnerID(), 551777 ); --喀洛族戰甲
	AddRecipe( OwnerID(), 551778 ); --喀洛族褲子
	AddRecipe( OwnerID(), 551779 ); --礦坑皮帽
	AddRecipe( OwnerID(), 551780 ); --礦坑皮衣
	AddRecipe( OwnerID(), 551781 ); --礦坑皮褲
	AddRecipe( OwnerID(), 551799 ); --強化丘陵鎧盔
	AddRecipe( OwnerID(), 551800 ); --強化丘陵鎧甲
	AddRecipe( OwnerID(), 551801 ); --強化丘陵護腿
	AddRecipe( OwnerID(), 551802 ); --強化喀洛族頭盔
	AddRecipe( OwnerID(), 551803 ); --強化喀洛族戰甲
	AddRecipe( OwnerID(), 551804 ); --強化喀洛族褲子
	AddRecipe( OwnerID(), 551805 ); --強化礦坑皮帽
	AddRecipe( OwnerID(), 551806 ); --強化礦坑皮衣
	AddRecipe( OwnerID(), 551807 ); --強化礦坑皮褲
	AddRecipe( OwnerID(), 551825 );--稀有丘陵鎧盔
	AddRecipe( OwnerID(), 551826 );--稀有丘陵鎧甲
	AddRecipe( OwnerID(), 551827 );--稀有丘陵護腿
	AddRecipe( OwnerID(), 551828 );--稀有喀洛族頭盔
	AddRecipe( OwnerID(), 551829 );--稀有喀洛族戰甲
	AddRecipe( OwnerID(), 551830 );--稀有喀洛族褲子
	AddRecipe( OwnerID(), 551831 );--稀有礦坑皮帽
	AddRecipe( OwnerID(), 551832 );--稀有礦坑皮衣
	AddRecipe( OwnerID(), 551833 );--稀有礦坑皮褲

end

function Lua_119201_01_RecipeList_Init()
	AddRecipe( OwnerID(), 551751 ); --簡易完美專家裁縫箱,
	AddRecipe( OwnerID(), 551752 ); --實用完美專家裁縫箱
	AddRecipe( OwnerID(), 551753 ); --精緻完美專家裁縫箱
	AddRecipe( OwnerID(), 551782 ); --洞穴頭飾
	AddRecipe( OwnerID(), 551783 ); --洞穴法袍
	AddRecipe( OwnerID(), 551784 ); --洞穴護腿
	AddRecipe( OwnerID(), 551785 ); --喀洛族披風
end

function Lua_119201_02_RecipeList_Init()
	AddRecipe( OwnerID(), 551808 );--強化洞穴頭飾
	AddRecipe( OwnerID(), 551809 );--強化洞穴法袍
	AddRecipe( OwnerID(), 551810 );--強化洞穴護腿
	AddRecipe( OwnerID(), 551811 );--強化喀洛族披風
end

function Lua_119201_03_RecipeList_Init()
	AddRecipe( OwnerID(), 551834 );--稀有洞穴頭飾
	AddRecipe( OwnerID(), 551835 );--稀有洞穴法袍
	AddRecipe( OwnerID(), 551836 );--稀有洞穴護腿
	AddRecipe( OwnerID(), 551837 );--稀有喀洛族披風
end

function Lua_119200_01_RecipeList_Init()
	AddRecipe( OwnerID(), 551748 ); --簡易完美專家鐵具箱,
	AddRecipe( OwnerID(), 551749 ); --實用完美專家鐵具箱
	AddRecipe( OwnerID(), 551750 ); --精緻完美專家鐵具箱
	AddRecipe( OwnerID(), 551786 ); --喀洛族之盾
	AddRecipe( OwnerID(), 551787 ); --爭執大劍
	AddRecipe( OwnerID(), 551788 ); --犯罪之劍
	AddRecipe( OwnerID(), 551789 ); --犯罪巨斧
	AddRecipe( OwnerID(), 551790 ); --爭執手斧
	AddRecipe( OwnerID(), 551791 ); --反叛重鎚
	AddRecipe( OwnerID(), 551792 ); --回歸之鎚
	AddRecipe( OwnerID(), 551793 ); --兇惡匕首
end

function Lua_119200_02_RecipeList_Init()
	AddRecipe( OwnerID(), 551812 );--強化喀洛族之盾
	AddRecipe( OwnerID(), 551813 );--強化爭執大劍
	AddRecipe( OwnerID(), 551814 );--強化犯罪之劍
	AddRecipe( OwnerID(), 551815 );--強化犯罪巨斧
	AddRecipe( OwnerID(), 551816 );--強化爭執手斧
	AddRecipe( OwnerID(), 551817 );--強化反叛重鎚
	AddRecipe( OwnerID(), 551818 );--強化回歸之鎚
	AddRecipe( OwnerID(), 551819 );--強化兇惡匕首
end

function Lua_119200_03_RecipeList_Init()
	AddRecipe( OwnerID(), 551748 ); --簡易完美專家鐵具箱,
	AddRecipe( OwnerID(), 551749 ); --實用完美專家鐵具箱
	AddRecipe( OwnerID(), 551750 ); --精緻完美專家鐵具箱
	for i=0,7 do
		AddRecipe( OwnerID(), 551786+i )
	end
--	AddRecipe( OwnerID(), 551786 ); --喀洛族之盾
--	AddRecipe( OwnerID(), 551787 ); --爭執大劍
--	AddRecipe( OwnerID(), 551788 ); --犯罪之劍
--	AddRecipe( OwnerID(), 551789 ); --犯罪巨斧
--	AddRecipe( OwnerID(), 551790 ); --爭執手斧
--	AddRecipe( OwnerID(), 551791 ); --反叛重鎚
--	AddRecipe( OwnerID(), 551792 ); --回歸之鎚
--	AddRecipe( OwnerID(), 551793 ); --兇惡匕首
	for i=0,7 do
		AddRecipe( OwnerID(), 551812 +i )
	end
--	AddRecipe( OwnerID(), 551812 );--強化喀洛族之盾
--	AddRecipe( OwnerID(), 551813 );--強化爭執大劍
--	AddRecipe( OwnerID(), 551814 );--強化犯罪之劍
--	AddRecipe( OwnerID(), 551815 );--強化犯罪巨斧
--	AddRecipe( OwnerID(), 551816 );--強化爭執手斧
--	AddRecipe( OwnerID(), 551817 );--強化反叛重鎚
--	AddRecipe( OwnerID(), 551818 );--強化回歸之鎚
--	AddRecipe( OwnerID(), 551819 );--強化兇惡匕首
	for i=0,7 do
		AddRecipe( OwnerID(), 551838+i )
	end
--	AddRecipe( OwnerID(), 551838 );--稀有喀洛族之盾
--	AddRecipe( OwnerID(), 551839 );--稀有爭執大劍
--	AddRecipe( OwnerID(), 551840 );--稀有犯罪之劍
--	AddRecipe( OwnerID(), 551841 );--稀有犯罪巨斧
--	AddRecipe( OwnerID(), 551842 );--稀有爭執手斧
--	AddRecipe( OwnerID(), 551843 );--稀有反叛重鎚
--	AddRecipe( OwnerID(), 551844 );--稀有回歸之鎚
--	AddRecipe( OwnerID(), 551845 );--稀有兇惡匕首
end

function Lua_119082_01_RecipeList_Init()
	AddRecipe( OwnerID(), 551745 ); --簡易完美專家木工箱,
	AddRecipe( OwnerID(), 551746 ); --實用完美專家木工箱
	AddRecipe( OwnerID(), 551747 ); --精緻完美專家木工箱
	AddRecipe( OwnerID(), 551794 ); --反叛之弓
	AddRecipe( OwnerID(), 551795 ); --回歸之杖
	AddRecipe( OwnerID(), 551796 ); --兇惡之弩
	AddRecipe( OwnerID(), 551797 ); --兇惡權杖
	AddRecipe( OwnerID(), 551798 ); --先祖之靈
end

function Lua_119082_02_RecipeList_Init()
	AddRecipe( OwnerID(), 551820 );--強化反叛之弓
	AddRecipe( OwnerID(), 551821 );--強化回歸之杖
	AddRecipe( OwnerID(), 551822 );--強化兇惡之弩
	AddRecipe( OwnerID(), 551823 );--強化兇惡權杖
	AddRecipe( OwnerID(), 551824 );--強化先祖之靈
end

function Lua_119082_03_RecipeList_Init()
	AddRecipe( OwnerID(), 551846 );--稀有反叛之弓
	AddRecipe( OwnerID(), 551847 );--稀有回歸之杖
	AddRecipe( OwnerID(), 551848 );--稀有兇惡之弩
	AddRecipe( OwnerID(), 551849 );--稀有兇惡權杖
	AddRecipe( OwnerID(), 551850 );--稀有先祖之靈
end

function Lua_119288_RecipeList_Init()
	AddRecipe( OwnerID(), 551757 ); --夜燈籠草束
	AddRecipe( OwnerID(), 551758 ); --夜燈籠草汁
	AddRecipe( OwnerID(), 551759 ); --夜燈籠草萃取液
end

function Lua_119289_RecipeList_Init()
	AddRecipe( OwnerID(), 551762 ); --紫晶瑪瑙砂
	AddRecipe( OwnerID(), 551763 ); --紫晶瑪瑙塊
	AddRecipe( OwnerID(), 551764 ); --紫晶瑪瑙錠
end

function Lua_119290_RecipeList_Init()
	AddRecipe( OwnerID(), 551767 ); --諾斯檜木材
	AddRecipe( OwnerID(), 551768 ); --諾斯檜木條
	AddRecipe( OwnerID(), 551769 ); --諾斯檜木版
end

function Lua_119087_RecipeList_Init()
	AddRecipe( OwnerID(), 551737 ); --速效治療藥水
	AddRecipe( OwnerID(), 551738 ); --速效魔力藥水
end

function Lua_119088_RecipeList_Init()
	AddRecipe( OwnerID(), 551739 ); --醬燒鮮魚
	AddRecipe( OwnerID(), 551740 ); --鬆軟白麵包
	AddRecipe( OwnerID(), 551741 ); --醬燒肋排
	AddRecipe( OwnerID(), 551742 ); --煎蛋三明治
	AddRecipe( OwnerID(), 551743 ); --奶油蛋糕
	AddRecipe( OwnerID(), 551744 ); --牛奶巧克力
end