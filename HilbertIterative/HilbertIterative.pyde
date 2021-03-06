MAX_COLOR = 10000000
###############

from Node import Node

nodes = []
step = 1

def setup():
    size(800,800)
    frameRate(60)
    colorMode(HSB,MAX_COLOR)

    makeFirstNode()

def draw():  
    background(0,0,0)
    # drawGrid(3)
    
    colorStep = int(MAX_COLOR/len(nodes))

    for one,two,col in zip(nodes, nodes[1:], range(0,MAX_COLOR, max(colorStep,1))):
        drawLine(one,two,col)
    
    
def keyPressed():
    global nodes
    global step
    
    if key == 'r':
        reset()
        return
    
    step += 1
    newNodes = []
    for n in nodes:
        for child in n.spawnChilds(step):
            newNodes.append(child)

    nodes = newNodes    
    print("Step" , step)
    
def drawGrid(iter):
    stroke(MAX_COLOR/2,MAX_COLOR/2,MAX_COLOR/2,MAX_COLOR/2)
    strokeWeight(1)
    count = iter*iter -1
    spacing = float(width)/count
    
    for i in range(count+1):
        line(spacing*i, 0, spacing*i, height)
        line(0, spacing*i, width, spacing*i)
         
def drawLine(one,two,col):
    stroke(col,MAX_COLOR,MAX_COLOR)
    strokeWeight(1)
    
    line (one.pos.x, one.pos.y, two.pos.x, two.pos.y)
    
def makeFirstNode():
    global nodes
    nodes = []
    nodes.append(Node(PVector(width*1/2, height*1/2), PVector.fromAngle(-TAU/4)))
    
def reset():
    global step
    makeFirstNode()
    step = 1
    print("reset") 
