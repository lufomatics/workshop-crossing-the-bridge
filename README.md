# “Crossing The Bridge: AI-Driven Continuous Development”

![](../../actions/workflows/0-crossing-prologue.yaml/badge.svg)
![](../../actions/workflows/1-codespace-awakening.yaml/badge.svg)
![](../../actions/workflows/2-summon-first-oracle.yaml/badge.svg)
![](../../actions/workflows/3-call-second-oracle.yaml/badge.svg)
![](../../actions/workflows/4-bridge-synthesis.yaml/badge.svg)
![](../../actions/workflows/5-bridge-farewell.yaml/badge.svg)

> Este repositório conduz você pelo workshop **Crossing The Bridge**, onde exploramos fluxos de trabalho de desenvolvimento contínuo impulsionados por IA.
> A cada etapa, um conjunto de _workflows_ guia sua jornada — desde a preparação do Codespace até a comparação de respostas entre diferentes modelos e a conclusão da história.

> [!NOTE]
> Estado atual: <!--WORKSHOP_STATUS-->🌉 Preparando os sensores da ponte para a travessia inicial. Confira a issue do workshop para iniciar!<!--END_WORKSHOP_STATUS-->

---

## Sobre o Workshop

Durante a sessão interativa você irá:

1. Ativar um Codespace especialmente configurado para enviar sinais automatizados.
2. Conversar com dois "oráculos" de IA diretamente pela issue do workshop.
3. Solicitar um resumo encenado por uma personalidade famosa escolhida por você.
4. Encerrar o ciclo atualizando o repositório com o status de conclusão.

Todo o fluxo é baseado no repositório de templates [lufomatics/reusable-workshops](https://github.com/lufomatics/reusable-workshops), mas com uma narrativa inédita focada em práticas de desenvolvimento contínuo conduzidas por IA.

---

## Como iniciar

1. Clique no botão **`📠Prepare Workshop`** abaixo para iniciar seu repositório a partir deste template.

   <a id="prepare-workshop" href="https://github.com/new?template_owner=lufomatics&template_name=workshop-crossing-the-bridge&owner=%40me&name=workshop-crossing-the-bridge&description=Workshop:+Crossing+The+Bridge&visibility=public">
      <img src="https://img.shields.io/badge/📠_Prepare_Workshop-008000" height="25pt"/>
   </a>

2. Na nova aba, revise as opções preenchidas automaticamente:

   - Em **Owner**, garanta que sua conta pessoal esteja selecionada;
   - Prefira criar o repositório como público para aproveitar minutos gratuitos de GitHub Actions;
   - Clique em `Create repository`.

3. Aguarde cerca de 25 segundos até que os fluxos estejam configurados. É normal precisar atualizar a página.

   - O botão `📠Prepare Workshop` ficará cinza indicando que a cópia foi concluída.
   - O botão **`🚀Start Workshop`** será habilitado e irá te direcionar para as próximas instruções.

4. Clique no botão **`🚀Start Workshop`** abaixo, que irá te redirecionar para uma GitHub Issue que servirá como seu guia personalizado durante o workshop, acompanhando seu progresso e fornecendo instruções a cada passo concluído.

   <a id="start-workshop">
      <img src="https://img.shields.io/badge/🚀_Start_Workshop-AAA" height="25pt"/>
   </a>

> [!TIP]
> Este botão permanecerá ativo no decorrer do workshop. A qualquer momento, caso perca a página da Issue de acompanhamento, basta clicar em **`🚀Start Workshop`** e você será redirecionado para as próximas instruções.

---

## Estrutura do repositório

- `.github/workflows/`: contém os fluxos automatizados que habilitam cada etapa.
- `.github/steps/`: armazena as instruções publicadas na issue do workshop.
- `.devcontainer/`: prepara o Codespace com `gh` CLI, Copilot e extensões úteis. O script pós-criação envia o sinal que inicia a etapa de IA.

A cada conclusão, o fluxo final atualiza este README com o status mais recente e compartilha links para você explorar mais conteúdos da série.

Bom workshop! 🐬
