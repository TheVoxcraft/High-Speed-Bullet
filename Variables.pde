float playerSize;
int FPS = 60;
int score = 1; //Default Starting Score
int windowX = 1280; //Dynamic Width Window Size
int windowY = 720; //Dynamic Height Window Size
float a; //Random Colors
float b;
float c;
float r;
float g;
float b2;
float playerPosX;
float playerPosY;
float startPosX = windowX/2; //Finds Start Position based on window size
float startPosY = windowY/2;
String direction; //Direction
float offsetX = 0; //Offset for player
float offsetY = 0;
float textOffsetPoint = 20;
float playerSpeed = 0;
float max_speed = 10;
boolean accelerate = false;
float acceleration = 0.002;
int FoodCountMAX = (int)random(1,5);
int FoodCount = 0;
float foodPosX;
float foodPosY;
int[][] array = new int[windowX][windowY];
int fps_count = 0;
int spawn_cooldown = 15;
