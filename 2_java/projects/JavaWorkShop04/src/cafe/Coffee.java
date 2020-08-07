package cafe;

public class Coffee {
    private String name;
    private int price;

    public Coffee() {
    }

    public Coffee(String name, int price) {
        this.name = name;
        this.price = price;
    }

    public int getPrice() {
        return price;
    }

    @Override
    public String toString() {
        return name + "\t" + price;
    }
}
