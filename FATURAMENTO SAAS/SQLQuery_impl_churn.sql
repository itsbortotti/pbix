
drop table #mes_atual
drop table #mes_anterior
SELECT 
		ISNULL (CONVERT(varchar(10),F05_DT_DATAEMISSAO, 103),' ') 'DATA EMISSAO',
		AF,
		F05_FILIAL,
		F05_CD_PRODUTO,
		F05_CD_NF,
		F05_DS_PRODUTO = CASE	WHEN F05_CD_PRODUTO IN ('01050121-11'
														,'01050123.00'
														,'01050122-2'
														,'01050121-9') THEN 'OMNIJORNADA' 
								WHEN F05_CD_PRODUTO IN ('01050500-B18'
														,'01050500-B19'
														,'01050500-B20'
														,'01050500-B21'
														,'01050500-B22'
														,'01050500-B23'
														,'01050500-B26'
														,'01050500-B27'
														,'01050500-B28'
														,'01050500-B31'
														,'01050500-B32'
														,'01050500-B37'
														,'01050500-B38') THEN 'OMNISCORE'
								WHEN F05_CD_PRODUTO IN ('S000.1146.00'	 
														,'01050500-B14'	
														,'01050500-B15'	
														,'01050500-B16'	
														,'01050500-B17') THEN 'OMNILOG'
								WHEN F05_CD_PRODUTO IN ('S000.1146.00'	
														,'01050126-E6')	 THEN 'OMNICOM'	
								WHEN F05_CD_PRODUTO IN ('S000.1146.00'
														,'01050500-B40') THEN 'SDK'
								WHEN F05_CD_PRODUTO IN ('S000.1146.00'
														,'01050126-CC')  THEN 'ERP'
								WHEN F05_CD_PRODUTO IN ('S000.1146.00'
														,'01050500-B9' ) THEN 'SEGUROS'
														ELSE 'N/A' END,
		F05_CD_CANAL,								   	
		F05_DS_CANAL,								   	
		F05_CD_CLASSEVALOR,							   	
		F05_DS_CLASSEVALOR,								
		F05_CD_BUDGET,									
		F05_DS_BUDGET,									
		F05_QTDE,										
		F05_F05_VL_VENDAS,								
		F05_NM_CLIENTE,									
		--F05_DT_DATAEMISSAO,							
		F05_UF_CLI,										
		F05_MUN_CLI,
		F05_COD_CLI,
		F05_CNPJ,
		F05_REGIAO,
		F05_SUPERVISOR,
		F05_GERENTE,
		F05_FAMILIA,
		F05_VEND_PROPIETARIO,
		F05_NOM_PROPIETARIO,
		F05_BAIRRO,
		F05_NM_LOJA,
		F05_NM_TIPCLI,
		F05_TECNOLOGIA,
		F05_DESCTECNO,
		TIPO_FATURAMENTO,
		NATUREZA,
		VALOR_APROPRIADO_1_12,
		RECNOSD2,
		ALIAS
