List<clm__Application__c> applications = [SELECT Id FROM clm__Application__c WHERE Name = 'Alpine_Brands'];
Http h = new Http();
HttpRequest req = new HttpRequest();
req.setEndpoint('https://raw.githubusercontent.com/VagapovRashid/IDO/master/sources1.zip');
req.setMethod('GET');
HttpResponse res = h.send(req);
Blob body = res.getBodyAsBlob();
//System.debug(body.toString());
Attachment att = new Attachment(Name = 'sources1.zip', Body = res.getBodyAsBlob(), ContentType = 'application/zip', ParentId=applications[0].Id);
insert att;