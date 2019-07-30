ContentWorkspace contentWorkspace = [SELECT Id FROM ContentWorkspace WHERE Name = 'Product Logo'];

List<ContentVersion> contentVersions = new List<ContentVersion>();

Http h = new Http();
HttpRequest req = new HttpRequest();
req.setMethod('GET');

for(Integer i = 11; i <= 18; i++){
    req.setEndpoint('https://raw.githubusercontent.com/VagapovRashid/IDO/master/image/' + i + '.png');
    HttpResponse res = h.send(req);
    Blob body = res.getBodyAsBlob();

    ContentVersion contentVersion = new ContentVersion();
    contentVersion.Title = '' + i;
    contentVersion.VersionData = body;
    contentVersion.PathOnClient = '11.png';
    
    contentVersions.add(contentVersion);
}
insert contentVersions;

contentVersions = [SELECT Id, ContentDocumentId FROM ContentVersion WHERE Id = :contentVersions];

System.debug(contentVersions);

List<ContentWorkspaceDoc> workspaceDocs = new List<ContentWorkspaceDoc>();
for(ContentVersion version : contentVersions){
    ContentWorkspaceDoc doc = new ContentWorkspaceDoc();
    doc.ContentDocumentId = version.ContentDocumentId;
    doc.ContentWorkspaceId = contentWorkspace.Id;
    workspaceDocs.add(doc);
}
insert workspaceDocs;