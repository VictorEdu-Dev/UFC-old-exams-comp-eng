/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package aulapratica05;

/**
 *
 * @author Laboratório 15
 */
public class AulaPratica05 {

    static public int fatorial(int f){
        if(f==0)
            return 1;
        else
            return(f*fatorial(f-1));
    }
    
    static public int somaPares(int n){
        int soma = 0;
        if(n==0)
            return 0;
        else{
            if(n%2==0)
            soma=n;
            return(soma + somaPares(n-1));
        }
    }
    
    static public int mostrar(int m){
        if(m==50)
            return 50;
        else
            System.out.println(m);
        return(mostrar(m+1));
    }
    
    static public int soma_mn(int m, int n){
        if(n==m)
            return n;     //m ou n
        else if(m<n)
            return soma_mn(m, n-1)+n;
        else
            return soma_mn(n, m-1)+m;
    }
    
    static public int fib(int num){
        int aux;
        if(num<2)
            return 1;
        else{
            aux = fib(num-1)+fib(num-2);
            return aux;
        }
    }
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        int n=0;
        
        int f=5;
        System.out.println("fatorial "+fatorial(f));
        System.out.println("fatorial "+fatorial(n));
        
        int p=10;
        System.out.println("Soma Pares "+somaPares(p));
        System.out.println("Soma Pares "+somaPares(n));

        int m=1;
        System.out.println("Mostrar " +mostrar(m));

        int z=3;
        int a=3;
        int b=5;
        int c=5;
        int d=1;
        System.out.println("Soma mn " +soma_mn(a, z));
        System.out.println("Soma mn " +soma_mn(a, b));
        System.out.println("Soma mn " +soma_mn(c, d));
        
        int s=5;
        System.out.println("Fibonacci "+fib(s));
    }
    
}
