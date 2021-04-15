function MonsterTest()
local Obj = Role:new( OwnerID() )
SetMaxSkill( OwnerID() );	--設定熟練度上限

SetEq_Warrior_Lv50();
Obj:Say( "Set Warrior Lv 50 EQ" );

Obj:Say( "1st Test  - one 100039" );
CreateMonsterTest(  100039 ,  1 , true )
Obj:Say( "Take a rest for five mins" );
Obj:Say( "Five" );
Sleep( 10 )
Obj:Say( "Four" );
Sleep( 10 )
Obj:Say( "three" );
Sleep( 10 )
Obj:Say( "two" );
Sleep( 10 )
Obj:Say( "one" );
Sleep( 10 )

Obj:Say( "2nd Test - one 10039" );
CreateMonsterTest(  100039 ,  1 , true  )
Obj:Say( "休息十秒" );
Sleep( 100 )

Obj:Say( "3rd - one 10039" );
CreateMonsterTest(  100039 ,  1 , true  )
Obj:Say( "休息十五秒" );
Sleep( 150 )

Obj:Say( "4rd - one 10039" );
CreateMonsterTest(  100039 ,  1 , true  )
Obj:Say( "休息二十秒" );
Sleep( 200 )

Obj:Say( "final test - two 10039" );

CreateMonsterTest(  100039 ,  2 , true  )
Obj:Say( "Take a rest for 15 secs" );
Sleep( 150 )

--SetEq_Warrior_Lv5();
--Obj:Say( "Set Warrior Lv 50 EQ" );

--Obj:Say( "第一波測試 - 1隻 100037" );
--CreateMonsterTest(  100037 ,  1 , true )
--Obj:Say( "休息五秒" );
--Sleep( 50 )

--Obj:Say( "第二波測試 - 2隻 10037" );
--CreateMonsterTest(  100037 ,  2 , true )
--Obj:Say( "休息五秒" );
--Sleep( 50 )




Obj:Say( "測試結束" );


end