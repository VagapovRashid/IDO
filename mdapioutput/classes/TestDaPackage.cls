/**
 * Created by user on 20.02.2019.
 */

@IsTest
private class TestDaPackage {
    @IsTest
    static void testBehavior() {
        Matrix__c newMatrix = new Matrix__c();
        insert newMatrix;
        List<Matrix__c> insertedValues = [SELECT id FROM Matrix__c];
        System.assertEquals(1, insertedValues.size());
    }
}