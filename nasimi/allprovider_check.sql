select [ProviderName],qrup,Sum(ProviderAmount) from
(
SELECT TOP 1000 [ID]
,[ServiceName]
,[Amount]
,[ProviderAmount]
,[CommissionAmount]
,[Count]
,[Agent]
,[ProviderName],
CASE

--
when [ProviderName] LIKE '%Azeriqaz%' THEN 1
when [ProviderName] LIKE '%Az%rsu%' THEN 2
when ID in (12404 ,12404,17744,17783) THEN 3.1 -- azerisiq
when ID in (12405,17798) THEN 3.2              -- azerisiq
when [ProviderName] LIKE '%Azercell%' THEN 4
when [ProviderName] LIKE '%Bakcell%' THEN 5
when [ServiceName] LIKE '%Azerfon%' THEN 5.1   --azerfon
when [ServiceName] LIKE '%Narhome%' THEN 5.2   --azerfon
WHEN [ProviderName] LIKE '%Freenet%' THEN 6
WHEN [ProviderName] LIKE '%modus%' THEN 7
WHEN [ProviderName] LIKE '%smarthome baku%' THEN 8
WHEN [ProviderName] LIKE '%Access%bank%' THEN 9
WHEN [ProviderName] LIKE '%Amrah%' THEN 10
WHEN [ProviderName] LIKE 'AzerTurkBank' then 11

WHEN [ProviderName] LIKE '%ABB%' THEN 12
--WHEN [ProviderName] LIKE '%AT%nk%' THEN 12
WHEN [ProviderName] LIKE '%Avras%' THEN 13
WHEN [ProviderName] LIKE '%btb%' THEN 14
WHEN [ProviderName] LIKE '%bank%baku%' THEN 15
WHEN [ProviderName] LIKE '%respub%' THEN 16
WHEN [ProviderName] LIKE '%vtb%' THEN 17
WHEN [ProviderName] LIKE '%emba%' THEN 18
WHEN [ProviderName] LIKE '%ideal%' THEN 19
WHEN [ProviderName] LIKE '%qafqaz%B%' THEN 20
--WHEN [ProviderName] LIKE '%finca%' THEN 21


WHEN [ServiceName] LIKE '%finca%1%' THEN 21.1   --finca

WHEN [ServiceName] LIKE '%finca%' THEN 21.2   --finca

WHEN [ProviderName] LIKE '%nk%maliyy%' THEN 22
WHEN [ProviderName] LIKE '%kapi%' THEN 23
WHEN [ProviderName] LIKE '%kredit%ev%' THEN 24
WHEN [ProviderName] LIKE '%Merkuri Yeni%' THEN 25
WHEN [ProviderName] LIKE 'Mj%F%' THEN 26
WHEN [ProviderName] LIKE '%MolBulak%' THEN 27

--WHEN [ProviderName] LIKE '%MuganBank%' THEN 28
--3denedir
WHEN [ServiceName] LIKE '%MuganBank%loan%' THEN 28 
WHEN [ServiceName] LIKE '%MuganBank%200%' THEN 28.1   --200 den az

WHEN [ServiceName] LIKE '%MuganBank%' THEN 28.2   --200 den cox

WHEN [ProviderName] LIKE '%NBCBank%' THEN 29

WHEN [ProviderName] LIKE '%niko%' THEN 30
WHEN [ProviderName] LIKE '%psg%' THEN 32
WHEN [ProviderName] LIKE '%barat%' THEN 33
WHEN [ProviderName] LIKE '%rabita%' THEN 34
WHEN [ProviderName] LIKE '%tbcc%' THEN 35
WHEN [ProviderName] LIKE '%turan%' THEN 36

WHEN [ProviderName] LIKE '%uniba%' THEN 37
WHEN [ProviderName] LIKE '%yap%kred%' THEN 38
--sigorta
WHEN [ProviderName] LIKE '%stan%nce%' THEN 39
WHEN [ProviderName] LIKE '%atas%' THEN 40

--WHEN [ProviderName] LIKE 'at%h' THEN 40.5

WHEN ServiceName LIKE 'at%h_h_yat' THEN 40.5
WHEN ServiceName LIKE 'at%h_%rta' THEN 40.6

WHEN [ProviderName] LIKE '%meqa%s%' THEN 41
WHEN [ProviderName] LIKE '%PasaHeyat%' THEN 42

--sigorta
WHEN [ProviderName] LIKE '%KATV%' THEN 43
--WHEN [ProviderName] LIKE '%alfa%' THEN 44

WHEN ServiceName LIKE 'alfa%adsl' THEN 44.1
WHEN ServiceName LIKE 'alfa%tv' THEN 44.2

WHEN [ProviderName] LIKE '%an%media%' THEN 45
WHEN [ProviderName] LIKE '%atv%plus%' THEN 46
WHEN [ProviderName] LIKE '%avirtel%' THEN 47

WHEN [ProviderName] LIKE '%azeronline%' THEN 48

WHEN [ProviderName] LIKE '%az%fiber%net%' THEN 49
WHEN [ProviderName] LIKE '%azstar%' THEN 49.5
WHEN ServiceName LIKE 'A_l_%tv%tv%' THEN 50.1
WHEN ServiceName LIKE 'A_l_%tv%ip%' THEN 50.1

WHEN [ProviderName] LIKE '%caspian%' THEN 50

WHEN [ProviderName] LIKE '%clip%' THEN 51
WHEN [ProviderName] LIKE '%data%' THEN 52
WHEN [ProviderName] LIKE '%enginet%' THEN 53
WHEN [ProviderName] LIKE '%fibernet%new%' THEN 54
WHEN [ProviderName] LIKE '%fibernet%tel%' THEN 55
WHEN [ProviderName] LIKE '%gsp%' THEN 56

WHEN [ProviderName] LIKE '%az%com'  THEN 56.5 -- innet
WHEN [ProviderName] LIKE '%izone%' THEN 57

-----connecti bolmek
WHEN [ProviderName] LIKE '%connect%new%' THEN 58

WHEN [ProviderName] LIKE '%metro%net%' THEN 59

WHEN [ProviderName] LIKE '%mhm%' THEN 60

WHEN [ProviderName] LIKE '%rahat%te%' THEN 61
WHEN [ProviderName] LIKE '%nurcan%' THEN 61.5
WHEN [ProviderName] LIKE '%smart%' THEN 62

WHEN [ProviderName] LIKE '%odtv%' THEN 63
WHEN [ProviderName] LIKE '%teleport%' THEN 64

WHEN [ProviderName] LIKE '%ultel%' THEN 65

WHEN [ProviderName] LIKE '%ultranet%' THEN 66
WHEN [ProviderName] LIKE '%uninet%' THEN 67
WHEN [ProviderName] LIKE '%citynet%' THEN 67
WHEN [ProviderName] LIKE '%KontaktHome%' THEN 68

WHEN [ProviderName] LIKE '%lalaf%' THEN 69

WHEN [ProviderName] LIKE 'Berqamo%' THEN 69.5
WHEN ID = 17680 THEN 69.5
WHEN ProviderName LIKE '%BuludStore%' THEN 69.7
--WHEN [ProviderName] LIKE '%nay%' THEN 70


WHEN [ProviderName] LIKE '%cyfral%' THEN 71
WHEN [ProviderName] LIKE '%damla%' THEN 71.5

WHEN [ProviderName] LIKE '%dim%' THEN 72
WHEN [ProviderName] LIKE '%dynamic%' THEN 72.5

WHEN [ProviderName] LIKE '%dragr%' THEN 72.7
WHEN [ProviderName] LIKE 'y%m' THEN 73
WHEN [ProviderName] LIKE 'Guven Pay' THEN 73.5

WHEN [ProviderName] LIKE 'KaryerIX (“ENNEAGRAM” MMC)' THEN 73.5
WHEN [ProviderName] LIKE 'ESET NOD32' then 73.7
WHEN [ProviderName] LIKE 'Elephant' then 73.9


WHEN [ProviderName] LIKE '%s%naq%' THEN 74


WHEN [ProviderName] LIKE '%lisenzi%' THEN 75

WHEN [ProviderName] LIKE '%gamebuy%' THEN 75.5
WHEN [ProviderName] LIKE '%teorem%' THEN 75.75
WHEN [ProviderName] LIKE '%yenie%k' THEN 76

WHEN [ProviderName] LIKE '%meydan%mif%az%' THEN 76.5
WHEN [ProviderName] LIKE '%bakuhot%' THEN 76.75
WHEN ServiceName LIKE '%us%po%' THEN 77

WHEN ServiceName LIKE '%faberlic%' THEN 78

WHEN ServiceName LIKE '%edu%tec%' THEN 79


WHEN ServiceName LIKE '%nay%x%t%b%' THEN 80


WHEN ServiceName LIKE '%nab%' THEN 81


WHEN [ProviderName] LIKE '%asan%pay%' THEN 82


WHEN [ProviderName] LIKE 'invest' THEN 83

WHEN [ProviderName] LIKE 'rahat%y%' THEN 84

WHEN [ProviderName] LIKE '%rsad' THEN 85
WHEN [ProviderName] LIKE '%step%' THEN 85.5

WHEN [ProviderName] LIKE '%cargo%' THEN 85.55

WHEN [ProviderName] LIKE '%birpay%' THEN 85.56

WHEN [ProviderName] LIKE '%leykemiya%' THEN 85.7
WHEN [ProviderName] LIKE '%leykemiya%' THEN 85.8

WHEN ServiceName LIKE '%B_r_k_t N__r_yyat_%' THEN 85.9

--WHEN [ProviderName] LIKE '%d%n%' THEN 87

WHEN [ProviderName] LIKE '%At%ah%' THEN 88

WHEN [ProviderName] LIKE '%LSP%' THEN 89


WHEN [ProviderName] LIKE '%paynet%' THEN 90
--WHEN ServiceName LIKE '%GameBuy%' THEN 600

--WHEN ServiceName LIKE '%tep%' THEN 900

WHEN ServiceName LIKE '%Macara (Turizm)%' THEN 4009

WHEN ServiceName LIKE '%Med%nvest%' THEN 4009
WHEN [ProviderName] LIKE '%MegaLink%' THEN 4010
WHEN [ProviderName] LIKE '%mmko%' THEN 5000

WHEN ServiceName LIKE '%Portmanat%cod%' THEN 5002.1
WHEN ServiceName LIKE '%Portmanat' THEN 5002.2
WHEN [ProviderName] LIKE '%topaz%' THEN 5004
WHEN ServiceName LIKE '%net%manat%' THEN 5005
WHEN ServiceName LIKE '%n%ro%' THEN 5006
WHEN ServiceName LIKE '%kassam%az%' THEN 5007

WHEN ServiceName LIKE '%or%me%' THEN 5009
WHEN [ProviderName] LIKE '%raz%n%' THEN 5010





--WHEN ServiceName LIKE '%polo%' THEN 5000
--WHEN ProviderName LIKE '%faberli%' THEN 5001
--WHEN ProviderName LIKE '%edutech%' THEN 5002
--WHEN ProviderName LIKE '%nay%' THEN 5003

--WHEN [ProviderName] LIKE '%rahat%' THEN 5015
--WHEN [ProviderName] LIKE '%ir%ad%' THEN 5016
--WHEN [ProviderName] LIKE '%step%' THEN 5017
--WHEN [ProviderName] LIKE '%leyke%' THEN 5018

WHEN ServiceName LIKE '%socar%' THEN 5011
WHEN [ProviderName] LIKE '%sos%' THEN 5012
WHEN [ProviderName] LIKE '%starex%' THEN 5013
WHEN [ProviderName] LIKE 'T%y%m' THEN 5014
when id in (17495 ,17508) then 5015

WHEN [ProviderName] LIKE '%um_d_yer_%' THEN 5016
WHEN [ProviderName] LIKE '%ubs_gps%' THEN 5017
WHEN [ProviderName] LIKE '%vipl%' THEN 5018
--WHEN [ProviderName] LIKE '%li%' THEN 5099
--WHEN [ProviderName] LIKE '%game%' THEN 5100

-- WHEN ServiceName LIKE '%bank%' THEN 12




WHEN [ProviderName] LIKE 'Bak_xanov% B_l_d_yy_s_' then 9084
WHEN [ProviderName] LIKE 'Balax% B_l_d_yy_s_' then 9085
WHEN [ProviderName] LIKE 'B_l_c% B_l_d_yy_s_' then 9086
WHEN [ProviderName] LIKE 'B_lg%h B_l_d_yy_s_' then 9087
WHEN [ProviderName] LIKE 'K_rd_x% B_l_d_yy_s_' then 9088
WHEN [ProviderName] LIKE 'Ma_ta%B_l_d_yy_s_%' then 9089

WHEN [ProviderName] LIKE 'N_s_m_%B_l_d_yy_s_%' then 9090
WHEN [ProviderName] LIKE 'N_zam_%B_l_d_yy_s_%' then 9091
WHEN [ProviderName] LIKE 'N_zam_%mktb%' then 9092
WHEN [ProviderName] LIKE 'P%B_l_d%' then 9093
WHEN [ProviderName] LIKE 'P%r% B_l_d_yy_s_' then 9094

WHEN [ProviderName] LIKE 'S%bun_u B_l_d_yy_s_' then 9095
WHEN [ProviderName] LIKE 'S%ba_l B_l_d_yy_s_' then 9096
WHEN [ProviderName] LIKE 'X%rdalan B_l_d_yy_s_' then 9097
WHEN [ProviderName] LIKE 'Xocas_n B_l_d_yy_s_' then 9098

WHEN [ProviderName] LIKE 'Yasamal B_l_d_yy_s_' then 9099
WHEN [ProviderName] LIKE 'Zabrat B_l_d_yy_s_' then 9100


ELSE 100 END qrup
FROM [TURALTEST].[dbo].[202001] --where  [ProviderName] LIKE '%mobil%' 
) a group by qrup,[ProviderName]
order by qrup,[ProviderName]
