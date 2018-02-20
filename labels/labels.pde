


void setup(){
  size(400,300);
  frameRate(600);
  noStroke();
  
}

int screen = 0;

int x = 0;
int y = 0;

String[] label1 = new String[1000];
String[] label2 = new String[1000];
String[] label3 = new String[1000];
String[] label4 = new String[1000];
String[] label5 = new String[1000];
String[] label6 = new String[1000];

int label1index = 0;
int label2index = 0;
int label3index = 0;
int label4index = 0;
int label5index = 0;
int label6index = 0;

int samplenumber = 1;
int numberoflabels = 0;


int debugtimer = 0;

float[] last = new float[400]; //final saved picture
void draw()
{
  if(screen == 0)
  {
    fill(255);
    textSize(28);
    rect(50,100,70,80);
    rect(150,100,70,80);
    rect(250,100,70,80);
    rect(50,200,70,80);
    rect(150,200,70,80);
    rect(250,200,70,80);
    
    fill(0);
    text("Select Number of Labels", 50, 50);  // Text wraps within text box
    text("1", 70, 150);
    text("2", 170, 150);
    text("3", 270, 150);
    text("4", 70, 250);
    text("5", 170, 250);
    text("6", 270, 250);
    if((mousePressed==true) && (mouseX >50)&&(mouseX < 120) && (mouseY > 100) && (mouseY < 180))
    {
      numberoflabels = 1;
      screen = 1;
    }
    
    if((mousePressed==true) && (mouseX >150)&&(mouseX < 220) && (mouseY > 100) && (mouseY < 180))
    {
      numberoflabels = 2;
      background(100);
    fill(255);
    rect(0,0,200,200);
    rect(250,70,120,40); //clear
    rect(250,120,120,40); //save
    rect(-20,-20,2,2);
    fill(0);
    text("Clear", 250, 70, 120, 40);  // Text wraps within text box
    text("Save", 250, 130, 120, 40);  // Text wraps within text box
      screen = 1;
      
    }
    if((mousePressed==true) && (mouseX >250)&&(mouseX < 320) && (mouseY > 100) && (mouseY < 180))
    {
      numberoflabels = 3;
      screen = 1;
    }
    if((mousePressed==true) && (mouseX >50)&&(mouseX < 120) && (mouseY > 200) && (mouseY < 280))
    {
      numberoflabels = 4;
      screen = 1;
    }
    if((mousePressed==true) && (mouseX >150)&&(mouseX < 220) && (mouseY > 200) && (mouseY < 280))
    {
      numberoflabels = 5;
      screen = 1;
    }
    if((mousePressed==true) && (mouseX >250)&&(mouseX < 320) && (mouseY > 200) && (mouseY < 280))
    {
      numberoflabels = 6;
      screen = 1;
    }

  }
  if(screen == 1)
  {
    debugtimer++;
    
    
    
    if((mousePressed==true) && (mouseX >0)&&(mouseX < 200) && (mouseY > 0) && (mouseY < 200))
    {
      fill(0);
      //stroke(0);
      //ellipse(mouseX,mouseY,4,4);    
      //line(mouseX, mouseY, mouseX, mouseY);
      //noStroke();  
      if((x != 0) && (y!= 0))
      {
        strokeWeight(6);
        stroke(0);
        fill(45,235,124);
        line(x,y,mouseX,mouseY);
        noStroke();
      }
    }
    if((mousePressed==true) && (mouseX >250)&&(mouseX < 370) && (mouseY > 70) && (mouseY < 110)) //clear
    {
      fill(255);
      rect(0,0,200,200);
    }
    
  
    
    x = mouseX;
    y = mouseY;
  }
}

void savePicture()
{
  
}

void mouseClicked() {
if((mouseX >250)&&(mouseX < 370) && (mouseY > 120) && (mouseY < 160)) //clear
  {
    loadPixels();
    float[] temp = new float[4000];
    int count = 0;
    int index = 0;
    for(int i = 0; i < 200*400; i++)
    {
      //println(i,index,count);
      temp[index] = temp[index] + brightness(pixels[i]);
      count++;
      if(count == 10)
      {
        count = 0;
        index++;
      }
      if(i%400 == 199)
      {
        i = i + 200;
      }
      
    }
    index = 0;
    count = 0;
    
    
    for(int i = 0; i < temp.length; i++) //temp.length
    {
      println(i,index);
      last[index] = last[index] + temp[i];
      index++;
      if(index%20 == 0)
      {
        index = index - 20;
      }
      if((i != 0)&&(i%200 == 0))
      {
        index = index + 20;
      }
      
    }
    
    
    String[] last2 = new String[400];
    for(int i = 0; i < last.length; i++) //temp.length
    {
      last2[i] = str(last[i]);
    }
    
    saveStrings("picture.txt", last2);
    
    //for(int i = 0; i < last.length; i++) //temp.length
    //{
    //  print("nouns.txt", str(temp[i]));
    //  if(i%20 == 0)
    //  {
    //    saveStrings("nouns.txt", str(temp[i]));
    //  }
    //}
    
    
    //pixels[79800] = color(245,24,134);
    //updatePixels();
  }
}