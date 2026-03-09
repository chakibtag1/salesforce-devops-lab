@isTest
public class AccountManagerTest {
    
    @isTest
    static void testValidateAccount_Valid() {
        Account acc = new Account(Name = 'Test Corp', Type = 'Prospect');
        Boolean isValid = AccountManager.validateAccount(acc);
        System.assertEquals(true, isValid, 'Valid account should pass validation');
    }
    
    @isTest
    static void testValidateAccount_Invalid() {
        Account acc = new Account(Type = 'Customer'); // Missing Name
        Boolean isValid = AccountManager.validateAccount(acc);
        System.assertEquals(false, isValid, 'Account without name should fail');
    }
    
    @isTest
    static void testCalculateTotalRevenue() {
        Account testAccount = new Account(Name = 'Revenue Test');
        insert testAccount;
        
        Opportunity opp1 = new Opportunity(
            Name = 'Deal 1',
            AccountId = testAccount.Id,
            StageName = 'Closed Won',
            CloseDate = Date.today(),
            Amount = 10000
        );
        insert opp1;
        
        Decimal revenue = AccountManager.calculateTotalRevenue(testAccount.Id);
        System.assertEquals(10000, revenue, 'Total revenue should be 10000');
    }
    
    @isTest
    static void testFindAccountsByIndustry() {
        Account acc = new Account(Name = 'Tech Corp', Industry = 'Technology');
        insert acc;
        
        List<Account> results = AccountManager.findAccountsByIndustry('Technology');
        System.assertEquals(1, results.size(), 'Should find 1 tech account');
    }
}
