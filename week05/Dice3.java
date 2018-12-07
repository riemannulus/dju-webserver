package bean.user;
public class Dice3{
    private int startNum;
    private int endNum;

    private int numFirst;
    private int numSecond;

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

    public int getnumFirst() {
        numFirst = (int)(Math.random()*(endNum-startNum)) + startNum;
        return numFirst;
    }

    public int getnumSecond() {
        numSecond = (int)(Math.random()*(endNum-startNum)) + startNum;
        return numSecond;
    }
}
