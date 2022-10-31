//rasterização volumétrica 
PImage img;

void setup() {
  size(1400, 900, P3D);
  
  img = loadImage("https://www.planocritico.com/wp-content/uploads/2014/04/o-dragao-da-maldade-contra-o-santo-guerreiro.jpg");
  img.resize(width,height);
}


void draw() {
  background(0);
  
  directionalLight(250,250,250,-1,-1,-1);
  directionalLight(250,250,250,-1,1,-1);
  
  //espaçamento / pixelização
  float spcX = 12;
  float spcY = 18;
 
  for (int x = 0; x < width; x += spcX) {
    for (int y = 0; y < height; y += spcY) {
      color c = img.get(x,y);
      
      //obtendo o brilho
      float b = brightness(c);
      
      //controlando a extrusão ponto Z
      float ex = map(mouseY,0,height,-850,850);
      
      //Z volumétrico a patir do brilho ou saturação
      float z = map(b,0,255,-ex,ex);
      
      //rotação gradiente a partir dos iteradores das listas
      float rotZ = map(y,0,height,-90,90);
      float rotY = map(y,0,height,-90,90);
      float rotX = map(x,0,width,-90,90);

      fill(c);      

      push();
      translate(x, y, z);
      //interatividade com o mouse somado às rotações gradientes
      rotateZ(radians(rotZ+mouseY));
      rotateY(radians(rotY+mouseX));
      rotateX(radians(rotX+mouseY));
      
      stroke(0,20);
      box(spcX+5,spcY+5,spcX);
      pop();
    }
  }
}
