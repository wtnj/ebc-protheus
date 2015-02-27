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

Local oDlg
Local lConfirmou := .T.
Private oMemo
Private oArial16 := TFont():New( "Arial",, 16,,.F.,,,,.F.,.F.)

Private cAlias    	:= GetNextAlias()
Private oFntCur05n 	:= TFont():New( "Courier New" ,,05,,.F.,,,,,.F. )
Private oFntCur06n 	:= TFont():New( "Courier New" ,,06,,.F.,,,,,.F. )
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

cObs := ""

DEFINE DIALOG oDlg TITLE "Observações / Tipo de Nota Fiscal" FROM 0,0 TO 530,560 PIXEL

oMemo := tMultiGet():New( 005, 005, {|u|if(PCount()>0, cObs := u, cObs)}, oDlg, 270, 195, oArial16,,,,, .T.,,,,,, .F. )

ACTIVATE MSDIALOG oDlg ON INIT EnchoiceBar(oDlg,{|| lConfirmou := .T.,oDlg:End()},{|| lConfirmou := .F.,oDlg:End()}) CENTERED

If !lConfirmou
	Return
EndIf 

cQry := "Select F2_EMISSAO,F2_DOC,F2_SERIE,F2_VALMERC,F2_DESCONT,F2_VALIRRF,F2_VALINSS,F2_VALCOFI,F2_VALPIS,F2_VALCSLL,F2_VALISS,F2_COND,D2_TES,D2_CF,D2_ALQIRRF,D2_ALIQINS,D2_ALQCSL,D2_ALQPIS,D2_ALQCOF,D2_ALIQISS,C5_NUM,C5_CLIENTE,C5_LOJACLI,C5_MENNOTA,C5_MENPAD,A1_NOME,A1_END,A1_BAIRRO,A1_CEP,A1_MUN,A1_EST,A1_CGC,A1_INSCR,A1_INSCRM,A1_TEL,A1_FAX,A1_EMAIL,D2_COD,D2_PRCVEN,D2_TOTAL " + c_ent

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

