import processing.sound.*;

int COUNT = 10000;
float ellipseX[] = new float[COUNT];
float ellipseY[] = new float[COUNT];
float speedX [] = new float [COUNT];
float speedY [] = new float [COUNT];
float diaX[] = new float [COUNT];
float diaY[] = new float [COUNT];
float hue[] = new float [COUNT];
float sat[] = new float [COUNT];
int Screen = 1;

String songName = "CaneShugaGlassAnimals";
SoundFile file;
String audioName = "CaneShuga.mp3";
String path;


void setup()
{
  size(1000, 1000);
  colorMode(HSB, 360, 100, 100); 
  path = sketchPath(audioName);
  file = new SoundFile(this, "CaneShuga.mp3");
  file.play();
  for (int i = 0; i<COUNT; i++)
  {

    ellipseX[i] = random(0, width);
    ellipseY[i] = random(0, height);
    speedX[i] = random(10, 15);
    speedY[i] = random(0, 0);
    diaX[i] = random(10, 20);
    diaY[i] = random(10, 20);
  }
}

void draw()
{
  if (Screen == 2) {
    background(0, 0, 100);
    textSize(50);
    text("Well Done, You Figured it Out", 100, 100);
  }
  if (Screen == 1) {
    background(360, 100, 100);
    textSize(20);
    text("Its LEFT", 650, 850);
    for (int i = 0; i<COUNT; i++)
    {
      fill(hue[i], sat[i], 100);
      hue[i] = random(0, 360);
      sat[i] = random(0, 100);
      ellipse(ellipseX[i], ellipseY[i], diaX[i], diaY[i]);
      ellipseX[i]+=5;


      if (ellipseX[i]>1000 || ellipseY[i]>1000) {
        ellipseX[i] = 0;
        ellipseY[i] = random(0, 1000);
      }
      if (dist(ellipseX[i], ellipseY[i], mouseX, mouseY) < 10) {
        ellipseX[i] -= random(-1000, 1000);
        ellipseY[i] -= random(-1000, 1000);
      }
    }
    colorMode(RGB);
    fill(0, 0, 0);
    textSize(100);
    text("Enter Password", 100, 500);
    textSize(40);
    text("Look around",100,600);
    text("It's not hard", 100, 700);
    text("You can move the ellipses", 100, 800);
    colorMode(HSB, 360, 100, 100);
  }
}

void keyPressed()
{
  if (key==CODED);
  {
    if (keyCode == LEFT)
    {
      Screen = 2;
    }
  }
}
