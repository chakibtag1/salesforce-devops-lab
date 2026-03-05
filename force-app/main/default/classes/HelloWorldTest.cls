@isTest
public class HelloWorldTest {
    @isTest
    static void testGreet() {
        String result = HelloWorld.greet('Salesforce');
        System.assertEquals('Hello, Salesforce!', result, 'Greet method should return correct greeting');
    }
}
