// SpiralWaves007
// by KaijinQ https://www.openprocessing.org/sketch/448079
// modified for use with Redbubble by Rupert Russell
// 20 July 2020

int TY = 9144/2 ; 
float P[][] = new float[TY][TY] ; 
float Q[][] = new float[TY][TY] ;
float NP[][] = new float[TY][TY] ; 
float NQ[][] = new float[TY][TY] ;
int X ; 
int Y ; 
float PP ; 
float QQ ; 
int L ; 
int countA = 0;
int countB = 0;
int countC = 0;
float A = 0.122 ; // 0.125
float B = 0.065 ; // 0.065
void setup() {

  size(9144, 9144) ; // 9144 x 9144
  noSmooth() ;
  strokeWeight(1) ;
  L = 2;

  for ( X = 0; X < TY; X++ ) {
    for ( Y = 0; Y < TY; Y++ ) {
      P[X][Y] = random(0, 0.25) ;
      Q[X][Y] = random(0, 0.25) ;
    }
  }
} // setup()



void draw() {

  background(0, 0, 0) ;

  for ( X = 1; X < TY-1; X++ ) {
    for ( Y = 1; Y < TY-1; Y++ ) {
      PP = P[X-1][Y-1]+P[X][Y-1]+P[X+1][Y-1]+P[X-1][Y]+P[X+1][Y]+P[X-1][Y+1]+P[X][Y+1]+P[X+1][Y+1] ;
      QQ = Q[X-1][Y-1]+Q[X][Y-1]+Q[X+1][Y-1]+Q[X-1][Y]+Q[X+1][Y]+Q[X-1][Y+1]+Q[X][Y+1]+Q[X+1][Y+1] ;
      NP[X][Y] = P[X][Y] + (A*PP) + (P[X][Y]*(1-(P[X][Y]*P[X][Y]))) - Q[X][Y] ;
      NQ[X][Y] = Q[X][Y] + (B*QQ) + (3*P[X][Y]) - (2*Q[X][Y]) ;
    }
  }

  for ( X = 0; X < TY; X++ ) {
    for ( Y = 0; Y < TY; Y++ ) {
      P[X][Y] = NP[X][Y] ; 
      Q[X][Y] = NQ[X][Y] ;
      if ( P[X][Y] < 0 ) { 
        P[X][Y] = 0 ;
      }
      if ( P[X][Y] > 1 ) { 
        P[X][Y] = 1 ;
      }
      if ( Q[X][Y] < 0 ) { 
        Q[X][Y] = 0 ;
      }
      if ( Q[X][Y] > 1 ) { 
        Q[X][Y] = 1 ;
      }
      stroke(Q[X][Y]*255) ; 
      fill(Q[X][Y]*255) ;
      rect(X*L, Y*L, L, L) ;
    }
    println("countA = " + countA);
  }
  countA++;

  if (countA ==50) {
    countB++;
    countC++;
    
    if(countC == 150){
     exit(); 
    }

    save("spirals_0.122_" + countB + ".png");
    println("spirals_0.122_" + countB + ".png");
    countA = 0;
  } // draw()
}