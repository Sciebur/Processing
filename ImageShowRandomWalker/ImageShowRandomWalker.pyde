walker_count = 50
step = 2

walkers = []
myImage = None

def setup():
    size(500,500)
    
    global myImage
    myImage = loadImage("sample.jpg")
    
    background(255)
    global walkers
    for i in range(walker_count):
        walkers.append(spawnWalker())

def punkt(x,y):
    point(x,y)

def draw():
    global walkers

    for w in walkers:
        stroke(myImage.get(int(w.x), int(w.y)))
        point(w.x, w.y)
        moveWalker(w)
            
def spawnWalker():
    return PVector(random(width),random(height))

def moveWalker(w):
    diff = PVector.random2D().setMag(step)
    w.add(diff)
    
    if w.x not in range(width) or w.y not in range(height):
        w = spawnWalker()
        
