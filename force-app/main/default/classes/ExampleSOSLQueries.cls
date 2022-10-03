public with sharing class ExampleSOSLQueries {
    public static void scriptExamples() {
        String soslBusqueda = 'Michael';
        List<List<sObject>> listaBusquedaFull = [FIND :soslBusqueda RETURNING
                                                        Account(Name),Contact(Name),Gerente__c(Name)];
        Account[] listaCuentas = (Account[])listaBusquedaFull[0];
        Contact[] listaContactos = (Contact[])listaBusquedaFull[1];
        Gerente__c[] listaGerentes = (Gerente__c[])listaBusquedaFull[2];

        System.debug('Numero de cuentas encontradas con la palabra de busqueda: '+soslBusqueda +' '+listaCuentas.size());
        for (Account cuenta : listaCuentas) {
            System.debug(cuenta.Name);
        }

        System.debug('Numero de contactos encontrados con la palabra de busqueda: '+soslBusqueda +' '+listaContactos.size());
        for (Contact contacto : listaContactos) {
            System.debug(contacto.Name);
        }

        System.debug('Numero de gerentes encontrados con la palabra de busqueda: '+soslBusqueda +' '+listaGerentes.size());
        for (Gerente__c gerente : listaGerentes) {
            System.debug(gerente.Name);
        }
    }
}
