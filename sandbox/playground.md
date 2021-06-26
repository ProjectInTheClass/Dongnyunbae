
변수 / 값 증가시키기

var gemCounter = 0

while !isBlocked {
    
    moveForward()
    
    if isOnGem {
        collectGem()
        gemCounter += 1
    }
    
    if isBlocked {
        turnRight()
    }
}

// 올바른 포털 설정하기

bluePortal.isActive = false
pinkPortal.isActive = false
for i in 1 ... 3 {
    moveForward()
}
collectGem()

turnLeft()
turnLeft()
pinkPortal.isActive = true
moveForward()
turnLeft()
turnLeft()
moveForward()
collectGem()
turnLeft()
turnLeft()
moveForward()
bluePortal.isActive = true
moveForward()
moveForward()
collectGem()
turnLeft()
turnLeft()
bluePortal.isActive = false
moveForward()
moveForward()
collectGem()