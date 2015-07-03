// Prog.io - Agar.io based game made in Processing by Jonas Silva 2015
// A Week Project


void setup(){
  background(250,250,250); //Setting white bg
  frameRate(FPS); //Limiting FPS to 60
  size(windowX,windowY); //Dynamic Window Size
  smooth(); // I have no idea what this does
  a=random(10,250); //Random colors
  b=random(10,250);
  c=random(10,250);
  r=random(10,250); //Random colors
  g=random(10,250);
  b2=random(10,250);
  playerPosX = startPosX; //Sets Start Position (X)
  playerPosY = startPosY; //Sets Start Position (Y)
  
   for (int i = 0; i < FoodCountMAX; i++){
     array[(int)random(30,windowX-30)][(int)random(30,windowY-30)] = 1;
   }
}



// Food Spawning

void drawFood(){
  for(int i = 0; i < array.length; i++){
    for(int j = 0; j < array[i].length; j++){
      if(array[i][j] == 1){
        fill(r,g,b);
        ellipse(i, j, 35, 35);  
      }
    }
  }
}


// Collision Detection

void FoodCollision(){
  for(int i = 0; i < array.length; i++){
    for(int j = 0; j < array[i].length; j++){
      if(array[i][j] == 1){
        if (playerPosX + offsetX + (playerSize / 2) > i && i > playerPosX + offsetX - (playerSize / 2)) {
          if (playerPosY + offsetY + (playerSize / 2) > j && j > playerPosY + offsetY - (playerSize / 2)){
          score++;
          array[i][j] = 0;
          //acceleration -= 0.001;
          }
        }
      }
    }
  }
}

boolean isDead(){
   if (playerPosX + offsetX + (playerSize / 2) <= 0 || 0 >= playerPosY + offsetY - (playerSize / 2)) {
     return true;
   } else if (playerPosX + offsetX + (playerSize / 2) >= windowX || windowY <= playerPosY + offsetY - (playerSize / 2)) {
     return true;
   }
   return false;
}

void FoodSpawn(){
  for (int i = 0; i < FoodCountMAX; i++){
    array[(int)random(30,windowX-30)][(int)random(30,windowY-30)] = 1;
  }
}

void GameOver(){
  background(255,255,255);
  fill(205,0,0);
  textAlign(CENTER);
  textSize(50);
  text("Game Over!",(windowX/2),windowY/2);
}

void draw(){
  background(250,250,250); //Clears Drawn Pixels and sets bg 
  playerSize = score + 50; //Sets player size by multiplying score by 50
  
  drawFood(); // Calls DrawFood Method
  FoodCollision(); // Calls the food collision method
  
  fill(0,0,0); //Sets Color Black for Text
  text("Score: "+score,20,30); //Score Text
  text("FPS: " + (int)frameRate,windowX - 100, 30); //FPS Text
  text("Speed: " + playerSpeed,20, 45); //Score Text
  text("Level: " + (int)playerSpeed,20, 60); //Level Text
  text("Made by Jonas Silva, July 2015",windowX-190,windowY-10);
  // Acceleration
  if (playerSpeed < max_speed && accelerate == true){
    playerSpeed += acceleration;
  }
  
  // Deacceleration
  //if (playerSpeed > 0 && accelerate == false){
    //playerSpeed -= acceleration*4;
  //}
  
  //Count Fps for spawning food every 15 seconds
  if (fps_count < spawn_cooldown * FPS){
    fps_count++;
  } else {
    fps_count = 0;
    FoodSpawn(); // Calls the food spawning method
    if (playerSpeed >= max_speed){
      playerSpeed += 0.5;
    }
   }
   
  drawFood();
  
  
  fill(a,b,c); //Sets Random color on the player
  if (direction == "up") {
    ellipse(playerPosX + offsetX, playerPosY + offsetY, playerSize, playerSize);
    offsetX = offsetX + 0;
    offsetY = offsetY - playerSpeed;
  }
  else if(direction == "down"){
    ellipse(playerPosX + offsetX, playerPosY + offsetY, playerSize, playerSize);
    offsetY = offsetY + playerSpeed;
    
  } else if(direction == "right"){
    ellipse(playerPosX + offsetX,playerPosY + offsetY, playerSize, playerSize);
    offsetX = offsetX + playerSpeed;
    
  } else if(direction == "left"){
    ellipse(playerPosX + offsetX, playerPosY + offsetY, playerSize, playerSize);
    offsetX = offsetX - playerSpeed;
    
    //Multiple Button Movement
    
  } else if(direction == "left" && direction == "down"){
    ellipse(playerPosX + offsetX, playerPosY + offsetY, playerSize, playerSize);
    offsetX = offsetX - playerSpeed;
  }
    // Idle
    
  else if (playerSpeed <= 0.1){
    ellipse(playerPosX + offsetX, playerPosY + offsetY, playerSize, playerSize);  
  }
   //println(playerPosX+offsetX); // Debug

   if (isDead() == true){GameOver(); } //Draws Last (Override)
   
 }
