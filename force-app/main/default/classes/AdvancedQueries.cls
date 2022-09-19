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

    public static void query3(){
        for (Opportunity variable : [SELECT FORMAT(Amount)monto, FORMAT(CreatedDate)fechaCreacion, Amount, CreatedDate
        FROM Opportunity
        WHERE Amount != NULL LIMIT 5]) {
            String montoConvertido = (String)variable.get('monto');
            String fechaConvertida = (String)variable.get('fechaCreacion');
            System.debug('MONTO FORMAT '+'\n'+ montoConvertido+ ' VS '+variable.Account);
            System.debug('MONTO FORMAT '+'\n'+ fechaConvertida+ ' VS '+variable.CreatedDate);
            
        }
    }

}
