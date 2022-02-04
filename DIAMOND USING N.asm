.MODEL SMALL
ORG 100H
.STACK 100H
.DATA
    I DB ?
    J DB ?
    K DB ?
           
    NUM     DB '1'    
    COUNTER DB  1    
    INPUT   DB  ?
    COUNTER2 DB ?
 
.CODE
MAIN PROC
    MOV AH, 1
    INT 21H
    MOV J, AL    
     
    MOV INPUT, AL
    MOV AH, 2
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H 
                  
TRIANGLE1:
        MOV BL, J
        MOV I, BL
                                    
        CMP I, '1'
        JE SKIP_SPACE

        SPACE_LOOP:
            
            MOV DL, ' '
            MOV AH, 2
            INT 21H
            
            DEC I
            CMP I, '1'
            JNE SPACE_LOOP
        
        SKIP_SPACE:              
        MOV BL, COUNTER
        MOV K, BL
                 
        NUMBER_LOOP:
            MOV AL, NUM
            MOV BL, 1
            DIV AL

            CMP AL, 0
            JE PRINT_SPACE
            
            MOV DL, NUM
            MOV AH, 2
            INT 21H

            PRINT_SPACE:
                    
                MOV DL, ' '
                MOV AH, 2
                INT 21H

            DEC K
            CMP K, 0
            JG NUMBER_LOOP 
       
        ADD COUNTER, 1        
        INC NUM

        MOV AH, 2
        MOV DL, 0DH
        INT 21H
        MOV DL, 0AH
        INT 21H
        
    DEC J   
    CMP J, '0'
    JNE TRIANGLE1

    MOV BL, INPUT     ;RESET
    MOV J, BL                                    
                                        
    MOV BL, 1
    MOV COUNTER, BL
    
    DEC NUM                      

    MOV BL, INPUT
    SUB BL, 30H
    MOV COUNTER2, BL 

TRIANGLE2:            
        MOV BL, COUNTER
        MOV I, BL

        SPACE_LOOP2:

            MOV DL, ' '
            MOV AH, 2
            INT 21H
             
        DEC I
        CMP I, 0
        JNE SPACE_LOOP2 
  
        INC COUNTER
        MOV BL, COUNTER2
        MOV K, BL
        
        DEC NUM
        
        NUMBER_LOOP2:
        
            MOV AL, NUM
            MOV BL, 2
            DIV AL
            
            CMP AL, 0
            JE PRINT_SPACE2
            
            MOV AH, 2
            MOV DL, NUM
            INT 21H
            
            PRINT_SPACE2:            
                
                MOV AH, 2
                MOV DL, ' '
                INT 21H
                
        DEC K
        CMP K, 1
        JNE NUMBER_LOOP2
        
        DEC COUNTER2
       
        MOV AH, 2
        MOV DL, 0DH
        INT 21H
        MOV DL, 0AH
        INT 21H

    DEC J
    CMP J, '1'    
    JNE TRIANGLE2

    MOV AH, 2
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    
END