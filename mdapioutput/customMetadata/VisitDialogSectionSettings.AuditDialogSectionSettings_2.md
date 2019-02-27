<?xml version="1.0" encoding="UTF-8"?>
<CustomMetadata xmlns="http://soap.sforce.com/2006/04/metadata" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
    <label>Audit Dialog Section Settings 2</label>
    <protected>false</protected>
    <values>
        <field>CreateAllowed__c</field>
        <value xsi:type="xsd:boolean">true</value>
    </values>
    <values>
        <field>DeleteAllowed__c</field>
        <value xsi:type="xsd:boolean">true</value>
    </values>
    <values>
        <field>FieldsLayout__c</field>
        <value xsi:type="xsd:string">CORE_ProductImageFileName__c,CTCPG__ProductId__c,CTCPG__Quantity__c</value>
    </values>
    <values>
        <field>LookupAPINameToParentObject__c</field>
        <value xsi:type="xsd:string">CTCPG__ActivityId__c</value>
    </values>
    <values>
        <field>ReadOnlyAttribute__c</field>
        <value xsi:type="xsd:string">true,false,false</value>
    </values>
    <values>
        <field>RecordCondition__c</field>
        <value xsi:type="xsd:string">where RecordTypeId.DeveloperName = 'CompetitorProductTracking'</value>
    </values>
    <values>
        <field>RelatedObjectRecordType__c</field>
        <value xsi:type="xsd:string">DemoAudit</value>
    </values>
    <values>
        <field>RelatedObject__c</field>
        <value xsi:type="xsd:string">CTCPG__ActivityData__c</value>
    </values>
    <values>
        <field>RequiredAttribute__c</field>
        <value xsi:type="xsd:string">false,false,false</value>
    </values>
    <values>
        <field>SectionLabel__c</field>
        <value xsi:type="xsd:string">Activity Data</value>
    </values>
    <values>
        <field>SectionOrder__c</field>
        <value xsi:type="xsd:double">2.0</value>
    </values>
    <values>
        <field>VisitDialogTab__c</field>
        <value xsi:type="xsd:string">AuditDialogTabSettings_2</value>
    </values>
</CustomMetadata>