INTO #mes_atual
FROM [dbo].TVS_ROB 
WHERE F05_DT_DATAEMISSAO BETWEEN '2023-01-01' AND '2024-12-31'
	--and F05_DS_PRODUTO like '%SCORE%'
	and month(F05_DT_DATAEMISSAO) = MONTH(GETDATE()) and year(F05_DT_DATAEMISSAO) = year(GETDATE())
	and F05_CD_PRODUTO in (
	 '01050121-11'      --LICENCA DE USO OMNIJORNADA NO OMNIWEB             
	,'01050123.00'      --LICENCA DE USO OMNIJORNADA                                
	,'01050122-2'       --LICENCA DE USO OMNIJORNADA PARCEIRO                       
	,'01050121-9'       --LICENCA DE USO OMNIJORNADA 2.0               
	,'01050500-B18'      --OMNISCORE CADASTRO /RECADASTROS - GR VEICULO 
	,'01050500-B19'		--OMNISCORE CADASTRO /RECADASTROS - TRANSPORTAD
	,'01050500-B20'		--OMNISCORE CADASTROS/RECADASTROS - GR AGREGADO
	,'01050500-B21'		--OMNISCORE CADASTROS/RECADASTROS - GR AUTONOMO
	,'01050500-B22'		--OMNISCORE CADASTROS/RECADASTROS - GR FUNCIONA
	,'01050500-B23'		--OMNISCORE CADASTROS/RECADASTROS - GR MOTORIST
	,'01050500-B26'		--OMNISCORE CADASTROS/RECADASTROS - TRANSPORTAD
	,'01050500-B27'		--OMNISCORE CADASTROS/RECADASTROS - TRANSPORTAD
	,'01050500-B28'		--OMNISCORE CADASTROS/RECADASTROS - TRANSPORTAD
	,'01050500-B31'		--OMNISCORE CONSULTAS - GR FUNCIONARIOS        
	,'01050500-B32'		--OMNISCORE CONSULTAS - GR MOTORISTA           
	,'01050500-B37'		--OMNISCORE CONSULTAS - TRANSPORTADORA FUNCIONA
	,'01050500-B38'		--OMNISCORE CONSULTAS - TRANSPORTADORA MOTORIST            
    ,'S000.1146.00'		--TAXA DE IMPLANTA��O - OMNILOG
	,'01050500-B14'		--LICEN�A DE USO - OMNILOG  1-250/VEICULO UNITARIO 
	,'01050500-B15'		--LICEN�A DE USO - OMNILOG -251-500/VEICULO UNITARIO 
	,'01050500-B16'		--LICEN�A DE USO - OMNILOG -501-1000/VEICULO UNITARIO 
	,'01050500-B17'		--LICEN�A DE USO - OMNILOG -10001/VEICULO UNITARIO 
    ,'S000.1146.00'		--TAXA DE IMPLANTA��O - OMNICOM
	,'01050126-E6'		--LICEN�A DE USO - OMNICOM 
    ,'S000.1146.00'		--TAXA DE IMPLANTA��O - SDK
	,'01050500-B40' 	--PROCESSAMENTO DE DADOS - SDK
    ,'S000.1146.00'		--TAXA DE IMPLANTA��O - ERP Simplificado
	,'01050126-CC'		--LICEN�A DE USO - ERP Simplificado
    ,'S000.1146.00'		--TAXA DE IMPLANTA��O - ERP SEGUROS							
	,'01050500-B9' 		--LICEN�A DE USO - - ERP SEGUROS
        
	)            
--------------------------------------------------------------------------------------------------------------------------

SELECT 
		ISNULL (CONVERT(varchar(10),F05_DT_DATAEMISSAO, 103),' ') 'DATA EMISSAO',
		AF,
		F05_FILIAL,
		F05_CD_PRODUTO,
		F05_CD_NF,
		F05_DS_PRODUTO = CASE	WHEN F05_CD_PRODUTO IN ('01050121-11'
														,'01050123.00'
														,'01050122-2'
														,'01050121-9') THEN 'OMNIJORNADA' 
								WHEN F05_CD_PRODUTO IN ('01050500-B18'
														,'01050500-B19'
														,'01050500-B20'
														,'01050500-B21'
														,'01050500-B22'
														,'01050500-B23'
														,'01050500-B26'
														,'01050500-B27'
														,'01050500-B28'
														,'01050500-B31'
														,'01050500-B32'
														,'01050500-B37'
														,'01050500-B38') THEN 'OMNISCORE'
								WHEN F05_CD_PRODUTO IN ('S000.1146.00'	 
														,'01050500-B14'	
														,'01050500-B15'	
														,'01050500-B16'	
														,'01050500-B17') THEN 'OMNILOG'
								WHEN F05_CD_PRODUTO IN ('S000.1146.00'	
														,'01050126-E6')	 THEN 'OMNICOM'	
								WHEN F05_CD_PRODUTO IN ('S000.1146.00'
														,'01050500-B40') THEN 'SDK'
								WHEN F05_CD_PRODUTO IN ('S000.1146.00'
														,'01050126-CC')  THEN 'ERP'
								WHEN F05_CD_PRODUTO IN ('S000.1146.00'
														,'01050500-B9' ) THEN 'SEGUROS'
														ELSE 'N/A' END,
		F05_CD_CANAL,								   	
		F05_DS_CANAL,								   	
		F05_CD_CLASSEVALOR,							   	
		F05_DS_CLASSEVALOR,								
		F05_CD_BUDGET,									
		F05_DS_BUDGET,									
		F05_QTDE,										
		F05_F05_VL_VENDAS,								
		F05_NM_CLIENTE,									
		--F05_DT_DATAEMISSAO,							
		F05_UF_CLI,										
		F05_MUN_CLI,
		F05_COD_CLI,
		F05_CNPJ,
		F05_REGIAO,
		F05_SUPERVISOR,
		F05_GERENTE,
		F05_FAMILIA,
		F05_VEND_PROPIETARIO,
		F05_NOM_PROPIETARIO,
		F05_BAIRRO,
		F05_NM_LOJA,
		F05_NM_TIPCLI,
		F05_TECNOLOGIA,
		F05_DESCTECNO,
		TIPO_FATURAMENTO,
		NATUREZA,
		VALOR_APROPRIADO_1_12,
		RECNOSD2,
		ALIAS
