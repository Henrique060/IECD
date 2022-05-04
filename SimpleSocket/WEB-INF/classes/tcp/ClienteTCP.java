package tcp;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;


public class ClienteTCP {

    private final static String DEFAULT_HOST = "localhost"; // M�quina onde reside o servidor
    private final static int DEFAULT_PORT = 5025; // porto onde o servidor est� � espera
    
    public static void main(String[] args) {
        
        Socket socket     = null;
        BufferedReader is = null;
        PrintWriter    os = null;
        
        try {
            socket = new Socket(DEFAULT_HOST, DEFAULT_PORT);

            // Mostrar os parametros da liga��o
            System.out.println("Ligado: " + socket);

            // Stream para escrita no socket
            os = new PrintWriter(socket.getOutputStream(), true); 

            // Stream para leitura do socket
            is = new BufferedReader(new InputStreamReader(socket.getInputStream()));

            // Escreve no socket
            os.println("Olamundo!!!");

            // Mostrar o que se recebe do socket
            System.out.println("Recebi -> " + is.readLine()); 
            
        } 
        catch (IOException e) {
            System.err.println("Erro na ligacao " + e.getMessage());   
        }
        finally {
            // No fim de tudo, fechar os streams e o socket
            try {
                if (os != null) os.close();
                if (is != null) is.close();
                if (socket != null ) socket.close();
            }
            catch (IOException e) { 
                // if an I/O error occurs when closing this socket
            }
        } // end finally


    } // end main

} // end ClienteTCP



