
from Cell import Cell
from Rule import Rule

#nice Rules: 18, 30, 110

rule = Rule(18)
cells = []
row = 0

def setup():
    size(1200,600)
    frameRate(60)
    background(0)

    global cells
    
    for pixel in range(width):
        cells.append(Cell())

    cells[width/2].enable()
   
    printState("Start1", cells)

def draw():
    stroke(255)
    
    if (row > len(cells)/2):
        return
    
    drawRow(cells, row)            
    nextEpoch()

        
def nextEpoch():
    global row, cells
    newCells = rule.nextGeneration(cells)
    cells = newCells
    row += 1
   
def countAlive(aCells):
    alive = 0
    for cell in aCells:
        if cell.isAlive():
            alive += 1
    return alive
    
    
def printState(aTag, aCells):
    print(aTag , ["alive",countAlive(aCells)], ["count" , len(aCells)] )

def drawRow(aCells, aRow):
    for pos in range(len(aCells)):
        if cells[pos].isAlive():
            point(pos,aRow)
