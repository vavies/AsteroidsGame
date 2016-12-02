class SpaceShip extends Floater{
  private int corner = 3;
  private int x2Corners[];
  private int y2Corners[];
  public SpaceShip(){
    myColor = color(100,100,100);
    corners = 9;
    //spaceship
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = -20;
    yCorners[0] = -10;
    xCorners[1] = -10;
    yCorners[1] = -5;
    xCorners[2] = 5;
    yCorners[2] = -5;
    xCorners[3] = 15;
    yCorners[3] = 0;
    xCorners[4] = 5;
    yCorners[4] = 5;
    xCorners[5] = -10;
    yCorners[5] = 5;
    xCorners[6] = -20;
    yCorners[6] = 10;
    xCorners[7] = -15;
    yCorners[7] = 0;
    xCorners[8] = -20;
    yCorners[8] = -10;  
    //rocket
    x2Corners = new int[corner];
    y2Corners = new int[corner];
    x2Corners[0] = -10;
    y2Corners[0] = -5;
    x2Corners[1] = -35;
    y2Corners[1] = 0;
    x2Corners[2] = -10;
    y2Corners[2] = 5;
    myPointDirection = 0;
    myDirectionX=0;
    myDirectionY=0;
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
    strokeWeight(3); 
    stroke(myColor);            
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE); 

    // fill(0);
    // noStroke();
    // ellipse((int)myCenterX,(int)myCenterY,5,5);
  
  }
public void move(){
    myCenterX = myCenterX + myDirectionX;    
    myCenterY = myCenterY + myDirectionY;     
   
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