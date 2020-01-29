trigger MathChildTrigger on LodestoneTest__Math_Child__c (after insert, after update
) {
    QuickMaths methods = new QuickMaths();
    
    if (Trigger.isAfter && Trigger.isInsert) {
        for (LodestoneTest__Math_Child__c m : Trigger.New) {
        	methods.updateMaths(m);
        }
    }
    
    if (Trigger.isAfter && Trigger.isUpdate) {
        for (LodestoneTest__Math_Child__c m : Trigger.New) {
        	methods.updateMaths(m);
        }
    }
    
    public class QuickMaths {
        public void updateMaths(LodestoneTest__Math_Child__c m) {
            Decimal calculation = 0;
            
            List<LodestoneTest__Math__c> parent = [SELECT Id, LodestoneTest__Result__c, LodestoneTest__Starting_Number__c FROM LodestoneTest__Math__c WHERE Id = :m.LodestoneTest__Math__c];
            
            if (parent.size() > 0) {
                calculation = parent[0].LodestoneTest__Starting_Number__c;
            }
            else {
                return;
            }
            
            for (LodestoneTest__Math_Child__c mathChild : [SELECT Id, LodestoneTest__Operation__c, LodestoneTest__Number__c FROM LodestoneTest__Math_Child__c WHERE LodestoneTest__Math__c = :m.LodestoneTest__Math__c ORDER BY CreatedDate asc]) {
                System.debug(calculation);
                switch on mathChild.LodestoneTest__Operation__c {
                    when 'Addition' {
                        calculation += mathChild.LodestoneTest__Number__c;
                    }
                    when 'Subtraction' {
                        calculation -= mathChild.LodestoneTest__Number__c;
                    }
                    when 'Division' {
                        calculation /= mathChild.LodestoneTest__Number__c;
                    }
                    when else {
                        calculation *= mathChild.LodestoneTest__Number__c;
                    }
                }
                System.debug(calculation);
            }
            
            System.debug(calculation);
            parent[0].LodestoneTest__Result__c = calculation;
            update parent;
        }	
    }
}