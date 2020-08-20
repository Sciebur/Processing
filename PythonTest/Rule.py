from copy import deepcopy

class Rule:
    def __init__(self, code):
        self.rule = {}
        print(toBin(code))
        for num,state in zip(range(7,-1,-1),toBin(code)):
            self.rule[num] = state
                                
    def nextGeneration(self, cells):
        newGen = deepcopy(cells)
        
        for pos in range(len(cells)):
            if pos > 1 and pos < len(cells) - 1:
                cellCode = getCellCode(cells[pos-1 : pos+2])
                newState = self.rule[cellCode]
                newGen[pos].setState(newState)

        return newGen

    

def getCellCode(cells):
    if len(cells) != 3:
        print("Wrong neighbour count", len(cells))
        exit(1)
    
    code = 0
    if cells[0].isAlive():
        code += 4
    if cells[1].isAlive():
        code += 2
    if cells[2].isAlive():
        code += 1

    return code

def toBin(n, b=2):
    if n == 0:
        return [0]
    digits = []
    while n:
        digits.append(int(n % b))
        n //= b
    while len(digits) < 8:
        digits.append(0)
    return digits[::-1]
