@AbapCatalog.sqlViewName: 'ZITABLE01'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'cds table_01'
@Metadata.ignorePropagatedAnnotations: true
define view ZI_table_01 as select from ztable_01
    association [0..1] to I_Product as _pro on _pro.Product = $projection.Matnr  
{
    key matnr as Matnr,
    text as Text,
    abp_lotinst_lastchange_tstmpl as AbpLotinstLastchangeTstmpl,
    abp_locinst_lastchange_utcl as AbpLocinstLastchangeUtcl,
    abp_creation_user as AbpCreationUser,
    abp_lastchange_user as AbpLastchangeUser
    
    ,_pro
    
}
