Account account = [SELECT Id FROM Account LIMIT 1];
Http h = new Http();
HttpRequest req = new HttpRequest();
req.setEndpoint('https://raw.githubusercontent.com/VagapovRashid/IDO/master/sources.zip');
req.setMethod('GET');
HttpResponse res = h.send(req);
Blob body = res.getBodyAsBlob();
Attachment att = new Attachment(Name = 'sources.zip', Body = res.getBodyAsBlob(), ContentType = 'application/zip', ParentId=account.Id);
insert att;