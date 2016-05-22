class Swipe {
  
  ArrayList<PVector> history = new ArrayList<PVector>();
  int maxHistory = 10;
  int reset = 0;
  int resetTime = 30;
   
   void update( PVector _pos ) {
     
     if ( reset >= 0 ) { reset--; }

     if ( _pos != null ) {
       
       PVector newVector = _pos;
       history.add(newVector);
       
       if ( history.size() > maxHistory ) {
       
          history.remove( 0 );
       
       }
     
     }
     
   }
   
   void debug() {
     
      noFill();
      stroke(200, 70, 70);
      strokeWeight(4);
      
      beginShape();
      
      for ( int i = history.size() - 1; i >= 0; i-- ) {        
        PVector currentVector = history.get( i );
        vertex( currentVector.x, currentVector.y );
      }
      
      endShape();
   
   }
   
   int getSwipe() {
     
     if ( reset <= 0 ) {
             
       if ( history.size() >= maxHistory - 1 ) {
         
        float diff = history.get(0).x - history.get(history.size() -1).x;
        
        if ( diff < - width / 2 ) {

          reset = resetTime;
          return -1;
          
           
        } else if ( diff > width / 2 ) {
          
          reset = resetTime;
          return 1;
             
        } else { return 0; }

       } else { return 0; }
     
     } else { return 0; }

   }
}