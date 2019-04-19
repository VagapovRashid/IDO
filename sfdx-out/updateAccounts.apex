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