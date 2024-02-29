#INCLUDE "PROTHEUS.CH"
#INCLUDE "TOPCONN.CH"

USER FUNCTION MSGTDADOS()
	local oDlg := nil
	local aheader := {}
	local aCols := {}

	RpcSetType(3)
	RpcSetEnv("99",'01','admin','','COM')

	DEFINE MSDIALOG oDlg TITLE "Exemplo Dialog" From 1,1 To 500,920 PIXEL

	aAdd(aheader, {"","XX_COR","@BMP",002,0,".F.","", "C", "","V","","","", "V"})
	aAdd(aheader, {"Cgc","_cCgc",GetSx3Cache("A1_CGC","X3_PICTURE"),GetSx3Cache("A1_CGC","X3_TAMANHO"),0,".T.",".T.", "C", "",""} )
	aAdd(aheader, {"Nome","_cNome",GetSx3Cache("A1_NOME","X3_PICTURE"),GetSx3Cache("A1_NOME","X3_TAMANHO"),0,".T.",".T.", "C", "",""} )

	AAdd(aCols,{;
		LoadBitmap( GetResources(), "BR_VIOLETA"),;
		"03955169359",;
		"leeung alves",;
		.F.};
		)

	MsNewGetDados():New(;
	001,; //nTop
	001,; //nLeft
	250,; //nBottom
	455,; //nRight
	,; //nStyle
	,; //cLinhaOk
	"AllwaysTrue",; //cTudoOk
	"",; //cIniCpos
	,; //aAlter
	,; //nFreeze
	99,; //nMax
	"AllwaysTrue",; //cFieldOk
	"",; //cSuperDel
	"AllwaysTrue",; //cDelOk
	oDlg,; //oWnd
	aHeader,; //aPartHeader
	aCols; //aParCols
	)

	ACTIVATE MSDIALOG oDlg CENTERED
	RpcClearEnv()
RETURN
