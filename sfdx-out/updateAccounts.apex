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
newTop.clm__MenuSettings__c = 'Home,Chatter,Account,Contact,CTCPG__Activity__c,Calendar,NearbyAccounts,Routes,Applications,Dashboards,Settings';
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
newApp.clm__Theme__c = 'rgb(242, 104, 20)';
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
logo[0].Body = EncodingUtil.base64Decode('iVBORw0KGgoAAAANSUhEUgAAAeIAAAEGCAYAAAC5PJY3AAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAACxMAAAsTAQCanBgAAAZZaVRYdFhNTDpjb20uYWRvYmUueG1wAAAAAAA8P3hwYWNrZXQgYmVnaW49Iu+7vyIgaWQ9Ilc1TTBNcENlaGlIenJlU3pOVGN6a2M5ZCI/PiA8eDp4bXBtZXRhIHhtbG5zOng9ImFkb2JlOm5zOm1ldGEvIiB4OnhtcHRrPSJBZG9iZSBYTVAgQ29yZSA1LjYtYzE0NSA3OS4xNjM0OTksIDIwMTgvMDgvMTMtMTY6NDA6MjIgICAgICAgICI+IDxyZGY6UkRGIHhtbG5zOnJkZj0iaHR0cDovL3d3dy53My5vcmcvMTk5OS8wMi8yMi1yZGYtc3ludGF4LW5zIyI+IDxyZGY6RGVzY3JpcHRpb24gcmRmOmFib3V0PSIiIHhtbG5zOnhtcD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0RXZ0PSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VFdmVudCMiIHhtbG5zOnBob3Rvc2hvcD0iaHR0cDovL25zLmFkb2JlLmNvbS9waG90b3Nob3AvMS4wLyIgeG1sbnM6ZGM9Imh0dHA6Ly9wdXJsLm9yZy9kYy9lbGVtZW50cy8xLjEvIiB4bXA6Q3JlYXRvclRvb2w9IkFkb2JlIFBob3Rvc2hvcCBDQyAyMDE5IChXaW5kb3dzKSIgeG1wOkNyZWF0ZURhdGU9IjIwMTktMDUtMTVUMTM6Mjg6MzIrMDM6MDAiIHhtcDpNZXRhZGF0YURhdGU9IjIwMTktMDUtMTVUMTM6Mjg6MzIrMDM6MDAiIHhtcDpNb2RpZnlEYXRlPSIyMDE5LTA1LTE1VDEzOjI4OjMyKzAzOjAwIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOjMyZjc0MWVhLWQ0OTEtMDU0ZC1hMjc4LWI0OTk3YWZkMmVkMCIgeG1wTU06RG9jdW1lbnRJRD0iYWRvYmU6ZG9jaWQ6cGhvdG9zaG9wOjkwYjdjN2VlLTVlOGQtNmE0ZS1iZDYwLTY1Yjg2ODY0MzhiNCIgeG1wTU06T3JpZ2luYWxEb2N1bWVudElEPSJ4bXAuZGlkOjNkOGUwYjEwLTkzMjktYzg0Mi04NTNlLThkNmY1MWZmMTAwZCIgcGhvdG9zaG9wOkNvbG9yTW9kZT0iMyIgZGM6Zm9ybWF0PSJpbWFnZS9wbmciPiA8eG1wTU06SGlzdG9yeT4gPHJkZjpTZXE+IDxyZGY6bGkgc3RFdnQ6YWN0aW9uPSJjcmVhdGVkIiBzdEV2dDppbnN0YW5jZUlEPSJ4bXAuaWlkOjNkOGUwYjEwLTkzMjktYzg0Mi04NTNlLThkNmY1MWZmMTAwZCIgc3RFdnQ6d2hlbj0iMjAxOS0wNS0xNVQxMzoyODozMiswMzowMCIgc3RFdnQ6c29mdHdhcmVBZ2VudD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTkgKFdpbmRvd3MpIi8+IDxyZGY6bGkgc3RFdnQ6YWN0aW9uPSJzYXZlZCIgc3RFdnQ6aW5zdGFuY2VJRD0ieG1wLmlpZDozMmY3NDFlYS1kNDkxLTA1NGQtYTI3OC1iNDk5N2FmZDJlZDAiIHN0RXZ0OndoZW49IjIwMTktMDUtMTVUMTM6Mjg6MzIrMDM6MDAiIHN0RXZ0OnNvZnR3YXJlQWdlbnQ9IkFkb2JlIFBob3Rvc2hvcCBDQyAyMDE5IChXaW5kb3dzKSIgc3RFdnQ6Y2hhbmdlZD0iLyIvPiA8L3JkZjpTZXE+IDwveG1wTU06SGlzdG9yeT4gPHBob3Rvc2hvcDpUZXh0TGF5ZXJzPiA8cmRmOkJhZz4gPHJkZjpsaSBwaG90b3Nob3A6TGF5ZXJOYW1lPSJhbHBpbmUiIHBob3Rvc2hvcDpMYXllclRleHQ9ImFscGluZSIvPiA8L3JkZjpCYWc+IDwvcGhvdG9zaG9wOlRleHRMYXllcnM+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+9GKYVAAAL0pJREFUeF7t3Qe0JFXVsOHChCCiDFFBJQiSYUCCIFkQJAclCMKQM0pSHKLAiAR1GCULSFZAhiggIDAEByQNWUkiBoKKYk7f71tWy/2bqu46fav6dHifte5iurihu7q69gn77DPd//1HIkmSonhT9l9JkhSBgViSpIgMxJIkRWQgliQpIgOxJEkRGYglSYrIQCxJUkQGYkmSIjIQS5IUkYFYkqSIDMSSJEVkIJYkKSIDsSRJERmIJUmKyEAsSVJEBmJJkiIyEEuSFJGBWJKkiAzEkiRFZCCWJCkiA7EkSREZiCVJishALElSRAZiSZIiMhBLkhSRgViSpIgMxJIkRWQgliQpIgOxJEkRGYglSYrIQCxJUkQGYkmSIjIQS5IUkYFYkqSIDMSSJEVkIJYkKSIDsSRJERmIJUmKyEAsSVJEBmJJkiIyEEuSFJGBWJKkiAzEkiRFZCCWJCkiA7EkSREZiCVJishALElSRAZiSZIiMhBLkhSRgViSpIgMxJIkRWQgliQpIgOxJEkRGYglSYrIQCxJUkQGYkmSIjIQS5IUkYFYkqSIDMSSJEVkIJYkKSIDsSRJEU33f/+R/VtD6PLLL08ef/zxZLrppktmnXXWZPfdd8/+jySpGwzEQ2rKlCnJ+uuvnwbfGWecMT32z3/+M/nZz36W7Lvvvsnxxx+fHpMk1ctAPISuuOKKZLvttksWXXTR7Mjr6Bm//PLLyVJLLZV+nySpXgbiIcPbPf300ydjx45N/13khRdeSE4//fRkww03zI5IkupgIB4ym2yySTr8/Na3vjU7ko/Lgu976aWXsiOSpDqYNT1EHnzwweSOO+5oG4TBEPUss8ySnHTSSdkRSVId7BEPkfnnnz9NziLIlkVG9WuvvZY9kiRVzR7xkDjzzDPTABwShDHvvPMm++23X/ZIklQ1e8RDYqaZZsrNkm6HwP3oo48mf/jDH5I3vcl2myRVzTvrENhpp53SYelO0E774Ac/mGy77bbZEUlSlewRD7gXX3wxWXDBBZNFFlmk5XKlVugVP/HEE+nXe97znuyoJKkKBuIBt+yyy6b/ffOb35z+t1NU3ZphhhmSO++8MzsiSaqCQ9MD7LrrrkvXAY82COMtb3lL8swzzyR33XVXdkSSVAV7xANsttlm63huOM+///3v5NVXX02eeuqp7IgkabTsEQ+oL3zhC8kcc8yRPaoGWdP/+te/0h2bJEnVsEc8gJjPfde73pUsvvjiHSdoFeH3Pfvss8krr7ySHZEkjYY94gG0wQYbJAsttFDlQRhkUDPkfdxxx2VHJEmjYY94wNxzzz1pIKYiVllcAqEVtx577LHkj3/8Y/ZIktQpA/GAIQDPPvvspQMrbz9D2X//+9+Td7zjHdnR9v7yl78ka665ZjJx4sTsiCSpEw5ND5CTTz453VkppHf7u9/9Lk3s2nrrrZM//elP2dH2ZpxxxrR+NQFcktQ5e8QlsGynH+os06NdbLHFskft8daTdEXyFWaeeeZk4YUXTv9dBkGY8peXXXZZdkSSFMoecYGnn346nWudfvrp06FeeoBjx47t2aU748aNSxZYYIHsUTls/D8yiE6YMCFdJ1wW5+bmm2/+XyCXJIWzR5xj0qRJ6XAtmcdve9vbsqP/XRZE7WZ6nTfccEN2NL4XXngh3VkppJ70P/7xj2TuuedOrrnmmuzIf1FLep555ik9vM26YqpuTZ06NTsiSQphj7jJvffem4wfPz5dg8t8K4Gt8UWpyPe+971pqcfddtst+4n41l9//aDlSgTZJ598MrnyyiuzI69j3peymGVxTn7+858nt956a3ZEkhTCQNzkE5/4RDpP2iqojRkzJrnggguS1157LTsSz+TJk9Ph5JA5bPYWPuCAA3JrUDMcz1wz8+Jl0bPeYYcdskeSpBAG4hGOPvroZNZZZ80eFSNIf+hDH0o23XTT7Eg87DU855xzZo/a47mToMVrLXLRRRclzz//fPaoPXrYBPULL7wwOyJJKstAPALVoigNWQbzotOmTUseeOCB7Ej30auda665skfl/PrXv07OP//87FG+pZdeOllyySXTOfGyaMDsvffe2SNJUlkma2U233zzNFN6ZHJWOwzfUtji0UcfzY50D0uHZplllqB60iRWMYTNPHg7rC9+//vfnyaBlf39VNracsstkyOOOCI7Iklqxx7xf1CukWSjkCAMghrB59prr82OdA9z2QyPlw2SjQSt66+/PjvSGkF+s802S/76179mR9qbaaaZkhNOOCF7JEkqwx7xf1CU4t3vfndHRTs4fSwf+tWvfpUdqd+dd96Z9uDpsZZFz33FFVdMs6JDkLgV0usmcPN3zjjjjOyIJKmVoe8Rn3322WmQ6bRyFj3Nd77znckpp5ySHanfpz71qeR973tf9qgckq9CgzD23XffoOzwGWaYIU32CulJS9IwG/oeMclZDPGO1hNPPJEuC6rbiSeemPY26cGX9Zvf/CZdG73jjjtmR8IwTL3gggtmj9qjWAhFQa6++ursiCSpyFD3iHfdddeg4d1W6KEefPDB2aP6kAhFYCyrsR640yAMsslJ3iqLQih33XVXOictSWptaHvEBBaCJ+UqqzgFDFE//PDDyZ///OfsSPW22WabNEObGs9lkQk+ZcqUNPt5NCjaQVUxXmcZZGjTCIi5vEuS+sHQ9ojXWWedoKzjdvg9DN9uv/322ZFqEVCvu+665O1vf3t2pD2WOK2++uqjDsL41re+la5BLosCHy+//HJy0003ZUckSXmGskfMEp5ddtkl3eCgSvQWWQpF0Jxjjjmyo9Ugc5kgXDapjOfyyCOPBO0x3A6FPgiweaUx83BpEbypRS1JyjeUPeLtttsuuCJVGY1eMVnNVfrOd76TrlcOyez+/e9/n+4gVSXqa7N1Ylk0Bmg8nHXWWdkRSVKzoesRH3bYYekevCw5qgtLha666qpk+eWXz46MTmhmN28pz4EtG6tGIRHWTJOQVdZPf/rToGQvSRomQ9UjJoHopJNOSmaeeebsSHv06uhdhmDpDr3uKuyzzz7Ba4Z/8YtfJBdffHH2qFrf+973kp/85Celk7bAFMDhhx+ePZIkjTRUgZhqVKFlIZ999tl0p6KQRCWGkP/2t78lV1xxRXakM8zvnnPOOWl1q7LYqGG++eZL1lxzzexItRhq3nbbbdNKXWUx+sD6Z0nSGw3N0PR9992XrLfeesm8886bHWmP6lDLLLNMcu655yYrrbRSGlxDEpWYTw3ZZL/Zqquums4Ns9NTGTQcSBZj6Ji6z3WaccYZkyWWWKJ0o4Zzudxyy6XZ15Kk1w1Nj3iLLbZIPvCBD2SPyiH7mSAM5pWfeuqp0kOyfB+FN7761a9mR8Lcdttt6d8rG4TBGmaGxOsOwiARLLT0ZSPpTJL0uqHoEZ922mnp0OiYMWOyI+2RXMT8LLWWGyioQY8zZJcmvr+T4ENWN3PDIXOx3Sqz2UCZzYUWWih71B7D5rPNNlty4403ZkckSUPRIz7ooIOCgjBtE4ahRwZhsHwnpFcM5msJ6CEmTJiQBrmQv0PxDBoc3XTyySendazLondPpa2HHnooOyJJGvge8bhx49L54ZCKVM8991y6xzBzms0IquxdzFBrGQRTylIyjFs2sIbOv1JKksSuxx9/PDvSPcy5zz777KVfG5nrbAoxbdq07IgkDbeB7hGT6cxym7JBEwQJErTygjAmTZqUBuqyCKbsd7z11ltnR1qjGAjDvSHto2eeeSaZPHly9qi72EYyZC9mkt1effXV5Pvf/352RJKG20D3iAmo9NTKZjrzvZSFZN1wqyQpErBOP/30tNBGGfxe5m/53a3WBNOjXXnlldPAXRb1pBdeeOHkkksuyY5034c//OG04RCSUU7Zy5AlYYqDRifXbV5eBEvYVllllaBpn37D55akzbwCNiRHrrXWWrUWB9JwGNhAfM011yR77rlnUClLkqo22mijdNu/dqglTRZ2yJAsuyaxPWAR1jjzoY5ZT7oTzJtTRSykAUEy3P7775/sscce2RH1IpabHXDAAblbbzIScvPNN6eNx0F15JFHJqeccsob1vLz2aMxSb5DFZuqaLgN7ND0Zz7zmeB60qz5LROEceaZZ6YJUmXRW6R3URSIv/3tb6fD4iH1pBnipWRnbARgdnni+ZfFjf3zn/989ki9imkdGp3kAYz84hhfIVty9iPyNZpfe+NrzjnnDCr1KhUZyEDMDT40CNO6P++887JH7W288cbpTaix8X4Z7OdbVPqSJDCW9pTFQAYJYFVv7NAphsZDS18yTH/IIYdkj9Sr8gbNBnQgrTRe/7CfA1Vn4AIxvbJvfOMbQfM2DBvTumdDgxDnn39+8sILL2SP2qO3y4eXwhYjMYQeWmyEv9v8e2JiDpFRCObNyqLwyNe//vXskSQNp4ELxBtssEFQ1jE9OHYHYtP9UMyLMj9EoYqyZp111mTvvffOHv13u0J64gyBlcXfI0GLRJlecuqppwZnlPNebb/99tkRSRo+AxWIp06dmjz44INB8zZkfn7yk59M53s68d3vfjcN5GWHZPk+gvGxxx6bPl533XWDN6Igk7NXl/8wVB5S3Yv13WyO8corr2RHJGm4DFQgZg3u+9///uxROazBHc1GBMzrbrbZZummBmWxDSNVqQimbFlYdtkPyOzefffdgwqUdNP48eODkthogJDsxXsnScNoYALxxIkT03nKkGQhyjN+7Wtfyx51joznkF4xqEhFghZ79Yb45S9/2fFGEt3CHH1ID5c121Qfu/fee7MjUm9gnT6N3+YvlgzyX/JLpNEamHXEJP6ErOfjZROI6RFXgezfq666Kmjv4FAsrzrhhBPSofRet8ACC6RLlMoux4pZplPFLrroouSII47I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');

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