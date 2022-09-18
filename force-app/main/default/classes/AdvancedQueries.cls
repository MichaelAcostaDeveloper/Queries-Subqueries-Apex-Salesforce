public with sharing class AdvancedQueries {
    public static void query1(){
        String pais_elegido='Ecuador';
        for (Empleado__c objEmpleado : [SELECT Name, Gerente__r.Name, Pais__c FROM Empleado__c WHERE Pais__c INCLUDES(:pais_elegido)]) {
            System.debug('Empleado '+objEmpleado.Name+ ' con operaciones en: '+objEmpleado.Pais__c);
        }
    }

    public static void query2(){
        String pais_elegido='Ecuador;Paraguay';
        for (Empleado__c objEmpleado : [SELECT Name, Gerente__r.Name, Pais__c FROM Empleado__c WHERE Pais__c INCLUDES(:pais_elegido)]) {
            System.debug('Empleado '+objEmpleado.Name+ ' con operaciones en: '+objEmpleado.Pais__c);
        }
    }
}
