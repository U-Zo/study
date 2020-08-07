package cafe;

public class CafeTest {
    public static void main(String[] args) {
        Cafe cafe = new Cafe();
        cafe.setCoffee(new Coffee("Americano", 4000));
        cafe.setCoffee(new Coffee("Cafelatte", 5000));
        cafe.setCoffee(new Coffee("Macchiato", 6000));

        for (int i = 0; i < cafe.getIndex(); i++) {
            System.out.println(cafe.getCoffeeList()[i]);
        }

        System.out.println();
        System.out.println("Coffee 가격의 합: " + cafe.totalPrice());
    }
}
