public class AccountManager {
    
    // Valide qu'un compte a les données obligatoires
    public static Boolean validateAccount(Account acc) {
        if (String.isBlank(acc.Name)) {
            return false;
        }
        if (acc.Type == 'Customer' && String.isBlank(acc.Industry)) {
            return false;
        }
        return true;
    }
    
    // Calcule le CA total d'un compte (somme des opportunités gagnées)
    public static Decimal calculateTotalRevenue(Id accountId) {
        List<Opportunity> wonOpps = [
            SELECT Amount 
            FROM Opportunity 
            WHERE AccountId = :accountId 
            AND StageName = 'Closed Won'
        ];
        
        Decimal total = 0;
        for (Opportunity opp : wonOpps) {
            if (opp.Amount != null) {
                total += opp.Amount;
            }
        }
        return total;
    }
    
    // Trouve les comptes par industrie
    public static List<Account> findAccountsByIndustry(String industry) {
        if (String.isBlank(industry)) {
            return new List<Account>();
        }
        return [
            SELECT Id, Name, Industry, Type
            FROM Account
            WHERE Industry = :industry
            ORDER BY Name
            LIMIT 200
        ];
    }
}
