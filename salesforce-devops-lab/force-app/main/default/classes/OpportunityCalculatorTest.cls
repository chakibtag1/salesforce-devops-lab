@isTest
public class OpportunityCalculatorTest {
    
    @isTest
    static void testCalculateClosingProbability() {
        Decimal prob = OpportunityCalculator.calculateClosingProbability('Negotiation/Review');
        System.assertEquals(80, prob, 'Negotiation stage should have 80% probability');
    }
    
    @isTest
    static void testCalculateExpectedRevenue() {
        Decimal revenue = OpportunityCalculator.calculateExpectedRevenue(10000, 60);
        System.assertEquals(6000, revenue, 'Expected revenue should be 6000');
    }
    
    @isTest
    static void testFindHighValueOpportunities() {
        // Create test data
        Opportunity testOpp = new Opportunity(
            Name = 'Big Deal',
            StageName = 'Negotiation/Review',
            CloseDate = Date.today().addDays(30),
            Amount = 50000,
            Probability = 80
        );
        insert testOpp;
        
        List<Opportunity> results = OpportunityCalculator.findHighValueOpportunities(40000);
        System.assertEquals(1, results.size(), 'Should find 1 high value opportunity');
    }
}
