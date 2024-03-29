SELECT am.API_Number AS API, wi.record_number AS KGS_Recno, gl.carter_letter AS Letter, gl.carter_number AS Number, gl.carter_section AS Section, 
               gl.ns_feet AS FNS, gl.n_or_s AS NS, gl.ew_feet AS FEW, gl.e_or_w AS EW, gl.surface_elevation AS Surf_Elev, { fn UCASE(gr.quadrangle_name) 
               } AS USGS_Quad, { fn UCASE(gr.county_name) } AS County, wi.farm_name AS Org_Farm, wi.operator AS Org_Oper, wi.well_number AS Org_WellNo, 
               wc.total_depth AS TD, wc.tdfm, wc.deepest_pay AS Deepst_Pay, vpi.[iof/pd] AS IOF_IP, wc.original_well_class AS Org_WClass, 
               wc.original_result AS Org_Result, wc.date_completed AS Cmpl_Date, wc.date_plugged AS Plug_Date, wr.plugging_affidavit AS Plug_Afdvt, 
               vc.call_num AS Core, vs.call_num AS Cuttings, ve.log_type AS ELog, ps.plotsym AS PlotSymbol, wi.permit AS KGS_Permit, 
               'http://kgsweb.uky.edu/oilgasimages/o_g/R' + wi.djvu_number + '/R' + wi.djvu_number + '.djvu?djvuopts&&thumbnails=yes&menu=yes&zoom=page' AS images,
                wi.bore_type
FROM  dbo.view_pay_information AS vpi RIGHT OUTER JOIN
               dbo.codes_og_plotsymbols AS ps INNER JOIN
               dbo.well_completions AS wc ON ps.cmpl = wc.pltsym ON vpi.pay = wc.deepest_pay AND vpi.record_number = wc.record_number RIGHT OUTER JOIN
               dbo.API_Master AS am RIGHT OUTER JOIN
               dbo.geographic_location AS gl INNER JOIN
               dbo.geographic_region AS gr ON gl.location_index = gr.location_index INNER JOIN
               dbo.well_identification AS wi ON gl.location_index = wi.location_index INNER JOIN
               dbo.well_records AS wr ON wi.record_number = wr.record_number ON am.record_number = wi.record_number LEFT OUTER JOIN
               dbo.view_unique_samples AS vs ON wi.record_number = vs.record_number LEFT OUTER JOIN
               dbo.view_unique_elogs AS ve ON wi.record_number = ve.record_number LEFT OUTER JOIN
               dbo.view_unique_cores AS vc ON wi.record_number = vc.record_number ON wc.record_number = wi.record_number
WHERE (gl.bogus_location = 0) AND (wi.well_confidentiality <> 'x')