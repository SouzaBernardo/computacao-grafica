int formaSelecionada = -1;
color cor = color(0);
float tamanho = 50;
ArrayList<Forma> formas = new ArrayList<>();
boolean trocarCor = false;
int red = 255, green = 255, blue = 255;

void setup() {
  size(800, 600);
  background(255);
  formas.add(new Quadrado(width / 2, height / 2, tamanho, cor));
  formas.add(new Circulo(width / 2, height / 2, tamanho, cor));
  formas.add(new Triangulo(width / 2, height / 2, tamanho, cor));
}

void draw() {
  background(255);
  if (trocarCor) {
    text("Ajuste a cor - R: " + red + " G: " + green + " B: " + blue, 10, 180);
  }
  drawUI();
  if (formaSelecionada >= 0 && formaSelecionada <= 2) formas.get(formaSelecionada).desenhar();
}

void drawUI() {
  fill(0);
  textSize(16);
  text("1 - Quadrado", 10, 20);
  text("2 - Círculo", 10, 40);
  text("3 - Triângulo", 10, 60);
  text("Q - Aumentar Tamanho", 10, 80);
  text("W - Diminuir Tamanho", 10, 100);
  text("E - Alterar Cor (R/G/B)", 10, 120);
}

void atualizaTamanho(int novoTamanho) {
  if (formaSelecionada >= 0) {
    formas.get(formaSelecionada).ajustarTamanho(novoTamanho);
  }
}

void ajustarCor(char key) {
  if (key == 'R' || key == 'r') red = (red + 10) % 256;
  else if (key == 'G' || key == 'g') green = (green + 10) % 256;
  else if (key == 'B' || key == 'b') blue = (blue + 10) % 256;
  else if (key == 'C' || key == 'c') {
    if (formaSelecionada < formas.size() && formaSelecionada >= 0) {
      cor = color(red, green, blue);
      formas.get(formaSelecionada).ajustarCor(cor);
    }
    trocarCor= false;
  }
}

void selecionarOpcoes(char key) {
  if (key == '1') formaSelecionada = 0;
  else if (key == '2') formaSelecionada = 1;
  else if (key == '3') formaSelecionada = 2;
  else if (key == 'Q' || key == 'q') atualizaTamanho(5);
  else if ((key == 'W' || key == 'w') && tamanho > 5) atualizaTamanho(-5);
  else if (key == 'E' || key == 'e') trocarCor = true;
}

void keyPressed() {
  if (trocarCor) ajustarCor(key);
  else selecionarOpcoes(key);
}
