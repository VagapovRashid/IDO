List<ContentWorkspace> workspaces = [SELECT Id FROM ContentWorkspace WHERE Name = 'Product Logo'];
if(workspaces.size() == 0) {
    ContentWorkspace contentWorkspace = new ContentWorkspace();
    contentWorkspace.Name = 'Product Logo';
    insert contentWorkspace;
}