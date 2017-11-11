public class ParkLocator {
    public static List<String> country(String strCountry) {
        ParkService.ParksImplPort pbc = new ParkService.ParksImplPort();     
        System.debug(pbc.byCountry(strCountry));
        return pbc.byCountry(strCountry);
    }
}