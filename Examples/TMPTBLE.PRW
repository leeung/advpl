#INCLUDE 'PROTHEUS.CH'
#include 'topconn.ch'


user function TEMPTBLE()
    local aFields := {}
    local cAlias := ""
    local oTmpTab := nil
    
    RpcSetType(3)
    RpcSetEnv("99",'01','admin','','COM')

    aadd(aFields,{'Nome','C',GetSX3Cache("A1_NOME","X3_TAMANHO"),0})
    aadd(aFields,{'Cgc','C',GetSX3Cache("A1_CGC","X3_TAMANHO"),0})

    oTmpTab := FWTemporaryTable():New(GetNextAlias())
    oTmpTab:SetFields( aFields )
    oTmpTab:AddIndex('CGC',{'Cgc'} )
    oTmpTab:Create()

    cAlias := oTmpTab:GetAlias() //RETORNA O ALIAS DA ABERTURA DA TABELA EX:. SCGN00008D

    DBSelectArea("SA1")
    DbSetOrder(1)
    WHILE !SA1->(EOF())
        RecLock(cAlias,.T.)
            (cAlias)->Cgc := SA1->A1_CGC
            (cAlias)->Nome := SA1->A1_NOME
        MsUnLock()
        SA1->(DbSkip())
    ENDDO
    SA1->(DbCloseArea())

    (cAlias)->(DbCloseArea())
    
    oTmpTab:Delete()
    
    // FWTemporaryTable():GetRealName() -> Tabela temporária gerada no banco Ex:dbo.##TMPSC00_51
    // FWTemporaryTable():GetTableNameForTCFunctions() -> Nome da tabela de dados Ex:_SC00
    // FWTemporaryTable():GetTableNameForQuery() -> Tabela temporária gerada no banco Ex:dbo.##TMPSC00_51
    // FWTemporaryTable():Zap()
    // FWTemporaryTable():SetClobMemo(lClob)

    RpcClearEnv()
return
