class Pannel {
  
  String name;
  
  int offset, slideX;
  
  
  boolean isAnimating = false;
  boolean isAnimatingLeft = false;
  boolean isAnimatingRight = false;
  
  int cH, cS;
  
  int swapSpeed = 80;
  
  
  ArrayList<Ball> balls;

  
  Pannel(String _name, String[] _params, int _offset, int _cH, int _cS ) {
    name = _name;
    
    cH = _cH;
    cS = _cS;
    
    offset = slideX = _offset;
    
    balls = new ArrayList<Ball>();
    
    int w = width / _params.length;
    
    for ( int i = 0; i < _params.length; i++ ) {
      
      int x = width / _params.length * i;
      
      Ball newBall = new Ball( _params[i], x, w, cH, cS, 30 + i * 10);
      
      balls.add(newBall);
       
    }
  }
 
  void slideLeft() {
    isAnimating = true;
    isAnimatingLeft = true;
  }
  
  void slideRight() {
    isAnimating = true;
    isAnimatingRight = true;
  }
  
  void show() {
    
    if ( isAnimating ) {
      
      if ( isAnimatingLeft ) {
        
        if ( offset > slideX - width ) {
        
          offset -= swapSpeed;
          
        } else {
        
          slideX = offset;
          isAnimating = false;
          isAnimatingLeft = false;
          
       }
        
      } else if ( isAnimatingRight ) {
        
        
        if ( offset < slideX + width ) {
        
          offset += swapSpeed;
          
        } else {
        
          slideX = offset;
          isAnimating = false;
          isAnimatingRight = false;

       }
      }
    }
    
    for ( Ball b : balls ) {
      b.show(isAnimating, offset);
    }

  }
}