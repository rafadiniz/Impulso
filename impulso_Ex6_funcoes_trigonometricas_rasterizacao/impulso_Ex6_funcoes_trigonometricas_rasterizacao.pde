//funções trigonométricas na rasterização
float t;

PImage img;

void setup() {
  size(1400, 900);

  img = loadImage("https://s2.glbimg.com/lPcVa37bh_imqqDQ_fm7ZsQI9LA=/0x720/https://s2.glbimg.com/VIYCY7Vsui9SxSu-tNU9EKkREHc=/i.s3.glbimg.com/v1/AUTH_c3c606ff68e7478091d1ca496f9c5625/internal_photos/bs/2021/C/L/pWv2bBQBmVyNDPwQptzQ/2021-1463-o-dragao-da-maldade-background.jpg");
  img.resize(width, height);
}


void draw() {
  background(0);
  
  t += 0.01;

  for (int x = 0; x < width; x+= 4) {
    for (int y = 0; y < height; y+= 4) {
      //funçoes trigonometricas e noise usando as listas x e y
      float nx = map(noise(x*0.018+t),0,1,-1,1)*80;
      float sy = sin(y*0.013+t)*80;
      
      //distorcendo os pixels no eixo x e y
      color c = img.get(int(x+nx), int(y+sy));
      
      //obtendo o brilho da imagem a partir dos pixels (img.get)
      float b = brightness(c);
      
      noStroke();
      fill(c,b);
      rect(x, y, 4, 4);
    }
  }
}
