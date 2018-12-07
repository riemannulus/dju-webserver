package bean.user;

public class Dice_Main_2 {
    public static void main(String[] args) {
        Dice2 dice2 = new Dice2();
        dice2.setstartNum(Integer.parseInt(args[0]));
        dice2.setstartNum(Integer.parseInt(args[1]));
        System.out.println(
                Integer.parseInt(args[0])
                + "과 "
                + Integer.parseInt(args[1])
                + "사이 주사위 값");
        System.out.println("= " + dice2.getNum());
    }
}
