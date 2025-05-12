interface Forma {
 void desenhar(); 
 void ajustarTamanho(int novoTamanho);
 void ajustarCor(color cor);
}

class Quadrado implements Forma {
  float x, y, tamanho;
  color preenchimento;

  Quadrado(float x, float y, float tamanho, color preenchimento) {
    this.x = x;
    this.y = y;
    this.tamanho = tamanho;
    this.preenchimento = preenchimento;
  }
  
  void ajustarTamanho(int novoTamanho) {
    this.tamanho += novoTamanho;
  }
  
  void ajustarCor(color cor) {
    this.preenchimento = cor;
  }

  void desenhar() {
    pushStyle();
    stroke(preenchimento);
    for (float i = 0; i < tamanho; i++) {
      line(x - tamanho / 2, y - tamanho / 2 + i, x + tamanho / 2, y - tamanho / 2 + i);
      line(x - tamanho / 2 + i, y - tamanho / 2, x - tamanho / 2 + i, y + tamanho / 2);
    }
    
    popStyle();
  }
}

class Circulo implements Forma {
  float x, y, tamanho;
  color preenchimento;

  Circulo(float x, float y, float tamanho, color preenchimento) {
    this.x = x;
    this.y = y;
    this.tamanho = tamanho;
    this.preenchimento = preenchimento;
  }
  
   void ajustarTamanho(int novoTamanho) {
    this.tamanho += novoTamanho;
   }
   
  void ajustarCor(color cor) {
    this.preenchimento = cor;
  }

  void desenhar() {
    pushStyle();
    stroke(preenchimento);
    for (float yPos = y - tamanho / 2; yPos <= y + tamanho / 2; yPos++) {
      float dx = sqrt(sq(tamanho / 2) - sq(yPos - y));
      line(x - dx, yPos, x + dx, yPos);
    }
    popStyle();
  }
}


class Triangulo implements Forma {
  float x, y, tamanho;
  color preenchimento;

  Triangulo(float x, float y, float tamanho, color preenchimento) {
    this.x = x;
    this.y = y;
    this.tamanho = tamanho;
    this.preenchimento = preenchimento;
  }
  
   void ajustarTamanho(int novoTamanho) {
    this.tamanho += novoTamanho;
  }
  
  void ajustarCor(color cor) {
    this.preenchimento = cor;
  }

  void desenhar() {
    pushStyle();
    stroke(preenchimento);
    for (float i = 0; i <= tamanho; i++) {
      line(x, y - tamanho / 2, x - tamanho / 2 + i, y + tamanho / 2);
      line(x, y - tamanho / 2, x + tamanho / 2 - i, y + tamanho / 2);
    }
    popStyle();
  }
}
