public class NewCaseListController {

    public List<Case> getNewCases() {
        
        List<Case> cases = Database.query('select id, casenumber from Case where status = \'New\'');
        return cases;
    }
}