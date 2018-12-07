package bean.user;

public class Dice_Main_1 {
    public static void main(String[] args) {
        Dice dice = new Dice();
        System.out.println("주사위 2번 던지기");
        System.out.println("주사위 1: " + dice.getNum());
        System.out.println("주사위 2: " + dice.getNum());
    }
}
