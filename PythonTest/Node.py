class Node:
    
    def __init__(self, pos, ang):
        self.pos = pos
        self.ang = ang.normalize()

    def spawnChilds(self, step):
        childs = []
        angles = [TAU*7/8, TAU*5/8, TAU*3/8, TAU*1/8]
        rotations = [-TAU/4, 0, 0, TAU/4]

        a = abs(self.ang.heading())
        mirrored = a < 1e-5 or a > (TAU/2 - 1e-5)
        if mirrored:
            angles = angles[::-1]
            rotations = rotations[::-1]

        for angle,rotation in zip(angles, rotations):
            diffMag = sqrt(2)*width/pow(2,step)
            
            diff = self.ang.copy().setMag(diffMag).rotate(angle)
            childPos = self.pos.copy().add(diff)
            childRot = self.ang.copy().rotate(rotation)

            child = Node(childPos, childRot)
            childs.append(child)           
                        
        return childs

    def debugLog(self):
        print(self.pos.x,  self.pos.y, self.ang.heading())
