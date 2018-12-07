package bean.user;

import java.util.Arrays;

public class Lotto {
    private String lottoNum;
    private int[] tmpArray;

    public Lotto(){
        int tmpNum = 0;
        int index = 0;

        boolean[] isNumberExsist = new boolean[45];

        tmpArray = new int[6];
        lottoNum = "";

        while(index < 6) {
            tmpNum = (int)(Math.random() * ( 44 )) + 1;
            if(isNumberExsist[tmpNum]){
                continue;
            }
            else {
                isNumberExsist[tmpNum] = true;
                tmpArray[index] = tmpNum;
                index ++;
            }
        }

        Arrays.sort(tmpArray);

        for(int i = 0; i < 6; i ++) {
            lottoNum = lottoNum + tmpArray[i] + " ";
        }
    }
    
    public String getlottoNum(){
        return lottoNum;
    }
}
