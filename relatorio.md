# 1. As duas fases

## Fase 1 — Caverna

- **Tema:** Caverna.
- **O que o jogador faz:** O jogador entra na caverna, precisa subir e descer pela estrutura interna e sair pelo portal.
- **Decisão de desenho:** Escolhi uma caverna por ter estruturas instáveis, que são fáceis de desenhar.

## Fase 2 — Espiral

- **Tema:** Uma espiral.
- **O que o jogador faz:** O jogador precisa completar a espiral.
- **Decisão de desenho:** Me inspirei nas espirais do jogo *Sonic*.

# 2. O Parallax

Os valores de `motion_scale` usados em cada camada foram:

- **Montanhas:** `x = 0.1`
- **Nuvens (AnimatedSprite):** `y = 0.5`
- **Árvores distantes:** `x = 0.2`
- **Árvores mais próximas:** `x = 0.3`
- **Árvores ainda mais próximas:** `x = 0.4`
- **Subsolo:** `x = 0.9`

Fui testando diferentes valores para ver quais davam uma maior sensação de profundidade.

# 3. A área secreta

A área secreta está localizada na **primeira fase**, no meio da caverna.

- **Entrada:** Fica à direita da primeira plataforma.
- **Pista:** É um item visível dentro do local secreto.
- **Motivo da separação:** A entrada e a pista foram colocadas em locais diferentes para incentivar o jogador a explorar a fase.

# 4. A câmera

Escolhi fazer a **câmera como uma cena separada**.

Com a outra opção, eu poderia ter mais retrabalho no futuro, principalmente quando fosse adicionar uma cena de morte.

# 5. A transição

A troca de fase não pode ser chamada diretamente na detecção da colisão porque a troca precisa acontecer **após os cálculos de física, no próximo frame**. Caso contrário, podem ocorrer erros durante o processamento da física.

# 6. O que travou

Em um momento, a câmera não estava seguindo o jogador.

- **O que eu achei que era:** Achei que havia algum problema no script.
- **O que era de verdade:** O problema era que eu não tinha incluído a cena da câmera.
- **Como descobri:** Descobri comparando com outras cenas e verificando como elas estavam configuradas.