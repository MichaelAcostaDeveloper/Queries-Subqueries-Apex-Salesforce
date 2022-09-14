public with sharing class ExamplesSubqueries {
        public static void query1(){
            List<Object> list1 = new List<Object>();
            list1=[SELECT Id, Name, AccountId FROM Contact];
            System.debug(list1);
        }
        public static void query2(){
            List<Object> list1 = new List<Object>();
            list1=[SELECT Id, Name, Account.Name, Account.Industry FROM Contact];
            System.debug(list1);
        }

        public static void query3(){
            List<Object> list1 = new List<Object>();
            list1=[SELECT Id, Name,(SELECT Name, Phone FROM Contacts) FROM Account];
            System.debug(list1);
        }

        public static void query4(){
            List<Object> list1 = new List<Object>();
            list1=[SELECT Id, Name, Gerente__r.Name, Gerente__r.Id FROM Empleado__c];
            System.debug(list1);
        }

        public static void query5(){
            List<Object> list1 = new List<Object>();
            list1=[SELECT Id, Name,(SELECT Id, Name, Departamentos__c FROM Empleados__r) FROM Gerente__c];
            System.debug(list1);
        }

        public static void query6(){
            List<Object> list1 = new List<Object>();
            list1=[SELECT Id, Name,(SELECT Id, Name, Departamentos__c FROM Empleados__r WHERE Departamentos__c='Mantenimiento') FROM Gerente__c WHERE Name='Michael Acosta'];
            System.debug(list1);
        }

        public static List<Object> query7(){
            Gerente__c objGerente=[SELECT Id, Name,(SELECT Id, Name, Departamentos__c FROM Empleados__r WHERE Departamentos__c='Mantenimiento') FROM Gerente__c WHERE Name='Michael Acosta'];
            System.debug(objGerente);
            System.debug(objGerente.Id);
            System.debug(objGerente.Name);
            System.debug(objGerente.Empleados__r);
            return objGerente.Empleados__r;
        }

        public static void query8(){
            Gerente__c objGerente=[SELECT Id, Name,(SELECT Id, Name, Departamentos__c FROM Empleados__r WHERE Departamentos__c='Mantenimiento') FROM Gerente__c WHERE Name='Michael Acosta'];
            List<Empleado__c> lstEmpleadosRelated = new List<Empleado__c>();
            lstEmpleadosRelated = objGerente.Empleados__r;
            System.debug(lstEmpleadosRelated);
        }

        public static void query9(){
            Gerente__c objGerente=[SELECT Id, Name,(SELECT Id, Name, Departamentos__c FROM Empleados__r WHERE Departamentos__c='Mantenimiento') FROM Gerente__c WHERE Name='Michael Acosta'];
           Map<Id, Empleado__c> mapEmpleadosRelated = new Map<Id, Empleado__c>(objGerente.Empleados__r);
           System.debug(mapEmpleadosRelated);
        }

        public static void query10(){
            Gerente__c managerObject = [SELECT Name,
            (SELECT Name,Id, Departamentos__c FROM Empleados__r)
            FROM Gerente__c
            WHERE Name='Michael Acosta'];

for (Empleado__c objDev : managerObject.Empleados__r) {
System.debug('Developer: '+objDev.Name+' of catergory: '+objDev.Departamentos__c);
}
        }


}