INTO #mes_anterior
FROM [dbo].TVS_ROB 
WHERE F05_DT_DATAEMISSAO BETWEEN '2023-01-01' AND '2024-12-31'
	--and F05_DS_PRODUTO like '%SCORE%'
	and month(F05_DT_DATAEMISSAO) = (MONTH(GETDATE())-1) and year(F05_DT_DATAEMISSAO) = year(GETDATE())
	and F05_CD_PRODUTO in (
	 '01050121-11'      --LICENCA DE USO OMNIJORNADA NO OMNIWEB             
	,'01050123.00'      --LICENCA DE USO OMNIJORNADA                                
	,'01050122-2'       --LICENCA DE USO OMNIJORNADA PARCEIRO                       
	,'01050121-9'       --LICENCA DE USO OMNIJORNADA 2.0               
	,'01050500-B18'      --OMNISCORE CADASTRO /RECADASTROS - GR VEICULO 
	,'01050500-B19'		--OMNISCORE CADASTRO /RECADASTROS - TRANSPORTAD
	,'01050500-B20'		--OMNISCORE CADASTROS/RECADASTROS - GR AGREGADO
	,'01050500-B21'		--OMNISCORE CADASTROS/RECADASTROS - GR AUTONOMO
	,'01050500-B22'		--OMNISCORE CADASTROS/RECADASTROS - GR FUNCIONA
	,'01050500-B23'		--OMNISCORE CADASTROS/RECADASTROS - GR MOTORIST
	,'01050500-B26'		--OMNISCORE CADASTROS/RECADASTROS - TRANSPORTAD
	,'01050500-B27'		--OMNISCORE CADASTROS/RECADASTROS - TRANSPORTAD
	,'01050500-B28'		--OMNISCORE CADASTROS/RECADASTROS - TRANSPORTAD
	,'01050500-B31'		--OMNISCORE CONSULTAS - GR FUNCIONARIOS        
	,'01050500-B32'		--OMNISCORE CONSULTAS - GR MOTORISTA           
	,'01050500-B37'		--OMNISCORE CONSULTAS - TRANSPORTADORA FUNCIONA
	,'01050500-B38'		--OMNISCORE CONSULTAS - TRANSPORTADORA MOTORIST            
    ,'S000.1146.00'		--TAXA DE IMPLANTA��O - OMNILOG
	,'01050500-B14'		--LICEN�A DE USO - OMNILOG  1-250/VEICULO UNITARIO 
	,'01050500-B15'		--LICEN�A DE USO - OMNILOG -251-500/VEICULO UNITARIO 
	,'01050500-B16'		--LICEN�A DE USO - OMNILOG -501-1000/VEICULO UNITARIO 
	,'01050500-B17'		--LICEN�A DE USO - OMNILOG -10001/VEICULO UNITARIO 
    ,'S000.1146.00'		--TAXA DE IMPLANTA��O - OMNICOM
	,'01050126-E6'		--LICEN�A DE USO - OMNICOM 
    ,'S000.1146.00'		--TAXA DE IMPLANTA��O - SDK
	,'01050500-B40' 	--PROCESSAMENTO DE DADOS - SDK
    ,'S000.1146.00'		--TAXA DE IMPLANTA��O - ERP Simplificado
	,'01050126-CC'		--LICEN�A DE USO - ERP Simplificado
    ,'S000.1146.00'		--TAXA DE IMPLANTA��O - ERP SEGUROS							
	,'01050500-B9' 		--LICEN�A DE USO - - ERP SEGUROS
        
	) 
------------------------------------------------------------------------------------------------------------------------------------------
/*CHURN */
------------------------------------------------------------------------------------------------------------------------------------------
	select distinct maa.F05_NM_CLIENTE,maa.F05_CNPJ,maa.F05_DS_PRODUTO--,maa.* 
	from #mes_atual ma
	right join #mes_anterior maa on maa.F05_CNPJ = ma.F05_CNPJ
	where ma.F05_CNPJ is null

------------------------------------------------------------------------------------------------------------------------------------------
/*IMPLANTACAO */
------------------------------------------------------------------------------------------------------------------------------------------
	select distinct ma.F05_NM_CLIENTE,ma.F05_CNPJ,ma.F05_DS_PRODUTO--,ma.* 
	from #mes_atual ma
	left join #mes_anterior maa on maa.F05_CNPJ = ma.F05_CNPJ
	where maa.F05_CNPJ is null

	select * from #mes_atual
	where F05_NM_CLIENTE = 'RECARGO TECNOLOGIA EM LOGISTICA E PAGAMENTO LTDA'

	select count(*) from #mes_anterior
