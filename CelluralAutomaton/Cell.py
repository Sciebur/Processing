class Cell:    
    def __init__(self):
        self.state = False

    def enable(self):
        self.state = True
        
    def disable(self):
        self.state = False
        
    def toggle(self):
        self.state = !self.state
    
    def setState(self, state):
        self.state = state
                
    def isAlive(self):
        return self.state
