function MonsterTest()
local Obj = Role:new( OwnerID() )
SetMaxSkill( OwnerID() );	--�]�w���m�פW��

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
Obj:Say( "�𮧤Q��" );
Sleep( 100 )

Obj:Say( "3rd - one 10039" );
CreateMonsterTest(  100039 ,  1 , true  )
Obj:Say( "�𮧤Q����" );
Sleep( 150 )

Obj:Say( "4rd - one 10039" );
CreateMonsterTest(  100039 ,  1 , true  )
Obj:Say( "�𮧤G�Q��" );
Sleep( 200 )

Obj:Say( "final test - two 10039" );

CreateMonsterTest(  100039 ,  2 , true  )
Obj:Say( "Take a rest for 15 secs" );
Sleep( 150 )

--SetEq_Warrior_Lv5();
--Obj:Say( "Set Warrior Lv 50 EQ" );

--Obj:Say( "�Ĥ@�i���� - 1�� 100037" );
--CreateMonsterTest(  100037 ,  1 , true )
--Obj:Say( "�𮧤���" );
--Sleep( 50 )

--Obj:Say( "�ĤG�i���� - 2�� 10037" );
--CreateMonsterTest(  100037 ,  2 , true )
--Obj:Say( "�𮧤���" );
--Sleep( 50 )




Obj:Say( "���յ���" );


end