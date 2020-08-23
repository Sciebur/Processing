def drawWave(wave):
    pushMatrix()
    translate(0, height/2)
    
    scaleArray(wave, 100)

    maxAmp = max(wave)
    maxAmp = 1e-5 if maxAmp == 0 else maxAmp
    # if maxAmp == 0:
    #     maxAmp = 1e-5

    start = False
    x = 0
    print(maxAmp)
    drawScale = float(height/2)  / maxAmp
    
    for a,b in zip(wave,wave[1:]):
        if not start and a > .99*maxAmp:
            start = True
            
        if x > width:
            break
        
        if start:
            line(x, a * drawScale, x+1, b*drawScale)
            x += 1
    
    popMatrix()
    
                    
def scaleArray(aArr, aScale):
    for i in aArr:
        i = i*aScale
