
function Discowood_Vocation_Show_GetSkill()
	local top = 45
	local VocationSkill = {

				[15] = {
				{	0 	,	541885	,	541886	,	541887	,	541888	,	541889	,	543016	,	543017	}	,
				{	541890	,	0	,	541891	,	541892	,	541893	,	541894	,	543018	,	543019	}	,
				{	541895	,	541896	,	0	,	541897	,	541898	,	541899	,	543020	,	543021	}	,
				{	541900	,	541901	,	541902	,	0	,	541903	,	541904	,	543022	,	543023	}	,
				{	541905	,	541906	,	541907	,	541908	,	0	,	541909	,	0	,	0	}	,
				{	541910	,	541911	,	541912	,	541913	,	541914	,	0	,	0	,	0	}	,
				{	543080	,	543081	,	543082	,	543083	,	0	,	0	,	0	,	543084	}	,
				{	543085	,	543086	,	543087	,	543088	,	0	,	0	,	543089	,	0	}
																} ,


				[20] = {
				{	0 	,	541915	,	541916	,	541917	,	541918	,	541919	,	543024	,	543025	}	,
				{	541920	,	0	,	541921	,	541922	,	541923	,	541924	,	543026	,	543027	}	,
				{	541925	,	541926	,	0	,	541927	,	541928	,	541929	,	543028	,	543029	}	,
				{	541930	,	541931	,	541932	,	0	,	541933	,	541934	,	543030	,	543031	}	,
				{	541935	,	541936	,	541937	,	541938	,	0	,	541939	,	0	,	0	}	,
				{	541940	,	541941	,	541942	,	541943	,	541944	,	0	,	0	,	0	}	,
				{	543090	,	543091	,	543092	,	543093	,	0	,	0	,	0	,	543094	}	,
				{	543095	,	543096	,	543097	,	543098	,	0	,	0	,	543099	,	0	}
																} ,

				[25] = {
				{	0 	,	541945	,	541946	,	541947	,	541948	,	541949	,	543032	,	543033	}	,
				{	541950	,	0	,	541951	,	541952	,	541953	,	541954	,	543034	,	543035	}	,
				{	541955	,	541956	,	0	,	541957	,	541958	,	541959	,	543036	,	543037	}	,
				{	541960	,	541961	,	541962	,	0	,	541963	,	541964	,	543038	,	543039	}	,
				{	541965	,	541966	,	541967	,	541968	,	0	,	541969	,	0	,	0	}	,
				{	541970	,	541971	,	541972	,	541973	,	541974	,	0	,	0	,	0	}	,	
				{	543100	,	543101	,	543102	,	543103	,	0	,	0	,	0	,	543104	}	,
				{	543105	,	543106	,	543107	,	543108	,	0	,	0	,	543109	,	0	}
																} ,



				[30] = {
				{	0 	,	541975	,	541976	,	541977	,	541978	,	541979	,	543040	,	543041	}	,
				{	541980	,	0	,	541981	,	541982	,	541983	,	541984	,	543042	,	543043	}	,
				{	541985	,	541986	,	0	,	541987	,	541988	,	541989	,	543044	,	543045	}	,
				{	541990	,	541991	,	541992	,	0	,	541993	,	541994	,	543046	,	543047	}	,
				{	541995	,	541996	,	541997	,	541998	,	0	,	541999	,	0	,	0	}	,
				{	542001	,	542002	,	542003	,	542004	,	542005	,	0	,	0	,	0	}	,	
				{	543110	,	543111	,	543112	,	543113	,	0	,	0	,	0	,	543114	}	,
				{	543115	,	543116	,	543117	,	543118	,	0	,	0	,	543119	,	0	}
																} ,



				[35] = {
				{	0 	,	542006	,	542007	,	542008	,	542009	,	542010	,	543048	,	543049	}	,
				{	542011	,	0	,	542012	,	542013	,	542014	,	542015	,	543050	,	543051	}	,
				{	542016	,	542017	,	0	,	542018	,	542019	,	542020	,	543052	,	543053	}	,
				{	542021	,	542022	,	542023	,	0	,	542024	,	542025	,	543054	,	543055	}	,
				{	542026	,	542027	,	542028	,	542029	,	0	,	542030	,	0	,	0	}	,
				{	542031	,	542032	,	542033	,	542034	,	542035	,	0	,	0	,	0	}	,	
				{	543120	,	543121	,	543122	,	543123	,	0	,	0	,	0	,	543124	}	,
				{	543125	,	543126	,	543127	,	543128	,	0	,	0	,	543129	,	0	}
																} ,


				[40] = {
				{	0 	,	542036	,	542037	,	542038	,	542039	,	542040	,	543056	,	543057	}	,
				{	542041	,	0	,	542042	,	542043	,	542044	,	542045	,	543058	,	543059	}	,
				{	542046	,	542047	,	0	,	542048	,	542049	,	542050	,	543060	,	543061	}	,
				{	542051	,	542052	,	542053	,	0	,	542054	,	542055	,	543062	,	543063	}	,
				{	542056	,	542057	,	542058	,	542059	,	0	,	542060	,	0	,	0	}	,
				{	542061	,	542062	,	542063	,	542064	,	542065	,	0	,	0	,	0	}	,	
				{	543130	,	543131	,	543132	,	543133	,	0	,	0	,	0	,	543134	}	,
				{	543135	,	543136	,	543137	,	543138	,	0	,	0	,	543139	,	0	}
																} ,


				[45] = {
				{	0 	,	542066	,	542067	,	542068	,	542069	,	542070	,	543064	,	543065	}	,
				{	542071	,	0	,	542072	,	542073	,	542074	,	542075	,	543066	,	543067	}	,
				{	542076	,	542077	,	0	,	542078	,	542079	,	542080	,	543068	,	543069	}	,
				{	542081	,	542082	,	542083	,	0	,	542084	,	542085	,	543070	,	543071	}	,
				{	542086	,	542087	,	542088	,	542089	,	0	,	542090	,	0	,	0	}	,
				{	542091	,	542092	,	542093	,	542094	,	542095	,	0	,	0	,	0	}	,	
				{	543140	,	543141	,	543142	,	543143	,	0	,	0	,	0	,	543144	}	,
				{	543145	,	543146	,	543147	,	543148	,	0	,	0	,	543149	,	0	}
																} ,




				[50] = {
				{	0 	,	542096	,	542097	,	542098	,	542099	,	542100	,	543072	,	543073	}	,
				{	542101	,	0	,	542102	,	542103	,	542104	,	542105	,	543074	,	543075	}	,
				{	542106	,	542107	,	0	,	542108	,	542109	,	542110	,	543076	,	543077	}	,
				{	542111	,	542112	,	542113	,	0	,	542114	,	542115	,	543078	,	543079	}	,
				{	542116	,	542117	,	542118	,	542119	,	0	,	542120	,	0	,	0	}	,
				{	542121	,	542122	,	542123	,	542124	,	542125	,	0	,	0	,	0	}	,	
				{	543150	,	543151	,	543152	,	543153	,	0	,	0	,	0	,	543154	}	,
				{	543155	,	543156	,	543157	,	543158	,	0	,	0	,	543159	,	0	}
																} 

																		}


	local Voc = ReadRoleValue (OwnerID() , EM_RoleValue_VOC )
	local SubVoc = ReadRoleValue(OwnerID() , EM_RoleValue_VOC_SUB )
	local VocLv = ReadRoleValue( OwnerID() , EM_RoleValue_Lv )
	local SubLv = voc_lv( SubVoc , OwnerID() )

	if SubVoc == -1 then
		SetSpeakDetail ( OwnerID() , "[SC_111454_17]" )
	else
		if VocLv < 15 or SubLv < 15 then
			SetSpeakDetail(OwnerID() , GetString("SC_111454_19") )
			return
		end
		if	Voc == 7 or Voc == 8 or SubVoc ==7 or SubVoc == 8	then
			top = 45
		end
		for i = 15 , top , 5 do
			if CheckFlag(OwnerID() , VocationSkill[i][Voc][SubVoc] ) == false then
				local String = "SC_SKILL_"..Voc..SubVoc..i
				SetSpeakDetail ( OwnerID() , "["..String.."]"  )
				break
			end
			if i == top then
				SetSpeakDetail(OwnerID() , GetString("SC_111454_7") ) --在你現在的職業上我已經沒什麼可以教你的了，相信你未來可以創造出更多令人驚訝的事蹟吧！
				return
			end
		end
		AddSpeakOption ( OwnerID(), TargetID( ), GetString("SC_111454_14") , "Discowood_Vocation_Talk_GetSkill", 0 ) 
	end
	
end