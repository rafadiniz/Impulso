//funções trigonométricas no grid e nas cores

float t;

void setup () {
  size(900, 900);
}

void draw() {
  background(0);

  t += 0.01;

  for (int x = 0; x < width; x += 12) {
    for (int y = 0; y < height; y += 12) {
      
      //oscilando cada posição do grid 
      float cx = cos(x*0.01+t)*80;
      float sy = sin(y*0.01+t)*80;

      fill(
        127+sin(y*0.01+t)*127, 
        127+sin(x*0.02+t)*127, 
        127+sin(y*0.03+t)*127
        );
      noStroke();  
      rect(x+cx, y+sy, 120, 120);
    }
  }
}
