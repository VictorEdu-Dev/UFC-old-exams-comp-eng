//ARQUITETURA E ORGANIZAÇÃO DE COMPUTADORES

//KLAYVER XIMENES CARMO                     MATRÍCULA: 427651
//FRANCISCA JANNIELLY GARCIA DA COSTA       MATRÍCULA: 427463
//ANTONIA THAMIRES MAIA MESQUITA            MATRÍCULA: 427342



package aquiteturaprograma;

public class Interp {
   
    static int PC;                      //contador de programa que contém o próximo endereço
    static int tipo_instrucao;          //tipo da instrução
    static int dado;                    //dado a ser buscado
    static boolean run_bit = true;      
   
    public static int procurar_dado(int tipo, int memory[]){        //busca o dado da intrução na memória
        dado = memory[tipo];
        return dado;
    }

    private static int get_instr_type(int posicao,int memory[]){    //função que retorna o tipo
       if(posicao >=3){    
           return -1;                   //caso a posição na memória seja um dado
       }else{
           return memory[posicao];      //caso a posição na memória seja uma instrução
       }
    }
   
    public static void main(String[] args) {
       
        int[] memory = {3, 4, 97, 98, 120};
        PC = 0;
       
        while(run_bit){
            tipo_instrucao = get_instr_type(PC,memory);         //funcao tipo retorna se é instrução ou um dado na memória
            if(tipo_instrucao>=0){                              //se for instrução, busca o dado na memória ou mostra que o dado não está na memória
                if(memory[PC] == 97){                           //tratamos a posição 2 como uma instrução que não está na memória
                    System.out.println("Essa instrução não aponta para um dado na memória!");
                }else{  
                    dado = procurar_dado(tipo_instrucao, memory);    //retorna o dado para qual a instrução aponta
                    System.out.printf("Este dado foi apontado por uma instrução: %d\n", dado);  
                }
            }else{
                System.out.println(memory[PC]);       //mostra o dado da memória
            }
            PC = PC + 1;
            if(PC==5){                                //tamanho da memória declarada para critério de parada
                break;
            }
        }
    }
}