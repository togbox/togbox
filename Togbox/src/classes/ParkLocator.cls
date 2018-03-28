public class ParkLocator {

     public static string[] country(string countryName) {
        ParkService.ParksImplPort locator = new ParkService.ParksImplPort();
        return locator.byCountry(countryName);
     }
}