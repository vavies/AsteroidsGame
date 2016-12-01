public void keyPressed(){
  if(key == 'w'){
    main.accelerate(0.05);
    rocket = true;
  }
  if(key == 's'){
    main.accelerate(-0.05);
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
    main.setDirectionX(0);
    main.setDirectionY(0);
  }
  if(key == ' '){
    death = true;
    phew.add(new Bullet(main));
  }
}
public void keyReleased(){
  if(key == 'w'){
    rocket = false;
  }
  if(key == 's'){
    rocket = false;
  }
  if(key == ' '){
    death = false;
  }
}