cQry += "GROUP BY F2_EMISSAO, F2_DOC, F2_SERIE,F2_VALMERC,F2_DESCONT,F2_VALIRRF,F2_VALINSS,F2_VALCOFI,F2_VALPIS,F2_VALCSLL,F2_VALISS,F2_COND,D2_TES,D2_CF,D2_ALQIRRF,D2_ALIQINS,D2_ALQCSL,D2_ALQPIS,D2_ALQCOF,D2_ALIQISS,C5_NUM,C5_CLIENTE,C5_LOJACLI,C5_MENNOTA,C5_MENPAD,A1_NOME,A1_END,A1_BAIRRO,A1_CEP,A1_MUN,A1_EST,A1_CGC,A1_INSCR,A1_INSCRM,A1_TEL,A1_FAX,A1_EMAIL,D2_COD,D2_PRCVEN,D2_TOTAL " + c_ent
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
		
		oPrn:Box(0055, 0055, 0540, 1400)
		oPrn:Box(0055, 1400, 0540, 2300)
		oPrn:SayBitmap(0120, 0480, "Logo_"+Substr(cFilAnt,1,2)+".jpg", 0385, 0150)
		dbSelectArea("SM0")
		SM0->(dbSetOrder(1))
		nRecno := SM0->(Recno())
		SM0->(dbSeek(cEmpAnt+cFilAnt))
		oPrn:Say(0360,0120,SubStr(SM0->M0_NOMECOM,1,70),oFntCur10B,,,,0)
		
		cNomeEmp := SubStr(SM0->M0_NOMECOM,1,70)
		
		oPrn:Say(0420,0120,SubStr(AllTrim(SM0->M0_ENDCOB)+" "+AllTrim(SM0->M0_COMPCOB),1,70),oFntCur10N,,,,0)
		oPrn:Say(0480,0120,Substr(AllTrim(SM0->M0_BAIRCOB)+" "+AllTrim(SM0->M0_CIDCOB)+" "+AllTrim(SM0->M0_ESTCOB)+" "+"CEP "+Transform(SM0->M0_CEPCOB,"@R 99.999-999"),1,70),oFntCur10N,,,,0)
		SM0->(dbGoTo(nRecno))
		
		oPrn:Say(0060,1460,"NOTA FISCAL",oFntCur10B,,,,0)
		
		oPrn:Say(0120,1460,SubStr(AllTrim(SM0->M0_ENDCOB)+" "+AllTrim(SM0->M0_COMPCOB),1,70),oFntCur08N,,,,0)
		oPrn:Say(0180,1460,Substr(AllTrim(SM0->M0_BAIRCOB)+" "+AllTrim(SM0->M0_CIDCOB)+" "+AllTrim(SM0->M0_ESTCOB)+" "+"CEP "+Transform(SM0->M0_CEPCOB,"@R 99.999-999"),1,70),oFntCur08N,,,,0)
		oPrn:Say(0240,1460,Substr("CNPJ: "+Transform(SM0->M0_CGC,"@R 99.999.999/9999-99"),1,70),oFntCur08N,,,,0)
		oPrn:Say(0300,1460,Substr("INSCRIÇÃO MUNICIPAL: "+SM0->M0_INSCM,1,70),oFntCur08N,,,,0)
		
		oPrn:Say(0360,1860,"No. "+(cAlias)->F2_DOC,oFntCur12B,,,,0)
		
		cNaturOper := ""
		dbSelectArea("SF4")
		SF4->(dbSetOrder(1))
		if SF4->(dbSeek(xFilial("SF4")+(cAlias)->D2_TES))
			cNaturOper := SF4->F4_TEXTO
		endif
				
		oPrn:Say(0420,1460,"NATUREZA DA OPERAÇÃO: "+cNaturOper,oFntCur08B,,,,0)
			
		oPrn:Say(0480,1460,"DATA DA EMISSÃO: "+Dtoc(Stod((cAlias)->F2_EMISSAO)),oFntCur08B,,,,0)
		
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
		
		oPrn:Say(0480,1960,"Página: "+alltrim(str(nPagina))+"/"+alltrim(str(Int(nQtRegAli/9)+iif(Mod(nQtRegAli,9)<>0,1,0))),oFntCur08B,,,,0)
		
		oPrn:Box(0600, 0455, 0690, 0900)
		oPrn:Box(0600, 0900, 0690, 1400)
		oPrn:Box(0600, 1400, 0690, 2250)
		
		oPrn:Say(0630,0550,"NOTA FISCAL",oFntCur10B,,,,0)
		
		oPrn:Say(0630,1070,"VALOR R$",oFntCur10B,,,,0)
		oPrn:Say(0630,1550,"VENCIMENTO",oFntCur10B,,,,0)
		oPrn:Box(0690, 0455, 0780, 0900)
		oPrn:Box(0690, 0900, 0780, 1400)
		oPrn:Box(0690, 1400, 0780, 2250)
		oPrn:Say(0720,0550,(cAlias)->F2_DOC,oFntCur10N,,,,0)
		oPrn:Say(0720,1070,Alltrim(Transform((cAlias)->F2_VALMERC,PesqPict("SF2","F2_VALMERC"))),oFntCur10N,,,,0)
		
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
			oPrn:Say(0720,1550,Transform(Stod((cAlias2)->E1_VENCTO),"@D"),oFntCur10N,,,,0)
		Endif
		(cAlias2)->(dbCloseArea())
		
		oPrn:Box(0780, 0455, 1230, 2250)
		
		oPrn:Say(0810,0970,"DESTINATÁRIO",oFntCur12B,,,,0)
		
		oPrn:Say(0870,0470,"NOME: ",oFntCur08B,,,,0)
		oPrn:Say(0870,0730,(cAlias)->A1_NOME,oFntCur08N,,,,0)
		
		oPrn:Say(0930,0470,"ENDEREÇO: ",oFntCur08B,,,,0)
		oPrn:Say(0930,0730,(cAlias)->A1_END+" "+(cAlias)->A1_BAIRRO,oFntCur08N,,,,0)
		
		oPrn:Say(0930,1950,"CEP: ",oFntCur08B,,,,0)
		oPrn:Say(0930,2030,Transform((cAlias)->A1_CEP,"@R 99.999-999"),oFntCur08N,,,,0)
		
		oPrn:Say(0990,0470,"MUNICÍPIO: ",oFntCur08B,,,,0)
		oPrn:Say(0990,0730,(cAlias)->A1_MUN,oFntCur08N,,,,0)
		
		oPrn:Say(0990,1750,"ESTADO: ",oFntCur08B,,,,0)
		oPrn:Say(0990,1880,(cAlias)->A1_EST,oFntCur08N,,,,0)
		
		oPrn:Say(1050,0470,"PRAÇA DE PAGTO: ",oFntCur08B,,,,0)
		oPrn:Say(1050,0730,(cAlias)->A1_EST,oFntCur08N,,,,0)
		
		oPrn:Say(1110,0470,"CNPJ: ",oFntCur08B,,,,0)
		oPrn:Say(1110,0730,Transform((cAlias)->A1_CGC,"@R 99.999-999/9999-99"),oFntCur08N,,,,0)
		
		oPrn:Say(1170,0470,"INSC.ESTADUAL: ",oFntCur08B,,,,0)
		oPrn:Say(1170,0730,(cAlias)->A1_INSCR,oFntCur08N,,,,0)
		
		oPrn:Say(1170,1400,"INSC.MUNICIPAL: ",oFntCur08B,,,,0)
		oPrn:Say(1170,1670,(cAlias)->A1_INSCRM,oFntCur08N,,,,0)
		
		oPrn:Box(1230, 0455, 1440, 0750)
		oPrn:Box(1230,0750, 1440, 2250)
		
		oPrn:Say(1260,0510,"VALOR",oFntCur15B,,,,0)
		oPrn:Say(1320,0530,"POR",oFntCur15B,,,,0)
		oPrn:Say(1380,0480,"EXTENSO",oFntCur15B,,,,0)
		
		cExtenso := Padr(Alltrim(Extenso((cAlias)->F2_VALMERC)),130,"*")
		oPrn:Say(1290,0780,Substr(cExtenso,1,65),oFntCur10B,,,,0)
		If Len(cExtenso) > 65
			oPrn:Say(1350,0780,Substr(cExtenso,66,65),oFntCur10B,,,,0)
		endif
		
		oPrn:Say(1470,0470,"DEVE(M) A " + ALLTRIM(cNomeEmp),oFntCur10N,,,,0)
		oPrn:Say(1530,0470,"A IMPORTÂNCIA ACIMA",oFntCur10N,,,,0)
		
		oPrn:Say(1650,1350,"EM _______________",oFntCur10N,,,,0)
		oPrn:Say(1650,1800,"____________________",oFntCur10N,,,,0)
		oPrn:Say(1710,1520,"DATA",oFntCur10N,,,,0)
		oPrn:Say(1710,1900,"ASSINATURA",oFntCur10N,,,,0)
		
		oPrn:Box(0540, 0055, 1760, 2300)
		
		oPrn:Box(1820, 0055, 1910, 1520)
		
		oPrn:Say(1850,0450,"DISCRIMINAÇÃO",oFntCur10B,,,,0)
			
		oPrn:Box(1820, 1520, 1910, 1920)
		oPrn:Say(1850,1560,"VALOR UNITÁRIO",oFntCur10B,,,,0)
		oPrn:Box(1820, 1920, 1910, 2300)
		
		oPrn:Say(1850,1935,"VALOR",oFntCur10B,,,,0)
		
		cDoc := (cAlias)->F2_DOC
		cSerie := (cAlias)->F2_SERIE
		cCliente := (cAlias)->C5_CLIENTE
		cLoja := (cAlias)->C5_LOJACLI
		nValMerc := (cAlias)->F2_VALMERC
		nContador := 0
		nLinha := 1940
		
		While !(cAlias)->(EOF()) .and. alltrim((cAlias)->F2_DOC) == alltrim(cDoc) .and. alltrim((cAlias)->F2_SERIE) == alltrim(cSerie) .and. alltrim((cAlias)->C5_CLIENTE) == alltrim(cCliente) .and. alltrim((cAlias)->C5_LOJACLI) == alltrim(cLoja)
			nContador += 1
			if nContador > 9
				Exit
			endif
			nLinha += 60
			dbSelectArea("SB5")
			SB5->(dbSetOrder(1))
			if SB5->(dbSeek(xFilial("SB5")+(cAlias)->D2_COD))
				oPrn:Say(nLinha,0100,SB5->B5_CEME,oFntCur10N,,,,0)
			else
				dbSelectArea("SB1")
				SB1->(dbSetOrder(1))
				if SB1->(dbSeek(xFilial("SB1")+(cAlias)->D2_COD))
					oPrn:Say(nLinha,0100,SB1->B1_DESC,oFntCur10N,,,,0)
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
		
		if nContador+1 <= 9
			nPagina := 0
			For nCont := 1 to MlCount(cObs)
				nContador += 1
				if nContador > 9
					Exit
				endif
				nLinha += 60
				oPrn:Say(nLinha,0100,MemoLine(cObs,,nCont),oFntCur10N,,,,0)
			next
		endif
		
		oPrn:Box(1910, 0055, 2540, 1520)
		oPrn:Box(1910, 1520, 2540, 1920)
		oPrn:Box(1910, 1920, 2540, 2300)
		
		oPrn:Box(2540, 0055, 2810, 0450)
		oPrn:Box(2540, 0450, 2810, 1520)
		oPrn:Box(2540, 1520, 2810, 1920)
		oPrn:Box(2540, 1920, 2810, 2300)
		
		if mv_par09 = 1
			oPrn:Say(2630,0120,"1a VIA",oFntCur15B,,,,0)
			oPrn:Say(2690,0130,"CLIENTE",oFntCur15B,,,,0)
		elseif mv_par09 = 2
			oPrn:Say(2630,0120,"2a VIA",oFntCur15B,,,,0)
			oPrn:Say(2690,0090,"CONTABILIDADE",oFntCur12B,,,,0)
		endif
		
		oPrn:Say(2570,1620,"VALOR",oFntCur15B,,,,0)
		oPrn:Say(2630,1580,"TOTAL DA",oFntCur15B,,,,0)
		oPrn:Say(2690,1590,"NOTA",oFntCur15B,,,,0)
		oPrn:Say(2750,1590,"FISCAL",oFntCur15B,,,,0)
		
		if lImpTot
			oPrn:Say(2630,1950,Transform(nValMerc,PesqPict("SF2","F2_VALMERC")),oFntCur10N,,,,0)
		endif
		
		oPrn:Box(2810, 0055, 2900, 0450)
		
		oPrn:Say(2840,0090,"NOTA FISCAL",oFntCur10B,,,,0)
			
		oPrn:Box(2810, 0450, 2900, 2300)
		
		oPrn:Say(2840,0500,"RECEBI(EMOS) DE " + ALLTRIM(cNomeEmp) + ".",oFntCur06N,,,,0)
		
		oPrn:Box(2900, 0055, 2990, 0450)
		oPrn:Say(2930,0085,"No. "+cDoc,oFntCur12B,,,,0)
		oPrn:Box(2900, 0450, 2990, 2300)
		oPrn:Say(2930,0650,"DATA: ____/____/________",oFntCur08N,,,,0)
		oPrn:Say(2930,1150,"ASSINATURA E CARIMBO DO CLIENTE: _________________________",oFntCur08N,,,,0)
		
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
