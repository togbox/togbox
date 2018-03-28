public class AnimalLocator {

    public static string getAnimalNameById(integer ident) {
        
        string animalname = '';
		//Integer ident = 1;	
        Http http = new Http();
		HttpRequest request = new HttpRequest();
		request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+ident);
        request.setMethod('GET');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
		HttpResponse response = http.send(request);
        System.debug('Status code: '+response.getStatusCode());
		
		// If the request is successful, parse the JSON response.
		if (response.getStatusCode() > 201) {
        }
		else {
		
    		// Deserialize the JSON string into collections of primitive data types.
    		string body = response.getBody();
   			System.debug(body);
    		Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(body);
    		System.debug(results.get('animal'));
    		Map<String,Object> animal = (Map<String,Object>)results.get('animal');
    		animalname = (string) animal.get('name');
    		System.debug('Animal name is:'+animalname);
        }
        return animalname;
    }
}