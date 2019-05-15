List<Account> accounts = [SELECT id, MatrixId__c From Account];
List<Matrix__c> matrixes = [SELECT id FROM Matrix__c WHERE ExternalId__c = '3422'];
Id matrixId = matrixes[0].Id;
for(Account curAccount : accounts){
    curAccount.MatrixId__c = matrixId;
}

update accounts;

clm__TopLvlObjects__c newTop = clm__TopLvlObjects__c.getOrgDefaults();
newTop.clm__ConflictManagerAttribute__c = 'false,false,false,false,false,false,false,false,false';
newTop.clm__GroupFields__c = 'null,null,null,null,null,null,null';
newTop.clm__MenuSettings__c = 'Home,Account,Contact,Calendar,CTCPG__Activity__c,Applications,Dashboards,Routes,NearbyAccounts,Chatter,Settings';
newTop.clm__TopLvlObjects__c = 'Account,Contact,Event,CTCPG__Activity__c,CTCPG__ActivityData__c,CTCPG__CalendarSettings__c,Matrix__c,MatrixLineItem__c,CTCPG__Product__c';
newTop.clm__OnlineAttribute__c = 'false,false,false,false,false,false,false,,false,false,false';
newTop.clm__SortOrder__c = 'null,ASC,,,,,,,,,null';
upsert newTop;

clm__ApplicationSetup__c newApp = clm__ApplicationSetup__c.getOrgDefaults();
newApp.clm__AccountFullAddressAPIField__c = 'FullAddress__c';
newApp.clm__AccountGeolocationAPIField__c = 'Geolocation__c';
newApp.clm__ActivityDescriptionAPI__c = 'CTCPG__Description__c';
newApp.clm__ActivityEndDateAPI__c = 'CTCPG__EndDate__c';
newApp.clm__ActivityGeolocationAPIField__c = 'Geolocation__c';
newApp.clm__ActivityFieldAPI__c = 'CTCPG__ActivityId__c';
newApp.clm__ActivityObjectAPIName__c = 'CTCPG__Activity__c';
newApp.clm__ActivityDateAPI__c = 'CTCPG__StartDate__c';
newApp.clm__ActivityStatusAPI__c = 'CTCPG__Status__c';
newApp.clm__AllowWebSharing__c = false;
newApp.clm__AppInstallURL__c = 'https://www.ctmobile.net/download/';
newApp.clm__CalendarView__c = 'week';
newApp.clm__CaptureGeoposition__c = true;
newApp.clm__CloudToken__c = 'd7c6f75086553b545788523b09c1a9eb93cc0dbf92d45c5a6c';
newApp.clm__DebugLevel__c = 'Error';
newApp.clm__DefaultEventDuration__c = 30;
newApp.clm__GeoTraceInterval__c = 60;
newApp.clm__GoogleMapsAPIKey__c = 'AIzaSyDGjrQC-y-hacbLx1UfcvQb9oWVuAdVgd0';
newApp.clm__GoogleMapsJSKey__c = 'AIzaSyDGIeVgmio7Jk0zl1P5Wdvb1r-hEmuuGOY';
newApp.clm__EnableLockUnlock__c = true;
newApp.clm__MetadataLastModifiedDate__c = System.now();
newApp.clm__IsPasscodeEnabled__c = false;
newApp.clm__IsPersonAccountsEnabled__c = false;
newApp.clm__ProductFieldAPI__c = 'CTCPG__ProductId_auto__c';
newApp.clm__ProductObjectAPIName__c = 'CTCPG__Product__c';
newApp.clm__PUSHHUBName__c = 'CTMobile';
newApp.clm__ReferenceObjectAPIName__c = 'AccountContactRelation';
newApp.clm__IsWeekSwitchShowed__c = true;
newApp.clm__EnableStartFinish__c = true;
newApp.clm__Theme__c = 'rgb(37, 38, 38)';
newApp.clm__UpdateDateFields__c = false;
newApp.clm__VisibleHourRange__c = '(8,22)';
newApp.clm__WeekFormat__c = 'mo,mo,fr';
upsert newApp;


List<clm__MobileLayoutSettings__c> settings = new List<clm__MobileLayoutSettings__c>();

List<clm__MobileLayoutSettings__c> newSettings = [SELECT Name FROM clm__MobileLayoutSettings__c WHERE Name = 'New Timeoff'];
if(newSettings.size() == 0){
	settings.add(new clm__MobileLayoutSettings__c());
}else{
	settings.add(newSettings[0]);
}
settings[0].clm__Action__c = 'New';
settings[0].clm__Fields__c = 'CTCPG__StartDate__c,CTCPG__EndDate__c,CTCPG__Description__c';
settings[0].clm__RecordtypeDeveloperName__c = 'Timeoff';
settings[0].clm__RequiredAttribute__c = 'true,false,false';
settings[0].clm__SObject__c = 'CTCPG__Activity__c';
settings[0].Name = 'New Timeoff';

