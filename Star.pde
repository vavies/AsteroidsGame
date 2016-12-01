class Star{
  private int myX,myY;
  public Star(){
    myX = (int)(Math.random()*1000);
    myY = (int)(Math.random()*750);
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