void setup(){
  background(200);
  size(400,300);
  frameRate(600);
  noStroke();
  rect(0,0,200,200); //drawing area
  rect(250,40,120,40); //clear
  rect(250,90,150,40); //save label
  rect(250,140,150,40); //save test
  rect(250,190,80,25); //test
  
  rect(20,230,40,40);
  rect(80,230,40,40);
  rect(140,230,40,40);
  rect(200,230,40,40);
  rect(260,230,40,40);
  rect(320,230,40,40);

  
  
  textSize(28);
  fill(0);
  text("Clear", 250, 75); 
  text("Save Label", 250, 125);
  text("Save Test", 250, 175);
  
  textSize(20);
  text("Label", 180, 220);
  text("1", 30, 260);
  text("2", 90, 260);
  text("3", 150, 260);
  text("4", 210, 260);
  text("5", 270, 260);
  text("6", 330, 260);
  textSize(15);
  text("test (no label)", 240, 210);
  
}

int x = 0;
int y = 0;

String[] alllabels = new String[10000];

String[] tests = new String[10000];



int labelsindex = 0;
int testindex = 0;

int label1amount = 0;
int label2amount = 0;
int label3amount = 0;
int label4amount = 0;
int label5amount = 0;
int label6amount = 0;

int testamount = 0;

int label = 0;

float[] last = new float[400]; //final saved picture training
float[] last2 = new float[400]; //final saved picture for testing

//New features
float total_press_time = 0;
float total_press_amount = 0;
float startx = -1;
float starty = -1;
float endx = -1;
float endy = -1;

boolean startdraw = false;


void draw()
{
  fill(200);
  rect(0,275,400,50);
  fill(0);
  textSize(16);
  text(str(label1amount), 40, 290);
  text(str(label2amount), 100, 290);
  text(str(label3amount), 160, 290);
  text(str(label4amount), 220, 290);
  text(str(label5amount), 280, 290);
  text(str(label6amount), 340, 290);
  text(str(testamount), 350, 210);
  if((mousePressed==true) && (mouseX >0)&&(mouseX < 200) && (mouseY > 0) && (mouseY < 200))
  {
    //stroke(0);
    //ellipse(mouseX,mouseY,4,4);    
    //line(mouseX, mouseY, mouseX, mouseY);
    //noStroke();  
    if((x != 0) && (y!= 0))
    {
      strokeWeight(5);
      stroke(0);
      //fill(45,235,124);
      //fill(200,50,20);
      line(x,y,mouseX,mouseY);
      noStroke();
    }
    if(startdraw == false)
    {
      startx = mouseX;
      starty = mouseY;
      startdraw = true;
    }
    endx = mouseX;
    endy = mouseY;
    total_press_time = total_press_time + 0.01;
    print(total_press_amount + " ");
  }
  if((mousePressed==true) && (mouseX >250)&&(mouseX < 370) && (mouseY > 40) && (mouseY < 80)) //clear
  {
    fill(255);
    rect(0,0,200,200);
    total_press_time = 0;
    total_press_amount = 0;
    startx = -1;
    starty = -1;
    endx = -1;
    endy = -1;
    startdraw = false;
  }
  

  
  x = mouseX;
  y = mouseY;
}

