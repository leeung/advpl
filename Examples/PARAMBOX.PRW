#INCLUDE 'PROTHEUS.CH'

USER FUNCTION PARAMBOX()
	local aPergs := {}
	Local cProdDe  := ""
	Local cProdAt  := ""

	RpcSetType(3)
	RpcSetEnv("99",'01','admin','','COM')

	aAdd(aPergs, {1, "Produto De",  Space(TamSX3("B1_COD")[01]),  "", ".T.", "SB1", ".T.", 80,  .F.})
	aAdd(aPergs, {1, "Produto Até", Space(TamSX3("B1_COD")[01]),  "", ".T.", "SB1", ".T.", 80,  .T.})

	If ParamBox(aPergs, "Informe os parâmetros")
		Alert(MV_PAR01)
		Alert(MV_PAR02)
	EndIf

    RpcClearEnv()
RETURN
