USE GWRepository
GO

/*** this script truncates the DOW tables in preparation of a new upload 1/18/2012 ***/



TRUNCATE TABLE ANALYTE;
TRUNCATE TABLE "ANALYTE-Groups";
TRUNCATE TABLE "Annulus-NewWell";
TRUNCATE TABLE "Annulus-Rework";
TRUNCATE TABLE Casing;
TRUNCATE TABLE "ConstEvent-LostDest";
TRUNCATE TABLE "ConstEvent-NewWell";
TRUNCATE TABLE "ConstEvent-Plugging";
TRUNCATE TABLE "ConstEvent-Rework";
TRUNCATE TABLE Driller;
TRUNCATE TABLE FieldMeasurements;
TRUNCATE TABLE GeographicLocation;
TRUNCATE TABLE GWMonitoringAccess;
TRUNCATE TABLE GWSource;
TRUNCATE TABLE GWUse;
TRUNCATE TABLE Laboratory;
TRUNCATE TABLE "Log-AKGWACorrected";
TRUNCATE TABLE "Log-AKGWADeleted";
TRUNCATE TABLE Owner;
TRUNCATE TABLE OwnerHistory;
TRUNCATE TABLE Pump;
TRUNCATE TABLE "ref-Accessibility";
TRUNCATE TABLE "ref-Appearance";
TRUNCATE TABLE "ref-CasingJointType";
TRUNCATE TABLE "ref-City";
TRUNCATE TABLE "ref-ColiformTestResults";
TRUNCATE TABLE "ref-ColiformTestTypes";
TRUNCATE TABLE "ref-Composition";
TRUNCATE TABLE "ref-Condition";
TRUNCATE TABLE "ref-ConstructionType";
TRUNCATE TABLE "ref-County";
TRUNCATE TABLE "ref-DepthMethod";
TRUNCATE TABLE "ref-DevelopmentMethod";
TRUNCATE TABLE "ref-ElevationMethod";
TRUNCATE TABLE "ref-GWSourceStatus";
TRUNCATE TABLE "ref-InstallationMethod";
TRUNCATE TABLE "ref-LatLongMethod";
TRUNCATE TABLE "ref-Odor";
TRUNCATE TABLE "ref-PlugMaterial";
TRUNCATE TABLE "ref-PlugMethod";
TRUNCATE TABLE "ref-PumpType";
TRUNCATE TABLE "ref-QuadCountyRegion";
TRUNCATE TABLE "ref-QuadName";
TRUNCATE TABLE "ref-Region";
TRUNCATE TABLE "ref-RegulatoryProgram";
TRUNCATE TABLE "ref-Sampler";
TRUNCATE TABLE "ref-Spring-AquiferMedia";
TRUNCATE TABLE "ref-Spring-DischargeDuration";
TRUNCATE TABLE "ref-Spring-DischargeFrom";
TRUNCATE TABLE "ref-Spring-DischargeMethod";
TRUNCATE TABLE "ref-Spring-DischargeTo";
TRUNCATE TABLE "ref-Spring-FlowCondition";
TRUNCATE TABLE "ref-Spring-FlowSeason";
TRUNCATE TABLE "ref-Spring-Modifications";
TRUNCATE TABLE "ref-Spring-SecondaryChar";
TRUNCATE TABLE "ref-Spring-Type";
TRUNCATE TABLE "ref-State";
TRUNCATE TABLE "ref-Status";
TRUNCATE TABLE "ref-Units";
TRUNCATE TABLE "ref-Use";
TRUNCATE TABLE "ref-VisitReasonGeneral";
TRUNCATE TABLE "ref-VisitReasonSpecific";
TRUNCATE TABLE "ref-WellheadMethod";
TRUNCATE TABLE "ref-ZipCode";
TRUNCATE TABLE RegulatoryProgram;
TRUNCATE TABLE Result;
TRUNCATE TABLE Sample;
TRUNCATE TABLE Screen;
TRUNCATE TABLE SiteVisit;
TRUNCATE TABLE SpringCharacteristics;
TRUNCATE TABLE SpringObservations;
TRUNCATE TABLE WaterQuality;

GO