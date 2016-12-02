class Bullet extends Floater{
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

	public Bullet(SpaceShip theShip){
		myCenterX = theShip.getX();
		myCenterY = theShip.getY();
		myPointDirection = theShip.getPointDirection();
		double dRadians = myPointDirection*(Math.PI/180);
		myDirectionX = 5*Math.cos(dRadians) + theShip.getDirectionX();
		myDirectionY = 5*Math.sin(dRadians) + theShip.getDirectionY();
	}
	public void show(){
		noFill();
		stroke(90,250,90);
		strokeWeight(2);
		ellipse((int)myCenterX,(int)myCenterY,5,2); 
	}
	public void move(){
		myCenterX += myDirectionX;
		myCenterY += myDirectionY;

	    if(myCenterX >width)
	    {     
	      death = false;   
	    }    
	    else if (myCenterX<0)
	    {     
	      death = false; 
	    }    
	    if(myCenterY >height)
	    {    
	      death = false; 
	    }   
	    else if (myCenterY < 0)
	    {     
	      death = false;
	    }   
	}
}