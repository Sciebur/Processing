add_library('minim')

minim = Minim(this)
input = minim.getLineIn(Minim.MONO, 2**12)
fft = FFT(input.bufferSize(), input.sampleRate())
fft.window(HammingWindow())


def setup():
    size(500, 500)
    background(255)
    frameRate(60)

def draw():
    background(255)
    stroke(0)
    
    # wave = input.mix.toArray()
    # drawWave(wave)
    drawFft()

def drawFft():
    buffer = input.mix.toArray()
    fft.doWindow(buffer)
    fft.forward(buffer)

    maxFreq = 0
    maxFreqId = 0
    for i in range(fft.specSize()):
        if fft.getBand(i) > maxFreq:
            maxFreq = fft.getBand(i)
            maxFreqId = i
            
        line(i, height, i, height - fft.getBand(i) * 4);
        
    print (fft.indexToFreq(maxFreqId), maxFreq)

    
