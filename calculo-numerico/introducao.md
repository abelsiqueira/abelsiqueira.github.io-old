@def title = "Linguagem de Programação Matemática"
@def showall = true

# Cálculo Numérico

A disciplina de cálculo numérico serve para conectar dois campos: a
matemática e a computação. Essencialmente, a disciplina introduz ao aluno
como resolver alguns problemas matemáticos de maneira numérica, isto é, sem
buscar uma solução analítica, seja porque uma não existe, ou porque não é
facilmente obtida. Também é importante notar que existe a teoria e prática
de computação, assim como da matemática. Não basta apenas entender como
resolver problemas com o computador, mas também quais são as limitações
impostas pelo computador.

É necessário que o aluno compreenda bem os conceitos matemáticos envolvidos,
assim como a programação utilizada. Para conseguir acompanhar a disciplina,
o aluno deve ter conhecimentos de cálculo I, e um pouco de álgebra linear
matricial. Conhecimentos de cálculo II e álgebra linear mais avançados
ajudam, mas não são estritamente necessários.

# Ementa (CMM014/CMI032)

- Linguagem de Programação Matemática
- Aproximações de Números e Funções por Sequências e Séries
- Aritmética de Ponto Flutuante
- Zeros de Funções
- Integração Numérica
- Eliminação Gaussiana e Sistemas Triangulares
- Quadrados Mínimos Lineares e Ajustes de Curvas.

Referências
=============

Cálculo Numérico é uma disciplina razoavelmente antiga, e contém várias
referências bibliográficas. O assunto pode aparecer com nomes diversos:

- Introdução à Análise Numérica;
- (Introdução à) Métodos Numéricos;
- Métodos Computacionais (ou Numéricos) da Matemática (ou Engenharia).

O assunto difere de análise numérica pois não teremos tanta profundidade nas
teorias matemáticas envolvidas. Assim como as disciplinas de cálculo I e
análise I.

Algumas referências:

- **M. A. G. Ruggiero e V. L. da R. Lopes**, Cálculo Numérico - Aspectos Teórios e Computacionais, 2a ed. Pearson, 1997.
- **R. L. Burden e J. D. Faires**, Numerical Analysis, 9a ed. Cengage Learning, 2010.
- **P. J. S. Silva**, Notas de Aula de Cálculo Numérico da UNICAMP. http://www.ime.unicamp.br/~pjssilva/blog/notas_ms211/

E mais:

- **S. G. Johnson**, Notas de aula de Introduction to Numerical Methods do MIT. http://math.mit.edu/~stevenj/18.335/
- **G. H. Golub e C. F. Van Loan**, Matrix Computations, 3a ed. Baltimore, MD, USA: Johns Hopkins University Press, 1996.
- **L. N. Trefethen e D. Bau, III**, Numerical Linear Algebra. Society for Industrial and Applied Mathematics, 1997.
- **W. H. Press et al.**, Numerical Recipes: The Art of Scientific Computing, 3a ed. Cambridge University Press, 2007.

# Notas sobre Programação

A programação para fins matemáticos é bastante antiga, e já acompanha as
linguagens de programação mais antigas. Dentre elas, se destacam duas:
Fortran e C. Muitas das coisas escritas hoje em vários campos avançados de
matemática, física e engenharia utilizam essas ferramentas - por motivos que
discutiremos em sala. Por outro lado, essas linguagens são razoavelmente
mais complicadas de se utilizar, e hoje em dia temos várias linguagens de
programação que são voltadas, ou facilitam, o desenvolvimento de softwares
matemáticos. Uma característica importante destas linguagens é que elas são
de alto nível, isto é, são mais fáceis de se utilizar e ler.

São várias as linguagens de programação matemáticas, mas vamos focar em 3
aqui:

- MatLab/Octave: O MatLab é de longe a mais popular. Foi criada há mais
     de 20 anos justamente com o objetivo acima de facilitar o
     desenvolvimento de softwares matemáticos. O MatLab não é apenas uma
     linguagem, mas um software completo com interface de desenvolvimento,
     gráficos, histórico, etc. O MatLab é um software proprietário, então
     como alternativa, existe o Octave, que é software livre, e entende a
     maior parte dos comandos que o MatLab usa (desta disciplina, todos).
     Atualmente, o Octave conta com interface similar à do MatLab, e se
     assemelha visualmente bastante ao primeiro;

- Python + Numpy/Scipy: O Python é uma linguagem de alto nível
     multipropósito: isto é, não foi feita para matemática. Por isso, é
     possível encontrá-la em muitas áreas. Em particular, os pacotes Numpy
     e Scipy proporcionam as ferramentas necessárias para deixar o Python
     atraente para utilização na matemática. É uma forte alternativa ao
     MatLab, por ser software livre e contar com vários pacotes
     específicos. Em especial, tem sido bastante utilizado em Machine
     Learing e Data Science;

- Julia: O Julia é uma linguagem nova que veio com um propósito bastante
     específico: ser mais rápido que o MatLab e o Python, tão fácil de usar
     quanto elas, mas com melhor interação com Fortran e C. Apesar de ser
     nova, já cumpre bastante do pretendido.

Algumas das coisas no uso do Julia me fizeram escolher esta linguagem no
lugar das outras. Você pode aproveitar para conhecer outras linguagens, mas
o Julia será a linguagem utilizada nesta disciplina.

Uma nota inicial: que ferramenta é esta???
============================================

Nesta disciplina, utilizaremos esta ferramenta chamada "Jupyter Notebook",
que é uma espécie de nota de aula interativa, onde pode-se escrever texto e
código, e o código pode ser modificado e executado. Isso permite que o aluno
teste na hora o código.

O Jupyter Notebook não é específico de nenhuma linguagem em especial. Ele
vem instalado para funcionar com o Python (porque foi feito em Python), mas
funciona em dezenas de outras linguagens. Em particular, utilizaremos ele
com o Julia, e para conseguir rodar o notebook das notas de aula, será
necessário instalar o Jupyter Notebook e o pacote do Julia específico para
que ele funcione.

Perguntas e Respostas
=======================

P: Eu aprendi a programar em X e levou um semestre, como vou aprender tudo
de novo agora?

R: Você aprendeu a lógica de programação, e ela é a mesma aqui. Se você sabe
o que é um loop, um if, um while, uma atribuição, etc., você só precisa
aprender a sintaxe - como escrever isso na linguagem de programação nova.

P: Eu não quero programar, consigo fazer a disciplina?

R: Não comigo.

P: Eu esqueci como programar, consigo fazer a disciplina?

R: Sim, mas você vai ter que correr para relembrar na primeira semana.