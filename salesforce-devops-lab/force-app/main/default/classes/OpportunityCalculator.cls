public class OpportunityCalculator {
    
    // Calcule la probabilité de closing basée sur le stage
    public static Decimal calculateClosingProbability(String stageName) {
        Map<String, Decimal> probabilityMap = new Map<String, Decimal>{
            'Prospecting' => 10,
            'Qualification' => 20,
            'Needs Analysis' => 40,
            'Value Proposition' => 60,
            'Negotiation/Review' => 80,
            'Closed Won' => 100,
            'Closed Lost' => 0
        };
        return probabilityMap.containsKey(stageName) ? probabilityMap.get(stageName) : 0;
    }
    
    // Calcule le revenu prévisionnel (Amount * Probability)
    public static Decimal calculateExpectedRevenue(Decimal amount, Decimal probability) {
        if (amount == null || probability == null) {
            return 0;
        }
        return (amount * probability) / 100;
    }
    
    // Trouve les opportunités à haut potentiel (montant > seuil ET probabilité > 50%)
    public static List<Opportunity> findHighValueOpportunities(Decimal threshold) {
        return [
            SELECT Id, Name, Amount, Probability, StageName, CloseDate
            FROM Opportunity
            WHERE Amount >= :threshold 
            AND Probability >= 50
            AND IsClosed = false
            ORDER BY Amount DESC
            LIMIT 100
        ];
    }
}
