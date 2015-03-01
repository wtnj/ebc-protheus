#include "Rwmake.ch"
#include "Protheus.ch"
#include "topconn.ch"

#DEFINE c_ent CHR(13) + CHR(10)

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³EBCR001   ºAutor  ³Marcelo Amaral      º Data ³  25/02/15   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³ Impressão de Nota Fiscal Gráfica                           º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ PROTHEUS 11 - EBC                                          º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/

***********************
User Function EBCR001()
***********************

Local aArea     	:= GetArea()
Local cQuery		:= ""
Local cQuery2		:= ""
Local cQry			:= ""
Local cAlias2    	:= GetNextAlias()
Local cExtenso		:= ""
Local cParcTit		:= GETMV("MV_1DUP")

Private oArial16 := TFont():New( "Arial",, 16,,.F.,,,,.F.,.F.)

Private cAlias    	:= GetNextAlias()
Private oFntCur05n 	:= TFont():New( "Courier New" ,,05,,.F.,,,,,.F. )
Private oFntCur06n 	:= TFont():New( "Courier New" ,,06,,.F.,,,,,.F. )
Private oFntCur07n 	:= TFont():New( "Courier New" ,,07,,.F.,,,,,.F. )
Private oFntCur06B 	:= TFont():New( "Courier New" ,,06,,.T.,,,,,.F. )
Private oFntCur08n 	:= TFont():New( "Courier New" ,,08,,.F.,,,,,.F. )
Private oFntCur08b 	:= TFont():New( "Courier New" ,,08,,.T.,,,,,.F. )
Private oFntCur09n 	:= TFont():New( "Courier New" ,,09,,.F.,,,,,.F. )
Private oFntCur09B	:= TFont():New( "Courier New" ,,09,,.T.,,,,,.F. )
Private oFnt10N    	:= TFont():New( "Arial"       ,,10,,.T.,,,,.F.,.F.)
Private oFntCur10n 	:= TFont():New( "Courier New" ,,10,,.F.,,,,,.F. )
Private oFntCur10b 	:= TFont():New( "Courier New" ,,10,,.t.,,,,,.F. )
Private oFntCur12n 	:= TFont():New( "Courier New" ,,12,,.F.,,,,,.F. )
Private oFntCur12B 	:= TFont():New( "Courier New" ,,12,,.T.,,,,,.F. )
Private oFntCur15B 	:= TFont():New( "Courier New" ,,15,,.T.,,,,,.F. )
Private oBrush     	:= TBrush():New(,RGB(230,230,230))
Private cPerg       := Padr("EBCR001",10)
Private cAlias3    	:= GetNextAlias()

PRIVATE cNomeEmp    := ""                    

