import com.oracledp.book.util.MD5Utils;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;

public class java {
    public  static  void  main(String[] aegs){
        String str = null;
        try {
            str = MD5Utils.getEncryptedPwd("123");
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        System.out.println(str);


    }


}
