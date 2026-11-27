import java.sql.Connection;
import java.sql.SQLException;

public class Main {

    public static void main(String[] args) {

        /*try (Connection connection = DatabaseConnection.getConnection()) {
            System.out.println("Ansluten till: " + connection.getCatalog());
        } catch (SQLException e) {
            System.out.println("Databasanslutningen misslyckades: " + e.getMessage());
            return;
        }*/

        try (Connection conn = DatabaseConnection.getConnection()) {
            DatabaseService database = new DatabaseService(conn);

            for (Pony pony : database.getAllPonies()) {
                System.out.println("Ponny: " + pony.getName());
            }

            for (FullSizeHorse horse : database.getAllFullSizeHorses()) {
                System.out.println("Stor häst: " + horse.getName());
            }
        } catch (SQLException e) {
            System.out.println("Kunde inte hämta hästar: " + e.getMessage());
        }

        ConsoleUI ui = new ConsoleUI();
        ui.start();
    }

}