newSettings = [SELECT Name FROM clm__MobileLayoutSettings__c WHERE Name = 'New Joint Visit'];
if(newSettings.size() == 0){
	settings.add(new clm__MobileLayoutSettings__c());
}else{
	settings.add(newSettings[0]);
}
settings[1].clm__Action__c = 'New';
settings[1].clm__Fields__c = 'CTCPG__StartDate__c,CTCPG__UserId__c,CTCPG__Description__c';
settings[1].clm__RecordtypeDeveloperName__c = 'JointVisit';
settings[1].clm__RequiredAttribute__c = 'true,false,false';
settings[1].clm__SObject__c = 'CTCPG__Activity__c';
settings[1].Name = 'New Joint Visit';

newSettings = [SELECT Name FROM clm__MobileLayoutSettings__c WHERE Name = 'New Temporary Account'];
if(newSettings.size() == 0){
	settings.add(new clm__MobileLayoutSettings__c());
}else{
	settings.add(newSettings[0]);
}
settings[2].clm__Action__c = 'New';
settings[2].clm__Fields__c = 'Name,Phone,Description';
settings[2].clm__RecordtypeDeveloperName__c = 'Account_Temporary';
settings[2].clm__RequiredAttribute__c = 'true,false,false';
settings[2].clm__SObject__c = 'Account';
settings[2].Name = 'New Temporary Account';

newSettings = [SELECT Name FROM clm__MobileLayoutSettings__c WHERE Name = 'New Succession Account'];
if(newSettings.size() == 0){
	settings.add(new clm__MobileLayoutSettings__c());
}else{
	settings.add(newSettings[0]);
}
settings[3].clm__Action__c = 'New';
settings[3].clm__Fields__c = 'Name,Phone,Description';
settings[3].clm__RecordtypeDeveloperName__c = 'Account_Succession';
settings[3].clm__RequiredAttribute__c = 'true,false,false';
settings[3].clm__SObject__c = 'Account';
settings[3].Name = 'New Succession Account';

newSettings = [SELECT Name FROM clm__MobileLayoutSettings__c WHERE Name = 'New Assortment'];
if(newSettings.size() == 0){
	settings.add(new clm__MobileLayoutSettings__c());
}else{
	settings.add(newSettings[0]);
}
settings[4].clm__Action__c = 'New';
settings[4].clm__Fields__c = 'AccountId__c';
settings[4].clm__RecordtypeDeveloperName__c = 'Assortiment';
settings[4].clm__RequiredAttribute__c = 'false';
settings[4].clm__SObject__c = 'Assortiment__c';
settings[4].Name = 'New Assortment';

newSettings = [SELECT Name FROM clm__MobileLayoutSettings__c WHERE Name = 'New Task'];
if(newSettings.size() == 0){
	settings.add(new clm__MobileLayoutSettings__c());
}else{
	settings.add(newSettings[0]);
}
settings[5].clm__Action__c = 'New';
settings[5].clm__Fields__c = 'ActivityDate,Subject,WhatId,Description';
settings[5].clm__RecordtypeDeveloperName__c = 'Task';
settings[5].clm__RequiredAttribute__c = 'true,true,false,false';
settings[5].clm__SObject__c = 'Task';
settings[5].Name = 'New Task';

newSettings = [SELECT Name FROM clm__MobileLayoutSettings__c WHERE Name = 'New Visit'];
if(newSettings.size() == 0){
	settings.add(new clm__MobileLayoutSettings__c());
}else{
	settings.add(newSettings[0]);
}
settings[6].clm__Action__c = 'New';
settings[6].clm__Fields__c = 'CTCPG__StartDate__c,CTCPG__AccountId__c,CTCPG__Objective__c,CTCPG__Description__c';
settings[6].clm__RecordtypeDeveloperName__c = 'Visit';
settings[6].clm__RequiredAttribute__c = 'true,false,false,false';
settings[6].clm__SObject__c = 'CTCPG__Activity__c';
settings[6].Name = 'New Visit';

newSettings = [SELECT Name FROM clm__MobileLayoutSettings__c WHERE Name = 'Audit'];
if(newSettings.size() == 0){
	settings.add(new clm__MobileLayoutSettings__c());
}else{
	settings.add(newSettings[0]);
}
settings[7].clm__Action__c = 'New';
settings[7].clm__Fields__c = 'CTCPG__AccountId__c,CTCPG__StartDate__c,CTCPG__EndDate__c';
settings[7].clm__RecordtypeDeveloperName__c = 'DemoAudit';
settings[7].clm__RequiredAttribute__c = 'true,false,false';
settings[7].clm__SObject__c = 'CTCPG__Activity__c';
settings[7].Name = 'Audit';

