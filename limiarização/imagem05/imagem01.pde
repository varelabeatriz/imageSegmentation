void setup(){
size(500,400);
noLoop();
}

void draw(){
  PImage img = loadImage("80457.jpg");
  PImage aux = createImage(img.width,img.height,RGB);

  //filtro escala de cinza
  for (int y=0; y < img.height; y++){
    for(int x=0; x< img.width;x++){
      int pos = y*img.width +x;  
      float media = (red(img.pixels[pos]) + green(img.pixels[pos]) + blue(img.pixels[pos]) /3);
      img.pixels[pos] = color(media); 

    }
  }
  
   // Brilho
  for (int y = 0; y < img.height; y++) {
    for (int x = 0; x < img.width; x++) {
      int pos = y * img.width + x;
      float valor = red(img.pixels[pos])*20; 
      if (valor > 255) valor = 255; 
      else if (valor < 0) valor = 0;
      aux.pixels[pos] = color(valor);
    }
  }
  
  // Filtro Média com janela deslizante
  for (int y=0; y < img.height; y++){
    for(int x=0; x< img.width;x++){
      int pos = y*img.width +x;
      int jan = 2, qtde=-16; 
      float media =0;
  
      for(int i = jan*(-1); i<= jan;i++){
        for(int j =jan*(-1); j <=jan; j++){
          int nx = x+j;
          int ny = y+i;
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

  // filtro de linearização
  for (int y=0; y < img.height; y++){
    for(int x=0; x< img.width;x++){
      int pos = y*img.width +x; 
      if
        (blue(aux.pixels[pos]) > 120 && y<480) aux.pixels[pos] = color(255);
      
      else
      aux.pixels[pos] = color(0);
    }
  }

  image(aux,0,0); // printa a imagem ou aux
  save("imgMEDIA.jpg"); //gera um novo arquivo, dessa vez uma imagem em preto e branco
}
