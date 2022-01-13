SELECT 'R' & view_oilgas_web_search.record_number AS HeaderURI, 
operator + ' Well No. ' + well_number + ' ' + farm_name AS WellName, 
API_Master.API_Number AS APINo

FROM view_oilgas_web_search 
LEFT JOIN API_Master ON view_oilgas_web_search.record_number = API_Master.record_number
WHERE (((view_oilgas_web_search.well_confidentiality)='O'));