newSettings = [SELECT Name FROM clm__MobileLayoutSettings__c WHERE Name = 'Event'];
if(newSettings.size() == 0){
	settings.add(new clm__MobileLayoutSettings__c());
}else{
	settings.add(newSettings[0]);
}
settings[8].clm__Action__c = 'New';
settings[8].clm__Fields__c = 'CTCPG__AccountId__c,CTCPG__StartDate__c,CTCPG__EndDate__c';
settings[8].clm__RecordtypeDeveloperName__c = 'Event';
settings[8].clm__RequiredAttribute__c = 'true,false,false';
settings[8].clm__SObject__c = 'CTCPG__Activity__c';
settings[8].Name = 'Event';

upsert settings;

List<Document> documents = [SELECT Id, Name, Body FROM Document WHERE Name = 'CT Mobile Homepage Settings'];
Folder folder = [SELECT Id, Name FROM Folder WHERE Name = 'CT CLM'];
Report statusReport = [SELECT Id, Name, FolderName FROM Report WHERE DeveloperName='ActivitiyByStatus'];
Report typeReport = [SELECT Id, Name FROM Report WHERE DeveloperName='Activity_by_Type'];
Folder reportFolder = [SELECT Id, Name FROM Folder WHERE Name = 'CT Reports'];
if(documents.size() == 0){
    documents.add(new Document(Name = 'CT Mobile Homepage Settings', FolderId = folder.Id));
}
String orgId = UserInfo.getOrganizationId();
String newBlob = '[{"size":{"x":4,"y":1},"position":[0,0],"widget":{"id":1,"name":"Logo","type":"logo"},"profile":{"id":"';
newBlob += orgId;
newBlob += '","profileName":"General Settings"},"$$hashKey":"6FD"},';
newBlob += '{"size":{"x":4,"y":1},"position":[1,0],"widget":{"id":2,"name":"Calendar Week (carousel)","type":"calendarWeekCarousel"},"profile":{"id":"';
newBlob += orgId;
newBlob += '","profileName":"General Settings"},"$$hashKey":"6KP"},';
newBlob += '{"size":{"x":2,"y":2},"position":[2,0],"widget":{"id":"';
newBlob += statusReport.Id;
newBlob += '","name":"Activities by Status","type":"report","folderId":"';
newBlob += reportFolder.Id;
newBlob += '"},"profile":{"id":"';
newBlob += orgId;
newBlob += '","profileName":"General Settings"},"$$hashKey":"6DV"},';
newBlob += '{"size":{"x":2,"y":2},"position":[2,2],"widget":{"id":"';
newBlob += typeReport.Id;
newBlob += '","name":"Activities by Type","type":"report","folderId":"';
newBlob += reportFolder.Id;
newBlob += '"},"profile":{"id":"';
newBlob += orgId;
newBlob += '","profileName":"General Settings"},"$$hashKey":"6IA"}]';
documents[0].Body = Blob.valueOf(newBlob);
documents[0].DeveloperName = 'CTMobileHomepageSettings_1223334444';

upsert documents;

List<Document> logo = [SELECT Id, Name, Body FROM Document WHERE DeveloperName = 'Mobile_logo_png'];
if(logo.size() == 0){
    logo.add(new Document(Name = 'CT Mobile Homepage Settings', FolderId = folder.Id));
}
String png = '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';
logo[0].Body = Blob.valueOf(png);
logo[0].DeveloperName = 'Mobile_logo_png';

upsert logo;

List<CTCPG__Activity__c> activities = new List<CTCPG__Activity__c>();

List<String> statuses = new List<String>();
statuses.add('Planned');
statuses.add('In Progress');
statuses.add('Finished');
statuses.add('Canceled');

List<Id> recordTypeIds = new List<Id>();
recordTypeIds.add(Schema.SObjectType.CTCPG__Activity__c.getRecordTypeInfosByName().get('Audit').getRecordTypeId());
recordTypeIds.add(Schema.SObjectType.CTCPG__Activity__c.getRecordTypeInfosByName().get('Event').getRecordTypeId());
recordTypeIds.add(Schema.SObjectType.CTCPG__Activity__c.getRecordTypeInfosByName().get('Joint Visit').getRecordTypeId());
recordTypeIds.add(Schema.SObjectType.CTCPG__Activity__c.getRecordTypeInfosByName().get('Visit').getRecordTypeId());
recordTypeIds.add(Schema.SObjectType.CTCPG__Activity__c.getRecordTypeInfosByName().get('Timeoff').getRecordTypeId());

for(Id recordTypeId : recordTypeIds){
    for(String status : statuses){
        CTCPG__Activity__c newActivity = new CTCPG__Activity__c();
        newActivity.RecordTypeId = recordTypeId;
        newActivity.CTCPG__Status__c = status;
        activities.add(newActivity);
    }
}

insert activities;