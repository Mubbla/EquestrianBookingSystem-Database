public abstract class Horse {

    // Common fields for all horses
    private String name;
    private int age;
    private boolean isAvailable;

    // Constructor
    public Horse(String name, int age, boolean isAvailable) {
        if (age < 0 || age > 40) {
            throw new IllegalArgumentException("Hästens ålder måste vara mellan 0 och 39.");
        }
        this.name = name;
        this.age = age;
        this.isAvailable = isAvailable;
    }

    // Getters
    public String getName() {
        return name;
    }

    public int getAge() {
        return age;
    }

    public boolean isAvailable() {
        return isAvailable;
    }

    // Setters
    public void setAge(int age) {
        this.age = age;
    }

    public void setAvailable(boolean available) {
        isAvailable = available;
    }

    // Base methods intended to be overridden by all horse subclasses
    public abstract String getDetails();

    public abstract String getType();

    public abstract String getBookingRequirement();
}
