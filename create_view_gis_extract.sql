USE [CoGeReD]
GO
/****** Object:  View [dbo].[view_gis_extract]    Script Date: 03/08/2010 11:44:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_gis_extract]
AS
SELECT     am.API_Number AS API, wi.record_number AS KGS_Recno, gl.carter_letter AS Letter, gl.carter_number AS Number, gl.carter_section AS Section, 
                      gl.ns_feet AS FNS, gl.n_or_s AS NS, gl.ew_feet AS FEW, gl.e_or_w AS EW, gl.surface_elevation AS Surf_Elev, { fn UCASE(gr.quadrangle_name) 
                      } AS USGS_Quad, { fn UCASE(gr.county_name) } AS County, wi.farm_name AS Org_Farm, wi.operator AS Org_Oper, wi.well_number AS Org_WellNo, 
                      wc.total_depth AS TD, wc.tdfm, wc.deepest_pay AS Deepst_Pay, vpi.[iof/pd] AS IOF_IP, wc.original_well_class AS Org_WClass, 
                      wc.original_result AS Org_Result, wc.date_completed AS Cmpl_Date, wc.date_plugged AS Plug_Date, wr.plugging_affidavit AS Plug_Afdvt, 
                      vc.call_num AS Core, vs.call_num AS Cuttings, ve.log_type AS ELog, ps.plotsym AS PlotSymbol, wi.permit AS KGS_Permit, 
                      'http://kgsweb.uky.edu/oilgasimages/o_g/R' + wi.djvu_number + '/R' + wi.djvu_number + '.djvu?djvuopts&&thumbnails=yes&menu=yes&zoom=page' AS
                       images, wi.bore_type
FROM         dbo.view_pay_information AS vpi RIGHT OUTER JOIN
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
WHERE     (gl.bogus_location = 0) AND (wi.well_confidentiality <> 'x')

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1[50] 2[25] 3) )"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1[56] 3) )"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2[66] 3) )"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3) )"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2) )"
      End
      ActivePaneConfig = 10
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -118
         Left = 0
      End
      Begin Tables = 
         Begin Table = "vpi"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 106
               Right = 192
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ps"
            Begin Extent = 
               Top = 6
               Left = 230
               Bottom = 106
               Right = 382
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "wc"
            Begin Extent = 
               Top = 108
               Left = 38
               Bottom = 223
               Right = 217
            End
            DisplayFlags = 280
            TopColumn = 16
         End
         Begin Table = "am"
            Begin Extent = 
               Top = 108
               Left = 255
               Bottom = 223
               Right = 409
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "gl"
            Begin Extent = 
               Top = 228
               Left = 38
               Bottom = 343
               Right = 236
            End
            DisplayFlags = 280
            TopColumn = 22
         End
         Begin Table = "gr"
            Begin Extent = 
               Top = 348
               Left = 38
               Bottom = 463
               Right = 247
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "wi"
            Begin Extent = 
               Top = 228
               Left = 274
               Bottom = 343
               Right = 459
            End
            DisplayFlags = 280
            TopColumn = 2
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_gis_extract'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'         End
         Begin Table = "wr"
            Begin Extent = 
               Top = 348
               Left = 285
               Bottom = 463
               Right = 464
            End
            DisplayFlags = 280
            TopColumn = 10
         End
         Begin Table = "vs"
            Begin Extent = 
               Top = 468
               Left = 38
               Bottom = 553
               Right = 192
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ve"
            Begin Extent = 
               Top = 468
               Left = 230
               Bottom = 553
               Right = 384
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "vc"
            Begin Extent = 
               Top = 558
               Left = 38
               Bottom = 643
               Right = 192
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      PaneHidden = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      PaneHidden = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_gis_extract'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_gis_extract'