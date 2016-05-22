import de.voidplus.leapmotion.*;

PFont font_regular, font_bold;

Pannel genderPannel, agePannel, pricesPannel, catPannel;

String[] genders = {"HOMME", "FEMME" };
String[] ages = {"- 15", "16 - 25", "26 - 35", "36 - 55", "55 +"};
String[] prices = {"- 10", "10 - 20", "21 - 30", "31 - 40", "50 +"};
String[] cats = {"CUISINE", "PAPETERIE", "SALLE DE BAIN", "GADGETS"};


int cursorSize = 40;

PVector handPosition;
PVector handVelocity = new PVector(0, 0, 0);
int resetPinch;
boolean tap = false;

int currentIndex = 0;
ArrayList<Pannel> pannels;

Swipe swipe;

LeapMotion leap;

void setup() {
  frameRate(60);
  //size(1280, 700, P2D);
  fullScreen();

  colorMode(HSB, 360, 100, 100);
  noCursor();

  swipe = new Swipe();
  leap = new LeapMotion(this).allowGestures("key_tap");
  
  pannels = new ArrayList<Pannel>();
  
  genderPannel = new Pannel("GENRE", genders, 0, 180, 100);
  agePannel = new Pannel("GENRE", ages, width, 324, 100);
  pricesPannel = new Pannel("PRICES", prices, width, 213, 100);
  catPannel = new Pannel("CATEGORIES", cats, width, 123, 100);
  
  pannels.add ( genderPannel );
  pannels.add ( agePannel );
  pannels.add ( pricesPannel );
  pannels.add ( catPannel );
  

  font_bold = createFont("Lato-Bold.ttf", 32);
  font_regular = createFont("Lato-Regular.ttf", 32);
  textFont(font_regular);
}


void draw() {
  background(320, 0, 100);

  for (Hand hand : leap.getHands()) {
    PVector hand_stabilized = hand.getStabilizedPosition();

    handPosition = new PVector( hand_stabilized.x, hand_stabilized.y, hand_stabilized.z );
  }

  swipe.update(handPosition);
  
  int swapAmount = swipe.getSwipe();

  if ( swapAmount != 0 ) {
    
    if ( swapAmount == 1 ) {
      
      println("SWIPE >");
      
      if ( currentIndex < pannels.size() - 1 ) {
        
        pannels.get(currentIndex).slideLeft();
        pannels.get(currentIndex + 1).slideLeft();
        currentIndex++;
      
      }
      
    } else if ( swapAmount == -1 ) {
    
      println("SWIPE <");
      
      if ( currentIndex > 0 ) {
      
        pannels.get(currentIndex).slideRight();
        pannels.get(currentIndex - 1).slideRight();
        currentIndex--;
        
      }
      
    }
    
  }
  
  for ( Pannel p : pannels ) {
    p.show();
  }

  if ( handPosition != null ) {
    fill(0, 0, 0, 80);
    noStroke();
    rect(handPosition.x, height - 10, cursorSize, 3);
  }

  //
  // UPDATE
  if ( resetPinch > 0 ) {
    resetPinch--;
  }

  tap = false;
}





// ----- KEY TAP GESTURE -----

void leapOnKeyTapGesture(KeyTapGesture g) {
  if ( resetPinch <= 0 ) {

    tap = true;
    resetPinch = 30;
  }
}