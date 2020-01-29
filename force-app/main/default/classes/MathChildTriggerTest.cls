@isTest
public class MathChildTriggerTest {
    public static testMethod void testTrigger() {
        LodestoneTest__Math__c testMath = new LodestoneTest__Math__c(LodestoneTest__Starting_Number__c = 1);
        insert testMath;
        
        LodestoneTest__Math_Child__c testMathChild = new LodestoneTest__Math_Child__c(LodestoneTest__Math__c = testMath.Id, LodestoneTest__Operation__c = 'Addition', LodestoneTest__Number__c = 2);
        insert testMathChild;
        
        testMath = [SELECT Id, LodestoneTest__Result__c FROM LodestoneTest__Math__c WHERE Id = :testMath.Id];
        System.assertEquals(3, testMath.LodestoneTest__Result__c);
        
        testMathChild = new LodestoneTest__Math_Child__c(LodestoneTest__Math__c = testMath.Id, LodestoneTest__Operation__c = 'Division', LodestoneTest__Number__c = 3);
        insert testMathChild;
        
        testMath = [SELECT Id, LodestoneTest__Result__c FROM LodestoneTest__Math__c WHERE Id = :testMath.Id];
        System.assertEquals(1, testMath.LodestoneTest__Result__c);
        
        testMathChild = new LodestoneTest__Math_Child__c(LodestoneTest__Math__c = testMath.Id, LodestoneTest__Operation__c = 'Multiplication', LodestoneTest__Number__c = 5);
        insert testMathChild;
        
        testMath = [SELECT Id, LodestoneTest__Result__c FROM LodestoneTest__Math__c WHERE Id = :testMath.Id];
        System.assertEquals(5, testMath.LodestoneTest__Result__c);
        
        
        testMathChild = new LodestoneTest__Math_Child__c(LodestoneTest__Math__c = testMath.Id, LodestoneTest__Operation__c = 'Subtraction', LodestoneTest__Number__c = 2);
        insert testMathChild;
        
        testMath = [SELECT Id, LodestoneTest__Result__c FROM LodestoneTest__Math__c WHERE Id = :testMath.Id];
        System.assertEquals(3, testMath.LodestoneTest__Result__c);
    }
}