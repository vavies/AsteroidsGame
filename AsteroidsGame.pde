SpaceShip main = new SpaceShip();
Star[] cool;
boolean rocket = false;
public void setup() 
{
  cool = new Star[300];
  for(int i =0; i<cool.length; i++){
    cool[i] = new Star();
  }
  size(1000,750);
  main.setX(200);
  main.setY(200);
  main.setDirectionX(0);
  main.setDirectionY(0);
  main.setPointDirection(0);


}
public void draw() 
{
  background(0);
  for(int i = 0; i<cool.length; i++){
    cool[i].show();
  }
  main.show();
  main.move();
  main.accelerate(0);
  main.rotate(0);

} 
class SpaceShip extends Floater{
  private int corner = 3;
  private int x2Corners[];
  private int y2Corners[];
  SpaceShip(){
    myColor = color(80,100,190);
    corners = 9;
    //spaceship
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = -40;
    yCorners[0] = -20;
    xCorners[1] = -20;
    yCorners[1] = -10;
    xCorners[2] = 10;
    yCorners[2] = -10;
    xCorners[3] = 30;
    yCorners[3] = 0;
    xCorners[4] = 10;
    yCorners[4] = 10;
    xCorners[5] = -20;
    yCorners[5] = 10;
    xCorners[6] = -40;
    yCorners[6] = 20;
    xCorners[7] = -30;
    yCorners[7] = 0;
    xCorners[8] = -40;
    yCorners[8] = -20;  
    //rocket
    x2Corners = new int[corner];
    y2Corners = new int[corner];
    x2Corners[0] = -20;
    y2Corners[0] = -10;
    x2Corners[1] = -70;
    y2Corners[1] = 0;
    x2Corners[2] = -20;
    y2Corners[2] = 10;

  }
  public void setX(int x) {myCenterX = x;}
  public int getX(){return (int)myCenterX;}
  public void setY(int y){myCenterY = y;}
  public int getY(){return (int)myCenterY;}
  public void setDirectionX(double x){myDirectionX = x;}
  public double getDirectionX(){return myDirectionX;}
  public void setDirectionY(double y){myDirectionY = y;}
  public double getDirectionY(){return myDirectionY;}
  public void setPointDirection(int degrees){myPointDirection = degrees;}
  public double getPointDirection(){return myPointDirection;}

  public void show(){
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated; 

    //rocket
    if(rocket == true){
      fill(250,100,0);
      noStroke();
      beginShape();
      for(int i =0; i<corner; i++){
      xRotatedTranslated = (int)((x2Corners[i]* Math.cos(dRadians)) - (y2Corners[i] * Math.sin(dRadians))+myCenterX);
      yRotatedTranslated = (int)((x2Corners[i]* Math.sin(dRadians)) + (y2Corners[i] * Math.cos(dRadians))+myCenterY);
      vertex(xRotatedTranslated,yRotatedTranslated);
      }
      endShape();
     }
     //spaceship
    fill(255);  
    strokeWeight(5); 
    stroke(myColor);    
    //convert degrees to radians for sin and cos            
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE); 

    fill(0);
    noStroke();
    ellipse((int)myCenterX,(int)myCenterY,10,10);
  
  }
public void move(){
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     
   
    if(myCenterX >width)
    {     
      myDirectionX = 0;
      myDirectionY = 0;    
    }    
    else if (myCenterX<0)
    {     
      myDirectionX = 0;
      myDirectionY = 0;   
    }    
    if(myCenterY >height)
    {    
      myDirectionX = 0;
      myDirectionY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myDirectionX = 0;
      myDirectionY = 0;     
    }   
  } 

}

class Star{
  private int myX,myY;
  public Star(){
    myX = (int)(Math.random()*1000);
    myY = (int)(Math.random()*1000);
  }
  public void show(){
    stroke(190,190,190);
    strokeWeight(2);
    line(myX-5,myY,myX+5,myY);
    line(myX,myY-5,myX,myY+5);
    strokeWeight(1);
    line(myX-3,myY-3,myX+3,myY+3);
    line(myX-3,myY+3,myX+3,myY-3);
  }
}
public void keyPressed(){
  if(key == 'w'){
    main.accelerate(0.1);
    rocket = true;
  }
  if(key == 's'){
    main.accelerate(-0.1);
    rocket = true;
  }
  if(key == 'd'){
    main.rotate(10);
  }
  if(key == 'a'){
    main.rotate(-10);
  }
  //hyperspace
  if(key == 'z'){
    main.setX((int)(Math.random()*1000));
    main.setY((int)(Math.random()*750));
  }

}
public void keyReleased(){
  if(key == 'w'){
    rocket = false;
  }
  if(key == 's'){
    rocket = false;
  }
}



abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 

