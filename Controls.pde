void keyPressed() { //Controls
//println(keyCode);
    if (key == CODED) {
      
    if (keyCode == UP) {
      direction = "up";
      accelerate = true;
      
    } if (keyCode == DOWN) {
      direction = "down";
      accelerate = true;
      
    } if (keyCode == RIGHT) {
      direction = "right";
      accelerate = true;
      
    } if (keyCode == LEFT) {
      direction = "left";
      accelerate = true;
    }
    
    }
}

//void keyReleased() {
  //if (playerSpeed <= 0.1){
  //direction = "none";
  //}
  //accelerate = false;
//}
