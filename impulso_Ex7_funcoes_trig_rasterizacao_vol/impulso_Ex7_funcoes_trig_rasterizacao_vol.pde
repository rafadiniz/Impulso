//funções trigonométricas na rasterização volumétrica
float t;

PImage img;

void setup() {
  size(1400, 900, P3D);

  img = loadImage("https://s2.glbimg.com/lPcVa37bh_imqqDQ_fm7ZsQI9LA=/0x720/https://s2.glbimg.com/VIYCY7Vsui9SxSu-tNU9EKkREHc=/i.s3.glbimg.com/v1/AUTH_c3c606ff68e7478091d1ca496f9c5625/internal_photos/bs/2021/C/L/pWv2bBQBmVyNDPwQptzQ/2021-1463-o-dragao-da-maldade-background.jpg");
  img.resize(width, height);
  
  smooth(8);
}


void draw() {
  background(0);
  
  t += 0.01;
  

  directionalLight(240, 240, 240, -1, -1, -1);
  directionalLight(240, 240, 240, -1, 1, -1);

  for (int x = 0; x < width; x += 12) {
    for (int y = 0; y < height; y += 12) {
      color c = img.get(x, y);
      
      //rotações mapeando as listas do loop
      float rotX = map(x, 0, width, -90, 90);
      float rotY = map(y, 0, height, -90, 90);
      
      //parte Z
      float s = brightness(c);
      float z = map(s, 0, 255, -250, 80);
      //tangente para efeito das particulas passando a tela
      float nz = tan(z*0.01+t)*40;

      push();
      translate(x, y, z+nz);
      rotateX(radians(rotX+mouseX));
      rotateY(radians(rotY+mouseY));
      fill(c);
      stroke(0, 40);
      box(14);
      pop();
    }
  }
  
}
  
  