PutSX1(cPerg , "01" , "Data De         ?" , "" , "" , "mv_ch1"  , "D" , TAMSX3("F2_EMISSAO")[1] , 0 , 0 , "G" , "", "   "	, "", "", "mv_par01" , "      " ,"","","","      " , "   " , "" , "" , "" , "" , "" , "" , "" , "" , "" , "" )
PutSX1(cPerg , "02" , "Data Ate        ?" , "" , "" , "mv_ch2"  , "D" , TAMSX3("F2_EMISSAO")[1] , 0 , 0 , "G" , "", "   "	, "", "", "mv_par02" , "      " ,"","","","      " , "   " , "" , "" , "" , "" , "" , "" , "" , "" , "" , "" )
PutSX1(cPerg , "03" , "Nota Fiscal De  ?" , "" , "" , "mv_ch3"  , "C" , TAMSX3("F2_DOC")[1] 	, 0 , 0 , "G" , "", "   "	, "", "", "mv_par03" , "      " ,"","","","      " , "   " , "" , "" , "" , "" , "" , "" , "" , "" , "" , "" )
PutSX1(cPerg , "04" , "Nota Fiscal Até ?" , "" , "" , "mv_ch4"  , "C" , TAMSX3("F2_DOC")[1] 	, 0 , 0 , "G" , "", "   "	, "", "", "mv_par04" , "      " ,"","","","      " , "   " , "" , "" , "" , "" , "" , "" , "" , "" , "" , "" )
PutSX1(cPerg , "05" , "Serie De        ?" , "" , "" , "mv_ch5"  , "C" , TAMSX3("F2_SERIE")[1] 	, 0 , 0 , "G" , "", "   "	, "", "", "mv_par05" , "      " ,"","","","      " , "   " , "" , "" , "" , "" , "" , "" , "" , "" , "" , "" )
PutSX1(cPerg , "06" , "Serie Até       ?" , "" , "" , "mv_ch6"  , "C" , TAMSX3("F2_SERIE")[1] 	, 0 , 0 , "G" , "", "   "	, "", "", "mv_par06" , "      " ,"","","","      " , "   " , "" , "" , "" , "" , "" , "" , "" , "" , "" , "" )
PutSX1(cPerg , "07" , "Cliente De      ?" , "" , "" , "mv_ch7"  , "C" , TAMSX3("F2_CLIENTE")[1] , 0 , 0 , "G" , "", "SA1"	, "", "", "mv_par07" , "      " ,"","","","      " , "   " , "" , "" , "" , "" , "" , "" , "" , "" , "" , "" )
PutSX1(cPerg , "08" , "Cliente Até     ?" , "" , "" , "mv_ch8"  , "C" , TAMSX3("F2_CLIENTE")[1] , 0 , 0 , "G" , "", "SA1"	, "", "", "mv_par08" , "      " ,"","","","      " , "   " , "" , "" , "" , "" , "" , "" , "" , "" , "" , "" )
PutSX1(cPerg , "09" , "Via             ?" , "" , "" , "mv_ch9"  , "N" , 1 						, 0 , 0 , "C" , "", "   "	, "", "", "mv_par09" , "1a Via" ,"","","","2a Via" , "   " , "" , "" , "" , "" , "" , "" , "" , "" , "" , "" )

If !Pergunte(cPerg,.T.)
	Return
Endif

cQry := "Select F2_EMISSAO,F2_DOC,F2_SERIE,F2_VALMERC,F2_DESCONT,F2_VALIRRF,F2_VALINSS,F2_VALCOFI,F2_VALPIS,F2_VALCSLL,F2_VALISS,F2_COND,D2_TES,D2_CF,D2_ALQIRRF,D2_ALIQINS,D2_ALQCSL,D2_ALQPIS,D2_ALQCOF,D2_ALIQISS,C5_NUM,C5_CLIENTE,C5_LOJACLI,C5_MENNOTA,C5_MENPAD,A1_NOME,A1_END,A1_BAIRRO,A1_CEP,A1_MUN,A1_EST,A1_CGC,A1_INSCR,A1_INSCRM,A1_TEL,A1_FAX,A1_EMAIL,D2_COD,D2_QUANT,D2_PRCVEN,D2_TOTAL " + c_ent

cQry += "FROM "+RetSqlName("SD2")+" SD2, "+RetSqlName("SF2")+" SF2, "+RetSqlName("SA1")+" SA1, "+RetSqlName("SC6")+" SC6, "+RetSqlName("SC5")+" SC5 " + c_ent

cQry += "WHERE D2_FILIAL = '" + xFilial("SD2") + "' " + c_ent
cQry += "AND F2_FILIAL = '" + xFilial("SF2") + "' " + c_ent
cQry += "AND A1_FILIAL = '" + xFilial("SA1") + "' " + c_ent
cQry += "AND C6_FILIAL = '" + xFilial("SC6") + "' " + c_ent
cQry += "AND C5_FILIAL = '" + xFilial("SC5") + "' " + c_ent

cQry += "AND F2_EMISSAO BETWEEN '" + DtoS(mv_par01) + "' AND '" + DtoS(mv_par02) + "' " +c_ent
cQry += "AND F2_DOC BETWEEN '" + mv_par03 + "' AND '" + mv_par04 + "' " +c_ent
cQry += "AND F2_SERIE BETWEEN '" + mv_par05 + "' AND '" + mv_par06 + "' " +c_ent

cQry += "AND F2_CLIENTE BETWEEN '" + mv_par07 + "' AND '" + mv_par08 + "' " + c_ent

cQry += "AND D2_FILIAL = F2_FILIAL " + c_ent
cQry += "AND D2_DOC = F2_DOC " + c_ent
cQry += "AND D2_SERIE = F2_SERIE " + c_ent
cQry += "AND D2_CLIENTE = F2_CLIENTE " + c_ent
cQry += "AND D2_LOJA = F2_LOJA " + c_ent

