SpaceShip main = new SpaceShip();
Star[] cool;
int scenes = 0;
int life = 3;

ArrayList<Asteroid> danger = new ArrayList<Asteroid>();
boolean rocket = false;
ArrayList<Bullet> phew = new ArrayList<Bullet>();
boolean death = false;

public void setup() 
{
  size(1000,750);
  cool = new Star[300];
  for(int i =0; i<cool.length; i++){
    cool[i] = new Star();
  }
  for(int i = 0; i<1; i++){
    danger.add(new Asteroid());
  }

  for(int i = 0; i<danger.size(); i++){
    danger.get(i).setX((int)(Math.random()*1000));
    danger.get(i).setY((int)(Math.random()*750));
    danger.get(i).setDirectionX((Math.random()*3-1));
    danger.get(i).setDirectionY(Math.random()*3-1);
    danger.get(i).setRotateSpeed(Math.random()*3-1);
  }
  main.setX(200);
  main.setY(200);
  if(danger.size() ==0){
    scenes = 1;
  }

}
public void draw() 
{
  if(scenes == 0){
  background(0);
    for(int i = 0; i<cool.length; i++){
    cool[i].show();
  }
  for(int s =1; s<phew.size(); s++){
    phew.get(s).show();
    phew.get(s).move();
  } 

  main.show();
  main.move();
  for(int t = 0; t<danger.size(); t++){
    danger.get(t).show();    
    danger.get(t).move();
    danger.get(t).rotate(danger.get(t).getRotateSpeed());
  }
  for(int i = 0; i<danger.size(); i++){
    // rocket makes astoirds go awayd
    if(10>dist(main.getX(), main.getY(), danger.get(i).getX(), danger.get(i).getY())){
      danger.remove(i);
      life--;
    }
    for(int p = 0; p<phew.size(); p++){
      //bullets make astoirds go away
      if(20>dist(phew.get(p).getX(), phew.get(p).getY(), danger.get(i).getX(), danger.get(i).getY())){
        danger.remove(i);
        phew.remove(p);
      }
    }
  }
  if(scenes ==1){
    background(0);
    textSize(40);
    textAlign(CENTER);
    fill(40,40,40);
    text("YOU WIN!",500,300);
    strokeWeight(5);
    fill(255);
    rect(400,330,200,50);
    fill(90,90,90);
    text("RESTART WITH ENTER",500,375);
  }
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

