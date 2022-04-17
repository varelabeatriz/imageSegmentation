void setup(){
size(402,304);
noLoop();
}


void draw(){
PImage img = loadImage("03.PNG");
PImage aux = createImage(img.width,img.height,RGB);

// Filtro Média com janela deslizante
for (int y=0; y < img.height; y++){
  for(int x=0; x< img.width;x++){
  int pos = y*img.width +x;
  int jan = 10, qtde=0; //referente a janela do pixel, dois pra cima e dois pra baixo
  float media =0;
  
  //laço dentro do laço, para separar um determinado pixel e seus pixels de volta
  for(int i = jan*(-1); i<= jan;i++){
    for(int j =jan*(-1); j <=jan; j++){
      int nx = x+j; // novo x
      int ny = y+i; //novo y
      //verificar se estamos fora da imagem
      if (ny >=0 && ny < aux.height && nx>=0 && nx < aux.width){
       int pos_aux = ny*aux.width + nx;
       media += red(img.pixels[pos_aux]);
       qtde++;
      }   
   }
  }
    media = media/qtde;
    aux.pixels[pos] = color(media);
  }
};

//filtro escala de cinza
//obj: O objetivo desse código é aplicar um filtro cinza a uma determinada imagem

for (int y=0; y < img.height; y++){
  for(int x=0; x< img.width;x++){
  int pos = y*img.width +x;  
  float media = (red(img.pixels[pos]) + green(img.pixels[pos]) + blue(img.pixels[pos]) /3); //FUNCAO USADA PARA APLICAR O FILTRO COM A MEDIA
  img.pixels[pos] = color(media); //FUNCAO USADA PARA APLICAR O FILTRO COM A MEDIA
  //img.pixels[pos] = color(red(img.pixels[pos])); //FUNCAO USADA PARA APLICAR O FILTRO COM UMA COR SÓ
}}

// filtro de linearização
for (int y=0; y < img.height; y++){ //linha pra percorrer a imagem
  for(int x=0; x< img.width;x++){//linha pra percorrer a imagem
  int pos = y*img.width +x; //linha pra percorrer a imagem
  if
    (blue(aux.pixels[pos]) > 120 && y<480) aux.pixels[pos] = color(255);
  
  else
  aux.pixels[pos] = color(0);
  
}}

image(aux,0,0); // printa a imagem ou aux
save("resultado.jpg"); //gera um novo arquivo, dessa vez uma imagem em preto e branco
}
