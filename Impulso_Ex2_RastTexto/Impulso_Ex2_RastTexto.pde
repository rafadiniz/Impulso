//rasterização em texto

PImage img;

PFont font;

float t;

void setup () {
  size(1400, 900);

  img = loadImage("https://cdn.culturagenial.com/imagens/quadro-operarios-de-tarsila-do-amaral-og.jpg");
  img.resize(width, height);

}

void draw () {
  background(0);

  t += 0.01;
  
  //frase utilizada na textura
  String frase = "qualquer coisa ";
  
  //espaçamento / pixelização
  float spcX = 10;
  float spcY = 10;

  for (int x = 0; x < width/spcX; x ++) {
    for (int y = 0; y < height/spcX; y ++) {
      
      //obtendo os pixels
      color c = img.get(int(x*spcX), int(y*spcY));

      fill(c);
      //tamanho do texto
      textSize(12);
      //função de texto utilizando a lista x para percorrer o String frase
      //limitado pelo próprio tamanho da frase (.length)
      text(frase.charAt(x%frase.length()), x*spcX,y*spcY);
    }
  }
}
