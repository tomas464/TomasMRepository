#script na výpočet na výpočet nábojů ve zbrani

import keyboard

#ammo je počet nábojů v zásobníku
ammo = 30

#difference je počet nábojů který se přidá do zásobníku po přebití 
difference = 30 - ammo

#minusAmmo je počet nábojů odebraný ze zásobníku po výstřelu
minusAmmo = 1



if keyboard.is_pressed("s"):
    ammo -= minusAmmo

    #tato část zajisťuje že počet nábojů nemůže klesnout pod nulu
    if ammo <= 0:
        minusAmmo = 0
    else: minusAmmo = 1

if keyboard.is_pressed("r"):
    difference += ammo
   

print(ammo)
