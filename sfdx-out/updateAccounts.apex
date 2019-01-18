List<Account> accounts = [SELECT id, MatrixId__c From Account];
List<Matrix__c> matrixes = [SELECT id FROM Matrix__c];
Id matrixId = matrixes[0].Id;
for(Account curAccount : accounts){
    curAccount.MatrixId__c = matrixId;
}

update accounts;