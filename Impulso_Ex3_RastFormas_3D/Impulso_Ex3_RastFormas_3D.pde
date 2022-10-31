//rasterização em formas 3D
PImage img;

void setup() {
  size(1400, 900, P3D);
  smooth(8);

  img = loadImage("https://www.planocritico.com/wp-content/uploads/2014/04/o-dragao-da-maldade-contra-o-santo-guerreiro.jpg");
  img.resize(1400, 900);
}


void draw() {

  background(0);

  directionalLight(240, 240, 240, -1, -1, -1);
  directionalLight(240, 240, 240, -1, 1, -1);

  //espaçamento / pixelização
  float spcX = 30;
  float spcY = 30;

  for (int x = 0; x < width; x += spcX) {
    for (int y = 0; y < height; y += spcY) {
      color c = img.get(x, y);
      
      //rotação (rotates) gradiente usando as listas x e y
      float rotX = map(x, 0, width, 0, 77);
      float rotY = map(y, 0, height, 0, 90);
      
      //interatividade com o mouse no rotateZ
      float mZ = map(mouseY, 0, height, -45, 45);

      push();
      strokeWeight(0.6);
      translate(x, y);
      rotateX(radians(rotX+frameCount));
      rotateY(radians(rotY+frameCount));
      rotateZ(radians(rotY+mZ));
      stroke(0, 80);
      fill(c);
      box(spcX-5);
      pop();
    }
  }
}
