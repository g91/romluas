function LuaS_421750_7()---達克
	if  CheckFlag(OwnerID(), 542367) == true  then 
		LoadQuestOption( OwnerID() ) 
	else
		SetSpeakDetail( OwnerID(), "[SC_421750_6]"  );--/*潘尼西亞？哼~這個名字，你由哪裡聽來的？
          		if  CheckFlag(OwnerID(), 542308) == false  and  CheckFlag(OwnerID(), 542316) ==true and  CheckFlag(OwnerID(), 542317) ==true and CheckAcceptQuest( OwnerID(),  421750 ) == true and CountBodyItem( OwnerID() , 203644 ) > 0 and CountBodyItem( OwnerID() , 203631 ) > 0 then  
			AddSpeakOption( OwnerID(), TargetID(), "[SC_421750_7]" , "LuaS_421750_8", 0 )  ---事實上，我正在尋找長羽莊園失蹤的物品，我懷疑東西就在潘尼西亞的手上。	
			    	
		end
	end
end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_421750_8()
               SetSpeakDetail( OwnerID(), "[SC_112155_1]" )---小子，我看不是這麼回事吧~這是我剛剛由你身上取得的信件~由內容推測，那東西恐怕就是傳說中多年前病死的薇薇安小姐！?吧~這是怎麼回事？
          	AddSpeakOption( OwnerID(), TargetID(), "[SC_112155_2]" , "LuaS_112155_1", 0 )---事情正如你所想像的那樣，你手中的紙條就是答案~
	DelBodyItem ( OwnerID(),   203644, 1 )
	DelBodyItem ( OwnerID(),   203631, 1 )

end
function LuaS_112155_1()
	CloseSpeak( OwnerID());	--關閉對話視窗
	SetFlag( OwnerID(),542308,1 ); --給予完成任務的旗標
                SetFlag( OwnerID(),542367,1 )

end

-----------------------
