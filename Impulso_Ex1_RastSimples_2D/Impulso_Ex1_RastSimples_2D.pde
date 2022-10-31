//rasterização simples 2D
PImage img;

void setup() {
  size(1080, 720);

  img = loadImage("https://cdn.culturagenial.com/imagens/quadro-operarios-de-tarsila-do-amaral-og.jpg");
  img.resize(width, height);
}


void draw() {

  background(240);
  
  //espaçamento / pixelização 
  float spcX = 4;
  float spcY = 4;
  
  //loops para gerar lista relativa ao tamanho da imagem
  for (int x = 0; x < img.width; x += spcX) {
    for (int y = 0; y < img.height; y += spcY) {
      //obtendo os pixels
      color c = img.get(x, y);
      //configurando os pixels em cores
      fill(c);
      noStroke();
      //tipo de textura
      rect(x,y,spcX,spcY);

    }
  }
}
