import java.util.ArrayList;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class DatabaseService {

    private Connection conn;

    // Constructor receiving connection from Main.
    public DatabaseService(Connection conn) {
        this.conn = conn;
    }

    /*public ArrayList<Horse> getAllHorses() throws SQLException
    {
        //Creates list to be filled and returned.
        ArrayList<Horse> ponies = new ArrayList<>();
        // The SQL
        String sql = """
                SELECT h.name, h.age, h.
                FROM Horse h
                JOIN FullSizeHorse fs ON h.horse_id = fs.horse_id
                WHERE h.bookable = TRUE
                ORDER BY h.name
                """;

        try (PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                String name = rs.getString("name");
                int age = rs.getInt("age");

                if (rs.wasNull()) {
                    throw new SQLException("A horse is missing its age.");
                }

                double minimumRiderLength =
                        rs.getDouble("minimum_rider_length");

                horse.add(new horse(name, age, minimumRiderLength));
            }
        }

        return horses;
    }*/
    public ArrayList<Pony> getAllPonies() throws SQLException
    {
        //Creates list to be filled and returned.
        ArrayList<Pony> ponyList = new ArrayList<>();
        // The SQL
        String sql = """
                SELECT h.name, h.age, p.minimum_rider_length
                FROM Horse h
                JOIN Pony p ON h.horse_id = p.horse_id
                WHERE h.bookable = TRUE
                ORDER BY h.name
                """;

        try (PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                String name = rs.getString("name");
                int age = rs.getInt("age");

                if (rs.wasNull()) {
                    throw new SQLException("A horse is missing its age.");
                }

                double minimumRiderLength =
                        rs.getDouble("minimum_rider_length");

                ponyList.add(new Pony(name, age, minimumRiderLength));
            }
        }

        return ponyList;
    }

    public ArrayList<FullSizeHorse> getAllFullSizeHorses() throws SQLException
    {
        //Creates list to be filled and returned.
        ArrayList<FullSizeHorse> fullSizeHorseList = new ArrayList<>();
        // The SQL
        String sql = """
                SELECT h.name, h.age, fh.minimum_rider_age
                FROM Horse h
                JOIN FullSizeHorse fh ON h.horse_id = fh.horse_id
                WHERE h.bookable = TRUE
                ORDER BY h.name
                """;

        try (PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                String name = rs.getString("name");
                int age = rs.getInt("age");

                if (rs.wasNull()) {
                    throw new SQLException("A horse is missing its age.");
                }

                int minimumRiderAge =
                        rs.getInt("minimum_rider_age");

                fullSizeHorseList.add(new FullSizeHorse(name, age, minimumRiderAge));
            }
        }

        return fullSizeHorseList;
    }
}
