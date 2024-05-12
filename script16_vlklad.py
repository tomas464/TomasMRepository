'''
Hodnota vašeho vkladu po 10 letech při 5% úrokové sazbě je 1629 Kč.
'''
vklad = 1000
roky = 10
urok = 0.05

hodnota = vklad
for rok in range(roky):
    hodnota += hodnota * urok

print(f"Hodnota vašeho vkladu po {roky} letech při {urok * 100:.0f}% úrokové sazbě je {hodnota:.0f} Kč.")