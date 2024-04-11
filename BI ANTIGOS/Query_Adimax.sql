SELECT DISTINCT
	[event_type_id] AS 'Evento_Tipo_ID',
	[event_type_description] AS 'Evento_Tipo_Descricao',
	[event_category] AS 'Evento_Categoria_ID',
	[event_category_description] AS 'Evento_Categoria_Descricao',
	[vehicle_id] AS 'Veiculo_ID',
	[license_number] AS 'Veiculo_Placa',
	[drive_id] AS 'Motorista_ID',
	[time] AS 'Evento_Horario',
	[driver_name] AS 'Motorista_Nome',
	[worker_id] AS 'Motorista_Matricula',
	[driver_number] AS 'Motorista_Codigo',
	[longitude] AS 'Evento_Longitude',
	[latitude] AS 'Evento_Latitude',
	[direction] AS 'Evento_Direcao',
	[speed] AS 'Evento_Velocidade',
	[mileage] AS 'Evento_Quilometragem',
	[client_id] AS 'Cliente_ID'
FROM 
	[DW_OMNILINK].[dbo].[traffilog_events] WITH (NOLOCK) 
WHERE 
	(MONTH(CONVERT(datetime,[time])) = MONTH(GETDATE()) OR MONTH(CONVERT(datetime,[time])) = MONTH(DATEADD(MONTH, -1, GETDATE())))
	AND [user_login] = 'adimax.api'
and (
		[event_type_description] like '%Aceleração de Intensidade%'
		OR [event_type_description] like '%Curva a Direita de intensidade%'
		OR [event_type_description] like '%Curva a Esquerda de Intensidade%'
		OR [event_type_description] like '%Freada de Intensidade%'
		OR [event_type_description] like '%Velocidade acima%60%molhada%'
		OR [event_type_description] like '%Velocidade acima%80%seca%'
	)

	select Distinct 
	[event_type_id] AS 'Evento_Tipo_ID',
	[event_type_description] AS 'Evento_Tipo_Descricao'
	into #temp_teste
	from [DW_OMNILINK].[dbo].[traffilog_events]
	where
	[event_type_description] like '%Aceleração de Intensidade%'
		OR [event_type_description] like '%Curva a Direita de intensidade%'
		OR [event_type_description] like '%Curva a Esquerda de Intensidade%'
		OR [event_type_description] like '%Freada de Intensidade%'
		OR [event_type_description] like '%Velocidade acima%60%molhada%'
		OR [event_type_description] like '%Velocidade acima%80%seca%'

		[event_type_description] like '%Aceleracao intensidade alta%'
		OR [event_type_description] like'%Curva a direita intens. alta%'
		OR [event_type_description] like'%Curva a esquerda intens. alta%'
		OR [event_type_description] like'%Direção Agressiva%'
		OR [event_type_description] like'%Freada intensidade alta%'
		OR [event_type_description] like'%MBZ- Aceleração Repentina (Acelerador de 20% para 90%)%'
		OR [event_type_description] like'%MBZ RPM acima de 2300*%'
		OR [event_type_description] like'%Ociosidade acima de 5 minutos*%'
		OR [event_type_description] like'%Pedal de freio acionado com velocidade acima de 30km/h por mais de 10 segundos%'
		OR [event_type_description] like'%Trans Adimax - RPM acima de 2300*%'
		OR [event_type_description] like'%Trans Adimax - Velocidade acima de 80Km/h - Segurança*%'
		OR [event_type_description] like'%Trans Adimax - Velocidade acima de 90Km/h - Segurança*%'
		
		
		drop table  #temp_teste

		select * from #temp_teste
		where Evento_Tipo_Descricao like '%Trans Adimax%'

   ------grave
	50	'Aceleracao intensidade alta												   '
	2924202	'MBZ RPM acima de 2300*														   '
	3511972	'Ociosidade acima de 5 minutos*												   '
	3795796	'Trans Adimax - RPM acima de 2300*	'

	------gravissimo
	59	'Curva a direita intens. alta												   '
	56	'Curva a esquerda intens. alta												   '
	53	'Freada intensidade alta													   '
	4466253	'Trans Adimax - Velocidade acima de 80Km/h - Segurança*						   '
	3765861	'Trans Adimax - Velocidade acima de 90Km/h - Segurança*						   '

	------medio
	4475218	'Direção Agressiva		'
	1329151	'MBZ- Aceleração Repentina (Acelerador de 20% para 90%)						   '
	538586	'Pedal de freio acionado com velocidade acima de 30km/h por mais de 10 segundos'