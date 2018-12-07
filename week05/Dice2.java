package bean.user;
public class Dice2{
    private int num;
    private int startNum;
    private int endNum;

    public void setstartNum(int startNum) {
        this.startNum = startNum;
    }

    public int getstartNum() {
        return startNum;
    }

    public void setendNum(int endNum) {
        this.endNum = endNum;
    }

    public int getendNum(){
        return endNum;
    }

    public int getNum(){
        num = (int)(Math.random()*(endNum-startNum)) + startNum;
        return num;
    }
}
