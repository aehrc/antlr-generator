parser grammar MyGrammar;
options { tokenVocab=MyLexer; }

/*
 * A document is just a collection of rules. 
 */
document
    : fcRule*
    ;

/*
 * Creates a resource when a condition (based on RedCap form values) is met and assigns attribtues to a resource. Even 
 * if this parses correctly it might fail at runtime if: the attribute of the resource does not exist or the type of the
 * value is incompatible with the resource's attribute. 
 */
fcRule
    : (condition | resourcesExist) THEN resource
    ;

/*
 * We need this rule because a RESOURCE_EXIST condition cannot be combined with other conditions (these rules need to
 * run last because they don't create any resources and depend on the actual resources created by the other rules).
 */
resourcesExist
    : RESOURCES_EXIST OPEN_ROUND ID (COMMA ID)* CLOSE_ROUND
    ;

/* 
 * The condition that needs to hold for the rule to execute. This is based on actual values of a record in redcap and
 * it can check for value equivalence or the presence of any value.
 */
condition
    : NOT condition
    | condition AND condition
    | condition OR condition
    | TRUE
    | FALSE
    | NOTNULL OPEN_ROUND ID CLOSE_ROUND
    | VALUE OPEN_ROUND ID CLOSE_ROUND (EQ | NEQ | LT | GT | LTE | GTE) (STRING_VALUE | NUMERIC_VALUE)
    ;

/* 
 * The value to assign to the resource's attribute. This can be the code assigned in the mapping process, the literal
 * value of the field or a literal value.
 */
value
    : TRUE
    | FALSE
    | STRING_VALUE
    | NUMERIC_VALUE
    | referenceValue
    | CONCEPT OPEN_ROUND ID CLOSE_ROUND
    | CONCEPT_SELECTED OPEN_ROUND ID CLOSE_ROUND
    | CONCEPT_LITERAL OPEN_ROUND CODE_LITERAL CLOSE_ROUND
    | SYSTEM OPEN_ROUND ID CLOSE_ROUND
    | CODE OPEN_ROUND ID CLOSE_ROUND
    | VALUE OPEN_ROUND ID CLOSE_ROUND
    | LABEL OPEN_ROUND ID CLOSE_ROUND
    | LABEL_SELECTED OPEN_ROUND ID CLOSE_ROUND
    ;
    
// GENERATED - DO NOT MODIFY BY HAND //
fhirAddress
	: RES_A_DDRESS LT ID GT WITH fhirAddressAttrs EQ value (COMMA fhirAddressAttrs EQ value)* SEMI_COLON
	;

fhirAddressAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_USE | ATT_TYPE | ATT_TEXT | ATT_LINE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE | ATT_CITY | ATT_DISTRICT | ATT_STATE | ATT_POSTALC_ODE | ATT_COUNTRY | ATT_PERIOD DOT fhirPeriodAttrs
	;

fhirAge
	: RES_A_GE LT ID GT WITH fhirAgeAttrs EQ value (COMMA fhirAgeAttrs EQ value)* SEMI_COLON
	;

fhirAgeAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_VALUE | ATT_COMPARATOR | ATT_UNIT | ATT_SYSTEM | ATT_CODE
	;

fhirAnnotation
	: RES_A_NNOTATION LT ID GT WITH fhirAnnotationAttrs EQ value (COMMA fhirAnnotationAttrs EQ value)* SEMI_COLON
	;

fhirAnnotationAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_AUTHORR_EFERENCE ( DOT fhirReferenceAttrs )? | ATT_AUTHORS_TRING | ATT_TIME | ATT_TEXT
	;

fhirAttachment
	: RES_A_TTACHMENT LT ID GT WITH fhirAttachmentAttrs EQ value (COMMA fhirAttachmentAttrs EQ value)* SEMI_COLON
	;

fhirAttachmentAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_CONTENTT_YPE | ATT_LANGUAGE | ATT_DATA | ATT_URL | ATT_SIZE | ATT_HASH | ATT_TITLE | ATT_CREATION
	;

fhirCodeableConcept
	: RES_C_ODEABLEC_ONCEPT LT ID GT WITH fhirCodeableConceptAttrs EQ value (COMMA fhirCodeableConceptAttrs EQ value)* SEMI_COLON
	;

fhirCodeableConceptAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_CODING OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodingAttrs )? | ATT_TEXT
	;

fhirCoding
	: RES_C_ODING LT ID GT WITH fhirCodingAttrs EQ value (COMMA fhirCodingAttrs EQ value)* SEMI_COLON
	;

fhirCodingAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_SYSTEM | ATT_VERSION | ATT_CODE | ATT_DISPLAY | ATT_USERS_ELECTED
	;

fhirContactDetail
	: RES_C_ONTACTD_ETAIL LT ID GT WITH fhirContactDetailAttrs EQ value (COMMA fhirContactDetailAttrs EQ value)* SEMI_COLON
	;

fhirContactDetailAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_NAME | ATT_TELECOM OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirContactPointAttrs
	;

fhirContactPoint
	: RES_C_ONTACTP_OINT LT ID GT WITH fhirContactPointAttrs EQ value (COMMA fhirContactPointAttrs EQ value)* SEMI_COLON
	;

fhirContactPointAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_SYSTEM | ATT_VALUE | ATT_USE | ATT_RANK | ATT_PERIOD DOT fhirPeriodAttrs
	;

fhirContributor
	: RES_C_ONTRIBUTOR LT ID GT WITH fhirContributorAttrs EQ value (COMMA fhirContributorAttrs EQ value)* SEMI_COLON
	;

fhirContributorAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_TYPE | ATT_NAME | ATT_CONTACT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirContactDetailAttrs
	;

fhirCount
	: RES_C_OUNT LT ID GT WITH fhirCountAttrs EQ value (COMMA fhirCountAttrs EQ value)* SEMI_COLON
	;

fhirCountAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_VALUE | ATT_COMPARATOR | ATT_UNIT | ATT_SYSTEM | ATT_CODE
	;

fhirDataRequirement
	: RES_D_ATAR_EQUIREMENT LT ID GT WITH fhirDataRequirementAttrs EQ value (COMMA fhirDataRequirementAttrs EQ value)* SEMI_COLON
	;

fhirDataRequirementCodeFilterCodeFilter
	: RES_CODEF_ILTER LT ID GT WITH fhirDataRequirementCodeFilterCodeFilterAttrs EQ value (COMMA fhirDataRequirementCodeFilterCodeFilterAttrs EQ value)* SEMI_COLON
	;

fhirDataRequirementCodeFilterCodeFilterAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_PATH | ATT_VALUES_ETS_TRING | ATT_VALUES_ETR_EFERENCE ( DOT fhirReferenceAttrs )? | ATT_VALUEC_ODE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE | ATT_VALUEC_ODING OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodingAttrs )? | ATT_VALUEC_ODEABLEC_ONCEPT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )?
	;

fhirDataRequirementDateFilterDateFilter
	: RES_DATEF_ILTER LT ID GT WITH fhirDataRequirementDateFilterDateFilterAttrs EQ value (COMMA fhirDataRequirementDateFilterDateFilterAttrs EQ value)* SEMI_COLON
	;

fhirDataRequirementDateFilterDateFilterAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_PATH | ATT_VALUED_ATET_IME | ATT_VALUEP_ERIOD DOT fhirPeriodAttrs | ATT_VALUED_URATION DOT fhirDurationAttrs
	;

fhirDataRequirementAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_TYPE | ATT_PROFILE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE | ATT_MUSTS_UPPORT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE | ATT_CODEF_ILTER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirDataRequirementCodeFilterCodeFilterAttrs | ATT_DATEF_ILTER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirDataRequirementDateFilterDateFilterAttrs
	;

fhirDistance
	: RES_D_ISTANCE LT ID GT WITH fhirDistanceAttrs EQ value (COMMA fhirDistanceAttrs EQ value)* SEMI_COLON
	;

fhirDistanceAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_VALUE | ATT_COMPARATOR | ATT_UNIT | ATT_SYSTEM | ATT_CODE
	;

fhirDosage
	: RES_D_OSAGE LT ID GT WITH fhirDosageAttrs EQ value (COMMA fhirDosageAttrs EQ value)* SEMI_COLON
	;

fhirDosageAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_SEQUENCE | ATT_TEXT | ATT_ADDITIONALI_NSTRUCTION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_PATIENTI_NSTRUCTION | ATT_TIMING DOT fhirTimingAttrs | ATT_ASN_EEDEDB_OOLEAN | ATT_ASN_EEDEDC_ODEABLEC_ONCEPT ( DOT fhirCodeableConceptAttrs )? | ATT_SITE ( DOT fhirCodeableConceptAttrs )? | ATT_ROUTE ( DOT fhirCodeableConceptAttrs )? | ATT_METHOD ( DOT fhirCodeableConceptAttrs )? | ATT_DOSER_ANGE DOT fhirRangeAttrs | ATT_DOSEQ_UANTITY DOT fhirQuantityAttrs | ATT_MAXD_OSEP_ERP_ERIOD DOT fhirRatioAttrs | ATT_MAXD_OSEP_ERA_DMINISTRATION DOT fhirQuantityAttrs | ATT_MAXD_OSEP_ERL_IFETIME DOT fhirQuantityAttrs | ATT_RATER_ATIO DOT fhirRatioAttrs | ATT_RATER_ANGE DOT fhirRangeAttrs | ATT_RATEQ_UANTITY DOT fhirQuantityAttrs
	;

fhirDuration
	: RES_D_URATION LT ID GT WITH fhirDurationAttrs EQ value (COMMA fhirDurationAttrs EQ value)* SEMI_COLON
	;

fhirDurationAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_VALUE | ATT_COMPARATOR | ATT_UNIT | ATT_SYSTEM | ATT_CODE
	;

fhirElementDefinition
	: RES_E_LEMENTD_EFINITION LT ID GT WITH fhirElementDefinitionAttrs EQ value (COMMA fhirElementDefinitionAttrs EQ value)* SEMI_COLON
	;

fhirElementDefinitionSlicingSlicing
	: RES_SLICING LT ID GT WITH fhirElementDefinitionSlicingSlicingAttrs EQ value (COMMA fhirElementDefinitionSlicingSlicingAttrs EQ value)* SEMI_COLON
	;

fhirSlicingDiscriminatorDiscriminator
	: RES_DISCRIMINATOR LT ID GT WITH fhirSlicingDiscriminatorDiscriminatorAttrs EQ value (COMMA fhirSlicingDiscriminatorDiscriminatorAttrs EQ value)* SEMI_COLON
	;

fhirSlicingDiscriminatorDiscriminatorAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_TYPE | ATT_PATH
	;

fhirElementDefinitionSlicingSlicingAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_DISCRIMINATOR OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirSlicingDiscriminatorDiscriminatorAttrs | ATT_DESCRIPTION | ATT_ORDERED | ATT_RULES
	;

fhirElementDefinitionBaseBase
	: RES_BASE LT ID GT WITH fhirElementDefinitionBaseBaseAttrs EQ value (COMMA fhirElementDefinitionBaseBaseAttrs EQ value)* SEMI_COLON
	;

fhirElementDefinitionBaseBaseAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_PATH | ATT_MIN | ATT_MAX
	;

fhirElementDefinitionTypeType
	: RES_TYPE LT ID GT WITH fhirElementDefinitionTypeTypeAttrs EQ value (COMMA fhirElementDefinitionTypeTypeAttrs EQ value)* SEMI_COLON
	;

fhirElementDefinitionTypeTypeAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_CODE | ATT_PROFILE | ATT_TARGETP_ROFILE | ATT_AGGREGATION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE | ATT_VERSIONING
	;

fhirElementDefinitionExampleExample
	: RES_EXAMPLE LT ID GT WITH fhirElementDefinitionExampleExampleAttrs EQ value (COMMA fhirElementDefinitionExampleExampleAttrs EQ value)* SEMI_COLON
	;

fhirElementDefinitionExampleExampleAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_LABEL | ATT_VALUEB_ASE64B_INARY | ATT_VALUEB_OOLEAN | ATT_VALUEC_ODE | ATT_VALUED_ATE | ATT_VALUED_ATET_IME | ATT_VALUED_ECIMAL | ATT_VALUEI_D | ATT_VALUEI_NSTANT | ATT_VALUEI_NTEGER | ATT_VALUEM_ARKDOWN | ATT_VALUEO_ID | ATT_VALUEP_OSITIVEI_NT | ATT_VALUES_TRING | ATT_VALUET_IME | ATT_VALUEU_NSIGNEDI_NT | ATT_VALUEU_RI | ATT_VALUEA_DDRESS DOT fhirAddressAttrs | ATT_VALUEA_GE DOT fhirAgeAttrs | ATT_VALUEA_NNOTATION DOT fhirAnnotationAttrs | ATT_VALUEA_TTACHMENT DOT fhirAttachmentAttrs | ATT_VALUEC_ODEABLEC_ONCEPT ( DOT fhirCodeableConceptAttrs )? | ATT_VALUEC_ODING ( DOT fhirCodingAttrs )? | ATT_VALUEC_ONTACTP_OINT DOT fhirContactPointAttrs | ATT_VALUEC_OUNT DOT fhirCountAttrs | ATT_VALUED_ISTANCE DOT fhirDistanceAttrs | ATT_VALUED_URATION DOT fhirDurationAttrs | ATT_VALUEH_UMANN_AME DOT fhirHumanNameAttrs | ATT_VALUEI_DENTIFIER DOT fhirIdentifierAttrs | ATT_VALUEM_ONEY DOT fhirMoneyAttrs | ATT_VALUEP_ERIOD DOT fhirPeriodAttrs | ATT_VALUEQ_UANTITY DOT fhirQuantityAttrs | ATT_VALUER_ANGE DOT fhirRangeAttrs | ATT_VALUER_ATIO DOT fhirRatioAttrs | ATT_VALUER_EFERENCE ( DOT fhirReferenceAttrs )? | ATT_VALUES_AMPLEDD_ATA DOT fhirSampledDataAttrs | ATT_VALUES_IGNATURE DOT fhirSignatureAttrs | ATT_VALUET_IMING DOT fhirTimingAttrs | ATT_VALUEM_ETA DOT fhirMetaAttrs
	;

fhirElementDefinitionConstraintConstraint
	: RES_CONSTRAINT LT ID GT WITH fhirElementDefinitionConstraintConstraintAttrs EQ value (COMMA fhirElementDefinitionConstraintConstraintAttrs EQ value)* SEMI_COLON
	;

fhirElementDefinitionConstraintConstraintAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_KEY | ATT_REQUIREMENTS | ATT_SEVERITY | ATT_HUMAN | ATT_EXPRESSION | ATT_XPATH | ATT_SOURCE
	;

fhirElementDefinitionBindingBinding
	: RES_BINDING LT ID GT WITH fhirElementDefinitionBindingBindingAttrs EQ value (COMMA fhirElementDefinitionBindingBindingAttrs EQ value)* SEMI_COLON
	;

fhirElementDefinitionBindingBindingAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_STRENGTH | ATT_DESCRIPTION | ATT_VALUES_ETU_RI | ATT_VALUES_ETR_EFERENCE ( DOT fhirReferenceAttrs )?
	;

fhirElementDefinitionMappingMapping
	: RES_MAPPING LT ID GT WITH fhirElementDefinitionMappingMappingAttrs EQ value (COMMA fhirElementDefinitionMappingMappingAttrs EQ value)* SEMI_COLON
	;

fhirElementDefinitionMappingMappingAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTITY | ATT_LANGUAGE | ATT_MAP | ATT_COMMENT
	;

fhirElementDefinitionAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_PATH | ATT_REPRESENTATION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE | ATT_SLICEN_AME | ATT_LABEL | ATT_CODE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodingAttrs )? | ATT_SLICING DOT fhirElementDefinitionSlicingSlicingAttrs | ATT_SHORT | ATT_DEFINITION | ATT_COMMENT | ATT_REQUIREMENTS | ATT_ALIAS OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE | ATT_MIN | ATT_MAX | ATT_BASE DOT fhirElementDefinitionBaseBaseAttrs | ATT_CONTENTR_EFERENCE | ATT_TYPE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirElementDefinitionTypeTypeAttrs | ATT_DEFAULTV_ALUEB_ASE64B_INARY | ATT_DEFAULTV_ALUEB_OOLEAN | ATT_DEFAULTV_ALUEC_ODE | ATT_DEFAULTV_ALUED_ATE | ATT_DEFAULTV_ALUED_ATET_IME | ATT_DEFAULTV_ALUED_ECIMAL | ATT_DEFAULTV_ALUEI_D | ATT_DEFAULTV_ALUEI_NSTANT | ATT_DEFAULTV_ALUEI_NTEGER | ATT_DEFAULTV_ALUEM_ARKDOWN | ATT_DEFAULTV_ALUEO_ID | ATT_DEFAULTV_ALUEP_OSITIVEI_NT | ATT_DEFAULTV_ALUES_TRING | ATT_DEFAULTV_ALUET_IME | ATT_DEFAULTV_ALUEU_NSIGNEDI_NT | ATT_DEFAULTV_ALUEU_RI | ATT_DEFAULTV_ALUEA_DDRESS DOT fhirAddressAttrs | ATT_DEFAULTV_ALUEA_GE DOT fhirAgeAttrs | ATT_DEFAULTV_ALUEA_NNOTATION DOT fhirAnnotationAttrs | ATT_DEFAULTV_ALUEA_TTACHMENT DOT fhirAttachmentAttrs | ATT_DEFAULTV_ALUEC_ODEABLEC_ONCEPT ( DOT fhirCodeableConceptAttrs )? | ATT_DEFAULTV_ALUEC_ODING ( DOT fhirCodingAttrs )? | ATT_DEFAULTV_ALUEC_ONTACTP_OINT DOT fhirContactPointAttrs | ATT_DEFAULTV_ALUEC_OUNT DOT fhirCountAttrs | ATT_DEFAULTV_ALUED_ISTANCE DOT fhirDistanceAttrs | ATT_DEFAULTV_ALUED_URATION DOT fhirDurationAttrs | ATT_DEFAULTV_ALUEH_UMANN_AME DOT fhirHumanNameAttrs | ATT_DEFAULTV_ALUEI_DENTIFIER DOT fhirIdentifierAttrs | ATT_DEFAULTV_ALUEM_ONEY DOT fhirMoneyAttrs | ATT_DEFAULTV_ALUEP_ERIOD DOT fhirPeriodAttrs | ATT_DEFAULTV_ALUEQ_UANTITY DOT fhirQuantityAttrs | ATT_DEFAULTV_ALUER_ANGE DOT fhirRangeAttrs | ATT_DEFAULTV_ALUER_ATIO DOT fhirRatioAttrs | ATT_DEFAULTV_ALUER_EFERENCE ( DOT fhirReferenceAttrs )? | ATT_DEFAULTV_ALUES_AMPLEDD_ATA DOT fhirSampledDataAttrs | ATT_DEFAULTV_ALUES_IGNATURE DOT fhirSignatureAttrs | ATT_DEFAULTV_ALUET_IMING DOT fhirTimingAttrs | ATT_DEFAULTV_ALUEM_ETA DOT fhirMetaAttrs | ATT_MEANINGW_HENM_ISSING | ATT_ORDERM_EANING | ATT_FIXEDB_ASE64B_INARY | ATT_FIXEDB_OOLEAN | ATT_FIXEDC_ODE | ATT_FIXEDD_ATE | ATT_FIXEDD_ATET_IME | ATT_FIXEDD_ECIMAL | ATT_FIXEDI_D | ATT_FIXEDI_NSTANT | ATT_FIXEDI_NTEGER | ATT_FIXEDM_ARKDOWN | ATT_FIXEDO_ID | ATT_FIXEDP_OSITIVEI_NT | ATT_FIXEDS_TRING | ATT_FIXEDT_IME | ATT_FIXEDU_NSIGNEDI_NT | ATT_FIXEDU_RI | ATT_FIXEDA_DDRESS DOT fhirAddressAttrs | ATT_FIXEDA_GE DOT fhirAgeAttrs | ATT_FIXEDA_NNOTATION DOT fhirAnnotationAttrs | ATT_FIXEDA_TTACHMENT DOT fhirAttachmentAttrs | ATT_FIXEDC_ODEABLEC_ONCEPT ( DOT fhirCodeableConceptAttrs )? | ATT_FIXEDC_ODING ( DOT fhirCodingAttrs )? | ATT_FIXEDC_ONTACTP_OINT DOT fhirContactPointAttrs | ATT_FIXEDC_OUNT DOT fhirCountAttrs | ATT_FIXEDD_ISTANCE DOT fhirDistanceAttrs | ATT_FIXEDD_URATION DOT fhirDurationAttrs | ATT_FIXEDH_UMANN_AME DOT fhirHumanNameAttrs | ATT_FIXEDI_DENTIFIER DOT fhirIdentifierAttrs | ATT_FIXEDM_ONEY DOT fhirMoneyAttrs | ATT_FIXEDP_ERIOD DOT fhirPeriodAttrs | ATT_FIXEDQ_UANTITY DOT fhirQuantityAttrs | ATT_FIXEDR_ANGE DOT fhirRangeAttrs | ATT_FIXEDR_ATIO DOT fhirRatioAttrs | ATT_FIXEDR_EFERENCE ( DOT fhirReferenceAttrs )? | ATT_FIXEDS_AMPLEDD_ATA DOT fhirSampledDataAttrs | ATT_FIXEDS_IGNATURE DOT fhirSignatureAttrs | ATT_FIXEDT_IMING DOT fhirTimingAttrs | ATT_FIXEDM_ETA DOT fhirMetaAttrs | ATT_PATTERNB_ASE64B_INARY | ATT_PATTERNB_OOLEAN | ATT_PATTERNC_ODE | ATT_PATTERND_ATE | ATT_PATTERND_ATET_IME | ATT_PATTERND_ECIMAL | ATT_PATTERNI_D | ATT_PATTERNI_NSTANT | ATT_PATTERNI_NTEGER | ATT_PATTERNM_ARKDOWN | ATT_PATTERNO_ID | ATT_PATTERNP_OSITIVEI_NT | ATT_PATTERNS_TRING | ATT_PATTERNT_IME | ATT_PATTERNU_NSIGNEDI_NT | ATT_PATTERNU_RI | ATT_PATTERNA_DDRESS DOT fhirAddressAttrs | ATT_PATTERNA_GE DOT fhirAgeAttrs | ATT_PATTERNA_NNOTATION DOT fhirAnnotationAttrs | ATT_PATTERNA_TTACHMENT DOT fhirAttachmentAttrs | ATT_PATTERNC_ODEABLEC_ONCEPT ( DOT fhirCodeableConceptAttrs )? | ATT_PATTERNC_ODING ( DOT fhirCodingAttrs )? | ATT_PATTERNC_ONTACTP_OINT DOT fhirContactPointAttrs | ATT_PATTERNC_OUNT DOT fhirCountAttrs | ATT_PATTERND_ISTANCE DOT fhirDistanceAttrs | ATT_PATTERND_URATION DOT fhirDurationAttrs | ATT_PATTERNH_UMANN_AME DOT fhirHumanNameAttrs | ATT_PATTERNI_DENTIFIER DOT fhirIdentifierAttrs | ATT_PATTERNM_ONEY DOT fhirMoneyAttrs | ATT_PATTERNP_ERIOD DOT fhirPeriodAttrs | ATT_PATTERNQ_UANTITY DOT fhirQuantityAttrs | ATT_PATTERNR_ANGE DOT fhirRangeAttrs | ATT_PATTERNR_ATIO DOT fhirRatioAttrs | ATT_PATTERNR_EFERENCE ( DOT fhirReferenceAttrs )? | ATT_PATTERNS_AMPLEDD_ATA DOT fhirSampledDataAttrs | ATT_PATTERNS_IGNATURE DOT fhirSignatureAttrs | ATT_PATTERNT_IMING DOT fhirTimingAttrs | ATT_PATTERNM_ETA DOT fhirMetaAttrs | ATT_EXAMPLE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirElementDefinitionExampleExampleAttrs | ATT_MINV_ALUED_ATE | ATT_MINV_ALUED_ATET_IME | ATT_MINV_ALUEI_NSTANT | ATT_MINV_ALUET_IME | ATT_MINV_ALUED_ECIMAL | ATT_MINV_ALUEI_NTEGER | ATT_MINV_ALUEP_OSITIVEI_NT | ATT_MINV_ALUEU_NSIGNEDI_NT | ATT_MINV_ALUEQ_UANTITY DOT fhirQuantityAttrs | ATT_MAXV_ALUED_ATE | ATT_MAXV_ALUED_ATET_IME | ATT_MAXV_ALUEI_NSTANT | ATT_MAXV_ALUET_IME | ATT_MAXV_ALUED_ECIMAL | ATT_MAXV_ALUEI_NTEGER | ATT_MAXV_ALUEP_OSITIVEI_NT | ATT_MAXV_ALUEU_NSIGNEDI_NT | ATT_MAXV_ALUEQ_UANTITY DOT fhirQuantityAttrs | ATT_MAXL_ENGTH | ATT_CONDITION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE | ATT_CONSTRAINT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirElementDefinitionConstraintConstraintAttrs | ATT_MUSTS_UPPORT | ATT_ISM_ODIFIER | ATT_ISS_UMMARY | ATT_BINDING DOT fhirElementDefinitionBindingBindingAttrs | ATT_MAPPING OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirElementDefinitionMappingMappingAttrs
	;

fhirExtension
	: RES_E_XTENSION LT ID GT WITH fhirExtensionAttrs EQ value (COMMA fhirExtensionAttrs EQ value)* SEMI_COLON
	;

fhirExtensionAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_URL | ATT_VALUEB_ASE64B_INARY | ATT_VALUEB_OOLEAN | ATT_VALUEC_ODE | ATT_VALUED_ATE | ATT_VALUED_ATET_IME | ATT_VALUED_ECIMAL | ATT_VALUEI_D | ATT_VALUEI_NSTANT | ATT_VALUEI_NTEGER | ATT_VALUEM_ARKDOWN | ATT_VALUEO_ID | ATT_VALUEP_OSITIVEI_NT | ATT_VALUES_TRING | ATT_VALUET_IME | ATT_VALUEU_NSIGNEDI_NT | ATT_VALUEU_RI | ATT_VALUEA_DDRESS DOT fhirAddressAttrs | ATT_VALUEA_GE DOT fhirAgeAttrs | ATT_VALUEA_NNOTATION DOT fhirAnnotationAttrs | ATT_VALUEA_TTACHMENT DOT fhirAttachmentAttrs | ATT_VALUEC_ODEABLEC_ONCEPT ( DOT fhirCodeableConceptAttrs )? | ATT_VALUEC_ODING ( DOT fhirCodingAttrs )? | ATT_VALUEC_ONTACTP_OINT DOT fhirContactPointAttrs | ATT_VALUEC_OUNT DOT fhirCountAttrs | ATT_VALUED_ISTANCE DOT fhirDistanceAttrs | ATT_VALUED_URATION DOT fhirDurationAttrs | ATT_VALUEH_UMANN_AME DOT fhirHumanNameAttrs | ATT_VALUEI_DENTIFIER DOT fhirIdentifierAttrs | ATT_VALUEM_ONEY DOT fhirMoneyAttrs | ATT_VALUEP_ERIOD DOT fhirPeriodAttrs | ATT_VALUEQ_UANTITY DOT fhirQuantityAttrs | ATT_VALUER_ANGE DOT fhirRangeAttrs | ATT_VALUER_ATIO DOT fhirRatioAttrs | ATT_VALUER_EFERENCE ( DOT fhirReferenceAttrs )? | ATT_VALUES_AMPLEDD_ATA DOT fhirSampledDataAttrs | ATT_VALUES_IGNATURE DOT fhirSignatureAttrs | ATT_VALUET_IMING DOT fhirTimingAttrs | ATT_VALUEM_ETA DOT fhirMetaAttrs
	;

fhirHumanName
	: RES_H_UMANN_AME LT ID GT WITH fhirHumanNameAttrs EQ value (COMMA fhirHumanNameAttrs EQ value)* SEMI_COLON
	;

fhirHumanNameAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_USE | ATT_TEXT | ATT_FAMILY | ATT_GIVEN OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE | ATT_PREFIX OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE | ATT_SUFFIX OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE | ATT_PERIOD DOT fhirPeriodAttrs
	;

fhirIdentifier
	: RES_I_DENTIFIER LT ID GT WITH fhirIdentifierAttrs EQ value (COMMA fhirIdentifierAttrs EQ value)* SEMI_COLON
	;

fhirIdentifierAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_USE | ATT_TYPE ( DOT fhirCodeableConceptAttrs )? | ATT_SYSTEM | ATT_VALUE | ATT_PERIOD DOT fhirPeriodAttrs | ATT_ASSIGNER ( DOT fhirReferenceAttrs )?
	;

fhirMeta
	: RES_M_ETA LT ID GT WITH fhirMetaAttrs EQ value (COMMA fhirMetaAttrs EQ value)* SEMI_COLON
	;

fhirMetaAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_VERSIONI_D | ATT_LASTU_PDATED | ATT_PROFILE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE | ATT_SECURITY OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodingAttrs )? | ATT_TAG OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodingAttrs )?
	;

fhirMoney
	: RES_M_ONEY LT ID GT WITH fhirMoneyAttrs EQ value (COMMA fhirMoneyAttrs EQ value)* SEMI_COLON
	;

fhirMoneyAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_VALUE | ATT_COMPARATOR | ATT_UNIT | ATT_SYSTEM | ATT_CODE
	;

fhirNarrative
	: RES_N_ARRATIVE LT ID GT WITH fhirNarrativeAttrs EQ value (COMMA fhirNarrativeAttrs EQ value)* SEMI_COLON
	;

fhirNarrativeAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_STATUS | ATT_DIV
	;

fhirParameterDefinition
	: RES_P_ARAMETERD_EFINITION LT ID GT WITH fhirParameterDefinitionAttrs EQ value (COMMA fhirParameterDefinitionAttrs EQ value)* SEMI_COLON
	;

fhirParameterDefinitionAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_NAME | ATT_USE | ATT_MIN | ATT_MAX | ATT_DOCUMENTATION | ATT_TYPE | ATT_PROFILE ( DOT fhirReferenceAttrs )?
	;

fhirPeriod
	: RES_P_ERIOD LT ID GT WITH fhirPeriodAttrs EQ value (COMMA fhirPeriodAttrs EQ value)* SEMI_COLON
	;

fhirPeriodAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_START | ATT_END
	;

fhirQuantity
	: RES_Q_UANTITY LT ID GT WITH fhirQuantityAttrs EQ value (COMMA fhirQuantityAttrs EQ value)* SEMI_COLON
	;

fhirQuantityAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_VALUE | ATT_COMPARATOR | ATT_UNIT | ATT_SYSTEM | ATT_CODE
	;

fhirRange
	: RES_R_ANGE LT ID GT WITH fhirRangeAttrs EQ value (COMMA fhirRangeAttrs EQ value)* SEMI_COLON
	;

fhirRangeAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_LOW DOT fhirQuantityAttrs | ATT_HIGH DOT fhirQuantityAttrs
	;

fhirRatio
	: RES_R_ATIO LT ID GT WITH fhirRatioAttrs EQ value (COMMA fhirRatioAttrs EQ value)* SEMI_COLON
	;

fhirRatioAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_NUMERATOR DOT fhirQuantityAttrs | ATT_DENOMINATOR DOT fhirQuantityAttrs
	;

fhirReference
	: RES_R_EFERENCE LT ID GT WITH fhirReferenceAttrs EQ value (COMMA fhirReferenceAttrs EQ value)* SEMI_COLON
	;

fhirReferenceAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_REFERENCE | ATT_IDENTIFIER DOT fhirIdentifierAttrs | ATT_DISPLAY
	;

fhirRelatedArtifact
	: RES_R_ELATEDA_RTIFACT LT ID GT WITH fhirRelatedArtifactAttrs EQ value (COMMA fhirRelatedArtifactAttrs EQ value)* SEMI_COLON
	;

fhirRelatedArtifactAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_TYPE | ATT_DISPLAY | ATT_CITATION | ATT_URL | ATT_DOCUMENT DOT fhirAttachmentAttrs | ATT_RESOURCE ( DOT fhirReferenceAttrs )?
	;

fhirSampledData
	: RES_S_AMPLEDD_ATA LT ID GT WITH fhirSampledDataAttrs EQ value (COMMA fhirSampledDataAttrs EQ value)* SEMI_COLON
	;

fhirSampledDataAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_ORIGIN DOT fhirQuantityAttrs | ATT_PERIOD | ATT_FACTOR | ATT_LOWERL_IMIT | ATT_UPPERL_IMIT | ATT_DIMENSIONS | ATT_DATA
	;

fhirSignature
	: RES_S_IGNATURE LT ID GT WITH fhirSignatureAttrs EQ value (COMMA fhirSignatureAttrs EQ value)* SEMI_COLON
	;

fhirSignatureAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_TYPE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodingAttrs )? | ATT_WHEN | ATT_WHOU_RI | ATT_WHOR_EFERENCE ( DOT fhirReferenceAttrs )? | ATT_ONB_EHALFO_FU_RI | ATT_ONB_EHALFO_FR_EFERENCE ( DOT fhirReferenceAttrs )? | ATT_CONTENTT_YPE | ATT_BLOB
	;

fhirTiming
	: RES_T_IMING LT ID GT WITH fhirTimingAttrs EQ value (COMMA fhirTimingAttrs EQ value)* SEMI_COLON
	;

fhirTimingRepeatRepeat
	: RES_REPEAT LT ID GT WITH fhirTimingRepeatRepeatAttrs EQ value (COMMA fhirTimingRepeatRepeatAttrs EQ value)* SEMI_COLON
	;

fhirTimingRepeatRepeatAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_BOUNDSD_URATION DOT fhirDurationAttrs | ATT_BOUNDSR_ANGE DOT fhirRangeAttrs | ATT_BOUNDSP_ERIOD DOT fhirPeriodAttrs | ATT_COUNT | ATT_COUNTM_AX | ATT_DURATION | ATT_DURATIONM_AX | ATT_DURATIONU_NIT | ATT_FREQUENCY | ATT_FREQUENCYM_AX | ATT_PERIOD | ATT_PERIODM_AX | ATT_PERIODU_NIT | ATT_DAYO_FW_EEK OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE | ATT_TIMEO_FD_AY OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE | ATT_WHEN OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE | ATT_OFFSET
	;

fhirTimingAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_EVENT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE | ATT_REPEAT DOT fhirTimingRepeatRepeatAttrs | ATT_CODE ( DOT fhirCodeableConceptAttrs )?
	;

fhirTriggerDefinition
	: RES_T_RIGGERD_EFINITION LT ID GT WITH fhirTriggerDefinitionAttrs EQ value (COMMA fhirTriggerDefinitionAttrs EQ value)* SEMI_COLON
	;

fhirTriggerDefinitionAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_TYPE | ATT_EVENTN_AME | ATT_EVENTT_IMINGT_IMING DOT fhirTimingAttrs | ATT_EVENTT_IMINGR_EFERENCE ( DOT fhirReferenceAttrs )? | ATT_EVENTT_IMINGD_ATE | ATT_EVENTT_IMINGD_ATET_IME | ATT_EVENTD_ATA DOT fhirDataRequirementAttrs
	;

fhirUsageContext
	: RES_U_SAGEC_ONTEXT LT ID GT WITH fhirUsageContextAttrs EQ value (COMMA fhirUsageContextAttrs EQ value)* SEMI_COLON
	;

fhirUsageContextAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_CODE ( DOT fhirCodingAttrs )? | ATT_VALUEC_ODEABLEC_ONCEPT ( DOT fhirCodeableConceptAttrs )? | ATT_VALUEQ_UANTITY DOT fhirQuantityAttrs | ATT_VALUER_ANGE DOT fhirRangeAttrs
	;

fhirSimpleQuantity
	: RES_S_IMPLEQ_UANTITY LT ID GT WITH fhirSimpleQuantityAttrs EQ value (COMMA fhirSimpleQuantityAttrs EQ value)* SEMI_COLON
	;

fhirSimpleQuantityAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_VALUE | ATT_COMPARATOR OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE | ATT_UNIT | ATT_SYSTEM | ATT_CODE
	;

fhirAccount
	: RES_A_CCOUNT LT ID GT WITH fhirAccountAttrs EQ value (COMMA fhirAccountAttrs EQ value)* SEMI_COLON
	;

fhirAccountCoverageCoverage
	: RES_COVERAGE LT ID GT WITH fhirAccountCoverageCoverageAttrs EQ value (COMMA fhirAccountCoverageCoverageAttrs EQ value)* SEMI_COLON
	;

fhirAccountCoverageCoverageAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_COVERAGE ( DOT fhirReferenceAttrs )? | ATT_PRIORITY
	;

fhirAccountGuarantorGuarantor
	: RES_GUARANTOR LT ID GT WITH fhirAccountGuarantorGuarantorAttrs EQ value (COMMA fhirAccountGuarantorGuarantorAttrs EQ value)* SEMI_COLON
	;

fhirAccountGuarantorGuarantorAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_PARTY ( DOT fhirReferenceAttrs )? | ATT_ONH_OLD | ATT_PERIOD DOT fhirPeriodAttrs
	;

fhirAccountAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirIdentifierAttrs | ATT_STATUS | ATT_TYPE ( DOT fhirCodeableConceptAttrs )? | ATT_NAME | ATT_SUBJECT ( DOT fhirReferenceAttrs )? | ATT_PERIOD DOT fhirPeriodAttrs | ATT_ACTIVE DOT fhirPeriodAttrs | ATT_BALANCE DOT fhirMoneyAttrs | ATT_COVERAGE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirAccountCoverageCoverageAttrs | ATT_OWNER ( DOT fhirReferenceAttrs )? | ATT_DESCRIPTION | ATT_GUARANTOR OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirAccountGuarantorGuarantorAttrs
	;

fhirActivityDefinition
	: RES_A_CTIVITYD_EFINITION LT ID GT WITH fhirActivityDefinitionAttrs EQ value (COMMA fhirActivityDefinitionAttrs EQ value)* SEMI_COLON
	;

fhirActivityDefinitionParticipantParticipant
	: RES_PARTICIPANT LT ID GT WITH fhirActivityDefinitionParticipantParticipantAttrs EQ value (COMMA fhirActivityDefinitionParticipantParticipantAttrs EQ value)* SEMI_COLON
	;

fhirActivityDefinitionParticipantParticipantAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_TYPE | ATT_ROLE ( DOT fhirCodeableConceptAttrs )?
	;

fhirActivityDefinitionDynamicValueDynamicValue
	: RES_DYNAMICV_ALUE LT ID GT WITH fhirActivityDefinitionDynamicValueDynamicValueAttrs EQ value (COMMA fhirActivityDefinitionDynamicValueDynamicValueAttrs EQ value)* SEMI_COLON
	;

fhirActivityDefinitionDynamicValueDynamicValueAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_DESCRIPTION | ATT_PATH | ATT_LANGUAGE | ATT_EXPRESSION
	;

fhirActivityDefinitionAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_URL | ATT_IDENTIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirIdentifierAttrs | ATT_VERSION | ATT_NAME | ATT_TITLE | ATT_STATUS | ATT_EXPERIMENTAL | ATT_DATE | ATT_PUBLISHER | ATT_DESCRIPTION | ATT_PURPOSE | ATT_USAGE | ATT_APPROVALD_ATE | ATT_LASTR_EVIEWD_ATE | ATT_EFFECTIVEP_ERIOD DOT fhirPeriodAttrs | ATT_USEC_ONTEXT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirUsageContextAttrs | ATT_JURISDICTION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_TOPIC OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_CONTRIBUTOR OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirContributorAttrs | ATT_CONTACT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirContactDetailAttrs | ATT_COPYRIGHT | ATT_RELATEDA_RTIFACT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirRelatedArtifactAttrs | ATT_LIBRARY OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_KIND | ATT_CODE ( DOT fhirCodeableConceptAttrs )? | ATT_TIMINGT_IMING DOT fhirTimingAttrs | ATT_TIMINGD_ATET_IME | ATT_TIMINGP_ERIOD DOT fhirPeriodAttrs | ATT_TIMINGR_ANGE DOT fhirRangeAttrs | ATT_LOCATION ( DOT fhirReferenceAttrs )? | ATT_PARTICIPANT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirActivityDefinitionParticipantParticipantAttrs | ATT_PRODUCTR_EFERENCE ( DOT fhirReferenceAttrs )? | ATT_PRODUCTC_ODEABLEC_ONCEPT ( DOT fhirCodeableConceptAttrs )? | ATT_QUANTITY DOT fhirQuantityAttrs | ATT_DOSAGE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirDosageAttrs | ATT_BODYS_ITE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_TRANSFORM ( DOT fhirReferenceAttrs )? | ATT_DYNAMICV_ALUE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirActivityDefinitionDynamicValueDynamicValueAttrs
	;

fhirAdverseEvent
	: RES_A_DVERSEE_VENT LT ID GT WITH fhirAdverseEventAttrs EQ value (COMMA fhirAdverseEventAttrs EQ value)* SEMI_COLON
	;

fhirAdverseEventSuspectEntitySuspectEntity
	: RES_SUSPECTE_NTITY LT ID GT WITH fhirAdverseEventSuspectEntitySuspectEntityAttrs EQ value (COMMA fhirAdverseEventSuspectEntitySuspectEntityAttrs EQ value)* SEMI_COLON
	;

fhirAdverseEventSuspectEntitySuspectEntityAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_INSTANCE ( DOT fhirReferenceAttrs )? | ATT_CAUSALITY | ATT_CAUSALITYA_SSESSMENT ( DOT fhirCodeableConceptAttrs )? | ATT_CAUSALITYP_RODUCTR_ELATEDNESS | ATT_CAUSALITYM_ETHOD ( DOT fhirCodeableConceptAttrs )? | ATT_CAUSALITYA_UTHOR ( DOT fhirReferenceAttrs )? | ATT_CAUSALITYR_ESULT ( DOT fhirCodeableConceptAttrs )?
	;

fhirAdverseEventAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER DOT fhirIdentifierAttrs | ATT_CATEGORY | ATT_TYPE ( DOT fhirCodeableConceptAttrs )? | ATT_SUBJECT ( DOT fhirReferenceAttrs )? | ATT_DATE | ATT_REACTION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_LOCATION ( DOT fhirReferenceAttrs )? | ATT_SERIOUSNESS ( DOT fhirCodeableConceptAttrs )? | ATT_OUTCOME ( DOT fhirCodeableConceptAttrs )? | ATT_RECORDER ( DOT fhirReferenceAttrs )? | ATT_EVENTP_ARTICIPANT ( DOT fhirReferenceAttrs )? | ATT_DESCRIPTION | ATT_SUSPECTE_NTITY OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirAdverseEventSuspectEntitySuspectEntityAttrs | ATT_SUBJECTM_EDICALH_ISTORY OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_REFERENCED_OCUMENT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_STUDY OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )?
	;

fhirAllergyIntolerance
	: RES_A_LLERGYI_NTOLERANCE LT ID GT WITH fhirAllergyIntoleranceAttrs EQ value (COMMA fhirAllergyIntoleranceAttrs EQ value)* SEMI_COLON
	;

fhirAllergyIntoleranceReactionReaction
	: RES_REACTION LT ID GT WITH fhirAllergyIntoleranceReactionReactionAttrs EQ value (COMMA fhirAllergyIntoleranceReactionReactionAttrs EQ value)* SEMI_COLON
	;

fhirAllergyIntoleranceReactionReactionAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_SUBSTANCE ( DOT fhirCodeableConceptAttrs )? | ATT_MANIFESTATION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_DESCRIPTION | ATT_ONSET | ATT_SEVERITY | ATT_EXPOSURER_OUTE ( DOT fhirCodeableConceptAttrs )? | ATT_NOTE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirAnnotationAttrs
	;

fhirAllergyIntoleranceAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirIdentifierAttrs | ATT_CLINICALS_TATUS | ATT_VERIFICATIONS_TATUS | ATT_TYPE | ATT_CATEGORY OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE | ATT_CRITICALITY | ATT_CODE ( DOT fhirCodeableConceptAttrs )? | ATT_PATIENT ( DOT fhirReferenceAttrs )? | ATT_ONSETD_ATET_IME | ATT_ONSETA_GE DOT fhirAgeAttrs | ATT_ONSETP_ERIOD DOT fhirPeriodAttrs | ATT_ONSETR_ANGE DOT fhirRangeAttrs | ATT_ONSETS_TRING | ATT_ASSERTEDD_ATE | ATT_RECORDER ( DOT fhirReferenceAttrs )? | ATT_ASSERTER ( DOT fhirReferenceAttrs )? | ATT_LASTO_CCURRENCE | ATT_NOTE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirAnnotationAttrs | ATT_REACTION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirAllergyIntoleranceReactionReactionAttrs
	;

fhirAppointment
	: RES_A_PPOINTMENT LT ID GT WITH fhirAppointmentAttrs EQ value (COMMA fhirAppointmentAttrs EQ value)* SEMI_COLON
	;

fhirAppointmentParticipantParticipant
	: RES_PARTICIPANT LT ID GT WITH fhirAppointmentParticipantParticipantAttrs EQ value (COMMA fhirAppointmentParticipantParticipantAttrs EQ value)* SEMI_COLON
	;

fhirAppointmentParticipantParticipantAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_TYPE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_ACTOR ( DOT fhirReferenceAttrs )? | ATT_REQUIRED | ATT_STATUS
	;

fhirAppointmentAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirIdentifierAttrs | ATT_STATUS | ATT_SERVICEC_ATEGORY ( DOT fhirCodeableConceptAttrs )? | ATT_SERVICET_YPE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_SPECIALTY OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_APPOINTMENTT_YPE ( DOT fhirCodeableConceptAttrs )? | ATT_REASON OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_INDICATION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_PRIORITY | ATT_DESCRIPTION | ATT_SUPPORTINGI_NFORMATION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_START | ATT_END | ATT_MINUTESD_URATION | ATT_SLOT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_CREATED | ATT_COMMENT | ATT_INCOMINGR_EFERRAL OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_PARTICIPANT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirAppointmentParticipantParticipantAttrs | ATT_REQUESTEDP_ERIOD OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirPeriodAttrs
	;

fhirAppointmentResponse
	: RES_A_PPOINTMENTR_ESPONSE LT ID GT WITH fhirAppointmentResponseAttrs EQ value (COMMA fhirAppointmentResponseAttrs EQ value)* SEMI_COLON
	;

fhirAppointmentResponseAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirIdentifierAttrs | ATT_APPOINTMENT ( DOT fhirReferenceAttrs )? | ATT_START | ATT_END | ATT_PARTICIPANTT_YPE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_ACTOR ( DOT fhirReferenceAttrs )? | ATT_PARTICIPANTS_TATUS | ATT_COMMENT
	;

fhirAuditEvent
	: RES_A_UDITE_VENT LT ID GT WITH fhirAuditEventAttrs EQ value (COMMA fhirAuditEventAttrs EQ value)* SEMI_COLON
	;

fhirAuditEventAgentAgent
	: RES_AGENT LT ID GT WITH fhirAuditEventAgentAgentAttrs EQ value (COMMA fhirAuditEventAgentAgentAttrs EQ value)* SEMI_COLON
	;

fhirAgentNetworkNetwork
	: RES_NETWORK LT ID GT WITH fhirAgentNetworkNetworkAttrs EQ value (COMMA fhirAgentNetworkNetworkAttrs EQ value)* SEMI_COLON
	;

fhirAgentNetworkNetworkAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_ADDRESS | ATT_TYPE
	;

fhirAuditEventAgentAgentAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_ROLE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_REFERENCE ( DOT fhirReferenceAttrs )? | ATT_USERI_D DOT fhirIdentifierAttrs | ATT_ALTI_D | ATT_NAME | ATT_REQUESTOR | ATT_LOCATION ( DOT fhirReferenceAttrs )? | ATT_POLICY OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE | ATT_MEDIA ( DOT fhirCodingAttrs )? | ATT_NETWORK DOT fhirAgentNetworkNetworkAttrs | ATT_PURPOSEO_FU_SE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )?
	;

fhirAuditEventSourceSource
	: RES_SOURCE LT ID GT WITH fhirAuditEventSourceSourceAttrs EQ value (COMMA fhirAuditEventSourceSourceAttrs EQ value)* SEMI_COLON
	;

fhirAuditEventSourceSourceAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_SITE | ATT_IDENTIFIER DOT fhirIdentifierAttrs | ATT_TYPE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodingAttrs )?
	;

fhirAuditEventEntityEntity
	: RES_ENTITY LT ID GT WITH fhirAuditEventEntityEntityAttrs EQ value (COMMA fhirAuditEventEntityEntityAttrs EQ value)* SEMI_COLON
	;

fhirEntityDetailDetail
	: RES_DETAIL LT ID GT WITH fhirEntityDetailDetailAttrs EQ value (COMMA fhirEntityDetailDetailAttrs EQ value)* SEMI_COLON
	;

fhirEntityDetailDetailAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_TYPE | ATT_VALUE
	;

fhirAuditEventEntityEntityAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER DOT fhirIdentifierAttrs | ATT_REFERENCE ( DOT fhirReferenceAttrs )? | ATT_TYPE ( DOT fhirCodingAttrs )? | ATT_ROLE ( DOT fhirCodingAttrs )? | ATT_LIFECYCLE ( DOT fhirCodingAttrs )? | ATT_SECURITYL_ABEL OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodingAttrs )? | ATT_NAME | ATT_DESCRIPTION | ATT_QUERY | ATT_DETAIL OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirEntityDetailDetailAttrs
	;

fhirAuditEventAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_TYPE ( DOT fhirCodingAttrs )? | ATT_SUBTYPE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodingAttrs )? | ATT_ACTION | ATT_RECORDED | ATT_OUTCOME | ATT_OUTCOMED_ESC | ATT_PURPOSEO_FE_VENT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_AGENT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirAuditEventAgentAgentAttrs | ATT_SOURCE DOT fhirAuditEventSourceSourceAttrs | ATT_ENTITY OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirAuditEventEntityEntityAttrs
	;

fhirBasic
	: RES_B_ASIC LT ID GT WITH fhirBasicAttrs EQ value (COMMA fhirBasicAttrs EQ value)* SEMI_COLON
	;

fhirBasicAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirIdentifierAttrs | ATT_CODE ( DOT fhirCodeableConceptAttrs )? | ATT_SUBJECT ( DOT fhirReferenceAttrs )? | ATT_CREATED | ATT_AUTHOR ( DOT fhirReferenceAttrs )?
	;

fhirBinary
	: RES_B_INARY LT ID GT WITH fhirBinaryAttrs EQ value (COMMA fhirBinaryAttrs EQ value)* SEMI_COLON
	;

fhirBinaryAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_CONTENTT_YPE | ATT_SECURITYC_ONTEXT ( DOT fhirReferenceAttrs )? | ATT_CONTENT
	;

fhirBodySite
	: RES_B_ODYS_ITE LT ID GT WITH fhirBodySiteAttrs EQ value (COMMA fhirBodySiteAttrs EQ value)* SEMI_COLON
	;

fhirBodySiteAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirIdentifierAttrs | ATT_ACTIVE | ATT_CODE ( DOT fhirCodeableConceptAttrs )? | ATT_QUALIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_DESCRIPTION | ATT_IMAGE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirAttachmentAttrs | ATT_PATIENT ( DOT fhirReferenceAttrs )?
	;

fhirBundle
	: RES_B_UNDLE LT ID GT WITH fhirBundleAttrs EQ value (COMMA fhirBundleAttrs EQ value)* SEMI_COLON
	;

fhirBundleLinkLink
	: RES_LINK LT ID GT WITH fhirBundleLinkLinkAttrs EQ value (COMMA fhirBundleLinkLinkAttrs EQ value)* SEMI_COLON
	;

fhirBundleLinkLinkAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_RELATION | ATT_URL
	;

fhirBundleEntryEntry
	: RES_ENTRY LT ID GT WITH fhirBundleEntryEntryAttrs EQ value (COMMA fhirBundleEntryEntryAttrs EQ value)* SEMI_COLON
	;

fhirEntrySearchSearch
	: RES_SEARCH LT ID GT WITH fhirEntrySearchSearchAttrs EQ value (COMMA fhirEntrySearchSearchAttrs EQ value)* SEMI_COLON
	;

fhirEntrySearchSearchAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODE | ATT_SCORE
	;

fhirEntryRequestRequest
	: RES_REQUEST LT ID GT WITH fhirEntryRequestRequestAttrs EQ value (COMMA fhirEntryRequestRequestAttrs EQ value)* SEMI_COLON
	;

fhirEntryRequestRequestAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_METHOD | ATT_URL | ATT_IFN_ONEM_ATCH | ATT_IFM_ODIFIEDS_INCE | ATT_IFM_ATCH | ATT_IFN_ONEE_XIST
	;

fhirEntryResponseResponse
	: RES_RESPONSE LT ID GT WITH fhirEntryResponseResponseAttrs EQ value (COMMA fhirEntryResponseResponseAttrs EQ value)* SEMI_COLON
	;

fhirEntryResponseResponseAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_STATUS | ATT_LOCATION | ATT_ETAG | ATT_LASTM_ODIFIED
	;

fhirBundleEntryEntryAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_FULLU_RL | ATT_SEARCH DOT fhirEntrySearchSearchAttrs | ATT_REQUEST DOT fhirEntryRequestRequestAttrs | ATT_RESPONSE DOT fhirEntryResponseResponseAttrs
	;

fhirBundleAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_IDENTIFIER DOT fhirIdentifierAttrs | ATT_TYPE | ATT_TOTAL | ATT_LINK OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirBundleLinkLinkAttrs | ATT_ENTRY OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirBundleEntryEntryAttrs | ATT_SIGNATURE DOT fhirSignatureAttrs
	;

fhirCapabilityStatement
	: RES_C_APABILITYS_TATEMENT LT ID GT WITH fhirCapabilityStatementAttrs EQ value (COMMA fhirCapabilityStatementAttrs EQ value)* SEMI_COLON
	;

fhirCapabilityStatementSoftwareSoftware
	: RES_SOFTWARE LT ID GT WITH fhirCapabilityStatementSoftwareSoftwareAttrs EQ value (COMMA fhirCapabilityStatementSoftwareSoftwareAttrs EQ value)* SEMI_COLON
	;

fhirCapabilityStatementSoftwareSoftwareAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_NAME | ATT_VERSION | ATT_RELEASED_ATE
	;

fhirCapabilityStatementImplementationImplementation
	: RES_IMPLEMENTATION LT ID GT WITH fhirCapabilityStatementImplementationImplementationAttrs EQ value (COMMA fhirCapabilityStatementImplementationImplementationAttrs EQ value)* SEMI_COLON
	;

fhirCapabilityStatementImplementationImplementationAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_DESCRIPTION | ATT_URL
	;

fhirCapabilityStatementRestRest
	: RES_REST LT ID GT WITH fhirCapabilityStatementRestRestAttrs EQ value (COMMA fhirCapabilityStatementRestRestAttrs EQ value)* SEMI_COLON
	;

fhirRestSecuritySecurity
	: RES_SECURITY LT ID GT WITH fhirRestSecuritySecurityAttrs EQ value (COMMA fhirRestSecuritySecurityAttrs EQ value)* SEMI_COLON
	;

fhirSecurityCertificateCertificate
	: RES_CERTIFICATE LT ID GT WITH fhirSecurityCertificateCertificateAttrs EQ value (COMMA fhirSecurityCertificateCertificateAttrs EQ value)* SEMI_COLON
	;

fhirSecurityCertificateCertificateAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_TYPE | ATT_BLOB
	;

fhirRestSecuritySecurityAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_CORS | ATT_SERVICE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_DESCRIPTION | ATT_CERTIFICATE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirSecurityCertificateCertificateAttrs
	;

fhirRestResourceResource
	: RES_RESOURCE LT ID GT WITH fhirRestResourceResourceAttrs EQ value (COMMA fhirRestResourceResourceAttrs EQ value)* SEMI_COLON
	;

fhirResourceInteractionInteraction
	: RES_INTERACTION LT ID GT WITH fhirResourceInteractionInteractionAttrs EQ value (COMMA fhirResourceInteractionInteractionAttrs EQ value)* SEMI_COLON
	;

fhirResourceInteractionInteractionAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_CODE | ATT_DOCUMENTATION
	;

fhirResourceSearchParamSearchParam
	: RES_SEARCHP_ARAM LT ID GT WITH fhirResourceSearchParamSearchParamAttrs EQ value (COMMA fhirResourceSearchParamSearchParamAttrs EQ value)* SEMI_COLON
	;

fhirResourceSearchParamSearchParamAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_NAME | ATT_DEFINITION | ATT_TYPE | ATT_DOCUMENTATION
	;

fhirRestResourceResourceAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_TYPE | ATT_PROFILE ( DOT fhirReferenceAttrs )? | ATT_DOCUMENTATION | ATT_INTERACTION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirResourceInteractionInteractionAttrs | ATT_VERSIONING | ATT_READH_ISTORY | ATT_UPDATEC_REATE | ATT_CONDITIONALC_REATE | ATT_CONDITIONALR_EAD | ATT_CONDITIONALU_PDATE | ATT_CONDITIONALD_ELETE | ATT_REFERENCEP_OLICY OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE | ATT_SEARCHI_NCLUDE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE | ATT_SEARCHR_EVI_NCLUDE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE | ATT_SEARCHP_ARAM OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirResourceSearchParamSearchParamAttrs
	;

fhirRestInteractionInteraction
	: RES_INTERACTION LT ID GT WITH fhirRestInteractionInteractionAttrs EQ value (COMMA fhirRestInteractionInteractionAttrs EQ value)* SEMI_COLON
	;

fhirRestInteractionInteractionAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_CODE | ATT_DOCUMENTATION
	;

fhirRestOperationOperation
	: RES_OPERATION LT ID GT WITH fhirRestOperationOperationAttrs EQ value (COMMA fhirRestOperationOperationAttrs EQ value)* SEMI_COLON
	;

fhirRestOperationOperationAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_NAME | ATT_DEFINITION ( DOT fhirReferenceAttrs )?
	;

fhirCapabilityStatementRestRestAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODE | ATT_DOCUMENTATION | ATT_SECURITY DOT fhirRestSecuritySecurityAttrs | ATT_RESOURCE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirRestResourceResourceAttrs | ATT_INTERACTION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirRestInteractionInteractionAttrs | ATT_OPERATION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirRestOperationOperationAttrs | ATT_COMPARTMENT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE
	;

fhirCapabilityStatementMessagingMessaging
	: RES_MESSAGING LT ID GT WITH fhirCapabilityStatementMessagingMessagingAttrs EQ value (COMMA fhirCapabilityStatementMessagingMessagingAttrs EQ value)* SEMI_COLON
	;

fhirMessagingEndpointEndpoint
	: RES_ENDPOINT LT ID GT WITH fhirMessagingEndpointEndpointAttrs EQ value (COMMA fhirMessagingEndpointEndpointAttrs EQ value)* SEMI_COLON
	;

fhirMessagingEndpointEndpointAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_PROTOCOL ( DOT fhirCodingAttrs )? | ATT_ADDRESS
	;

fhirMessagingSupportedMessageSupportedMessage
	: RES_SUPPORTEDM_ESSAGE LT ID GT WITH fhirMessagingSupportedMessageSupportedMessageAttrs EQ value (COMMA fhirMessagingSupportedMessageSupportedMessageAttrs EQ value)* SEMI_COLON
	;

fhirMessagingSupportedMessageSupportedMessageAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODE | ATT_DEFINITION ( DOT fhirReferenceAttrs )?
	;

fhirMessagingEventEvent
	: RES_EVENT LT ID GT WITH fhirMessagingEventEventAttrs EQ value (COMMA fhirMessagingEventEventAttrs EQ value)* SEMI_COLON
	;

fhirMessagingEventEventAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_CODE ( DOT fhirCodingAttrs )? | ATT_CATEGORY | ATT_MODE | ATT_FOCUS | ATT_REQUEST ( DOT fhirReferenceAttrs )? | ATT_RESPONSE ( DOT fhirReferenceAttrs )? | ATT_DOCUMENTATION
	;

fhirCapabilityStatementMessagingMessagingAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_ENDPOINT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirMessagingEndpointEndpointAttrs | ATT_RELIABLEC_ACHE | ATT_DOCUMENTATION | ATT_SUPPORTEDM_ESSAGE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirMessagingSupportedMessageSupportedMessageAttrs | ATT_EVENT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirMessagingEventEventAttrs
	;

fhirCapabilityStatementDocumentDocument
	: RES_DOCUMENT LT ID GT WITH fhirCapabilityStatementDocumentDocumentAttrs EQ value (COMMA fhirCapabilityStatementDocumentDocumentAttrs EQ value)* SEMI_COLON
	;

fhirCapabilityStatementDocumentDocumentAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODE | ATT_DOCUMENTATION | ATT_PROFILE ( DOT fhirReferenceAttrs )?
	;

fhirCapabilityStatementAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_URL | ATT_VERSION | ATT_NAME | ATT_TITLE | ATT_STATUS | ATT_EXPERIMENTAL | ATT_DATE | ATT_PUBLISHER | ATT_CONTACT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirContactDetailAttrs | ATT_DESCRIPTION | ATT_USEC_ONTEXT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirUsageContextAttrs | ATT_JURISDICTION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_PURPOSE | ATT_COPYRIGHT | ATT_KIND | ATT_INSTANTIATES OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE | ATT_SOFTWARE DOT fhirCapabilityStatementSoftwareSoftwareAttrs | ATT_IMPLEMENTATION DOT fhirCapabilityStatementImplementationImplementationAttrs | ATT_FHIRV_ERSION | ATT_ACCEPTU_NKNOWN | ATT_FORMAT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE | ATT_PATCHF_ORMAT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE | ATT_IMPLEMENTATIONG_UIDE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE | ATT_PROFILE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_REST OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirCapabilityStatementRestRestAttrs | ATT_MESSAGING OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirCapabilityStatementMessagingMessagingAttrs | ATT_DOCUMENT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirCapabilityStatementDocumentDocumentAttrs
	;

fhirCarePlan
	: RES_C_AREP_LAN LT ID GT WITH fhirCarePlanAttrs EQ value (COMMA fhirCarePlanAttrs EQ value)* SEMI_COLON
	;

fhirCarePlanActivityActivity
	: RES_ACTIVITY LT ID GT WITH fhirCarePlanActivityActivityAttrs EQ value (COMMA fhirCarePlanActivityActivityAttrs EQ value)* SEMI_COLON
	;

fhirActivityDetailDetail
	: RES_DETAIL LT ID GT WITH fhirActivityDetailDetailAttrs EQ value (COMMA fhirActivityDetailDetailAttrs EQ value)* SEMI_COLON
	;

fhirActivityDetailDetailAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_CATEGORY ( DOT fhirCodeableConceptAttrs )? | ATT_DEFINITION ( DOT fhirReferenceAttrs )? | ATT_CODE ( DOT fhirCodeableConceptAttrs )? | ATT_REASONC_ODE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_REASONR_EFERENCE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_GOAL OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_STATUS | ATT_STATUSR_EASON | ATT_PROHIBITED | ATT_SCHEDULEDT_IMING DOT fhirTimingAttrs | ATT_SCHEDULEDP_ERIOD DOT fhirPeriodAttrs | ATT_SCHEDULEDS_TRING | ATT_LOCATION ( DOT fhirReferenceAttrs )? | ATT_PERFORMER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_PRODUCTC_ODEABLEC_ONCEPT ( DOT fhirCodeableConceptAttrs )? | ATT_PRODUCTR_EFERENCE ( DOT fhirReferenceAttrs )? | ATT_DAILYA_MOUNT DOT fhirQuantityAttrs | ATT_QUANTITY DOT fhirQuantityAttrs | ATT_DESCRIPTION
	;

fhirCarePlanActivityActivityAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_OUTCOMEC_ODEABLEC_ONCEPT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_OUTCOMER_EFERENCE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_PROGRESS OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirAnnotationAttrs | ATT_REFERENCE ( DOT fhirReferenceAttrs )? | ATT_DETAIL DOT fhirActivityDetailDetailAttrs
	;

fhirCarePlanAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirIdentifierAttrs | ATT_DEFINITION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_BASEDO_N OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_REPLACES OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_PARTO_F OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_STATUS | ATT_INTENT | ATT_CATEGORY OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_TITLE | ATT_DESCRIPTION | ATT_SUBJECT ( DOT fhirReferenceAttrs )? | ATT_CONTEXT ( DOT fhirReferenceAttrs )? | ATT_PERIOD DOT fhirPeriodAttrs | ATT_AUTHOR OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_CARET_EAM OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_ADDRESSES OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_SUPPORTINGI_NFO OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_GOAL OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_ACTIVITY OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirCarePlanActivityActivityAttrs | ATT_NOTE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirAnnotationAttrs
	;

fhirCareTeam
	: RES_C_ARET_EAM LT ID GT WITH fhirCareTeamAttrs EQ value (COMMA fhirCareTeamAttrs EQ value)* SEMI_COLON
	;

fhirCareTeamParticipantParticipant
	: RES_PARTICIPANT LT ID GT WITH fhirCareTeamParticipantParticipantAttrs EQ value (COMMA fhirCareTeamParticipantParticipantAttrs EQ value)* SEMI_COLON
	;

fhirCareTeamParticipantParticipantAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_ROLE ( DOT fhirCodeableConceptAttrs )? | ATT_MEMBER ( DOT fhirReferenceAttrs )? | ATT_ONB_EHALFO_F ( DOT fhirReferenceAttrs )? | ATT_PERIOD DOT fhirPeriodAttrs
	;

fhirCareTeamAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirIdentifierAttrs | ATT_STATUS | ATT_CATEGORY OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_NAME | ATT_SUBJECT ( DOT fhirReferenceAttrs )? | ATT_CONTEXT ( DOT fhirReferenceAttrs )? | ATT_PERIOD DOT fhirPeriodAttrs | ATT_PARTICIPANT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirCareTeamParticipantParticipantAttrs | ATT_REASONC_ODE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_REASONR_EFERENCE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_MANAGINGO_RGANIZATION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_NOTE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirAnnotationAttrs
	;

fhirChargeItem
	: RES_C_HARGEI_TEM LT ID GT WITH fhirChargeItemAttrs EQ value (COMMA fhirChargeItemAttrs EQ value)* SEMI_COLON
	;

fhirChargeItemParticipantParticipant
	: RES_PARTICIPANT LT ID GT WITH fhirChargeItemParticipantParticipantAttrs EQ value (COMMA fhirChargeItemParticipantParticipantAttrs EQ value)* SEMI_COLON
	;

fhirChargeItemParticipantParticipantAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_ROLE ( DOT fhirCodeableConceptAttrs )? | ATT_ACTOR ( DOT fhirReferenceAttrs )?
	;

fhirChargeItemAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER DOT fhirIdentifierAttrs | ATT_DEFINITION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE | ATT_STATUS | ATT_PARTO_F OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_CODE ( DOT fhirCodeableConceptAttrs )? | ATT_SUBJECT ( DOT fhirReferenceAttrs )? | ATT_CONTEXT ( DOT fhirReferenceAttrs )? | ATT_OCCURRENCED_ATET_IME | ATT_OCCURRENCEP_ERIOD DOT fhirPeriodAttrs | ATT_OCCURRENCET_IMING DOT fhirTimingAttrs | ATT_PARTICIPANT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirChargeItemParticipantParticipantAttrs | ATT_PERFORMINGO_RGANIZATION ( DOT fhirReferenceAttrs )? | ATT_REQUESTINGO_RGANIZATION ( DOT fhirReferenceAttrs )? | ATT_QUANTITY DOT fhirQuantityAttrs | ATT_BODYSITE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_FACTORO_VERRIDE | ATT_PRICEO_VERRIDE DOT fhirMoneyAttrs | ATT_OVERRIDER_EASON | ATT_ENTERER ( DOT fhirReferenceAttrs )? | ATT_ENTEREDD_ATE | ATT_REASON OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_SERVICE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_ACCOUNT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_NOTE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirAnnotationAttrs | ATT_SUPPORTINGI_NFORMATION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )?
	;

fhirClaim
	: RES_C_LAIM LT ID GT WITH fhirClaimAttrs EQ value (COMMA fhirClaimAttrs EQ value)* SEMI_COLON
	;

fhirClaimRelatedRelated
	: RES_RELATED LT ID GT WITH fhirClaimRelatedRelatedAttrs EQ value (COMMA fhirClaimRelatedRelatedAttrs EQ value)* SEMI_COLON
	;

fhirClaimRelatedRelatedAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_CLAIM ( DOT fhirReferenceAttrs )? | ATT_RELATIONSHIP ( DOT fhirCodeableConceptAttrs )? | ATT_REFERENCE DOT fhirIdentifierAttrs
	;

fhirClaimPayeePayee
	: RES_PAYEE LT ID GT WITH fhirClaimPayeePayeeAttrs EQ value (COMMA fhirClaimPayeePayeeAttrs EQ value)* SEMI_COLON
	;

fhirClaimPayeePayeeAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_TYPE ( DOT fhirCodeableConceptAttrs )? | ATT_RESOURCET_YPE ( DOT fhirCodingAttrs )? | ATT_PARTY ( DOT fhirReferenceAttrs )?
	;

fhirClaimCareTeamCareTeam
	: RES_CARET_EAM LT ID GT WITH fhirClaimCareTeamCareTeamAttrs EQ value (COMMA fhirClaimCareTeamCareTeamAttrs EQ value)* SEMI_COLON
	;

fhirClaimCareTeamCareTeamAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_SEQUENCE | ATT_PROVIDER ( DOT fhirReferenceAttrs )? | ATT_RESPONSIBLE | ATT_ROLE ( DOT fhirCodeableConceptAttrs )? | ATT_QUALIFICATION ( DOT fhirCodeableConceptAttrs )?
	;

fhirClaimInformationInformation
	: RES_INFORMATION LT ID GT WITH fhirClaimInformationInformationAttrs EQ value (COMMA fhirClaimInformationInformationAttrs EQ value)* SEMI_COLON
	;

fhirClaimInformationInformationAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_SEQUENCE | ATT_CATEGORY ( DOT fhirCodeableConceptAttrs )? | ATT_CODE ( DOT fhirCodeableConceptAttrs )? | ATT_TIMINGD_ATE | ATT_TIMINGP_ERIOD DOT fhirPeriodAttrs | ATT_VALUES_TRING | ATT_VALUEQ_UANTITY DOT fhirQuantityAttrs | ATT_VALUEA_TTACHMENT DOT fhirAttachmentAttrs | ATT_VALUER_EFERENCE ( DOT fhirReferenceAttrs )? | ATT_REASON ( DOT fhirCodeableConceptAttrs )?
	;

fhirClaimDiagnosisDiagnosis
	: RES_DIAGNOSIS LT ID GT WITH fhirClaimDiagnosisDiagnosisAttrs EQ value (COMMA fhirClaimDiagnosisDiagnosisAttrs EQ value)* SEMI_COLON
	;

fhirClaimDiagnosisDiagnosisAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_SEQUENCE | ATT_DIAGNOSISC_ODEABLEC_ONCEPT ( DOT fhirCodeableConceptAttrs )? | ATT_DIAGNOSISR_EFERENCE ( DOT fhirReferenceAttrs )? | ATT_TYPE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_PACKAGEC_ODE ( DOT fhirCodeableConceptAttrs )?
	;

fhirClaimProcedureProcedure
	: RES_PROCEDURE LT ID GT WITH fhirClaimProcedureProcedureAttrs EQ value (COMMA fhirClaimProcedureProcedureAttrs EQ value)* SEMI_COLON
	;

fhirClaimProcedureProcedureAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_SEQUENCE | ATT_DATE | ATT_PROCEDUREC_ODEABLEC_ONCEPT ( DOT fhirCodeableConceptAttrs )? | ATT_PROCEDURER_EFERENCE ( DOT fhirReferenceAttrs )?
	;

fhirClaimInsuranceInsurance
	: RES_INSURANCE LT ID GT WITH fhirClaimInsuranceInsuranceAttrs EQ value (COMMA fhirClaimInsuranceInsuranceAttrs EQ value)* SEMI_COLON
	;

fhirClaimInsuranceInsuranceAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_SEQUENCE | ATT_FOCAL | ATT_COVERAGE ( DOT fhirReferenceAttrs )? | ATT_BUSINESSA_RRANGEMENT | ATT_PREA_UTHR_EF OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE | ATT_CLAIMR_ESPONSE ( DOT fhirReferenceAttrs )?
	;

fhirClaimAccidentAccident
	: RES_ACCIDENT LT ID GT WITH fhirClaimAccidentAccidentAttrs EQ value (COMMA fhirClaimAccidentAccidentAttrs EQ value)* SEMI_COLON
	;

fhirClaimAccidentAccidentAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_DATE | ATT_TYPE ( DOT fhirCodeableConceptAttrs )? | ATT_LOCATIONA_DDRESS DOT fhirAddressAttrs | ATT_LOCATIONR_EFERENCE ( DOT fhirReferenceAttrs )?
	;

fhirClaimItemItem
	: RES_ITEM LT ID GT WITH fhirClaimItemItemAttrs EQ value (COMMA fhirClaimItemItemAttrs EQ value)* SEMI_COLON
	;

fhirItemDetailDetail
	: RES_DETAIL LT ID GT WITH fhirItemDetailDetailAttrs EQ value (COMMA fhirItemDetailDetailAttrs EQ value)* SEMI_COLON
	;

fhirDetailSubDetailSubDetail
	: RES_SUBD_ETAIL LT ID GT WITH fhirDetailSubDetailSubDetailAttrs EQ value (COMMA fhirDetailSubDetailSubDetailAttrs EQ value)* SEMI_COLON
	;

fhirDetailSubDetailSubDetailAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_SEQUENCE | ATT_REVENUE ( DOT fhirCodeableConceptAttrs )? | ATT_CATEGORY ( DOT fhirCodeableConceptAttrs )? | ATT_SERVICE ( DOT fhirCodeableConceptAttrs )? | ATT_MODIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_PROGRAMC_ODE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_QUANTITY DOT fhirQuantityAttrs | ATT_UNITP_RICE DOT fhirMoneyAttrs | ATT_FACTOR | ATT_NET DOT fhirMoneyAttrs | ATT_UDI OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )?
	;

fhirItemDetailDetailAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_SEQUENCE | ATT_REVENUE ( DOT fhirCodeableConceptAttrs )? | ATT_CATEGORY ( DOT fhirCodeableConceptAttrs )? | ATT_SERVICE ( DOT fhirCodeableConceptAttrs )? | ATT_MODIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_PROGRAMC_ODE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_QUANTITY DOT fhirQuantityAttrs | ATT_UNITP_RICE DOT fhirMoneyAttrs | ATT_FACTOR | ATT_NET DOT fhirMoneyAttrs | ATT_UDI OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_SUBD_ETAIL OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirDetailSubDetailSubDetailAttrs
	;

fhirClaimItemItemAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_SEQUENCE | ATT_CARET_EAML_INKI_D OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE | ATT_DIAGNOSISL_INKI_D OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE | ATT_PROCEDUREL_INKI_D OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE | ATT_INFORMATIONL_INKI_D OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE | ATT_REVENUE ( DOT fhirCodeableConceptAttrs )? | ATT_CATEGORY ( DOT fhirCodeableConceptAttrs )? | ATT_SERVICE ( DOT fhirCodeableConceptAttrs )? | ATT_MODIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_PROGRAMC_ODE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_SERVICEDD_ATE | ATT_SERVICEDP_ERIOD DOT fhirPeriodAttrs | ATT_LOCATIONC_ODEABLEC_ONCEPT ( DOT fhirCodeableConceptAttrs )? | ATT_LOCATIONA_DDRESS DOT fhirAddressAttrs | ATT_LOCATIONR_EFERENCE ( DOT fhirReferenceAttrs )? | ATT_QUANTITY DOT fhirQuantityAttrs | ATT_UNITP_RICE DOT fhirMoneyAttrs | ATT_FACTOR | ATT_NET DOT fhirMoneyAttrs | ATT_UDI OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_BODYS_ITE ( DOT fhirCodeableConceptAttrs )? | ATT_SUBS_ITE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_ENCOUNTER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_DETAIL OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirItemDetailDetailAttrs
	;

fhirClaimAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirIdentifierAttrs | ATT_STATUS | ATT_TYPE ( DOT fhirCodeableConceptAttrs )? | ATT_SUBT_YPE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_USE | ATT_PATIENT ( DOT fhirReferenceAttrs )? | ATT_BILLABLEP_ERIOD DOT fhirPeriodAttrs | ATT_CREATED | ATT_ENTERER ( DOT fhirReferenceAttrs )? | ATT_INSURER ( DOT fhirReferenceAttrs )? | ATT_PROVIDER ( DOT fhirReferenceAttrs )? | ATT_ORGANIZATION ( DOT fhirReferenceAttrs )? | ATT_PRIORITY ( DOT fhirCodeableConceptAttrs )? | ATT_FUNDSR_ESERVE ( DOT fhirCodeableConceptAttrs )? | ATT_RELATED OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirClaimRelatedRelatedAttrs | ATT_PRESCRIPTION ( DOT fhirReferenceAttrs )? | ATT_ORIGINALP_RESCRIPTION ( DOT fhirReferenceAttrs )? | ATT_PAYEE DOT fhirClaimPayeePayeeAttrs | ATT_REFERRAL ( DOT fhirReferenceAttrs )? | ATT_FACILITY ( DOT fhirReferenceAttrs )? | ATT_CARET_EAM OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirClaimCareTeamCareTeamAttrs | ATT_INFORMATION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirClaimInformationInformationAttrs | ATT_DIAGNOSIS OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirClaimDiagnosisDiagnosisAttrs | ATT_PROCEDURE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirClaimProcedureProcedureAttrs | ATT_INSURANCE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirClaimInsuranceInsuranceAttrs | ATT_ACCIDENT DOT fhirClaimAccidentAccidentAttrs | ATT_EMPLOYMENTI_MPACTED DOT fhirPeriodAttrs | ATT_HOSPITALIZATION DOT fhirPeriodAttrs | ATT_ITEM OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirClaimItemItemAttrs | ATT_TOTAL DOT fhirMoneyAttrs
	;

fhirClaimResponse
	: RES_C_LAIMR_ESPONSE LT ID GT WITH fhirClaimResponseAttrs EQ value (COMMA fhirClaimResponseAttrs EQ value)* SEMI_COLON
	;

fhirClaimResponseItemItem
	: RES_ITEM LT ID GT WITH fhirClaimResponseItemItemAttrs EQ value (COMMA fhirClaimResponseItemItemAttrs EQ value)* SEMI_COLON
	;

fhirItemAdjudicationAdjudication
	: RES_ADJUDICATION LT ID GT WITH fhirItemAdjudicationAdjudicationAttrs EQ value (COMMA fhirItemAdjudicationAdjudicationAttrs EQ value)* SEMI_COLON
	;

fhirItemAdjudicationAdjudicationAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_CATEGORY ( DOT fhirCodeableConceptAttrs )? | ATT_REASON ( DOT fhirCodeableConceptAttrs )? | ATT_AMOUNT DOT fhirMoneyAttrs | ATT_VALUE
	;

fhirClaimResponseItemItemAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_SEQUENCEL_INKI_D | ATT_NOTEN_UMBER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE | ATT_ADJUDICATION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirItemAdjudicationAdjudicationAttrs | ATT_DETAIL OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirItemDetailDetailAttrs
	;

fhirClaimResponseAddItemAddItem
	: RES_ADDI_TEM LT ID GT WITH fhirClaimResponseAddItemAddItemAttrs EQ value (COMMA fhirClaimResponseAddItemAddItemAttrs EQ value)* SEMI_COLON
	;

fhirAddItemDetailDetail
	: RES_DETAIL LT ID GT WITH fhirAddItemDetailDetailAttrs EQ value (COMMA fhirAddItemDetailDetailAttrs EQ value)* SEMI_COLON
	;

fhirAddItemDetailDetailAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_REVENUE ( DOT fhirCodeableConceptAttrs )? | ATT_CATEGORY ( DOT fhirCodeableConceptAttrs )? | ATT_SERVICE ( DOT fhirCodeableConceptAttrs )? | ATT_MODIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_FEE DOT fhirMoneyAttrs | ATT_NOTEN_UMBER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE
	;

fhirClaimResponseAddItemAddItemAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_SEQUENCEL_INKI_D OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE | ATT_REVENUE ( DOT fhirCodeableConceptAttrs )? | ATT_CATEGORY ( DOT fhirCodeableConceptAttrs )? | ATT_SERVICE ( DOT fhirCodeableConceptAttrs )? | ATT_MODIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_FEE DOT fhirMoneyAttrs | ATT_NOTEN_UMBER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE | ATT_DETAIL OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirAddItemDetailDetailAttrs
	;

fhirClaimResponseErrorError
	: RES_ERROR LT ID GT WITH fhirClaimResponseErrorErrorAttrs EQ value (COMMA fhirClaimResponseErrorErrorAttrs EQ value)* SEMI_COLON
	;

fhirClaimResponseErrorErrorAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_SEQUENCEL_INKI_D | ATT_DETAILS_EQUENCEL_INKI_D | ATT_SUBDETAILS_EQUENCEL_INKI_D | ATT_CODE ( DOT fhirCodeableConceptAttrs )?
	;

fhirClaimResponsePaymentPayment
	: RES_PAYMENT LT ID GT WITH fhirClaimResponsePaymentPaymentAttrs EQ value (COMMA fhirClaimResponsePaymentPaymentAttrs EQ value)* SEMI_COLON
	;

fhirClaimResponsePaymentPaymentAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_TYPE ( DOT fhirCodeableConceptAttrs )? | ATT_ADJUSTMENT DOT fhirMoneyAttrs | ATT_ADJUSTMENTR_EASON ( DOT fhirCodeableConceptAttrs )? | ATT_DATE | ATT_AMOUNT DOT fhirMoneyAttrs | ATT_IDENTIFIER DOT fhirIdentifierAttrs
	;

fhirClaimResponseProcessNoteProcessNote
	: RES_PROCESSN_OTE LT ID GT WITH fhirClaimResponseProcessNoteProcessNoteAttrs EQ value (COMMA fhirClaimResponseProcessNoteProcessNoteAttrs EQ value)* SEMI_COLON
	;

fhirClaimResponseProcessNoteProcessNoteAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_NUMBER | ATT_TYPE ( DOT fhirCodeableConceptAttrs )? | ATT_TEXT | ATT_LANGUAGE ( DOT fhirCodeableConceptAttrs )?
	;

fhirClaimResponseInsuranceInsurance
	: RES_INSURANCE LT ID GT WITH fhirClaimResponseInsuranceInsuranceAttrs EQ value (COMMA fhirClaimResponseInsuranceInsuranceAttrs EQ value)* SEMI_COLON
	;

fhirClaimResponseInsuranceInsuranceAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_SEQUENCE | ATT_FOCAL | ATT_COVERAGE ( DOT fhirReferenceAttrs )? | ATT_BUSINESSA_RRANGEMENT | ATT_PREA_UTHR_EF OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE | ATT_CLAIMR_ESPONSE ( DOT fhirReferenceAttrs )?
	;

fhirClaimResponseAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirIdentifierAttrs | ATT_STATUS | ATT_PATIENT ( DOT fhirReferenceAttrs )? | ATT_CREATED | ATT_INSURER ( DOT fhirReferenceAttrs )? | ATT_REQUESTP_ROVIDER ( DOT fhirReferenceAttrs )? | ATT_REQUESTO_RGANIZATION ( DOT fhirReferenceAttrs )? | ATT_REQUEST ( DOT fhirReferenceAttrs )? | ATT_OUTCOME ( DOT fhirCodeableConceptAttrs )? | ATT_DISPOSITION | ATT_PAYEET_YPE ( DOT fhirCodeableConceptAttrs )? | ATT_ITEM OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirClaimResponseItemItemAttrs | ATT_ADDI_TEM OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirClaimResponseAddItemAddItemAttrs | ATT_ERROR OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirClaimResponseErrorErrorAttrs | ATT_TOTALC_OST DOT fhirMoneyAttrs | ATT_UNALLOCD_EDUCTABLE DOT fhirMoneyAttrs | ATT_TOTALB_ENEFIT DOT fhirMoneyAttrs | ATT_PAYMENT DOT fhirClaimResponsePaymentPaymentAttrs | ATT_RESERVED ( DOT fhirCodingAttrs )? | ATT_FORM ( DOT fhirCodeableConceptAttrs )? | ATT_PROCESSN_OTE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirClaimResponseProcessNoteProcessNoteAttrs | ATT_COMMUNICATIONR_EQUEST OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_INSURANCE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirClaimResponseInsuranceInsuranceAttrs
	;

fhirClinicalImpression
	: RES_C_LINICALI_MPRESSION LT ID GT WITH fhirClinicalImpressionAttrs EQ value (COMMA fhirClinicalImpressionAttrs EQ value)* SEMI_COLON
	;

fhirClinicalImpressionInvestigationInvestigation
	: RES_INVESTIGATION LT ID GT WITH fhirClinicalImpressionInvestigationInvestigationAttrs EQ value (COMMA fhirClinicalImpressionInvestigationInvestigationAttrs EQ value)* SEMI_COLON
	;

fhirClinicalImpressionInvestigationInvestigationAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_CODE ( DOT fhirCodeableConceptAttrs )? | ATT_ITEM OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )?
	;

fhirClinicalImpressionFindingFinding
	: RES_FINDING LT ID GT WITH fhirClinicalImpressionFindingFindingAttrs EQ value (COMMA fhirClinicalImpressionFindingFindingAttrs EQ value)* SEMI_COLON
	;

fhirClinicalImpressionFindingFindingAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_ITEMC_ODEABLEC_ONCEPT ( DOT fhirCodeableConceptAttrs )? | ATT_ITEMR_EFERENCE ( DOT fhirReferenceAttrs )? | ATT_BASIS
	;

fhirClinicalImpressionAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirIdentifierAttrs | ATT_STATUS | ATT_CODE ( DOT fhirCodeableConceptAttrs )? | ATT_DESCRIPTION | ATT_SUBJECT ( DOT fhirReferenceAttrs )? | ATT_CONTEXT ( DOT fhirReferenceAttrs )? | ATT_EFFECTIVED_ATET_IME | ATT_EFFECTIVEP_ERIOD DOT fhirPeriodAttrs | ATT_DATE | ATT_ASSESSOR ( DOT fhirReferenceAttrs )? | ATT_PREVIOUS ( DOT fhirReferenceAttrs )? | ATT_PROBLEM OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_INVESTIGATION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirClinicalImpressionInvestigationInvestigationAttrs | ATT_PROTOCOL OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE | ATT_SUMMARY | ATT_FINDING OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirClinicalImpressionFindingFindingAttrs | ATT_PROGNOSISC_ODEABLEC_ONCEPT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_PROGNOSISR_EFERENCE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_ACTION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_NOTE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirAnnotationAttrs
	;

fhirCodeSystem
	: RES_C_ODES_YSTEM LT ID GT WITH fhirCodeSystemAttrs EQ value (COMMA fhirCodeSystemAttrs EQ value)* SEMI_COLON
	;

fhirCodeSystemFilterFilter
	: RES_FILTER LT ID GT WITH fhirCodeSystemFilterFilterAttrs EQ value (COMMA fhirCodeSystemFilterFilterAttrs EQ value)* SEMI_COLON
	;

fhirCodeSystemFilterFilterAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_CODE | ATT_DESCRIPTION | ATT_OPERATOR OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE | ATT_VALUE
	;

fhirCodeSystemPropertyProperty
	: RES_PROPERTY LT ID GT WITH fhirCodeSystemPropertyPropertyAttrs EQ value (COMMA fhirCodeSystemPropertyPropertyAttrs EQ value)* SEMI_COLON
	;

fhirCodeSystemPropertyPropertyAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_CODE | ATT_URI | ATT_DESCRIPTION | ATT_TYPE
	;

fhirCodeSystemConceptConcept
	: RES_CONCEPT LT ID GT WITH fhirCodeSystemConceptConceptAttrs EQ value (COMMA fhirCodeSystemConceptConceptAttrs EQ value)* SEMI_COLON
	;

fhirConceptDesignationDesignation
	: RES_DESIGNATION LT ID GT WITH fhirConceptDesignationDesignationAttrs EQ value (COMMA fhirConceptDesignationDesignationAttrs EQ value)* SEMI_COLON
	;

fhirConceptDesignationDesignationAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_LANGUAGE | ATT_USE ( DOT fhirCodingAttrs )? | ATT_VALUE
	;

fhirConceptPropertyProperty
	: RES_PROPERTY LT ID GT WITH fhirConceptPropertyPropertyAttrs EQ value (COMMA fhirConceptPropertyPropertyAttrs EQ value)* SEMI_COLON
	;

fhirConceptPropertyPropertyAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_CODE | ATT_VALUEC_ODE | ATT_VALUEC_ODING ( DOT fhirCodingAttrs )? | ATT_VALUES_TRING | ATT_VALUEI_NTEGER | ATT_VALUEB_OOLEAN | ATT_VALUED_ATET_IME
	;

fhirCodeSystemConceptConceptAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_CODE | ATT_DISPLAY | ATT_DEFINITION | ATT_DESIGNATION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirConceptDesignationDesignationAttrs | ATT_PROPERTY OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirConceptPropertyPropertyAttrs
	;

fhirCodeSystemAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_URL | ATT_IDENTIFIER DOT fhirIdentifierAttrs | ATT_VERSION | ATT_NAME | ATT_TITLE | ATT_STATUS | ATT_EXPERIMENTAL | ATT_DATE | ATT_PUBLISHER | ATT_CONTACT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirContactDetailAttrs | ATT_DESCRIPTION | ATT_USEC_ONTEXT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirUsageContextAttrs | ATT_JURISDICTION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_PURPOSE | ATT_COPYRIGHT | ATT_CASES_ENSITIVE | ATT_VALUES_ET | ATT_HIERARCHYM_EANING | ATT_COMPOSITIONAL | ATT_VERSIONN_EEDED | ATT_CONTENT | ATT_COUNT | ATT_FILTER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirCodeSystemFilterFilterAttrs | ATT_PROPERTY OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirCodeSystemPropertyPropertyAttrs | ATT_CONCEPT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirCodeSystemConceptConceptAttrs
	;

fhirCommunication
	: RES_C_OMMUNICATION LT ID GT WITH fhirCommunicationAttrs EQ value (COMMA fhirCommunicationAttrs EQ value)* SEMI_COLON
	;

fhirCommunicationPayloadPayload
	: RES_PAYLOAD LT ID GT WITH fhirCommunicationPayloadPayloadAttrs EQ value (COMMA fhirCommunicationPayloadPayloadAttrs EQ value)* SEMI_COLON
	;

fhirCommunicationPayloadPayloadAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_CONTENTS_TRING | ATT_CONTENTA_TTACHMENT DOT fhirAttachmentAttrs | ATT_CONTENTR_EFERENCE ( DOT fhirReferenceAttrs )?
	;

fhirCommunicationAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirIdentifierAttrs | ATT_DEFINITION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_BASEDO_N OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_PARTO_F OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_STATUS | ATT_NOTD_ONE | ATT_NOTD_ONER_EASON ( DOT fhirCodeableConceptAttrs )? | ATT_CATEGORY OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_MEDIUM OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_SUBJECT ( DOT fhirReferenceAttrs )? | ATT_RECIPIENT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_TOPIC OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_CONTEXT ( DOT fhirReferenceAttrs )? | ATT_SENT | ATT_RECEIVED | ATT_SENDER ( DOT fhirReferenceAttrs )? | ATT_REASONC_ODE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_REASONR_EFERENCE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_PAYLOAD OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirCommunicationPayloadPayloadAttrs | ATT_NOTE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirAnnotationAttrs
	;

fhirCommunicationRequest
	: RES_C_OMMUNICATIONR_EQUEST LT ID GT WITH fhirCommunicationRequestAttrs EQ value (COMMA fhirCommunicationRequestAttrs EQ value)* SEMI_COLON
	;

fhirCommunicationRequestPayloadPayload
	: RES_PAYLOAD LT ID GT WITH fhirCommunicationRequestPayloadPayloadAttrs EQ value (COMMA fhirCommunicationRequestPayloadPayloadAttrs EQ value)* SEMI_COLON
	;

fhirCommunicationRequestPayloadPayloadAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_CONTENTS_TRING | ATT_CONTENTA_TTACHMENT DOT fhirAttachmentAttrs | ATT_CONTENTR_EFERENCE ( DOT fhirReferenceAttrs )?
	;

fhirCommunicationRequestRequesterRequester
	: RES_REQUESTER LT ID GT WITH fhirCommunicationRequestRequesterRequesterAttrs EQ value (COMMA fhirCommunicationRequestRequesterRequesterAttrs EQ value)* SEMI_COLON
	;

fhirCommunicationRequestRequesterRequesterAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_AGENT ( DOT fhirReferenceAttrs )? | ATT_ONB_EHALFO_F ( DOT fhirReferenceAttrs )?
	;

fhirCommunicationRequestAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirIdentifierAttrs | ATT_BASEDO_N OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_REPLACES OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_GROUPI_DENTIFIER DOT fhirIdentifierAttrs | ATT_STATUS | ATT_CATEGORY OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_PRIORITY | ATT_MEDIUM OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_SUBJECT ( DOT fhirReferenceAttrs )? | ATT_RECIPIENT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_TOPIC OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_CONTEXT ( DOT fhirReferenceAttrs )? | ATT_PAYLOAD OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirCommunicationRequestPayloadPayloadAttrs | ATT_OCCURRENCED_ATET_IME | ATT_OCCURRENCEP_ERIOD DOT fhirPeriodAttrs | ATT_AUTHOREDO_N | ATT_SENDER ( DOT fhirReferenceAttrs )? | ATT_REQUESTER DOT fhirCommunicationRequestRequesterRequesterAttrs | ATT_REASONC_ODE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_REASONR_EFERENCE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_NOTE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirAnnotationAttrs
	;

fhirCompartmentDefinition
	: RES_C_OMPARTMENTD_EFINITION LT ID GT WITH fhirCompartmentDefinitionAttrs EQ value (COMMA fhirCompartmentDefinitionAttrs EQ value)* SEMI_COLON
	;

fhirCompartmentDefinitionResourceResource
	: RES_RESOURCE LT ID GT WITH fhirCompartmentDefinitionResourceResourceAttrs EQ value (COMMA fhirCompartmentDefinitionResourceResourceAttrs EQ value)* SEMI_COLON
	;

fhirCompartmentDefinitionResourceResourceAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_CODE | ATT_PARAM OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE | ATT_DOCUMENTATION
	;

fhirCompartmentDefinitionAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_URL | ATT_NAME | ATT_TITLE | ATT_STATUS | ATT_EXPERIMENTAL | ATT_DATE | ATT_PUBLISHER | ATT_CONTACT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirContactDetailAttrs | ATT_DESCRIPTION | ATT_PURPOSE | ATT_USEC_ONTEXT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirUsageContextAttrs | ATT_JURISDICTION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_CODE | ATT_SEARCH | ATT_RESOURCE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirCompartmentDefinitionResourceResourceAttrs
	;

fhirComposition
	: RES_C_OMPOSITION LT ID GT WITH fhirCompositionAttrs EQ value (COMMA fhirCompositionAttrs EQ value)* SEMI_COLON
	;

fhirCompositionAttesterAttester
	: RES_ATTESTER LT ID GT WITH fhirCompositionAttesterAttesterAttrs EQ value (COMMA fhirCompositionAttesterAttesterAttrs EQ value)* SEMI_COLON
	;

fhirCompositionAttesterAttesterAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE | ATT_TIME | ATT_PARTY ( DOT fhirReferenceAttrs )?
	;

fhirCompositionRelatesToRelatesTo
	: RES_RELATEST_O LT ID GT WITH fhirCompositionRelatesToRelatesToAttrs EQ value (COMMA fhirCompositionRelatesToRelatesToAttrs EQ value)* SEMI_COLON
	;

fhirCompositionRelatesToRelatesToAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_CODE | ATT_TARGETI_DENTIFIER DOT fhirIdentifierAttrs | ATT_TARGETR_EFERENCE ( DOT fhirReferenceAttrs )?
	;

fhirCompositionEventEvent
	: RES_EVENT LT ID GT WITH fhirCompositionEventEventAttrs EQ value (COMMA fhirCompositionEventEventAttrs EQ value)* SEMI_COLON
	;

fhirCompositionEventEventAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_CODE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_PERIOD DOT fhirPeriodAttrs | ATT_DETAIL OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )?
	;

fhirCompositionSectionSection
	: RES_SECTION LT ID GT WITH fhirCompositionSectionSectionAttrs EQ value (COMMA fhirCompositionSectionSectionAttrs EQ value)* SEMI_COLON
	;

fhirCompositionSectionSectionAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_TITLE | ATT_CODE ( DOT fhirCodeableConceptAttrs )? | ATT_TEXT DOT fhirNarrativeAttrs | ATT_MODE | ATT_ORDEREDB_Y ( DOT fhirCodeableConceptAttrs )? | ATT_ENTRY OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_EMPTYR_EASON ( DOT fhirCodeableConceptAttrs )?
	;

fhirCompositionAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER DOT fhirIdentifierAttrs | ATT_STATUS | ATT_TYPE ( DOT fhirCodeableConceptAttrs )? | ATT_CLASS ( DOT fhirCodeableConceptAttrs )? | ATT_SUBJECT ( DOT fhirReferenceAttrs )? | ATT_ENCOUNTER ( DOT fhirReferenceAttrs )? | ATT_DATE | ATT_AUTHOR OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_TITLE | ATT_CONFIDENTIALITY | ATT_ATTESTER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirCompositionAttesterAttesterAttrs | ATT_CUSTODIAN ( DOT fhirReferenceAttrs )? | ATT_RELATEST_O OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirCompositionRelatesToRelatesToAttrs | ATT_EVENT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirCompositionEventEventAttrs | ATT_SECTION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirCompositionSectionSectionAttrs
	;

fhirConceptMap
	: RES_C_ONCEPTM_AP LT ID GT WITH fhirConceptMapAttrs EQ value (COMMA fhirConceptMapAttrs EQ value)* SEMI_COLON
	;

fhirConceptMapGroupGroup
	: RES_GROUP LT ID GT WITH fhirConceptMapGroupGroupAttrs EQ value (COMMA fhirConceptMapGroupGroupAttrs EQ value)* SEMI_COLON
	;

fhirGroupElementElement
	: RES_ELEMENT LT ID GT WITH fhirGroupElementElementAttrs EQ value (COMMA fhirGroupElementElementAttrs EQ value)* SEMI_COLON
	;

fhirElementTargetTarget
	: RES_TARGET LT ID GT WITH fhirElementTargetTargetAttrs EQ value (COMMA fhirElementTargetTargetAttrs EQ value)* SEMI_COLON
	;

fhirTargetDependsOnDependsOn
	: RES_DEPENDSO_N LT ID GT WITH fhirTargetDependsOnDependsOnAttrs EQ value (COMMA fhirTargetDependsOnDependsOnAttrs EQ value)* SEMI_COLON
	;

fhirTargetDependsOnDependsOnAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_PROPERTY | ATT_SYSTEM | ATT_CODE | ATT_DISPLAY
	;

fhirElementTargetTargetAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_CODE | ATT_DISPLAY | ATT_EQUIVALENCE | ATT_COMMENT | ATT_DEPENDSO_N OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirTargetDependsOnDependsOnAttrs
	;

fhirGroupElementElementAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_CODE | ATT_DISPLAY | ATT_TARGET OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirElementTargetTargetAttrs
	;

fhirGroupUnmappedUnmapped
	: RES_UNMAPPED LT ID GT WITH fhirGroupUnmappedUnmappedAttrs EQ value (COMMA fhirGroupUnmappedUnmappedAttrs EQ value)* SEMI_COLON
	;

fhirGroupUnmappedUnmappedAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODE | ATT_CODE | ATT_DISPLAY | ATT_URL
	;

fhirConceptMapGroupGroupAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_SOURCE | ATT_SOURCEV_ERSION | ATT_TARGET | ATT_TARGETV_ERSION | ATT_ELEMENT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirGroupElementElementAttrs | ATT_UNMAPPED DOT fhirGroupUnmappedUnmappedAttrs
	;

fhirConceptMapAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_URL | ATT_IDENTIFIER DOT fhirIdentifierAttrs | ATT_VERSION | ATT_NAME | ATT_TITLE | ATT_STATUS | ATT_EXPERIMENTAL | ATT_DATE | ATT_PUBLISHER | ATT_CONTACT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirContactDetailAttrs | ATT_DESCRIPTION | ATT_USEC_ONTEXT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirUsageContextAttrs | ATT_JURISDICTION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_PURPOSE | ATT_COPYRIGHT | ATT_SOURCEU_RI | ATT_SOURCER_EFERENCE ( DOT fhirReferenceAttrs )? | ATT_TARGETU_RI | ATT_TARGETR_EFERENCE ( DOT fhirReferenceAttrs )? | ATT_GROUP OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirConceptMapGroupGroupAttrs
	;

fhirCondition
	: RES_C_ONDITION LT ID GT WITH fhirConditionAttrs EQ value (COMMA fhirConditionAttrs EQ value)* SEMI_COLON
	;

fhirConditionStageStage
	: RES_STAGE LT ID GT WITH fhirConditionStageStageAttrs EQ value (COMMA fhirConditionStageStageAttrs EQ value)* SEMI_COLON
	;

fhirConditionStageStageAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_SUMMARY ( DOT fhirCodeableConceptAttrs )? | ATT_ASSESSMENT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )?
	;

fhirConditionEvidenceEvidence
	: RES_EVIDENCE LT ID GT WITH fhirConditionEvidenceEvidenceAttrs EQ value (COMMA fhirConditionEvidenceEvidenceAttrs EQ value)* SEMI_COLON
	;

fhirConditionEvidenceEvidenceAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_CODE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_DETAIL OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )?
	;

fhirConditionAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirIdentifierAttrs | ATT_CLINICALS_TATUS | ATT_VERIFICATIONS_TATUS | ATT_CATEGORY OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_SEVERITY ( DOT fhirCodeableConceptAttrs )? | ATT_CODE ( DOT fhirCodeableConceptAttrs )? | ATT_BODYS_ITE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_SUBJECT ( DOT fhirReferenceAttrs )? | ATT_CONTEXT ( DOT fhirReferenceAttrs )? | ATT_ONSETD_ATET_IME | ATT_ONSETA_GE DOT fhirAgeAttrs | ATT_ONSETP_ERIOD DOT fhirPeriodAttrs | ATT_ONSETR_ANGE DOT fhirRangeAttrs | ATT_ONSETS_TRING | ATT_ABATEMENTD_ATET_IME | ATT_ABATEMENTA_GE DOT fhirAgeAttrs | ATT_ABATEMENTB_OOLEAN | ATT_ABATEMENTP_ERIOD DOT fhirPeriodAttrs | ATT_ABATEMENTR_ANGE DOT fhirRangeAttrs | ATT_ABATEMENTS_TRING | ATT_ASSERTEDD_ATE | ATT_ASSERTER ( DOT fhirReferenceAttrs )? | ATT_STAGE DOT fhirConditionStageStageAttrs | ATT_EVIDENCE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirConditionEvidenceEvidenceAttrs | ATT_NOTE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirAnnotationAttrs
	;

fhirConsent
	: RES_C_ONSENT LT ID GT WITH fhirConsentAttrs EQ value (COMMA fhirConsentAttrs EQ value)* SEMI_COLON
	;

fhirConsentActorActor
	: RES_ACTOR LT ID GT WITH fhirConsentActorActorAttrs EQ value (COMMA fhirConsentActorActorAttrs EQ value)* SEMI_COLON
	;

fhirConsentActorActorAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_ROLE ( DOT fhirCodeableConceptAttrs )? | ATT_REFERENCE ( DOT fhirReferenceAttrs )?
	;

fhirConsentPolicyPolicy
	: RES_POLICY LT ID GT WITH fhirConsentPolicyPolicyAttrs EQ value (COMMA fhirConsentPolicyPolicyAttrs EQ value)* SEMI_COLON
	;

fhirConsentPolicyPolicyAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_AUTHORITY | ATT_URI
	;

fhirConsentDataData
	: RES_DATA LT ID GT WITH fhirConsentDataDataAttrs EQ value (COMMA fhirConsentDataDataAttrs EQ value)* SEMI_COLON
	;

fhirConsentDataDataAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MEANING | ATT_REFERENCE ( DOT fhirReferenceAttrs )?
	;

fhirConsentExceptExcept
	: RES_EXCEPT LT ID GT WITH fhirConsentExceptExceptAttrs EQ value (COMMA fhirConsentExceptExceptAttrs EQ value)* SEMI_COLON
	;

fhirExceptActorActor
	: RES_ACTOR LT ID GT WITH fhirExceptActorActorAttrs EQ value (COMMA fhirExceptActorActorAttrs EQ value)* SEMI_COLON
	;

fhirExceptActorActorAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_ROLE ( DOT fhirCodeableConceptAttrs )? | ATT_REFERENCE ( DOT fhirReferenceAttrs )?
	;

fhirExceptDataData
	: RES_DATA LT ID GT WITH fhirExceptDataDataAttrs EQ value (COMMA fhirExceptDataDataAttrs EQ value)* SEMI_COLON
	;

fhirExceptDataDataAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MEANING | ATT_REFERENCE ( DOT fhirReferenceAttrs )?
	;

fhirConsentExceptExceptAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_TYPE | ATT_PERIOD DOT fhirPeriodAttrs | ATT_ACTOR OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExceptActorActorAttrs | ATT_ACTION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_SECURITYL_ABEL OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodingAttrs )? | ATT_PURPOSE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodingAttrs )? | ATT_CLASS OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodingAttrs )? | ATT_CODE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodingAttrs )? | ATT_DATAP_ERIOD DOT fhirPeriodAttrs | ATT_DATA OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExceptDataDataAttrs
	;

fhirConsentAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER DOT fhirIdentifierAttrs | ATT_STATUS | ATT_CATEGORY OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_PATIENT ( DOT fhirReferenceAttrs )? | ATT_PERIOD DOT fhirPeriodAttrs | ATT_DATET_IME | ATT_CONSENTINGP_ARTY OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_ACTOR OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirConsentActorActorAttrs | ATT_ACTION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_ORGANIZATION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_SOURCEA_TTACHMENT DOT fhirAttachmentAttrs | ATT_SOURCEI_DENTIFIER DOT fhirIdentifierAttrs | ATT_SOURCER_EFERENCE ( DOT fhirReferenceAttrs )? | ATT_POLICY OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirConsentPolicyPolicyAttrs | ATT_POLICYR_ULE | ATT_SECURITYL_ABEL OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodingAttrs )? | ATT_PURPOSE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodingAttrs )? | ATT_DATAP_ERIOD DOT fhirPeriodAttrs | ATT_DATA OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirConsentDataDataAttrs | ATT_EXCEPT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirConsentExceptExceptAttrs
	;

fhirContract
	: RES_C_ONTRACT LT ID GT WITH fhirContractAttrs EQ value (COMMA fhirContractAttrs EQ value)* SEMI_COLON
	;

fhirContractAgentAgent
	: RES_AGENT LT ID GT WITH fhirContractAgentAgentAttrs EQ value (COMMA fhirContractAgentAgentAttrs EQ value)* SEMI_COLON
	;

fhirContractAgentAgentAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_ACTOR ( DOT fhirReferenceAttrs )? | ATT_ROLE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )?
	;

fhirContractSignerSigner
	: RES_SIGNER LT ID GT WITH fhirContractSignerSignerAttrs EQ value (COMMA fhirContractSignerSignerAttrs EQ value)* SEMI_COLON
	;

fhirContractSignerSignerAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_TYPE ( DOT fhirCodingAttrs )? | ATT_PARTY ( DOT fhirReferenceAttrs )? | ATT_SIGNATURE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirSignatureAttrs
	;

fhirContractValuedItemValuedItem
	: RES_VALUEDI_TEM LT ID GT WITH fhirContractValuedItemValuedItemAttrs EQ value (COMMA fhirContractValuedItemValuedItemAttrs EQ value)* SEMI_COLON
	;

fhirContractValuedItemValuedItemAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_ENTITYC_ODEABLEC_ONCEPT ( DOT fhirCodeableConceptAttrs )? | ATT_ENTITYR_EFERENCE ( DOT fhirReferenceAttrs )? | ATT_IDENTIFIER DOT fhirIdentifierAttrs | ATT_EFFECTIVET_IME | ATT_QUANTITY DOT fhirQuantityAttrs | ATT_UNITP_RICE DOT fhirMoneyAttrs | ATT_FACTOR | ATT_POINTS | ATT_NET DOT fhirMoneyAttrs
	;

fhirContractTermTerm
	: RES_TERM LT ID GT WITH fhirContractTermTermAttrs EQ value (COMMA fhirContractTermTermAttrs EQ value)* SEMI_COLON
	;

fhirTermAgentAgent
	: RES_AGENT LT ID GT WITH fhirTermAgentAgentAttrs EQ value (COMMA fhirTermAgentAgentAttrs EQ value)* SEMI_COLON
	;

fhirTermAgentAgentAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_ACTOR ( DOT fhirReferenceAttrs )? | ATT_ROLE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )?
	;

fhirTermValuedItemValuedItem
	: RES_VALUEDI_TEM LT ID GT WITH fhirTermValuedItemValuedItemAttrs EQ value (COMMA fhirTermValuedItemValuedItemAttrs EQ value)* SEMI_COLON
	;

fhirTermValuedItemValuedItemAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_ENTITYC_ODEABLEC_ONCEPT ( DOT fhirCodeableConceptAttrs )? | ATT_ENTITYR_EFERENCE ( DOT fhirReferenceAttrs )? | ATT_IDENTIFIER DOT fhirIdentifierAttrs | ATT_EFFECTIVET_IME | ATT_QUANTITY DOT fhirQuantityAttrs | ATT_UNITP_RICE DOT fhirMoneyAttrs | ATT_FACTOR | ATT_POINTS | ATT_NET DOT fhirMoneyAttrs
	;

fhirContractTermTermAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER DOT fhirIdentifierAttrs | ATT_ISSUED | ATT_APPLIES DOT fhirPeriodAttrs | ATT_TYPE ( DOT fhirCodeableConceptAttrs )? | ATT_SUBT_YPE ( DOT fhirCodeableConceptAttrs )? | ATT_TOPIC OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_ACTION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_ACTIONR_EASON OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_SECURITYL_ABEL OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodingAttrs )? | ATT_AGENT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirTermAgentAgentAttrs | ATT_TEXT | ATT_VALUEDI_TEM OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirTermValuedItemValuedItemAttrs
	;

fhirContractFriendlyFriendly
	: RES_FRIENDLY LT ID GT WITH fhirContractFriendlyFriendlyAttrs EQ value (COMMA fhirContractFriendlyFriendlyAttrs EQ value)* SEMI_COLON
	;

fhirContractFriendlyFriendlyAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_CONTENTA_TTACHMENT DOT fhirAttachmentAttrs | ATT_CONTENTR_EFERENCE ( DOT fhirReferenceAttrs )?
	;

fhirContractLegalLegal
	: RES_LEGAL LT ID GT WITH fhirContractLegalLegalAttrs EQ value (COMMA fhirContractLegalLegalAttrs EQ value)* SEMI_COLON
	;

fhirContractLegalLegalAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_CONTENTA_TTACHMENT DOT fhirAttachmentAttrs | ATT_CONTENTR_EFERENCE ( DOT fhirReferenceAttrs )?
	;

fhirContractRuleRule
	: RES_RULE LT ID GT WITH fhirContractRuleRuleAttrs EQ value (COMMA fhirContractRuleRuleAttrs EQ value)* SEMI_COLON
	;

fhirContractRuleRuleAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_CONTENTA_TTACHMENT DOT fhirAttachmentAttrs | ATT_CONTENTR_EFERENCE ( DOT fhirReferenceAttrs )?
	;

fhirContractAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER DOT fhirIdentifierAttrs | ATT_STATUS | ATT_ISSUED | ATT_APPLIES DOT fhirPeriodAttrs | ATT_SUBJECT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_TOPIC OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_AUTHORITY OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_DOMAIN OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_TYPE ( DOT fhirCodeableConceptAttrs )? | ATT_SUBT_YPE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_ACTION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_ACTIONR_EASON OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_DECISIONT_YPE ( DOT fhirCodeableConceptAttrs )? | ATT_CONTENTD_ERIVATIVE ( DOT fhirCodeableConceptAttrs )? | ATT_SECURITYL_ABEL OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodingAttrs )? | ATT_AGENT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirContractAgentAgentAttrs | ATT_SIGNER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirContractSignerSignerAttrs | ATT_VALUEDI_TEM OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirContractValuedItemValuedItemAttrs | ATT_TERM OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirContractTermTermAttrs | ATT_BINDINGA_TTACHMENT DOT fhirAttachmentAttrs | ATT_BINDINGR_EFERENCE ( DOT fhirReferenceAttrs )? | ATT_FRIENDLY OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirContractFriendlyFriendlyAttrs | ATT_LEGAL OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirContractLegalLegalAttrs | ATT_RULE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirContractRuleRuleAttrs
	;

fhirCoverage
	: RES_C_OVERAGE LT ID GT WITH fhirCoverageAttrs EQ value (COMMA fhirCoverageAttrs EQ value)* SEMI_COLON
	;

fhirCoverageGroupingGrouping
	: RES_GROUPING LT ID GT WITH fhirCoverageGroupingGroupingAttrs EQ value (COMMA fhirCoverageGroupingGroupingAttrs EQ value)* SEMI_COLON
	;

fhirCoverageGroupingGroupingAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_GROUP | ATT_GROUPD_ISPLAY | ATT_SUBG_ROUP | ATT_SUBG_ROUPD_ISPLAY | ATT_PLAN | ATT_PLAND_ISPLAY | ATT_SUBP_LAN | ATT_SUBP_LAND_ISPLAY | ATT_CLASS | ATT_CLASSD_ISPLAY | ATT_SUBC_LASS | ATT_SUBC_LASSD_ISPLAY
	;

fhirCoverageAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirIdentifierAttrs | ATT_STATUS | ATT_TYPE ( DOT fhirCodeableConceptAttrs )? | ATT_POLICYH_OLDER ( DOT fhirReferenceAttrs )? | ATT_SUBSCRIBER ( DOT fhirReferenceAttrs )? | ATT_SUBSCRIBERI_D | ATT_BENEFICIARY ( DOT fhirReferenceAttrs )? | ATT_RELATIONSHIP ( DOT fhirCodeableConceptAttrs )? | ATT_PERIOD DOT fhirPeriodAttrs | ATT_PAYOR OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_GROUPING DOT fhirCoverageGroupingGroupingAttrs | ATT_DEPENDENT | ATT_SEQUENCE | ATT_ORDER | ATT_NETWORK | ATT_CONTRACT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )?
	;

fhirDataElement
	: RES_D_ATAE_LEMENT LT ID GT WITH fhirDataElementAttrs EQ value (COMMA fhirDataElementAttrs EQ value)* SEMI_COLON
	;

fhirDataElementMappingMapping
	: RES_MAPPING LT ID GT WITH fhirDataElementMappingMappingAttrs EQ value (COMMA fhirDataElementMappingMappingAttrs EQ value)* SEMI_COLON
	;

fhirDataElementMappingMappingAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTITY | ATT_URI | ATT_NAME | ATT_COMMENT
	;

fhirDataElementAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_URL | ATT_IDENTIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirIdentifierAttrs | ATT_VERSION | ATT_STATUS | ATT_EXPERIMENTAL | ATT_DATE | ATT_PUBLISHER | ATT_NAME | ATT_TITLE | ATT_CONTACT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirContactDetailAttrs | ATT_USEC_ONTEXT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirUsageContextAttrs | ATT_JURISDICTION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_COPYRIGHT | ATT_STRINGENCY | ATT_MAPPING OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirDataElementMappingMappingAttrs | ATT_ELEMENT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirElementDefinitionAttrs
	;

fhirDetectedIssue
	: RES_D_ETECTEDI_SSUE LT ID GT WITH fhirDetectedIssueAttrs EQ value (COMMA fhirDetectedIssueAttrs EQ value)* SEMI_COLON
	;

fhirDetectedIssueMitigationMitigation
	: RES_MITIGATION LT ID GT WITH fhirDetectedIssueMitigationMitigationAttrs EQ value (COMMA fhirDetectedIssueMitigationMitigationAttrs EQ value)* SEMI_COLON
	;

fhirDetectedIssueMitigationMitigationAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_ACTION ( DOT fhirCodeableConceptAttrs )? | ATT_DATE | ATT_AUTHOR ( DOT fhirReferenceAttrs )?
	;

fhirDetectedIssueAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER DOT fhirIdentifierAttrs | ATT_STATUS | ATT_CATEGORY ( DOT fhirCodeableConceptAttrs )? | ATT_SEVERITY | ATT_PATIENT ( DOT fhirReferenceAttrs )? | ATT_DATE | ATT_AUTHOR ( DOT fhirReferenceAttrs )? | ATT_IMPLICATED OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_DETAIL | ATT_REFERENCE | ATT_MITIGATION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirDetectedIssueMitigationMitigationAttrs
	;

fhirDevice
	: RES_D_EVICE LT ID GT WITH fhirDeviceAttrs EQ value (COMMA fhirDeviceAttrs EQ value)* SEMI_COLON
	;

fhirDeviceUdiUdi
	: RES_UDI LT ID GT WITH fhirDeviceUdiUdiAttrs EQ value (COMMA fhirDeviceUdiUdiAttrs EQ value)* SEMI_COLON
	;

fhirDeviceUdiUdiAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_DEVICEI_DENTIFIER | ATT_NAME | ATT_JURISDICTION | ATT_CARRIERH_R_F_ | ATT_CARRIERA_I_D_C_ | ATT_ISSUER | ATT_ENTRYT_YPE
	;

fhirDeviceAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirIdentifierAttrs | ATT_UDI DOT fhirDeviceUdiUdiAttrs | ATT_STATUS | ATT_TYPE ( DOT fhirCodeableConceptAttrs )? | ATT_LOTN_UMBER | ATT_MANUFACTURER | ATT_MANUFACTURED_ATE | ATT_EXPIRATIOND_ATE | ATT_MODEL | ATT_VERSION | ATT_PATIENT ( DOT fhirReferenceAttrs )? | ATT_OWNER ( DOT fhirReferenceAttrs )? | ATT_CONTACT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirContactPointAttrs | ATT_LOCATION ( DOT fhirReferenceAttrs )? | ATT_URL | ATT_NOTE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirAnnotationAttrs | ATT_SAFETY OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )?
	;

fhirDeviceComponent
	: RES_D_EVICEC_OMPONENT LT ID GT WITH fhirDeviceComponentAttrs EQ value (COMMA fhirDeviceComponentAttrs EQ value)* SEMI_COLON
	;

fhirDeviceComponentProductionSpecificationProductionSpecification
	: RES_PRODUCTIONS_PECIFICATION LT ID GT WITH fhirDeviceComponentProductionSpecificationProductionSpecificationAttrs EQ value (COMMA fhirDeviceComponentProductionSpecificationProductionSpecificationAttrs EQ value)* SEMI_COLON
	;

fhirDeviceComponentProductionSpecificationProductionSpecificationAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_SPECT_YPE ( DOT fhirCodeableConceptAttrs )? | ATT_COMPONENTI_D DOT fhirIdentifierAttrs | ATT_PRODUCTIONS_PEC
	;

fhirDeviceComponentAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER DOT fhirIdentifierAttrs | ATT_TYPE ( DOT fhirCodeableConceptAttrs )? | ATT_LASTS_YSTEMC_HANGE | ATT_SOURCE ( DOT fhirReferenceAttrs )? | ATT_PARENT ( DOT fhirReferenceAttrs )? | ATT_OPERATIONALS_TATUS OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_PARAMETERG_ROUP ( DOT fhirCodeableConceptAttrs )? | ATT_MEASUREMENTP_RINCIPLE | ATT_PRODUCTIONS_PECIFICATION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirDeviceComponentProductionSpecificationProductionSpecificationAttrs | ATT_LANGUAGEC_ODE ( DOT fhirCodeableConceptAttrs )?
	;

fhirDeviceMetric
	: RES_D_EVICEM_ETRIC LT ID GT WITH fhirDeviceMetricAttrs EQ value (COMMA fhirDeviceMetricAttrs EQ value)* SEMI_COLON
	;

fhirDeviceMetricCalibrationCalibration
	: RES_CALIBRATION LT ID GT WITH fhirDeviceMetricCalibrationCalibrationAttrs EQ value (COMMA fhirDeviceMetricCalibrationCalibrationAttrs EQ value)* SEMI_COLON
	;

fhirDeviceMetricCalibrationCalibrationAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_TYPE | ATT_STATE | ATT_TIME
	;

fhirDeviceMetricAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER DOT fhirIdentifierAttrs | ATT_TYPE ( DOT fhirCodeableConceptAttrs )? | ATT_UNIT ( DOT fhirCodeableConceptAttrs )? | ATT_SOURCE ( DOT fhirReferenceAttrs )? | ATT_PARENT ( DOT fhirReferenceAttrs )? | ATT_OPERATIONALS_TATUS | ATT_COLOR | ATT_CATEGORY | ATT_MEASUREMENTP_ERIOD DOT fhirTimingAttrs | ATT_CALIBRATION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirDeviceMetricCalibrationCalibrationAttrs
	;

fhirDeviceRequest
	: RES_D_EVICER_EQUEST LT ID GT WITH fhirDeviceRequestAttrs EQ value (COMMA fhirDeviceRequestAttrs EQ value)* SEMI_COLON
	;

fhirDeviceRequestRequesterRequester
	: RES_REQUESTER LT ID GT WITH fhirDeviceRequestRequesterRequesterAttrs EQ value (COMMA fhirDeviceRequestRequesterRequesterAttrs EQ value)* SEMI_COLON
	;

fhirDeviceRequestRequesterRequesterAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_AGENT ( DOT fhirReferenceAttrs )? | ATT_ONB_EHALFO_F ( DOT fhirReferenceAttrs )?
	;

fhirDeviceRequestAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirIdentifierAttrs | ATT_DEFINITION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_BASEDO_N OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_PRIORR_EQUEST OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_GROUPI_DENTIFIER DOT fhirIdentifierAttrs | ATT_STATUS | ATT_INTENT ( DOT fhirCodeableConceptAttrs )? | ATT_PRIORITY | ATT_CODER_EFERENCE ( DOT fhirReferenceAttrs )? | ATT_CODEC_ODEABLEC_ONCEPT ( DOT fhirCodeableConceptAttrs )? | ATT_SUBJECT ( DOT fhirReferenceAttrs )? | ATT_CONTEXT ( DOT fhirReferenceAttrs )? | ATT_OCCURRENCED_ATET_IME | ATT_OCCURRENCEP_ERIOD DOT fhirPeriodAttrs | ATT_OCCURRENCET_IMING DOT fhirTimingAttrs | ATT_AUTHOREDO_N | ATT_REQUESTER DOT fhirDeviceRequestRequesterRequesterAttrs | ATT_PERFORMERT_YPE ( DOT fhirCodeableConceptAttrs )? | ATT_PERFORMER ( DOT fhirReferenceAttrs )? | ATT_REASONC_ODE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_REASONR_EFERENCE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_SUPPORTINGI_NFO OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_NOTE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirAnnotationAttrs | ATT_RELEVANTH_ISTORY OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )?
	;

fhirDeviceUseStatement
	: RES_D_EVICEU_SES_TATEMENT LT ID GT WITH fhirDeviceUseStatementAttrs EQ value (COMMA fhirDeviceUseStatementAttrs EQ value)* SEMI_COLON
	;

fhirDeviceUseStatementAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirIdentifierAttrs | ATT_STATUS | ATT_SUBJECT ( DOT fhirReferenceAttrs )? | ATT_WHENU_SED DOT fhirPeriodAttrs | ATT_TIMINGT_IMING DOT fhirTimingAttrs | ATT_TIMINGP_ERIOD DOT fhirPeriodAttrs | ATT_TIMINGD_ATET_IME | ATT_RECORDEDO_N | ATT_SOURCE ( DOT fhirReferenceAttrs )? | ATT_DEVICE ( DOT fhirReferenceAttrs )? | ATT_INDICATION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_BODYS_ITE ( DOT fhirCodeableConceptAttrs )? | ATT_NOTE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirAnnotationAttrs
	;

fhirDiagnosticReport
	: RES_D_IAGNOSTICR_EPORT LT ID GT WITH fhirDiagnosticReportAttrs EQ value (COMMA fhirDiagnosticReportAttrs EQ value)* SEMI_COLON
	;

fhirDiagnosticReportPerformerPerformer
	: RES_PERFORMER LT ID GT WITH fhirDiagnosticReportPerformerPerformerAttrs EQ value (COMMA fhirDiagnosticReportPerformerPerformerAttrs EQ value)* SEMI_COLON
	;

fhirDiagnosticReportPerformerPerformerAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_ROLE ( DOT fhirCodeableConceptAttrs )? | ATT_ACTOR ( DOT fhirReferenceAttrs )?
	;

fhirDiagnosticReportImageImage
	: RES_IMAGE LT ID GT WITH fhirDiagnosticReportImageImageAttrs EQ value (COMMA fhirDiagnosticReportImageImageAttrs EQ value)* SEMI_COLON
	;

fhirDiagnosticReportImageImageAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_COMMENT | ATT_LINK ( DOT fhirReferenceAttrs )?
	;

fhirDiagnosticReportAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirIdentifierAttrs | ATT_BASEDO_N OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_STATUS | ATT_CATEGORY ( DOT fhirCodeableConceptAttrs )? | ATT_CODE ( DOT fhirCodeableConceptAttrs )? | ATT_SUBJECT ( DOT fhirReferenceAttrs )? | ATT_CONTEXT ( DOT fhirReferenceAttrs )? | ATT_EFFECTIVED_ATET_IME | ATT_EFFECTIVEP_ERIOD DOT fhirPeriodAttrs | ATT_ISSUED | ATT_PERFORMER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirDiagnosticReportPerformerPerformerAttrs | ATT_SPECIMEN OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_RESULT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_IMAGINGS_TUDY OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_IMAGE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirDiagnosticReportImageImageAttrs | ATT_CONCLUSION | ATT_CODEDD_IAGNOSIS OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_PRESENTEDF_ORM OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirAttachmentAttrs
	;

fhirDocumentManifest
	: RES_D_OCUMENTM_ANIFEST LT ID GT WITH fhirDocumentManifestAttrs EQ value (COMMA fhirDocumentManifestAttrs EQ value)* SEMI_COLON
	;

fhirDocumentManifestContentContent
	: RES_CONTENT LT ID GT WITH fhirDocumentManifestContentContentAttrs EQ value (COMMA fhirDocumentManifestContentContentAttrs EQ value)* SEMI_COLON
	;

fhirDocumentManifestContentContentAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_PA_TTACHMENT DOT fhirAttachmentAttrs | ATT_PR_EFERENCE ( DOT fhirReferenceAttrs )?
	;

fhirDocumentManifestRelatedRelated
	: RES_RELATED LT ID GT WITH fhirDocumentManifestRelatedRelatedAttrs EQ value (COMMA fhirDocumentManifestRelatedRelatedAttrs EQ value)* SEMI_COLON
	;

fhirDocumentManifestRelatedRelatedAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER DOT fhirIdentifierAttrs | ATT_REF ( DOT fhirReferenceAttrs )?
	;

fhirDocumentManifestAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MASTERI_DENTIFIER DOT fhirIdentifierAttrs | ATT_IDENTIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirIdentifierAttrs | ATT_STATUS | ATT_TYPE ( DOT fhirCodeableConceptAttrs )? | ATT_SUBJECT ( DOT fhirReferenceAttrs )? | ATT_CREATED | ATT_AUTHOR OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_RECIPIENT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_SOURCE | ATT_DESCRIPTION | ATT_CONTENT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirDocumentManifestContentContentAttrs | ATT_RELATED OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirDocumentManifestRelatedRelatedAttrs
	;

fhirDocumentReference
	: RES_D_OCUMENTR_EFERENCE LT ID GT WITH fhirDocumentReferenceAttrs EQ value (COMMA fhirDocumentReferenceAttrs EQ value)* SEMI_COLON
	;

fhirDocumentReferenceRelatesToRelatesTo
	: RES_RELATEST_O LT ID GT WITH fhirDocumentReferenceRelatesToRelatesToAttrs EQ value (COMMA fhirDocumentReferenceRelatesToRelatesToAttrs EQ value)* SEMI_COLON
	;

fhirDocumentReferenceRelatesToRelatesToAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_CODE | ATT_TARGET ( DOT fhirReferenceAttrs )?
	;

fhirDocumentReferenceContentContent
	: RES_CONTENT LT ID GT WITH fhirDocumentReferenceContentContentAttrs EQ value (COMMA fhirDocumentReferenceContentContentAttrs EQ value)* SEMI_COLON
	;

fhirDocumentReferenceContentContentAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_ATTACHMENT DOT fhirAttachmentAttrs | ATT_FORMAT ( DOT fhirCodingAttrs )?
	;

fhirDocumentReferenceContextContext
	: RES_CONTEXT LT ID GT WITH fhirDocumentReferenceContextContextAttrs EQ value (COMMA fhirDocumentReferenceContextContextAttrs EQ value)* SEMI_COLON
	;

fhirContextRelatedRelated
	: RES_RELATED LT ID GT WITH fhirContextRelatedRelatedAttrs EQ value (COMMA fhirContextRelatedRelatedAttrs EQ value)* SEMI_COLON
	;

fhirContextRelatedRelatedAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER DOT fhirIdentifierAttrs | ATT_REF ( DOT fhirReferenceAttrs )?
	;

fhirDocumentReferenceContextContextAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_ENCOUNTER ( DOT fhirReferenceAttrs )? | ATT_EVENT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_PERIOD DOT fhirPeriodAttrs | ATT_FACILITYT_YPE ( DOT fhirCodeableConceptAttrs )? | ATT_PRACTICES_ETTING ( DOT fhirCodeableConceptAttrs )? | ATT_SOURCEP_ATIENTI_NFO ( DOT fhirReferenceAttrs )? | ATT_RELATED OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirContextRelatedRelatedAttrs
	;

fhirDocumentReferenceAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MASTERI_DENTIFIER DOT fhirIdentifierAttrs | ATT_IDENTIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirIdentifierAttrs | ATT_STATUS | ATT_DOCS_TATUS | ATT_TYPE ( DOT fhirCodeableConceptAttrs )? | ATT_CLASS ( DOT fhirCodeableConceptAttrs )? | ATT_SUBJECT ( DOT fhirReferenceAttrs )? | ATT_CREATED | ATT_INDEXED | ATT_AUTHOR OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_AUTHENTICATOR ( DOT fhirReferenceAttrs )? | ATT_CUSTODIAN ( DOT fhirReferenceAttrs )? | ATT_RELATEST_O OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirDocumentReferenceRelatesToRelatesToAttrs | ATT_DESCRIPTION | ATT_SECURITYL_ABEL OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_CONTENT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirDocumentReferenceContentContentAttrs | ATT_CONTEXT DOT fhirDocumentReferenceContextContextAttrs
	;

fhirEligibilityRequest
	: RES_E_LIGIBILITYR_EQUEST LT ID GT WITH fhirEligibilityRequestAttrs EQ value (COMMA fhirEligibilityRequestAttrs EQ value)* SEMI_COLON
	;

fhirEligibilityRequestAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirIdentifierAttrs | ATT_STATUS | ATT_PRIORITY ( DOT fhirCodeableConceptAttrs )? | ATT_PATIENT ( DOT fhirReferenceAttrs )? | ATT_SERVICEDD_ATE | ATT_SERVICEDP_ERIOD DOT fhirPeriodAttrs | ATT_CREATED | ATT_ENTERER ( DOT fhirReferenceAttrs )? | ATT_PROVIDER ( DOT fhirReferenceAttrs )? | ATT_ORGANIZATION ( DOT fhirReferenceAttrs )? | ATT_INSURER ( DOT fhirReferenceAttrs )? | ATT_FACILITY ( DOT fhirReferenceAttrs )? | ATT_COVERAGE ( DOT fhirReferenceAttrs )? | ATT_BUSINESSA_RRANGEMENT | ATT_BENEFITC_ATEGORY ( DOT fhirCodeableConceptAttrs )? | ATT_BENEFITS_UBC_ATEGORY ( DOT fhirCodeableConceptAttrs )?
	;

fhirEligibilityResponse
	: RES_E_LIGIBILITYR_ESPONSE LT ID GT WITH fhirEligibilityResponseAttrs EQ value (COMMA fhirEligibilityResponseAttrs EQ value)* SEMI_COLON
	;

fhirEligibilityResponseInsuranceInsurance
	: RES_INSURANCE LT ID GT WITH fhirEligibilityResponseInsuranceInsuranceAttrs EQ value (COMMA fhirEligibilityResponseInsuranceInsuranceAttrs EQ value)* SEMI_COLON
	;

fhirInsuranceBenefitBalanceBenefitBalance
	: RES_BENEFITB_ALANCE LT ID GT WITH fhirInsuranceBenefitBalanceBenefitBalanceAttrs EQ value (COMMA fhirInsuranceBenefitBalanceBenefitBalanceAttrs EQ value)* SEMI_COLON
	;

fhirBenefitBalanceFinancialFinancial
	: RES_FINANCIAL LT ID GT WITH fhirBenefitBalanceFinancialFinancialAttrs EQ value (COMMA fhirBenefitBalanceFinancialFinancialAttrs EQ value)* SEMI_COLON
	;

fhirBenefitBalanceFinancialFinancialAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_TYPE ( DOT fhirCodeableConceptAttrs )? | ATT_ALLOWEDU_NSIGNEDI_NT | ATT_ALLOWEDS_TRING | ATT_ALLOWEDM_ONEY DOT fhirMoneyAttrs | ATT_USEDU_NSIGNEDI_NT | ATT_USEDM_ONEY DOT fhirMoneyAttrs
	;

fhirInsuranceBenefitBalanceBenefitBalanceAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_CATEGORY ( DOT fhirCodeableConceptAttrs )? | ATT_SUBC_ATEGORY ( DOT fhirCodeableConceptAttrs )? | ATT_EXCLUDED | ATT_NAME | ATT_DESCRIPTION | ATT_NETWORK ( DOT fhirCodeableConceptAttrs )? | ATT_UNIT ( DOT fhirCodeableConceptAttrs )? | ATT_TERM ( DOT fhirCodeableConceptAttrs )? | ATT_FINANCIAL OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirBenefitBalanceFinancialFinancialAttrs
	;

fhirEligibilityResponseInsuranceInsuranceAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_COVERAGE ( DOT fhirReferenceAttrs )? | ATT_CONTRACT ( DOT fhirReferenceAttrs )? | ATT_BENEFITB_ALANCE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirInsuranceBenefitBalanceBenefitBalanceAttrs
	;

fhirEligibilityResponseErrorError
	: RES_ERROR LT ID GT WITH fhirEligibilityResponseErrorErrorAttrs EQ value (COMMA fhirEligibilityResponseErrorErrorAttrs EQ value)* SEMI_COLON
	;

fhirEligibilityResponseErrorErrorAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_CODE ( DOT fhirCodeableConceptAttrs )?
	;

fhirEligibilityResponseAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirIdentifierAttrs | ATT_STATUS | ATT_CREATED | ATT_REQUESTP_ROVIDER ( DOT fhirReferenceAttrs )? | ATT_REQUESTO_RGANIZATION ( DOT fhirReferenceAttrs )? | ATT_REQUEST ( DOT fhirReferenceAttrs )? | ATT_OUTCOME ( DOT fhirCodeableConceptAttrs )? | ATT_DISPOSITION | ATT_INSURER ( DOT fhirReferenceAttrs )? | ATT_INFORCE | ATT_INSURANCE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirEligibilityResponseInsuranceInsuranceAttrs | ATT_FORM ( DOT fhirCodeableConceptAttrs )? | ATT_ERROR OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirEligibilityResponseErrorErrorAttrs
	;

fhirEncounter
	: RES_E_NCOUNTER LT ID GT WITH fhirEncounterAttrs EQ value (COMMA fhirEncounterAttrs EQ value)* SEMI_COLON
	;

fhirEncounterStatusHistoryStatusHistory
	: RES_STATUSH_ISTORY LT ID GT WITH fhirEncounterStatusHistoryStatusHistoryAttrs EQ value (COMMA fhirEncounterStatusHistoryStatusHistoryAttrs EQ value)* SEMI_COLON
	;

fhirEncounterStatusHistoryStatusHistoryAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_STATUS | ATT_PERIOD DOT fhirPeriodAttrs
	;

fhirEncounterClassHistoryClassHistory
	: RES_CLASSH_ISTORY LT ID GT WITH fhirEncounterClassHistoryClassHistoryAttrs EQ value (COMMA fhirEncounterClassHistoryClassHistoryAttrs EQ value)* SEMI_COLON
	;

fhirEncounterClassHistoryClassHistoryAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_CLASS ( DOT fhirCodingAttrs )? | ATT_PERIOD DOT fhirPeriodAttrs
	;

fhirEncounterParticipantParticipant
	: RES_PARTICIPANT LT ID GT WITH fhirEncounterParticipantParticipantAttrs EQ value (COMMA fhirEncounterParticipantParticipantAttrs EQ value)* SEMI_COLON
	;

fhirEncounterParticipantParticipantAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_TYPE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_PERIOD DOT fhirPeriodAttrs | ATT_INDIVIDUAL ( DOT fhirReferenceAttrs )?
	;

fhirEncounterDiagnosisDiagnosis
	: RES_DIAGNOSIS LT ID GT WITH fhirEncounterDiagnosisDiagnosisAttrs EQ value (COMMA fhirEncounterDiagnosisDiagnosisAttrs EQ value)* SEMI_COLON
	;

fhirEncounterDiagnosisDiagnosisAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_CONDITION ( DOT fhirReferenceAttrs )? | ATT_ROLE ( DOT fhirCodeableConceptAttrs )? | ATT_RANK
	;

fhirEncounterHospitalizationHospitalization
	: RES_HOSPITALIZATION LT ID GT WITH fhirEncounterHospitalizationHospitalizationAttrs EQ value (COMMA fhirEncounterHospitalizationHospitalizationAttrs EQ value)* SEMI_COLON
	;

fhirEncounterHospitalizationHospitalizationAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_PREA_DMISSIONI_DENTIFIER DOT fhirIdentifierAttrs | ATT_ORIGIN ( DOT fhirReferenceAttrs )? | ATT_ADMITS_OURCE ( DOT fhirCodeableConceptAttrs )? | ATT_REA_DMISSION ( DOT fhirCodeableConceptAttrs )? | ATT_DIETP_REFERENCE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_SPECIALC_OURTESY OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_SPECIALA_RRANGEMENT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_DESTINATION ( DOT fhirReferenceAttrs )? | ATT_DISCHARGED_ISPOSITION ( DOT fhirCodeableConceptAttrs )?
	;

fhirEncounterLocationLocation
	: RES_LOCATION LT ID GT WITH fhirEncounterLocationLocationAttrs EQ value (COMMA fhirEncounterLocationLocationAttrs EQ value)* SEMI_COLON
	;

fhirEncounterLocationLocationAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_LOCATION ( DOT fhirReferenceAttrs )? | ATT_STATUS | ATT_PERIOD DOT fhirPeriodAttrs
	;

fhirEncounterAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirIdentifierAttrs | ATT_STATUS | ATT_STATUSH_ISTORY OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirEncounterStatusHistoryStatusHistoryAttrs | ATT_CLASS ( DOT fhirCodingAttrs )? | ATT_CLASSH_ISTORY OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirEncounterClassHistoryClassHistoryAttrs | ATT_TYPE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_PRIORITY ( DOT fhirCodeableConceptAttrs )? | ATT_SUBJECT ( DOT fhirReferenceAttrs )? | ATT_EPISODEO_FC_ARE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_INCOMINGR_EFERRAL OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_PARTICIPANT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirEncounterParticipantParticipantAttrs | ATT_APPOINTMENT ( DOT fhirReferenceAttrs )? | ATT_PERIOD DOT fhirPeriodAttrs | ATT_LENGTH DOT fhirDurationAttrs | ATT_REASON OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_DIAGNOSIS OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirEncounterDiagnosisDiagnosisAttrs | ATT_ACCOUNT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_HOSPITALIZATION DOT fhirEncounterHospitalizationHospitalizationAttrs | ATT_LOCATION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirEncounterLocationLocationAttrs | ATT_SERVICEP_ROVIDER ( DOT fhirReferenceAttrs )? | ATT_PARTO_F ( DOT fhirReferenceAttrs )?
	;

fhirEndpoint
	: RES_E_NDPOINT LT ID GT WITH fhirEndpointAttrs EQ value (COMMA fhirEndpointAttrs EQ value)* SEMI_COLON
	;

fhirEndpointAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirIdentifierAttrs | ATT_STATUS | ATT_CONNECTIONT_YPE ( DOT fhirCodingAttrs )? | ATT_NAME | ATT_MANAGINGO_RGANIZATION ( DOT fhirReferenceAttrs )? | ATT_CONTACT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirContactPointAttrs | ATT_PERIOD DOT fhirPeriodAttrs | ATT_PAYLOADT_YPE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_PAYLOADM_IMET_YPE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE | ATT_ADDRESS | ATT_HEADER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE
	;

fhirEnrollmentRequest
	: RES_E_NROLLMENTR_EQUEST LT ID GT WITH fhirEnrollmentRequestAttrs EQ value (COMMA fhirEnrollmentRequestAttrs EQ value)* SEMI_COLON
	;

fhirEnrollmentRequestAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirIdentifierAttrs | ATT_STATUS | ATT_CREATED | ATT_INSURER ( DOT fhirReferenceAttrs )? | ATT_PROVIDER ( DOT fhirReferenceAttrs )? | ATT_ORGANIZATION ( DOT fhirReferenceAttrs )? | ATT_SUBJECT ( DOT fhirReferenceAttrs )? | ATT_COVERAGE ( DOT fhirReferenceAttrs )?
	;

fhirEnrollmentResponse
	: RES_E_NROLLMENTR_ESPONSE LT ID GT WITH fhirEnrollmentResponseAttrs EQ value (COMMA fhirEnrollmentResponseAttrs EQ value)* SEMI_COLON
	;

fhirEnrollmentResponseAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirIdentifierAttrs | ATT_STATUS | ATT_REQUEST ( DOT fhirReferenceAttrs )? | ATT_OUTCOME ( DOT fhirCodeableConceptAttrs )? | ATT_DISPOSITION | ATT_CREATED | ATT_ORGANIZATION ( DOT fhirReferenceAttrs )? | ATT_REQUESTP_ROVIDER ( DOT fhirReferenceAttrs )? | ATT_REQUESTO_RGANIZATION ( DOT fhirReferenceAttrs )?
	;

fhirEpisodeOfCare
	: RES_E_PISODEO_FC_ARE LT ID GT WITH fhirEpisodeOfCareAttrs EQ value (COMMA fhirEpisodeOfCareAttrs EQ value)* SEMI_COLON
	;

fhirEpisodeOfCareStatusHistoryStatusHistory
	: RES_STATUSH_ISTORY LT ID GT WITH fhirEpisodeOfCareStatusHistoryStatusHistoryAttrs EQ value (COMMA fhirEpisodeOfCareStatusHistoryStatusHistoryAttrs EQ value)* SEMI_COLON
	;

fhirEpisodeOfCareStatusHistoryStatusHistoryAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_STATUS | ATT_PERIOD DOT fhirPeriodAttrs
	;

fhirEpisodeOfCareDiagnosisDiagnosis
	: RES_DIAGNOSIS LT ID GT WITH fhirEpisodeOfCareDiagnosisDiagnosisAttrs EQ value (COMMA fhirEpisodeOfCareDiagnosisDiagnosisAttrs EQ value)* SEMI_COLON
	;

fhirEpisodeOfCareDiagnosisDiagnosisAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_CONDITION ( DOT fhirReferenceAttrs )? | ATT_ROLE ( DOT fhirCodeableConceptAttrs )? | ATT_RANK
	;

fhirEpisodeOfCareAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirIdentifierAttrs | ATT_STATUS | ATT_STATUSH_ISTORY OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirEpisodeOfCareStatusHistoryStatusHistoryAttrs | ATT_TYPE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_DIAGNOSIS OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirEpisodeOfCareDiagnosisDiagnosisAttrs | ATT_PATIENT ( DOT fhirReferenceAttrs )? | ATT_MANAGINGO_RGANIZATION ( DOT fhirReferenceAttrs )? | ATT_PERIOD DOT fhirPeriodAttrs | ATT_REFERRALR_EQUEST OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_CAREM_ANAGER ( DOT fhirReferenceAttrs )? | ATT_TEAM OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_ACCOUNT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )?
	;

fhirExpansionProfile
	: RES_E_XPANSIONP_ROFILE LT ID GT WITH fhirExpansionProfileAttrs EQ value (COMMA fhirExpansionProfileAttrs EQ value)* SEMI_COLON
	;

fhirExpansionProfileFixedVersionFixedVersion
	: RES_FIXEDV_ERSION LT ID GT WITH fhirExpansionProfileFixedVersionFixedVersionAttrs EQ value (COMMA fhirExpansionProfileFixedVersionFixedVersionAttrs EQ value)* SEMI_COLON
	;

fhirExpansionProfileFixedVersionFixedVersionAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_SYSTEM | ATT_VERSION | ATT_MODE
	;

fhirExpansionProfileExcludedSystemExcludedSystem
	: RES_EXCLUDEDS_YSTEM LT ID GT WITH fhirExpansionProfileExcludedSystemExcludedSystemAttrs EQ value (COMMA fhirExpansionProfileExcludedSystemExcludedSystemAttrs EQ value)* SEMI_COLON
	;

fhirExpansionProfileExcludedSystemExcludedSystemAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_SYSTEM | ATT_VERSION
	;

fhirExpansionProfileDesignationDesignation
	: RES_DESIGNATION LT ID GT WITH fhirExpansionProfileDesignationDesignationAttrs EQ value (COMMA fhirExpansionProfileDesignationDesignationAttrs EQ value)* SEMI_COLON
	;

fhirDesignationIncludeInclude
	: RES_INCLUDE LT ID GT WITH fhirDesignationIncludeIncludeAttrs EQ value (COMMA fhirDesignationIncludeIncludeAttrs EQ value)* SEMI_COLON
	;

fhirIncludeDesignationDesignation
	: RES_DESIGNATION LT ID GT WITH fhirIncludeDesignationDesignationAttrs EQ value (COMMA fhirIncludeDesignationDesignationAttrs EQ value)* SEMI_COLON
	;

fhirIncludeDesignationDesignationAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_LANGUAGE | ATT_USE ( DOT fhirCodingAttrs )?
	;

fhirDesignationIncludeIncludeAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_DESIGNATION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirIncludeDesignationDesignationAttrs
	;

fhirDesignationExcludeExclude
	: RES_EXCLUDE LT ID GT WITH fhirDesignationExcludeExcludeAttrs EQ value (COMMA fhirDesignationExcludeExcludeAttrs EQ value)* SEMI_COLON
	;

fhirExcludeDesignationDesignation
	: RES_DESIGNATION LT ID GT WITH fhirExcludeDesignationDesignationAttrs EQ value (COMMA fhirExcludeDesignationDesignationAttrs EQ value)* SEMI_COLON
	;

fhirExcludeDesignationDesignationAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_LANGUAGE | ATT_USE ( DOT fhirCodingAttrs )?
	;

fhirDesignationExcludeExcludeAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_DESIGNATION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExcludeDesignationDesignationAttrs
	;

fhirExpansionProfileDesignationDesignationAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_INCLUDE DOT fhirDesignationIncludeIncludeAttrs | ATT_EXCLUDE DOT fhirDesignationExcludeExcludeAttrs
	;

fhirExpansionProfileAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_URL | ATT_IDENTIFIER DOT fhirIdentifierAttrs | ATT_VERSION | ATT_NAME | ATT_STATUS | ATT_EXPERIMENTAL | ATT_DATE | ATT_PUBLISHER | ATT_CONTACT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirContactDetailAttrs | ATT_DESCRIPTION | ATT_USEC_ONTEXT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirUsageContextAttrs | ATT_JURISDICTION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_FIXEDV_ERSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExpansionProfileFixedVersionFixedVersionAttrs | ATT_EXCLUDEDS_YSTEM DOT fhirExpansionProfileExcludedSystemExcludedSystemAttrs | ATT_INCLUDED_ESIGNATIONS | ATT_DESIGNATION DOT fhirExpansionProfileDesignationDesignationAttrs | ATT_INCLUDED_EFINITION | ATT_ACTIVEO_NLY | ATT_EXCLUDEN_ESTED | ATT_EXCLUDEN_OTF_ORU_I_ | ATT_EXCLUDEP_OSTC_OORDINATED | ATT_DISPLAYL_ANGUAGE | ATT_LIMITEDE_XPANSION
	;

fhirExplanationOfBenefit
	: RES_E_XPLANATIONO_FB_ENEFIT LT ID GT WITH fhirExplanationOfBenefitAttrs EQ value (COMMA fhirExplanationOfBenefitAttrs EQ value)* SEMI_COLON
	;

fhirExplanationOfBenefitRelatedRelated
	: RES_RELATED LT ID GT WITH fhirExplanationOfBenefitRelatedRelatedAttrs EQ value (COMMA fhirExplanationOfBenefitRelatedRelatedAttrs EQ value)* SEMI_COLON
	;

fhirExplanationOfBenefitRelatedRelatedAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_CLAIM ( DOT fhirReferenceAttrs )? | ATT_RELATIONSHIP ( DOT fhirCodeableConceptAttrs )? | ATT_REFERENCE DOT fhirIdentifierAttrs
	;

fhirExplanationOfBenefitPayeePayee
	: RES_PAYEE LT ID GT WITH fhirExplanationOfBenefitPayeePayeeAttrs EQ value (COMMA fhirExplanationOfBenefitPayeePayeeAttrs EQ value)* SEMI_COLON
	;

fhirExplanationOfBenefitPayeePayeeAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_TYPE ( DOT fhirCodeableConceptAttrs )? | ATT_RESOURCET_YPE ( DOT fhirCodeableConceptAttrs )? | ATT_PARTY ( DOT fhirReferenceAttrs )?
	;

fhirExplanationOfBenefitInformationInformation
	: RES_INFORMATION LT ID GT WITH fhirExplanationOfBenefitInformationInformationAttrs EQ value (COMMA fhirExplanationOfBenefitInformationInformationAttrs EQ value)* SEMI_COLON
	;

fhirExplanationOfBenefitInformationInformationAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_SEQUENCE | ATT_CATEGORY ( DOT fhirCodeableConceptAttrs )? | ATT_CODE ( DOT fhirCodeableConceptAttrs )? | ATT_TIMINGD_ATE | ATT_TIMINGP_ERIOD DOT fhirPeriodAttrs | ATT_VALUES_TRING | ATT_VALUEQ_UANTITY DOT fhirQuantityAttrs | ATT_VALUEA_TTACHMENT DOT fhirAttachmentAttrs | ATT_VALUER_EFERENCE ( DOT fhirReferenceAttrs )? | ATT_REASON ( DOT fhirCodingAttrs )?
	;

fhirExplanationOfBenefitCareTeamCareTeam
	: RES_CARET_EAM LT ID GT WITH fhirExplanationOfBenefitCareTeamCareTeamAttrs EQ value (COMMA fhirExplanationOfBenefitCareTeamCareTeamAttrs EQ value)* SEMI_COLON
	;

fhirExplanationOfBenefitCareTeamCareTeamAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_SEQUENCE | ATT_PROVIDER ( DOT fhirReferenceAttrs )? | ATT_RESPONSIBLE | ATT_ROLE ( DOT fhirCodeableConceptAttrs )? | ATT_QUALIFICATION ( DOT fhirCodeableConceptAttrs )?
	;

fhirExplanationOfBenefitDiagnosisDiagnosis
	: RES_DIAGNOSIS LT ID GT WITH fhirExplanationOfBenefitDiagnosisDiagnosisAttrs EQ value (COMMA fhirExplanationOfBenefitDiagnosisDiagnosisAttrs EQ value)* SEMI_COLON
	;

fhirExplanationOfBenefitDiagnosisDiagnosisAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_SEQUENCE | ATT_DIAGNOSISC_ODEABLEC_ONCEPT ( DOT fhirCodeableConceptAttrs )? | ATT_DIAGNOSISR_EFERENCE ( DOT fhirReferenceAttrs )? | ATT_TYPE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_PACKAGEC_ODE ( DOT fhirCodeableConceptAttrs )?
	;

fhirExplanationOfBenefitProcedureProcedure
	: RES_PROCEDURE LT ID GT WITH fhirExplanationOfBenefitProcedureProcedureAttrs EQ value (COMMA fhirExplanationOfBenefitProcedureProcedureAttrs EQ value)* SEMI_COLON
	;

fhirExplanationOfBenefitProcedureProcedureAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_SEQUENCE | ATT_DATE | ATT_PROCEDUREC_ODEABLEC_ONCEPT ( DOT fhirCodeableConceptAttrs )? | ATT_PROCEDURER_EFERENCE ( DOT fhirReferenceAttrs )?
	;

fhirExplanationOfBenefitInsuranceInsurance
	: RES_INSURANCE LT ID GT WITH fhirExplanationOfBenefitInsuranceInsuranceAttrs EQ value (COMMA fhirExplanationOfBenefitInsuranceInsuranceAttrs EQ value)* SEMI_COLON
	;

fhirExplanationOfBenefitInsuranceInsuranceAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_COVERAGE ( DOT fhirReferenceAttrs )? | ATT_PREA_UTHR_EF OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE
	;

fhirExplanationOfBenefitAccidentAccident
	: RES_ACCIDENT LT ID GT WITH fhirExplanationOfBenefitAccidentAccidentAttrs EQ value (COMMA fhirExplanationOfBenefitAccidentAccidentAttrs EQ value)* SEMI_COLON
	;

fhirExplanationOfBenefitAccidentAccidentAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_DATE | ATT_TYPE ( DOT fhirCodeableConceptAttrs )? | ATT_LOCATIONA_DDRESS DOT fhirAddressAttrs | ATT_LOCATIONR_EFERENCE ( DOT fhirReferenceAttrs )?
	;

fhirExplanationOfBenefitItemItem
	: RES_ITEM LT ID GT WITH fhirExplanationOfBenefitItemItemAttrs EQ value (COMMA fhirExplanationOfBenefitItemItemAttrs EQ value)* SEMI_COLON
	;

fhirExplanationOfBenefitItemItemAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_SEQUENCE | ATT_CARET_EAML_INKI_D OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE | ATT_DIAGNOSISL_INKI_D OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE | ATT_PROCEDUREL_INKI_D OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE | ATT_INFORMATIONL_INKI_D OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE | ATT_REVENUE ( DOT fhirCodeableConceptAttrs )? | ATT_CATEGORY ( DOT fhirCodeableConceptAttrs )? | ATT_SERVICE ( DOT fhirCodeableConceptAttrs )? | ATT_MODIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_PROGRAMC_ODE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_SERVICEDD_ATE | ATT_SERVICEDP_ERIOD DOT fhirPeriodAttrs | ATT_LOCATIONC_ODEABLEC_ONCEPT ( DOT fhirCodeableConceptAttrs )? | ATT_LOCATIONA_DDRESS DOT fhirAddressAttrs | ATT_LOCATIONR_EFERENCE ( DOT fhirReferenceAttrs )? | ATT_QUANTITY DOT fhirQuantityAttrs | ATT_UNITP_RICE DOT fhirMoneyAttrs | ATT_FACTOR | ATT_NET DOT fhirMoneyAttrs | ATT_UDI OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_BODYS_ITE ( DOT fhirCodeableConceptAttrs )? | ATT_SUBS_ITE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_ENCOUNTER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_NOTEN_UMBER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE | ATT_ADJUDICATION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirItemAdjudicationAdjudicationAttrs | ATT_DETAIL OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirItemDetailDetailAttrs
	;

fhirExplanationOfBenefitAddItemAddItem
	: RES_ADDI_TEM LT ID GT WITH fhirExplanationOfBenefitAddItemAddItemAttrs EQ value (COMMA fhirExplanationOfBenefitAddItemAddItemAttrs EQ value)* SEMI_COLON
	;

fhirExplanationOfBenefitAddItemAddItemAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_SEQUENCEL_INKI_D OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE | ATT_REVENUE ( DOT fhirCodeableConceptAttrs )? | ATT_CATEGORY ( DOT fhirCodeableConceptAttrs )? | ATT_SERVICE ( DOT fhirCodeableConceptAttrs )? | ATT_MODIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_FEE DOT fhirMoneyAttrs | ATT_NOTEN_UMBER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE | ATT_DETAIL OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirAddItemDetailDetailAttrs
	;

fhirExplanationOfBenefitPaymentPayment
	: RES_PAYMENT LT ID GT WITH fhirExplanationOfBenefitPaymentPaymentAttrs EQ value (COMMA fhirExplanationOfBenefitPaymentPaymentAttrs EQ value)* SEMI_COLON
	;

fhirExplanationOfBenefitPaymentPaymentAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_TYPE ( DOT fhirCodeableConceptAttrs )? | ATT_ADJUSTMENT DOT fhirMoneyAttrs | ATT_ADJUSTMENTR_EASON ( DOT fhirCodeableConceptAttrs )? | ATT_DATE | ATT_AMOUNT DOT fhirMoneyAttrs | ATT_IDENTIFIER DOT fhirIdentifierAttrs
	;

fhirExplanationOfBenefitProcessNoteProcessNote
	: RES_PROCESSN_OTE LT ID GT WITH fhirExplanationOfBenefitProcessNoteProcessNoteAttrs EQ value (COMMA fhirExplanationOfBenefitProcessNoteProcessNoteAttrs EQ value)* SEMI_COLON
	;

fhirExplanationOfBenefitProcessNoteProcessNoteAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_NUMBER | ATT_TYPE ( DOT fhirCodeableConceptAttrs )? | ATT_TEXT | ATT_LANGUAGE ( DOT fhirCodeableConceptAttrs )?
	;

fhirExplanationOfBenefitBenefitBalanceBenefitBalance
	: RES_BENEFITB_ALANCE LT ID GT WITH fhirExplanationOfBenefitBenefitBalanceBenefitBalanceAttrs EQ value (COMMA fhirExplanationOfBenefitBenefitBalanceBenefitBalanceAttrs EQ value)* SEMI_COLON
	;

fhirExplanationOfBenefitBenefitBalanceBenefitBalanceAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_CATEGORY ( DOT fhirCodeableConceptAttrs )? | ATT_SUBC_ATEGORY ( DOT fhirCodeableConceptAttrs )? | ATT_EXCLUDED | ATT_NAME | ATT_DESCRIPTION | ATT_NETWORK ( DOT fhirCodeableConceptAttrs )? | ATT_UNIT ( DOT fhirCodeableConceptAttrs )? | ATT_TERM ( DOT fhirCodeableConceptAttrs )? | ATT_FINANCIAL OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirBenefitBalanceFinancialFinancialAttrs
	;

fhirExplanationOfBenefitAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirIdentifierAttrs | ATT_STATUS | ATT_TYPE ( DOT fhirCodeableConceptAttrs )? | ATT_SUBT_YPE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_PATIENT ( DOT fhirReferenceAttrs )? | ATT_BILLABLEP_ERIOD DOT fhirPeriodAttrs | ATT_CREATED | ATT_ENTERER ( DOT fhirReferenceAttrs )? | ATT_INSURER ( DOT fhirReferenceAttrs )? | ATT_PROVIDER ( DOT fhirReferenceAttrs )? | ATT_ORGANIZATION ( DOT fhirReferenceAttrs )? | ATT_REFERRAL ( DOT fhirReferenceAttrs )? | ATT_FACILITY ( DOT fhirReferenceAttrs )? | ATT_CLAIM ( DOT fhirReferenceAttrs )? | ATT_CLAIMR_ESPONSE ( DOT fhirReferenceAttrs )? | ATT_OUTCOME ( DOT fhirCodeableConceptAttrs )? | ATT_DISPOSITION | ATT_RELATED OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExplanationOfBenefitRelatedRelatedAttrs | ATT_PRESCRIPTION ( DOT fhirReferenceAttrs )? | ATT_ORIGINALP_RESCRIPTION ( DOT fhirReferenceAttrs )? | ATT_PAYEE DOT fhirExplanationOfBenefitPayeePayeeAttrs | ATT_INFORMATION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExplanationOfBenefitInformationInformationAttrs | ATT_CARET_EAM OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExplanationOfBenefitCareTeamCareTeamAttrs | ATT_DIAGNOSIS OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExplanationOfBenefitDiagnosisDiagnosisAttrs | ATT_PROCEDURE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExplanationOfBenefitProcedureProcedureAttrs | ATT_PRECEDENCE | ATT_INSURANCE DOT fhirExplanationOfBenefitInsuranceInsuranceAttrs | ATT_ACCIDENT DOT fhirExplanationOfBenefitAccidentAccidentAttrs | ATT_EMPLOYMENTI_MPACTED DOT fhirPeriodAttrs | ATT_HOSPITALIZATION DOT fhirPeriodAttrs | ATT_ITEM OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExplanationOfBenefitItemItemAttrs | ATT_ADDI_TEM OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExplanationOfBenefitAddItemAddItemAttrs | ATT_TOTALC_OST DOT fhirMoneyAttrs | ATT_UNALLOCD_EDUCTABLE DOT fhirMoneyAttrs | ATT_TOTALB_ENEFIT DOT fhirMoneyAttrs | ATT_PAYMENT DOT fhirExplanationOfBenefitPaymentPaymentAttrs | ATT_FORM ( DOT fhirCodeableConceptAttrs )? | ATT_PROCESSN_OTE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExplanationOfBenefitProcessNoteProcessNoteAttrs | ATT_BENEFITB_ALANCE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExplanationOfBenefitBenefitBalanceBenefitBalanceAttrs
	;

fhirFamilyMemberHistory
	: RES_F_AMILYM_EMBERH_ISTORY LT ID GT WITH fhirFamilyMemberHistoryAttrs EQ value (COMMA fhirFamilyMemberHistoryAttrs EQ value)* SEMI_COLON
	;

fhirFamilyMemberHistoryConditionCondition
	: RES_CONDITION LT ID GT WITH fhirFamilyMemberHistoryConditionConditionAttrs EQ value (COMMA fhirFamilyMemberHistoryConditionConditionAttrs EQ value)* SEMI_COLON
	;

fhirFamilyMemberHistoryConditionConditionAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_CODE ( DOT fhirCodeableConceptAttrs )? | ATT_OUTCOME ( DOT fhirCodeableConceptAttrs )? | ATT_ONSETA_GE DOT fhirAgeAttrs | ATT_ONSETR_ANGE DOT fhirRangeAttrs | ATT_ONSETP_ERIOD DOT fhirPeriodAttrs | ATT_ONSETS_TRING | ATT_NOTE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirAnnotationAttrs
	;

fhirFamilyMemberHistoryAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirIdentifierAttrs | ATT_DEFINITION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_STATUS | ATT_NOTD_ONE | ATT_NOTD_ONER_EASON ( DOT fhirCodeableConceptAttrs )? | ATT_PATIENT ( DOT fhirReferenceAttrs )? | ATT_DATE | ATT_NAME | ATT_RELATIONSHIP ( DOT fhirCodeableConceptAttrs )? | ATT_GENDER | ATT_BORNP_ERIOD DOT fhirPeriodAttrs | ATT_BORND_ATE | ATT_BORNS_TRING | ATT_AGEA_GE DOT fhirAgeAttrs | ATT_AGER_ANGE DOT fhirRangeAttrs | ATT_AGES_TRING | ATT_ESTIMATEDA_GE | ATT_DECEASEDB_OOLEAN | ATT_DECEASEDA_GE DOT fhirAgeAttrs | ATT_DECEASEDR_ANGE DOT fhirRangeAttrs | ATT_DECEASEDD_ATE | ATT_DECEASEDS_TRING | ATT_REASONC_ODE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_REASONR_EFERENCE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_NOTE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirAnnotationAttrs | ATT_CONDITION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirFamilyMemberHistoryConditionConditionAttrs
	;

fhirFlag
	: RES_F_LAG LT ID GT WITH fhirFlagAttrs EQ value (COMMA fhirFlagAttrs EQ value)* SEMI_COLON
	;

fhirFlagAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirIdentifierAttrs | ATT_STATUS | ATT_CATEGORY ( DOT fhirCodeableConceptAttrs )? | ATT_CODE ( DOT fhirCodeableConceptAttrs )? | ATT_SUBJECT ( DOT fhirReferenceAttrs )? | ATT_PERIOD DOT fhirPeriodAttrs | ATT_ENCOUNTER ( DOT fhirReferenceAttrs )? | ATT_AUTHOR ( DOT fhirReferenceAttrs )?
	;

fhirGoal
	: RES_G_OAL LT ID GT WITH fhirGoalAttrs EQ value (COMMA fhirGoalAttrs EQ value)* SEMI_COLON
	;

fhirGoalTargetTarget
	: RES_TARGET LT ID GT WITH fhirGoalTargetTargetAttrs EQ value (COMMA fhirGoalTargetTargetAttrs EQ value)* SEMI_COLON
	;

fhirGoalTargetTargetAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MEASURE ( DOT fhirCodeableConceptAttrs )? | ATT_DETAILQ_UANTITY DOT fhirQuantityAttrs | ATT_DETAILR_ANGE DOT fhirRangeAttrs | ATT_DETAILC_ODEABLEC_ONCEPT ( DOT fhirCodeableConceptAttrs )? | ATT_DUED_ATE | ATT_DUED_URATION DOT fhirDurationAttrs
	;

fhirGoalAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirIdentifierAttrs | ATT_STATUS | ATT_CATEGORY OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_PRIORITY ( DOT fhirCodeableConceptAttrs )? | ATT_DESCRIPTION ( DOT fhirCodeableConceptAttrs )? | ATT_SUBJECT ( DOT fhirReferenceAttrs )? | ATT_STARTD_ATE | ATT_STARTC_ODEABLEC_ONCEPT ( DOT fhirCodeableConceptAttrs )? | ATT_TARGET DOT fhirGoalTargetTargetAttrs | ATT_STATUSD_ATE | ATT_STATUSR_EASON | ATT_EXPRESSEDB_Y ( DOT fhirReferenceAttrs )? | ATT_ADDRESSES OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_NOTE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirAnnotationAttrs | ATT_OUTCOMEC_ODE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_OUTCOMER_EFERENCE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )?
	;

fhirGraphDefinition
	: RES_G_RAPHD_EFINITION LT ID GT WITH fhirGraphDefinitionAttrs EQ value (COMMA fhirGraphDefinitionAttrs EQ value)* SEMI_COLON
	;

fhirGraphDefinitionLinkLink
	: RES_LINK LT ID GT WITH fhirGraphDefinitionLinkLinkAttrs EQ value (COMMA fhirGraphDefinitionLinkLinkAttrs EQ value)* SEMI_COLON
	;

fhirLinkTargetTarget
	: RES_TARGET LT ID GT WITH fhirLinkTargetTargetAttrs EQ value (COMMA fhirLinkTargetTargetAttrs EQ value)* SEMI_COLON
	;

fhirTargetCompartmentCompartment
	: RES_COMPARTMENT LT ID GT WITH fhirTargetCompartmentCompartmentAttrs EQ value (COMMA fhirTargetCompartmentCompartmentAttrs EQ value)* SEMI_COLON
	;

fhirTargetCompartmentCompartmentAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_CODE | ATT_RULE | ATT_EXPRESSION | ATT_DESCRIPTION
	;

fhirLinkTargetTargetAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_TYPE | ATT_PROFILE | ATT_COMPARTMENT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirTargetCompartmentCompartmentAttrs
	;

fhirGraphDefinitionLinkLinkAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_PATH | ATT_SLICEN_AME | ATT_MIN | ATT_MAX | ATT_DESCRIPTION | ATT_TARGET OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirLinkTargetTargetAttrs
	;

fhirGraphDefinitionAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_URL | ATT_VERSION | ATT_NAME | ATT_STATUS | ATT_EXPERIMENTAL | ATT_DATE | ATT_PUBLISHER | ATT_CONTACT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirContactDetailAttrs | ATT_DESCRIPTION | ATT_USEC_ONTEXT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirUsageContextAttrs | ATT_JURISDICTION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_PURPOSE | ATT_START | ATT_PROFILE | ATT_LINK OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirGraphDefinitionLinkLinkAttrs
	;

fhirGroup
	: RES_G_ROUP LT ID GT WITH fhirGroupAttrs EQ value (COMMA fhirGroupAttrs EQ value)* SEMI_COLON
	;

fhirGroupCharacteristicCharacteristic
	: RES_CHARACTERISTIC LT ID GT WITH fhirGroupCharacteristicCharacteristicAttrs EQ value (COMMA fhirGroupCharacteristicCharacteristicAttrs EQ value)* SEMI_COLON
	;

fhirGroupCharacteristicCharacteristicAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_CODE ( DOT fhirCodeableConceptAttrs )? | ATT_VALUEC_ODEABLEC_ONCEPT ( DOT fhirCodeableConceptAttrs )? | ATT_VALUEB_OOLEAN | ATT_VALUEQ_UANTITY DOT fhirQuantityAttrs | ATT_VALUER_ANGE DOT fhirRangeAttrs | ATT_EXCLUDE | ATT_PERIOD DOT fhirPeriodAttrs
	;

fhirGroupMemberMember
	: RES_MEMBER LT ID GT WITH fhirGroupMemberMemberAttrs EQ value (COMMA fhirGroupMemberMemberAttrs EQ value)* SEMI_COLON
	;

fhirGroupMemberMemberAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_ENTITY ( DOT fhirReferenceAttrs )? | ATT_PERIOD DOT fhirPeriodAttrs | ATT_INACTIVE
	;

fhirGroupAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirIdentifierAttrs | ATT_ACTIVE | ATT_TYPE | ATT_ACTUAL | ATT_CODE ( DOT fhirCodeableConceptAttrs )? | ATT_NAME | ATT_QUANTITY | ATT_CHARACTERISTIC OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirGroupCharacteristicCharacteristicAttrs | ATT_MEMBER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirGroupMemberMemberAttrs
	;

fhirGuidanceResponse
	: RES_G_UIDANCER_ESPONSE LT ID GT WITH fhirGuidanceResponseAttrs EQ value (COMMA fhirGuidanceResponseAttrs EQ value)* SEMI_COLON
	;

fhirGuidanceResponseAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_REQUESTI_D | ATT_IDENTIFIER DOT fhirIdentifierAttrs | ATT_MODULE ( DOT fhirReferenceAttrs )? | ATT_STATUS | ATT_SUBJECT ( DOT fhirReferenceAttrs )? | ATT_CONTEXT ( DOT fhirReferenceAttrs )? | ATT_OCCURRENCED_ATET_IME | ATT_PERFORMER ( DOT fhirReferenceAttrs )? | ATT_REASONC_ODEABLEC_ONCEPT ( DOT fhirCodeableConceptAttrs )? | ATT_REASONR_EFERENCE ( DOT fhirReferenceAttrs )? | ATT_NOTE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirAnnotationAttrs | ATT_EVALUATIONM_ESSAGE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_OUTPUTP_ARAMETERS ( DOT fhirReferenceAttrs )? | ATT_RESULT ( DOT fhirReferenceAttrs )? | ATT_DATAR_EQUIREMENT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirDataRequirementAttrs
	;

fhirHealthcareService
	: RES_H_EALTHCARES_ERVICE LT ID GT WITH fhirHealthcareServiceAttrs EQ value (COMMA fhirHealthcareServiceAttrs EQ value)* SEMI_COLON
	;

fhirHealthcareServiceAvailableTimeAvailableTime
	: RES_AVAILABLET_IME LT ID GT WITH fhirHealthcareServiceAvailableTimeAvailableTimeAttrs EQ value (COMMA fhirHealthcareServiceAvailableTimeAvailableTimeAttrs EQ value)* SEMI_COLON
	;

fhirHealthcareServiceAvailableTimeAvailableTimeAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_DAYSO_FW_EEK OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE | ATT_ALLD_AY | ATT_AVAILABLES_TARTT_IME | ATT_AVAILABLEE_NDT_IME
	;

fhirHealthcareServiceNotAvailableNotAvailable
	: RES_NOTA_VAILABLE LT ID GT WITH fhirHealthcareServiceNotAvailableNotAvailableAttrs EQ value (COMMA fhirHealthcareServiceNotAvailableNotAvailableAttrs EQ value)* SEMI_COLON
	;

fhirHealthcareServiceNotAvailableNotAvailableAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_DESCRIPTION | ATT_DURING DOT fhirPeriodAttrs
	;

fhirHealthcareServiceAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirIdentifierAttrs | ATT_ACTIVE | ATT_PROVIDEDB_Y ( DOT fhirReferenceAttrs )? | ATT_CATEGORY ( DOT fhirCodeableConceptAttrs )? | ATT_TYPE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_SPECIALTY OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_LOCATION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_NAME | ATT_COMMENT | ATT_EXTRAD_ETAILS | ATT_PHOTO DOT fhirAttachmentAttrs | ATT_TELECOM OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirContactPointAttrs | ATT_COVERAGEA_REA OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_SERVICEP_ROVISIONC_ODE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_ELIGIBILITY ( DOT fhirCodeableConceptAttrs )? | ATT_ELIGIBILITYN_OTE | ATT_PROGRAMN_AME OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE | ATT_CHARACTERISTIC OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_REFERRALM_ETHOD OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_APPOINTMENTR_EQUIRED | ATT_AVAILABLET_IME OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirHealthcareServiceAvailableTimeAvailableTimeAttrs | ATT_NOTA_VAILABLE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirHealthcareServiceNotAvailableNotAvailableAttrs | ATT_AVAILABILITYE_XCEPTIONS | ATT_ENDPOINT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )?
	;

fhirImagingManifest
	: RES_I_MAGINGM_ANIFEST LT ID GT WITH fhirImagingManifestAttrs EQ value (COMMA fhirImagingManifestAttrs EQ value)* SEMI_COLON
	;

fhirImagingManifestStudyStudy
	: RES_STUDY LT ID GT WITH fhirImagingManifestStudyStudyAttrs EQ value (COMMA fhirImagingManifestStudyStudyAttrs EQ value)* SEMI_COLON
	;

fhirStudySeriesSeries
	: RES_SERIES LT ID GT WITH fhirStudySeriesSeriesAttrs EQ value (COMMA fhirStudySeriesSeriesAttrs EQ value)* SEMI_COLON
	;

fhirSeriesInstanceInstance
	: RES_INSTANCE LT ID GT WITH fhirSeriesInstanceInstanceAttrs EQ value (COMMA fhirSeriesInstanceInstanceAttrs EQ value)* SEMI_COLON
	;

fhirSeriesInstanceInstanceAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_SOPC_LASS | ATT_UID
	;

fhirStudySeriesSeriesAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_UID | ATT_ENDPOINT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_INSTANCE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirSeriesInstanceInstanceAttrs
	;

fhirImagingManifestStudyStudyAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_UID | ATT_IMAGINGS_TUDY ( DOT fhirReferenceAttrs )? | ATT_ENDPOINT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_SERIES OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirStudySeriesSeriesAttrs
	;

fhirImagingManifestAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER DOT fhirIdentifierAttrs | ATT_PATIENT ( DOT fhirReferenceAttrs )? | ATT_AUTHORINGT_IME | ATT_AUTHOR ( DOT fhirReferenceAttrs )? | ATT_DESCRIPTION | ATT_STUDY OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirImagingManifestStudyStudyAttrs
	;

fhirImagingStudy
	: RES_I_MAGINGS_TUDY LT ID GT WITH fhirImagingStudyAttrs EQ value (COMMA fhirImagingStudyAttrs EQ value)* SEMI_COLON
	;

fhirImagingStudySeriesSeries
	: RES_SERIES LT ID GT WITH fhirImagingStudySeriesSeriesAttrs EQ value (COMMA fhirImagingStudySeriesSeriesAttrs EQ value)* SEMI_COLON
	;

fhirImagingStudySeriesSeriesAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_UID | ATT_NUMBER | ATT_MODALITY ( DOT fhirCodingAttrs )? | ATT_DESCRIPTION | ATT_NUMBERO_FI_NSTANCES | ATT_AVAILABILITY | ATT_ENDPOINT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_BODYS_ITE ( DOT fhirCodingAttrs )? | ATT_LATERALITY ( DOT fhirCodingAttrs )? | ATT_STARTED | ATT_PERFORMER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_INSTANCE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirSeriesInstanceInstanceAttrs
	;

fhirImagingStudyAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_UID | ATT_ACCESSION DOT fhirIdentifierAttrs | ATT_IDENTIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirIdentifierAttrs | ATT_AVAILABILITY | ATT_MODALITYL_IST OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodingAttrs )? | ATT_PATIENT ( DOT fhirReferenceAttrs )? | ATT_CONTEXT ( DOT fhirReferenceAttrs )? | ATT_STARTED | ATT_BASEDO_N OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_REFERRER ( DOT fhirReferenceAttrs )? | ATT_INTERPRETER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_ENDPOINT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_NUMBERO_FS_ERIES | ATT_NUMBERO_FI_NSTANCES | ATT_PROCEDURER_EFERENCE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_PROCEDUREC_ODE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_REASON ( DOT fhirCodeableConceptAttrs )? | ATT_DESCRIPTION | ATT_SERIES OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirImagingStudySeriesSeriesAttrs
	;

fhirImmunization
	: RES_I_MMUNIZATION LT ID GT WITH fhirImmunizationAttrs EQ value (COMMA fhirImmunizationAttrs EQ value)* SEMI_COLON
	;

fhirImmunizationPractitionerPractitioner
	: RES_PRACTITIONER LT ID GT WITH fhirImmunizationPractitionerPractitionerAttrs EQ value (COMMA fhirImmunizationPractitionerPractitionerAttrs EQ value)* SEMI_COLON
	;

fhirImmunizationPractitionerPractitionerAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_ROLE ( DOT fhirCodeableConceptAttrs )? | ATT_ACTOR ( DOT fhirReferenceAttrs )?
	;

fhirImmunizationExplanationExplanation
	: RES_EXPLANATION LT ID GT WITH fhirImmunizationExplanationExplanationAttrs EQ value (COMMA fhirImmunizationExplanationExplanationAttrs EQ value)* SEMI_COLON
	;

fhirImmunizationExplanationExplanationAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_REASON OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_REASONN_OTG_IVEN OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )?
	;

fhirImmunizationReactionReaction
	: RES_REACTION LT ID GT WITH fhirImmunizationReactionReactionAttrs EQ value (COMMA fhirImmunizationReactionReactionAttrs EQ value)* SEMI_COLON
	;

fhirImmunizationReactionReactionAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_DATE | ATT_DETAIL ( DOT fhirReferenceAttrs )? | ATT_REPORTED
	;

fhirImmunizationVaccinationProtocolVaccinationProtocol
	: RES_VACCINATIONP_ROTOCOL LT ID GT WITH fhirImmunizationVaccinationProtocolVaccinationProtocolAttrs EQ value (COMMA fhirImmunizationVaccinationProtocolVaccinationProtocolAttrs EQ value)* SEMI_COLON
	;

fhirImmunizationVaccinationProtocolVaccinationProtocolAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_DOSES_EQUENCE | ATT_DESCRIPTION | ATT_AUTHORITY ( DOT fhirReferenceAttrs )? | ATT_SERIES | ATT_SERIESD_OSES | ATT_TARGETD_ISEASE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_DOSES_TATUS ( DOT fhirCodeableConceptAttrs )? | ATT_DOSES_TATUSR_EASON ( DOT fhirCodeableConceptAttrs )?
	;

fhirImmunizationAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirIdentifierAttrs | ATT_STATUS | ATT_NOTG_IVEN | ATT_VACCINEC_ODE ( DOT fhirCodeableConceptAttrs )? | ATT_PATIENT ( DOT fhirReferenceAttrs )? | ATT_ENCOUNTER ( DOT fhirReferenceAttrs )? | ATT_DATE | ATT_PRIMARYS_OURCE | ATT_REPORTO_RIGIN ( DOT fhirCodeableConceptAttrs )? | ATT_LOCATION ( DOT fhirReferenceAttrs )? | ATT_MANUFACTURER ( DOT fhirReferenceAttrs )? | ATT_LOTN_UMBER | ATT_EXPIRATIOND_ATE | ATT_SITE ( DOT fhirCodeableConceptAttrs )? | ATT_ROUTE ( DOT fhirCodeableConceptAttrs )? | ATT_DOSEQ_UANTITY DOT fhirQuantityAttrs | ATT_PRACTITIONER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirImmunizationPractitionerPractitionerAttrs | ATT_NOTE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirAnnotationAttrs | ATT_EXPLANATION DOT fhirImmunizationExplanationExplanationAttrs | ATT_REACTION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirImmunizationReactionReactionAttrs | ATT_VACCINATIONP_ROTOCOL OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirImmunizationVaccinationProtocolVaccinationProtocolAttrs
	;

fhirImmunizationRecommendation
	: RES_I_MMUNIZATIONR_ECOMMENDATION LT ID GT WITH fhirImmunizationRecommendationAttrs EQ value (COMMA fhirImmunizationRecommendationAttrs EQ value)* SEMI_COLON
	;

fhirImmunizationRecommendationRecommendationRecommendation
	: RES_RECOMMENDATION LT ID GT WITH fhirImmunizationRecommendationRecommendationRecommendationAttrs EQ value (COMMA fhirImmunizationRecommendationRecommendationRecommendationAttrs EQ value)* SEMI_COLON
	;

fhirRecommendationDateCriterionDateCriterion
	: RES_DATEC_RITERION LT ID GT WITH fhirRecommendationDateCriterionDateCriterionAttrs EQ value (COMMA fhirRecommendationDateCriterionDateCriterionAttrs EQ value)* SEMI_COLON
	;

fhirRecommendationDateCriterionDateCriterionAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_CODE ( DOT fhirCodeableConceptAttrs )? | ATT_VALUE
	;

fhirRecommendationProtocolProtocol
	: RES_PROTOCOL LT ID GT WITH fhirRecommendationProtocolProtocolAttrs EQ value (COMMA fhirRecommendationProtocolProtocolAttrs EQ value)* SEMI_COLON
	;

fhirRecommendationProtocolProtocolAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_DOSES_EQUENCE | ATT_DESCRIPTION | ATT_AUTHORITY ( DOT fhirReferenceAttrs )? | ATT_SERIES
	;

fhirImmunizationRecommendationRecommendationRecommendationAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_DATE | ATT_VACCINEC_ODE ( DOT fhirCodeableConceptAttrs )? | ATT_TARGETD_ISEASE ( DOT fhirCodeableConceptAttrs )? | ATT_DOSEN_UMBER | ATT_FORECASTS_TATUS ( DOT fhirCodeableConceptAttrs )? | ATT_DATEC_RITERION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirRecommendationDateCriterionDateCriterionAttrs | ATT_PROTOCOL DOT fhirRecommendationProtocolProtocolAttrs | ATT_SUPPORTINGI_MMUNIZATION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_SUPPORTINGP_ATIENTI_NFORMATION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )?
	;

fhirImmunizationRecommendationAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirIdentifierAttrs | ATT_PATIENT ( DOT fhirReferenceAttrs )? | ATT_RECOMMENDATION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirImmunizationRecommendationRecommendationRecommendationAttrs
	;

fhirImplementationGuide
	: RES_I_MPLEMENTATIONG_UIDE LT ID GT WITH fhirImplementationGuideAttrs EQ value (COMMA fhirImplementationGuideAttrs EQ value)* SEMI_COLON
	;

fhirImplementationGuideDependencyDependency
	: RES_DEPENDENCY LT ID GT WITH fhirImplementationGuideDependencyDependencyAttrs EQ value (COMMA fhirImplementationGuideDependencyDependencyAttrs EQ value)* SEMI_COLON
	;

fhirImplementationGuideDependencyDependencyAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_TYPE | ATT_URI
	;

fhirImplementationGuidePackagePackage
	: RES_PACKAGE LT ID GT WITH fhirImplementationGuidePackagePackageAttrs EQ value (COMMA fhirImplementationGuidePackagePackageAttrs EQ value)* SEMI_COLON
	;

fhirPackageResourceResource
	: RES_RESOURCE LT ID GT WITH fhirPackageResourceResourceAttrs EQ value (COMMA fhirPackageResourceResourceAttrs EQ value)* SEMI_COLON
	;

fhirPackageResourceResourceAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_EXAMPLE | ATT_NAME | ATT_DESCRIPTION | ATT_ACRONYM | ATT_SOURCEU_RI | ATT_SOURCER_EFERENCE ( DOT fhirReferenceAttrs )? | ATT_EXAMPLEF_OR ( DOT fhirReferenceAttrs )?
	;

fhirImplementationGuidePackagePackageAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_NAME | ATT_DESCRIPTION | ATT_RESOURCE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirPackageResourceResourceAttrs
	;

fhirImplementationGuideGlobalGlobal
	: RES_GLOBAL LT ID GT WITH fhirImplementationGuideGlobalGlobalAttrs EQ value (COMMA fhirImplementationGuideGlobalGlobalAttrs EQ value)* SEMI_COLON
	;

fhirImplementationGuideGlobalGlobalAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_TYPE | ATT_PROFILE ( DOT fhirReferenceAttrs )?
	;

fhirImplementationGuidePagePage
	: RES_PAGE LT ID GT WITH fhirImplementationGuidePagePageAttrs EQ value (COMMA fhirImplementationGuidePagePageAttrs EQ value)* SEMI_COLON
	;

fhirImplementationGuidePagePageAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_SOURCE | ATT_TITLE | ATT_KIND | ATT_TYPE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE | ATT_PACKAGE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE | ATT_FORMAT
	;

fhirImplementationGuideAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_URL | ATT_VERSION | ATT_NAME | ATT_STATUS | ATT_EXPERIMENTAL | ATT_DATE | ATT_PUBLISHER | ATT_CONTACT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirContactDetailAttrs | ATT_DESCRIPTION | ATT_USEC_ONTEXT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirUsageContextAttrs | ATT_JURISDICTION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_COPYRIGHT | ATT_FHIRV_ERSION | ATT_DEPENDENCY OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirImplementationGuideDependencyDependencyAttrs | ATT_PACKAGE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirImplementationGuidePackagePackageAttrs | ATT_GLOBAL OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirImplementationGuideGlobalGlobalAttrs | ATT_BINARY OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE | ATT_PAGE DOT fhirImplementationGuidePagePageAttrs
	;

fhirLibrary
	: RES_L_IBRARY LT ID GT WITH fhirLibraryAttrs EQ value (COMMA fhirLibraryAttrs EQ value)* SEMI_COLON
	;

fhirLibraryAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_URL | ATT_IDENTIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirIdentifierAttrs | ATT_VERSION | ATT_NAME | ATT_TITLE | ATT_STATUS | ATT_EXPERIMENTAL | ATT_TYPE ( DOT fhirCodeableConceptAttrs )? | ATT_DATE | ATT_PUBLISHER | ATT_DESCRIPTION | ATT_PURPOSE | ATT_USAGE | ATT_APPROVALD_ATE | ATT_LASTR_EVIEWD_ATE | ATT_EFFECTIVEP_ERIOD DOT fhirPeriodAttrs | ATT_USEC_ONTEXT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirUsageContextAttrs | ATT_JURISDICTION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_TOPIC OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_CONTRIBUTOR OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirContributorAttrs | ATT_CONTACT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirContactDetailAttrs | ATT_COPYRIGHT | ATT_RELATEDA_RTIFACT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirRelatedArtifactAttrs | ATT_PARAMETER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirParameterDefinitionAttrs | ATT_DATAR_EQUIREMENT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirDataRequirementAttrs | ATT_CONTENT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirAttachmentAttrs
	;

fhirLinkage
	: RES_L_INKAGE LT ID GT WITH fhirLinkageAttrs EQ value (COMMA fhirLinkageAttrs EQ value)* SEMI_COLON
	;

fhirLinkageItemItem
	: RES_ITEM LT ID GT WITH fhirLinkageItemItemAttrs EQ value (COMMA fhirLinkageItemItemAttrs EQ value)* SEMI_COLON
	;

fhirLinkageItemItemAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_TYPE | ATT_RESOURCE ( DOT fhirReferenceAttrs )?
	;

fhirLinkageAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_ACTIVE | ATT_AUTHOR ( DOT fhirReferenceAttrs )? | ATT_ITEM OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirLinkageItemItemAttrs
	;

fhirList
	: RES_L_IST LT ID GT WITH fhirListAttrs EQ value (COMMA fhirListAttrs EQ value)* SEMI_COLON
	;

fhirListEntryEntry
	: RES_ENTRY LT ID GT WITH fhirListEntryEntryAttrs EQ value (COMMA fhirListEntryEntryAttrs EQ value)* SEMI_COLON
	;

fhirListEntryEntryAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_FLAG ( DOT fhirCodeableConceptAttrs )? | ATT_DELETED | ATT_DATE | ATT_ITEM ( DOT fhirReferenceAttrs )?
	;

fhirListAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirIdentifierAttrs | ATT_STATUS | ATT_MODE | ATT_TITLE | ATT_CODE ( DOT fhirCodeableConceptAttrs )? | ATT_SUBJECT ( DOT fhirReferenceAttrs )? | ATT_ENCOUNTER ( DOT fhirReferenceAttrs )? | ATT_DATE | ATT_SOURCE ( DOT fhirReferenceAttrs )? | ATT_ORDEREDB_Y ( DOT fhirCodeableConceptAttrs )? | ATT_NOTE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirAnnotationAttrs | ATT_ENTRY OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirListEntryEntryAttrs | ATT_EMPTYR_EASON ( DOT fhirCodeableConceptAttrs )?
	;

fhirLocation
	: RES_L_OCATION LT ID GT WITH fhirLocationAttrs EQ value (COMMA fhirLocationAttrs EQ value)* SEMI_COLON
	;

fhirLocationPositionPosition
	: RES_POSITION LT ID GT WITH fhirLocationPositionPositionAttrs EQ value (COMMA fhirLocationPositionPositionAttrs EQ value)* SEMI_COLON
	;

fhirLocationPositionPositionAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_LONGITUDE | ATT_LATITUDE | ATT_ALTITUDE
	;

fhirLocationAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirIdentifierAttrs | ATT_STATUS | ATT_OPERATIONALS_TATUS ( DOT fhirCodingAttrs )? | ATT_NAME | ATT_ALIAS OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE | ATT_DESCRIPTION | ATT_MODE | ATT_TYPE ( DOT fhirCodeableConceptAttrs )? | ATT_TELECOM OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirContactPointAttrs | ATT_ADDRESS DOT fhirAddressAttrs | ATT_PHYSICALT_YPE ( DOT fhirCodeableConceptAttrs )? | ATT_POSITION DOT fhirLocationPositionPositionAttrs | ATT_MANAGINGO_RGANIZATION ( DOT fhirReferenceAttrs )? | ATT_PARTO_F ( DOT fhirReferenceAttrs )? | ATT_ENDPOINT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )?
	;

fhirMeasure
	: RES_M_EASURE LT ID GT WITH fhirMeasureAttrs EQ value (COMMA fhirMeasureAttrs EQ value)* SEMI_COLON
	;

fhirMeasureGroupGroup
	: RES_GROUP LT ID GT WITH fhirMeasureGroupGroupAttrs EQ value (COMMA fhirMeasureGroupGroupAttrs EQ value)* SEMI_COLON
	;

fhirGroupPopulationPopulation
	: RES_POPULATION LT ID GT WITH fhirGroupPopulationPopulationAttrs EQ value (COMMA fhirGroupPopulationPopulationAttrs EQ value)* SEMI_COLON
	;

fhirGroupPopulationPopulationAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER DOT fhirIdentifierAttrs | ATT_CODE ( DOT fhirCodeableConceptAttrs )? | ATT_NAME | ATT_DESCRIPTION | ATT_CRITERIA
	;

fhirGroupStratifierStratifier
	: RES_STRATIFIER LT ID GT WITH fhirGroupStratifierStratifierAttrs EQ value (COMMA fhirGroupStratifierStratifierAttrs EQ value)* SEMI_COLON
	;

fhirGroupStratifierStratifierAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER DOT fhirIdentifierAttrs | ATT_CRITERIA | ATT_PATH
	;

fhirMeasureGroupGroupAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER DOT fhirIdentifierAttrs | ATT_NAME | ATT_DESCRIPTION | ATT_POPULATION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirGroupPopulationPopulationAttrs | ATT_STRATIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirGroupStratifierStratifierAttrs
	;

fhirMeasureSupplementalDataSupplementalData
	: RES_SUPPLEMENTALD_ATA LT ID GT WITH fhirMeasureSupplementalDataSupplementalDataAttrs EQ value (COMMA fhirMeasureSupplementalDataSupplementalDataAttrs EQ value)* SEMI_COLON
	;

fhirMeasureSupplementalDataSupplementalDataAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER DOT fhirIdentifierAttrs | ATT_USAGE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_CRITERIA | ATT_PATH
	;

fhirMeasureAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_URL | ATT_IDENTIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirIdentifierAttrs | ATT_VERSION | ATT_NAME | ATT_TITLE | ATT_STATUS | ATT_EXPERIMENTAL | ATT_DATE | ATT_PUBLISHER | ATT_DESCRIPTION | ATT_PURPOSE | ATT_USAGE | ATT_APPROVALD_ATE | ATT_LASTR_EVIEWD_ATE | ATT_EFFECTIVEP_ERIOD DOT fhirPeriodAttrs | ATT_USEC_ONTEXT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirUsageContextAttrs | ATT_JURISDICTION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_TOPIC OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_CONTRIBUTOR OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirContributorAttrs | ATT_CONTACT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirContactDetailAttrs | ATT_COPYRIGHT | ATT_RELATEDA_RTIFACT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirRelatedArtifactAttrs | ATT_LIBRARY OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_DISCLAIMER | ATT_SCORING ( DOT fhirCodeableConceptAttrs )? | ATT_COMPOSITES_CORING ( DOT fhirCodeableConceptAttrs )? | ATT_TYPE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_RISKA_DJUSTMENT | ATT_RATEA_GGREGATION | ATT_RATIONALE | ATT_CLINICALR_ECOMMENDATIONS_TATEMENT | ATT_IMPROVEMENTN_OTATION | ATT_DEFINITION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE | ATT_GUIDANCE | ATT_SET | ATT_GROUP OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirMeasureGroupGroupAttrs | ATT_SUPPLEMENTALD_ATA OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirMeasureSupplementalDataSupplementalDataAttrs
	;

fhirMeasureReport
	: RES_M_EASURER_EPORT LT ID GT WITH fhirMeasureReportAttrs EQ value (COMMA fhirMeasureReportAttrs EQ value)* SEMI_COLON
	;

fhirMeasureReportGroupGroup
	: RES_GROUP LT ID GT WITH fhirMeasureReportGroupGroupAttrs EQ value (COMMA fhirMeasureReportGroupGroupAttrs EQ value)* SEMI_COLON
	;

fhirMeasureReportGroupGroupAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER DOT fhirIdentifierAttrs | ATT_POPULATION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirGroupPopulationPopulationAttrs | ATT_MEASURES_CORE | ATT_STRATIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirGroupStratifierStratifierAttrs
	;

fhirMeasureReportAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER DOT fhirIdentifierAttrs | ATT_STATUS | ATT_TYPE | ATT_MEASURE ( DOT fhirReferenceAttrs )? | ATT_PATIENT ( DOT fhirReferenceAttrs )? | ATT_DATE | ATT_REPORTINGO_RGANIZATION ( DOT fhirReferenceAttrs )? | ATT_PERIOD DOT fhirPeriodAttrs | ATT_GROUP OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirMeasureReportGroupGroupAttrs | ATT_EVALUATEDR_ESOURCES ( DOT fhirReferenceAttrs )?
	;

fhirMedia
	: RES_M_EDIA LT ID GT WITH fhirMediaAttrs EQ value (COMMA fhirMediaAttrs EQ value)* SEMI_COLON
	;

fhirMediaAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirIdentifierAttrs | ATT_BASEDO_N OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_TYPE | ATT_SUBTYPE ( DOT fhirCodeableConceptAttrs )? | ATT_VIEW ( DOT fhirCodeableConceptAttrs )? | ATT_SUBJECT ( DOT fhirReferenceAttrs )? | ATT_CONTEXT ( DOT fhirReferenceAttrs )? | ATT_OCCURRENCED_ATET_IME | ATT_OCCURRENCEP_ERIOD DOT fhirPeriodAttrs | ATT_OPERATOR ( DOT fhirReferenceAttrs )? | ATT_REASONC_ODE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_BODYS_ITE ( DOT fhirCodeableConceptAttrs )? | ATT_DEVICE ( DOT fhirReferenceAttrs )? | ATT_HEIGHT | ATT_WIDTH | ATT_FRAMES | ATT_DURATION | ATT_CONTENT DOT fhirAttachmentAttrs | ATT_NOTE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirAnnotationAttrs
	;

fhirMedication
	: RES_M_EDICATION LT ID GT WITH fhirMedicationAttrs EQ value (COMMA fhirMedicationAttrs EQ value)* SEMI_COLON
	;

fhirMedicationIngredientIngredient
	: RES_INGREDIENT LT ID GT WITH fhirMedicationIngredientIngredientAttrs EQ value (COMMA fhirMedicationIngredientIngredientAttrs EQ value)* SEMI_COLON
	;

fhirMedicationIngredientIngredientAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_ITEMC_ODEABLEC_ONCEPT ( DOT fhirCodeableConceptAttrs )? | ATT_ITEMR_EFERENCE ( DOT fhirReferenceAttrs )? | ATT_ISA_CTIVE | ATT_AMOUNT DOT fhirRatioAttrs
	;

fhirMedicationPackagePackage
	: RES_PACKAGE LT ID GT WITH fhirMedicationPackagePackageAttrs EQ value (COMMA fhirMedicationPackagePackageAttrs EQ value)* SEMI_COLON
	;

fhirPackageContentContent
	: RES_CONTENT LT ID GT WITH fhirPackageContentContentAttrs EQ value (COMMA fhirPackageContentContentAttrs EQ value)* SEMI_COLON
	;

fhirPackageContentContentAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_ITEMC_ODEABLEC_ONCEPT ( DOT fhirCodeableConceptAttrs )? | ATT_ITEMR_EFERENCE ( DOT fhirReferenceAttrs )? | ATT_AMOUNT DOT fhirQuantityAttrs
	;

fhirPackageBatchBatch
	: RES_BATCH LT ID GT WITH fhirPackageBatchBatchAttrs EQ value (COMMA fhirPackageBatchBatchAttrs EQ value)* SEMI_COLON
	;

fhirPackageBatchBatchAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_LOTN_UMBER | ATT_EXPIRATIOND_ATE
	;

fhirMedicationPackagePackageAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_CONTAINER ( DOT fhirCodeableConceptAttrs )? | ATT_CONTENT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirPackageContentContentAttrs | ATT_BATCH OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirPackageBatchBatchAttrs
	;

fhirMedicationAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_CODE ( DOT fhirCodeableConceptAttrs )? | ATT_STATUS | ATT_ISB_RAND | ATT_ISO_VERT_HEC_OUNTER | ATT_MANUFACTURER ( DOT fhirReferenceAttrs )? | ATT_FORM ( DOT fhirCodeableConceptAttrs )? | ATT_INGREDIENT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirMedicationIngredientIngredientAttrs | ATT_PACKAGE DOT fhirMedicationPackagePackageAttrs | ATT_IMAGE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirAttachmentAttrs
	;

fhirMedicationAdministration
	: RES_M_EDICATIONA_DMINISTRATION LT ID GT WITH fhirMedicationAdministrationAttrs EQ value (COMMA fhirMedicationAdministrationAttrs EQ value)* SEMI_COLON
	;

fhirMedicationAdministrationPerformerPerformer
	: RES_PERFORMER LT ID GT WITH fhirMedicationAdministrationPerformerPerformerAttrs EQ value (COMMA fhirMedicationAdministrationPerformerPerformerAttrs EQ value)* SEMI_COLON
	;

fhirMedicationAdministrationPerformerPerformerAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_ACTOR ( DOT fhirReferenceAttrs )? | ATT_ONB_EHALFO_F ( DOT fhirReferenceAttrs )?
	;

fhirMedicationAdministrationDosageDosage
	: RES_DOSAGE LT ID GT WITH fhirMedicationAdministrationDosageDosageAttrs EQ value (COMMA fhirMedicationAdministrationDosageDosageAttrs EQ value)* SEMI_COLON
	;

fhirMedicationAdministrationDosageDosageAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_TEXT | ATT_SITE ( DOT fhirCodeableConceptAttrs )? | ATT_ROUTE ( DOT fhirCodeableConceptAttrs )? | ATT_METHOD ( DOT fhirCodeableConceptAttrs )? | ATT_DOSE DOT fhirQuantityAttrs | ATT_RATER_ATIO DOT fhirRatioAttrs | ATT_RATEQ_UANTITY DOT fhirQuantityAttrs
	;

fhirMedicationAdministrationAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirIdentifierAttrs | ATT_DEFINITION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_PARTO_F OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_STATUS | ATT_CATEGORY ( DOT fhirCodeableConceptAttrs )? | ATT_MEDICATIONC_ODEABLEC_ONCEPT ( DOT fhirCodeableConceptAttrs )? | ATT_MEDICATIONR_EFERENCE ( DOT fhirReferenceAttrs )? | ATT_SUBJECT ( DOT fhirReferenceAttrs )? | ATT_CONTEXT ( DOT fhirReferenceAttrs )? | ATT_SUPPORTINGI_NFORMATION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_EFFECTIVED_ATET_IME | ATT_EFFECTIVEP_ERIOD DOT fhirPeriodAttrs | ATT_PERFORMER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirMedicationAdministrationPerformerPerformerAttrs | ATT_NOTG_IVEN | ATT_REASONN_OTG_IVEN OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_REASONC_ODE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_REASONR_EFERENCE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_PRESCRIPTION ( DOT fhirReferenceAttrs )? | ATT_DEVICE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_NOTE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirAnnotationAttrs | ATT_DOSAGE DOT fhirMedicationAdministrationDosageDosageAttrs | ATT_EVENTH_ISTORY OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )?
	;

fhirMedicationDispense
	: RES_M_EDICATIOND_ISPENSE LT ID GT WITH fhirMedicationDispenseAttrs EQ value (COMMA fhirMedicationDispenseAttrs EQ value)* SEMI_COLON
	;

fhirMedicationDispensePerformerPerformer
	: RES_PERFORMER LT ID GT WITH fhirMedicationDispensePerformerPerformerAttrs EQ value (COMMA fhirMedicationDispensePerformerPerformerAttrs EQ value)* SEMI_COLON
	;

fhirMedicationDispensePerformerPerformerAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_ACTOR ( DOT fhirReferenceAttrs )? | ATT_ONB_EHALFO_F ( DOT fhirReferenceAttrs )?
	;

fhirMedicationDispenseSubstitutionSubstitution
	: RES_SUBSTITUTION LT ID GT WITH fhirMedicationDispenseSubstitutionSubstitutionAttrs EQ value (COMMA fhirMedicationDispenseSubstitutionSubstitutionAttrs EQ value)* SEMI_COLON
	;

fhirMedicationDispenseSubstitutionSubstitutionAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_WASS_UBSTITUTED | ATT_TYPE ( DOT fhirCodeableConceptAttrs )? | ATT_REASON OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_RESPONSIBLEP_ARTY OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )?
	;

fhirMedicationDispenseAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirIdentifierAttrs | ATT_PARTO_F OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_STATUS | ATT_CATEGORY ( DOT fhirCodeableConceptAttrs )? | ATT_MEDICATIONC_ODEABLEC_ONCEPT ( DOT fhirCodeableConceptAttrs )? | ATT_MEDICATIONR_EFERENCE ( DOT fhirReferenceAttrs )? | ATT_SUBJECT ( DOT fhirReferenceAttrs )? | ATT_CONTEXT ( DOT fhirReferenceAttrs )? | ATT_SUPPORTINGI_NFORMATION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_PERFORMER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirMedicationDispensePerformerPerformerAttrs | ATT_AUTHORIZINGP_RESCRIPTION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_TYPE ( DOT fhirCodeableConceptAttrs )? | ATT_QUANTITY DOT fhirQuantityAttrs | ATT_DAYSS_UPPLY DOT fhirQuantityAttrs | ATT_WHENP_REPARED | ATT_WHENH_ANDEDO_VER | ATT_DESTINATION ( DOT fhirReferenceAttrs )? | ATT_RECEIVER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_NOTE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirAnnotationAttrs | ATT_DOSAGEI_NSTRUCTION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirDosageAttrs | ATT_SUBSTITUTION DOT fhirMedicationDispenseSubstitutionSubstitutionAttrs | ATT_DETECTEDI_SSUE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_NOTD_ONE | ATT_NOTD_ONER_EASONC_ODEABLEC_ONCEPT ( DOT fhirCodeableConceptAttrs )? | ATT_NOTD_ONER_EASONR_EFERENCE ( DOT fhirReferenceAttrs )? | ATT_EVENTH_ISTORY OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )?
	;

fhirMedicationRequest
	: RES_M_EDICATIONR_EQUEST LT ID GT WITH fhirMedicationRequestAttrs EQ value (COMMA fhirMedicationRequestAttrs EQ value)* SEMI_COLON
	;

fhirMedicationRequestRequesterRequester
	: RES_REQUESTER LT ID GT WITH fhirMedicationRequestRequesterRequesterAttrs EQ value (COMMA fhirMedicationRequestRequesterRequesterAttrs EQ value)* SEMI_COLON
	;

fhirMedicationRequestRequesterRequesterAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_AGENT ( DOT fhirReferenceAttrs )? | ATT_ONB_EHALFO_F ( DOT fhirReferenceAttrs )?
	;

fhirMedicationRequestDispenseRequestDispenseRequest
	: RES_DISPENSER_EQUEST LT ID GT WITH fhirMedicationRequestDispenseRequestDispenseRequestAttrs EQ value (COMMA fhirMedicationRequestDispenseRequestDispenseRequestAttrs EQ value)* SEMI_COLON
	;

fhirMedicationRequestDispenseRequestDispenseRequestAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_VALIDITYP_ERIOD DOT fhirPeriodAttrs | ATT_NUMBERO_FR_EPEATSA_LLOWED | ATT_QUANTITY DOT fhirQuantityAttrs | ATT_EXPECTEDS_UPPLYD_URATION DOT fhirDurationAttrs | ATT_PERFORMER ( DOT fhirReferenceAttrs )?
	;

fhirMedicationRequestSubstitutionSubstitution
	: RES_SUBSTITUTION LT ID GT WITH fhirMedicationRequestSubstitutionSubstitutionAttrs EQ value (COMMA fhirMedicationRequestSubstitutionSubstitutionAttrs EQ value)* SEMI_COLON
	;

fhirMedicationRequestSubstitutionSubstitutionAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_ALLOWED | ATT_REASON ( DOT fhirCodeableConceptAttrs )?
	;

fhirMedicationRequestAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirIdentifierAttrs | ATT_DEFINITION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_BASEDO_N OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_GROUPI_DENTIFIER DOT fhirIdentifierAttrs | ATT_STATUS | ATT_INTENT | ATT_CATEGORY ( DOT fhirCodeableConceptAttrs )? | ATT_PRIORITY | ATT_MEDICATIONC_ODEABLEC_ONCEPT ( DOT fhirCodeableConceptAttrs )? | ATT_MEDICATIONR_EFERENCE ( DOT fhirReferenceAttrs )? | ATT_SUBJECT ( DOT fhirReferenceAttrs )? | ATT_CONTEXT ( DOT fhirReferenceAttrs )? | ATT_SUPPORTINGI_NFORMATION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_AUTHOREDO_N | ATT_REQUESTER DOT fhirMedicationRequestRequesterRequesterAttrs | ATT_RECORDER ( DOT fhirReferenceAttrs )? | ATT_REASONC_ODE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_REASONR_EFERENCE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_NOTE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirAnnotationAttrs | ATT_DOSAGEI_NSTRUCTION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirDosageAttrs | ATT_DISPENSER_EQUEST DOT fhirMedicationRequestDispenseRequestDispenseRequestAttrs | ATT_SUBSTITUTION DOT fhirMedicationRequestSubstitutionSubstitutionAttrs | ATT_PRIORP_RESCRIPTION ( DOT fhirReferenceAttrs )? | ATT_DETECTEDI_SSUE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_EVENTH_ISTORY OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )?
	;

fhirMedicationStatement
	: RES_M_EDICATIONS_TATEMENT LT ID GT WITH fhirMedicationStatementAttrs EQ value (COMMA fhirMedicationStatementAttrs EQ value)* SEMI_COLON
	;

fhirMedicationStatementAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirIdentifierAttrs | ATT_BASEDO_N OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_PARTO_F OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_CONTEXT ( DOT fhirReferenceAttrs )? | ATT_STATUS | ATT_CATEGORY ( DOT fhirCodeableConceptAttrs )? | ATT_MEDICATIONC_ODEABLEC_ONCEPT ( DOT fhirCodeableConceptAttrs )? | ATT_MEDICATIONR_EFERENCE ( DOT fhirReferenceAttrs )? | ATT_EFFECTIVED_ATET_IME | ATT_EFFECTIVEP_ERIOD DOT fhirPeriodAttrs | ATT_DATEA_SSERTED | ATT_INFORMATIONS_OURCE ( DOT fhirReferenceAttrs )? | ATT_SUBJECT ( DOT fhirReferenceAttrs )? | ATT_DERIVEDF_ROM OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_TAKEN | ATT_REASONN_OTT_AKEN OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_REASONC_ODE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_REASONR_EFERENCE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_NOTE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirAnnotationAttrs | ATT_DOSAGE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirDosageAttrs
	;

fhirMessageDefinition
	: RES_M_ESSAGED_EFINITION LT ID GT WITH fhirMessageDefinitionAttrs EQ value (COMMA fhirMessageDefinitionAttrs EQ value)* SEMI_COLON
	;

fhirMessageDefinitionFocusFocus
	: RES_FOCUS LT ID GT WITH fhirMessageDefinitionFocusFocusAttrs EQ value (COMMA fhirMessageDefinitionFocusFocusAttrs EQ value)* SEMI_COLON
	;

fhirMessageDefinitionFocusFocusAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_CODE | ATT_PROFILE ( DOT fhirReferenceAttrs )? | ATT_MIN | ATT_MAX
	;

fhirMessageDefinitionAllowedResponseAllowedResponse
	: RES_ALLOWEDR_ESPONSE LT ID GT WITH fhirMessageDefinitionAllowedResponseAllowedResponseAttrs EQ value (COMMA fhirMessageDefinitionAllowedResponseAllowedResponseAttrs EQ value)* SEMI_COLON
	;

fhirMessageDefinitionAllowedResponseAllowedResponseAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MESSAGE ( DOT fhirReferenceAttrs )? | ATT_SITUATION
	;

fhirMessageDefinitionAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_URL | ATT_IDENTIFIER DOT fhirIdentifierAttrs | ATT_VERSION | ATT_NAME | ATT_TITLE | ATT_STATUS | ATT_EXPERIMENTAL | ATT_DATE | ATT_PUBLISHER | ATT_CONTACT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirContactDetailAttrs | ATT_DESCRIPTION | ATT_USEC_ONTEXT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirUsageContextAttrs | ATT_JURISDICTION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_PURPOSE | ATT_COPYRIGHT | ATT_BASE ( DOT fhirReferenceAttrs )? | ATT_PARENT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_REPLACES OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_EVENT ( DOT fhirCodingAttrs )? | ATT_CATEGORY | ATT_FOCUS OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirMessageDefinitionFocusFocusAttrs | ATT_RESPONSER_EQUIRED | ATT_ALLOWEDR_ESPONSE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirMessageDefinitionAllowedResponseAllowedResponseAttrs
	;

fhirMessageHeader
	: RES_M_ESSAGEH_EADER LT ID GT WITH fhirMessageHeaderAttrs EQ value (COMMA fhirMessageHeaderAttrs EQ value)* SEMI_COLON
	;

fhirMessageHeaderDestinationDestination
	: RES_DESTINATION LT ID GT WITH fhirMessageHeaderDestinationDestinationAttrs EQ value (COMMA fhirMessageHeaderDestinationDestinationAttrs EQ value)* SEMI_COLON
	;

fhirMessageHeaderDestinationDestinationAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_NAME | ATT_TARGET ( DOT fhirReferenceAttrs )? | ATT_ENDPOINT
	;

fhirMessageHeaderSourceSource
	: RES_SOURCE LT ID GT WITH fhirMessageHeaderSourceSourceAttrs EQ value (COMMA fhirMessageHeaderSourceSourceAttrs EQ value)* SEMI_COLON
	;

fhirMessageHeaderSourceSourceAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_NAME | ATT_SOFTWARE | ATT_VERSION | ATT_CONTACT DOT fhirContactPointAttrs | ATT_ENDPOINT
	;

fhirMessageHeaderResponseResponse
	: RES_RESPONSE LT ID GT WITH fhirMessageHeaderResponseResponseAttrs EQ value (COMMA fhirMessageHeaderResponseResponseAttrs EQ value)* SEMI_COLON
	;

fhirMessageHeaderResponseResponseAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER | ATT_CODE | ATT_DETAILS ( DOT fhirReferenceAttrs )?
	;

fhirMessageHeaderAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_EVENT ( DOT fhirCodingAttrs )? | ATT_DESTINATION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirMessageHeaderDestinationDestinationAttrs | ATT_RECEIVER ( DOT fhirReferenceAttrs )? | ATT_SENDER ( DOT fhirReferenceAttrs )? | ATT_TIMESTAMP | ATT_ENTERER ( DOT fhirReferenceAttrs )? | ATT_AUTHOR ( DOT fhirReferenceAttrs )? | ATT_SOURCE DOT fhirMessageHeaderSourceSourceAttrs | ATT_RESPONSIBLE ( DOT fhirReferenceAttrs )? | ATT_REASON ( DOT fhirCodeableConceptAttrs )? | ATT_RESPONSE DOT fhirMessageHeaderResponseResponseAttrs | ATT_FOCUS OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )?
	;

fhirNamingSystem
	: RES_N_AMINGS_YSTEM LT ID GT WITH fhirNamingSystemAttrs EQ value (COMMA fhirNamingSystemAttrs EQ value)* SEMI_COLON
	;

fhirNamingSystemUniqueIdUniqueId
	: RES_UNIQUEI_D LT ID GT WITH fhirNamingSystemUniqueIdUniqueIdAttrs EQ value (COMMA fhirNamingSystemUniqueIdUniqueIdAttrs EQ value)* SEMI_COLON
	;

fhirNamingSystemUniqueIdUniqueIdAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_TYPE | ATT_VALUE | ATT_PREFERRED | ATT_COMMENT | ATT_PERIOD DOT fhirPeriodAttrs
	;

fhirNamingSystemAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_NAME | ATT_STATUS | ATT_KIND | ATT_DATE | ATT_PUBLISHER | ATT_CONTACT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirContactDetailAttrs | ATT_RESPONSIBLE | ATT_TYPE ( DOT fhirCodeableConceptAttrs )? | ATT_DESCRIPTION | ATT_USEC_ONTEXT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirUsageContextAttrs | ATT_JURISDICTION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_USAGE | ATT_UNIQUEI_D OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirNamingSystemUniqueIdUniqueIdAttrs | ATT_REPLACEDB_Y ( DOT fhirReferenceAttrs )?
	;

fhirNutritionOrder
	: RES_N_UTRITIONO_RDER LT ID GT WITH fhirNutritionOrderAttrs EQ value (COMMA fhirNutritionOrderAttrs EQ value)* SEMI_COLON
	;

fhirNutritionOrderOralDietOralDiet
	: RES_ORALD_IET LT ID GT WITH fhirNutritionOrderOralDietOralDietAttrs EQ value (COMMA fhirNutritionOrderOralDietOralDietAttrs EQ value)* SEMI_COLON
	;

fhirOralDietNutrientNutrient
	: RES_NUTRIENT LT ID GT WITH fhirOralDietNutrientNutrientAttrs EQ value (COMMA fhirOralDietNutrientNutrientAttrs EQ value)* SEMI_COLON
	;

fhirOralDietNutrientNutrientAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIER ( DOT fhirCodeableConceptAttrs )? | ATT_AMOUNT DOT fhirQuantityAttrs
	;

fhirOralDietTextureTexture
	: RES_TEXTURE LT ID GT WITH fhirOralDietTextureTextureAttrs EQ value (COMMA fhirOralDietTextureTextureAttrs EQ value)* SEMI_COLON
	;

fhirOralDietTextureTextureAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIER ( DOT fhirCodeableConceptAttrs )? | ATT_FOODT_YPE ( DOT fhirCodeableConceptAttrs )?
	;

fhirNutritionOrderOralDietOralDietAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_TYPE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_SCHEDULE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirTimingAttrs | ATT_NUTRIENT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirOralDietNutrientNutrientAttrs | ATT_TEXTURE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirOralDietTextureTextureAttrs | ATT_FLUIDC_ONSISTENCYT_YPE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_INSTRUCTION
	;

fhirNutritionOrderSupplementSupplement
	: RES_SUPPLEMENT LT ID GT WITH fhirNutritionOrderSupplementSupplementAttrs EQ value (COMMA fhirNutritionOrderSupplementSupplementAttrs EQ value)* SEMI_COLON
	;

fhirNutritionOrderSupplementSupplementAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_TYPE ( DOT fhirCodeableConceptAttrs )? | ATT_PRODUCTN_AME | ATT_SCHEDULE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirTimingAttrs | ATT_QUANTITY DOT fhirQuantityAttrs | ATT_INSTRUCTION
	;

fhirNutritionOrderEnteralFormulaEnteralFormula
	: RES_ENTERALF_ORMULA LT ID GT WITH fhirNutritionOrderEnteralFormulaEnteralFormulaAttrs EQ value (COMMA fhirNutritionOrderEnteralFormulaEnteralFormulaAttrs EQ value)* SEMI_COLON
	;

fhirEnteralFormulaAdministrationAdministration
	: RES_ADMINISTRATION LT ID GT WITH fhirEnteralFormulaAdministrationAdministrationAttrs EQ value (COMMA fhirEnteralFormulaAdministrationAdministrationAttrs EQ value)* SEMI_COLON
	;

fhirEnteralFormulaAdministrationAdministrationAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_SCHEDULE DOT fhirTimingAttrs | ATT_QUANTITY DOT fhirQuantityAttrs | ATT_RATEQ_UANTITY DOT fhirQuantityAttrs | ATT_RATER_ATIO DOT fhirRatioAttrs
	;

fhirNutritionOrderEnteralFormulaEnteralFormulaAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_BASEF_ORMULAT_YPE ( DOT fhirCodeableConceptAttrs )? | ATT_BASEF_ORMULAP_RODUCTN_AME | ATT_ADDITIVET_YPE ( DOT fhirCodeableConceptAttrs )? | ATT_ADDITIVEP_RODUCTN_AME | ATT_CALORICD_ENSITY DOT fhirQuantityAttrs | ATT_ROUTEOFA_DMINISTRATION ( DOT fhirCodeableConceptAttrs )? | ATT_ADMINISTRATION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirEnteralFormulaAdministrationAdministrationAttrs | ATT_MAXV_OLUMET_OD_ELIVER DOT fhirQuantityAttrs | ATT_ADMINISTRATIONI_NSTRUCTION
	;

fhirNutritionOrderAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirIdentifierAttrs | ATT_STATUS | ATT_PATIENT ( DOT fhirReferenceAttrs )? | ATT_ENCOUNTER ( DOT fhirReferenceAttrs )? | ATT_DATET_IME | ATT_ORDERER ( DOT fhirReferenceAttrs )? | ATT_ALLERGYI_NTOLERANCE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_FOODP_REFERENCEM_ODIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_EXCLUDEF_OODM_ODIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_ORALD_IET DOT fhirNutritionOrderOralDietOralDietAttrs | ATT_SUPPLEMENT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirNutritionOrderSupplementSupplementAttrs | ATT_ENTERALF_ORMULA DOT fhirNutritionOrderEnteralFormulaEnteralFormulaAttrs
	;

fhirObservation
	: RES_O_BSERVATION LT ID GT WITH fhirObservationAttrs EQ value (COMMA fhirObservationAttrs EQ value)* SEMI_COLON
	;

fhirObservationReferenceRangeReferenceRange
	: RES_REFERENCER_ANGE LT ID GT WITH fhirObservationReferenceRangeReferenceRangeAttrs EQ value (COMMA fhirObservationReferenceRangeReferenceRangeAttrs EQ value)* SEMI_COLON
	;

fhirObservationReferenceRangeReferenceRangeAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_LOW DOT fhirQuantityAttrs | ATT_HIGH DOT fhirQuantityAttrs | ATT_TYPE ( DOT fhirCodeableConceptAttrs )? | ATT_APPLIEST_O OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_AGE DOT fhirRangeAttrs | ATT_TEXT
	;

fhirObservationRelatedRelated
	: RES_RELATED LT ID GT WITH fhirObservationRelatedRelatedAttrs EQ value (COMMA fhirObservationRelatedRelatedAttrs EQ value)* SEMI_COLON
	;

fhirObservationRelatedRelatedAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_TYPE | ATT_TARGET ( DOT fhirReferenceAttrs )?
	;

fhirObservationComponentComponent
	: RES_COMPONENT LT ID GT WITH fhirObservationComponentComponentAttrs EQ value (COMMA fhirObservationComponentComponentAttrs EQ value)* SEMI_COLON
	;

fhirObservationComponentComponentAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_CODE ( DOT fhirCodeableConceptAttrs )? | ATT_VALUEQ_UANTITY DOT fhirQuantityAttrs | ATT_VALUEC_ODEABLEC_ONCEPT ( DOT fhirCodeableConceptAttrs )? | ATT_VALUES_TRING | ATT_VALUER_ANGE DOT fhirRangeAttrs | ATT_VALUER_ATIO DOT fhirRatioAttrs | ATT_VALUES_AMPLEDD_ATA DOT fhirSampledDataAttrs | ATT_VALUEA_TTACHMENT DOT fhirAttachmentAttrs | ATT_VALUET_IME | ATT_VALUED_ATET_IME | ATT_VALUEP_ERIOD DOT fhirPeriodAttrs | ATT_DATAA_BSENTR_EASON ( DOT fhirCodeableConceptAttrs )? | ATT_INTERPRETATION ( DOT fhirCodeableConceptAttrs )?
	;

fhirObservationAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirIdentifierAttrs | ATT_BASEDO_N OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_STATUS | ATT_CATEGORY OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_CODE ( DOT fhirCodeableConceptAttrs )? | ATT_SUBJECT ( DOT fhirReferenceAttrs )? | ATT_CONTEXT ( DOT fhirReferenceAttrs )? | ATT_EFFECTIVED_ATET_IME | ATT_EFFECTIVEP_ERIOD DOT fhirPeriodAttrs | ATT_ISSUED | ATT_PERFORMER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_VALUEQ_UANTITY DOT fhirQuantityAttrs | ATT_VALUEC_ODEABLEC_ONCEPT ( DOT fhirCodeableConceptAttrs )? | ATT_VALUES_TRING | ATT_VALUEB_OOLEAN | ATT_VALUER_ANGE DOT fhirRangeAttrs | ATT_VALUER_ATIO DOT fhirRatioAttrs | ATT_VALUES_AMPLEDD_ATA DOT fhirSampledDataAttrs | ATT_VALUEA_TTACHMENT DOT fhirAttachmentAttrs | ATT_VALUET_IME | ATT_VALUED_ATET_IME | ATT_VALUEP_ERIOD DOT fhirPeriodAttrs | ATT_DATAA_BSENTR_EASON ( DOT fhirCodeableConceptAttrs )? | ATT_INTERPRETATION ( DOT fhirCodeableConceptAttrs )? | ATT_COMMENT | ATT_BODYS_ITE ( DOT fhirCodeableConceptAttrs )? | ATT_METHOD ( DOT fhirCodeableConceptAttrs )? | ATT_SPECIMEN ( DOT fhirReferenceAttrs )? | ATT_DEVICE ( DOT fhirReferenceAttrs )? | ATT_REFERENCER_ANGE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirObservationReferenceRangeReferenceRangeAttrs | ATT_RELATED OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirObservationRelatedRelatedAttrs | ATT_COMPONENT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirObservationComponentComponentAttrs
	;

fhirOperationDefinition
	: RES_O_PERATIOND_EFINITION LT ID GT WITH fhirOperationDefinitionAttrs EQ value (COMMA fhirOperationDefinitionAttrs EQ value)* SEMI_COLON
	;

fhirOperationDefinitionParameterParameter
	: RES_PARAMETER LT ID GT WITH fhirOperationDefinitionParameterParameterAttrs EQ value (COMMA fhirOperationDefinitionParameterParameterAttrs EQ value)* SEMI_COLON
	;

fhirParameterBindingBinding
	: RES_BINDING LT ID GT WITH fhirParameterBindingBindingAttrs EQ value (COMMA fhirParameterBindingBindingAttrs EQ value)* SEMI_COLON
	;

fhirParameterBindingBindingAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_STRENGTH | ATT_VALUES_ETU_RI | ATT_VALUES_ETR_EFERENCE ( DOT fhirReferenceAttrs )?
	;

fhirOperationDefinitionParameterParameterAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_NAME | ATT_USE | ATT_MIN | ATT_MAX | ATT_DOCUMENTATION | ATT_TYPE | ATT_SEARCHT_YPE | ATT_PROFILE ( DOT fhirReferenceAttrs )? | ATT_BINDING DOT fhirParameterBindingBindingAttrs
	;

fhirOperationDefinitionOverloadOverload
	: RES_OVERLOAD LT ID GT WITH fhirOperationDefinitionOverloadOverloadAttrs EQ value (COMMA fhirOperationDefinitionOverloadOverloadAttrs EQ value)* SEMI_COLON
	;

fhirOperationDefinitionOverloadOverloadAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_PARAMETERN_AME OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE | ATT_COMMENT
	;

fhirOperationDefinitionAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_URL | ATT_VERSION | ATT_NAME | ATT_STATUS | ATT_KIND | ATT_EXPERIMENTAL | ATT_DATE | ATT_PUBLISHER | ATT_CONTACT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirContactDetailAttrs | ATT_DESCRIPTION | ATT_USEC_ONTEXT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirUsageContextAttrs | ATT_JURISDICTION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_PURPOSE | ATT_IDEMPOTENT | ATT_CODE | ATT_COMMENT | ATT_BASE ( DOT fhirReferenceAttrs )? | ATT_RESOURCE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE | ATT_SYSTEM | ATT_TYPE | ATT_INSTANCE | ATT_PARAMETER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirOperationDefinitionParameterParameterAttrs | ATT_OVERLOAD OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirOperationDefinitionOverloadOverloadAttrs
	;

fhirOperationOutcome
	: RES_O_PERATIONO_UTCOME LT ID GT WITH fhirOperationOutcomeAttrs EQ value (COMMA fhirOperationOutcomeAttrs EQ value)* SEMI_COLON
	;

fhirOperationOutcomeIssueIssue
	: RES_ISSUE LT ID GT WITH fhirOperationOutcomeIssueIssueAttrs EQ value (COMMA fhirOperationOutcomeIssueIssueAttrs EQ value)* SEMI_COLON
	;

fhirOperationOutcomeIssueIssueAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_SEVERITY | ATT_CODE | ATT_DETAILS ( DOT fhirCodeableConceptAttrs )? | ATT_DIAGNOSTICS | ATT_LOCATION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE | ATT_EXPRESSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE
	;

fhirOperationOutcomeAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_ISSUE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirOperationOutcomeIssueIssueAttrs
	;

fhirOrganization
	: RES_O_RGANIZATION LT ID GT WITH fhirOrganizationAttrs EQ value (COMMA fhirOrganizationAttrs EQ value)* SEMI_COLON
	;

fhirOrganizationContactContact
	: RES_CONTACT LT ID GT WITH fhirOrganizationContactContactAttrs EQ value (COMMA fhirOrganizationContactContactAttrs EQ value)* SEMI_COLON
	;

fhirOrganizationContactContactAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_PURPOSE ( DOT fhirCodeableConceptAttrs )? | ATT_NAME DOT fhirHumanNameAttrs | ATT_TELECOM OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirContactPointAttrs | ATT_ADDRESS DOT fhirAddressAttrs
	;

fhirOrganizationAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirIdentifierAttrs | ATT_ACTIVE | ATT_TYPE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_NAME | ATT_ALIAS OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE | ATT_TELECOM OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirContactPointAttrs | ATT_ADDRESS OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirAddressAttrs | ATT_PARTO_F ( DOT fhirReferenceAttrs )? | ATT_CONTACT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirOrganizationContactContactAttrs | ATT_ENDPOINT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )?
	;

fhirParameters
	: RES_P_ARAMETERS LT ID GT WITH fhirParametersAttrs EQ value (COMMA fhirParametersAttrs EQ value)* SEMI_COLON
	;

fhirParametersParameterParameter
	: RES_PARAMETER LT ID GT WITH fhirParametersParameterParameterAttrs EQ value (COMMA fhirParametersParameterParameterAttrs EQ value)* SEMI_COLON
	;

fhirParametersParameterParameterAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_NAME | ATT_VALUEB_ASE64B_INARY | ATT_VALUEB_OOLEAN | ATT_VALUEC_ODE | ATT_VALUED_ATE | ATT_VALUED_ATET_IME | ATT_VALUED_ECIMAL | ATT_VALUEI_D | ATT_VALUEI_NSTANT | ATT_VALUEI_NTEGER | ATT_VALUEM_ARKDOWN | ATT_VALUEO_ID | ATT_VALUEP_OSITIVEI_NT | ATT_VALUES_TRING | ATT_VALUET_IME | ATT_VALUEU_NSIGNEDI_NT | ATT_VALUEU_RI | ATT_VALUEA_DDRESS DOT fhirAddressAttrs | ATT_VALUEA_GE DOT fhirAgeAttrs | ATT_VALUEA_NNOTATION DOT fhirAnnotationAttrs | ATT_VALUEA_TTACHMENT DOT fhirAttachmentAttrs | ATT_VALUEC_ODEABLEC_ONCEPT ( DOT fhirCodeableConceptAttrs )? | ATT_VALUEC_ODING ( DOT fhirCodingAttrs )? | ATT_VALUEC_ONTACTP_OINT DOT fhirContactPointAttrs | ATT_VALUEC_OUNT DOT fhirCountAttrs | ATT_VALUED_ISTANCE DOT fhirDistanceAttrs | ATT_VALUED_URATION DOT fhirDurationAttrs | ATT_VALUEH_UMANN_AME DOT fhirHumanNameAttrs | ATT_VALUEI_DENTIFIER DOT fhirIdentifierAttrs | ATT_VALUEM_ONEY DOT fhirMoneyAttrs | ATT_VALUEP_ERIOD DOT fhirPeriodAttrs | ATT_VALUEQ_UANTITY DOT fhirQuantityAttrs | ATT_VALUER_ANGE DOT fhirRangeAttrs | ATT_VALUER_ATIO DOT fhirRatioAttrs | ATT_VALUER_EFERENCE ( DOT fhirReferenceAttrs )? | ATT_VALUES_AMPLEDD_ATA DOT fhirSampledDataAttrs | ATT_VALUES_IGNATURE DOT fhirSignatureAttrs | ATT_VALUET_IMING DOT fhirTimingAttrs | ATT_VALUEM_ETA DOT fhirMetaAttrs
	;

fhirParametersAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_PARAMETER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirParametersParameterParameterAttrs
	;

fhirPatient
	: RES_P_ATIENT LT ID GT WITH fhirPatientAttrs EQ value (COMMA fhirPatientAttrs EQ value)* SEMI_COLON
	;

fhirPatientContactContact
	: RES_CONTACT LT ID GT WITH fhirPatientContactContactAttrs EQ value (COMMA fhirPatientContactContactAttrs EQ value)* SEMI_COLON
	;

fhirPatientContactContactAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_RELATIONSHIP OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_NAME DOT fhirHumanNameAttrs | ATT_TELECOM OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirContactPointAttrs | ATT_ADDRESS DOT fhirAddressAttrs | ATT_GENDER | ATT_ORGANIZATION ( DOT fhirReferenceAttrs )? | ATT_PERIOD DOT fhirPeriodAttrs
	;

fhirPatientAnimalAnimal
	: RES_ANIMAL LT ID GT WITH fhirPatientAnimalAnimalAttrs EQ value (COMMA fhirPatientAnimalAnimalAttrs EQ value)* SEMI_COLON
	;

fhirPatientAnimalAnimalAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_SPECIES ( DOT fhirCodeableConceptAttrs )? | ATT_BREED ( DOT fhirCodeableConceptAttrs )? | ATT_GENDERS_TATUS ( DOT fhirCodeableConceptAttrs )?
	;

fhirPatientCommunicationCommunication
	: RES_COMMUNICATION LT ID GT WITH fhirPatientCommunicationCommunicationAttrs EQ value (COMMA fhirPatientCommunicationCommunicationAttrs EQ value)* SEMI_COLON
	;

fhirPatientCommunicationCommunicationAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_LANGUAGE ( DOT fhirCodeableConceptAttrs )? | ATT_PREFERRED
	;

fhirPatientLinkLink
	: RES_LINK LT ID GT WITH fhirPatientLinkLinkAttrs EQ value (COMMA fhirPatientLinkLinkAttrs EQ value)* SEMI_COLON
	;

fhirPatientLinkLinkAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_OTHER ( DOT fhirReferenceAttrs )? | ATT_TYPE
	;

fhirPatientAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirIdentifierAttrs | ATT_ACTIVE | ATT_NAME OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirHumanNameAttrs | ATT_TELECOM OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirContactPointAttrs | ATT_GENDER | ATT_BIRTHD_ATE | ATT_DECEASEDB_OOLEAN | ATT_DECEASEDD_ATET_IME | ATT_ADDRESS OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirAddressAttrs | ATT_MARITALS_TATUS ( DOT fhirCodeableConceptAttrs )? | ATT_MULTIPLEB_IRTHB_OOLEAN | ATT_MULTIPLEB_IRTHI_NTEGER | ATT_PHOTO OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirAttachmentAttrs | ATT_CONTACT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirPatientContactContactAttrs | ATT_ANIMAL DOT fhirPatientAnimalAnimalAttrs | ATT_COMMUNICATION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirPatientCommunicationCommunicationAttrs | ATT_GENERALP_RACTITIONER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_MANAGINGO_RGANIZATION ( DOT fhirReferenceAttrs )? | ATT_LINK OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirPatientLinkLinkAttrs
	;

fhirPaymentNotice
	: RES_P_AYMENTN_OTICE LT ID GT WITH fhirPaymentNoticeAttrs EQ value (COMMA fhirPaymentNoticeAttrs EQ value)* SEMI_COLON
	;

fhirPaymentNoticeAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirIdentifierAttrs | ATT_STATUS | ATT_REQUEST ( DOT fhirReferenceAttrs )? | ATT_RESPONSE ( DOT fhirReferenceAttrs )? | ATT_STATUSD_ATE | ATT_CREATED | ATT_TARGET ( DOT fhirReferenceAttrs )? | ATT_PROVIDER ( DOT fhirReferenceAttrs )? | ATT_ORGANIZATION ( DOT fhirReferenceAttrs )? | ATT_PAYMENTS_TATUS ( DOT fhirCodeableConceptAttrs )?
	;

fhirPaymentReconciliation
	: RES_P_AYMENTR_ECONCILIATION LT ID GT WITH fhirPaymentReconciliationAttrs EQ value (COMMA fhirPaymentReconciliationAttrs EQ value)* SEMI_COLON
	;

fhirPaymentReconciliationDetailDetail
	: RES_DETAIL LT ID GT WITH fhirPaymentReconciliationDetailDetailAttrs EQ value (COMMA fhirPaymentReconciliationDetailDetailAttrs EQ value)* SEMI_COLON
	;

fhirPaymentReconciliationDetailDetailAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_TYPE ( DOT fhirCodeableConceptAttrs )? | ATT_REQUEST ( DOT fhirReferenceAttrs )? | ATT_RESPONSE ( DOT fhirReferenceAttrs )? | ATT_SUBMITTER ( DOT fhirReferenceAttrs )? | ATT_PAYEE ( DOT fhirReferenceAttrs )? | ATT_DATE | ATT_AMOUNT DOT fhirMoneyAttrs
	;

fhirPaymentReconciliationProcessNoteProcessNote
	: RES_PROCESSN_OTE LT ID GT WITH fhirPaymentReconciliationProcessNoteProcessNoteAttrs EQ value (COMMA fhirPaymentReconciliationProcessNoteProcessNoteAttrs EQ value)* SEMI_COLON
	;

fhirPaymentReconciliationProcessNoteProcessNoteAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_TYPE ( DOT fhirCodeableConceptAttrs )? | ATT_TEXT
	;

fhirPaymentReconciliationAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirIdentifierAttrs | ATT_STATUS | ATT_PERIOD DOT fhirPeriodAttrs | ATT_CREATED | ATT_ORGANIZATION ( DOT fhirReferenceAttrs )? | ATT_REQUEST ( DOT fhirReferenceAttrs )? | ATT_OUTCOME ( DOT fhirCodeableConceptAttrs )? | ATT_DISPOSITION | ATT_REQUESTP_ROVIDER ( DOT fhirReferenceAttrs )? | ATT_REQUESTO_RGANIZATION ( DOT fhirReferenceAttrs )? | ATT_DETAIL OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirPaymentReconciliationDetailDetailAttrs | ATT_FORM ( DOT fhirCodeableConceptAttrs )? | ATT_TOTAL DOT fhirMoneyAttrs | ATT_PROCESSN_OTE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirPaymentReconciliationProcessNoteProcessNoteAttrs
	;

fhirPerson
	: RES_P_ERSON LT ID GT WITH fhirPersonAttrs EQ value (COMMA fhirPersonAttrs EQ value)* SEMI_COLON
	;

fhirPersonLinkLink
	: RES_LINK LT ID GT WITH fhirPersonLinkLinkAttrs EQ value (COMMA fhirPersonLinkLinkAttrs EQ value)* SEMI_COLON
	;

fhirPersonLinkLinkAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_TARGET ( DOT fhirReferenceAttrs )? | ATT_ASSURANCE
	;

fhirPersonAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirIdentifierAttrs | ATT_NAME OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirHumanNameAttrs | ATT_TELECOM OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirContactPointAttrs | ATT_GENDER | ATT_BIRTHD_ATE | ATT_ADDRESS OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirAddressAttrs | ATT_PHOTO DOT fhirAttachmentAttrs | ATT_MANAGINGO_RGANIZATION ( DOT fhirReferenceAttrs )? | ATT_ACTIVE | ATT_LINK OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirPersonLinkLinkAttrs
	;

fhirPlanDefinition
	: RES_P_LAND_EFINITION LT ID GT WITH fhirPlanDefinitionAttrs EQ value (COMMA fhirPlanDefinitionAttrs EQ value)* SEMI_COLON
	;

fhirPlanDefinitionGoalGoal
	: RES_GOAL LT ID GT WITH fhirPlanDefinitionGoalGoalAttrs EQ value (COMMA fhirPlanDefinitionGoalGoalAttrs EQ value)* SEMI_COLON
	;

fhirPlanDefinitionGoalGoalAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_CATEGORY ( DOT fhirCodeableConceptAttrs )? | ATT_DESCRIPTION ( DOT fhirCodeableConceptAttrs )? | ATT_PRIORITY ( DOT fhirCodeableConceptAttrs )? | ATT_START ( DOT fhirCodeableConceptAttrs )? | ATT_ADDRESSES OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_DOCUMENTATION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirRelatedArtifactAttrs | ATT_TARGET OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirGoalTargetTargetAttrs
	;

fhirPlanDefinitionActionAction
	: RES_ACTION LT ID GT WITH fhirPlanDefinitionActionActionAttrs EQ value (COMMA fhirPlanDefinitionActionActionAttrs EQ value)* SEMI_COLON
	;

fhirActionConditionCondition
	: RES_CONDITION LT ID GT WITH fhirActionConditionConditionAttrs EQ value (COMMA fhirActionConditionConditionAttrs EQ value)* SEMI_COLON
	;

fhirActionConditionConditionAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_KIND | ATT_DESCRIPTION | ATT_LANGUAGE | ATT_EXPRESSION
	;

fhirActionRelatedActionRelatedAction
	: RES_RELATEDA_CTION LT ID GT WITH fhirActionRelatedActionRelatedActionAttrs EQ value (COMMA fhirActionRelatedActionRelatedActionAttrs EQ value)* SEMI_COLON
	;

fhirActionRelatedActionRelatedActionAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_ACTIONI_D | ATT_RELATIONSHIP | ATT_OFFSETD_URATION DOT fhirDurationAttrs | ATT_OFFSETR_ANGE DOT fhirRangeAttrs
	;

fhirActionParticipantParticipant
	: RES_PARTICIPANT LT ID GT WITH fhirActionParticipantParticipantAttrs EQ value (COMMA fhirActionParticipantParticipantAttrs EQ value)* SEMI_COLON
	;

fhirActionParticipantParticipantAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_TYPE | ATT_ROLE ( DOT fhirCodeableConceptAttrs )?
	;

fhirActionDynamicValueDynamicValue
	: RES_DYNAMICV_ALUE LT ID GT WITH fhirActionDynamicValueDynamicValueAttrs EQ value (COMMA fhirActionDynamicValueDynamicValueAttrs EQ value)* SEMI_COLON
	;

fhirActionDynamicValueDynamicValueAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_DESCRIPTION | ATT_PATH | ATT_LANGUAGE | ATT_EXPRESSION
	;

fhirPlanDefinitionActionActionAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_LABEL | ATT_TITLE | ATT_DESCRIPTION | ATT_TEXTE_QUIVALENT | ATT_CODE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_REASON OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_DOCUMENTATION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirRelatedArtifactAttrs | ATT_GOALI_D OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE | ATT_TRIGGERD_EFINITION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirTriggerDefinitionAttrs | ATT_CONDITION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirActionConditionConditionAttrs | ATT_INPUT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirDataRequirementAttrs | ATT_OUTPUT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirDataRequirementAttrs | ATT_RELATEDA_CTION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirActionRelatedActionRelatedActionAttrs | ATT_TIMINGD_ATET_IME | ATT_TIMINGP_ERIOD DOT fhirPeriodAttrs | ATT_TIMINGD_URATION DOT fhirDurationAttrs | ATT_TIMINGR_ANGE DOT fhirRangeAttrs | ATT_TIMINGT_IMING DOT fhirTimingAttrs | ATT_PARTICIPANT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirActionParticipantParticipantAttrs | ATT_TYPE ( DOT fhirCodingAttrs )? | ATT_GROUPINGB_EHAVIOR | ATT_SELECTIONB_EHAVIOR | ATT_REQUIREDB_EHAVIOR | ATT_PRECHECKB_EHAVIOR | ATT_CARDINALITYB_EHAVIOR | ATT_DEFINITION ( DOT fhirReferenceAttrs )? | ATT_TRANSFORM ( DOT fhirReferenceAttrs )? | ATT_DYNAMICV_ALUE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirActionDynamicValueDynamicValueAttrs
	;

fhirPlanDefinitionAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_URL | ATT_IDENTIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirIdentifierAttrs | ATT_VERSION | ATT_NAME | ATT_TITLE | ATT_TYPE ( DOT fhirCodeableConceptAttrs )? | ATT_STATUS | ATT_EXPERIMENTAL | ATT_DATE | ATT_PUBLISHER | ATT_DESCRIPTION | ATT_PURPOSE | ATT_USAGE | ATT_APPROVALD_ATE | ATT_LASTR_EVIEWD_ATE | ATT_EFFECTIVEP_ERIOD DOT fhirPeriodAttrs | ATT_USEC_ONTEXT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirUsageContextAttrs | ATT_JURISDICTION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_TOPIC OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_CONTRIBUTOR OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirContributorAttrs | ATT_CONTACT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirContactDetailAttrs | ATT_COPYRIGHT | ATT_RELATEDA_RTIFACT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirRelatedArtifactAttrs | ATT_LIBRARY OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_GOAL OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirPlanDefinitionGoalGoalAttrs | ATT_ACTION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirPlanDefinitionActionActionAttrs
	;

fhirPractitioner
	: RES_P_RACTITIONER LT ID GT WITH fhirPractitionerAttrs EQ value (COMMA fhirPractitionerAttrs EQ value)* SEMI_COLON
	;

fhirPractitionerQualificationQualification
	: RES_QUALIFICATION LT ID GT WITH fhirPractitionerQualificationQualificationAttrs EQ value (COMMA fhirPractitionerQualificationQualificationAttrs EQ value)* SEMI_COLON
	;

fhirPractitionerQualificationQualificationAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirIdentifierAttrs | ATT_CODE ( DOT fhirCodeableConceptAttrs )? | ATT_PERIOD DOT fhirPeriodAttrs | ATT_ISSUER ( DOT fhirReferenceAttrs )?
	;

fhirPractitionerAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirIdentifierAttrs | ATT_ACTIVE | ATT_NAME OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirHumanNameAttrs | ATT_TELECOM OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirContactPointAttrs | ATT_ADDRESS OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirAddressAttrs | ATT_GENDER | ATT_BIRTHD_ATE | ATT_PHOTO OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirAttachmentAttrs | ATT_QUALIFICATION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirPractitionerQualificationQualificationAttrs | ATT_COMMUNICATION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )?
	;

fhirPractitionerRole
	: RES_P_RACTITIONERR_OLE LT ID GT WITH fhirPractitionerRoleAttrs EQ value (COMMA fhirPractitionerRoleAttrs EQ value)* SEMI_COLON
	;

fhirPractitionerRoleAvailableTimeAvailableTime
	: RES_AVAILABLET_IME LT ID GT WITH fhirPractitionerRoleAvailableTimeAvailableTimeAttrs EQ value (COMMA fhirPractitionerRoleAvailableTimeAvailableTimeAttrs EQ value)* SEMI_COLON
	;

fhirPractitionerRoleAvailableTimeAvailableTimeAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_DAYSO_FW_EEK OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE | ATT_ALLD_AY | ATT_AVAILABLES_TARTT_IME | ATT_AVAILABLEE_NDT_IME
	;

fhirPractitionerRoleNotAvailableNotAvailable
	: RES_NOTA_VAILABLE LT ID GT WITH fhirPractitionerRoleNotAvailableNotAvailableAttrs EQ value (COMMA fhirPractitionerRoleNotAvailableNotAvailableAttrs EQ value)* SEMI_COLON
	;

fhirPractitionerRoleNotAvailableNotAvailableAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_DESCRIPTION | ATT_DURING DOT fhirPeriodAttrs
	;

fhirPractitionerRoleAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirIdentifierAttrs | ATT_ACTIVE | ATT_PERIOD DOT fhirPeriodAttrs | ATT_PRACTITIONER ( DOT fhirReferenceAttrs )? | ATT_ORGANIZATION ( DOT fhirReferenceAttrs )? | ATT_CODE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_SPECIALTY OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_LOCATION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_HEALTHCARES_ERVICE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_TELECOM OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirContactPointAttrs | ATT_AVAILABLET_IME OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirPractitionerRoleAvailableTimeAvailableTimeAttrs | ATT_NOTA_VAILABLE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirPractitionerRoleNotAvailableNotAvailableAttrs | ATT_AVAILABILITYE_XCEPTIONS | ATT_ENDPOINT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )?
	;

fhirProcedure
	: RES_P_ROCEDURE LT ID GT WITH fhirProcedureAttrs EQ value (COMMA fhirProcedureAttrs EQ value)* SEMI_COLON
	;

fhirProcedurePerformerPerformer
	: RES_PERFORMER LT ID GT WITH fhirProcedurePerformerPerformerAttrs EQ value (COMMA fhirProcedurePerformerPerformerAttrs EQ value)* SEMI_COLON
	;

fhirProcedurePerformerPerformerAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_ROLE ( DOT fhirCodeableConceptAttrs )? | ATT_ACTOR ( DOT fhirReferenceAttrs )? | ATT_ONB_EHALFO_F ( DOT fhirReferenceAttrs )?
	;

fhirProcedureFocalDeviceFocalDevice
	: RES_FOCALD_EVICE LT ID GT WITH fhirProcedureFocalDeviceFocalDeviceAttrs EQ value (COMMA fhirProcedureFocalDeviceFocalDeviceAttrs EQ value)* SEMI_COLON
	;

fhirProcedureFocalDeviceFocalDeviceAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_ACTION ( DOT fhirCodeableConceptAttrs )? | ATT_MANIPULATED ( DOT fhirReferenceAttrs )?
	;

fhirProcedureAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirIdentifierAttrs | ATT_DEFINITION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_BASEDO_N OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_PARTO_F OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_STATUS | ATT_NOTD_ONE | ATT_NOTD_ONER_EASON ( DOT fhirCodeableConceptAttrs )? | ATT_CATEGORY ( DOT fhirCodeableConceptAttrs )? | ATT_CODE ( DOT fhirCodeableConceptAttrs )? | ATT_SUBJECT ( DOT fhirReferenceAttrs )? | ATT_CONTEXT ( DOT fhirReferenceAttrs )? | ATT_PERFORMEDD_ATET_IME | ATT_PERFORMEDP_ERIOD DOT fhirPeriodAttrs | ATT_PERFORMER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirProcedurePerformerPerformerAttrs | ATT_LOCATION ( DOT fhirReferenceAttrs )? | ATT_REASONC_ODE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_REASONR_EFERENCE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_BODYS_ITE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_OUTCOME ( DOT fhirCodeableConceptAttrs )? | ATT_REPORT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_COMPLICATION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_COMPLICATIOND_ETAIL OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_FOLLOWU_P OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_NOTE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirAnnotationAttrs | ATT_FOCALD_EVICE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirProcedureFocalDeviceFocalDeviceAttrs | ATT_USEDR_EFERENCE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_USEDC_ODE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )?
	;

fhirProcedureRequest
	: RES_P_ROCEDURER_EQUEST LT ID GT WITH fhirProcedureRequestAttrs EQ value (COMMA fhirProcedureRequestAttrs EQ value)* SEMI_COLON
	;

fhirProcedureRequestRequesterRequester
	: RES_REQUESTER LT ID GT WITH fhirProcedureRequestRequesterRequesterAttrs EQ value (COMMA fhirProcedureRequestRequesterRequesterAttrs EQ value)* SEMI_COLON
	;

fhirProcedureRequestRequesterRequesterAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_AGENT ( DOT fhirReferenceAttrs )? | ATT_ONB_EHALFO_F ( DOT fhirReferenceAttrs )?
	;

fhirProcedureRequestAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirIdentifierAttrs | ATT_DEFINITION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_BASEDO_N OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_REPLACES OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_REQUISITION DOT fhirIdentifierAttrs | ATT_STATUS | ATT_INTENT | ATT_PRIORITY | ATT_DON_OTP_ERFORM | ATT_CATEGORY OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_CODE ( DOT fhirCodeableConceptAttrs )? | ATT_SUBJECT ( DOT fhirReferenceAttrs )? | ATT_CONTEXT ( DOT fhirReferenceAttrs )? | ATT_OCCURRENCED_ATET_IME | ATT_OCCURRENCEP_ERIOD DOT fhirPeriodAttrs | ATT_OCCURRENCET_IMING DOT fhirTimingAttrs | ATT_ASN_EEDEDB_OOLEAN | ATT_ASN_EEDEDC_ODEABLEC_ONCEPT ( DOT fhirCodeableConceptAttrs )? | ATT_AUTHOREDO_N | ATT_REQUESTER DOT fhirProcedureRequestRequesterRequesterAttrs | ATT_PERFORMERT_YPE ( DOT fhirCodeableConceptAttrs )? | ATT_PERFORMER ( DOT fhirReferenceAttrs )? | ATT_REASONC_ODE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_REASONR_EFERENCE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_SUPPORTINGI_NFO OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_SPECIMEN OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_BODYS_ITE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_NOTE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirAnnotationAttrs | ATT_RELEVANTH_ISTORY OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )?
	;

fhirProcessRequest
	: RES_P_ROCESSR_EQUEST LT ID GT WITH fhirProcessRequestAttrs EQ value (COMMA fhirProcessRequestAttrs EQ value)* SEMI_COLON
	;

fhirProcessRequestItemItem
	: RES_ITEM LT ID GT WITH fhirProcessRequestItemItemAttrs EQ value (COMMA fhirProcessRequestItemItemAttrs EQ value)* SEMI_COLON
	;

fhirProcessRequestItemItemAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_SEQUENCEL_INKI_D
	;

fhirProcessRequestAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirIdentifierAttrs | ATT_STATUS | ATT_ACTION | ATT_TARGET ( DOT fhirReferenceAttrs )? | ATT_CREATED | ATT_PROVIDER ( DOT fhirReferenceAttrs )? | ATT_ORGANIZATION ( DOT fhirReferenceAttrs )? | ATT_REQUEST ( DOT fhirReferenceAttrs )? | ATT_RESPONSE ( DOT fhirReferenceAttrs )? | ATT_NULLIFY | ATT_REFERENCE | ATT_ITEM OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirProcessRequestItemItemAttrs | ATT_INCLUDE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE | ATT_EXCLUDE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE | ATT_PERIOD DOT fhirPeriodAttrs
	;

fhirProcessResponse
	: RES_P_ROCESSR_ESPONSE LT ID GT WITH fhirProcessResponseAttrs EQ value (COMMA fhirProcessResponseAttrs EQ value)* SEMI_COLON
	;

fhirProcessResponseProcessNoteProcessNote
	: RES_PROCESSN_OTE LT ID GT WITH fhirProcessResponseProcessNoteProcessNoteAttrs EQ value (COMMA fhirProcessResponseProcessNoteProcessNoteAttrs EQ value)* SEMI_COLON
	;

fhirProcessResponseProcessNoteProcessNoteAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_TYPE ( DOT fhirCodeableConceptAttrs )? | ATT_TEXT
	;

fhirProcessResponseAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirIdentifierAttrs | ATT_STATUS | ATT_CREATED | ATT_ORGANIZATION ( DOT fhirReferenceAttrs )? | ATT_REQUEST ( DOT fhirReferenceAttrs )? | ATT_OUTCOME ( DOT fhirCodeableConceptAttrs )? | ATT_DISPOSITION | ATT_REQUESTP_ROVIDER ( DOT fhirReferenceAttrs )? | ATT_REQUESTO_RGANIZATION ( DOT fhirReferenceAttrs )? | ATT_FORM ( DOT fhirCodeableConceptAttrs )? | ATT_PROCESSN_OTE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirProcessResponseProcessNoteProcessNoteAttrs | ATT_ERROR OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_COMMUNICATIONR_EQUEST OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )?
	;

fhirProvenance
	: RES_P_ROVENANCE LT ID GT WITH fhirProvenanceAttrs EQ value (COMMA fhirProvenanceAttrs EQ value)* SEMI_COLON
	;

fhirProvenanceAgentAgent
	: RES_AGENT LT ID GT WITH fhirProvenanceAgentAgentAttrs EQ value (COMMA fhirProvenanceAgentAgentAttrs EQ value)* SEMI_COLON
	;

fhirProvenanceAgentAgentAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_ROLE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_WHOU_RI | ATT_WHOR_EFERENCE ( DOT fhirReferenceAttrs )? | ATT_ONB_EHALFO_FU_RI | ATT_ONB_EHALFO_FR_EFERENCE ( DOT fhirReferenceAttrs )? | ATT_RELATEDA_GENTT_YPE ( DOT fhirCodeableConceptAttrs )?
	;

fhirProvenanceEntityEntity
	: RES_ENTITY LT ID GT WITH fhirProvenanceEntityEntityAttrs EQ value (COMMA fhirProvenanceEntityEntityAttrs EQ value)* SEMI_COLON
	;

fhirProvenanceEntityEntityAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_ROLE | ATT_WHATU_RI | ATT_WHATR_EFERENCE ( DOT fhirReferenceAttrs )? | ATT_WHATI_DENTIFIER DOT fhirIdentifierAttrs
	;

fhirProvenanceAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_TARGET OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_PERIOD DOT fhirPeriodAttrs | ATT_RECORDED | ATT_POLICY OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE | ATT_LOCATION ( DOT fhirReferenceAttrs )? | ATT_REASON OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodingAttrs )? | ATT_ACTIVITY ( DOT fhirCodingAttrs )? | ATT_AGENT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirProvenanceAgentAgentAttrs | ATT_ENTITY OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirProvenanceEntityEntityAttrs | ATT_SIGNATURE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirSignatureAttrs
	;

fhirQuestionnaire
	: RES_Q_UESTIONNAIRE LT ID GT WITH fhirQuestionnaireAttrs EQ value (COMMA fhirQuestionnaireAttrs EQ value)* SEMI_COLON
	;

fhirQuestionnaireItemItem
	: RES_ITEM LT ID GT WITH fhirQuestionnaireItemItemAttrs EQ value (COMMA fhirQuestionnaireItemItemAttrs EQ value)* SEMI_COLON
	;

fhirItemEnableWhenEnableWhen
	: RES_ENABLEW_HEN LT ID GT WITH fhirItemEnableWhenEnableWhenAttrs EQ value (COMMA fhirItemEnableWhenEnableWhenAttrs EQ value)* SEMI_COLON
	;

fhirItemEnableWhenEnableWhenAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_QUESTION | ATT_HASA_NSWER | ATT_ANSWERB_OOLEAN | ATT_ANSWERD_ECIMAL | ATT_ANSWERI_NTEGER | ATT_ANSWERD_ATE | ATT_ANSWERD_ATET_IME | ATT_ANSWERT_IME | ATT_ANSWERS_TRING | ATT_ANSWERU_RI | ATT_ANSWERA_TTACHMENT DOT fhirAttachmentAttrs | ATT_ANSWERC_ODING ( DOT fhirCodingAttrs )? | ATT_ANSWERQ_UANTITY DOT fhirQuantityAttrs | ATT_ANSWERR_EFERENCE ( DOT fhirReferenceAttrs )?
	;

fhirItemOptionOption
	: RES_OPTION LT ID GT WITH fhirItemOptionOptionAttrs EQ value (COMMA fhirItemOptionOptionAttrs EQ value)* SEMI_COLON
	;

fhirItemOptionOptionAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_VALUEI_NTEGER | ATT_VALUED_ATE | ATT_VALUET_IME | ATT_VALUES_TRING | ATT_VALUEC_ODING ( DOT fhirCodingAttrs )?
	;

fhirQuestionnaireItemItemAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_LINKI_D | ATT_DEFINITION | ATT_CODE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodingAttrs )? | ATT_PREFIX | ATT_TEXT | ATT_TYPE | ATT_ENABLEW_HEN OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirItemEnableWhenEnableWhenAttrs | ATT_REQUIRED | ATT_REPEATS | ATT_READO_NLY | ATT_MAXL_ENGTH | ATT_OPTIONS ( DOT fhirReferenceAttrs )? | ATT_OPTION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirItemOptionOptionAttrs | ATT_INITIALB_OOLEAN | ATT_INITIALD_ECIMAL | ATT_INITIALI_NTEGER | ATT_INITIALD_ATE | ATT_INITIALD_ATET_IME | ATT_INITIALT_IME | ATT_INITIALS_TRING | ATT_INITIALU_RI | ATT_INITIALA_TTACHMENT DOT fhirAttachmentAttrs | ATT_INITIALC_ODING ( DOT fhirCodingAttrs )? | ATT_INITIALQ_UANTITY DOT fhirQuantityAttrs | ATT_INITIALR_EFERENCE ( DOT fhirReferenceAttrs )?
	;

fhirQuestionnaireAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_URL | ATT_IDENTIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirIdentifierAttrs | ATT_VERSION | ATT_NAME | ATT_TITLE | ATT_STATUS | ATT_EXPERIMENTAL | ATT_DATE | ATT_PUBLISHER | ATT_DESCRIPTION | ATT_PURPOSE | ATT_APPROVALD_ATE | ATT_LASTR_EVIEWD_ATE | ATT_EFFECTIVEP_ERIOD DOT fhirPeriodAttrs | ATT_USEC_ONTEXT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirUsageContextAttrs | ATT_JURISDICTION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_CONTACT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirContactDetailAttrs | ATT_COPYRIGHT | ATT_CODE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodingAttrs )? | ATT_SUBJECTT_YPE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE | ATT_ITEM OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirQuestionnaireItemItemAttrs
	;

fhirQuestionnaireResponse
	: RES_Q_UESTIONNAIRER_ESPONSE LT ID GT WITH fhirQuestionnaireResponseAttrs EQ value (COMMA fhirQuestionnaireResponseAttrs EQ value)* SEMI_COLON
	;

fhirQuestionnaireResponseItemItem
	: RES_ITEM LT ID GT WITH fhirQuestionnaireResponseItemItemAttrs EQ value (COMMA fhirQuestionnaireResponseItemItemAttrs EQ value)* SEMI_COLON
	;

fhirItemAnswerAnswer
	: RES_ANSWER LT ID GT WITH fhirItemAnswerAnswerAttrs EQ value (COMMA fhirItemAnswerAnswerAttrs EQ value)* SEMI_COLON
	;

fhirItemAnswerAnswerAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_VALUEB_OOLEAN | ATT_VALUED_ECIMAL | ATT_VALUEI_NTEGER | ATT_VALUED_ATE | ATT_VALUED_ATET_IME | ATT_VALUET_IME | ATT_VALUES_TRING | ATT_VALUEU_RI | ATT_VALUEA_TTACHMENT DOT fhirAttachmentAttrs | ATT_VALUEC_ODING ( DOT fhirCodingAttrs )? | ATT_VALUEQ_UANTITY DOT fhirQuantityAttrs | ATT_VALUER_EFERENCE ( DOT fhirReferenceAttrs )?
	;

fhirQuestionnaireResponseItemItemAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_LINKI_D | ATT_DEFINITION | ATT_TEXT | ATT_SUBJECT ( DOT fhirReferenceAttrs )? | ATT_ANSWER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirItemAnswerAnswerAttrs
	;

fhirQuestionnaireResponseAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER DOT fhirIdentifierAttrs | ATT_BASEDO_N OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_PARENT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_QUESTIONNAIRE ( DOT fhirReferenceAttrs )? | ATT_STATUS | ATT_SUBJECT ( DOT fhirReferenceAttrs )? | ATT_CONTEXT ( DOT fhirReferenceAttrs )? | ATT_AUTHORED | ATT_AUTHOR ( DOT fhirReferenceAttrs )? | ATT_SOURCE ( DOT fhirReferenceAttrs )? | ATT_ITEM OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirQuestionnaireResponseItemItemAttrs
	;

fhirReferralRequest
	: RES_R_EFERRALR_EQUEST LT ID GT WITH fhirReferralRequestAttrs EQ value (COMMA fhirReferralRequestAttrs EQ value)* SEMI_COLON
	;

fhirReferralRequestRequesterRequester
	: RES_REQUESTER LT ID GT WITH fhirReferralRequestRequesterRequesterAttrs EQ value (COMMA fhirReferralRequestRequesterRequesterAttrs EQ value)* SEMI_COLON
	;

fhirReferralRequestRequesterRequesterAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_AGENT ( DOT fhirReferenceAttrs )? | ATT_ONB_EHALFO_F ( DOT fhirReferenceAttrs )?
	;

fhirReferralRequestAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirIdentifierAttrs | ATT_DEFINITION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_BASEDO_N OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_REPLACES OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_GROUPI_DENTIFIER DOT fhirIdentifierAttrs | ATT_STATUS | ATT_INTENT | ATT_TYPE ( DOT fhirCodeableConceptAttrs )? | ATT_PRIORITY | ATT_SERVICER_EQUESTED OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_SUBJECT ( DOT fhirReferenceAttrs )? | ATT_CONTEXT ( DOT fhirReferenceAttrs )? | ATT_OCCURRENCED_ATET_IME | ATT_OCCURRENCEP_ERIOD DOT fhirPeriodAttrs | ATT_AUTHOREDO_N | ATT_REQUESTER DOT fhirReferralRequestRequesterRequesterAttrs | ATT_SPECIALTY ( DOT fhirCodeableConceptAttrs )? | ATT_RECIPIENT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_REASONC_ODE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_REASONR_EFERENCE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_DESCRIPTION | ATT_SUPPORTINGI_NFO OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_NOTE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirAnnotationAttrs | ATT_RELEVANTH_ISTORY OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )?
	;

fhirRelatedPerson
	: RES_R_ELATEDP_ERSON LT ID GT WITH fhirRelatedPersonAttrs EQ value (COMMA fhirRelatedPersonAttrs EQ value)* SEMI_COLON
	;

fhirRelatedPersonAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirIdentifierAttrs | ATT_ACTIVE | ATT_PATIENT ( DOT fhirReferenceAttrs )? | ATT_RELATIONSHIP ( DOT fhirCodeableConceptAttrs )? | ATT_NAME OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirHumanNameAttrs | ATT_TELECOM OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirContactPointAttrs | ATT_GENDER | ATT_BIRTHD_ATE | ATT_ADDRESS OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirAddressAttrs | ATT_PHOTO OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirAttachmentAttrs | ATT_PERIOD DOT fhirPeriodAttrs
	;

fhirRequestGroup
	: RES_R_EQUESTG_ROUP LT ID GT WITH fhirRequestGroupAttrs EQ value (COMMA fhirRequestGroupAttrs EQ value)* SEMI_COLON
	;

fhirRequestGroupActionAction
	: RES_ACTION LT ID GT WITH fhirRequestGroupActionActionAttrs EQ value (COMMA fhirRequestGroupActionActionAttrs EQ value)* SEMI_COLON
	;

fhirRequestGroupActionActionAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_LABEL | ATT_TITLE | ATT_DESCRIPTION | ATT_TEXTE_QUIVALENT | ATT_CODE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_DOCUMENTATION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirRelatedArtifactAttrs | ATT_CONDITION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirActionConditionConditionAttrs | ATT_RELATEDA_CTION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirActionRelatedActionRelatedActionAttrs | ATT_TIMINGD_ATET_IME | ATT_TIMINGP_ERIOD DOT fhirPeriodAttrs | ATT_TIMINGD_URATION DOT fhirDurationAttrs | ATT_TIMINGR_ANGE DOT fhirRangeAttrs | ATT_TIMINGT_IMING DOT fhirTimingAttrs | ATT_PARTICIPANT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_TYPE ( DOT fhirCodingAttrs )? | ATT_GROUPINGB_EHAVIOR | ATT_SELECTIONB_EHAVIOR | ATT_REQUIREDB_EHAVIOR | ATT_PRECHECKB_EHAVIOR | ATT_CARDINALITYB_EHAVIOR | ATT_RESOURCE ( DOT fhirReferenceAttrs )?
	;

fhirRequestGroupAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirIdentifierAttrs | ATT_DEFINITION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_BASEDO_N OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_REPLACES OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_GROUPI_DENTIFIER DOT fhirIdentifierAttrs | ATT_STATUS | ATT_INTENT | ATT_PRIORITY | ATT_SUBJECT ( DOT fhirReferenceAttrs )? | ATT_CONTEXT ( DOT fhirReferenceAttrs )? | ATT_AUTHOREDO_N | ATT_AUTHOR ( DOT fhirReferenceAttrs )? | ATT_REASONC_ODEABLEC_ONCEPT ( DOT fhirCodeableConceptAttrs )? | ATT_REASONR_EFERENCE ( DOT fhirReferenceAttrs )? | ATT_NOTE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirAnnotationAttrs | ATT_ACTION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirRequestGroupActionActionAttrs
	;

fhirResearchStudy
	: RES_R_ESEARCHS_TUDY LT ID GT WITH fhirResearchStudyAttrs EQ value (COMMA fhirResearchStudyAttrs EQ value)* SEMI_COLON
	;

fhirResearchStudyArmArm
	: RES_ARM LT ID GT WITH fhirResearchStudyArmArmAttrs EQ value (COMMA fhirResearchStudyArmArmAttrs EQ value)* SEMI_COLON
	;

fhirResearchStudyArmArmAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_NAME | ATT_CODE ( DOT fhirCodeableConceptAttrs )? | ATT_DESCRIPTION
	;

fhirResearchStudyAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirIdentifierAttrs | ATT_TITLE | ATT_PROTOCOL OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_PARTO_F OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_STATUS | ATT_CATEGORY OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_FOCUS OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_CONTACT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirContactDetailAttrs | ATT_RELATEDA_RTIFACT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirRelatedArtifactAttrs | ATT_KEYWORD OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_JURISDICTION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_DESCRIPTION | ATT_ENROLLMENT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_PERIOD DOT fhirPeriodAttrs | ATT_SPONSOR ( DOT fhirReferenceAttrs )? | ATT_PRINCIPALI_NVESTIGATOR ( DOT fhirReferenceAttrs )? | ATT_SITE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_REASONS_TOPPED ( DOT fhirCodeableConceptAttrs )? | ATT_NOTE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirAnnotationAttrs | ATT_ARM OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirResearchStudyArmArmAttrs
	;

fhirResearchSubject
	: RES_R_ESEARCHS_UBJECT LT ID GT WITH fhirResearchSubjectAttrs EQ value (COMMA fhirResearchSubjectAttrs EQ value)* SEMI_COLON
	;

fhirResearchSubjectAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER DOT fhirIdentifierAttrs | ATT_STATUS | ATT_PERIOD DOT fhirPeriodAttrs | ATT_STUDY ( DOT fhirReferenceAttrs )? | ATT_INDIVIDUAL ( DOT fhirReferenceAttrs )? | ATT_ASSIGNEDA_RM | ATT_ACTUALA_RM | ATT_CONSENT ( DOT fhirReferenceAttrs )?
	;

fhirRiskAssessment
	: RES_R_ISKA_SSESSMENT LT ID GT WITH fhirRiskAssessmentAttrs EQ value (COMMA fhirRiskAssessmentAttrs EQ value)* SEMI_COLON
	;

fhirRiskAssessmentPredictionPrediction
	: RES_PREDICTION LT ID GT WITH fhirRiskAssessmentPredictionPredictionAttrs EQ value (COMMA fhirRiskAssessmentPredictionPredictionAttrs EQ value)* SEMI_COLON
	;

fhirRiskAssessmentPredictionPredictionAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_OUTCOME ( DOT fhirCodeableConceptAttrs )? | ATT_PROBABILITYD_ECIMAL | ATT_PROBABILITYR_ANGE DOT fhirRangeAttrs | ATT_QUALITATIVER_ISK ( DOT fhirCodeableConceptAttrs )? | ATT_RELATIVER_ISK | ATT_WHENP_ERIOD DOT fhirPeriodAttrs | ATT_WHENR_ANGE DOT fhirRangeAttrs | ATT_RATIONALE
	;

fhirRiskAssessmentAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER DOT fhirIdentifierAttrs | ATT_BASEDO_N ( DOT fhirReferenceAttrs )? | ATT_PARENT ( DOT fhirReferenceAttrs )? | ATT_STATUS | ATT_METHOD ( DOT fhirCodeableConceptAttrs )? | ATT_CODE ( DOT fhirCodeableConceptAttrs )? | ATT_SUBJECT ( DOT fhirReferenceAttrs )? | ATT_CONTEXT ( DOT fhirReferenceAttrs )? | ATT_OCCURRENCED_ATET_IME | ATT_OCCURRENCEP_ERIOD DOT fhirPeriodAttrs | ATT_CONDITION ( DOT fhirReferenceAttrs )? | ATT_PERFORMER ( DOT fhirReferenceAttrs )? | ATT_REASONC_ODEABLEC_ONCEPT ( DOT fhirCodeableConceptAttrs )? | ATT_REASONR_EFERENCE ( DOT fhirReferenceAttrs )? | ATT_BASIS OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_PREDICTION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirRiskAssessmentPredictionPredictionAttrs | ATT_MITIGATION | ATT_COMMENT
	;

fhirSchedule
	: RES_S_CHEDULE LT ID GT WITH fhirScheduleAttrs EQ value (COMMA fhirScheduleAttrs EQ value)* SEMI_COLON
	;

fhirScheduleAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirIdentifierAttrs | ATT_ACTIVE | ATT_SERVICEC_ATEGORY ( DOT fhirCodeableConceptAttrs )? | ATT_SERVICET_YPE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_SPECIALTY OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_ACTOR OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_PLANNINGH_ORIZON DOT fhirPeriodAttrs | ATT_COMMENT
	;

fhirSearchParameter
	: RES_S_EARCHP_ARAMETER LT ID GT WITH fhirSearchParameterAttrs EQ value (COMMA fhirSearchParameterAttrs EQ value)* SEMI_COLON
	;

fhirSearchParameterComponentComponent
	: RES_COMPONENT LT ID GT WITH fhirSearchParameterComponentComponentAttrs EQ value (COMMA fhirSearchParameterComponentComponentAttrs EQ value)* SEMI_COLON
	;

fhirSearchParameterComponentComponentAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_DEFINITION ( DOT fhirReferenceAttrs )? | ATT_EXPRESSION
	;

fhirSearchParameterAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_URL | ATT_VERSION | ATT_NAME | ATT_STATUS | ATT_EXPERIMENTAL | ATT_DATE | ATT_PUBLISHER | ATT_CONTACT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirContactDetailAttrs | ATT_USEC_ONTEXT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirUsageContextAttrs | ATT_JURISDICTION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_PURPOSE | ATT_CODE | ATT_BASE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE | ATT_TYPE | ATT_DERIVEDF_ROM | ATT_DESCRIPTION | ATT_EXPRESSION | ATT_XPATH | ATT_XPATHU_SAGE | ATT_TARGET OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE | ATT_COMPARATOR OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE | ATT_MODIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE | ATT_CHAIN OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE | ATT_COMPONENT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirSearchParameterComponentComponentAttrs
	;

fhirSequence
	: RES_S_EQUENCE LT ID GT WITH fhirSequenceAttrs EQ value (COMMA fhirSequenceAttrs EQ value)* SEMI_COLON
	;

fhirSequenceReferenceSeqReferenceSeq
	: RES_REFERENCES_EQ LT ID GT WITH fhirSequenceReferenceSeqReferenceSeqAttrs EQ value (COMMA fhirSequenceReferenceSeqReferenceSeqAttrs EQ value)* SEMI_COLON
	;

fhirSequenceReferenceSeqReferenceSeqAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_CHROMOSOME ( DOT fhirCodeableConceptAttrs )? | ATT_GENOMEB_UILD | ATT_REFERENCES_EQI_D ( DOT fhirCodeableConceptAttrs )? | ATT_REFERENCES_EQP_OINTER ( DOT fhirReferenceAttrs )? | ATT_REFERENCES_EQS_TRING | ATT_STRAND | ATT_WINDOWS_TART | ATT_WINDOWE_ND
	;

fhirSequenceVariantVariant
	: RES_VARIANT LT ID GT WITH fhirSequenceVariantVariantAttrs EQ value (COMMA fhirSequenceVariantVariantAttrs EQ value)* SEMI_COLON
	;

fhirSequenceVariantVariantAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_START | ATT_END | ATT_OBSERVEDA_LLELE | ATT_REFERENCEA_LLELE | ATT_CIGAR | ATT_VARIANTP_OINTER ( DOT fhirReferenceAttrs )?
	;

fhirSequenceQualityQuality
	: RES_QUALITY LT ID GT WITH fhirSequenceQualityQualityAttrs EQ value (COMMA fhirSequenceQualityQualityAttrs EQ value)* SEMI_COLON
	;

fhirSequenceQualityQualityAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_TYPE | ATT_STANDARDS_EQUENCE ( DOT fhirCodeableConceptAttrs )? | ATT_START | ATT_END | ATT_SCORE DOT fhirQuantityAttrs | ATT_METHOD ( DOT fhirCodeableConceptAttrs )? | ATT_TRUTHT_P_ | ATT_QUERYT_P_ | ATT_TRUTHF_N_ | ATT_QUERYF_P_ | ATT_GTF_P_ | ATT_PRECISION | ATT_RECALL | ATT_FS_CORE
	;

fhirSequenceRepositoryRepository
	: RES_REPOSITORY LT ID GT WITH fhirSequenceRepositoryRepositoryAttrs EQ value (COMMA fhirSequenceRepositoryRepositoryAttrs EQ value)* SEMI_COLON
	;

fhirSequenceRepositoryRepositoryAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_TYPE | ATT_URL | ATT_NAME | ATT_DATASETI_D | ATT_VARIANTSETI_D | ATT_READSETI_D
	;

fhirSequenceAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirIdentifierAttrs | ATT_TYPE | ATT_COORDINATES_YSTEM | ATT_PATIENT ( DOT fhirReferenceAttrs )? | ATT_SPECIMEN ( DOT fhirReferenceAttrs )? | ATT_DEVICE ( DOT fhirReferenceAttrs )? | ATT_PERFORMER ( DOT fhirReferenceAttrs )? | ATT_QUANTITY DOT fhirQuantityAttrs | ATT_REFERENCES_EQ DOT fhirSequenceReferenceSeqReferenceSeqAttrs | ATT_VARIANT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirSequenceVariantVariantAttrs | ATT_OBSERVEDS_EQ | ATT_QUALITY OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirSequenceQualityQualityAttrs | ATT_READC_OVERAGE | ATT_REPOSITORY OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirSequenceRepositoryRepositoryAttrs | ATT_POINTER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )?
	;

fhirServiceDefinition
	: RES_S_ERVICED_EFINITION LT ID GT WITH fhirServiceDefinitionAttrs EQ value (COMMA fhirServiceDefinitionAttrs EQ value)* SEMI_COLON
	;

fhirServiceDefinitionAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_URL | ATT_IDENTIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirIdentifierAttrs | ATT_VERSION | ATT_NAME | ATT_TITLE | ATT_STATUS | ATT_EXPERIMENTAL | ATT_DATE | ATT_PUBLISHER | ATT_DESCRIPTION | ATT_PURPOSE | ATT_USAGE | ATT_APPROVALD_ATE | ATT_LASTR_EVIEWD_ATE | ATT_EFFECTIVEP_ERIOD DOT fhirPeriodAttrs | ATT_USEC_ONTEXT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirUsageContextAttrs | ATT_JURISDICTION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_TOPIC OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_CONTRIBUTOR OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirContributorAttrs | ATT_CONTACT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirContactDetailAttrs | ATT_COPYRIGHT | ATT_RELATEDA_RTIFACT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirRelatedArtifactAttrs | ATT_TRIGGER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirTriggerDefinitionAttrs | ATT_DATAR_EQUIREMENT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirDataRequirementAttrs | ATT_OPERATIOND_EFINITION ( DOT fhirReferenceAttrs )?
	;

fhirSlot
	: RES_S_LOT LT ID GT WITH fhirSlotAttrs EQ value (COMMA fhirSlotAttrs EQ value)* SEMI_COLON
	;

fhirSlotAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirIdentifierAttrs | ATT_SERVICEC_ATEGORY ( DOT fhirCodeableConceptAttrs )? | ATT_SERVICET_YPE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_SPECIALTY OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_APPOINTMENTT_YPE ( DOT fhirCodeableConceptAttrs )? | ATT_SCHEDULE ( DOT fhirReferenceAttrs )? | ATT_STATUS | ATT_START | ATT_END | ATT_OVERBOOKED | ATT_COMMENT
	;

fhirSpecimen
	: RES_S_PECIMEN LT ID GT WITH fhirSpecimenAttrs EQ value (COMMA fhirSpecimenAttrs EQ value)* SEMI_COLON
	;

fhirSpecimenCollectionCollection
	: RES_COLLECTION LT ID GT WITH fhirSpecimenCollectionCollectionAttrs EQ value (COMMA fhirSpecimenCollectionCollectionAttrs EQ value)* SEMI_COLON
	;

fhirSpecimenCollectionCollectionAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_COLLECTOR ( DOT fhirReferenceAttrs )? | ATT_COLLECTEDD_ATET_IME | ATT_COLLECTEDP_ERIOD DOT fhirPeriodAttrs | ATT_QUANTITY DOT fhirQuantityAttrs | ATT_METHOD ( DOT fhirCodeableConceptAttrs )? | ATT_BODYS_ITE ( DOT fhirCodeableConceptAttrs )?
	;

fhirSpecimenProcessingProcessing
	: RES_PROCESSING LT ID GT WITH fhirSpecimenProcessingProcessingAttrs EQ value (COMMA fhirSpecimenProcessingProcessingAttrs EQ value)* SEMI_COLON
	;

fhirSpecimenProcessingProcessingAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_DESCRIPTION | ATT_PROCEDURE ( DOT fhirCodeableConceptAttrs )? | ATT_ADDITIVE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_TIMED_ATET_IME | ATT_TIMEP_ERIOD DOT fhirPeriodAttrs
	;

fhirSpecimenContainerContainer
	: RES_CONTAINER LT ID GT WITH fhirSpecimenContainerContainerAttrs EQ value (COMMA fhirSpecimenContainerContainerAttrs EQ value)* SEMI_COLON
	;

fhirSpecimenContainerContainerAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirIdentifierAttrs | ATT_DESCRIPTION | ATT_TYPE ( DOT fhirCodeableConceptAttrs )? | ATT_CAPACITY DOT fhirQuantityAttrs | ATT_SPECIMENQ_UANTITY DOT fhirQuantityAttrs | ATT_ADDITIVEC_ODEABLEC_ONCEPT ( DOT fhirCodeableConceptAttrs )? | ATT_ADDITIVER_EFERENCE ( DOT fhirReferenceAttrs )?
	;

fhirSpecimenAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirIdentifierAttrs | ATT_ACCESSIONI_DENTIFIER DOT fhirIdentifierAttrs | ATT_STATUS | ATT_TYPE ( DOT fhirCodeableConceptAttrs )? | ATT_SUBJECT ( DOT fhirReferenceAttrs )? | ATT_RECEIVEDT_IME | ATT_PARENT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_REQUEST OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_COLLECTION DOT fhirSpecimenCollectionCollectionAttrs | ATT_PROCESSING OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirSpecimenProcessingProcessingAttrs | ATT_CONTAINER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirSpecimenContainerContainerAttrs | ATT_NOTE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirAnnotationAttrs
	;

fhirStructureDefinition
	: RES_S_TRUCTURED_EFINITION LT ID GT WITH fhirStructureDefinitionAttrs EQ value (COMMA fhirStructureDefinitionAttrs EQ value)* SEMI_COLON
	;

fhirStructureDefinitionMappingMapping
	: RES_MAPPING LT ID GT WITH fhirStructureDefinitionMappingMappingAttrs EQ value (COMMA fhirStructureDefinitionMappingMappingAttrs EQ value)* SEMI_COLON
	;

fhirStructureDefinitionMappingMappingAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTITY | ATT_URI | ATT_NAME | ATT_COMMENT
	;

fhirStructureDefinitionSnapshotSnapshot
	: RES_SNAPSHOT LT ID GT WITH fhirStructureDefinitionSnapshotSnapshotAttrs EQ value (COMMA fhirStructureDefinitionSnapshotSnapshotAttrs EQ value)* SEMI_COLON
	;

fhirStructureDefinitionSnapshotSnapshotAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_ELEMENT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirElementDefinitionAttrs
	;

fhirStructureDefinitionDifferentialDifferential
	: RES_DIFFERENTIAL LT ID GT WITH fhirStructureDefinitionDifferentialDifferentialAttrs EQ value (COMMA fhirStructureDefinitionDifferentialDifferentialAttrs EQ value)* SEMI_COLON
	;

fhirStructureDefinitionDifferentialDifferentialAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_ELEMENT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirElementDefinitionAttrs
	;

fhirStructureDefinitionAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_URL | ATT_IDENTIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirIdentifierAttrs | ATT_VERSION | ATT_NAME | ATT_TITLE | ATT_STATUS | ATT_EXPERIMENTAL | ATT_DATE | ATT_PUBLISHER | ATT_CONTACT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirContactDetailAttrs | ATT_DESCRIPTION | ATT_USEC_ONTEXT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirUsageContextAttrs | ATT_JURISDICTION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_PURPOSE | ATT_COPYRIGHT | ATT_KEYWORD OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodingAttrs )? | ATT_FHIRV_ERSION | ATT_MAPPING OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirStructureDefinitionMappingMappingAttrs | ATT_KIND | ATT_ABSTRACT | ATT_CONTEXTT_YPE | ATT_CONTEXT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE | ATT_CONTEXTI_NVARIANT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE | ATT_TYPE | ATT_BASED_EFINITION | ATT_DERIVATION | ATT_SNAPSHOT DOT fhirStructureDefinitionSnapshotSnapshotAttrs | ATT_DIFFERENTIAL DOT fhirStructureDefinitionDifferentialDifferentialAttrs
	;

fhirStructureMap
	: RES_S_TRUCTUREM_AP LT ID GT WITH fhirStructureMapAttrs EQ value (COMMA fhirStructureMapAttrs EQ value)* SEMI_COLON
	;

fhirStructureMapStructureStructure
	: RES_STRUCTURE LT ID GT WITH fhirStructureMapStructureStructureAttrs EQ value (COMMA fhirStructureMapStructureStructureAttrs EQ value)* SEMI_COLON
	;

fhirStructureMapStructureStructureAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_URL | ATT_MODE | ATT_ALIAS | ATT_DOCUMENTATION
	;

fhirStructureMapGroupGroup
	: RES_GROUP LT ID GT WITH fhirStructureMapGroupGroupAttrs EQ value (COMMA fhirStructureMapGroupGroupAttrs EQ value)* SEMI_COLON
	;

fhirGroupInputInput
	: RES_INPUT LT ID GT WITH fhirGroupInputInputAttrs EQ value (COMMA fhirGroupInputInputAttrs EQ value)* SEMI_COLON
	;

fhirGroupInputInputAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_NAME | ATT_TYPE | ATT_MODE | ATT_DOCUMENTATION
	;

fhirGroupRuleRule
	: RES_RULE LT ID GT WITH fhirGroupRuleRuleAttrs EQ value (COMMA fhirGroupRuleRuleAttrs EQ value)* SEMI_COLON
	;

fhirRuleSourceSource
	: RES_SOURCE LT ID GT WITH fhirRuleSourceSourceAttrs EQ value (COMMA fhirRuleSourceSourceAttrs EQ value)* SEMI_COLON
	;

fhirRuleSourceSourceAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_CONTEXT | ATT_MIN | ATT_MAX | ATT_TYPE | ATT_DEFAULTV_ALUEB_ASE64B_INARY | ATT_DEFAULTV_ALUEB_OOLEAN | ATT_DEFAULTV_ALUEC_ODE | ATT_DEFAULTV_ALUED_ATE | ATT_DEFAULTV_ALUED_ATET_IME | ATT_DEFAULTV_ALUED_ECIMAL | ATT_DEFAULTV_ALUEI_D | ATT_DEFAULTV_ALUEI_NSTANT | ATT_DEFAULTV_ALUEI_NTEGER | ATT_DEFAULTV_ALUEM_ARKDOWN | ATT_DEFAULTV_ALUEO_ID | ATT_DEFAULTV_ALUEP_OSITIVEI_NT | ATT_DEFAULTV_ALUES_TRING | ATT_DEFAULTV_ALUET_IME | ATT_DEFAULTV_ALUEU_NSIGNEDI_NT | ATT_DEFAULTV_ALUEU_RI | ATT_DEFAULTV_ALUEA_DDRESS DOT fhirAddressAttrs | ATT_DEFAULTV_ALUEA_GE DOT fhirAgeAttrs | ATT_DEFAULTV_ALUEA_NNOTATION DOT fhirAnnotationAttrs | ATT_DEFAULTV_ALUEA_TTACHMENT DOT fhirAttachmentAttrs | ATT_DEFAULTV_ALUEC_ODEABLEC_ONCEPT ( DOT fhirCodeableConceptAttrs )? | ATT_DEFAULTV_ALUEC_ODING ( DOT fhirCodingAttrs )? | ATT_DEFAULTV_ALUEC_ONTACTP_OINT DOT fhirContactPointAttrs | ATT_DEFAULTV_ALUEC_OUNT DOT fhirCountAttrs | ATT_DEFAULTV_ALUED_ISTANCE DOT fhirDistanceAttrs | ATT_DEFAULTV_ALUED_URATION DOT fhirDurationAttrs | ATT_DEFAULTV_ALUEH_UMANN_AME DOT fhirHumanNameAttrs | ATT_DEFAULTV_ALUEI_DENTIFIER DOT fhirIdentifierAttrs | ATT_DEFAULTV_ALUEM_ONEY DOT fhirMoneyAttrs | ATT_DEFAULTV_ALUEP_ERIOD DOT fhirPeriodAttrs | ATT_DEFAULTV_ALUEQ_UANTITY DOT fhirQuantityAttrs | ATT_DEFAULTV_ALUER_ANGE DOT fhirRangeAttrs | ATT_DEFAULTV_ALUER_ATIO DOT fhirRatioAttrs | ATT_DEFAULTV_ALUER_EFERENCE ( DOT fhirReferenceAttrs )? | ATT_DEFAULTV_ALUES_AMPLEDD_ATA DOT fhirSampledDataAttrs | ATT_DEFAULTV_ALUES_IGNATURE DOT fhirSignatureAttrs | ATT_DEFAULTV_ALUET_IMING DOT fhirTimingAttrs | ATT_DEFAULTV_ALUEM_ETA DOT fhirMetaAttrs | ATT_ELEMENT | ATT_LISTM_ODE | ATT_VARIABLE | ATT_CONDITION | ATT_CHECK
	;

fhirRuleTargetTarget
	: RES_TARGET LT ID GT WITH fhirRuleTargetTargetAttrs EQ value (COMMA fhirRuleTargetTargetAttrs EQ value)* SEMI_COLON
	;

fhirTargetParameterParameter
	: RES_PARAMETER LT ID GT WITH fhirTargetParameterParameterAttrs EQ value (COMMA fhirTargetParameterParameterAttrs EQ value)* SEMI_COLON
	;

fhirTargetParameterParameterAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_VALUEI_D | ATT_VALUES_TRING | ATT_VALUEB_OOLEAN | ATT_VALUEI_NTEGER | ATT_VALUED_ECIMAL
	;

fhirRuleTargetTargetAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_CONTEXT | ATT_CONTEXTT_YPE | ATT_ELEMENT | ATT_VARIABLE | ATT_LISTM_ODE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE | ATT_LISTR_ULEI_D | ATT_TRANSFORM | ATT_PARAMETER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirTargetParameterParameterAttrs
	;

fhirRuleDependentDependent
	: RES_DEPENDENT LT ID GT WITH fhirRuleDependentDependentAttrs EQ value (COMMA fhirRuleDependentDependentAttrs EQ value)* SEMI_COLON
	;

fhirRuleDependentDependentAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_NAME | ATT_VARIABLE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE
	;

fhirGroupRuleRuleAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_NAME | ATT_SOURCE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirRuleSourceSourceAttrs | ATT_TARGET OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirRuleTargetTargetAttrs | ATT_DEPENDENT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirRuleDependentDependentAttrs | ATT_DOCUMENTATION
	;

fhirStructureMapGroupGroupAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_NAME | ATT_EXTENDS | ATT_TYPEM_ODE | ATT_DOCUMENTATION | ATT_INPUT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirGroupInputInputAttrs | ATT_RULE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirGroupRuleRuleAttrs
	;

fhirStructureMapAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_URL | ATT_IDENTIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirIdentifierAttrs | ATT_VERSION | ATT_NAME | ATT_TITLE | ATT_STATUS | ATT_EXPERIMENTAL | ATT_DATE | ATT_PUBLISHER | ATT_CONTACT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirContactDetailAttrs | ATT_DESCRIPTION | ATT_USEC_ONTEXT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirUsageContextAttrs | ATT_JURISDICTION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_PURPOSE | ATT_COPYRIGHT | ATT_STRUCTURE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirStructureMapStructureStructureAttrs | ATT_IMPORT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE | ATT_GROUP OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirStructureMapGroupGroupAttrs
	;

fhirSubscription
	: RES_S_UBSCRIPTION LT ID GT WITH fhirSubscriptionAttrs EQ value (COMMA fhirSubscriptionAttrs EQ value)* SEMI_COLON
	;

fhirSubscriptionChannelChannel
	: RES_CHANNEL LT ID GT WITH fhirSubscriptionChannelChannelAttrs EQ value (COMMA fhirSubscriptionChannelChannelAttrs EQ value)* SEMI_COLON
	;

fhirSubscriptionChannelChannelAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_TYPE | ATT_ENDPOINT | ATT_PAYLOAD | ATT_HEADER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE
	;

fhirSubscriptionAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_STATUS | ATT_CONTACT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirContactPointAttrs | ATT_END | ATT_REASON | ATT_CRITERIA | ATT_ERROR | ATT_CHANNEL DOT fhirSubscriptionChannelChannelAttrs | ATT_TAG OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodingAttrs )?
	;

fhirSubstance
	: RES_S_UBSTANCE LT ID GT WITH fhirSubstanceAttrs EQ value (COMMA fhirSubstanceAttrs EQ value)* SEMI_COLON
	;

fhirSubstanceInstanceInstance
	: RES_INSTANCE LT ID GT WITH fhirSubstanceInstanceInstanceAttrs EQ value (COMMA fhirSubstanceInstanceInstanceAttrs EQ value)* SEMI_COLON
	;

fhirSubstanceInstanceInstanceAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER DOT fhirIdentifierAttrs | ATT_EXPIRY | ATT_QUANTITY DOT fhirQuantityAttrs
	;

fhirSubstanceIngredientIngredient
	: RES_INGREDIENT LT ID GT WITH fhirSubstanceIngredientIngredientAttrs EQ value (COMMA fhirSubstanceIngredientIngredientAttrs EQ value)* SEMI_COLON
	;

fhirSubstanceIngredientIngredientAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_QUANTITY DOT fhirRatioAttrs | ATT_SUBSTANCEC_ODEABLEC_ONCEPT ( DOT fhirCodeableConceptAttrs )? | ATT_SUBSTANCER_EFERENCE ( DOT fhirReferenceAttrs )?
	;

fhirSubstanceAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirIdentifierAttrs | ATT_STATUS | ATT_CATEGORY OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_CODE ( DOT fhirCodeableConceptAttrs )? | ATT_DESCRIPTION | ATT_INSTANCE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirSubstanceInstanceInstanceAttrs | ATT_INGREDIENT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirSubstanceIngredientIngredientAttrs
	;

fhirSupplyDelivery
	: RES_S_UPPLYD_ELIVERY LT ID GT WITH fhirSupplyDeliveryAttrs EQ value (COMMA fhirSupplyDeliveryAttrs EQ value)* SEMI_COLON
	;

fhirSupplyDeliverySuppliedItemSuppliedItem
	: RES_SUPPLIEDI_TEM LT ID GT WITH fhirSupplyDeliverySuppliedItemSuppliedItemAttrs EQ value (COMMA fhirSupplyDeliverySuppliedItemSuppliedItemAttrs EQ value)* SEMI_COLON
	;

fhirSupplyDeliverySuppliedItemSuppliedItemAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_QUANTITY DOT fhirQuantityAttrs | ATT_ITEMC_ODEABLEC_ONCEPT ( DOT fhirCodeableConceptAttrs )? | ATT_ITEMR_EFERENCE ( DOT fhirReferenceAttrs )?
	;

fhirSupplyDeliveryAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER DOT fhirIdentifierAttrs | ATT_BASEDO_N OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_PARTO_F OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_STATUS | ATT_PATIENT ( DOT fhirReferenceAttrs )? | ATT_TYPE ( DOT fhirCodeableConceptAttrs )? | ATT_SUPPLIEDI_TEM DOT fhirSupplyDeliverySuppliedItemSuppliedItemAttrs | ATT_OCCURRENCED_ATET_IME | ATT_OCCURRENCEP_ERIOD DOT fhirPeriodAttrs | ATT_OCCURRENCET_IMING DOT fhirTimingAttrs | ATT_SUPPLIER ( DOT fhirReferenceAttrs )? | ATT_DESTINATION ( DOT fhirReferenceAttrs )? | ATT_RECEIVER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )?
	;

fhirSupplyRequest
	: RES_S_UPPLYR_EQUEST LT ID GT WITH fhirSupplyRequestAttrs EQ value (COMMA fhirSupplyRequestAttrs EQ value)* SEMI_COLON
	;

fhirSupplyRequestOrderedItemOrderedItem
	: RES_ORDEREDI_TEM LT ID GT WITH fhirSupplyRequestOrderedItemOrderedItemAttrs EQ value (COMMA fhirSupplyRequestOrderedItemOrderedItemAttrs EQ value)* SEMI_COLON
	;

fhirSupplyRequestOrderedItemOrderedItemAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_QUANTITY DOT fhirQuantityAttrs | ATT_ITEMC_ODEABLEC_ONCEPT ( DOT fhirCodeableConceptAttrs )? | ATT_ITEMR_EFERENCE ( DOT fhirReferenceAttrs )?
	;

fhirSupplyRequestRequesterRequester
	: RES_REQUESTER LT ID GT WITH fhirSupplyRequestRequesterRequesterAttrs EQ value (COMMA fhirSupplyRequestRequesterRequesterAttrs EQ value)* SEMI_COLON
	;

fhirSupplyRequestRequesterRequesterAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_AGENT ( DOT fhirReferenceAttrs )? | ATT_ONB_EHALFO_F ( DOT fhirReferenceAttrs )?
	;

fhirSupplyRequestAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER DOT fhirIdentifierAttrs | ATT_STATUS | ATT_CATEGORY ( DOT fhirCodeableConceptAttrs )? | ATT_PRIORITY | ATT_ORDEREDI_TEM DOT fhirSupplyRequestOrderedItemOrderedItemAttrs | ATT_OCCURRENCED_ATET_IME | ATT_OCCURRENCEP_ERIOD DOT fhirPeriodAttrs | ATT_OCCURRENCET_IMING DOT fhirTimingAttrs | ATT_AUTHOREDO_N | ATT_REQUESTER DOT fhirSupplyRequestRequesterRequesterAttrs | ATT_SUPPLIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_REASONC_ODEABLEC_ONCEPT ( DOT fhirCodeableConceptAttrs )? | ATT_REASONR_EFERENCE ( DOT fhirReferenceAttrs )? | ATT_DELIVERF_ROM ( DOT fhirReferenceAttrs )? | ATT_DELIVERT_O ( DOT fhirReferenceAttrs )?
	;

fhirTask
	: RES_T_ASK LT ID GT WITH fhirTaskAttrs EQ value (COMMA fhirTaskAttrs EQ value)* SEMI_COLON
	;

fhirTaskRequesterRequester
	: RES_REQUESTER LT ID GT WITH fhirTaskRequesterRequesterAttrs EQ value (COMMA fhirTaskRequesterRequesterAttrs EQ value)* SEMI_COLON
	;

fhirTaskRequesterRequesterAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_AGENT ( DOT fhirReferenceAttrs )? | ATT_ONB_EHALFO_F ( DOT fhirReferenceAttrs )?
	;

fhirTaskRestrictionRestriction
	: RES_RESTRICTION LT ID GT WITH fhirTaskRestrictionRestrictionAttrs EQ value (COMMA fhirTaskRestrictionRestrictionAttrs EQ value)* SEMI_COLON
	;

fhirTaskRestrictionRestrictionAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_REPETITIONS | ATT_PERIOD DOT fhirPeriodAttrs | ATT_RECIPIENT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )?
	;

fhirTaskInputInput
	: RES_INPUT LT ID GT WITH fhirTaskInputInputAttrs EQ value (COMMA fhirTaskInputInputAttrs EQ value)* SEMI_COLON
	;

fhirTaskInputInputAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_TYPE ( DOT fhirCodeableConceptAttrs )? | ATT_VALUEB_ASE64B_INARY | ATT_VALUEB_OOLEAN | ATT_VALUEC_ODE | ATT_VALUED_ATE | ATT_VALUED_ATET_IME | ATT_VALUED_ECIMAL | ATT_VALUEI_D | ATT_VALUEI_NSTANT | ATT_VALUEI_NTEGER | ATT_VALUEM_ARKDOWN | ATT_VALUEO_ID | ATT_VALUEP_OSITIVEI_NT | ATT_VALUES_TRING | ATT_VALUET_IME | ATT_VALUEU_NSIGNEDI_NT | ATT_VALUEU_RI | ATT_VALUEA_DDRESS DOT fhirAddressAttrs | ATT_VALUEA_GE DOT fhirAgeAttrs | ATT_VALUEA_NNOTATION DOT fhirAnnotationAttrs | ATT_VALUEA_TTACHMENT DOT fhirAttachmentAttrs | ATT_VALUEC_ODEABLEC_ONCEPT ( DOT fhirCodeableConceptAttrs )? | ATT_VALUEC_ODING ( DOT fhirCodingAttrs )? | ATT_VALUEC_ONTACTP_OINT DOT fhirContactPointAttrs | ATT_VALUEC_OUNT DOT fhirCountAttrs | ATT_VALUED_ISTANCE DOT fhirDistanceAttrs | ATT_VALUED_URATION DOT fhirDurationAttrs | ATT_VALUEH_UMANN_AME DOT fhirHumanNameAttrs | ATT_VALUEI_DENTIFIER DOT fhirIdentifierAttrs | ATT_VALUEM_ONEY DOT fhirMoneyAttrs | ATT_VALUEP_ERIOD DOT fhirPeriodAttrs | ATT_VALUEQ_UANTITY DOT fhirQuantityAttrs | ATT_VALUER_ANGE DOT fhirRangeAttrs | ATT_VALUER_ATIO DOT fhirRatioAttrs | ATT_VALUER_EFERENCE ( DOT fhirReferenceAttrs )? | ATT_VALUES_AMPLEDD_ATA DOT fhirSampledDataAttrs | ATT_VALUES_IGNATURE DOT fhirSignatureAttrs | ATT_VALUET_IMING DOT fhirTimingAttrs | ATT_VALUEM_ETA DOT fhirMetaAttrs
	;

fhirTaskOutputOutput
	: RES_OUTPUT LT ID GT WITH fhirTaskOutputOutputAttrs EQ value (COMMA fhirTaskOutputOutputAttrs EQ value)* SEMI_COLON
	;

fhirTaskOutputOutputAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_TYPE ( DOT fhirCodeableConceptAttrs )? | ATT_VALUEB_ASE64B_INARY | ATT_VALUEB_OOLEAN | ATT_VALUEC_ODE | ATT_VALUED_ATE | ATT_VALUED_ATET_IME | ATT_VALUED_ECIMAL | ATT_VALUEI_D | ATT_VALUEI_NSTANT | ATT_VALUEI_NTEGER | ATT_VALUEM_ARKDOWN | ATT_VALUEO_ID | ATT_VALUEP_OSITIVEI_NT | ATT_VALUES_TRING | ATT_VALUET_IME | ATT_VALUEU_NSIGNEDI_NT | ATT_VALUEU_RI | ATT_VALUEA_DDRESS DOT fhirAddressAttrs | ATT_VALUEA_GE DOT fhirAgeAttrs | ATT_VALUEA_NNOTATION DOT fhirAnnotationAttrs | ATT_VALUEA_TTACHMENT DOT fhirAttachmentAttrs | ATT_VALUEC_ODEABLEC_ONCEPT ( DOT fhirCodeableConceptAttrs )? | ATT_VALUEC_ODING ( DOT fhirCodingAttrs )? | ATT_VALUEC_ONTACTP_OINT DOT fhirContactPointAttrs | ATT_VALUEC_OUNT DOT fhirCountAttrs | ATT_VALUED_ISTANCE DOT fhirDistanceAttrs | ATT_VALUED_URATION DOT fhirDurationAttrs | ATT_VALUEH_UMANN_AME DOT fhirHumanNameAttrs | ATT_VALUEI_DENTIFIER DOT fhirIdentifierAttrs | ATT_VALUEM_ONEY DOT fhirMoneyAttrs | ATT_VALUEP_ERIOD DOT fhirPeriodAttrs | ATT_VALUEQ_UANTITY DOT fhirQuantityAttrs | ATT_VALUER_ANGE DOT fhirRangeAttrs | ATT_VALUER_ATIO DOT fhirRatioAttrs | ATT_VALUER_EFERENCE ( DOT fhirReferenceAttrs )? | ATT_VALUES_AMPLEDD_ATA DOT fhirSampledDataAttrs | ATT_VALUES_IGNATURE DOT fhirSignatureAttrs | ATT_VALUET_IMING DOT fhirTimingAttrs | ATT_VALUEM_ETA DOT fhirMetaAttrs
	;

fhirTaskAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirIdentifierAttrs | ATT_DEFINITIONU_RI | ATT_DEFINITIONR_EFERENCE ( DOT fhirReferenceAttrs )? | ATT_BASEDO_N OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_GROUPI_DENTIFIER DOT fhirIdentifierAttrs | ATT_PARTO_F OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_STATUS | ATT_STATUSR_EASON ( DOT fhirCodeableConceptAttrs )? | ATT_BUSINESSS_TATUS ( DOT fhirCodeableConceptAttrs )? | ATT_INTENT | ATT_PRIORITY | ATT_CODE ( DOT fhirCodeableConceptAttrs )? | ATT_DESCRIPTION | ATT_FOCUS ( DOT fhirReferenceAttrs )? | ATT_FOR ( DOT fhirReferenceAttrs )? | ATT_CONTEXT ( DOT fhirReferenceAttrs )? | ATT_EXECUTIONP_ERIOD DOT fhirPeriodAttrs | ATT_AUTHOREDO_N | ATT_LASTM_ODIFIED | ATT_REQUESTER DOT fhirTaskRequesterRequesterAttrs | ATT_PERFORMERT_YPE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_OWNER ( DOT fhirReferenceAttrs )? | ATT_REASON ( DOT fhirCodeableConceptAttrs )? | ATT_NOTE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirAnnotationAttrs | ATT_RELEVANTH_ISTORY OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_RESTRICTION DOT fhirTaskRestrictionRestrictionAttrs | ATT_INPUT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirTaskInputInputAttrs | ATT_OUTPUT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirTaskOutputOutputAttrs
	;

fhirTestReport
	: RES_T_ESTR_EPORT LT ID GT WITH fhirTestReportAttrs EQ value (COMMA fhirTestReportAttrs EQ value)* SEMI_COLON
	;

fhirTestReportParticipantParticipant
	: RES_PARTICIPANT LT ID GT WITH fhirTestReportParticipantParticipantAttrs EQ value (COMMA fhirTestReportParticipantParticipantAttrs EQ value)* SEMI_COLON
	;

fhirTestReportParticipantParticipantAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_TYPE | ATT_URI | ATT_DISPLAY
	;

fhirTestReportSetupSetup
	: RES_SETUP LT ID GT WITH fhirTestReportSetupSetupAttrs EQ value (COMMA fhirTestReportSetupSetupAttrs EQ value)* SEMI_COLON
	;

fhirSetupActionAction
	: RES_ACTION LT ID GT WITH fhirSetupActionActionAttrs EQ value (COMMA fhirSetupActionActionAttrs EQ value)* SEMI_COLON
	;

fhirActionOperationOperation
	: RES_OPERATION LT ID GT WITH fhirActionOperationOperationAttrs EQ value (COMMA fhirActionOperationOperationAttrs EQ value)* SEMI_COLON
	;

fhirActionOperationOperationAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_RESULT | ATT_MESSAGE | ATT_DETAIL
	;

fhirActionAssertAssert
	: RES_ASSERT LT ID GT WITH fhirActionAssertAssertAttrs EQ value (COMMA fhirActionAssertAssertAttrs EQ value)* SEMI_COLON
	;

fhirActionAssertAssertAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_RESULT | ATT_MESSAGE | ATT_DETAIL
	;

fhirSetupActionActionAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_OPERATION DOT fhirActionOperationOperationAttrs | ATT_ASSERT DOT fhirActionAssertAssertAttrs
	;

fhirTestReportSetupSetupAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_ACTION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirSetupActionActionAttrs
	;

fhirTestReportTestTest
	: RES_TEST LT ID GT WITH fhirTestReportTestTestAttrs EQ value (COMMA fhirTestReportTestTestAttrs EQ value)* SEMI_COLON
	;

fhirTestActionAction
	: RES_ACTION LT ID GT WITH fhirTestActionActionAttrs EQ value (COMMA fhirTestActionActionAttrs EQ value)* SEMI_COLON
	;

fhirTestActionActionAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs
	;

fhirTestReportTestTestAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_NAME | ATT_DESCRIPTION | ATT_ACTION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirTestActionActionAttrs
	;

fhirTestReportTeardownTeardown
	: RES_TEARDOWN LT ID GT WITH fhirTestReportTeardownTeardownAttrs EQ value (COMMA fhirTestReportTeardownTeardownAttrs EQ value)* SEMI_COLON
	;

fhirTeardownActionAction
	: RES_ACTION LT ID GT WITH fhirTeardownActionActionAttrs EQ value (COMMA fhirTeardownActionActionAttrs EQ value)* SEMI_COLON
	;

fhirTeardownActionActionAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs
	;

fhirTestReportTeardownTeardownAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_ACTION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirTeardownActionActionAttrs
	;

fhirTestReportAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER DOT fhirIdentifierAttrs | ATT_NAME | ATT_STATUS | ATT_TESTS_CRIPT ( DOT fhirReferenceAttrs )? | ATT_RESULT | ATT_SCORE | ATT_TESTER | ATT_ISSUED | ATT_PARTICIPANT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirTestReportParticipantParticipantAttrs | ATT_SETUP DOT fhirTestReportSetupSetupAttrs | ATT_TEST OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirTestReportTestTestAttrs | ATT_TEARDOWN DOT fhirTestReportTeardownTeardownAttrs
	;

fhirTestScript
	: RES_T_ESTS_CRIPT LT ID GT WITH fhirTestScriptAttrs EQ value (COMMA fhirTestScriptAttrs EQ value)* SEMI_COLON
	;

fhirTestScriptOriginOrigin
	: RES_ORIGIN LT ID GT WITH fhirTestScriptOriginOriginAttrs EQ value (COMMA fhirTestScriptOriginOriginAttrs EQ value)* SEMI_COLON
	;

fhirTestScriptOriginOriginAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_INDEX | ATT_PROFILE ( DOT fhirCodingAttrs )?
	;

fhirTestScriptDestinationDestination
	: RES_DESTINATION LT ID GT WITH fhirTestScriptDestinationDestinationAttrs EQ value (COMMA fhirTestScriptDestinationDestinationAttrs EQ value)* SEMI_COLON
	;

fhirTestScriptDestinationDestinationAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_INDEX | ATT_PROFILE ( DOT fhirCodingAttrs )?
	;

fhirTestScriptMetadataMetadata
	: RES_METADATA LT ID GT WITH fhirTestScriptMetadataMetadataAttrs EQ value (COMMA fhirTestScriptMetadataMetadataAttrs EQ value)* SEMI_COLON
	;

fhirMetadataLinkLink
	: RES_LINK LT ID GT WITH fhirMetadataLinkLinkAttrs EQ value (COMMA fhirMetadataLinkLinkAttrs EQ value)* SEMI_COLON
	;

fhirMetadataLinkLinkAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_URL | ATT_DESCRIPTION
	;

fhirMetadataCapabilityCapability
	: RES_CAPABILITY LT ID GT WITH fhirMetadataCapabilityCapabilityAttrs EQ value (COMMA fhirMetadataCapabilityCapabilityAttrs EQ value)* SEMI_COLON
	;

fhirMetadataCapabilityCapabilityAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_REQUIRED | ATT_VALIDATED | ATT_DESCRIPTION | ATT_ORIGIN OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE | ATT_DESTINATION | ATT_LINK OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE | ATT_CAPABILITIES ( DOT fhirReferenceAttrs )?
	;

fhirTestScriptMetadataMetadataAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_LINK OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirMetadataLinkLinkAttrs | ATT_CAPABILITY OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirMetadataCapabilityCapabilityAttrs
	;

fhirTestScriptFixtureFixture
	: RES_FIXTURE LT ID GT WITH fhirTestScriptFixtureFixtureAttrs EQ value (COMMA fhirTestScriptFixtureFixtureAttrs EQ value)* SEMI_COLON
	;

fhirTestScriptFixtureFixtureAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_AUTOCREATE | ATT_AUTODELETE | ATT_RESOURCE ( DOT fhirReferenceAttrs )?
	;

fhirTestScriptVariableVariable
	: RES_VARIABLE LT ID GT WITH fhirTestScriptVariableVariableAttrs EQ value (COMMA fhirTestScriptVariableVariableAttrs EQ value)* SEMI_COLON
	;

fhirTestScriptVariableVariableAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_NAME | ATT_DEFAULTV_ALUE | ATT_DESCRIPTION | ATT_EXPRESSION | ATT_HEADERF_IELD | ATT_HINT | ATT_PATH | ATT_SOURCEI_D
	;

fhirTestScriptRuleRule
	: RES_RULE LT ID GT WITH fhirTestScriptRuleRuleAttrs EQ value (COMMA fhirTestScriptRuleRuleAttrs EQ value)* SEMI_COLON
	;

fhirRuleParamParam
	: RES_PARAM LT ID GT WITH fhirRuleParamParamAttrs EQ value (COMMA fhirRuleParamParamAttrs EQ value)* SEMI_COLON
	;

fhirRuleParamParamAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_NAME | ATT_VALUE
	;

fhirTestScriptRuleRuleAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_RESOURCE ( DOT fhirReferenceAttrs )? | ATT_PARAM OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirRuleParamParamAttrs
	;

fhirTestScriptRulesetRuleset
	: RES_RULESET LT ID GT WITH fhirTestScriptRulesetRulesetAttrs EQ value (COMMA fhirTestScriptRulesetRulesetAttrs EQ value)* SEMI_COLON
	;

fhirRulesetRuleRule
	: RES_RULE LT ID GT WITH fhirRulesetRuleRuleAttrs EQ value (COMMA fhirRulesetRuleRuleAttrs EQ value)* SEMI_COLON
	;

fhirRulesetRuleRuleAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_RULEI_D | ATT_PARAM OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirRuleParamParamAttrs
	;

fhirTestScriptRulesetRulesetAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_RESOURCE ( DOT fhirReferenceAttrs )? | ATT_RULE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirRulesetRuleRuleAttrs
	;

fhirTestScriptSetupSetup
	: RES_SETUP LT ID GT WITH fhirTestScriptSetupSetupAttrs EQ value (COMMA fhirTestScriptSetupSetupAttrs EQ value)* SEMI_COLON
	;

fhirTestScriptSetupSetupAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_ACTION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirSetupActionActionAttrs
	;

fhirTestScriptTestTest
	: RES_TEST LT ID GT WITH fhirTestScriptTestTestAttrs EQ value (COMMA fhirTestScriptTestTestAttrs EQ value)* SEMI_COLON
	;

fhirTestScriptTestTestAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_NAME | ATT_DESCRIPTION | ATT_ACTION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirTestActionActionAttrs
	;

fhirTestScriptTeardownTeardown
	: RES_TEARDOWN LT ID GT WITH fhirTestScriptTeardownTeardownAttrs EQ value (COMMA fhirTestScriptTeardownTeardownAttrs EQ value)* SEMI_COLON
	;

fhirTestScriptTeardownTeardownAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_ACTION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirTeardownActionActionAttrs
	;

fhirTestScriptAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_URL | ATT_IDENTIFIER DOT fhirIdentifierAttrs | ATT_VERSION | ATT_NAME | ATT_TITLE | ATT_STATUS | ATT_EXPERIMENTAL | ATT_DATE | ATT_PUBLISHER | ATT_CONTACT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirContactDetailAttrs | ATT_DESCRIPTION | ATT_USEC_ONTEXT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirUsageContextAttrs | ATT_JURISDICTION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_PURPOSE | ATT_COPYRIGHT | ATT_ORIGIN OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirTestScriptOriginOriginAttrs | ATT_DESTINATION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirTestScriptDestinationDestinationAttrs | ATT_METADATA DOT fhirTestScriptMetadataMetadataAttrs | ATT_FIXTURE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirTestScriptFixtureFixtureAttrs | ATT_PROFILE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirReferenceAttrs )? | ATT_VARIABLE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirTestScriptVariableVariableAttrs | ATT_RULE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirTestScriptRuleRuleAttrs | ATT_RULESET OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirTestScriptRulesetRulesetAttrs | ATT_SETUP DOT fhirTestScriptSetupSetupAttrs | ATT_TEST OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirTestScriptTestTestAttrs | ATT_TEARDOWN DOT fhirTestScriptTeardownTeardownAttrs
	;

fhirValueSet
	: RES_V_ALUES_ET LT ID GT WITH fhirValueSetAttrs EQ value (COMMA fhirValueSetAttrs EQ value)* SEMI_COLON
	;

fhirValueSetComposeCompose
	: RES_COMPOSE LT ID GT WITH fhirValueSetComposeComposeAttrs EQ value (COMMA fhirValueSetComposeComposeAttrs EQ value)* SEMI_COLON
	;

fhirComposeIncludeInclude
	: RES_INCLUDE LT ID GT WITH fhirComposeIncludeIncludeAttrs EQ value (COMMA fhirComposeIncludeIncludeAttrs EQ value)* SEMI_COLON
	;

fhirIncludeConceptConcept
	: RES_CONCEPT LT ID GT WITH fhirIncludeConceptConceptAttrs EQ value (COMMA fhirIncludeConceptConceptAttrs EQ value)* SEMI_COLON
	;

fhirIncludeConceptConceptAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_CODE | ATT_DISPLAY | ATT_DESIGNATION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirConceptDesignationDesignationAttrs
	;

fhirIncludeFilterFilter
	: RES_FILTER LT ID GT WITH fhirIncludeFilterFilterAttrs EQ value (COMMA fhirIncludeFilterFilterAttrs EQ value)* SEMI_COLON
	;

fhirIncludeFilterFilterAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_PROPERTY | ATT_OP | ATT_VALUE
	;

fhirComposeIncludeIncludeAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_SYSTEM | ATT_VERSION | ATT_CONCEPT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirIncludeConceptConceptAttrs | ATT_FILTER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirIncludeFilterFilterAttrs | ATT_VALUES_ET OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE
	;

fhirValueSetComposeComposeAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_LOCKEDD_ATE | ATT_INACTIVE | ATT_INCLUDE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirComposeIncludeIncludeAttrs
	;

fhirValueSetExpansionExpansion
	: RES_EXPANSION LT ID GT WITH fhirValueSetExpansionExpansionAttrs EQ value (COMMA fhirValueSetExpansionExpansionAttrs EQ value)* SEMI_COLON
	;

fhirExpansionParameterParameter
	: RES_PARAMETER LT ID GT WITH fhirExpansionParameterParameterAttrs EQ value (COMMA fhirExpansionParameterParameterAttrs EQ value)* SEMI_COLON
	;

fhirExpansionParameterParameterAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_NAME | ATT_VALUES_TRING | ATT_VALUEB_OOLEAN | ATT_VALUEI_NTEGER | ATT_VALUED_ECIMAL | ATT_VALUEU_RI | ATT_VALUEC_ODE
	;

fhirExpansionContainsContains
	: RES_CONTAINS LT ID GT WITH fhirExpansionContainsContainsAttrs EQ value (COMMA fhirExpansionContainsContainsAttrs EQ value)* SEMI_COLON
	;

fhirExpansionContainsContainsAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_SYSTEM | ATT_ABSTRACT | ATT_INACTIVE | ATT_VERSION | ATT_CODE | ATT_DISPLAY
	;

fhirValueSetExpansionExpansionAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER | ATT_TIMESTAMP | ATT_TOTAL | ATT_OFFSET | ATT_PARAMETER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExpansionParameterParameterAttrs | ATT_CONTAINS OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExpansionContainsContainsAttrs
	;

fhirValueSetAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_URL | ATT_IDENTIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirIdentifierAttrs | ATT_VERSION | ATT_NAME | ATT_TITLE | ATT_STATUS | ATT_EXPERIMENTAL | ATT_DATE | ATT_PUBLISHER | ATT_CONTACT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirContactDetailAttrs | ATT_DESCRIPTION | ATT_USEC_ONTEXT OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirUsageContextAttrs | ATT_JURISDICTION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE ( DOT fhirCodeableConceptAttrs )? | ATT_IMMUTABLE | ATT_PURPOSE | ATT_COPYRIGHT | ATT_EXTENSIBLE | ATT_COMPOSE DOT fhirValueSetComposeComposeAttrs | ATT_EXPANSION DOT fhirValueSetExpansionExpansionAttrs
	;

fhirVisionPrescription
	: RES_V_ISIONP_RESCRIPTION LT ID GT WITH fhirVisionPrescriptionAttrs EQ value (COMMA fhirVisionPrescriptionAttrs EQ value)* SEMI_COLON
	;

fhirVisionPrescriptionDispenseDispense
	: RES_DISPENSE LT ID GT WITH fhirVisionPrescriptionDispenseDispenseAttrs EQ value (COMMA fhirVisionPrescriptionDispenseDispenseAttrs EQ value)* SEMI_COLON
	;

fhirVisionPrescriptionDispenseDispenseAttrs
	: ATT_ID | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_PRODUCT ( DOT fhirCodeableConceptAttrs )? | ATT_EYE | ATT_SPHERE | ATT_CYLINDER | ATT_AXIS | ATT_PRISM | ATT_BASE | ATT_ADD | ATT_POWER | ATT_BACKC_URVE | ATT_DIAMETER | ATT_DURATION DOT fhirQuantityAttrs | ATT_COLOR | ATT_BRAND | ATT_NOTE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirAnnotationAttrs
	;

fhirVisionPrescriptionAttrs
	: ATT_ID | ATT_META DOT fhirMetaAttrs | ATT_IMPLICITR_ULES | ATT_LANGUAGE | ATT_TEXT DOT fhirNarrativeAttrs | ATT_EXTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_MODIFIERE_XTENSION OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirExtensionAttrs | ATT_IDENTIFIER OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirIdentifierAttrs | ATT_STATUS | ATT_PATIENT ( DOT fhirReferenceAttrs )? | ATT_ENCOUNTER ( DOT fhirReferenceAttrs )? | ATT_DATEW_RITTEN | ATT_PRESCRIBER ( DOT fhirReferenceAttrs )? | ATT_REASONC_ODEABLEC_ONCEPT ( DOT fhirCodeableConceptAttrs )? | ATT_REASONR_EFERENCE ( DOT fhirReferenceAttrs )? | ATT_DISPENSE OPEN_SQUARE NUMERIC_VALUE CLOSE_SQUARE DOT fhirVisionPrescriptionDispenseDispenseAttrs
	;

resource
	: fhirMeasure | fhirPaymentNotice | fhirRatio | fhirBasic | fhirClaim | fhirDiagnosticReport | fhirGroup | fhirBodySite | fhirImplementationGuide | fhirCondition | fhirReference | fhirChargeItem | fhirCompartmentDefinition | fhirPractitionerRole | fhirConsent | fhirDeviceUseStatement | fhirAddress | fhirMedicationStatement | fhirMedia | fhirAccount | fhirExpansionProfile | fhirMedicationRequest | fhirImmunization | fhirFamilyMemberHistory | fhirCoding | fhirEncounter | fhirCareTeam | fhirConceptMap | fhirRelatedArtifact | fhirMessageHeader | fhirEpisodeOfCare | fhirMoney | fhirLocation | fhirPeriod | fhirCapabilityStatement | fhirCodeSystem | fhirDocumentManifest | fhirImmunizationRecommendation | fhirAdverseEvent | fhirMedicationDispense | fhirPatient | fhirSampledData | fhirTask | fhirQuestionnaire | fhirDeviceMetric | fhirDosage | fhirGraphDefinition | fhirContactDetail | fhirClinicalImpression | fhirProcessRequest | fhirDeviceRequest | fhirEligibilityRequest | fhirCoverage | fhirDevice | fhirDeviceComponent | fhirMeasureReport | fhirHealthcareService | fhirTriggerDefinition | fhirDuration | fhirNamingSystem | fhirList | fhirVisionPrescription | fhirRequestGroup | fhirSpecimen | fhirSearchParameter | fhirDataRequirement | fhirRelatedPerson | fhirResearchSubject | fhirAnnotation | fhirQuestionnaireResponse | fhirImagingStudy | fhirPlanDefinition | fhirSupplyRequest | fhirParameterDefinition | fhirClaimResponse | fhirElementDefinition | fhirQuantity | fhirPerson | fhirMessageDefinition | fhirSubscription | fhirOrganization | fhirReferralRequest | fhirDocumentReference | fhirAppointmentResponse | fhirTestReport | fhirContributor | fhirPaymentReconciliation | fhirServiceDefinition | fhirFlag | fhirAge | fhirProcedure | fhirSchedule | fhirDetectedIssue | fhirEnrollmentRequest | fhirValueSet | fhirSubstance | fhirCodeableConcept | fhirUsageContext | fhirExplanationOfBenefit | fhirCommunication | fhirResearchStudy | fhirPractitioner | fhirLibrary | fhirOperationOutcome | fhirStructureMap | fhirBinary | fhirRiskAssessment | fhirParameters | fhirProcessResponse | fhirStructureDefinition | fhirExtension | fhirContract | fhirMeta | fhirLinkage | fhirEndpoint | fhirGoal | fhirSupplyDelivery | fhirEligibilityResponse | fhirImagingManifest | fhirIdentifier | fhirSlot | fhirDistance | fhirObservation | fhirTiming | fhirCarePlan | fhirGuidanceResponse | fhirSequence | fhirAuditEvent | fhirEnrollmentResponse | fhirSignature | fhirMedication | fhirOperationDefinition | fhirTestScript | fhirDataElement | fhirProcedureRequest | fhirCommunicationRequest | fhirHumanName | fhirActivityDefinition | fhirContactPoint | fhirSimpleQuantity | fhirMedicationAdministration | fhirAppointment | fhirNutritionOrder | fhirNarrative | fhirRange | fhirAllergyIntolerance | fhirComposition | fhirAttachment | fhirBundle | fhirCount | fhirProvenance
	;

referenceValue
	: REFERENCE OPEN_ROUND (RES_A_CCOUNT | RES_A_CTIVITYD_EFINITION | RES_A_DDRESS | RES_A_DVERSEE_VENT | RES_A_GE | RES_A_LLERGYI_NTOLERANCE | RES_A_NNOTATION | RES_A_PPOINTMENT | RES_A_PPOINTMENTR_ESPONSE | RES_A_TTACHMENT | RES_A_UDITE_VENT | RES_B_ASIC | RES_B_INARY | RES_B_ODYS_ITE | RES_B_UNDLE | RES_C_APABILITYS_TATEMENT | RES_C_AREP_LAN | RES_C_ARET_EAM | RES_C_HARGEI_TEM | RES_C_LAIM | RES_C_LAIMR_ESPONSE | RES_C_LINICALI_MPRESSION | RES_C_ODES_YSTEM | RES_C_ODEABLEC_ONCEPT | RES_C_ODING | RES_C_OMMUNICATION | RES_C_OMMUNICATIONR_EQUEST | RES_C_OMPARTMENTD_EFINITION | RES_C_OMPOSITION | RES_C_ONCEPTM_AP | RES_C_ONDITION | RES_C_ONSENT | RES_C_ONTACTD_ETAIL | RES_C_ONTACTP_OINT | RES_C_ONTRACT | RES_C_ONTRIBUTOR | RES_C_OUNT | RES_C_OVERAGE | RES_D_ATAE_LEMENT | RES_D_ATAR_EQUIREMENT | RES_D_ETECTEDI_SSUE | RES_D_EVICE | RES_D_EVICEC_OMPONENT | RES_D_EVICEM_ETRIC | RES_D_EVICER_EQUEST | RES_D_EVICEU_SES_TATEMENT | RES_D_IAGNOSTICR_EPORT | RES_D_ISTANCE | RES_D_OCUMENTM_ANIFEST | RES_D_OCUMENTR_EFERENCE | RES_D_OSAGE | RES_D_URATION | RES_E_LEMENTD_EFINITION | RES_E_LIGIBILITYR_EQUEST | RES_E_LIGIBILITYR_ESPONSE | RES_E_NCOUNTER | RES_E_NDPOINT | RES_E_NROLLMENTR_EQUEST | RES_E_NROLLMENTR_ESPONSE | RES_E_PISODEO_FC_ARE | RES_E_XPANSIONP_ROFILE | RES_E_XPLANATIONO_FB_ENEFIT | RES_E_XTENSION | RES_F_AMILYM_EMBERH_ISTORY | RES_F_LAG | RES_G_OAL | RES_G_RAPHD_EFINITION | RES_G_ROUP | RES_G_UIDANCER_ESPONSE | RES_H_EALTHCARES_ERVICE | RES_H_UMANN_AME | RES_I_DENTIFIER | RES_I_MAGINGM_ANIFEST | RES_I_MAGINGS_TUDY | RES_I_MMUNIZATION | RES_I_MMUNIZATIONR_ECOMMENDATION | RES_I_MPLEMENTATIONG_UIDE | RES_L_IBRARY | RES_L_INKAGE | RES_L_IST | RES_L_OCATION | RES_M_EASURE | RES_M_EASURER_EPORT | RES_M_EDIA | RES_M_EDICATION | RES_M_EDICATIONA_DMINISTRATION | RES_M_EDICATIOND_ISPENSE | RES_M_EDICATIONR_EQUEST | RES_M_EDICATIONS_TATEMENT | RES_M_ESSAGED_EFINITION | RES_M_ESSAGEH_EADER | RES_M_ETA | RES_M_ONEY | RES_N_AMINGS_YSTEM | RES_N_ARRATIVE | RES_N_UTRITIONO_RDER | RES_O_BSERVATION | RES_O_PERATIOND_EFINITION | RES_O_PERATIONO_UTCOME | RES_O_RGANIZATION | RES_P_ARAMETERD_EFINITION | RES_P_ARAMETERS | RES_P_ATIENT | RES_P_AYMENTN_OTICE | RES_P_AYMENTR_ECONCILIATION | RES_P_ERIOD | RES_P_ERSON | RES_P_LAND_EFINITION | RES_P_RACTITIONER | RES_P_RACTITIONERR_OLE | RES_P_ROCEDURE | RES_P_ROCEDURER_EQUEST | RES_P_ROCESSR_EQUEST | RES_P_ROCESSR_ESPONSE | RES_P_ROVENANCE | RES_Q_UANTITY | RES_Q_UESTIONNAIRE | RES_Q_UESTIONNAIRER_ESPONSE | RES_R_ANGE | RES_R_ATIO | RES_R_EFERENCE | RES_R_EFERRALR_EQUEST | RES_R_ELATEDA_RTIFACT | RES_R_ELATEDP_ERSON | RES_R_EQUESTG_ROUP | RES_R_ESEARCHS_TUDY | RES_R_ESEARCHS_UBJECT | RES_R_ISKA_SSESSMENT | RES_S_AMPLEDD_ATA | RES_S_CHEDULE | RES_S_EARCHP_ARAMETER | RES_S_EQUENCE | RES_S_ERVICED_EFINITION | RES_S_IGNATURE | RES_S_IMPLEQ_UANTITY | RES_S_LOT | RES_S_PECIMEN | RES_S_TRUCTURED_EFINITION | RES_S_TRUCTUREM_AP | RES_S_UBSCRIPTION | RES_S_UBSTANCE | RES_S_UPPLYD_ELIVERY | RES_S_UPPLYR_EQUEST | RES_T_ASK | RES_T_ESTR_EPORT | RES_T_ESTS_CRIPT | RES_T_IMING | RES_T_RIGGERD_EFINITION | RES_U_SAGEC_ONTEXT | RES_V_ALUES_ET | RES_V_ISIONP_RESCRIPTION | RES_ACCIDENT | RES_ACTION | RES_ACTIVITY | RES_ACTOR | RES_ADDI_TEM | RES_ADJUDICATION | RES_ADMINISTRATION | RES_AGENT | RES_ALLOWEDR_ESPONSE | RES_ANIMAL | RES_ANSWER | RES_ARM | RES_ASSERT | RES_ATTESTER | RES_AVAILABLET_IME | RES_BASE | RES_BATCH | RES_BENEFITB_ALANCE | RES_BINDING | RES_CALIBRATION | RES_CAPABILITY | RES_CARET_EAM | RES_CERTIFICATE | RES_CHANNEL | RES_CHARACTERISTIC | RES_CLASSH_ISTORY | RES_CODEF_ILTER | RES_COLLECTION | RES_COMMUNICATION | RES_COMPARTMENT | RES_COMPONENT | RES_COMPOSE | RES_CONCEPT | RES_CONDITION | RES_CONSTRAINT | RES_CONTACT | RES_CONTAINER | RES_CONTAINS | RES_CONTENT | RES_CONTEXT | RES_COVERAGE | RES_DATA | RES_DATEC_RITERION | RES_DATEF_ILTER | RES_DEPENDENCY | RES_DEPENDENT | RES_DEPENDSO_N | RES_DESIGNATION | RES_DESTINATION | RES_DETAIL | RES_DIAGNOSIS | RES_DIFFERENTIAL | RES_DISCRIMINATOR | RES_DISPENSE | RES_DISPENSER_EQUEST | RES_DOCUMENT | RES_DOSAGE | RES_DYNAMICV_ALUE | RES_ELEMENT | RES_ENABLEW_HEN | RES_ENDPOINT | RES_ENTERALF_ORMULA | RES_ENTITY | RES_ENTRY | RES_ERROR | RES_EVENT | RES_EVIDENCE | RES_EXAMPLE | RES_EXCEPT | RES_EXCLUDE | RES_EXCLUDEDS_YSTEM | RES_EXPANSION | RES_EXPLANATION | RES_FILTER | RES_FINANCIAL | RES_FINDING | RES_FIXEDV_ERSION | RES_FIXTURE | RES_FOCALD_EVICE | RES_FOCUS | RES_FRIENDLY | RES_GLOBAL | RES_GOAL | RES_GROUP | RES_GROUPING | RES_GUARANTOR | RES_HOSPITALIZATION | RES_IMAGE | RES_IMPLEMENTATION | RES_INCLUDE | RES_INFORMATION | RES_INGREDIENT | RES_INPUT | RES_INSTANCE | RES_INSURANCE | RES_INTERACTION | RES_INVESTIGATION | RES_ISSUE | RES_ITEM | RES_LEGAL | RES_LINK | RES_LOCATION | RES_MAPPING | RES_MEMBER | RES_MESSAGING | RES_METADATA | RES_MITIGATION | RES_NETWORK | RES_NOTA_VAILABLE | RES_NUTRIENT | RES_OPERATION | RES_OPTION | RES_ORALD_IET | RES_ORDEREDI_TEM | RES_ORIGIN | RES_OUTPUT | RES_OVERLOAD | RES_PACKAGE | RES_PAGE | RES_PARAM | RES_PARAMETER | RES_PARTICIPANT | RES_PAYEE | RES_PAYLOAD | RES_PAYMENT | RES_PERFORMER | RES_POLICY | RES_POPULATION | RES_POSITION | RES_PRACTITIONER | RES_PREDICTION | RES_PROCEDURE | RES_PROCESSN_OTE | RES_PROCESSING | RES_PRODUCTIONS_PECIFICATION | RES_PROPERTY | RES_PROTOCOL | RES_QUALIFICATION | RES_QUALITY | RES_REACTION | RES_RECOMMENDATION | RES_REFERENCER_ANGE | RES_REFERENCES_EQ | RES_RELATED | RES_RELATEDA_CTION | RES_RELATEST_O | RES_REPEAT | RES_REPOSITORY | RES_REQUEST | RES_REQUESTER | RES_RESOURCE | RES_RESPONSE | RES_REST | RES_RESTRICTION | RES_RULE | RES_RULESET | RES_SEARCH | RES_SEARCHP_ARAM | RES_SECTION | RES_SECURITY | RES_SERIES | RES_SETUP | RES_SIGNER | RES_SLICING | RES_SNAPSHOT | RES_SOFTWARE | RES_SOURCE | RES_STAGE | RES_STATUSH_ISTORY | RES_STRATIFIER | RES_STRUCTURE | RES_STUDY | RES_SUBD_ETAIL | RES_SUBSTITUTION | RES_SUPPLEMENT | RES_SUPPLEMENTALD_ATA | RES_SUPPLIEDI_TEM | RES_SUPPORTEDM_ESSAGE | RES_SUSPECTE_NTITY | RES_TARGET | RES_TEARDOWN | RES_TERM | RES_TEST | RES_TEXTURE | RES_TYPE | RES_UDI | RES_UNIQUEI_D | RES_UNMAPPED | RES_VACCINATIONP_ROTOCOL | RES_VALUEDI_TEM | RES_VARIABLE | RES_VARIANT) LT ID GT CLOSE_ROUND
	;