cQry += "AND F2_CLIENTE = A1_COD " + c_ent
cQry += "AND F2_LOJA = A1_LOJA " + c_ent

cQry += "AND D2_FILIAL = C6_FILIAL " + c_ent
cQry += "AND D2_PEDIDO = C6_NUM " + c_ent
cQry += "AND D2_ITEMPV = C6_ITEM " + c_ent

cQry += "AND C6_FILIAL = C5_FILIAL " + c_ent
cQry += "AND C6_NUM = C5_NUM " + c_ent

cQry += "AND SD2.D_E_L_E_T_= ' ' " + c_ent
cQry += "AND SF2.D_E_L_E_T_= ' ' " + c_ent
cQry += "AND SA1.D_E_L_E_T_= ' ' " + c_ent
cQry += "AND SC6.D_E_L_E_T_= ' ' " + c_ent
cQry += "AND SC5.D_E_L_E_T_= ' ' " + c_ent

cQry += "GROUP BY F2_EMISSAO, F2_DOC, F2_SERIE,F2_VALMERC,F2_DESCONT,F2_VALIRRF,F2_VALINSS,F2_VALCOFI,F2_VALPIS,F2_VALCSLL,F2_VALISS,F2_COND,D2_TES,D2_CF,D2_ALQIRRF,D2_ALIQINS,D2_ALQCSL,D2_ALQPIS,D2_ALQCOF,D2_ALIQISS,C5_NUM,C5_CLIENTE,C5_LOJACLI,C5_MENNOTA,C5_MENPAD,A1_NOME,A1_END,A1_BAIRRO,A1_CEP,A1_MUN,A1_EST,A1_CGC,A1_INSCR,A1_INSCRM,A1_TEL,A1_FAX,A1_EMAIL,D2_COD,D2_QUANT,D2_PRCVEN,D2_TOTAL " + c_ent
cQry += "ORDER BY F2_EMISSAO, F2_DOC, F2_SERIE " + c_ent

cQry := changeQuery(cQry)

*--------------------------------------*
* Verifica se o alias esta em uso
*--------------------------------------*
If Select(cAlias) > 0
	dbSelectArea( cAlias )
	dbCloseArea()
EndIf

*--------------------------------------------*
* Cria o alias executando a query
*--------------------------------------------*
dbUseArea( .T., 'TOPCONN', TCGENQRY(,,cQry), cAlias, .F., .T.)

Dbselectarea(cAlias)
Dbgotop()

