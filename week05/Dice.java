package bean.user;

public class Dice {
    private int num;
    public int getNum(){
        num = (int)(Math.random() * 6.0 ) + 1;
        return num;
    }
}
