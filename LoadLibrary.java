public class LoadLibrary {
    public static void main(String[] args) {
        String libraryPath = args[0];
        System.load(libraryPath);
        System.out.println("Library " + libraryPath + " loaded!");
    }
}
