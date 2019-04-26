List<Account> accounts = [SELECT id, MatrixId__c From Account];
List<Matrix__c> matrixes = [SELECT id FROM Matrix__c];
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
newApp.clm__MetadataLastModifiedDate__c = Datetime.valueOf('2008-09-04 07:17:00');
newApp.clm__IsPasscodeEnabled__c = false;
newApp.clm__IsPersonAccountsEnabled__c = false;
newApp.clm__ProductFieldAPI__c = 'CTCPG__ProductId_auto__c';
newApp.clm__ProductObjectAPIName__c = 'CTCPG__Product__c';
newApp.clm__PUSHHUBName__c = 'CTMobile';
newApp.clm__ReferenceObjectAPIName__c = 'AccountContactRelation';
newApp.clm__IsWeekSwitchShowed__c = true;
newApp.clm__EnableStartFinish__c = true;
newApp.clm__Theme__c = 'rgb(93,188,210)';
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
if(documents.size() == 0){
    documents.add(new Document(Name = 'CT Mobile Homepage Settings', FolderId = folder.Id));
}
String orgId = UserInfo.getOrganizationId();
String newBlob = '[{"size":{"x":4,"y":1},"position":[0,0],"widget":{"id":1,"name":"Logo","type":"logo"},"profile":{"id":"';
newBlob += orgId;
newBlob += '","profileName":"General Settings"},"$$hashKey":"6FD"},{"size":{"x":4,"y":1},"position":[1,0],"widget":{"id":3,"name":"Calendar Presentation (carousel)","type":"calendarPresentationCarousel"},"profile":{"id":"';
newBlob += orgId;
newBlob += '","profileName":"General Settings"},"$$hashKey":"6G8"},{"size":{"x":4,"y":1},"position":[2,0],"widget":{"id":2,"name":"Calendar Week (carousel)","type":"calendarWeekCarousel"},"profile":{"id":"';
newBlob += orgId;
newBlob += '","profileName":"General Settings"},"$$hashKey":"6KP"}]';
documents[0].Body = Blob.valueOf(newBlob);

upsert documents;