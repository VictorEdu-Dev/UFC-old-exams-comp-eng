package simulacao;

import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *  Klayver Ximenes Carmo                    Mat.: 427651
 *  Francisca Jannielly Garcia da Costa      Mat.: 427463
 */
public class Simulacao_Thread {
    
    static int quantidade = 5;              //quantidade de etapas (Threads)
    static int instrucao_atual = 1;         //instrução atual
    
    public static void main(String[] args) throws InterruptedException {
        
        //condição para que a simulação funcione até a primeira instrução percorrer todas as etapas
        while(instrucao_atual <= quantidade){
            
            //primeira Thread
            if(instrucao_atual >= 1){
                Thread s1 = new Thread(){
                    @Override
                    public void run() {
                        tempo();        //simulação do tempo de processamento
                        System.out.println("Buscando Instrução I" +instrucao_atual);
                    }
                };
                s1.start();     //inicializando a Thread
                s1.join();      //a instrução só irá para a outra etapa após terminar essa
            }
            
            //segunda Thread
            if(instrucao_atual >= 2){
                Thread s2 = new Thread(){
                    @Override
                    public void run() {
                        tempo();
                        System.out.println("\nDecodificando Instrução I" +(instrucao_atual-1));
                    }
                };
                s2.start();
                s2.join();
            }
            
            //terceira Thread
            if(instrucao_atual >= 3){
                Thread s3 = new Thread(){
                    @Override
                    public void run() {
                        tempo();
                        System.out.println("\nBuscando Operando I" +(instrucao_atual-2));
                    }
                };
                s3.start();
                s3.join();
            }
            
            //quarta Thread
            if(instrucao_atual >= 4){
                Thread s4 = new Thread(){
                    @Override
                    public void run() {
                        tempo();
                        System.out.println("\nExecutando Instrução I" +(instrucao_atual-3));
                    }
                };
                s4.start();
                s4.join();
            }

            //quinta Thread
            if(instrucao_atual >= 5){
                Thread s5 = new Thread(){
                    @Override
                    public void run() {
                        tempo();
                        System.out.println("\nUnidade de Gravação I" +(instrucao_atual-4));
                    }
                };
                s5.start();
                s5.join();
            }
            
            instrucao_atual ++;        //incremento no contador da posição da instrução
            
            tempo();
            System.out.println("\n-----------------------\n");
        }
    }
    
    //função do tempo que foi dado na simulação do tempo de cada estágio
    public static void tempo() {
        try {
            Thread.sleep(1000);
        } catch (InterruptedException ex) {
            Logger.getLogger(Simulacao_Thread.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}