If !(cAlias)->(EOF())
	
	oPrn:=TMsPrinter():New("Impressão de Nota Fiscal Gráfica")
	oPrn:SetPortrait()
	
	nPagina := 0
	
	While !(cAlias)->(EOF())
		
		nPagina += 1
		
		oPrn:StartPage()
		
		oPrn:Box(0055, 0055, 0540, 2300)
		oPrn:Box(0055, 0480, 0540, 0480)
		oPrn:Box(0055, 1100, 0540, 1100)
		oPrn:Box(0055, 2020, 0420, 2020)
		
		oPrn:SayBitmap(0240, 0060, "lgrl"+Substr(cFilAnt,1,2)+".bmp", 0385, 0150)
		dbSelectArea("SM0")
		SM0->(dbSetOrder(1))
		nRecno := SM0->(Recno())
		SM0->(dbSeek(cEmpAnt+cFilAnt))
		oPrn:Say(0060,0500,SubStr(SM0->M0_NOMECOM,1,70),oFntCur10N,,,,0)
		
		cNomeEmp := SubStr(SM0->M0_NOMECOM,1,70)

		oPrn:Say(0120,0500,Substr("CNPJ: "+Transform(SM0->M0_CGC,"@R 99.999.999/9999-99"),1,70),oFntCur10N,,,,0)
		oPrn:Say(0180,0500,Substr("CF/DF: 07.507.191/001-01",1,70),oFntCur10N,,,,0)
		
		oPrn:Say(0240,0500,SubStr(AllTrim(SM0->M0_ENDCOB),1,70),oFntCur08N,,,,0)
		oPrn:Say(0300,0500,Substr(AllTrim(SM0->M0_COMPCOB)+"-"+AllTrim(SM0->M0_BAIRCOB),1,70),oFntCur08N,,,,0)
		oPrn:Say(0360,0500,AllTrim(SM0->M0_CIDCOB)+"-"+Substr(AllTrim(SM0->M0_ESTCOB)+"-"+Transform(SM0->M0_CEPCOB,"@R 99.999-999"),1,70),oFntCur08N,,,,0)
		oPrn:Say(0420,0500,Substr("TELEFONE: "+AllTrim(SM0->M0_TEL),1,70),oFntCur08N,,,,0)
		oPrn:Say(0480,0500,Substr("FAX: "+AllTrim(SM0->M0_FAX),1,70),oFntCur08N,,,,0)
		SM0->(dbGoTo(nRecno))
		
		oPrn:Say(0120,1180,Substr("NOTA FISCAL/FATURA DE SERVIÇO DE COMUNICAÇÃO",1,70),oFntCur08B,,,,0)
		oPrn:Say(0180,1460,Substr("MODELO - 21",1,70),oFntCur08N,,,,0)
		oPrn:Say(0240,1150,Substr("EMITIDA POR PROCESSAMENTO ELETRÔNICO DE DADOS - SISTEMA LASER - ",1,70),oFntCur06N,,,,0)
		oPrn:Say(0300,1120,Substr("CONFORME AUTORIZADO PELO ATO DECLARATÓRIO No. 024/2008 GEJUC/DITRI",1,70),oFntCur06N,,,,0)
		oPrn:Say(0360,1220,Substr("AIDF No. 134500837/2014 - Validade 05/09/2015",1,70),oFntCur07N,,,,0)

		cNaturOper := ""
		dbSelectArea("SF4")
		SF4->(dbSetOrder(1))
		if SF4->(dbSeek(xFilial("SF4")+(cAlias)->D2_TES))
			cNaturOper := SF4->F4_TEXTO
		endif
		
		oPrn:Box(0420, 1100, 0420, 2300)
		
		oPrn:Say(0480,1120,"Natureza da Prestação: "+cNaturOper+" Cod.: "+(cAlias)->D2_CF,oFntCur08N,,,,0)
		
		oPrn:Say(0180,2040,"No. ",oFntCur12B,,,,0)
		oPrn:Say(0240,2040,(cAlias)->F2_DOC,oFntCur12B,,,,0)
		
		cDoc := (cAlias)->F2_DOC
		cSerie := (cAlias)->F2_SERIE
		cCliente := (cAlias)->C5_CLIENTE
		cLoja := (cAlias)->C5_LOJACLI
		
		cQuery2 := "Select COUNT(*) AS QTREG " + c_ent
		cQuery2 += "FROM "+RetSqlName("SD2")+" SD2 " + c_ent
		cQuery2 += "WHERE D2_FILIAL = '" + xFilial("SD2") + "' " + c_ent
		cQuery2 += "AND D2_DOC = '" + cDoc + "' " +c_ent
		cQuery2 += "AND D2_SERIE = '" + cSerie + "' " +c_ent
		cQuery2 += "AND D2_CLIENTE = '" + cCliente + "' " + c_ent
		cQuery2 += "AND D2_LOJA = '" + cLoja + "' " + c_ent
		cQuery2 += "AND D_E_L_E_T_= ' ' " + c_ent
		
		cQuery2 := changeQuery(cQuery2)
		
		*--------------------------------------*
		* Verifica se o alias esta em uso
		*--------------------------------------*
		If Select(cAlias3) > 0
			dbSelectArea( cAlias3 )
			dbCloseArea()
		EndIf
		
		*--------------------------------------------*
		* Cria o alias executando a query
		*--------------------------------------------*
		dbUseArea( .T., 'TOPCONN', TCGENQRY(,,cQuery2), cAlias3, .F., .T.)
		
		Dbselectarea(cAlias3)
		Dbgotop()
		
		nQtRegAli := 0
		If !(cAlias3)->(EOF())
			nQtRegAli := (cAlias3)->QTREG
		endif
		if nQtRegAli = 0
			nQtRegAli := 1
		endif
		
		oPrn:Box(0600, 0105, 0690, 1805)
		oPrn:Say(0630,0755,"FATURA/DUPLICATA",oFntCur10N,,,,0)
		
		oPrn:Box(0690, 0105, 0840, 1805)
		oPrn:Box(0690, 0505, 0840, 0505)
		oPrn:Box(0690, 0905, 0840, 0905)
		oPrn:Box(0690, 1305, 0840, 1305)

		oPrn:Say(0720,0125,"Data de Emissão:",oFntCur10N,,,,0)
		oPrn:Say(0720,0525,"Valor R$:",oFntCur10N,,,,0)
		oPrn:Say(0720,0925,"No. de Ordem:",oFntCur10N,,,,0)
		oPrn:Say(0720,1325,"Data de Vencimento:",oFntCur10N,,,,0)
		
		oPrn:Say(0780,0125,Dtoc(Stod((cAlias)->F2_EMISSAO)),oFntCur10N,,,,0)
		oPrn:Say(0780,0525,Alltrim(Transform((cAlias)->F2_VALMERC,PesqPict("SF2","F2_VALMERC"))),oFntCur10N,,,,0)
		oPrn:Say(0780,0925,(cAlias)->F2_DOC,oFntCur10N,,,,0)
		
		cQuery := "SELECT E1_PREFIXO,E1_NUM,E1_PARCELA,E1_VENCTO,E1_VALOR,E1_SALDO,E1_IRRF,E1_CSLL,E1_COFINS,E1_PIS "+c_ent
		cQuery += "FROM " + RetSqlName("SE1") + " SE1 "+c_ent
		cQuery += "WHERE E1_FILIAL = '"+ xFilial("SE1") +"' "+c_ent
		cQuery += "AND E1_PREFIXO = '"+ (cAlias)->F2_SERIE +"' "+c_ent
		cQuery += "AND E1_NUM = '"+ (cAlias)->F2_DOC +"' "+c_ent
		cQuery += "AND E1_TIPO = 'NF' "+c_ent
		cQuery += "AND (E1_PARCELA = ' ' OR E1_PARCELA = '"+ cParcTit +"') "+c_ent
		cQuery += "AND SE1.D_E_L_E_T_ = ' ' "+c_ent
		cQuery += "ORDER BY E1_PARCELA "+c_ent
		
		cQuery := changeQuery(cQuery)
		
		If Select(cAlias2) > 0
			dbSelectArea( cAlias2 )
			dbCloseArea()
		EndIf
		
		dbUseArea( .T., "TOPCONN", TcGenQry(,,cQuery), cAlias2, .T., .F.)
		
		dbSelectarea(cAlias2)
		If !(cAlias2)->(EOF())
			oPrn:Say(0780,1325,Transform(Stod((cAlias2)->E1_VENCTO),"@D"),oFntCur10N,,,,0)
		Endif
		(cAlias2)->(dbCloseArea())
		
		oPrn:Box(0840, 0105, 0990, 1805)
		
		cExtenso := Alltrim(Extenso((cAlias)->F2_VALMERC))
		oPrn:Say(0870,0125,"Valor por Extenso:",oFntCur10N,,,,0)
		oPrn:Say(0930,0125,cExtenso,oFntCur07N,,,,0)

		oPrn:Box(0600, 1805, 0730, 2250)
		oPrn:Box(0730, 1805, 0860, 2250)
		oPrn:Box(0860, 1805, 0990, 2250)
		
		oPrn:Say(0630,1825,"Contrato:",oFntCur08N,,,,0)
		oPrn:Say(0690,1825,"S456/14",oFntCur10N,,,,0)

		oPrn:Say(0760,1825,"Emissora:",oFntCur08N,,,,0)
		oPrn:Say(0820,1825,"MEC FM RIO",oFntCur10N,,,,0)

		oPrn:Say(0890,1825,"Resp. pelo Pagamento:",oFntCur08N,,,,0)
		oPrn:Say(0950,1825,"Cliente",oFntCur10N,,,,0)
		
		oPrn:Box(0990, 0105, 1140, 2250)
		oPrn:Say(1020,0125,"Cliente:",oFntCur10N,,,,0)
		oPrn:Say(1080,0125,(cAlias)->A1_NOME,oFntCur10N,,,,0)

		oPrn:Box(1140, 0105, 1290, 2250)
		oPrn:Say(1170,0125,"Endereço:",oFntCur10N,,,,0)
		oPrn:Say(1230,0125,Alltrim((cAlias)->A1_END)+"-"+Alltrim((cAlias)->A1_BAIRRO)+"-"+Alltrim((cAlias)->A1_MUN)+"-"+Alltrim((cAlias)->A1_EST),oFntCur10N,,,,0)

		oPrn:Box(1290, 0105, 1440, 2250)
		oPrn:Box(1290, 0505, 1440, 0505)
		oPrn:Box(1290, 0905, 1440, 0905)
		oPrn:Box(1290, 1605, 1440, 1605)
		
		oPrn:Say(1320,0125,"CEP:",oFntCur10N,,,,0)
		oPrn:Say(1380,0125,Transform((cAlias)->A1_CEP,"@R 99.999-999"),oFntCur10N,,,,0)

		oPrn:Say(1320,0525,"Tel.:",oFntCur10N,,,,0)
		oPrn:Say(1380,0525,(cAlias)->A1_TEL,oFntCur10N,,,,0)

		oPrn:Say(1320,0925,"CNPJ/CPF:",oFntCur10N,,,,0)
		oPrn:Say(1380,0925,Transform((cAlias)->A1_CGC,"@R 99.999-999/9999-99"),oFntCur10N,,,,0)

		oPrn:Say(1320,1625,"Inscrição Estadual:",oFntCur10N,,,,0)
		oPrn:Say(1380,1625,(cAlias)->A1_INSCR,oFntCur10N,,,,0)

		oPrn:Box(1440, 0105, 1590, 2250)
		oPrn:Say(1470,0125,"Agência / Corretor:",oFntCur10N,,,,0)
		oPrn:Say(1530,0125,"DIRETO",oFntCur10N,,,,0)

		oPrn:Box(1590, 0105, 1740, 2250)
		oPrn:Say(1620,0125,"Endereço:",oFntCur10N,,,,0)
		oPrn:Say(1680,0125,"SCS Q.08 ED.VENÂNCIO 2000 - BLOCO B-60 - 1o.PISO INFERIOR - ASA SUL - BRASÍLIA/DF",oFntCur10N,,,,0)

		oPrn:Box(1740, 0105, 1890, 2250)
		oPrn:Box(1740, 0505, 1890, 0505)
		oPrn:Box(1740, 0905, 1890, 0905)
		oPrn:Box(1740, 1605, 1890, 1605)
		oPrn:Box(1740, 1905, 1890, 1905)
		
		oPrn:Say(1770,0125,"CEP:",oFntCur10N,,,,0)
		oPrn:Say(1830,0125,"70.333-900",oFntCur10N,,,,0)

		oPrn:Say(1770,0525,"Tel.:",oFntCur10N,,,,0)
		oPrn:Say(1830,0525,"3799-567",oFntCur10N,,,,0)

		oPrn:Say(1770,0925,"CNPJ/CPF:",oFntCur10N,,,,0)
		oPrn:Say(1830,0925,"09.168.704/0001-42",oFntCur10N,,,,0)

		oPrn:Say(1770,1625,"% Comissão:",oFntCur10N,,,,0)
		oPrn:Say(1830,1625,"0",oFntCur10N,,,,0)

		oPrn:Say(1770,1925,"Valor R$:",oFntCur10N,,,,0)
		oPrn:Say(1830,1925,"0,00",oFntCur10N,,,,0)

		// verificar

		oPrn:Box(1950, 0055, 2100, 2300)
		oPrn:Box(1950, 0380, 2100, 0380)
		oPrn:Box(1950, 1520, 2100, 1520)
		
		oPrn:Box(2025, 1520, 2025, 2300)
		oPrn:Box(2025, 1920, 2100, 1920)
		
		oPrn:Say(1980,0155,"Quant.",oFntCur10N,,,,0)
		oPrn:Say(1980,0615,"Discriminação do(s) Serviço(s)",oFntCur10N,,,,0)
		oPrn:Say(1980,1825,"Valor R$",oFntCur10N,,,,0)

		oPrn:Say(2040,1620,"Unitário",oFntCur10N,,,,0)
		oPrn:Say(2040,2050,"Total",oFntCur10N,,,,0)
		
		cDoc := (cAlias)->F2_DOC
		cSerie := (cAlias)->F2_SERIE
		cCliente := (cAlias)->C5_CLIENTE
		cLoja := (cAlias)->C5_LOJACLI
		nValMerc := (cAlias)->F2_VALMERC
		nContador := 0
		nLinha := 2070
		
		While !(cAlias)->(EOF()) .and. alltrim((cAlias)->F2_DOC) == alltrim(cDoc) .and. alltrim((cAlias)->F2_SERIE) == alltrim(cSerie) .and. alltrim((cAlias)->C5_CLIENTE) == alltrim(cCliente) .and. alltrim((cAlias)->C5_LOJACLI) == alltrim(cLoja)
			nContador += 1
			if nContador > 15
				Exit
			endif
			nLinha += 60
			oPrn:Say(nLinha,0075,Alltrim(Transform((cAlias)->D2_QUANT,PesqPict("SD2","D2_QUANT"))),oFntCur10N,,,,0)
			dbSelectArea("SB5")
			SB5->(dbSetOrder(1))
			if SB5->(dbSeek(xFilial("SB5")+(cAlias)->D2_COD))
				oPrn:Say(nLinha,0400,SB5->B5_CEME,oFntCur10N,,,,0)
			else
				dbSelectArea("SB1")
				SB1->(dbSetOrder(1))
				if SB1->(dbSeek(xFilial("SB1")+(cAlias)->D2_COD))
					oPrn:Say(nLinha,0400,SB1->B1_DESC,oFntCur10N,,,,0)
				endif
			endif
			oPrn:Say(nLinha,1550,Transform((cAlias)->D2_PRCVEN,PesqPict("SD2","D2_TOTAL")),oFntCur10N,,,,0)
			oPrn:Say(nLinha,1950,Transform((cAlias)->D2_TOTAL,PesqPict("SD2","D2_TOTAL")),oFntCur10N,,,,0)
			(cAlias)->(dbSkip())
		end

		lImpTot := .F.
		if nPagina = Int(nQtRegAli/9)+iif(Mod(nQtRegAli,9)<>0,1,0)
			lImpTot := .T.
		endif
		
		oPrn:Box(2100, 0055, 3020, 2300)
		oPrn:Box(2100, 0380, 3020, 0380)
		oPrn:Box(2100, 1520, 3020, 1520)
		oPrn:Box(2100, 1920, 3020, 1920)

		oPrn:Box(3020, 0055, 3170, 2300)

		oPrn:Box(3020, 0105, 3170, 2250)
		oPrn:Box(3020, 0505, 3170, 0505)
		oPrn:Box(3020, 0905, 3170, 0905)
		oPrn:Box(3020, 1605, 3170, 1605)
		
		oPrn:Say(3050,0125,"Base de Cálculo do ICMS:",oFntCur06N,,,,0)
		oPrn:Say(3110,0125,"R$ 0,00",oFntCur10N,,,,0)

		oPrn:Say(3050,0525,"Alíquota:",oFntCur06N,,,,0)
		oPrn:Say(3110,0525,"",oFntCur10N,,,,0)

		oPrn:Say(3050,0925,"Valor do ICMS:",oFntCur06N,,,,0)
		oPrn:Say(3110,0925,"R$ 0,00",oFntCur10N,,,,0)

		oPrn:Say(3050,1625,"Data ou Período da Prestação do Serviço:",oFntCur06N,,,,0)
		oPrn:Say(3110,1625,"08/12/2014 a 10/12/2014",oFntCur10N,,,,0)
		
		oPrn:Box(3170, 0055, 3320, 2300)
		
		oPrn:Say(3350,0155,"Reservado ao Fisco: 36B2.6553.670A.A63F.821E.5526.38FA.0539",oFntCur10N,,,,0)

		oPrn:Say(3410,0155,"PROCON-DF - SCS VENANCIO 2000, BLOCO B-60, SALA 240 CEP 70.333-900 - BRASILIA/DF - TELEFONE: 3905-7826",oFntCur10N,,,,0)
		
		oPrn:EndPage()
		
	End
	
	oPrn:Preview()
	
Else

	MsgInfo("Nenhum Movimento foi Encontrado para os Parâmetros Selecionados! Verifique.","Atenção")
	
EndIf

dbSelectArea(cAlias)
dbCloseArea()

RestArea(aArea)

Return
