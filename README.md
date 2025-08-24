# 🚀 TKAFSJanelaMensagem

Componente Delphi/FireMonkey para exibição de janelas de mensagem modais personalizáveis com suporte multiplataforma.

## 📋 Descrição

Componente especializado em exibir janelas de mensagem modais em aplicações Delphi/FireMonkey, com layout adaptativo para diferentes plataformas e recursos visuais personalizáveis. Herda de `TKAFSJanelaModal` e adiciona funcionalidades específicas para exibição de mensagens.

## ✨ Características

- ✅ Layout responsivo adaptado para Windows e Android
- ✅ Título e descrição personalizáveis
- ✅ Botões de ação configuráveis (voltar e confirmar)
- ✅ Suporte multiplataforma (Windows, Android)
- ✅ Cores totalmente personalizáveis
- ✅ Eventos de confirmação personalizados
- ✅ Integração com componente TKAFSJanelaModal

## 🛠️ Configuração

### Parâmetros Padrão

```
Windows: Layout centralizado com proporção 16:9
Android: Layout que ocupa toda a tela
Fonte da descrição: Segoe UI Emoji 24px
Alinhamento da descrição: Centralizado
```

## 📦 Como Usar

### Instanciação Básica

```pascal
var
  JanelaMensagem: TKAFSJanelaMensagem;
begin
  JanelaMensagem := TKAFSJanelaMensagem.Create(Self);
  try
    JanelaMensagem.KAFSJanelaMensagemConfig(
      TAlphaColors.White, 
      TAlphaColors.Blue,
      'Título da Mensagem',
      'Descrição detalhada da mensagem aqui',
      'Confirmar',
      procedure(Sender: TObject)
      begin
        // Sua lógica de confirmação aqui
        ShowMessage('Mensagem confirmada!');
      end
    );
  finally
    // A janela se auto-destrói ao ser fechada
  end;
end;
```

### Métodos Principais

| Método | Descrição |
|--------|-----------|
| `Create` | Construtor com criação dos componentes visuais |
| `KAFSJanelaMensagemConfig` | Configura a aparência e conteúdo da janela de mensagem |
| `Confirmando` | Procedimento interno para tratamento do clique no botão confirmar |
| `Sair` | Procedimento interno para tratamento do clique no botão voltar |

### Parâmetros do Método KAFSJanelaMensagemConfig

```pascal
procedure KAFSJanelaMensagemConfig(
  const _cortema1: TAlphaColor;    // Cor dos elementos e texto
  const _cortema2: TAlphaColor;    // Cor de fundo
  const _titulo: String;           // Título da janela
  const _descricao: String;        // Descrição/mensagem principal
  const _botaoconfirmar: String;   // Texto do botão confirmar
  _confirmar: TNotifyEvent         // Evento a ser executado na confirmação
);
```

## 🔧 Dependências

- `System.Classes`
- `System.UITypes`
- `System.SysUtils`
- `FMX.StdCtrls`
- `FMX.Types`
- `UntKAFSJanelaModal` (componente base)

## 🎨 Personalização

### Cores
- Fundo do modal (`_cortema2`)
- Elementos visuais e texto (`_cortema1`)

### Textos
- Título principal
- Descrição/mensagem principal (font size 24, centralizado)
- Botão de voltar (fixo como "❮")
- Botão de confirmar (personalizável)

### Layout
- Windows: Modal centralizado com proporção 16:9 e margens
- Android: Modal em tela cheia
- Descrição centralizada ocupando área principal
- Herda todos os elementos visuais do componente base TKAFSJanelaModal

## ⚠️ Comportamento Multiplataforma

- **Windows**: Exibe como janela modal centralizada com margens
- **Android**: Exibe como tela cheia (ocupando todo o espaço disponível)

## 🎯 Funcionalidades Específicas

- Exibe mensagens descritivas com formatação centralizada
- Botão de voltar pré-configurado com símbolo de seta
- Botão de confirmação com evento personalizável
- Auto-destruição ao ser fechada (métodos `Confirmando` e `Sair`)
- Interface visualmente consistente entre plataformas
- Layout adaptativo para diferentes tamanhos de tela

## ⚡ Observações Importantes

- O componente se auto-destrói automaticamente ao ser fechada (métodos `Free`)
- O evento `Confirmar` é executado antes da destruição do componente
- Utiliza `TThread.Synchronize` para garantir a visibilidade na thread principal

---

**Nota:** Este componente é ideal para exibição de mensagens informativas, diálogos de confirmação ou alertas que requerem atenção focada do usuário e possibilidade de ação personalizada.
