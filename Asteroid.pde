public class Asteroid extends Floater{
  private double speed;
  Asteroid(){
    speed = 0;
    myCenterX = (int)(Math.random()*1000);
    myCenterY = (int)(Math.random()*750);

    //drawing
    corners = 7;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = -20;
    yCorners[0] = 0;
    xCorners[1] = -10;
    yCorners[1] = -20;
    xCorners[2] = 5;
    yCorners[2] = -20;
    xCorners[3] = 20;
    yCorners[3] = 0;
    xCorners[4] = 10;
    yCorners[4] = 20;
    xCorners[5] = -10;
    yCorners[5] = 15;
    xCorners[6] = -20;
    yCorners[6] = 0;
  }

  public void show(){
    stroke(50,50,50);
    fill(25,25,25);
    strokeWeight(3);
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

  public void rotate(double rotateSpeed){
    speed = rotateSpeed;
    myPointDirection+=speed;
  }
  public void setRotateSpeed(double rotateSpeed){speed = rotateSpeed;}
  public double getRotateSpeed(){return speed;}


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

}