void savePicture()
{
    
  save("thepicture.png");
  PImage thepicture = loadImage("thepicture.png");
  PImage finalpicture = thepicture.get(0, 0, 200, 200); 
  finalpicture.resize(40, 40);
  finalpicture.filter(THRESHOLD, 0.5);
  finalpicture.loadPixels();
  //for(int i = 0; i < thepicture.pixels.length; i++)
  //{
  //print(thepicture.pixels[i] + " ");
  //}
  
  
  
  //  loadPixels();
  //  float[] temp = new float[4000];
  //  int count = 0;
  //  int index = 0;
  //  for(int i = 0; i < 200*400; i++)
  //  {
  //    //println(i,index,count);
  //    temp[index] = temp[index] + red(pixels[i])*0.3 + green(pixels[i])*0.59 + blue(pixels[i])*0.11;
  //    count++;
  //    if(count == 10)
  //    {
  //      count = 0;
  //      index++;
  //    }
  //    if(i%400 == 199)
  //    {
  //      i = i + 200;
  //    }
      
  //  }
  //  index = 0;
  //  count = 0;
  //  for(int i = 0; i < temp.length; i++) //temp.length
  //  {
  //    //println(i,index);
  //    last[index] = last[index] + temp[i];
  //    index++;
  //    if(index%20 == 0)
  //    {
  //      index = index - 20;
  //    }
  //    if((i != 0)&&(i%200 == 0))
  //    {
  //      index = index + 20;
  //    }
      
  //  }
  //  //===== 
    
    String thedata = "";
    
    //red(pixels[i])*0.3 + green(pixels[i])*0.59 + blue(pixels[i])*0.11;
    
    for(int i = 0; i < finalpicture.pixels.length;i++)
  {
    float brightness = red(finalpicture.pixels[i])*0.3 + green(finalpicture.pixels[i])*0.59 + blue(finalpicture.pixels[i])*0.11;
    thedata = thedata + str(brightness) + ",";
    //print(thepicture.pixels[0] + " ");
  }
    
    //for(int i = 0; i < last.length; i++) //temp.length
    //{
    //  thedata = thedata + str(last[i]) + ",";
    //}
    
    //===== add new features here
    thedata = thedata + str(total_press_time) + "," + str(total_press_amount) + "," + 
    str(total_press_time/total_press_amount) + "," + str(startx) + 
    "," + str(starty) + "," + str(endx) + "," + str(endy) + "," ;
    
    
    thedata = thedata + str(label);
    alllabels[labelsindex] = thedata;
    labelsindex++;
    print(thedata);
    thedata = "";
    
    for(int i = 0; i < last.length;i++)
    {
      last[i] = 0;
    }
    
    fill(255);
    rect(0,0,200,200); //clears the board
    total_press_time = 0;  //resets features
    total_press_amount = 0;
    startx = -1;
    starty = -1;
    endx = -1;
    endy = -1;
    startdraw = false;
    
    
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

void testPicture()
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
      //println(i,index);
      last2[index] = last2[index] + temp[i];
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
    //===== 
    
    String thedata = "";
    
    for(int i = 0; i < last2.length; i++) //temp.length
    {
      thedata = thedata + str(last2[i]) + ",";
    }
    //===== add new features here
    thedata = thedata + str(total_press_time) + "," + str(total_press_amount) + "," + 
    str(total_press_time/total_press_amount) + "," + str(startx) + 
    "," + str(starty) + "," + str(endx) + "," + str(endy) + "," ;
    
    tests[testindex] = thedata;
    testindex++;
    thedata = "";
    
    for(int i = 0; i < last2.length;i++)
    {
      last2[i] = 0;
    }
    
    fill(255);
    rect(0,0,200,200); //clears the board
    
    total_press_time = 0;
    total_press_amount = 0;
    startx = -1;
    starty = -1;
    endx = -1;
    endy = -1;
    startdraw = false; //resets features
}



void mouseClicked() {
  
  
  
  if((mouseX >20)&&(mouseX < 60) && (mouseY > 230) && (mouseY < 270)) 
  {
    label = 1;
    label1amount++;
    savePicture();
  }
  if((mouseX >80)&&(mouseX < 120) && (mouseY > 230) && (mouseY < 270)) 
  {
    label = 2;
    label2amount++;
    savePicture();
  }
  if((mouseX >140)&&(mouseX < 180) && (mouseY > 230) && (mouseY < 270)) 
  {
    label = 3;
    label3amount++;
    savePicture();
  }
  if((mouseX >200)&&(mouseX < 240) && (mouseY > 230) && (mouseY < 270)) 
  {
    label = 4;
    label4amount++;
    savePicture();
  }
  if((mouseX >260)&&(mouseX < 300) && (mouseY > 230) && (mouseY < 270)) 
  {
    label = 5;
    label5amount++;
    savePicture();
  }
  if((mouseX >320)&&(mouseX < 360) && (mouseY > 230) && (mouseY < 270)) 
  {
    label = 6;
    label6amount++;
    savePicture();
  }
  
  if((mouseX >250)&&(mouseX < 330) && (mouseY > 190) && (mouseY < 215)) 
  {
    fill(200);
    rect(330,190,80,25);
    testamount++;
    testPicture();
  }
  
  if((mouseX >250)&&(mouseX < 400) && (mouseY > 90) && (mouseY < 130)) //saves label
  {
    int datanumber = 0;
    for(int i = 0; i < alllabels.length; i++)
    {
      if(alllabels[i] != null)
      {
        datanumber++;
      }
    }
    
    
    String[] finaldata = new String[datanumber];
    
    for(int i = 0; i < datanumber; i++)
    {
      finaldata[i] = alllabels[i];
    }
    
    saveStrings("trainingdata.txt", finaldata);
    println("Training Data Saved");
  }
  if((mouseX >250)&&(mouseX < 400) && (mouseY > 140) && (mouseY < 180)) //saves Test
  {
    int datanumber = 0;
    for(int i = 0; i < tests.length; i++)
    {
      if(tests[i] != null)
      {
        datanumber++;
      }
    }
    
    
    String[] finaldata = new String[datanumber];
    
    for(int i = 0; i < datanumber; i++)
    {
      finaldata[i] = tests[i];
    }
    
    saveStrings("testdata.txt", finaldata);
    println("Test Data Saved");
  }
}


void mouseReleased() {
  
  if((mouseX >0)&&(mouseX < 200) && (mouseY > 0) && (mouseY < 200))
  {
    total_press_amount++;
  }
  
}