#    GRASS_COLOR: .word 0x66CC00
#    SKY_COLOR: .word 0x00FFFF
#    WATER_COLOR: .word 0x66B2FF

.text
main: lui $8, 0x1001 # endereço de memoria inicial para gravar o cenario
      
      addi $10, $0, 1280
      addi $11, $0, 0
      
makeSky:
      beq $11, $10, makeBackground
      
      ori $9, $0, 0x00FFFF
      sw $9, 0($8)
      addi $8, $8, 4
      
      addi $11, $11, 1
      j makeSky
      
      
      
makeBackground:
      addi $10, $0, 2400 # background size
      addi $11, $0, 0
      
      addi $12, $0, 30 # mountains size
      addi $13, $0, 68 # water size
      addi $14, $0, 0  # Water and mountains controller
      
forMakeBg:
      bge $11, $10, makeGround
leftMountain:
      beq $14, $12, water
      
      ori $9, $0, 0x66CC00
      sw $9, 0($8)
      addi $8, $8, 4
      
      addi $14, $14, 1
      addi $11, $11, 1
      j leftMountain
      
water:
      addi $14, $0, 0
forWater:
      beq $14, $13, rightMountain
      
      ori $9, $0, 0x66B2FF
      sw $9, 0($8)
      addi $8, $8, 4
      
      addi $14, $14, 1
      addi $11, $11, 1
      j forWater
      
rightMountain:
      addi $14, $0, 0
forRightMountain:
      beq $14, $12, nextLineBg
      
      ori $9, $0, 0x66CC00
      sw $9, 0($8)
      addi $8, $8, 4
      
      addi $14, $14, 1
      addi $11, $11, 1
      j forRightMountain
      
nextLineBg:
      addi $12, $12, 4
      addi $13, $13, -8
      
      addi $14, $0, -1
      ble $13, $14, adjustWaterController
      
returnAdjustWaterController: 
      addi $14, $0, 0
      j forMakeBg
      
adjustWaterController:
      addi $13, $0, 0
      j returnAdjustWaterController
      
            
      
makeGround: addi $10, $0, 4512
	    addi $11, $0, 0
forGround: beq $10, $11, end
           
           ori $9, $0, 0x994C00
           sw $9, 0($8)
           addi $8, $8, 4
           
           addi $11, $11, 1
           j forGround
      
        
end: addi $2, $0, 10
     syscall
     
     
##############################################
# Functions