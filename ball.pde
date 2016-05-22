class Ball {

  int x;
  int y;
  int w;
  
  String name;
  int textSize = 30;
  
  int h;
  int s;
  int b;
  
  boolean animating = false;
  
  int offset = 0;
  
  boolean isHover = false;
  boolean isClicked = false;

  Ball( String _name, int _x, int _w, int _h, int _s, int _b ) {
    name = _name;
    
    x = _x;
    w = _w;
   
    h = _h;
    s = _s;
    b = _b;
  }
  
  void show(boolean _animating, int _offset) {
    
    offset = _offset;
    animating = _animating;
    int tx = x + offset;
    
    
    
    if ( handPosition != null && !animating ) {

      isHover = handPosition.x > tx && handPosition.x < tx + w;
      
    } else {
      
      isHover = false;
    
    }
    
    if ( isHover && tap && !animating ) {
      
      if ( isClicked ) {
        isClicked = false;
      } else {
        isClicked = true;
      }
      
    }
    
    if ( isHover ) {
      fill(320, 0, 100);
    } else {
      fill(h, s, b);
    }
      
    if ( isClicked ) {
      stroke( 41, 90, 100 );
    } else { 
      stroke(h, s, b);
    }

    strokeWeight(0);
    rect(tx, 0, w, height);

    if ( isHover ) {
      fill(h, s, b);
    } else {
      fill(0, 0, 100);
    }

    textAlign(CENTER);
    textSize(textSize);
    text(name, tx + w / 2, ( height + textSize) / 2);
    
    int checkedRadius = 40;
    
    if ( isHover ) {
      stroke(h, s, b);
      strokeWeight(2);
      noFill();
    } else {
      stroke(0, 0, 100);
      strokeWeight(2);
      noFill();
    }
    
    ellipse(tx + w / 2, height - 60, checkedRadius, checkedRadius);
    
    noStroke();
    
    if ( isClicked && isHover ) {
      
      fill(h, s, b);
      ellipse(tx + w / 2, height - 60, checkedRadius - 10, checkedRadius - 10);
    
    } else if ( isClicked ) {
    
       fill(0, 0, 100);
       ellipse(tx + w / 2, height - 60, checkedRadius - 10, checkedRadius - 10);
    
    } 

  }
}