void setup(){
  background(200);
  size(400,300);
  frameRate(600);
  noStroke();
  rect(0,0,200,200);
  rect(250,70,120,40); //clear
  rect(250,120,120,40); //save
  
  rect(20,230,40,40);
  rect(80,230,40,40);
  rect(140,230,40,40);
  rect(200,230,40,40);
  rect(260,230,40,40);
  rect(320,230,40,40);

  
  
  textSize(28);
  fill(0);
  text("Clear", 250, 70, 120, 40);  // Text wraps within text box
  text("Save", 250, 130, 120, 40);  // Text wraps within text box
  
  textSize(20);
  text("Label", 180, 220);
  text("1", 30, 260);
  text("2", 90, 260);
  text("3", 150, 260);
  text("4", 210, 260);
  text("5", 270, 260);
  text("6", 330, 260);
  
}

int x = 0;
int y = 0;

int[] label1 = new int[400000];
int[] label2 = new int[400000];
int[] label3 = new int[400000];
int[] label4 = new int[400000];
int[] label5 = new int[400000];
int[] label6 = new int[400000];


int label1index = 0;
int label2index = 0;
int label3index = 0;
int label4index = 0;
int label5index = 0;
int label6index = 0;

int label = 0;

float[] last = new float[400]; //final saved picture
void draw()
{
  fill(200);
  rect(0,275,400,50);
  fill(0);
  textSize(16);
  text(str(label1index), 40, 290);
  text(str(label2index), 100, 290);
  text(str(label3index), 160, 290);
  text(str(label4index), 220, 290);
  text(str(label5index), 280, 290);
  text(str(label6index), 340, 290);
  if((mousePressed==true) && (mouseX >0)&&(mouseX < 200) && (mouseY > 0) && (mouseY < 200))
  {
    fill(0);
    //stroke(0);
    //ellipse(mouseX,mouseY,4,4);    
    //line(mouseX, mouseY, mouseX, mouseY);
    //noStroke();  
    if((x != 0) && (y!= 0))
    {
      strokeWeight(10);
      stroke(0);
      //fill(45,235,124);
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

void mouseClicked() {
  
  if((mouseX >20)&&(mouseX < 60) && (mouseY > 230) && (mouseY < 270)) 
  {
    label = 1;
    label1index++;
    println("1");
  }
  if((mouseX >20)&&(mouseX < 60) && (mouseY > 230) && (mouseY < 270)) 
  {
    label = 1;
    label1index++;
    println("1");
  }
  if((mouseX >20)&&(mouseX < 60) && (mouseY > 230) && (mouseY < 270)) 
  {
    label = 1;
    label1index++;
    println("1");
  }
  if((mouseX >20)&&(mouseX < 60) && (mouseY > 230) && (mouseY < 270)) 
  {
    label = 1;
    label1index++;
    println("1");
  }
  if((mouseX >20)&&(mouseX < 60) && (mouseY > 230) && (mouseY < 270)) 
  {
    label = 1;
    label1index++;
    println("1");
  }
  if((mouseX >20)&&(mouseX < 60) && (mouseY > 230) && (mouseY < 270)) 
  {
    label = 1;
    label1index++;
    println("1");
  }
  
if((mouseX >250)&&(mouseX < 370) && (mouseY > 120) && (mouseY < 160)) 
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