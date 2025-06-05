package paradigmas;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
/**
 *
 * @author Klayver Ximenes
 */
public class paradigmas {
    
    public static void main(String[] args) {
        HashMap<Object, Object> lista = new HashMap<>();
        
        lista.put(1, 85);
        lista.put(2, 6.3);
        lista.put(3, false);
        lista.put(false, "Klayver");
        lista.put(true, "tentei com list, array... mas não consegui, se puder postar a solução depois...");
        
        System.out.println(lista.get(true));
    }
}
