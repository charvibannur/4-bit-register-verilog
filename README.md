# 4-bit-register-verilog
A verilog program that mimics the circuitry of a 4-bit register implemented with four 4x1 multiplexers and four D-Flipflops.  
The register operates according to the value of the select lines as shown below:-  
  
**s1 &nbsp;&nbsp; s0  &nbsp;&nbsp;&nbsp;      Output**   
0  &nbsp;&nbsp;  0   &nbsp;&nbsp;&nbsp;      No change  
0  &nbsp;&nbsp;  1   &nbsp;&nbsp;&nbsp;      Complement Output  
1  &nbsp;&nbsp;  0   &nbsp;&nbsp;&nbsp;      Shift the bits to the right  
1  &nbsp;&nbsp;  1   &nbsp;&nbsp;&nbsp;      Shift the bits to the left    
'Load' input is used to enable the D-FlipFlop.  
'Reset' used to remove don't care states and set the initial values of the flip flops to 0.  
  
The lib.v file contains the code for the basic gates, D-flip flop and a 2x1 multiplexer. The reg.v contains code for the 4-bit register and four 4x1 multiplexers. The reg_tb files contains the input test bench values used by the program as input.  
 
### Steps to run the code:-      
 _Open command prompt in the location where the files are stored and type the following commands to run the code_
 
 ``` 
 iverilog -o reg_v lib.v reg.v reg_tb.v  
 ``` 
 ``` 
 vvp reg_v  
 ```
``` 
gtkwave tb_file.vcd 
``` 

![image](https://user-images.githubusercontent.com/77164319/140698330-03e5a7d5-92f5-4922-9b35-fd7ef46aa9b1.png)


# Team Members :

Charvi Bannur :  https://github.com/charvibannur

Chaitra Bhat : https://github.com/Chaitra-Bhat383
 
Ankitha C : https://github.com/Ankithac45

Nireeksha D Rai : https://github.com/Nireekshadrai
