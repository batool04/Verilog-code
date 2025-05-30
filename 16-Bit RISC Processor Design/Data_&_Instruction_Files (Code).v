#Instructions in Instruction Memory


0000_0100_0000_0000 // load R0 <- Mem(R2 + 0) 
0000_0100_0100_0001 // load R1 <- Mem(R2 + 1) 
0010_0000_0101_0000 // Add R2 <- R0 + R1 
0001_0010_1000_0000 // Store Mem(R1 + 0) <- R2 
0011_0000_0101_0000 // sub R2 <- R0 - R1 
0100_0000_0101_0000 // invert R2 <- !R0 
0101_0000_0101_0000 // logical shift left R2 <- R0<<R1 
0110_0000_0101_0000 // logical shift right R2 <- R0>>R1 
0111_0000_0101_0000 // AND R2<- R0 AND R1 
1000_0000_0101_0000 // OR R2<- R0 OR R1 
1001_0000_0101_0000 // SLT R2 <- 1 if R0 < R1 
0010_0000_0000_0000 // Add R0 <- R0 + R0 
1011_0000_0100_0001 // BEQ branch to jump if R0=R1, PCnew= PC+2+offset<<1 = 28 => offset = 1 
1100_0000_0100_0000 // BNE branch to jump if R0!=R1, PCnew= PC+2+offset<<1 = 28 => offset = 0 
1101_0000_0000_0000 // J jump to the beginning address


#Data in Data Memory

0000_0000_0000_0001 
0000_0000_0000_0010 
0000_0000_0000_0001 
0000_0000_0000_0010 
0000_0000_0000_0001 
0000_0000_0000_0010 
0000_0000_0000_0001 
0000_0000_0000_0010